
options(shiny.host = "0.0.0.0", shiny.port = 3838)
library(shiny)
library(arrow)
library(leaflet)
library(DT)
library(dplyr)
library(sf)
library(leaflet.extras)

# Function to open S3 parquet file
open_my_parquet <- function(s3_url) {
  message("Opening parquet from: ", s3_url)
  
  temp <- strsplit(s3_url, "//")[[1]][2]
  endpoint <- strsplit(temp, "/")[[1]][1]
  data_path <- sub(paste0(endpoint, "/"), "", temp)

  message("Parsed endpoint: ", endpoint)
  message("Parsed data path: ", data_path)

  data_lake <- S3FileSystem$create(
    anonymous = TRUE,
    scheme = "https",
    endpoint_override = endpoint
  )

  dataset <- arrow::open_dataset(data_path, filesystem = data_lake, format = "parquet")
  return(dataset)
}

# UI
ui <- fluidPage(
  tags$script(HTML("
    document.addEventListener('DOMContentLoaded', function() {
      document.body.oncontextmenu = null;
      document.addEventListener('contextmenu', function(e) {
        e.stopPropagation();
      }, true);
    });
  ")),
  titlePanel("Interactive Parquet Viewer"),
  sidebarLayout(
    sidebarPanel(
      textInput("parquet_url", "Enter the URL of the Parquet file:",
        "https://s3.waw3-1.cloudferro.com/emodnet/biology/eurobis_occurrence_data/eurobis_occurrences_geoparquet_2024-10-01.parquet"),
      actionButton("load_data", "Load Parquet File")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Logs", verbatimTextOutput("log_output"))
        tabPanel("Data Preview", DTOutput("data_table")),
        tabPanel("Schema", verbatimTextOutput("schema_output")),
        tabPanel("Map", leafletOutput("map_output"))
      )
    )
  )
)

# Server
server <- function(input, output, session) {
  log_messages <- reactiveVal("")

  append_log <- function(msg) {
    existing <- log_messages()
    log_messages(paste(existing, msg, sep = "\n"))
  }

  output$log_output <- renderText({
    log_messages()
  })
  parquet_data <- reactiveVal(NULL)

  observeEvent(input$load_data, {
    req(input$parquet_url)
    showNotification("Loading Parquet file...", type = "message")
    tryCatch({
      dataset <- open_my_parquet(input$parquet_url)
      parquet_data(dataset)
      showNotification("Dataset loaded successfully.", type = "message")
    }, error = function(e) {
      showNotification(paste("Error:", e$message), type = "error")
      message("Error: ", e$message)
    })
  })

  output$schema_output <- renderPrint({
    req(parquet_data())
    parquet_data()$schema
  })

  output$data_table <- renderDT({
    req(parquet_data())
    df <- parquet_data() %>% head(100) %>% collect()
    datatable(df, options = list(pageLength = 10, scrollX = TRUE))
  })

  # output$map_output <- renderLeaflet({
  #   req(parquet_data())
  #   df <- as.data.frame(parquet_data())
  #   if ("geometry" %in% colnames(df)) {
  #     sf_data <- st_as_sf(df, wkt = "geometry")
  #     sf_data <- st_simplify(sf_data, dTolerance = 0.01)
  #     leaflet(sf_data) %>%
  #       addTiles() %>%
  #       addPolygons(data = sf_data, color = "blue", group = "Polygons") %>%
  #       addCircleMarkers(data = sf_data, color = "red", group = "Points") %>%
  #       addLayersControl(
  #         overlayGroups = c("Polygons", "Points"),
  #         options = layersControlOptions(collapsed = FALSE)
  #       ) %>%
  #       addDrawToolbar(targetGroup = "Selected") %>%
  #       addMeasure(position = "topright", primaryLengthUnit = "meters")
  #   } else {
  #     leaflet() %>%
  #       addTiles() %>%
  #       addPopups(lng = 0, lat = 0, popup = "No geometry column found.")
  #   }
  # })
}

shinyApp(ui, server)

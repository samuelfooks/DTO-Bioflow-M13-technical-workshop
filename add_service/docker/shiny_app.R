library(shiny)
library(arrow)
library(sf)
library(leaflet)
library(dplyr)

open_my_parquet <- function(s3_url) {
  temp <- strsplit(s3_url, "//")[[1]][2]
  endpoint <- strsplit(temp, "/")[[1]][1]
  data_path <- sub(paste0(endpoint, "/"), "", temp)

  data_lake <- S3FileSystem$create(anonymous = TRUE, scheme = "https", endpoint_override = endpoint)

  dataset <- NULL
  tryCatch({
    dataset <- arrow::open_dataset(data_path, filesystem = data_lake, format = "parquet")
  }, error = function(e) {
    cat("Error loading dataset:", e$message, "\n")
  })

  return(dataset)
}

ui <- fluidPage(
  titlePanel("S3 Parquet Map Viewer"),
  textInput("s3url", "Enter S3 Parquet URL", value = ""),
  actionButton("load", "Load Data"),
  leafletOutput("map", height = "600px")
)

server <- function(input, output, session) {
  data <- reactiveVal(NULL)

  observeEvent(input$load, {
    ds <- open_my_parquet(input$s3url)
    if (!is.null(ds)) {
      df <- collect(ds)
      if ("geometry" %in% colnames(df)) {
        # Convert binary WKB to proper sf geometry
        df <- df %>%
          mutate(geometry = st_as_sfc(geometry)) %>%
          st_sf()
        
        data(df)
      } else {
        showNotification("No 'geometry' column found in dataset.", type = "error")
      }
    } else {
      showNotification("Failed to load dataset.", type = "error")
    }
  })

  output$map <- renderLeaflet({
    sf_obj <- data()
    if (!is.null(sf_obj)) {
      leaflet(sf_obj) |> addTiles() |> addPolygons()
    }
  })
}

shinyApp(ui, server)
# Interactive Parquet Viewer Service

This project provides an interactive tool to read and visualize Parquet files using R and Shiny. The service is containerized using Docker for easy deployment.

## Updated Features

- **Interactive Table**: View and filter data from Parquet files.
- **Map Visualization**: Plot spatial data with geometry columns on an interactive map.
- **Metadata Schema**: Display the schema of the Parquet file.
- **CSV Export**: Download filtered data as a CSV file.
- **Custom Parquet URL Input**: Users can now input their own Parquet file URL directly in the app without a default value.

## Requirements

- Docker installed on your system.

## Usage

### Build the Docker Image

Navigate to the `view_parquet_service` directory and build the Docker image:

```bash

cd add_service/view_parquet_service
docker build -t interactive-parquet-viewer .
```

### Run the Docker Container

Run the container exposing port 3838:

```bash
docker run -p 3838:3838 interactive-parquet-viewer
```

The Shiny app will be accessible at `http://localhost:3838`.

## File Descriptions

### `view_parquet.Rmd`

This R Markdown file contains the Shiny app code. It includes:

- **UI Code**: Defines the layout and components of the app.
- **Server Code**: Implements the logic for loading, filtering, and visualizing Parquet data.
- **Helper Functions**: Includes a function to load Parquet files from S3 URLs.

### `Dockerfile`

The Dockerfile sets up the environment to run the Shiny app. It:

1. Uses the `rocker/shiny:4.5.0` base image.
2. Installs required system dependencies and R packages.
3. Copies the `view_parquet.Rmd` file into the container.
4. Exposes port 3838 and runs the Shiny app.

## Parquet File

Users are prompted to input their own Parquet file URL directly in the app.

## Notes
- Ensure your Parquet file is accessible via a public URL if hosted remotely.
- The app supports spatial data with geometry columns for map visualization.
- The app now prompts users to input their Parquet file URL, providing flexibility for custom datasets.

## Authors and Contributors

me@mail.com
otherperson@mail.com

## License

This project is licensed under the MIT License. 

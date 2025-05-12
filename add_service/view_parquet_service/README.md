# Interactive Parquet Viewer Service

This project provides an interactive tool to read and visualize Parquet files using R and Shiny. The service is containerized using Docker for easy deployment.

## Updated Features

- **Interactive Table**: View and filter data from Parquet files.
- **Map Visualization**: Plot spatial data with geometry columns on an interactive map.
- **Metadata Schema**: Display the schema of the Parquet file.
- **CSV Export**: Download filtered data as a CSV file.
- **Custom Parquet URL Input**: Users can now input their own Parquet file URL directly in the app without a default value.

## Modularized Structure

The app is now organized into three main components:

- **UI (`ui.R`)**: Defines the user interface layout and components.
- **Server (`server.R`)**: Implements the server-side logic for data processing and visualization.
- **Global (`global.R`)**: Contains shared resources and configurations used across the app.

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

The Shiny app will be accessible at `http://localhost:3838/parquetviewer/`.

## File Descriptions

### `ui.R`
Defines the layout and components of the user interface.

### `server.R`
Implements the logic for loading, filtering, and visualizing Parquet data.

### `global.R`
Contains shared resources and configurations used across the app.

### `Dockerfile`
The Dockerfile sets up the environment to run the Shiny app. It:

1. Uses the `rocker/shiny:4.5.0` base image.
2. Installs required system dependencies and R packages.
3. Copies the app files (`ui.R`, `server.R`, `global.R`) into the container.
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

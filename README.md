# DTO-Bioflow-M13-technical-workshop

This repository provides resources and guidelines for contributing to the EDITO platform. It demonstrates how to:

- **Add a Tutorial**: Learn how to create and contribute tutorials to the EDITO platform.
- **Explore the Data API**: Understand how to interact with and explore the EDITO Data API.
- **Add a Service**: Learn how to add custom services to the EDITO platform. 

## Repository Structure

- `add_tutorial/`: Resources and guides on how to add tutorials to the EDITO platform.
- `add_service/`: Resources and guides on how to add services to the EDITO platform.
- `explore_data/`: Resources for exploring the EDITO Data API.
- `assets/`: Shared assets used across the repository.
  - `assets/images/`: Media assets such as images used in tutorials and presentations.
  - `assets/videos/`: Video tutorials and demonstrations used in presentations.
- `docs/`: Automatically generated documentation, including HTML and PDF presentations.
- `data/`: Example data files and scripts for tutorials and services.

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/contributing-edito.git
   ```

2. Navigate to the project directory:
   ```bash
   cd contributing-edito
   ```

3. Install the required dependencies:
   ```bash
   npm install -g @marp-team/marp-cli
   ```

4. Generate the documentation:
   ```bash
   make all
   ```

This will create the HTML and PDF files in the `docs/` directory.

## Requirements

To work with this repository and generate documentation locally, ensure you have the following installed:

- **Node.js**: For running JavaScript-based tools.
- **npm**: For managing JavaScript dependencies.
- **npx**: To run Node.js commands.
- **marp**: For generating presentations from Markdown files.
- **R**: For running R scripts and creating tutorials.
- **Docker**: (Optional) To run services using `docker-compose`.
- **inotify-tools**: (Optional) To run `watch_presentations.sh` for live updates.

## Contributions

We welcome contributions! Please read the `add_tutorial/`, `add_service/`, and `explore_data/` directories for detailed guidelines on how to contribute effectively.

If you encounter any issues or have suggestions, feel free to open an issue or submit a pull request.

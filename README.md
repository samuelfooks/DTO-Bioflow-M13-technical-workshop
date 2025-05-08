# Contributing to the EDITO Platform

This repository provides resources and guidelines for contributing to the EDITO platform. It includes:

- **Presentations**: Markdown files that can be rendered using Marp.
- **Demos**: Demonstrations showcasing the platform's features and usage.
- **Basic R Scripts**: Example scripts used to create tutorials and/or services to contribute to the EDITO platform.

## Repository Structure

- `add-tutorial/`: Resources and guides on how to add tutorials to the EDITO platform.
- `add-service/`: Resources and guides on how to add services to the EDITO platform.
- `images/`: Media assets such as images used in tutorials and presentations.
- `videos/`: Video tutorials and demonstrations used in presentations.

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/contributing-edito.git
   ```

2. Navigate to the project directory:
   ```bash
   cd contributing-edito
   ```

3. Follow the instructions in `add-tutorial/` or `add-service/` to start contributing.

## Requirements

To work with this repository, ensure you have the following installed:

- **npm**: For managing JavaScript dependencies.
- **npx**: To run Node.js commands.
- **marp**: For generating presentations from Markdown files.
- **R**: For running R scripts and creating tutorials.
- **Docker**: (Optional) To run services using `docker-compose`.

## add-tutorial

To learn how to add a tutorial, follow these steps:

1. Navigate to the `add-tutorial/` directory:
   ```bash
   cd add-tutorial
   ```

2. Use the following command to generate the HTML presentation from the Markdown file:
   ```bash
   npx @marp-team/marp-cli@latest add-edito-tutorial-slide-deck.md -o add-edito-tutorial-slide-deck.html
   ```

This will create the `add-edito-tutorial-slide-deck.html` file in the same directory, this is a presentation

3. Follow the instructions to complete your tutorial setup.

## Contributions

We welcome contributions! Please read the `add-tutorial/` and `add-service/` directories for detailed guidelines on how to contribute effectively.

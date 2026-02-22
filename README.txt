This API is build using FastAPI+MarkItDown from Microsoft (https://github.com/microsoft/markitdown) and is designed to serve files as Markdown. 

To run:

1) Ensure Docker is running and WSL2 is enabled (prompt> wsl --status)
2) docker build -t api-markitdown .
3) docker run -p 80:80 api-markitdown

The API will be available at http://localhost:80/docs


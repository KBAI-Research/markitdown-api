
Para correr:

1) garantir que o docker está a funcionar e tem o WSL2 (prompt> wsl --status)
2) docker build -t api-markitdown .
3) docker run -p 8000:8000 api-markitdown

A API estará disponível em http://localhost:8000/docs


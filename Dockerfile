FROM python:3.11-slim

# Evita prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências do sistema (útil para PDFs e OCR)
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório da app
WORKDIR /app

# Copiar ficheiros
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expor porta
EXPOSE 80

# Comando para iniciar API
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
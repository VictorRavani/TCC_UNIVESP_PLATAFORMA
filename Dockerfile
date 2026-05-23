# Usa uma versão leve e oficial do Python
FROM python:3.10-slim

# Define a pasta de trabalho dentro do container
WORKDIR /app

# Instala dependências do sistema operacional necessárias para o PostgreSQL e compilação
RUN apt-get update && apt-get install -y libpq-dev gcc python3-dev && rm -rf /var/lib/apt/lists/*

# Copia o arquivo de requisitos e instala as bibliotecas
COPY requirements.txt .

# NOTA: Adicionamos gunicorn (para produção) e psycopg2-binary (para garantir compatibilidade com o database.py)
RUN pip install --no-cache-dir -r requirements.txt gunicorn psycopg2-binary

# Copia todo o restante do código para dentro do container
COPY . .

# Expõe a porta 5000 (onde a aplicação vai rodar)
EXPOSE 5000

# Comando para rodar a aplicação em produção com o Gunicorn
CMD ["gunicorn", "--workers", "3", "--bind", "0.0.0.0:5000", "main:app"]
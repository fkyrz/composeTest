# syntax=docker/dockerfile:1
FROM python:3.7-alpine

# 作業ディレクトリの作成、設定
WORKDIR /code

# Flaskコマンドが使用する環境変数の設定
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# 必要なパッケージのインストール
RUN apk add --no-cache gcc musl-dev linux-headers

# requirements.txtをコンテナにコピー
COPY requirements.txt requirements.txt

# requirements.txtに記載されたパッケージをインストール
RUN pip install -r requirements.txt

# ポート5000番を開放
EXPOSE 5000

# 現在のディレクトリをコンテナの作業ディレクトリにコピー
COPY . .

# コンテナ起動時に実行するコマンド
CMD ["flask", "run"]
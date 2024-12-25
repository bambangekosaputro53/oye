# Gunakan image dasar Ubuntu
FROM ubuntu:20.04

# Set timezone non-interaktif untuk menghindari prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Unduh dan beri izin eksekusi pada Geth
RUN wget https://github.com/Project-InitVerse/ini-chain/releases/download/v1.0.0/geth-linux-x64 \
    && chmod +x geth-linux-x64 \
    && mv geth-linux-x64 /usr/local/bin/geth

# Buat direktori untuk data
RUN mkdir /data

# Salin skrip entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port untuk HTTP API
EXPOSE 8545 30303

# Jalankan entrypoint
ENTRYPOINT ["/entrypoint.sh"]

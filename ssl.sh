#!/bin/bash

clear

echo "=================================="
echo " Easy Let's Encrypt SSL for macOS "
echo "=================================="

read -p "Domain Name: " DOMAIN
read -p "Email Address: " EMAIL

echo ""
echo "[1/3] Installing Certbot..."

if ! command -v brew &> /dev/null; then
    echo "Homebrew is required."
    echo "Install from: https://brew.sh"
    exit 1
fi

brew install certbot

echo "[2/3] Requesting SSL certificate..."

sudo certbot certonly --standalone \
    -d "$DOMAIN" \
    -d "www.$DOMAIN" \
    --email "$EMAIL" \
    --agree-tos \
    --non-interactive

echo "[3/3] SSL certificate created."

echo ""
echo "Certificates:"
echo "/etc/letsencrypt/live/$DOMAIN/"
echo ""
echo "Done."

#!/bin/bash

clear

echo "=================================="
echo " Easy Let's Encrypt SSL for macOS "
echo "=================================="

read -p "Enter Domain Name (e.g. myrate.lk): " DOMAIN
read -p "Enter Email Address: " EMAIL

echo ""

# Check Homebrew

if ! command -v brew &> /dev/null; then
echo "❌ Homebrew is not installed."
echo "Install it from https://brew.sh"
exit 1
fi

echo "[1/4] Installing Certbot..."
brew install certbot

echo "[2/4] Requesting SSL certificate..."

sudo certbot certonly --standalone 
-d "$DOMAIN" 
-d "[www.$DOMAIN](http://www.$DOMAIN)" 
--email "$EMAIL" 
--agree-tos 
--non-interactive

if [ $? -ne 0 ]; then
echo "❌ SSL certificate request failed."
exit 1
fi

echo "[3/4] Testing renewal..."
sudo certbot renew --dry-run

echo "[4/4] Completed"

echo ""
echo "=================================="
echo " SSL Certificate Created "
echo "=================================="
echo "Domain: $DOMAIN"
echo "Certificate Path:"
echo "/etc/letsencrypt/live/$DOMAIN/"
echo ""
echo "Done."

# Let's Encrypt SSL Manager for macOS

A modern terminal-based SSL certificate manager for macOS that uses Certbot and Let's Encrypt.

## Features

* Interactive setup wizard
* Domain and email prompts
* Homebrew validation
* Automatic Certbot installation
* SSL certificate generation
* SSL renewal testing
* Clean terminal UI with progress indicators
* Supports root and www domains

## Requirements

* macOS
* Homebrew installed
* Public domain name
* DNS records pointing to your server
* Port 80 accessible from the internet

## Installation

```bash
git clone https://github.com/yourusername/letsencrypt-ssl-manager.git
cd letsencrypt-ssl-manager
chmod +x ssl.sh
./ssl.sh
```

## Usage

The script will prompt for:

* Domain Name
* Email Address

Example:

```text
Enter Domain Name: shehan.cloud
Enter Email Address: admin@shehan.cloud
```

The script will then:

1. Verify Homebrew is installed
2. Install Certbot (if required)
3. Request a Let's Encrypt certificate
4. Test certificate renewal
5. Display certificate location

## Certificate Location

```text
/etc/letsencrypt/live/<domain>/
```

Example:

```text
/etc/letsencrypt/live/myrate.lk/
```

## Common Errors

### NXDOMAIN

```text
DNS problem: NXDOMAIN looking up A record
```

Cause:

* Domain does not exist
* Missing DNS records

Check:

```bash
dig +short yourdomain.com
```

### Unauthorized Challenge Failure

```text
Invalid response from /.well-known/acme-challenge/
```

Possible causes:

* Domain points to another server
* IPv6 record points elsewhere
* Cloudflare proxy enabled
* Port 80 blocked
* Web server intercepting challenge requests

Verify:

```bash
dig yourdomain.com
dig AAAA yourdomain.com
curl -I http://yourdomain.com
```

## Disclaimer

Let's Encrypt requires public DNS records and internet access to your server. Certificate issuance will fail if the domain cannot be validated.

## License

MIT License

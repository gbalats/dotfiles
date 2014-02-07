#!/bin/bash

echo 'Generating "msmtprc" configuration file...'
echo 'Gmail configuration'

# Prompt for gmail account
read -p "  username: " GMAIL_USER

# Prompt for gmail password
read -p "  password: " -r -s GMAIL_PASSWD
echo

# Append suffix if missing
if [[ $GMAIL_USER = ${GMAIL_USER%@*} ]]; then
    GMAIL_USER="${GMAIL_USER}@gmail.com"
fi

# Find certificate
for cert in \
    /etc/ssl/certs/ca-certificates.crt \
    /etc/pki/tls/certs/ca-bundle.crt \
    /etc/ssl/ca-bundle.pem
do
    if [[ -r $cert ]]; then
        CERTIFICATE="$cert"
        break
    fi
done

if [[ -z $CERTIFICATE ]]; then
    echo >&2 "Could not find appropriate certificate"
    exit 1
fi

# Generate msmtprc from template
cat > $1 <<EOF
# gmail account
account gmail
host smtp.gmail.com
port 587
auth on
user ${GMAIL_USER}
password ${GMAIL_PASSWD}
tls on
tls_starttls on
tls_trust_file ${CERTIFICATE}
from ${GMAIL_USER}

# set default account to use (from above)
account default : gmail
EOF

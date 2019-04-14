#!/bin/bash

cd tls_files

openssl pkcs12 -export \
  -in dc1-client-consul-0.pem \
  -inkey dc1-client-consul-0-key.pem \
  -out ../client.pfx

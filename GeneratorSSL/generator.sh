#!/bin/sh
echo "Generator certyfikatów"

caca_config="/C=PL/O=Korbank/CN=HOMS"
serv_config="/C=PL/O=Korbank/CN=super_broker"
clie_config="/C=PL/O=Korbank/CN=super_klient"
loca_config="/C=PL/O=Korbank/CN=127.0.0.1"

# Twórz klucz CA:
openssl genrsa -out CA.key 2048

# Twórz klucz serwera:
openssl genrsa -out server.key 2048

# Twórz klucz klienta:
openssl genrsa -out client.key 2048

# Twórz klucz klienta lokalnego:
openssl genrsa -out local.key 2048

# Twórz certyfikat typu self-signed dla CA:
openssl req -new -key CA.key -subj $caca_config -x509 -days 1000 -out CA.crt

# Twórz prośbę o wystawienie certyfikatu serwera i podpisz go:
openssl req -new -key server.key -subj $serv_config -out server.csr
openssl x509 -req -CA CA.crt -CAkey CA.key -CAcreateserial -in server.csr -days 365 -out server.crt

# Twórz prośbę o wystawienie certyfikatu klienta i podpisz go:
openssl req -new -key client.key -subj $clie_config -out client.csr
openssl x509 -req -CA CA.crt -CAkey CA.key -CAcreateserial -in client.csr -days 365 -out client.crt

# Twórz prośbę o wystawienie certyfikatu klienta lokalnego i podpisz go:
openssl req -new -key local.key -subj $loca_config -out local.csr
openssl x509 -req -CA CA.crt -CAkey CA.key -CAcreateserial -in local.csr -days 365 -out local.crt

# Generuj certyfikaty i klucze w formacie DER:
openssl rsa -in CA.key -out CA.key.der -outform DER
openssl x509 -in CA.crt -out CA.crt.der -outform DER
openssl rsa -in server.key -out server.key.der -outform DER
openssl x509 -in server.crt -out server.crt.der -outform DER
openssl rsa -in client.key -out client.key.der -outform DER
openssl x509 -in client.crt -out client.crt.der -outform DER
openssl rsa -in local.key -out local.key.der -outform DER
openssl x509 -in local.crt -out local.crt.der -outform DER

#!/bin/bash
sudo -u postgres psql -c "CREATE DATABASE face_reco;"
sudo -u postgres psql -c "CREATE USER face_reco_admin WITH PASSWORD 'qwerty123';"
sudo -u postgres psql -c "ALTER ROLE face_reco_admin SET client_encoding TO 'utf8';"
sudo -u postgres psql -c "ALTER ROLE face_reco_admin SET default_transaction_isolation TO 'read committed';"
sudo -u postgres psql -c "ALTER ROLE face_reco_admin SET timezone TO 'UTC';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE face_reco TO face_reco_admin;"
sudo -u postgres psql -c "ALTER USER face_reco_admin WITH SUPERUSER;"
sudo -u postgres psql face_reco -c "CREATE EXTENSION cube;"
#!/bin/bash
sudo -u postgres psql face_reco -c "CREATE SCHEMA fr;"
sudo -u postgres psql face_reco -c "CREATE TABLE fr.frames(id SERIAL, unique_id bigint NOT NULL, i_extension character varying(20), coord_x integer, coord_y integer, width_x integer, height_y integer, similarity double precision, source_ip_camera integer, server_id integer, CONSTRAINT frames_pkey PRIMARY KEY (id));"
sudo -u postgres psql face_reco -c "CREATE TABLE fr.blacklist(id bigint, vector cube);"
sudo -u postgres psql face_reco -c "CREATE TABLE fr.vectors_archive(id serial, unique_id bigint NOT NULL, vector cube, camera_id integer, server_id integer)"
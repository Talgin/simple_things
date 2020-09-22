# Creating tables for comitet face_reco
sudo -u postgres psql face_reco -c "CREATE SCHEMA fr;"
sudo -u postgres psql face_reco -c "CREATE TABLE fr.crops(id SERIAL, unique_id VARCHAR(30), coord_x integer, coord_y integer, width_x integer, height_y integer, c_time timestamp, camera_id VARCHAR(30), source integer, flag integer, CONSTRAINT crops_pkey PRIMARY KEY (id));"
sudo -u postgres psql face_reco -c "CREATE TABLE fr.results(id SERIAL PRIMARY KEY, unique_id VARCHAR(30), f_id VARCHAR(30), gr_code bigint, ud_code bigint, fio VARCHAR(150), distance double precision);"
sudo -u postgres psql face_reco -c "CREATE TABLE fr.unique_ud_gr(id SERIAL PRIMARY KEY, unique_id bigint, ud_code bigint, gr_code bigint, lastname VARCHAR(30), firstname VARCHAR(30), secondname VARCHAR(30));"
echo "Finished with tables."

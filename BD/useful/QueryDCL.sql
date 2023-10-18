create user 'supervisor'@'localhost' identified by '#gf202302';

grant SELECT, UPDATE, DELETE, INSERT on sptechb.* to 'supervisor'@'localhost';

flush privileges;

revoke SELECT, UPDATE, DELETE, INSERT on sptechb.* from 'supervisor'@'localhost';

flush privileges;

grant all privileges on sptechb.* to 'supervisor'@'localhost';

flush privileges;

revoke all privileges on sptechb.* from 'supervisor'@'localhost';


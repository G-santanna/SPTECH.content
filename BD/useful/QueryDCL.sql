create user 'supervisor'@'localhost' identified by '#gf202302';-- Sintaxo para criar um usuário

grant SELECT, UPDATE, DELETE, INSERT on sptechb.* to 'supervisor'@'localhost';-- Definir as permissões dele

flush privileges;-- Aplicar as alterações

-- Daqui pra baixo são as outras sintaxes de DCL

revoke SELECT, UPDATE, DELETE, INSERT on sptechb.* from 'supervisor'@'localhost';

flush privileges;

grant all privileges on sptechb.* to 'supervisor'@'localhost';

flush privileges;

revoke all privileges on sptechb.* from 'supervisor'@'localhost';


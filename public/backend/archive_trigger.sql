CREATE TRIGGER `ARCHIVE` AFTER DELETE ON `Reservations` FOR EACH ROW INSERT INTO archive VALUES(NULL, old.Id_user, old.Id_car, old.DateStart, old.DateEnd, 'cancelled', old.time)

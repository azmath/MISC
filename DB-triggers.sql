
DELIMITER //
create TRIGGER staus_changed_to_open BEFORE UPDATE ON issues 
FOR EACH ROW BEGIN if LOCATE('open', NEW.status) !=0 THEN SET new.date_closed = NULL; 
end if;
END;//
DELIMITER ;

DELIMITER //
create TRIGGER update_close_date BEFORE UPDATE ON issues 
FOR EACH ROW BEGIN 
if LOCATE('closed', NEW.status) !=0 THEN 
SET new.date_closed = CURRENT_DATE; 
end if; 
END;//
DELIMITER ;


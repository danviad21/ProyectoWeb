DELIMITER $$
CREATE FUNCTION FNC_AsigPk(nombtab varchar(50)) RETURNS INTEGER deterministic
begin
    DECLARE var  Integer;
 
	SELECT valor into var FROM Asig_PK WHERE upper(n_tab) like upper(nombtab);
 	if var is null then
		return -1;
	else return var;
    end if;
 END
$$
SET SERVEROUTPUT ON
DECLARE
  v_department_id departments.department_id%TYPE := &id_département;
  v_departmentName departments.department_name%type;
  v_streetAddress locations.street_address%type;
  v_postalCode locations.postal_code%type;
  v_city locations.city%type;
BEGIN

  SELECT d.department_name, e.street_address, e.postal_code, e.city
  INTO v_departmentName, v_streetAddress, v_postalCode, v_city
  FROM departments d inner join locations e
  on (d.location_id = e.location_id)
  WHERE d.department_id = v_department_id;

  DBMS_OUTPUT.PUT_LINE('Département : '||v_department_id||' - '||v_departmentName);
  DBMS_OUTPUT.PUT_LINE('Location : '||v_streetAddress||' - '||v_postalCode||' - '||v_city);
END;
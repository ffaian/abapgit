CLASS zcl_generate_pos_dept_f_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_pos_dept_f_data IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.
    DATA:itab TYPE TABLE OF zpos_dept_f.

*   read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal travel table (itab)
    itab = VALUE #(
  (  mykey = '02D5290E594C1EDA93815057FD946624' pos_dept_id = '0001' name = 'department 1')
  (  mykey = '02D5290E594C1EDA93815057FD946625' pos_dept_id = '0002' name = 'department 1')
  (  mykey = '02D5290E594C1EDA93815057FD946626' pos_dept_id = '0003' name = 'department 3') ).

*   delete existing entries in the database table
    DELETE FROM zpos_dept_f.

*   insert the new table entries
    INSERT zpos_dept_f FROM TABLE @itab.

*   check the result
    SELECT * FROM zpos_dept_f INTO TABLE @itab.
    out->write( sy-dbcnt ).
    out->write( 'pos dept data inserted successfully!').

  ENDMETHOD.

ENDCLASS.

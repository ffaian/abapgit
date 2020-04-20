CLASS zcl_generate_pos_dept DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_generate_pos_dept IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA:itab TYPE TABLE OF zpos_dept.

*   read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal travel table (itab)
    itab = VALUE #(
  (  pos_dept_id = '001' name = 'Meat')
  (  pos_dept_id = '002' name = 'Produce')
  (  pos_dept_id = '003' name = 'Service Case Meat')
  (  pos_dept_id = '004' name = 'Grocery') ).

*   delete existing entries in the database table
    DELETE FROM zpos_dept.

*   insert the new table entries
    INSERT zpos_dept FROM TABLE @itab.

*   check the result
    SELECT * FROM zpos_dept INTO TABLE @itab.
    out->write( sy-dbcnt ).
    out->write( 'pos dept data inserted successfully!').

  ENDMETHOD.

ENDCLASS.

CLASS zcl_generate_pos_dept_map DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_generate_pos_dept_map IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA:itab TYPE TABLE OF zpos_dept_map.

*   read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal travel table (itab)
    itab = VALUE #(
  (  store_id = '0100' pos_dept_id = '001' cfin_proft_ctr = '150001')
  (  store_id = '0100' pos_dept_id = '002' cfin_proft_ctr = '150002')
  (  store_id = '0100' pos_dept_id = '003' cfin_proft_ctr = '150004')
  (  store_id = '0100' pos_dept_id = '004' cfin_proft_ctr = '150005')
  (  store_id = '0001' pos_dept_id = '001' cfin_proft_ctr = '150002')
  (  store_id = '0001' pos_dept_id = '003' cfin_proft_ctr = '150002') ).

*   delete existing entries in the database table
    DELETE FROM zpos_dept_map.

*   insert the new table entries
    INSERT zpos_dept_map FROM TABLE @itab.

*   check the result
    SELECT * FROM zpos_dept_map INTO TABLE @itab.
    out->write( sy-dbcnt ).
    out->write( 'pos dept data inserted successfully!').

  ENDMETHOD.

ENDCLASS.

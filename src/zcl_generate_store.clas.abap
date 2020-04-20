CLASS zcl_generate_store DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_generate_store IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA:itab TYPE TABLE OF zstore.

*   read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal travel table (itab)
    itab = VALUE #(
  (  store_id = '0001' name = 'Store 1')
  (  store_id = '0002' name = 'Store 2')
  (  store_id = '0003' name = 'Store 3')
  (  store_id = '0100' name = 'Store 100') ).

*   delete existing entries in the database table
    DELETE FROM zstore.

*   insert the new table entries
    INSERT zstore FROM TABLE @itab.

*   check the result
    SELECT * FROM zstore INTO TABLE @itab.
    out->write( sy-dbcnt ).
    out->write( 'Store data inserted successfully!').

  ENDMETHOD.

ENDCLASS.

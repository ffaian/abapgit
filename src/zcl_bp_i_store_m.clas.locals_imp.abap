*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lhc_store DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    TYPES tt_store_update TYPE TABLE FOR UPDATE zi_store_m.

    METHODS get_features               FOR FEATURES IMPORTING keys REQUEST    requested_features FOR Store    RESULT result.

ENDCLASS.

CLASS lhc_store IMPLEMENTATION.

  METHOD get_features.
  ENDMETHOD.

ENDCLASS.

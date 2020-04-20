*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lhc_posdept DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    TYPES tt_pos_dept_update TYPE TABLE FOR UPDATE zi_pos_dept_2_m.

    METHODS get_features               FOR FEATURES IMPORTING keys REQUEST    requested_features FOR POSDept RESULT result.

    METHODS CalculatePOSDeptKey FOR DETERMINATION POSDept~CalculatePOSDeptKey IMPORTING keys FOR POSDept.

ENDCLASS.

CLASS lhc_posdept IMPLEMENTATION.

  METHOD get_features.

    READ ENTITY zi_pos_dept_2_m FROM VALUE #( FOR keyval IN keys
                                                          (  %key                    = keyval-%key
                                                           "  %control-travel_id      = if_abap_behv=>mk-on
                                                            ) )
                                    RESULT DATA(lt_posdept_result).


    result = VALUE #( FOR ls_posdept IN lt_posdept_result
                       ( %key                           = ls_posdept-%key
                         %features-%action-acceptPOSDept = COND #( WHEN ls_posdept-pos_dept_id is not INITIAL
                                                                    THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled   )
                      ) ).

  ENDMETHOD.

  METHOD calculatePOSDeptkey.
    SELECT FROM zpos_dept_f
        FIELDS MAX( pos_dept_id ) INTO @DATA(lv_max_travel_id).

    LOOP AT keys INTO DATA(ls_key).
      lv_max_travel_id = lv_max_travel_id + 1.
      MODIFY ENTITIES OF zi_pos_dept_2_m  IN LOCAL MODE
        ENTITY POSDept
          UPDATE SET FIELDS WITH VALUE #( ( mykey     = ls_key-mykey
                                            pos_dept_id = lv_max_travel_id ) )
          REPORTED DATA(ls_reported).
      APPEND LINES OF ls_reported-POSDept TO reported-POSDept.
    ENDLOOP.

  ENDMETHOD.


ENDCLASS.

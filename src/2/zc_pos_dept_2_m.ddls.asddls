@EndUserText.label: 'Projection view for POS Department'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {
 headerInfo: { typeName: 'POSDept', typeNamePlural: 'Travels', title: { type: #STANDARD, value: 'POSDeptID' } } }

@Search.searchable: true

define root view entity ZC_POS_DEPT_2_M
  as projection on ZI_POS_DEPT_2_M
{

      @UI.facet: [ { id:              'POSDept',
                           purpose:         #STANDARD,
                           type:            #IDENTIFICATION_REFERENCE,
                           label:           'POS Department',
                           position:        10 } ]

      @UI.hidden: true
  key mykey           as POSDeptUUID,

      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'POS Department' } ] }
      @Search.defaultSearchElement: true
      pos_dept_id     as POSDeptID,

      @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20, label: 'Name' } ] }
      @Search.defaultSearchElement: true
      name            as Description,

      @UI.hidden: true
      last_changed_at as LastChangedAt

}

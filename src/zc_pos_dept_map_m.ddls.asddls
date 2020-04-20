@EndUserText.label: 'Projection view for POS Dept Mapping'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {
 headerInfo: { typeName: 'Store', typeNamePlural: 'Stores', title: { type: #STANDARD, value: 'StoreID' } } }


@Search.searchable: true

define root view entity ZC_POS_DEPT_MAP_M
  as projection on ZI_POS_DEPT_MAP_M
{

      @UI.facet: [ { id:              'Store',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Store',
                     position:        10 } ]

      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'Store' } ] }
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZI_STORE_M_VH', element: 'StoreID'  } }]
  key store_id        as StoreID,

      @UI: {
          lineItem:       [ { position: 30, importance: #HIGH } ],
          identification: [ { position: 30, label: 'POS Department' } ] }
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZI_POS_DEPT_M_VH', element: 'POSDeptID'  } }]
  key pos_dept_id     as POSDeptID,

      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ],
      identification: [ { position: 20, label: 'Store Name' } ] }
      @Search.defaultSearchElement: true
      _Store.name     as Store_Name,

      @UI: {
      lineItem:       [ { position: 40, importance: #HIGH } ],
      identification: [ { position: 40, label: 'POS Dept Name' } ] }
      @Search.defaultSearchElement: true
      _POSDept.name     as POSDept_Name,

      @UI: {
          lineItem:       [ { position: 50, importance: #HIGH } ],
          identification: [ { position: 50, label: 'CFIN Profit Center' } ] }
      @Search.defaultSearchElement: true
      cfin_proft_ctr  as CFIN_Proft_Ctr,

      @UI.hidden: true
      last_changed_at as LastChangedAt

}

@EndUserText.label: 'Projection view for Store'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {
 headerInfo: { typeName: 'Store', typeNamePlural: 'Travels', title: { type: #STANDARD, value: 'StoreID' } } }

@Search.searchable: true

define root view entity ZC_STORE_M
  as projection on ZI_STORE_M
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
  key store_id     as StoreID,

      @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20, label: 'Name' } ] }
      @Search.defaultSearchElement: true
      name            as Description,

      @UI.hidden: true
      last_changed_at as LastChangedAt

}

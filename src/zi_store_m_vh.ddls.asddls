@AbapCatalog.sqlViewName: 'ZVI_STORE_M_VH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Search Help for Store'

@Search.searchable: true

define view ZI_STORE_M_VH
  as select from zstore as Store
{

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Name']
  key store_id as StoreID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      name as Name


}

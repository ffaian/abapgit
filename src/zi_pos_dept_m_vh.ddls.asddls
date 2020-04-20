@AbapCatalog.sqlViewName: 'ZVI_POSDEPT_M_VH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Search Help for POS Dept'

@Search.searchable: true

define view ZI_POS_DEPT_M_VH
  as select from zpos_dept as PosDept
{

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Name']
  key pos_dept_id as POSDeptID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      name as Name


}

@AbapCatalog.sqlViewName: 'ZVI_POS_DEPT_2_M'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for POS  Depart'
define root view ZI_POS_DEPT_2_M
  as select from zpos_dept_f as POSDept
{

      //POS_Dept
  key mykey,
      pos_dept_id,
      name,

      /*-- Admin data --*/
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at

}

@AbapCatalog.sqlViewName: 'ZVI_POS_DEPTM_M'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for POS  Depart'
define root view ZI_POS_DEPT_MAP_M
  as select from zpos_dept_map as POSDept_Map

/* Associations */
association [0..1] to ZI_STORE_M as _Store on $projection.store_id = _Store.store_id
association [0..1] to ZI_POS_DEPT_M as _POSDept on $projection.pos_dept_id = _POSDept.pos_dept_id
  
{

  key store_id,
  key pos_dept_id,
      cfin_proft_ctr,

      /*-- Admin data --*/
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,
     
      /* Public associations */
      _Store,
      _POSDept
           
}

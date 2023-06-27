const cds = require("@sap/cds");

module.exports = async (srv) => {
  const QHService = await cds.connect.to("zhr_person_extn_srv");
  const EHService = await cds.connect.to("empqfl");
  const { QHPersonIdentity, QHPersonnelAssignments, QHPersonProfleQualifications } = QHService.entities("CatalogService");
  const { EHPersonProfleQualifications } = EHService.entities("CatalogService");

  srv.on("READ", "QHPersonProfleQualifications", async (request) => {
    //console.log(request.params);

    if (request.params[0]) {
      const { PersonNumber, PersonnelAssignmentNumber } = await request
        .params[0];

      const QH_Qfl_Q = SELECT.from(
        "CatalogService.QHPersonProfleQualifications"
      ).where({ pid: PersonNumber });

      const EH_Qfl_Q = SELECT.from(
        "CatalogService.EHProfleQualifications"
      ).where({
        pid: PersonNumber,
      });

      const QH_Qfl_Res = await cds.run(QH_Qfl_Q); // first odata result
      const EH_Qfl_Res = await cds.run(EH_Qfl_Q); // second odata result
      
      //console.log(EH_Qfl_Res);
      //console.log(QH_Qfl_Res);

      if (EH_Qfl_Res && EH_Qfl_Res.length > 0) {
        for (var i = 0; i < EH_Qfl_Res.length; i++) {
 
          QH_Qfl_Res.push({
            pid: EH_Qfl_Res[i].pid,
            pan: EH_Qfl_Res[i].pan,
            positionId: EH_Qfl_Res[i].positionId,
            qualificationGroup: EH_Qfl_Res[i].qualificationGroup,
            qualificationName: EH_Qfl_Res[i].qualificationName,
            referenceNumber: EH_Qfl_Res[i].referenceNumber
         });

        } 
      }
      QH_Qfl_Res["$count"] = QH_Qfl_Res.length;
      request.reply(QH_Qfl_Res);
    }
    
  });
};

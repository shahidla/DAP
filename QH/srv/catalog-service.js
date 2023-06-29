const cds = require("@sap/cds");

module.exports = async (srv) => {
  const QHService = await cds.connect.to("zhr_person_extn_srv");
  const EHService = await cds.connect.to("empqfl");
  const {
    QHPersonIdentity,
    QHPersonnelAssignments,
    QHPersonProfleQualifications,
    QHRePerProQualifications
  } = QHService.entities("CatalogService");
  const {
    EHPersonProfleQualifications
  } = EHService.entities("CatalogService");

  // Profile Groups
  srv.on("READ", "QHProfileGroups", async (request) => { 
    
    if (request.params[0]) {
      const {
        PersonNumber,
        PersonnelAssignmentNumber
      } = await request
        .params[0];

      if (request.params[1]) {
        const {
          qualificationGroup
        } = await request
          .params[1];
        
          const QH_Qfl_Q = SELECT.distinct`pid, qualificationGroup`
          .from("CatalogService.QHPersonProfleQualifications"
        ).where({
          pid: PersonNumber,
          qualificationGroup: qualificationGroup
        });
        
        const EH_Qfl_Q = SELECT.from(
          "CatalogService.EHProfleQualifications"
        ).where({
          pid: PersonNumber,
          qualificationGroup: qualificationGroup
        });
        const QH_Qfl_Res = await cds.run(QH_Qfl_Q); // first odata result
        const EH_Qfl_Res = await cds.run(EH_Qfl_Q); // second odata result
        
        if (EH_Qfl_Res && EH_Qfl_Res.length > 0) {
          for (var i = 0; i < EH_Qfl_Res.length; i++) {

            QH_Qfl_Res.push({
              pid: EH_Qfl_Res[i].pid,
              qualificationGroup: EH_Qfl_Res[i].qualificationGroup
            });

          }
        }
        var res = QH_Qfl_Res[0]
        res["$count"] = 1;
        return request.reply(res);
      };
      const QH_Qfl_Q = SELECT.distinct`pid, qualificationGroup`.from(
        "CatalogService.QHPersonProfleQualifications"
      ).where({
        pid: PersonNumber
      });

      const EH_Qfl_Q = SELECT.from(
        "CatalogService.EHProfleQualifications"
      ).where({
        pid: PersonNumber,
      });
      if (request.params[1]) {
        var pid = request.params[1].pid;
        var qualificationGroup = request.params[1].qualificationGroup;

      };
      const QH_Qfl_Res = await cds.run(QH_Qfl_Q); // first odata result
      const EH_Qfl_Res = await cds.run(EH_Qfl_Q); // second odata result

      if (EH_Qfl_Res && EH_Qfl_Res.length > 0) {
        for (var i = 0; i < EH_Qfl_Res.length; i++) {

          QH_Qfl_Res.push({
            pid: EH_Qfl_Res[i].pid,
            qualificationGroup: EH_Qfl_Res[i].qualificationGroup
          });

        }
      }
      QH_Qfl_Res["$count"] = QH_Qfl_Res.length;
      request.reply(QH_Qfl_Res);
    }

  });

  srv.on("READ", "QHRePerProQualifications", async (request) => {
    if (request.params[0]) {
      const {
        PersonNumber,
        PersonnelAssignmentNumber
      } = await request
        .params[0];

      var QH_Qfl_Q = SELECT.from(
        "CatalogService.QHPersonProfleQualifications"
      ).where({
        pid: PersonNumber
      });



      var QH_Qfl_Res = await cds.run(QH_Qfl_Q); // first odata result

      try {
        // Perform some logic
        QH_Qfl_Res = QH_Qfl_Res.filter(function (ele) {
          return ele.qualificationGroup == 'Registration';
        })
      } catch (error) {
        log.error('Error occurred during CREATE:', error);
        throw error;
      }

      QH_Qfl_Res["$count"] = QH_Qfl_Res.length;
      request.reply(QH_Qfl_Res);
    }

  });
  srv.on("READ", "QHPersonProfleQualifications", async (request) => {
    var qc = {};
    if (request.params[0]) {
      const {
        PersonNumber
      } = await request
        .params[0];
      qc['pid'] = PersonNumber;
    
      if (request.params[1]) {
        const {
          qualificationGroup
        } = await request
          .params[1];
        qc['qualificationGroup'] = qualificationGroup;
      }
      
      const QH_Qfl_Q = SELECT.from(
        "CatalogService.QHPersonProfleQualifications"
      ).where(qc);
    
      const EH_Qfl_Q = SELECT.from(
        "CatalogService.EHProfleQualifications"
      ).where(qc);

      const QH_Qfl_Res = await cds.run(QH_Qfl_Q); // first odata result
      const EH_Qfl_Res = await cds.run(EH_Qfl_Q); // second odata result

      if (EH_Qfl_Res && EH_Qfl_Res.length > 0) {
        for (var i = 0; i < EH_Qfl_Res.length; i++) {

          QH_Qfl_Res.push({
            pid: EH_Qfl_Res[i].pid,
            pan: EH_Qfl_Res[i].pan,
            positionId: EH_Qfl_Res[i].positionId,
            qualificationGroup: EH_Qfl_Res[i].qualificationGroup,
            qualificationName: EH_Qfl_Res[i].qualificationName,
            referenceNumber: EH_Qfl_Res[i].referenceNumber,
            
          });

        }
      }
      QH_Qfl_Res["$count"] = QH_Qfl_Res.length;
      request.reply(QH_Qfl_Res);
    }

  });
 
};
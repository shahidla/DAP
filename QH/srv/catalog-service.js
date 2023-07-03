const cds = require("@sap/cds");

module.exports = async (srv) => {
  const QHService = await cds.connect.to("zhr_person_extn_srv");
  const EHService = await cds.connect.to("empqfl");
  const stampList = [{
      value: "Credentail Data",
      key: "Credentail"
    },
    {
      value: "Traning Data",
      key: "Traning"
    }, {
      value: "Other HR data",
      key: "HRData"
    }
  ]
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
    var searchconditions = request.query.SELECT.search;
    var result;
    if (request.params[0]) {
      const {
        PersonNumber,
        PersonnelAssignmentNumber
      } = await request
        .params[0];

      // 3rd page
      if (request.params[1]) {
        const {
          qualificationGroup
        } = await request
          .params[1];
        result = stampList.filter(ele => {
          return ele.key == qualificationGroup
        }).map(ele => {
          return {
            pid: PersonNumber,
            qualificationGroup: ele.key,
            qualificationGroupDes: ele.value
          }
        })
        //different stamps from different api 
        if (qualificationGroup == 'HRData') {
          result[0]['showt1'] = false;
          result[0]['showt2'] = true;
          result[0]['showt3'] = true;

        } else if (qualificationGroup == 'Credentail') {
          result[0]['showt1'] = true;
          result[0]['showt2'] = false;
          result[0]['showt3'] = true;

        } else if (qualificationGroup == 'Traning') {
          result[0]['showt1'] = true;
          result[0]['showt2'] = true;
          result[0]['showt3'] = false;

        }
        console.log()
        var res = result[0]
        res["$count"] = 1;
        return request.reply(res);
      };

      // second page
      var chk;

      if (searchconditions) {
        searchconditions.forEach((condition, index) => {
          if (index === 0) {
            chk = condition.val;
          }
        });
      }

      if (chk == undefined) {
        chk = "";
      }
      var QH_Qfl_Q = SELECT.distinct `pid, qualificationGroup`.from(
        "CatalogService.QHPersonProfleQualifications"
      ).where({
        pid: PersonNumber
      }).search(chk); // search filter - second page - Stamp List Tab

      var EH_Qfl_Q = SELECT.distinct `pid, qualificationGroup`.from(
        "CatalogService.EHProfleQualifications"
      ).where({
        pid: PersonNumber,
      }).search(chk);

      // add additional conditions
      if (searchconditions) {
        searchconditions.forEach((condition, index) => {
          if (index != 0) {
            QH_Qfl_Q.SELECT.search.push(condition);
            EH_Qfl_Q.SELECT.search.push(condition);
            chk = "";
          }
        });
      }

      // if (request.params[1]) {
      //   var pid = request.params[1].pid;
      //   var qualificationGroup = request.params[1].qualificationGroup;

      // };
      //var QH_Qfl_Res = await cds.run(QH_Qfl_Q); // first odata result
      //var EH_Qfl_Res = await cds.run(EH_Qfl_Q); // second odata result
      var QH_Qfl_Res = [];
      for (var i = 0; i < stampList.length; i++) {
        QH_Qfl_Res.push({
          qualificationGroup: stampList[i].key,
          qualificationGroupDes: stampList[i].value,
          pid: PersonNumber
        })
      }
      // if (EH_Qfl_Res && EH_Qfl_Res.length > 0) {
      //   for (var i = 0; i < EH_Qfl_Res.length; i++) {

      //     QH_Qfl_Res.push({
      //       pid: EH_Qfl_Res[i].pid,
      //       qualificationGroup: EH_Qfl_Res[i].qualificationGroup
      //     });

      //   }
      // }

      // filter registration data from the stamp list tab
      // try {
      //   QH_Qfl_Res = QH_Qfl_Res.filter(function (elem) {
      //     return elem.qualificationGroup != "Registration";
      //   });
      // } catch (error) {
      //   log.error("Error:", error);
      //   throw error;
      // }

      QH_Qfl_Res["$count"] = QH_Qfl_Res.length;
      request.reply(QH_Qfl_Res);
    }

  });

  srv.on("READ", "QHRePerProQualifications", async (request) => {
    // Search Filters for second page - AHPRA Reg Tab
    var searchconditions = request.query.SELECT.search;

    var chk;

    if (searchconditions) {
      searchconditions.forEach((condition, index) => {
        if (index === 0) {
          chk = condition.val;
        }
      });
    }

    if (chk == undefined) {
      chk = "";
    }

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
      }).search(chk);

      // add additional conditions
      if (searchconditions) {
        searchconditions.forEach((condition, index) => {
          if (index != 0) {
            QH_Qfl_Q.SELECT.search.push(condition);
            chk = "";
          }
        });
      }

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
      //console.log(QH_Qfl_Res)
      QH_Qfl_Res["$count"] = QH_Qfl_Res.length;
      request.reply(QH_Qfl_Res);
    }

  });

  srv.on("READ", "QHPersonProfleQualifications", async (request) => {
    var searchconditions = request.query.SELECT.search; //third page - qualification names tab
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
        if (qualificationGroup == 'HRData') {
          qc['qualificationGroup'] = 'Vaccinations';
        }

      }

      var chk;

      if (searchconditions) {
        searchconditions.forEach((condition, index) => {
          if (index === 0) {
            chk = condition.val;
          }
        });
      }

      if (chk == undefined) {
        chk = "";
      }

      var QH_Qfl_Q = SELECT.from(
        "CatalogService.QHPersonProfleQualifications"
      ).where(qc).search(chk);

      var EH_Qfl_Q = SELECT.from(
        "CatalogService.EHProfleQualifications"
      ).where(qc).search(chk);

      // add additional conditions
      if (searchconditions) {
        searchconditions.forEach((condition, index) => {
          if (index != 0) {
            QH_Qfl_Q.SELECT.search.push(condition); //(sOperator, { val : chk} );
            EH_Qfl_Q.SELECT.search.push(condition); //(sOperator, { val : chk} );
            chk = "";
          }
        });
      }

      const QH_Qfl_Res = await cds.run(QH_Qfl_Q); // first odata result
      //const EH_Qfl_Res = await cds.run(EH_Qfl_Q); // second odata result

      // if (EH_Qfl_Res && EH_Qfl_Res.length > 0) {
      //   for (var i = 0; i < EH_Qfl_Res.length; i++) {

      //     QH_Qfl_Res.push({
      //       pid: EH_Qfl_Res[i].pid,
      //       pan: EH_Qfl_Res[i].pan,
      //       positionId: EH_Qfl_Res[i].positionId,
      //       qualificationGroup: EH_Qfl_Res[i].qualificationGroup,
      //       qualificationName: EH_Qfl_Res[i].qualificationName,
      //       referenceNumber: EH_Qfl_Res[i].referenceNumber,
      //       Pernr: EH_Qfl_Res[i].pid,
      //       requiringPositionTitle: EH_Qfl_Res[i].requiringPositionTitle,
      //       empQualficationStart: EH_Qfl_Res[i].empQualficationStart,
      //       empQualifictionEnd: EH_Qfl_Res[i].empQualifictionEnd
      //     });

      //   }
      // }
      QH_Qfl_Res["$count"] = QH_Qfl_Res.length;
      request.reply(QH_Qfl_Res);
    }

  });
  // Training

  srv.on("READ", "EHTraining", async (request) => {

    var res = [];

    res = [{
      pid: '00250005',

      CourseID: 'CID12',

      CourseName: 'Anatomy',

      G6CourseEquivalent: 'Yes',

      HHSCompleted: 'Yes',

      CompletionDate: '03-07-2023',

      ExpiryDate: '03-07-2025'

    }, {
      pid: '250002',

      CourseID: 'CID12',

      CourseName: 'Anatomy',

      G6CourseEquivalent: 'Yes',

      HHSCompleted: 'Yes',

      CompletionDate: '03-07-2023',

      ExpiryDate: '03-07-2025'

    }]
    if (request.params[0]) {
      const {
        PersonNumber
      } = await request
        .params[0];


      res = res.filter(ele => {
        return ele.pid == PersonNumber
      })
      res["$count"] = res.length;

      return request.reply(res);
    }
  })




  // Credentialling

  srv.on("READ", "EHCredentialling", async (request) => {

    var res = [];

    res = [{
      pid: '00250005',

      HHS: 'HSS1',

      AHPRANumber: 'AHPRA-MED45',

      ScopePracticeType: 'Interim',

      ScopePracticeStatus: 'Approved',

      ApprovedScopePractice: 'Yes',

      SubSpecialty: 'ENT',

      ScopePracticeStartDate: '02-07-2023',

      ScopePracticeExpiryDate: '01-07-2025',

      ScopePracticeConditions: 'None',

      RequiredSupervisionRequirements: 'None'
    }]
    if (request.params[0]) {
      const {
        PersonNumber
      } = await request
        .params[0];
        res = res.filter(ele=>{
          return ele.pid == PersonNumber
        })

      res["$count"] = res.length;

      return request.reply(res);
    }
  })
};
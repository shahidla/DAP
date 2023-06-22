const cds = require('@sap/cds');

module.exports = async srv => {

    // const { PersonSrv } = srv.entities

    const EmpService = await cds.connect.to('emp')
    const QHService = await cds.connect.to('zhr_person_extn_srv')
    const { QHPosition, QHPersonIdentity, QHPersonnelAssignments,PersonProfleQualifications } = QHService.entities('CatalogService')
    srv.on('READ', 'PersonSrv', async (req) => {
        
        // // execute the query        
        const output = [];
        
        const qpos = SELECT.from('CatalogService.QHPosition').orderBy({PersonNumber: "asc" });
        const posres = await cds.run(qpos)

        const PersonData = posres.map(async (position) => {
             
            const qper = SELECT.from('CatalogService.QHPersonIdentity').where({ pid: position.PersonNumber }).orderBy({pid: "asc" });
            const perres = await cds.run(qper)
            const qperproqfl = SELECT.from('CatalogService.PersonProfleQualifications')
                                     .where({ pid: position.PersonNumber,qualificationGroup: 'Registration' }).orderBy({pid: "asc" });

            const perproqfl = await cds.run(qperproqfl)
            const perproqflval = perproqfl[0]

            const qperasn = SELECT.from('CatalogService.QHPersonnelAssignments').where({ PersonNumber: position.PersonNumber })
            const perasnres = await cds.run(qperasn)
            const perasnresval = perasnres[0]

            if (perres && perres.length > 0) {
                perres.forEach( (person) => {
                    
                    // const qperasn = SELECT.from('CatalogService.QHPersonnelAssignments').where({ PersonNumber: position.PersonNumber })
                    // const perasnres = await cds.run(qperasn)
                    // const perasnresval = perasnres[0]

                    output.push({
                        pid: position.PersonNumber, pan: position.PersonnelAssignmentNumber, name: perasnresval.FirstName,
                        posname: perasnresval.PositionName, 
                        ahpra: perproqflval.referenceNumber, expirydate: perproqflval.empQualifictionEnd,
                        position: position.PositionNumber, work: person.workPhone, mobile: person.mobilePhone, email: person.email
                    })
                })
            } else {
                output.push({
                    pid: position.PersonNumber, pan: position.PersonnelAssignmentNumber, name: perasnresval.FirstName,
                    posname: perasnresval.PositionName, 
                    ahpra: perproqflval.referenceNumber, expirydate: perproqflval.empQualifictionEnd,
                    position: position.PositionNumber, work: person.workPhone, mobile: person.mobilePhone, email: person.email
                })
            }
           
            
        })

        const PersonDataAll = await Promise.all(PersonData)
        output.sort(function(a, b){return a.pid - b.pid});
        output['$count'] = output.length
        req.reply(output)

    })



    srv.on('READ', 'Employees', request => {
        return res = EmpService.run(request.query)
    })

    srv.on('READ', 'QHPosition', async request => {
        console.log(request.query)
        res = await QHService.run(request.query)
        console.log(res)
        return res
    })

}


const cds = require('@sap/cds');

module.exports = async srv => {

    // const { PersonSrv } = srv.entities

    const EmpService = await cds.connect.to('emp')
    const QHService = await cds.connect.to('zhr_person_extn_srv')
    const { QHPosition, QHPersonIdentity, QHPersonnelAssignments,PersonProfleQualifications } = QHService.entities('CatalogService')
    srv.on('READ', 'PersonSrv', async (req) => {
        // // execute the query        
        const output = [];
        const personals = []
        const qpos = SELECT.from('CatalogService.QHPosition')
        const posres = await cds.run(qpos)

        const PersonData = posres.map(async (position) => {

            const qper = SELECT.from('CatalogService.QHPersonIdentity').where({ pid: position.PersonNumber })
            const perres = await cds.run(qper)
            const qperproqfl = SELECT.from('CatalogService.PersonProfleQualifications')
                                     .where({ pid: position.PersonNumber,qualificationGroup: 'Registration' })

            const perproqfl = await cds.run(qperproqfl)
            const perproqflval = perproqfl[0]

            if (perres && perres.length > 0) {
                perres.forEach(async (person) => {

                    const qperasn = SELECT.from('CatalogService.QHPersonnelAssignments').where({ PersonNumber: position.PersonNumber })
                    const perasnres = await cds.run(qperasn)
                    const perasnresval = perasnres[0]



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

        return output

    })



    srv.on('READ', 'Employees', request => {
        return res = EmpService.run(request.query)
    })

    srv.on('READ', 'QHPosition', async request => {
        console.log(request.query)
        return res = await QHService.run(request.query)
    })

}


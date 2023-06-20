module.exports = cds.service.impl(async function () {
	const cds = require('@sap/cds');
	const EmpService = await cds.connect.to('emp')
	const QHService = await cds.connect.to('zhr_person_extn_srv')
	const { QHPerson, QHPosition } = QHService.entities('CatalogService') 
   
	this.on('READ','Employees', request => {
		return res = EmpService.run(request.query)
	})

	this.on('READ','QHPosition',async (request) => {

		// let query = SELECT.from(`${QHPerson.name} as B`)
		// .join(`${QHPosition.name} as A`)
		// .on('B.PID','=','A.PERSONNUMBER')
		
        // console.log(query)

		// return results = await cds.run(query)
		return QHService.run(request.query)
	   
	})

	this.on('READ','QHPerson',async (req) => {
      
        let PerPersonalQuery = SELECT.from(req.query.SELECT.from)
            .limit(req.query.SELECT.limit)
        if (req.query.SELECT.where) {
            PerPersonalQuery.where(req.query.SELECT.where)
        }
        if (req.query.SELECT.orderBy) {
            PerPersonalQuery.orderBy(req.query.SELECT.orderBy)
        }

		let personal = await QHService.tx(req).send({
            query: PerPersonalQuery
        })

		const personals = []

         if (Array.isArray(personal)){
             personals = personal
         }else {personals[0] = personal}
		

		 const getExtensionData = personals.map(async (item) => {
            const data = await SELECT.from(QHPosition).where({ PersonNumber: item.pid })
            if (data[0]) {
                item.custom = data[0].PersonnelAssignmentNumber
            } else {
                item.custom = '12'
            }
            return item
        })

        const personalsWithExtension = await Promise.all(getExtensionData)
		return personalsWithExtension
		
	   
	})

})


module.exports = cds.service.impl(async function () {
	const cds = require('@sap/cds');
	const EmpService = await cds.connect.to('emp')
	const QHService = await cds.connect.to('zhr_person_extn_srv')
	const { QHPerson, QHPosition } = QHService.entities('CatalogService') 
   
	this.on('READ','Employees', request => {
		return res = EmpService.run(request.query)
	})

	this.on('READ','QHPerson',async (request) => {

		// let query = SELECT.from(`${QHPerson.name} as B`)
		// .join(`${QHPosition.name} as A`)
		// .on('B.PID','=','A.PERSONNUMBER')
		
        // console.log(query)

		// return results = await cds.run(query)
		return QHService.run(request.query)
	   
	})


})


// module.exports = cds.service.impl(async function() {
// 	const { Products } = this.entities;
// 	const service = await cds.connect.to('NorthWind');

// 	this.on('READ', Products, request => {
// 		return service.tx(request).run(request.query);
// 	});
// });


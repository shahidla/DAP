module.exports = cds.service.impl(async function () {
	const cds = require('@sap/cds');
	const EmpService = await cds.connect.to('emp')
	const QHService = await cds.connect.to('zhr_person_extn_srv')

	this.on('READ','Employees', request => {
		return res = EmpService.run(request.query)
			
	})

	this.on('READ','QHEmployees', request => {
		return QHService.tx(request).run(request.query);
	//    return res = QHService.run(request.query)
	})
})


// module.exports = cds.service.impl(async function() {
// 	const { Products } = this.entities;
// 	const service = await cds.connect.to('NorthWind');

// 	this.on('READ', Products, request => {
// 		return service.tx(request).run(request.query);
// 	});
// });


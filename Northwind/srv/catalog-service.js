module.exports = cds.service.impl(async function () {
	const cds = require('@sap/cds');
	const EmpService = await cds.connect.to('emp')
	const Northservice = await cds.connect.to('NorthWind');
	

	this.on('READ','Employees', request => {
		return res = EmpService.run(request.query)
			
	})

	this.on('READ','Products', request => {
		return Northservice.tx(request).run(request.query);
	})
})


// module.exports = cds.service.impl(async function() {
// 	const { Products } = this.entities;
// 	const service = await cds.connect.to('NorthWind');

// 	this.on('READ', Products, request => {
// 		return service.tx(request).run(request.query);
// 	});
// });


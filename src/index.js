require('log-timestamp');

//////////////////// SAMPLE ///////////////////////
var run = true;
;(async () => {
	while(run) {
		console.log(`[${process.env.NODE_ENV}] App running`)
		await new Promise(r => setTimeout(r, 1000))
	}
})()
///////////////////////////////////////////////////

process.on('SIGTERM', () => {
	console.log('Graceful shutdown: received SIGTERM');

	run = false;
})
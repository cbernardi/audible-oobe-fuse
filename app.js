
var currentDate = new Date();
var day = currentDate.getDate();
var month = currentDate.getMonth() + 1;
var year = currentDate.getFullYear();
var today = ((month +1) + "/" + day + "/" + year);
var billingStart = "Your first billing date will be " + today + ".\nCancel before then and you won't be charged.";  

console.log(month)
console.log(billingStart)

var InterApp = require('FuseJS/InterApp');
function appLaunch () {
    debug_log("Launching app");
    InterApp.launchUri ('audible://store/rawurl/TOS/index.htm#/');
}
// function homeLaunch () {
//     debug_log("Existing app");
//     InterApp.lunchUri ('com.amazon.firelauncher/.Launcher}')
// }

var PlaySample = require("PlaySample");

    function playSound(){
        PlaySample.samplePlayback();
    }

var StopSample = require("PlaySample");

    function stopSample() {
        PlaySample.stopPlayback();
    }

module.exports = {
    billingStart: billingStart,
    appLaunch: appLaunch,
    playSound: playSound,
    stopSample: stopSample
};


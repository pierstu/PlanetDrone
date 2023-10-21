s.waitForBoot{ 


 "../OSCfunctions.scd".loadRelative;

(

   // Your code here (Example Below) ===========================================================================

	x = Ndef(\x,	{
	    arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0, planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
	
	var output;
	var delayTime;
	var delayMax = 0.2;
	var delayAdd = 0.1;
	var pulseFreq = 0.5;
	var proxyMul = 2;
	var pulseMin = 40;
	var pulseMax = 130;
	var numOfEchos = 2;

        var mainPulse = LFPulse.ar(pulseFreq+(planetDrone_effect_3*1.75), 0, 0.5).range(pulseMin-(planetDrone_2a*250), pulseMax+(planetDrone_3a*250));
        var proxy = Ndef(\x).ar * proxyMul+(planetDrone_4a*350);
        var ampModFreq = SinOsc.ar(0.01, 0).range(0.3, 30);
        var ampMod = LFNoise1.ar(ampModFreq, 6+(planetDrone_1a*75));
	output = SinOsc.ar(mainPulse + proxy, 0, ampMod).tanh;
	numOfEchos.do{
	delayTime = {delayMax.rand + delayAdd}!2;
        output = AllpassL.ar(output, 0.7, abs(0.1 + delayTime+(planetDrone_effect_2*1.72)), 5+(planetDrone_effect_1*4));
		};
	output.tanh;
	}).play;

        s.volume = -95; // Set to -15 for patch creation

   // ==========================================================================================================

)

}

s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

 (

   x = {

   arg planetDrone_1a=0,
	   planetDrone_2a=0,
	   planetDrone_3a=0,
	   planetDrone_4a = 0,
	   planetDrone_effect_1=0,
	   planetDrone_effect_2=0,
	   planetDrone_effect_3=0,
	   f1Freq=0.1, f2Freq=1.1, f3Freq=2.2, nFreq=40, m1Ratio=1, m2Ratio=2, m3Ratio=3,
	   amp=0.1, ampM=0.84 , pan=0;

   var pd_1a = planetDrone_1a*256, pd_2a = planetDrone_2a*256, pd_3a = planetDrone_3a*256, pd_4a = planetDrone_4a*95,
	   sig, car1, mod1, car2, mod2, car3, mod3, index;

      

	   
           index = LFNoise1.kr(0.2).range(2, 12);
           mod1 = SinOsc.ar([nFreq * m1Ratio, pd_1a+nFreq+0.7 * m1Ratio], mul:pd_4a+nFreq * m1Ratio * index) * ampM;
           car1 = SinOsc.ar(f1Freq + mod1);
           mod2 = SinOsc.ar([nFreq * m2Ratio, pd_2a+nFreq+1.4 * m2Ratio], mul:pd_4a+nFreq * m2Ratio * index) * ampM;
           car2 = SinOsc.ar(f2Freq + mod2);
           mod3 = SinOsc.ar([nFreq * m3Ratio, pd_3a+nFreq+0.35 * m3Ratio], mul:pd_4a+nFreq * m3Ratio * index) * ampM;
           car3 = SinOsc.ar(f3Freq + mod3) * 0.4;
           sig = car1 + car2 + car3;
           Out.ar(0, sig);

	   GVerb.ar(sig*0.045,roomsize: 270, revtime: 3, damping: 0.47, inputbw: 0.7, spread: 40, drylevel: 30, earlyreflevel: -6, taillevel: -11, mul: 0.75);

	   FreqShift.ar(sig*0.75 ,planetDrone_effect_1*500) / ((2..8)+   SinOsc.ar(freq: 0.00125+(planetDrone_effect_3), phase: 0.25, mul: planetDrone_effect_2*0.35, add: 0.0) )

   }.play;

  s.volume = -95;

 )

}

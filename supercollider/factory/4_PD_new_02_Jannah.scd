s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

(

 x = {

 arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
     planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
	
 ~bohlen=[1,27/25,25/21,9/7,7/5,75/49,5/3,9/5,49/25,15/7,7/3,63/25,25/9,3];

  Pan2.ar(

   FreeVerb.ar(
	
			{{a=LFTri.ar(~bohlen.choose/3);
				4.do{a=BAllPass.ar(a,PinkNoise.kr(11,30*[1,3,9/7,9/5,7/3,25/9].choose   + (planetDrone_1a*15)  ),0.01);
					a=BAllPass.ar(a,PinkNoise.kr(23,270*[1,3,9].choose*~bohlen.choose)  + (planetDrone_2a*275) ,0.003);
					a=BAllPass.ar(a,PinkNoise.kr(30,120*[3,9,3].choose*~bohlen.choose)  + (planetDrone_4a*125) ,0.073);
					a=((a*LFNoise0.ar(~bohlen.choose/7,7,3))+WhiteNoise.ar(Lag.ar(Dust2.ar(LFNoise1.kr(1,25,3),1,PinkNoise.kr(0.001)),0.02),0)).tanh;
					a=LPF.ar(LeakDC.ar(a,0.996),10000   + (planetDrone_3a*4500)  )};a=(a/2)}!8}

        ,0.15+planetDrone_effect_1,1,1),pos:SinOsc.ar(freq: 0.005+abs(planetDrone_effect_3*3), phase: 0.125, mul: (planetDrone_effect_2*0.75), add: 0.15))


	
}.play;

s.volume = -95;

)

}

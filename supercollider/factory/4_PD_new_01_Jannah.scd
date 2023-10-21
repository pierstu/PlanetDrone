s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

(

 x = {

	arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
        planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;

	~bohlen=[1,27/25,25/21,9/7,7/5,75/49,5/3,9/5,49/25,15/7,7/3,63/25,25/9,3];

	Pan2.ar(

	FreeVerb.ar(


		{a=LFTri.ar(~bohlen.choose/3,0,17);
		5.do{a=BAllPass.ar(a,PinkNoise.kr(12+( planetDrone_1a*45 ),30*~bohlen.choose  + (planetDrone_2a*10) ),02);
		a=BBandStop.ar(a,PinkNoise.kr(24  - (planetDrone_4a*700)     ,270*~bohlen.choose*[1,3,9].choose),3);
		a=((a*LFNoise2.ar(~bohlen.choose/3,6,1))+WhiteNoise.ar(PinkNoise.ar(0.014)*LFNoise2.ar(1,2))).tanh;
		a=LPF.ar(LeakDC.ar(a,0.97),10000    + ( planetDrone_3a * 5000 )  )};
		a=(a/0.25)}!4

	,0.25+planetDrone_effect_1,1,1),pos:SinOsc.ar(freq: 0.0125+abs(planetDrone_effect_3*3), phase: 0.25, mul: (planetDrone_effect_2*0.85), add: 0.12))

}.play;

s.volume = -95;

)

}

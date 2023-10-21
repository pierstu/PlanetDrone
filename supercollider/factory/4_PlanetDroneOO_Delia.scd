s.waitForBoot{

"../OSCfunctions.scd".loadRelative;

 (

x = {

   arg planetDrone_1a=0,
	   planetDrone_2a=0,
	   planetDrone_3a=0,
	   planetDrone_4a=0,
	   planetDrone_effect_1=0,
	   planetDrone_effect_2=0,
	   planetDrone_effect_3=0;

	Pan2.ar(

		FreeVerb.ar(

			SyncSaw.ar([3+abs(planetDrone_2a*195)            
				+SinOsc.ar(freq: 0.03, phase: 0.0, mul: (planetDrone_4a*25), add: 0.0)                 
				,4+abs(planetDrone_3a*150)
				+SinOsc.ar(freq: 0.03, phase: 0.0, mul: (planetDrone_4a*75), add: 0.0)			
			    ],
				Duty.ar(1/Dstutter(60,Dwhite(5,159))*(0.95 + planetDrone_1a),0,
					Dseries(0,Dstutter(60,Dwhite(-330,9)/300))%1).linexp(0,1,20,3000)).trunc(0.25),

    0.25+planetDrone_effect_1,1,1),pos:SinOsc.ar(freq: 0.0125+abs(planetDrone_effect_3*4), phase: 0.0, mul: (planetDrone_effect_2*0.75), add: 0.0))

 }.play;

 s.volume = -95; // -95

 )

}

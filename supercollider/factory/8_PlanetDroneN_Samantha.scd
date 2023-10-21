s.waitForBoot{


 "../OSCfunctions.scd".loadRelative;

	(

		x = {

			arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0, planetDrone_effect_1, planetDrone_effect_2, planetDrone_effect_3,
                            planetDrone_1b=0, planetDrone_2b=0, planetDrone_3b=0, planetDrone_4b = 0;


                         AllpassN.ar(  FreeVerb.ar(

                           q=0;
                           (100..90).do{|f|f=f/2+(planetDrone_1a*16) + (1.0 + SinOsc.ar(planetDrone_2b*1.25,1.25,planetDrone_3b*25));
                           q=SinOsc.ar(f+[0+(planetDrone_3a*100  +SinOsc.ar(freq: 0.03, phase: 0.0, mul: (planetDrone_1b*8), add: 0.0)   ),1+(planetDrone_2a*100  -SinOsc.ar(freq: 0.03, phase: 0.0, mul: (planetDrone_1b*8), add: 0.0)   )],q*LFTri.kr(0.75,1.25).range(1.2+planetDrone_4a,0.25+planetDrone_4b))};
                           q;

                         , mix:  abs(planetDrone_effect_1), room: abs(planetDrone_effect_2), damp:  0.25, mul: 1.0, add: 0.0)

	                 , 2.75, abs(SinOsc.ar(0.0258, 1.38, 0.12, 1.0/(1.0+abs(planetDrone_effect_3*250)))));

		}.play;

        s.volume = -95;

	)

}

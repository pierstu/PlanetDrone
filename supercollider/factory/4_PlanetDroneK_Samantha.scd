s.waitForBoot{ 


 "../OSCfunctions.scd".loadRelative;


 (

   // Your code here (Example Below) ===========================================================================
   x = {

    arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0,
    planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;

	var pd_1a = (planetDrone_1a*77), pd_2a = (planetDrone_2a*70), pd_3a = (planetDrone_3a*63), pd_4a = (planetDrone_4a*55);
	
	Pan2.ar(
		
		FreeVerb.ar(
			
			SinOsc.ar(  Demand.kr(Impulse.kr(Rand(10,100)
				+pd_1a 
				+SinOsc.ar(freq: 0.0032, phase: 0.0, mul: (pd_3a*4), add: 0.0)),0,Dseq([Rand(100,333),Rand(100,333)
				+pd_2a
				+SinOsc.ar(freq: 0.0019, phase: 0.0, mul: (pd_4a*6), add: 0.0)
			],inf)  ),
				
		0,0.08),
			
	0.25+planetDrone_effect_1,1,1),pos:SinOsc.ar(freq: 0.0125+abs(planetDrone_effect_3*4), phase: 0.0, mul: (planetDrone_effect_2*0.75), add: 0.0))

   }.play;

 s.volume = -95; // Set to -15 for patch creation
 
   // ==========================================================================================================

 )

}

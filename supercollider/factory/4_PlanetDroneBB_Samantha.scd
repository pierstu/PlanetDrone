s.waitForBoot{ 


 "../OSCfunctions.scd".loadRelative;


 (

   // Your code here (Example Below) ===========================================================================
   x = {

    arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0,
    planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;

	var pd_1a = (planetDrone_1a*77), pd_2a = (planetDrone_2a*70), pd_3a = (planetDrone_3a*63), pd_4a = (planetDrone_4a*55);
	
	 FreqShift.ar(

		FreeVerb.ar(

           PanB2.ar(Gendy1.ar(3,1,2,1,
			305+pd_1a +abs(SinOsc.ar(freq: 0.0033, phase: 0.0, mul: (pd_3a*3.5), add: 0.0)),
			500+pd_2a +abs(SinOsc.ar(freq: 0.0132, phase: 0.0, mul: (pd_4a*7.2), add: 0.0)),0.33)*LFNoise2.kr(0.2,0.5),Saw.kr(0.2,3)),

		0.25+planetDrone_effect_1,0.25+planetDrone_effect_2,1),

		(0 + (planetDrone_effect_3*2)) / (1..18))

   }.play;

 s.volume = -95; // Set to -15 for patch creation
 
   // ==========================================================================================================

 )

}

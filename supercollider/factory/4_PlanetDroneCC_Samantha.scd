s.waitForBoot{ 


 "../OSCfunctions.scd".loadRelative;


 (

   // Your code here (Example Below) ===========================================================================
   x = {

    arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0,
    planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;

	var pd_1a = (planetDrone_1a*130), pd_2a = (planetDrone_2a*70), pd_3a = (planetDrone_3a*111), pd_4a = (planetDrone_4a*25),
            pd_eff3 = planetDrone_effect_3*3;
	

        GVerb.ar(

	   FreeVerb.ar(

		Mix.fill(50,{|i| var a=LFNoise2.kr(i*[0.001,0.01]); a*RLPF.ar(Saw.ar((

                SinOsc.ar(freq: 0.00012, phase: 0.0, mul: pd_2a, add: 0.0)+

                pd_1a+25)+(i*7.4).round(6.73),0.035),(a*2e3).max(100+abs(pd_3a+

                SinOsc.ar(freq: 0.000721, phase: 0.13, mul: pd_4a, add: 0.0))),(i+1)*0.001)}),

	    0.01+abs(planetDrone_effect_1),0.015+abs(planetDrone_effect_2),0.7),

         roomsize: 272, revtime: 3, damping: 0.65, inputbw: 0.35, spread: 14, drylevel: -7-pd_eff3, earlyreflevel: -1.47, taillevel: 0.56, maxroomsize: 301, mul: 0.85, add: 0)


   }.play;

 s.volume = -95; // Set to -15 for patch creation
 
   // ==========================================================================================================

 )

}

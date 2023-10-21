s.waitForBoot{ 


 "../OSCfunctions.scd".loadRelative;

 (

   // Your code here (Example Below) ===========================================================================
   x = {
	
        arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0, planetDrone_1b=0, planetDrone_2b=0, planetDrone_3b=0, planetDrone_4b = 0, planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;

        FreqShift.ar(

         CombC.ar(
         
	 q=Splay.ar({|i|RLPF.ar(0.6**i*40*Impulse.ar(2**i/32+planetDrone_2a,1/2+planetDrone_3a),4**LFNoise0.kr((1/16+planetDrone_3b.abs*8))*300+(planetDrone_1a*100),5e-3+(planetDrone_4a*0.025)).sin*2}!8);
        
         2.do{q=FreeVerb2.ar(*q++[0.11+planetDrone_effect_1 + SinOsc.ar(0.125,0,planetDrone_4b*0.125),0.85+planetDrone_effect_2, 0.85+planetDrone_effect_3])};q

         , maxdelaytime: 1.5, delaytime: planetDrone_1b.abs*0.25, decaytime: planetDrone_2b.abs*2, mul: 1, add: 0.0) 

        , abs(planetDrone_effect_3*6)/(2..6))

   }.play;
   // ==========================================================================================================

   s.volume = -95;

 )

}


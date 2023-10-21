s.waitForBoot{ 


 "../OSCfunctions.scd".loadRelative;

 (

   // Your code here (Example Below) ===========================================================================
   x = {

     arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0, planetDrone_1b=0, planetDrone_2b=0, planetDrone_3b=0, planetDrone_4b = 0, planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
     
     FreqShift.ar(
  
        FreeVerb2.ar(
		
        Mix.fill(64,{Resonz.ar(Impulse.ar((planetDrone_3a*0.045)+0.1.rand,0.8,9.9.rand),9/(1 + planetDrone_4a*0.23)+99.rand.nthPrime*SinOsc.kr([1,1.7]*0.001+(planetDrone_1a*0.125)).range([59,2],[2,11]),0.0004+(planetDrone_2a*0.0003),33)}), 
		
        Mix.fill(64,{Resonz.ar(Impulse.ar((planetDrone_3b*0.045)+0.1.rand,0.8,9.9.rand),9/(1 + planetDrone_4b*0.23)+99.rand.nthPrime*SinOsc.kr([1,1.7]*0.001+(planetDrone_1b*0.125)).range([59,2],[2,11]),0.0004+(planetDrone_2b*0.0003),33)}),	
		
        mix:planetDrone_effect_1, room:planetDrone_effect_2, damp:0.25, mul:1.0, add:0.0)
 
    , abs(planetDrone_effect_3*8)/(4..16))

   }.play; 
   // ==========================================================================================================

   s.volume = -95;

 )

}

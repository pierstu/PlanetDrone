s.waitForBoot{ 


 "../OSCfunctions.scd".loadRelative;


 (

   // Your code here (Example Below) ===========================================================================
   x = {

   arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0, planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;

   l=LFNoise2;FreeVerb2.ar(*XFade2.ar(SinOscFB.ar(
   [80+(planetDrone_1a*80)   + (SinOsc.ar(0.0075*(1+planetDrone_effect_3*6))*(planetDrone_effect_1*160)) ,
    81+(planetDrone_2a*81)   - (SinOsc.ar(0.0075*(1+planetDrone_effect_3*6))*(planetDrone_effect_1*121)) ],l.kr(1)+1/2),SinOscFB.ar(
   [121+(planetDrone_3a*121) + (SinOsc.ar(0.0075*(1+planetDrone_effect_3*6))*(planetDrone_effect_2*81)) ,
    160+(planetDrone_4a*160) - (SinOsc.ar(0.0075*(1+planetDrone_effect_3*6))*(planetDrone_effect_2*80)) ],l.kr(1)+1/2),l.kr(1)))
   
}.play;

 s.volume = -95; // Set to -15 for patch creation
 
   // ==========================================================================================================

 )

}

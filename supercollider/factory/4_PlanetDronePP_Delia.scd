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

   a=LFTri;
   b=[3,4,8];

   FreqShift.ar(

     FreeVerb.ar(

      Splay.ar(Formlet.ar(a.ar(b*99+99),a.ar(b + SinOsc.ar(freq: 0.03, phase: 0.0, mul: abs(planetDrone_4a*4), add: 0.0)).round(a.ar(0.05+planetDrone_1a).round(1/3))*99+175 +(planetDrone_2a*99),1,a.ar(b/6.011 + (planetDrone_3a*7))%1)/9)

     ,0.1 + planetDrone_effect_1, 0.1 + planetDrone_effect_2),
   (0 + (planetDrone_effect_3*500)) + SinOsc.ar(freq: 0.03, phase: 0.0, mul: (planetDrone_4a*8), add: 0.0) / (2..9));

 }.play;

 s.volume = -95; // -95

 )

}

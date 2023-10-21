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

      var reverb;
      a=[1+abs(planetDrone_1a*2),2+planetDrone_2a];
      b=[3+(planetDrone_3a*8),4+(planetDrone_4a*8)];
      t=Stepper.ar(Impulse.ar(LFNoise0.kr(a,8e3,9e3)));
      reverb = FreeVerb.ar(Clip.ar(HPF.ar(t>>LFNoise0.ar(a,1,5)|t&b),0,1), mix:0.2+abs(planetDrone_effect_1), room:0.3+abs(planetDrone_effect_2*10), damp:0.1+abs(planetDrone_effect_3));
      Out.ar(0, reverb)

   }.play;

  s.volume = -95;

 )

}

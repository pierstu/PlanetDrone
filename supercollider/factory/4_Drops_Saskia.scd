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

      GVerb.ar(

	    ({
	    var n=rrand(3,99),
		e=EnvGen.ar(Env({0.65.rand2**3}!n,{exprand((1+planetDrone_3a)*1e-4,4-(planetDrone_1a*4) )}!(n-1),0.05,n-2,0.0));
	    e*Blip.ar((1+(planetDrone_4a*0.75))*9e2.rand2,(1+(planetDrone_2a*250))*e*9%[9,7])}!4).mean

	  ,roomsize:200, revtime:385, damping:0.5, inputbw:0.5, spread:50, drylevel:-4.0+(planetDrone_effect_1*4),
      earlyreflevel:-3.2+(planetDrone_effect_2*4), taillevel:0.9+(planetDrone_effect_3*1.25))

   }.play;

  s.volume = -95;

 )

}

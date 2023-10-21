s.waitForBoot{ 


 "../OSCfunctions.scd".loadRelative;

 (

   x = {

	   arg planetDrone_1a=0,
	   planetDrone_2a=0,
	   planetDrone_3a=0,
           planetDrone_4a=0,
	   planetDrone_1b=0,
	   planetDrone_2b=0,
	   planetDrone_3b=0,
           planetDrone_4b=0,
	   planetDrone_effect_1=0,
	   planetDrone_effect_2=0,
	   planetDrone_effect_3=0;


           d=Duty;
           f=d.kr(1/[1,2,4],0,Dseq([-10+(planetDrone_1a*10),
		                         -5+(planetDrone_2a*10),
		                          0+(planetDrone_3a*10),
		                          3+(planetDrone_4a*10),
		                          7+(planetDrone_1b*10),
		                         12+(planetDrone_2b*10),
		                         17+(planetDrone_3b*10),
		                         22+(planetDrone_4b*10)]+24+(planetDrone_effect_2*24),inf));
	   GVerb.ar(Blip.ar(f.midicps*[1,4,8],LFNoise1.kr(1/8+abs(planetDrone_effect_3*10),3,4)).sum,275,1+abs(planetDrone_effect_1*3))

   }.play; 

   s.volume = -95;

 )

}

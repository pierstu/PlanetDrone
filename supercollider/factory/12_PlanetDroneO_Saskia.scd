s.waitForBoot{

 "../OSCfunctions.scd".loadRelative;

	(

		x = {

                        arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0, planetDrone_effect_1, planetDrone_effect_2, planetDrone_effect_3,
                            planetDrone_1b=0, planetDrone_2b=0, planetDrone_3b=0, planetDrone_4b = 0,
                            planetDrone_1c=0, planetDrone_2c=0, planetDrone_3c=0, planetDrone_4c = 0;


                        FreqShift.ar(  FreeVerb.ar( LPF.ar(

                        Ringz.ar(CoinGate.ar([8,4,8,2]/10*Line.kr(0,1,30),T2A.ar(Impulse.kr([4+floor(planetDrone_1a*4),8+floor(planetDrone_2a*4),2+floor(planetDrone_3a*4),4+floor(planetDrone_4a*4)]))),
                        [45+abs(planetDrone_1b*25),9e3+abs(planetDrone_2b*4e3),50+abs(planetDrone_3b*25),8e3+abs(planetDrone_4b*4e3)],
                        [6+abs(planetDrone_1c*25),1+abs(planetDrone_2c*25),10+abs(planetDrone_3c*25),3+abs(planetDrone_4c*25)]/7,[4,2,8,4]).sin.sum.tanh!2
                        
                        , freq: 1750)

                        , mix: abs(planetDrone_effect_1), room: abs(planetDrone_effect_2), damp:  0.33, mul: 1.0, add: 0.0)

                        , abs(planetDrone_effect_3*8)/(4..16));

		}.play;

        s.volume = -95;

	)

}

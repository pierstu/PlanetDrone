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

       FreqShift.ar(

        Limiter.ar(
            tanh(
                3 * GVerb.ar(
                    HPF.ar(
                        PinkNoise.ar(0.08+LFNoise1.kr(0.3,0.02))+LPF.ar(Dust2.ar(LFNoise1.kr(0.2).range(40,50)),6600+(planetDrone_3a*5500)),
                        100
                    ),
					250,100-abs(planetDrone_1a*75),0.25,drylevel:0.3
                ) * Line.kr(0,1,10)
            ) + (
                GVerb.ar(
                    LPF.ar(
                        10 * HPF.ar(PinkNoise.ar(LFNoise1.kr(3).clip(0,1)*LFNoise1.kr(2).clip(0,1) ** 1.8), 20+(planetDrone_4a*15))
                        ,LFNoise1.kr(1).exprange(100,2500)
                    ).tanh,
					270,30,0.7,drylevel:0.6+(planetDrone_2a*3)
                ) * Line.kr(0,0.7,30)
            )
        ),

	   0+planetDrone_effect_1*550) / ((2..8)+SinOsc.ar(freq: 0.00025+(planetDrone_effect_3), phase: 0.0, mul: planetDrone_effect_2*0.3, add: 0.0) )

  }.play;

  s.volume = -95; // -15;

 )

}

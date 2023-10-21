s.waitForBoot{


 "../OSCfunctions.scd".loadRelative;

	(

		x = {

                        arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
                            planetDrone_1b=0, planetDrone_2b=0, planetDrone_3b=0, planetDrone_4b=0,
                            planetDrone_1c=0, planetDrone_2c=0, planetDrone_3c=0, planetDrone_4c=0,
                            planetDrone_1d=0, planetDrone_2d=0, planetDrone_3d=0, planetDrone_4d=0,
                            planetDrone_effect_1, planetDrone_effect_2, planetDrone_effect_3;

                       
                         // Samples Location: /usr/local/share/SuperCollider/sounds/ambient/
                        ~loopsArray = [
                           "katja.wav"
                        ];

                        b=Buffer.read(s, Platform.resourceDir +/+ "sounds/ambient/"+/+~loopsArray[0.rand],2);                         

			GVerb.ar(

			t=Impulse.kr(3);

			PlayBuf.ar(2,b,1+(planetDrone_1a*0.5),t,Demand.kr(t,0,Dseq(222*[
				100-(planetDrone_2a*2000),
				4000+(planetDrone_3a*2000),
				600-(planetDrone_4a*2000),
				4000+(planetDrone_3a*2000),
				500-(planetDrone_1b*2000),
				6000+(planetDrone_2b*2000),
				700-(planetDrone_3b*2000),
				8000+(planetDrone_4b*2000),
				800-(planetDrone_1c*2000),
				7000+(planetDrone_2c*2000),
				600-(planetDrone_3c*2000),
				5000+(planetDrone_4c*2000),
                                400-(planetDrone_2a*2000),
                                3000+(planetDrone_3a*2000),
                                200-(planetDrone_4a*2000),
                                1000+(planetDrone_3a*2000),

                                100+(planetDrone_2a*2000),
                                2000-(planetDrone_3a*2000),
                                300+(planetDrone_4a*2000),
                                4000-(planetDrone_3a*2000),
                                500+(planetDrone_1b*2000),
                                1000-(planetDrone_2b*2000),
                                200+(planetDrone_3b*2000),
                                3000-(planetDrone_4b*2000),
                                400+(planetDrone_1c*2000),
                                5000-(planetDrone_2c*2000),
                                100+(planetDrone_3c*2000),
                                2000-(planetDrone_4c*2000),
                                300+(planetDrone_2a*2000),
                                4000-(planetDrone_3a*2000),
                                500+(planetDrone_4a*2000),
                                9000-(planetDrone_3a*2000),

			],inf))),

                      roomsize:215, revtime:375, damping:0.25, inputbw:0.5, spread:75, drylevel:-5.0+(planetDrone_effect_1*4),
                      earlyreflevel:-2.2+(planetDrone_effect_2*4), taillevel:0.6+(planetDrone_effect_3*1.25))                       

		}.play;

        s.volume = -95;

	)

}

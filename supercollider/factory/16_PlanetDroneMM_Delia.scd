s.waitForBoot{


 "../OSCfunctions.scd".loadRelative;

	(

		x = {

                        arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
                            planetDrone_1b=0, planetDrone_2b=0, planetDrone_3b=0, planetDrone_4b=0,
                            planetDrone_1c=0, planetDrone_2c=0, planetDrone_3c=0, planetDrone_4c=0,
                            planetDrone_1d=0, planetDrone_2d=0, planetDrone_3d=0, planetDrone_4d=0,
                            planetDrone_effect_1, planetDrone_effect_2, planetDrone_effect_3;



                        ~loopsArray = [
                           "04_Reverse_Guitar_3.wav",
                           "ASMR_3__ASMR_MISS_MI.wav",
                           "Delia_Vocal2.wav",
                           "clickers.wav"
                        ];

                        b=Buffer.read(s, Platform.resourceDir +/+ "sounds/herbertArtGallery/"+/+~loopsArray[4.rand],2);                         

			GVerb.ar(

			t=Impulse.kr(3);

			PlayBuf.ar(2,b,1+SinOsc.ar(freq: 0.0145, phase: 0.0, mul: planetDrone_1a*0.75,add: 0.0),t,Demand.kr(t,0,Dseq(1e4*[
				2+(planetDrone_2a*2) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_1d*35), add: 0.0),
				3+(planetDrone_3a*2),
				4+(planetDrone_4a*5) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_2d*40), add: 0.0),
				5+(planetDrone_2a*5),
				101+(planetDrone_1b*7) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_3d*55), add: 0.0),
				20+(planetDrone_2b*6),
				30+(planetDrone_3b*8) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_4d*35), add: 0.0),
				40+(planetDrone_4b*9),
				500+(planetDrone_1c*4) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_1d*40), add: 0.0),
				400+(planetDrone_2c*5),
				300+(planetDrone_3c*2) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_2d*35), add: 0.0),
				12+(planetDrone_4c*7),
                                6+(planetDrone_2a*2) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_1d*35), add: 0.0),
                                3+(planetDrone_3a*7),
                                100+(planetDrone_4a*4) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_2d*40), add: 0.0),
                                100+(planetDrone_2a*2),

                                130+(planetDrone_2a*2) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_3d*65), add: 0.0),
                                60+(planetDrone_3a*4),
                                20+(planetDrone_4a*6) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_4d*40), add: 0.0),
                                10+(planetDrone_2a*32),
                                27+(planetDrone_1b*6) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_1d*55), add: 0.0),
                                18+(planetDrone_2b*5),
                                20+(planetDrone_3b*11) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_2d*55), add: 0.0),
                                9+(planetDrone_4b*12),
                                20+(planetDrone_1c*11) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_3d*44), add: 0.0),
                                18+(planetDrone_2c*3),
                                70+(planetDrone_3c*9) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_4d*63), add: 0.0),
                                95+(planetDrone_4c*9),
                                30+(planetDrone_2a*2) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_3d*65), add: 0.0),
                                60+(planetDrone_3a*6),
                                80+(planetDrone_4a*6) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_4d*40), add: 0.0),
                                80+(planetDrone_2a*7),

			],inf))),

	              //roomsize: 300, revtime: 3, damping: 0.45, inputbw: 0.52, spread: 16, drylevel: -4, earlyreflevel: -3.25, taillevel: 0.75, maxroomsize: 305, mul: 0.5, add: 0)
                      roomsize:200, revtime:385, damping:0.5, inputbw:0.5, spread:50, drylevel:-4.0+(planetDrone_effect_1*4),
                      earlyreflevel:-3.2+(planetDrone_effect_2*4), taillevel:0.9+(planetDrone_effect_3*1.25))                       

		}.play;

        s.volume = -95;

	)

}

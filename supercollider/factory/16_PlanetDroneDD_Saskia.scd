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
                           "SPOKEN_1.wav",
                           "ASMR_1__ASMR_GLOW.wav",
                           "ASMR_2__ASMR_PLANET.wav",
                           "ASMR_3__ASMR_MISS_MI.wav",
                           "ASMR_4__ASMR_GLOW.wav",
                           "ASMR_5__GentleWhispering.wav"
                        ];

                        b=Buffer.read(s, Platform.resourceDir +/+ "sounds/ambient/"+/+~loopsArray[6.rand],2);                         

			GVerb.ar(

			t=Impulse.kr(3);

			PlayBuf.ar(2,b,1+SinOsc.ar(freq: 0.0145, phase: 0.0, mul: planetDrone_1a*0.75,add: 0.0),t,Demand.kr(t,0,Dseq(1e4*[
				30+(planetDrone_2a*70) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_1d*35), add: 0.0),
				43+(planetDrone_3a*72),
				62+(planetDrone_4a*85) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_2d*40), add: 0.0),
				25+(planetDrone_2a*65),
				41+(planetDrone_1b*75) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_3d*55), add: 0.0),
				54+(planetDrone_2b*60),
				34+(planetDrone_3b*80) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_4d*35), add: 0.0),
				93+(planetDrone_4b*90),
				15+(planetDrone_1c*14) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_1d*40), add: 0.0),
				74+(planetDrone_2c*75),
				65+(planetDrone_3c*70) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_2d*35), add: 0.0),
				83+(planetDrone_4c*75),
                                35+(planetDrone_2a*72) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_1d*35), add: 0.0),
                                47+(planetDrone_3a*78),
                                67+(planetDrone_4a*45) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_2d*40), add: 0.0),
                                40+(planetDrone_2a*25),

                                63+(planetDrone_2a*20) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_3d*65), add: 0.0),
                                90+(planetDrone_3a*54),
                                42+(planetDrone_4a*76) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_4d*40), add: 0.0),
                                20+(planetDrone_2a*32),
                                27+(planetDrone_1b*96) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_1d*55), add: 0.0),
                                84+(planetDrone_2b*51),
                                22+(planetDrone_3b*81) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_2d*55), add: 0.0),
                                49+(planetDrone_4b*23),
                                20+(planetDrone_1c*12) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_3d*44), add: 0.0),
                                38+(planetDrone_2c*30),
                                77+(planetDrone_3c*99) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_4d*63), add: 0.0),
                                95+(planetDrone_4c*19),
                                73+(planetDrone_2a*22) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_3d*65), add: 0.0),
                                60+(planetDrone_3a*64),
                                62+(planetDrone_4a*86) + SinOsc.ar(freq: 0.025, phase: 0.0, mul: (planetDrone_4d*40), add: 0.0),
                                30+(planetDrone_2a*72),

			],inf))),

	              //roomsize: 300, revtime: 3, damping: 0.45, inputbw: 0.52, spread: 16, drylevel: -4, earlyreflevel: -3.25, taillevel: 0.75, maxroomsize: 305, mul: 0.5, add: 0)
                      roomsize:200, revtime:385, damping:0.5, inputbw:0.5, spread:50, drylevel:-4.0+(planetDrone_effect_1*4),
                      earlyreflevel:-3.2+(planetDrone_effect_2*4), taillevel:0.9+(planetDrone_effect_3*1.25))                       

		}.play;

        s.volume = -95;

	)

}

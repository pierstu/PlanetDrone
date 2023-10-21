s.waitForBoot{ 

"../OSCfunctions.scd".loadRelative;

SynthDef(\freeVerb2x2, { |out, mix = 0.3, room = 0.11, damp = 0.45, amp = 1.0|
    var signal;
    signal = In.ar(out, 2);
    ReplaceOut.ar(out,
        FreeVerb2.ar( // FreeVerb2 - true stereo UGen
            signal[0], // Left channel
            signal[1], // Right Channel
            mix, room, damp, amp
        )
    ); // same params as FreeVerb 1 chn version
}).add;

x = SynthDef("Planet Drone :: Test .scd",
    {
        arg hz=100,
        planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
        planetDrone_1b=0, planetDrone_2b=0, planetDrone_3b=0, planetDrone_4b=0,
        planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
        var sig;

        sig = Mix.ar([
            Pan2.ar( BRF.ar( Pulse.ar(
                freq: hz+50+(planetDrone_1a*450) + (planetDrone_effect_2 * 350) + (SinOsc.ar(0.075)*(planetDrone_effect_3*8)),
                width: SinOsc.ar(0.005*(planetDrone_1b*200))+0.25,
                mul: 1.7,
            ), 2000+(planetDrone_effect_1*200)-(SinOsc.ar(0.15)*1100),0.5,1.0,0.0) ,SinOsc.ar(0.015)-0.5),
            Pan2.ar( BRF.ar( Pulse.ar(
                freq: hz+123+(planetDrone_2a*450) + (planetDrone_effect_2 * 350) - (SinOsc.ar(0.05)*(planetDrone_effect_3*8)),
                width: SinOsc.ar(0.012*(planetDrone_2b*100))+0.25,
                mul: 1.8,
            ), 2000+(planetDrone_effect_1*200)-(SinOsc.ar(0.08)*1100),0.5,1.0,0.0) ,SinOsc.ar(0.055)),
            Pan2.ar( BRF.ar( Pulse.ar(
                freq: hz-27+(planetDrone_3a*450) + (planetDrone_effect_2 * 350) + (SinOsc.ar(0.075)*(planetDrone_effect_3*8)),
                width: SinOsc.ar(0.0005*(planetDrone_3b*500))+0.25,
                mul: 1.9,
            ), 2000+(planetDrone_effect_1*200)-(SinOsc.ar(0.02)*1100),0.5,1.0,0.0) ,SinOsc.ar(0.15)-0.5),
            Pan2.ar( BRF.ar( Pulse.ar(
                freq: hz-13+(planetDrone_4a*450) + (planetDrone_effect_2 * 350) - (SinOsc.ar(0.05)*(planetDrone_effect_3*8)),
                width: SinOsc.ar(0.0005*(planetDrone_4b*50))+0.25,
                mul: 2.0,
            ), 2000+(planetDrone_effect_1*200)-(SinOsc.ar(0.005)*1100),0.5,1.0,0.0) ,SinOsc.ar(0.005))
        ]);

        // spread the signal


        sig = DFM1.ar(sig, 6200, 0.35);

        sig = Greyhole.ar(sig,delayTime:0.25+abs(planetDrone_effect_1));

        sig = Splay.ar(sig);

        // make sound!
        Out.ar(0,sig);
        s.sync;
        z = Synth(\freeVerb2x2, [\outbus, 0], addAction:\addToTail);

    }

).play;

s.volume = -95;

}

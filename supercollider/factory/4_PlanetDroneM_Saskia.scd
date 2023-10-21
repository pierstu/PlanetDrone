s.waitForBoot{


 "../OSCfunctions.scd".loadRelative;

	(

         ~buf = Buffer.alloc(s, s.sampleRate * 5);

		x = {

			arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0, planetDrone_effect_1, planetDrone_effect_2, planetDrone_effect_3;

			var trig, freq;
			var dry, snd, phase, iois;
			var cumulDelay;
			var decayFactor, lpfCutoff, numEchoes, ioiScale, ioiDecayFactor;

			// play with these!
			decayFactor = 0.65;
			lpfCutoff = 1000;
			numEchoes = 12;
			ioiScale = 0.25;
			ioiDecayFactor = 0.75;

			// example input -- you can substitute other stuff here
			trig = Dust.ar(1);
			dry = Pulse.ar(100 * TIRand.ar(1, 12, trig));
			dry = dry * Decay2.ar(trig, 0.01 + abs(planetDrone_3a*4), 0.2 + abs(planetDrone_4a*2));

			phase = DelTapWr.ar(~buf, dry);
			iois = Array.geom(numEchoes, ioiScale, ioiDecayFactor);
			cumulDelay = iois.sum;
			(cumulDelay > ~buf.duration).if {
				Error("use a larger buffer").throw;
			};
			snd = Silent.ar;

			iois.reverse.do { |ioi|
				snd = (snd + DelTapRd.ar(~buf, phase, cumulDelay + (planetDrone_2a*2) , interp: 4)) * (decayFactor + (planetDrone_1a*0.25));
				// one-pole lowpass -- LPF was too aggressive
				snd = OnePole.ar(snd, lpfCutoff / SampleRate.ir);
				cumulDelay = cumulDelay - ioi;
			};



                        

			snd = FreqShift.ar(  FreeVerb.ar(  snd + dry  , mix:  abs(planetDrone_effect_1), room: abs(planetDrone_effect_2), damp:  0.25, mul: 1.0, add: 0.0)

                         , abs(planetDrone_effect_3*8)/(4..16));

			snd * 0.5!2;
		}.play;

        s.volume = -95;

	)

}

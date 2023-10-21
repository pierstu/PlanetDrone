(

var pd_1a = 0, pd_3a = 0, pd_4a = 0;
var slcrSpeedLim = SpeedLim(0.1, {
	Ndef(\out)[0] = ~slcr.(buf: ~buf, beats: 4, beatDiv: 2+pd_4a, sliceProducer: ~sliceProducer, amp: 1);
	//"slcr".debug;
});

x = Environment(know: true).putAll((
	set: { |self, key, value|
		self[key].value(value)
	},

	planetDrone_1a: { |value|
		TempoClock.default.tempo_(0.5 + value);
		pd_1a = value;
		slcrSpeedLim.value;
	},

	planetDrone_2a: { |value|
                value = value*4;
		~attack = 4 + value;
	},

	planetDrone_3a: { |value|
                value = value*2;
		~release = 2 + value;
    },

	planetDrone_4a: { |value|
		pd_4a = value;
		slcrSpeedLim.value;
	},


	planetDrone_effect_1: { |value|
		Ndef(\out).set(\pd_fx1, value);
	},

	planetDrone_effect_2: { |value|
		Ndef(\out).set(\pd_fx2, value);
	},

	planetDrone_effect_3: { |value|
		Ndef(\out).set(\pd_fx3, value);
	},
));


s.waitForBoot{

        "../OSCfunctions.scd".loadRelative;

	SynthDef(\smplr_m3, {arg startPos = 0, buf, rate = 1, loop = 1,
		atk = 4.0, rel = 2.0, curve = 0, dur = 0.0,
		amp = 0.6, out = 0, pan = 0;

		var env, sig;
		env= Env([0,1,1,0], [atk, dur-atk-rel, rel], curve).ar(doneAction:2);
		sig = PlayBuf.ar(numChannels: 2, bufnum: buf, rate: BufRateScale.kr(buf) * rate, startPos: startPos, loop: loop);
		sig = sig * env * amp;
		OffsetOut.ar(out, Pan2.ar(sig, pan));

	}).add;

	s.sync;


	// Logic for providing slices to the queue
	~sliceProducer = {arg count, slices, beats, queue;

		var pos = count % beats;
		var delta = (slices/beats).reciprocal;
		var slice = (count/delta % slices);
		var event = (delta:delta, slice:slice);
		var rem = (beats - pos);

		if (0.2.coin && (rem <= 1) ) {

			var div = delta/2;
			var event = (delta:div, slice:slice);
			2.do({
				queue.add(event);
			});
		} {
			if (pos == 0) {
				event[\slice] = 0;
				queue.add(event);
			} {
				event[\slice] = (0..slices-1).choose;
				queue.add(event);
			}
		};
	};


	// main interface
	~slcr = { arg buf, beats = 8, beatDiv = 2, sliceProducer, amp = 0.25, clock = TempoClock.default;

		// buffer info
		var numFrames = buf.numFrames;
		var sampleRate = buf.sampleRate;

		// length in seconds of sample
		var len = numFrames/sampleRate;

		// beats per second
		var bps = beats/len;

		// number of slices
		var slices = beats * beatDiv;

		// frames per slice
		var fps = numFrames/slices;

		// yields slice data to the pattern
		var rtn = Routine({

			var queue = LinkedList.new;
			var count = 0;

			inf.do({arg i;

				var event;

				if (queue.isEmpty) {
					sliceProducer.value(count, slices, beats, queue);
				};

				event = queue.popFirst;
				count = count + event[\delta];
				[event[\delta], event[\slice] * fps].yield;
			});
		});

		// return the pattern
		Pbind(\instrument, \smplr_m3,
			[\delta, \startPos], rtn,
			\buf, buf,
			\rate, Pfunc({ clock.tempo }) / bps,
			\amp, amp,
			\dur, Pfunc({ clock.beatDur }) * Pkey(\delta),
			\rel, Pfunc({ ~release }),
			\atk, Pfunc({ ~attack })
		);
	};

        ~loopsArray = [
        "ORCHESTRAL 1 PROMO 09.wav",
        "GS_HEBE_172_G_KEYS_HORIA.wav",
        "GS_HEBE_172_Fm_KEYS_EVRIHIKA.wav",
        "GS_HEBE_172_Am_KEYS_TITHONOS.wav",
        "GS_HEBE_172_Am_KEYS_AFINHA.wav"
        ];

        ~buf = Buffer.read(s, Platform.resourceDir +/+ "sounds/beats/3/"+/+~loopsArray[5.rand]); // [x.rand]
        // NOTE: in  'x.rand', x is the total number of elements in the array
        // set x to 0 to force the load of the first element

	~release = 0;  // just need non-nil, it's initialized below

	Ndef(\out).clear;
	Ndef(\out).play;

	s.sync;

	Ndef(\out)[0] = ~slcr.(buf: ~buf, beats: 4, beatDiv: 2, sliceProducer: ~sliceProducer, amp: 1);

	s.sync;
	Ndef(\out)[10] = \filter -> { arg in, pd_fx1 = 0, pd_fx2 = 0, pd_fx3 = 0;
		FreqShift.ar(
			FreeVerb.ar(in, 0.1 + abs(pd_fx1), 0.1 + abs(pd_fx2)),
			(0 + (pd_fx3*75)) / (4..10)
		);
	};

	s.sync;

	x.set(\planetDrone_1a,0);         // INIT Tempo
	x.set(\planetDrone_2a,0);         // INIT Attack
	x.set(\planetDrone_3a,0);         // INIT Release
	x.set(\planetDrone_4a,0);         // INIT Beat Division
	x.set(\planetDrone_effect_1,0);   // INIT Room
	x.set(\planetDrone_effect_2,0);   // INIT Damp
	x.set(\planetDrone_effect_3,0);   // INIT Freq

};

s.volume = -95;

)

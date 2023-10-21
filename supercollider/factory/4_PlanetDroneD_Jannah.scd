~my_routine_data = { // makes data
	var out = (
		\group: Group.basicNew(s,1),
		\stereoBuffer1L: Buffer.alloc(s, s.sampleRate*8, 1),
		\stereoBuffer1R: Buffer.alloc(s, s.sampleRate*8, 1),
		\monoBuffer1: Buffer.alloc(s, s.sampleRate*8, 1)
	);
	s.sync;
	out
};

~launch_my_routine = { // uses data
	|data|
	var rootPitch=36; // Start on a C
	var stopTranspose = 0;									
	var transposeCount = 10;
        var thisRatio = [0.25, 0.5, 0.75, 1, 1.125, 1.333333, 1.5, 1.6875, 2, 2.25, 2.6666666, 3, 3.375, 4, 5];
	var thisPitch;
		
	var d = Synth.tail(data[\group], \StereoModDelay);
        var q = Synth.tail(data[\group], \phaseFilter);
	s.sync;
	
        data[\stereoBuffer1L].zero;
	data[\stereoBuffer1R].zero;
	
	d.set(\bufferL, data[\stereoBuffer1L]);
	d.set(\bufferR, data[\stereoBuffer1R]);

        q.set(\bufferL, data[\stereoBuffer1L]);
        q.set(\bufferR, data[\stereoBuffer1R]);
	
	thisPitch = thisRatio.choose*rootPitch.midicps;
	
	//First few notes have a slow attack and longer interval
	{4.do
		{ 
		Synth.head(g, \ChMach,
			[\f, thisPitch,
			\width, rrand(0,1),
			\pan, rrand(-1,1),
			\aTime, rrand(3,6),
			\rTime, rrand(4,7),
			\filter, rrand(4,10),
			\filterQ, rrand(0,3.7), 
			\modFreq, rrand(0.7,1.5)]);
		  rrand(1,3).wait;
		}
	};
	  
	//Pick a note from the pentatonic scale with somewhat random settings
	//and slowly noodle around the circle of fifths
	{inf.do 
		{
		thisPitch = thisRatio.choose*rootPitch.midicps;
		stopTranspose = stopTranspose + 1;
		Synth.head(g, \ChMach,
			[\f, thisPitch,
			\width, rrand(0,1),
			\pan, rrand(-1,1),
			\aTime, rrand(0.01,8),
			\rTime, rrand(2,6),
			\filter, rrand(3,9),
			\filterQ, rrand(0,3.7), 
			\modFreq, rrand(0.7,1.5)]);
		if ((0.04.coin) && (stopTranspose > transposeCount)) {
			stopTranspose = 0;
			rootPitch = rootPitch + 7;
			if (rootPitch > 47) {rootPitch = rootPitch - 12};
			// rootPitch.postln; // Display Root Pitch
			};	
		   rrand(0.1,2).wait;
		   }
	}.fork;

};


(
s.waitForBoot {
        "support_files/4_PlanetDroneD_Support_OSC.scd".loadRelative;
	"patches/support_files/4_PlanetDroneD_Support.scd".load;
	s.sync; 
	
        x = Synth(\StereoModDelay,[\planetDrone_1a, 0,\planetDrone_2a, 0,\planetDrone_3a, 0,\planetDrone_4a, 0]);
        y = Synth(\phaseFilter,[\planetDrone_effect_1, 0,\planetDrone_effect_2, 0,\planetDrone_effect_3, 0]);

	~launch_my_routine.(~my_routine_data.());

        s.volume = -95;
})

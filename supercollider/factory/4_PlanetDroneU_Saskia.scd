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

	var src, loc, delay=0.01+(planetDrone_2a*0.012),
	    src2, loc2, del2,
	    src3, loc3, del3=1/4;

	src = Decay2.ar(Impulse.ar(1/8), LFNoise2.kr(4).range(0.001,0.0001),
	LFNoise2.kr(4).range(0.005, 0.05))!2
	* Saw.ar(LFNoise2.kr(4).exprange(40, 3000));
	loc = BPF.ar(LocalIn.ar(2) + [src, 0], LFNoise0.kr(1/4).range(10,907).lag, 3.2);
	loc = GVerb.ar(loc, 100, 4, mul:0.02+(planetDrone_1a*6), add:loc);
	loc = Compander.ar(loc, loc, 0.9, 1, 0.001);
	loc = (loc * 0.501).tanh;
	loc = Compander.ar(loc, loc, 0.1, 1, 0.1);
	loc = DelayC.ar(loc, delay * 2, delay * 1);
	LocalOut.ar(loc.reverse * (0.49 + (planetDrone_effect_1*0.5)));
	Out.ar(0, loc * 0.9);

	del2 = 1/100;
	src2 = Decay2.ar(TDuty.ar(1/4,0,Dseq([1, 0.5, 003, 0.1+(planetDrone_4a*1000)],inf)),
	LFNoise2.kr(4).range(0.001, 0.0001), LFNoise2.kr(4).range(0.005, 0.05))!2
	* Saw.ar(LFNoise2.kr(200).exprange(40, 10000));
	loc2 = BPF.ar(LocalIn.ar(2) + [src2, 0], LFNoise2.kr(0.1).range(40, 400), 3.2);
	loc2 = GVerb.ar(loc2, 100, 4, mul:0.02+(planetDrone_3a*6), add:loc2);
	loc2 = Compander.ar(loc2, loc2, 0.9, 1, 0.001);
	loc2 = (loc2 * 0.51).tanh;
	loc2 = Compander.ar(loc2, loc2, 0.1, 1, 0.1);
	loc2 = DelayC.ar(loc2, del2 * 2, del2 * 1);
	LocalOut.ar(loc2.reverse * (0.45 + (planetDrone_effect_2*100)));
	Out.ar(0, Compander.ar(loc2,loc2,0.1, 1, 0.05) * 0.75);

	src3 = Decay2.ar(Impulse.ar(1), 0.0001, 0.05) * SinOsc.ar(60);
	loc3 = src3 + LocalIn.ar(2);
	loc3 = BPF.ar(loc3, 800, 3.2).softclip;
	loc3 = DelayN.ar(loc3, del3, [0, del3]);
	LocalOut.ar(loc3.reverse * (0.99 + (planetDrone_effect_3*0.75)));
	Out.ar(0, loc * 2)
   }.play;

  s.volume = -95;

 )

}

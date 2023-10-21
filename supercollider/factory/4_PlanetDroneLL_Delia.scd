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

      var output, filtFreq, noise, noiseAmp, amp = 0.4, chain;
      var tardRate = 0.36+(planetDrone_1a*4), combs;

      FreqShift.ar(

       FreeVerb.ar(


	noiseAmp = SinOsc.kr(0.38, 0.2).exprange(0.1, 1);

	noise = BrownNoise.ar(noiseAmp);

	filtFreq = SinOsc.kr(tardRate+(planetDrone_4a*10)).range(400, 1800+(planetDrone_3a*2500));
	noise = RLPF.ar(noise, filtFreq, 0.7);

	chain = FFT(LocalBuf(256), noise);
	chain = PV_BinShift(chain, SinOsc.kr(tardRate * 0.986, 0.7).range(0.96, 1.052), SinOsc.kr(tardRate * 1.003, 0.61).range(-3, 2.1));
	chain = PV_BinScramble(chain, 0.05, 0.1, 1.0 );
	noise = IFFT(chain);
	noise = noise.fold(-0.5, 0.5);
	combs = Mix(
		[
			CombL.ar(noise, 0.1, SinOsc.kr(tardRate * 0.9966, 0.1).range(0.00032, 0.00028) * 3.4 * abs(1+planetDrone_2a), 0.4, 0.06),
			CombL.ar(noise, 0.1, SinOsc.kr(tardRate * 0.99684, 0.1 ).range(0.000318, 0.000266) * 3.397, 0.4, 0.06)
		]
	) * 1.2;

      output = (noise + combs) * amp;
      output = HPF.ar(output, 80);
      output ! 2,

	0.1 + planetDrone_effect_1, 0.1 + planetDrone_effect_2),
         (0 + (planetDrone_effect_3*0.75)) / (2..8) )

   }.play;

  s.volume = -95;

 )

}

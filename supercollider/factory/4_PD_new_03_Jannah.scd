s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

(

x = {

   arg planetDrone_1a=0,   // 1A
   planetDrone_2a=0,       // 2A
   planetDrone_3a=0,       // 3A
   planetDrone_4a = 0,     // 4A
   planetDrone_effect_1=0, // EFF1
   planetDrone_effect_2=0, // EFF2
   planetDrone_effect_3=0, // EFF3
   hz=65.41, amp=0.5, amplag=0.02,hzlag=0.02;

   var amp_,hz_,sig;
   amp_ = Lag.ar(K2A.ar(amp),amplag);
   hz_ = Lag.ar(K2A.ar(hz),hzlag);

   sig = Mix.ar(
        VarSaw.ar(
            freq:hz_*Array.fill(3,{arg i;
                2**i * LinLin.kr(SinOsc.kr(LFNoise0.kr(1)), -1+abs(planetDrone_1a*1.125), 1-abs(planetDrone_2a*1.75), 0.99+(planetDrone_3a*0.0125) , 1.01+(planetDrone_4a*0.0125))
                }),
                mul:amp_*Array.fill(3,{arg i;(1/2)**i}),
                )
   );

	sig = Greyhole.ar(sig,delayTime:0.25+abs(planetDrone_effect_1));

	sig = DFM1.ar(sig, 600+(planetDrone_effect_2*450), 0.1+abs(planetDrone_effect_3*0.5));


        //sig = ComplexRes.ar(sig, freq: 100.0, decay: 0.2);
   

    sig = Splay.ar(sig);

}.play;

s.volume = -95;

)

}

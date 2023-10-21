s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

 (

  x = SynthDef("PlayBufPlayer", {
      arg out=0, bufnum=0, rate=1, start=0, end=1, t_trig=1, 
      planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0, 
      planetDrone_1b=0, planetDrone_2b=0, planetDrone_3b=0, planetDrone_4b=0,
      planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
      var snd,snd2,pos,pos2,frames,duration,env,loopsArray,lfo_a,lfo_b;
      var startA,endA,startB,endB,crossfade,aOrB;

      // Select a random loop ===================================================================
      loopsArray = [
      "Ac_JungleAmbiance.wav",
      "Desimal_dnbsamples_break27_168.wav",
      "DnB_LOOP37--08_160.wav",
      "04_Drone_Guitar_2.wav",
      "04_Reverse_Guitar_3.wav",
      "GWEN1.wav",
      "ZOOM0006_SNAP_00.wav",
      "rock_on_ice.wav",
      "f1.wav",
      "AaS_VerbProcA_110-03.wav",
      "Breathing.wav",
      "Toxic_Disturbance.wav",
      "Torment.wav",
      "Setinals.wav",
      "Hellcattle.wav",
      "Gimp.wav",
      "Critical_mass.wav",
      "Bar_Crowd_01.wav"
      ];
            
      b = Buffer.read(s, Platform.resourceDir +/+ "sounds/ambient/"+/+loopsArray[18.rand]); // [8.rand] 
      // NOTE: in  'x.rand', x is the total number of elements in the array
      // set x to 0 to force the load of the first element
      // ========================================================================================

      lfo_a = abs ( LFTri.kr(0.025+abs(planetDrone_4b*0.025),0,1,0) * planetDrone_4a );
      //lfo_a.poll;
      lfo_b = abs ( LFTri.kr(0.025+abs(planetDrone_3b*0.025),0,1,0) * planetDrone_2b );
      //lfo_a.poll;

      // latch to change trigger between the two
      aOrB=ToggleFF.kr(t_trig);
      startA=Latch.kr(start,aOrB)   + (planetDrone_2a + lfo_a)/2.5;  
      endA=Latch.kr(end,aOrB)       - (planetDrone_3a + lfo_b)/2.5;
      startB=Latch.kr(start,1-aOrB) + (planetDrone_2a + lfo_a)/2.5; 
      endB=Latch.kr(end,1-aOrB)     - (planetDrone_3a + lfo_b)/2.5;
      crossfade=Lag.ar(K2A.ar(aOrB),0.75);

      rate = rate*BufRateScale.kr(bufnum) + (planetDrone_1a*3) + ( lfo_a * planetDrone_1b);
      frames = BufFrames.kr(bufnum);

      pos=Phasor.ar(
          trig:aOrB,
          rate:rate,
          start:(((rate>0)*startA)+((rate<0)*endA))*frames,
          end:(((rate>0)*endA)+((rate<0)*startA))*frames,
          resetPos:(((rate>0)*startA)+((rate<0)*endA))*frames,
      );
      snd=BufRd.ar(
          numChannels:1,
          bufnum:bufnum,
          phase:pos,
          interpolation:4,
      );

      // add a second reader
      pos2=Phasor.ar(
          trig:(1-aOrB),
          rate:rate,
          start:(((rate>0)*startB)+((rate<0)*endB))*frames,
          end:(((rate>0)*endB)+((rate<0)*startB))*frames,
          resetPos:(((rate>0)*startB)+((rate<0)*endB))*frames,
      );
      snd2=BufRd.ar(
          numChannels:2,
          bufnum:bufnum,
          phase:pos2,
          interpolation:4,
      );

      //Out.ar(out,FreeVerb.ar((crossfade*snd)+((1-crossfade)*snd2), mix:  abs(planetDrone_effect_1), room: abs(planetDrone_effect_2), damp:  0.25, mul: 1.0, add: 0.0))
      Out.ar(out,  FreqShift.ar(   FreeVerb.ar((crossfade*snd)+((1-crossfade)*snd2), mix:  abs(planetDrone_effect_1), room: abs(planetDrone_effect_2), damp:  0.25, mul: 1.0, add: 0.0)   , abs(planetDrone_effect_3*8)/(2..8))          )
      
       }).play(s, [\out, 0, \bufnum, b]);


  s.volume = -95;

 )

}

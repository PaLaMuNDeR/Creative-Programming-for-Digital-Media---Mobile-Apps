void loadMusic(){
  sample1 = maxim.loadFile("bd2.wav");
  sample1.volume(0.5);
  sample1.setLooping(false);
  sample2 = maxim.loadFile("sn2.wav");
  sample2.setLooping(false);
  sample2.volume(1);
  sample3 = maxim.loadFile("hh2.wav");
  sample3.volume(0.5);
  sample3.setLooping(false);
  sample4 = maxim.loadFile("sn2.wav");
  sample4.setLooping(false);
  
  ADrums = maxim.loadFile("congo_drum.wav");
  ADrums.setAnalysing(true);   
  ADrums.setLooping(true);

  ADrums2 = maxim.loadFile("Drum.wav");
  ADrums2.setAnalysing(true);
  ADrums2.setLooping(true);

  AGuitar = maxim.loadFile("Guitar.wav");
  AGuitar.setAnalysing(true);
  AGuitar.setLooping(true);

  ATamb = maxim.loadFile("Tambourine.wav");
  ATamb.setAnalysing(true);
  ATamb.setLooping(true);

  ATri = maxim.loadFile("triangle.wav");
  ATri.setAnalysing(true);
  ATri.setLooping(true);

  ATrump = maxim.loadFile("Trumpet.wav");
  ATrump.setAnalysing(true);
  ATrump.setLooping(true);
  }

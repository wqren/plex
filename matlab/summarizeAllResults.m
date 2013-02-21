function summarizeAllResults

colors={'b','g','r','c','m','y','k','w'};

test='svt'; % icdar or svt

switch test
  case 'icdar'
    cfgIcdar=globals(TRAINicdar_TESTicdar_cfg);
    cfgSynth1x=globals(TRAINsynth1x_TESTicdar_cfg);
    cfgSynth2x=globals(TRAINsynth2x_TESTicdar_cfg);
    cfgSynth4x=globals(TRAINsynth4x_TESTicdar_cfg);
    cfgSynth8x=globals(TRAINsynth8x_TESTicdar_cfg);
    cfgSynth16x=globals(TRAINsynth16x_TESTicdar_cfg);
    cfgSynth1000=globals(TRAINsynth1000_TESTicdar_cfg);
    
    % plot PR curves together
    figure(1); clf; hold on; title('ICDAR wordspotting performance');
    res=load(cfgSynth1x.resWordspot()); fs1x=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{1});
    res=load(cfgSynth2x.resWordspot()); fs2x=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{2});
    res=load(cfgSynth4x.resWordspot()); fs4x=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{3});
    res=load(cfgSynth8x.resWordspot()); fs8x=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{4});
    res=load(cfgSynth16x.resWordspot()); fs16x=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{5});
    res=load(cfgSynth1000.resWordspot()); fs1000=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{6});
    res=load(cfgIcdar.resWordspot()); fsIcd=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{7});
    legend({sprintf('1x-%.3f',fs1x),...
      sprintf('2x-%.3f',fs2x),...
      sprintf('4x-%.3f',fs4x),...
      sprintf('8x-%.3f',fs8x),...
      sprintf('16x-%.3f',fs16x),...
      sprintf('1000-%.3f',fs1000),...
      sprintf('Icd-%.3f',fsIcd)});
    
    % char classification
    res=load(cfgSynth1x.resCharClf()); fprintf('%s\n',res.msg3);
    res=load(cfgSynth2x.resCharClf()); fprintf('%s\n',res.msg3);
    res=load(cfgSynth4x.resCharClf()); fprintf('%s\n',res.msg3);
    res=load(cfgSynth8x.resCharClf()); fprintf('%s\n',res.msg3);
    res=load(cfgSynth16x.resCharClf()); fprintf('%s\n',res.msg3);
    res=load(cfgSynth1000.resCharClf()); fprintf('%s\n',res.msg3);
    res=load(cfgIcdar.resCharClf()); fprintf('%s\n',res.msg3);
    
    % char detection
    FS=zeros(7,36);
    res=load(cfgSynth1x.resCharDet()); FS(1,:)=res.fsc;
    res=load(cfgSynth2x.resCharDet()); FS(2,:)=res.fsc;
    res=load(cfgSynth4x.resCharDet()); FS(3,:)=res.fsc;
    res=load(cfgSynth8x.resCharDet()); FS(4,:)=res.fsc;
    res=load(cfgSynth16x.resCharDet()); FS(5,:)=res.fsc;
    res=load(cfgSynth1000.resCharDet()); FS(6,:)=res.fsc;
    res=load(cfgIcdar.resCharDet()); FS(7,:)=res.fsc;
    
    figure(2); clf; bar(FS','grouped'); 
    title('Fscores at 0.5 for character detection');
    legend({'1x','2x','4x','8x','16x','1000','Icd'});
    
  case 'svt'
    cfgIcdar=globals(TRAINicdar_TESTsvt_cfg);
    cfgSynth1x=globals(TRAINsynth1x_TESTsvt_cfg);
    cfgSynth2x=globals(TRAINsynth2x_TESTsvt_cfg);
    cfgSynth4x=globals(TRAINsynth4x_TESTsvt_cfg);
    cfgSynth8x=globals(TRAINsynth8x_TESTsvt_cfg);
    cfgSynth16x=globals(TRAINsynth16x_TESTsvt_cfg);
    cfgSynth1000=globals(TRAINsynth1000_TESTsvt_cfg);
    
        % plot PR curves together
    figure(1); clf; hold on; title('ICDAR wordspotting performance');
    res=load(cfgSynth1x.resWordspot()); fs1x=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{1});
    res=load(cfgSynth2x.resWordspot()); fs2x=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{2});
    res=load(cfgSynth4x.resWordspot()); fs4x=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{3});
    res=load(cfgSynth8x.resWordspot()); fs8x=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{4});
    res=load(cfgSynth16x.resWordspot()); fs16x=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{5});
    res=load(cfgSynth1000.resWordspot()); fs1000=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{6});
    res=load(cfgIcdar.resWordspot()); fsIcd=Fscore(res.xs,res.ys);
    plot(res.xs,res.ys,colors{7});
    legend({sprintf('1x-%.3f',fs1x),...
      sprintf('2x-%.3f',fs2x),...
      sprintf('4x-%.3f',fs4x),...
      sprintf('8x-%.3f',fs8x),...
      sprintf('16x-%.3f',fs16x),...
      sprintf('1000-%.3f',fs1000),...
      sprintf('Icd-%.3f',fsIcd)});
    
end
  
end
%  ========================================================================
% Main Code for THE PORTFOLIO CHANNEL OF CAPITAL FLOWS: A SOE APPROACH
% Montoro, C. & M. Ortiz (2020)
%==========================================================================
% Housekeeping
%========================
clear all
close all

% Delete previous results
%========================
% If these files are not there, MATLAB will issue some warnings.
delete GRAPH* EX* IRF* paramat* PEX* variance*

% Main Paramters (Price Frictions)
%==========================================================================
BBETA      = 0.98; % 0.995
RRSTAR     = 1/BBETA;
GGAMMAC    = 1; %3.3
GGAMMA     = 0.85;  %Between 0 and 3
CCHI       = 1.5; %1.5;
CCSTAR     = 1;
NNSTAR     = 0;
BCSTARSS   = 0;
GGAMMAD    = GGAMMAC;
EPSF       = 1.5; %1.5 % Higher than one
EPS        = 3; % ELasticity of substitution over varieties.
EPSH       = 1.5; %1.5
GGAMMAST   = 0.1;
MMBAR      = 1;
OOMEGA     = 0.01;
SSIGMA     = 1;
% Nominal rigidities parameters
TTHETAH    = 0.75;
TTHETAX    = 0.15;
MMU        = 1.1;
TAUX       = 0;
TAUH       = (EPS*GGAMMA - EPS + 1)/(EPS*GGAMMA);
PPHIPI     = 1.5;   
PPHIY      = 0.5;
RRHOI      = 0;
RHOA       = 0.55;
RHOBCS     = 0;
RHONST     = 0.7;

% Investment parameters

DDELTA     = 0.1;
KKAPPA     = 0.05;
VVARTHETA  = 0.32;

% Commodities sector parmeters
% From MXN model (Schmitt-Grohé and Uribe)
AALPHAM = 0.35;
AALPHAN = 0.25;
AALPHAX = 0.35;
CCHITAU = 0.4360;
CCHIM = 08980;
MMUTAUN = 0.5;
MMUMX = 1;
SSIGMA = 2;

% Switch shock parameters
STD_PSI    = 1; %SWITCH
STD_A      = 0.0129;
STD_MON    = 1;

save PARAM_M1 BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A STD_MON TAUH; 
save PARAM_M0 BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A STD_MON TAUH; 

save PARAM_M1B BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A; 
save PARAM_M0B BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A; 

save PARAM_M1C BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A; 
save PARAM_M0C BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A; 

save PARAM_M1D BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A STD_MON TTHETAH TTHETAX MMU TAUX TAUH;
save PARAM_M0D BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A STD_MON TTHETAH TTHETAX MMU TAUX TAUH; 

save PARAM_M1E BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A DDELTA KKAPPA VVARTHETA; 
save PARAM_M0E BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A DDELTA KKAPPA VVARTHETA; 

save PARAM_M1F BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A DDELTA KKAPPA VVARTHETA; 
save PARAM_M0F BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A DDELTA KKAPPA VVARTHETA; 

save PARAM_M1G BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A DDELTA KKAPPA AALPHAM AALPHAN AALPHAX CCHITAU CCHIM MMUTAUN MMUMX SSIGMA; 
save PARAM_M0G BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A DDELTA KKAPPA AALPHAM AALPHAN AALPHAX CCHITAU CCHIM MMUTAUN MMUMX SSIGMA; 

%% ========================================================================
% MAIN MODEL
% =========================================================================
% We want to loop over parameters at least obtain 5 values for each parameter
% First rest original parameters

MODEL_TYPE = 1;
WELFARE = 0;

if WELFARE == 1
    GGAMMAC  = 1;
end
   

% Model types
% -----------
% 1. NK DSGE HF FLEX PRICE
% 2. NK DSGE HF PRICE FRICTIONS
% 3. SOE RBC HMX
% 4. NK DSGE HMX
% 5. SOE RBC + INVESTMENT
% 6. SOE RBC + COMMODITY SECTOR + NT (MXN)
% 7. NK DSGE PTM/P2P
% 8. RBC + FINACC
% 10. NK DSGE + FINACC

if MODEL_TYPE == 1   % NK DSGE HF FLEX PRICE
    
    save PARAM_M1 BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A STD_MON TAUH;
    
    LTLTSS      = GGAMMA^(1/(1+CCHI));
    CSTCSTSS    = LTLTSS;
    CTCTSS      = CSTCSTSS;
    PHPHSS      = 1;
    QTQTSS      = 1;
    LAMBDASS    = 1;
    TOTOTSS     = 1;
    STSTSS      = QTQTSS;
    DSTDSTSS    = 0;
    RSTRSTSS    = 1/BBETA;
    PTPTSS      = 1;
    NSTNSTSS    = 0;
    BCBBCBSS    = 0;
    AASS        = 1;
    NXNXSS      = 0;
    CACASS      = 0;
    RTRTSS      = 1/BBETA;
    WTWTSS      = LTLTSS^(1+CCHI);
    MCHMCHSS    = WTWTSS/AASS;
    CHCHSS      = GGAMMA*CTCTSS;
    CFCFSS      = (1-GGAMMA)*CTCTSS;
    XTXTSS      = (1-GGAMMAST)*CSTCSTSS;
    YHYHSS      = CHCHSS + CFCFSS;
    PFPFSS      = STSTSS;
    
    save PARAM_SS1 LTLTSS CSTCSTSS CTCTSS PHPHSS QTQTSS LAMBDASS TOTOTSS STSTSS DSTDSTSS RSTRSTSS PTPTSS NSTNSTSS BCBBCBSS AASS NXNXSS CACASS RTRTSS WTWTSS MCHMCHSS CHCHSS CFCFSS XTXTSS YHYHSS PFPFSS;
    dynare MODEL1NL.mod
    save inputg oo_ M_;
    
end

if MODEL_TYPE == 3 % RBC HF
    
    save PARAM_M1 BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A;
    
    syms ctctsim rtrtsim wtwtsim yhyhsim phphsim...
        cmcmsim pmpmsim cstcstsim pstpstsim xtxtsim...
        pxpxsim ptptsim ststsim dstdstsim yintyintsim...
        aasim ltltsim mcmcsim chchsim yxyxsim...
        ymymsim btbtsim nstnstsim bcsbcssim ccasim...
        nxnxsim rstrstsim;
    
    % STRATEGY: SOLVE THE WHOLE MODEL IN MATLAB (REPLICATE STEPS DONE IN LATEX)
    
    d1 = rtrtsim - 1/BBETA;
    d2 = ltltsim^CCHI * ctctsim^GGAMMAC - wtwtsim/ptptsim;
    d3 = chchsim - GGAMMA*(phphsim/ptptsim)^-EPSH *ctctsim;
    d4 = cmcmsim - (1-GGAMMA)*(pmpmsim/ptptsim)^-EPSH *ctctsim;
    d5 = xtxtsim - (1-GGAMMAST)*(pxpxsim/pstpstsim)^-EPSF *cstcstsim;
    d6 = ptptsim - (GGAMMA*(phphsim^(1-EPSH)) + (1-GGAMMA)*(pmpmsim^(1-EPSH)))^(1/(1-EPSH));
    d7 = - rstrstsim + rtrtsim - (OOMEGA/MMBAR)*(SSIGMA^2)*dstdstsim;
    d8 = yintyintsim-aasim*ltltsim;
    d9 = mcmcsim - wtwtsim/(ptptsim*aasim);
    d10 = phphsim - (EPS/(EPS-1))*ptptsim*mcmcsim;
    d12 = pmpmsim - ststsim*pstpstsim;
    d13 = chchsim - yhyhsim;
    d14 = xtxtsim - yxyxsim;
    d15 = cmcmsim - ymymsim;
    d16 = yintyintsim - yhyhsim - yxyxsim;
    d17 = - btbtsim + ststsim*nstnstsim + ststsim*bcsbcssim + ststsim*dstdstsim;
    d18 = ccasim;
    d19 = - ccasim + nxnxsim + ststsim*(rstrstsim-1)*(dstdstsim + bcsbcssim) - (rtrtsim-1)*ststsim*nstnstsim ;
    d20 = - nxnxsim + phphsim*yhyhsim + ststsim*pxpxsim*yxyxsim - ptptsim*ctctsim ;
    d21 = aasim - 1;
    d22 = bcsbcssim - BCSTARSS;
    d23 = nstnstsim - NNSTAR;
    d24 = pstpstsim - 1;
    d25 = cstcstsim - 1;
    d26 = ptptsim - 1;
    d27 = rstrstsim - RRSTAR;
    
    for j= 1:2
        
        rtrtsim    = 1/BBETA;  % d1
        rstrstsim  = RRSTAR;   % d27
        ccasim     = 0;        % d18
        aasim      = 1;        % d21
        bcsbcssim  = BCSTARSS; % d22
        nstnstsim  = NNSTAR;   % d23
        pstpstsim  = 1;        % d24
        cstcstsim  = 1;        % d25
        ptptsim    = 1;        % d26
        yhyhsim    = chchsim;     % d13
        yxyxsim    = xtxtsim;     % d14
        ymymsim    = cmcmsim;     % d15
        yintyintsim = yhyhsim + yxyxsim;                                     % d16
        ltltsim     = yintyintsim/aasim;                                     % d8
        wtwtsim    = (ltltsim^CCHI * ctctsim^GGAMMAC)*ptptsim;                  % d2
        cmcmsim    = (1-GGAMMA)*(pmpmsim/ptptsim)^-EPSH *ctctsim;               % d4
        xtxtsim    = (1-GGAMMAST)*(pxpxsim/pstpstsim)^-EPSF *cstcstsim;           % d5
        mcmcsim    = wtwtsim/(ptptsim*aasim);                                   % d9
        phphsim    = (EPS/(EPS-1))*ptptsim*mcmcsim;                          % d10
        pmpmsim     = ststsim*pstpstsim;                                     % d12
        btbtsim     = ststsim*nstnstsim + ststsim*bcsbcssim + ststsim*dstdstsim;         % d17
        dstdstsim   = - (rstrstsim - rtrtsim)/((OOMEGA/MMBAR)*(SSIGMA^2));   % d7
        nxnxsim     = phphsim*yhyhsim + ststsim*pxpxsim*yxyxsim - ptptsim*ctctsim;          % d20
        
        eval(d1)
        eval(d27)
        eval(d18)
        eval(d21)
        eval(d22)
        eval(d23)
        eval(d24)
        eval(d25)
        eval(d26)
        eval(d13)
        eval(d14)
        eval(d15)
        eval(d2)
        eval(d4)
        eval(d5)
        eval(d9)
        eval(d10)
        eval(d12)
        eval(d16)
        eval(d8)
        eval(d17)
        eval(d7)
        eval(d20)
        
    end
    
    d6 = ptptsim - (GGAMMA*(phphsim^(1-EPSH)) + (1-GGAMMA)*(pmpmsim^(1-EPSH)))^(1/(1-EPSH));
    d19 = - ccasim + nxnxsim + ststsim*(rstrstsim-1)*(dstdstsim + bcsbcssim) - (rtrtsim-1)*ststsim*nstnstsim ;
    d11 = ststsim*pxpxsim - (EPS/(EPS-1))*ptptsim*mcmcsim;
    d3 = chchsim - GGAMMA*(phphsim/ptptsim)^-EPSH *ctctsim;
    
    M1T_RES1 = [simplify(eval(d6)); simplify(eval(d19)); simplify(eval(d3)); simplify(eval(d11))];
    
    % Three variables but st, ch, ct
    
    x0 = [1, 1, 0.01, 1];
    myfun = @(x)STEADYM3(x, M1T_RES1);
    options = optimset('Display','iter','MaxFunEvals',20000,'MaxIter',20000,'TolFun',1e-10);
    x = fsolve(myfun,x0,options);
    
    ctctsim       = x(1);
    chchsim       = x(2);
    ststsim       = x(3);
    pxpxsim       = x(4);
    
    for h = 1:3
        
        rtrtsim    = 1/BBETA;  % d1
        rstrstsim  = RRSTAR;   % d27
        ccasim     = 0;        % d18
        aasim      = 1;        % d21
        bcsbcssim  = BCSTARSS; % d22
        nstnstsim  = NNSTAR;   % d23
        pstpstsim  = 1;        % d24
        cstcstsim  = 1;        % d25
        ptptsim    = 1;        % d26
        yhyhsim    = chchsim;     % d13
        yxyxsim    = xtxtsim;     % d14
        ymymsim    = cmcmsim;     % d15
        yintyintsim = yhyhsim + yxyxsim;                                     % d16
        ltltsim     = yintyintsim/aasim;                                     % d8
        wtwtsim    = (ltltsim^CCHI * ctctsim^GGAMMAC)*ptptsim;                  % d2
        cmcmsim    = (1-GGAMMA)*(pmpmsim/ptptsim)^-EPSH *ctctsim;               % d4
        xtxtsim    = (1-GGAMMAST)*(pxpxsim/pstpstsim)^-EPSF *cstcstsim;           % d5
        mcmcsim    = wtwtsim/(ptptsim*aasim);                                   % d9
        phphsim    = (EPS/(EPS-1))*ptptsim*mcmcsim;                          % d10
        pmpmsim     = ststsim*pstpstsim;                                     % d12
        btbtsim     = ststsim*nstnstsim + ststsim*bcsbcssim + ststsim*dstdstsim;         % d17
        dstdstsim   = - (rstrstsim - rtrtsim)/((OOMEGA/MMBAR)*(SSIGMA^2));   % d7
        nxnxsim     = phphsim*yhyhsim + ststsim*pxpxsim*yxyxsim - ptptsim*ctctsim;          % d20
        r1r1     = rstrstsim;
        
    end
    
    RTRTSS      = rtrtsim;
    RTSRTSSS    = RRSTAR;
    CCASS       = 0;
    AASS        = 1;
    BCSBCSSS    = BCSTARSS;
    NSTNSTSS    = NNSTAR;
    PSTPSTSS    = 1;
    CSTCSTSS    = 1;
    PTPTSS      = 1;
    YHYHSS      = yhyhsim;
    YXYXSS      = yxyxsim;
    YMYMSS      = ymymsim;
    YINTYINTSS  = yintyintsim;
    LTLTSS      = ltltsim;
    WTWTSS      = wtwtsim;
    CMCMSS      = cmcmsim;
    XTXTSS      = xtxtsim;
    MCMCSS      = mcmcsim;
    PHPHSS      = phphsim;
    PMPMSS      = pmpmsim;
    BTBTSS      = btbtsim;
    DSTDSTSS    = dstdstsim;
    NXNXSS      = nxnxsim;
    R1R1SS      = r1r1;
    STSTSS      = ststsim;
    CTCTSS      = ctctsim;
    CHCHSS      = chchsim;
    PXPXSS      = pxpxsim;
    
    
    save PARAM_SS RTRTSS RTSRTSSS CCASS AASS BCSBCSSS NSTNSTSS PSTPSTSS CSTCSTSS PTPTSS YHYHSS YXYXSS YMYMSS YINTYINTSS LTLTSS WTWTSS CMCMSS XTXTSS MCMCSS PHPHSS PMPMSS BTBTSS DSTDSTSS NXNXSS R1R1SS STSTSS CTCTSS PXPXSS CHCHSS CMCMSS;
    
    dynare MODEL3.mod
    
    save inputg oo_ M_;
    MGRAPHS2AR('inputg', 'RBC');
    MGRAPHS2BR('inputg', 'RBC');
        
end


if MODEL_TYPE == 4   % NK DSGE HF
    
    save PARAM_M1B BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A STD_MON TTHETAH TTHETAX MMU TAUX TAUH;
    
    syms ctctsim rtrtsim wtwtsim yhyhsim ththsim...
        cmcmsim tmtmsim cstcstsim pistarsim xtxtsim...
        txtxsim pitpitsim ststsim dstdstsim yintyintsim...
        aasim ltltsim mcmcsim chchsim yxyxsim...
        ymymsim btbtsim nstnstsim bcsbcssim ccasim...
        nxnxsim rstrstsim vnvnsim vdvdsim pihpihsim...
        vnxvnxsim vdxvdxsim pixpixsim mchmchsim mcxmcxsim...
        deltahsim deltaxsim rerersim pimpimsim;
    
    d1 = rtrtsim/pitpitsim - 1/BBETA;
    d2 = ltltsim^CCHI * ctctsim^GGAMMAC - wtwtsim;
    d3 = yhyhsim - GGAMMA*(ththsim)^-EPSH *ctctsim;
    d4 = ymymsim - (1-GGAMMA)*(tmtmsim)^-EPSH *ctctsim;
    d5 = xtxtsim - (1-GGAMMAST)*(txtxsim)^-EPSF *cstcstsim;
    d6 = 1 - (GGAMMA*(ththsim^(1-EPSH)) + (1-GGAMMA)*(tmtmsim^(1-EPSH)))^(1/(1-EPSH));
    d7 = - rstrstsim + rtrtsim - (OOMEGA/MMBAR)*(SSIGMA^2)*dstdstsim;
    d8 = yintyintsim-aasim*ltltsim;
    d9 = mcmcsim - wtwtsim/(aasim);
    d10 = vnvnsim -  MMU*(ctctsim^-GGAMMAC)*yhyhsim*mchmchsim/((1 - TTHETAH * BBETA * (pihpihsim^-EPS)));
    d11 = vdvdsim - ctctsim^-GGAMMAC*yhyhsim/(1 - TTHETAH * BBETA * (pihpihsim^(EPS-1)));
    d12 =  - TTHETAH * (pihpihsim)^(EPS-1) + 1 - (1-TTHETAH)*(vnvnsim/vdvdsim)^(1-EPS);
    d13 = - mchmchsim + (1-TAUH)* mcmcsim / ththsim;
    d14 = vnxvnxsim - MMU*ctctsim^-GGAMMAC*yxyxsim*mcxmcxsim/(1 - TTHETAX * BBETA * (pixpixsim^-EPS));
    d15 = vdxvdxsim - ctctsim^-GGAMMAC*yxyxsim/(1 -  TTHETAX * BBETA * (pixpixsim^(EPS-1)));
    d16 =  - TTHETAX * (pixpixsim)^(EPS-1) + 1 - (1-TTHETAH)*(vnxvnxsim/vdxvdxsim)^(1-EPS);
    d17 = - mcxmcxsim + (1-TAUX)* mcmcsim / (rerersim * txtxsim);
    d18 = tmtmsim - rerersim;
    d19 = chchsim - yhyhsim;
    d20 = xtxtsim - yxyxsim;
    d21 = cmcmsim - ymymsim;
    d22 = yintyintsim - deltahsim * yhyhsim - deltaxsim * yxyxsim;
    d23 = btbtsim - rerersim*(nstnstsim + bcsbcssim + dstdstsim);
    d24 = ccasim;
    d25 = - ccasim + nxnxsim + rerersim*(rstrstsim-1)*(dstdstsim + bcsbcssim)/pistarsim + (rtrtsim-1)*rerersim*nstnstsim/pitpitsim ;
    d26 = - nxnxsim + ththsim*yhyhsim + rerersim*txtxsim*yxyxsim - ctctsim ;
    d27 = deltahsim - 1;
    d28 = deltaxsim - 1;
    d30 = pihpihsim - 1;
    d31 = pimpimsim - 1;
    d32 = aasim - 1;
    d33 = bcsbcssim - BCSTARSS;
    d34 = nstnstsim - NNSTAR;
    d35 = pistarsim - 1;
    d36 = cstcstsim - 1;
    d37 = rstrstsim - RRSTAR;
    d38 = pitpitsim -1;
    
    for KAPPA = 1:2
        dstdstsim = 0;
        pixpixsim = 1;
        deltahsim = 1;     % d27
        deltaxsim = 1;     % d28
        pihpihsim = 1;     % d30
        pimpimsim = 1;     % d31
        aasim = 1;         % d32
        tmtmsim   = ((1 - GGAMMA*ththsim^(1-EPSH))/(1-GGAMMA))^(1/(1-EPSH)); % d6
        bcsbcssim = BCSTARSS; % d33
        nstnstsim = NNSTAR; % d34
        pistarsim = 1; % d35
        cstcstsim = 1; % d36
        rstrstsim = RRSTAR; % d37
        pitpitsim = 1; % d38
        ccasim = 0; % d24
        rerersim = tmtmsim; % d18
        chchsim = yhyhsim; % d19
        xtxtsim = yxyxsim; % d20
        cmcmsim = ymymsim; % d21
        rtrtsim = pitpitsim/BBETA; % d1
        yintyintsim = aasim*ltltsim; % d8
        mcmcsim = wtwtsim/(aasim); % d9
        yhyhsim = GGAMMA*(ththsim)^-EPSH *ctctsim; % d3
        ymymsim = (1-GGAMMA)*(tmtmsim)^-EPSH *ctctsim; %d4
        wtwtsim = ltltsim^CCHI * ctctsim^GGAMMAC ; % d2
        yxyxsim = (1-GGAMMAST)*(txtxsim)^-EPSF *cstcstsim; %d5
        rstrstsim = rtrtsim - (OOMEGA/MMBAR)*(SSIGMA^2)*dstdstsim; % d7
        vnvnsim =  MMU*(ctctsim^-GGAMMAC)*yhyhsim*mchmchsim/((1 - TTHETAH * BBETA * (pihpihsim^-EPS))); % d10
        vdvdsim = ctctsim^-GGAMMAC*yhyhsim/(1 - TTHETAH * BBETA * (pihpihsim^(EPS-1))); % d11
        vnxvnxsim = MMU*ctctsim^-GGAMMAC*yxyxsim*mcxmcxsim/(1 - TTHETAX * BBETA * (pixpixsim^-EPS)); % d14
        vdxvdxsim = ctctsim^-GGAMMAC*yxyxsim/(1 -  TTHETAX * BBETA * (pixpixsim^(EPS-1))); % d15
        mchmchsim = (1-TAUH)* mcmcsim / ththsim; % d13
        mcxmcxsim = (1-TAUX)* mcmcsim / (rerersim * txtxsim); % d17
        btbtsim   = rerersim*(nstnstsim + bcsbcssim + dstdstsim); % d23
        nxnxsim   = ththsim*yhyhsim + rerersim*txtxsim*yxyxsim - ctctsim ; % d26
        
        eval(d27)
        eval(d28)
        eval(d30)
        eval(d31)
        eval(d32)
        eval(d33)
        eval(d34)
        eval(d35)
        eval(d36)
        eval(d37)
        eval(d38)
        eval(d24)
        eval(d18)
        eval(d19)
        eval(d20)
        eval(d21)
        eval(d1)
        eval(d8)
        eval(d9)
        eval(d3)
        eval(d4)
        eval(d2)
        eval(d5)
        eval(d7)
        eval(d10)
        eval(d11)
        eval(d14)
        eval(d15)
        eval(d13)
        eval(d17)
        eval(d23)
        eval(d26)
        eval(d6)
    end
    
    
    d22 = yintyintsim - deltahsim * yhyhsim - deltaxsim * yxyxsim;
    d25 = - ccasim + nxnxsim + rerersim*(rstrstsim-1)*(dstdstsim + bcsbcssim)/pistarsim + (rtrtsim-1)*rerersim*nstnstsim/pitpitsim ;
    d16 =  - TTHETAX * (pixpixsim)^(EPS-1) + 1 - (1-TTHETAH)*(vnxvnxsim/vdxvdxsim)^(1-EPS);
    d12 =  - TTHETAH * (pihpihsim)^(EPS-1) + 1 - (1-TTHETAH)*(vnvnsim/vdvdsim)^(1-EPS);
    
    M1T_RES1 = [simplify(eval(d22)); simplify(eval(d25)); simplify(eval(d16)); simplify(eval(d12))];
    
    % Four variables ctctsim, ltltsim, ththsim, txtxsim
    
    x0 = [2, 2, 2, 2];
    myfun = @(x)STEADYM4(x, M1T_RES1);
    options = optimset('Display','iter','MaxFunEvals',20000,'MaxIter',20000,'TolFun',1e-10);
    x = fsolve(myfun,x0,options);
    
    ctctsim       = x(1);
    ltltsim       = x(2);
    ththsim       = x(3);
    txtxsim       = x(4);
    
    for KOPPA = 1:3
        dstdstsim = 0;
        pixpixsim = 1;
        deltahsim = 1;     % d27
        deltaxsim = 1;     % d28
        pihpihsim = 1;     % d30
        pimpimsim = 1;     % d31
        aasim = 1;         % d32
        tmtmsim   = ((1 - GGAMMA*ththsim^(1-EPSH))/(1-GGAMMA))^(1/(1-EPSH)); % d6
        bcsbcssim = BCSTARSS; % d33
        nstnstsim = NNSTAR; % d34
        pistarsim = 1; % d35
        cstcstsim = 1; % d36
        rstrstsim = RRSTAR; % d37
        pitpitsim = 1; % d38
        ccasim = 0; % d24
        rerersim = tmtmsim; % d18
        chchsim = yhyhsim; % d19
        xtxtsim = yxyxsim; % d20
        cmcmsim = ymymsim; % d21
        rtrtsim = pitpitsim/BBETA; % d1
        yintyintsim = aasim*ltltsim; % d8
        mcmcsim = wtwtsim/(aasim); % d9
        yhyhsim = GGAMMA*(ththsim)^-EPSH *ctctsim; % d3
        ymymsim = (1-GGAMMA)*(tmtmsim)^-EPSH *ctctsim; %d4
        wtwtsim = ltltsim^CCHI * ctctsim^GGAMMAC ; % d2
        yxyxsim = (1-GGAMMAST)*(txtxsim)^-EPSF *cstcstsim; %d5
        rstrstsim = rtrtsim - (OOMEGA/MMBAR)*(SSIGMA^2)*dstdstsim; % d7
        vnvnsim =  MMU*(ctctsim^-GGAMMAC)*yhyhsim*mchmchsim/((1 - TTHETAH * BBETA * (pihpihsim^-EPS))); % d10
        vdvdsim = ctctsim^-GGAMMAC*yhyhsim/(1 - TTHETAH * BBETA * (pihpihsim^(EPS-1))); % d11
        vnxvnxsim = MMU*ctctsim^-GGAMMAC*yxyxsim*mcxmcxsim/(1 - TTHETAX * BBETA * (pixpixsim^-EPS)); % d14
        vdxvdxsim = ctctsim^-GGAMMAC*yxyxsim/(1 -  TTHETAX * BBETA * (pixpixsim^(EPS-1))); % d15
        mchmchsim = (1-TAUH)* mcmcsim / ththsim; % d13
        mcxmcxsim = (1-TAUX)* mcmcsim / (rerersim * txtxsim); % d17
        btbtsim   = rerersim*(nstnstsim + bcsbcssim + dstdstsim); % d23
        nxnxsim   = ththsim*yhyhsim + rerersim*txtxsim*yxyxsim - ctctsim ; % d26
        
    end
    
    THTHSS      = ththsim;
    TXTXSS      = txtxsim;
    YHYHSS      = yhyhsim;
    MCHMCHSS    = mchmchsim;
    VNVNSS      = vnvnsim;
    VDVDSS      = vdvdsim;
    YXYXSS      = yxyxsim;
    MCXMCXSS    = mcxmcxsim;
    VNXVNXSS    = vnxvnxsim;
    VDXVDXSS    = vdxvdxsim;
    CCSS        = ctctsim;
    YINTYINTSS  = yintyintsim;
    RERERSS     = rerersim;
    PISS        = pitpitsim;
    PISTARSS    = 1;
    RSS         = 1/BBETA;
    RSTARSS     = RRSTAR;
    
    save PARAM_SSB THTHSS TXTXSS YHYHSS MCHMCHSS VNVNSS VDVDSS YXYXSS MCXMCXSS VNXVNXSS VDXVDXSS CCSS YINTYINTSS RERERSS PISS  PISTARSS RSS RSTARSS;
    dynare MODEL4.mod
    
    % Here we save oo_ and M_ for graphs.
    
    save inputg oo_ M_;
    MGRAPHS2A('inputg', 'NK');
    MGRAPHS2B('inputg', 'NK');
    
end

if MODEL_TYPE == 5 % RBC + Investment
    
    save PARAM_M3 BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A DDELTA KKAPPA VVARTHETA;
    
    syms ctctsim rtrtsim wtwtsim yhyhsim phphsim...
        cmcmsim pmpmsim cstcstsim pstpstsim xtxtsim...
        pxpxsim ptptsim ststsim dstdstsim yintyintsim...
        aasim ltltsim mcmcsim chchsim yxyxsim...
        ymymsim btbtsim nstnstsim bcsbcssim ccasim...
        nxnxsim rstrstsim ztztsim ktktsim rktrktsim lambdatsim...
        zhtzhtsim zmtzmtsim; 
    
    % STRATEGY: SOLVE THE WHOLE MODEL IN MATLAB (REPLICATE STEPS DONE IN LATEX)
    
    d1 = rtrtsim - 1/BBETA;
    d2 = ltltsim^CCHI * ctctsim^GGAMMAC - wtwtsim/ptptsim;
    d3 = ztztsim - DDELTA * ktktsim;
    d4 = rktrktsim - (1/BBETA - 1 + DDELTA);
    d5 = chchsim - GGAMMA*(phphsim/ptptsim)^-EPSH *ctctsim;
    d6 = cmcmsim - (1-GGAMMA)*(pmpmsim/ptptsim)^-EPSH *ctctsim;
    d7 = zhtzhtsim - GGAMMA*(phphsim/ptptsim)^-EPSH *ztztsim;
    d8 = zmtzmtsim - (1-GGAMMA)*(pmpmsim/ptptsim)^-EPSH *ztztsim;
    d9 = xtxtsim - (1-GGAMMAST)*(pxpxsim/pstpstsim)^-EPSF *cstcstsim;
    d10 = ptptsim - (GGAMMA*(phphsim^(1-EPSH)) + (1-GGAMMA)*(pmpmsim^(1-EPSH)))^(1/(1-EPSH));
    d11 = - rstrstsim + rtrtsim - (OOMEGA/MMBAR)*(SSIGMA^2)*dstdstsim;
    d12 = yintyintsim-aasim*(ltltsim^(1-VVARTHETA)) * ktktsim^VVARTHETA;
    d13 = mcmcsim - 1/( (VVARTHETA^VVARTHETA) * (1-VVARTHETA)^(1-VVARTHETA)) * aasim * ((wtwtsim/ptptsim)^(1-VVARTHETA)) * (rktrktsim ^ VVARTHETA);
    d14 = wtwtsim * ltltsim - (1 - VVARTHETA) * mcmcsim * yintyintsim;
    d15 = phphsim - (EPS/(EPS-1))*ptptsim*mcmcsim;
    d16 = ststsim * pxpxsim - ptptsim * mcmcsim;
    d17 = pmpmsim - ststsim * pstpstsim;
    d18 = chchsim + zhtzhtsim - yhyhsim;
    d19 = xtxtsim - yxyxsim;
    d20 = cmcmsim + zmtzmtsim - ymymsim;
    d21 = yintyintsim - yhyhsim - yxyxsim;
    d22 = - btbtsim + ststsim * nstnstsim + ststsim * bcsbcssim + ststsim * dstdstsim;
    d23 = ccasim;
    d24 = - ccasim + nxnxsim + ststsim * ( rstrstsim - 1 ) * ( dstdstsim + bcsbcssim + nstnstsim );
    d25 = - nxnxsim + phphsim*yhyhsim + ststsim*pxpxsim*yxyxsim - ptptsim * ctctsim - ptptsim * ztztsim ;
    d26 = aasim - 1;
    d27 = bcsbcssim - BCSTARSS;
    d28 = nstnstsim - NNSTAR;
    d29 = pstpstsim - 1;
    d30 = cstcstsim - 1;
    d31 = ptptsim - 1;
    d32 = rstrstsim - RRSTAR;
    
    
    for j3 = 1:2
         
        rtrtsim    = 1/BBETA;  % d1
        rstrstsim  = RRSTAR;   % d32
        ccasim     = 0;        % d23
        aasim      = 1;        % d26
        bcsbcssim  = BCSTARSS; % d27
        nstnstsim  = NNSTAR;   % d28
        pstpstsim  = 1;        % d29
        cstcstsim  = 1;        % d30
        ptptsim    = 1;        % d31
        yxyxsim    = xtxtsim   ;  % d19
        wtwtsim = (ltltsim^CCHI * ctctsim^GGAMMAC)*ptptsim;                  % d2
        phphsim = (EPS/(EPS-1))*ptptsim*mcmcsim;                             % d15
        pxpxsim = (ptptsim * mcmcsim)/ststsim;                               % d16
        pmpmsim = ststsim*pstpstsim;                                         % d17
        zhtzhtsim = GGAMMA*(phphsim/ptptsim)^-EPSH *ztztsim;                 % d7
        zmtzmtsim = (1-GGAMMA)*(pmpmsim/ptptsim)^-EPSH *ztztsim;             % d8
        chchsim = GGAMMA*(phphsim/ptptsim)^-EPSH *ctctsim;                   % d5
        cmcmsim = (1-GGAMMA)*(pmpmsim/ptptsim)^-EPSH *ctctsim;               % d6
        rktrktsim = 1/BBETA - 1 + DDELTA;                                    %d4
        ztztsim     = DDELTA * ktktsim;                                          % d3
        yhyhsim    = chchsim + zhtzhtsim;     % d18
        ymymsim    = cmcmsim + zmtzmtsim;     % d20
        yintyintsim = yhyhsim + yxyxsim;                                       % d21
        btbtsim     = ststsim*nstnstsim + ststsim*bcsbcssim + ststsim*dstdstsim;  %d22       
        dstdstsim   = - (rstrstsim - rtrtsim)/((OOMEGA/MMBAR)*(SSIGMA^2));   %d11
        nxnxsim     = phphsim*yhyhsim + ststsim*pxpxsim*yxyxsim - ptptsim*ctctsim - ptptsim*ztztsim; %d25         % d20
        xtxtsim     = (1-GGAMMAST)*(pxpxsim/pstpstsim)^-EPSF *cstcstsim; % d9
        mcmcsim     = ((1 - (1-GGAMMA)*((pmpmsim/ptptsim)^(1-EPSH)))/GGAMMA)^(1/(1-EPSH)); % d10

        eval(d1)
        eval(d32)
        eval(d23)
        eval(d26)
        eval(d27)
        eval(d28)
        eval(d29)
        eval(d30)
        eval(d31)
        eval(d19)
        eval(d2)
        eval(d15)
        eval(d16)
        eval(d17)
        eval(d3)
        eval(d7)
        eval(d8)
        eval(d5)
        eval(d6)
        eval(d4)
        eval(d18)
        eval(d20)
        eval(d21)
        eval(d22)
        eval(d11)
        eval(d25)
        eval(d9)
        eval(d10)
        
    end
    
    d12 = yintyintsim - aasim*(ltltsim^(1-VVARTHETA)) * ktktsim^VVARTHETA;
    d13 = mcmcsim - 1/( (VVARTHETA^VVARTHETA) * (1-VVARTHETA)^(1-VVARTHETA)) * aasim * ((wtwtsim/ptptsim)^(1-VVARTHETA)) * (rktrktsim ^ VVARTHETA);
    d14 = wtwtsim * ltltsim - (1 - VVARTHETA) * mcmcsim * yintyintsim;
    d24 = - ccasim + nxnxsim + ststsim * ( rstrstsim - 1 ) * ( dstdstsim + bcsbcssim + nstnstsim );

    % CLEAN 4 x 4
    
    M1T_RES1 = [simplify(eval(d12)); simplify(eval(d13)); simplify(eval(d14)); simplify(eval(d24))];
       
    x0 = [1, 1, 0.01, 1];
    myfun = @(x)STEADYM5(x, M1T_RES1);
    options = optimset('Display','iter','MaxFunEvals',20000,'MaxIter',20000,'TolFun',1e-10);
    x = fsolve(myfun,x0,options);
    
    ctctsim       = x(1);
    ltltsim       = x(2);
    ststsim       = x(3);
    ktktsim       = x(4);
    
    for h3 = 1:3
           
        yxyxsim    = xtxtsim   ;  % d19
        wtwtsim = (ltltsim^CCHI * ctctsim^GGAMMAC)*ptptsim;                  % d2
        phphsim = (EPS/(EPS-1))*ptptsim*mcmcsim;                             % d15
        pxpxsim = (ptptsim * mcmcsim)/ststsim;                               % d16
        pmpmsim = ststsim*pstpstsim;                                         % d17
        zhtzhtsim = GGAMMA*(phphsim/ptptsim)^-EPSH *ztztsim;                 % d7
        zmtzmtsim = (1-GGAMMA)*(pmpmsim/ptptsim)^-EPSH *ztztsim;             % d8
        chchsim = GGAMMA*(phphsim/ptptsim)^-EPSH *ctctsim;                   % d5
        cmcmsim = (1-GGAMMA)*(pmpmsim/ptptsim)^-EPSH *ctctsim;               % d6
        rktrktsim = 1/BBETA - 1 + DDELTA;                                    %d4
        ztztsim     = DDELTA * ktktsim;                                          % d3
        yhyhsim    = chchsim + zhtzhtsim;     % d18
        ymymsim    = cmcmsim + zmtzmtsim;     % d20
        yintyintsim = yhyhsim + yxyxsim;                                       % d21
        btbtsim     = ststsim*nstnstsim + ststsim*bcsbcssim + ststsim*dstdstsim;  %d22       
        dstdstsim   = - (rstrstsim - rtrtsim)/((OOMEGA/MMBAR)*(SSIGMA^2));   %d11
        nxnxsim     = phphsim*yhyhsim + ststsim*pxpxsim*yxyxsim - ptptsim*ctctsim - ptptsim*ztztsim; %d25         % d20
        xtxtsim     = (1-GGAMMAST)*(pxpxsim/pstpstsim)^-EPSF *cstcstsim; % d9
        mcmcsim     = ((1 - (1-GGAMMA)*((pmpmsim/ptptsim)^(1-EPSH)))/GGAMMA)^(1/(1-EPSH)); % d10
        r1r1     = rstrstsim;

    end
    
    RTRTSS      = rtrtsim;
    RTSRTSSS    = RRSTAR;
    CCASS       = 0;
    AASS        = 1;
    BCSBCSSS    = BCSTARSS;
    NSTNSTSS    = NNSTAR;
    PSTPSTSS    = 1;
    CSTCSTSS    = 1;
    PTPTSS      = 1;
    YHYHSS      = yhyhsim;
    YXYXSS      = yxyxsim;
    YMYMSS      = ymymsim;
    YINTYINTSS  = yintyintsim;
    LTLTSS      = ltltsim;
    WTWTSS      = wtwtsim;
    CMCMSS      = cmcmsim;
    XTXTSS      = xtxtsim;
    MCMCSS      = mcmcsim;
    PHPHSS      = phphsim;
    PMPMSS      = pmpmsim;
    BTBTSS      = btbtsim;
    DSTDSTSS    = dstdstsim;
    NXNXSS      = nxnxsim;
    R1R1SS      = r1r1;
    STSTSS      = ststsim;
    CTCTSS      = ctctsim;
    CHCHSS      = chchsim;
    PXPXSS      = pxpxsim;
    ZTZTSS      = ztztsim;
    ZMZMSS      = zmtzmtsim;
    ZHZHSS      = zhtzhtsim;
    RKRKSS      = rktrktsim;
    KTKTSS      = ktktsim;
    
    save PARAM_SS3 ZTZTSS ZMZMSS ZHZHSS RKRKSS KTKTSS RTRTSS RTSRTSSS CCASS AASS BCSBCSSS NSTNSTSS PSTPSTSS CSTCSTSS PTPTSS YHYHSS YXYXSS YMYMSS YINTYINTSS LTLTSS WTWTSS CMCMSS XTXTSS MCMCSS PHPHSS PMPMSS BTBTSS DSTDSTSS NXNXSS R1R1SS STSTSS CTCTSS PXPXSS CHCHSS CMCMSS;
    
    dynare MODEL5.mod
    
    save inputg oo_ M_;
    MGRAPHS3AR('inputg', 'RBCI');
    MGRAPHS3BR('inputg', 'RBCI');
        
end


if MODEL_TYPE == 6 % RBC + TOT
    
    save PARAM_M4 
    
    syms ctctsim hmhmsim hxhxsim hnhnsim lamlamsim rtrtsim umumsim uxuxsim ununsim...
         wmwmsim wxwxsim wnwnsim gagamsim atautausim anansim ptautausim atautausim pnpnsim...
         pmpmsim amamsim axaxsim anansim ymymsim yxyxsim ynynsim aamsim aaxsim aansim...
         kmkmsim kxkxsim knknsim imimsim ininsim ixixsim nxnxsim ststsim 
    
    % STRATEGY: SOLVE THE WHOLE MODEL IN MATLAB (REPLICATE STEPS DONE IN LATEX)
    d1 = (ctctsim - ((hmhmsim)^(OOMEGAM))/OOMEGAM + ((hxhxsim)^(OOMEGAX))/OOMEGAX ...
         + ((hnhnsim)^(OOMEGAN))/OOMEGAN)^(-SSIGMA) - lamlamsim;
    d2 = rtrtsim - 1/BBETA;
    d3 = 1/BBETA - (umumsim + 1 - DDELTA);
    d4 = 1/BBETA - (uxuxsim + 1 - DDELTA);
    d5 = 1/BBETA - (ununsim + 1 - DDELTA);
    d6 = wmwmsim - hmhmsim^(OOMEGAM - 1);
    d7 = wxwxsim - hxhxsim^(OOMEGAX - 1);
    d8 = wnwnsim - hnhnsim^(OOMEGAN - 1);
    d9 = gamgamsim - (CCHITAU*(atauatausim)^(1-(1/MMUTAUN)) + (1 - CCHITAU)*(anansim)^(1-(1/MMUTAUN)))^(1/(1-(1/MMUTAUN))) ...
                    + ptauptausim*atauatausim + pnpnsim*anansim;
    d10 = ptauptausim - (CCHITAU*atauatausim^(-1/MMUTAUN))*(CCHITAU*(atauatausim)^(1-(1/MMUTAUN)) + (1 - CCHITAU)*(anansim)^(1-(1/MMUTAUN)))^(1/(1-(1/MMUTAUN)));
    d11 = pnpnsim - ((1-CCHITAU)*anansim^(-1/MMUTAUN))*(CCHITAU*(atauatausim)^(1-(1/MMUTAUN)) + (1 - CCHITAU)*(anansim)^(1-(1/MMUTAUN)))^(1/(1-(1/MMUTAUN)));
    d12 = atauatausim - (CCHIM*(amamsim)^(1-(1/MMUMX)) + (1 - CCHIM)*(amamsim)^(1-(1/MMUTAUN)))^(1/(1-(1/MMUTAUN)));
    d13 = gamgamtausim - ptauptausim*((CCHIM*(amamsim)^(1-(1/MMUMX)) + (1 - CCHIM)*(axaxsim)^(1-(1/MMUMX)))^(1/(1-(1/MMUMX)))) ...
                    + pmpmsim*amamsim + pxpxsim*axaxsim;
    d14 = pmpmsim - ptauptausim*(CCHIM*(amamsim)^(-1/MMUMX))*((CCHIM*(amamsim)^(1-(1/MMUMX)) + (1 - CCHIM)*(axaxsim)^(1-(1/MMUMX)))^(1/(1-(1/MMUMX))));            
    d15 = pxpxsim - ptauptausim*((1-CCHIM)*(amamsim)^(-1/MMUMX))*((CCHIM*(amamsim)^(1-(1/MMUMX)) + (1 - CCHIM)*(axaxsim)^(1-(1/MMUMX)))^(1/(1-(1/MMUMX))));            
    d16 = ymymsim - aamsim*(kmkmsim^AALPHAM)*(hmhmsim^(1-AALPHAM));
    d17 = yxyxsim - aaxsim*(kxkxsim^AALPHAX)*(hxhxsim^(1-AALPHAX));
    d18 = ynynsim - aansim*(knknsim^AALPHAN)*(hnhnsim^(1-AALPHAN));
    d19 = gamgammsim - pmpmsim*ymymsim - wmwmsim*hmhmsim - umumsim*kmkmsim;
    d20 = gamgamxsim - pxpxsim*yxyxsim - wxwxsim*hxhxsim - uxuxsim*kxkxsim;
    d21 = gamgamnsim - pnpnsim*ynynsim - wnwnsim*hnhnsim - ununsim*knknsim;
    d22 = umumsim - pmpmsim*aamsim*AALPHAM*(kmkmsim^(AALPHAM-1))*(hmhmsim^(1-AALPHAM));
    d23 = wmwmsim - pmpmsim*aamsim*(1-AALPHAM)*(kmkmsim^(AALPHAM))*(hmhmsim^(-AALPHAM));
    d24 = uxuxsim - pxpxsim*aaxsim*AALPHAX*(kxkxsim^(AALPHAX-1))*(hxhxsim^(1-AALPHAX));
    d25 = wxwxsim - pxpxsim*aaxsim*(1-AALPHAX)*(kxkxsim^(AALPHAX))*(hxhxsim^(-AALPHAX));  
    d26 = ununsim - pnpnsim*aansim*AALPHAN*(knknsim^(AALPHAN-1))*(hnhnsim^(1-AALPHAN));
    d27 = wnwnsim - pnpnsim*aansim*(1-AALPHAN)*(knknsim^(AALPHAN))*(hnhnsim^(-AALPHAN)); 
    d28 = ctctsim + imimsim + ixixsim + ininsim - (CCHITAU*(atauatausim)^(1-(1/MMUTAUN)) + (1 - CCHITAU)*(anansim)^(1-(1/MMUTAUN)))^(1/(1-(1/MMUTAUN)));
    d29 = anansim - ynynsim;
    d30 = mmsim - pmpmsim*(amamsim - ymymsim);
    d31 = xxsim -pxpxsim*(yxyxsim - axaxsim);
    d32 = totsim - pxpxsim/pmpmsim;
    d33 = rersim - ststsim*pstpstsim/ppsim;
    d34 = - btbtsim + ststsim * nstnstsim + ststsim * bcsbcssim + ststsim * dstdstsim;
    d35 = ccasim;
    d36 = - ccasim + nxnxsim + ststsim*(rstrstsim-1)*(dstdstsim + bcsbcssim) - (rtrtsim-1)*ststsim*nstnstsim ;
    d37 = - rstrstsim + rtrtsim - (OOMEGA/MMBAR)*(SSIGMA^2)*dstdstsim;
    d38 = aamsim - 1;
    d39 = aansim - 1;
    d40 = aaxsim - 1;
    d41 = bcsbcssim - BCSTARSS;
    d42 = nstnstsim - NNSTAR;
    d43 = pstpstsim - 1;
    d44 = rstrstsim - RRSTAR;
    d45 = pxpxsim - log(ststsim)*pxstpxstsim;
    d46 = pmpmsim - log(ststsim)*pstpstsim;
    d47 = pxstpxstsim - 1;
    d48 = imimsim - DDELTA*kmkmsim;
    d49 = ixixsim - DDELTA*kxkxsim;
    d50 = ininsim - DDELTA*knknsim;
    
   
    for j= 1:2
        
        rtrtsim    = 1/BBETA;  % d2
        umumsim = 1/BBETA - (1 - DDELTA); %d3
        uxuxsim = 1/BBETA - (1 - DDELTA); %d4
        uxuxsim = 1/BBETA - (1 - DDELTA); %d5
        ccasim     = 0;        % d34
        aamsim     = 1;        % d37
        aansim     = 1;        % d38
        aaxsim     = 1;        % d39
        bcsbcssim  = BCSTARSS; % d40
        nstnstsim  = NNSTAR;   % d41
        pstpstsim  = 1;        % d42
        rstrstsim  = RRSTAR;   % d43
        pxstpxstsim = 1;       % d46
        
        ynynsim = anansim; %  d29
                lamlamsim = (ctctsim - ((hmhmsim)^(OOMEGAM))/OOMEGAM + ((hmhmsim)^(OOMEGAM))/OOMEGAM ...
         + ((hnhnsim)^(OOMEGAN))/OOMEGAN)^(-SSIGMA); %d1
        dwmwmsim - hmhmsim^(OOMEGAM - 1); 
        d7 = wxwxsim - hxhxsim^(OOMEGAX - 1);
        d8 = wnwnsim - hnhnsim^(OOMEGAN - 1);
        d9 = gamgamsim - (CCHITAU*(atauatausim)^(1-(1/MMUTAUN)) + (1 - CCHITAU)*(anansim)^(1-(1/MMUTAUN)))^(1/(1-(1/MMUTAUN))) ...
                    + ptauptausim*atauatausim + pnpnsim*anansim;
        d10 = ptauptausim - (CCHITAU*atauatausim^(-1/MMUTAUN))*(CCHITAU*(atauatausim)^(1-(1/MMUTAUN)) + (1 - CCHITAU)*(anansim)^(1-(1/MMUTAUN)))^(1/(1-(1/MMUTAUN)));
        d11 = pnpnsim - ((1-CCHITAU)*anansim^(-1/MMUTAUN))*(CCHITAU*(atauatausim)^(1-(1/MMUTAUN)) + (1 - CCHITAU)*(anansim)^(1-(1/MMUTAUN)))^(1/(1-(1/MMUTAUN)));
        d12 = atauatausim - (CCHIM*(amamsim)^(1-(1/MMUMX)) + (1 - CCHIM)*(amamsim)^(1-(1/MMUTAUN)))^(1/(1-(1/MMUTAUN)));
        d13 = gamgamtausim - ptauptausim*((CCHIM*(amamsim)^(1-(1/MMUMX)) + (1 - CCHIM)*(axaxsim)^(1-(1/MMUMX)))^(1/(1-(1/MMUMX)))) ...
                    + pmpmsim*amamsim + pxpxsim*axaxsim;
        d14 = pmpmsim - ptauptausim*(CCHIM*(amamsim)^(-1/MMUMX))*((CCHIM*(amamsim)^(1-(1/MMUMX)) + (1 - CCHIM)*(axaxsim)^(1-(1/MMUMX)))^(1/(1-(1/MMUMX))));            
        d15 = pxpxsim - ptauptausim*((1-CCHIM)*(amamsim)^(-1/MMUMX))*((CCHIM*(amamsim)^(1-(1/MMUMX)) + (1 - CCHIM)*(axaxsim)^(1-(1/MMUMX)))^(1/(1-(1/MMUMX))));            
        d16 = ymymsim - aamsim*(kmkmsim^AALPHAM)*(hmhmsim^(1-AALPHAM));
        d17 = yxyxsim - aaxsim*(kxkxsim^AALPHAX)*(hxhxsim^(1-AALPHAX));
        d18 = ynynsim - aansim*(knknsim^AALPHAN)*(hnhnsim^(1-AALPHAN));
        d19 = gamgammsim - pmpmsim*ymymsim - wmwmsim*hmhmsim - umumsim*kmkmsim;
        d20 = gamgamxsim - pxpxsim*yxyxsim - wxwxsim*hxhxsim - uxuxsim*kxkxsim;
        d21 = gamgamnsim - pnpnsim*ynynsim - wnwnsim*hnhnsim - ununsim*knknsim;
        d22 = umumsim - pmpmsim*aamsim*AALPHAM*(kmkmsim^(AALPHAM-1))*(hmhmsim^(1-AALPHAM));
        d23 = wmwmsim - pmpmsim*aamsim*(1-AALPHAM)*(kmkmsim^(AALPHAM))*(hmhmsim^(-AALPHAM));
        d24 = uxuxsim - pxpxsim*aaxsim*AALPHAX*(kxkxsim^(AALPHAX-1))*(hxhxsim^(1-AALPHAX));
        d25 = wxwxsim - pxpxsim*aaxsim*(1-AALPHAX)*(kxkxsim^(AALPHAX))*(hxhxsim^(-AALPHAX));  
        d26 = ununsim - pnpnsim*aansim*AALPHAN*(knknsim^(AALPHAN-1))*(hnhnsim^(1-AALPHAN));
        d27 = wnwnsim - pnpnsim*aansim*(1-AALPHAN)*(knknsim^(AALPHAN))*(hnhnsim^(-AALPHAN)); 
        d28 = ctctsim + imimsim + ixixsim + ininsim - (CCHITAU*(atauatausim)^(1-(1/MMUTAUN)) + (1 - CCHITAU)*(anansim)^(1-(1/MMUTAUN)))^(1/(1-(1/MMUTAUN)));
        d29 = anansim - ynynsim;
        d30 = mmsim - pmpmsim*(amamsim - ymymsim);
        d31 = xxsim -pxpxsim*(yxyxsim - axaxsim);
        d32 = totsim - pxpxsim/pmpmsim;
        d33 = rersim - ststsim*pstpstsim/ppsim;

        
        eval(d1)
        eval(d27)
        eval(d18)
        eval(d21)
        eval(d22)
        eval(d23)
        eval(d24)
        eval(d25)
        eval(d26)
        eval(d13)
        eval(d14)
        eval(d15)
        eval(d2)
        eval(d4)
        eval(d5)
        eval(d9)
        eval(d10)
        eval(d12)
        eval(d16)
        eval(d8)
        eval(d17)
        eval(d7)
        eval(d20)

    end
    
    d6 = ptptsim - (GGAMMA*(phphsim^(1-EPSH)) + (1-GGAMMA)*(pmpmsim^(1-EPSH)))^(1/(1-EPSH));
    d19 = - ccasim + nxnxsim + ststsim*(rstrstsim-1)*(dstdstsim + bcsbcssim) - (rtrtsim-1)*ststsim*nstnstsim ;
    d11 = ststsim*pxpxsim - (EPS/(EPS-1))*ptptsim*mcmcsim;
    d3 = chchsim - GGAMMA*(phphsim/ptptsim)^-EPSH *ctctsim;
    
    M1T_RES1 = [simplify(eval(d6)); simplify(eval(d19)); simplify(eval(d3)); simplify(eval(d11))];
    
    % Three variables but st, ch, ct
    
    x0 = [1, 1, 0.01, 1];
    myfun = @(x)STEADYM4(x, M1T_RES1);
    options = optimset('Display','iter','MaxFunEvals',20000,'MaxIter',20000,'TolFun',1e-10);
    x = fsolve(myfun,x0,options);
    
    ctctsim       = x(1);
    chchsim       = x(2);
    ststsim       = x(3);
    pxpxsim       = x(4);
    
    for h = 1:3
        
        rtrtsim    = 1/BBETA;  % d1
        rstrstsim  = RRSTAR;   % d27
        ccasim     = 0;        % d18
        aasim      = 1;        % d21
        bcsbcssim  = BCSTARSS; % d22
        nstnstsim  = NNSTAR;   % d23
        pstpstsim  = 1;        % d24
        cstcstsim  = 1;        % d25
        ptptsim    = 1;        % d26
        yhyhsim    = chchsim;     % d13
        yxyxsim    = xtxtsim;     % d14
        ymymsim    = cmcmsim;     % d15
        yintyintsim = yhyhsim + yxyxsim;                                     % d16
        ltltsim     = yintyintsim/aasim;                                     % d8
        wtwtsim    = (ltltsim^CCHI * ctctsim^GGAMMAC)*ptptsim;                  % d2
        cmcmsim    = (1-GGAMMA)*(pmpmsim/ptptsim)^-EPSH *ctctsim;               % d4
        xtxtsim    = (1-GGAMMAST)*(pxpxsim/pstpstsim)^-EPSF *cstcstsim;           % d5
        mcmcsim    = wtwtsim/(ptptsim*aasim);                                   % d9
        phphsim    = (EPS/(EPS-1))*ptptsim*mcmcsim;                          % d10
        pmpmsim     = ststsim*pstpstsim;                                     % d12
        btbtsim     = ststsim*nstnstsim + ststsim*bcsbcssim + ststsim*dstdstsim;         % d17
        dstdstsim   = - (rstrstsim - rtrtsim)/((OOMEGA/MMBAR)*(SSIGMA^2));   % d7
        nxnxsim     = phphsim*yhyhsim + ststsim*pxpxsim*yxyxsim - ptptsim*ctctsim;          % d20
        r1r1     = rstrstsim;
        
    end
    
    RTRTSS      = rtrtsim;
    RTSRTSSS    = RRSTAR;
    CCASS       = 0;
    AASS        = 1;
    BCSBCSSS    = BCSTARSS;
    NSTNSTSS    = NNSTAR;
    PSTPSTSS    = 1;
    CSTCSTSS    = 1;
    PTPTSS      = 1;
    YHYHSS      = yhyhsim;
    YXYXSS      = yxyxsim;
    YMYMSS      = ymymsim;
    YINTYINTSS  = yintyintsim;
    LTLTSS      = ltltsim;
    WTWTSS      = wtwtsim;
    CMCMSS      = cmcmsim;
    XTXTSS      = xtxtsim;
    MCMCSS      = mcmcsim;
    PHPHSS      = phphsim;
    PMPMSS      = pmpmsim;
    BTBTSS      = btbtsim;
    DSTDSTSS    = dstdstsim;
    NXNXSS      = nxnxsim;
    R1R1SS      = r1r1;
    STSTSS      = ststsim;
    CTCTSS      = ctctsim;
    CHCHSS      = chchsim;
    PXPXSS      = pxpxsim;
    
    
    save PARAM_SS RTRTSS RTSRTSSS CCASS AASS BCSBCSSS NSTNSTSS PSTPSTSS CSTCSTSS PTPTSS YHYHSS YXYXSS YMYMSS YINTYINTSS LTLTSS WTWTSS CMCMSS XTXTSS MCMCSS PHPHSS PMPMSS BTBTSS DSTDSTSS NXNXSS R1R1SS STSTSS CTCTSS PXPXSS CHCHSS CMCMSS;
    
    dynare MODEL6.mod
    
    save inputg oo_ M_;
    MGRAPHS4AR('inputg', 'RBCTOT');
    MGRAPHS4BR('inputg', 'RBCTOT');
        
end




% %% ========================================================================
% % RESULT 2B: FAMA BETA AND UIP PUZZLE
% % =========================================================================
% % A: GAMMA PARAMETER (OPENESS) / GET ALL STATS AND TABLE
% % 1. Get both nominal and real variables
% % 2. Get all moments of I&M table
% % 3. Automatic report in latex after obtaining values
% % 4. Automatic report for sensitivity analysis
% 
% 
% % We want to loop over parameters at least obtain 5 values for each parameter
% % First rest original parameters
% 
% clear FAMA_DEP DISCO_DEP FAMA_EX DISCO_EX STD_CONS STD_DEP DISCO_DEPR  DISCOPY M_;
% PARAMNAME = 'OOMEGA';
% VALUES = [0.01];
% % GGAMMA = [0.3 0.5 0.8 0.95];
% % EPSHVEC = [1.05 1.25 1.5 1.75 2 2.25 2.5 ];
% % EPSFVEC = [1.05 1.25 1.5 1.75 2 2.25 2.5 ];
% % OOMEGAVEC = [0.01 0.1 1];
% % GGAMMACVEC = [];
% % CCHI = [1.5 2.0 2.5 3 3.5 4 4.5 5];
% % TTHETAX = [0.75 0.8 0.85 0.95]
% 
% 
% for h = 1:3
%     
%     load PARAM_M0B;
%     if h == 1 % Only financial
%         STD_A   =   0;
%         STD_PSI =   1;
%         STD_MON =   0;
%     end
%     
%     
%     if h == 2
%         STD_A   =   1;
%         STD_PSI =   0;
%         STD_MON =   0;
%     end
%     
%     if h == 3 % Real and Financial
%         STD_A   =   1;
%         STD_PSI =   1;
%         STD_MON =   0;
%     end
%     
%     if h == 4 % Only Monetary
%         STD_A   =   1;
%         STD_PSI =   1;
%         STD_MON =   1;
%     end
%     
%     if h == 5 % All shocks
%         STD_A   =   1;
%         STD_PSI =   1;
%         STD_MON =   1;
%     end
%     
%         save PARAM_M1B BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A STD_MON TTHETAH TTHETAX MMU TAUX TAUH;    
%   
%         eval(['FAMA_', PARAMNAME,'_DEP_', num2str(h),' = zeros(length(VALUES),1);']);
%         eval(['DISCO_', PARAMNAME,'_DEP_', num2str(h),' = zeros(length(VALUES),1);']);
%         eval(['FAMA_', PARAMNAME,'_EX_', num2str(h),' = zeros(length(VALUES),1);']);
%         eval(['DISCO_', PARAMNAME,'_EX_', num2str(h),' = zeros(length(VALUES),1);']);
%         eval(['STD_C', PARAMNAME,'_', num2str(h),'= zeros(length(VALUES),1);']);
%         eval(['STD_DEP', PARAMNAME,'_', num2str(h),'= zeros(length(VALUES),1);']);
%         eval(['DISCO', PARAMNAME,'_DEPY_', num2str(h),'= zeros(length(VALUES),1);']);
%        
%     
%      for j = 1:length(VALUES)
%      
%          syms ctctsim rtrtsim wtwtsim yhyhsim ththsim...
%              cmcmsim tmtmsim cstcstsim pistarsim xtxtsim...
%              txtxsim pitpitsim ststsim dstdstsim yintyintsim...
%              aasim ltltsim mcmcsim chchsim yxyxsim...
%              ymymsim btbtsim nstnstsim bcsbcssim ccasim...
%              nxnxsim rstrstsim vnvnsim vdvdsim pihpihsim...
%              vnxvnxsim vdxvdxsim pixpixsim mchmchsim mcxmcxsim...
%              deltahsim deltaxsim rerersim pimpimsim;
% 
%         eval([PARAMNAME,' = VALUES(j);']);  %Between 0 and 1
% 
%         save PARAM_M1B BBETA RRSTAR GGAMMAC GGAMMA CCHI CCSTAR NNSTAR BCSTARSS GGAMMAD EPSF EPSH EPS GGAMMAST MMBAR OOMEGA SSIGMA RHOA RHOBCS RHONST STD_PSI STD_A STD_MON TTHETAH TTHETAX MMU TAUX TAUH;    
%   
%         d1 = rtrtsim/pitpitsim - 1/BBETA;
%         d2 = ltltsim^CCHI * ctctsim^GGAMMAC - wtwtsim;
%         d3 = yhyhsim - GGAMMA*(ththsim)^-EPSH *ctctsim;
%         d4 = ymymsim - (1-GGAMMA)*(tmtmsim)^-EPSH *ctctsim;
%         d5 = xtxtsim - (1-GGAMMAST)*(txtxsim)^-EPSF *cstcstsim;
%         d6 = 1 - (GGAMMA*(ththsim^(1-EPSH)) + (1-GGAMMA)*(tmtmsim^(1-EPSH)))^(1/(1-EPSH));
%         d7 = - rstrstsim + rtrtsim - (OOMEGA/MMBAR)*(SSIGMA^2)*dstdstsim;
%         d8 = yintyintsim-aasim*ltltsim;
%         d9 = mcmcsim - wtwtsim/(aasim);
%         d10 = vnvnsim -  MMU*(ctctsim^-GGAMMAC)*yhyhsim*mchmchsim/((1 - TTHETAH * BBETA * (pihpihsim^-EPS)));
%         d11 = vdvdsim - ctctsim^-GGAMMAC*yhyhsim/(1 - TTHETAH * BBETA * (pihpihsim^(EPS-1)));
%         d12 =  - TTHETAH * (pihpihsim)^(EPS-1) + 1 - (1-TTHETAH)*(vnvnsim/vdvdsim)^(1-EPS);
%         d13 = - mchmchsim + (1-TAUH)* mcmcsim / ththsim;
%         d14 = vnxvnxsim - MMU*ctctsim^-GGAMMAC*yxyxsim*mcxmcxsim/(1 - TTHETAX * BBETA * (pixpixsim^-EPS));
%         d15 = vdxvdxsim - ctctsim^-GGAMMAC*yxyxsim/(1 -  TTHETAX * BBETA * (pixpixsim^(EPS-1)));
%         d16 =  - TTHETAX * (pixpixsim)^(EPS-1) + 1 - (1-TTHETAH)*(vnxvnxsim/vdxvdxsim)^(1-EPS);
%         d17 = - mcxmcxsim + (1-TAUX)* mcmcsim / (rerersim * txtxsim);
%         d18 = tmtmsim - rerersim;
%         d19 = chchsim - yhyhsim;
%         d20 = xtxtsim - yxyxsim;
%         d21 = cmcmsim - ymymsim;
%         d22 = yintyintsim - deltahsim * yhyhsim - deltaxsim * yxyxsim;
%         d23 = btbtsim - rerersim*(nstnstsim + bcsbcssim + dstdstsim);
%         d24 = ccasim;
%         d25 = - ccasim + nxnxsim + rerersim*(rstrstsim-1)*(dstdstsim + bcsbcssim)/pistarsim + (rtrtsim-1)*rerersim*nstnstsim/pitpitsim ;
%         d26 = - nxnxsim + ththsim*yhyhsim + rerersim*txtxsim*yxyxsim - ctctsim ;
%         d27 = deltahsim - 1;
%         d28 = deltaxsim - 1;
%         d30 = pihpihsim - 1;
%         d31 = pimpimsim - 1;
%         d32 = aasim - 1;
%         d33 = bcsbcssim - BCSTARSS;
%         d34 = nstnstsim - NNSTAR;
%         d35 = pistarsim - 1;
%         d36 = cstcstsim - 1;
%         d37 = rstrstsim - RRSTAR;
%         d38 = pitpitsim -1;
% 
%         for KAPPA = 1:2
%             dstdstsim = 0;
%             pixpixsim = 1;
%             deltahsim = 1;     % d27  
%             deltaxsim = 1;     % d28 
%             pihpihsim = 1;     % d30 
%             pimpimsim = 1;     % d31
%             aasim = 1;         % d32 
%             tmtmsim   = ((1 - GGAMMA*ththsim^(1-EPSH))/(1-GGAMMA))^(1/(1-EPSH)); % d6
%             bcsbcssim = BCSTARSS; % d33
%             nstnstsim = NNSTAR; % d34
%             pistarsim = 1; % d35
%             cstcstsim = 1; % d36
%             rstrstsim = RRSTAR; % d37
%             pitpitsim = 1; % d38
%             ccasim = 0; % d24 
%             rerersim = tmtmsim; % d18
%             chchsim = yhyhsim; % d19
%             xtxtsim = yxyxsim; % d20
%             cmcmsim = ymymsim; % d21  
%             rtrtsim = pitpitsim/BBETA; % d1
%             yintyintsim = aasim*ltltsim; % d8 
%             mcmcsim = wtwtsim/(aasim); % d9 
%             yhyhsim = GGAMMA*(ththsim)^-EPSH *ctctsim; % d3 
%             ymymsim = (1-GGAMMA)*(tmtmsim)^-EPSH *ctctsim; %d4   
%             wtwtsim = ltltsim^CCHI * ctctsim^GGAMMAC ; % d2
%             yxyxsim = (1-GGAMMAST)*(txtxsim)^-EPSF *cstcstsim; %d5
%             rstrstsim = rtrtsim - (OOMEGA/MMBAR)*(SSIGMA^2)*dstdstsim; % d7
%             vnvnsim =  MMU*(ctctsim^-GGAMMAC)*yhyhsim*mchmchsim/((1 - TTHETAH * BBETA * (pihpihsim^-EPS))); % d10
%             vdvdsim = ctctsim^-GGAMMAC*yhyhsim/(1 - TTHETAH * BBETA * (pihpihsim^(EPS-1))); % d11 
%             vnxvnxsim = MMU*ctctsim^-GGAMMAC*yxyxsim*mcxmcxsim/(1 - TTHETAX * BBETA * (pixpixsim^-EPS)); % d14  
%             vdxvdxsim = ctctsim^-GGAMMAC*yxyxsim/(1 -  TTHETAX * BBETA * (pixpixsim^(EPS-1))); % d15
%             mchmchsim = (1-TAUH)* mcmcsim / ththsim; % d13
%             mcxmcxsim = (1-TAUX)* mcmcsim / (rerersim * txtxsim); % d17
%             btbtsim   = rerersim*(nstnstsim + bcsbcssim + dstdstsim); % d23
%             nxnxsim   = ththsim*yhyhsim + rerersim*txtxsim*yxyxsim - ctctsim ; % d26
% 
%             eval(d27)
%             eval(d28)
%             eval(d30)
%             eval(d31)
%             eval(d32)
%             eval(d33)
%             eval(d34)
%             eval(d35)
%             eval(d36)
%             eval(d37)
%             eval(d38)
%             eval(d24)
%             eval(d18)
%             eval(d19)   
%             eval(d20)
%             eval(d21)
%             eval(d1)   
%             eval(d8)
%             eval(d9)
%             eval(d3)
%             eval(d4)
%             eval(d2)   
%             eval(d5)
%             eval(d7)
%             eval(d10)   
%             eval(d11)
%             eval(d14)
%             eval(d15)
%             eval(d13)
%             eval(d17)   
%             eval(d23)
%             eval(d26)
%             eval(d6)
%         end
% 
% 
%         d22 = yintyintsim - deltahsim * yhyhsim - deltaxsim * yxyxsim;
%         d25 = - ccasim + nxnxsim + rerersim*(rstrstsim-1)*(dstdstsim + bcsbcssim)/pistarsim + (rtrtsim-1)*rerersim*nstnstsim/pitpitsim ;
%         d16 =  - TTHETAX * (pixpixsim)^(EPS-1) + 1 - (1-TTHETAH)*(vnxvnxsim/vdxvdxsim)^(1-EPS);
%         d12 =  - TTHETAH * (pihpihsim)^(EPS-1) + 1 - (1-TTHETAH)*(vnvnsim/vdvdsim)^(1-EPS);
% 
%         M1T_RES1 = [simplify(eval(d22)); simplify(eval(d25)); simplify(eval(d16)); simplify(eval(d12))];
% 
%         % Four variables ctctsim, ltltsim, ththsim, txtxsim
% 
%         x0 = [2, 2, 2, 2];
%         myfun = @(x)STEADYM(x, M1T_RES1);
%         options = optimset('Display','iter','MaxFunEvals',20000,'MaxIter',20000,'TolFun',1e-10);
%         x = fsolve(myfun,x0,options);
% 
%         ctctsim       = x(1);
%         ltltsim       = x(2);
%         ththsim       = x(3);
%         txtxsim       = x(4);
% 
%         for KOPPA = 1:3
%             dstdstsim = 0;
%             pixpixsim = 1;
%             deltahsim = 1;     % d27  
%             deltaxsim = 1;     % d28 
%             pihpihsim = 1;     % d30 
%             pimpimsim = 1;     % d31
%             aasim = 1;         % d32 
%             tmtmsim   = ((1 - GGAMMA*ththsim^(1-EPSH))/(1-GGAMMA))^(1/(1-EPSH)); % d6
%             bcsbcssim = BCSTARSS; % d33
%             nstnstsim = NNSTAR; % d34
%             pistarsim = 1; % d35
%             cstcstsim = 1; % d36
%             rstrstsim = RRSTAR; % d37
%             pitpitsim = 1; % d38
%             ccasim = 0; % d24 
%             rerersim = tmtmsim; % d18
%             chchsim = yhyhsim; % d19
%             xtxtsim = yxyxsim; % d20
%             cmcmsim = ymymsim; % d21  
%             rtrtsim = pitpitsim/BBETA; % d1
%             yintyintsim = aasim*ltltsim; % d8 
%             mcmcsim = wtwtsim/(aasim); % d9 
%             yhyhsim = GGAMMA*(ththsim)^-EPSH *ctctsim; % d3 
%             ymymsim = (1-GGAMMA)*(tmtmsim)^-EPSH *ctctsim; %d4   
%             wtwtsim = ltltsim^CCHI * ctctsim^GGAMMAC ; % d2
%             yxyxsim = (1-GGAMMAST)*(txtxsim)^-EPSF *cstcstsim; %d5
%             rstrstsim = rtrtsim - (OOMEGA/MMBAR)*(SSIGMA^2)*dstdstsim; % d7
%             vnvnsim =  MMU*(ctctsim^-GGAMMAC)*yhyhsim*mchmchsim/((1 - TTHETAH * BBETA * (pihpihsim^-EPS))); % d10
%             vdvdsim = ctctsim^-GGAMMAC*yhyhsim/(1 - TTHETAH * BBETA * (pihpihsim^(EPS-1))); % d11 
%             vnxvnxsim = MMU*ctctsim^-GGAMMAC*yxyxsim*mcxmcxsim/(1 - TTHETAX * BBETA * (pixpixsim^-EPS)); % d14  
%             vdxvdxsim = ctctsim^-GGAMMAC*yxyxsim/(1 -  TTHETAX * BBETA * (pixpixsim^(EPS-1))); % d15
%             mchmchsim = (1-TAUH)* mcmcsim / ththsim; % d13
%             mcxmcxsim = (1-TAUX)* mcmcsim / (rerersim * txtxsim); % d17
%             btbtsim   = rerersim*(nstnstsim + bcsbcssim + dstdstsim); % d23
%             nxnxsim   = ththsim*yhyhsim + rerersim*txtxsim*yxyxsim - ctctsim ; % d26 
%         end
% 
%         THTHSS      = ththsim;
%         TXTXSS      = txtxsim;
%         YHYHSS      = yhyhsim;
%         MCHMCHSS    = mchmchsim;
%         VNVNSS      = vnvnsim;
%         VDVDSS      = vdvdsim;
%         YXYXSS      = yxyxsim;
%         MCXMCXSS    = mcxmcxsim;
%         VNXVNXSS    = vnxvnxsim;
%         VDXVDXSS    = vdxvdxsim;
%         CCSS        = ctctsim;
%         YINTYINTSS  = yintyintsim;
%         RERERSS     = rerersim;
%         PISS        = pitpitsim;
%         PISTARSS    = 1;
%         RSS         = 1/BBETA;
%         RSTARSS     = RRSTAR;
% 
%         save PARAM_SSB THTHSS TXTXSS YHYHSS MCHMCHSS VNVNSS VDVDSS YXYXSS MCXMCXSS VNXVNXSS VDXVDXSS CCSS YINTYINTSS RERERSS PISS  PISTARSS RSS RSTARSS;
%         dynare MODEL2.mod
%         
%         % Build stats
%         
%         aux_corr = cell2mat(oo_.autocorr(1,1));
%         
%         RHO_DELTAS(j)	 = aux_corr(1,1);
%         RHO_Q(j)         = aux_corr(3,3);
%         RHO_DIFFINT(j)   = aux_corr(11,11);
%         RHO_I(j)         = aux_corr(6,6);
%         SIGMA_DS_SIGMA_DY(j)    = mean(std_mat(1,:,:),3)/mean(std_mat(3,:,:),3);
%         SIGMA_DS_SIGMA_DC(j)    = mean(std_mat(1,:,:),3)/mean(std_mat(2,:,:),3);
%         SIGMA_DQ_SIGMA_DS(j)    = mean(std_mat(4,:,:),3)/mean(std_mat(1,:,:),3);
%         SIGMA_DI_SIGMA_DS(j)    = mean(std_mat(13,:,:),3)/mean(std_mat(1,:,:),3);
%         SIGMA_DC_SIGMA_DY(j)    = mean(std_mat(2,:,:),3)/mean(std_mat(3,:,:),3);
%         CORR_DQ_DS(j)           = mean(corr_mat(1,:));
%         CORR_DQ_DC(j)           = mean(corr_mat(2,:));
%         CORR_DC_DY(j)           = mean(corr_mat(3,:));
%         CORR_DA_DY(j)           = mean(corr_mat(4,:));
%         BETA_FAMAS(j)           = mean(beta_s);
%         BETA_FAMAQ(j)           = mean(beta_q);
%         
%      end
%      
%     TABLE1(1,h) = RHO_DELTAS(1);
%     TABLE1(2,h) = SIGMA_DS_SIGMA_DY(1);
%     TABLE1(3,h) = SIGMA_DS_SIGMA_DC(1);
%     TABLE1(4,h) = RHO_Q(1);
%     TABLE1(5,h) = SIGMA_DQ_SIGMA_DS(j);
%     TABLE1(6,h) = CORR_DQ_DS(1);
%     TABLE1(7,h) = CORR_DQ_DC(1);
%     TABLE1(8,h) = BETA_FAMAS(1);
%     TABLE1(9,h) = BETA_FAMAQ(1);
%     TABLE1(10,h) = SIGMA_DI_SIGMA_DS(1);
%     TABLE1(11,h) = RHO_DIFFINT(1);
%     TABLE1(12,h) = RHO_I(1);
%     TABLE1(13,h) = SIGMA_DC_SIGMA_DY(1);
%     TABLE1(13,h) = CORR_DC_DY(1);
%     TABLE1(14,h) = CORR_DA_DY(1);
% end
% 
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%manually force specific peaks for a few unusual cases

function [histoSmoothmaxima,histoSmoothmaxlocs]=manualModifications(histoSmoothmaxima,histoSmoothmaxlocs)
global GusheName
if  (strcmp('D4_G26_M1_A1_T1_lastC_2 afshaari_jaamehdaraan', GusheName) == true ) ||...
        (strcmp('D4_G26_M1_A1_T1_firstB_2 afshaari_jaamehdaraan', GusheName) == true )
    fprintf("Gushe=%s\n", GusheName);
    histoSmoothmaxima = [histoSmoothmaxima; 20]
    histoSmoothmaxlocs = [histoSmoothmaxlocs; 2650]  
end

if  (strcmp('D1_G55_M0_A4_T2_firstB_1 shur_salmak', GusheName) == true ) ||...
        (strcmp('D1_G55_M0_A4_T2_lastC_1 shur_salmak', GusheName) == true )
    fprintf("Gushe=%s\n", GusheName);
    histoSmoothmaxima = [histoSmoothmaxima; 5]
    histoSmoothmaxlocs = [histoSmoothmaxlocs; 2615]    
end


if  (strcmp('D9_G18_M1_A1_T1_firstB_3 bayaatEsfahaan_jamedaraan', GusheName) == true ) ||...
        (strcmp('D9_G18_M1_A1_T1_lastC_3 bayaatEsfahaan_jamedaraan', GusheName) == true )
    fprintf("Gushe=%s\n", GusheName);
    histoSmoothmaxlocs(3) = 2420    
end


if  (strcmp('D8_G110_M1_A1_T1_firstB_10 homaayun_raazOniaaz_ii', GusheName) == true ) ||...
        (strcmp('D8_G110_M1_A1_T1_lastC_10 homaayun_raazOniaaz_ii', GusheName) == true )
    fprintf("Gushe=%s\n", GusheName);
    histoSmoothmaxlocs
    histoSmoothmaxlocs(6) = 2800;
    histoSmoothmaxlocs(7) = 2870;
    histoSmoothmaxima(7) = histoSmoothmaxima(6);   
end

if  (strcmp('D10_G117_M1_A1_T1_firstB_9 segaah_hodiOpahlavi', GusheName) == true ) ||...
        (strcmp('D10_G117_M1_A1_T1_firstB_9 segaah_hodiOpahlavi', GusheName) == true )
    fprintf("Gushe=%s\n", GusheName);
    histoSmoothmaxlocs = [histoSmoothmaxlocs(1:5); histoSmoothmaxlocs(5:end)]
    histoSmoothmaxima =  [ histoSmoothmaxima(1:5); histoSmoothmaxima(5:end) ];
    histoSmoothmaxlocs(5) = 2360;
    histoSmoothmaxlocs(6) = 2399;    
end

if  (strcmp('D1_G111_M0_A12_T2_firstB_1 shur_razavi', GusheName) == true ) ||...
        (strcmp('D1_G111_M0_A12_T2_lastC_1 shur_razavi', GusheName) == true )
    fprintf("Gushe=%s\n", GusheName);    
    histoSmoothmaxlocs = [histoSmoothmaxlocs(1:2); histoSmoothmaxlocs(2:end)]
    histoSmoothmaxima =  [ histoSmoothmaxima(1:2); histoSmoothmaxima(2:end) ];    
    %histoSmoothmaxlocs(4) = histoSmoothmaxlocs(3)
    histoSmoothmaxlocs(2) = 2970
    audioShahed = histoSmoothmaxlocs(2)
    audioShahedSpare = histoSmoothmaxlocs(3)
end

if  (strcmp('D5_G10_M0_A23_T2_firstB_1 dashti_raje_iraj', GusheName) == true ) ||...
        (strcmp('D5_G10_M0_A23_T2_lastC_1 dashti_raje_iraj', GusheName) == true )
    fprintf("Gushe=%s\n", GusheName);
    histoSmoothmaxlocs
    histoSmoothmaxima =  [ histoSmoothmaxima(1)/2; histoSmoothmaxima; histoSmoothmaxima(end)/2 ];    
    histoSmoothmaxlocs(1) = 3150;
    histoSmoothmaxlocs(2) = 3350;
    histoSmoothmaxlocs(3) = 3420;
    histoSmoothmaxlocs(4) = 3583;
    histoSmoothmaxlocs(5) = 3800;
end
    
end


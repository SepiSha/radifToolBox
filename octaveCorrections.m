
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [Y_centExtrapolated] = octaveCorrections(Y_centExtrapolated,PitchFileName)

global GusheName;

%{
figure;
plot ( Y_centExtrapolated );
title("pitchfile");
%}

if strncmp(GusheName, "D1_G5_M0_A13_T2_firstB_1 shur_daraamad_Taaherzaadeh", 16)  %3600-4200
    Y_centExtrapolated ( Y_centExtrapolated > 4000) = Y_centExtrapolated (Y_centExtrapolated >4000) - 1200;
    
elseif  strncmp(GusheName, "D1_G5_M0_A18_T2_lastC_1 shur_daraamad_Zelli", 16)  %3200-3860
    Y_centExtrapolated ( Y_centExtrapolated > 3700) = Y_centExtrapolated (Y_centExtrapolated >3700) - 1200;
    
elseif  strncmp(GusheName, "D1_G5_M0_A16_T2_firstB_1 shur_daraamad_Zabihi", 16)  %3200-3860
    %Y_centExtrapolated ( Y_centExtrapolated > 3700) = Y_centExtrapolated (Y_centExtrapolated >3700) - 1200;
    
elseif  strncmp(GusheName, "D1_G5_M0_A17_T2_firstB_1 shur_daraamad_Qamar", 16)  %3200-3860
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
elseif  strncmp(GusheName, "D1_G5_M0_A2_T2_firstB_1 shur_daraamad_Aazar", 15)  %3000-3500
    Y_centExtrapolated ( Y_centExtrapolated > 3200)  = Y_centExtrapolated ( Y_centExtrapolated > 3200) - 1200;
elseif  strncmp(GusheName, "D1_G55_M0_A14_T2_firstB_1 shur_salmak", 15)  %3400-3900
    Y_centExtrapolated ( Y_centExtrapolated > 3500)  = Y_centExtrapolated ( Y_centExtrapolated > 3500) - 1200;
elseif  strncmp(GusheName, "D1_G55_M0_A22_T2_lastC_1 shur_salmak", 15)  %3300-3700
    Y_centExtrapolated ( Y_centExtrapolated > 3500)  = Y_centExtrapolated ( Y_centExtrapolated > 3500) - 1200;
elseif  strncmp(GusheName, "D1_G55_M0_A16_T2_firstB_1 shur_salmak", 15)  %3300-3700
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
elseif  strncmp(GusheName, "D1_G55_M0_A23_T2_firstB_1 shur_salmak", 15)  %3700-4200
    Y_centExtrapolated ( Y_centExtrapolated > 3850)  = Y_centExtrapolated ( Y_centExtrapolated > 3850) - 1200;
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D1_G55_M0_A17_T2_firstB_1 shur_salmak", 15)  %4600-5100
    Y_centExtrapolated ( Y_centExtrapolated > 4800)  = Y_centExtrapolated ( Y_centExtrapolated > 4800) - 1200;
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
elseif  strncmp(GusheName, "D1_G55_M0_A18_T2_firstB_1 shur_salmak", 15)  %3400-3850
    Y_centExtrapolated ( Y_centExtrapolated > 3500)  = Y_centExtrapolated ( Y_centExtrapolated > 3500) - 1200;
    %Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
elseif  strncmp(GusheName, "D1_G55_M0_A2_T2_lastC_1 shur_salmak", 15)  %3250 -3450
    Y_centExtrapolated ( Y_centExtrapolated > 3300)  = Y_centExtrapolated ( Y_centExtrapolated > 3300) - 1200;
    %Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D1_G55_M0_A4_T2_firstB_1 shur_salmakk", 15)  %3250 -3450
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D5_G10_M0_A14_T2_firstB_1 dashti_raje_banaan", 15)  %4600-5000   3600-3800
    Y_centExtrapolated ( Y_centExtrapolated > 5000)  = Y_centExtrapolated ( Y_centExtrapolated > 5000) - 1200;
    Y_centExtrapolated ( Y_centExtrapolated > 3700)  = Y_centExtrapolated ( Y_centExtrapolated > 3700) - 1200;
elseif  strncmp(GusheName, "D5_G10_M0_A16_T2_firstB_1 dashti_raje_zabihi", 15)  %3100-3500
    Y_centExtrapolated ( Y_centExtrapolated > 3300)  = Y_centExtrapolated ( Y_centExtrapolated > 3300) - 1200;
    %Y_centExtrapolated ( Y_centExtrapolated > 3700)  = Y_centExtrapolated ( Y_centExtrapolated > 3700) - 1200;
elseif  strncmp(GusheName, "D5_G10_M0_A22_T2_firstB_1 dashti_raje_shajariyaan", 15)  %3650-4050
    Y_centExtrapolated ( Y_centExtrapolated > 3800)  = Y_centExtrapolated ( Y_centExtrapolated > 3800) - 1200;
    
elseif  strncmp(GusheName, "D5_G10_M0_A23_T2_firstB_1 dashti_raje_iraj", 15)  %4000-4500
    Y_centExtrapolated ( Y_centExtrapolated > 4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D5_G10_M0_A24_T2_firstB_1 dashti_raje_golpaa", 15)  %3500-3700
    Y_centExtrapolated ( Y_centExtrapolated > 3600)  = Y_centExtrapolated ( Y_centExtrapolated > 3600) - 1200;
    
elseif  strncmp(GusheName, "D5_G10_M0_A8_T2_firstB_1 dashti_raje_adibXaansaari", 15)  %3200-3500
    Y_centExtrapolated ( Y_centExtrapolated > 3300)  = Y_centExtrapolated ( Y_centExtrapolated > 3300) - 1200;
    
elseif  strncmp(GusheName, "D3_G64_M1_A1_T1_lastC_12 zand_masnavi", 15)  %3300-3700
    Y_centExtrapolated ( Y_centExtrapolated > 3400)  = Y_centExtrapolated ( Y_centExtrapolated > 3400) - 1200;
    
elseif  strncmp(GusheName, "D3_G48_M1_A1_T1_lastC_7 zand_shekasteh", 15)  %3450 - 3750
    Y_centExtrapolated ( Y_centExtrapolated > 3600)  = Y_centExtrapolated ( Y_centExtrapolated > 3600) - 1200;
    
    
    
elseif  strncmp(GusheName, "D5_G13_M0_A14_T2_firstB_1 dashti_owj_banaan", 15)  %3800 - 4200
    Y_centExtrapolated ( Y_centExtrapolated > 4000)  = Y_centExtrapolated ( Y_centExtrapolated > 4000) - 1200;
    
elseif  strncmp(GusheName, "D5_G13_M0_A24_T2_firstB_1 dashti_owj_golpaa", 15)  %3900-4050
    Y_centExtrapolated ( Y_centExtrapolated > 4000)  = Y_centExtrapolated ( Y_centExtrapolated > 4000) - 1200;
    
elseif  strncmp(GusheName, "D5_G13_M0_A17_T2_firstB_1 dashti_owj_qamarolmolukVaziri", 15)  %4200 - 4500
    Y_centExtrapolated ( Y_centExtrapolated > 4300)  = Y_centExtrapolated ( Y_centExtrapolated > 4300) - 1200;
    
elseif  strncmp(GusheName, "D5_G13_M0_A22_T2_firstB_1 dashti_owj_shajariyaan", 15)  %4200 - 4500
    Y_centExtrapolated ( 1598:1826)  = Y_centExtrapolated ( 1598:1826) - 1200;
    Y_centExtrapolated ( 3074:3166)  = Y_centExtrapolated ( 3074:3166) - 1200;
    Y_centExtrapolated ( 3944:4324)  = Y_centExtrapolated ( 3944:4324) - 1200;
    Y_centExtrapolated ( 3061)  = Y_centExtrapolated ( 3061) - 1200;
    
elseif  strncmp(GusheName, "D5_G13_M0_A8_T2_firstB_1 dashti_owj_adibXaansaari", 15)  %3400-3700
    Y_centExtrapolated ( Y_centExtrapolated > 3500)  = Y_centExtrapolated ( Y_centExtrapolated > 3500) - 1200;
    
elseif  strncmp(GusheName, "D5_G13_M0_A25_T2_firstB_1 dashti_owj_mahmudiXaansaari", 15)  %3750-4100
    Y_centExtrapolated ( Y_centExtrapolated > 3900)  = Y_centExtrapolated ( Y_centExtrapolated > 3900) - 1200;
    
    
    
elseif  strncmp(GusheName, "D1_G156_M0_A11_T2_firstB_1 shur_bayaatKord_damaavandi", 15)  %3400 -4100
    Y_centExtrapolated ( Y_centExtrapolated > 3900)  = Y_centExtrapolated ( Y_centExtrapolated > 3900) - 1200;
    
elseif  strncmp(GusheName, "D1_G156_M0_A13_T2_firstB_1 shur_bayaatKord_taaherzaadeh", 15)  %3600 -4400
    Y_centExtrapolated ( Y_centExtrapolated > 3900)  = Y_centExtrapolated ( Y_centExtrapolated > 3900) - 1200;
    
elseif  strncmp(GusheName, "D1_G156_M0_A2_T2_firstB_1 shur_bayaatKord_eqbaalAazar", 15)  %3600 -4400
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D1_G156_M0_A22_T2_firstB_1 shur_bayaatKord_shajariyaan", 15)  %3600 -4400
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D3_G7_M0_A11_T2_firstB_1 bayaatZand_daraamad_damaavandi", 15)  %3500-3850
    Y_centExtrapolated ( Y_centExtrapolated > 3600)  = Y_centExtrapolated ( Y_centExtrapolated > 3600) - 1200;
    
elseif  strncmp(GusheName, "D3_G7_M0_A13_T2_firstB_1 bayaatZand_daraamad_taaherzaadeh", 15)  %3800-4200
    Y_centExtrapolated ( Y_centExtrapolated > 4000)  = Y_centExtrapolated ( Y_centExtrapolated > 4000) - 1200;
    
elseif  strncmp(GusheName, "D3_G7_M0_A17_T2_firstB_1 bayaatZand_daraamad_qamarolmolukVaziri", 15)  %3800-4200
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    Y_centExtrapolated ( 2419:2454)                  = Y_centExtrapolated (2419:2454)                 +1200;
    
elseif  strncmp(GusheName, "D3_G7_M0_A18_T2_firstB_1 bayaatZand_daraamad_zelli", 15)  %3550-4100
    Y_centExtrapolated ( Y_centExtrapolated > 3900)  = Y_centExtrapolated ( Y_centExtrapolated > 3900) - 1200;
    
elseif  strncmp(GusheName, "D3_G7_M0_A22_T2_firstB_1 bayaatZand_daraamad_shajariyaan", 15)  %3900-4200
    Y_centExtrapolated ( Y_centExtrapolated > 3900)  = Y_centExtrapolated ( Y_centExtrapolated > 3900) - 1200;
    %2800-3200
    %Y_centExtrapolated ( Y_centExtrapolated > 3000)  = Y_centExtrapolated ( Y_centExtrapolated > 3000) - 1200;
    
elseif  strncmp(GusheName, "D3_G7_M0_A2_T2_firstB_1 bayaatZand_daraamad_eqbaalAazar", 15)  %3800-4100
    Y_centExtrapolated ( Y_centExtrapolated > 3900)  = Y_centExtrapolated ( Y_centExtrapolated > 3900) - 1200;
    Y_centExtrapolated ( 3240:3329)                  = Y_centExtrapolated ( 3240:3329)                 + 702;
    Y_centExtrapolated ( 3330:3450)                  = Y_centExtrapolated ( 3330:3450)                 + 1200;
    
elseif  strncmp(GusheName, "D3_G7_M0_A9_T2_firstB_1 bayaatZand_daraamad_taajEsphahaani", 15)  %3600-4000
    Y_centExtrapolated ( Y_centExtrapolated > 3900)  = Y_centExtrapolated ( Y_centExtrapolated > 3900) - 1200;
    
elseif  strncmp(GusheName, "D3_G38_M1_A1_T1_firstB_6 zand_feyli", 15)  %3400-3800
    Y_centExtrapolated ( Y_centExtrapolated > 3600)  = Y_centExtrapolated ( Y_centExtrapolated > 3600) - 1200;
    
elseif  strncmp(GusheName, "D3_G27_M1_A1_T1_firstB_5 zand_jaamedaraan", 15)  %3100-3400
    Y_centExtrapolated ( Y_centExtrapolated > 3200)  = Y_centExtrapolated ( Y_centExtrapolated > 3200) - 1200;
    
elseif  strncmp(GusheName, "D12_G25_M1_A1_T1_firstB_10 navaa_eraaq", 15)  %3500-3600
    Y_centExtrapolated ( Y_centExtrapolated > 3550)  = Y_centExtrapolated ( Y_centExtrapolated > 3550) - 1200;
    
elseif  strncmp(GusheName, "D3_G16_M0_A17_T2_firstB_1 bayaatZand_daad_qamarolmolukVaziri", 15)  %4100-4200
    Y_centExtrapolated ( Y_centExtrapolated > 4150)  = Y_centExtrapolated ( Y_centExtrapolated > 4150) - 1200;
    
elseif  strncmp(GusheName, "D3_G16_M0_A18_T2_firstB_1 bayaatZand_daad_zelli", 15)  %3800-3900
    Y_centExtrapolated ( Y_centExtrapolated > 3850)  = Y_centExtrapolated ( Y_centExtrapolated > 3850) - 1200;
    
elseif  strncmp(GusheName, "D3_G16_M0_A22_T2_firstB_1 bayaatZand_daad_shajariyaan", 15)  %3800-3900
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D3_G16_M0_A23_T2_firstB_1 bayaatZand_daad_iraj", 15)  %3750
    Y_centExtrapolated ( Y_centExtrapolated > 3750)  = Y_centExtrapolated ( Y_centExtrapolated > 3750) - 1200;
    
elseif  strncmp(GusheName, "D3_G16_M0_A25_T2_firstB_1 bayaatZand_daad_mahmudiXaansaari", 15)  %3600
    Y_centExtrapolated ( Y_centExtrapolated > 3750)  = Y_centExtrapolated ( Y_centExtrapolated > 3750) - 1200;
    
elseif  strncmp(GusheName, "D8_G10_M0_A13_T2_firstB_1 homaayun_daraamad_taaherZaadeh", 15)  %4000
    Y_centExtrapolated ( Y_centExtrapolated > 4000)  = Y_centExtrapolated ( Y_centExtrapolated > 4000) - 1200;
    
elseif  strncmp(GusheName, "D8_G10_M0_A16_T2_firstB_1 homaayun_daraamad_zabihi", 15)  %3450
    Y_centExtrapolated ( Y_centExtrapolated > 3450)  = Y_centExtrapolated ( Y_centExtrapolated > 3450) - 1200;
    
elseif  strncmp(GusheName, "D8_G10_M0_A17_T2_firstB_1 homaayun_daraamad_qamarVaziri", 15)  %
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
elseif  strncmp(GusheName, "D8_G10_M0_A18_T2_firstB_1 homaayun_daraamad_zelli", 15)  %3600-3800
    Y_centExtrapolated ( Y_centExtrapolated > 3700)  = Y_centExtrapolated ( Y_centExtrapolated > 3700) - 1200;
    
elseif  strncmp(GusheName, "D8_G10_M0_A2_T2_firstB_1 homaayun_daraamad_eqbaalAazar", 15)  %3400-3600
    Y_centExtrapolated ( Y_centExtrapolated > 3500)  = Y_centExtrapolated ( Y_centExtrapolated > 3500) - 1200;
    
elseif  strncmp(GusheName, "D8_G10_M0_A3_T2_firstB_1 homaayun_daraamad_ahmadXaan", 15)  %3750-4000
    Y_centExtrapolated ( Y_centExtrapolated > 3800)  = Y_centExtrapolated ( Y_centExtrapolated > 3800) - 1200;
    
elseif  strncmp(GusheName, "D8_G10_M0_A9_T2_firstB_1 homaayun_daraamad_taajEsphahaani", 15)  %3950
    Y_centExtrapolated ( Y_centExtrapolated > 3950)  = Y_centExtrapolated ( Y_centExtrapolated > 3950) - 1200;
    
    
elseif  strncmp(GusheName, "D8_G29_M0_A13_T2_firstB_1 homaayun_chakaavak_taaherZaadeh", 15)  %3000-3200
    Y_centExtrapolated ( Y_centExtrapolated > 3100)  = Y_centExtrapolated ( Y_centExtrapolated > 3100) - 1200;
    
elseif  strncmp(GusheName, "D8_G29_M0_A16_T2_firstB_1 homaayun_chakaavak_zabihi", 15)  %3550-3750
    Y_centExtrapolated ( Y_centExtrapolated > 3650)  = Y_centExtrapolated ( Y_centExtrapolated > 3650) - 1200;
    
elseif  strncmp(GusheName, "D8_G29_M0_A17_T2_firstB_1 homaayun_chakaavak_qamarVaziri", 15)  %3550-3750
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D8_G29_M0_A18_T2_firstB_1 homaayun_chakaavak_zelli", 15)  %3700-4100
    Y_centExtrapolated ( Y_centExtrapolated > 3800)  = Y_centExtrapolated ( Y_centExtrapolated > 3800) - 1200;
    
elseif  strncmp(GusheName, "D8_G29_M0_A22_T2_firstB_1 homaayun_chakaavak_shajariyaan", 15)  %3750-4100
    Y_centExtrapolated ( Y_centExtrapolated > 3800)  = Y_centExtrapolated ( Y_centExtrapolated > 3800) - 1200;
    
elseif  strncmp(GusheName, "D8_G29_M0_A2_T2_firstB_1 homaayun_chakaavak_eqbaalAazar", 15)  %4000-4500
    Y_centExtrapolated ( Y_centExtrapolated > 4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D8_G37_M0_A13_T2_firstB_1 homaayun_bidaad_taaherZaadeh", 15)  %4100 - 4300
    Y_centExtrapolated ( Y_centExtrapolated > 4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D8_G37_M0_A22_T2_firstB_1 homaayun_bidaad_shajariyaan", 15)  %3200-3900
    Y_centExtrapolated ( Y_centExtrapolated > 3500)  = Y_centExtrapolated ( Y_centExtrapolated > 3500) - 1200;
    Y_centExtrapolated ( Y_centExtrapolated < 500)  = 0;
    
elseif  strncmp(GusheName, "D8_G37_M0_A23_T2_firstB_1 homaayun_bidaad_iraj", 15)  %4000-4450
    Y_centExtrapolated ( Y_centExtrapolated > 4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D8_G37_M0_A18_T2_firstB_1 homaayun_bidaad_zelli", 15)  %3800 - 4400
    Y_centExtrapolated ( Y_centExtrapolated > 4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    Y_centExtrapolated ( Y_centExtrapolated < 500)  = 0;
    
elseif  strncmp(GusheName, "D8_G37_M0_A2_T2_firstB_1 homaayun_bidaad_eqbaalAazar", 15)  %2850-2900
    Y_centExtrapolated ( Y_centExtrapolated > 2850)  = Y_centExtrapolated ( Y_centExtrapolated > 2850) - 1200;
    
    
elseif  strncmp(GusheName, "D8_G85_M0_A11_T2_firstB_1 homaayun_shushtari_damaavandi", 15)  %4000
    Y_centExtrapolated ( Y_centExtrapolated > 4000)  = Y_centExtrapolated ( Y_centExtrapolated > 4000) - 1200;
    
elseif  strncmp(GusheName, "D8_G85_M0_A13_T2_firstB_1 homaayun_shushtari_taaherZaadeh", 15)  %4300
    Y_centExtrapolated ( Y_centExtrapolated > 4300)  = Y_centExtrapolated ( Y_centExtrapolated > 4300) - 1200;
    
elseif  strncmp(GusheName, "D8_G85_M0_A18_T2_firstB_1 homaayun_shushtari_zelli", 15)  %4300
    Y_centExtrapolated ( Y_centExtrapolated > 4300)  = Y_centExtrapolated ( Y_centExtrapolated > 4300) - 1200;
    
elseif  strncmp(GusheName, "D8_G85_M0_A2_T2_firstB_1 homaayun_shushtari_eqbaalAazar", 15)  %
    Y_centExtrapolated ( Y_centExtrapolated > 300)  = Y_centExtrapolated ( Y_centExtrapolated > 300) - 1200;
    
elseif  strncmp(GusheName, "D9_G8_M0_A11_T2_firstB_1 esphahaan_daraamad_damaavandi", 15)  %4300
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D9_G8_M0_A17_T2_firstB_1 esphahaan_daraamad_qamarVaziri", 15)  %4300
    Y_centExtrapolated ( Y_centExtrapolated > 3800)  = Y_centExtrapolated ( Y_centExtrapolated > 3800) - 1200;
    
elseif  strncmp(GusheName, "D9_G8_M0_A18_T2_firstB_1 esphahaan_daraamad_zelli", 15)  %3700-3900
    Y_centExtrapolated ( Y_centExtrapolated > 3800)  = Y_centExtrapolated ( Y_centExtrapolated > 3800) - 1200;
    
elseif  strncmp(GusheName, "D9_G8_M0_A13_T2_firstB_1 esphahaan_daraamad_taaherZaadeh", 15)  %3900-4100
    Y_centExtrapolated ( Y_centExtrapolated > 4000)  = Y_centExtrapolated ( Y_centExtrapolated > 4000) - 1200;
    
elseif  strncmp(GusheName, "D9_G8_M0_A16_T2_firstB_1 esphahaan_daraamad_zabihi", 15)  %3200-3600
    Y_centExtrapolated ( Y_centExtrapolated > 3800)  = Y_centExtrapolated ( Y_centExtrapolated > 3800) - 1200;
    
elseif  strncmp(GusheName, "D9_G8_M0_A22_T2_firstB_1 esphahaan_daraamad_shajariyaan", 15)  %3200-3600
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    Y_centExtrapolated ( Y_centExtrapolated < 500)  = 0;
    
elseif  strncmp(GusheName, "D9_G8_M0_A8_T2_firstB_1 esphahaan_daraamad_adibXaansaari", 15)  %3200-3600
    Y_centExtrapolated ( Y_centExtrapolated > 200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D12_G43_M1_A1_T1_firstB_9 navaa_hoseyni", 15)  %3450
    Y_centExtrapolated ( Y_centExtrapolated >3450)  = Y_centExtrapolated ( Y_centExtrapolated > 3450) - 1200;
    
elseif  strncmp(GusheName, "D12_G42_M1_A1_T1_firstB_7 navaa_xojasteh", 15)  %3300 - 3800
    Y_centExtrapolated ( Y_centExtrapolated >3500)  = Y_centExtrapolated ( Y_centExtrapolated > 3500) - 1200;
    
elseif  strncmp(GusheName, "D12_G32_M1_A1_T1_firstB_6 navaa_nahoft", 15)  %3200 - 3800
    Y_centExtrapolated ( Y_centExtrapolated >3500)  = Y_centExtrapolated ( Y_centExtrapolated > 3500) - 1200;
    Y_centExtrapolated ( 10614:10630)  = 2500,
    
elseif  strncmp(GusheName, "D3_G48_M0_A16_T2_firstB_1 bayaatZand_shekasteh_zabihi", 15)  %4000 4300
    Y_centExtrapolated ( Y_centExtrapolated >4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D3_G48_M0_A18_T2_firstB_1 bayaatZand_shekasteh_zelli", 15)  %4000 4700
    Y_centExtrapolated ( Y_centExtrapolated >4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D3_G48_M0_A22_T2_firstB_1 bayaatZand_shekasteh_shajariyaan", 15)  %3600-4100
    Y_centExtrapolated ( Y_centExtrapolated >4000)  = Y_centExtrapolated ( Y_centExtrapolated > 4000) - 1200;
    
elseif  strncmp(GusheName, "D3_G48_M0_A25_T2_firstB_1 bayaatZand_shekasteh_mahmudiXaansaari", 15)  %3600-4100??
    Y_centExtrapolated ( Y_centExtrapolated >200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D3_G38_M0_A15_T2_firstB_1 bayaatZand_feyli_abdolvahaabShahidi", 15)  %3600-3800
    Y_centExtrapolated ( Y_centExtrapolated >3700)  = Y_centExtrapolated ( Y_centExtrapolated > 3700) - 1200;
    
elseif  strncmp(GusheName, "D3_G38_M0_A22_T2_firstB_1 bayaatZand_feyli_shajariyaan", 15)  %3950-4350
    Y_centExtrapolated ( Y_centExtrapolated >4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D2_G6_M0_A13_T2_firstB_1 abuataa_daraamad_taaherzaadeh", 15)  %3700-4200
    Y_centExtrapolated ( Y_centExtrapolated >4000)  = Y_centExtrapolated ( Y_centExtrapolated > 4000) - 1200;
    
elseif  strncmp(GusheName, "D2_G6_M0_A14_T2_firstB_1 abuataa_daraamad_banaan", 15)  %3300-3550
    Y_centExtrapolated ( Y_centExtrapolated >3400)  = Y_centExtrapolated ( Y_centExtrapolated > 3400) - 1200;
    t = Y_centExtrapolated (2700:end)  ;
    t (t < 2000 & t>200) = t (t < 2000 & t>200) +1200
    t (t < 1800 & t>200) = t (t < 1800 & t>200) +702
    Y_centExtrapolated (2700:end) = t;
    
elseif  strncmp(GusheName, "D2_G6_M0_A2_T2_firstB_1 abuataa_daraamad_eqbaalAazar", 15)  %3550 - 3850
    Y_centExtrapolated ( Y_centExtrapolated >3500)  = Y_centExtrapolated ( Y_centExtrapolated > 3500) - 1200;
    
elseif  strncmp(GusheName, "D2_G6_M0_A18_T2_firstB_1 abuataa_daraamad_zelli", 15)  %3550 - 3850
    Y_centExtrapolated ( Y_centExtrapolated >200 & Y_centExtrapolated<2200)  = ...
        Y_centExtrapolated ( Y_centExtrapolated > 200 & Y_centExtrapolated<2200) + 1200;
    Y_centExtrapolated ( Y_centExtrapolated >200 & Y_centExtrapolated<2200)  = ...
        Y_centExtrapolated ( Y_centExtrapolated > 200 & Y_centExtrapolated<2200) + 1200;
    
elseif  strncmp(GusheName, "D2_G6_M0_A17_T2_firstB_1 abuataa_daraamad_qamarolmolukVaziri", 15)  %3900 - 4500
    Y_centExtrapolated ( Y_centExtrapolated >4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D9_G21_M0_A13_T2_firstB_1 esphahaan_raaje_taaherZaadeh", 15)  %3900 - 4500
    Y_centExtrapolated ( Y_centExtrapolated >4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D9_G21_M0_A18_T2_firstB_1 esphahaan_raaje_zelli", 15)  %4000 - 4500
    Y_centExtrapolated ( Y_centExtrapolated >4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D9_G21_M0_A17_T2_firstB_1 esphahaan_raaje_qamarVaziri", 15)  %4000 - 4500
    Y_centExtrapolated ( Y_centExtrapolated >200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D12_G32_M0_A22_T2_firstB_1 navaa_nahoft_shajariyaan", 15)  %4000 - 4500
    Y_centExtrapolated ( Y_centExtrapolated <2200)  = 0;
    
elseif  strncmp(GusheName, "D12_G32_M0_A2_T2_firstB_1 navaa_nahoft_eqbaalAazar", 15)  %4000 - 4500
    Y_centExtrapolated ( 3274:3372)  = Y_centExtrapolated ( 3274:3372) - 1200;
    Y_centExtrapolated ( 5114:5155)  = Y_centExtrapolated ( 5114:5155) - 1200;
    Y_centExtrapolated ( 6093:6297)  = Y_centExtrapolated ( 6093:6297) - 1200;
    
elseif  strncmp(GusheName, "D12_G38_M0_A2_T2_firstB_1 navaa_neyshaaburak_eqbaalAazar", 15)  %3400-4100
    Y_centExtrapolated ( Y_centExtrapolated >3500)  = Y_centExtrapolated ( Y_centExtrapolated > 3500) - 1200;
    
elseif  strncmp(GusheName, "D12_G3_M0_A13_T2_firstB_1 navaa_daraamad_taaherZaadeh", 15)  %4000-4300
    Y_centExtrapolated ( Y_centExtrapolated >4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    Y_centExtrapolated ( Y_centExtrapolated >3000)  = Y_centExtrapolated ( Y_centExtrapolated > 3000) - 1200;
    
elseif  strncmp(GusheName, "D12_G3_M0_A17_T2_firstB_1 navaa_daraamad_qamarVazirih", 15)  %3400-4100
    Y_centExtrapolated ( Y_centExtrapolated >200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D12_G3_M0_A2_T2_firstB_1 navaa_daraamad_eqbaalAazar", 15)  %3000-3500
    Y_centExtrapolated ( Y_centExtrapolated >3200)  = Y_centExtrapolated ( Y_centExtrapolated > 3200) - 1200;
    
elseif  strncmp(GusheName, "D12_G3_M0_A9_T2_firstB_1 navaa_daraamad_taajEsphahaani", 15)  %3750-4000
    Y_centExtrapolated ( Y_centExtrapolated >3800)  = Y_centExtrapolated ( Y_centExtrapolated > 3800) - 1200;
    
elseif  strncmp(GusheName, "D2_G37_M0_A11_T2_firstB_1 abuataa_Hejaz_damaavandi", 15)  %4000-4350
    Y_centExtrapolated ( Y_centExtrapolated >4200)  = Y_centExtrapolated ( Y_centExtrapolated > 4200) - 1200;
    
elseif  strncmp(GusheName, "D2_G37_M0_A25_T2_firstB_1 abuataa_Hejaz_mahmudiXaansaari", 15)  %3750-4000
    Y_centExtrapolated ( Y_centExtrapolated >3800)  = Y_centExtrapolated ( Y_centExtrapolated > 3800) - 1200;
    
elseif  strncmp(GusheName, "D2_G37_M0_A13_T2_firstB_1 abuataa_Hejaz_taaherzaadeh", 15)  %3750-4000
    Y_centExtrapolated (692:780 )  = Y_centExtrapolated (692:780) + 1200;
    
elseif  strncmp(GusheName, "D2_G37_M0_A2_T2_firstB_1 abuataa_Hejaz_eqbaalAazar", 15)  %3750-4000
    t= Y_centExtrapolated( 1400:1900);
    Y_centExtrapolated ( Y_centExtrapolated >4000)  = Y_centExtrapolated ( Y_centExtrapolated > 4000) - 1200;
    Y_centExtrapolated( 1400:1900) = t;
    
elseif  strncmp(GusheName, "D2_G37_M0_A13_T2_firstB_1 abuataa_Hejaz_taaherzaadeh", 15)  %4200-4700
    Y_centExtrapolated ( Y_centExtrapolated >4500)  = Y_centExtrapolated ( Y_centExtrapolated > 4500) - 1200;
    
elseif  strncmp(GusheName, "D2_G37_M0_A17_T2_firstB_1 abuataa_Hejaz_qamarolmolukVaziri", 15)  %4200-4700
    Y_centExtrapolated ( Y_centExtrapolated >4500)  = Y_centExtrapolated ( Y_centExtrapolated > 4500) - 1200;
    
elseif  strncmp(GusheName, "D2_G37_M0_A6_T2_firstB_1 abuataa_Hejaz_amirQasemi", 15)  %4200-4700
    Y_centExtrapolated ( Y_centExtrapolated >200)  = Y_centExtrapolated ( Y_centExtrapolated > 200) - 1200;
    
elseif  strncmp(GusheName, "D2_G37_M0_A22_T2_firstB_1 abuataa_Hejaz_shajariyaan", 15)  %4200-4700
    t= Y_centExtrapolated( 4000:4400);
    Y_centExtrapolated ( Y_centExtrapolated >3800)  = Y_centExtrapolated ( Y_centExtrapolated > 3800) - 1200;
    Y_centExtrapolated( 4000:4400) = t;
    
elseif  strncmp(GusheName, "D2_G37_M0_A9_T2_firstB_1 abuataa_Hejaz_taajEsphahaani", 15)  %3200-3450
    Y_centExtrapolated ( Y_centExtrapolated >3300)  = Y_centExtrapolated ( Y_centExtrapolated > 3300) - 1200;
    
elseif  strncmp(GusheName, "D5_G55_M1_A1_T1_firstB_9 dashti_masnavi", 15)  %3200-3450
    Y_centExtrapolated ( Y_centExtrapolated >3400)  = Y_centExtrapolated ( Y_centExtrapolated > 3400) - 1200;
    
    
    %%%%%%%% MOST Gush's have been run with the following  line, but then
    %%%%%%%% they were removed... we may need corrections for many!
    %    Y_centExtrapolated ( Y_centExtrapolated >3680) = Y_centExtrapolated ( Y_centExtrapolated >3680) -1200; %davaami D4_G35 needs this
    
elseif max( Y_centExtrapolated ) >3600
    fprintf("GusheName= %s\n", GusheName);
    error(" ycent > 3600");
end
if  strncmp(GusheName, "D8_G37_M0_A2_T2_firstB_1 homaayun_bidaad_eqbaalAazar", 15)  %2600-2700
    Y_centExtrapolated ( Y_centExtrapolated > 2650)  = Y_centExtrapolated ( Y_centExtrapolated > 2650) - 1200;
    Y_centExtrapolated ( Y_centExtrapolated < 1710 & Y_centExtrapolated >200)  = ...
        Y_centExtrapolated ( Y_centExtrapolated < 1710 & Y_centExtrapolated >200) + 702;
    
end

if strncmp(PitchFileName,"D1_G5_M0_A14_T2_firstB_1 shur_daraamad_Banaan", 16);
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated <1200 ) = ...
        Y_centExtrapolated (  Y_centExtrapolated>200 & Y_centExtrapolated <1200 ) +1200;
    
    Y_centExtrapolated ( Y_centExtrapolated>2857) = Y_centExtrapolated ( Y_centExtrapolated>2857) -1200;
    %Y_centExtrapolated ( 1429:1692) = Y_centExtrapolated (1429:1692) -702;
    %Y_centExtrapolated ( 1724:1785) = Y_centExtrapolated (1724:1785) -702;
    
    %Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
end

if strncmp(PitchFileName,"D1_G5_M0_A17_T2_", 16);
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    %Y_centExtrapolated ( Y_centExtrapolated>1300  ) =  Y_centExtrapolated (  Y_centExtrapolated>1300  ) -1200;
    
    %Y_centExtrapolated ( Y_centExtrapolated>2857) = Y_centExtrapolated ( Y_centExtrapolated>2857) -1200;
    %Y_centExtrapolated ( 1429:1692) = Y_centExtrapolated (1429:1692) -702;
    %Y_centExtrapolated ( 1724:1785) = Y_centExtrapolated (1724:1785) -702;
    
    %Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
end


startIndex = regexp(PitchFileName,"D13_");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3450) = Y_centExtrapolated ( Y_centExtrapolated>3450) -1200;
    
    %Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
end


if strncmp (PitchFileName,"D5_G3_M0_A11_T2_1 dashti_daraamad_damaavandi", 16);
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated< 1800 ) =0;;
    Y_centExtrapolated ( Y_centExtrapolated>3000) =  Y_centExtrapolated ( Y_centExtrapolated>3000) -1200;;
    Y_centExtrapolated ( Y_centExtrapolated>2600) =  Y_centExtrapolated ( Y_centExtrapolated>2600) -498;;
    
    %Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
end
if strncmp (PitchFileName,"D5_G3_M0_A18_T2_firstB_1 dashti_daraamad_zelli", 16);
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    
    Y_centExtrapolated ( Y_centExtrapolated>3500) =  Y_centExtrapolated ( Y_centExtrapolated>3500) -1200;;
    
end
if strncmp (PitchFileName,"D5_G3_M0_A13_T2_firstB_1 dashti_daraamad_taaherzaadeh", 16);
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    
    Y_centExtrapolated ( Y_centExtrapolated>3000) =  Y_centExtrapolated ( Y_centExtrapolated>3000) -1200;;
    
end


if strncmp (PitchFileName,"D5_G3_M0_A17_T2_firstB_1 dashti_daraamad_qamarolmolukVaziri", 16);
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    %Y_centExtrapolated ( Y_centExtrapolated< 1800 ) =0;;
    Y_centExtrapolated ( Y_centExtrapolated>2810) =  Y_centExtrapolated ( Y_centExtrapolated>2810) -1200;;
    %Y_centExtrapolated ( Y_centExtrapolated>2600) =  Y_centExtrapolated ( Y_centExtrapolated>2600) -498;;
    Y_centExtrapolated ( 1) = Y_centExtrapolated ( 1) - 1200;
    Y_centExtrapolated ( 3) = Y_centExtrapolated ( 3) - 1200;
    Y_centExtrapolated ( 11:23) = Y_centExtrapolated ( 11:23) - 1200;
    %Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
end



%{
startIndex = strncmp(PitchFileName,"D1_G5_M0_A13_",13); %tahrir . . .
if (startIndex~=0)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3350) = Y_centExtrapolated ( Y_centExtrapolated>3350) -1200;
    Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated<2500) = ...
                 Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated<2500) +1200;
    Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated<2500) = ...
                 Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated<2500) +1200;
    
        %Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
end
%}
if  strncmp(PitchFileName,"D1_G5_M0_A13_",13); %tahrir . . .
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3350) = Y_centExtrapolated ( Y_centExtrapolated>3350) -1200;
    Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated<2500) = ...
        Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated<2500) +1200;
    Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated<2500) = ...
        Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated<2500) +1200;
    
    %Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
elseif  strncmp(PitchFileName,"D1_G55_M0_A16_",13); %tahrir . . .
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    %Y_centExtrapolated ( Y_centExtrapolated>3350) = Y_centExtrapolated ( Y_centExtrapolated>3350) -1200;
    
    %Y_centExtrapolated( 2156:2216) = Y_centExtrapolated( 2156:2216) + 702;
    %Y_centExtrapolated( 2230:2237) = Y_centExtrapolated( 2230:2237) + 702;
    %Y_centExtrapolated( 2347:2380) = Y_centExtrapolated( 2347:2380) + 702;
    %Y_centExtrapolated( 2992:3026) = Y_centExtrapolated( 2992:3026) + 702;
    
elseif  strncmp(PitchFileName,"D1_G55_M0_A23_",13); %tahrir . . .
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( 5400:end) = 0;
    
    
elseif  strncmp(PitchFileName,"D1_G55_M0_A18_",13); %tahrir . . .
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( 2925:2977) = 2670;
    
    
    
    
elseif strncmp(PitchFileName,"D1_G55_M0_Axx_",9); %tahrir . . .
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3350) = Y_centExtrapolated ( Y_centExtrapolated>3350) -1200;
    
    %Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
end

if  strncmp(PitchFileName,"D1_G55_M0_A4_",13); %tahrir . . .
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated (1:20) = 0;
    Y_centExtrapolated (1618:1619) = 2300;
end


if  strncmp(PitchFileName,"D8_G10_M0_A17_",14); %tahrir . . .
    
    Y_centExtrapolated ( Y_centExtrapolated>2800) = Y_centExtrapolated ( Y_centExtrapolated>2800) -1200;
    
end

if  strncmp(PitchFileName,"D8_G10_M0_A2_",13); %tahrir . . .
    
    Y_centExtrapolated (204:214) = Y_centExtrapolated (204:214) +702;
    Y_centExtrapolated (1542:1561) = Y_centExtrapolated (1542:1561) +702;
    Y_centExtrapolated (4979:5007) = Y_centExtrapolated (4979:5007) +702;
    Y_centExtrapolated (5504:5534) = Y_centExtrapolated (5504:5534) +702;
    
    Y_centExtrapolated (552:585)   = Y_centExtrapolated (552:585)   +1200;
    Y_centExtrapolated (1360:1446) = Y_centExtrapolated (1360:1446) +1200;
    Y_centExtrapolated (3741:3811) = Y_centExtrapolated (3741:3811) +702;
    %Y_centExtrapolated (3790:3811) = Y_centExtrapolated (3790:3811) +702;
    
    Y_centExtrapolated (2856:2860) = Y_centExtrapolated (2856:2860) -1200;
    
end



if  strncmp(PitchFileName,"D8_G10_M0_A13_",14); %tahrir . . .
    
    %Y_centExtrapolated (3611:3627) = Y_centExtrapolated (3611:3627) +1200;
    %Y_centExtrapolated (3640:3644) = Y_centExtrapolated (3640:3644) +1200;
    %Y_centExtrapolated (3668:3674) = Y_centExtrapolated (3668:3674) +1200;
    
end





if strncmp(PitchFileName,"D1_G111_M0_A12_T2_firstB_1 shur_razavi",18);
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    %    Y_centExtrapolated (1432:1648) = Y_centExtrapolated ( 1432:1648) +1200;
    %    Y_centExtrapolated (1432:1608) = Y_centExtrapolated ( 1432:1608) +1200;
    Y_centExtrapolated (1350:end) = 0; % need to cut mp3
    %Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
end

if strncmp(PitchFileName,"D1_G111_M0_A13_T2_pitch_1 shur_razavi",18);
    
    Y_centExtrapolated ( Y_centExtrapolated>3000) = Y_centExtrapolated ( Y_centExtrapolated>3000) -1200;
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
end


if strncmp(PitchFileName,"D1_G111_M0_A6_T2_pitch_1 shur_razavi",18);
    
    Y_centExtrapolated ( Y_centExtrapolated>3000) = Y_centExtrapolated ( Y_centExtrapolated>3000) -1200;
    
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    
    
    
end



startIndex = regexp(PitchFileName,"D4_");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3450) = Y_centExtrapolated ( Y_centExtrapolated>3450) -1200;
    
    %Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
end

startIndex = regexp(PitchFileName,"D4_G5_M4_A7_T3_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3450) = Y_centExtrapolated ( Y_centExtrapolated>3450) -1200;
    
    Y_centExtrapolated( 4319:4334) = Y_centExtrapolated( 4338);
end

startIndex = regexp(PitchFileName,"D5_G51_M4_A7_T3_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated<700) = ...
        Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated<700) +1200;
    
    
end

startIndex = regexp(PitchFileName,"D8_G29_M1_A1_T1_pitch_2 homaayun_chakaavak");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated( 5490:5504) = Y_centExtrapolated1( 5490:5504);
    Y_centExtrapolated( 9234:9248) = Y_centExtrapolated1( 9234:9248);
    Y_centExtrapolated( 14485:14499) = Y_centExtrapolated1( 14485:14499);
    
end

startIndex = regexp(PitchFileName,"D8_G37_M1_A1_T1_pitch_7 homaayun_bidaad");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated( 3143:3170) = Y_centExtrapolated1( 3143:3170);
    Y_centExtrapolated( 5292:5311) = Y_centExtrapolated1( 5292:5311);
    Y_centExtrapolated( 6636:6654) = Y_centExtrapolated1( 6636:6654);
    Y_centExtrapolated( 7223:7244) = Y_centExtrapolated1( 7223:7244);
    
end


startIndex = regexp(PitchFileName,"D6_G13_M4_A7_T3_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    
    
    Y_centExtrapolated( 2185:2193) = Y_centExtrapolated1( 2185:2193);
end

startIndex = regexp(PitchFileName,"D6_G12_M4_A7_T3_pitch_3 bayaatKord_hazindavaami");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    %Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated ( Y_centExtrapolated<900 & Y_centExtrapolated>200 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<900  & Y_centExtrapolated>200) +1200;
    
    
    %Y_centExtrapolated( 2185:2193) = Y_centExtrapolated1( 2185:2193);
end


startIndex = regexp(PitchFileName,"D9_G46_M1_A1_T1_pitch_5 bayaatEsfahaan_suzOgodaaz");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    
    Y_centExtrapolated ( 2804:2835)   = Y_centExtrapolated ( 2804:2835)   + 702;
    Y_centExtrapolated ( 6898:6906)   = Y_centExtrapolated ( 6898:6906)   + 702;
    Y_centExtrapolated ( 9124:9147)   = Y_centExtrapolated ( 9124:9147)   + 702;
    Y_centExtrapolated ( 11730:11756) = Y_centExtrapolated ( 11730:11756) + 702;
end

startIndex = regexp(PitchFileName,"D9_G21_M1_A1_T1_pitch_4 bayaatEsfahaan_bayaatRaaje");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    
    Y_centExtrapolated ( 24350:24365)   = Y_centExtrapolated ( 24350:24365)   + 702;
    Y_centExtrapolated ( 26789:26808)   = Y_centExtrapolated ( 26789:26808)   + 702;
    Y_centExtrapolated ( 31754:31778)   = Y_centExtrapolated ( 31754:31778)   + 702;
    Y_centExtrapolated ( 1631:1660)     = 0;
    Y_centExtrapolated ( 12196:12244)   = Y_centExtrapolated ( 12196:12244)   + 702;
    Y_centExtrapolated ( 8236:8261)     = Y_centExtrapolated (  8236:8261)   + 702;
    
    
end



startIndex = regexp(PitchFileName,"D12_G51_M1_A1_T1_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>100 & Y_centExtrapolated<500) = ...
        Y_centExtrapolated ( Y_centExtrapolated>100 & Y_centExtrapolated<500) +1200;
    
    % Y_centExtrapolated1 = Y_centExtrapolated;
    %Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
    %    Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    %Y_centExtrapolated ( 10631:10689) = Y_centExtrapolated1 ( 10631:10689);
    Y_centExtrapolated( 17239:17255) = 0;
end

startIndex = regexp(PitchFileName,"D13_G86_M1_A1_T1_pitch_11 rast5gaah_leyliOMajnun");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    
    Y_centExtrapolated ( 12948:12952) = Y_centExtrapolated (12948:12952) +1200;
    
end

startIndex = regexp(PitchFileName,"D13_G60_M1_A1_T1_pitch_9 rast5gaah_nahibMohayyer");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    %Y_centExtrapolated ( Y_centExtrapolated>3450) = Y_centExtrapolated ( Y_centExtrapolated>3450) -1200;
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 10612:10636) = Y_centExtrapolated1 ( 10612:10636);
    Y_centExtrapolated ( 15218:15244) = Y_centExtrapolated1 ( 15218:15244) +498;
    
end



startIndex = regexp(PitchFileName,"D12_G32_M1_A1_T1_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3450) = Y_centExtrapolated ( Y_centExtrapolated>3450) -1200;
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 10631:10689) = Y_centExtrapolated1 ( 10631:10689);
    
end

startIndex = regexp(PitchFileName,"D12_G25_M1_A1_T1_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3450) = Y_centExtrapolated ( Y_centExtrapolated>3450) -1200;
end

startIndex = regexp(PitchFileName,"D12_G42_M1_A1_T1_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3450) = Y_centExtrapolated ( Y_centExtrapolated>3450) -1200;
end

startIndex = regexp(PitchFileName,"D12_G38_M1_A1_T1");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3500) = Y_centExtrapolated ( Y_centExtrapolated>3500) -1200;
end
startIndex = regexp(PitchFileName,"D12_G43_M1_A1_T1");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3500) = Y_centExtrapolated ( Y_centExtrapolated>3500) -1200;
    
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 1376:1415) = Y_centExtrapolated1 ( 1376:1415);
    Y_centExtrapolated ( 8688:8719) = Y_centExtrapolated1 ( 8688:8719);
    Y_centExtrapolated ( 8739:8759) = 0 %Y_centExtrapolated1 ( 8739:8759)+1200;
    
    
end


startIndex = regexp(PitchFileName,"D12_G15_M1_A1_T1_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    
    Y_centExtrapolated (4346:4365) = 0;
end

startIndex = regexp(PitchFileName,"D1_G17_M4_A7_T3_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    
    Y_centExtrapolated (1168:1178) = 0;
end


startIndex = regexp(PitchFileName,"D1_G7_M4_A7_T3_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    %Y_centExtrapolated ( Y_centExtrapolated>2500) = Y_centExtrapolated ( Y_centExtrapolated>2500) -1200;
    %Y_centExtrapolated ( Y_centExtrapolated>2500) = 0;
    Y_centExtrapolated (475:497) = 0;
    Y_centExtrapolated (530:592) = 0;
end

startIndex = regexp(PitchFileName,"D1_G5_M4_A7_T3_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    %Y_centExtrapolated ( Y_centExtrapolated>2500) = Y_centExtrapolated ( Y_centExtrapolated>2500) -1200;
    Y_centExtrapolated ( Y_centExtrapolated>2500) = 0;
    Y_centExtrapolated ( 6:12) = 1400;
    Y_centExtrapolated ( 2314:end) = 0;
end

startIndex = regexp(PitchFileName,"D1_G5_M0_A2_T2_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    Y_centExtrapolated ( Y_centExtrapolated>3450) = Y_centExtrapolated ( Y_centExtrapolated>3450) -1200;
    Y_centExtrapolated(1490:1550) = 1800;
    %Y_centExtrapolated(1806:1867) = 2500;
end

startIndex = regexp(PitchFileName,"D1_G55_M0_A2_T2_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", char(PitchFileName) );
    t= Y_centExtrapolated(806:end);
    %t(t==0) = 2400;
    
    Y_centExtrapolated(806:end) = t;
    Y_centExtrapolated(2366:2510) = 0;
    Y_centExtrapolated(3854:3884) = Y_centExtrapolated(3854:3884) + 498;  % mistakenly it was decrease by 1200
    %Y_centExtrapolated(1191:1234) = Y_centExtrapolated(1191:1234) - 498;  % mistakenly it was decrease by 1200
    Y_centExtrapolated(1161:1174) = Y_centExtrapolated(1161:1174) - 498;  % mistakenly it was decrease by 1200
    Y_centExtrapolated(3885:3898) = 2865;
    Y_centExtrapolated(4517:4561) = 2580;
    Y_centExtrapolated(4586:4621) = 2580;
    
end



startIndex = regexp(PitchFileName,"D1_G5_A13_pitch_shur_daraamad_TaaherZaadeh");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>4000) = Y_centExtrapolated ( Y_centExtrapolated>4000) -1200;
    
    Y_centExtrapolated ( Y_centExtrapolated<500) = Y_centExtrapolated ( Y_centExtrapolated<500) -2400;
    Y_centExtrapolated ( Y_centExtrapolated<1500) = Y_centExtrapolated ( Y_centExtrapolated<1500) +2400;
    Y_centExtrapolated(1600:1710)=0;
end
startIndex = regexp(PitchFileName,"D1_G5_A14_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>2900) = Y_centExtrapolated ( Y_centExtrapolated>2900) -1200;
end
startIndex = regexp(PitchFileName,"D1_G111_M0_A14_T2_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated<1800 & Y_centExtrapolated>200) = Y_centExtrapolated ( Y_centExtrapolated<1800 & Y_centExtrapolated>200) +1200;
    
    Y_centExtrapolated ( 1643:1705) = 2800
    Y_centExtrapolated ( 1756:1845) = 2800
    Y_centExtrapolated ( 453:509) = 2900
    
end

startIndex = regexp(PitchFileName,"D1_G111_M0_A5_T2_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3450) = Y_centExtrapolated ( Y_centExtrapolated>3450) -1200;
    
    %Y_centExtrapolated ( 1643:1705) = 2800
    %Y_centExtrapolated ( 1756:1845) = 2800
    %Y_centExtrapolated ( 453:509) = 2900
    
end

startIndex = regexp(PitchFileName,"D1_G111_M0_A22_T2_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>2750) = Y_centExtrapolated ( Y_centExtrapolated>2750) -1200;
    
    %Y_centExtrapolated ( 1643:1705) = 2800
    %Y_centExtrapolated ( 1756:1845) = 2800
    %Y_centExtrapolated ( 453:509) = 2900
    
end


startIndex = regexp(PitchFileName,"D1_G123_M0_A5_T2_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>200 & Y_centExtrapolated <1300 ) = ...
        Y_centExtrapolated (  Y_centExtrapolated>200 & Y_centExtrapolated <1300) +2400;
    
    Y_centExtrapolated ( Y_centExtrapolated>3035) = Y_centExtrapolated ( Y_centExtrapolated>3035) -1200;
    
    %Y_centExtrapolated ( 1643:1705) = 2800
    %Y_centExtrapolated ( 1756:1845) = 2800
    %Y_centExtrapolated ( 453:509) = 2900
    
end

startIndex = regexp(PitchFileName,"D1_G123_M0_A17_T2_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated<1800 & Y_centExtrapolated>100) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1800 & Y_centExtrapolated>100) +702;
    Y_centExtrapolated ( Y_centExtrapolated<1800 & Y_centExtrapolated>200) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1800 & Y_centExtrapolated>200) +1200;
    
end

startIndex = regexp(PitchFileName,"D1_G123_M0_A22_T2_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    t= Y_centExtrapolated ( 1:2000);
    t( t > 3340) = t( t > 3340) -1200;
    Y_centExtrapolated ( 1:2000) = t;
    
    
end

startIndex = regexp(PitchFileName,"D1_G123_M0_A2_T2_pitch");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>2800) = Y_centExtrapolated ( Y_centExtrapolated>2800) -1200;
    t= Y_centExtrapolated (1800:end);
    t( t <2000 & t > 200) = t( t < 2000 & t > 200) +1200;
    Y_centExtrapolated ( 1800:end) = t;
    
end


startIndex = regexp(PitchFileName,"D2_G37_M1_A1_T1_pitch_8 abuata_hejaaz");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3350) = Y_centExtrapolated ( Y_centExtrapolated>3350) -1200;
    
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    %Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
    %   Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    
    %Y_centExtrapolated (4667:4675) = Y_centExtrapolated1 (4667:4675);
    
    
end
startIndex = regexp(PitchFileName,"D3_G27_M1_A1_T1_pitch_5 zand_jaamedaraan");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3350) = Y_centExtrapolated ( Y_centExtrapolated>3350) -1200;
    
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated (4667:4675) = Y_centExtrapolated1 (4667:4675);
    Y_centExtrapolated (10051:10064) = Y_centExtrapolated1 (10051:10064);
    Y_centExtrapolated (4749:4788) = Y_centExtrapolated (4790);
    
    
end

startIndex = regexp(PitchFileName,"D3_G28_M1_A1_T1_pitch_3 zand_dogaah");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    %Y_centExtrapolated ( Y_centExtrapolated>3350) = Y_centExtrapolated ( Y_centExtrapolated>3350) -1200;
    
    %Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated ( Y_centExtrapolated<1070 & Y_centExtrapolated>500 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1070  & Y_centExtrapolated>500) +1200;
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>300 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>300) +702;
    Y_centExtrapolated (12096:12108) = Y_centExtrapolated1 (12096:12108);
end

startIndex = regexp(PitchFileName,"D3_G32_M1_A1_T1_pitch_4 zand_ruholarvaah");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3600) = Y_centExtrapolated ( Y_centExtrapolated>3600) -1200;
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>300 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>300) +702;
    
    Y_centExtrapolated (1509:1526) = Y_centExtrapolated1 (1509:1526);
    Y_centExtrapolated (7106:7136) = Y_centExtrapolated1 (7106:7136);
    Y_centExtrapolated (10310:10323) = Y_centExtrapolated1 (10310:10323);
    Y_centExtrapolated (15464:15479) = Y_centExtrapolated1 (15464:15479);
    Y_centExtrapolated (16861:16876) = Y_centExtrapolated1( 16861:16876) + 498;
    
    
end

startIndex = regexp(PitchFileName,"D3_G38_M1_A1_T1_pitch_6 zand_feyli");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3600) = Y_centExtrapolated ( Y_centExtrapolated>3600) -1200;
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2100 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2100  & Y_centExtrapolated>800) +702;%octave
    Y_centExtrapolated ( 1858:1875  ) = Y_centExtrapolated1 ( 1858:1875);
    Y_centExtrapolated ( 14080:14105) = Y_centExtrapolated1 ( 14080:14105) + 498;
    
    
end



startIndex = regexp(PitchFileName,"D3_G14_M1_A1_T1_");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( 8749:8792) = Y_centExtrapolated ( 8794);
end


startIndex = regexp(PitchFileName,"D3_G64_M1_A1_T1_pitch_12 zand_masnavi");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2100 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2100  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 9520:9556) = Y_centExtrapolated1 ( 9520:9556);
    Y_centExtrapolated ( 22310:22336) = Y_centExtrapolated1 ( 22310:22336) +498;
    Y_centExtrapolated ( 25843:25857) = Y_centExtrapolated1 ( 25843:25857);
    Y_centExtrapolated ( 28560:28572) = Y_centExtrapolated1 ( 28560:28572);
    Y_centExtrapolated ( 31371:31413) = Y_centExtrapolated1 ( 31371:31413);
    
    
    
    Y_centExtrapolated ( 8047:8091) = Y_centExtrapolated ( 8094);
    
end


startIndex = regexp(PitchFileName,"D3_G61_M1_A1_T1_pitch_11 zand_mehrabaani");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    
    Y_centExtrapolated ( Y_centExtrapolated<1300 & Y_centExtrapolated>300) =...
        Y_centExtrapolated ( Y_centExtrapolated<1300 & Y_centExtrapolated>300) +702;
    
end



startIndex = regexp(PitchFileName,"D3_G48_M1_A1_T1_pitch_7 zand_shekasteh");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3600) = Y_centExtrapolated ( Y_centExtrapolated>3600) -1200;
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2100 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2100  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 10576:10589) = Y_centExtrapolated1 ( 10576:10589);
    
    
end



startIndex = regexp(PitchFileName,"D3_G55_M1_A1_T1_");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3600) = Y_centExtrapolated ( Y_centExtrapolated>3600) -1200;
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1900 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1900  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 4885:4911) = Y_centExtrapolated1 ( 4885:4911);
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1900 & Y_centExtrapolated1>500 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1900  & Y_centExtrapolated>500) +1200;
    Y_centExtrapolated ( 13890:13916) = Y_centExtrapolated1 ( 13890:13916 );
    
    
end



startIndex = regexp(PitchFileName,"D3_G64_M1_A1_T1_pitch_12 zand_masnavi");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3600) = Y_centExtrapolated ( Y_centExtrapolated>3600) -1200;
end

startIndex = regexp(PitchFileName,"D4_G44_M1_A1_T1_pitch_7 afshaari_rohaab");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3600) = Y_centExtrapolated ( Y_centExtrapolated>3600) -1200;
end

startIndex = regexp(PitchFileName,"D4_G56_M1_A1_T1_pitch_8 afshaari_sadri");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3600) = Y_centExtrapolated ( Y_centExtrapolated>3600) -1200;
    %Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
end

startIndex = regexp(PitchFileName,"D5_G3_M1_A1_T1_pitch_1 dashti_daraamad");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3600) = Y_centExtrapolated ( Y_centExtrapolated>3600) -1200;
    Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
end

startIndex = regexp(PitchFileName,"D5_G13_M1_A1_T1_pitch_2 dashti_owj");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3600) = Y_centExtrapolated ( Y_centExtrapolated>3600) -1200;
    Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
end

startIndex = regexp(PitchFileName,"D5_G50_M1_A1_T1_pitch_7 dashti_ghamangiz");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3600) = Y_centExtrapolated ( Y_centExtrapolated>3600) -1200;
    Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
end
startIndex = regexp(PitchFileName,"D5_G55_M1_A1_T1_pitch_9 dashti_masnavi");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    %Y_centExtrapolated ( Y_centExtrapolated>3500) = Y_centExtrapolated ( Y_centExtrapolated>3500) -1200;
    %Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
end

startIndex = regexp(PitchFileName,"D8_G37_M1_A1_T1_pitch_7 homaayun_bidaad");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3500) = Y_centExtrapolated ( Y_centExtrapolated>3500) -1200;
    %Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
end
startIndex = regexp(PitchFileName,"D8_G47_M1_A1_T1_pitch_6 homaayun_neydaavud");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3500) = Y_centExtrapolated ( Y_centExtrapolated>3500) -1200;
    %Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated<2000 & Y_centExtrapolated>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2000  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated (1270:1282) = Y_centExtrapolated1(1270:1282 ) ;
    Y_centExtrapolated (4774:4792) = Y_centExtrapolated1(4774:4792 ) ;
    Y_centExtrapolated (9192:9205) = Y_centExtrapolated1( 9192:9205) ;
    Y_centExtrapolated (1270:1282) = Y_centExtrapolated1(1270:1282 ) ;
end


startIndex = regexp(PitchFileName,"D8_G47_M4_A7_T3_pitch_5 homaayun_neydaavudDavaami");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    
    Y_centExtrapolated ( Y_centExtrapolated<1000 & Y_centExtrapolated>200 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1000  & Y_centExtrapolated>200) +1200;
    
end


startIndex = regexp(PitchFileName,"D8_G37_M4_A7_T3_pitch_6 homaayun_bidaadDavaami");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    
    Y_centExtrapolated ( Y_centExtrapolated<1100 & Y_centExtrapolated>200 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1000  & Y_centExtrapolated>200) +1200;
    
end


startIndex = regexp(PitchFileName,"D8_G53_M4_A7_T3_pitch_8 homaayun_owjDavaami");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    
    t= Y_centExtrapolated ( 8000:10000 ) ;
    t( t < 2100 & t>200) = t (t<2100 & t>200) + 702;
    t( t < 2100 & t>200) = t (t<2100 & t>200) + 498;
    Y_centExtrapolated ( 8000:10000 ) = t;
    
    t= Y_centExtrapolated (8680:9000 ) ;
    t( t < 2555 & t>200) = t (t<2555 & t>200) + 498;
    Y_centExtrapolated ( 8680:9000  ) = t;
    
end



startIndex = regexp(PitchFileName,"D8_G103_M4_A7_T3_pitch_7 homaayun_baxtiariDavaami");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    
    Y_centExtrapolated ( Y_centExtrapolated<1000 & Y_centExtrapolated>200 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1000  & Y_centExtrapolated>200) +1200;
    
    Y_centExtrapolated(14938: 14999) = Y_centExtrapolated(14938: 14999) + 702;
end





startIndex = regexp(PitchFileName,"D8_G62_M1_A1_T1_pitch_3 homaayun_leyliOmajnun");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1590 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1590  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated(15701:15716)   = Y_centExtrapolated1(15701:15716)
    
end


startIndex = regexp(PitchFileName,"D8_G63_M1_A1_T1_pitch_5 homaayun_tarz");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    %Y_centExtrapolated ( Y_centExtrapolated>3500) = Y_centExtrapolated ( Y_centExtrapolated>3500) -1200;
    %Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
    
    
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1590 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1590  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated   = Y_centExtrapolated1
    Y_centExtrapolated (11911:11931)= Y_centExtrapolated(11911:11931)+702;
end

startIndex = regexp(PitchFileName,"D8_G85_M1_A1_T1_pitch_4 homaayun_shushtari");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    %Y_centExtrapolated ( Y_centExtrapolated>3500) = Y_centExtrapolated ( Y_centExtrapolated>3500) -1200;
    %Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
    
    
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2000 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2000  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 3200:3214)   = Y_centExtrapolated1 (3200:3214);
    Y_centExtrapolated ( 10233:10252)   = Y_centExtrapolated1 (10233:10252);
    
end

startIndex = regexp(PitchFileName,"D8_G109_M1_A1_T1_pitch_9 homaayun_raazOniaaz_i");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    % fourth error!
    %Y_centExtrapolated ( 15204:15218)   = Y_centExtrapolated ( 15204:15218) + 498;
    
end

startIndex = regexp(PitchFileName,"D8_G110_M1_A1_T1_pitch_10 homaayun_raazOniaaz_ii");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( 5527:5550)   = Y_centExtrapolated ( 5527:5550) + 702;
    
end

startIndex = regexp(PitchFileName,"D8_G111_M1_A1_T1_pitch_11 homaayun_shushtari_ii");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3500) = Y_centExtrapolated ( Y_centExtrapolated>3500) -1200;
    %Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
    
    
    
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2000 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2000  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 1332:1350)   = Y_centExtrapolated1 (1332:1350);
    Y_centExtrapolated ( 6045:6068)   = Y_centExtrapolated1 (6045:6068);
    Y_centExtrapolated ( 15007:15016) = Y_centExtrapolated1 (15007:15016);
    Y_centExtrapolated ( 26428:26450) = Y_centExtrapolated1 (26428:26450);
    
end




startIndex = regexp(PitchFileName,"D8_G49_M1_A1_T1_pitch_8 homaayun_raaje");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( Y_centExtrapolated>3700) = Y_centExtrapolated ( Y_centExtrapolated>3700) -1200;
    %Y_centExtrapolated ( Y_centExtrapolated<1000) = Y_centExtrapolated ( Y_centExtrapolated<1000) +1200;
end

%{
startIndex = regexp(PitchFileName,"D3_G999_firstB_2 az"); %2311
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1  = Y_centExtrapolated ;
    Y_centExtrapolated1 ( Y_centExtrapolated<2311  & Y_centExtrapolated>100 ) = ...
                    Y_centExtrapolated ( Y_centExtrapolated<2311  & Y_centExtrapolated>100) +1200;
     Y_centExtrapolated() = Y_centExtrapolated1();
end
%}

startIndex = regexp(PitchFileName,"D3_G999_pitch_2 az"); %2311
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( 2459:2503)  = 2000 ;  % thse cause problems in histograms. Solutions:
    Y_centExtrapolated ( 6447:6464)  = 1500 ;  % in histogram func, for i=1:end  if stddev(i:i+5) ==0 set these points to zero for
    Y_centExtrapolated ( 6707:6742)  = 2000 ;  % histogram purposes.
    Y_centExtrapolated ( 6916:6956)  = 2000 ;  % or, keep another array of modifications for histogram calcs.
    
    
    Y_centExtrapolated ( 30002:30010)  = 3500 ;
    Y_centExtrapolated ( 31134:31398)  = 3100 ;
    Y_centExtrapolated ( 35849:36084)  = 3050 ;
    
    
    Y_centExtrapolated ( 38850:38863)  = 3500 ;
    Y_centExtrapolated ( 42218:42227)  = 3500 ;
    Y_centExtrapolated ( 42228:42245)  = Y_centExtrapolated ( 42228:42245)+1200 ;
    Y_centExtrapolated ( 6447:6481)  =   Y_centExtrapolated ( 6447:6481)+702 ;
    Y_centExtrapolated ( 42286:42327)  = 3500 ;
    Y_centExtrapolated ( 49304:49345)  = 3000 ;
    Y_centExtrapolated ( 55710:55745)  = 3000 ;
    % Y_centExtrapolated ( 38795:end)  = 0 ; % eliminate the last 7 shifted sentences
    %Y_centExtrapolated ( 1:38795)  = 0 ; % eliminate the first 13
    % pitchsh
    
    Y_centExtrapolated ( 8590:end)  =  Y_centExtrapolated ( 8590:end)    +0;
    Y_centExtrapolated ( 11190:end)  =  Y_centExtrapolated ( 11190:end)  +11;
    Y_centExtrapolated ( 14280:end)  =  Y_centExtrapolated ( 14280:end)  -11 -6;
    Y_centExtrapolated ( 17160:end)  =  Y_centExtrapolated ( 17160:end)  +6  +8;
    
    Y_centExtrapolated ( 20310:end)  =  Y_centExtrapolated (20310 :end)  -8  +9;
    Y_centExtrapolated ( 23190:end)  =  Y_centExtrapolated ( 23190:end)  -9  + 15;
    Y_centExtrapolated ( 26290:end)  =  Y_centExtrapolated ( 26290:end)  -15 +8;
    Y_centExtrapolated ( 29540:end)  =  Y_centExtrapolated ( 29540:end)  -8  +24;
    
    
    Y_centExtrapolated ( 34200:end)  =  Y_centExtrapolated ( 34200:end)  -24 +30;
    Y_centExtrapolated ( 38790:end)  =  Y_centExtrapolated ( 38790:end)  -30 +27;
    Y_centExtrapolated ( 41396:end)  =  Y_centExtrapolated ( 41396:end)  -27 +34;
    
    Y_centExtrapolated ( 44080:end)  =  Y_centExtrapolated ( 44080:end)  -34 +49;
    Y_centExtrapolated ( 46300:end)  =  Y_centExtrapolated ( 46300:end)  -49 +52;
    Y_centExtrapolated ( 49005:end)  =  Y_centExtrapolated ( 49005:end)  -52 +55;
    Y_centExtrapolated ( 51880:end)  =  Y_centExtrapolated ( 51880:end)  -55 +71;
    Y_centExtrapolated ( 54360:end)  =  Y_centExtrapolated ( 54360:end)  -71 +83;
    
    %Y_centExtrapolated ( 58741:end)  =  Y_centExtrapolated ( 58741:end) -83 +92;
    %Y_centExtrapolated ( 61365:end)  =  Y_centExtrapolated ( 61365:end)  -92+101;
    
    Y_centExtrapolated ( Y_centExtrapolated<100) = 0; % make up for the + 7s
    
end


startIndex = regexp(PitchFileName,"D1_G123_M1_A1_T1_pitch_6 Shur_shahnaaz");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    
    Y_centExtrapolated ( 14266:14304) = 2630;
    Y_centExtrapolated ( 8551:8592)   = 2900;
    %Y_centExtrapolated ( 8550:8593)   = 2900;
    Y_centExtrapolated ( 14265:14306) = 2890;
end
startIndex = regexp(PitchFileName,"D1_G110_M1_A1_T1_pitch_14 Shur_gusheh_grayli");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    
    Y_centExtrapolated ( 24585:24631) = 1850;
    Y_centExtrapolated ( 27971:28015) = 2990;
    
    
end

startIndex = regexp(PitchFileName,"D1_G123_M1_A1_T1_pitch_6 Shur_shahnaaz");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2000 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2000  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated ( 4700:4800)   = Y_centExtrapolated1 ( 4700:4800);
    Y_centExtrapolated ( 14305)       = Y_centExtrapolated ( 14306);
    Y_centExtrapolated ( 10730:10755)  = Y_centExtrapolated1 (10730:10755);
end

startIndex = regexp(PitchFileName,"D1_G123_M1_A1_T1_pitch_6 Shur_shahnaaz");
if ~isempty(startIndex)
    fprintf("processGushexx: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated ( 1359:end)  =  Y_centExtrapolated ( 1359:end) +0  +7 ;
    Y_centExtrapolated ( 3478:end)  =  Y_centExtrapolated ( 3478:end) -7  -3 ;
    Y_centExtrapolated ( 5278:end)  =  Y_centExtrapolated ( 5278:end) +3  +11;
    Y_centExtrapolated ( 6155:end)  =  Y_centExtrapolated ( 6155:end) -11 +10;
    
    Y_centExtrapolated ( 7754:end)  =  Y_centExtrapolated ( 7754:end) -10 +13;
    Y_centExtrapolated ( 8314:end)  =  Y_centExtrapolated ( 8314:end) -13 +7;
    Y_centExtrapolated ( 9279:end)  =  Y_centExtrapolated ( 9279:end) -7  -1;
    Y_centExtrapolated (11018:end)  =  Y_centExtrapolated ( 11018:end)+1  +14;
    Y_centExtrapolated (11877:end)  =  Y_centExtrapolated ( 11877:end)-14 +6;
    
    Y_centExtrapolated (13476:end)  =  Y_centExtrapolated ( 13476:end) -6 +5;
    Y_centExtrapolated (14016:end)  =  Y_centExtrapolated ( 14016:end) -5 +6;
    Y_centExtrapolated (15011:end)  =  Y_centExtrapolated ( 15011:end) -6 +6;
    
    Y_centExtrapolated(Y_centExtrapolated<50) = 0;
end


% a few points too low but they are fifth error not octave errors!
startIndex = regexp(PitchFileName,"D1_G77_M1_A1_T1_pitch_11 Shur_dobeyti");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2100 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2100  & Y_centExtrapolated>800) +1200;
    
    Y_centExtrapolated ( 3282:3293) = Y_centExtrapolated1 (  3282:3293);
    %Y_centExtrapolated ( 11176:11194) = Y_centExtrapolated1 (  11176:11194);
    
end

startIndex = regexp(PitchFileName,"D1_G147_M1_A1_T1_pitch_12 Shur_hoseyni");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2100 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2100  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated ( 12730:12768) = Y_centExtrapolated1 (  12730:12768);
    %Y_centExtrapolated ( 11176:11194) = Y_centExtrapolated1 (  11176:11194);
    
end

startIndex = regexp(PitchFileName,"D1_G117_M1_A1_T1_pitch_9 Shur_razavi_baa_tahrir_javaadxaani");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2100 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2100  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated ( 1235:1255) = Y_centExtrapolated1 (  1235:1255);
    Y_centExtrapolated ( 11176:11194) = Y_centExtrapolated1 (  11176:11194);
    
end


%{
startIndex = regexp(PitchFileName,"D1_G117_M1_A1_T1_pitch_9 Shur_razavi_baa_tahrir_javaadxaani");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2100 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2100  & Y_centExtrapolated>800) +702;
   Y_centExtrapolated ( 11600:11700)   = Y_centExtrapolated1 (11600:11700);
   Y_centExtrapolated ( 1250:1253)   = Y_centExtrapolated1 ( 1250:1253);
end
%}

startIndex = regexp(PitchFileName,"D4_G42_M1_A1_T1_pitch_6 afshaari_hazin");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1800 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1800  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 3884:3914) = Y_centExtrapolated1 ( 3884:3914);
    Y_centExtrapolated ( 10530:end) = Y_centExtrapolated1 ( 10530:end);
end


%{
startIndex = regexp(PitchFileName,"D4_G28_M1_A1_T1_pitch_3 afshaari_hesaar");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1800 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1800  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 16600:16700)   = Y_centExtrapolated1 ( 16600:16700);
    Y_centExtrapolated ( 11800:12000) = Y_centExtrapolated1 ( 11800:12000);
    Y_centExtrapolated ( 8600:8800) = Y_centExtrapolated1 ( 8600:8800);
    %Y_centExtrapolated ( 11800:12000) = Y_centExtrapolated1 ( 11800:12000);
    Y_centExtrapolated ( 7000:7100) = Y_centExtrapolated1 ( 7000:7100);
    Y_centExtrapolated ( 16780:16830)   = Y_centExtrapolated1 ( 16780:16830);
end
%}
startIndex = regexp(PitchFileName,"D4_G39_M1_A1_T1_pitch_5 afshaari_nahib");
if ~isempty(startIndex)
    
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated (4661:4677) = Y_centExtrapolated1 (4661:4677);
    Y_centExtrapolated ( 9004:9026) = Y_centExtrapolated1 ( 9004:9026);
    
end


startIndex = regexp(PitchFileName,"D4_G28_M1_A1_T1_pitch_3 afshaari_hesaar");
if ~isempty(startIndex)
    
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2250 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2250  & Y_centExtrapolated>800) +702;
    %Y_centExtrapolated ( 16600:16700)   = Y_centExtrapolated1 ( 16600:16700);
    %Y_centExtrapolated ( 11800:12000) = Y_centExtrapolated1 ( 11800:12000);
    Y_centExtrapolated ( 4000:4100) = Y_centExtrapolated1 ( 4000:4100);
    Y_centExtrapolated ( 5100:5200) = Y_centExtrapolated1 ( 5100:5200);
    Y_centExtrapolated ( 6025:6035) = Y_centExtrapolated1 ( 6025:6035);
    Y_centExtrapolated ( 7600:7620) = Y_centExtrapolated1 ( 7600:7620);
    Y_centExtrapolated ( 10600:10620) = Y_centExtrapolated1 ( 10600:10620);
    Y_centExtrapolated ( 15000:15100) = Y_centExtrapolated1 ( 15000:15100);
end

startIndex = regexp(PitchFileName,"D4_G26_M1_A1_T1_pitch_2 afshaari_jaamehdaraan");
if ~isempty(startIndex)
    
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1800 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1800  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated ( 3726:3742)   = Y_centExtrapolated1 ( 3726:3742);
    %Y_centExtrapolated ( 5640:5670)   = Y_centExtrapolated1 ( 5640:5670);
    %Y_centExtrapolated ( 3600:3800)   = Y_centExtrapolated1 ( 3600:3800);
    %Y_centExtrapolated ( 5640:5670)   = Y_centExtrapolated1 ( 5640:5670);
    Y_centExtrapolated ( 11120:11133)   = Y_centExtrapolated1 (11120:11133);
    
end

startIndex = regexp(PitchFileName,"D4_G5_M1_A1_T1_pitch_1 afshaari_daraamad");

if ~isempty(startIndex)
    
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1800 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1800  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated ( 4607:4615)   = Y_centExtrapolated1 ( 4607:4615);
    
    
end
startIndex = regexp(PitchFileName,"D4_G57_M1_A1_T1_pitch_9 afshaari_masnavi");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1800 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1800  & Y_centExtrapolated>800) +702;
    
    Y_centExtrapolated ( 7290:7306)   = Y_centExtrapolated1 ( 7290:7306); %?????  enter good numbers...
    Y_centExtrapolated ( 12019:12029)   = Y_centExtrapolated1 ( 12019:12029); %?????  enter good numbers...
    Y_centExtrapolated ( 17458:17473)   = Y_centExtrapolated1 ( 17458:17473); %?????  enter good numbers...
    Y_centExtrapolated ( 21272:21287)   = Y_centExtrapolated1 ( 21272:21287); %?????  enter good numbers...
    Y_centExtrapolated ( 28360:28366)   = Y_centExtrapolated1 (28360:28366); %?????  enter good numbers...
    Y_centExtrapolated ( 33115:33139)   = Y_centExtrapolated1 ( 33115:33139); %?????  enter good numbers...
    
    Y_centExtrapolated ( 22505:22530)   = Y_centExtrapolated (22505:22530)+702; %above 1800 cents.
    
end





startIndex = regexp(PitchFileName,"D1_G111_M1_A1_T1_pitch_8 Shur_razavi");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<2000 & Y_centExtrapolated1>800 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<2000  & Y_centExtrapolated>800) +702;
    Y_centExtrapolated ( 1770:1800)   = Y_centExtrapolated1 (1770:1800);
    Y_centExtrapolated ( 16979:16993)   = Y_centExtrapolated1 ( 16979:16993);
    
end

startIndex = regexp(PitchFileName,"D4_G56_M1_A1_T1_pitch_8 afshaari_sadri");
if ~isempty(startIndex)
    fprintf("processGushe: filename matched gushe*************** %s\n", PitchFileName );
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1800 & Y_centExtrapolated1>200 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1800  & Y_centExtrapolated>200) +702;
    Y_centExtrapolated ( 2597:2609)   = Y_centExtrapolated1 ( 2597:2609);
    Y_centExtrapolated ( 5178 :5199)   = Y_centExtrapolated1 ( 5178:5199);
    Y_centExtrapolated ( 13361:13382)   = Y_centExtrapolated1 (13361:13382);
    Y_centExtrapolated ( 15564:15594)   = Y_centExtrapolated1 ( 15564:15594);
    Y_centExtrapolated ( 16640:16680)   = Y_centExtrapolated1 ( 16640:16680);
    Y_centExtrapolated ( 18488:18499)   = Y_centExtrapolated1 ( 18488:18499);
end

startIndex = regexp(PitchFileName,"D4_G44_M1_A1_T1_pitch_7 afshaari_rohaab");
if ~isempty(startIndex)
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1800 & Y_centExtrapolated1>200 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1800  & Y_centExtrapolated>200) +702;
    Y_centExtrapolated ( 2597:2609)   = Y_centExtrapolated1 ( 2597:2609);
    Y_centExtrapolated ( 5067:5126)   = Y_centExtrapolated1 ( 5067:5126);
    
end


startIndex = regexp(PitchFileName,"D1_G154_M1_A1_T1_pitch_15 Shur_masnavi");
if ~isempty(startIndex)
    Y_centExtrapolated1 = Y_centExtrapolated;
    Y_centExtrapolated1 ( Y_centExtrapolated1<1900 & Y_centExtrapolated1>200 ) = ...
        Y_centExtrapolated ( Y_centExtrapolated<1900  & Y_centExtrapolated>200) +702;
    
    Y_centExtrapolated ( 19495:19520)   = Y_centExtrapolated1 ( 19495:19520);  %... verify these two lines, again...
    Y_centExtrapolated ( 18255:18312)   = Y_centExtrapolated ( 18330); % connect missed pitches.
    
end



%%%% patching the missing parts:

startIndex = regexp(PitchFileName,"D4_G28_M1_A1_T1_pitch_3 afshaari_hesaar");
if ~isempty(startIndex)
    fprintf("processGushe: patching filename matched gushe*************** %s\n", PitchFileName );
    
    Y_centExtrapolated ( 5590:5628)   =2650;
    
end

%{
figure;
plot ( Y_centExtrapolated );
title("pitchfile2");

ax = gca;
f=get(ax, 'Parent');
print(f,strcat("pitch2graph_", GusheName) ,'-djpeg','-r600','-noui');
%}

end

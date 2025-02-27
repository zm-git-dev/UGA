parameters <- c(
                Km_PDHA1_Pyruvate = 64.8, Km_PDHA1_NAD = 33, Km_PDHA1_CoA1 = 4, Kcat_PDHA1 = 69,
                Km_ACSS1_Acetate = 73, Km_ACSS1_CoA1 = 11, Kcat_ACSS1 = 1.9,
                Km_ACOT12_AcCoA2 = 47, Kcat_ACOT12 = 1.48,
                Km_CS_OXa = 5.9, Km_CS_AcCoA1 = 5, Kcat_CS = 167,
                Km_ACO2_Citrate = 480, Km_ACO2_Isocitrate = 120, Kcat_ACO2_1 = 5.3, Kcat_ACO2_2 = 1.1,
                Km_ACLY_Citrate = 78, Km_ACLY_CoA2 = 14, Kcat_ACLY = 2.2,
                Km_IDH2_Isocitrate = 2400, Km_IDH2_NAD = 80, Kcat_IDH2 = 30,
                Km_OGDH_AlphaKG = 4000, Km_OGDH_NAD = 80, Kcat_OGDH = 30,
                Km_PC_Pyruvate = 220, Km_PC_HCO3 = 3000, Kcat_PC = 60,
                Km_ACSS2_Acetate = 73, Km_ACSS2_CoA2 = 11, Kcat_ACSS2 = 1.9,
                Km_ACACA_AcCoA2 = 34, Km_ACACA_HCO3 = 2100, Kcat_ACACA = 10.1,
                Km_FASN_AcCoA2 = 7, Km_FASN_NADPH = 5, Km_FASN_HCO3 = 3000, Kcat_FASN = 2.7,
                Kcat_HDAC1 = 2.8,
                Kcat_HDAC2 = 2,
                Kcat_HDAC3 = 1.5,
                Km_ACAT2_AcCoA2 = 29,
                Km_HMGCS1_AcCoA2 = 14, Kcat_HMGCS1 = 0.041,
                Km_KAT2A_AcCoA2 = 6.7, Kcat_KAT2A = 0.028,
                Km_ACOT12_AcCoA2 = 47, Kcat_ACOT12 = 1.48,
                # CONSTANTS
                c_Pyruvate = 77,
                c_HCO3 = 11200,
                c_CoA_total = 15,
                c_NAD_total = 46.3,  # NADH 22, NAD+ 24.3, FAD 0.078
                v_max_SLC16A3 = 0.14195,
                c_Acetate_blood = 125,
                k_T_Acetate = 0.157,
                n_ATP_NAD = 2.5,
                v_ATP_ss = 0.2,
                c_NADH_ss = 22,
                c_NADPH = 51,
                # # constraints
                # c_CoA1 = max(0, c_CoA_total - c_AcCoA1),
                # c_CoA2 = max(0, c_CoA_total - c_AcCoA2),
                # c_NADH = max(0, c_NAD_total - c_NAD),
                # expression from LIHC
                c_ACACA = 1.3937241,
                c_ACLY = 5.9057259,
                c_ACO2 = 12.5295931,
                c_ACOT12 = 21.4535639,
                c_ACOT13 = 11.3360529,
                c_ACSS1 = 0.7508832,
                c_ACSS2 = 14.7159301,
                c_CS = 5.3787853,
                c_HDAC1 = 9.6725321,
                c_HDAC2 = 1.3847293,
                c_HDAC3 = 5.3305112,
                c_FASN = 26.7645829,
                c_HMGCS1 = 26.2653794,
                c_IDH2 = 92.8854856,
                c_KAT2A = 3.4616622,
                c_OGDH = 13.7951864,
                c_PC = 48.5013029,
                c_PDHA1 = 13.2815118,
                c_SLC16A3 = 0.5819519
                # protein level
                )

initial_state <- c(
                   c_AcCoA1 = 1e-30,
                   c_Citrate = 1e-30,
                   c_Isocitrate = 1e-30,
                   c_AlphaKG = 1e-30,
                   c_OXa = 1e-30,
                   c_AcCoA2 = 1e-30,
                   c_Acetate = 1e-30,
                   c_NAD = 1e-30
                  )

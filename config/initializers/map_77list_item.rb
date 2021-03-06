
  Map77listItemRename = { #common
    "Basic Device Information" => {
      "LAS_MODEL_NAME=" => {merge: false, label: "Model Name = "},
      "LAS_MACHINE_SN=" => {merge: false, label: "Serial Number = "},
      "LAS_MODEL_CODE=" => {merge: false, label: "Model Code = "},
      "LAS_BRMODELCODE=" => {merge: false, label: "BRModel Code = "},
      "LAS_RVERSION=" => {merge: false, label: "Main Version = "},
      "LAS_PCBM_SN=" => {merge: false, label: "Main PCB SN = "},
      "LAS_FSR_SN=" => {merge: false, label: "Fuser Unit SN = "},
      "LAS_SCN_SN=" => {merge: false, label: "Scanner Unit SN = "},
      "LAS_FBU_SN=" => {merge: false, label: "FB Unit SN = "},
      "LAS_ADF_SN=" => {merge: false, label: "ADF Unit SN = "},
      "LAS_MEMORY_SIZE=" => {merge: false, label: "Memory size = "},
      "LAS_DEFAULT_PAPER_SIZE=" => {merge: false, label: "Default Paper size = "},
      "LAS_PAPER_SIZE=" => {merge: false, label: "Current Paper size = "},
      "INK_MODEL_NAME=" => {merge: false, label: "Model Name = "},
      "INK_MACHINE_SN=" => {merge: false, label: "Serial Number = "},
      "INK_COUNTRY_CODE=" => {merge: false, label: "Country Code = "},
      "INK_PROG_VER_BOOT_DATE=" => {merge: false, label: "Boot Version = "},
      "INK_PROG_VER_BOOT_CHKSUM=" => {merge: false, label: "Boot Checksum = "},
      "INK_HEAD_BARCODE=" => {merge: false, label: "Head barcode = "},
      "INK_HEAD_VRANK=" => {merge: false, label: "Head voltage rank = "},
      "INK_CISTYPE_ADF" => {merge: false, label: "CIS type ADF = "},
      "INK_CISTYPE_FB" => {merge: false, label: "CIS type FB = "}
    },
    "Print Count" => {
      "LAS_PAGECOUNT_TOTAL=" => {merge: true, label: "Total Print Count = ", sublabel: "LAS_PAGECOUNT_TOTAL_DX="},
      "LAS_PAGECOUNT_COLOR_TOTAL=" => {merge: true, label: "Colour Print Count = ", sublabel: "LAS_PAGECOUNT_COLOR_TOTALDX="},
      "LAS_PAGECOUNT_MONO_TOTAL=" => {merge: true, label: "Mono Print Count = ", sublabel: "LAS_PAGECOUNT_MONO_TOTALDX="},
      "INK_PAGECOUNT_TOTAL=" => {merge: true, label: "Total Print Count = ", sublabel: "INK_PAGECOUNT_TOTALDX="},
      "INK_PAGECOUNT_COLOR_TOTAL=" => {merge: true, label: "Colour Print Count = ", sublabel: "INK_PAGECOUNT_COLOR_TOTAL_DX="},
      "INK_PAGECOUNT_MONO_TOTAL=" => {merge: true, label: "Mono Print Count = ", sublabel: "INK_PAGECOUNT_MONO_TOTAL_DX="},
      "INK_PAGECOUNT_BLACK_TOTAL=" => {merge: true, label: "Mono Print Count = ", sublabel: "INK_PAGECOUNT_BLACK_TOTAL_DX="},
      "LAS_PAGECOUNT_PCPRINT=" => {merge: true, label: "Total PCPrint Count = ", sublabel: "LAS_PAGECOUNT_PCPRINT_DX="},
      "LAS_PAGECOUNT_PCPRINT_COLOR=" => {merge: true, label: "Colour PCPrint Count = ", sublabel: "LAS_PAGECOUNT_PCPRINT_COLOR_DX="},
      "LAS_PAGECOUNT_PCPRINT_MONO=" => {merge: true, label: "Mono PCPrint Count = ", sublabel: "LAS_PAGECOUNT_PCPRINT_MONO_DX="},
      "INK_PAGECOUNT_PCPRINT=" => {merge: true, label: "Total PCPrint Count = ", sublabel: "INK_PAGECOUNT_PCPRINT_DX="},
      "INK_PAGECOUNT_PCPRINT_COLOR=" => {merge: true, label: "Colour PCPrint Count = ", sublabel: "INK_PAGECOUNT_PCPRINT_COLOR_DX="},
      "INK_PAGECOUNT_PCPRINT_MONO=" => {merge: true, label: "Mono PCPrint Count = ", sublabel: "INK_PAGECOUNT_PCPRINT_MONO_DX="},
      "INK_PAGECOUNT_PCPRINT_BLACK=" => {merge: true, label: "Mono PCPrint Count = ", sublabel: "INK_PAGECOUNT_PCPRINT_BLACK_DX="},
      "LAS_PAGECOUNT_COPY=" => {merge: true, label: "Total Copy Count = ", sublabel: "LAS_PAGECOUNT_COPY_DX="},
      "LAS_PAGECOUNT_COPY_COLOR=" => {merge: true, label: "Colour Copy Count = ", sublabel: "LAS_PAGECOUNT_COPY_COLOR_DX="},
      "LAS_PAGECOUNT_COPY_MONO=" => {merge: true, label: "Mono Copy Count = ", sublabel: "LAS_PAGECOUNT_COPY_MONO_DX="},
      "INK_PAGECOUNT_COPY=" => {merge: true, label: "Total Copy Count = ", sublabel: "INK_PAGECOUNT_COPY_DX="},
      "INK_PAGECOUNT_COPY_ALL=" => {merge: true, label: "Total Copy Count = ",sublabel: "INK_PAGECOUNT_COPY_ALL_DX="},
      "INK_PAGECOUNT_COPY_COLOR=" => {merge: true, label: "Colour Copy Count = ", sublabel: "INK_PAGECOUNT_COPY_COLOR_DX="},
      "INK_PAGECOUNT_COPY_MONO=" => {merge: true, label: "Mono Copy Count = ", sublabel: "INK_PAGECOUNT_COPY_MONO_DX="},
      "INK_PAGECOUNT_COPY_BLACK=" => {merge: true, label: "Mono Copy Count = ", sublabel: "INK_PAGECOUNT_COPY_BLACK_DX="},
      "LAS_PAGECOUNT_FAX=" => {merge: true, label: "Total FAX Count = ", sublabel: "LAS_PAGECOUNT_FAX_DX="},
      "LAS_PAGECOUNT_FAX_COLOR=" => {merge: true, label: "Colour FAX Count = ", sublabel: "LAS_PAGECOUNT_FAX_COLOR_DX="},
      "LAS_PAGECOUNT_FAX_MONO=" => {merge: true, label: "Mono FAX Count = ", sublabel: "LAS_PAGECOUNT_FAX_MONO_DX="},
      "INK_PAGECOUNT_FAX=" => {merge: false, label: "Fax Total Count = "},
      "INK_PAGECOUNT_FAX_MONO=" => {merge: false, label: "Mono Fax Total Count = "},
      "INK_PAGECOUNT_FAX_BLACK=" => {merge: false, label: "Mono Fax Count = "},
      "INK_PAGECOUNT_FAX_COLOR=" => {merge: false, label: "Color Fax Count = "},
      "INK_PAGECOUNT_LIST=" => {merge: false, label: "List Total Count = "},
      "INK_PAGECOUNT_LIST_MONO=" => {merge: false, label: "Mono List Total Count = "},
      "INK_PAGECOUNT_LIST_BLACK=" => {merge: false, label: "Mono List Count = "},
      "INK_PAGECOUNT_LIST_COLOR=" => {merge: false, label: "Color List Count = "},
      "INK_PAGECOUNT_LIST_FAX=" => {merge: false, label: "List/Fax Total Count = "},
      "INK_PAGECOUNT_LIST_FAX_MONO=" => {merge: false, label: "Mono List/Fax Count = "},
      "INK_PAGECOUNT_LIST_FAX_BLACK=" => {merge: false, label: "Mono List/Fax Count = "},
      "INK_PAGECOUNT_LIST_FAX_COLOR=" => {merge: false, label: "Color List/Fax Count = "},
      "INK_PAGECOUNT_MEDIACARD=" => {merge: false, label: "Media Total Count = "},
      "INK_PAGECOUNT_MEDIACARD_MONO=" => {merge: false, label: "Mono Media Total Count = "},
      "INK_PAGECOUNT_MEDIACARD_BLACK=" => {merge: false, label: "Mono Media Total Count = "},
      "INK_PAGECOUNT_MEDIACARD_COLOR=" => {merge: false, label: "Color Media Total Count = "},
      "INK_PAGECOUNT_PINCHECK=" => {merge: false, label: "Pincheck sheet count = "},
      "INK_PAGECOUNT_CRADJ=" => {merge: false, label: "CRADJ count = "},
      "INK_PAGECOUNT_FEEDADJ=" => {merge: false, label: "FEEDADJ count = "},
      "INK_PAGECOUNT_AIRPRINT=" => {merge: false, label: "Airprint total count = "},
      "INK_PAGECOUNT_AIRPRINT_COLOR=" => {merge: false, label: "Airprint color count = "},
      "INK_PAGECOUNT_AIRPRINT_MONO=" => {merge: false, label: "Airprint mono count = "},
      "INK_PAGECOUNT_AIRPRINT_BLACK=" => {merge: false, label: "Airprint mono count = "},
      "INK_MPS_AIRPRINT_COLOR=" => {merge: false, label: "Airprint color count = "},
      "INK_MPS_AIRPRINT_MONO=" => {merge: false, label: "Airprint mono count = "},
      "INK_PAGECOUNT_IPRINT=" => {merge: false, label: "iPS total count = "},
      "INK_PAGECOUNT_IPRINT_COLOR=" => {merge: false, label: "iPS color count = "},
      "INK_PAGECOUNT_IPRINT_MONO=" => {merge: false, label: "iPS mono count = "},
      "INK_PAGECOUNT_IPRINT_BLACK=" => {merge: false, label: "iPS mono count = "},
      "INK_MPS_IPRINT_COLOR=" => {merge: false, label: "iPS color count = "},
      "INK_MPS_IPRINT_MONO=" => {merge: false, label: "iPS mono count = "},
      "INK_PAGECOUNT_GCP=" => {merge: false, label: "GCP total count = "},
      "INK_PAGECOUNT_GCP_COLOR=" => {merge: false, label: "GCP color count = "},
      "INK_PAGECOUNT_GCP_MONO=" => {merge: false, label: "GCP mono count = "},
      "INK_PAGECOUNT_GCP_BLACK=" => {merge: false, label: "GCP mono count = "},
      "INK_PAGECOUNT_WEBCONNECT=" => {merge: false, label: "Webconnect total count = "},
      "INK_PAGECOUNT_WEBCONNECT_COLOR=" => {merge: false, label: "Webconnect color count = "},
      "INK_PAGECOUNT_WEBCONNECT_MONO=" => {merge: false, label: "Webconnect mono count = "},
      "INK_PAGECOUNT_WEBCONNECT_BLACK=" => {merge: false, label: "Webconnect mono count = "},
      "INK_PAGECOUNT_MOBILEPRINT=" => {merge: false, label: "Mobileprint total count = "},
      "INK_MPS_CLOUD_COLOR=" => {merge: false, label: "Cloud color count = "},
      "INK_MPS_CLOUD_MONO=" => {merge: false, label: "Cloud mono count = "},
      "LAS_PAGECOUNT_OTHER=" => {merge: true, label: "Total Other Count = ", sublabel: "LAS_PAGECOUNT_OTHER_DX="},
      "LAS_PAGECOUNT_OTHER_COLOR=" => {merge: true, label: "Colour Other Count = ", sublabel: "LAS_PAGECOUNT_OTHER_COLOR_DX="},
      "LAS_PAGECOUNT_OTHER_MONO=" => {merge: true, label: "Mono Other Count = ", sublabel: "LAS_PAGECOUNT_OTHER_MONO_DX="},
      "INK_PAGECOUNT_OTHER=" => {merge: true, label: "Total Other Count = ", sublabel: "INK_PAGECOUNT_OTHER_DX="},
      "INK_PAGECOUNT_OTHER_COLOR=" => {merge: true, label: "Colour Other Count = ", sublabel: "INK_PAGECOUNT_OTHER_COLOR_DX="},
      "INK_PAGECOUNT_OTHER_MONO=" => {merge: true, label: "Mono Other Count = ", sublabel: "INK_PAGECOUNT_OTHER_MONO_DX="},
      "INK_PAGECOUNT_OTHER_BLACK=" => {merge: true, label: "Mono Other Count = ", sublabel: "INK_PAGECOUNT_OTHER_BLACK_DX="}
    },
    "Machine Error History" => {
      "LAS_ERRORHISTORY_PAGE_ME=" => {split: ',', merge: false, label: "Machine Error History : "},
      "LAS_ERRORHISTORY_ENGINE=" => {split: ',', merge: false, label: "Engine Error History : "},
      "LAS_ERRORHISTORY_DATE_COMM=" => {split: ',', merge: false, label: "Comm Error History : "},
      "LAS_HISTORY_HODEN1=" => {split: ',', merge: false, label: "Discharge History1 : "},
      "LAS_HISTORY_HODEN2=" => {split: ',', merge: false, label: "Discharge History2 : "},
      "LAS_HISTORY_HODEN3=" => {split: ',', merge: false, label: "Discharge History3 : "},
      "INK_SCAN_HP_ERR=" => {merge: false, label: "Home Position Scan Error : "},
      "INK_SCAN_ERR_LOG_WTAPE=" => {split: ',', merge: false, label: "Home Position Scan Error History : "},
      "INK_ERRORHISTORY_ME=" => {split: ',', merge: false, label: "Machine Error History : "},
      "INK_ERRORHISTORY_COMM=" => {split: ',', merge: false, label: "Comm Error History : "}
    },
    "Toner/INK Replace Count" => {
      "LAS_KTONER_CHANGE_COUNT=" => {merge: true, label: "B : ", sublabel: {manual: "LAS_KTONER_CHANGE_COUNT_MANUAL=", date: "LAS_KTONER_CHANGE_DATE="}},
      "LAS_CTONER_CHANGE_COUNT=" => {merge: true, label: "C : ", sublabel: {manual: "LAS_CTONER_CHANGE_COUNT_MANUAL=", date: "LAS_CTONER_CHANGE_DATE="}},
      "LAS_MTONER_CHANGE_COUNT=" => {merge: true, label: "M : ", sublabel: {manual: "LAS_MTONER_CHANGE_COUNT_MANUAL=", date: "LAS_MTONER_CHANGE_DATE="}},
      "LAS_YTONER_CHANGE_COUNT=" => {merge: true, label: "Y : ", sublabel: {manual: "LAS_YTONER_CHANGE_COUNT_MANUAL=", date: "LAS_YTONER_CHANGE_DATE="}},
      "LAS_TONER_CHANGE_COUNT=" => {merge: true, label: "B : ", sublabel: {manual: "LAS_TONER_CHANGE_COUNT_MANUAL=", date: "LAS_TONER_CHANGE_DATE="}},
      "INK_CARTCHG_COUNT_BLACK=" => {merge: false, label: "T1B : "},
      "INK_CARTCHG_COUNT_CYAN=" => {merge: false, label: "T1C : "},
      "INK_CARTCHG_COUNT_MAGENTA=" => {merge: false, label: "T1M : "},
      "INK_CARTCHG_COUNT_YELLOW=" => {merge: false, label: "T1Y : "},
      "INK_CART_GENUINE_BLACK2=" => {merge: false, label: "T2B : "},
      "INK_CART_GENUINE_CYAN2=" => {merge: false, label: "T2C : "},
      "INK_CARTCHG_COUNT_MAGENTA2=" => {merge: false, label: "T2M : "},
      "INK_CARTCHG_COUNT_YELLOW2=" => {merge: false, label: "T2Y : "}
    },
    "Cartridge Type (Using)" => {
      "LAS_KTONER_CHANGE_TYPE1=" => {merge: false, label: "Black = "},
      "LAS_CTONER_CHANGE_TYPE1=" => {merge: false, label: "Cyan = "},
      "LAS_MTONER_CHANGE_TYPE1=" => {merge: false, label: "Magenta = "},
      "LAS_YTONER_CHANGE_TYPE1=" => {merge: false, label: "Yellow = "},
      "LAS_TONER_CHANGE_TYPE1=" => {merge: false, label: "Black = "},
      "INK_CARTRIDGE_STATE_K=" => {merge: false, label: "Black = "},
      "INK_CARTRIDGE_STATE_C=" => {merge: false, label: "Cyan = "},
      "INK_CARTRIDGE_STATE_M=" => {merge: false, label: "Magenta = "},
      "INK_CARTRIDGE_STATE_Y=" => {merge: false, label: "Yellow = "},
      "INK_CARTRIDGE_STATE_ERROR_K=" => {merge: false, label: "Black Error State = "},
      "INK_CARTRIDGE_STATE_ERROR_C=" => {merge: false, label: "Cyan Error State = "},
      "INK_CARTRIDGE_STATE_ERROR_M=" => {merge: false, label: "Magenta Error State = "},
      "INK_CARTRIDGE_STATE_ERROR_Y=" => {merge: false, label: "Yellow Error State = "},
      "INK_CART_GENUINE_BLACK=" => {merge: false, label: "Black genuine State = "},
      "INK_CART_GENUINE_CYAN=" => {merge: false, label: "Cyan genuine State = "},
      "INK_CART_GENUINE_MAGENTA=" => {merge: false, label: "Magenta genuine State = "},
      "INK_CART_GENUINE_YELLOW=" => {merge: false, label: "Yellow genuine State = "}
    },
    "Toner/Ink Remaining Life" => {
      "LAS_KTONER_REMAIN=" => {merge: false, label: "Black(%) = "},
      "LAS_CTONER_REMAIN=" => {merge: false, label: "Cyan(%) = "},
      "LAS_MTONER_REMAIN=" => {merge: false, label: "Magenta(%) = "},
      "LAS_YTONER_REMAIN=" => {merge: false, label: "Yellow(%) = "},
      "LAS_TONER_REMAIN=" => {merge: false, label: "Black(%) = "},
      "INK_REMAINING_BLACK=" => {merge: false, label: "Black(%) = "},
      "INK_REMAINING_CYAN=" => {merge: false, label: "Cyan(%) = "},
      "INK_REMAINING_MAGENTA=" => {merge: false, label: "Magenta(%) = "},
      "INK_REMAINING_YELLOW=" => {merge: false, label: "Yellow(%) = "}
    },
    "Page Count for each paper size" => {
      "LAS_PAGES_A4=" => {merge: false, label: "A4 = "},
      "LAS_PAGES_LETTER=" => {merge: false, label: "Letter = "},
      "LAS_PAGES_LEGAL=" => {merge: false, label: "Legal = "},
      "LAS_PAGES_EXECUTIVE=" => {merge: false, label: "Executive = "},
      "LAS_PAGES_A5=" => {merge: false, label: "A5 = "},
      "LAS_PAGES_ISOB5=" => {merge: false, label: "ISOB5 = "},
      "LAS_PAGES_JISB5=" => {merge: false, label: "JISB5 = "},
      "LAS_PAGES_C5=" => {merge: false, label: "C5 = "},
      "LAS_PAGES_DL=" => {merge: false, label: "DL = "},
      "LAS_PAGES_MONARC=" => {merge: false, label: "MONARC = "},
      "LAS_PAGES_OTHER=" => {merge: false, label: "Other = "},
      "INK_PAGES_A3LDG_PLAIN=" => {merge: false, label: "A3 Ledger Plain = "},
      "INK_PAGES_A3LDG_INKJET=" => {merge: false, label: "A3 Ledger Inkjet = "},
      "INK_PAGES_A3LDG_GLOSSY=" => {merge: false, label: "A3 Ledger Glossy = "},
      "INK_PAGES_A4LTR_PLAIN=" => {merge: false, label: "A4 Letter Plain = "},
      "INK_PAGES_A4LTR_INKJET=" => {merge: false, label: "A4 Letter Inkjet = "},
      "INK_PAGES_A4LTR_GLOSSY=" => {merge: false, label: "A4 Letter Glossy = "},
      "INK_PAGES_4X6_PLAIN=" => {merge: false, label: "4x6 Plain = "},
      "INK_PAGES_4X6_INKJET=" => {merge: false, label: "4x6 Inkjet = "},
      "INK_PAGES_4X6_GLOSSY=" => {merge: false, label: "4x6 Glossy = "},
      "INK_PAGES_HAGAKI_PLAIN=" => {merge: false, label: "Hagaki Plain = "},
      "INK_PAGES_HAGAKI_INKJET=" => {merge: false, label: "Hagaki Inkjet = "},
      "INK_PAGES_HAGAKI_GLOSSY=" => {merge: false, label: "Hagaki Glossy = "},
      "INK_PAGES_LBAN_PLAIN=" => {merge: false, label: "Lban Plain = "},
      "INK_PAGES_LBAN_INKJET=" => {merge: false, label: "Lban Inkjet = "},
      "INK_PAGES_LBAN_GLOSSY=" => {merge: false, label: "Lban Glossy = "},
      "INK_PAGES_ENVELOPE=" => {merge: false, label: "Envelope = "},
      "INK_PAGES_A3_PLAIN=" => {merge: false, label: "A3 Plain = "},
      "INK_PAGES_A3_INKJET=" => {merge: false, label: "A3 Inkjet = "},
      "INK_PAGES_A3_GLOSSY=" => {merge: false, label: "A3 Glossy = "},
      "INK_PAGES_A4_PLAIN=" => {merge: false, label: "A4 Plain = "},
      "INK_PAGES_A4_INKJET=" => {merge: false, label: "A4 Inkjet = "},
      "INK_PAGES_A4_GLOSSY=" => {merge: false, label: "A4 Glossy = "},
      "INK_PAGES_CARD_PLAIN=" => {merge: false, label: "Card Plain = "},
      "INK_PAGES_CARD_INKJET" => {merge: false, label: "Card Inkjet = "},
      "INK_PAGES_CARD_GLOSSY=" => {merge: false, label: "Card Glossy = "},
      "INK_PAGES_L_PLAIN=" => {merge: false, label: "L Plain = "},
      "INK_PAGES_L_INKJET=" => {merge: false, label: "L Inkjet = "},
      "INK_PAGES_L_GLOSSY=" => {merge: false, label: "L Glossy = "}
    },
    "Page Count for each tray" => {
      "LAS_COUNTPAGE_PFMP=" => {merge: false, label: "MP Tray = "},
      "LAS_COUNTPAGE_PFMF=" => {merge: false, label: "Manual Feed = "},
      "LAS_COUNTPAGE_PF1=" => {merge: false, label: "Tray1 = "},
      "LAS_COUNTPAGE_PF2=" => {merge: false, label: "Tray2 = "},
      "LAS_COUNTPAGE_PF3=" => {merge: false, label: "Tray3 = "},
      "LAS_COUNTPAGE_PF4=" => {merge: false, label: "Tray4 = "},
      "LAS_COUNTPAGE_PF5=" => {merge: false, label: "Tray5 = "},
      "LAS_COUNTPAGE_DX=" => {merge: false, label: "Duplex = "},
      "LAS_COUNTPAGE_STDEJCT=" => {merge: false, label: "Std Output = "},
      "INK_COUNTPAGE_MPTRAY=" => {merge: false, label: "MP Tray = "},
      "INK_COUNTPAGE_MFS=" => {merge: false, label: "Manual Feed = "},
      "INK_COUNTPAGE_TRAY1=" => {merge: false, label: "Tray1 = "},
      "INK_COUNTPAGE_TRAY2=" => {merge: false, label: "Tray2 = "},
      "INK_COUNTPAGE_TRAY3=" => {merge: false, label: "Tray3 = "},
      "INK_COUNTPAGE_CDLABEL=" => {merge: false, label: "CD Label = "},
      "INK_TRAYCOUNT_MPTRAY_TOTAL=" => {merge: false, label: "MP Tray = "},
      "INK_TRAYCOUNT_MANFEED_TOTAL=" => {merge: false, label: "Manual Feed = "},
      "INK_TRAYCOUNT_TRAY1_TOTAL=" => {merge: false, label: "Tray1 = "},
      "INK_TRAYCOUNT_TRAY2_TOTAL=" => {merge: false, label: "Tray2 = "},
      "INK_TRAYCOUNT_TRAY3_TOTAL=" => {merge: false, label: "Tray3 = "},
      "INK_TRAYCOUNT_CDLABEL_TOTAL" => {merge: false, label: "CD Label = "}
    },
    "JAM count" => {
      "LAS_JAMCOUNT=" => {merge: false, label: "Jam Total : "},
      "LAS_JAMCOUNTMP=" => {merge: false, label: "Jam MP : "},
      "LAS_JAMCOUNTMN=" => {merge: false, label: "Jam MN : "},
      "LAS_JAMCOUNTT1=" => {merge: false, label: "Jam T1 : "},
      "LAS_JAMCOUNTT2=" => {merge: false, label: "Jam T2 : "},
      "LAS_JAMCOUNTT3=" => {merge: false, label: "Jam T3 : "},
      "LAS_JAMCOUNTT4=" => {merge: false, label: "Jam T4 : "},
      "LAS_JAMCOUNTT5=" => {merge: false, label: "Jam T5 : "},
      "LAS_JAMCOUNTINSIDE=" => {merge: false, label: "Jam Inside : "},
      "LAS_JAMCOUNTREAR=" => {merge: false, label: "Jam Rear : "},
      "LAS_JAM_DUPLEX=" => {merge: false, label: "Jam Duplex : "},
      "LAS_JAMCOUNT_ADF=" => {merge: false, label: "Jam ADF : "},
      "LAS_JAMCOUNT_ADDX=" => {merge: false, label: "Jam ADDX : "},
      "INK_JAMCOUNT=" => {merge: false, label: "Jam Total : "},
      "INK_JAMCOUNT_DXBACK=" => {merge: false, label: "Jam Duplex Back Side : "},
      "INK_JAMCOUNT_MP_FEED=" => {merge: false, label: "Jam MP : "},
      "INK_JAMCOUNT_MN_FEED=" => {merge: false, label: "Jam MN : "},
      "INK_JAMCOUNT_T1_FEED=" => {merge: false, label: "Jam T1 : "},
      "INK_JAMCOUNT_T2_FEED=" => {merge: false, label: "Jam T2 : "},
      "INK_JAMCOUNT_T3_FEED=" => {merge: false, label: "Jam T3 : "},
      "INK_JAMCOUNT_CDLABEL_FEED=" => {merge: false, label: "Jam CD Label : "},
      "INK_JAMCOUNT_ADF=" => {merge: false, label: "Jam ADF : "},
      "INK_JAMCOUNT_ADSX=" => {merge: false, label: "Jam ADSX : "},
      "INK_JAMCOUNT_ADDX=" => {merge: false, label: "Jam ADDX : "}
    },
    "Scan count" => {
      "LAS_SCANPAGE_ADF=" => {merge: false, label: "Scan ADF : "},
      "LAS_SCANSXPAGE_ADF=" => {merge: false, label: "Scan ADFSX : "},
      "LAS_SCANDXPAGE_ADF=" => {merge: false, label: "Scan ADFDX : "},
      "LAS_SCANPAGE_FB=" => {merge: false, label: "Scan FB : "},
      "LAS_SCANNERPAGE=" => {merge: false, label: "Scan count except FAX / Copy : "},
      "INK_SCANPAGE_ADF=" => {merge: false, label: "Scan ADF : "},
      "INK_SCANPAGE_ADFDX" => {merge: false, label: "Scan ADFDX : "},
      "INK_SCANPAGE_FB=" => {merge: false, label: "FB : "},
      "INK_SCANPAGE_FAX=" => {merge: false, label: "Fax : "},
      "INK_SCANPAGE_SCANNER=" => {merge: false, label: "Scan count except FAX / Copy : "}
    },
    "Sensor log" => {
      "LAS_SENSORLOG_ENGINE=" => {split: ',', merge: false, label: "Engine : "},
      "LAS_SENSORLOG_ADF=" => {split: ',', merge: false, label: "ADF : "},
      "INK_SENSOR_STATUS=" => {split: ',', merge: false, label: "Ink Sensor : "},
      "INK_SENSOR_STATUS_DF=" => {merge: false, label: "DF : "},
      "INK_SENSOR_STATUS_DR=" => {merge: false, label: "DR : "},
      "INK_SENSOR_STATUS_CV=" => {merge: false, label: "CV : "},
      "INK_SENSOR_STATUS_RS=" => {merge: false, label: "RS : "},
      "INK_SENSOR_STATUS_CC=" => {merge: false, label: "CC : "},
      "INK_SENSOR_STATUS_P1=" => {merge: false, label: "P1 : "},
      "INK_SENSOR_STATUS_AC=" => {merge: false, label: "AC : "},
      "INK_SENSOR_STATUS_IK=" => {merge: false, label: "IK : "},
      "INK_SENSOR_STATUS_IY=" => {merge: false, label: "IY : "},
      "INK_SENSOR_STATUS_IC=" => {merge: false, label: "IC : "},
      "INK_SENSOR_STATUS_IM=" => {merge: false, label: "IM : "},
      "INK_SENSOR_STATUS_EK=" => {merge: false, label: "EK : "},
      "INK_SENSOR_STATUS_EY=" => {merge: false, label: "EY : "},
      "INK_SENSOR_STATUS_EC=" => {merge: false, label: "EC : "},
      "INK_SENSOR_STATUS_EM=" => {merge: false, label: "EM : "},
      "INK_SENSOR_STATUS_OR=" => {merge: false, label: "OR : "},
      "INK_SENSOR_STATUS_CD=" => {merge: false, label: "CD : "},
      "INK_SENSOR_STATUS_PP=" => {merge: false, label: "PP : "},
      "INK_SENSOR_STATUS_HF=" => {merge: false, label: "HF : "},
      "INK_SENSOR_STATUS_A3=" => {merge: false, label: "A3 : "},
      "INK_SENSOR_STATUS_B4=" => {merge: false, label: "B4 : "},
      "INK_SENSOR_STATUS_RB=" => {merge: false, label: "RB : "},
      "INK_SENSOR_STATUS_FC=" => {merge: false, label: "FC : "},
      "INK_SENSOR_STATUS_VT=" => {merge: false, label: "VT : "},
      "INK_SENSOR_STATUS_HK=" => {merge: false, label: "HK : "},
      "INK_SENSOR_STATUS_T1=" => {merge: false, label: "T1 : "}
    },
    "revision" => {
      "LAS_AUTOREGIST_COUNT=" => {merge: false, label: "Auto regist count : "},
      "LAS_MANUREGIST_COUNT=" => {merge: false, label: "Manual regist count : "},
      "LAS_AUTODEVBIAS_COUNT=" => {merge: false, label: "Auto dev bias count : "},
      "LAS_MANUDEVBIAS_COUNT=" => {merge: false, label: "Manual dev bias count : "},
      "LAS_AUTOGAMMA_COUNT=" => {merge: false, label: "Auto gamma count : "},
      "LAS_MANUGAMMA_COUNT=" => {merge: false, label: "Manual gamma count : "},
      "LAS_REGISTERR_COUNT=" => {merge: false, label: "Regist error count : "},
      "INK_FEEDADJ_TRY=" => {merge: false, label: "Feed Adjustment count : "},
      "INK_FEEDADJ_COMPLETE=" => {merge: false, label: "Feed Adjustment complete count : "},
      "INK_ALIGNMENT_TRY=" => {merge: false, label: "Alignment count : "},
      "INK_ALIGNMENT_COMPLETE=" => {merge: false, label: "Alignment complete count : "}
    },
    "Other information" => {
      "LAS_TOTALTIME_POWER_ON=" => {merge: false, label: "PowerOn Total Time : "},
      "LAS_POWER_ON_COUNT=" => {merge: false, label: "PowerOn count : "},
      "LAS_FIRST_PRINTDATE=" => {merge: false, label: "First print Date : "},
      "LAS_FIRST_RTCSETUP=" => {merge: false, label: "RTC set up : "},
      "INK_TOTALTIME_POWER_ON=" => {merge: false, label: "PowerOn Time : "},
      "INK_TOTALCOUNT_POWER_ON=" => {merge: false, label: "PowerOn count : "},
      "INK_FIRST_PRINT_DATE=" => {merge: false, label: "First print Date : "},
      "INK_SETUP_DATE=" => {merge: false, label: "RTC set up : "}
    },
    "Errors" => {
      "LAS_HODENERR_COUNT=" => {merge: false, label: "Discharge error count : "},
      "LAS_FUSERERR_COUNT=" => {merge: false, label: "Fuser error count : "},
      "LAS_POLYMTRLOCKERR_COUNT=" => {merge: false, label: "Polygon Motor Lock error count : "},
      "LAS_SQWAVEDETECT_COUNT=" => {merge: false, label: "SQ Wave detect count : "}
    },
    #laser device
    "Average Coverage-Total" => {
      "LAS_KCOVERAGE_ACC=" => {merge: false, label: "B(%) : "},
      "LAS_MCOVERAGE_ACC=" => {merge: false, label: "M(%) : "},
      "LAS_CCOVERAGE_ACC=" => {merge: false, label: "C(%) : "},
      "LAS_YCOVERAGE_ACC=" => {merge: false, label: "Y(%) : "},
      "LAS_COVERAGE_ACC=" => {merge: false, label: "B(%) : "}
    },
    "Average Coverage-Current" => {
      "LAS_KCOVERAGE_USING=" => {merge: false, label: "B(%) : "},
      "LAS_MCOVERAGE_USING=" => {merge: false, label: "M(%) : "},
      "LAS_CCOVERAGE_USING=" => {merge: false, label: "C(%) : "},
      "LAS_YCOVERAGE_USING=" => {merge: false, label: "Y(%) : "},
      "LAS_COVERAGE_USING=" => {merge: false, label: "B(%) : "}
    },
    "Average Coverage-Latest" => {
      "LAS_KCOVERAGE_LAST=" => {merge: false, label: "B(%) : "},
      "LAS_MCOVERAGE_LAST=" => {merge: false, label: "M(%) ; "},
      "LAS_CCOVERAGE_LAST=" => {merge: false, label: "C(%) : "},
      "LAS_YCOVERAGE_LAST=" => {merge: false, label: "Y(%) : "},
      "LAS_COVERAGE_LAST=" => {merge: false, label: "B(%) : "}
    },
    "Drum Replace Count" => {
      "LAS_KDRUM_CHANGE_COUNT=" => {merge: false, label: "B : "},
      "LAS_CDRUM_CHANGE_COUNT=" => {merge: false, label: "C : "},
      "LAS_MDRUM_CHANGE_COUNT=" => {merge: false, label: "M : "},
      "LAS_YDRUM_CHANGE_COUNT=" => {merge: false, label: "Y : "},
      "LAS_DRUM_CHANGE_COUNT=" => {merge: false, label: "B : "}
    },
    "Belt Unit Replace Count" => {
      "LAS_BELT_CHANGE_COUNT=" => {merge: false, label: "Belt : "}
    },
    "Waste Unit Replace Count" => {
      "LAS_WASTEBOX_CHANGE_COUNT=" => {merge: false, label: "Waste Unit : "}
    },
    "Fuser Unit Replace Count" => {
      "LAS_FUSER_CHANGE_COUNT=" => {merge: false, label: "Fuser Unit : "}
    },
    "Laser Unit Replace Count" => {
      "LAS_SCANNER_CHANGE_COUNT=" => {merge: false, label: "Laser Unit : "}
    },
    "PFKit Replace Count" => {
      "LAS_PFKIT1_CHANGE_COUNT=" => {merge: false, label: "PFKit1 : "},
      "LAS_PFKIT2_CHANGE_COUNT=" => {merge: false, label: "PFKit2 : "},
      "LAS_PFKIT3_CHANGE_COUNT=" => {merge: false, label: "PFKit3 : "},
      "LAS_PFKIT4_CHANGE_COUNT=" => {merge: false, label: "PFKit4 : "},
      "LAS_PFKIT5_CHANGE_COUNT=" => {merge: false, label: "PFKit5 : "},
      "LAS_PFKITMP_CHANGE_COUNT=" => {merge: false, label: "PFKitMP : "}
    },
    "Cartridge Type History for last 5 times" => {
      "LAS_KTONER_CHANGE_TYPE_HIST=" => {split: ',', merge: false, label: "Black = "},
      "LAS_CTONER_CHANGE_TYPE_HIST=" => {split: ',', merge: false, label: "Cyan = "},
      "LAS_MTONER_CHANGE_TYPE_HIST=" => {split: ',', merge: false, label: "Magenta = "},
      "LAS_YTONER_CHANGE_TYPE_HIST=" => {split: ',', merge: false, label: "Yellow = "},
      "LAS_TONER_CHANGE_TYPE_HIST=" => {split: ',', merge: false, label: "Black = "}
    },
    "Factor of Toner Empty History" => {
      "LAS_KTONER_EMPTYREASON_HIST=" => {split: ',', merge: false, label: "Black = "},
      "LAS_CTONER_EMPTYREASON_HIST=" => {split: ',', merge: false, label: "Cyan = "},
      "LAS_MTONER_EMPTYREASON_HIST=" => {split: ',', merge: false, label: "Magenta = "},
      "LAS_YTONER_EMPTYREASON_HIST=" => {split: ',', merge: false, label: "Yellow = "},
      "LAS_TONER_EMPTYREASON_HIST=" => {split: ',', merge: false, label: "Black = "}
    },
    "Drum Remaining Life" => {
      "LAS_NEXTCARE_KDRUM=" => {merge: true, label: "Black = ", sublabel: "LAS_KDRUM_LIFE_PERIOD="},
      "LAS_NEXTCARE_CDRUM=" => {merge: true, label: "Cyan = ", sublabel: "LAS_CDRUM_LIFE_PERIOD="},
      "LAS_NEXTCARE_MDRUM=" => {merge: true, label: "Magenta = ", sublabel: "LAS_MDRUM_LIFE_PERIOD="},
      "LAS_NEXTCARE_YDRUM=" => {merge: true, label: "Yellow = ", sublabel: "LAS_YDRUM_LIFE_PERIOD="},
      "LAS_NEXTCARE_DRUM=" => {merge: true, label: "Drum = ", sublabel: "LAS_DRUM_LIFE_PERIOD="}
    },
    "BeltUnit Remaining Life" => {
      "LAS_BELT_REMAIN=" => {merge: true, label: "Belt = ", sublabel: "LAS_BELT_LIFE_PERIOD="}
    },
    "FuserUnit Remaining Life" => {
      "LAS_FUSER_REMAIN=" => {merge: true, label: "Fuser = ", sublabel: "LAS_FUSER_LIFE_PERIOD="}
    },
    "LaserUnit Remaining Life" => {
      "LAS_SCANNER_REMAIN=" => {merge: true, label: "Laser = ", sublabel: "LAS_SCANNER_LIFE_PERIOD="}
    },
    "PFKit Remaining Life" => {
      "LAS_PFKITMP_REMAIN=" => {merge: true, label: "PFKitMP = ", sublabel: "LAS_PFKITMP_LIFE_PERIOD="},
      "LAS_PFKIT1_REMAIN=" => {merge: true, label: "PFKit1 = ", sublabel: "LAS_PFKIT1_LIFE_PERIOD="},
      "LAS_PFKIT2_REMAIN=" => {merge: true, label: "PFKit2 = ", sublabel: "LAS_PFKIT2_LIFE_PERIOD="},
      "LAS_PFKIT3_REMAIN=" => {merge: true, label: "PFKit3 = ", sublabel: "LAS_PFKIT3_LIFE_PERIOD="},
      "LAS_PFKIT4_REMAIN=" => {merge: true, label: "PFKit4 = ", sublabel: "LAS_PFKIT4_LIFE_PERIOD="},
      "LAS_PFKIT5_REMAIN=" => {merge: true, label: "PFKit5 = ", sublabel: "LAS_PFKIT5_LIFE_PERIOD="}
    },
    "Print Count with current Toner" => {
      "LAS_KTONER_PAGE_COUNT1=" => {merge: false, label: "Current Black = "},
      "LAS_CTONER_PAGE_COUNT1=" => {merge: false, label: "Current Cyan = "},
      "LAS_MTONER_PAGE_COUNT1=" => {merge: false, label: "Current Magenta = "},
      "LAS_YTONER_PAGE_COUNT1=" => {merge: false, label: "Current Yellow = "},
      "LAS_TONER_PAGE_COUNT1=" => {merge: false, label: "Current Black = "}
    },
    "Print Count with previous Toner" => {
      "LAS_KTONER_PAGE_COUNT2=" => {merge: false, label: "Previous Black = "},
      "LAS_CTONER_PAGE_COUNT2=" => {merge: false, label: "Previous Cyan = "},
      "LAS_MTONER_PAGE_COUNT2=" => {merge: false, label: "Previous Magenta = "},
      "LAS_YTONER_PAGE_COUNT2=" => {merge: false, label: "Previous Yellow = "},
      "LAS_TONER_PAGE_COUNT2=" => {merge: false, label: "Previous Black = "}
    },
    "Developer Count with current Toner" => {
      "LAS_KDEVROLLER_COUNT=" => {merge: false, label: "Black = "},
      "LAS_CDEVROLLER_COUNT=" => {merge: false, label: "Cyan = "},
      "LAS_MDEVROLLER_COUNT=" => {merge: false, label: "Magenta = "},
      "LAS_YDEVROLLER_COUNT=" => {merge: false, label: "Yellow = "},
      "LAS_DEVROLLER_COUNT=" => {merge: false, label: "Black = "}
    },
    "Developer Count History for last 5 times" => {
      "LAS_KTONER_CHANGE_DEVROLLERCOUNT_HIST=" => {split: ',', merge: false, label: "Black = "},
      "LAS_CTONER_CHANGE_DEVROLLERCOUNT_HIST=" => {split: ',', merge: false, label: "Cyan = "},
      "LAS_MTONER_CHANGE_DEVROLLERCOUNT_HIST=" => {split: ',', merge: false, label: "Magenta = "},
      "LAS_YTONER_CHANGE_DEVROLLERCOUNT_HIST=" => {split: ',', merge: false, label: "Yellow = "},
      "LAS_TONER_CHANGE_DEVROLLERCOUNT_HIST=" => {split: ',', merge: false, label: "Black = "}
    },
    "Page Count monthly" => {
      "LAS_PAGE_COUNT_MONTHLY=" => {split: ',', merge: false, label: "Log : "}
    },
    "FAX count" => {
      "LAS_FAXTXPAGE=" => {merge: false, label: "FAX : "},
      "LAS_PCFAXRXPAGE=" => {merge: false, label: "PCFAX RX : "},
      "LAS_PCFAXTXPAGE=" => {merge: false, label: "PCFAX TX : "}
    },
    "New Toner Detect Log" => {
      "LAS_NEWTONERDETECTION_LOG=" => {split: ', ', merge: false, label: "Log : "}
    },
    "Temp/Humidity" => {
      "LAS_TEMPERATURE_MAX=" => {merge: false, label: "Temp_Max : "},
      "LAS_TEMPERATURE_MIN=" => {merge: false, label: "Temp_Min : "},
      "LAS_HUMIDITY_MAX=" => {merge: false, label: "Humidity_Max : "},
      "LAS_HUMIDITY_MIN=" => {merge: false, label: "Humidity_Min : "}
    },
    "Developing Bias Voltage" => {
      "LAS_KDEVBIAS_VOLTAGE=" => {merge: false, label: "B : "},
      "LAS_CDEVBIAS_VOLTAGE=" => {merge: false, label: "C : "},
      "LAS_MDEVBIAS_VOLTAGE=" => {merge: false, label: "M : "},
      "LAS_YDEVBIAS_VOLTAGE=" => {merge: false, label: "Y : "},
      "LAS_DEVBIAS_VOLTAGE=" => {merge: false, label: "B : "}
    },
    #ink_device
    "Roller Cleaning count" => {
      "INK_ROLL_CLEAN_TRAY1=" => {merge: false, label: "Roller Clean Tray1 : "},
      "INK_ROLL_CLEAN_TRAY2=" => {merge: false, label: "Roller Clean Tray2 : "},
      "INK_ROLL_CLEAN_TRAY3=" => {merge: false, label: "Roller Clean Tray3 : "},
      "INK_ROLL_CLEAN_MPTRAY=" => {merge: false, label: "Roller Clean MP Tray : "}
    },
    "Pick Miss count" => {
      "INK_PICKMISS_TRAY1=" => {merge: false, label: "Pick Miss Tray1 : "},
      "INK_PICKMISS_TRAY2=" => {merge: false, label: "Pick Miss Tray2 : "},
      "INK_PICKMISS_TRAY3=" => {merge: false, label: "Pick Miss Tray3 : "},
      "INK_PICKMISS_MPTRAY=" => {merge: false, label: "Pick Miss MP Tray : "},
      "INK_PICKMISS_MFS=" => {merge: false, label: "Pick Miss Manual Feed : "},
      "INK_PICKMISS_CDLABEL=" => {merge: false, label: "Pick Miss CD Label : "}
    },
    "Purge related" => {
      "INK_INITPURGE_STATUS=" => {merge: false, label: "Initial Purge Log : "},
      "INK_INITPURGE_PASSTIME=" => {split: ',', merge: false, label: "Purge passtime Log : "},
      "INK_PURGEWASTE_COUNT=" => {merge: false, label: "Total Purge Count : "},
      "INK_WIPEHEAD_COUNT=" => {merge: false, label: "Nozzle Wipe Count : "},
      "INK_FLUSHWASTE_COUNT_BK=" => {merge: false, label: "Flush Count (BK) : "},
      "INK_FLUSHWASTE_COUNT_CL=" => {merge: false, label: "Flush Count (CL) : "},
      "INK_PURGESENSOR_COUNT=" => {merge: false, label: "Sensor Purge : "},
      "INK_PURGECNT_EIP_AUTO_BK=" => {merge: true, label: "eIP (BK) : ", sublabel: "INK_PURGECNT_EIP_MANU_BK="},
      "INK_PURGECNT_UIP_AUTO_BK=" => {merge: true, label: "UIP (BK) : ", sublabel: "INK_PURGECNT_UIP_MANU_BK="},
      "INK_PURGECNT_RP_AUTO_BK=" => {merge: true, label: "RP (BK) : ", sublabel: "INK_PURGECNT_RP_MANU_BK="},
      "INK_PURGECNT_SRP_AUTO_BK=" => {merge: true, label: "SRP (BK) : ", sublabel: "INK_PURGECNT_SRP_MANU_BK="},
      "INK_PURGECNT_SP_AUTO_BK=" => {merge: true, label: "SP (BK) : ", sublabel: "INK_PURGECNT_SP_MANU_BK="},
      "INK_PURGECNT_RP2_AUTO_BK=" => {merge: true, label: "RP2 (BK) : ", sublabel: "INK_PURGECNT_RP2_MANU_BK="},
      "INK_PURGECNT_CP_AUTO_BK=" => {merge: true, label: "CP (BK) : ", sublabel: "INK_PURGECNT_CP_MANU_BK="},
      "INK_PURGECNT_NP_AUTO_BK=" => {merge: true, label: "NP (BK) : ", sublabel: "INK_PURGECNT_NP_MANU_BK="},
      "INK_PURGECNT_RP3_AUTO_BK=" => {merge: true, label: "RP3 (BK) : ", sublabel: "INK_PURGECNT_RP3_MANU_BK="},
      "INK_PURGECNT_PP_AUTO_BK=" => {merge: true, label: "PP (BK) : ", sublabel: "INK_PURGECNT_PP_MANU_BK="},
      "INK_PURGECNT_QPP_AUTO_BK=" => {merge: true, label: "QPP (BK) : ", sublabel: "INK_PURGECNT_QPP_MANU_BK="},
      "INK_PURGECNT_MPP_AUTO_BK=" => {merge: true, label: "MPP (BK) : ", sublabel: "INK_PURGECNT_MPP_MANU_BK="},
      "INK_PURGECNT_REP_AUTO_BK=" => {merge: true, label: "REP (BK) : ", sublabel: "INK_PURGECNT_REP_MANU_BK="},
      "INK_PURGECNT_EIP_AUTO_CL=" => {merge: true, label: "eIP (CL) : ", sublabel: "INK_PURGECNT_EIP_MANU_CL="},
      "INK_PURGECNT_UIP_AUTO_CL=" => {merge: true, label: "UIP (CL) : ", sublabel: "INK_PURGECNT_UIP_MANU_CL="},
      "INK_PURGECNT_RP_AUTO_CL=" => {merge: true, label: "RP (CL) : ", sublabel: "INK_PURGECNT_RP_MANU_CL="},
      "INK_PURGECNT_SRP_AUTO_CL=" => {merge: true, label: "SRP (CL) : ", sublabel: "INK_PURGECNT_SRP_MANU_CL="},
      "INK_PURGECNT_SP_AUTO_CL=" => {merge: true, label: "SP (CL) : ", sublabel: "INK_PURGECNT_SP_MANU_CL="},
      "INK_PURGECNT_RP2_AUTO_CL=" => {merge: true, label: "RP2 (CL) : ", sublabel: "INK_PURGECNT_RP2_MANU_CL="},
      "INK_PURGECNT_CP_AUTO_CL=" => {merge: true, label: "CP (CL) : ", sublabel: "INK_PURGECNT_CP_MANU_CL="},
      "INK_PURGECNT_NP_AUTO_CL=" => {merge: true, label: "NP (CL) : ", sublabel: "INK_PURGECNT_NP_MANU_CL="},
      "INK_PURGECNT_RP3_AUTO_CL=" => {merge: true, label: "RP3 (CL) : ", sublabel: "INK_PURGECNT_RP3_MANU_CL="},
      "INK_PURGECNT_PP_AUTO_CL=" => {merge: true, label: "PP (CL) : ", sublabel: "INK_PURGECNT_PP_MANU_CL="},
      "INK_PURGECNT_QPP_AUTO_CL=" => {merge: true, label: "QPP (CL) : ", sublabel: "INK_PURGECNT_QPP_MANU_CL="},
      "INK_PURGECNT_MPP_AUTO_CL=" => {merge: true, label: "MPP (CL) : ", sublabel: "INK_PURGECNT_MPP_MANU_CL="},
      "INK_PURGECNT_REP_AUTO_CL=" => {merge: true, label: "REP (CL) : ", sublabel: "INK_PURGECNT_REP_MANU_CL="},
      "INK_PURGE_TIMES_EIP_AUTO_BLACK=" => {merge: true, label: "eIP (BK) : ", sublabel: "INK_PURGE_TIMES_EIP_MANU_BLACK="},
      "INK_PURGE_TIMES_UIP_AUTO_BLACK=" => {merge: true, label: "UIP (BK) : ", sublabel: "INK_PURGE_TIMES_UIP_MANU_BLACK="},
      "INK_PURGE_TIMES_RP_AUTO_BLACK=" => {merge: true, label: "RP (BK) : ", sublabel: "INK_PURGE_TIMES_RP_MANU_BLACK="},
      "INK_PURGE_TIMES_SRP_AUTO_BLACK=" => {merge: true, label: "SRP (BK) : ", sublabel: "INK_PURGE_TIMES_SRP_MANU_BLACK="},
      "INK_PURGE_TIMES_SP_AUTO_BLACK=" => {merge: true, label: "SP (BK) : ", sublabel: "INK_PURGE_TIMES_SP_MANU_BLACK="},
      "INK_PURGE_TIMES_RP2_AUTO_BLACK=" => {merge: true, label: "RP2 (BK) : ", sublabel: "INK_PURGE_TIMES_RP2_MANU_BLACK="},
      "INK_PURGE_TIMES_CP_AUTO_BLACK=" => {merge: true, label: "CP (BK) : ", sublabel: "INK_PURGE_TIMES_CP_MANU_BLACK="},
      "INK_PURGE_TIMES_NP_AUTO_BLACK=" => {merge: true, label: "NP (BK) : ", sublabel: "INK_PURGE_TIMES_NP_MANU_BLACK="},
      "INK_PURGE_TIMES_RP3_AUTO_BLACK=" => {merge: true, label: "RP3 (BK) : ", sublabel: "INK_PURGE_TIMES_RP3_MANU_BLACK="},
      "INK_PURGE_TIMES_PP_AUTO_BLACK=" => {merge: true, label: "PP (BK) : ", sublabel: "INK_PURGE_TIMES_PP_MANU_BLACK="},
      "INK_PURGE_TIMES_QPP_AUTO_BLACK=" => {merge: true, label: "QPP (BK) : ", sublabel: "INK_PURGE_TIMES_QPP_MANU_BLACK="},
      "INK_PURGE_TIMES_MPP_AUTO_BLACK=" => {merge: true, label: "MPP (BK) : ", sublabel: "INK_PURGE_TIMES_MPP_MANU_BLACK="},
      "INK_PURGE_TIMES_REP_AUTO_BLACK=" => {merge: true, label: "REP (BK) : ", sublabel: "INK_PURGE_TIMES_REP_MANU_BLACK="},
      "INK_PURGE_TIMES_EIP_AUTO_COLOR=" => {merge: true, label: "eIP (CL) : ", sublabel: "INK_PURGE_TIMES_EIP_MANU_COLOR="},
      "INK_PURGE_TIMES_UIP_AUTO_COLOR=" => {merge: true, label: "UIP (CL) : ", sublabel: "INK_PURGE_TIMES_UIP_MANU_COLOR="},
      "INK_PURGE_TIMES_RP_AUTO_COLOR=" => {merge: true, label: "RP (CL) : ", sublabel: "INK_PURGE_TIMES_RP_MANU_COLOR="},
      "INK_PURGE_TIMES_SRP_AUTO_COLOR=" => {merge: true, label: "SRP (CL) : ", sublabel: "INK_PURGE_TIMES_SRP_MANU_COLOR="},
      "INK_PURGE_TIMES_SP_AUTO_COLOR=" => {merge: true, label: "SP (CL) : ", sublabel: "INK_PURGE_TIMES_SP_MANU_COLOR="},
      "INK_PURGE_TIMES_RP2_AUTO_COLOR=" => {merge: true, label: "RP2 (CL) : ", sublabel: "INK_PURGE_TIMES_RP2_MANU_COLOR="},
      "INK_PURGE_TIMES_CP_AUTO_COLOR=" => {merge: true, label: "CP (CL) : ", sublabel: "INK_PURGE_TIMES_CP_MANU_COLOR="},
      "INK_PURGE_TIMES_NP_AUTO_COLOR=" => {merge: true, label: "NP (CL) : ", sublabel: "INK_PURGE_TIMES_NP_MANU_COLOR="},
      "INK_PURGE_TIMES_RP3_AUTO_COLOR=" => {merge: true, label: "RP3 (CL) : ", sublabel: "INK_PURGE_TIMES_RP3_MANU_COLOR="},
      "INK_PURGE_TIMES_PP_AUTO_COLOR=" => {merge: true, label: "PP (CL) : ", sublabel: "INK_PURGE_TIMES_PP_MANU_COLOR="},
      "INK_PURGE_TIMES_QPP_AUTO_COLOR=" => {merge: true, label: "QPP (CL) : ", sublabel: "INK_PURGE_TIMES_QPP_MANU_COLOR="},
      "INK_PURGE_TIMES_MPP_AUTO_COLOR=" => {merge: true, label: "MPP (CL) : ", sublabel: "INK_PURGE_TIMES_MPP_MANU_COLOR="},
      "INK_PURGE_TIMES_REP_AUTO_COLOR=" => {merge: true, label: "REP (CL) : ", sublabel: "INK_PURGE_TIMES_REP_MANU_COLOR="},
      "INK_PURGECNT_TFL_AUTO=" => {merge: false, label: "tFL : "},
      "INK_PURGE_TIMES_TFL_AUTO=" => {merge: false, label: "tFL : "}
    }
  }

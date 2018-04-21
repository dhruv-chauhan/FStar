open Prims
let (tacdbg : Prims.bool FStar_ST.ref) = FStar_Util.mk_ref false 
let mk_tactic_interpretation_0 :
  'r .
    Prims.bool ->
      'r FStar_Tactics_Basic.tac ->
        'r FStar_Syntax_Embeddings.embedding ->
          FStar_Ident.lid ->
            FStar_TypeChecker_Normalize.psc ->
              FStar_Syntax_Syntax.args ->
                FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun reflect  ->
    fun t  ->
      fun er  ->
        fun nm  ->
          fun psc  ->
            fun args  ->
              match args with
              | (embedded_state,uu____70)::[] ->
                  let uu____87 =
                    FStar_Syntax_Embeddings.unembed
                      FStar_Tactics_Embedding.e_proofstate embedded_state
                     in
                  FStar_Util.bind_opt uu____87
                    (fun ps  ->
                       let ps1 = FStar_Tactics_Types.set_ps_psc psc ps  in
                       FStar_Tactics_Basic.log ps1
                         (fun uu____100  ->
                            let uu____101 = FStar_Ident.string_of_lid nm  in
                            let uu____102 =
                              FStar_Syntax_Print.args_to_string args  in
                            FStar_Util.print2 "Reached %s, args are: %s\n"
                              uu____101 uu____102);
                       (let res =
                          let uu____104 = FStar_Tactics_Embedding.e_result er
                             in
                          let uu____109 =
                            FStar_TypeChecker_Normalize.psc_range psc  in
                          let uu____110 = FStar_Tactics_Basic.run t ps1  in
                          FStar_Syntax_Embeddings.embed uu____104 uu____109
                            uu____110
                           in
                        FStar_Pervasives_Native.Some res))
              | uu____115 ->
                  failwith "Unexpected application of tactic primitive"
  
let mk_tactic_interpretation_1 :
  'a 'r .
    Prims.bool ->
      ('a -> 'r FStar_Tactics_Basic.tac) ->
        'a FStar_Syntax_Embeddings.embedding ->
          'r FStar_Syntax_Embeddings.embedding ->
            FStar_Ident.lid ->
              FStar_TypeChecker_Normalize.psc ->
                FStar_Syntax_Syntax.args ->
                  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun reflect  ->
    fun t  ->
      fun ea  ->
        fun er  ->
          fun nm  ->
            fun psc  ->
              fun args  ->
                match args with
                | (a,uu____193)::(embedded_state,uu____195)::[] ->
                    let uu____222 =
                      FStar_Syntax_Embeddings.unembed
                        FStar_Tactics_Embedding.e_proofstate embedded_state
                       in
                    FStar_Util.bind_opt uu____222
                      (fun ps  ->
                         let ps1 = FStar_Tactics_Types.set_ps_psc psc ps  in
                         FStar_Tactics_Basic.log ps1
                           (fun uu____235  ->
                              let uu____236 = FStar_Ident.string_of_lid nm
                                 in
                              let uu____237 =
                                FStar_Syntax_Print.term_to_string
                                  embedded_state
                                 in
                              FStar_Util.print2 "Reached %s, goals are: %s\n"
                                uu____236 uu____237);
                         (let uu____238 =
                            FStar_Syntax_Embeddings.unembed ea a  in
                          FStar_Util.bind_opt uu____238
                            (fun a1  ->
                               let res =
                                 let uu____248 = t a1  in
                                 FStar_Tactics_Basic.run uu____248 ps1  in
                               let uu____251 =
                                 let uu____252 =
                                   FStar_Tactics_Embedding.e_result er  in
                                 let uu____257 =
                                   FStar_TypeChecker_Normalize.psc_range psc
                                    in
                                 FStar_Syntax_Embeddings.embed uu____252
                                   uu____257 res
                                  in
                               FStar_Pervasives_Native.Some uu____251)))
                | uu____260 ->
                    let uu____261 =
                      let uu____262 = FStar_Ident.string_of_lid nm  in
                      let uu____263 = FStar_Syntax_Print.args_to_string args
                         in
                      FStar_Util.format2
                        "Unexpected application of tactic primitive %s %s"
                        uu____262 uu____263
                       in
                    failwith uu____261
  
let mk_tactic_interpretation_1_env :
  'a 'r .
    Prims.bool ->
      (FStar_TypeChecker_Normalize.psc -> 'a -> 'r FStar_Tactics_Basic.tac)
        ->
        'a FStar_Syntax_Embeddings.embedding ->
          'r FStar_Syntax_Embeddings.embedding ->
            FStar_Ident.lid ->
              FStar_TypeChecker_Normalize.psc ->
                FStar_Syntax_Syntax.args ->
                  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun reflect  ->
    fun t  ->
      fun ea  ->
        fun er  ->
          fun nm  ->
            fun psc  ->
              fun args  ->
                match args with
                | (a,uu____346)::(embedded_state,uu____348)::[] ->
                    let uu____375 =
                      FStar_Syntax_Embeddings.unembed
                        FStar_Tactics_Embedding.e_proofstate embedded_state
                       in
                    FStar_Util.bind_opt uu____375
                      (fun ps  ->
                         let ps1 = FStar_Tactics_Types.set_ps_psc psc ps  in
                         FStar_Tactics_Basic.log ps1
                           (fun uu____388  ->
                              let uu____389 = FStar_Ident.string_of_lid nm
                                 in
                              let uu____390 =
                                FStar_Syntax_Print.term_to_string
                                  embedded_state
                                 in
                              FStar_Util.print2 "Reached %s, goals are: %s\n"
                                uu____389 uu____390);
                         (let uu____391 =
                            FStar_Syntax_Embeddings.unembed ea a  in
                          FStar_Util.bind_opt uu____391
                            (fun a1  ->
                               let res =
                                 let uu____401 = t psc a1  in
                                 FStar_Tactics_Basic.run uu____401 ps1  in
                               let uu____404 =
                                 let uu____405 =
                                   FStar_Tactics_Embedding.e_result er  in
                                 let uu____410 =
                                   FStar_TypeChecker_Normalize.psc_range psc
                                    in
                                 FStar_Syntax_Embeddings.embed uu____405
                                   uu____410 res
                                  in
                               FStar_Pervasives_Native.Some uu____404)))
                | uu____413 ->
                    let uu____414 =
                      let uu____415 = FStar_Ident.string_of_lid nm  in
                      let uu____416 = FStar_Syntax_Print.args_to_string args
                         in
                      FStar_Util.format2
                        "Unexpected application of tactic primitive %s %s"
                        uu____415 uu____416
                       in
                    failwith uu____414
  
let mk_tactic_interpretation_2 :
  'a 'b 'r .
    Prims.bool ->
      ('a -> 'b -> 'r FStar_Tactics_Basic.tac) ->
        'a FStar_Syntax_Embeddings.embedding ->
          'b FStar_Syntax_Embeddings.embedding ->
            'r FStar_Syntax_Embeddings.embedding ->
              FStar_Ident.lid ->
                FStar_TypeChecker_Normalize.psc ->
                  FStar_Syntax_Syntax.args ->
                    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun reflect  ->
    fun t  ->
      fun ea  ->
        fun eb  ->
          fun er  ->
            fun nm  ->
              fun psc  ->
                fun args  ->
                  match args with
                  | (a,uu____513)::(b,uu____515)::(embedded_state,uu____517)::[]
                      ->
                      let uu____554 =
                        FStar_Syntax_Embeddings.unembed
                          FStar_Tactics_Embedding.e_proofstate embedded_state
                         in
                      FStar_Util.bind_opt uu____554
                        (fun ps  ->
                           let ps1 = FStar_Tactics_Types.set_ps_psc psc ps
                              in
                           FStar_Tactics_Basic.log ps1
                             (fun uu____567  ->
                                let uu____568 = FStar_Ident.string_of_lid nm
                                   in
                                let uu____569 =
                                  FStar_Syntax_Print.term_to_string
                                    embedded_state
                                   in
                                FStar_Util.print2
                                  "Reached %s, goals are: %s\n" uu____568
                                  uu____569);
                           (let uu____570 =
                              FStar_Syntax_Embeddings.unembed ea a  in
                            FStar_Util.bind_opt uu____570
                              (fun a1  ->
                                 let uu____576 =
                                   FStar_Syntax_Embeddings.unembed eb b  in
                                 FStar_Util.bind_opt uu____576
                                   (fun b1  ->
                                      let res =
                                        let uu____586 = t a1 b1  in
                                        FStar_Tactics_Basic.run uu____586 ps1
                                         in
                                      let uu____589 =
                                        let uu____590 =
                                          FStar_Tactics_Embedding.e_result er
                                           in
                                        let uu____595 =
                                          FStar_TypeChecker_Normalize.psc_range
                                            psc
                                           in
                                        FStar_Syntax_Embeddings.embed
                                          uu____590 uu____595 res
                                         in
                                      FStar_Pervasives_Native.Some uu____589))))
                  | uu____598 ->
                      let uu____599 =
                        let uu____600 = FStar_Ident.string_of_lid nm  in
                        let uu____601 =
                          FStar_Syntax_Print.args_to_string args  in
                        FStar_Util.format2
                          "Unexpected application of tactic primitive %s %s"
                          uu____600 uu____601
                         in
                      failwith uu____599
  
let mk_tactic_interpretation_3 :
  'a 'b 'c 'r .
    Prims.bool ->
      ('a -> 'b -> 'c -> 'r FStar_Tactics_Basic.tac) ->
        'a FStar_Syntax_Embeddings.embedding ->
          'b FStar_Syntax_Embeddings.embedding ->
            'c FStar_Syntax_Embeddings.embedding ->
              'r FStar_Syntax_Embeddings.embedding ->
                FStar_Ident.lid ->
                  FStar_TypeChecker_Normalize.psc ->
                    FStar_Syntax_Syntax.args ->
                      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun reflect  ->
    fun t  ->
      fun ea  ->
        fun eb  ->
          fun ec  ->
            fun er  ->
              fun nm  ->
                fun psc  ->
                  fun args  ->
                    match args with
                    | (a,uu____717)::(b,uu____719)::(c,uu____721)::(embedded_state,uu____723)::[]
                        ->
                        let uu____770 =
                          FStar_Syntax_Embeddings.unembed
                            FStar_Tactics_Embedding.e_proofstate
                            embedded_state
                           in
                        FStar_Util.bind_opt uu____770
                          (fun ps  ->
                             let ps1 = FStar_Tactics_Types.set_ps_psc psc ps
                                in
                             FStar_Tactics_Basic.log ps1
                               (fun uu____783  ->
                                  let uu____784 =
                                    FStar_Ident.string_of_lid nm  in
                                  let uu____785 =
                                    FStar_Syntax_Print.term_to_string
                                      embedded_state
                                     in
                                  FStar_Util.print2
                                    "Reached %s, goals are: %s\n" uu____784
                                    uu____785);
                             (let uu____786 =
                                FStar_Syntax_Embeddings.unembed ea a  in
                              FStar_Util.bind_opt uu____786
                                (fun a1  ->
                                   let uu____792 =
                                     FStar_Syntax_Embeddings.unembed eb b  in
                                   FStar_Util.bind_opt uu____792
                                     (fun b1  ->
                                        let uu____798 =
                                          FStar_Syntax_Embeddings.unembed ec
                                            c
                                           in
                                        FStar_Util.bind_opt uu____798
                                          (fun c1  ->
                                             let res =
                                               let uu____808 = t a1 b1 c1  in
                                               FStar_Tactics_Basic.run
                                                 uu____808 ps1
                                                in
                                             let uu____811 =
                                               let uu____812 =
                                                 FStar_Tactics_Embedding.e_result
                                                   er
                                                  in
                                               let uu____817 =
                                                 FStar_TypeChecker_Normalize.psc_range
                                                   psc
                                                  in
                                               FStar_Syntax_Embeddings.embed
                                                 uu____812 uu____817 res
                                                in
                                             FStar_Pervasives_Native.Some
                                               uu____811)))))
                    | uu____820 ->
                        let uu____821 =
                          let uu____822 = FStar_Ident.string_of_lid nm  in
                          let uu____823 =
                            FStar_Syntax_Print.args_to_string args  in
                          FStar_Util.format2
                            "Unexpected application of tactic primitive %s %s"
                            uu____822 uu____823
                           in
                        failwith uu____821
  
let mk_tactic_interpretation_4 :
  'a 'b 'c 'd 'r .
    Prims.bool ->
      ('a -> 'b -> 'c -> 'd -> 'r FStar_Tactics_Basic.tac) ->
        'a FStar_Syntax_Embeddings.embedding ->
          'b FStar_Syntax_Embeddings.embedding ->
            'c FStar_Syntax_Embeddings.embedding ->
              'd FStar_Syntax_Embeddings.embedding ->
                'r FStar_Syntax_Embeddings.embedding ->
                  FStar_Ident.lid ->
                    FStar_TypeChecker_Normalize.psc ->
                      FStar_Syntax_Syntax.args ->
                        FStar_Syntax_Syntax.term
                          FStar_Pervasives_Native.option
  =
  fun reflect  ->
    fun t  ->
      fun ea  ->
        fun eb  ->
          fun ec  ->
            fun ed  ->
              fun er  ->
                fun nm  ->
                  fun psc  ->
                    fun args  ->
                      match args with
                      | (a,uu____958)::(b,uu____960)::(c,uu____962)::
                          (d,uu____964)::(embedded_state,uu____966)::[] ->
                          let uu____1023 =
                            FStar_Syntax_Embeddings.unembed
                              FStar_Tactics_Embedding.e_proofstate
                              embedded_state
                             in
                          FStar_Util.bind_opt uu____1023
                            (fun ps  ->
                               let ps1 =
                                 FStar_Tactics_Types.set_ps_psc psc ps  in
                               FStar_Tactics_Basic.log ps1
                                 (fun uu____1036  ->
                                    let uu____1037 =
                                      FStar_Ident.string_of_lid nm  in
                                    let uu____1038 =
                                      FStar_Syntax_Print.term_to_string
                                        embedded_state
                                       in
                                    FStar_Util.print2
                                      "Reached %s, goals are: %s\n"
                                      uu____1037 uu____1038);
                               (let uu____1039 =
                                  FStar_Syntax_Embeddings.unembed ea a  in
                                FStar_Util.bind_opt uu____1039
                                  (fun a1  ->
                                     let uu____1045 =
                                       FStar_Syntax_Embeddings.unembed eb b
                                        in
                                     FStar_Util.bind_opt uu____1045
                                       (fun b1  ->
                                          let uu____1051 =
                                            FStar_Syntax_Embeddings.unembed
                                              ec c
                                             in
                                          FStar_Util.bind_opt uu____1051
                                            (fun c1  ->
                                               let uu____1057 =
                                                 FStar_Syntax_Embeddings.unembed
                                                   ed d
                                                  in
                                               FStar_Util.bind_opt uu____1057
                                                 (fun d1  ->
                                                    let res =
                                                      let uu____1067 =
                                                        t a1 b1 c1 d1  in
                                                      FStar_Tactics_Basic.run
                                                        uu____1067 ps1
                                                       in
                                                    let uu____1070 =
                                                      let uu____1071 =
                                                        FStar_Tactics_Embedding.e_result
                                                          er
                                                         in
                                                      let uu____1076 =
                                                        FStar_TypeChecker_Normalize.psc_range
                                                          psc
                                                         in
                                                      FStar_Syntax_Embeddings.embed
                                                        uu____1071 uu____1076
                                                        res
                                                       in
                                                    FStar_Pervasives_Native.Some
                                                      uu____1070))))))
                      | uu____1079 ->
                          let uu____1080 =
                            let uu____1081 = FStar_Ident.string_of_lid nm  in
                            let uu____1082 =
                              FStar_Syntax_Print.args_to_string args  in
                            FStar_Util.format2
                              "Unexpected application of tactic primitive %s %s"
                              uu____1081 uu____1082
                             in
                          failwith uu____1080
  
let mk_tactic_interpretation_5 :
  'a 'b 'c 'd 'e 'r .
    Prims.bool ->
      ('a -> 'b -> 'c -> 'd -> 'e -> 'r FStar_Tactics_Basic.tac) ->
        'a FStar_Syntax_Embeddings.embedding ->
          'b FStar_Syntax_Embeddings.embedding ->
            'c FStar_Syntax_Embeddings.embedding ->
              'd FStar_Syntax_Embeddings.embedding ->
                'e FStar_Syntax_Embeddings.embedding ->
                  'r FStar_Syntax_Embeddings.embedding ->
                    FStar_Ident.lid ->
                      FStar_TypeChecker_Normalize.psc ->
                        FStar_Syntax_Syntax.args ->
                          FStar_Syntax_Syntax.term
                            FStar_Pervasives_Native.option
  =
  fun reflect  ->
    fun t  ->
      fun ea  ->
        fun eb  ->
          fun ec  ->
            fun ed  ->
              fun ee  ->
                fun er  ->
                  fun nm  ->
                    fun psc  ->
                      fun args  ->
                        match args with
                        | (a,uu____1236)::(b,uu____1238)::(c,uu____1240)::
                            (d,uu____1242)::(e,uu____1244)::(embedded_state,uu____1246)::[]
                            ->
                            let uu____1313 =
                              FStar_Syntax_Embeddings.unembed
                                FStar_Tactics_Embedding.e_proofstate
                                embedded_state
                               in
                            FStar_Util.bind_opt uu____1313
                              (fun ps  ->
                                 let ps1 =
                                   FStar_Tactics_Types.set_ps_psc psc ps  in
                                 FStar_Tactics_Basic.log ps1
                                   (fun uu____1326  ->
                                      let uu____1327 =
                                        FStar_Ident.string_of_lid nm  in
                                      let uu____1328 =
                                        FStar_Syntax_Print.term_to_string
                                          embedded_state
                                         in
                                      FStar_Util.print2
                                        "Reached %s, goals are: %s\n"
                                        uu____1327 uu____1328);
                                 (let uu____1329 =
                                    FStar_Syntax_Embeddings.unembed ea a  in
                                  FStar_Util.bind_opt uu____1329
                                    (fun a1  ->
                                       let uu____1335 =
                                         FStar_Syntax_Embeddings.unembed eb b
                                          in
                                       FStar_Util.bind_opt uu____1335
                                         (fun b1  ->
                                            let uu____1341 =
                                              FStar_Syntax_Embeddings.unembed
                                                ec c
                                               in
                                            FStar_Util.bind_opt uu____1341
                                              (fun c1  ->
                                                 let uu____1347 =
                                                   FStar_Syntax_Embeddings.unembed
                                                     ed d
                                                    in
                                                 FStar_Util.bind_opt
                                                   uu____1347
                                                   (fun d1  ->
                                                      let uu____1353 =
                                                        FStar_Syntax_Embeddings.unembed
                                                          ee e
                                                         in
                                                      FStar_Util.bind_opt
                                                        uu____1353
                                                        (fun e1  ->
                                                           let res =
                                                             let uu____1363 =
                                                               t a1 b1 c1 d1
                                                                 e1
                                                                in
                                                             FStar_Tactics_Basic.run
                                                               uu____1363 ps1
                                                              in
                                                           let uu____1366 =
                                                             let uu____1367 =
                                                               FStar_Tactics_Embedding.e_result
                                                                 er
                                                                in
                                                             let uu____1372 =
                                                               FStar_TypeChecker_Normalize.psc_range
                                                                 psc
                                                                in
                                                             FStar_Syntax_Embeddings.embed
                                                               uu____1367
                                                               uu____1372 res
                                                              in
                                                           FStar_Pervasives_Native.Some
                                                             uu____1366)))))))
                        | uu____1375 ->
                            let uu____1376 =
                              let uu____1377 = FStar_Ident.string_of_lid nm
                                 in
                              let uu____1378 =
                                FStar_Syntax_Print.args_to_string args  in
                              FStar_Util.format2
                                "Unexpected application of tactic primitive %s %s"
                                uu____1377 uu____1378
                               in
                            failwith uu____1376
  
let mk_tactic_interpretation_6 :
  'a 'b 'c 'd 'e 'f 'r .
    Prims.bool ->
      ('a -> 'b -> 'c -> 'd -> 'e -> 'f -> 'r FStar_Tactics_Basic.tac) ->
        'a FStar_Syntax_Embeddings.embedding ->
          'b FStar_Syntax_Embeddings.embedding ->
            'c FStar_Syntax_Embeddings.embedding ->
              'd FStar_Syntax_Embeddings.embedding ->
                'e FStar_Syntax_Embeddings.embedding ->
                  'f FStar_Syntax_Embeddings.embedding ->
                    'r FStar_Syntax_Embeddings.embedding ->
                      FStar_Ident.lid ->
                        FStar_TypeChecker_Normalize.psc ->
                          FStar_Syntax_Syntax.args ->
                            FStar_Syntax_Syntax.term
                              FStar_Pervasives_Native.option
  =
  fun reflect  ->
    fun t  ->
      fun ea  ->
        fun eb  ->
          fun ec  ->
            fun ed  ->
              fun ee  ->
                fun ef  ->
                  fun er  ->
                    fun nm  ->
                      fun psc  ->
                        fun args  ->
                          match args with
                          | (a,uu____1551)::(b,uu____1553)::(c,uu____1555)::
                              (d,uu____1557)::(e,uu____1559)::(f,uu____1561)::
                              (embedded_state,uu____1563)::[] ->
                              let uu____1640 =
                                FStar_Syntax_Embeddings.unembed
                                  FStar_Tactics_Embedding.e_proofstate
                                  embedded_state
                                 in
                              FStar_Util.bind_opt uu____1640
                                (fun ps  ->
                                   let ps1 =
                                     FStar_Tactics_Types.set_ps_psc psc ps
                                      in
                                   FStar_Tactics_Basic.log ps1
                                     (fun uu____1653  ->
                                        let uu____1654 =
                                          FStar_Ident.string_of_lid nm  in
                                        let uu____1655 =
                                          FStar_Syntax_Print.term_to_string
                                            embedded_state
                                           in
                                        FStar_Util.print2
                                          "Reached %s, goals are: %s\n"
                                          uu____1654 uu____1655);
                                   (let uu____1656 =
                                      FStar_Syntax_Embeddings.unembed ea a
                                       in
                                    FStar_Util.bind_opt uu____1656
                                      (fun a1  ->
                                         let uu____1662 =
                                           FStar_Syntax_Embeddings.unembed eb
                                             b
                                            in
                                         FStar_Util.bind_opt uu____1662
                                           (fun b1  ->
                                              let uu____1668 =
                                                FStar_Syntax_Embeddings.unembed
                                                  ec c
                                                 in
                                              FStar_Util.bind_opt uu____1668
                                                (fun c1  ->
                                                   let uu____1674 =
                                                     FStar_Syntax_Embeddings.unembed
                                                       ed d
                                                      in
                                                   FStar_Util.bind_opt
                                                     uu____1674
                                                     (fun d1  ->
                                                        let uu____1680 =
                                                          FStar_Syntax_Embeddings.unembed
                                                            ee e
                                                           in
                                                        FStar_Util.bind_opt
                                                          uu____1680
                                                          (fun e1  ->
                                                             let uu____1686 =
                                                               FStar_Syntax_Embeddings.unembed
                                                                 ef f
                                                                in
                                                             FStar_Util.bind_opt
                                                               uu____1686
                                                               (fun f1  ->
                                                                  let res =
                                                                    let uu____1696
                                                                    =
                                                                    t a1 b1
                                                                    c1 d1 e1
                                                                    f1  in
                                                                    FStar_Tactics_Basic.run
                                                                    uu____1696
                                                                    ps1  in
                                                                  let uu____1699
                                                                    =
                                                                    let uu____1700
                                                                    =
                                                                    FStar_Tactics_Embedding.e_result
                                                                    er  in
                                                                    let uu____1705
                                                                    =
                                                                    FStar_TypeChecker_Normalize.psc_range
                                                                    psc  in
                                                                    FStar_Syntax_Embeddings.embed
                                                                    uu____1700
                                                                    uu____1705
                                                                    res  in
                                                                  FStar_Pervasives_Native.Some
                                                                    uu____1699))))))))
                          | uu____1708 ->
                              let uu____1709 =
                                let uu____1710 = FStar_Ident.string_of_lid nm
                                   in
                                let uu____1711 =
                                  FStar_Syntax_Print.args_to_string args  in
                                FStar_Util.format2
                                  "Unexpected application of tactic primitive %s %s"
                                  uu____1710 uu____1711
                                 in
                              failwith uu____1709
  
let (step_from_native_step :
  FStar_Tactics_Native.native_primitive_step ->
    FStar_TypeChecker_Normalize.primitive_step)
  =
  fun s  ->
    {
      FStar_TypeChecker_Normalize.name = (s.FStar_Tactics_Native.name);
      FStar_TypeChecker_Normalize.arity = (s.FStar_Tactics_Native.arity);
      FStar_TypeChecker_Normalize.auto_reflect =
        (FStar_Pervasives_Native.Some
           (s.FStar_Tactics_Native.arity - (Prims.parse_int "1")));
      FStar_TypeChecker_Normalize.strong_reduction_ok =
        (s.FStar_Tactics_Native.strong_reduction_ok);
      FStar_TypeChecker_Normalize.requires_binder_substitution = false;
      FStar_TypeChecker_Normalize.interpretation =
        (fun psc  -> fun args  -> s.FStar_Tactics_Native.tactic psc args)
    }
  
let rec e_tactic_0' :
  'r .
    'r FStar_Syntax_Embeddings.embedding ->
      'r FStar_Tactics_Basic.tac FStar_Syntax_Embeddings.embedding
  =
  fun er  ->
    FStar_Syntax_Embeddings.mk_emb
      (fun uu____1855  ->
         fun uu____1856  -> failwith "Impossible: embedding tactic (0)?")
      (fun w  ->
         fun t  ->
           let uu____1864 = unembed_tactic_0 er t  in
           FStar_All.pipe_left
             (fun _0_17  -> FStar_Pervasives_Native.Some _0_17) uu____1864)
      FStar_Syntax_Syntax.t_unit

and e_tactic_1 :
  'a 'r .
    'a FStar_Syntax_Embeddings.embedding ->
      'r FStar_Syntax_Embeddings.embedding ->
        ('a -> 'r FStar_Tactics_Basic.tac) FStar_Syntax_Embeddings.embedding
  =
  fun ea  ->
    fun er  ->
      FStar_Syntax_Embeddings.mk_emb
        (fun uu____1888  ->
           fun uu____1889  -> failwith "Impossible: embedding tactic (1)?")
        (fun w  -> fun t  -> unembed_tactic_1 ea er t)
        FStar_Syntax_Syntax.t_unit

and (primitive_steps :
  unit -> FStar_TypeChecker_Normalize.primitive_step Prims.list) =
  fun uu____1898  ->
    let mk1 nm arity interpretation =
      let nm1 = FStar_Tactics_Embedding.fstar_tactics_lid' ["Builtins"; nm]
         in
      {
        FStar_TypeChecker_Normalize.name = nm1;
        FStar_TypeChecker_Normalize.arity = arity;
        FStar_TypeChecker_Normalize.auto_reflect =
          (FStar_Pervasives_Native.Some (arity - (Prims.parse_int "1")));
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = true;
        FStar_TypeChecker_Normalize.interpretation =
          (fun psc  -> fun args  -> interpretation nm1 psc args)
      }  in
    let native_tactics = FStar_Tactics_Native.list_all ()  in
    let native_tactics_steps =
      FStar_List.map step_from_native_step native_tactics  in
    let mktac1 name f ea er =
      mk1 name (Prims.parse_int "2")
        (mk_tactic_interpretation_1 false f ea er)
       in
    let mktac2 name f ea eb er =
      mk1 name (Prims.parse_int "3")
        (mk_tactic_interpretation_2 false f ea eb er)
       in
    let mktac3 name f ea eb ec er =
      mk1 name (Prims.parse_int "4")
        (mk_tactic_interpretation_3 false f ea eb ec er)
       in
    let mktac5 name f ea eb ec ed ee er =
      mk1 name (Prims.parse_int "6")
        (mk_tactic_interpretation_5 false f ea eb ec ed ee er)
       in
    let decr_depth_interp psc args =
      match args with
      | (ps,uu____2304)::[] ->
          let uu____2321 =
            FStar_Syntax_Embeddings.unembed
              FStar_Tactics_Embedding.e_proofstate ps
             in
          FStar_Util.bind_opt uu____2321
            (fun ps1  ->
               let ps2 = FStar_Tactics_Types.set_ps_psc psc ps1  in
               let uu____2329 =
                 let uu____2330 = FStar_TypeChecker_Normalize.psc_range psc
                    in
                 let uu____2331 = FStar_Tactics_Types.decr_depth ps2  in
                 FStar_Syntax_Embeddings.embed
                   FStar_Tactics_Embedding.e_proofstate uu____2330 uu____2331
                  in
               FStar_Pervasives_Native.Some uu____2329)
      | uu____2332 -> failwith "Unexpected application of decr_depth"  in
    let decr_depth_step =
      let uu____2336 =
        FStar_Ident.lid_of_str "FStar.Tactics.Types.decr_depth"  in
      {
        FStar_TypeChecker_Normalize.name = uu____2336;
        FStar_TypeChecker_Normalize.arity = (Prims.parse_int "1");
        FStar_TypeChecker_Normalize.auto_reflect =
          FStar_Pervasives_Native.None;
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = false;
        FStar_TypeChecker_Normalize.interpretation = decr_depth_interp
      }  in
    let incr_depth_interp psc args =
      match args with
      | (ps,uu____2353)::[] ->
          let uu____2370 =
            FStar_Syntax_Embeddings.unembed
              FStar_Tactics_Embedding.e_proofstate ps
             in
          FStar_Util.bind_opt uu____2370
            (fun ps1  ->
               let ps2 = FStar_Tactics_Types.set_ps_psc psc ps1  in
               let uu____2378 =
                 let uu____2379 = FStar_TypeChecker_Normalize.psc_range psc
                    in
                 let uu____2380 = FStar_Tactics_Types.incr_depth ps2  in
                 FStar_Syntax_Embeddings.embed
                   FStar_Tactics_Embedding.e_proofstate uu____2379 uu____2380
                  in
               FStar_Pervasives_Native.Some uu____2378)
      | uu____2381 -> failwith "Unexpected application of incr_depth"  in
    let incr_depth_step =
      let uu____2385 =
        FStar_Ident.lid_of_str "FStar.Tactics.Types.incr_depth"  in
      {
        FStar_TypeChecker_Normalize.name = uu____2385;
        FStar_TypeChecker_Normalize.arity = (Prims.parse_int "1");
        FStar_TypeChecker_Normalize.auto_reflect =
          FStar_Pervasives_Native.None;
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = false;
        FStar_TypeChecker_Normalize.interpretation = incr_depth_interp
      }  in
    let tracepoint_interp psc args =
      match args with
      | (ps,uu____2402)::[] ->
          let uu____2419 =
            FStar_Syntax_Embeddings.unembed
              FStar_Tactics_Embedding.e_proofstate ps
             in
          FStar_Util.bind_opt uu____2419
            (fun ps1  ->
               let ps2 = FStar_Tactics_Types.set_ps_psc psc ps1  in
               FStar_Tactics_Types.tracepoint ps2;
               FStar_Pervasives_Native.Some FStar_Syntax_Util.exp_unit)
      | uu____2428 -> failwith "Unexpected application of tracepoint"  in
    let set_proofstate_range_interp psc args =
      match args with
      | (ps,uu____2447)::(r,uu____2449)::[] ->
          let uu____2476 =
            FStar_Syntax_Embeddings.unembed
              FStar_Tactics_Embedding.e_proofstate ps
             in
          FStar_Util.bind_opt uu____2476
            (fun ps1  ->
               let uu____2482 =
                 FStar_Syntax_Embeddings.unembed
                   FStar_Syntax_Embeddings.e_range r
                  in
               FStar_Util.bind_opt uu____2482
                 (fun r1  ->
                    let ps' = FStar_Tactics_Types.set_proofstate_range ps1 r1
                       in
                    let uu____2490 =
                      let uu____2491 =
                        FStar_TypeChecker_Normalize.psc_range psc  in
                      FStar_Syntax_Embeddings.embed
                        FStar_Tactics_Embedding.e_proofstate uu____2491 ps'
                       in
                    FStar_Pervasives_Native.Some uu____2490))
      | uu____2492 ->
          failwith "Unexpected application of set_proofstate_range"
       in
    let push_binder_interp psc args =
      match args with
      | (env_t,uu____2511)::(b,uu____2513)::[] ->
          let uu____2540 =
            FStar_Syntax_Embeddings.unembed FStar_Reflection_Embeddings.e_env
              env_t
             in
          FStar_Util.bind_opt uu____2540
            (fun env  ->
               let uu____2546 =
                 FStar_Syntax_Embeddings.unembed
                   FStar_Reflection_Embeddings.e_binder b
                  in
               FStar_Util.bind_opt uu____2546
                 (fun b1  ->
                    let env1 = FStar_TypeChecker_Env.push_binders env [b1]
                       in
                    let uu____2554 =
                      FStar_Syntax_Embeddings.embed
                        FStar_Reflection_Embeddings.e_env
                        env_t.FStar_Syntax_Syntax.pos env1
                       in
                    FStar_Pervasives_Native.Some uu____2554))
      | uu____2555 -> failwith "Unexpected application of push_binder"  in
    let set_proofstate_range_step =
      let nm =
        FStar_Ident.lid_of_str "FStar.Tactics.Types.set_proofstate_range"  in
      {
        FStar_TypeChecker_Normalize.name = nm;
        FStar_TypeChecker_Normalize.arity = (Prims.parse_int "2");
        FStar_TypeChecker_Normalize.auto_reflect =
          FStar_Pervasives_Native.None;
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = false;
        FStar_TypeChecker_Normalize.interpretation =
          set_proofstate_range_interp
      }  in
    let tracepoint_step =
      let nm = FStar_Ident.lid_of_str "FStar.Tactics.Types.tracepoint"  in
      {
        FStar_TypeChecker_Normalize.name = nm;
        FStar_TypeChecker_Normalize.arity = (Prims.parse_int "1");
        FStar_TypeChecker_Normalize.auto_reflect =
          FStar_Pervasives_Native.None;
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = true;
        FStar_TypeChecker_Normalize.interpretation = tracepoint_interp
      }  in
    let push_binder_step =
      let nm =
        FStar_Tactics_Embedding.fstar_tactics_lid'
          ["Builtins"; "push_binder"]
         in
      {
        FStar_TypeChecker_Normalize.name = nm;
        FStar_TypeChecker_Normalize.arity = (Prims.parse_int "2");
        FStar_TypeChecker_Normalize.auto_reflect =
          FStar_Pervasives_Native.None;
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = true;
        FStar_TypeChecker_Normalize.interpretation = push_binder_interp
      }  in
    let uu____2564 =
      let uu____2567 =
        mktac2 "fail" (fun uu____2569  -> FStar_Tactics_Basic.fail)
          FStar_Syntax_Embeddings.e_any FStar_Syntax_Embeddings.e_string
          FStar_Syntax_Embeddings.e_any
         in
      let uu____2570 =
        let uu____2573 =
          mktac1 "trivial" FStar_Tactics_Basic.trivial
            FStar_Syntax_Embeddings.e_unit FStar_Syntax_Embeddings.e_unit
           in
        let uu____2574 =
          let uu____2577 =
            let uu____2578 = e_tactic_0' FStar_Syntax_Embeddings.e_any  in
            let uu____2583 =
              FStar_Syntax_Embeddings.e_option FStar_Syntax_Embeddings.e_any
               in
            mktac2 "__trytac" (fun uu____2593  -> FStar_Tactics_Basic.trytac)
              FStar_Syntax_Embeddings.e_any uu____2578 uu____2583
             in
          let uu____2594 =
            let uu____2597 =
              mktac1 "intro" FStar_Tactics_Basic.intro
                FStar_Syntax_Embeddings.e_unit
                FStar_Reflection_Embeddings.e_binder
               in
            let uu____2598 =
              let uu____2601 =
                let uu____2602 =
                  FStar_Syntax_Embeddings.e_tuple2
                    FStar_Reflection_Embeddings.e_binder
                    FStar_Reflection_Embeddings.e_binder
                   in
                mktac1 "intro_rec" FStar_Tactics_Basic.intro_rec
                  FStar_Syntax_Embeddings.e_unit uu____2602
                 in
              let uu____2613 =
                let uu____2616 =
                  let uu____2617 =
                    FStar_Syntax_Embeddings.e_list
                      FStar_Syntax_Embeddings.e_norm_step
                     in
                  mktac1 "norm" FStar_Tactics_Basic.norm uu____2617
                    FStar_Syntax_Embeddings.e_unit
                   in
                let uu____2624 =
                  let uu____2627 =
                    let uu____2628 =
                      FStar_Syntax_Embeddings.e_list
                        FStar_Syntax_Embeddings.e_norm_step
                       in
                    mktac3 "norm_term_env" FStar_Tactics_Basic.norm_term_env
                      FStar_Reflection_Embeddings.e_env uu____2628
                      FStar_Reflection_Embeddings.e_term
                      FStar_Reflection_Embeddings.e_term
                     in
                  let uu____2635 =
                    let uu____2638 =
                      let uu____2639 =
                        FStar_Syntax_Embeddings.e_list
                          FStar_Syntax_Embeddings.e_norm_step
                         in
                      mktac2 "norm_binder_type"
                        FStar_Tactics_Basic.norm_binder_type uu____2639
                        FStar_Reflection_Embeddings.e_binder
                        FStar_Syntax_Embeddings.e_unit
                       in
                    let uu____2646 =
                      let uu____2649 =
                        mktac2 "rename_to" FStar_Tactics_Basic.rename_to
                          FStar_Reflection_Embeddings.e_binder
                          FStar_Syntax_Embeddings.e_string
                          FStar_Syntax_Embeddings.e_unit
                         in
                      let uu____2650 =
                        let uu____2653 =
                          mktac1 "binder_retype"
                            FStar_Tactics_Basic.binder_retype
                            FStar_Reflection_Embeddings.e_binder
                            FStar_Syntax_Embeddings.e_unit
                           in
                        let uu____2654 =
                          let uu____2657 =
                            mktac1 "revert" FStar_Tactics_Basic.revert
                              FStar_Syntax_Embeddings.e_unit
                              FStar_Syntax_Embeddings.e_unit
                             in
                          let uu____2658 =
                            let uu____2661 =
                              mktac1 "clear_top"
                                FStar_Tactics_Basic.clear_top
                                FStar_Syntax_Embeddings.e_unit
                                FStar_Syntax_Embeddings.e_unit
                               in
                            let uu____2662 =
                              let uu____2665 =
                                mktac1 "clear" FStar_Tactics_Basic.clear
                                  FStar_Reflection_Embeddings.e_binder
                                  FStar_Syntax_Embeddings.e_unit
                                 in
                              let uu____2666 =
                                let uu____2669 =
                                  mktac1 "rewrite"
                                    FStar_Tactics_Basic.rewrite
                                    FStar_Reflection_Embeddings.e_binder
                                    FStar_Syntax_Embeddings.e_unit
                                   in
                                let uu____2670 =
                                  let uu____2673 =
                                    mktac1 "smt" FStar_Tactics_Basic.smt
                                      FStar_Syntax_Embeddings.e_unit
                                      FStar_Syntax_Embeddings.e_unit
                                     in
                                  let uu____2674 =
                                    let uu____2677 =
                                      mktac1 "refine_intro"
                                        FStar_Tactics_Basic.refine_intro
                                        FStar_Syntax_Embeddings.e_unit
                                        FStar_Syntax_Embeddings.e_unit
                                       in
                                    let uu____2678 =
                                      let uu____2681 =
                                        mktac2 "t_exact"
                                          FStar_Tactics_Basic.t_exact
                                          FStar_Syntax_Embeddings.e_bool
                                          FStar_Reflection_Embeddings.e_term
                                          FStar_Syntax_Embeddings.e_unit
                                         in
                                      let uu____2682 =
                                        let uu____2685 =
                                          mktac1 "apply"
                                            (FStar_Tactics_Basic.apply true)
                                            FStar_Reflection_Embeddings.e_term
                                            FStar_Syntax_Embeddings.e_unit
                                           in
                                        let uu____2686 =
                                          let uu____2689 =
                                            mktac1 "apply_raw"
                                              (FStar_Tactics_Basic.apply
                                                 false)
                                              FStar_Reflection_Embeddings.e_term
                                              FStar_Syntax_Embeddings.e_unit
                                             in
                                          let uu____2690 =
                                            let uu____2693 =
                                              mktac1 "apply_lemma"
                                                FStar_Tactics_Basic.apply_lemma
                                                FStar_Reflection_Embeddings.e_term
                                                FStar_Syntax_Embeddings.e_unit
                                               in
                                            let uu____2694 =
                                              let uu____2697 =
                                                let uu____2698 =
                                                  e_tactic_0'
                                                    FStar_Syntax_Embeddings.e_any
                                                   in
                                                let uu____2703 =
                                                  e_tactic_0'
                                                    FStar_Syntax_Embeddings.e_any
                                                   in
                                                let uu____2708 =
                                                  FStar_Syntax_Embeddings.e_tuple2
                                                    FStar_Syntax_Embeddings.e_any
                                                    FStar_Syntax_Embeddings.e_any
                                                   in
                                                mktac5 "__divide"
                                                  (fun uu____2725  ->
                                                     fun uu____2726  ->
                                                       FStar_Tactics_Basic.divide)
                                                  FStar_Syntax_Embeddings.e_any
                                                  FStar_Syntax_Embeddings.e_any
                                                  FStar_Syntax_Embeddings.e_int
                                                  uu____2698 uu____2703
                                                  uu____2708
                                                 in
                                              let uu____2727 =
                                                let uu____2730 =
                                                  let uu____2731 =
                                                    e_tactic_0'
                                                      FStar_Syntax_Embeddings.e_unit
                                                     in
                                                  let uu____2736 =
                                                    e_tactic_0'
                                                      FStar_Syntax_Embeddings.e_unit
                                                     in
                                                  mktac2 "__seq"
                                                    FStar_Tactics_Basic.seq
                                                    uu____2731 uu____2736
                                                    FStar_Syntax_Embeddings.e_unit
                                                   in
                                                let uu____2745 =
                                                  let uu____2748 =
                                                    mktac1 "set_options"
                                                      FStar_Tactics_Basic.set_options
                                                      FStar_Syntax_Embeddings.e_string
                                                      FStar_Syntax_Embeddings.e_unit
                                                     in
                                                  let uu____2749 =
                                                    let uu____2752 =
                                                      mktac1 "tc"
                                                        FStar_Tactics_Basic.tc
                                                        FStar_Reflection_Embeddings.e_term
                                                        FStar_Reflection_Embeddings.e_term
                                                       in
                                                    let uu____2753 =
                                                      let uu____2756 =
                                                        mktac1 "unshelve"
                                                          FStar_Tactics_Basic.unshelve
                                                          FStar_Reflection_Embeddings.e_term
                                                          FStar_Syntax_Embeddings.e_unit
                                                         in
                                                      let uu____2757 =
                                                        let uu____2760 =
                                                          mktac2 "unquote"
                                                            FStar_Tactics_Basic.unquote
                                                            FStar_Syntax_Embeddings.e_any
                                                            FStar_Reflection_Embeddings.e_term
                                                            FStar_Syntax_Embeddings.e_any
                                                           in
                                                        let uu____2761 =
                                                          let uu____2764 =
                                                            mktac1 "prune"
                                                              FStar_Tactics_Basic.prune
                                                              FStar_Syntax_Embeddings.e_string
                                                              FStar_Syntax_Embeddings.e_unit
                                                             in
                                                          let uu____2765 =
                                                            let uu____2768 =
                                                              mktac1 "addns"
                                                                FStar_Tactics_Basic.addns
                                                                FStar_Syntax_Embeddings.e_string
                                                                FStar_Syntax_Embeddings.e_unit
                                                               in
                                                            let uu____2769 =
                                                              let uu____2772
                                                                =
                                                                mktac1
                                                                  "print"
                                                                  FStar_Tactics_Basic.print
                                                                  FStar_Syntax_Embeddings.e_string
                                                                  FStar_Syntax_Embeddings.e_unit
                                                                 in
                                                              let uu____2773
                                                                =
                                                                let uu____2776
                                                                  =
                                                                  mktac1
                                                                    "debug"
                                                                    FStar_Tactics_Basic.debug
                                                                    FStar_Syntax_Embeddings.e_string
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                   in
                                                                let uu____2777
                                                                  =
                                                                  let uu____2780
                                                                    =
                                                                    mktac1
                                                                    "dump"
                                                                    FStar_Tactics_Basic.print_proof_state
                                                                    FStar_Syntax_Embeddings.e_string
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                  let uu____2781
                                                                    =
                                                                    let uu____2784
                                                                    =
                                                                    mktac1
                                                                    "dump1"
                                                                    FStar_Tactics_Basic.print_proof_state1
                                                                    FStar_Syntax_Embeddings.e_string
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2785
                                                                    =
                                                                    let uu____2788
                                                                    =
                                                                    let uu____2789
                                                                    =
                                                                    e_tactic_0'
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    mktac2
                                                                    "__pointwise"
                                                                    FStar_Tactics_Basic.pointwise
                                                                    FStar_Tactics_Embedding.e_direction
                                                                    uu____2789
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2796
                                                                    =
                                                                    let uu____2799
                                                                    =
                                                                    let uu____2800
                                                                    =
                                                                    let uu____2812
                                                                    =
                                                                    FStar_Syntax_Embeddings.e_tuple2
                                                                    FStar_Syntax_Embeddings.e_bool
                                                                    FStar_Syntax_Embeddings.e_int
                                                                     in
                                                                    e_tactic_1
                                                                    FStar_Reflection_Embeddings.e_term
                                                                    uu____2812
                                                                     in
                                                                    let uu____2823
                                                                    =
                                                                    e_tactic_0'
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    mktac2
                                                                    "__topdown_rewrite"
                                                                    FStar_Tactics_Basic.topdown_rewrite
                                                                    uu____2800
                                                                    uu____2823
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2839
                                                                    =
                                                                    let uu____2842
                                                                    =
                                                                    mktac1
                                                                    "trefl"
                                                                    FStar_Tactics_Basic.trefl
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2843
                                                                    =
                                                                    let uu____2846
                                                                    =
                                                                    mktac1
                                                                    "later"
                                                                    FStar_Tactics_Basic.later
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2847
                                                                    =
                                                                    let uu____2850
                                                                    =
                                                                    mktac1
                                                                    "dup"
                                                                    FStar_Tactics_Basic.dup
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2851
                                                                    =
                                                                    let uu____2854
                                                                    =
                                                                    mktac1
                                                                    "flip"
                                                                    FStar_Tactics_Basic.flip
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2855
                                                                    =
                                                                    let uu____2858
                                                                    =
                                                                    mktac1
                                                                    "qed"
                                                                    FStar_Tactics_Basic.qed
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2859
                                                                    =
                                                                    let uu____2862
                                                                    =
                                                                    mktac1
                                                                    "dismiss"
                                                                    FStar_Tactics_Basic.dismiss
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2863
                                                                    =
                                                                    let uu____2866
                                                                    =
                                                                    mktac1
                                                                    "tadmit"
                                                                    FStar_Tactics_Basic.tadmit
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2867
                                                                    =
                                                                    let uu____2870
                                                                    =
                                                                    let uu____2871
                                                                    =
                                                                    FStar_Syntax_Embeddings.e_tuple2
                                                                    FStar_Reflection_Embeddings.e_term
                                                                    FStar_Reflection_Embeddings.e_term
                                                                     in
                                                                    mktac1
                                                                    "cases"
                                                                    FStar_Tactics_Basic.cases
                                                                    FStar_Reflection_Embeddings.e_term
                                                                    uu____2871
                                                                     in
                                                                    let uu____2882
                                                                    =
                                                                    let uu____2885
                                                                    =
                                                                    mktac1
                                                                    "top_env"
                                                                    FStar_Tactics_Basic.top_env
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Reflection_Embeddings.e_env
                                                                     in
                                                                    let uu____2886
                                                                    =
                                                                    let uu____2889
                                                                    =
                                                                    mktac1
                                                                    "cur_env"
                                                                    FStar_Tactics_Basic.cur_env
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Reflection_Embeddings.e_env
                                                                     in
                                                                    let uu____2890
                                                                    =
                                                                    let uu____2893
                                                                    =
                                                                    mktac1
                                                                    "cur_goal"
                                                                    FStar_Tactics_Basic.cur_goal'
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Reflection_Embeddings.e_term
                                                                     in
                                                                    let uu____2894
                                                                    =
                                                                    let uu____2897
                                                                    =
                                                                    mktac1
                                                                    "cur_witness"
                                                                    FStar_Tactics_Basic.cur_witness
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Reflection_Embeddings.e_term
                                                                     in
                                                                    let uu____2898
                                                                    =
                                                                    let uu____2901
                                                                    =
                                                                    mktac1
                                                                    "inspect"
                                                                    FStar_Tactics_Basic.inspect
                                                                    FStar_Reflection_Embeddings.e_term
                                                                    FStar_Reflection_Embeddings.e_term_view
                                                                     in
                                                                    let uu____2902
                                                                    =
                                                                    let uu____2905
                                                                    =
                                                                    mktac1
                                                                    "pack"
                                                                    FStar_Tactics_Basic.pack
                                                                    FStar_Reflection_Embeddings.e_term_view
                                                                    FStar_Reflection_Embeddings.e_term
                                                                     in
                                                                    let uu____2906
                                                                    =
                                                                    let uu____2909
                                                                    =
                                                                    mktac1
                                                                    "fresh"
                                                                    FStar_Tactics_Basic.fresh
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_int
                                                                     in
                                                                    let uu____2910
                                                                    =
                                                                    let uu____2913
                                                                    =
                                                                    mktac1
                                                                    "ngoals"
                                                                    FStar_Tactics_Basic.ngoals
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_int
                                                                     in
                                                                    let uu____2914
                                                                    =
                                                                    let uu____2917
                                                                    =
                                                                    mktac1
                                                                    "ngoals_smt"
                                                                    FStar_Tactics_Basic.ngoals_smt
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_int
                                                                     in
                                                                    let uu____2918
                                                                    =
                                                                    let uu____2921
                                                                    =
                                                                    mktac1
                                                                    "is_guard"
                                                                    FStar_Tactics_Basic.is_guard
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Syntax_Embeddings.e_bool
                                                                     in
                                                                    let uu____2922
                                                                    =
                                                                    let uu____2925
                                                                    =
                                                                    let uu____2926
                                                                    =
                                                                    FStar_Syntax_Embeddings.e_option
                                                                    FStar_Reflection_Embeddings.e_term
                                                                     in
                                                                    mktac2
                                                                    "uvar_env"
                                                                    FStar_Tactics_Basic.uvar_env
                                                                    FStar_Reflection_Embeddings.e_env
                                                                    uu____2926
                                                                    FStar_Reflection_Embeddings.e_term
                                                                     in
                                                                    let uu____2933
                                                                    =
                                                                    let uu____2936
                                                                    =
                                                                    mktac2
                                                                    "unify"
                                                                    FStar_Tactics_Basic.unify
                                                                    FStar_Reflection_Embeddings.e_term
                                                                    FStar_Reflection_Embeddings.e_term
                                                                    FStar_Syntax_Embeddings.e_bool
                                                                     in
                                                                    let uu____2937
                                                                    =
                                                                    let uu____2940
                                                                    =
                                                                    mktac3
                                                                    "launch_process"
                                                                    FStar_Tactics_Basic.launch_process
                                                                    FStar_Syntax_Embeddings.e_string
                                                                    FStar_Syntax_Embeddings.e_string
                                                                    FStar_Syntax_Embeddings.e_string
                                                                    FStar_Syntax_Embeddings.e_string
                                                                     in
                                                                    let uu____2941
                                                                    =
                                                                    let uu____2944
                                                                    =
                                                                    mktac2
                                                                    "fresh_bv_named"
                                                                    FStar_Tactics_Basic.fresh_bv_named
                                                                    FStar_Syntax_Embeddings.e_string
                                                                    FStar_Reflection_Embeddings.e_term
                                                                    FStar_Reflection_Embeddings.e_bv
                                                                     in
                                                                    let uu____2945
                                                                    =
                                                                    let uu____2948
                                                                    =
                                                                    mktac1
                                                                    "change"
                                                                    FStar_Tactics_Basic.change
                                                                    FStar_Reflection_Embeddings.e_term
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    let uu____2949
                                                                    =
                                                                    let uu____2952
                                                                    =
                                                                    mktac1
                                                                    "get_guard_policy"
                                                                    FStar_Tactics_Basic.get_guard_policy
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                    FStar_Tactics_Embedding.e_guard_policy
                                                                     in
                                                                    let uu____2953
                                                                    =
                                                                    let uu____2956
                                                                    =
                                                                    mktac1
                                                                    "set_guard_policy"
                                                                    FStar_Tactics_Basic.set_guard_policy
                                                                    FStar_Tactics_Embedding.e_guard_policy
                                                                    FStar_Syntax_Embeddings.e_unit
                                                                     in
                                                                    [uu____2956;
                                                                    decr_depth_step;
                                                                    incr_depth_step;
                                                                    tracepoint_step;
                                                                    set_proofstate_range_step;
                                                                    push_binder_step]
                                                                     in
                                                                    uu____2952
                                                                    ::
                                                                    uu____2953
                                                                     in
                                                                    uu____2948
                                                                    ::
                                                                    uu____2949
                                                                     in
                                                                    uu____2944
                                                                    ::
                                                                    uu____2945
                                                                     in
                                                                    uu____2940
                                                                    ::
                                                                    uu____2941
                                                                     in
                                                                    uu____2936
                                                                    ::
                                                                    uu____2937
                                                                     in
                                                                    uu____2925
                                                                    ::
                                                                    uu____2933
                                                                     in
                                                                    uu____2921
                                                                    ::
                                                                    uu____2922
                                                                     in
                                                                    uu____2917
                                                                    ::
                                                                    uu____2918
                                                                     in
                                                                    uu____2913
                                                                    ::
                                                                    uu____2914
                                                                     in
                                                                    uu____2909
                                                                    ::
                                                                    uu____2910
                                                                     in
                                                                    uu____2905
                                                                    ::
                                                                    uu____2906
                                                                     in
                                                                    uu____2901
                                                                    ::
                                                                    uu____2902
                                                                     in
                                                                    uu____2897
                                                                    ::
                                                                    uu____2898
                                                                     in
                                                                    uu____2893
                                                                    ::
                                                                    uu____2894
                                                                     in
                                                                    uu____2889
                                                                    ::
                                                                    uu____2890
                                                                     in
                                                                    uu____2885
                                                                    ::
                                                                    uu____2886
                                                                     in
                                                                    uu____2870
                                                                    ::
                                                                    uu____2882
                                                                     in
                                                                    uu____2866
                                                                    ::
                                                                    uu____2867
                                                                     in
                                                                    uu____2862
                                                                    ::
                                                                    uu____2863
                                                                     in
                                                                    uu____2858
                                                                    ::
                                                                    uu____2859
                                                                     in
                                                                    uu____2854
                                                                    ::
                                                                    uu____2855
                                                                     in
                                                                    uu____2850
                                                                    ::
                                                                    uu____2851
                                                                     in
                                                                    uu____2846
                                                                    ::
                                                                    uu____2847
                                                                     in
                                                                    uu____2842
                                                                    ::
                                                                    uu____2843
                                                                     in
                                                                    uu____2799
                                                                    ::
                                                                    uu____2839
                                                                     in
                                                                    uu____2788
                                                                    ::
                                                                    uu____2796
                                                                     in
                                                                    uu____2784
                                                                    ::
                                                                    uu____2785
                                                                     in
                                                                  uu____2780
                                                                    ::
                                                                    uu____2781
                                                                   in
                                                                uu____2776 ::
                                                                  uu____2777
                                                                 in
                                                              uu____2772 ::
                                                                uu____2773
                                                               in
                                                            uu____2768 ::
                                                              uu____2769
                                                             in
                                                          uu____2764 ::
                                                            uu____2765
                                                           in
                                                        uu____2760 ::
                                                          uu____2761
                                                         in
                                                      uu____2756 ::
                                                        uu____2757
                                                       in
                                                    uu____2752 :: uu____2753
                                                     in
                                                  uu____2748 :: uu____2749
                                                   in
                                                uu____2730 :: uu____2745  in
                                              uu____2697 :: uu____2727  in
                                            uu____2693 :: uu____2694  in
                                          uu____2689 :: uu____2690  in
                                        uu____2685 :: uu____2686  in
                                      uu____2681 :: uu____2682  in
                                    uu____2677 :: uu____2678  in
                                  uu____2673 :: uu____2674  in
                                uu____2669 :: uu____2670  in
                              uu____2665 :: uu____2666  in
                            uu____2661 :: uu____2662  in
                          uu____2657 :: uu____2658  in
                        uu____2653 :: uu____2654  in
                      uu____2649 :: uu____2650  in
                    uu____2638 :: uu____2646  in
                  uu____2627 :: uu____2635  in
                uu____2616 :: uu____2624  in
              uu____2601 :: uu____2613  in
            uu____2597 :: uu____2598  in
          uu____2577 :: uu____2594  in
        uu____2573 :: uu____2574  in
      uu____2567 :: uu____2570  in
    FStar_List.append uu____2564
      (FStar_List.append FStar_Reflection_Interpreter.reflection_primops
         native_tactics_steps)

and unembed_tactic_1 :
  'Aa 'Ar .
    'Aa FStar_Syntax_Embeddings.embedding ->
      'Ar FStar_Syntax_Embeddings.embedding ->
        FStar_Syntax_Syntax.term ->
          ('Aa -> 'Ar FStar_Tactics_Basic.tac) FStar_Pervasives_Native.option
  =
  fun ea  ->
    fun er  ->
      fun f  ->
        FStar_Pervasives_Native.Some
          (fun x  ->
             let rng = FStar_Range.dummyRange  in
             let x_tm = FStar_Syntax_Embeddings.embed ea rng x  in
             let app =
               let uu____2979 =
                 let uu____2984 =
                   let uu____2985 = FStar_Syntax_Syntax.as_arg x_tm  in
                   [uu____2985]  in
                 FStar_Syntax_Syntax.mk_Tm_app f uu____2984  in
               uu____2979 FStar_Pervasives_Native.None rng  in
             unembed_tactic_0 er app)

and unembed_tactic_0 :
  'Ab .
    'Ab FStar_Syntax_Embeddings.embedding ->
      FStar_Syntax_Syntax.term -> 'Ab FStar_Tactics_Basic.tac
  =
  fun eb  ->
    fun embedded_tac_b  ->
      FStar_Tactics_Basic.bind FStar_Tactics_Basic.get
        (fun proof_state  ->
           let rng = embedded_tac_b.FStar_Syntax_Syntax.pos  in
           let tm =
             let uu____3008 =
               let uu____3013 =
                 let uu____3014 =
                   let uu____3015 =
                     FStar_Syntax_Embeddings.embed
                       FStar_Tactics_Embedding.e_proofstate rng proof_state
                      in
                   FStar_Syntax_Syntax.as_arg uu____3015  in
                 [uu____3014]  in
               FStar_Syntax_Syntax.mk_Tm_app embedded_tac_b uu____3013  in
             uu____3008 FStar_Pervasives_Native.None rng  in
           let steps =
             [FStar_TypeChecker_Normalize.Weak;
             FStar_TypeChecker_Normalize.Reify;
             FStar_TypeChecker_Normalize.UnfoldUntil
               FStar_Syntax_Syntax.Delta_constant;
             FStar_TypeChecker_Normalize.UnfoldTac;
             FStar_TypeChecker_Normalize.Primops;
             FStar_TypeChecker_Normalize.Unascribe]  in
           (let uu____3022 =
              FStar_TypeChecker_Env.debug
                proof_state.FStar_Tactics_Types.main_context
                (FStar_Options.Other "TacVerbose")
               in
            if uu____3022
            then
              let uu____3023 = FStar_Syntax_Print.term_to_string tm  in
              FStar_Util.print1 "Starting normalizer with %s\n" uu____3023
            else ());
           (let result =
              let uu____3026 = primitive_steps ()  in
              FStar_TypeChecker_Normalize.normalize_with_primitive_steps
                uu____3026 steps proof_state.FStar_Tactics_Types.main_context
                tm
               in
            (let uu____3030 =
               FStar_TypeChecker_Env.debug
                 proof_state.FStar_Tactics_Types.main_context
                 (FStar_Options.Other "TacVerbose")
                in
             if uu____3030
             then
               let uu____3031 = FStar_Syntax_Print.term_to_string result  in
               FStar_Util.print1 "Reduced tactic: got %s\n" uu____3031
             else ());
            (let res =
               let uu____3038 = FStar_Tactics_Embedding.e_result eb  in
               FStar_Syntax_Embeddings.unembed uu____3038 result  in
             match res with
             | FStar_Pervasives_Native.Some (FStar_Tactics_Result.Success
                 (b,ps)) ->
                 let uu____3051 = FStar_Tactics_Basic.set ps  in
                 FStar_Tactics_Basic.bind uu____3051
                   (fun uu____3055  -> FStar_Tactics_Basic.ret b)
             | FStar_Pervasives_Native.Some (FStar_Tactics_Result.Failed
                 (msg,ps)) ->
                 let uu____3060 = FStar_Tactics_Basic.set ps  in
                 FStar_Tactics_Basic.bind uu____3060
                   (fun uu____3064  -> FStar_Tactics_Basic.fail msg)
             | FStar_Pervasives_Native.None  ->
                 let uu____3067 =
                   let uu____3072 =
                     let uu____3073 =
                       FStar_Syntax_Print.term_to_string result  in
                     FStar_Util.format1
                       "Tactic got stuck! Please file a bug report with a minimal reproduction of this issue.\n%s"
                       uu____3073
                      in
                   (FStar_Errors.Fatal_TacticGotStuck, uu____3072)  in
                 FStar_Errors.raise_error uu____3067
                   (proof_state.FStar_Tactics_Types.main_context).FStar_TypeChecker_Env.range)))

and unembed_tactic_0' :
  'Ab .
    'Ab FStar_Syntax_Embeddings.embedding ->
      FStar_Syntax_Syntax.term ->
        'Ab FStar_Tactics_Basic.tac FStar_Pervasives_Native.option
  =
  fun eb  ->
    fun embedded_tac_b  ->
      let uu____3080 = unembed_tactic_0 eb embedded_tac_b  in
      FStar_All.pipe_left (fun _0_18  -> FStar_Pervasives_Native.Some _0_18)
        uu____3080

let (report_implicits :
  FStar_Tactics_Types.proofstate -> FStar_TypeChecker_Env.implicits -> unit)
  =
  fun ps  ->
    fun is  ->
      let errs =
        FStar_List.map
          (fun uu____3136  ->
             match uu____3136 with
             | (r,uu____3156,uv,uu____3158,ty,rng) ->
                 let uu____3161 =
                   let uu____3162 = FStar_Syntax_Print.uvar_to_string uv  in
                   let uu____3163 = FStar_Syntax_Print.term_to_string ty  in
                   FStar_Util.format3
                     "Tactic left uninstantiated unification variable %s of type %s (reason = \"%s\")"
                     uu____3162 uu____3163 r
                    in
                 (FStar_Errors.Fatal_UninstantiatedUnificationVarInTactic,
                   uu____3161, rng)) is
         in
      match errs with
      | [] -> ()
      | (e,msg,r)::tl1 ->
          (FStar_Tactics_Basic.dump_proofstate ps
             "failing due to uninstantiated implicits";
           FStar_Errors.add_errors tl1;
           FStar_Errors.raise_error (e, msg) r)
  
let (run_tactic_on_typ :
  FStar_Syntax_Syntax.term ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Tactics_Basic.goal Prims.list,FStar_Syntax_Syntax.term)
          FStar_Pervasives_Native.tuple2)
  =
  fun tactic  ->
    fun env  ->
      fun typ  ->
        (let uu____3218 = FStar_ST.op_Bang tacdbg  in
         if uu____3218
         then
           let uu____3242 = FStar_Syntax_Print.term_to_string tactic  in
           FStar_Util.print1 "About to reduce uvars on: %s\n" uu____3242
         else ());
        (let tactic1 =
           FStar_TypeChecker_Normalize.reduce_uvar_solutions env tactic  in
         (let uu____3246 = FStar_ST.op_Bang tacdbg  in
          if uu____3246
          then
            let uu____3270 = FStar_Syntax_Print.term_to_string tactic1  in
            FStar_Util.print1 "About to check tactic term: %s\n" uu____3270
          else ());
         (let uu____3272 =
            FStar_TypeChecker_TcTerm.tc_reified_tactic env tactic1  in
          match uu____3272 with
          | (uu____3285,uu____3286,g) ->
              (FStar_TypeChecker_Rel.force_trivial_guard env g;
               FStar_Errors.stop_if_err ();
               (let tau =
                  unembed_tactic_0 FStar_Syntax_Embeddings.e_unit tactic1  in
                let uu____3293 = FStar_TypeChecker_Env.clear_expected_typ env
                   in
                match uu____3293 with
                | (env1,uu____3307) ->
                    let env2 =
                      let uu___60_3313 = env1  in
                      {
                        FStar_TypeChecker_Env.solver =
                          (uu___60_3313.FStar_TypeChecker_Env.solver);
                        FStar_TypeChecker_Env.range =
                          (uu___60_3313.FStar_TypeChecker_Env.range);
                        FStar_TypeChecker_Env.curmodule =
                          (uu___60_3313.FStar_TypeChecker_Env.curmodule);
                        FStar_TypeChecker_Env.gamma =
                          (uu___60_3313.FStar_TypeChecker_Env.gamma);
                        FStar_TypeChecker_Env.gamma_cache =
                          (uu___60_3313.FStar_TypeChecker_Env.gamma_cache);
                        FStar_TypeChecker_Env.modules =
                          (uu___60_3313.FStar_TypeChecker_Env.modules);
                        FStar_TypeChecker_Env.expected_typ =
                          (uu___60_3313.FStar_TypeChecker_Env.expected_typ);
                        FStar_TypeChecker_Env.sigtab =
                          (uu___60_3313.FStar_TypeChecker_Env.sigtab);
                        FStar_TypeChecker_Env.is_pattern =
                          (uu___60_3313.FStar_TypeChecker_Env.is_pattern);
                        FStar_TypeChecker_Env.instantiate_imp = false;
                        FStar_TypeChecker_Env.effects =
                          (uu___60_3313.FStar_TypeChecker_Env.effects);
                        FStar_TypeChecker_Env.generalize =
                          (uu___60_3313.FStar_TypeChecker_Env.generalize);
                        FStar_TypeChecker_Env.letrecs =
                          (uu___60_3313.FStar_TypeChecker_Env.letrecs);
                        FStar_TypeChecker_Env.top_level =
                          (uu___60_3313.FStar_TypeChecker_Env.top_level);
                        FStar_TypeChecker_Env.check_uvars =
                          (uu___60_3313.FStar_TypeChecker_Env.check_uvars);
                        FStar_TypeChecker_Env.use_eq =
                          (uu___60_3313.FStar_TypeChecker_Env.use_eq);
                        FStar_TypeChecker_Env.is_iface =
                          (uu___60_3313.FStar_TypeChecker_Env.is_iface);
                        FStar_TypeChecker_Env.admit =
                          (uu___60_3313.FStar_TypeChecker_Env.admit);
                        FStar_TypeChecker_Env.lax =
                          (uu___60_3313.FStar_TypeChecker_Env.lax);
                        FStar_TypeChecker_Env.lax_universes =
                          (uu___60_3313.FStar_TypeChecker_Env.lax_universes);
                        FStar_TypeChecker_Env.failhard =
                          (uu___60_3313.FStar_TypeChecker_Env.failhard);
                        FStar_TypeChecker_Env.nosynth =
                          (uu___60_3313.FStar_TypeChecker_Env.nosynth);
                        FStar_TypeChecker_Env.tc_term =
                          (uu___60_3313.FStar_TypeChecker_Env.tc_term);
                        FStar_TypeChecker_Env.type_of =
                          (uu___60_3313.FStar_TypeChecker_Env.type_of);
                        FStar_TypeChecker_Env.universe_of =
                          (uu___60_3313.FStar_TypeChecker_Env.universe_of);
                        FStar_TypeChecker_Env.check_type_of =
                          (uu___60_3313.FStar_TypeChecker_Env.check_type_of);
                        FStar_TypeChecker_Env.use_bv_sorts =
                          (uu___60_3313.FStar_TypeChecker_Env.use_bv_sorts);
                        FStar_TypeChecker_Env.qtbl_name_and_index =
                          (uu___60_3313.FStar_TypeChecker_Env.qtbl_name_and_index);
                        FStar_TypeChecker_Env.normalized_eff_names =
                          (uu___60_3313.FStar_TypeChecker_Env.normalized_eff_names);
                        FStar_TypeChecker_Env.proof_ns =
                          (uu___60_3313.FStar_TypeChecker_Env.proof_ns);
                        FStar_TypeChecker_Env.synth_hook =
                          (uu___60_3313.FStar_TypeChecker_Env.synth_hook);
                        FStar_TypeChecker_Env.splice =
                          (uu___60_3313.FStar_TypeChecker_Env.splice);
                        FStar_TypeChecker_Env.is_native_tactic =
                          (uu___60_3313.FStar_TypeChecker_Env.is_native_tactic);
                        FStar_TypeChecker_Env.identifier_info =
                          (uu___60_3313.FStar_TypeChecker_Env.identifier_info);
                        FStar_TypeChecker_Env.tc_hooks =
                          (uu___60_3313.FStar_TypeChecker_Env.tc_hooks);
                        FStar_TypeChecker_Env.dsenv =
                          (uu___60_3313.FStar_TypeChecker_Env.dsenv);
                        FStar_TypeChecker_Env.dep_graph =
                          (uu___60_3313.FStar_TypeChecker_Env.dep_graph)
                      }  in
                    let env3 =
                      let uu___61_3315 = env2  in
                      {
                        FStar_TypeChecker_Env.solver =
                          (uu___61_3315.FStar_TypeChecker_Env.solver);
                        FStar_TypeChecker_Env.range =
                          (uu___61_3315.FStar_TypeChecker_Env.range);
                        FStar_TypeChecker_Env.curmodule =
                          (uu___61_3315.FStar_TypeChecker_Env.curmodule);
                        FStar_TypeChecker_Env.gamma =
                          (uu___61_3315.FStar_TypeChecker_Env.gamma);
                        FStar_TypeChecker_Env.gamma_cache =
                          (uu___61_3315.FStar_TypeChecker_Env.gamma_cache);
                        FStar_TypeChecker_Env.modules =
                          (uu___61_3315.FStar_TypeChecker_Env.modules);
                        FStar_TypeChecker_Env.expected_typ =
                          (uu___61_3315.FStar_TypeChecker_Env.expected_typ);
                        FStar_TypeChecker_Env.sigtab =
                          (uu___61_3315.FStar_TypeChecker_Env.sigtab);
                        FStar_TypeChecker_Env.is_pattern =
                          (uu___61_3315.FStar_TypeChecker_Env.is_pattern);
                        FStar_TypeChecker_Env.instantiate_imp =
                          (uu___61_3315.FStar_TypeChecker_Env.instantiate_imp);
                        FStar_TypeChecker_Env.effects =
                          (uu___61_3315.FStar_TypeChecker_Env.effects);
                        FStar_TypeChecker_Env.generalize =
                          (uu___61_3315.FStar_TypeChecker_Env.generalize);
                        FStar_TypeChecker_Env.letrecs =
                          (uu___61_3315.FStar_TypeChecker_Env.letrecs);
                        FStar_TypeChecker_Env.top_level =
                          (uu___61_3315.FStar_TypeChecker_Env.top_level);
                        FStar_TypeChecker_Env.check_uvars =
                          (uu___61_3315.FStar_TypeChecker_Env.check_uvars);
                        FStar_TypeChecker_Env.use_eq =
                          (uu___61_3315.FStar_TypeChecker_Env.use_eq);
                        FStar_TypeChecker_Env.is_iface =
                          (uu___61_3315.FStar_TypeChecker_Env.is_iface);
                        FStar_TypeChecker_Env.admit =
                          (uu___61_3315.FStar_TypeChecker_Env.admit);
                        FStar_TypeChecker_Env.lax =
                          (uu___61_3315.FStar_TypeChecker_Env.lax);
                        FStar_TypeChecker_Env.lax_universes = true;
                        FStar_TypeChecker_Env.failhard =
                          (uu___61_3315.FStar_TypeChecker_Env.failhard);
                        FStar_TypeChecker_Env.nosynth =
                          (uu___61_3315.FStar_TypeChecker_Env.nosynth);
                        FStar_TypeChecker_Env.tc_term =
                          (uu___61_3315.FStar_TypeChecker_Env.tc_term);
                        FStar_TypeChecker_Env.type_of =
                          (uu___61_3315.FStar_TypeChecker_Env.type_of);
                        FStar_TypeChecker_Env.universe_of =
                          (uu___61_3315.FStar_TypeChecker_Env.universe_of);
                        FStar_TypeChecker_Env.check_type_of =
                          (uu___61_3315.FStar_TypeChecker_Env.check_type_of);
                        FStar_TypeChecker_Env.use_bv_sorts =
                          (uu___61_3315.FStar_TypeChecker_Env.use_bv_sorts);
                        FStar_TypeChecker_Env.qtbl_name_and_index =
                          (uu___61_3315.FStar_TypeChecker_Env.qtbl_name_and_index);
                        FStar_TypeChecker_Env.normalized_eff_names =
                          (uu___61_3315.FStar_TypeChecker_Env.normalized_eff_names);
                        FStar_TypeChecker_Env.proof_ns =
                          (uu___61_3315.FStar_TypeChecker_Env.proof_ns);
                        FStar_TypeChecker_Env.synth_hook =
                          (uu___61_3315.FStar_TypeChecker_Env.synth_hook);
                        FStar_TypeChecker_Env.splice =
                          (uu___61_3315.FStar_TypeChecker_Env.splice);
                        FStar_TypeChecker_Env.is_native_tactic =
                          (uu___61_3315.FStar_TypeChecker_Env.is_native_tactic);
                        FStar_TypeChecker_Env.identifier_info =
                          (uu___61_3315.FStar_TypeChecker_Env.identifier_info);
                        FStar_TypeChecker_Env.tc_hooks =
                          (uu___61_3315.FStar_TypeChecker_Env.tc_hooks);
                        FStar_TypeChecker_Env.dsenv =
                          (uu___61_3315.FStar_TypeChecker_Env.dsenv);
                        FStar_TypeChecker_Env.dep_graph =
                          (uu___61_3315.FStar_TypeChecker_Env.dep_graph)
                      }  in
                    let uu____3316 =
                      FStar_Tactics_Basic.proofstate_of_goal_ty env3 typ  in
                    (match uu____3316 with
                     | (ps,w) ->
                         ((let uu____3330 = FStar_ST.op_Bang tacdbg  in
                           if uu____3330
                           then
                             let uu____3354 =
                               FStar_Syntax_Print.term_to_string typ  in
                             FStar_Util.print1
                               "Running tactic with goal = %s\n" uu____3354
                           else ());
                          (let uu____3356 =
                             FStar_Util.record_time
                               (fun uu____3366  ->
                                  FStar_Tactics_Basic.run tau ps)
                              in
                           match uu____3356 with
                           | (res,ms) ->
                               ((let uu____3380 = FStar_ST.op_Bang tacdbg  in
                                 if uu____3380
                                 then
                                   let uu____3404 =
                                     FStar_Syntax_Print.term_to_string
                                       tactic1
                                      in
                                   let uu____3405 =
                                     FStar_Util.string_of_int ms  in
                                   let uu____3406 =
                                     FStar_Syntax_Print.lid_to_string
                                       env3.FStar_TypeChecker_Env.curmodule
                                      in
                                   FStar_Util.print3
                                     "Tactic %s ran in %s ms (%s)\n"
                                     uu____3404 uu____3405 uu____3406
                                 else ());
                                (match res with
                                 | FStar_Tactics_Result.Success
                                     (uu____3414,ps1) ->
                                     ((let uu____3417 =
                                         FStar_ST.op_Bang tacdbg  in
                                       if uu____3417
                                       then
                                         let uu____3441 =
                                           FStar_Syntax_Print.term_to_string
                                             w
                                            in
                                         FStar_Util.print1
                                           "Tactic generated proofterm %s\n"
                                           uu____3441
                                       else ());
                                      FStar_List.iter
                                        (fun g1  ->
                                           let uu____3448 =
                                             FStar_Tactics_Basic.is_irrelevant
                                               g1
                                              in
                                           if uu____3448
                                           then
                                             let uu____3449 =
                                               FStar_TypeChecker_Rel.teq_nosmt
                                                 g1.FStar_Tactics_Types.context
                                                 g1.FStar_Tactics_Types.witness
                                                 FStar_Syntax_Util.exp_unit
                                                in
                                             (if uu____3449
                                              then ()
                                              else
                                                (let uu____3451 =
                                                   let uu____3452 =
                                                     FStar_Syntax_Print.term_to_string
                                                       g1.FStar_Tactics_Types.witness
                                                      in
                                                   FStar_Util.format1
                                                     "Irrelevant tactic witness does not unify with (): %s"
                                                     uu____3452
                                                    in
                                                 failwith uu____3451))
                                           else ())
                                        (FStar_List.append
                                           ps1.FStar_Tactics_Types.goals
                                           ps1.FStar_Tactics_Types.smt_goals);
                                      (let g1 =
                                         let uu___62_3455 =
                                           FStar_TypeChecker_Rel.trivial_guard
                                            in
                                         {
                                           FStar_TypeChecker_Env.guard_f =
                                             (uu___62_3455.FStar_TypeChecker_Env.guard_f);
                                           FStar_TypeChecker_Env.deferred =
                                             (uu___62_3455.FStar_TypeChecker_Env.deferred);
                                           FStar_TypeChecker_Env.univ_ineqs =
                                             (uu___62_3455.FStar_TypeChecker_Env.univ_ineqs);
                                           FStar_TypeChecker_Env.implicits =
                                             (ps1.FStar_Tactics_Types.all_implicits)
                                         }  in
                                       let g2 =
                                         let uu____3457 =
                                           FStar_TypeChecker_Rel.solve_deferred_constraints
                                             env3 g1
                                            in
                                         FStar_All.pipe_right uu____3457
                                           FStar_TypeChecker_Rel.resolve_implicits_tac
                                          in
                                       report_implicits ps1
                                         g2.FStar_TypeChecker_Env.implicits;
                                       ((FStar_List.append
                                           ps1.FStar_Tactics_Types.goals
                                           ps1.FStar_Tactics_Types.smt_goals),
                                         w)))
                                 | FStar_Tactics_Result.Failed (s,ps1) ->
                                     ((let uu____3464 =
                                         let uu____3465 =
                                           FStar_TypeChecker_Normalize.psc_subst
                                             ps1.FStar_Tactics_Types.psc
                                            in
                                         FStar_Tactics_Types.subst_proof_state
                                           uu____3465 ps1
                                          in
                                       FStar_Tactics_Basic.dump_proofstate
                                         uu____3464 "at the time of failure");
                                      (let uu____3466 =
                                         let uu____3471 =
                                           FStar_Util.format1
                                             "user tactic failed: %s" s
                                            in
                                         (FStar_Errors.Fatal_ArgumentLengthMismatch,
                                           uu____3471)
                                          in
                                       FStar_Errors.raise_error uu____3466
                                         typ.FStar_Syntax_Syntax.pos)))))))))))
  
type pol =
  | Pos 
  | Neg 
  | Both [@@deriving show]
let (uu___is_Pos : pol -> Prims.bool) =
  fun projectee  -> match projectee with | Pos  -> true | uu____3483 -> false 
let (uu___is_Neg : pol -> Prims.bool) =
  fun projectee  -> match projectee with | Neg  -> true | uu____3489 -> false 
let (uu___is_Both : pol -> Prims.bool) =
  fun projectee  ->
    match projectee with | Both  -> true | uu____3495 -> false
  
type 'a tres_m =
  | Unchanged of 'a 
  | Simplified of ('a,FStar_Tactics_Basic.goal Prims.list)
  FStar_Pervasives_Native.tuple2 
  | Dual of ('a,'a,FStar_Tactics_Basic.goal Prims.list)
  FStar_Pervasives_Native.tuple3 [@@deriving show]
let uu___is_Unchanged : 'a . 'a tres_m -> Prims.bool =
  fun projectee  ->
    match projectee with | Unchanged _0 -> true | uu____3550 -> false
  
let __proj__Unchanged__item___0 : 'a . 'a tres_m -> 'a =
  fun projectee  -> match projectee with | Unchanged _0 -> _0 
let uu___is_Simplified : 'a . 'a tres_m -> Prims.bool =
  fun projectee  ->
    match projectee with | Simplified _0 -> true | uu____3590 -> false
  
let __proj__Simplified__item___0 :
  'a .
    'a tres_m ->
      ('a,FStar_Tactics_Basic.goal Prims.list) FStar_Pervasives_Native.tuple2
  = fun projectee  -> match projectee with | Simplified _0 -> _0 
let uu___is_Dual : 'a . 'a tres_m -> Prims.bool =
  fun projectee  ->
    match projectee with | Dual _0 -> true | uu____3644 -> false
  
let __proj__Dual__item___0 :
  'a .
    'a tres_m ->
      ('a,'a,FStar_Tactics_Basic.goal Prims.list)
        FStar_Pervasives_Native.tuple3
  = fun projectee  -> match projectee with | Dual _0 -> _0 
type tres = FStar_Syntax_Syntax.term tres_m[@@deriving show]
let tpure : 'Auu____3685 . 'Auu____3685 -> 'Auu____3685 tres_m =
  fun x  -> Unchanged x 
let (flip : pol -> pol) =
  fun p  -> match p with | Pos  -> Neg | Neg  -> Pos | Both  -> Both 
let (by_tactic_interp :
  pol -> FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> tres) =
  fun pol  ->
    fun e  ->
      fun t  ->
        let uu____3713 = FStar_Syntax_Util.head_and_args t  in
        match uu____3713 with
        | (hd1,args) ->
            let uu____3750 =
              let uu____3763 =
                let uu____3764 = FStar_Syntax_Util.un_uinst hd1  in
                uu____3764.FStar_Syntax_Syntax.n  in
              (uu____3763, args)  in
            (match uu____3750 with
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(rett,FStar_Pervasives_Native.Some
                    (FStar_Syntax_Syntax.Implicit uu____3777))::(tactic,FStar_Pervasives_Native.None
                                                                 )::(assertion,FStar_Pervasives_Native.None
                                                                    )::[])
                 when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.by_tactic_lid
                 ->
                 (match pol with
                  | Pos  ->
                      let uu____3840 = run_tactic_on_typ tactic e assertion
                         in
                      (match uu____3840 with
                       | (gs,uu____3848) ->
                           Simplified (FStar_Syntax_Util.t_true, gs))
                  | Both  ->
                      let uu____3855 = run_tactic_on_typ tactic e assertion
                         in
                      (match uu____3855 with
                       | (gs,uu____3863) ->
                           Dual (assertion, FStar_Syntax_Util.t_true, gs))
                  | Neg  -> Simplified (assertion, []))
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(assertion,FStar_Pervasives_Native.None )::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.spinoff_lid
                 ->
                 (match pol with
                  | Pos  ->
                      let uu____3914 =
                        let uu____3921 =
                          let uu____3924 =
                            let uu____3925 =
                              FStar_Tactics_Basic.goal_of_goal_ty e assertion
                               in
                            FStar_All.pipe_left FStar_Pervasives_Native.fst
                              uu____3925
                             in
                          [uu____3924]  in
                        (FStar_Syntax_Util.t_true, uu____3921)  in
                      Simplified uu____3914
                  | Both  ->
                      let uu____3936 =
                        let uu____3949 =
                          let uu____3952 =
                            let uu____3953 =
                              FStar_Tactics_Basic.goal_of_goal_ty e assertion
                               in
                            FStar_All.pipe_left FStar_Pervasives_Native.fst
                              uu____3953
                             in
                          [uu____3952]  in
                        (assertion, FStar_Syntax_Util.t_true, uu____3949)  in
                      Dual uu____3936
                  | Neg  -> Simplified (assertion, []))
             | uu____3974 -> Unchanged t)
  
let explode :
  'a .
    'a tres_m ->
      ('a,'a,FStar_Tactics_Basic.goal Prims.list)
        FStar_Pervasives_Native.tuple3
  =
  fun t  ->
    match t with
    | Unchanged t1 -> (t1, t1, [])
    | Simplified (t1,gs) -> (t1, t1, gs)
    | Dual (tn,tp,gs) -> (tn, tp, gs)
  
let comb1 : 'a 'b . ('a -> 'b) -> 'a tres_m -> 'b tres_m =
  fun f  ->
    fun uu___59_4062  ->
      match uu___59_4062 with
      | Unchanged t -> let uu____4068 = f t  in Unchanged uu____4068
      | Simplified (t,gs) ->
          let uu____4075 = let uu____4082 = f t  in (uu____4082, gs)  in
          Simplified uu____4075
      | Dual (tn,tp,gs) ->
          let uu____4092 =
            let uu____4101 = f tn  in
            let uu____4102 = f tp  in (uu____4101, uu____4102, gs)  in
          Dual uu____4092
  
let comb2 :
  'a 'b 'c . ('a -> 'b -> 'c) -> 'a tres_m -> 'b tres_m -> 'c tres_m =
  fun f  ->
    fun x  ->
      fun y  ->
        match (x, y) with
        | (Unchanged t1,Unchanged t2) ->
            let uu____4165 = f t1 t2  in Unchanged uu____4165
        | (Unchanged t1,Simplified (t2,gs)) ->
            let uu____4177 = let uu____4184 = f t1 t2  in (uu____4184, gs)
               in
            Simplified uu____4177
        | (Simplified (t1,gs),Unchanged t2) ->
            let uu____4198 = let uu____4205 = f t1 t2  in (uu____4205, gs)
               in
            Simplified uu____4198
        | (Simplified (t1,gs1),Simplified (t2,gs2)) ->
            let uu____4224 =
              let uu____4231 = f t1 t2  in
              (uu____4231, (FStar_List.append gs1 gs2))  in
            Simplified uu____4224
        | uu____4234 ->
            let uu____4243 = explode x  in
            (match uu____4243 with
             | (n1,p1,gs1) ->
                 let uu____4261 = explode y  in
                 (match uu____4261 with
                  | (n2,p2,gs2) ->
                      let uu____4279 =
                        let uu____4288 = f n1 n2  in
                        let uu____4289 = f p1 p2  in
                        (uu____4288, uu____4289, (FStar_List.append gs1 gs2))
                         in
                      Dual uu____4279))
  
let comb_list : 'a . 'a tres_m Prims.list -> 'a Prims.list tres_m =
  fun rs  ->
    let rec aux rs1 acc =
      match rs1 with
      | [] -> acc
      | hd1::tl1 ->
          let uu____4361 = comb2 (fun l  -> fun r  -> l :: r) hd1 acc  in
          aux tl1 uu____4361
       in
    aux (FStar_List.rev rs) (tpure [])
  
let emit : 'a . FStar_Tactics_Basic.goal Prims.list -> 'a tres_m -> 'a tres_m
  =
  fun gs  ->
    fun m  -> comb2 (fun uu____4409  -> fun x  -> x) (Simplified ((), gs)) m
  
let rec (traverse :
  (pol -> FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> tres) ->
    pol -> FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> tres)
  =
  fun f  ->
    fun pol  ->
      fun e  ->
        fun t  ->
          let r =
            let uu____4451 =
              let uu____4452 = FStar_Syntax_Subst.compress t  in
              uu____4452.FStar_Syntax_Syntax.n  in
            match uu____4451 with
            | FStar_Syntax_Syntax.Tm_uinst (t1,us) ->
                let tr = traverse f pol e t1  in
                let uu____4464 =
                  comb1 (fun t'  -> FStar_Syntax_Syntax.Tm_uinst (t', us))
                   in
                uu____4464 tr
            | FStar_Syntax_Syntax.Tm_meta (t1,m) ->
                let tr = traverse f pol e t1  in
                let uu____4490 =
                  comb1 (fun t'  -> FStar_Syntax_Syntax.Tm_meta (t', m))  in
                uu____4490 tr
            | FStar_Syntax_Syntax.Tm_app
                ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                   FStar_Syntax_Syntax.pos = uu____4510;
                   FStar_Syntax_Syntax.vars = uu____4511;_},(p,uu____4513)::
                 (q,uu____4515)::[])
                when
                FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.imp_lid
                ->
                let x =
                  let uu____4555 =
                    FStar_Syntax_Util.mk_squash FStar_Syntax_Syntax.U_zero p
                     in
                  FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                    uu____4555
                   in
                let r1 = traverse f (flip pol) e p  in
                let r2 =
                  let uu____4558 = FStar_TypeChecker_Env.push_bv e x  in
                  traverse f pol uu____4558 q  in
                comb2
                  (fun l  ->
                     fun r  ->
                       let uu____4564 = FStar_Syntax_Util.mk_imp l r  in
                       uu____4564.FStar_Syntax_Syntax.n) r1 r2
            | FStar_Syntax_Syntax.Tm_app
                ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                   FStar_Syntax_Syntax.pos = uu____4568;
                   FStar_Syntax_Syntax.vars = uu____4569;_},(p,uu____4571)::
                 (q,uu____4573)::[])
                when
                FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.iff_lid
                ->
                let xp =
                  let uu____4613 =
                    FStar_Syntax_Util.mk_squash FStar_Syntax_Syntax.U_zero p
                     in
                  FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                    uu____4613
                   in
                let xq =
                  let uu____4615 =
                    FStar_Syntax_Util.mk_squash FStar_Syntax_Syntax.U_zero q
                     in
                  FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                    uu____4615
                   in
                let r1 =
                  let uu____4617 = FStar_TypeChecker_Env.push_bv e xq  in
                  traverse f Both uu____4617 p  in
                let r2 =
                  let uu____4619 = FStar_TypeChecker_Env.push_bv e xp  in
                  traverse f Both uu____4619 q  in
                (match (r1, r2) with
                 | (Unchanged uu____4622,Unchanged uu____4623) ->
                     comb2
                       (fun l  ->
                          fun r  ->
                            let uu____4633 = FStar_Syntax_Util.mk_iff l r  in
                            uu____4633.FStar_Syntax_Syntax.n) r1 r2
                 | uu____4636 ->
                     let uu____4641 = explode r1  in
                     (match uu____4641 with
                      | (pn,pp,gs1) ->
                          let uu____4659 = explode r2  in
                          (match uu____4659 with
                           | (qn,qp,gs2) ->
                               let t1 =
                                 let uu____4680 =
                                   FStar_Syntax_Util.mk_imp pn qp  in
                                 let uu____4681 =
                                   FStar_Syntax_Util.mk_imp qn pp  in
                                 FStar_Syntax_Util.mk_conj uu____4680
                                   uu____4681
                                  in
                               Simplified
                                 ((t1.FStar_Syntax_Syntax.n),
                                   (FStar_List.append gs1 gs2)))))
            | FStar_Syntax_Syntax.Tm_app (hd1,args) ->
                let r0 = traverse f pol e hd1  in
                let r1 =
                  FStar_List.fold_right
                    (fun uu____4733  ->
                       fun r  ->
                         match uu____4733 with
                         | (a,q) ->
                             let r' = traverse f pol e a  in
                             comb2
                               (fun a1  -> fun args1  -> (a1, q) :: args1) r'
                               r) args (tpure [])
                   in
                comb2
                  (fun hd2  ->
                     fun args1  -> FStar_Syntax_Syntax.Tm_app (hd2, args1))
                  r0 r1
            | FStar_Syntax_Syntax.Tm_abs (bs,t1,k) ->
                let uu____4851 = FStar_Syntax_Subst.open_term bs t1  in
                (match uu____4851 with
                 | (bs1,topen) ->
                     let e' = FStar_TypeChecker_Env.push_binders e bs1  in
                     let r0 =
                       FStar_List.map
                         (fun uu____4885  ->
                            match uu____4885 with
                            | (bv,aq) ->
                                let r =
                                  traverse f (flip pol) e
                                    bv.FStar_Syntax_Syntax.sort
                                   in
                                let uu____4899 =
                                  comb1
                                    (fun s'  ->
                                       ((let uu___63_4925 = bv  in
                                         {
                                           FStar_Syntax_Syntax.ppname =
                                             (uu___63_4925.FStar_Syntax_Syntax.ppname);
                                           FStar_Syntax_Syntax.index =
                                             (uu___63_4925.FStar_Syntax_Syntax.index);
                                           FStar_Syntax_Syntax.sort = s'
                                         }), aq))
                                   in
                                uu____4899 r) bs1
                        in
                     let rbs = comb_list r0  in
                     let rt = traverse f pol e' topen  in
                     comb2
                       (fun bs2  ->
                          fun t2  ->
                            let uu____4945 = FStar_Syntax_Util.abs bs2 t2 k
                               in
                            uu____4945.FStar_Syntax_Syntax.n) rbs rt)
            | FStar_Syntax_Syntax.Tm_ascribed (t1,asc,ef) ->
                let uu____4991 = traverse f pol e t1  in
                let uu____4996 =
                  comb1
                    (fun t2  -> FStar_Syntax_Syntax.Tm_ascribed (t2, asc, ef))
                   in
                uu____4996 uu____4991
            | x -> tpure x  in
          match r with
          | Unchanged tn' ->
              f pol e
                (let uu___64_5036 = t  in
                 {
                   FStar_Syntax_Syntax.n = tn';
                   FStar_Syntax_Syntax.pos =
                     (uu___64_5036.FStar_Syntax_Syntax.pos);
                   FStar_Syntax_Syntax.vars =
                     (uu___64_5036.FStar_Syntax_Syntax.vars)
                 })
          | Simplified (tn',gs) ->
              let uu____5043 =
                f pol e
                  (let uu___65_5047 = t  in
                   {
                     FStar_Syntax_Syntax.n = tn';
                     FStar_Syntax_Syntax.pos =
                       (uu___65_5047.FStar_Syntax_Syntax.pos);
                     FStar_Syntax_Syntax.vars =
                       (uu___65_5047.FStar_Syntax_Syntax.vars)
                   })
                 in
              emit gs uu____5043
          | Dual (tn,tp,gs) ->
              let rp =
                f pol e
                  (let uu___66_5057 = t  in
                   {
                     FStar_Syntax_Syntax.n = tp;
                     FStar_Syntax_Syntax.pos =
                       (uu___66_5057.FStar_Syntax_Syntax.pos);
                     FStar_Syntax_Syntax.vars =
                       (uu___66_5057.FStar_Syntax_Syntax.vars)
                   })
                 in
              let uu____5058 = explode rp  in
              (match uu____5058 with
               | (uu____5067,p',gs') ->
                   Dual
                     ((let uu___67_5081 = t  in
                       {
                         FStar_Syntax_Syntax.n = tn;
                         FStar_Syntax_Syntax.pos =
                           (uu___67_5081.FStar_Syntax_Syntax.pos);
                         FStar_Syntax_Syntax.vars =
                           (uu___67_5081.FStar_Syntax_Syntax.vars)
                       }), p', (FStar_List.append gs gs')))
  
let (getprop :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun e  ->
    fun t  ->
      let tn =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Normalize.Weak;
          FStar_TypeChecker_Normalize.HNF;
          FStar_TypeChecker_Normalize.UnfoldUntil
            FStar_Syntax_Syntax.Delta_constant] e t
         in
      FStar_Syntax_Util.un_squash tn
  
let (preprocess :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_TypeChecker_Env.env,FStar_Syntax_Syntax.term,FStar_Options.optionstate)
        FStar_Pervasives_Native.tuple3 Prims.list)
  =
  fun env  ->
    fun goal  ->
      (let uu____5124 =
         FStar_TypeChecker_Env.debug env (FStar_Options.Other "Tac")  in
       FStar_ST.op_Colon_Equals tacdbg uu____5124);
      (let uu____5149 = FStar_ST.op_Bang tacdbg  in
       if uu____5149
       then
         let uu____5173 =
           let uu____5174 = FStar_TypeChecker_Env.all_binders env  in
           FStar_All.pipe_right uu____5174
             (FStar_Syntax_Print.binders_to_string ",")
            in
         let uu____5175 = FStar_Syntax_Print.term_to_string goal  in
         FStar_Util.print2 "About to preprocess %s |= %s\n" uu____5173
           uu____5175
       else ());
      (let initial = ((Prims.parse_int "1"), [])  in
       let uu____5204 =
         let uu____5211 = traverse by_tactic_interp Pos env goal  in
         match uu____5211 with
         | Unchanged t' -> (t', [])
         | Simplified (t',gs) -> (t', gs)
         | uu____5229 -> failwith "no"  in
       match uu____5204 with
       | (t',gs) ->
           ((let uu____5251 = FStar_ST.op_Bang tacdbg  in
             if uu____5251
             then
               let uu____5275 =
                 let uu____5276 = FStar_TypeChecker_Env.all_binders env  in
                 FStar_All.pipe_right uu____5276
                   (FStar_Syntax_Print.binders_to_string ", ")
                  in
               let uu____5277 = FStar_Syntax_Print.term_to_string t'  in
               FStar_Util.print2 "Main goal simplified to: %s |- %s\n"
                 uu____5275 uu____5277
             else ());
            (let s = initial  in
             let s1 =
               FStar_List.fold_left
                 (fun uu____5324  ->
                    fun g  ->
                      match uu____5324 with
                      | (n1,gs1) ->
                          let phi =
                            let uu____5369 =
                              getprop g.FStar_Tactics_Types.context
                                g.FStar_Tactics_Types.goal_ty
                               in
                            match uu____5369 with
                            | FStar_Pervasives_Native.None  ->
                                let uu____5372 =
                                  let uu____5377 =
                                    let uu____5378 =
                                      FStar_Syntax_Print.term_to_string
                                        g.FStar_Tactics_Types.goal_ty
                                       in
                                    FStar_Util.format1
                                      "Tactic returned proof-relevant goal: %s"
                                      uu____5378
                                     in
                                  (FStar_Errors.Fatal_TacticProofRelevantGoal,
                                    uu____5377)
                                   in
                                FStar_Errors.raise_error uu____5372
                                  env.FStar_TypeChecker_Env.range
                            | FStar_Pervasives_Native.Some phi -> phi  in
                          ((let uu____5381 = FStar_ST.op_Bang tacdbg  in
                            if uu____5381
                            then
                              let uu____5405 = FStar_Util.string_of_int n1
                                 in
                              let uu____5406 =
                                FStar_Tactics_Basic.goal_to_string g  in
                              FStar_Util.print2 "Got goal #%s: %s\n"
                                uu____5405 uu____5406
                            else ());
                           (let gt' =
                              let uu____5409 =
                                let uu____5410 = FStar_Util.string_of_int n1
                                   in
                                Prims.strcat "Could not prove goal #"
                                  uu____5410
                                 in
                              FStar_TypeChecker_Util.label uu____5409
                                goal.FStar_Syntax_Syntax.pos phi
                               in
                            ((n1 + (Prims.parse_int "1")),
                              (((g.FStar_Tactics_Types.context), gt',
                                 (g.FStar_Tactics_Types.opts)) :: gs1))))) s
                 gs
                in
             let uu____5425 = s1  in
             match uu____5425 with
             | (uu____5446,gs1) ->
                 let uu____5464 =
                   let uu____5471 = FStar_Options.peek ()  in
                   (env, t', uu____5471)  in
                 uu____5464 :: gs1)))
  
let (reify_tactic : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun a  ->
    let r =
      let uu____5484 =
        let uu____5485 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.reify_tactic_lid
            FStar_Syntax_Syntax.Delta_equational FStar_Pervasives_Native.None
           in
        FStar_Syntax_Syntax.fv_to_tm uu____5485  in
      FStar_Syntax_Syntax.mk_Tm_uinst uu____5484 [FStar_Syntax_Syntax.U_zero]
       in
    let uu____5486 =
      let uu____5491 =
        let uu____5492 = FStar_Syntax_Syntax.iarg FStar_Syntax_Syntax.t_unit
           in
        let uu____5493 =
          let uu____5496 = FStar_Syntax_Syntax.as_arg a  in [uu____5496]  in
        uu____5492 :: uu____5493  in
      FStar_Syntax_Syntax.mk_Tm_app r uu____5491  in
    uu____5486 FStar_Pervasives_Native.None a.FStar_Syntax_Syntax.pos
  
let (synthesize :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun typ  ->
      fun tau  ->
        (let uu____5515 =
           FStar_TypeChecker_Env.debug env (FStar_Options.Other "Tac")  in
         FStar_ST.op_Colon_Equals tacdbg uu____5515);
        (let uu____5539 =
           let uu____5546 = reify_tactic tau  in
           run_tactic_on_typ uu____5546 env typ  in
         match uu____5539 with
         | (gs,w) ->
             let uu____5553 =
               FStar_List.existsML
                 (fun g  ->
                    let uu____5557 =
                      let uu____5558 =
                        getprop g.FStar_Tactics_Types.context
                          g.FStar_Tactics_Types.goal_ty
                         in
                      FStar_Option.isSome uu____5558  in
                    Prims.op_Negation uu____5557) gs
                in
             if uu____5553
             then
               FStar_Errors.raise_error
                 (FStar_Errors.Fatal_OpenGoalsInSynthesis,
                   "synthesis left open goals") typ.FStar_Syntax_Syntax.pos
             else w)
  
let (splice :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.sigelt Prims.list)
  =
  fun env  ->
    fun tau  ->
      (let uu____5577 =
         FStar_TypeChecker_Env.debug env (FStar_Options.Other "Tac")  in
       FStar_ST.op_Colon_Equals tacdbg uu____5577);
      (let typ = FStar_Syntax_Syntax.t_decls  in
       let uu____5602 =
         let uu____5609 = reify_tactic tau  in
         run_tactic_on_typ uu____5609 env typ  in
       match uu____5602 with
       | (gs,w) ->
           ((let uu____5619 =
               FStar_List.existsML
                 (fun g  ->
                    let uu____5623 =
                      let uu____5624 =
                        getprop g.FStar_Tactics_Types.context
                          g.FStar_Tactics_Types.goal_ty
                         in
                      FStar_Option.isSome uu____5624  in
                    Prims.op_Negation uu____5623) gs
                in
             if uu____5619
             then
               FStar_Errors.raise_error
                 (FStar_Errors.Fatal_OpenGoalsInSynthesis,
                   "splice left open goals") typ.FStar_Syntax_Syntax.pos
             else ());
            (let w1 =
               FStar_TypeChecker_Normalize.normalize
                 [FStar_TypeChecker_Normalize.Weak;
                 FStar_TypeChecker_Normalize.HNF;
                 FStar_TypeChecker_Normalize.UnfoldUntil
                   FStar_Syntax_Syntax.Delta_constant;
                 FStar_TypeChecker_Normalize.Primops;
                 FStar_TypeChecker_Normalize.Unascribe;
                 FStar_TypeChecker_Normalize.Unmeta] env w
                in
             let uu____5629 =
               let uu____5634 =
                 FStar_Syntax_Embeddings.e_list
                   FStar_Reflection_Embeddings.e_sigelt
                  in
               FStar_Syntax_Embeddings.unembed uu____5634 w1  in
             FStar_All.pipe_left FStar_Util.must uu____5629)))
  
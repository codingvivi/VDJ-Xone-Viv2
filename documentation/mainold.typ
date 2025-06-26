= Layout

  #let layouttable(
    title,

    etp1, etp2, etp3, etp4,
    et1, et2, et3 ,et4,

    k1-1, k1-2, k1-3, k1-4,
    b1-1, b1-2, b1-3, b1-4,

    k2-1, k2-2, k2-3, k2-4,
    b2-1, b2-2, b2-3, b2-4,

    k3-1, k3-2, k3-3, k3-4,
    b3-1, b3-2, b3-3, b3-4,

    f1, f2, f3, f4,

    a, b, c, d,
    e, f, g, h,
    i, j, k, l,
    m, n, o, p,

    ebp1, ebp2,
    layer, eb1, eb2, shift_
  ) = {
    heading(
      level: 4,
      title
    )
    table(
      columns: 4,
      stroke: none,
      align: center,
      
      etp1, etp2, etp3, etp4,
      et1, et2, et3 ,et4,

      k1-1, k1-2, k1-3, k1-4,
      b1-1, b1-2, b1-3, b1-4,

      k2-1, k2-2, k2-3, k2-4,
      b2-1, b2-2, b2-3, b2-4,

      k3-1, k3-2, k3-3, k3-4,
      b3-1, b3-2, b3-3, b3-4,

      f1, f2, f3, f4,

      a, b, c, d,
      e, f, g, h,
      i, j, k, l,
      m, n, o, p,

      ebp1, ebp2,
      layer, eb1, eb2, shift_
    )
  }

  #let layoutwithshift(
    etp1, etp2, etp3, etp4,
    shift_etp1, shift_etp2, shift_etp3, shift_etp4,
    et1, et2, et3 ,et4,
    shift_et1, shift_et2, shift_et3 ,shift_et4,

    k1-1, k1-2, k1-3, k1-4,
    shift_k1-1, shift_k1-2, shift_k1-3, shift_k1-4,
    b1-1, b1-2, b1-3, b1-4,
    shift_b1-1, shift_b1-2, shift_b1-3, shift_b1-4,

    k2-1, k2-2, k2-3, k2-4,
    shift_k2-1, shift_k2-2, shift_k2-3, shift_k2-4,
    b2-1, b2-2, b2-3, b2-4,
    shift_b2-1, shift_b2-2, shift_b2-3, shift_b2-4,

    k3-1, k3-2, k3-3, k3-4,
    shift_k3-1, shift_k3-2, shift_k3-3, shift_k3-4,
    b3-1, b3-2, b3-3, b3-4,
    shift_b3-1, shift_b3-2, shift_b3-3, shift_b3-4,

    f1, f2, f3, f4,
    shift_f1, shift_f2, shift_f3, shift_f4,

    a, b, c, d,
    shift_a, shift_b, shift_c, shift_d,
    e, f, g, h,
    shift_e, shift_f, shift_g, shift_h,
    i, j, k, l,
    shift_i, shift_j, shift_k, shift_l,
    m, n, o, p,
    shift_m, shift_n, shift_o, shift_p,

    ebp1, ebp2,
    shift_ebp1, shift_ebp2,
    layer, eb1, eb2, 
    shift_layer, shift_eb1, shift_eb2,
  ) = {
    layouttable(
      Normal,
  
      etp1, etp2, etp3, etp4,
      et1, et2, et3 ,et4,
  
      k1-1, k1-2, k1-3, k1-4,
      b1-1, b1-2, b1-3, b1-4,
  
      k2-1, k2-2, k2-3, k2-4,
      b2-1, b2-2, b2-3, b2-4,
  
      k3-1, k3-2, k3-3, k3-4,
      b3-1, b3-2, b3-3, b3-4,
  
      f1, f2, f3, f4,
  
      a, b, c, d,
      e, f, g, h,
      i, j, k, l,
      m, n, o, p,
  
      ebp1, ebp2,
      layer, eb1, eb2, shift_
    )
    layouttable(
      "Shift",
 
      shift_etp1, shift_etp2, shift_etp3, shift_etp4,
      shift_et1, shift_et2, shift_et3 ,shift_et4,

      shift_k1-1, shift_k1-2, shift_k1-3, shift_k1-4,
      shift_b1-1, shift_b1-2, shift_b1-3, shift_b1-4,

      shift_k2-1, shift_k2-2, shift_k2-3, shift_k2-4,
      shift_b2-1, shift_b2-2, shift_b2-3, shift_b2-4,

      shift_k3-1, shift_k3-2, shift_k3-3, shift_k3-4,
      shift_b3-1, shift_b3-2, shift_b3-3, shift_b3-4,

      shift_f1, shift_f2, shift_f3, shift_f4,

      shift_a, shift_b, shift_c, shift_d,
      shift_e, shift_f, shift_g, shift_h,
      shift_i, shift_j, shift_k, shift_l,
      shift_m, shift_n, shift_o, shift_p,

      shift_ebp1, shift_ebp2,
      shift_layer, shift_eb1, shift_eb2,
    )
  }

  #let layoutpage2c(
    left_etp1, left_etp2, left_etp3, left_etp4,
    left_shift_etp1, left_shift_etp2, left_shift_etp3, left_shift_etp4,
    left_et1, left_et2, left_et3 ,left_et4,
    left_shift_et1, left_shift_et2, left_shift_et3 ,left_shift_et4,

    left_k1-1, left_k1-2, left_k1-3, left_k1-4,
    left_shift_k1-1, left_shift_k1-2, left_shift_k1-3, left_shift_k1-4,
    left_b1-1, left_b1-2, left_b1-3, left_b1-4,
    left_shift_b1-1, left_shift_b1-2, left_shift_b1-3, left_shift_b1-4,

    left_k2-1, left_k2-2, left_k2-3, left_k2-4,
    left_shift_k2-1, left_shift_k2-2, left_shift_k2-3, left_shift_k2-4,
    left_b2-1, left_b2-2, left_b2-3, left_b2-4,
    left_shift_b2-1, left_shift_b2-2, left_shift_b2-3, left_shift_b2-4,

    left_k3-1, left_k3-2, left_k3-3, left_k3-4,
    left_shift_k3-1, left_shift_k3-2, left_shift_k3-3, left_shift_k3-4,
    left_b3-1, left_b3-2, left_b3-3, left_b3-4,
    left_shift_b3-1, left_shift_b3-2, left_shift_b3-3, left_shift_b3-4,

    left_f1, left_f2, left_f3, left_f4,
    left_shift_f1, left_shift_f2, left_shift_f3, left_shift_f4,

    left_a, left_b, left_c, left_d,
    left_shift_a, left_shift_b, left_shift_c, left_shift_d,
    left_e, left_f, left_g, left_h,
    left_shift_e, left_shift_f, left_shift_g, left_shift_h,
    left_i, left_j, left_k, left_l,
    left_shift_i, left_shift_j, left_shift_k, left_shift_l,
    left_m, left_n, left_o, left_p,
    left_shift_m, left_shift_n, left_shift_o, left_shift_p,

    left_ebp1, left_ebp2,
    left_shift_ebp1, left_shift_ebp2,
    left_layer, left_eb1, left_eb2, 
    left_shift_layer, left_shift_eb1, left_shift_eb2,


    right_etp1, right_etp2, right_etp3, right_etp4,
    right_shift_etp1, right_shift_etp2, right_shift_etp3, right_shift_etp4,
    right_et1, right_et2, right_et3 ,right_et4,
    right_shift_et1, right_shift_et2, right_shift_et3 ,right_shift_et4,

    right_k1-1, right_k1-2, right_k1-3, right_k1-4,
    right_shift_k1-1, right_shift_k1-2, right_shift_k1-3, right_shift_k1-4,
    right_b1-1, right_b1-2, right_b1-3, right_b1-4,
    right_shift_b1-1, right_shift_b1-2, right_shift_b1-3, right_shift_b1-4,

    right_k2-1, right_k2-2, right_k2-3, right_k2-4,
    right_shift_k2-1, right_shift_k2-2, right_shift_k2-3, right_shift_k2-4,
    right_b2-1, right_b2-2, right_b2-3, right_b2-4,
    right_shift_b2-1, right_shift_b2-2, right_shift_b2-3, right_shift_b2-4,

    right_k3-1, right_k3-2, right_k3-3, right_k3-4,
    right_shift_k3-1, right_shift_k3-2, right_shift_k3-3, right_shift_k3-4,
    right_b3-1, right_b3-2, right_b3-3, right_b3-4,
    right_shift_b3-1, right_shift_b3-2, right_shift_b3-3, right_shift_b3-4,

    right_f1, right_f2, right_f3, right_f4,
    right_shift_f1, right_shift_f2, right_shift_f3, right_shift_f4,

    right_a, right_b, right_c, right_d,
    right_shift_a, right_shift_b, right_shift_c, right_shift_d,
    right_e, right_f, right_g, right_h,
    right_shift_e, right_shift_f, right_shift_g, right_shift_h,
    right_i, right_j, right_k, right_l,
    right_shift_i, right_shift_j, right_shift_k, right_shift_l,
    right_m, right_n, right_o, right_p,
    right_shift_m, right_shift_n, right_shift_o, right_shift_p,

    right_ebp1, right_ebp2,
    right_shift_ebp1, right_shift_ebp2,
    right_layer, right_eb1, right_eb2, 
    right_shift_layer, right_shift_eb1, right_shift_eb2,
  ) = {
    grid(
      columns: 2,
      [#heading(level: 3, "Left controller")],
      [#heading(level: 3, "Right controller")],

      layoutwithshift(
        left_etp1, left_etp2, left_etp3, left_etp4,
        left_shift_etp1, left_shift_etp2, left_shift_etp3, left_shift_etp4,
        left_et1, left_et2, left_et3 ,left_et4,
        left_shift_et1, left_shift_et2, left_shift_et3 ,left_shift_et4,

        left_k1-1, left_k1-2, left_k1-3, left_k1-4,
        left_shift_k1-1, left_shift_k1-2, left_shift_k1-3, left_shift_k1-4,
        left_b1-1, left_b1-2, left_b1-3, left_b1-4,
        left_shift_b1-1, left_shift_b1-2, left_shift_b1-3, left_shift_b1-4,

        left_k2-1, left_k2-2, left_k2-3, left_k2-4,
        left_shift_k2-1, left_shift_k2-2, left_shift_k2-3, left_shift_k2-4,
        left_b2-1, left_b2-2, left_b2-3, left_b2-4,
        left_shift_b2-1, left_shift_b2-2, left_shift_b2-3, left_shift_b2-4,

        left_k3-1, left_k3-2, left_k3-3, left_k3-4,
        left_shift_k3-1, left_shift_k3-2, left_shift_k3-3, left_shift_k3-4,
        left_b3-1, left_b3-2, left_b3-3, left_b3-4,
        left_shift_b3-1, left_shift_b3-2, left_shift_b3-3, left_shift_b3-4,

        left_f1, left_f2, left_f3, left_f4,
        left_shift_f1, left_shift_f2, left_shift_f3, left_shift_f4,

        left_a, left_b, left_c, left_d,
        left_shift_a, left_shift_b, left_shift_c, left_shift_d,
        left_e, left_f, left_g, left_h,
        left_shift_e, left_shift_f, left_shift_g, left_shift_h,
        left_i, left_j, left_k, left_l,
        left_shift_i, left_shift_j, left_shift_k, left_shift_l,
        left_m, left_n, left_o, left_p,
        left_shift_m, left_shift_n, left_shift_o, left_shift_p,

        left_ebp1, left_ebp2,
        left_shift_ebp1, left_shift_ebp2,
        left_layer, left_eb1, left_eb2, 
        left_shift_layer, left_shift_eb1, left_shift_eb2,
      ),

      layoutwithshift(
        right_etp1, right_etp2, right_etp3, right_etp4,
        right_shift_etp1, right_shift_etp2, right_shift_etp3, right_shift_etp4,
        right_et1, right_et2, right_et3 ,right_et4,
        right_shift_et1, right_shift_et2, right_shift_et3 ,right_shift_et4,

        right_k1-1, right_k1-2, right_k1-3, right_k1-4,
        right_shift_k1-1, right_shift_k1-2, right_shift_k1-3, right_shift_k1-4,
        right_b1-1, right_b1-2, right_b1-3, right_b1-4,
        right_shift_b1-1, right_shift_b1-2, right_shift_b1-3, right_shift_b1-4,

        right_k2-1, right_k2-2, right_k2-3, right_k2-4,
        right_shift_k2-1, right_shift_k2-2, right_shift_k2-3, right_shift_k2-4,
        right_b2-1, right_b2-2, right_b2-3, right_b2-4,
        right_shift_b2-1, right_shift_b2-2, right_shift_b2-3, right_shift_b2-4,

        right_k3-1, right_k3-2, right_k3-3, right_k3-4,
        right_shift_k3-1, right_shift_k3-2, right_shift_k3-3, right_shift_k3-4,
        right_b3-1, right_b3-2, right_b3-3, right_b3-4,
        right_shift_b3-1, right_shift_b3-2, right_shift_b3-3, right_shift_b3-4,

        right_f1, right_f2, right_f3, right_f4,
        right_shift_f1, right_shift_f2, right_shift_f3, right_shift_f4,

        right_a, right_b, right_c, right_d,
        right_shift_a, right_shift_b, right_shift_c, right_shift_d,
        right_e, right_f, right_g, right_h,
        right_shift_e, right_shift_f, right_shift_g, right_shift_h,
        right_i, right_j, right_k, right_l,
        right_shift_i, right_shift_j, right_shift_k, right_shift_l,
        right_m, right_n, right_o, right_p,
        right_shift_m, right_shift_n, right_shift_o, right_shift_p,

        right_ebp1, right_ebp2,
        right_shift_ebp1, right_shift_ebp2,
        right_layer, right_eb1, right_eb2, 
        right_shift_layer, right_shift_eb1, right_shift_eb2,
      ),
    )
  }
  #let hardcoded2c(

    left_etp1, left_etp2, left_etp3, left_etp4,
    left_shift_etp1, left_shift_etp2, left_shift_etp3, left_shift_etp4,
    left_et1, left_et2, left_et3 ,left_et4,
    left_shift_et1, left_shift_et2, left_shift_et3 ,left_shift_et4,

    left_k1-1, left_k1-2, left_k1-3, left_k1-4,
    left_shift_k1-1, left_shift_k1-2, left_shift_k1-3, left_shift_k1-4,
    left_b1-1, left_b1-2, left_b1-3, left_b1-4,
    left_shift_b1-1, left_shift_b1-2, left_shift_b1-3, left_shift_b1-4,

    left_k2-1, left_k2-2, left_k2-3, left_k2-4,
    left_shift_k2-1, left_shift_k2-2, left_shift_k2-3, left_shift_k2-4,
    left_b2-1, left_b2-2, left_b2-3, left_b2-4,
    left_shift_b2-1, left_shift_b2-2, left_shift_b2-3, left_shift_b2-4,

    left_k3-1, left_k3-2, left_k3-3, left_k3-4,
    left_shift_k3-1, left_shift_k3-2, left_shift_k3-3, left_shift_k3-4,
    left_b3-1, left_b3-2, left_b3-3, left_b3-4,
    left_shift_b3-1, left_shift_b3-2, left_shift_b3-3, left_shift_b3-4,

    left_f1, left_f2, left_f3, left_f4,
    left_shift_f1, left_shift_f2, left_shift_f3, left_shift_f4,

    left_a, left_b, left_c, left_d,
    left_shift_a, left_shift_b, left_shift_c, left_shift_d,
    left_e, left_f, left_g, left_h,
    left_shift_e, left_shift_f, left_shift_g, left_shift_h,
    left_i, left_j, left_k, left_l,
    left_shift_i, left_shift_j, left_shift_k, left_shift_l,
    left_m, left_n, left_o, left_p,
    left_shift_m, left_shift_n, left_shift_o, left_shift_p,

    left_ebp1, left_ebp2,
    left_shift_ebp1, left_shift_ebp2,
    left_layer, left_eb1, left_eb2, 
    left_shift_layer, left_shift_eb1, left_shift_eb2,


    right_etp1, right_etp2, right_etp3, right_etp4,
    right_shift_etp1, right_shift_etp2, right_shift_etp3, right_shift_etp4,
    right_et1, right_et2, right_et3 ,right_et4,
    right_shift_et1, right_shift_et2, right_shift_et3 ,right_shift_et4,

    right_k1-1, right_k1-2, right_k1-3, right_k1-4,
    right_shift_k1-1, right_shift_k1-2, right_shift_k1-3, right_shift_k1-4,
    right_b1-1, right_b1-2, right_b1-3, right_b1-4,
    right_shift_b1-1, right_shift_b1-2, right_shift_b1-3, right_shift_b1-4,

    right_k2-1, right_k2-2, right_k2-3, right_k2-4,
    right_shift_k2-1, right_shift_k2-2, right_shift_k2-3, right_shift_k2-4,
    right_b2-1, right_b2-2, right_b2-3, right_b2-4,
    right_shift_b2-1, right_shift_b2-2, right_shift_b2-3, right_shift_b2-4,

    right_k3-1, right_k3-2, right_k3-3, right_k3-4,
    right_shift_k3-1, right_shift_k3-2, right_shift_k3-3, right_shift_k3-4,
    right_b3-1, right_b3-2, right_b3-3, right_b3-4,
    right_shift_b3-1, right_shift_b3-2, right_shift_b3-3, right_shift_b3-4,

    right_f1, right_f2, right_f3, right_f4,
    right_shift_f1, right_shift_f2, right_shift_f3, right_shift_f4,

    right_a, right_b, right_c, right_d,
    right_shift_a, right_shift_b, right_shift_c, right_shift_d,
    right_e, right_f, right_g, right_h,
    right_shift_e, right_shift_f, right_shift_g, right_shift_h,
    right_i, right_j, right_k, right_l,
    right_shift_i, right_shift_j, right_shift_k, right_shift_l,
    right_m, right_n, right_o, right_p,
    right_shift_m, right_shift_n, right_shift_o, right_shift_p,

    right_ebp1, right_ebp2,
    right_shift_ebp1, right_shift_ebp2,
    right_layer, right_eb1, right_eb2, 
    right_shift_layer, right_shift_eb1, right_shift_eb2,
  ) = {
    layoutpage2c(
      left_etp1, left_etp2, left_etp3, left_etp4,
      left_shift_etp1, left_shift_etp2, left_shift_etp3, left_shift_etp4,
      left_et1, left_et2, left_et3 ,left_et4,
      left_shift_et1, left_shift_et2, left_shift_et3 ,left_shift_et4,

      left_k1-1, left_k1-2, left_k1-3, left_k1-4,
      left_shift_k1-1, left_shift_k1-2, left_shift_k1-3, left_shift_k1-4,
      left_b1-1, left_b1-2, left_b1-3, left_b1-4,
      left_shift_b1-1, left_shift_b1-2, left_shift_b1-3, left_shift_b1-4,

      left_k2-1, left_k2-2, left_k2-3, left_k2-4,
      left_shift_k2-1, left_shift_k2-2, left_shift_k2-3, left_shift_k2-4,
      left_b2-1, left_b2-2, left_b2-3, left_b2-4,
      left_shift_b2-1, left_shift_b2-2, left_shift_b2-3, left_shift_b2-4,

      left_k3-1, left_k3-2, left_k3-3, left_k3-4,
      left_shift_k3-1, left_shift_k3-2, left_shift_k3-3, left_shift_k3-4,
      left_b3-1, left_b3-2, left_b3-3, left_b3-4,
      left_shift_b3-1, left_shift_b3-2, left_shift_b3-3, left_shift_b3-4,

      left_f1, left_f2, left_f3, left_f4,
      left_shift_f1, left_shift_f2, left_shift_f3, left_shift_f4,

      left_a, left_b, left_c, left_d,
      left_shift_a, left_shift_b, left_shift_c, left_shift_d,
      left_e, left_f, left_g, left_h,
      left_shift_e, left_shift_f, left_shift_g, left_shift_h,
      left_i, left_j, left_k, left_l,
      left_shift_i, left_shift_j, left_shift_k, left_shift_l,
      left_m, left_n, left_o, left_p,
      left_shift_m, left_shift_n, left_shift_o, left_shift_p,

      left_ebp1, left_ebp2,
      left_shift_ebp1, left_shift_ebp2,
      left_layer, left_eb1, left_eb2, 
      left_shift_layer, left_shift_eb1, left_shift_eb2,


      right_etp1, right_etp2, right_etp3, right_etp4,
      right_shift_etp1, right_shift_etp2, right_shift_etp3, right_shift_etp4,
      right_et1, right_et2, right_et3 ,right_et4,
      right_shift_et1, right_shift_et2, right_shift_et3 ,right_shift_et4,

      right_k1-1, right_k1-2, right_k1-3, right_k1-4,
      right_shift_k1-1, right_shift_k1-2, right_shift_k1-3, right_shift_k1-4,
      right_b1-1, right_b1-2, right_b1-3, right_b1-4,
      right_shift_b1-1, right_shift_b1-2, right_shift_b1-3, right_shift_b1-4,

      right_k2-1, right_k2-2, right_k2-3, right_k2-4,
      right_shift_k2-1, right_shift_k2-2, right_shift_k2-3, right_shift_k2-4,
      right_b2-1, right_b2-2, right_b2-3, right_b2-4,
      right_shift_b2-1, right_shift_b2-2, right_shift_b2-3, right_shift_b2-4,

      right_k3-1, right_k3-2, right_k3-3, right_k3-4,
      right_shift_k3-1, right_shift_k3-2, right_shift_k3-3, right_shift_k3-4,
      right_b3-1, right_b3-2, right_b3-3, right_b3-4,
      right_shift_b3-1, right_shift_b3-2, right_shift_b3-3, right_shift_b3-4,

      right_f1, right_f2, right_f3, right_f4,
      right_shift_f1, right_shift_f2, right_shift_f3, right_shift_f4,

      right_a, right_b, right_c, right_d,
      right_shift_a, right_shift_b, right_shift_c, right_shift_d,
      right_e, right_f, right_g, right_h,
      right_shift_e, right_shift_f, right_shift_g, right_shift_h,
      right_i, right_j, right_k, right_l,
      right_shift_i, right_shift_j, right_shift_k, right_shift_l,
      right_m, right_n, right_o, right_p,
      right_shift_m, right_shift_n, right_shift_o, right_shift_p,

      right_ebp1, right_ebp2,
      right_shift_ebp1, right_shift_ebp2,
      right_layer, right_eb1, right_eb2, 
      right_shift_layer, right_shift_eb1, right_shift_eb2,
    )
  }

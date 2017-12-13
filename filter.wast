(module
 (table 0 anyfunc)
 (memory $0 1)
 (export "memory" (memory $0))
 (export "clamp" (func $clamp))
 (export "filterImage" (func $filterImage))
 (func $clamp (; 0 ;) (param $0 f64) (result i32)
  (local $1 i32)
  (set_local $1
   (i32.const 255)
  )
  (block $label$0
   (br_if $label$0
    (f64.ge
     (get_local $0)
     (f64.const 255)
    )
   )
   (set_local $1
    (i32.const 0)
   )
   (br_if $label$0
    (f64.le
     (get_local $0)
     (f64.const 0)
    )
   )
   (set_local $1
    (i32.trunc_u/f64
     (get_local $0)
    )
   )
  )
  (get_local $1)
 )
 (func $filterImage (; 1 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 f64) (param $8 f64) (result i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 f64)
  (local $20 i32)
  (local $21 f64)
  (local $22 f64)
  (local $23 f64)
  (local $24 i32)
  (set_local $10
   (i32.shl
    (get_local $4)
    (i32.const 3)
   )
  )
  (set_local $9
   (i32.add
    (i32.div_s
     (get_local $5)
     (i32.const -2)
    )
    (get_local $3)
   )
  )
  (set_local $11
   (i32.add
    (i32.div_s
     (get_local $4)
     (i32.const -2)
    )
    (get_local $2)
   )
  )
  (set_local $12
   (i32.const 0)
  )
  (block $label$0
   (loop $label$1
    (br_if $label$0
     (i32.ge_s
      (get_local $12)
      (get_local $2)
     )
    )
    (set_local $13
     (i32.const 0)
    )
    (block $label$2
     (loop $label$3
      (br_if $label$2
       (i32.ge_s
        (get_local $13)
        (get_local $3)
       )
      )
      (set_local $14
       (i32.add
        (get_local $9)
        (get_local $13)
       )
      )
      (set_local $16
       (i32.const 0)
      )
      (set_local $21
       (f64.const 0)
      )
      (set_local $15
       (get_local $6)
      )
      (set_local $22
       (f64.const 0)
      )
      (set_local $23
       (f64.const 0)
      )
      (block $label$4
       (loop $label$5
        (br_if $label$4
         (i32.ge_s
          (get_local $16)
          (get_local $5)
         )
        )
        (set_local $17
         (i32.add
          (get_local $14)
          (get_local $16)
         )
        )
        (set_local $24
         (i32.const 0)
        )
        (set_local $20
         (get_local $15)
        )
        (block $label$6
         (loop $label$7
          (br_if $label$6
           (i32.ge_s
            (get_local $24)
            (get_local $4)
           )
          )
          (set_local $23
           (f64.add
            (get_local $23)
            (f64.mul
             (tee_local $19
              (f64.load
               (get_local $20)
              )
             )
             (f64.convert_u/i32
              (i32.load8_u offset=2
               (tee_local $18
                (i32.add
                 (get_local $0)
                 (i32.mul
                  (i32.add
                   (i32.mul
                    (i32.rem_s
                     (get_local $17)
                     (get_local $3)
                    )
                    (get_local $2)
                   )
                   (i32.rem_s
                    (i32.add
                     (get_local $11)
                     (get_local $24)
                    )
                    (get_local $2)
                   )
                  )
                  (i32.const 3)
                 )
                )
               )
              )
             )
            )
           )
          )
          (set_local $22
           (f64.add
            (get_local $22)
            (f64.mul
             (get_local $19)
             (f64.convert_u/i32
              (i32.load8_u offset=1
               (get_local $18)
              )
             )
            )
           )
          )
          (set_local $21
           (f64.add
            (get_local $21)
            (f64.mul
             (get_local $19)
             (f64.convert_u/i32
              (i32.load8_u
               (get_local $18)
              )
             )
            )
           )
          )
          (set_local $20
           (i32.add
            (get_local $20)
            (i32.const 8)
           )
          )
          (set_local $24
           (i32.add
            (get_local $24)
            (i32.const 1)
           )
          )
          (br $label$7)
         )
        )
        (set_local $15
         (i32.add
          (get_local $15)
          (get_local $10)
         )
        )
        (set_local $16
         (i32.add
          (get_local $16)
          (i32.const 1)
         )
        )
        (br $label$5)
       )
      )
      (set_local $20
       (i32.const 255)
      )
      (set_local $18
       (i32.const 255)
      )
      (block $label$8
       (br_if $label$8
        (f64.ge
         (tee_local $19
          (f64.add
           (f64.mul
            (get_local $21)
            (get_local $7)
           )
           (get_local $8)
          )
         )
         (f64.const 255)
        )
       )
       (set_local $18
        (i32.const 0)
       )
       (br_if $label$8
        (f64.le
         (get_local $19)
         (f64.const 0)
        )
       )
       (set_local $18
        (i32.trunc_u/f64
         (get_local $19)
        )
       )
      )
      (i32.store8
       (tee_local $24
        (i32.add
         (get_local $1)
         (i32.mul
          (i32.add
           (i32.mul
            (get_local $13)
            (get_local $2)
           )
           (get_local $12)
          )
          (i32.const 3)
         )
        )
       )
       (get_local $18)
      )
      (block $label$9
       (br_if $label$9
        (f64.ge
         (tee_local $19
          (f64.add
           (f64.mul
            (get_local $22)
            (get_local $7)
           )
           (get_local $8)
          )
         )
         (f64.const 255)
        )
       )
       (set_local $20
        (i32.const 0)
       )
       (br_if $label$9
        (f64.le
         (get_local $19)
         (f64.const 0)
        )
       )
       (set_local $20
        (i32.trunc_u/f64
         (get_local $19)
        )
       )
      )
      (i32.store8 offset=1
       (get_local $24)
       (get_local $20)
      )
      (set_local $20
       (i32.const 255)
      )
      (block $label$10
       (br_if $label$10
        (f64.ge
         (tee_local $19
          (f64.add
           (f64.mul
            (get_local $23)
            (get_local $7)
           )
           (get_local $8)
          )
         )
         (f64.const 255)
        )
       )
       (set_local $20
        (i32.const 0)
       )
       (br_if $label$10
        (f64.le
         (get_local $19)
         (f64.const 0)
        )
       )
       (set_local $20
        (i32.trunc_u/f64
         (get_local $19)
        )
       )
      )
      (i32.store8 offset=2
       (get_local $24)
       (get_local $20)
      )
      (set_local $13
       (i32.add
        (get_local $13)
        (i32.const 1)
       )
      )
      (br $label$3)
     )
    )
    (set_local $11
     (i32.add
      (get_local $11)
      (i32.const 1)
     )
    )
    (set_local $12
     (i32.add
      (get_local $12)
      (i32.const 1)
     )
    )
    (br $label$1)
   )
  )
  (get_local $1)
 )
)

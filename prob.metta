 ;; Initialize the grammar space
! (bind! &grammar (new-space))

 ;; Add production rules to the space (with probabilities)
! (add-atom &grammar (start ( (expr 1.0) 0))) ;; 100% probability
! (add-atom &grammar (expr ( ( (expr op expr) 0.6) 0)))
! (add-atom &grammar (expr ( (var 0.4) 1)))
! (add-atom &grammar (op ( ("+" 0.4) 0)))
! (add-atom &grammar (op ( ("*" 0.3) 1)))
! (add-atom &grammar (op ( ("-" 0.3) 2)))
! (add-atom &grammar (var ( (x 0.7) 0)))
! (add-atom &grammar (var ( (1.0 0.3) 1)))

 ;; Verify the grammar space
 ; ! (match &grammar ($nt $rule) ($nt $rule))

 ;; Define getProduction function (with probabilities)
(= (getProduction $grammarSpace $nt)
    (match $grammarSpace ($nt ( ($x $prob) $index)) ($x $prob $index))
)

 ;; Test getProduction function
! (getProduction &grammar expr)
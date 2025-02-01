 ;; Initialize the grammar space
! (bind! &grammar (new-space))

 ;; Add production rules to the space - (non-terminal ((derivation-option) index))
! (add-atom &grammar (start ( (expr) 0)))
! (add-atom &grammar (expr ( ( (expr op expr)) 0)))
! (add-atom &grammar (expr ( (var) 1)))
! (add-atom &grammar (op ( ("+") 0)))
! (add-atom &grammar (op ( ("*") 1)))
! (add-atom &grammar (op ( ("-") 2)))
! (add-atom &grammar (var ( (x) 0)))
! (add-atom &grammar (var ( (1.0) 1)))

 ;; to query the populated space
! (match &grammar ($nt $rule) ($nt $rule))
 ; (= (getProduction $grammarSpace $nt)
 ;     (match $grammarSpace ($nt ( ($x) $index)) ($x $index))
 ; )
 ; ! (getProduction &grammar var)
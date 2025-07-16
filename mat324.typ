#let title = "MAT 324 Measure Theory Notes"
#set page(
  "us-letter",
  margin: 2cm,
  numbering: "1",
  header: [
    Alexander Davison #h(1fr) Stony Brook University \
    #emph(title) #h(1fr) #datetime.today().display()
  ],
)
#set heading(numbering: (..x) => numbering("1.", ..x.pos().map(n => n - 1)))
#set text(font: "EB Garamond")
#outline()

= Preliminaries
== Riemann Integral
=== *Definition.* Partition
A _partition_ of $[a,b]$ is a finite list of the form $x_0,x_1,...,x_n$, s.t.
$ a = x_0 < x_1 < dots.h.c < x_n = b $
=== *Definition.* Lower/Upper Darboux Sum
Recall
$ inf_A f := inf{f(x) | x in A} $
$ sup_A f := sup{f(x) | x in A} $
Suppose $f: [a,b] -> RR$ bounded and $P$ a partition of $[a,b]$. The _lower Darbox sum_ $L(f, P, [a,b])$ and the _upper Darboux sum_ $U(f, P, [a,b])$ are defined by
$ L(f,P,[a,b]) := sum_(j=1)^n (x_j - x_(j-1)) inf_([x_(j-1), x_j]) f $
$ U(f,P,[a,b]) := sum_(j=1)^n (x_j - x_(j-1)) sup_([x_(j-1), x_j]) f $
=== *Definition.* Lower/Upper Darboux Integral
Suppose $f: [a,b] -> RR$ bounded. The _lower Darboux integral_ $L(f,[a,b])$ and the _upper Darboux integral_ $U(f,[a,b])$ are defined by
$ L(f,[a,b]) := sup_upright(bold(P)) (P |-> L(f,P,[a,b])) $
$ U(f,[a,b]) := inf_upright(bold(P)) (P |-> U(f,P,[a,b])) $ where $upright(bold(P)) = {P | P "partition of" [a,b] }$.
=== *Definition.* Riemann Integral
Suppose $f: [a,b] -> RR$ bounded. $f$ _Riemann integrable_ iff the lower and upper Darboux integrals equate. If $f$ is Riemann integrable, the _Riemann integral_ $integral_a^b f$ is defined by
$ integral_a^b f := L(f, [a,b]) = U(f,[a,b]) $
=== $f "continuous" => f "Riemann integrable"$
_Proof._ Let $epsilon > 0$. Suppose $f: [a,b] -> RR$ bounded and continuous. Then it is uniformly continuous, i.e.
$
  forall x,x' in [a,b] .quad exists delta > 0 .quad
  |x-x'| < delta => |f(x) - f(x')| < epsilon
$
Let $n in NN^(>=1)$ s.t. $n > (b-a)/delta <=> (b-a)/n < delta$. Let $P$ be the equally spaced partition $x_0, x_1, ..., x_n$ of $[a,b]$ s.t.
$
  forall j in NN^(>=1) .quad x_j - x_(j-1) = (b-a)/n
$
Then
$
  U(f, [a,b]) - L(f, [a,b]) &<= U(f,P,[a,b]) - L(f,P,[a,b]) \
  &= (b-a)/n sum_(j=1)^n (sup_[x_(j-1), x_j] f - inf_[x_(j-1), x_j] f) \
  &<= (b-a)epsilon
$
= Measures
== Outer Measure on $RR$
=== *Definition.* Length
The _length_ $ell$ of an open interval $i$ is defined by
$
  ell := cases(
    b-a quad & "if" I = (a,b) "for some" a\,b in RR "s.t." a < b,
    oo & "if" I in {(-oo, a), (a, oo), (-oo, oo)} "for some" a in RR,
    0 & "if" I = emptyset,
  )
$
=== *Definition.* Outer Measure
The _outer measure_ $|A|$ of a set $A subset RR$ is defined by
$ |A| := inf{sum_(k=0)^oo ell(I_k) mid(|) I_0, I_1, ... "open intervals s.t." A subset union.big_(k=0)^oo I_k} $
Note that $r + oo = oo + oo = oo$ for $r in RR$. Also recall
$ sum_(k=0)^oo x_k := lim_(n->oo) sum_(k=1)^n x_k $
=== $A "countable" => A "outer measure" 0$
_Proof._ Suppose $A = {a_0,a_1,...} subset RR$ countable. For $k in NN$ and arbitrary $epsilon > 0$, let
$ I_k = (a_k - epsilon/(2^k), a_k + epsilon/(2^k)) $
Then $I_0, I_1, ...$ are open intervals whose union contains A, and
$ sum_(k in NN) ell(I_k) = 2 epsilon => & |A| = 0 $

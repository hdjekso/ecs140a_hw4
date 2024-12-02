-module(hw5).
-export([myelem/2, myremoveduplicates/1, myintersection/2, mylast/1, myreverse/1, myreplaceall/3]).

myelem(_, []) -> false;
myelem(Elem, [Elem|_]) -> true;
myelem(Elem, [_|T]) -> myelem(Elem, T).

%Q1
myremoveduplicates([]) -> [];
myremoveduplicates([H|T]) -> 
    case myelem(H, T) of
        true -> myremoveduplicates(T);
        false -> [H | myremoveduplicates(T)]
    end.

%Q2
myintersection([], _) -> [];
myintersection([H1 | T1], L2) -> 
    case myelem(H1, L2) of
        true -> [H1 | myintersection(T1, L2)];
        false -> myintersection(T1, L2)
    end.

%Q3
mylast([]) -> [];
mylast([Elem]) -> [Elem];
mylast([_|T]) -> mylast(T).


%Q4
myreverse(List) -> myreverse(List, []).

%private function called by myreverse/1
myreverse([], Acc) -> Acc;
myreverse([H | T], Acc) -> myreverse(T, [H | Acc]).

%Q5
myreplaceall(_, _, []) -> [];
myreplaceall(NewEl, H, [H|T]) -> [NewEl | myreplaceall(NewEl, H, T)]; %replace head
myreplaceall(NewEl, OgEl, [H|T]) -> [H | myreplaceall(NewEl, OgEl, T)]. %keep head




(*
 * Sorting algorithms in SML.
 * 
 * Date:  2007/02/14
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 *)

val numList = [1, 2, 3, 4, 5, 6];
val sqrList = [1, 4, 9, 16, 25, 36];

val a2fList = ["a", "b", "c", "d", "e", "f"];
val g2lList = ["g", "h", "i", "j", "k", "l"];

val compList = [[1, 8, 27], [2], [3, 4]];
val unsorted = [123, 236, 372, 3, 23, 234, 126, 122, 123];

(*
 * "relation" is a relationship operator that gives an ordering, such as "op <" 
 * NOTE: It is *not* infix!  (It becomes an uncurried function when op is applied)
 * The first time the relationship holds, the value is inserted.
 * Using "=" as a relation simply causes a different permutation of the list in most cases
 *)

(*
 * selectionsort
 *)

(*
 * Find the extreme of a list, and returns the list without that element.
 * 
 * Called extreme because, depending on the relation, it could be the minimum or maximum.
 *)
fun extreme [] relation = (0, [])
        | extreme [singleton] relation = (singleton, [])
        | extreme (head :: tail) relation =
                let val (tailExtreme, tailTail) = extreme tail relation
                in
                        if relation (head, tailExtreme)
                        then
                                (head, tail)
                        else
                                (tailExtreme, head :: tailTail)
                end;

fun selectionSort [] relation = []
        | selectionSort [singleton] relation = [singleton]
        | selectionSort list relation =
                let val (next, remainder) = extreme list relation
                in
                        next :: (selectionSort remainder relation)
                end;

(*
 * insertionsort
 *)

fun insert value [] relation = [value]
        | insert value (head :: tail) relation =
                if relation(value, head)
                then
                        value :: head :: tail
                else
                        head :: insert value tail relation;

fun insertionSort [] relation = []
        | insertionSort (head :: tail) relation =
                insert head (insertionSort tail relation) relation;

(* 
 * mergesort
 *)

(* It doesn't just chop the list in half, but we're sorting so it doesn't matter.
 * 
 * For example:
 * 
 * - numList; 
 * val it = [1,2,3,4,5,6] : int list
 * - split numList;
 * val it = ([1,3,5],[2,4,6]) : int list * int list
 *)

fun split [] = ([], [])
        | split [singleton] = ([singleton], [])
        | split (first :: second :: tail) =
                let val (leftHalf, rightHalf) = split tail;
                        in (first :: leftHalf, second :: rightHalf)
                end;

fun merge ([], [], relation) = []
        | merge ([], list, relation) = list
        | merge (list, [], relation) = list
        | merge (list1, list2, relation) =
                if relation (hd list1, hd list2)
                then
                        (hd list1) :: merge (tl list1, list2, relation)
                else
                        (hd list2) :: merge (tl list2, list1, relation);

fun mergeSort [] relation = []
        | mergeSort [singleton] relation = [singleton]
        | mergeSort list relation =
                let val (leftHalf, rightHalf) = split list
                        in merge ((mergeSort leftHalf relation), (mergeSort rightHalf relation), relation)
                end;

(*
 * quicksort
 *)

fun partition [] pivot relation = ([], [])
        | partition (head :: tail) pivot relation =
                let val (leftHalf, rightHalf) = partition tail pivot relation
                in
                        if relation (head, pivot)
                        then
                                (head :: leftHalf, rightHalf)
                        else
                                (leftHalf, head :: rightHalf)
                end;

fun quickSort [] relation = []
        | quickSort [singleton] relation = [singleton]
        | quickSort (initialPivot :: tail) relation =
                let val (leftHalf, rightHalf) = partition tail initialPivot relation
                in
                        (quickSort leftHalf relation)  @ [initialPivot] @ (quickSort rightHalf relation)
                end;

(* 
 * sample execution
 *)

(*

- val i = insertionSort;
val i = fn : 'a list -> ('a * 'a -> bool) -> 'a list
- val m = mergeSort;
val m = fn : 'a list -> ('a * 'a -> bool) -> 'a list
- val q = quickSort;
val q = fn : 'a list -> ('a * 'a -> bool) -> 'a list
- val s = selectionSort;
val s = fn : int list -> (int * int -> bool) -> int list
- val u = unsorted;
val u = [123,236,372,3,23,234,126,122,123] : int list
- val lt = (op <);
val lt = fn : int * int -> bool
- val gt = (op >);
val gt = fn : int * int -> bool
- s u lt
= ;
val it = [3,23,122,123,123,126,234,236,372] : int list
- i u lt;
val it = [3,23,122,123,123,126,234,236,372] : int list
- m u lt;
val it = [3,23,122,123,123,126,234,236,372] : int list
- q u lt;
val it = [3,23,122,123,123,126,234,236,372] : int list
- s u gt;
val it = [372,236,234,126,123,123,122,23,3] : int list
- i u gt;
val it = [372,236,234,126,123,123,122,23,3] : int list
- m u gt;
val it = [372,236,234,126,123,123,122,23,3] : int list
- q u gt;
val it = [372,236,234,126,123,123,122,23,3] : int list

*)


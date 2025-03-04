type id = string

type exp =
  | Int of int
  | Float of float
  | Div of float * float

type define = id * id * exp

type result = define list

let rec print_z3result oc z3res = 
  List.iter (print_z3result_sub oc) z3res
and print_z3result_sub oc def = 
  match def with
  | (id,t,Int i) ->
    (output_string oc "(assert (= " ;
     output_string oc (id ^ " ");
     output_string oc (string_of_int i);
     output_string oc "))\n")
  | (id,t,Float f) ->
    (output_string oc "(assert (= ";
     output_string oc (id ^ " ");
     output_string oc (string_of_float f);
     output_string oc "))\n")
  | (id,t,Div (f1,f2)) ->
    (output_string oc "(assert (= ";
     output_string oc (id ^ " (/ ");
     output_string oc (string_of_float f1);
     output_string oc " ";
     output_string oc (string_of_float f2);
     output_string oc ")))\n")
    
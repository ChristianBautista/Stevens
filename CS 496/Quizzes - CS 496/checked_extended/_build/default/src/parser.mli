
(* The type of tokens. *)

type token = 
  | UNTUPLE
  | UNPAIR
  | UNITTYPE
  | TIMES
  | THEN
  | SND
  | SETREF
  | SET
  | SEMICOLON
  | RPAREN
  | REFTYPE
  | RBRACE
  | RANGLE
  | PROC
  | PLUS
  | PAIR
  | NEWREF
  | MINUS
  | LPAREN
  | LETREC
  | LET
  | LBRACE
  | LANGLE
  | ISZERO
  | INTTYPE
  | INT of (int)
  | IN
  | IF
  | ID of (string)
  | FST
  | EQUALS
  | EOF
  | END
  | ELSE
  | DOT
  | DIVIDED
  | DEREF
  | DEBUG
  | COMMA
  | COLON
  | BOOLTYPE
  | BEGIN
  | ARROW

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)

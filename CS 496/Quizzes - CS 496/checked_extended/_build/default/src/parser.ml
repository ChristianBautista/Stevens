
module MenhirBasics = struct
  
  exception Error
  
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
    | INT of (
# 22 "parser.mly"
       (int)
# 36 "parser.ml"
  )
    | IN
    | IF
    | ID of (
# 23 "parser.mly"
       (string)
# 43 "parser.ml"
  )
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
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState170
  | MenhirState168
  | MenhirState167
  | MenhirState166
  | MenhirState165
  | MenhirState164
  | MenhirState163
  | MenhirState161
  | MenhirState159
  | MenhirState158
  | MenhirState157
  | MenhirState156
  | MenhirState154
  | MenhirState152
  | MenhirState151
  | MenhirState150
  | MenhirState148
  | MenhirState146
  | MenhirState144
  | MenhirState142
  | MenhirState141
  | MenhirState140
  | MenhirState139
  | MenhirState138
  | MenhirState137
  | MenhirState136
  | MenhirState134
  | MenhirState129
  | MenhirState127
  | MenhirState126
  | MenhirState120
  | MenhirState119
  | MenhirState118
  | MenhirState117
  | MenhirState116
  | MenhirState115
  | MenhirState113
  | MenhirState111
  | MenhirState109
  | MenhirState108
  | MenhirState107
  | MenhirState106
  | MenhirState105
  | MenhirState104
  | MenhirState103
  | MenhirState101
  | MenhirState98
  | MenhirState97
  | MenhirState96
  | MenhirState91
  | MenhirState90
  | MenhirState88
  | MenhirState86
  | MenhirState83
  | MenhirState81
  | MenhirState79
  | MenhirState78
  | MenhirState76
  | MenhirState75
  | MenhirState72
  | MenhirState70
  | MenhirState67
  | MenhirState62
  | MenhirState61
  | MenhirState60
  | MenhirState58
  | MenhirState56
  | MenhirState49
  | MenhirState42
  | MenhirState39
  | MenhirState35
  | MenhirState34
  | MenhirState32
  | MenhirState31
  | MenhirState30
  | MenhirState28
  | MenhirState24
  | MenhirState21
  | MenhirState19
  | MenhirState17
  | MenhirState10
  | MenhirState4
  | MenhirState2
  | MenhirState0

# 8 "parser.mly"
  
open Ast

# 164 "parser.ml"

let rec _menhir_goto_separated_nonempty_list_SEMICOLON_fieldtype_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_SEMICOLON_fieldtype_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv667) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_SEMICOLON_fieldtype_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv665) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((x : 'tv_separated_nonempty_list_SEMICOLON_fieldtype_) : 'tv_separated_nonempty_list_SEMICOLON_fieldtype_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_SEMICOLON_fieldtype__ = 
# 144 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( x )
# 181 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_fieldtype__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv666)) : 'freshtv668)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv671 * _menhir_state * 'tv_fieldtype)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_SEMICOLON_fieldtype_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv669 * _menhir_state * 'tv_fieldtype)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_SEMICOLON_fieldtype_) : 'tv_separated_nonempty_list_SEMICOLON_fieldtype_) = _v in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_fieldtype)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_separated_nonempty_list_SEMICOLON_fieldtype_ = 
# 231 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 198 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_fieldtype_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv670)) : 'freshtv672)
    | _ ->
        _menhir_fail ()

and _menhir_run42 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_texpr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLTYPE ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | INTTYPE ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LANGLE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LBRACE ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LPAREN ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | REFTYPE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | UNITTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_goto_separated_nonempty_list_COMMA_ID_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_ID_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv659 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 236 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_ID_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv657 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 244 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_COMMA_ID_) : 'tv_separated_nonempty_list_COMMA_ID_) = _v in
        ((let (_menhir_stack, _menhir_s, (x : (
# 23 "parser.mly"
       (string)
# 251 "parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_separated_nonempty_list_COMMA_ID_ = 
# 231 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 257 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_ID_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv658)) : 'freshtv660)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv663) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_ID_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv661) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((x : 'tv_separated_nonempty_list_COMMA_ID_) : 'tv_separated_nonempty_list_COMMA_ID_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_COMMA_ID__ = 
# 144 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( x )
# 272 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_ID__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv662)) : 'freshtv664)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_SEMICOLON_fieldtype__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_SEMICOLON_fieldtype__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv655 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_fieldtype__) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RBRACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv651 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_fieldtype__) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv649 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_fieldtype__) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (xs0 : 'tv_loption_separated_nonempty_list_SEMICOLON_fieldtype__)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_texpr = let ts =
          let xs = xs0 in
          
# 220 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( xs )
# 300 "parser.ml"
          
        in
        
# 210 "parser.mly"
                                                                ( RecordType(ts) )
# 306 "parser.ml"
         in
        _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv650)) : 'freshtv652)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv653 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_fieldtype__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv654)) : 'freshtv656)

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 320 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv645 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 332 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOLTYPE ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | INTTYPE ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | LANGLE ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | LBRACE ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | LPAREN ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | REFTYPE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | UNITTYPE ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv646)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv647 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 362 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv648)

and _menhir_goto_texpr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_texpr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv575 * _menhir_state) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARROW ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv571 * _menhir_state) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOLTYPE ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | INTTYPE ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | LANGLE ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | LBRACE ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | LPAREN ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | REFTYPE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | UNITTYPE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv572)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv573 * _menhir_state) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv574)) : 'freshtv576)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv583 * _menhir_state) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARROW ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | RANGLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv579 * _menhir_state) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv577 * _menhir_state) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (t1 : 'tv_texpr)), _, (t2 : 'tv_texpr)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_texpr = 
# 207 "parser.mly"
                                                    ( PairType(t1,t2) )
# 431 "parser.ml"
             in
            _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv578)) : 'freshtv580)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv581 * _menhir_state) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv582)) : 'freshtv584)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv589 * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARROW ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS | RANGLE | RBRACE | RPAREN | SEMICOLON | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv585 * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (t1 : 'tv_texpr)), _, (t2 : 'tv_texpr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_texpr = 
# 206 "parser.mly"
                                    ( FuncType(t1,t2) )
# 457 "parser.ml"
             in
            _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv586)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv587 * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv588)) : 'freshtv590)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv605 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 472 "parser.ml"
        ))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARROW ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | RBRACE | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv601 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 484 "parser.ml"
            ))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (id : (
# 23 "parser.mly"
       (string)
# 489 "parser.ml"
            ))), _, (t : 'tv_texpr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_fieldtype = 
# 213 "parser.mly"
                              ( (id,t) )
# 495 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv599) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_fieldtype) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv597 * _menhir_state * 'tv_fieldtype) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMICOLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv591 * _menhir_state * 'tv_fieldtype) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ID _v ->
                    _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv592)
            | RBRACE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv593 * _menhir_state * 'tv_fieldtype) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (x : 'tv_fieldtype)) = _menhir_stack in
                let _v : 'tv_separated_nonempty_list_SEMICOLON_fieldtype_ = 
# 229 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 526 "parser.ml"
                 in
                _menhir_goto_separated_nonempty_list_SEMICOLON_fieldtype_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv594)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv595 * _menhir_state * 'tv_fieldtype) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv596)) : 'freshtv598)) : 'freshtv600)) : 'freshtv602)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv603 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 543 "parser.ml"
            ))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv604)) : 'freshtv606)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv613 * _menhir_state) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARROW ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv609 * _menhir_state) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv607 * _menhir_state) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (t1 : 'tv_texpr)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_texpr = 
# 208 "parser.mly"
                                 ( t1 )
# 567 "parser.ml"
             in
            _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv608)) : 'freshtv610)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv611 * _menhir_state) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv612)) : 'freshtv614)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv617 * _menhir_state) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv615 * _menhir_state) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (t1 : 'tv_texpr)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_texpr = 
# 209 "parser.mly"
                          ( RefType(t1) )
# 587 "parser.ml"
         in
        _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv616)) : 'freshtv618)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv627 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 595 "parser.ml"
        ))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARROW ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv623 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 607 "parser.ml"
            ))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LBRACE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv619 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 617 "parser.ml"
                ))) * _menhir_state * 'tv_texpr)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BEGIN ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | DEBUG ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | DEREF ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | FST ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | ID _v ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
                | IF ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | INT _v ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
                | ISZERO ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | LANGLE ->
                    _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | LBRACE ->
                    _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | LET ->
                    _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | LETREC ->
                    _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | LPAREN ->
                    _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | NEWREF ->
                    _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | PAIR ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | PROC ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | SET ->
                    _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | SETREF ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | SND ->
                    _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | UNPAIR ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | UNTUPLE ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv620)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv621 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 675 "parser.ml"
                ))) * _menhir_state * 'tv_texpr)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv622)) : 'freshtv624)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv625 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 686 "parser.ml"
            ))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv626)) : 'freshtv628)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv637 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 695 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 699 "parser.ml"
        ))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARROW ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv633 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 711 "parser.ml"
            ))) * (
# 23 "parser.mly"
       (string)
# 715 "parser.ml"
            ))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv629 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 725 "parser.ml"
                ))) * (
# 23 "parser.mly"
       (string)
# 729 "parser.ml"
                ))) * _menhir_state * 'tv_texpr)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOLTYPE ->
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | INTTYPE ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | LANGLE ->
                    _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | LBRACE ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | LPAREN ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | REFTYPE ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | UNITTYPE ->
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv630)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv631 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 759 "parser.ml"
                ))) * (
# 23 "parser.mly"
       (string)
# 763 "parser.ml"
                ))) * _menhir_state * 'tv_texpr)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv632)) : 'freshtv634)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv635 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 774 "parser.ml"
            ))) * (
# 23 "parser.mly"
       (string)
# 778 "parser.ml"
            ))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv636)) : 'freshtv638)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv643 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 787 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 791 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARROW ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv639 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 803 "parser.ml"
            ))) * (
# 23 "parser.mly"
       (string)
# 807 "parser.ml"
            ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72) : 'freshtv640)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv641 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 865 "parser.ml"
            ))) * (
# 23 "parser.mly"
       (string)
# 869 "parser.ml"
            ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv642)) : 'freshtv644)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_separated_nonempty_list_SEMICOLON_field_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_SEMICOLON_field_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv565) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_SEMICOLON_field_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv563) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((x : 'tv_separated_nonempty_list_SEMICOLON_field_) : 'tv_separated_nonempty_list_SEMICOLON_field_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_SEMICOLON_field__ = 
# 144 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( x )
# 896 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_field__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv564)) : 'freshtv566)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv569 * _menhir_state * 'tv_field)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_SEMICOLON_field_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv567 * _menhir_state * 'tv_field)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_SEMICOLON_field_) : 'tv_separated_nonempty_list_SEMICOLON_field_) = _v in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_field)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_separated_nonempty_list_SEMICOLON_field_ = 
# 231 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 913 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_field_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv568)) : 'freshtv570)
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv557) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv555) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((x : 'tv_separated_nonempty_list_COMMA_expr_) : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_COMMA_expr__ = 
# 144 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( x )
# 934 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv556)) : 'freshtv558)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv561 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv559 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_COMMA_expr_) : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_expr)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 231 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 951 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)) : 'freshtv562)
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_SEMICOLON_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_SEMICOLON_expr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv547) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((x : 'tv_separated_nonempty_list_SEMICOLON_expr_) : 'tv_separated_nonempty_list_SEMICOLON_expr_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_SEMICOLON_expr__ = 
# 144 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( x )
# 972 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv548)) : 'freshtv550)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv553 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_SEMICOLON_expr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv551 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_SEMICOLON_expr_) : 'tv_separated_nonempty_list_SEMICOLON_expr_) = _v in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_expr)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_separated_nonempty_list_SEMICOLON_expr_ = 
# 231 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 989 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv552)) : 'freshtv554)
    | _ ->
        _menhir_fail ()

and _menhir_run97 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | FST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | ID _v ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | IF ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | INT _v ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | ISZERO ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | LANGLE ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | LBRACE ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | LET ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | LETREC ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | LPAREN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | NEWREF ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | PAIR ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | PROC ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | SET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | SETREF ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | SND ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | UNPAIR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97

and _menhir_run103 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | FST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | ID _v ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | IF ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | INT _v ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | ISZERO ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | LANGLE ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | LBRACE ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | LET ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | LETREC ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | LPAREN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | NEWREF ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | PAIR ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | PROC ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | SET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | SETREF ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | SND ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | UNPAIR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103

and _menhir_run107 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | FST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | ID _v ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
    | IF ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | INT _v ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
    | ISZERO ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | LANGLE ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | LBRACE ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | LET ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | LETREC ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | LPAREN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | NEWREF ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | PAIR ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | PROC ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | SET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | SETREF ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | SND ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | UNPAIR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107

and _menhir_run99 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv543 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 23 "parser.mly"
       (string)
# 1166 "parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv541 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        let ((id : (
# 23 "parser.mly"
       (string)
# 1174 "parser.ml"
        )) : (
# 23 "parser.mly"
       (string)
# 1178 "parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_expr = 
# 181 "parser.mly"
                          ( Proj(e1,id) )
# 1185 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv542)) : 'freshtv544)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv545 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv546)

and _menhir_run105 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | FST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | ID _v ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | IF ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | INT _v ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | ISZERO ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | LANGLE ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | LBRACE ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | LET ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | LETREC ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | LPAREN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | NEWREF ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | PAIR ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | PROC ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | SET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | SETREF ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | SND ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | UNPAIR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_goto_loption_separated_nonempty_list_COMMA_ID__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_COMMA_ID__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv539) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_loption_separated_nonempty_list_COMMA_ID__) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv537) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((xs0 : 'tv_loption_separated_nonempty_list_COMMA_ID__) : 'tv_loption_separated_nonempty_list_COMMA_ID__) = _v in
    ((let _v : 'tv_ids = let is =
      let xs = xs0 in
      
# 220 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( xs )
# 1264 "parser.ml"
      
    in
    
# 191 "parser.mly"
                                      ( is )
# 1270 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv535) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ids) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv533 * _menhir_state)) * _menhir_state * 'tv_ids) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RANGLE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv529 * _menhir_state)) * _menhir_state * 'tv_ids) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUALS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv525 * _menhir_state)) * _menhir_state * 'tv_ids)) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv526)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv527 * _menhir_state)) * _menhir_state * 'tv_ids)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv528)) : 'freshtv530)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv531 * _menhir_state)) * _menhir_state * 'tv_ids) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv532)) : 'freshtv534)) : 'freshtv536)) : 'freshtv538)) : 'freshtv540)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 1358 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv519 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 1370 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ID _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4) : 'freshtv520)
    | RANGLE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv521 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 1386 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : (
# 23 "parser.mly"
       (string)
# 1391 "parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_ID_ = 
# 229 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 1396 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_ID_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv522)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv523 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 1406 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv524)

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv517) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_texpr = 
# 205 "parser.mly"
               ( UnitType )
# 1421 "parser.ml"
     in
    _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLTYPE ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | INTTYPE ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | LANGLE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | LBRACE ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | LPAREN ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | REFTYPE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | UNITTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLTYPE ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | INTTYPE ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | LANGLE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | LBRACE ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | LPAREN ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | REFTYPE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | UNITTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | RBRACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv515) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState32 in
        ((let _v : 'tv_loption_separated_nonempty_list_SEMICOLON_fieldtype__ = 
# 142 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 1490 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_fieldtype__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv516)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLTYPE ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | INTTYPE ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | LANGLE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | LBRACE ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | LPAREN ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | REFTYPE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | UNITTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv513) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_texpr = 
# 203 "parser.mly"
              ( IntType )
# 1533 "parser.ml"
     in
    _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv514)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv511) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_texpr = 
# 204 "parser.mly"
               ( BoolType )
# 1547 "parser.ml"
     in
    _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv512)

and _menhir_goto_loption_separated_nonempty_list_SEMICOLON_field__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_SEMICOLON_field__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv509 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_field__) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RBRACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv505 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_field__) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv503 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_field__) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (xs0 : 'tv_loption_separated_nonempty_list_SEMICOLON_field__)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_expr = let fs =
          let xs = xs0 in
          
# 220 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( xs )
# 1573 "parser.ml"
          
        in
        
# 180 "parser.mly"
             ( Record(fs) )
# 1579 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)) : 'freshtv506)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv507 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_field__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv508)) : 'freshtv510)

and _menhir_run77 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 1593 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQUALS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv499 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 1605 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv500)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv501 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 1663 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv502)

and _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_COMMA_expr__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv497) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_loption_separated_nonempty_list_COMMA_expr__) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv495) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((xs0 : 'tv_loption_separated_nonempty_list_COMMA_expr__) : 'tv_loption_separated_nonempty_list_COMMA_expr__) = _v in
    ((let _v : 'tv_exprs_with_comma = let es =
      let xs = xs0 in
      
# 220 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( xs )
# 1683 "parser.ml"
      
    in
    
# 194 "parser.mly"
                                        ( es )
# 1689 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv493) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_exprs_with_comma) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv491 * _menhir_state) * _menhir_state * 'tv_exprs_with_comma) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RANGLE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv487 * _menhir_state) * _menhir_state * 'tv_exprs_with_comma) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv485 * _menhir_state) * _menhir_state * 'tv_exprs_with_comma) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (es : 'tv_exprs_with_comma)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_expr = 
# 186 "parser.mly"
                                            ( Tuple(es) )
# 1713 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv486)) : 'freshtv488)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv489 * _menhir_state) * _menhir_state * 'tv_exprs_with_comma) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv490)) : 'freshtv492)) : 'freshtv494)) : 'freshtv496)) : 'freshtv498)

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState101 | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv303 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState96 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101) : 'freshtv304)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv305 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_expr)) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_SEMICOLON_expr_ = 
# 229 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 1805 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv306)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96) : 'freshtv308)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv311 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | BEGIN | COMMA | DEBUG | DEREF | DIVIDED | ELSE | END | EOF | FST | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LBRACE | LET | LETREC | LPAREN | MINUS | NEWREF | PAIR | PLUS | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | SND | THEN | TIMES | UNPAIR | UNTUPLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv309 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_expr = 
# 162 "parser.mly"
                                  ( Mul(e1,e2) )
# 1828 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv310)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98) : 'freshtv312)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv315 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | FST | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LBRACE | LET | LETREC | LPAREN | MINUS | NEWREF | PAIR | PLUS | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | SND | THEN | UNPAIR | UNTUPLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv313 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_expr = 
# 160 "parser.mly"
                                 ( Add(e1,e2) )
# 1855 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv316)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv319 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | BEGIN | COMMA | DEBUG | DEREF | DIVIDED | ELSE | END | EOF | FST | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LBRACE | LET | LETREC | LPAREN | MINUS | NEWREF | PAIR | PLUS | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | SND | THEN | TIMES | UNPAIR | UNTUPLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv317 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_expr = 
# 163 "parser.mly"
                                    ( Div(e1,e2) )
# 1878 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv318)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv320)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv323 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | FST | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LBRACE | LET | LETREC | LPAREN | MINUS | NEWREF | PAIR | PLUS | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | SND | THEN | UNPAIR | UNTUPLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv321 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_expr = 
# 161 "parser.mly"
                                  ( Sub(e1,e2) )
# 1905 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv322)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv324)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv329 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv327 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState109 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv325 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 159 "parser.mly"
                                    ( Debug(e) )
# 1941 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv326)) : 'freshtv328)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109) : 'freshtv330)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv335 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv333 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState111 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv331 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 171 "parser.mly"
                                      ( DeRef(e) )
# 1979 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)) : 'freshtv334)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111) : 'freshtv336)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv341 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv339 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState113 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv337 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 183 "parser.mly"
                                  ( Fst(e) )
# 2017 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)) : 'freshtv340)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113) : 'freshtv342)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv345 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv343 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState115 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116) : 'freshtv344)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv346)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv349 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | ELSE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv347 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState117 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118) : 'freshtv348)
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117) : 'freshtv350)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv353 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | FST | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LBRACE | LET | LETREC | LPAREN | NEWREF | PAIR | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | SND | THEN | UNPAIR | UNTUPLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv351 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((((((_menhir_stack, _menhir_s), _, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)), _), _, (e3 : 'tv_expr)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 173 "parser.mly"
                                                      ( ITE(e1,e2,e3) )
# 2200 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119) : 'freshtv354)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv359 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv357 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState120 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv355 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 169 "parser.mly"
                                       ( IsZero(e) )
# 2236 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv356)) : 'freshtv358)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120) : 'freshtv360)
    | MenhirState127 | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv361 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState126 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127) : 'freshtv362)
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | RANGLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv363 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_expr)) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 229 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 2322 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv366)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv379 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 2334 "parser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | RBRACE | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv377 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 2354 "parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (id : (
# 23 "parser.mly"
       (string)
# 2359 "parser.ml"
            ))), _, (e : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_field = 
# 200 "parser.mly"
                              ( (id,e) )
# 2365 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv375) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_field) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv373 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMICOLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv367 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ID _v ->
                    _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134) : 'freshtv368)
            | RBRACE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv369 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (x : 'tv_field)) = _menhir_stack in
                let _v : 'tv_separated_nonempty_list_SEMICOLON_field_ = 
# 229 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 2396 "parser.ml"
                 in
                _menhir_goto_separated_nonempty_list_SEMICOLON_field_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv371 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv372)) : 'freshtv374)) : 'freshtv376)) : 'freshtv378)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129) : 'freshtv380)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv383 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 2415 "parser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv381 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 2429 "parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState136 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState137) : 'freshtv382)
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv384)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv387 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 2497 "parser.ml"
        ))) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | FST | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LBRACE | LET | LETREC | LPAREN | NEWREF | PAIR | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | SND | THEN | UNPAIR | UNTUPLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv385 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 2517 "parser.ml"
            ))) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 2522 "parser.ml"
            ))), _, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 164 "parser.mly"
                                                    ( Let(x,e1,e2) )
# 2530 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138) : 'freshtv388)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((('freshtv391 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 2542 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 2546 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((('freshtv389 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 2560 "parser.ml"
            ))) * (
# 23 "parser.mly"
       (string)
# 2564 "parser.ml"
            ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState139 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv390)
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139) : 'freshtv392)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((((('freshtv395 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 2632 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 2636 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | FST | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LBRACE | LET | LETREC | LPAREN | NEWREF | PAIR | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | SND | THEN | UNPAIR | UNTUPLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((((('freshtv393 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 2656 "parser.ml"
            ))) * (
# 23 "parser.mly"
       (string)
# 2660 "parser.ml"
            ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((((((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 2665 "parser.ml"
            ))), (y : (
# 23 "parser.mly"
       (string)
# 2669 "parser.ml"
            ))), _, (targ : 'tv_texpr)), _, (tr : 'tv_texpr)), _, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _12 = () in
            let _10 = () in
            let _8 = () in
            let _7 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 166 "parser.mly"
                                                   ( Letrec(x,y,targ,tr,e1,e2) )
# 2681 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv396)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv401 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState142
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState142
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState142
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState142
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv399 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState142 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv397 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (e : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 178 "parser.mly"
                                      ( Sub(Int 0, e) )
# 2717 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv398)) : 'freshtv400)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState142
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142) : 'freshtv402)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv407 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv405 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState144 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv403 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 176 "parser.mly"
                               (e)
# 2786 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv404)) : 'freshtv406)
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv408)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv413 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv411 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState146 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv409 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 168 "parser.mly"
                                           ( App(e1,e2) )
# 2833 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv410)) : 'freshtv412)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv414)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv419 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv417 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState148 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv415 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 170 "parser.mly"
                                       ( NewRef(e) )
# 2871 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv416)) : 'freshtv418)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState148) : 'freshtv420)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv423 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv421 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState150 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv422)
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150) : 'freshtv424)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv429 * _menhir_state)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv427 * _menhir_state)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState152 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv425 * _menhir_state)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 182 "parser.mly"
                                                    ( Pair(e1,e2) )
# 2984 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)) : 'freshtv428)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState152) : 'freshtv430)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv435 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 2998 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv433 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 3016 "parser.ml"
            ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState154 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv431 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 3024 "parser.ml"
            ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 3030 "parser.ml"
            ))), _, (t : 'tv_texpr)), _, (e : 'tv_expr)) = _menhir_stack in
            let _9 = () in
            let _7 = () in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 167 "parser.mly"
                                                                             ( Proc(x,t,e) )
# 3041 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv432)) : 'freshtv434)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154) : 'freshtv436)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv439 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 3055 "parser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState156
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState156
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState156
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState156
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState156
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | FST | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LBRACE | LET | LETREC | LPAREN | NEWREF | PAIR | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | SND | THEN | UNPAIR | UNTUPLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv437 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 3075 "parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 3080 "parser.ml"
            ))), _, (e : 'tv_expr)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 174 "parser.mly"
                                    ( Set(x,e) )
# 3087 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156) : 'freshtv440)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv443 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv441 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState157 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158) : 'freshtv442)
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState157) : 'freshtv444)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv449 * _menhir_state)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv447 * _menhir_state)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState159 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv445 * _menhir_state)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 172 "parser.mly"
                                                          ( SetRef(e1,e2) )
# 3198 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)) : 'freshtv448)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv450)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv455 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv453 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState161 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv451 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 184 "parser.mly"
                                  ( Snd(e) )
# 3236 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv452)) : 'freshtv454)
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161) : 'freshtv456)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv459 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 3250 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 3254 "parser.ml"
        )))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState163
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState163
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv457 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 3268 "parser.ml"
            ))) * (
# 23 "parser.mly"
       (string)
# 3272 "parser.ml"
            )))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState163 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState164) : 'freshtv458)
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState163
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState163
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState163
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState163) : 'freshtv460)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv463 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 3340 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 3344 "parser.ml"
        )))) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | FST | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LBRACE | LET | LETREC | LPAREN | NEWREF | PAIR | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | SND | THEN | UNPAIR | UNTUPLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((('freshtv461 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 3364 "parser.ml"
            ))) * (
# 23 "parser.mly"
       (string)
# 3368 "parser.ml"
            )))) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 3373 "parser.ml"
            ))), (y : (
# 23 "parser.mly"
       (string)
# 3377 "parser.ml"
            ))), _, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _9 = () in
            let _7 = () in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 185 "parser.mly"
                                                                                    ( Unpair(x,y,e1,e2) )
# 3388 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv462)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState165) : 'freshtv464)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv467 * _menhir_state)) * _menhir_state * 'tv_ids))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv465 * _menhir_state)) * _menhir_state * 'tv_ids))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState166 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167) : 'freshtv466)
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv468)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv471 * _menhir_state)) * _menhir_state * 'tv_ids))) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | FST | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LBRACE | LET | LETREC | LPAREN | NEWREF | PAIR | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | SND | THEN | UNPAIR | UNTUPLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv469 * _menhir_state)) * _menhir_state * 'tv_ids))) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), _, (is : 'tv_ids)), _, (e1 : 'tv_expr)), _), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 187 "parser.mly"
                                                                          ( Untuple(is,e1,e2) )
# 3497 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv470)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState168) : 'freshtv472)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv483 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | DOT ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv481 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState170 in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv479 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (_menhir_stack, _menhir_s, (e : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 95 "parser.mly"
       (Ast.expr)
# 3526 "parser.ml"
            ) = 
# 128 "parser.mly"
                 ( e )
# 3530 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv477) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 95 "parser.mly"
       (Ast.expr)
# 3538 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv475) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 95 "parser.mly"
       (Ast.expr)
# 3546 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv473) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 95 "parser.mly"
       (Ast.expr)
# 3554 "parser.ml"
            )) : (
# 95 "parser.mly"
       (Ast.expr)
# 3558 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv474)) : 'freshtv476)) : 'freshtv478)) : 'freshtv480)) : 'freshtv482)
        | MINUS ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | PLUS ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | TIMES ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170) : 'freshtv484)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_SEMICOLON_expr__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_loption_separated_nonempty_list_SEMICOLON_expr__) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv299) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((xs0 : 'tv_loption_separated_nonempty_list_SEMICOLON_expr__) : 'tv_loption_separated_nonempty_list_SEMICOLON_expr__) = _v in
    ((let _v : 'tv_exprs = let es =
      let xs = xs0 in
      
# 220 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( xs )
# 3589 "parser.ml"
      
    in
    
# 197 "parser.mly"
                                            ( es )
# 3595 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv297) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_exprs) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv295 * _menhir_state) * _menhir_state * 'tv_exprs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv291 * _menhir_state) * _menhir_state * 'tv_exprs) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv289 * _menhir_state) * _menhir_state * 'tv_exprs) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (es : 'tv_exprs)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_expr = 
# 175 "parser.mly"
                             ( BeginEnd(es) )
# 3619 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv290)) : 'freshtv292)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv293 * _menhir_state) * _menhir_state * 'tv_exprs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)) : 'freshtv296)) : 'freshtv298)) : 'freshtv300)) : 'freshtv302)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv123 * _menhir_state)) * _menhir_state * 'tv_ids))) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv125 * _menhir_state)) * _menhir_state * 'tv_ids))) * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv127 * _menhir_state)) * _menhir_state * 'tv_ids))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv129 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 3658 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 3662 "parser.ml"
        )))) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv131 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 3671 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 3675 "parser.ml"
        )))) * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState163 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv133 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 3684 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 3688 "parser.ml"
        )))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv135 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv137 * _menhir_state)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv139 * _menhir_state)) * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv141 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv143 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 3717 "parser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv145 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 3726 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState152 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv147 * _menhir_state)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv149 * _menhir_state)) * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv151 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv153 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv157 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((((('freshtv161 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 3770 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 3774 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((((('freshtv163 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 3783 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 3787 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((('freshtv165 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 3796 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 3800 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv167 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 3809 "parser.ml"
        ))) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv169 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 3818 "parser.ml"
        ))) * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv171 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 3827 "parser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv173 * _menhir_state * 'tv_field)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv175 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 3841 "parser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv179 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv181 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv183 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv185 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv187 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv189 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv191 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv193 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv195 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv197 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv199 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv201 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv203 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv207 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv213 * _menhir_state * 'tv_expr) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv215 * _menhir_state * 'tv_expr) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv221 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv225 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv227 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv229 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv231 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv233 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 3990 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv235 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv237 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 4004 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv239 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 4013 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 4017 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) * _menhir_state * 'tv_texpr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv241 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 4026 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 4030 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv243 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 4039 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 4043 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv249 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv251 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv253 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4072 "parser.ml"
        ))) * _menhir_state * 'tv_texpr))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv255 * _menhir_state * 'tv_fieldtype)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv257 * _menhir_state * 'tv_texpr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv259 * _menhir_state) * _menhir_state * 'tv_texpr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 4101 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv269 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv271 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4125 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv273 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 4134 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv275 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv277 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv279 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4153 "parser.ml"
        ))) * (
# 23 "parser.mly"
       (string)
# 4157 "parser.ml"
        )))) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv281 * _menhir_state)) * _menhir_state * 'tv_ids))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv283 * _menhir_state * (
# 23 "parser.mly"
       (string)
# 4171 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv285 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv288)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LANGLE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ID _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | RANGLE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv115) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState2 in
            ((let _v : 'tv_loption_separated_nonempty_list_COMMA_ID__ = 
# 142 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 4206 "parser.ml"
             in
            _menhir_goto_loption_separated_nonempty_list_COMMA_ID__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv116)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2) : 'freshtv118)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ID _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv107 * _menhir_state)) = Obj.magic _menhir_stack in
            let (_v : (
# 23 "parser.mly"
       (string)
# 4239 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COMMA ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv103 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4250 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ID _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv99 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4260 "parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    let (_v : (
# 23 "parser.mly"
       (string)
# 4265 "parser.ml"
                    )) = _v in
                    ((let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | RPAREN ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv95 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4276 "parser.ml"
                        ))) * (
# 23 "parser.mly"
       (string)
# 4280 "parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | EQUALS ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : ((((('freshtv91 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4290 "parser.ml"
                            ))) * (
# 23 "parser.mly"
       (string)
# 4294 "parser.ml"
                            ))) = Obj.magic _menhir_stack in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | BEGIN ->
                                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | DEBUG ->
                                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | DEREF ->
                                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | FST ->
                                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | ID _v ->
                                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
                            | IF ->
                                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | INT _v ->
                                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
                            | ISZERO ->
                                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | LANGLE ->
                                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | LBRACE ->
                                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | LET ->
                                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | LETREC ->
                                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | LPAREN ->
                                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | NEWREF ->
                                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | PAIR ->
                                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | PROC ->
                                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | SET ->
                                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | SETREF ->
                                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | SND ->
                                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | UNPAIR ->
                                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | UNTUPLE ->
                                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17) : 'freshtv92)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : ((((('freshtv93 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4352 "parser.ml"
                            ))) * (
# 23 "parser.mly"
       (string)
# 4356 "parser.ml"
                            ))) = Obj.magic _menhir_stack in
                            ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)) : 'freshtv96)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv97 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4367 "parser.ml"
                        ))) * (
# 23 "parser.mly"
       (string)
# 4371 "parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)) : 'freshtv100)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv101 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4382 "parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)) : 'freshtv104)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv105 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4393 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)) : 'freshtv108)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv109 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)) : 'freshtv112)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19) : 'freshtv88)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv84)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 23 "parser.mly"
       (string)
# 4556 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUALS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv75 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 4567 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv76)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv77 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 4625 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)) : 'freshtv80)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ID _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv67 * _menhir_state)) = Obj.magic _menhir_stack in
            let (_v : (
# 23 "parser.mly"
       (string)
# 4655 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv63 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4666 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOLTYPE ->
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState28
                | INTTYPE ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState28
                | LANGLE ->
                    _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState28
                | LBRACE ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState28
                | LPAREN ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState28
                | REFTYPE ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState28
                | UNITTYPE ->
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState28
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv64)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv65 * _menhir_state)) * (
# 23 "parser.mly"
       (string)
# 4696 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)) : 'freshtv68)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv69 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)) : 'freshtv72)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv60)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv56)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | FST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | ID _v ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | IF ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | INT _v ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | ISZERO ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | LANGLE ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | LBRACE ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | LET ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | LETREC ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | LPAREN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | MINUS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState61 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv54)
    | NEWREF ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | PAIR ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | PROC ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | SET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | SETREF ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | SND ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | UNPAIR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 23 "parser.mly"
       (string)
# 4966 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv45 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 4977 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ID _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv41 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 4987 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                let (_v : (
# 23 "parser.mly"
       (string)
# 4992 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COLON ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv37 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 5003 "parser.ml"
                    ))) * (
# 23 "parser.mly"
       (string)
# 5007 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | BOOLTYPE ->
                        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState67
                    | INTTYPE ->
                        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState67
                    | LANGLE ->
                        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState67
                    | LBRACE ->
                        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState67
                    | LPAREN ->
                        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState67
                    | REFTYPE ->
                        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState67
                    | UNITTYPE ->
                        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState67
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67) : 'freshtv38)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv39 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 5037 "parser.ml"
                    ))) * (
# 23 "parser.mly"
       (string)
# 5041 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)) : 'freshtv42)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv43 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 5052 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)) : 'freshtv46)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv47 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 5063 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)) : 'freshtv50)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)

and _menhir_run73 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 23 "parser.mly"
       (string)
# 5087 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUALS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv29 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 5098 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BEGIN ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | FST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | ID _v ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
            | IF ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | INT _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
            | ISZERO ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | LANGLE ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | LBRACE ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | LET ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | LETREC ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | LPAREN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | NEWREF ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | PAIR ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | PROC ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | SET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | SETREF ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | SND ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | UNPAIR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv30)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv31 * _menhir_state) * (
# 23 "parser.mly"
       (string)
# 5156 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)) : 'freshtv34)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)

and _menhir_run76 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | RBRACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState76 in
        ((let _v : 'tv_loption_separated_nonempty_list_SEMICOLON_field__ = 
# 142 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 5183 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_field__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76

and _menhir_run79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | FST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | ID _v ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | IF ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | INT _v ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | ISZERO ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | LANGLE ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | LBRACE ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | LET ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | LETREC ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | LPAREN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | NEWREF ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | PAIR ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | PROC ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | SET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | SETREF ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | SND ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | UNPAIR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | RANGLE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState79 in
        ((let _v : 'tv_loption_separated_nonempty_list_COMMA_expr__ = 
# 142 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 5246 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv26)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79

and _menhir_run80 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv22)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)

and _menhir_run82 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 5323 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 22 "parser.mly"
       (int)
# 5333 "parser.ml"
    )) : (
# 22 "parser.mly"
       (int)
# 5337 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 157 "parser.mly"
              ( Int i )
# 5342 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv20)

and _menhir_run83 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | FST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | ID _v ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | IF ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | INT _v ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | ISZERO ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | LANGLE ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | LBRACE ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | LET ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | LETREC ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | LPAREN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | NEWREF ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | PAIR ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | PROC ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | SET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | SETREF ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | SND ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | UNPAIR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83

and _menhir_run84 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 5402 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((x : (
# 23 "parser.mly"
       (string)
# 5412 "parser.ml"
    )) : (
# 23 "parser.mly"
       (string)
# 5416 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 158 "parser.mly"
             ( Var x )
# 5421 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv18)

and _menhir_run85 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86) : 'freshtv14)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv10)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BEGIN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | FST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | ID _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
        | IF ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | INT _v ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
        | ISZERO ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | LANGLE ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | LBRACE ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | LET ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | LETREC ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | LPAREN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | NEWREF ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | PAIR ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | PROC ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | SET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | SETREF ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | SND ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | UNPAIR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv6)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv8)

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | FST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | ID _v ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | IF ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | INT _v ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | ISZERO ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | LANGLE ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | LBRACE ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | LET ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | LETREC ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | LPAREN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | NEWREF ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | PAIR ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | PROC ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | SET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | SETREF ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | SND ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | UNPAIR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState91 in
        ((let _v : 'tv_loption_separated_nonempty_list_SEMICOLON_expr__ = 
# 142 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 5678 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 95 "parser.mly"
       (Ast.expr)
# 5701 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | ISZERO ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LANGLE ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LBRACE ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LETREC ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NEWREF ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PAIR ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PROC ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SETREF ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SND ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | UNPAIR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 233 "/home/christianbautista/.opam/system/lib/menhir/standard.mly"
  

# 5770 "parser.ml"

%% Christian Bautista and Ankit Patel
%% I pledge my honor that I have abided by the Stevens Honor System.

-module(bt).
-compile(export_all).

-type btree() :: {empty}
	      |  {node,number(),btree(),btree()}.

-spec t1() -> btree().
t1() ->
    {node,1,
     {node,2,{empty},{empty}},
     {node,3,{empty},{empty}}}.

-spec t2() -> btree().
t2() ->
    {node,4,
     {node,2,{empty},{empty}},
     {node,12,
      {empty},
      {node,7,{empty},{empty}}}}.

-spec t3() -> btree().
t3() ->
    {node,4,
     {node,2,{empty},{empty}},
     {node,12,
      {node,7,{empty},{empty}},
      {empty}}}.

-spec maxbt(btree()) -> number().

maxbt({empty}) ->
    throw(empty_tree);
maxbt({node,D,{empty},{empty}}) ->
    D;
maxbt({node,D,LT,{empty}}) ->
    max(D,maxbt(LT));
maxbt({node,D,{empty},RT}) ->
    max(D,maxbt(RT));
maxbt({node,D,LT,RT}) ->
    max(D,max(maxbt(LT),maxbt(RT))).


-spec minbt(btree()) -> number().

minbt({empty}) ->
    throw(empty_tree);
minbt({node,D,{empty},{empty}}) ->
    D;
minbt({node,D,LT,{empty}}) ->
    min(D,minbt(LT));
minbt({node,D,{empty},RT}) ->
    min(D,minbt(RT));
minbt({node,D,LT,RT}) ->
    min(D,min(maxbt(LT),maxbt(RT))).


-spec isbst(btree()) -> boolean().

isbst({empty}) ->
    throw(empty_tree);
isbst({node,_D,{empty},{empty}}) ->
    true;
isbst({node,D,LT,{empty}}) ->
    (D>maxbt(LT)) and isbst(LT);
isbst({node,D,{empty},RT}) ->
    (D<minbt(RT)) and isbst(RT);
isbst({node,D,LT,RT}) ->
    (D>maxbt(LT)) and isbst(LT) and (D<minbt(RT)) and isbst(RT).
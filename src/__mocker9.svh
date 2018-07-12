`define SVMOCK_MOCKER_CLASS9(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8,MODIFIER=) \
class __``NAME``MODIFIER``__mocker  extends __mocker; \
`PARENT parent; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent); \
  super.new(name, __mockers); \
  parent = _parent; \
endfunction \
`MOCKER_WITH(NAME0, TYPE0, MOD0) \
NAME0``__with __with_0 = new(); \
`MOCKER_WITH(NAME1, TYPE1, MOD1) \
NAME1``__with __with_1 = new(); \
`MOCKER_WITH(NAME2, TYPE2, MOD2) \
NAME2``__with __with_2 = new(); \
`MOCKER_WITH(NAME3, TYPE3, MOD3) \
NAME3``__with __with_3 = new(); \
`MOCKER_WITH(NAME4, TYPE4, MOD4) \
NAME4``__with __with_4 = new(); \
`MOCKER_WITH(NAME5, TYPE5, MOD5) \
NAME5``__with __with_5 = new(); \
`MOCKER_WITH(NAME6, TYPE6, MOD6) \
NAME6``__with __with_6 = new(); \
`MOCKER_WITH(NAME7, TYPE7, MOD7) \
NAME7``__with __with_7 = new(); \
`MOCKER_WITH(NAME8, TYPE8, MOD8) \
NAME8``__with __with_8 = new(); \
function void called(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6,TYPE7 ARG7 MOD7,TYPE8 ARG8 MOD8); \
  timesCnt += 1; \
  __with_0.act = ARG0; \
  __with_1.act = ARG1; \
  __with_2.act = ARG2; \
  __with_3.act = ARG3; \
  __with_4.act = ARG4; \
  __with_5.act = ARG5; \
  __with_6.act = ARG6; \
  __with_7.act = ARG7; \
  __with_8.act = ARG8; \
endfunction \
function void with_args(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6,TYPE7 ARG7 MOD7,TYPE8 ARG8 MOD8); \
  checkWith = 1; \
  __with_0.exp = ARG0; \
  __with_1.exp = ARG1; \
  __with_2.exp = ARG2; \
  __with_3.exp = ARG3; \
  __with_4.exp = ARG4; \
  __with_5.exp = ARG5; \
  __with_6.exp = ARG6; \
  __with_7.exp = ARG7; \
  __with_8.exp = ARG8; \
endfunction \
function bit check(); \
  check = super.check(); \
  check &= (checkWith) ? __with_0.compare() : 1; \
  check &= (checkWith) ? __with_1.compare() : 1; \
  check &= (checkWith) ? __with_2.compare() : 1; \
  check &= (checkWith) ? __with_3.compare() : 1; \
  check &= (checkWith) ? __with_4.compare() : 1; \
  check &= (checkWith) ? __with_5.compare() : 1; \
  check &= (checkWith) ? __with_6.compare() : 1; \
  check &= (checkWith) ? __with_7.compare() : 1; \
  check &= (checkWith) ? __with_8.compare() : 1; \
  return check; \
endfunction \
function void clear(); \
  super.clear; \
  __with_0 = new(); \
  __with_1 = new(); \
  __with_2 = new(); \
  __with_3 = new(); \
  __with_4 = new(); \
  __with_5 = new(); \
  __with_6 = new(); \
  __with_7 = new(); \
  __with_8 = new(); \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS9(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
`SVMOCK_MOCKER_CLASS9(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function RETURNS NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6,TYPE7 ARG7 MOD7,TYPE8 ARG8 MOD8); \
endfunction \
RETURNS returnsVal; \
function void returns(RETURNS r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
__``NAME``__mocker map [string]; \
__``NAME``__mocker override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS9(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
`SVMOCK_MOCKER_CLASS9(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function void NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6,TYPE7 ARG7 MOD7,TYPE8 ARG8 MOD8); \
endfunction \
__``NAME``__mocker map [string]; \
__``NAME``__mocker override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_TASK_MOCKER_CLASS9(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
`SVMOCK_MOCKER_CLASS9(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual task NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6,TYPE7 ARG7 MOD7,TYPE8 ARG8 MOD8); \
endtask \
__``NAME``__mocker map [string]; \
__``NAME``__mocker override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

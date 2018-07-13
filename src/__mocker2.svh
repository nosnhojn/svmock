`define SVMOCK_MOCKER_CLASS2(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,MODIFIER=) \
class __``NAME``MODIFIER``__mocker #(type PARENT=int) extends __mocker; \
PARENT parent; \
function new(string name, ref __mocker __mockers[$], input PARENT _parent); \
  super.new(name, __mockers); \
  parent = _parent; \
endfunction \
`MOCKER_WITH(NAME0, TYPE0, MOD0) \
NAME0``__with __with_0 = new(); \
`MOCKER_WITH(NAME1, TYPE1, MOD1) \
NAME1``__with __with_1 = new(); \
function void called(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
  timesCnt += 1; \
  __with_0.act = ARG0; \
  __with_1.act = ARG1; \
endfunction \
function void with_args(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
  checkWith = 1; \
  __with_0.exp = ARG0; \
  __with_1.exp = ARG1; \
endfunction \
function bit check(); \
  check = super.check(); \
  check &= (checkWith) ? __with_0.compare() : 1; \
  check &= (checkWith) ? __with_1.compare() : 1; \
  return check; \
endfunction \
function void clear(); \
  super.clear; \
  __with_0 = new(); \
  __with_1 = new(); \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS2(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`SVMOCK_MOCKER_CLASS2(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function RETURNS NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
  return NAME; \
endfunction \
RETURNS returnsVal; \
function void returns(RETURNS r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS2(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`SVMOCK_MOCKER_CLASS2(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function void NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
endfunction \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_TASK_MOCKER_CLASS2(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`SVMOCK_MOCKER_CLASS2(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual task NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
endtask \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

def mockers(numargs):
  fout = open('../src/__mocker' + str(numargs) + '.sv', 'w+')
  fout.write ('`define SVMOCK_MOCKER_CLASS%0d(NAME' % numargs)
  for j in range(0,numargs):
    fout.write (',TYPE%0d,ARG%0d,MOD%0d' % (j,j,j))
  fout.write (') \\\n')
  fout.write ('class __``NAME``__mocker  extends __mocker; \\\n')
  fout.write ('function new(string name, ref __mocker __mockers[$]); \\\n')
  fout.write ('  super.new(name, __mockers); \\\n')
  fout.write ('endfunction \\\n')
  for j in range(0,numargs):
    fout.write ('TYPE%0d withAct_%0d MOD%0d, withExp_%0d MOD%0d; \\\n' % (j,j,j,j,j))
  fout.write ('function void Called( \\\n')
  for j in range(0,numargs):
    if (j == numargs-1):
      fout.write ('  TYPE%0d ARG%0d MOD%0d \\\n' % (j,j,j))
    else:
      fout.write ('  TYPE%0d ARG%0d MOD%0d, \\\n' % (j,j,j))
  fout.write ('); \\\n')
  fout.write ('  timesCnt += 1; \\\n')
  for j in range(0,numargs):
    fout.write('  withAct_%0d = ARG%0d; \\\n' % (j,j))
  fout.write ('endfunction \\\n')

  fout.write ('function void With( \\\n')
  for j in range(0,numargs):
    if (j == numargs-1):
      fout.write ('  TYPE%0d ARG%0d MOD%0d \\\n' % (j,j,j))
    else:
      fout.write ('  TYPE%0d ARG%0d MOD%0d, \\\n' % (j,j,j))
  fout.write ('); \\\n')
  fout.write ('  checkWith = 1; \\\n')
  for j in range(0,numargs):
    fout.write ('  withExp_%0d = ARG%0d; \\\n' % (j,j))
  fout.write ('endfunction \\\n')
  fout.write ('function bit check(); \\\n')
  fout.write ('  check = super.check(); \\\n')
  for j in range(0,numargs):
    fout.write ('  check &= (checkWith) ? (withExp_%0d == withAct_%0d)  : 1; \\\n' % (j,j))
  fout.write ('  return check; \\\n')
  fout.write ('endfunction \\\n')
  fout.write ('endclass\n')

def function_macros(numargs, fout, type="NORMAL"):
  if (type == "NORMAL"):
    fout.write ('`define SVMOCK_FUNCTION%0d(NAME, RETURN' % numargs)
  else:
    fout.write ('`define SVMOCK_VOIDFUNCTION%0d(NAME' % numargs)
  for j in range(0,numargs):
    fout.write (',TYPE%0d,ARG%0d,MOD%0d' % (j,j,j))
  fout.write (') \\\n')

  fout.write('`SVMOCK_MOCKER_CLASS%0d(NAME' % numargs)
  for j in range(0,numargs):
    fout.write (',TYPE%0d,ARG%0d,MOD%0d' % (j,j,j))
  fout.write (') \\\n')

  fout.write ('__``NAME``__mocker __``NAME = new("NAME", __mockers); \\\n')
  if (type == "NORMAL"):
    fout.write ('function RETURN NAME(')
  else:
    fout.write ('function NAME(')
  for j in range(0,numargs):
    if (j == numargs-1):
      fout.write ('TYPE%0d ARG%0d MOD%0d' % (j,j,j))
    else:
      fout.write ('TYPE%0d ARG%0d MOD%0d, ' % (j,j,j))
  fout.write ('); \\\n')
  fout.write ('  __``NAME.Called(')
  for j in range(0,numargs):
    if (j == numargs-1):
      fout.write ('ARG%0d' % j)
    else:
      fout.write ('ARG%0d,' % j)
  fout.write ('); \\\n')
  if (type == "NORMAL"):
    fout.write ('  return super.NAME(')
  else:
    fout.write ('  super.NAME(')
  for j in range(0,numargs):
    if (j == numargs-1):
      fout.write ('ARG%0d' % j)
    else:
      fout.write ('ARG%0d,' % j)
  fout.write ('); \\\n')
  fout.write ('endfunction\n\n')

if __name__ == "__main__":
  f_macros = open('../src/svmock_defines.svh', 'w+')
  for i in range(0,10):
    mockers(i)
    function_macros(i, f_macros, "VOID")
    function_macros(i, f_macros)

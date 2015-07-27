#include "erl_nif.h"

#include <stdio.h>
#include <strings.h>
#include <unistd.h>

#define MAXBUFLEN 1024

static ERL_NIF_TERM _test(ErlNifEnv* env, int arc, const ERL_NIF_TERM argv[])
{
  char result[MAXBUFLEN];

  char path[MAXBUFLEN];
  enif_get_string(env, argv[0], path, 1024, ERL_NIF_LATIN1);

  strcpy(result, "Hello World! ");
  strcat(result, path);
  
  return enif_make_string(env, result, ERL_NIF_LATIN1);
}

static ErlNifFunc nif_funcs[] =
{
  {"_test", 1, _test}
};

ERL_NIF_INIT(Elixir.Motiondetection,nif_funcs,NULL,NULL,NULL,NULL)
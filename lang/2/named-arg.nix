args@{ a, b, ... }: a + b + args.c

# also valid => { a, b, ... }@args: a + b + args.c

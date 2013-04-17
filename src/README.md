## How to contribute

To contribute to the table `Telex.txt.in`

1. Edit the file `Telex.txt.in`: edit, remove, fix errors
2. Execute the script `find_missing` to find the missing items.
   Add these missing items to the file `Telext.txt.in`
4. Run the script `find_missing` again to see if thing is good now
5. Sort the file `Telex.txt.in` by using the script `sort`
6. Transfer the last output to `Telex.txt.in`.

Here is a sample session. Please don't blindly copy and execute the
following commands because they may hurt your system.

````
# add some entries to Telex.txt.in

$ ./bin/find_missing.rb < src/Telex.txt.in > src/missings
$ cat src/missings >> ./src/Telex.txt.in

# check the file ./src/missings and repeat the previous steps
$ ./bin/find_missing.rb < src/Telex.txt.in > src/missings
# ...

$ cat ./src/Telex.txt.in \
  | sort -u \
  | ./bin/sort.rb \
  > ./src/Telex.txt.in.tmp

# Please sure that the file `Telex.txt.in.tmp` is good enough ;)
$ mv ./src/Telex.txt.in.tmp ./src/Telex.txt.in
````

## How to test your version

Run the script `scim2uim` to generate the `*.scm` files from `*.in`
and copy the output to `/usr/share/uim`. You need to modify some `uim`
configuration files `loaded.scm` and/or `install-modules.scm` if needed.

You also need to kill all current `uim` proccesses and to restart your
applications to see new effects of your `uim` updates.
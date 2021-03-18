# bookmarksman

bookmarksman is a bookmark manager written in POSIX shell using jq and dmenu.
It separates bookmarks in sections, making it easy to organize your bookmarks.

You are not limited to only storing websites. Since bookmarksman only outputs
the saved string related to a bookmark, it can integrate with any program as you
wish.

## Usage

### Saving a bookmark:

```sh
~ $ bookmarksman add 'suckless.org' # a dmenu prompt will apear asking for
                                    # title/section of the bookmark
```

### Outputting a bookmark

```sh
~ $ bookmarksman open # dmenu will ask for the section/title, and output the
                      # bookmark to stdout
```

### Deleting a bookmark

```sh
~ $ bookmarksman del # dmenu will ask for the section/title, and delete it
```

It's possible to pass a window xid as the last argument, to embed dmenu on that
xid.

### Example one-liners

```sh
~ $ bookmarksman open | xargs -r firefox # will open bookmark inside firefox
# Or another version that handles links or file paths
~ $ bookmarksman open | xargs -r xdg-open # will open bookmark with xdg-open
```

### Using it on [vimb](https://fanglingsu.github.io/vimb/)

I made this script primarily to use it with vimb.

```
nnoremap ba :sh! /bin/sh -c 'bookmarksman add "$VIMB_URI" "$VIMB_WIN_ID"'<CR>
nnoremap bo :sh! /bin/sh -c 'bookmarksman open "$VIMB_WIN_ID" | xargs -r vimb -e "$VIMB_XID"'<CR>
```

With that you can type `ba` to add the current page to the bookmarks, or `bo` to
open the bookmark menu, and if you have the latest vimb from the repos, dmenu
will be embedded to the vimb window.

## Installing

clone and cd into the directory

```sh
~ $ git clone https://github.com/toniz4/bookmarksman
~ $ cd bookmarksman 
```

Install system wide:

```sh
~ # make install
```

Or if you want to install as normal user:

```sh
~ $ make install PREFIX="" DESTDIR=~/.local
```

That will install bookmarksman to ~/.local/bin, you may need to add that
directory to your PATH.

You can just copy it too.

```sh
~ $ cp bookmarksman ~/.local/bin
```

## Dependences

- [jq](https://stedolan.github.io/jq/) (for manipulating the bookmark file)
- [dmenu](https://tools.suckless.org/dmenu/) (for the menu)
- any POSIX compatible shell (bash, ash, ksh, dash, etc...)
- any coreutils implementation

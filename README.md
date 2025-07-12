# Bloop Box Data Example

This project provides unique data for the bloop-box package. This is not meant
for general distribution but rather as an example project which you should fork
to get your own static audio files into the system.

## Forking steps

1. Fork this project, either to another GitHub account or your private git
   repository.
2. Replace all occurrences of `bloop-box-data-example` in the `debian` folder
   with your own package name in all files and their file names.
3. Remember to update the `debian/.gitignore` file with the changed names
   as well.
4. Update the `Maintainer` in the `debian/control` file.

Remember to keep the `Provides: bloop-box-data` in the `debian/control` file, as
this is what the `bloop-box` package depends on.

## Creating your own audio files

Now that you forked the project, it is time to replace the sample data with your
own audio files. You are free to keep the existing files, but you might want to
at least have your own bloop audio files.

All audio files are mono MP3s, as the bloop box only has a single speaker. This
also keeps the file size low.

This is the directory structure you must follow in order for this project to be
compatible (within the `share` folder):

| File                | Description                                           |
|---------------------|-------------------------------------------------------|
| `error.mp3`         | Played whenever an invalid NFC tag was scanned        |
| `throttle.mp3`      | Played when the server throttles the user             |
| `volume-change.mp3` | Played when the volume is changed                     |
| `awards/*.mp3`      | Randomly played when the user received an achievement |
| `bloops/*.mp3`      | Randomly played when an NFC tag is detected           |

### Weighted random select

As of Bloop Box 3.1.0 you are able to assign weights to each of the randomly selected audio files. By default they have
a weight of 100 and you can modify the weight by specifying it in the filename in the following format:

```
filename.[w=100].mp3
```

A weight can be any integer or float, which is equal or greater than 0. Thus, if you have three files, with one file set
to a weight of 50 and the other left at the default weight, the first file will have a probability of 20% while the
remaining two have a probability of 40% each.

## Building the deb

Once you are happy with the audio files, it is time to build a deb package to be
put on your bloop box.

To do so, run `debuild` in your main project folder:

```bash
debuild -us -uc -- binary-indep
```

This will generate a `.deb` file in the parent folder. Now simply ssh into your
bloop box and install the package via `dpkg -i your-package-name.deb`. After
that you can install the `bloop-box` package.

## Updating the deb

When you later want to update the deb (by exchanging audio files), it's best to
increase the minor version number. This is best done via the `dch` command:

```bash
dch -v <version> --create
```

This example project starts with version `1.0`. So your next version should be
`1.1` and so on. Do not increase the major version number.


# Bloop Box Data Example

This project provides unique data for the bloop-box package. This is not meant
for general distribution but rather as an example project which you should fork
to get your own static audio files into the system.

## Forking steps

1. Fork this project, either to another GitHub account or your private git
   repository.
2. Replace all occurences of `bloop-box-data-example` in the `debian` folder
   with your own package name in all files and their file names.
4. Don't forget to update the `debian/.gitignore` file with the changed names
   as well.
3. Update the `Maintainer` in the `debian/control` file.

Remember to keep the `Provides: bloop-box-data` in the `debian/control` file, as
this is what the `bloop-box` package depends on.

## Creating your own audio files

Now that you forked the project, it is time to replace the sample data with your
own audio files. You are free to keep the existing files, but you might want to
at least have your own bloop audio files.

All audio files are mono MP3s, as the bloop box only has a single speaker. This
also keeps file size low.

This is the directory structure you must follow in order for this project to be
compatible (within the `share` folder):

| File                | Description                                           |
| ------------------- | ----------------------------------------------------- |
| `error.mp3`         | Played whenever an invalid NFC tag was scanned        |
| `throttle.mp3`      | Played when the server throttles the user             |
| `volume-change.mp3` | Played when the volume is changed.                    |
| `achievement/*.mp3` | Randomly played when the user received an achievement |
| `bloop/*.mp3`       | Randomly played when an NFC tag is detected           |

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
`1.1` and so on. Do not increment the major version number.


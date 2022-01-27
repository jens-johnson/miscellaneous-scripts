# Shell Scripts

## [`generateFiles.sh`](generateFiles.sh)

Contains two functions I keep in my bash profile for generating random files for testing purposes.

*Note:* This script relies on `numft` for creating readable file sizes (provided in GNU `coreutils`).

### `generateFile`

#### Usage
```shell
$ generateFile size fileName
```

Where:
- `size`: size of the outputted file in B (optional, default `5000000`)
- `fileName`: output path/filename of the generated file (optional, default `./file.txt`)

#### Example
```shell
$ generateFile 500000 /Users/foo/Desktop/foo.txt
Result:
  |489KiB| /Users/foo/Desktop/foo.txt
```

### `generateFiles`

#### Usage
```shell
$ generateFiles numFiles outputDirectory byteSizeLimit
```

Where:
- `numFiles`: the number of files to be generated (optional, default '5')
- `outputDirectory`: output destination for generated files (optional, default `./`)
- `byteSizeLimit`: byte size upper limit for random file sizes (optional, default `625000`)

#### Example
```shell
$ Desktop % generateFiles 3 ~/Desktop/ 400000 
Generating 3 random files between 0B – 391KiB
Results:
  |7.4KiB| /Users/JJo175/Desktop/file1.c3d
  |13KiB| /Users/JJo175/Desktop/file2
  |13KiB| /Users/JJo175/Desktop/file3.c3d
```
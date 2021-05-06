def FlagsForFile(filename, **kwargs):
    # Default flags
    flags = [
        '-Wall',
        '-Wextra',
        '-Werror',
        '-pedantic',
        '-I',
        '.',
        '-isystem',
        '/usr/include',
        '-isystem',
        '/usr/local/include',
        '-isystem',
        '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1',
        '-isystem',
        '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
    ]

    # Get file type
    data = kwargs['client_data']
    filetype = data['&filetype']

    # Add additional flags
    if filetype == 'c':
        flags += ['-xc']
    elif filetype == 'cpp':
        flags += ['-xc++']
        flags += ['-std=c++11']
    elif filetype == 'objc':
        flags += ['-ObjC']
    else:
        flags = []

    return {
        'flags': flags,
        'do_cache': True
    }

#! /usr/bin/env python3
"""
Update translation strings to match base.

Removed strings are commented out and moved to the end of the file.
"""

"""
This script is inspired by msgmerge, a tool for merging PO files, used by GNU gettext.

Created by Morgan Antonsson <morgan.antonsson@gmail.com> 2025.
"""
import argparse
import glob
import os
import re
import sys


def read_strings(filename):
    pattern = re.compile(
        r'"(?P<key>(?:[^"]|\\")*)"\s*=\s*"(?P<value>(?:[^"]|\\")*)"\s*;|(?P<comment>/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*")|(?P<empty_line>\n\n)',
        re.DOTALL | re.MULTILINE
    )

    with open(filename, 'r') as file:
        contents = file.read()

        return [m.groupdict() for m in pattern.finditer(contents)]


def update_strings(base, translation):
    result = []

    for element in base:
        if element['key']:
            found = False

            for i in range(len(translation)):
                translated_element = translation[i]

                if translated_element['key'] and translated_element['key'] == element['key']:
                    result.append(translated_element)
                    translation.pop(i)
                    found = True
                    break

            if not found:
                result.append(
                    {
                        'key':        element['key'],
                        'value':      "",
                        'comment':    None,
                        'empty_line': None
                    }
                )
        elif element['comment']:
            result.append(element)
        elif element['empty_line']:
            result.append(element)

    # Append removed strings as comments
    for element in translation:
        if element['key']:
            result.append(
                {
                    'key':        None,
                    'value':      None,
                    'comment':    '/* "%s" = "%s" */' % (element['key'], element['value']),
                    'empty_line': None
                }
            )

    if result[0]['comment'] and translation[0]['comment']:
        # Preserve the top comment, which may contain translator information
        result[0] = translation[0]

    # Preserve the bottom comments, which may contain removed strings
    bottom_comments = []

    for element in reversed(translation):
        if element['comment']:
            bottom_comments.append(element)
        else:
            break

    return result + bottom_comments[::-1]


def write_strings(strings, filename):
    with open(filename, 'w') as file:
        for element in strings:
            if element['key']:
                file.write('"%s" = "%s";\n' % (element['key'], element['value']))
            elif element['comment']:
                file.write(element['comment'] + '\n')
            elif element['empty_line']:
                file.write('\n')


def update_file(base_file, translation_file):
    base = read_strings(base_file)
    translation = read_strings(translation_file)
    updated_translation = update_strings(base, translation)

    write_strings(updated_translation, translation_file)

    print('Updated: %s' % (os.sep.join(translation_file.split(os.sep)[-2:])))


def update_translation(locale):
    repo_dir = os.path.dirname(os.path.realpath(__file__))
    base_dir = os.path.join(repo_dir, 'Base.lproj')
    translation_dir = os.path.join(repo_dir, '%s.lproj' % locale)

    if not os.path.isdir(translation_dir):
        print(
            "%s: Translation directory does not exist: %s" % (os.path.basename(__file__), translation_dir),
            file=sys.stderr
        )
        sys.exit(1)

    files = [os.path.basename(f) for f in glob.glob(os.path.join(base_dir, "*.strings"))]

    for file in files:
        try:
            update_file(os.path.join(base_dir, file), os.path.join(translation_dir, file))
        except IOError as e:
            print(
                "%s: %s: %s" % (os.path.basename(__file__), e.filename, e.strerror),
                file=sys.stderr
            )
            sys.exit(1)


def main():
    parser = argparse.ArgumentParser(description=__doc__)

    parser.add_argument("locale", metavar="LOCALE", help="locale identifier (e.g. es-ES)")

    args = parser.parse_args()

    update_translation(args.locale)


if __name__ == "__main__":
    main()

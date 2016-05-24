import sys
import os
import json

def find_suitable_file(fname, test_suitability, fallback):
    if test_suitability(fname):
        return fname

    noext_name, extension = os.path.splitext(fname)
    basename = os.path.basename(noext_name)

    if extension == ".hpp":
        test_name = noext_name + ".cpp"

        if test_suitability(test_name):
            return test_name

    elif extension == ".h":
        test_name = noext_name + ".c"

        if test_suitability(test_name):
            return test_name

        test_name = noext_name + ".cpp"

        if test_suitability(test_name):
            return test_name

    test_name = fallback(fname)

    if test_suitability(test_name):
        return test_name

    return None

def main(compile_commands, filename):
    filename = os.path.realpath(filename)
    command = None
    main_file = None

    with open(compile_commands) as pointer:
        comp_db = json.load(pointer)

    basename, extension = os.path.splitext(filename)
    is_header = extension == ".h" or extension == ".hpp"

    for comp_info in comp_db:
        comp_filename = os.path.realpath(comp_info["file"])

        if comp_filename == filename:
            command = comp_info["command"]
            break

        comp_basename, _ = os.path.splitext(comp_filename)

        if main_file is None:
            comp_baseonly = os.path.basename(comp_basename)

            if comp_baseonly == "main":
                main_file = comp_filename
                main_command = comp_info["command"]

        if is_header:
            if comp_basename == basename:
                command = comp_info["command"].replace(comp_info["file"],
                                                       filename)
                break

    if command is None:
        command = "" if main_command is None else main_command
        command = command.replace(main_file, filename)

    print(command)

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])

#/usr/bin/python

# ---------------------------------------------------------------------- IMPORTS

# standard imports
import sys


# ------------------------------------------------------------------------- CODE

def read_file_line_range(filepath, first_line_number, last_line_number):
    """ Read range of line in a given file

    @param <filepath> is the file's path to read from
    @param <first_line_number> is the first line number of the range to read
    @param <last_line_number> is the last line number of the range to read
    """
    assert last_line_number > first_line_number

    # open file
    with open(filepath) as file_stream:
        line_id = 1
        lines_map = dict()

        # skeep first lines
        while line_id < first_line_number:
            if file_stream.readline() == '':
                return lines_map

            line_id += 1

        # extract selected lines
        while line_id <= last_line_number:
            line = file_stream.readline()

            if line == '':
                break

            lines_map[line_id] = line
            line_id += 1

        return lines_map

    raise AttributeError()

def traceback(
        file_line_bounds_size=2,
        line_break_count=1,
        whole_frame=False
    ):
    """ Returns an exception traceback
    """
    except_type, except_value, except_traceback = sys.exc_info()

    traceback_code = ''

    # far all frames
    i = except_traceback
    frame_depth = 0

    while i:
        # gather frame infos
        function_filepath = i.tb_frame.f_code.co_filename
        function_name = i.tb_frame.f_code.co_name
        function_line_number = i.tb_frame.f_code.co_firstlineno
        except_line_number = i.tb_lineno

        first_line_number = except_line_number - file_line_bounds_size

        if whole_frame and frame_depth != 0:
            first_line_number = function_line_number

        file_lines_map = read_file_line_range(
            function_filepath,
            except_line_number - file_line_bounds_size,
            except_line_number + file_line_bounds_size
            )

        # print lines headers
        frame_code = '#{frame_depth} in {function_name}'\
            '({function_filepath}:{except_line_number})\n'.format(
                frame_depth=frame_depth,
                function_filepath=function_filepath,
                function_name=function_name,
                function_line_number=function_line_number,
                except_line_number=except_line_number
            )

        # print lines
        files_line_numbers = file_lines_map.keys()
        files_line_numbers.sort()

        for lineno in files_line_numbers:
            if lineno == except_line_number:
                frame_code += ' > |'
            else:
                frame_code += '   |'

            frame_code += file_lines_map[lineno]

        traceback_code += frame_code + '\n' * line_break_count

        frame_depth += 1
        i = i.tb_next

    # add exception type and value
    traceback_code += '{}: {}'.format(except_type.__name__, str(except_value))

    return traceback_code


# ------------------------------------------------------------------ USE EXAMPLE

def function_b(my_parameter):
    my_var = 3
    assert False, "assertion failure"
    return my_parameter, my_var

def function_a(my_parameter):
    my_var = 2
    return function_b(my_parameter), my_var


if __name__ == '__main__':
    try:
        function_a(1)

    except Exception:
        print traceback()

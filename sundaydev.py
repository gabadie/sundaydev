#/usr/bin/python

""" Sunday dev python kit

The sunday dev python kit is a module having some handfull tips for easier dev.


Traceback and die uses:
    import sundaydev

    if __name__ == '__main__':
        try:
            my_main()

        except:
            sundaydev.traceback_and_die()
"""

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

    def traceback_frame_code(frame, frame_depth):
        """ Gets a traceback's frame code
        """
        # gather frame infos
        function_filepath = frame.tb_frame.f_code.co_filename
        function_name = frame.tb_frame.f_code.co_name
        function_line_number = frame.tb_frame.f_code.co_firstlineno
        except_line_number = frame.tb_lineno

        first_line_number = except_line_number - file_line_bounds_size

        if whole_frame and frame_depth != 0:
            first_line_number = function_line_number

        file_lines_map = read_file_line_range(
            function_filepath,
            first_line_number,
            except_line_number + file_line_bounds_size
            )

        # print lines headers
        frame_code = '#{frame_depth} in {function_name}'\
            '({function_filepath}:{except_line_number})\n'.format(
                frame_depth=frame_depth,
                function_filepath=function_filepath,
                function_name=function_name,
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

        return frame_code + '\n' * line_break_count

    except_type, except_value, except_traceback = sys.exc_info()

    traceback_code = ''

    # far all frames
    i = except_traceback
    frame_depth = 0

    while i:
        traceback_code += traceback_frame_code(i, frame_depth)
        frame_depth += 1
        i = i.tb_next

    # add exception type and value
    traceback_code += '{}: {}'.format(except_type.__name__, str(except_value))

    return traceback_code

def traceback_and_die(**kwargs):
    """ Prints traceback() and exit the process
    """
    print traceback(**kwargs)

    sys.exit(1)

def caller_file(parent_depth=0):
    """ Returns a parent frame's file path
    """
    # pylint: disable=W0212
    return sys._getframe(parent_depth + 1).f_code.co_filename

def caller_line(parent_depth=0):
    """ Returns a parent frame's line in path
    """
    # pylint: disable=W0212
    return sys._getframe(parent_depth + 1).f_lineno

def caller_function_name(parent_depth=0):
    """ Returns a parent frame's function name
    """
    # pylint: disable=W0212
    return sys._getframe(parent_depth + 1).f_code.co_name

def caller_location(parent_depth=0):
    """ Returns a file location (<file>:<line>)
    """
    # pylint: disable=W0212
    frame = sys._getframe(parent_depth + 1)
    return '{}:{}'.format(frame.f_code.co_filename, frame.f_lineno)

#/usr/bin/python

""" Tests syndaydev.py
"""

# ---------------------------------------------------------------------- IMPORTS

# standard imports
import os

# local imports
import sundaydev


# ------------------------------------------------------------------ TESTS UTILS

def function_b(my_parameter):
    my_var = 3
    assert False, "assertion failure"
    return my_parameter, my_var

def function_a(my_parameter):
    my_var = 2
    return function_b(my_parameter), my_var

def traceback_util_test(**kwargs):
    try:
        sundaydev.function_a(1)

        assert False, "unable to repro test case"

    except:
        sundaydev.traceback()

        assert True


# ------------------------------------------------------------------------ TESTS

def test_traceback():
    traceback_util_test()

def test_traceback_whole_frame():
    traceback_util_test(
            whole_frame=True
        )

def test_file():
    assert os.path.abspath(sundaydev.caller_file()) == os.path.abspath(__file__)

def test_line():
    assert sundaydev.caller_line() == 52

def test_function_name():
    assert sundaydev.caller_function_name() == 'test_function_name'

def test_file_location():
    sundaydev.caller_location()
    assert True

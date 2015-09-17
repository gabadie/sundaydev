#/usr/bin/python

""" Tests syndaydev.py
"""

# ---------------------------------------------------------------------- IMPORTS

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

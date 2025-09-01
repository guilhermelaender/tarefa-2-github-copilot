import pytest
from main import *

def test_main_runs_without_error():
    # Assuming main.py has a main() function
    try:
        main()
    except Exception as e:
        pytest.fail(f"main() raised an exception: {e}")

# Add more specific tests here if you provide functions/classes from main.py
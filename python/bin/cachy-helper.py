#!/usr/bin/env python3
import sys
import os

# Add src to path for internal imports
sys.path.append(os.path.join(os.path.dirname(__file__), "../src"))

from cachy_utils import get_cachy_info

if __name__ == "__main__":
    print(get_cachy_info())

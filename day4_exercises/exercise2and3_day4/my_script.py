from pathlib import Path
import sys

Path(sys.argv[1]).write_text("Hi!")
Path(sys.argv[2]).write_text("Bye!")
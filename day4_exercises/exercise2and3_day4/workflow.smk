rule say_hello:
    run:
        print("Hello!")

rule say_bye:
    run:
        print("Goodbye!")

rule run_smoke:
    script:
        "scripts/smoke_test.py"

rule run_notebook:
    shell:
        "py -m papermill notebooks/input_notebook.ipynb logs/output_notebook.ipynb"
rule all:
    input:
        "data/hi_name.txt",
        "data/analysis_result.txt"


rule say_hi:
    output:
        "data/hi.txt"
    run:
        from pathlib import Path
        path = Path(output[0])
        path.write_text("Hello")

rule add_name:
    input:
        "data/hi.txt"
    output:
        "data/hi_name.txt"
    run:
        from pathlib import Path
        input_path = Path(input[0])
        current_text = input_path.read_text()
        output_path = Path(output[0])
        output_path.write_text(current_text + ", World!")


rule complex_analysis:
    input:
        "data/hi_name.txt"
    output:
        "data/analysis_result.txt"
    params:
        threshold = 0.05
    log:
        "logs/clean.log"
    benchmark:
        "benchmarks/clean.tsv"
    message:
        "Analyzing the dataset with threshold {params.threshold}..."
    run:
        from pathlib import Path
        
        with open(log[0], "w") as log_file:
            log_file.write(f"Process started. Threshold set to {params.threshold}\n")
            
        input_data = Path(input[0]).read_text()
        output_path = Path(output[0])
        output_path.write_text(f"Analysis Finished!\nInput was: {input_data}\nUsed threshold: {params.threshold}")








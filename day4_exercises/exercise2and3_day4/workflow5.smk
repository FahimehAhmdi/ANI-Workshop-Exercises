rule all:
    input:
        "results/excited/Ada.txt",
        "results/excited/Grace.txt",
        "results/excited/Linus.txt"

rule write_name:
    output:
        "data/names/{person}.txt"
    run:
        from pathlib import Path
        path = Path(output[0])
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(wildcards.person)

rule write_greeting:
    input:
        "data/names/{person}.txt"
    output:
        "results/greetings/{person}.txt"
    run:
        from pathlib import Path
        name = Path(input[0]).read_text().strip()
        path_out = Path(output[0])
        path_out.parent.mkdir(parents=True, exist_ok=True)
        path_out.write_text(f"Hello, {name}!\n")

rule write_excited_greeting:
    input:
        "results/greetings/{person}.txt"
    output:
        "results/excited/{person}.txt"
    run:
        from pathlib import Path
        text = Path(input[0]).read_text().strip()
        path_out = Path(output[0])
        path_out.parent.mkdir(parents=True, exist_ok=True)
        path_out.write_text(f"{text}!!!\n")
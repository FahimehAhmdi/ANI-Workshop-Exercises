
rule all:
    input:
        "data/greetings/Ada.txt",
        "data/greetings/Grace.txt",
        "data/greetings/Linus.txt",
        "data/greetings/Rocky.txt"


rule write_greeting:
    output:
        "data/greetings/{person}.txt"
    run:
        from pathlib import Path

        path = Path(output[0])
        path.parent.mkdir(parents=True, exist_ok=True)
        
        path.write_text(f"Hello, {wildcards.person}!\n")
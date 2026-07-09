PEOPLE, = glob_wildcards("data/names/{person}.txt")
LANGUAGES = ["english", "spanish", "french"]

rule all:
    input:
        expand("results/greetings/{language}/{person}.txt", language=LANGUAGES, person=PEOPLE)

rule write_greeting:
    output:
        "results/greetings/{language}/{person}.txt"
    run:
        from pathlib import Path

        path = Path(output[0])
        path.parent.mkdir(parents=True, exist_ok=True)
        
        if wildcards.language == "english":
            greeting = "Hello"
        elif wildcards.language == "spanish":
            greeting = "Hola"
        elif wildcards.language == "french":
            greeting = "Bonjour"
        else:
            greeting = "Hi"

        path.write_text(f"{greeting}, {wildcards.person}!\n")
rule smoke_test:
    output:
        'data/smoke.txt'
    run:
        from pathlib import Path
        path = Path('data/smoke.txt')
        path.write_text('The code was run successfully.')


rule write_greeting:
    output:
        "data/hello.txt"
    run:
        from pathlib import Path
        path = Path("data/wrong_hello.txt")  
        path.write_text("Hi!")




rule write_multiple_greetings:
    output:
        "data/hello.txt",
        "data/bye.txt"
    run:
        from pathlib import Path
        
        
        path_hello = Path("data/hello.txt")
        path_hello.write_text("Hi!")
        
        
        path_bye = Path("data/bye.txt")
        path_bye.write_text("Goodbye!")

rule write_greetings_dynamic:
    output:
        "data/hello.txt",
        "data/bye.txt"
    run:
        from pathlib import Path
        
        path_hello = Path(output[0])
        path_hello.write_text("Hi!")
        
        path_bye = Path(output[1])
        path_bye.write_text("Goodbye!")


rule write_greetings_by_keyword:
    output:
        hi = "data/hello.txt",
        bye = "data/bye.txt"
    run:
        from pathlib import Path
        
        
        path_hello = Path(output["hi"])
        path_hello.write_text("Hi!")
        
       
        path_bye = Path(output["bye"])
        path_bye.write_text("Goodbye!")


rule write_greetings_shell:
    output:
        "data/hello.txt",
        "data/bye.txt"
    shell:
        "py my_script.py {output[0]} {output[1]}"
# # Script Assignment

This assignment involves creating a script that searches for a specified word in a text file, replaces it with another word, and logs the operation.

## Instructions

1. **Create Directories and Files:**
    - Create a directory named `script-1` inside the `/tmp` folder.
    - Inside the `script-1` folder, create the following files:
        - `test-1.txt`
        - `test-2.log`
        - `test.sh`

2. **Populate `test-1.txt`:**
    - Add at least 2 sentences of text into the `test-1.txt` file.

3. **Write the Script:**
    - In the `test.sh` file, write a script that:
        - Searches for a specified word in the `test-1.txt` file. This word will be the first input argument to the script.
        - Replaces the found word with another word specified as the second input argument to the script.
        - If the word is successfully replaced:
            - Displays the current content of `test-1.txt` on the screen.
        - If the word is not found:
            - Displays "FAILED" on the screen.
            - Logs the date and time and the message "The searched word `<SEARCH_WORD>` was not found" in the `test-2.log` file.

4. **Script Execution:**
    - In the shell you have to execute the script in this format: 

    ```bash
        ./test.sh <SEARCH_WORD> <CHANGE_WORD>  
    ```
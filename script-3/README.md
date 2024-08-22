1. **Install `jq`**  
   Install `jq` from the official site: [https://jqlang.github.io/jq/download/](https://jqlang.github.io/jq/download/).

2. **Create Directory Structure**  
   In `/tmp`, create the following directory structure: `/tmp/script-3/`. Inside this directory, create two subdirectories: `inputs` and `outputs`.  

3. **Generate JSON Data**  
   Use the [JSON Generator tool](https://json-generator.com/) to generate a JSON array. Copy the generated JSON into the file `/tmp/script-3/inputs/inputs.json`.

4. **Create Scripts**  
   In the `/tmp/script-3` directory, create three scripts. All scripts should use the file `/tmp/script-3/inputs/inputs.json` as input and output JSON arrays into the `/tmp/script-3/outputs/` directory.

   - **jq_limit_output_simple.sh**  
     - Parse the first 10 entries from `inputs.json`. Extract only the fields `name`, `age`, `address`, and `email`.
     - Save the output to `/tmp/script-3/outputs/simple.json` using native `jq` functionality.
   
   - **jq_limit_output_loop.sh**  
     - Parse entries 11 through 20 from `inputs.json`. Extract only the fields `name`, `age`, `address`, and `email`.
     - Save the output to `/tmp/script-3/outputs/loop.json`. Use a `while` or `for` loop to achieve this.
   
   - **jq_limit_output_condition.sh**  
     - Parse entries from `inputs.json` where the `name` starts with a specific letter (choose one that occurs more than once). Extract only the fields `name`, `age`, `address`, and `email`.
     - Save the output to `/tmp/script-3/outputs/condition.json`.

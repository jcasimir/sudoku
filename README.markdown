## Sudoku Solver

On Saturday, April 20th 2013, I participated in a NAAAP "Day in the Field" workshop at the Colorado School of Mines. In this session I worked with two students and one other mentor to demonstrate and practice test-driven development in Ruby. These are the results.

### From the Command Line

* Create a plain-text file with the Sudoku problem to be solved
* Use periods for each blank to be determined
* For an example, see `samples/problem_1`

Then, from the project's root directory, run the following:

```bash
ruby ./lib/sudoku/runner.rb your_problem_file
```

Where `your_problem_file` is the path/filename of your input problem. For instance, to run the `problem_1` example:

```
ruby ./lib/sudoku/runner.rb ./samples/problem_1
```

### From Ruby

You can also use the library from your own Ruby program or IRB session:

```ruby
require './lib/sudoku'
board = Sudoku::Parser('your_problem_path/problem_filename')
board.solve
Sudoku::Printer.print(board)
```

### License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
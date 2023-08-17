Random.self_init ()

let usage_msg = "dtest -max-number <max-number>"
let max_num = ref 0
let anon_fun _ = ()
let speclist = [ ("-max-number", Arg.Set_int max_num, "Maximum number for guessing.") ]

let () =
  Arg.parse speclist anon_fun usage_msg;
  let quit_loop = ref false in
  let max_number = !max_num in
  let my_number = Random.int max_number in

  Printf.printf "I have chosen a number between [0; %d]. Can you guess it?\n" max_number;

  while not !quit_loop do
    print_string "Enter a guess: ";
    let guess = read_line () in

    let guess_number = int_of_string guess in
    if guess_number = my_number then (
      Printf.printf "Correct: %d!\n" my_number;
      quit_loop := true)
    else if guess_number < my_number then print_string "Guess too low!\n"
    else print_string "Guess too high!\n"
  done

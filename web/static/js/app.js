// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html";

const peter = {
  name: "Peter",
  quote: "Hervé Claude, Jean-Claude Narcy, faites place, ténors du journalisme, j’arrive",
  ascii: " ________   _______   _________   _______    ________     \n|   __   |  ___  |___   ___|  ___   |   __      \n   |  \\    __/||___   _|    __/|    |     \n     ____\\   _|/__           _|/__    _  _  \n     ___|    _|            _| \\   \\  | \n    __      _______    __   _______\\ __\\ _ \n    |__|      |_______|    |__|   |_______| |__||__|\n                                                          \n                                                          \n                                                          ",
};



const makePeterSayHello = () => {
  console.log(`%c
#
#  PPPPPPPPPPPPPPPPP                              tttt
#  P::::::::::::::::P                          ttt:::t
#  P::::::PPPPPP:::::P                         t:::::t
#  PP:::::P     P:::::P                        t:::::t
#    P::::P     P:::::P  eeeeeeeeeeee    ttttttt:::::ttttttt        eeeeeeeeeeee    rrrrr   rrrrrrrrr
#    P::::P     P:::::Pee::::::::::::ee  t:::::::::::::::::t      ee::::::::::::ee  r::::rrr:::::::::r
#    P::::PPPPPP:::::Pe::::::eeeee:::::eet:::::::::::::::::t     e::::::eeeee:::::eer:::::::::::::::::r
#    P:::::::::::::PPe::::::e     e:::::etttttt:::::::tttttt    e::::::e     e:::::err::::::rrrrr::::::r
#    P::::PPPPPPPPP  e:::::::eeeee::::::e      t:::::t          e:::::::eeeee::::::e r:::::r     r:::::r
#    P::::P          e:::::::::::::::::e       t:::::t          e:::::::::::::::::e  r:::::r     rrrrrrr
#    P::::P          e::::::eeeeeeeeeee        t:::::t          e::::::eeeeeeeeeee   r:::::r
#    P::::P          e:::::::e                 t:::::t    tttttte:::::::e            r:::::r
#  PP::::::PP        e::::::::e                t::::::tttt:::::te::::::::e           r:::::r
#  P::::::::P         e::::::::eeeeeeee        tt::::::::::::::t e::::::::eeeeeeee   r:::::r
#  P::::::::P          ee:::::::::::::e          tt:::::::::::tt  ee:::::::::::::e   r:::::r
#  PPPPPPPPPP            eeeeeeeeeeeeee            ttttttttttt      eeeeeeeeeeeeee   rrrrrrr
#
`, 'text-align: left;');

  console.log(`%c "Hervé Claude, Jean-Claude Narcy,
  faites place, ténors du journalisme,
  j’arrive" - Peter (Pétère)`, 'color: #313131; font-style: italic;');
};

makePeterSayHello();

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

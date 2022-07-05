{"cells":[{"source":"<a href=\"https://www.kaggle.com/code/azizaafrin/nlp-fundamental?scriptVersionId=100058325\" target=\"_blank\"><img align=\"left\" alt=\"Kaggle\" title=\"Open in Kaggle\" src=\"https://kaggle.com/static/images/open-in-kaggle.svg\"></a>","metadata":{},"cell_type":"markdown","outputs":[],"execution_count":0},{"cell_type":"code","execution_count":1,"id":"d33738c1","metadata":{"_execution_state":"idle","_uuid":"051d70d956493feee0c6d64651c6a088724dca2a","execution":{"iopub.execute_input":"2022-07-05T06:43:33.957532Z","iopub.status.busy":"2022-07-05T06:43:33.954796Z","iopub.status.idle":"2022-07-05T06:43:34.092668Z","shell.execute_reply":"2022-07-05T06:43:34.090819Z"},"papermill":{"duration":0.146688,"end_time":"2022-07-05T06:43:34.095256","exception":false,"start_time":"2022-07-05T06:43:33.948568","status":"completed"},"tags":[]},"outputs":[],"source":["words<-c(\"DW-40\", \"Mike's 0il\",\"5w30\", \"Joe's Gas\",\"Unleaded\",\"Plus-89\")\n"]},{"cell_type":"code","execution_count":2,"id":"8b20e80c","metadata":{"execution":{"iopub.execute_input":"2022-07-05T06:43:34.134721Z","iopub.status.busy":"2022-07-05T06:43:34.102327Z","iopub.status.idle":"2022-07-05T06:43:34.156409Z","shell.execute_reply":"2022-07-05T06:43:34.154635Z"},"papermill":{"duration":0.06094,"end_time":"2022-07-05T06:43:34.158994","exception":false,"start_time":"2022-07-05T06:43:34.098054","status":"completed"},"tags":[]},"outputs":[{"data":{"text/html":["<style>\n",".list-inline {list-style: none; margin:0; padding: 0}\n",".list-inline>li {display: inline-block}\n",".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n","</style>\n","<ol class=list-inline><li>1</li><li>2</li><li>3</li><li>6</li></ol>\n"],"text/latex":["\\begin{enumerate*}\n","\\item 1\n","\\item 2\n","\\item 3\n","\\item 6\n","\\end{enumerate*}\n"],"text/markdown":["1. 1\n","2. 2\n","3. 3\n","4. 6\n","\n","\n"],"text/plain":["[1] 1 2 3 6"]},"metadata":{},"output_type":"display_data"}],"source":["#Findind digits\n","grep(\"\\\\d\",words)"]},{"cell_type":"code","execution_count":3,"id":"15b1a04b","metadata":{"execution":{"iopub.execute_input":"2022-07-05T06:43:34.16702Z","iopub.status.busy":"2022-07-05T06:43:34.165506Z","iopub.status.idle":"2022-07-05T06:43:34.183096Z","shell.execute_reply":"2022-07-05T06:43:34.181076Z"},"papermill":{"duration":0.023838,"end_time":"2022-07-05T06:43:34.185433","exception":false,"start_time":"2022-07-05T06:43:34.161595","status":"completed"},"tags":[]},"outputs":[{"data":{"text/html":["<style>\n",".list-inline {list-style: none; margin:0; padding: 0}\n",".list-inline>li {display: inline-block}\n",".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n","</style>\n","<ol class=list-inline><li>'Mike\\'s 0il'</li><li>'Joe\\'s Gas'</li></ol>\n"],"text/latex":["\\begin{enumerate*}\n","\\item 'Mike\\textbackslash{}'s 0il'\n","\\item 'Joe\\textbackslash{}'s Gas'\n","\\end{enumerate*}\n"],"text/markdown":["1. 'Mike\\'s 0il'\n","2. 'Joe\\'s Gas'\n","\n","\n"],"text/plain":["[1] \"Mike's 0il\" \"Joe's Gas\" "]},"metadata":{},"output_type":"display_data"}],"source":["#finding apostrophes\n","grep(\"\\\\'\",words,value=TRUE)"]},{"cell_type":"code","execution_count":4,"id":"354cf5b6","metadata":{"execution":{"iopub.execute_input":"2022-07-05T06:43:34.193943Z","iopub.status.busy":"2022-07-05T06:43:34.192372Z","iopub.status.idle":"2022-07-05T06:43:34.206064Z","shell.execute_reply":"2022-07-05T06:43:34.204286Z"},"papermill":{"duration":0.020324,"end_time":"2022-07-05T06:43:34.208403","exception":false,"start_time":"2022-07-05T06:43:34.188079","status":"completed"},"tags":[]},"outputs":[],"source":["text<-c(\"John's favorite color two colors are blue and red.\"\n"," , \"John's favorite number is 1111.\"                   \n",", \"John lives at P Sherman, 42 Wallaby Way, Sydney\"   \n",", \"He is 7 feet tall\"                                 \n"," ,\"John has visited 30 countries\"                     \n",", \"John only has nine fingers.\"                       \n",",\"John has worked at eleven different jobs\"          \n"," ,\"He can speak 3 languages\"                          \n",",\"john's favorite food is pizza\"                     \n",", \"John can name 10 facts about himself.\" )"]},{"cell_type":"code","execution_count":5,"id":"543adbb5","metadata":{"execution":{"iopub.execute_input":"2022-07-05T06:43:34.21917Z","iopub.status.busy":"2022-07-05T06:43:34.217557Z","iopub.status.idle":"2022-07-05T06:43:34.250024Z","shell.execute_reply":"2022-07-05T06:43:34.248359Z"},"papermill":{"duration":0.039371,"end_time":"2022-07-05T06:43:34.252484","exception":false,"start_time":"2022-07-05T06:43:34.213113","status":"completed"},"tags":[]},"outputs":[{"data":{"text/html":["<style>\n",".list-inline {list-style: none; margin:0; padding: 0}\n",".list-inline>li {display: inline-block}\n",".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n","</style>\n","<ol class=list-inline><li>'John\\'s favorite number is 1111.'</li><li>'John lives at P Sherman, 42 Wallaby Way, Sydney'</li><li>'He is 7 feet tall'</li><li>'John has visited 30 countries'</li><li>'He can speak 3 languages'</li><li>'John can name 10 facts about himself.'</li></ol>\n"],"text/latex":["\\begin{enumerate*}\n","\\item 'John\\textbackslash{}'s favorite number is 1111.'\n","\\item 'John lives at P Sherman, 42 Wallaby Way, Sydney'\n","\\item 'He is 7 feet tall'\n","\\item 'John has visited 30 countries'\n","\\item 'He can speak 3 languages'\n","\\item 'John can name 10 facts about himself.'\n","\\end{enumerate*}\n"],"text/markdown":["1. 'John\\'s favorite number is 1111.'\n","2. 'John lives at P Sherman, 42 Wallaby Way, Sydney'\n","3. 'He is 7 feet tall'\n","4. 'John has visited 30 countries'\n","5. 'He can speak 3 languages'\n","6. 'John can name 10 facts about himself.'\n","\n","\n"],"text/plain":["[1] \"John's favorite number is 1111.\"                \n","[2] \"John lives at P Sherman, 42 Wallaby Way, Sydney\"\n","[3] \"He is 7 feet tall\"                              \n","[4] \"John has visited 30 countries\"                  \n","[5] \"He can speak 3 languages\"                       \n","[6] \"John can name 10 facts about himself.\"          "]},"metadata":{},"output_type":"display_data"},{"data":{"text/html":["<style>\n",".list-inline {list-style: none; margin:0; padding: 0}\n",".list-inline>li {display: inline-block}\n",".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n","</style>\n","<ol class=list-inline><li>3</li><li>4</li><li>5</li><li>8</li><li>10</li></ol>\n"],"text/latex":["\\begin{enumerate*}\n","\\item 3\n","\\item 4\n","\\item 5\n","\\item 8\n","\\item 10\n","\\end{enumerate*}\n"],"text/markdown":["1. 3\n","2. 4\n","3. 5\n","4. 8\n","5. 10\n","\n","\n"],"text/plain":["[1]  3  4  5  8 10"]},"metadata":{},"output_type":"display_data"},{"data":{"text/html":["3"],"text/latex":["3"],"text/markdown":["3"],"text/plain":["[1] 3"]},"metadata":{},"output_type":"display_data"}],"source":["# Print off each item that contained a numeric number\n","grep(pattern = \"\\\\d\", x = text, value = TRUE)\n","\n","# Find all items with a number followed by a space\n","grep(pattern =\"\\\\d\\\\s\", x = text)\n","\n","# How many times did you write down 'favorite'?\n","length(grep(pattern = 'favorite', x = text))\n"]},{"cell_type":"code","execution_count":6,"id":"ca155bf9","metadata":{"execution":{"iopub.execute_input":"2022-07-05T06:43:34.262555Z","iopub.status.busy":"2022-07-05T06:43:34.260635Z","iopub.status.idle":"2022-07-05T06:43:34.298295Z","shell.execute_reply":"2022-07-05T06:43:34.296635Z"},"papermill":{"duration":0.044984,"end_time":"2022-07-05T06:43:34.300655","exception":false,"start_time":"2022-07-05T06:43:34.255671","status":"completed"},"tags":[]},"outputs":[{"data":{"text/html":["<style>\n",".list-inline {list-style: none; margin:0; padding: 0}\n",".list-inline>li {display: inline-block}\n",".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n","</style>\n","<ol class=list-inline><li>'John\\'s favorite color two colors are blue and red.'</li><li>'John\\'s favorite number is 1111.'</li><li>'John lives at P Sherman, 42 Wallaby Way, Sydney'</li><li>'John has visited 30 countries'</li><li>'John only has nine fingers.'</li><li>'John has worked at eleven different jobs'</li><li>'John can name 10 facts about himself.'</li></ol>\n"],"text/latex":["\\begin{enumerate*}\n","\\item 'John\\textbackslash{}'s favorite color two colors are blue and red.'\n","\\item 'John\\textbackslash{}'s favorite number is 1111.'\n","\\item 'John lives at P Sherman, 42 Wallaby Way, Sydney'\n","\\item 'John has visited 30 countries'\n","\\item 'John only has nine fingers.'\n","\\item 'John has worked at eleven different jobs'\n","\\item 'John can name 10 facts about himself.'\n","\\end{enumerate*}\n"],"text/markdown":["1. 'John\\'s favorite color two colors are blue and red.'\n","2. 'John\\'s favorite number is 1111.'\n","3. 'John lives at P Sherman, 42 Wallaby Way, Sydney'\n","4. 'John has visited 30 countries'\n","5. 'John only has nine fingers.'\n","6. 'John has worked at eleven different jobs'\n","7. 'John can name 10 facts about himself.'\n","\n","\n"],"text/plain":["[1] \"John's favorite color two colors are blue and red.\"\n","[2] \"John's favorite number is 1111.\"                   \n","[3] \"John lives at P Sherman, 42 Wallaby Way, Sydney\"   \n","[4] \"John has visited 30 countries\"                     \n","[5] \"John only has nine fingers.\"                       \n","[6] \"John has worked at eleven different jobs\"          \n","[7] \"John can name 10 facts about himself.\"             "]},"metadata":{},"output_type":"display_data"},{"data":{"text/html":["<style>\n",".list-inline {list-style: none; margin:0; padding: 0}\n",".list-inline>li {display: inline-block}\n",".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n","</style>\n","<ol class=list-inline><li>'He\\'s favorite color two colors are blue and red.'</li><li>'He\\'s favorite number is 1111.'</li><li>'He lives at P Sherman, 42 Wallaby Way, Sydney'</li><li>'He is 7 feet tall'</li><li>'He has visited 30 countries'</li><li>'He only has nine fingers.'</li><li>'He has worked at eleven different jobs'</li><li>'He can speak 3 languages'</li><li>'john\\'s favorite food is pizza'</li><li>'He can name 10 facts about himself.'</li></ol>\n"],"text/latex":["\\begin{enumerate*}\n","\\item 'He\\textbackslash{}'s favorite color two colors are blue and red.'\n","\\item 'He\\textbackslash{}'s favorite number is 1111.'\n","\\item 'He lives at P Sherman, 42 Wallaby Way, Sydney'\n","\\item 'He is 7 feet tall'\n","\\item 'He has visited 30 countries'\n","\\item 'He only has nine fingers.'\n","\\item 'He has worked at eleven different jobs'\n","\\item 'He can speak 3 languages'\n","\\item 'john\\textbackslash{}'s favorite food is pizza'\n","\\item 'He can name 10 facts about himself.'\n","\\end{enumerate*}\n"],"text/markdown":["1. 'He\\'s favorite color two colors are blue and red.'\n","2. 'He\\'s favorite number is 1111.'\n","3. 'He lives at P Sherman, 42 Wallaby Way, Sydney'\n","4. 'He is 7 feet tall'\n","5. 'He has visited 30 countries'\n","6. 'He only has nine fingers.'\n","7. 'He has worked at eleven different jobs'\n","8. 'He can speak 3 languages'\n","9. 'john\\'s favorite food is pizza'\n","10. 'He can name 10 facts about himself.'\n","\n","\n"],"text/plain":[" [1] \"He's favorite color two colors are blue and red.\"\n"," [2] \"He's favorite number is 1111.\"                   \n"," [3] \"He lives at P Sherman, 42 Wallaby Way, Sydney\"   \n"," [4] \"He is 7 feet tall\"                               \n"," [5] \"He has visited 30 countries\"                     \n"," [6] \"He only has nine fingers.\"                       \n"," [7] \"He has worked at eleven different jobs\"          \n"," [8] \"He can speak 3 languages\"                        \n"," [9] \"john's favorite food is pizza\"                   \n","[10] \"He can name 10 facts about himself.\"             "]},"metadata":{},"output_type":"display_data"},{"data":{"text/html":["<style>\n",".list-inline {list-style: none; margin:0; padding: 0}\n",".list-inline>li {display: inline-block}\n",".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n","</style>\n","<ol class=list-inline><li>'John\\'s favorite color two colors are blue and red.'</li><li>'John\\'s favorite number is 1111.'</li><li>'He lives at P Sherman, 42 Wallaby Way, Sydney'</li><li>'He is 7 feet tall'</li><li>'He has visited 30 countries'</li><li>'He only has nine fingers.'</li><li>'He has worked at eleven different jobs'</li><li>'He can speak 3 languages'</li><li>'john\\'s favorite food is pizza'</li><li>'He can name 10 facts about himself.'</li></ol>\n"],"text/latex":["\\begin{enumerate*}\n","\\item 'John\\textbackslash{}'s favorite color two colors are blue and red.'\n","\\item 'John\\textbackslash{}'s favorite number is 1111.'\n","\\item 'He lives at P Sherman, 42 Wallaby Way, Sydney'\n","\\item 'He is 7 feet tall'\n","\\item 'He has visited 30 countries'\n","\\item 'He only has nine fingers.'\n","\\item 'He has worked at eleven different jobs'\n","\\item 'He can speak 3 languages'\n","\\item 'john\\textbackslash{}'s favorite food is pizza'\n","\\item 'He can name 10 facts about himself.'\n","\\end{enumerate*}\n"],"text/markdown":["1. 'John\\'s favorite color two colors are blue and red.'\n","2. 'John\\'s favorite number is 1111.'\n","3. 'He lives at P Sherman, 42 Wallaby Way, Sydney'\n","4. 'He is 7 feet tall'\n","5. 'He has visited 30 countries'\n","6. 'He only has nine fingers.'\n","7. 'He has worked at eleven different jobs'\n","8. 'He can speak 3 languages'\n","9. 'john\\'s favorite food is pizza'\n","10. 'He can name 10 facts about himself.'\n","\n","\n"],"text/plain":[" [1] \"John's favorite color two colors are blue and red.\"\n"," [2] \"John's favorite number is 1111.\"                   \n"," [3] \"He lives at P Sherman, 42 Wallaby Way, Sydney\"     \n"," [4] \"He is 7 feet tall\"                                 \n"," [5] \"He has visited 30 countries\"                       \n"," [6] \"He only has nine fingers.\"                         \n"," [7] \"He has worked at eleven different jobs\"            \n"," [8] \"He can speak 3 languages\"                          \n"," [9] \"john's favorite food is pizza\"                     \n","[10] \"He can name 10 facts about himself.\"               "]},"metadata":{},"output_type":"display_data"},{"data":{"text/html":["<style>\n",".list-inline {list-style: none; margin:0; padding: 0}\n",".list-inline>li {display: inline-block}\n",".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n","</style>\n","<ol class=list-inline><li>'His favorite color two colors are blue and red.'</li><li>'His favorite number is 1111.'</li><li>'He lives at P Sherman, 42 Wallaby Way, Sydney'</li><li>'He is 7 feet tall'</li><li>'He has visited 30 countries'</li><li>'He only has nine fingers.'</li><li>'He has worked at eleven different jobs'</li><li>'He can speak 3 languages'</li><li>'john\\'s favorite food is pizza'</li><li>'He can name 10 facts about himself.'</li></ol>\n"],"text/latex":["\\begin{enumerate*}\n","\\item 'His favorite color two colors are blue and red.'\n","\\item 'His favorite number is 1111.'\n","\\item 'He lives at P Sherman, 42 Wallaby Way, Sydney'\n","\\item 'He is 7 feet tall'\n","\\item 'He has visited 30 countries'\n","\\item 'He only has nine fingers.'\n","\\item 'He has worked at eleven different jobs'\n","\\item 'He can speak 3 languages'\n","\\item 'john\\textbackslash{}'s favorite food is pizza'\n","\\item 'He can name 10 facts about himself.'\n","\\end{enumerate*}\n"],"text/markdown":["1. 'His favorite color two colors are blue and red.'\n","2. 'His favorite number is 1111.'\n","3. 'He lives at P Sherman, 42 Wallaby Way, Sydney'\n","4. 'He is 7 feet tall'\n","5. 'He has visited 30 countries'\n","6. 'He only has nine fingers.'\n","7. 'He has worked at eleven different jobs'\n","8. 'He can speak 3 languages'\n","9. 'john\\'s favorite food is pizza'\n","10. 'He can name 10 facts about himself.'\n","\n","\n"],"text/plain":[" [1] \"His favorite color two colors are blue and red.\"\n"," [2] \"His favorite number is 1111.\"                   \n"," [3] \"He lives at P Sherman, 42 Wallaby Way, Sydney\"  \n"," [4] \"He is 7 feet tall\"                              \n"," [5] \"He has visited 30 countries\"                    \n"," [6] \"He only has nine fingers.\"                      \n"," [7] \"He has worked at eleven different jobs\"         \n"," [8] \"He can speak 3 languages\"                       \n"," [9] \"john's favorite food is pizza\"                  \n","[10] \"He can name 10 facts about himself.\"            "]},"metadata":{},"output_type":"display_data"}],"source":["# Print off the text for every time you used your boss's name, John\n","grep('John', x = text, value = TRUE)\n","\n","# Try replacing all occurences of \"John\" with \"He\"\n","gsub(pattern = 'John', replacement = 'He', x = text)\n","\n","# Replace all occurences of \"John \" with 'He '.\n","clean_text <- gsub(pattern = 'John\\\\s', replacement = 'He ', x = text)\n","clean_text\n","\n","# Replace all occurences of \"John's\" with 'His'\n","gsub(pattern =\"John\\\\'s\", replacement = 'His', x = clean_text)"]}],"metadata":{"kernelspec":{"display_name":"R","language":"R","name":"ir"},"language_info":{"codemirror_mode":"r","file_extension":".r","mimetype":"text/x-r-source","name":"R","pygments_lexer":"r","version":"4.0.5"},"papermill":{"default_parameters":{},"duration":3.917358,"end_time":"2022-07-05T06:43:34.42505","environment_variables":{},"exception":null,"input_path":"__notebook__.ipynb","output_path":"__notebook__.ipynb","parameters":{},"start_time":"2022-07-05T06:43:30.507692","version":"2.3.4"}},"nbformat":4,"nbformat_minor":5}
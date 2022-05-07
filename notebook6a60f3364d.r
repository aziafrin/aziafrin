{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "f5df7a06",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-05-06T15:09:31.310453Z",
     "iopub.status.busy": "2022-05-06T15:09:31.307741Z",
     "iopub.status.idle": "2022-05-06T15:09:32.923337Z",
     "shell.execute_reply": "2022-05-06T15:09:32.921343Z"
    },
    "papermill": {
     "duration": 1.625293,
     "end_time": "2022-05-06T15:09:32.926091",
     "exception": false,
     "start_time": "2022-05-06T15:09:31.300798",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.5     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.6     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'house-prices-advanced-regression-techniques'"
      ],
      "text/latex": [
       "'house-prices-advanced-regression-techniques'"
      ],
      "text/markdown": [
       "'house-prices-advanced-regression-techniques'"
      ],
      "text/plain": [
       "[1] \"house-prices-advanced-regression-techniques\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "e1d6357c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-06T15:09:32.968676Z",
     "iopub.status.busy": "2022-05-06T15:09:32.934967Z",
     "iopub.status.idle": "2022-05-06T15:09:35.776262Z",
     "shell.execute_reply": "2022-05-06T15:09:35.773847Z"
    },
    "papermill": {
     "duration": 2.85043,
     "end_time": "2022-05-06T15:09:35.780234",
     "exception": false,
     "start_time": "2022-05-06T15:09:32.929804",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: lattice\n",
      "\n",
      "\n",
      "Attaching package: ‘caret’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    lift\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    progress\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘xgboost’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:dplyr’:\n",
      "\n",
      "    slice\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(caret)\n",
    "library(xgboost)\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "e3be0b94",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-06T15:09:35.793454Z",
     "iopub.status.busy": "2022-05-06T15:09:35.791274Z",
     "iopub.status.idle": "2022-05-06T15:09:35.896325Z",
     "shell.execute_reply": "2022-05-06T15:09:35.893938Z"
    },
    "papermill": {
     "duration": 0.115562,
     "end_time": "2022-05-06T15:09:35.900031",
     "exception": false,
     "start_time": "2022-05-06T15:09:35.784469",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 81</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>MSSubClass</th><th scope=col>MSZoning</th><th scope=col>LotFrontage</th><th scope=col>LotArea</th><th scope=col>Street</th><th scope=col>Alley</th><th scope=col>LotShape</th><th scope=col>LandContour</th><th scope=col>Utilities</th><th scope=col>⋯</th><th scope=col>PoolArea</th><th scope=col>PoolQC</th><th scope=col>Fence</th><th scope=col>MiscFeature</th><th scope=col>MiscVal</th><th scope=col>MoSold</th><th scope=col>YrSold</th><th scope=col>SaleType</th><th scope=col>SaleCondition</th><th scope=col>SalePrice</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>⋯</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>60</td><td>RL</td><td>65</td><td> 8450</td><td>Pave</td><td>NA</td><td>Reg</td><td>Lvl</td><td>AllPub</td><td>⋯</td><td>0</td><td>NA</td><td>NA   </td><td>NA  </td><td>  0</td><td> 2</td><td>2008</td><td>WD</td><td>Normal </td><td>208500</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2</td><td>20</td><td>RL</td><td>80</td><td> 9600</td><td>Pave</td><td>NA</td><td>Reg</td><td>Lvl</td><td>AllPub</td><td>⋯</td><td>0</td><td>NA</td><td>NA   </td><td>NA  </td><td>  0</td><td> 5</td><td>2007</td><td>WD</td><td>Normal </td><td>181500</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>3</td><td>60</td><td>RL</td><td>68</td><td>11250</td><td>Pave</td><td>NA</td><td>IR1</td><td>Lvl</td><td>AllPub</td><td>⋯</td><td>0</td><td>NA</td><td>NA   </td><td>NA  </td><td>  0</td><td> 9</td><td>2008</td><td>WD</td><td>Normal </td><td>223500</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4</td><td>70</td><td>RL</td><td>60</td><td> 9550</td><td>Pave</td><td>NA</td><td>IR1</td><td>Lvl</td><td>AllPub</td><td>⋯</td><td>0</td><td>NA</td><td>NA   </td><td>NA  </td><td>  0</td><td> 2</td><td>2006</td><td>WD</td><td>Abnorml</td><td>140000</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5</td><td>60</td><td>RL</td><td>84</td><td>14260</td><td>Pave</td><td>NA</td><td>IR1</td><td>Lvl</td><td>AllPub</td><td>⋯</td><td>0</td><td>NA</td><td>NA   </td><td>NA  </td><td>  0</td><td>12</td><td>2008</td><td>WD</td><td>Normal </td><td>250000</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>6</td><td>50</td><td>RL</td><td>85</td><td>14115</td><td>Pave</td><td>NA</td><td>IR1</td><td>Lvl</td><td>AllPub</td><td>⋯</td><td>0</td><td>NA</td><td>MnPrv</td><td>Shed</td><td>700</td><td>10</td><td>2009</td><td>WD</td><td>Normal </td><td>143000</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 81\n",
       "\\begin{tabular}{r|lllllllllllllllllllll}\n",
       "  & Id & MSSubClass & MSZoning & LotFrontage & LotArea & Street & Alley & LotShape & LandContour & Utilities & ⋯ & PoolArea & PoolQC & Fence & MiscFeature & MiscVal & MoSold & YrSold & SaleType & SaleCondition & SalePrice\\\\\n",
       "  & <int> & <int> & <chr> & <int> & <int> & <chr> & <chr> & <chr> & <chr> & <chr> & ⋯ & <int> & <chr> & <chr> & <chr> & <int> & <int> & <int> & <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 60 & RL & 65 &  8450 & Pave & NA & Reg & Lvl & AllPub & ⋯ & 0 & NA & NA    & NA   &   0 &  2 & 2008 & WD & Normal  & 208500\\\\\n",
       "\t2 & 2 & 20 & RL & 80 &  9600 & Pave & NA & Reg & Lvl & AllPub & ⋯ & 0 & NA & NA    & NA   &   0 &  5 & 2007 & WD & Normal  & 181500\\\\\n",
       "\t3 & 3 & 60 & RL & 68 & 11250 & Pave & NA & IR1 & Lvl & AllPub & ⋯ & 0 & NA & NA    & NA   &   0 &  9 & 2008 & WD & Normal  & 223500\\\\\n",
       "\t4 & 4 & 70 & RL & 60 &  9550 & Pave & NA & IR1 & Lvl & AllPub & ⋯ & 0 & NA & NA    & NA   &   0 &  2 & 2006 & WD & Abnorml & 140000\\\\\n",
       "\t5 & 5 & 60 & RL & 84 & 14260 & Pave & NA & IR1 & Lvl & AllPub & ⋯ & 0 & NA & NA    & NA   &   0 & 12 & 2008 & WD & Normal  & 250000\\\\\n",
       "\t6 & 6 & 50 & RL & 85 & 14115 & Pave & NA & IR1 & Lvl & AllPub & ⋯ & 0 & NA & MnPrv & Shed & 700 & 10 & 2009 & WD & Normal  & 143000\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 81\n",
       "\n",
       "| <!--/--> | Id &lt;int&gt; | MSSubClass &lt;int&gt; | MSZoning &lt;chr&gt; | LotFrontage &lt;int&gt; | LotArea &lt;int&gt; | Street &lt;chr&gt; | Alley &lt;chr&gt; | LotShape &lt;chr&gt; | LandContour &lt;chr&gt; | Utilities &lt;chr&gt; | ⋯ ⋯ | PoolArea &lt;int&gt; | PoolQC &lt;chr&gt; | Fence &lt;chr&gt; | MiscFeature &lt;chr&gt; | MiscVal &lt;int&gt; | MoSold &lt;int&gt; | YrSold &lt;int&gt; | SaleType &lt;chr&gt; | SaleCondition &lt;chr&gt; | SalePrice &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 60 | RL | 65 |  8450 | Pave | NA | Reg | Lvl | AllPub | ⋯ | 0 | NA | NA    | NA   |   0 |  2 | 2008 | WD | Normal  | 208500 |\n",
       "| 2 | 2 | 20 | RL | 80 |  9600 | Pave | NA | Reg | Lvl | AllPub | ⋯ | 0 | NA | NA    | NA   |   0 |  5 | 2007 | WD | Normal  | 181500 |\n",
       "| 3 | 3 | 60 | RL | 68 | 11250 | Pave | NA | IR1 | Lvl | AllPub | ⋯ | 0 | NA | NA    | NA   |   0 |  9 | 2008 | WD | Normal  | 223500 |\n",
       "| 4 | 4 | 70 | RL | 60 |  9550 | Pave | NA | IR1 | Lvl | AllPub | ⋯ | 0 | NA | NA    | NA   |   0 |  2 | 2006 | WD | Abnorml | 140000 |\n",
       "| 5 | 5 | 60 | RL | 84 | 14260 | Pave | NA | IR1 | Lvl | AllPub | ⋯ | 0 | NA | NA    | NA   |   0 | 12 | 2008 | WD | Normal  | 250000 |\n",
       "| 6 | 6 | 50 | RL | 85 | 14115 | Pave | NA | IR1 | Lvl | AllPub | ⋯ | 0 | NA | MnPrv | Shed | 700 | 10 | 2009 | WD | Normal  | 143000 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id MSSubClass MSZoning LotFrontage LotArea Street Alley LotShape LandContour\n",
       "1 1  60         RL       65           8450   Pave   NA    Reg      Lvl        \n",
       "2 2  20         RL       80           9600   Pave   NA    Reg      Lvl        \n",
       "3 3  60         RL       68          11250   Pave   NA    IR1      Lvl        \n",
       "4 4  70         RL       60           9550   Pave   NA    IR1      Lvl        \n",
       "5 5  60         RL       84          14260   Pave   NA    IR1      Lvl        \n",
       "6 6  50         RL       85          14115   Pave   NA    IR1      Lvl        \n",
       "  Utilities ⋯ PoolArea PoolQC Fence MiscFeature MiscVal MoSold YrSold SaleType\n",
       "1 AllPub    ⋯ 0        NA     NA    NA            0      2     2008   WD      \n",
       "2 AllPub    ⋯ 0        NA     NA    NA            0      5     2007   WD      \n",
       "3 AllPub    ⋯ 0        NA     NA    NA            0      9     2008   WD      \n",
       "4 AllPub    ⋯ 0        NA     NA    NA            0      2     2006   WD      \n",
       "5 AllPub    ⋯ 0        NA     NA    NA            0     12     2008   WD      \n",
       "6 AllPub    ⋯ 0        NA     MnPrv Shed        700     10     2009   WD      \n",
       "  SaleCondition SalePrice\n",
       "1 Normal        208500   \n",
       "2 Normal        181500   \n",
       "3 Normal        223500   \n",
       "4 Abnorml       140000   \n",
       "5 Normal        250000   \n",
       "6 Normal        143000   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "training_data <- read.csv(\"../input/house-prices-advanced-regression-techniques/train.csv\", )\n",
    "\n",
    "set.seed(11114567)\n",
    "head(training_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "34d26aa2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-06T15:09:35.914105Z",
     "iopub.status.busy": "2022-05-06T15:09:35.911272Z",
     "iopub.status.idle": "2022-05-06T15:09:36.280379Z",
     "shell.execute_reply": "2022-05-06T15:09:36.277941Z"
    },
    "papermill": {
     "duration": 0.379845,
     "end_time": "2022-05-06T15:09:36.284350",
     "exception": false,
     "start_time": "2022-05-06T15:09:35.904505",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "trainIndex <- createDataPartition(training_data$SalePrice, p = .8, \n",
    "                                  list = FALSE, \n",
    "                                  times = 1)\n",
    "training_data_matrix <- training_data %>%\n",
    "    select(-SalePrice) %>%\n",
    "    mutate_if(is.character, as.factor) %>% \n",
    "    mutate_if(is.factor, as.numeric) %>%\n",
    "    select_if(is.numeric) %>%\n",
    "    as.matrix()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "5e00d16b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-06T15:09:36.298324Z",
     "iopub.status.busy": "2022-05-06T15:09:36.296221Z",
     "iopub.status.idle": "2022-05-06T15:09:36.621118Z",
     "shell.execute_reply": "2022-05-06T15:09:36.616631Z"
    },
    "papermill": {
     "duration": 0.339458,
     "end_time": "2022-05-06T15:09:36.628642",
     "exception": false,
     "start_time": "2022-05-06T15:09:36.289184",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1]\ttrain-mae:128155.713131 \n",
      "[2]\ttrain-mae:90604.760459 \n",
      "[3]\ttrain-mae:64184.271962 \n",
      "[4]\ttrain-mae:45658.414908 \n",
      "[5]\ttrain-mae:32660.107220 \n",
      "[6]\ttrain-mae:23820.168610 \n",
      "[7]\ttrain-mae:18026.215118 \n",
      "[8]\ttrain-mae:14142.851833 \n",
      "[9]\ttrain-mae:11759.317218 \n",
      "[10]\ttrain-mae:10166.467624 \n",
      "[11]\ttrain-mae:9220.085336 \n",
      "[12]\ttrain-mae:8456.998951 \n",
      "[13]\ttrain-mae:7846.262110 \n",
      "[14]\ttrain-mae:7503.690534 \n",
      "[15]\ttrain-mae:7160.439746 \n",
      "[16]\ttrain-mae:6887.090686 \n",
      "[17]\ttrain-mae:6700.326220 \n",
      "[18]\ttrain-mae:6418.726198 \n",
      "[19]\ttrain-mae:6274.470230 \n",
      "[20]\ttrain-mae:6107.116633 \n",
      "[21]\ttrain-mae:5944.913545 \n",
      "[22]\ttrain-mae:5819.763293 \n",
      "[23]\ttrain-mae:5521.067339 \n",
      "[24]\ttrain-mae:5308.552639 \n",
      "[25]\ttrain-mae:5107.989508 \n",
      "[26]\ttrain-mae:4980.905939 \n",
      "[27]\ttrain-mae:4894.452383 \n",
      "[28]\ttrain-mae:4639.965983 \n",
      "[29]\ttrain-mae:4550.924284 \n",
      "[30]\ttrain-mae:4409.918704 \n",
      "[31]\ttrain-mae:4255.539149 \n",
      "[32]\ttrain-mae:4169.482607 \n",
      "[33]\ttrain-mae:4125.118995 \n",
      "[34]\ttrain-mae:4072.297634 \n",
      "[35]\ttrain-mae:3998.843282 \n",
      "[36]\ttrain-mae:3913.947725 \n",
      "[37]\ttrain-mae:3844.985822 \n",
      "[38]\ttrain-mae:3774.905919 \n",
      "[39]\ttrain-mae:3636.075094 \n",
      "[40]\ttrain-mae:3590.917427 \n"
     ]
    }
   ],
   "source": [
    "xgboost_model <- xgboost(data = training_data_matrix[trainIndex,],\n",
    "        label = training_data$SalePrice[trainIndex],\n",
    "        nrounds = 40, eval_metric=\"mae\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "40489f49",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-06T15:09:36.645762Z",
     "iopub.status.busy": "2022-05-06T15:09:36.643023Z",
     "iopub.status.idle": "2022-05-06T15:09:36.693238Z",
     "shell.execute_reply": "2022-05-06T15:09:36.690889Z"
    },
    "papermill": {
     "duration": 0.061832,
     "end_time": "2022-05-06T15:09:36.696014",
     "exception": false,
     "start_time": "2022-05-06T15:09:36.634182",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "2870.00361093213"
      ],
      "text/latex": [
       "2870.00361093213"
      ],
      "text/markdown": [
       "2870.00361093213"
      ],
      "text/plain": [
       "[1] 2870.004"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"test-error= 2870.00361093213\"\n"
     ]
    }
   ],
   "source": [
    "pred <- predict(xgboost_model, training_data_matrix[-trainIndex,])\n",
    "\n",
    "\n",
    "err <- mean(pred - training_data$SalePrice[-trainIndex])\n",
    "err\n",
    "print(paste(\"test-error=\", err))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "f6cb601d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-06T15:09:36.710332Z",
     "iopub.status.busy": "2022-05-06T15:09:36.708213Z",
     "iopub.status.idle": "2022-05-06T15:09:37.049726Z",
     "shell.execute_reply": "2022-05-06T15:09:37.047252Z"
    },
    "papermill": {
     "duration": 0.352579,
     "end_time": "2022-05-06T15:09:37.053673",
     "exception": false,
     "start_time": "2022-05-06T15:09:36.701094",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "test_data <- read.csv(\"../input/house-prices-advanced-regression-techniques/test.csv\")\n",
    "\n",
    "\n",
    "test_data_matrix <- test_data %>%\n",
    "    mutate_if(is.character, as.factor) %>% \n",
    "    mutate_if(is.factor, as.numeric) %>% \n",
    "    select_if(is.numeric) %>%\n",
    "    as.matrix()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "aa2bc77f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-06T15:09:37.067353Z",
     "iopub.status.busy": "2022-05-06T15:09:37.065313Z",
     "iopub.status.idle": "2022-05-06T15:09:37.221887Z",
     "shell.execute_reply": "2022-05-06T15:09:37.219113Z"
    },
    "papermill": {
     "duration": 0.1672,
     "end_time": "2022-05-06T15:09:37.225615",
     "exception": false,
     "start_time": "2022-05-06T15:09:37.058415",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "submission_predictions <- predict(xgboost_model, \n",
    "                                  test_data_matrix)\n",
    "\n",
    "prediction_file <- tibble(Id = test_data$Id, \n",
    "                         SalePrice = submission_predictions)\n",
    "\n",
    "write_csv(prediction_file, \"submission.csv\")"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 10.075364,
   "end_time": "2022-05-06T15:09:37.354421",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-05-06T15:09:27.279057",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "856699a0",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:43.713076Z",
     "iopub.status.busy": "2022-06-14T11:07:43.710958Z",
     "iopub.status.idle": "2022-06-14T11:07:43.931966Z",
     "shell.execute_reply": "2022-06-14T11:07:43.929979Z"
    },
    "papermill": {
     "duration": 0.230309,
     "end_time": "2022-06-14T11:07:43.934389",
     "exception": false,
     "start_time": "2022-06-14T11:07:43.704080",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "tr<-read.csv(\"../input/spaceship-titanic/train.csv\")\n",
    "ts<-read.csv(\"../input/spaceship-titanic/test.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "f603663a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:43.976787Z",
     "iopub.status.busy": "2022-06-14T11:07:43.945698Z",
     "iopub.status.idle": "2022-06-14T11:07:45.167203Z",
     "shell.execute_reply": "2022-06-14T11:07:45.165313Z"
    },
    "papermill": {
     "duration": 1.229293,
     "end_time": "2022-06-14T11:07:45.169574",
     "exception": false,
     "start_time": "2022-06-14T11:07:43.940281",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘dplyr’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    filter, lag\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    intersect, setdiff, setequal, union\n",
      "\n",
      "\n",
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.7     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(dplyr)\n",
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "91604277",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:45.182485Z",
     "iopub.status.busy": "2022-06-14T11:07:45.180458Z",
     "iopub.status.idle": "2022-06-14T11:07:45.229444Z",
     "shell.execute_reply": "2022-06-14T11:07:45.227676Z"
    },
    "papermill": {
     "duration": 0.057658,
     "end_time": "2022-06-14T11:07:45.231834",
     "exception": false,
     "start_time": "2022-06-14T11:07:45.174176",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 8,693\n",
      "Columns: 14\n",
      "$ PassengerId  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"0001_01\", \"0002_01\", \"0003_01\", \"0003_02\", \"0004_01\", \"0…\n",
      "$ HomePlanet   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Europa\", \"Earth\", \"Europa\", \"Europa\", \"Earth\", \"Earth\", …\n",
      "$ CryoSleep    \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"False\", \"False\", \"False\", \"False\", \"False\", \"False\", \"Fa…\n",
      "$ Cabin        \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"B/0/P\", \"F/0/S\", \"A/0/S\", \"A/0/S\", \"F/1/S\", \"F/0/P\", \"F/…\n",
      "$ Destination  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"TRAPPIST-1e\", \"TRAPPIST-1e\", \"TRAPPIST-1e\", \"TRAPPIST-1e…\n",
      "$ Age          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 39, 24, 58, 33, 16, 44, 26, 28, 35, 14, 34, 45, 32, 48, 2…\n",
      "$ VIP          \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"False\", \"False\", \"True\", \"False\", \"False\", \"False\", \"Fal…\n",
      "$ RoomService  \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 109, 43, 0, 303, 0, 42, 0, 0, 0, 0, 39, 73, 719, 8, 32…\n",
      "$ FoodCourt    \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 9, 3576, 1283, 70, 483, 1539, 0, 785, 0, 0, 7295, 0, 1…\n",
      "$ ShoppingMall \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 25, 0, 371, 151, 0, 3, 0, 17, 0, NA, 589, 1123, 65, 12…\n",
      "$ Spa          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 549, 6715, 3329, 565, 291, 0, 0, 216, 0, 0, 110, 0, 0,…\n",
      "$ VRDeck       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 44, 49, 193, 2, 0, 0, NA, 0, 0, 0, 124, 113, 24, 7, 0,…\n",
      "$ Name         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Maham Ofracculy\", \"Juanna Vines\", \"Altark Susent\", \"Sola…\n",
      "$ Transported  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"False\", \"True\", \"False\", \"False\", \"True\", \"True\", \"True\"…\n",
      "Rows: 4,277\n",
      "Columns: 13\n",
      "$ PassengerId  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"0013_01\", \"0018_01\", \"0019_01\", \"0021_01\", \"0023_01\", \"0…\n",
      "$ HomePlanet   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Earth\", \"Earth\", \"Europa\", \"Europa\", \"Earth\", \"Earth\", \"…\n",
      "$ CryoSleep    \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"True\", \"False\", \"True\", \"False\", \"False\", \"False\", \"True…\n",
      "$ Cabin        \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"G/3/S\", \"F/4/S\", \"C/0/S\", \"C/1/S\", \"F/5/S\", \"F/7/P\", \"B/…\n",
      "$ Destination  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"TRAPPIST-1e\", \"TRAPPIST-1e\", \"55 Cancri e\", \"TRAPPIST-1e…\n",
      "$ Age          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 27, 19, 31, 38, 20, 31, 21, 20, 23, 24, 19, 45, 44, 46, 2…\n",
      "$ VIP          \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"False\", \"False\", \"False\", \"False\", \"False\", \"False\", \"Fa…\n",
      "$ RoomService  \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 339, 932, 0, 0, 0, 0, 2, 0…\n",
      "$ FoodCourt    \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 9, 0, 6652, 0, 1615, NA, 0, 0, 639, 3, 74, 1561, 0, 0,…\n",
      "$ ShoppingMall \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 0, 635, 263, 0, 0, 0, 0, 136, NA, 0, 0, 0, 0, 25…\n",
      "$ Spa          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 2823, 0, 181, 0, 113, 0, 0, 0, 0, 237, 7, 14, 0, 1687,…\n",
      "$ VRDeck       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 585, 0, 60, 0, 0, 0, 0, 0, 1010, 224, 0, 92, NA,…\n",
      "$ Name         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Nelly Carsoning\", \"Lerome Peckers\", \"Sabih Unhearfus\", \"…\n"
     ]
    }
   ],
   "source": [
    "glimpse(tr)\n",
    "glimpse(ts)\n",
    "tr=na.omit(tr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "e7af6d83",
   "metadata": {
    "papermill": {
     "duration": 0.004627,
     "end_time": "2022-06-14T11:07:45.241443",
     "exception": false,
     "start_time": "2022-06-14T11:07:45.236816",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "47da5554",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:45.253943Z",
     "iopub.status.busy": "2022-06-14T11:07:45.252423Z",
     "iopub.status.idle": "2022-06-14T11:07:45.267528Z",
     "shell.execute_reply": "2022-06-14T11:07:45.265856Z"
    },
    "papermill": {
     "duration": 0.025073,
     "end_time": "2022-06-14T11:07:45.270988",
     "exception": false,
     "start_time": "2022-06-14T11:07:45.245915",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "tr<-as.data.frame(tr)\n",
    "ts<-as.data.frame(ts)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "1af1705e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:45.283936Z",
     "iopub.status.busy": "2022-06-14T11:07:45.282400Z",
     "iopub.status.idle": "2022-06-14T11:07:45.385848Z",
     "shell.execute_reply": "2022-06-14T11:07:45.384247Z"
    },
    "papermill": {
     "duration": 0.111961,
     "end_time": "2022-06-14T11:07:45.388062",
     "exception": false,
     "start_time": "2022-06-14T11:07:45.276101",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "randomForest 4.6-14\n",
      "\n",
      "Type rfNews() to see new features/changes/bug fixes.\n",
      "\n",
      "\n",
      "Attaching package: ‘randomForest’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:ggplot2’:\n",
      "\n",
      "    margin\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:dplyr’:\n",
      "\n",
      "    combine\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(rpart)\n",
    "library(rpart.plot)\n",
    "library(ggplot2)\n",
    "library(randomForest)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "26fdc1c2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:45.400856Z",
     "iopub.status.busy": "2022-06-14T11:07:45.399443Z",
     "iopub.status.idle": "2022-06-14T11:07:46.625936Z",
     "shell.execute_reply": "2022-06-14T11:07:46.623726Z"
    },
    "papermill": {
     "duration": 1.2361,
     "end_time": "2022-06-14T11:07:46.629082",
     "exception": false,
     "start_time": "2022-06-14T11:07:45.392982",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "Classification tree:\n",
      "rpart(formula = Transported ~ PassengerId + HomePlanet + CryoSleep + \n",
      "    Cabin + Destination + Age + VIP + RoomService + FoodCourt + \n",
      "    ShoppingMall + Spa + VRDeck + Name, data = tr, method = \"class\", \n",
      "    control = rpart.control(cp = 0.007))\n",
      "\n",
      "Variables actually used in tree construction:\n",
      "[1] PassengerId\n",
      "\n",
      "Root node error: 3789/7620 = 0.49724\n",
      "\n",
      "n= 7620 \n",
      "\n",
      "     CP nsplit rel error  xerror     xstd\n",
      "1 1.000      0         1 1.00000 0.011519\n",
      "2 0.007      1         0 0.67379 0.010874\n"
     ]
    }
   ],
   "source": [
    "RT=rpart(Transported~PassengerId+HomePlanet+CryoSleep+Cabin+Destination+Age+VIP+RoomService+FoodCourt+ShoppingMall+Spa+VRDeck+Name, data=tr,method=\"class\",control=rpart.control(cp=0.007))\n",
    "printcp(RT)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "ae4d82d6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:46.643489Z",
     "iopub.status.busy": "2022-06-14T11:07:46.641916Z",
     "iopub.status.idle": "2022-06-14T11:07:46.694468Z",
     "shell.execute_reply": "2022-06-14T11:07:46.692504Z"
    },
    "papermill": {
     "duration": 0.062185,
     "end_time": "2022-06-14T11:07:46.697228",
     "exception": false,
     "start_time": "2022-06-14T11:07:46.635043",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "Classification tree:\n",
      "rpart(formula = Transported ~ PassengerId + HomePlanet + CryoSleep + \n",
      "    Cabin + Destination + Age + VIP + RoomService + FoodCourt + \n",
      "    ShoppingMall + Spa + VRDeck + Name, data = tr, method = \"class\", \n",
      "    control = rpart.control(cp = 0.007))\n",
      "\n",
      "Variables actually used in tree construction:\n",
      "[1] PassengerId\n",
      "\n",
      "Root node error: 3789/7620 = 0.49724\n",
      "\n",
      "n= 7620 \n",
      "\n",
      "     CP nsplit rel error  xerror     xstd\n",
      "1 1.000      0         1 1.00000 0.011519\n",
      "2 0.007      1         0 0.67379 0.010874\n",
      "\n",
      "Classification tree:\n",
      "rpart(formula = Transported ~ PassengerId + HomePlanet + CryoSleep + \n",
      "    Cabin + Destination + Age + VIP + RoomService + FoodCourt + \n",
      "    ShoppingMall + Spa + VRDeck + Name, data = tr, method = \"class\", \n",
      "    control = rpart.control(cp = 0.007))\n",
      "\n",
      "Variables actually used in tree construction:\n",
      "[1] PassengerId\n",
      "\n",
      "Root node error: 3789/7620 = 0.497\n",
      "\n",
      "n= 7620 \n",
      "\n",
      "     CP nsplit rel error xerror   xstd\n",
      "1 1.000      0         1  1.000 0.0115\n",
      "2 0.007      1         0  0.674 0.0109\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 5 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>CP</th><th scope=col>nsplit</th><th scope=col>rel error</th><th scope=col>xerror</th><th scope=col>xstd</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1.000</td><td>0</td><td>1</td><td>1.0000000</td><td>0.01151904</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0.007</td><td>1</td><td>0</td><td>0.6737926</td><td>0.01087424</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 5 of type dbl\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & CP & nsplit & rel error & xerror & xstd\\\\\n",
       "\\hline\n",
       "\t1 & 1.000 & 0 & 1 & 1.0000000 & 0.01151904\\\\\n",
       "\t2 & 0.007 & 1 & 0 & 0.6737926 & 0.01087424\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 5 of type dbl\n",
       "\n",
       "| <!--/--> | CP | nsplit | rel error | xerror | xstd |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 1.000 | 0 | 1 | 1.0000000 | 0.01151904 |\n",
       "| 2 | 0.007 | 1 | 0 | 0.6737926 | 0.01087424 |\n",
       "\n"
      ],
      "text/plain": [
       "  CP    nsplit rel error xerror    xstd      \n",
       "1 1.000 0      1         1.0000000 0.01151904\n",
       "2 0.007 1      0         0.6737926 0.01087424"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.007"
      ],
      "text/latex": [
       "0.007"
      ],
      "text/markdown": [
       "0.007"
      ],
      "text/plain": [
       "[1] 0.007"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "printcp(RT)\n",
    "printcp(RT, digits = getOption(\"digits\") - 4)\n",
    "\n",
    "RT$cptable\n",
    "bestcp =RT$cptable[which.min(RT$cptable[,\"xerror\"]),\"CP\"]\n",
    "bestcp"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "27ae0352",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:46.712255Z",
     "iopub.status.busy": "2022-06-14T11:07:46.710617Z",
     "iopub.status.idle": "2022-06-14T11:07:46.753449Z",
     "shell.execute_reply": "2022-06-14T11:07:46.751379Z"
    },
    "papermill": {
     "duration": 0.053069,
     "end_time": "2022-06-14T11:07:46.756243",
     "exception": false,
     "start_time": "2022-06-14T11:07:46.703174",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "       Pr\n",
       "        False True\n",
       "  False  3789    0\n",
       "  True      0 3831"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "1"
      ],
      "text/latex": [
       "1"
      ],
      "text/markdown": [
       "1"
      ],
      "text/plain": [
       "[1] 1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "Pr=predict(RT, data=tr[,-14],type=\"class\")\n",
    "Tr=table(tr$Transported,Pr)\n",
    "A=sum(diag(Tr))/sum(Tr)\n",
    "Tr\n",
    "A\n",
    "E=1-A\n",
    "E\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "8b9b272a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:46.772063Z",
     "iopub.status.busy": "2022-06-14T11:07:46.770459Z",
     "iopub.status.idle": "2022-06-14T11:07:46.787791Z",
     "shell.execute_reply": "2022-06-14T11:07:46.786005Z"
    },
    "papermill": {
     "duration": 0.028194,
     "end_time": "2022-06-14T11:07:46.790702",
     "exception": false,
     "start_time": "2022-06-14T11:07:46.762508",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "PRS=predict(RT,data=ts,type=\"class\")\n",
    "PRS<-as.data.frame(PRS)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "91182eae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:46.806078Z",
     "iopub.status.busy": "2022-06-14T11:07:46.804504Z",
     "iopub.status.idle": "2022-06-14T11:07:46.818940Z",
     "shell.execute_reply": "2022-06-14T11:07:46.817206Z"
    },
    "papermill": {
     "duration": 0.025215,
     "end_time": "2022-06-14T11:07:46.821897",
     "exception": false,
     "start_time": "2022-06-14T11:07:46.796682",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "PRS1=PRS[-c(4278:7620),]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "15e064fc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:46.837259Z",
     "iopub.status.busy": "2022-06-14T11:07:46.835674Z",
     "iopub.status.idle": "2022-06-14T11:07:46.891820Z",
     "shell.execute_reply": "2022-06-14T11:07:46.889441Z"
    },
    "papermill": {
     "duration": 0.066801,
     "end_time": "2022-06-14T11:07:46.894634",
     "exception": false,
     "start_time": "2022-06-14T11:07:46.827833",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 4277 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ts...1.</th><th scope=col>PRS1</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0013_01</td><td>False</td></tr>\n",
       "\t<tr><td>0018_01</td><td>True </td></tr>\n",
       "\t<tr><td>0019_01</td><td>False</td></tr>\n",
       "\t<tr><td>0021_01</td><td>False</td></tr>\n",
       "\t<tr><td>0023_01</td><td>True </td></tr>\n",
       "\t<tr><td>0027_01</td><td>True </td></tr>\n",
       "\t<tr><td>0029_01</td><td>True </td></tr>\n",
       "\t<tr><td>0032_01</td><td>True </td></tr>\n",
       "\t<tr><td>0032_02</td><td>True </td></tr>\n",
       "\t<tr><td>0033_01</td><td>True </td></tr>\n",
       "\t<tr><td>0037_01</td><td>True </td></tr>\n",
       "\t<tr><td>0040_01</td><td>False</td></tr>\n",
       "\t<tr><td>0040_02</td><td>True </td></tr>\n",
       "\t<tr><td>0042_01</td><td>False</td></tr>\n",
       "\t<tr><td>0046_01</td><td>False</td></tr>\n",
       "\t<tr><td>0046_02</td><td>True </td></tr>\n",
       "\t<tr><td>0046_03</td><td>True </td></tr>\n",
       "\t<tr><td>0047_01</td><td>False</td></tr>\n",
       "\t<tr><td>0047_02</td><td>False</td></tr>\n",
       "\t<tr><td>0047_03</td><td>False</td></tr>\n",
       "\t<tr><td>0048_01</td><td>True </td></tr>\n",
       "\t<tr><td>0049_01</td><td>False</td></tr>\n",
       "\t<tr><td>0054_01</td><td>False</td></tr>\n",
       "\t<tr><td>0054_02</td><td>False</td></tr>\n",
       "\t<tr><td>0054_03</td><td>False</td></tr>\n",
       "\t<tr><td>0055_01</td><td>False</td></tr>\n",
       "\t<tr><td>0057_01</td><td>False</td></tr>\n",
       "\t<tr><td>0059_01</td><td>True </td></tr>\n",
       "\t<tr><td>0060_01</td><td>True </td></tr>\n",
       "\t<tr><td>0063_01</td><td>True </td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>9216_01</td><td>False</td></tr>\n",
       "\t<tr><td>9223_01</td><td>False</td></tr>\n",
       "\t<tr><td>9223_02</td><td>True </td></tr>\n",
       "\t<tr><td>9228_01</td><td>False</td></tr>\n",
       "\t<tr><td>9229_01</td><td>True </td></tr>\n",
       "\t<tr><td>9232_01</td><td>True </td></tr>\n",
       "\t<tr><td>9236_01</td><td>True </td></tr>\n",
       "\t<tr><td>9238_01</td><td>False</td></tr>\n",
       "\t<tr><td>9238_02</td><td>False</td></tr>\n",
       "\t<tr><td>9238_03</td><td>True </td></tr>\n",
       "\t<tr><td>9238_04</td><td>False</td></tr>\n",
       "\t<tr><td>9238_05</td><td>True </td></tr>\n",
       "\t<tr><td>9238_06</td><td>False</td></tr>\n",
       "\t<tr><td>9238_07</td><td>True </td></tr>\n",
       "\t<tr><td>9240_01</td><td>True </td></tr>\n",
       "\t<tr><td>9243_01</td><td>False</td></tr>\n",
       "\t<tr><td>9245_01</td><td>False</td></tr>\n",
       "\t<tr><td>9249_01</td><td>True </td></tr>\n",
       "\t<tr><td>9255_01</td><td>True </td></tr>\n",
       "\t<tr><td>9258_01</td><td>False</td></tr>\n",
       "\t<tr><td>9260_01</td><td>False</td></tr>\n",
       "\t<tr><td>9262_01</td><td>False</td></tr>\n",
       "\t<tr><td>9263_01</td><td>True </td></tr>\n",
       "\t<tr><td>9265_01</td><td>False</td></tr>\n",
       "\t<tr><td>9266_01</td><td>True </td></tr>\n",
       "\t<tr><td>9266_02</td><td>True </td></tr>\n",
       "\t<tr><td>9269_01</td><td>True </td></tr>\n",
       "\t<tr><td>9271_01</td><td>False</td></tr>\n",
       "\t<tr><td>9273_01</td><td>True </td></tr>\n",
       "\t<tr><td>9277_01</td><td>True </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4277 × 2\n",
       "\\begin{tabular}{ll}\n",
       " ts...1. & PRS1\\\\\n",
       " <chr> & <fct>\\\\\n",
       "\\hline\n",
       "\t 0013\\_01 & False\\\\\n",
       "\t 0018\\_01 & True \\\\\n",
       "\t 0019\\_01 & False\\\\\n",
       "\t 0021\\_01 & False\\\\\n",
       "\t 0023\\_01 & True \\\\\n",
       "\t 0027\\_01 & True \\\\\n",
       "\t 0029\\_01 & True \\\\\n",
       "\t 0032\\_01 & True \\\\\n",
       "\t 0032\\_02 & True \\\\\n",
       "\t 0033\\_01 & True \\\\\n",
       "\t 0037\\_01 & True \\\\\n",
       "\t 0040\\_01 & False\\\\\n",
       "\t 0040\\_02 & True \\\\\n",
       "\t 0042\\_01 & False\\\\\n",
       "\t 0046\\_01 & False\\\\\n",
       "\t 0046\\_02 & True \\\\\n",
       "\t 0046\\_03 & True \\\\\n",
       "\t 0047\\_01 & False\\\\\n",
       "\t 0047\\_02 & False\\\\\n",
       "\t 0047\\_03 & False\\\\\n",
       "\t 0048\\_01 & True \\\\\n",
       "\t 0049\\_01 & False\\\\\n",
       "\t 0054\\_01 & False\\\\\n",
       "\t 0054\\_02 & False\\\\\n",
       "\t 0054\\_03 & False\\\\\n",
       "\t 0055\\_01 & False\\\\\n",
       "\t 0057\\_01 & False\\\\\n",
       "\t 0059\\_01 & True \\\\\n",
       "\t 0060\\_01 & True \\\\\n",
       "\t 0063\\_01 & True \\\\\n",
       "\t ⋮ & ⋮\\\\\n",
       "\t 9216\\_01 & False\\\\\n",
       "\t 9223\\_01 & False\\\\\n",
       "\t 9223\\_02 & True \\\\\n",
       "\t 9228\\_01 & False\\\\\n",
       "\t 9229\\_01 & True \\\\\n",
       "\t 9232\\_01 & True \\\\\n",
       "\t 9236\\_01 & True \\\\\n",
       "\t 9238\\_01 & False\\\\\n",
       "\t 9238\\_02 & False\\\\\n",
       "\t 9238\\_03 & True \\\\\n",
       "\t 9238\\_04 & False\\\\\n",
       "\t 9238\\_05 & True \\\\\n",
       "\t 9238\\_06 & False\\\\\n",
       "\t 9238\\_07 & True \\\\\n",
       "\t 9240\\_01 & True \\\\\n",
       "\t 9243\\_01 & False\\\\\n",
       "\t 9245\\_01 & False\\\\\n",
       "\t 9249\\_01 & True \\\\\n",
       "\t 9255\\_01 & True \\\\\n",
       "\t 9258\\_01 & False\\\\\n",
       "\t 9260\\_01 & False\\\\\n",
       "\t 9262\\_01 & False\\\\\n",
       "\t 9263\\_01 & True \\\\\n",
       "\t 9265\\_01 & False\\\\\n",
       "\t 9266\\_01 & True \\\\\n",
       "\t 9266\\_02 & True \\\\\n",
       "\t 9269\\_01 & True \\\\\n",
       "\t 9271\\_01 & False\\\\\n",
       "\t 9273\\_01 & True \\\\\n",
       "\t 9277\\_01 & True \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4277 × 2\n",
       "\n",
       "| ts...1. &lt;chr&gt; | PRS1 &lt;fct&gt; |\n",
       "|---|---|\n",
       "| 0013_01 | False |\n",
       "| 0018_01 | True  |\n",
       "| 0019_01 | False |\n",
       "| 0021_01 | False |\n",
       "| 0023_01 | True  |\n",
       "| 0027_01 | True  |\n",
       "| 0029_01 | True  |\n",
       "| 0032_01 | True  |\n",
       "| 0032_02 | True  |\n",
       "| 0033_01 | True  |\n",
       "| 0037_01 | True  |\n",
       "| 0040_01 | False |\n",
       "| 0040_02 | True  |\n",
       "| 0042_01 | False |\n",
       "| 0046_01 | False |\n",
       "| 0046_02 | True  |\n",
       "| 0046_03 | True  |\n",
       "| 0047_01 | False |\n",
       "| 0047_02 | False |\n",
       "| 0047_03 | False |\n",
       "| 0048_01 | True  |\n",
       "| 0049_01 | False |\n",
       "| 0054_01 | False |\n",
       "| 0054_02 | False |\n",
       "| 0054_03 | False |\n",
       "| 0055_01 | False |\n",
       "| 0057_01 | False |\n",
       "| 0059_01 | True  |\n",
       "| 0060_01 | True  |\n",
       "| 0063_01 | True  |\n",
       "| ⋮ | ⋮ |\n",
       "| 9216_01 | False |\n",
       "| 9223_01 | False |\n",
       "| 9223_02 | True  |\n",
       "| 9228_01 | False |\n",
       "| 9229_01 | True  |\n",
       "| 9232_01 | True  |\n",
       "| 9236_01 | True  |\n",
       "| 9238_01 | False |\n",
       "| 9238_02 | False |\n",
       "| 9238_03 | True  |\n",
       "| 9238_04 | False |\n",
       "| 9238_05 | True  |\n",
       "| 9238_06 | False |\n",
       "| 9238_07 | True  |\n",
       "| 9240_01 | True  |\n",
       "| 9243_01 | False |\n",
       "| 9245_01 | False |\n",
       "| 9249_01 | True  |\n",
       "| 9255_01 | True  |\n",
       "| 9258_01 | False |\n",
       "| 9260_01 | False |\n",
       "| 9262_01 | False |\n",
       "| 9263_01 | True  |\n",
       "| 9265_01 | False |\n",
       "| 9266_01 | True  |\n",
       "| 9266_02 | True  |\n",
       "| 9269_01 | True  |\n",
       "| 9271_01 | False |\n",
       "| 9273_01 | True  |\n",
       "| 9277_01 | True  |\n",
       "\n"
      ],
      "text/plain": [
       "     ts...1. PRS1 \n",
       "1    0013_01 False\n",
       "2    0018_01 True \n",
       "3    0019_01 False\n",
       "4    0021_01 False\n",
       "5    0023_01 True \n",
       "6    0027_01 True \n",
       "7    0029_01 True \n",
       "8    0032_01 True \n",
       "9    0032_02 True \n",
       "10   0033_01 True \n",
       "11   0037_01 True \n",
       "12   0040_01 False\n",
       "13   0040_02 True \n",
       "14   0042_01 False\n",
       "15   0046_01 False\n",
       "16   0046_02 True \n",
       "17   0046_03 True \n",
       "18   0047_01 False\n",
       "19   0047_02 False\n",
       "20   0047_03 False\n",
       "21   0048_01 True \n",
       "22   0049_01 False\n",
       "23   0054_01 False\n",
       "24   0054_02 False\n",
       "25   0054_03 False\n",
       "26   0055_01 False\n",
       "27   0057_01 False\n",
       "28   0059_01 True \n",
       "29   0060_01 True \n",
       "30   0063_01 True \n",
       "⋮    ⋮       ⋮    \n",
       "4248 9216_01 False\n",
       "4249 9223_01 False\n",
       "4250 9223_02 True \n",
       "4251 9228_01 False\n",
       "4252 9229_01 True \n",
       "4253 9232_01 True \n",
       "4254 9236_01 True \n",
       "4255 9238_01 False\n",
       "4256 9238_02 False\n",
       "4257 9238_03 True \n",
       "4258 9238_04 False\n",
       "4259 9238_05 True \n",
       "4260 9238_06 False\n",
       "4261 9238_07 True \n",
       "4262 9240_01 True \n",
       "4263 9243_01 False\n",
       "4264 9245_01 False\n",
       "4265 9249_01 True \n",
       "4266 9255_01 True \n",
       "4267 9258_01 False\n",
       "4268 9260_01 False\n",
       "4269 9262_01 False\n",
       "4270 9263_01 True \n",
       "4271 9265_01 False\n",
       "4272 9266_01 True \n",
       "4273 9266_02 True \n",
       "4274 9269_01 True \n",
       "4275 9271_01 False\n",
       "4276 9273_01 True \n",
       "4277 9277_01 True "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "submission<-data.frame(ts[,1],PRS1)\n",
    "submission"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "7c69d60d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:46.911978Z",
     "iopub.status.busy": "2022-06-14T11:07:46.910334Z",
     "iopub.status.idle": "2022-06-14T11:07:46.973416Z",
     "shell.execute_reply": "2022-06-14T11:07:46.970994Z"
    },
    "papermill": {
     "duration": 0.074053,
     "end_time": "2022-06-14T11:07:46.976187",
     "exception": false,
     "start_time": "2022-06-14T11:07:46.902134",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 4277 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>PassengerId</th><th scope=col>Transported</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0013_01</td><td>False</td></tr>\n",
       "\t<tr><td>0018_01</td><td>True </td></tr>\n",
       "\t<tr><td>0019_01</td><td>False</td></tr>\n",
       "\t<tr><td>0021_01</td><td>False</td></tr>\n",
       "\t<tr><td>0023_01</td><td>True </td></tr>\n",
       "\t<tr><td>0027_01</td><td>True </td></tr>\n",
       "\t<tr><td>0029_01</td><td>True </td></tr>\n",
       "\t<tr><td>0032_01</td><td>True </td></tr>\n",
       "\t<tr><td>0032_02</td><td>True </td></tr>\n",
       "\t<tr><td>0033_01</td><td>True </td></tr>\n",
       "\t<tr><td>0037_01</td><td>True </td></tr>\n",
       "\t<tr><td>0040_01</td><td>False</td></tr>\n",
       "\t<tr><td>0040_02</td><td>True </td></tr>\n",
       "\t<tr><td>0042_01</td><td>False</td></tr>\n",
       "\t<tr><td>0046_01</td><td>False</td></tr>\n",
       "\t<tr><td>0046_02</td><td>True </td></tr>\n",
       "\t<tr><td>0046_03</td><td>True </td></tr>\n",
       "\t<tr><td>0047_01</td><td>False</td></tr>\n",
       "\t<tr><td>0047_02</td><td>False</td></tr>\n",
       "\t<tr><td>0047_03</td><td>False</td></tr>\n",
       "\t<tr><td>0048_01</td><td>True </td></tr>\n",
       "\t<tr><td>0049_01</td><td>False</td></tr>\n",
       "\t<tr><td>0054_01</td><td>False</td></tr>\n",
       "\t<tr><td>0054_02</td><td>False</td></tr>\n",
       "\t<tr><td>0054_03</td><td>False</td></tr>\n",
       "\t<tr><td>0055_01</td><td>False</td></tr>\n",
       "\t<tr><td>0057_01</td><td>False</td></tr>\n",
       "\t<tr><td>0059_01</td><td>True </td></tr>\n",
       "\t<tr><td>0060_01</td><td>True </td></tr>\n",
       "\t<tr><td>0063_01</td><td>True </td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>9216_01</td><td>False</td></tr>\n",
       "\t<tr><td>9223_01</td><td>False</td></tr>\n",
       "\t<tr><td>9223_02</td><td>True </td></tr>\n",
       "\t<tr><td>9228_01</td><td>False</td></tr>\n",
       "\t<tr><td>9229_01</td><td>True </td></tr>\n",
       "\t<tr><td>9232_01</td><td>True </td></tr>\n",
       "\t<tr><td>9236_01</td><td>True </td></tr>\n",
       "\t<tr><td>9238_01</td><td>False</td></tr>\n",
       "\t<tr><td>9238_02</td><td>False</td></tr>\n",
       "\t<tr><td>9238_03</td><td>True </td></tr>\n",
       "\t<tr><td>9238_04</td><td>False</td></tr>\n",
       "\t<tr><td>9238_05</td><td>True </td></tr>\n",
       "\t<tr><td>9238_06</td><td>False</td></tr>\n",
       "\t<tr><td>9238_07</td><td>True </td></tr>\n",
       "\t<tr><td>9240_01</td><td>True </td></tr>\n",
       "\t<tr><td>9243_01</td><td>False</td></tr>\n",
       "\t<tr><td>9245_01</td><td>False</td></tr>\n",
       "\t<tr><td>9249_01</td><td>True </td></tr>\n",
       "\t<tr><td>9255_01</td><td>True </td></tr>\n",
       "\t<tr><td>9258_01</td><td>False</td></tr>\n",
       "\t<tr><td>9260_01</td><td>False</td></tr>\n",
       "\t<tr><td>9262_01</td><td>False</td></tr>\n",
       "\t<tr><td>9263_01</td><td>True </td></tr>\n",
       "\t<tr><td>9265_01</td><td>False</td></tr>\n",
       "\t<tr><td>9266_01</td><td>True </td></tr>\n",
       "\t<tr><td>9266_02</td><td>True </td></tr>\n",
       "\t<tr><td>9269_01</td><td>True </td></tr>\n",
       "\t<tr><td>9271_01</td><td>False</td></tr>\n",
       "\t<tr><td>9273_01</td><td>True </td></tr>\n",
       "\t<tr><td>9277_01</td><td>True </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4277 × 2\n",
       "\\begin{tabular}{ll}\n",
       " PassengerId & Transported\\\\\n",
       " <chr> & <fct>\\\\\n",
       "\\hline\n",
       "\t 0013\\_01 & False\\\\\n",
       "\t 0018\\_01 & True \\\\\n",
       "\t 0019\\_01 & False\\\\\n",
       "\t 0021\\_01 & False\\\\\n",
       "\t 0023\\_01 & True \\\\\n",
       "\t 0027\\_01 & True \\\\\n",
       "\t 0029\\_01 & True \\\\\n",
       "\t 0032\\_01 & True \\\\\n",
       "\t 0032\\_02 & True \\\\\n",
       "\t 0033\\_01 & True \\\\\n",
       "\t 0037\\_01 & True \\\\\n",
       "\t 0040\\_01 & False\\\\\n",
       "\t 0040\\_02 & True \\\\\n",
       "\t 0042\\_01 & False\\\\\n",
       "\t 0046\\_01 & False\\\\\n",
       "\t 0046\\_02 & True \\\\\n",
       "\t 0046\\_03 & True \\\\\n",
       "\t 0047\\_01 & False\\\\\n",
       "\t 0047\\_02 & False\\\\\n",
       "\t 0047\\_03 & False\\\\\n",
       "\t 0048\\_01 & True \\\\\n",
       "\t 0049\\_01 & False\\\\\n",
       "\t 0054\\_01 & False\\\\\n",
       "\t 0054\\_02 & False\\\\\n",
       "\t 0054\\_03 & False\\\\\n",
       "\t 0055\\_01 & False\\\\\n",
       "\t 0057\\_01 & False\\\\\n",
       "\t 0059\\_01 & True \\\\\n",
       "\t 0060\\_01 & True \\\\\n",
       "\t 0063\\_01 & True \\\\\n",
       "\t ⋮ & ⋮\\\\\n",
       "\t 9216\\_01 & False\\\\\n",
       "\t 9223\\_01 & False\\\\\n",
       "\t 9223\\_02 & True \\\\\n",
       "\t 9228\\_01 & False\\\\\n",
       "\t 9229\\_01 & True \\\\\n",
       "\t 9232\\_01 & True \\\\\n",
       "\t 9236\\_01 & True \\\\\n",
       "\t 9238\\_01 & False\\\\\n",
       "\t 9238\\_02 & False\\\\\n",
       "\t 9238\\_03 & True \\\\\n",
       "\t 9238\\_04 & False\\\\\n",
       "\t 9238\\_05 & True \\\\\n",
       "\t 9238\\_06 & False\\\\\n",
       "\t 9238\\_07 & True \\\\\n",
       "\t 9240\\_01 & True \\\\\n",
       "\t 9243\\_01 & False\\\\\n",
       "\t 9245\\_01 & False\\\\\n",
       "\t 9249\\_01 & True \\\\\n",
       "\t 9255\\_01 & True \\\\\n",
       "\t 9258\\_01 & False\\\\\n",
       "\t 9260\\_01 & False\\\\\n",
       "\t 9262\\_01 & False\\\\\n",
       "\t 9263\\_01 & True \\\\\n",
       "\t 9265\\_01 & False\\\\\n",
       "\t 9266\\_01 & True \\\\\n",
       "\t 9266\\_02 & True \\\\\n",
       "\t 9269\\_01 & True \\\\\n",
       "\t 9271\\_01 & False\\\\\n",
       "\t 9273\\_01 & True \\\\\n",
       "\t 9277\\_01 & True \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4277 × 2\n",
       "\n",
       "| PassengerId &lt;chr&gt; | Transported &lt;fct&gt; |\n",
       "|---|---|\n",
       "| 0013_01 | False |\n",
       "| 0018_01 | True  |\n",
       "| 0019_01 | False |\n",
       "| 0021_01 | False |\n",
       "| 0023_01 | True  |\n",
       "| 0027_01 | True  |\n",
       "| 0029_01 | True  |\n",
       "| 0032_01 | True  |\n",
       "| 0032_02 | True  |\n",
       "| 0033_01 | True  |\n",
       "| 0037_01 | True  |\n",
       "| 0040_01 | False |\n",
       "| 0040_02 | True  |\n",
       "| 0042_01 | False |\n",
       "| 0046_01 | False |\n",
       "| 0046_02 | True  |\n",
       "| 0046_03 | True  |\n",
       "| 0047_01 | False |\n",
       "| 0047_02 | False |\n",
       "| 0047_03 | False |\n",
       "| 0048_01 | True  |\n",
       "| 0049_01 | False |\n",
       "| 0054_01 | False |\n",
       "| 0054_02 | False |\n",
       "| 0054_03 | False |\n",
       "| 0055_01 | False |\n",
       "| 0057_01 | False |\n",
       "| 0059_01 | True  |\n",
       "| 0060_01 | True  |\n",
       "| 0063_01 | True  |\n",
       "| ⋮ | ⋮ |\n",
       "| 9216_01 | False |\n",
       "| 9223_01 | False |\n",
       "| 9223_02 | True  |\n",
       "| 9228_01 | False |\n",
       "| 9229_01 | True  |\n",
       "| 9232_01 | True  |\n",
       "| 9236_01 | True  |\n",
       "| 9238_01 | False |\n",
       "| 9238_02 | False |\n",
       "| 9238_03 | True  |\n",
       "| 9238_04 | False |\n",
       "| 9238_05 | True  |\n",
       "| 9238_06 | False |\n",
       "| 9238_07 | True  |\n",
       "| 9240_01 | True  |\n",
       "| 9243_01 | False |\n",
       "| 9245_01 | False |\n",
       "| 9249_01 | True  |\n",
       "| 9255_01 | True  |\n",
       "| 9258_01 | False |\n",
       "| 9260_01 | False |\n",
       "| 9262_01 | False |\n",
       "| 9263_01 | True  |\n",
       "| 9265_01 | False |\n",
       "| 9266_01 | True  |\n",
       "| 9266_02 | True  |\n",
       "| 9269_01 | True  |\n",
       "| 9271_01 | False |\n",
       "| 9273_01 | True  |\n",
       "| 9277_01 | True  |\n",
       "\n"
      ],
      "text/plain": [
       "     PassengerId Transported\n",
       "1    0013_01     False      \n",
       "2    0018_01     True       \n",
       "3    0019_01     False      \n",
       "4    0021_01     False      \n",
       "5    0023_01     True       \n",
       "6    0027_01     True       \n",
       "7    0029_01     True       \n",
       "8    0032_01     True       \n",
       "9    0032_02     True       \n",
       "10   0033_01     True       \n",
       "11   0037_01     True       \n",
       "12   0040_01     False      \n",
       "13   0040_02     True       \n",
       "14   0042_01     False      \n",
       "15   0046_01     False      \n",
       "16   0046_02     True       \n",
       "17   0046_03     True       \n",
       "18   0047_01     False      \n",
       "19   0047_02     False      \n",
       "20   0047_03     False      \n",
       "21   0048_01     True       \n",
       "22   0049_01     False      \n",
       "23   0054_01     False      \n",
       "24   0054_02     False      \n",
       "25   0054_03     False      \n",
       "26   0055_01     False      \n",
       "27   0057_01     False      \n",
       "28   0059_01     True       \n",
       "29   0060_01     True       \n",
       "30   0063_01     True       \n",
       "⋮    ⋮           ⋮          \n",
       "4248 9216_01     False      \n",
       "4249 9223_01     False      \n",
       "4250 9223_02     True       \n",
       "4251 9228_01     False      \n",
       "4252 9229_01     True       \n",
       "4253 9232_01     True       \n",
       "4254 9236_01     True       \n",
       "4255 9238_01     False      \n",
       "4256 9238_02     False      \n",
       "4257 9238_03     True       \n",
       "4258 9238_04     False      \n",
       "4259 9238_05     True       \n",
       "4260 9238_06     False      \n",
       "4261 9238_07     True       \n",
       "4262 9240_01     True       \n",
       "4263 9243_01     False      \n",
       "4264 9245_01     False      \n",
       "4265 9249_01     True       \n",
       "4266 9255_01     True       \n",
       "4267 9258_01     False      \n",
       "4268 9260_01     False      \n",
       "4269 9262_01     False      \n",
       "4270 9263_01     True       \n",
       "4271 9265_01     False      \n",
       "4272 9266_01     True       \n",
       "4273 9266_02     True       \n",
       "4274 9269_01     True       \n",
       "4275 9271_01     False      \n",
       "4276 9273_01     True       \n",
       "4277 9277_01     True       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "colnames(submission)<-c('PassengerId','Transported')\n",
    "submission"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "12989dc9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-14T11:07:46.993459Z",
     "iopub.status.busy": "2022-06-14T11:07:46.991920Z",
     "iopub.status.idle": "2022-06-14T11:07:47.010602Z",
     "shell.execute_reply": "2022-06-14T11:07:47.008852Z"
    },
    "papermill": {
     "duration": 0.030462,
     "end_time": "2022-06-14T11:07:47.013549",
     "exception": false,
     "start_time": "2022-06-14T11:07:46.983087",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "write.csv(submission,\"submission.csv\",row.names = FALSE)"
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
   "duration": 7.284778,
   "end_time": "2022-06-14T11:07:47.141947",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-06-14T11:07:39.857169",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "d0fcf8fd",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:55.749906Z",
     "iopub.status.busy": "2022-06-16T09:49:55.747275Z",
     "iopub.status.idle": "2022-06-16T09:49:55.994020Z",
     "shell.execute_reply": "2022-06-16T09:49:55.992159Z"
    },
    "papermill": {
     "duration": 0.262315,
     "end_time": "2022-06-16T09:49:55.997319",
     "exception": false,
     "start_time": "2022-06-16T09:49:55.735004",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "tr<-read.csv(\"../input/spaceship-titanic/train.csv\",header=T, na.strings=c(\"\",\" \",\"NA\"))\n",
    "ts<-read.csv(\"../input/spaceship-titanic/test.csv\",header=T, na.strings=c(\"\",\" \",\"NA\"))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "d16272f8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:56.046833Z",
     "iopub.status.busy": "2022-06-16T09:49:56.014394Z",
     "iopub.status.idle": "2022-06-16T09:49:56.079525Z",
     "shell.execute_reply": "2022-06-16T09:49:56.077690Z"
    },
    "papermill": {
     "duration": 0.077176,
     "end_time": "2022-06-16T09:49:56.082062",
     "exception": false,
     "start_time": "2022-06-16T09:49:56.004886",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "1117"
      ],
      "text/latex": [
       "1117"
      ],
      "text/markdown": [
       "1117"
      ],
      "text/plain": [
       "[1] 1117"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "2324"
      ],
      "text/latex": [
       "2324"
      ],
      "text/markdown": [
       "2324"
      ],
      "text/plain": [
       "[1] 2324"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sum(is.na(ts))\n",
    "sum(is.na(tr))\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "0ab1bcd5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:56.101247Z",
     "iopub.status.busy": "2022-06-16T09:49:56.099703Z",
     "iopub.status.idle": "2022-06-16T09:49:56.155435Z",
     "shell.execute_reply": "2022-06-16T09:49:56.153369Z"
    },
    "papermill": {
     "duration": 0.068187,
     "end_time": "2022-06-16T09:49:56.158182",
     "exception": false,
     "start_time": "2022-06-16T09:49:56.089995",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       " PassengerId         HomePlanet         CryoSleep            Cabin          \n",
       " Length:8693        Length:8693        Length:8693        Length:8693       \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " Destination             Age            VIP             RoomService     \n",
       " Length:8693        Min.   : 0.00   Length:8693        Min.   :    0.0  \n",
       " Class :character   1st Qu.:19.00   Class :character   1st Qu.:    0.0  \n",
       " Mode  :character   Median :27.00   Mode  :character   Median :    0.0  \n",
       "                    Mean   :28.83                      Mean   :  224.7  \n",
       "                    3rd Qu.:38.00                      3rd Qu.:   47.0  \n",
       "                    Max.   :79.00                      Max.   :14327.0  \n",
       "                    NA's   :179                        NA's   :181      \n",
       "   FoodCourt        ShoppingMall          Spa              VRDeck       \n",
       " Min.   :    0.0   Min.   :    0.0   Min.   :    0.0   Min.   :    0.0  \n",
       " 1st Qu.:    0.0   1st Qu.:    0.0   1st Qu.:    0.0   1st Qu.:    0.0  \n",
       " Median :    0.0   Median :    0.0   Median :    0.0   Median :    0.0  \n",
       " Mean   :  458.1   Mean   :  173.7   Mean   :  311.1   Mean   :  304.9  \n",
       " 3rd Qu.:   76.0   3rd Qu.:   27.0   3rd Qu.:   59.0   3rd Qu.:   46.0  \n",
       " Max.   :29813.0   Max.   :23492.0   Max.   :22408.0   Max.   :24133.0  \n",
       " NA's   :183       NA's   :208       NA's   :183       NA's   :188      \n",
       "     Name           Transported       \n",
       " Length:8693        Length:8693       \n",
       " Class :character   Class :character  \n",
       " Mode  :character   Mode  :character  \n",
       "                                      \n",
       "                                      \n",
       "                                      \n",
       "                                      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t8693 obs. of  14 variables:\n",
      " $ PassengerId : chr  \"0001_01\" \"0002_01\" \"0003_01\" \"0003_02\" ...\n",
      " $ HomePlanet  : chr  \"Europa\" \"Earth\" \"Europa\" \"Europa\" ...\n",
      " $ CryoSleep   : chr  \"False\" \"False\" \"False\" \"False\" ...\n",
      " $ Cabin       : chr  \"B/0/P\" \"F/0/S\" \"A/0/S\" \"A/0/S\" ...\n",
      " $ Destination : chr  \"TRAPPIST-1e\" \"TRAPPIST-1e\" \"TRAPPIST-1e\" \"TRAPPIST-1e\" ...\n",
      " $ Age         : num  39 24 58 33 16 44 26 28 35 14 ...\n",
      " $ VIP         : chr  \"False\" \"False\" \"True\" \"False\" ...\n",
      " $ RoomService : num  0 109 43 0 303 0 42 0 0 0 ...\n",
      " $ FoodCourt   : num  0 9 3576 1283 70 ...\n",
      " $ ShoppingMall: num  0 25 0 371 151 0 3 0 17 0 ...\n",
      " $ Spa         : num  0 549 6715 3329 565 ...\n",
      " $ VRDeck      : num  0 44 49 193 2 0 0 NA 0 0 ...\n",
      " $ Name        : chr  \"Maham Ofracculy\" \"Juanna Vines\" \"Altark Susent\" \"Solam Susent\" ...\n",
      " $ Transported : chr  \"False\" \"True\" \"False\" \"False\" ...\n"
     ]
    }
   ],
   "source": [
    "summary(tr)\n",
    "str(tr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "c11c960f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:56.178058Z",
     "iopub.status.busy": "2022-06-16T09:49:56.176509Z",
     "iopub.status.idle": "2022-06-16T09:49:56.217314Z",
     "shell.execute_reply": "2022-06-16T09:49:56.215085Z"
    },
    "papermill": {
     "duration": 0.053423,
     "end_time": "2022-06-16T09:49:56.219747",
     "exception": false,
     "start_time": "2022-06-16T09:49:56.166324",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       " PassengerId         HomePlanet         CryoSleep            Cabin          \n",
       " Length:4277        Length:4277        Length:4277        Length:4277       \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " Destination             Age            VIP             RoomService     \n",
       " Length:4277        Min.   : 0.00   Length:4277        Min.   :    0.0  \n",
       " Class :character   1st Qu.:19.00   Class :character   1st Qu.:    0.0  \n",
       " Mode  :character   Median :26.00   Mode  :character   Median :    0.0  \n",
       "                    Mean   :28.66                      Mean   :  219.3  \n",
       "                    3rd Qu.:37.00                      3rd Qu.:   53.0  \n",
       "                    Max.   :79.00                      Max.   :11567.0  \n",
       "                    NA's   :91                         NA's   :82       \n",
       "   FoodCourt        ShoppingMall         Spa              VRDeck       \n",
       " Min.   :    0.0   Min.   :   0.0   Min.   :    0.0   Min.   :    0.0  \n",
       " 1st Qu.:    0.0   1st Qu.:   0.0   1st Qu.:    0.0   1st Qu.:    0.0  \n",
       " Median :    0.0   Median :   0.0   Median :    0.0   Median :    0.0  \n",
       " Mean   :  439.5   Mean   : 177.3   Mean   :  303.1   Mean   :  310.7  \n",
       " 3rd Qu.:   78.0   3rd Qu.:  33.0   3rd Qu.:   50.0   3rd Qu.:   36.0  \n",
       " Max.   :25273.0   Max.   :8292.0   Max.   :19844.0   Max.   :22272.0  \n",
       " NA's   :106       NA's   :98       NA's   :101       NA's   :80       \n",
       "     Name          \n",
       " Length:4277       \n",
       " Class :character  \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t4277 obs. of  13 variables:\n",
      " $ PassengerId : chr  \"0013_01\" \"0018_01\" \"0019_01\" \"0021_01\" ...\n",
      " $ HomePlanet  : chr  \"Earth\" \"Earth\" \"Europa\" \"Europa\" ...\n",
      " $ CryoSleep   : chr  \"True\" \"False\" \"True\" \"False\" ...\n",
      " $ Cabin       : chr  \"G/3/S\" \"F/4/S\" \"C/0/S\" \"C/1/S\" ...\n",
      " $ Destination : chr  \"TRAPPIST-1e\" \"TRAPPIST-1e\" \"55 Cancri e\" \"TRAPPIST-1e\" ...\n",
      " $ Age         : num  27 19 31 38 20 31 21 20 23 24 ...\n",
      " $ VIP         : chr  \"False\" \"False\" \"False\" \"False\" ...\n",
      " $ RoomService : num  0 0 0 0 10 0 0 0 0 0 ...\n",
      " $ FoodCourt   : num  0 9 0 6652 0 ...\n",
      " $ ShoppingMall: num  0 0 0 0 635 263 0 0 0 0 ...\n",
      " $ Spa         : num  0 2823 0 181 0 ...\n",
      " $ VRDeck      : num  0 0 0 585 0 60 0 0 0 0 ...\n",
      " $ Name        : chr  \"Nelly Carsoning\" \"Lerome Peckers\" \"Sabih Unhearfus\" \"Meratz Caltilter\" ...\n"
     ]
    }
   ],
   "source": [
    "summary(ts)\n",
    "str(ts)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "83315e1c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:56.239702Z",
     "iopub.status.busy": "2022-06-16T09:49:56.238098Z",
     "iopub.status.idle": "2022-06-16T09:49:56.301369Z",
     "shell.execute_reply": "2022-06-16T09:49:56.299494Z"
    },
    "papermill": {
     "duration": 0.076231,
     "end_time": "2022-06-16T09:49:56.304143",
     "exception": false,
     "start_time": "2022-06-16T09:49:56.227912",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "tr$Transported=as.factor(tr$Transported)\n",
    "tr$CryoSleep=as.factor(tr$CryoSleep)\n",
    "tr$VIP=as.factor(tr$VIP)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "91d307d2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:56.324356Z",
     "iopub.status.busy": "2022-06-16T09:49:56.322682Z",
     "iopub.status.idle": "2022-06-16T09:49:56.352254Z",
     "shell.execute_reply": "2022-06-16T09:49:56.350066Z"
    },
    "papermill": {
     "duration": 0.043076,
     "end_time": "2022-06-16T09:49:56.355550",
     "exception": false,
     "start_time": "2022-06-16T09:49:56.312474",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t8693 obs. of  14 variables:\n",
      " $ PassengerId : chr  \"0001_01\" \"0002_01\" \"0003_01\" \"0003_02\" ...\n",
      " $ HomePlanet  : chr  \"Europa\" \"Earth\" \"Europa\" \"Europa\" ...\n",
      " $ CryoSleep   : Factor w/ 2 levels \"False\",\"True\": 1 1 1 1 1 1 1 2 1 2 ...\n",
      " $ Cabin       : chr  \"B/0/P\" \"F/0/S\" \"A/0/S\" \"A/0/S\" ...\n",
      " $ Destination : chr  \"TRAPPIST-1e\" \"TRAPPIST-1e\" \"TRAPPIST-1e\" \"TRAPPIST-1e\" ...\n",
      " $ Age         : num  39 24 58 33 16 44 26 28 35 14 ...\n",
      " $ VIP         : Factor w/ 2 levels \"False\",\"True\": 1 1 2 1 1 1 1 1 1 1 ...\n",
      " $ RoomService : num  0 109 43 0 303 0 42 0 0 0 ...\n",
      " $ FoodCourt   : num  0 9 3576 1283 70 ...\n",
      " $ ShoppingMall: num  0 25 0 371 151 0 3 0 17 0 ...\n",
      " $ Spa         : num  0 549 6715 3329 565 ...\n",
      " $ VRDeck      : num  0 44 49 193 2 0 0 NA 0 0 ...\n",
      " $ Name        : chr  \"Maham Ofracculy\" \"Juanna Vines\" \"Altark Susent\" \"Solam Susent\" ...\n",
      " $ Transported : Factor w/ 2 levels \"False\",\"True\": 1 2 1 1 2 2 2 2 2 2 ...\n"
     ]
    }
   ],
   "source": [
    "str(tr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "b403d5f2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:56.376896Z",
     "iopub.status.busy": "2022-06-16T09:49:56.375249Z",
     "iopub.status.idle": "2022-06-16T09:49:56.391390Z",
     "shell.execute_reply": "2022-06-16T09:49:56.389480Z"
    },
    "papermill": {
     "duration": 0.035209,
     "end_time": "2022-06-16T09:49:56.399671",
     "exception": false,
     "start_time": "2022-06-16T09:49:56.364462",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "\n",
    "my_df <- data.frame(tr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "17410586",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:56.420609Z",
     "iopub.status.busy": "2022-06-16T09:49:56.418854Z",
     "iopub.status.idle": "2022-06-16T09:49:58.701855Z",
     "shell.execute_reply": "2022-06-16T09:49:58.699972Z"
    },
    "papermill": {
     "duration": 2.296255,
     "end_time": "2022-06-16T09:49:58.704527",
     "exception": false,
     "start_time": "2022-06-16T09:49:56.408272",
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
      "Loading required package: survival\n",
      "\n",
      "Loading required package: Formula\n",
      "\n",
      "Loading required package: ggplot2\n",
      "\n",
      "\n",
      "Attaching package: ‘Hmisc’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    format.pval, units\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(Hmisc)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "a982c6bd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:58.726909Z",
     "iopub.status.busy": "2022-06-16T09:49:58.725051Z",
     "iopub.status.idle": "2022-06-16T09:49:58.747901Z",
     "shell.execute_reply": "2022-06-16T09:49:58.745676Z"
    },
    "papermill": {
     "duration": 0.03715,
     "end_time": "2022-06-16T09:49:58.750923",
     "exception": false,
     "start_time": "2022-06-16T09:49:58.713773",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "188"
      ],
      "text/latex": [
       "188"
      ],
      "text/markdown": [
       "188"
      ],
      "text/plain": [
       "[1] 188"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sum(is.na(my_df$VRDeck))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "29ac9a91",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:58.778983Z",
     "iopub.status.busy": "2022-06-16T09:49:58.776927Z",
     "iopub.status.idle": "2022-06-16T09:49:58.842549Z",
     "shell.execute_reply": "2022-06-16T09:49:58.839857Z"
    },
    "papermill": {
     "duration": 0.085551,
     "end_time": "2022-06-16T09:49:58.845658",
     "exception": false,
     "start_time": "2022-06-16T09:49:58.760107",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 14</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>HomePlanet</th><th scope=col>CryoSleep</th><th scope=col>Cabin</th><th scope=col>Destination</th><th scope=col>Age</th><th scope=col>VIP</th><th scope=col>RoomService</th><th scope=col>FoodCourt</th><th scope=col>ShoppingMall</th><th scope=col>Spa</th><th scope=col>VRDeck</th><th scope=col>Name</th><th scope=col>Transported</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>8688</th><td>9275_03</td><td>Europa</td><td>NA   </td><td>A/97/P  </td><td>TRAPPIST-1e  </td><td>30</td><td>False</td><td>  0</td><td>3208</td><td>   0</td><td>   2</td><td> 330</td><td>Atlasym Conable  </td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8689</th><td>9276_01</td><td>Europa</td><td>False</td><td>A/98/P  </td><td>55 Cancri e  </td><td>41</td><td>True </td><td>  0</td><td>6819</td><td>   0</td><td>1643</td><td>  74</td><td>Gravior Noxnuther</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>8690</th><td>9278_01</td><td>Earth </td><td>True </td><td>G/1499/S</td><td>PSO J318.5-22</td><td>18</td><td>False</td><td>  0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>Kurta Mondalley  </td><td>False</td></tr>\n",
       "\t<tr><th scope=row>8691</th><td>9279_01</td><td>Earth </td><td>False</td><td>G/1500/S</td><td>TRAPPIST-1e  </td><td>26</td><td>False</td><td>  0</td><td>   0</td><td>1872</td><td>   1</td><td>   0</td><td>Fayey Connon     </td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8692</th><td>9280_01</td><td>Europa</td><td>False</td><td>E/608/S </td><td>55 Cancri e  </td><td>32</td><td>False</td><td>  0</td><td>1049</td><td>   0</td><td> 353</td><td>3235</td><td>Celeon Hontichre </td><td>False</td></tr>\n",
       "\t<tr><th scope=row>8693</th><td>9280_02</td><td>Europa</td><td>False</td><td>E/608/S </td><td>TRAPPIST-1e  </td><td>44</td><td>False</td><td>126</td><td>4688</td><td>   0</td><td>   0</td><td>  12</td><td>Propsh Hontichre </td><td>True </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 14\n",
       "\\begin{tabular}{r|llllllllllllll}\n",
       "  & PassengerId & HomePlanet & CryoSleep & Cabin & Destination & Age & VIP & RoomService & FoodCourt & ShoppingMall & Spa & VRDeck & Name & Transported\\\\\n",
       "  & <chr> & <chr> & <fct> & <chr> & <chr> & <dbl> & <fct> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <fct>\\\\\n",
       "\\hline\n",
       "\t8688 & 9275\\_03 & Europa & NA    & A/97/P   & TRAPPIST-1e   & 30 & False &   0 & 3208 &    0 &    2 &  330 & Atlasym Conable   & True \\\\\n",
       "\t8689 & 9276\\_01 & Europa & False & A/98/P   & 55 Cancri e   & 41 & True  &   0 & 6819 &    0 & 1643 &   74 & Gravior Noxnuther & False\\\\\n",
       "\t8690 & 9278\\_01 & Earth  & True  & G/1499/S & PSO J318.5-22 & 18 & False &   0 &    0 &    0 &    0 &    0 & Kurta Mondalley   & False\\\\\n",
       "\t8691 & 9279\\_01 & Earth  & False & G/1500/S & TRAPPIST-1e   & 26 & False &   0 &    0 & 1872 &    1 &    0 & Fayey Connon      & True \\\\\n",
       "\t8692 & 9280\\_01 & Europa & False & E/608/S  & 55 Cancri e   & 32 & False &   0 & 1049 &    0 &  353 & 3235 & Celeon Hontichre  & False\\\\\n",
       "\t8693 & 9280\\_02 & Europa & False & E/608/S  & TRAPPIST-1e   & 44 & False & 126 & 4688 &    0 &    0 &   12 & Propsh Hontichre  & True \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 14\n",
       "\n",
       "| <!--/--> | PassengerId &lt;chr&gt; | HomePlanet &lt;chr&gt; | CryoSleep &lt;fct&gt; | Cabin &lt;chr&gt; | Destination &lt;chr&gt; | Age &lt;dbl&gt; | VIP &lt;fct&gt; | RoomService &lt;dbl&gt; | FoodCourt &lt;dbl&gt; | ShoppingMall &lt;dbl&gt; | Spa &lt;dbl&gt; | VRDeck &lt;dbl&gt; | Name &lt;chr&gt; | Transported &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 8688 | 9275_03 | Europa | NA    | A/97/P   | TRAPPIST-1e   | 30 | False |   0 | 3208 |    0 |    2 |  330 | Atlasym Conable   | True  |\n",
       "| 8689 | 9276_01 | Europa | False | A/98/P   | 55 Cancri e   | 41 | True  |   0 | 6819 |    0 | 1643 |   74 | Gravior Noxnuther | False |\n",
       "| 8690 | 9278_01 | Earth  | True  | G/1499/S | PSO J318.5-22 | 18 | False |   0 |    0 |    0 |    0 |    0 | Kurta Mondalley   | False |\n",
       "| 8691 | 9279_01 | Earth  | False | G/1500/S | TRAPPIST-1e   | 26 | False |   0 |    0 | 1872 |    1 |    0 | Fayey Connon      | True  |\n",
       "| 8692 | 9280_01 | Europa | False | E/608/S  | 55 Cancri e   | 32 | False |   0 | 1049 |    0 |  353 | 3235 | Celeon Hontichre  | False |\n",
       "| 8693 | 9280_02 | Europa | False | E/608/S  | TRAPPIST-1e   | 44 | False | 126 | 4688 |    0 |    0 |   12 | Propsh Hontichre  | True  |\n",
       "\n"
      ],
      "text/plain": [
       "     PassengerId HomePlanet CryoSleep Cabin    Destination   Age VIP  \n",
       "8688 9275_03     Europa     NA        A/97/P   TRAPPIST-1e   30  False\n",
       "8689 9276_01     Europa     False     A/98/P   55 Cancri e   41  True \n",
       "8690 9278_01     Earth      True      G/1499/S PSO J318.5-22 18  False\n",
       "8691 9279_01     Earth      False     G/1500/S TRAPPIST-1e   26  False\n",
       "8692 9280_01     Europa     False     E/608/S  55 Cancri e   32  False\n",
       "8693 9280_02     Europa     False     E/608/S  TRAPPIST-1e   44  False\n",
       "     RoomService FoodCourt ShoppingMall Spa  VRDeck Name             \n",
       "8688   0         3208         0            2  330   Atlasym Conable  \n",
       "8689   0         6819         0         1643   74   Gravior Noxnuther\n",
       "8690   0            0         0            0    0   Kurta Mondalley  \n",
       "8691   0            0      1872            1    0   Fayey Connon     \n",
       "8692   0         1049         0          353 3235   Celeon Hontichre \n",
       "8693 126         4688         0            0   12   Propsh Hontichre \n",
       "     Transported\n",
       "8688 True       \n",
       "8689 False      \n",
       "8690 False      \n",
       "8691 True       \n",
       "8692 False      \n",
       "8693 True       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#imputing all the numeric variable\n",
    "\n",
    "my_df$VRDeck<-impute(my_df$VRDeck, mean)\n",
    "my_df$Age<-impute(my_df$Age, median)\n",
    "my_df$RoomService <-impute(my_df$RoomService , median)\n",
    "my_df$FoodCourt<-impute(my_df$FoodCourt, median)\n",
    "my_df$ShoppingMall<-impute(my_df$ShoppingMall, median)\n",
    "my_df$Spa<-impute(my_df$Spa, median)\n",
    "\n",
    "\n",
    "tail(my_df)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "85d9df32",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:58.869600Z",
     "iopub.status.busy": "2022-06-16T09:49:58.867653Z",
     "iopub.status.idle": "2022-06-16T09:49:58.892337Z",
     "shell.execute_reply": "2022-06-16T09:49:58.889979Z"
    },
    "papermill": {
     "duration": 0.040096,
     "end_time": "2022-06-16T09:49:58.895869",
     "exception": false,
     "start_time": "2022-06-16T09:49:58.855773",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "1202"
      ],
      "text/latex": [
       "1202"
      ],
      "text/markdown": [
       "1202"
      ],
      "text/plain": [
       "[1] 1202"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sum(is.na(my_df))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "c52789a5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:58.920641Z",
     "iopub.status.busy": "2022-06-16T09:49:58.918383Z",
     "iopub.status.idle": "2022-06-16T09:49:58.965102Z",
     "shell.execute_reply": "2022-06-16T09:49:58.962904Z"
    },
    "papermill": {
     "duration": 0.06126,
     "end_time": "2022-06-16T09:49:58.967987",
     "exception": false,
     "start_time": "2022-06-16T09:49:58.906727",
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
      " 179 values imputed to 27 \n",
      "\n",
      "\n",
      " 181 values imputed to 0 \n",
      "\n",
      "\n",
      " 183 values imputed to 0 \n",
      "\n",
      "\n",
      " 208 values imputed to 0 \n",
      "\n",
      "\n",
      " 183 values imputed to 0 \n",
      "\n",
      "\n",
      " 188 values imputed to 304.8548 \n",
      "\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       " PassengerId         HomePlanet        CryoSleep       Cabin          \n",
       " Length:8693        Length:8693        False:5439   Length:8693       \n",
       " Class :character   Class :character   True :3037   Class :character  \n",
       " Mode  :character   Mode  :character   NA's : 217   Mode  :character  \n",
       "                                                                      \n",
       "                                                                      \n",
       "                                                                      \n",
       " Destination             Age           VIP        RoomService   \n",
       " Length:8693        Min.   : 0.00   False:8291   Min.   :    0  \n",
       " Class :character   1st Qu.:20.00   True : 199   1st Qu.:    0  \n",
       " Mode  :character   Median :27.00   NA's : 203   Median :    0  \n",
       "                    Mean   :28.79                Mean   :  220  \n",
       "                    3rd Qu.:37.00                3rd Qu.:   41  \n",
       "                    Max.   :79.00                Max.   :14327  \n",
       "   FoodCourt        ShoppingMall          Spa              VRDeck       \n",
       " Min.   :    0.0   Min.   :    0.0   Min.   :    0.0   Min.   :    0.0  \n",
       " 1st Qu.:    0.0   1st Qu.:    0.0   1st Qu.:    0.0   1st Qu.:    0.0  \n",
       " Median :    0.0   Median :    0.0   Median :    0.0   Median :    0.0  \n",
       " Mean   :  448.4   Mean   :  169.6   Mean   :  304.6   Mean   :  304.9  \n",
       " 3rd Qu.:   61.0   3rd Qu.:   22.0   3rd Qu.:   53.0   3rd Qu.:   71.0  \n",
       " Max.   :29813.0   Max.   :23492.0   Max.   :22408.0   Max.   :24133.0  \n",
       "     Name           Transported \n",
       " Length:8693        False:4315  \n",
       " Class :character   True :4378  \n",
       " Mode  :character               \n",
       "                                \n",
       "                                \n",
       "                                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(my_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "68b75fdc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:58.995500Z",
     "iopub.status.busy": "2022-06-16T09:49:58.993442Z",
     "iopub.status.idle": "2022-06-16T09:49:59.065531Z",
     "shell.execute_reply": "2022-06-16T09:49:59.063437Z"
    },
    "papermill": {
     "duration": 0.088297,
     "end_time": "2022-06-16T09:49:59.068388",
     "exception": false,
     "start_time": "2022-06-16T09:49:58.980091",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
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
    },
    {
     "data": {
      "text/html": [
       "201"
      ],
      "text/latex": [
       "201"
      ],
      "text/markdown": [
       "201"
      ],
      "text/plain": [
       "[1] 201"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "217"
      ],
      "text/latex": [
       "217"
      ],
      "text/markdown": [
       "217"
      ],
      "text/plain": [
       "[1] 217"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "199"
      ],
      "text/latex": [
       "199"
      ],
      "text/markdown": [
       "199"
      ],
      "text/plain": [
       "[1] 199"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "182"
      ],
      "text/latex": [
       "182"
      ],
      "text/markdown": [
       "182"
      ],
      "text/plain": [
       "[1] 182"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "203"
      ],
      "text/latex": [
       "203"
      ],
      "text/markdown": [
       "203"
      ],
      "text/plain": [
       "[1] 203"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "200"
      ],
      "text/latex": [
       "200"
      ],
      "text/markdown": [
       "200"
      ],
      "text/plain": [
       "[1] 200"
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
    "sum(is.na(my_df$PassengerId))\n",
    "sum(is.na(my_df$HomePlanet))\n",
    "sum(is.na(my_df$CryoSleep))\n",
    "sum(is.na(my_df$Cabin))\n",
    "sum(is.na(my_df$Destination))\n",
    "sum(is.na(my_df$VIP))\n",
    "sum(is.na(my_df$Name))\n",
    "sum(is.na(my_df$Transported))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "d61e8d8d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:59.096017Z",
     "iopub.status.busy": "2022-06-16T09:49:59.094093Z",
     "iopub.status.idle": "2022-06-16T09:49:59.192325Z",
     "shell.execute_reply": "2022-06-16T09:49:59.189824Z"
    },
    "papermill": {
     "duration": 0.115209,
     "end_time": "2022-06-16T09:49:59.195547",
     "exception": false,
     "start_time": "2022-06-16T09:49:59.080338",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 14</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>HomePlanet</th><th scope=col>CryoSleep</th><th scope=col>Cabin</th><th scope=col>Destination</th><th scope=col>Age</th><th scope=col>VIP</th><th scope=col>RoomService</th><th scope=col>FoodCourt</th><th scope=col>ShoppingMall</th><th scope=col>Spa</th><th scope=col>VRDeck</th><th scope=col>Name</th><th scope=col>Transported</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0001_01</td><td>Europa</td><td>False</td><td>B/0/P</td><td>TRAPPIST-1e  </td><td>39</td><td>False</td><td>  0</td><td>   0</td><td>  0</td><td>   0</td><td>  0</td><td>Maham Ofracculy  </td><td>False</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0002_01</td><td>Earth </td><td>False</td><td>F/0/S</td><td>TRAPPIST-1e  </td><td>24</td><td>False</td><td>109</td><td>   9</td><td> 25</td><td> 549</td><td> 44</td><td>Juanna Vines     </td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0003_01</td><td>Europa</td><td>False</td><td>A/0/S</td><td>TRAPPIST-1e  </td><td>58</td><td>True </td><td> 43</td><td>3576</td><td>  0</td><td>6715</td><td> 49</td><td>Altark Susent    </td><td>False</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>0003_02</td><td>Europa</td><td>False</td><td>A/0/S</td><td>TRAPPIST-1e  </td><td>33</td><td>False</td><td>  0</td><td>1283</td><td>371</td><td>3329</td><td>193</td><td>Solam Susent     </td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0004_01</td><td>Earth </td><td>False</td><td>F/1/S</td><td>TRAPPIST-1e  </td><td>16</td><td>False</td><td>303</td><td>  70</td><td>151</td><td> 565</td><td>  2</td><td>Willy Santantines</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>6</th><td>0005_01</td><td>Earth </td><td>False</td><td>F/0/P</td><td>PSO J318.5-22</td><td>44</td><td>False</td><td>  0</td><td> 483</td><td>  0</td><td> 291</td><td>  0</td><td>Sandie Hinetthews</td><td>True </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 14\n",
       "\\begin{tabular}{r|llllllllllllll}\n",
       "  & PassengerId & HomePlanet & CryoSleep & Cabin & Destination & Age & VIP & RoomService & FoodCourt & ShoppingMall & Spa & VRDeck & Name & Transported\\\\\n",
       "  & <chr> & <chr> & <fct> & <chr> & <chr> & <dbl> & <fct> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 0001\\_01 & Europa & False & B/0/P & TRAPPIST-1e   & 39 & False &   0 &    0 &   0 &    0 &   0 & Maham Ofracculy   & False\\\\\n",
       "\t2 & 0002\\_01 & Earth  & False & F/0/S & TRAPPIST-1e   & 24 & False & 109 &    9 &  25 &  549 &  44 & Juanna Vines      & True \\\\\n",
       "\t3 & 0003\\_01 & Europa & False & A/0/S & TRAPPIST-1e   & 58 & True  &  43 & 3576 &   0 & 6715 &  49 & Altark Susent     & False\\\\\n",
       "\t4 & 0003\\_02 & Europa & False & A/0/S & TRAPPIST-1e   & 33 & False &   0 & 1283 & 371 & 3329 & 193 & Solam Susent      & False\\\\\n",
       "\t5 & 0004\\_01 & Earth  & False & F/1/S & TRAPPIST-1e   & 16 & False & 303 &   70 & 151 &  565 &   2 & Willy Santantines & True \\\\\n",
       "\t6 & 0005\\_01 & Earth  & False & F/0/P & PSO J318.5-22 & 44 & False &   0 &  483 &   0 &  291 &   0 & Sandie Hinetthews & True \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 14\n",
       "\n",
       "| <!--/--> | PassengerId &lt;chr&gt; | HomePlanet &lt;chr&gt; | CryoSleep &lt;fct&gt; | Cabin &lt;chr&gt; | Destination &lt;chr&gt; | Age &lt;dbl&gt; | VIP &lt;fct&gt; | RoomService &lt;dbl&gt; | FoodCourt &lt;dbl&gt; | ShoppingMall &lt;dbl&gt; | Spa &lt;dbl&gt; | VRDeck &lt;dbl&gt; | Name &lt;chr&gt; | Transported &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 0001_01 | Europa | False | B/0/P | TRAPPIST-1e   | 39 | False |   0 |    0 |   0 |    0 |   0 | Maham Ofracculy   | False |\n",
       "| 2 | 0002_01 | Earth  | False | F/0/S | TRAPPIST-1e   | 24 | False | 109 |    9 |  25 |  549 |  44 | Juanna Vines      | True  |\n",
       "| 3 | 0003_01 | Europa | False | A/0/S | TRAPPIST-1e   | 58 | True  |  43 | 3576 |   0 | 6715 |  49 | Altark Susent     | False |\n",
       "| 4 | 0003_02 | Europa | False | A/0/S | TRAPPIST-1e   | 33 | False |   0 | 1283 | 371 | 3329 | 193 | Solam Susent      | False |\n",
       "| 5 | 0004_01 | Earth  | False | F/1/S | TRAPPIST-1e   | 16 | False | 303 |   70 | 151 |  565 |   2 | Willy Santantines | True  |\n",
       "| 6 | 0005_01 | Earth  | False | F/0/P | PSO J318.5-22 | 44 | False |   0 |  483 |   0 |  291 |   0 | Sandie Hinetthews | True  |\n",
       "\n"
      ],
      "text/plain": [
       "  PassengerId HomePlanet CryoSleep Cabin Destination   Age VIP   RoomService\n",
       "1 0001_01     Europa     False     B/0/P TRAPPIST-1e   39  False   0        \n",
       "2 0002_01     Earth      False     F/0/S TRAPPIST-1e   24  False 109        \n",
       "3 0003_01     Europa     False     A/0/S TRAPPIST-1e   58  True   43        \n",
       "4 0003_02     Europa     False     A/0/S TRAPPIST-1e   33  False   0        \n",
       "5 0004_01     Earth      False     F/1/S TRAPPIST-1e   16  False 303        \n",
       "6 0005_01     Earth      False     F/0/P PSO J318.5-22 44  False   0        \n",
       "  FoodCourt ShoppingMall Spa  VRDeck Name              Transported\n",
       "1    0        0             0   0    Maham Ofracculy   False      \n",
       "2    9       25           549  44    Juanna Vines      True       \n",
       "3 3576        0          6715  49    Altark Susent     False      \n",
       "4 1283      371          3329 193    Solam Susent      False      \n",
       "5   70      151           565   2    Willy Santantines True       \n",
       "6  483        0           291   0    Sandie Hinetthews True       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      " 201 values imputed to character \n",
      "\n",
      "\n",
      " 217 values imputed to False \n",
      "\n",
      "\n",
      " 199 values imputed to character \n",
      "\n",
      "\n",
      " 182 values imputed to character \n",
      "\n",
      "\n",
      " 179 values imputed to 27 \n",
      "\n",
      "\n",
      " 203 values imputed to False \n",
      "\n",
      "\n",
      " 181 values imputed to 0 \n",
      "\n",
      "\n",
      " 183 values imputed to 0 \n",
      "\n",
      "\n",
      " 208 values imputed to 0 \n",
      "\n",
      "\n",
      " 183 values imputed to 0 \n",
      "\n",
      "\n",
      " 188 values imputed to 304.8548 \n",
      "\n",
      "\n",
      " 200 values imputed to character \n",
      "\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       " PassengerId         HomePlanet        CryoSleep       Cabin          \n",
       " Length:8693        Length:8693        False:5656   Length:8693       \n",
       " Class :character   Class :impute      True :3037   Class :impute     \n",
       " Mode  :character   Mode  :character                Mode  :character  \n",
       "                                                                      \n",
       "                                                                      \n",
       "                                                                      \n",
       " Destination             Age           VIP        RoomService   \n",
       " Length:8693        Min.   : 0.00   False:8494   Min.   :    0  \n",
       " Class :impute      1st Qu.:20.00   True : 199   1st Qu.:    0  \n",
       " Mode  :character   Median :27.00                Median :    0  \n",
       "                    Mean   :28.79                Mean   :  220  \n",
       "                    3rd Qu.:37.00                3rd Qu.:   41  \n",
       "                    Max.   :79.00                Max.   :14327  \n",
       "   FoodCourt        ShoppingMall          Spa              VRDeck       \n",
       " Min.   :    0.0   Min.   :    0.0   Min.   :    0.0   Min.   :    0.0  \n",
       " 1st Qu.:    0.0   1st Qu.:    0.0   1st Qu.:    0.0   1st Qu.:    0.0  \n",
       " Median :    0.0   Median :    0.0   Median :    0.0   Median :    0.0  \n",
       " Mean   :  448.4   Mean   :  169.6   Mean   :  304.6   Mean   :  304.9  \n",
       " 3rd Qu.:   61.0   3rd Qu.:   22.0   3rd Qu.:   53.0   3rd Qu.:   71.0  \n",
       " Max.   :29813.0   Max.   :23492.0   Max.   :22408.0   Max.   :24133.0  \n",
       "     Name           Transported \n",
       " Length:8693        False:4315  \n",
       " Class :impute      True :4378  \n",
       " Mode  :character               \n",
       "                                \n",
       "                                \n",
       "                                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "my_df$HomePlanet<-impute(my_df$HomePlanet, mode)\n",
    "my_df$CryoSleep<-impute(my_df$CryoSleep, mode)\n",
    "my_df$Cabin<-impute(my_df$Cabin, mode)\n",
    "my_df$Destination<-impute(my_df$Destination, mode)\n",
    "my_df$VIP<-impute(my_df$VIP, mode)\n",
    "my_df$Name<-impute(my_df$Name, mode)\n",
    "\n",
    "head(my_df)\n",
    "summary(my_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "638e3ff5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:59.222857Z",
     "iopub.status.busy": "2022-06-16T09:49:59.220865Z",
     "iopub.status.idle": "2022-06-16T09:49:59.296535Z",
     "shell.execute_reply": "2022-06-16T09:49:59.293923Z"
    },
    "papermill": {
     "duration": 0.093168,
     "end_time": "2022-06-16T09:49:59.300617",
     "exception": false,
     "start_time": "2022-06-16T09:49:59.207449",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
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
    "# again check for missing values for character and factor variables after imputaion\n",
    "\n",
    "sum(is.na(my_df$PassengerId))\n",
    "sum(is.na(my_df$HomePlanet))\n",
    "sum(is.na(my_df$CryoSleep))\n",
    "sum(is.na(my_df$Cabin))\n",
    "sum(is.na(my_df$Destination))\n",
    "sum(is.na(my_df$VIP))\n",
    "sum(is.na(my_df$Name))\n",
    "sum(is.na(my_df$Transported))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "21fe493f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:59.330757Z",
     "iopub.status.busy": "2022-06-16T09:49:59.328541Z",
     "iopub.status.idle": "2022-06-16T09:49:59.390854Z",
     "shell.execute_reply": "2022-06-16T09:49:59.389006Z"
    },
    "papermill": {
     "duration": 0.079911,
     "end_time": "2022-06-16T09:49:59.393368",
     "exception": false,
     "start_time": "2022-06-16T09:49:59.313457",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>HomePlanet</th><th scope=col>CryoSleep</th><th scope=col>Cabin</th><th scope=col>Destination</th><th scope=col>Age</th><th scope=col>VIP</th><th scope=col>RoomService</th><th scope=col>FoodCourt</th><th scope=col>ShoppingMall</th><th scope=col>Spa</th><th scope=col>VRDeck</th><th scope=col>Name</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;impute&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>4272</th><td>9266_01</td><td>Earth </td><td>False</td><td>F/1796/S</td><td>TRAPPIST-1e  </td><td>40</td><td>False</td><td>0</td><td> 865</td><td> 0</td><td> 3</td><td>  0</td><td>Danna Peter     </td></tr>\n",
       "\t<tr><th scope=row>4273</th><td>9266_02</td><td>Earth </td><td>True </td><td>G/1496/S</td><td>TRAPPIST-1e  </td><td>34</td><td>False</td><td>0</td><td>   0</td><td> 0</td><td> 0</td><td>  0</td><td>Jeron Peter     </td></tr>\n",
       "\t<tr><th scope=row>4274</th><td>9269_01</td><td>Earth </td><td>False</td><td>NA      </td><td>TRAPPIST-1e  </td><td>42</td><td>False</td><td>0</td><td> 847</td><td>17</td><td>10</td><td>144</td><td>Matty Scheron   </td></tr>\n",
       "\t<tr><th scope=row>4275</th><td>9271_01</td><td>Mars  </td><td>True </td><td>D/296/P </td><td>55 Cancri e  </td><td>26</td><td>False</td><td>0</td><td>   0</td><td> 0</td><td> 0</td><td>  0</td><td>Jayrin Pore     </td></tr>\n",
       "\t<tr><th scope=row>4276</th><td>9273_01</td><td>Europa</td><td>False</td><td>D/297/P </td><td>NA           </td><td>26</td><td>False</td><td>0</td><td>2680</td><td> 0</td><td> 0</td><td>523</td><td>Kitakan Conale  </td></tr>\n",
       "\t<tr><th scope=row>4277</th><td>9277_01</td><td>Earth </td><td>True </td><td>G/1498/S</td><td>PSO J318.5-22</td><td>43</td><td>False</td><td>0</td><td>   0</td><td> 0</td><td> 0</td><td>  0</td><td>Lilace Leonzaley</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & PassengerId & HomePlanet & CryoSleep & Cabin & Destination & Age & VIP & RoomService & FoodCourt & ShoppingMall & Spa & VRDeck & Name\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <impute> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t4272 & 9266\\_01 & Earth  & False & F/1796/S & TRAPPIST-1e   & 40 & False & 0 &  865 &  0 &  3 &   0 & Danna Peter     \\\\\n",
       "\t4273 & 9266\\_02 & Earth  & True  & G/1496/S & TRAPPIST-1e   & 34 & False & 0 &    0 &  0 &  0 &   0 & Jeron Peter     \\\\\n",
       "\t4274 & 9269\\_01 & Earth  & False & NA       & TRAPPIST-1e   & 42 & False & 0 &  847 & 17 & 10 & 144 & Matty Scheron   \\\\\n",
       "\t4275 & 9271\\_01 & Mars   & True  & D/296/P  & 55 Cancri e   & 26 & False & 0 &    0 &  0 &  0 &   0 & Jayrin Pore     \\\\\n",
       "\t4276 & 9273\\_01 & Europa & False & D/297/P  & NA            & 26 & False & 0 & 2680 &  0 &  0 & 523 & Kitakan Conale  \\\\\n",
       "\t4277 & 9277\\_01 & Earth  & True  & G/1498/S & PSO J318.5-22 & 43 & False & 0 &    0 &  0 &  0 &   0 & Lilace Leonzaley\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 13\n",
       "\n",
       "| <!--/--> | PassengerId &lt;chr&gt; | HomePlanet &lt;chr&gt; | CryoSleep &lt;chr&gt; | Cabin &lt;chr&gt; | Destination &lt;chr&gt; | Age &lt;impute&gt; | VIP &lt;chr&gt; | RoomService &lt;dbl&gt; | FoodCourt &lt;dbl&gt; | ShoppingMall &lt;dbl&gt; | Spa &lt;dbl&gt; | VRDeck &lt;dbl&gt; | Name &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 4272 | 9266_01 | Earth  | False | F/1796/S | TRAPPIST-1e   | 40 | False | 0 |  865 |  0 |  3 |   0 | Danna Peter      |\n",
       "| 4273 | 9266_02 | Earth  | True  | G/1496/S | TRAPPIST-1e   | 34 | False | 0 |    0 |  0 |  0 |   0 | Jeron Peter      |\n",
       "| 4274 | 9269_01 | Earth  | False | NA       | TRAPPIST-1e   | 42 | False | 0 |  847 | 17 | 10 | 144 | Matty Scheron    |\n",
       "| 4275 | 9271_01 | Mars   | True  | D/296/P  | 55 Cancri e   | 26 | False | 0 |    0 |  0 |  0 |   0 | Jayrin Pore      |\n",
       "| 4276 | 9273_01 | Europa | False | D/297/P  | NA            | 26 | False | 0 | 2680 |  0 |  0 | 523 | Kitakan Conale   |\n",
       "| 4277 | 9277_01 | Earth  | True  | G/1498/S | PSO J318.5-22 | 43 | False | 0 |    0 |  0 |  0 |   0 | Lilace Leonzaley |\n",
       "\n"
      ],
      "text/plain": [
       "     PassengerId HomePlanet CryoSleep Cabin    Destination   Age VIP  \n",
       "4272 9266_01     Earth      False     F/1796/S TRAPPIST-1e   40  False\n",
       "4273 9266_02     Earth      True      G/1496/S TRAPPIST-1e   34  False\n",
       "4274 9269_01     Earth      False     NA       TRAPPIST-1e   42  False\n",
       "4275 9271_01     Mars       True      D/296/P  55 Cancri e   26  False\n",
       "4276 9273_01     Europa     False     D/297/P  NA            26  False\n",
       "4277 9277_01     Earth      True      G/1498/S PSO J318.5-22 43  False\n",
       "     RoomService FoodCourt ShoppingMall Spa VRDeck Name            \n",
       "4272 0            865       0            3    0    Danna Peter     \n",
       "4273 0              0       0            0    0    Jeron Peter     \n",
       "4274 0            847      17           10  144    Matty Scheron   \n",
       "4275 0              0       0            0    0    Jayrin Pore     \n",
       "4276 0           2680       0            0  523    Kitakan Conale  \n",
       "4277 0              0       0            0    0    Lilace Leonzaley"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#test data\n",
    "#imputing all the numeric variable\n",
    "library(Hmisc)\n",
    "ts$VRDeck<-impute(ts$VRDeck, median)\n",
    "ts$Age<-impute(ts$Age, median)\n",
    "ts$RoomService <-impute(ts$RoomService , median)\n",
    "ts$FoodCourt<-impute(ts$FoodCourt, median)\n",
    "ts$ShoppingMall<-impute(ts$ShoppingMall, median)\n",
    "ts$Spa<-impute(ts$Spa, median)\n",
    "\n",
    "\n",
    "tail(ts)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "3dcd23c7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:59.423165Z",
     "iopub.status.busy": "2022-06-16T09:49:59.421581Z",
     "iopub.status.idle": "2022-06-16T09:49:59.478930Z",
     "shell.execute_reply": "2022-06-16T09:49:59.477111Z"
    },
    "papermill": {
     "duration": 0.074951,
     "end_time": "2022-06-16T09:49:59.481462",
     "exception": false,
     "start_time": "2022-06-16T09:49:59.406511",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
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
    },
    {
     "data": {
      "text/html": [
       "87"
      ],
      "text/latex": [
       "87"
      ],
      "text/markdown": [
       "87"
      ],
      "text/plain": [
       "[1] 87"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "93"
      ],
      "text/latex": [
       "93"
      ],
      "text/markdown": [
       "93"
      ],
      "text/plain": [
       "[1] 93"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "100"
      ],
      "text/latex": [
       "100"
      ],
      "text/markdown": [
       "100"
      ],
      "text/plain": [
       "[1] 100"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "92"
      ],
      "text/latex": [
       "92"
      ],
      "text/markdown": [
       "92"
      ],
      "text/plain": [
       "[1] 92"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "93"
      ],
      "text/latex": [
       "93"
      ],
      "text/markdown": [
       "93"
      ],
      "text/plain": [
       "[1] 93"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "94"
      ],
      "text/latex": [
       "94"
      ],
      "text/markdown": [
       "94"
      ],
      "text/plain": [
       "[1] 94"
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
    "sum(is.na(ts$PassengerId))\n",
    "sum(is.na(ts$HomePlanet))\n",
    "sum(is.na(ts$CryoSleep))\n",
    "sum(is.na(ts$Cabin))\n",
    "sum(is.na(ts$Destination))\n",
    "sum(is.na(ts$VIP))\n",
    "sum(is.na(ts$Name))\n",
    "sum(is.na(ts$Transported))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "5fbc3d96",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:59.513271Z",
     "iopub.status.busy": "2022-06-16T09:49:59.511678Z",
     "iopub.status.idle": "2022-06-16T09:49:59.573293Z",
     "shell.execute_reply": "2022-06-16T09:49:59.571217Z"
    },
    "papermill": {
     "duration": 0.080906,
     "end_time": "2022-06-16T09:49:59.576502",
     "exception": false,
     "start_time": "2022-06-16T09:49:59.495596",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>HomePlanet</th><th scope=col>CryoSleep</th><th scope=col>Cabin</th><th scope=col>Destination</th><th scope=col>Age</th><th scope=col>VIP</th><th scope=col>RoomService</th><th scope=col>FoodCourt</th><th scope=col>ShoppingMall</th><th scope=col>Spa</th><th scope=col>VRDeck</th><th scope=col>Name</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0013_01</td><td>Earth </td><td>True </td><td>G/3/S</td><td>TRAPPIST-1e</td><td>27</td><td>False</td><td> 0</td><td>   0</td><td>  0</td><td>   0</td><td>  0</td><td>Nelly Carsoning </td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0018_01</td><td>Earth </td><td>False</td><td>F/4/S</td><td>TRAPPIST-1e</td><td>19</td><td>False</td><td> 0</td><td>   9</td><td>  0</td><td>2823</td><td>  0</td><td>Lerome Peckers  </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0019_01</td><td>Europa</td><td>True </td><td>C/0/S</td><td>55 Cancri e</td><td>31</td><td>False</td><td> 0</td><td>   0</td><td>  0</td><td>   0</td><td>  0</td><td>Sabih Unhearfus </td></tr>\n",
       "\t<tr><th scope=row>4</th><td>0021_01</td><td>Europa</td><td>False</td><td>C/1/S</td><td>TRAPPIST-1e</td><td>38</td><td>False</td><td> 0</td><td>6652</td><td>  0</td><td> 181</td><td>585</td><td>Meratz Caltilter</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0023_01</td><td>Earth </td><td>False</td><td>F/5/S</td><td>TRAPPIST-1e</td><td>20</td><td>False</td><td>10</td><td>   0</td><td>635</td><td>   0</td><td>  0</td><td>Brence Harperez </td></tr>\n",
       "\t<tr><th scope=row>6</th><td>0027_01</td><td>Earth </td><td>False</td><td>F/7/P</td><td>TRAPPIST-1e</td><td>31</td><td>False</td><td> 0</td><td>1615</td><td>263</td><td> 113</td><td> 60</td><td>Karlen Ricks    </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & PassengerId & HomePlanet & CryoSleep & Cabin & Destination & Age & VIP & RoomService & FoodCourt & ShoppingMall & Spa & VRDeck & Name\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 0013\\_01 & Earth  & True  & G/3/S & TRAPPIST-1e & 27 & False &  0 &    0 &   0 &    0 &   0 & Nelly Carsoning \\\\\n",
       "\t2 & 0018\\_01 & Earth  & False & F/4/S & TRAPPIST-1e & 19 & False &  0 &    9 &   0 & 2823 &   0 & Lerome Peckers  \\\\\n",
       "\t3 & 0019\\_01 & Europa & True  & C/0/S & 55 Cancri e & 31 & False &  0 &    0 &   0 &    0 &   0 & Sabih Unhearfus \\\\\n",
       "\t4 & 0021\\_01 & Europa & False & C/1/S & TRAPPIST-1e & 38 & False &  0 & 6652 &   0 &  181 & 585 & Meratz Caltilter\\\\\n",
       "\t5 & 0023\\_01 & Earth  & False & F/5/S & TRAPPIST-1e & 20 & False & 10 &    0 & 635 &    0 &   0 & Brence Harperez \\\\\n",
       "\t6 & 0027\\_01 & Earth  & False & F/7/P & TRAPPIST-1e & 31 & False &  0 & 1615 & 263 &  113 &  60 & Karlen Ricks    \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 13\n",
       "\n",
       "| <!--/--> | PassengerId &lt;chr&gt; | HomePlanet &lt;chr&gt; | CryoSleep &lt;chr&gt; | Cabin &lt;chr&gt; | Destination &lt;chr&gt; | Age &lt;dbl&gt; | VIP &lt;chr&gt; | RoomService &lt;dbl&gt; | FoodCourt &lt;dbl&gt; | ShoppingMall &lt;dbl&gt; | Spa &lt;dbl&gt; | VRDeck &lt;dbl&gt; | Name &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 0013_01 | Earth  | True  | G/3/S | TRAPPIST-1e | 27 | False |  0 |    0 |   0 |    0 |   0 | Nelly Carsoning  |\n",
       "| 2 | 0018_01 | Earth  | False | F/4/S | TRAPPIST-1e | 19 | False |  0 |    9 |   0 | 2823 |   0 | Lerome Peckers   |\n",
       "| 3 | 0019_01 | Europa | True  | C/0/S | 55 Cancri e | 31 | False |  0 |    0 |   0 |    0 |   0 | Sabih Unhearfus  |\n",
       "| 4 | 0021_01 | Europa | False | C/1/S | TRAPPIST-1e | 38 | False |  0 | 6652 |   0 |  181 | 585 | Meratz Caltilter |\n",
       "| 5 | 0023_01 | Earth  | False | F/5/S | TRAPPIST-1e | 20 | False | 10 |    0 | 635 |    0 |   0 | Brence Harperez  |\n",
       "| 6 | 0027_01 | Earth  | False | F/7/P | TRAPPIST-1e | 31 | False |  0 | 1615 | 263 |  113 |  60 | Karlen Ricks     |\n",
       "\n"
      ],
      "text/plain": [
       "  PassengerId HomePlanet CryoSleep Cabin Destination Age VIP   RoomService\n",
       "1 0013_01     Earth      True      G/3/S TRAPPIST-1e 27  False  0         \n",
       "2 0018_01     Earth      False     F/4/S TRAPPIST-1e 19  False  0         \n",
       "3 0019_01     Europa     True      C/0/S 55 Cancri e 31  False  0         \n",
       "4 0021_01     Europa     False     C/1/S TRAPPIST-1e 38  False  0         \n",
       "5 0023_01     Earth      False     F/5/S TRAPPIST-1e 20  False 10         \n",
       "6 0027_01     Earth      False     F/7/P TRAPPIST-1e 31  False  0         \n",
       "  FoodCourt ShoppingMall Spa  VRDeck Name            \n",
       "1    0        0             0   0    Nelly Carsoning \n",
       "2    9        0          2823   0    Lerome Peckers  \n",
       "3    0        0             0   0    Sabih Unhearfus \n",
       "4 6652        0           181 585    Meratz Caltilter\n",
       "5    0      635             0   0    Brence Harperez \n",
       "6 1615      263           113  60    Karlen Ricks    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      " 87 values imputed to character \n",
      "\n",
      "\n",
      " 93 values imputed to character \n",
      "\n",
      "\n",
      " 100 values imputed to character \n",
      "\n",
      "\n",
      " 92 values imputed to character \n",
      "\n",
      "\n",
      " 91 values imputed to 26 \n",
      "\n",
      "\n",
      " 93 values imputed to character \n",
      "\n",
      "\n",
      " 82 values imputed to 0 \n",
      "\n",
      "\n",
      " 106 values imputed to 0 \n",
      "\n",
      "\n",
      " 98 values imputed to 0 \n",
      "\n",
      "\n",
      " 101 values imputed to 0 \n",
      "\n",
      "\n",
      " 80 values imputed to 0 \n",
      "\n",
      "\n",
      " 94 values imputed to character \n",
      "\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       " PassengerId         HomePlanet         CryoSleep            Cabin          \n",
       " Length:4277        Length:4277        Length:4277        Length:4277       \n",
       " Class :character   Class :impute      Class :impute      Class :impute     \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " Destination             Age           VIP             RoomService     \n",
       " Length:4277        Min.   : 0.0   Length:4277        Min.   :    0.0  \n",
       " Class :impute      1st Qu.:20.0   Class :impute      1st Qu.:    0.0  \n",
       " Mode  :character   Median :26.0   Mode  :character   Median :    0.0  \n",
       "                    Mean   :28.6                      Mean   :  215.1  \n",
       "                    3rd Qu.:37.0                      3rd Qu.:   48.0  \n",
       "                    Max.   :79.0                      Max.   :11567.0  \n",
       "   FoodCourt        ShoppingMall         Spa              VRDeck       \n",
       " Min.   :    0.0   Min.   :   0.0   Min.   :    0.0   Min.   :    0.0  \n",
       " 1st Qu.:    0.0   1st Qu.:   0.0   1st Qu.:    0.0   1st Qu.:    0.0  \n",
       " Median :    0.0   Median :   0.0   Median :    0.0   Median :    0.0  \n",
       " Mean   :  428.6   Mean   : 173.2   Mean   :  295.9   Mean   :  304.9  \n",
       " 3rd Qu.:   66.0   3rd Qu.:  27.0   3rd Qu.:   43.0   3rd Qu.:   31.0  \n",
       " Max.   :25273.0   Max.   :8292.0   Max.   :19844.0   Max.   :22272.0  \n",
       "     Name          \n",
       " Length:4277       \n",
       " Class :impute     \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "ts$HomePlanet<-impute(ts$HomePlanet, mode)\n",
    "ts$CryoSleep<-impute(ts$CryoSleep, mode)\n",
    "ts$Cabin<-impute(ts$Cabin, mode)\n",
    "ts$Destination<-impute(ts$Destination, mode)\n",
    "ts$VIP<-impute(ts$VIP, mode)\n",
    "ts$Name<-impute(ts$Name, mode)\n",
    "\n",
    "head(ts)\n",
    "summary(ts)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "eeadd692",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:59.609678Z",
     "iopub.status.busy": "2022-06-16T09:49:59.608048Z",
     "iopub.status.idle": "2022-06-16T09:49:59.628038Z",
     "shell.execute_reply": "2022-06-16T09:49:59.625731Z"
    },
    "papermill": {
     "duration": 0.039944,
     "end_time": "2022-06-16T09:49:59.631301",
     "exception": false,
     "start_time": "2022-06-16T09:49:59.591357",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
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
    "sum(is.na(ts))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "070df6ca",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:59.664642Z",
     "iopub.status.busy": "2022-06-16T09:49:59.663010Z",
     "iopub.status.idle": "2022-06-16T09:49:59.682166Z",
     "shell.execute_reply": "2022-06-16T09:49:59.680216Z"
    },
    "papermill": {
     "duration": 0.039297,
     "end_time": "2022-06-16T09:49:59.685549",
     "exception": false,
     "start_time": "2022-06-16T09:49:59.646252",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "\n",
    "Tr<-my_df\n",
    "ts<-as.data.frame(ts)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "7af1746b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:49:59.719645Z",
     "iopub.status.busy": "2022-06-16T09:49:59.718049Z",
     "iopub.status.idle": "2022-06-16T09:50:01.313794Z",
     "shell.execute_reply": "2022-06-16T09:50:01.311246Z"
    },
    "papermill": {
     "duration": 1.616467,
     "end_time": "2022-06-16T09:50:01.317470",
     "exception": false,
     "start_time": "2022-06-16T09:49:59.701003",
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
      "\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "Classification tree:\n",
      "rpart(formula = Transported ~ PassengerId + HomePlanet + CryoSleep + \n",
      "    Cabin + Destination + Age + VIP + RoomService + FoodCourt + \n",
      "    ShoppingMall + Spa + VRDeck + Name, data = Tr, method = \"class\", \n",
      "    control = rpart.control(cp = 0.007))\n",
      "\n",
      "Variables actually used in tree construction:\n",
      "[1] PassengerId\n",
      "\n",
      "Root node error: 4315/8693 = 0.49638\n",
      "\n",
      "n= 8693 \n",
      "\n",
      "     CP nsplit rel error  xerror     xstd\n",
      "1 1.000      0         1 1.00000 0.010803\n",
      "2 0.007      1         0 0.67648 0.010204\n"
     ]
    }
   ],
   "source": [
    "library(rpart)\n",
    "library(rpart.plot)\n",
    "library(ggplot2)\n",
    "library(randomForest)\n",
    "RT=rpart(Transported~PassengerId+HomePlanet+CryoSleep+Cabin+Destination+Age+VIP+RoomService+FoodCourt+ShoppingMall+Spa+VRDeck+Name, data=Tr,method=\"class\",control=rpart.control(cp=0.007))\n",
    "printcp(RT)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "e22c4e69",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:50:01.352843Z",
     "iopub.status.busy": "2022-06-16T09:50:01.351059Z",
     "iopub.status.idle": "2022-06-16T09:50:01.404816Z",
     "shell.execute_reply": "2022-06-16T09:50:01.403000Z"
    },
    "papermill": {
     "duration": 0.074134,
     "end_time": "2022-06-16T09:50:01.407449",
     "exception": false,
     "start_time": "2022-06-16T09:50:01.333315",
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
      "    ShoppingMall + Spa + VRDeck + Name, data = Tr, method = \"class\", \n",
      "    control = rpart.control(cp = 0.007))\n",
      "\n",
      "Variables actually used in tree construction:\n",
      "[1] PassengerId\n",
      "\n",
      "Root node error: 4315/8693 = 0.49638\n",
      "\n",
      "n= 8693 \n",
      "\n",
      "     CP nsplit rel error  xerror     xstd\n",
      "1 1.000      0         1 1.00000 0.010803\n",
      "2 0.007      1         0 0.67648 0.010204\n",
      "\n",
      "Classification tree:\n",
      "rpart(formula = Transported ~ PassengerId + HomePlanet + CryoSleep + \n",
      "    Cabin + Destination + Age + VIP + RoomService + FoodCourt + \n",
      "    ShoppingMall + Spa + VRDeck + Name, data = Tr, method = \"class\", \n",
      "    control = rpart.control(cp = 0.007))\n",
      "\n",
      "Variables actually used in tree construction:\n",
      "[1] PassengerId\n",
      "\n",
      "Root node error: 4315/8693 = 0.496\n",
      "\n",
      "n= 8693 \n",
      "\n",
      "     CP nsplit rel error xerror   xstd\n",
      "1 1.000      0         1  1.000 0.0108\n",
      "2 0.007      1         0  0.676 0.0102\n"
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
       "\t<tr><th scope=row>1</th><td>1.000</td><td>0</td><td>1</td><td>1.0000000</td><td>0.01080345</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0.007</td><td>1</td><td>0</td><td>0.6764774</td><td>0.01020445</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 5 of type dbl\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & CP & nsplit & rel error & xerror & xstd\\\\\n",
       "\\hline\n",
       "\t1 & 1.000 & 0 & 1 & 1.0000000 & 0.01080345\\\\\n",
       "\t2 & 0.007 & 1 & 0 & 0.6764774 & 0.01020445\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 5 of type dbl\n",
       "\n",
       "| <!--/--> | CP | nsplit | rel error | xerror | xstd |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 1.000 | 0 | 1 | 1.0000000 | 0.01080345 |\n",
       "| 2 | 0.007 | 1 | 0 | 0.6764774 | 0.01020445 |\n",
       "\n"
      ],
      "text/plain": [
       "  CP    nsplit rel error xerror    xstd      \n",
       "1 1.000 0      1         1.0000000 0.01080345\n",
       "2 0.007 1      0         0.6764774 0.01020445"
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
   "execution_count": 23,
   "id": "beba82e4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:50:01.453516Z",
     "iopub.status.busy": "2022-06-16T09:50:01.451821Z",
     "iopub.status.idle": "2022-06-16T09:50:01.489572Z",
     "shell.execute_reply": "2022-06-16T09:50:01.487796Z"
    },
    "papermill": {
     "duration": 0.061646,
     "end_time": "2022-06-16T09:50:01.491986",
     "exception": false,
     "start_time": "2022-06-16T09:50:01.430340",
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
       "  False  4315    0\n",
       "  True      0 4378"
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
    "Pr=predict(RT, data=Tr[,-14],type=\"class\")\n",
    "Tb=table(Tr$Transported,Pr)\n",
    "A=sum(diag(Tb))/sum(Tb)\n",
    "Tb\n",
    "A\n",
    "E=1-A\n",
    "E\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "90cb5e4d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:50:01.528465Z",
     "iopub.status.busy": "2022-06-16T09:50:01.526821Z",
     "iopub.status.idle": "2022-06-16T09:50:01.542659Z",
     "shell.execute_reply": "2022-06-16T09:50:01.540840Z"
    },
    "papermill": {
     "duration": 0.036929,
     "end_time": "2022-06-16T09:50:01.545442",
     "exception": false,
     "start_time": "2022-06-16T09:50:01.508513",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "PRS=predict(RT,data=ts,type=\"class\")\n",
    "#PRS<-as.data.frame(PRS)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "f8f07dde",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:50:01.586879Z",
     "iopub.status.busy": "2022-06-16T09:50:01.585167Z",
     "iopub.status.idle": "2022-06-16T09:50:01.610579Z",
     "shell.execute_reply": "2022-06-16T09:50:01.608638Z"
    },
    "papermill": {
     "duration": 0.048085,
     "end_time": "2022-06-16T09:50:01.613046",
     "exception": false,
     "start_time": "2022-06-16T09:50:01.564961",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "4277"
      ],
      "text/latex": [
       "4277"
      ],
      "text/markdown": [
       "4277"
      ],
      "text/plain": [
       "[1] 4277"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "PRS1=sample(PRS, 4277, replace = FALSE)\n",
    "length(PRS1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "d1a55b7c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:50:01.651020Z",
     "iopub.status.busy": "2022-06-16T09:50:01.649355Z",
     "iopub.status.idle": "2022-06-16T09:50:01.716219Z",
     "shell.execute_reply": "2022-06-16T09:50:01.714381Z"
    },
    "papermill": {
     "duration": 0.088682,
     "end_time": "2022-06-16T09:50:01.718733",
     "exception": false,
     "start_time": "2022-06-16T09:50:01.630051",
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
       "\t<tr><th></th><th scope=col>ts...1.</th><th scope=col>PRS1</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>2950</th><td>0013_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>2155</th><td>0018_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4572</th><td>0019_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3872</th><td>0021_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>2943</th><td>0023_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>1818</th><td>0027_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>8610</th><td>0029_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>1225</th><td>0032_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5185</th><td>0032_02</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8563</th><td>0033_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>4823</th><td>0037_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>1171</th><td>0040_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>6609</th><td>0040_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>2830</th><td>0042_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5631</th><td>0046_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>6680</th><td>0046_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>675</th><td>0046_03</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>7377</th><td>0047_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8035</th><td>0047_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>6026</th><td>0047_03</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4922</th><td>0048_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>7799</th><td>0049_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>7159</th><td>0054_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3394</th><td>0054_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>422</th><td>0054_03</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>7760</th><td>0055_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8458</th><td>0057_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>2316</th><td>0059_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5095</th><td>0060_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>5474</th><td>0063_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>⋮</th><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><th scope=row>1681</th><td>9216_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>6034</th><td>9223_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>2551</th><td>9223_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>6980</th><td>9228_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4092</th><td>9229_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>6003</th><td>9232_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8105</th><td>9236_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>1124</th><td>9238_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>1357</th><td>9238_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5671</th><td>9238_03</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>5579</th><td>9238_04</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8225</th><td>9238_05</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3439</th><td>9238_06</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4291</th><td>9238_07</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>1318</th><td>9240_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4606</th><td>9243_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>7674</th><td>9245_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3478</th><td>9249_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>7847</th><td>9255_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3734</th><td>9258_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>7315</th><td>9260_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>2970</th><td>9262_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4726</th><td>9263_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5184</th><td>9265_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>8187</th><td>9266_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>4228</th><td>9266_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>1539</th><td>9269_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>7283</th><td>9271_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>1733</th><td>9273_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>1651</th><td>9277_01</td><td>True </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4277 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & ts...1. & PRS1\\\\\n",
       "  & <chr> & <fct>\\\\\n",
       "\\hline\n",
       "\t2950 & 0013\\_01 & False\\\\\n",
       "\t2155 & 0018\\_01 & True \\\\\n",
       "\t4572 & 0019\\_01 & True \\\\\n",
       "\t3872 & 0021\\_01 & True \\\\\n",
       "\t2943 & 0023\\_01 & False\\\\\n",
       "\t1818 & 0027\\_01 & False\\\\\n",
       "\t8610 & 0029\\_01 & False\\\\\n",
       "\t1225 & 0032\\_01 & False\\\\\n",
       "\t5185 & 0032\\_02 & True \\\\\n",
       "\t8563 & 0033\\_01 & False\\\\\n",
       "\t4823 & 0037\\_01 & True \\\\\n",
       "\t1171 & 0040\\_01 & False\\\\\n",
       "\t6609 & 0040\\_02 & False\\\\\n",
       "\t2830 & 0042\\_01 & False\\\\\n",
       "\t5631 & 0046\\_01 & True \\\\\n",
       "\t6680 & 0046\\_02 & False\\\\\n",
       "\t675 & 0046\\_03 & True \\\\\n",
       "\t7377 & 0047\\_01 & True \\\\\n",
       "\t8035 & 0047\\_02 & False\\\\\n",
       "\t6026 & 0047\\_03 & True \\\\\n",
       "\t4922 & 0048\\_01 & True \\\\\n",
       "\t7799 & 0049\\_01 & True \\\\\n",
       "\t7159 & 0054\\_01 & True \\\\\n",
       "\t3394 & 0054\\_02 & False\\\\\n",
       "\t422 & 0054\\_03 & True \\\\\n",
       "\t7760 & 0055\\_01 & True \\\\\n",
       "\t8458 & 0057\\_01 & True \\\\\n",
       "\t2316 & 0059\\_01 & False\\\\\n",
       "\t5095 & 0060\\_01 & True \\\\\n",
       "\t5474 & 0063\\_01 & False\\\\\n",
       "\t⋮ & ⋮ & ⋮\\\\\n",
       "\t1681 & 9216\\_01 & False\\\\\n",
       "\t6034 & 9223\\_01 & False\\\\\n",
       "\t2551 & 9223\\_02 & False\\\\\n",
       "\t6980 & 9228\\_01 & True \\\\\n",
       "\t4092 & 9229\\_01 & True \\\\\n",
       "\t6003 & 9232\\_01 & True \\\\\n",
       "\t8105 & 9236\\_01 & True \\\\\n",
       "\t1124 & 9238\\_01 & False\\\\\n",
       "\t1357 & 9238\\_02 & False\\\\\n",
       "\t5671 & 9238\\_03 & True \\\\\n",
       "\t5579 & 9238\\_04 & True \\\\\n",
       "\t8225 & 9238\\_05 & True \\\\\n",
       "\t3439 & 9238\\_06 & True \\\\\n",
       "\t4291 & 9238\\_07 & True \\\\\n",
       "\t1318 & 9240\\_01 & True \\\\\n",
       "\t4606 & 9243\\_01 & False\\\\\n",
       "\t7674 & 9245\\_01 & True \\\\\n",
       "\t3478 & 9249\\_01 & False\\\\\n",
       "\t7847 & 9255\\_01 & True \\\\\n",
       "\t3734 & 9258\\_01 & False\\\\\n",
       "\t7315 & 9260\\_01 & True \\\\\n",
       "\t2970 & 9262\\_01 & True \\\\\n",
       "\t4726 & 9263\\_01 & False\\\\\n",
       "\t5184 & 9265\\_01 & False\\\\\n",
       "\t8187 & 9266\\_01 & False\\\\\n",
       "\t4228 & 9266\\_02 & False\\\\\n",
       "\t1539 & 9269\\_01 & False\\\\\n",
       "\t7283 & 9271\\_01 & False\\\\\n",
       "\t1733 & 9273\\_01 & True \\\\\n",
       "\t1651 & 9277\\_01 & True \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4277 × 2\n",
       "\n",
       "| <!--/--> | ts...1. &lt;chr&gt; | PRS1 &lt;fct&gt; |\n",
       "|---|---|---|\n",
       "| 2950 | 0013_01 | False |\n",
       "| 2155 | 0018_01 | True  |\n",
       "| 4572 | 0019_01 | True  |\n",
       "| 3872 | 0021_01 | True  |\n",
       "| 2943 | 0023_01 | False |\n",
       "| 1818 | 0027_01 | False |\n",
       "| 8610 | 0029_01 | False |\n",
       "| 1225 | 0032_01 | False |\n",
       "| 5185 | 0032_02 | True  |\n",
       "| 8563 | 0033_01 | False |\n",
       "| 4823 | 0037_01 | True  |\n",
       "| 1171 | 0040_01 | False |\n",
       "| 6609 | 0040_02 | False |\n",
       "| 2830 | 0042_01 | False |\n",
       "| 5631 | 0046_01 | True  |\n",
       "| 6680 | 0046_02 | False |\n",
       "| 675 | 0046_03 | True  |\n",
       "| 7377 | 0047_01 | True  |\n",
       "| 8035 | 0047_02 | False |\n",
       "| 6026 | 0047_03 | True  |\n",
       "| 4922 | 0048_01 | True  |\n",
       "| 7799 | 0049_01 | True  |\n",
       "| 7159 | 0054_01 | True  |\n",
       "| 3394 | 0054_02 | False |\n",
       "| 422 | 0054_03 | True  |\n",
       "| 7760 | 0055_01 | True  |\n",
       "| 8458 | 0057_01 | True  |\n",
       "| 2316 | 0059_01 | False |\n",
       "| 5095 | 0060_01 | True  |\n",
       "| 5474 | 0063_01 | False |\n",
       "| ⋮ | ⋮ | ⋮ |\n",
       "| 1681 | 9216_01 | False |\n",
       "| 6034 | 9223_01 | False |\n",
       "| 2551 | 9223_02 | False |\n",
       "| 6980 | 9228_01 | True  |\n",
       "| 4092 | 9229_01 | True  |\n",
       "| 6003 | 9232_01 | True  |\n",
       "| 8105 | 9236_01 | True  |\n",
       "| 1124 | 9238_01 | False |\n",
       "| 1357 | 9238_02 | False |\n",
       "| 5671 | 9238_03 | True  |\n",
       "| 5579 | 9238_04 | True  |\n",
       "| 8225 | 9238_05 | True  |\n",
       "| 3439 | 9238_06 | True  |\n",
       "| 4291 | 9238_07 | True  |\n",
       "| 1318 | 9240_01 | True  |\n",
       "| 4606 | 9243_01 | False |\n",
       "| 7674 | 9245_01 | True  |\n",
       "| 3478 | 9249_01 | False |\n",
       "| 7847 | 9255_01 | True  |\n",
       "| 3734 | 9258_01 | False |\n",
       "| 7315 | 9260_01 | True  |\n",
       "| 2970 | 9262_01 | True  |\n",
       "| 4726 | 9263_01 | False |\n",
       "| 5184 | 9265_01 | False |\n",
       "| 8187 | 9266_01 | False |\n",
       "| 4228 | 9266_02 | False |\n",
       "| 1539 | 9269_01 | False |\n",
       "| 7283 | 9271_01 | False |\n",
       "| 1733 | 9273_01 | True  |\n",
       "| 1651 | 9277_01 | True  |\n",
       "\n"
      ],
      "text/plain": [
       "     ts...1. PRS1 \n",
       "2950 0013_01 False\n",
       "2155 0018_01 True \n",
       "4572 0019_01 True \n",
       "3872 0021_01 True \n",
       "2943 0023_01 False\n",
       "1818 0027_01 False\n",
       "8610 0029_01 False\n",
       "1225 0032_01 False\n",
       "5185 0032_02 True \n",
       "8563 0033_01 False\n",
       "4823 0037_01 True \n",
       "1171 0040_01 False\n",
       "6609 0040_02 False\n",
       "2830 0042_01 False\n",
       "5631 0046_01 True \n",
       "6680 0046_02 False\n",
       "675  0046_03 True \n",
       "7377 0047_01 True \n",
       "8035 0047_02 False\n",
       "6026 0047_03 True \n",
       "4922 0048_01 True \n",
       "7799 0049_01 True \n",
       "7159 0054_01 True \n",
       "3394 0054_02 False\n",
       "422  0054_03 True \n",
       "7760 0055_01 True \n",
       "8458 0057_01 True \n",
       "2316 0059_01 False\n",
       "5095 0060_01 True \n",
       "5474 0063_01 False\n",
       "⋮    ⋮       ⋮    \n",
       "1681 9216_01 False\n",
       "6034 9223_01 False\n",
       "2551 9223_02 False\n",
       "6980 9228_01 True \n",
       "4092 9229_01 True \n",
       "6003 9232_01 True \n",
       "8105 9236_01 True \n",
       "1124 9238_01 False\n",
       "1357 9238_02 False\n",
       "5671 9238_03 True \n",
       "5579 9238_04 True \n",
       "8225 9238_05 True \n",
       "3439 9238_06 True \n",
       "4291 9238_07 True \n",
       "1318 9240_01 True \n",
       "4606 9243_01 False\n",
       "7674 9245_01 True \n",
       "3478 9249_01 False\n",
       "7847 9255_01 True \n",
       "3734 9258_01 False\n",
       "7315 9260_01 True \n",
       "2970 9262_01 True \n",
       "4726 9263_01 False\n",
       "5184 9265_01 False\n",
       "8187 9266_01 False\n",
       "4228 9266_02 False\n",
       "1539 9269_01 False\n",
       "7283 9271_01 False\n",
       "1733 9273_01 True \n",
       "1651 9277_01 True "
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
   "execution_count": 27,
   "id": "b050cd38",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:50:01.759073Z",
     "iopub.status.busy": "2022-06-16T09:50:01.757144Z",
     "iopub.status.idle": "2022-06-16T09:50:01.823063Z",
     "shell.execute_reply": "2022-06-16T09:50:01.820963Z"
    },
    "papermill": {
     "duration": 0.089626,
     "end_time": "2022-06-16T09:50:01.826412",
     "exception": false,
     "start_time": "2022-06-16T09:50:01.736786",
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
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>Transported</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>2950</th><td>0013_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>2155</th><td>0018_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4572</th><td>0019_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3872</th><td>0021_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>2943</th><td>0023_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>1818</th><td>0027_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>8610</th><td>0029_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>1225</th><td>0032_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5185</th><td>0032_02</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8563</th><td>0033_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>4823</th><td>0037_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>1171</th><td>0040_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>6609</th><td>0040_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>2830</th><td>0042_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5631</th><td>0046_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>6680</th><td>0046_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>675</th><td>0046_03</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>7377</th><td>0047_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8035</th><td>0047_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>6026</th><td>0047_03</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4922</th><td>0048_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>7799</th><td>0049_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>7159</th><td>0054_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3394</th><td>0054_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>422</th><td>0054_03</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>7760</th><td>0055_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8458</th><td>0057_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>2316</th><td>0059_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5095</th><td>0060_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>5474</th><td>0063_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>⋮</th><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><th scope=row>1681</th><td>9216_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>6034</th><td>9223_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>2551</th><td>9223_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>6980</th><td>9228_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4092</th><td>9229_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>6003</th><td>9232_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8105</th><td>9236_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>1124</th><td>9238_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>1357</th><td>9238_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5671</th><td>9238_03</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>5579</th><td>9238_04</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>8225</th><td>9238_05</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3439</th><td>9238_06</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4291</th><td>9238_07</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>1318</th><td>9240_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4606</th><td>9243_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>7674</th><td>9245_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3478</th><td>9249_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>7847</th><td>9255_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3734</th><td>9258_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>7315</th><td>9260_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>2970</th><td>9262_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4726</th><td>9263_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5184</th><td>9265_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>8187</th><td>9266_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>4228</th><td>9266_02</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>1539</th><td>9269_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>7283</th><td>9271_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>1733</th><td>9273_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>1651</th><td>9277_01</td><td>True </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4277 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & PassengerId & Transported\\\\\n",
       "  & <chr> & <fct>\\\\\n",
       "\\hline\n",
       "\t2950 & 0013\\_01 & False\\\\\n",
       "\t2155 & 0018\\_01 & True \\\\\n",
       "\t4572 & 0019\\_01 & True \\\\\n",
       "\t3872 & 0021\\_01 & True \\\\\n",
       "\t2943 & 0023\\_01 & False\\\\\n",
       "\t1818 & 0027\\_01 & False\\\\\n",
       "\t8610 & 0029\\_01 & False\\\\\n",
       "\t1225 & 0032\\_01 & False\\\\\n",
       "\t5185 & 0032\\_02 & True \\\\\n",
       "\t8563 & 0033\\_01 & False\\\\\n",
       "\t4823 & 0037\\_01 & True \\\\\n",
       "\t1171 & 0040\\_01 & False\\\\\n",
       "\t6609 & 0040\\_02 & False\\\\\n",
       "\t2830 & 0042\\_01 & False\\\\\n",
       "\t5631 & 0046\\_01 & True \\\\\n",
       "\t6680 & 0046\\_02 & False\\\\\n",
       "\t675 & 0046\\_03 & True \\\\\n",
       "\t7377 & 0047\\_01 & True \\\\\n",
       "\t8035 & 0047\\_02 & False\\\\\n",
       "\t6026 & 0047\\_03 & True \\\\\n",
       "\t4922 & 0048\\_01 & True \\\\\n",
       "\t7799 & 0049\\_01 & True \\\\\n",
       "\t7159 & 0054\\_01 & True \\\\\n",
       "\t3394 & 0054\\_02 & False\\\\\n",
       "\t422 & 0054\\_03 & True \\\\\n",
       "\t7760 & 0055\\_01 & True \\\\\n",
       "\t8458 & 0057\\_01 & True \\\\\n",
       "\t2316 & 0059\\_01 & False\\\\\n",
       "\t5095 & 0060\\_01 & True \\\\\n",
       "\t5474 & 0063\\_01 & False\\\\\n",
       "\t⋮ & ⋮ & ⋮\\\\\n",
       "\t1681 & 9216\\_01 & False\\\\\n",
       "\t6034 & 9223\\_01 & False\\\\\n",
       "\t2551 & 9223\\_02 & False\\\\\n",
       "\t6980 & 9228\\_01 & True \\\\\n",
       "\t4092 & 9229\\_01 & True \\\\\n",
       "\t6003 & 9232\\_01 & True \\\\\n",
       "\t8105 & 9236\\_01 & True \\\\\n",
       "\t1124 & 9238\\_01 & False\\\\\n",
       "\t1357 & 9238\\_02 & False\\\\\n",
       "\t5671 & 9238\\_03 & True \\\\\n",
       "\t5579 & 9238\\_04 & True \\\\\n",
       "\t8225 & 9238\\_05 & True \\\\\n",
       "\t3439 & 9238\\_06 & True \\\\\n",
       "\t4291 & 9238\\_07 & True \\\\\n",
       "\t1318 & 9240\\_01 & True \\\\\n",
       "\t4606 & 9243\\_01 & False\\\\\n",
       "\t7674 & 9245\\_01 & True \\\\\n",
       "\t3478 & 9249\\_01 & False\\\\\n",
       "\t7847 & 9255\\_01 & True \\\\\n",
       "\t3734 & 9258\\_01 & False\\\\\n",
       "\t7315 & 9260\\_01 & True \\\\\n",
       "\t2970 & 9262\\_01 & True \\\\\n",
       "\t4726 & 9263\\_01 & False\\\\\n",
       "\t5184 & 9265\\_01 & False\\\\\n",
       "\t8187 & 9266\\_01 & False\\\\\n",
       "\t4228 & 9266\\_02 & False\\\\\n",
       "\t1539 & 9269\\_01 & False\\\\\n",
       "\t7283 & 9271\\_01 & False\\\\\n",
       "\t1733 & 9273\\_01 & True \\\\\n",
       "\t1651 & 9277\\_01 & True \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4277 × 2\n",
       "\n",
       "| <!--/--> | PassengerId &lt;chr&gt; | Transported &lt;fct&gt; |\n",
       "|---|---|---|\n",
       "| 2950 | 0013_01 | False |\n",
       "| 2155 | 0018_01 | True  |\n",
       "| 4572 | 0019_01 | True  |\n",
       "| 3872 | 0021_01 | True  |\n",
       "| 2943 | 0023_01 | False |\n",
       "| 1818 | 0027_01 | False |\n",
       "| 8610 | 0029_01 | False |\n",
       "| 1225 | 0032_01 | False |\n",
       "| 5185 | 0032_02 | True  |\n",
       "| 8563 | 0033_01 | False |\n",
       "| 4823 | 0037_01 | True  |\n",
       "| 1171 | 0040_01 | False |\n",
       "| 6609 | 0040_02 | False |\n",
       "| 2830 | 0042_01 | False |\n",
       "| 5631 | 0046_01 | True  |\n",
       "| 6680 | 0046_02 | False |\n",
       "| 675 | 0046_03 | True  |\n",
       "| 7377 | 0047_01 | True  |\n",
       "| 8035 | 0047_02 | False |\n",
       "| 6026 | 0047_03 | True  |\n",
       "| 4922 | 0048_01 | True  |\n",
       "| 7799 | 0049_01 | True  |\n",
       "| 7159 | 0054_01 | True  |\n",
       "| 3394 | 0054_02 | False |\n",
       "| 422 | 0054_03 | True  |\n",
       "| 7760 | 0055_01 | True  |\n",
       "| 8458 | 0057_01 | True  |\n",
       "| 2316 | 0059_01 | False |\n",
       "| 5095 | 0060_01 | True  |\n",
       "| 5474 | 0063_01 | False |\n",
       "| ⋮ | ⋮ | ⋮ |\n",
       "| 1681 | 9216_01 | False |\n",
       "| 6034 | 9223_01 | False |\n",
       "| 2551 | 9223_02 | False |\n",
       "| 6980 | 9228_01 | True  |\n",
       "| 4092 | 9229_01 | True  |\n",
       "| 6003 | 9232_01 | True  |\n",
       "| 8105 | 9236_01 | True  |\n",
       "| 1124 | 9238_01 | False |\n",
       "| 1357 | 9238_02 | False |\n",
       "| 5671 | 9238_03 | True  |\n",
       "| 5579 | 9238_04 | True  |\n",
       "| 8225 | 9238_05 | True  |\n",
       "| 3439 | 9238_06 | True  |\n",
       "| 4291 | 9238_07 | True  |\n",
       "| 1318 | 9240_01 | True  |\n",
       "| 4606 | 9243_01 | False |\n",
       "| 7674 | 9245_01 | True  |\n",
       "| 3478 | 9249_01 | False |\n",
       "| 7847 | 9255_01 | True  |\n",
       "| 3734 | 9258_01 | False |\n",
       "| 7315 | 9260_01 | True  |\n",
       "| 2970 | 9262_01 | True  |\n",
       "| 4726 | 9263_01 | False |\n",
       "| 5184 | 9265_01 | False |\n",
       "| 8187 | 9266_01 | False |\n",
       "| 4228 | 9266_02 | False |\n",
       "| 1539 | 9269_01 | False |\n",
       "| 7283 | 9271_01 | False |\n",
       "| 1733 | 9273_01 | True  |\n",
       "| 1651 | 9277_01 | True  |\n",
       "\n"
      ],
      "text/plain": [
       "     PassengerId Transported\n",
       "2950 0013_01     False      \n",
       "2155 0018_01     True       \n",
       "4572 0019_01     True       \n",
       "3872 0021_01     True       \n",
       "2943 0023_01     False      \n",
       "1818 0027_01     False      \n",
       "8610 0029_01     False      \n",
       "1225 0032_01     False      \n",
       "5185 0032_02     True       \n",
       "8563 0033_01     False      \n",
       "4823 0037_01     True       \n",
       "1171 0040_01     False      \n",
       "6609 0040_02     False      \n",
       "2830 0042_01     False      \n",
       "5631 0046_01     True       \n",
       "6680 0046_02     False      \n",
       "675  0046_03     True       \n",
       "7377 0047_01     True       \n",
       "8035 0047_02     False      \n",
       "6026 0047_03     True       \n",
       "4922 0048_01     True       \n",
       "7799 0049_01     True       \n",
       "7159 0054_01     True       \n",
       "3394 0054_02     False      \n",
       "422  0054_03     True       \n",
       "7760 0055_01     True       \n",
       "8458 0057_01     True       \n",
       "2316 0059_01     False      \n",
       "5095 0060_01     True       \n",
       "5474 0063_01     False      \n",
       "⋮    ⋮           ⋮          \n",
       "1681 9216_01     False      \n",
       "6034 9223_01     False      \n",
       "2551 9223_02     False      \n",
       "6980 9228_01     True       \n",
       "4092 9229_01     True       \n",
       "6003 9232_01     True       \n",
       "8105 9236_01     True       \n",
       "1124 9238_01     False      \n",
       "1357 9238_02     False      \n",
       "5671 9238_03     True       \n",
       "5579 9238_04     True       \n",
       "8225 9238_05     True       \n",
       "3439 9238_06     True       \n",
       "4291 9238_07     True       \n",
       "1318 9240_01     True       \n",
       "4606 9243_01     False      \n",
       "7674 9245_01     True       \n",
       "3478 9249_01     False      \n",
       "7847 9255_01     True       \n",
       "3734 9258_01     False      \n",
       "7315 9260_01     True       \n",
       "2970 9262_01     True       \n",
       "4726 9263_01     False      \n",
       "5184 9265_01     False      \n",
       "8187 9266_01     False      \n",
       "4228 9266_02     False      \n",
       "1539 9269_01     False      \n",
       "7283 9271_01     False      \n",
       "1733 9273_01     True       \n",
       "1651 9277_01     True       "
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
   "execution_count": 28,
   "id": "2bfca01b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:50:01.866157Z",
     "iopub.status.busy": "2022-06-16T09:50:01.864312Z",
     "iopub.status.idle": "2022-06-16T09:50:01.884492Z",
     "shell.execute_reply": "2022-06-16T09:50:01.882408Z"
    },
    "papermill": {
     "duration": 0.042774,
     "end_time": "2022-06-16T09:50:01.887822",
     "exception": false,
     "start_time": "2022-06-16T09:50:01.845048",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "write.csv(submission,\"submission.csv\",row.names = FALSE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "4edaaf51",
   "metadata": {
    "papermill": {
     "duration": 0.017479,
     "end_time": "2022-06-16T09:50:01.922700",
     "exception": false,
     "start_time": "2022-06-16T09:50:01.905221",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "8c95c44e",
   "metadata": {
    "papermill": {
     "duration": 0.018272,
     "end_time": "2022-06-16T09:50:01.958388",
     "exception": false,
     "start_time": "2022-06-16T09:50:01.940116",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "484e1b34",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-16T09:50:01.997014Z",
     "iopub.status.busy": "2022-06-16T09:50:01.995142Z",
     "iopub.status.idle": "2022-06-16T09:50:02.054273Z",
     "shell.execute_reply": "2022-06-16T09:50:02.051922Z"
    },
    "papermill": {
     "duration": 0.082378,
     "end_time": "2022-06-16T09:50:02.058106",
     "exception": false,
     "start_time": "2022-06-16T09:50:01.975728",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(caTools)\n",
    "library(randomForest)"
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
   "duration": 10.183141,
   "end_time": "2022-06-16T09:50:02.197807",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-06-16T09:49:52.014666",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

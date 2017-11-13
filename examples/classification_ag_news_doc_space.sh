#!/usr/bin/env bash
#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.
#


MODELDIR=./examples/data
DATADIR=./examples/data

echo "Start to train on ag_news data:"

./starspace train \
  -trainFile "${DATADIR}"/ag_news_doc_space.train \
  -model "${MODELDIR}"/ag_news_doc_space \
  -initRandSd 0.01 \
  -adagrad false \
  -ngrams 1 \
  -lr 0.01 \
  -epoch 5 \
  -thread 20 \
  -dim 10 \
  -negSearchLimit 5 \
  -maxNegSamples 3 \
  -trainMode 0 \
  -fileFormat labelDoc \
  -similarity "dot" \
  -verbose true

echo "Start to evaluate trained model:"

./starspace test \
  -model "${MODELDIR}"/ag_news_doc_space \
  -testFile "${DATADIR}"/ag_news_doc_space.test \
  -ngrams 1 \
  -dim 10 \
  -fileFormat labelDoc \
  -thread 10 \
  -similarity "dot" \
  -trainMode 0 \
  -verbose true \
  -predictionFile "${MODELDIR}"/ag_news_tag_space_predict

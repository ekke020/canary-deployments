#!/bin/bash

watch 'kubectl -n backend describe canary/canary-backend | grep Events -A30'
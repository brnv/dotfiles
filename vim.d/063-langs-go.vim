let g:ale_fixers['go'] = [function("synta#ale#goimports#Fix"), function("synta#ale#golines#Fix")]

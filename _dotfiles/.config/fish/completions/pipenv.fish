if command -s pipenv > /dev/null
    eval (env _PIPENV_COMPLETE=fish_source pipenv)
end

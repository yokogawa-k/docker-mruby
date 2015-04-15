MRuby::Build.new do |conf|

    toolchain :gcc

    conf.gembox 'full-core'

    #
    # Recommended for ngx_mruby
    #
    conf.gem :github => 'iij/mruby-io'
    conf.gem :github => 'iij/mruby-env'
    conf.gem :github => 'iij/mruby-dir'
    conf.gem :github => 'iij/mruby-digest'
    conf.gem :github => 'iij/mruby-process'
    conf.gem :github => 'iij/mruby-pack'
    conf.gem :github => 'iij/mruby-socket'
    conf.gem :github => 'iij/mruby-tls-openssl'
    conf.gem :github => 'yokogawa-k/mruby-webapi', :branch => 'support_unix_domain_socket'
    conf.gem :github => 'mattn/mruby-json'
    conf.gem :github => 'mattn/mruby-onig-regexp'
    conf.gem :github => 'matsumoto-r/mruby-redis'
    conf.gem :github => 'matsumoto-r/mruby-vedis'
    conf.gem :github => 'matsumoto-r/mruby-sleep'
    conf.gem :github => 'matsumoto-r/mruby-userdata'
    conf.gem :github => 'matsumoto-r/mruby-uname'
end


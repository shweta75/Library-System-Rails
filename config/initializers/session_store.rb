# Rails.application.config.session_store :active_record_store, key: '_devise-omniauth_session'
Rails.application.config.action_dispatch.session_store :active_record_store, :key => '_devise-omniauth_session'

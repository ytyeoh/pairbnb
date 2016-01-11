Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '991235400970154', '5892777e01ca6547005c4ebd07133933',
  :scope => 'email'
end
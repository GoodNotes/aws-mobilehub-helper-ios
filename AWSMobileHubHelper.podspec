Pod::Spec.new do |s|
  s.name         = 'AWSMobileHubHelper'
  s.version      = '1.0.0'
  s.summary      = 'AWS Mobile Hub helper code for iOS.'
  s.description  = 'AWS Mobile Hub helper code for iOS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.default_subspec = 'AWSMobileHubHelper/Authorization'

  s.subspec 'AWSMobileHubHelper/Authorization' do |ss|
    ss.requires_arc = true
    ss.source_files = 'AWSMobileHubHelper/Authorization/*.{h,m}'
    ss.dependency 'AWSCore'
    ss.framework 'SafariServices'
  end

  s.subspec 'AWSMobileHubHelper/CloudLogic' do |ss|
    ss.requires_arc = true
    ss.source_files = 'AWSMobileHubHelper/CloudLogic/*.{h,m}'
    ss.dependency 'AWSLambda'
    ss.dependency 'AWSCore'
  end

  s.subspec 'AWSMobileHubHelper/Identity' do |ss|
    ss.requires_arc = true
    ss.source_files = 'AWSMobileHubHelper/Identity/*.{h,m}'
    ss.dependency 'AWSCore'
  end

  s.subspec 'AWSMobileHubHelper/Push' do |ss|
    ss.requires_arc = true
    ss.source_files = 'AWSMobileHubHelper/Push/*.{h,m}'
    ss.dependency 'AWSSNS'
    ss.dependency 'AWSCore'
  end

  s.subspec 'AWSMobileHubHelper/SignIn' do |ss|
    ss.requires_arc = true
    ss.source_files = 'AWSMobileHubHelper/SignIn/{AWSCognitoUserPoolsSignInProvider,AWSSAMLSignInProvider,AWSSignInProvider,AWSSignInProviderFactory}.{h,m}'
    ss.dependency 'AWSCognitoIdentityProvider'
    ss.dependency 'AWSCognito'
    ss.dependency 'AWSCore'

    ss.subspec 'AWSMobileHubHelper/SignIn/Facebook' do |ss|
      ss.requires_arc = true
      ss.source_files = 'AWSMobileHubHelper/SignIn/{AWSFacebookSignInProvider}.{h,m}'
      ss.dependency 'FBSDKLoginKit', '~> 4.13.1'
      ss.dependency 'FBSDKCoreKit', '~> 4.13.1'
      ss.dependency 'AWSMobileHubHelper/SignIn'
      ss.dependency 'AWSCore'
    end

    ss.subspec 'AWSMobileHubHelper/SignIn/Google' do |ss|
      ss.requires_arc = true
      ss.source_files = 'AWSMobileHubHelper/SignIn/{AWSGoogleSignInProvider}.{h,m}'
      ss.dependency 'GoogleSignIn', '~> 4.0.0'
      ss.dependency 'AWSMobileHubHelper/SignIn'
      ss.dependency 'AWSCore'
    end
  end

  s.subspec 'AWSMobileHubHelper/UserFiles' do |ss|
    ss.requires_arc = true
    ss.source_files = 'AWSMobileHubHelper/UserFiles/{*}.{h,m}'
    ss.dependency 'AWSS3'
    ss.dependency 'AWSCore'
  end
end

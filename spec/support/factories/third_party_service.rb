FactoryBot.define do
  factory :third_party_service, class: Spree::ThirdPartyService do
    name { 'testService1' }
    script { 'console.log("test-service")' }
    enabled { false }
  end
end

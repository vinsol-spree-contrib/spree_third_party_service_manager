FactoryBot.define do
  factory :page, class: Spree::Page do
    name { 'tests/index' }

    factory :page_with_third_party_services do |page| 

      after(:create) do |page|
        create_list(:third_party_service, 1, name: 'testService1', script: 'console.log("enabled testService1")', enabled: false, pages: [page])
        create_list(:third_party_service, 1, name: 'testService2', script: 'console.log("enabled testService2")', enabled: true, pages: [page])
      end

    end
  end
end

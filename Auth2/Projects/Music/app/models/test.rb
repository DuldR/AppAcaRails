class Test < ApplicationRecord

    attr_reader :user

    def initialize(ok)
        @weinr = ok
    end
end
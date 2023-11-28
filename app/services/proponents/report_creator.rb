# frozen_string_literal: true

module Proponents
  class ReportCreator
    class << self
      def call(_proponents)
        [1, 2, 3]
      end

      private

      def private_method; end
    end
  end
end

class Proponents::Grouper
  class << self
    def by_wage_range(proponents)
        {
          'key1': [
            {
              name: 'teste',
              cpf: '054.264.888-90'
            }, {
              name: 'teste 2',
              cpf: '054.264.888-91'
            }
          ],
          'key2': [
            {
              name: 'teste',
              cpf: '054.264.888-90'
            }, {
              name: 'teste 2',
              cpf: '054.264.888-91'
            }
          ]
        }
    end

    private

    def private_method
      
    end
  end
end
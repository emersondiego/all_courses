describe 'Soma' do
  context 'somar numeros' do
    let(:resultado) { 4 + 4 }
    it 'positivos' do
      expect(resultado).to eq 8     
    end
  end
end
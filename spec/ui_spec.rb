require './lib/ui.rb'

describe UI do
  let(:class_instance) { Class.new { extend UI } }

  context '#output' do
    it 'outputs argument' do
      expect { class_instance.output('test') }.to output('test').to_stdout
    end
    it 'outputs argument with new line' do
      expect { class_instance.output('test', true) }.to output("test\n").to_stdout
    end
  end

  context '#show_welcome_message' do
    it 'shows welcome message' do
      expect { class_instance.show_welcome_message }.to output("Welcome to Tic-tac-toe!\n").to_stdout
    end
  end

  context '#input' do
    it 'returns user input' do
      allow(class_instance).to receive(:gets).and_return("test_input\n")
      expect(class_instance.input).to eq('test_input')
    end
  end
end

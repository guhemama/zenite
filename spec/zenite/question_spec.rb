RSpec.describe Zenite::Question do
  it 'should generate a valid command' do
    question = Zenite::Question.new
    question.text = 'This is a question.'
    expect(question.to_cmd).to eq('zenity --question --text="This is a question."')
  end

  it 'should include the general parameters when set' do
    question = Zenite::Question.new
    question.tap do |q|
      q.text    = 'This is a question.'
      q.width   = 500
      q.height  = 200
      q.timeout = 30
    end

    cmd = question.to_cmd

    expect(cmd).to include('--width="500"')
    expect(cmd).to include('--height="200"')
    expect(cmd).to include('--timeout="30"')
  end

  it 'should validate invalid params' do
    question = Zenite::Question.new
    expect { question.to_cmd }.to raise_exception Zenite::InvalidArgumentException
  end
end

RSpec.describe Zenity::Question do
  it "should generate a valid command" do
    cmd = Zenity::Question.new("This is a question.").to_cmd
    expect(cmd).to eq(%q{zenity --question --text="This is a question."})
  end
end

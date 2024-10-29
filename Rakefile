require 'code_slide'

task default: :build_all

task build_all: Rake::FileList['src/*.rb'].ext('.pdf') do
  puts 'Finished. Look in `build/` for generated artifacts.'
end

task :clean do
  rm_rf 'build'
end

rule '.pdf' => '.rb' do |t|
  mkdir_p 'build', verbose: false

  snippet = CodeSlide::Snippet.from_file(t.source, page_width: 16*72, page_height: 9*72, font_size: 32)
  snippet.make_pdf(t.name.pathmap('build/%f'))
end

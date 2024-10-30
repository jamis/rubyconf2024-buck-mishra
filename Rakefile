require 'code_slide'

task default: :build_all

task build_all: Rake::FileList['src/*.rb'].ext('.pdf') do
  puts 'Finished. Look in `build/` for generated artifacts.'
end

task :clean do
  rm_rf 'build'
end

rule '.pdf' => '.rb' do |t|
  target = t.name.pathmap('build/%f')

  source_stamp = File.mtime(t.source)
  target_stamp = File.exist?(target) ? File.mtime(target) : source_stamp - 1

  next if source_stamp < target_stamp
  puts "building #{t.source} => #{target}"

  mkdir_p 'build', verbose: false

  contents, options = read_file(t.source)
  snippet_options = options.slice(:lang, :line_number_start, :styles, :theme, :line_numbers, :bold_every)
  pdf_options = options.slice(:font_size, :page_width, :page_height)

  snippet = CodeSlide::Snippet.new(contents, snippet_options)
  snippet.make_pdf(target, **{ page_width: 16*72, page_height: 9*72, font_size: 32 }.merge(pdf_options))
end

# Takes a file name, and returns a tuple with the file contents as the first
# element, and a hash of options as the second element.
def read_file(file_name)
  lines = File.readlines(file_name)
  start = 0
  options = { lang: CodeSlide::Snippet.detect_language_type(file_name) }

  while lines[start] =~ /^#\s*(\S+):\s*(.*)$/
    key = $1.to_sym
    value = $2.strip

    value = value.to_i if value =~ /^\d+$/

    options[key] = value
    start += 1
  end

  contents = lines[start..].join.strip

  [ contents, options ]
end

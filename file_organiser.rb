file_formats = {
    pdf: ['pdf'],
    videos: ['mp4', 'mkv', 'avi'],
    images: ['jpg', 'jpeg', 'png'],
    audio: ['mp3', 'wav', 'flac'],
    documents: ['docx', 'doc', 'txt', 'pptx'],
    zip: ['zip', 'rar'],
    executable: ['exe', 'msi', 'aia'],
    sheet: ['csv', 'xlsx', 'xls'],
    programming: ['cpp', 'c', 'js', 'rb']
}

Dir.chdir('C:/Users/User/Downloads') 

### To organise files/folders into folders ###

Dir.each_child('.') do |file|
    file_formats.each do |key, value|
        if value.include?(File.extname(file).delete('.'))
            Dir.mkdir(key.to_s) unless Dir.exist?(key.to_s)
            File.rename(file, "#{key.to_s}/#{file}")
        end
    end

    if File.directory?(file)
        if File.basename(file) != 'Directories'
            if !file_formats.include?(file.to_sym)
                Dir.mkdir('Directories') unless Dir.exist?('Directories')
                File.rename(file, "Directories/#{file}")
            end
        end
    end
end

### To get the numbers of files of each type ###

# hash = {}

# Dir.each_child('.') do |file|
#     file_formats.each do |key, value|
#         if value.include?(File.extname(file).delete('.'))
#             hash[key] = [] unless hash[key]
#             hash[key] << file
#         end
#     end
# end

# hash.each do |key, value|
#     puts "#{key} has #{value.length} files"
# end


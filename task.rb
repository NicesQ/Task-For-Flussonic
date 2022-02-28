# frozen_string_literal: true

# Метод для генерации последней версии
def flussonic_last_version
  (rand(20..22) * 100 + rand(1..12)) / 100.0
end

# Метод для определения списка доступных версий
def get_avaliable_versions(paid_till, max_version, min_version, last_version)
  paid_version = "#{paid_till[8]}#{paid_till[9]}.#{paid_till[3]}#{paid_till[4]}".to_f
  max_version = paid_version if paid_version < max_version
  versions = [last_version - 0.04, last_version - 0.03, last_version - 0.02, last_version - 0.01,
              last_version].select do |v|
    (v <= max_version) && (v >= min_version)
  end
  if !versions.empty?
    versions
  else
    max_version != 9999 ? max_version : last_version
  end
end

# Ввод исходных данных(в корректном формате)
flv = flussonic_last_version
puts "FlussonicLastVersion.get -> #{flv}"
print 'paid_till:'
paid_till = gets.chomp
print 'max_version:'
max_version = gets.chomp.to_f
print 'min_version:'
min_version = gets.chomp.to_f
max_version = 9999 if max_version.zero?
min_version = -1 if min_version.zero?

# Вывод списка доступных версий
puts "Version list: #{get_avaliable_versions(paid_till, max_version, min_version, flv)}"

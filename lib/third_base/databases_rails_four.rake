namespace :db do
  namespace :third_base do
    task :drop do
      ThirdBase.on_base { Rake::Task['db:drop'].execute }
    end

    namespace :migrate do
      desc 'Resets ThirdBase database using your migrations for the current environment'
      task :reset => ['db:third_base:drop', 'db:third_base:create', 'db:third_base:migrate']
    end
  end
end

%w{
  drop
}.each do |name|
  task = Rake::Task["db:#{name}"] rescue nil
  next unless task && ThirdBase::Railtie.run_with_db_tasks?
  task.enhance do
    Rake::Task["db:load_config"].invoke
    Rake::Task["db:third_base:#{name}"].invoke
  end
end

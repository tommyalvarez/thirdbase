namespace :db do
  namespace :third_base do
    task "drop:_unsafe" do
      ThirdBase.on_base { Rake::Task['db:drop:_unsafe'].execute }
    end

    namespace :migrate do
      desc 'Resets ThirdBase database using your migrations for the current environment'
      task :reset => ['db:third_base:drop:_unsafe', 'db:third_base:create', 'db:third_base:migrate']
    end
  end
end

%w{
  drop:_unsafe
}.each do |name|
  task = Rake::Task["db:#{name}"] rescue nil
  next unless task && ThirdBase::Railtie.run_with_db_tasks?
  task.enhance do
    Rake::Task["db:load_config"].invoke
    Rake::Task["db:third_base:#{name}"].invoke
  end
end

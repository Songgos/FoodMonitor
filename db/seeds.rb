# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
foods = Food.create(
  [ 
    {
      name: 'Papa',
      description: 'Tuberculaso ancestral!',
      properties: 'Cura el hambre'
    },
    {
      name: 'Chuño',
      description: 'Papa deshidratada!',
      properties: 'No se malogra'
    }
  ]
  )

ComponentType.create([
  {name:'Vitamina'}, {name:'Proteína'},{name:'Mineral'},{name:'Carbohidrato'},
  {name:'Grasa'}])

Component.create([
  {name:'B1',component_types_id:'1'},{name:'B2',component_types_id:'1'},
  {name:'B3',component_types_id:'1'},{name:'B6',component_types_id:'1'},
  {name:'B12',component_types_id:'1'}])
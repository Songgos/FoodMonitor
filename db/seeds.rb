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
  ])

ComponentType.create([
  {name:'Vitamina'}, {name:'Proteína'},{name:'Mineral'},
  {name:'Carbohidrato'},{name:'Grasa'}
  ])


# Stubbing data for vitamins
Component.create([
  {name:'B1',component_types_id:'1'},{name:'B2',component_types_id:'1'},
  {name:'B3',component_types_id:'1'},{name:'B6',component_types_id:'1'},
  {name:'B12',component_types_id:'1'}
  ])


# Stubbing data for proteins
Component.create([
  {name:'Protein1',component_types_id:'2'},
  {name:'Protein2',component_types_id:'2'},
  {name:'Protein3',component_types_id:'2'},
  {name:'Protein4',component_types_id:'2'},
  {name:'Protein5',component_types_id:'2'},
  {name:'Protein6',component_types_id:'2'}
  ])

# Stubbing data for minerals
Component.create([
  {name:'Mineral1',component_types_id:'3'},
  {name:'Mineral2',component_types_id:'3'},
  {name:'Mineral3',component_types_id:'3'},
  {name:'Mineral4',component_types_id:'3'},
  {name:'Mineral5',component_types_id:'3'},
  {name:'Mineral6',component_types_id:'3'}
  ])


# Stubbing data for carbs
Component.create([
  {name:'Carb1',component_types_id:'4'},{name:'Carb2',component_types_id:'4'},
  {name:'Carb3',component_types_id:'4'},{name:'Carb4',component_types_id:'4'},
  {name:'Carb5',component_types_id:'4'},{name:'Carb6',component_types_id:'4'}
  ])

# Stubbing data for fats
Component.create([
  {name:'Fat1',component_types_id:'5'},{name:'Fat2',component_types_id:'5'},
  {name:'Fat3',component_types_id:'5'},{name:'Fat4',component_types_id:'5'},
  {name:'Fat5',component_types_id:'5'},{name:'Fat6',component_types_id:'5'}
  ])



FoodsDatum.create([
  {percentage: 15.2, foods_id: 1, components_id: 1},
  {percentage: 25.3, foods_id: 2, components_id: 1},
  {percentage: 35.4, foods_id: 1, components_id: 2}
  ])
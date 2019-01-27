moscow = Station.new('Moscow')
perovo = Station.new('Perovo')
zukovo = Station.new('Zukovo')
kuskovo = Station.new('Kuskovo')
kazan = Station.new('Kazan')

msk_kazan = Route.new(moscow, kazan)
msk_kazan.station_add(perovo)
msk_kazan.station_add(zukovo)
msk_kazan.station_add(kuskovo)

strizh = Train.new('Strizh')
strizh.train_set_route(msk_kazan)

part_1 = Part.new('Пассажирский')
part_2 = Part.new('Пассажирский')
part_3 = Part.new('Пассажирский')

  strizh.part_add(part_1)
  strizh.part_add(part_2)
  strizh.part_add(part_3)

  strizh.station_next
  strizh.prev_station

  strizh.part_delete(part_1)


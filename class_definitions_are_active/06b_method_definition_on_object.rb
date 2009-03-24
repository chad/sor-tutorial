bog = Bog.new
def bog.monster
  Monster.instance
end

bog.monster.prowl!
class Bog
  def Bog.monster
    Monster.instance
  end
end

Bog.monster.prowl!
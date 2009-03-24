class Bog
  def self.monster
    Monster.instance
  end
end

Bog.monster.prowl!
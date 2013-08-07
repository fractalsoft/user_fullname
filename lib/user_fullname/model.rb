# encoding: utf-8
module UserFullname
  def fullname
    @fullname = super
  end

  def fullname=(value)
    array = value.split /\s/
    @firstname, @lastname = array[0], array[1]
    @fullname = value
    super
  end

  def firstname
    @firstname = parse(0)
  end

  def firstname=(value)
    @firstname, @lastname = value, lastname
    update_fullname
  end

  def lastname
    @lastname = parse(1)
  end

  def lastname=(value)
    @firstname, @lastname = firstname, value
    update_fullname
  end

  private
    def update_fullname
      send(:fullname=, [@firstname, @lastname].join(' '))
    end

    def parse(order)
      name = fullname
      if name and array = name.split(/\s/)
        array[order]
      end or ""
    end
end

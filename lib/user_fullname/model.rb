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
    name = fullname
    @firstname = if name and array = name.split(/\s/)
      array[0]
    end or ""
  end

  def firstname=(value)
    @firstname, @lastname = value, lastname
    update_fullname
  end

  def lastname
    name = fullname
    @lastname = if name and array = name.split(/\s/)
      array[1]
    end or ""
  end

  def lastname=(value)
    @firstname, @lastname = firstname, value
    update_fullname
  end

  private
    def update_fullname
      send(:fullname=, [@firstname, @lastname].join(' '))
    end
end

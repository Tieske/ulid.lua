
local socket = require("socket") -- pre-load for the gettime function
math.randomseed(math.floor(socket.gettime() * 10000))
local ulid_mod


describe('ulid:', function()

  before_each(function()
    ulid_mod = require "ulid"
  end)

  after_each(function()
    package.loaded["ulid"] = nil
  end)

  describe('set_time_func', function()

    it('should be called when set', function()
      local was_called
      ulid_mod.set_time_func(function() 
                               was_called = true
                               return 123
                             end)
      ulid_mod.ulid()
      assert.is_true(was_called)
    end)

  end)

  describe('set_random_func', function()

    it('should be called when set', function()
      local was_called
      ulid_mod.set_random_func(function(...) 
                                 was_called = true
                                 return math.random(...)
                               end)
      ulid_mod.ulid()
      assert.is_true(was_called)
    end)

  end)

  describe('encode_time', function()

    it('should return expected encoded result', function()
      assert.same('01ARYZ6S41', ulid_mod.encode_time(1469918176.385, 10))
    end)

    it('should change length properly', function()
      assert.same('0001AS99AA60', ulid_mod.encode_time(1470264322.240, 12))
    end)

    it('should truncate time if not enough length', function()
      assert.same('AS4Y1E11', ulid_mod.encode_time(1470118279.201, 8))
    end)

  end)

  describe('encode_random', function()

    it('should return correct length', function()
      assert.same(12, #ulid_mod.encode_random(12))
    end)

  end)

  describe('ulid', function()

    it('should return correct length', function()
      assert.same(26, #ulid_mod.ulid())
    end)

    it('works when calling the module table', function()
      assert.same(26, #ulid_mod())
    end)

    it('works when called repeatedly', function()
      for i = 1, 1000 do
        assert.same(26, #ulid_mod())
      end
    end)

  end)

end)
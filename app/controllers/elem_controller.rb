# frozen_string_literal: true

# class of controller
class ElemController < ApplicationController
  def index; end

  def result
    @array_from_field = params[:arr]
    if !error_msg
      @array = @array_from_field.split.map!(&:to_f)
      make_json_without_error
    else
      make_json_with_error
    end
  end

  private

  def error_msg
    "Array isn't correct" unless /^( ?)+(-?\d+(\.\d+)?)((?:\ +(-?\d+(\.\d+)?))+)?(\ +)?$/.match(@array_from_field)
  end

  def make_json_without_error
    respond_to do |format|
      modify_array
      format.html
      format.json do
        render json: { type: @array.class.to_s, value: [@array, modify_array] }
      end
    end
  end

  def make_json_with_error
    @error = error_msg
    respond_to do |format|
      format.html
      format.json do
        render json: { type: 'Error', value: @error }
      end
    end
  end

  def first_negative
    first_neg = 'В массиве нет отрицательных чисел.'
    @array.each_with_index do |elem, index|
      if elem.negative?
        first_neg = index
        break
      end
    end
    first_neg
  end

  def remain
    @array.min / @array.max
  end

  def modify_array
    if first_negative.is_a?(String) then modif = first_negative
    else
      modif = []
      @array.each_with_index do |value, index|
        modif << (index == first_negative ? remain : value)
      end
    end
    modif
  end
end

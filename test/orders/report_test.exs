defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})
      filename = "report_test.csv"

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      expected_response =
        "123.456.789-00,pizza,1,42.5sobremesa,2,3.40,49.30\n" <>
          "123.456.789-00,pizza,1,42.5sobremesa,2,3.40,49.30\n"

      Report.create(filename)

      response = File.read!(filename)

      assert response == expected_response

      File.rm!(filename)
    end
  end
end

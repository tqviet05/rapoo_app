require "application_system_test_case"

class ProductAttachmentsTest < ApplicationSystemTestCase
  setup do
    @product_attachment = product_attachments(:one)
  end

  test "visiting the index" do
    visit product_attachments_url
    assert_selector "h1", text: "Product Attachments"
  end

  test "creating a Product attachment" do
    visit product_attachments_url
    click_on "New Product Attachment"

    fill_in "Image", with: @product_attachment.image
    fill_in "Product", with: @product_attachment.product_id
    click_on "Create Product attachment"

    assert_text "Product attachment was successfully created"
    click_on "Back"
  end

  test "updating a Product attachment" do
    visit product_attachments_url
    click_on "Edit", match: :first

    fill_in "Image", with: @product_attachment.image
    fill_in "Product", with: @product_attachment.product_id
    click_on "Update Product attachment"

    assert_text "Product attachment was successfully updated"
    click_on "Back"
  end

  test "destroying a Product attachment" do
    visit product_attachments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product attachment was successfully destroyed"
  end
end

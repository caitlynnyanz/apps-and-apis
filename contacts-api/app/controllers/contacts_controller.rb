class ContactsController < ApplicationController
  def first_contact
    contact = Contact.first
    render json: contact.as_json
  end

  def contacts_all
    contact = Contact.all
    render json: contact.as_json
  end
end

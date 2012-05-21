object false
node(:attributes) { [*zone_attributes] }
node(:required_attributes) { required_fields_for(Spree::Zone) }

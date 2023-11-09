describe('products page', () => {
  beforeEach(() => {
    // visits the home page
    cy.visit("/")
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should go to the product when it is clicked", () => {
    // Asserts that a specific product can be visited 
    cy.visit('/products/46');

    // Assert that the product name is not null
    cy.get('h1').should('not.be.empty');

    // Assert that the product description is not null
    cy.get('p').should('not.be.empty');

    // Assert that the quantity in stock is not null
    cy.get('.quantity').should('not.be.empty');

    // Assert that the price is not null
    cy.get('.price').should('not.be.empty');
  });
});

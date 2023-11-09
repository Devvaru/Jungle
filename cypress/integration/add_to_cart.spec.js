describe('home', () => {
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

  it("Adds a product to cart", () => { 
    cy.contains("My Cart (0)").should("exist");
    cy.contains("Add").click({force: true});
    cy.contains("My Cart (1)").should("exist");
  });
});
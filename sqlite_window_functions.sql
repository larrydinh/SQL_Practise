--understanding the relative importance of each customer's contribution to the company's overall revenue and the number of sales
WITH CustomerRevenue AS (
    SELECT
        c.CustomerId,
        c.FirstName || ' ' || c.LastName AS CustomerName,
        i.InvoiceDate,
        i.Total,
        SUM(i.Total) OVER (PARTITION BY c.CustomerId) AS CustomerTotalRevenue,
        AVG(i.Total) OVER (PARTITION BY c.CustomerId) AS CustomerAverageRevenue,
        COUNT(*) OVER () AS TotalInvoices,
        COUNT(i.InvoiceId) OVER (PARTITION BY c.CustomerId) AS CustomerTotalInvoices,
        MIN(i.Total) OVER (PARTITION BY c.CustomerId) AS CustomerLowestInvoice,
        MAX(i.Total) OVER (PARTITION BY c.CustomerId) AS CustomerHighestInvoice,
        SUM(i.Total) OVER () AS TotalCompanyRevenue
    FROM Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
)
SELECT
    CustomerId,
    CustomerName,
    InvoiceDate,
    Total,
    CustomerTotalRevenue,
    CustomerAverageRevenue,
    CustomerTotalInvoices,
    CustomerLowestInvoice,
    CustomerHighestInvoice,
    TotalCompanyRevenue,
    ROUND((1.0 / CustomerTotalInvoices) * 100, 2) as ContributionToCustomerTotalNumInvoices,
    ROUND((1.0 / TotalInvoices) * 100, 2) as ContributionToTotalNumInvoices,
    ROUND((Total / CustomerTotalRevenue) * 100, 2) AS ContributionToCustomerTotalRevenue,
    ROUND((Total / TotalCompanyRevenue) * 100, 2) AS ContributionToTotalRevenue
FROM CustomerRevenue;
-- =====================================================================================
-- International DTC Subscriber Growth, Content/Macro Drivers & Partnership Deal Mart
-- Dialect: Standard ANSI / BigQuery / Snowflake Compatible SQL (SQL Joins & CTEs)
-- =====================================================================================

WITH regional_stock_flow AS (
    SELECT
        r.country,
        r.iso3,
        r.region_hub,
        r.year,
        r.quarter,
        r.period_idx,
        r.period_label,
        r.beginning_subs_k,
        r.gross_adds_k,
        r.churned_subs_k,
        r.net_adds_k,
        r.ending_subs_k,
        r.tentpole_releases,
        r.gdp_growth_pct,
        r.cpi_inflation_pct,
        r.arpu_usd,
        r.quarterly_revenue_k,
        LAG(r.ending_subs_k) OVER (
            PARTITION BY r.iso3
            ORDER BY r.period_idx
        ) AS prior_quarter_ending_subs_k,
        LAG(r.ending_subs_k, 4) OVER (
            PARTITION BY r.iso3
            ORDER BY r.period_idx
        ) AS prior_year_ending_subs_k
    FROM fct_regional_subscriber_quarterly AS r
),

cohort_retention_benchmarks AS (
    SELECT
        c.bundle_tier,
        c.contract_type,
        COUNT(*) AS subscriber_accounts,
        ROUND(AVG(c.monthly_arpu), 2) AS avg_monthly_arpu_usd,
        ROUND(AVG(c.churned) * 100.0, 2) AS empirical_churn_rate_pct,
        ROUND(SUM(CASE WHEN c.autopay_enabled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS autopay_share_pct
    FROM fct_subscriber_retention_cohorts AS c
    GROUP BY c.bundle_tier, c.contract_type
),

partnership_economics AS (
    SELECT
        p.deal_structure,
        p.launch_timing,
        p.capital_market_aligned,
        p.wholesale_discount_pct,
        p.effective_partner_arpu_usd,
        p.gross_wholesale_adds_k,
        p.retail_cannibalization_rate_pct,
        p.cannibalized_retail_subs_k,
        p.net_incremental_subs_k,
        p.gross_partner_revenue_k,
        p.cannibalized_retail_rev_loss_k,
        p.incremental_operating_income_k,
        RANK() OVER (ORDER BY p.incremental_operating_income_k DESC) AS oi_rank
    FROM fct_partnership_deal_scenarios AS p
)

SELECT
    rsf.region_hub,
    rsf.country,
    rsf.period_label,
    rsf.beginning_subs_k,
    rsf.gross_adds_k,
    rsf.churned_subs_k,
    rsf.net_adds_k,
    rsf.ending_subs_k,
    ROUND(
        (rsf.ending_subs_k - rsf.prior_year_ending_subs_k)
        / NULLIF(rsf.prior_year_ending_subs_k, 0) * 100.0,
        2
    ) AS yoy_subscriber_growth_pct,
    rsf.arpu_usd,
    rsf.quarterly_revenue_k,
    pe.deal_structure AS top_partnership_structure,
    pe.net_incremental_subs_k AS partner_net_subs_k,
    pe.incremental_operating_income_k AS partner_incremental_oi_k
FROM regional_stock_flow AS rsf
LEFT JOIN partnership_economics AS pe
    ON pe.oi_rank = 1
ORDER BY rsf.region_hub, rsf.country, rsf.period_idx;

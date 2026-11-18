import json
from pathlib import Path
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

import pipeline  # noqa: E402


class TestDTCSubscriberGrowthPipeline(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.summary = pipeline.run_pipeline(ROOT / "data", ROOT / "outputs")

    def test_01_sha256_provenance_and_total_scale(self) -> None:
        self.assertEqual(self.summary["total_verified_public_records"], 102438)
        for meta in self.summary["dataset_provenance"].values():
            self.assertTrue(meta["verified"])

    def test_02_sqlite_reconciliation_gates_all_pass(self) -> None:
        audit = self.summary["sql_reconciliation_audit"]
        self.assertEqual(audit["gates_passed"], audit["gates_total"])
        for gate_name, passed in audit["gates"].items():
            self.assertTrue(passed, f"SQL gate failed: {gate_name}")

    def test_03_walk_forward_forecast_beats_seasonal_naive(self) -> None:
        fm = self.summary["international_forecast_metrics"]
        self.assertEqual(fm["markets_modeled"], 12)
        self.assertEqual(fm["region_quarters_modeled"], 192)
        self.assertEqual(fm["holdout_region_quarters"], 96)
        self.assertLess(fm["walk_forward_mape_pct"], fm["seasonal_naive_mape_pct"])
        self.assertGreater(fm["forecast_error_reduction_pct"], 50.0)

    def test_04_annual_contract_and_bundle_retention_lift(self) -> None:
        contracts = self.summary["telco_cohort_highlights"]["contract_summary"]
        tiers = self.summary["telco_cohort_highlights"]["tier_summary"]
        self.assertLess(contracts["One year"]["churn_rate"], contracts["Month-to-month"]["churn_rate"])
        self.assertGreater(
            tiers["Dual_Streaming_Bundle"]["avg_realized_ltv"],
            tiers["Single_Streaming_Tier"]["avg_realized_ltv"],
        )

    def test_05_partnership_deal_cannibalization_and_oi_optimization(self) -> None:
        pd_opt = self.summary["partnership_deal_optimization"]
        opt = pd_opt["optimal_deal"]
        unf = pd_opt["unfenced_baseline_deal"]
        self.assertTrue(opt["capital_market_aligned"])
        self.assertLess(opt["retail_cannibalization_rate_pct"], unf["retail_cannibalization_rate_pct"])
        self.assertGreater(opt["incremental_operating_income_k"], 20000.0)
        self.assertGreater(opt["net_incremental_subs_k"], unf["net_incremental_subs_k"])

    def test_06_grounded_ai_executive_brief(self) -> None:
        brief_path = ROOT / "outputs" / "executive_deck_variance_brief.json"
        self.assertTrue(brief_path.is_file())
        brief = json.loads(brief_path.read_text(encoding="utf-8"))
        self.assertTrue(brief["grounded_citations_verified"])
        self.assertEqual(brief["ungrounded_claims_count"], 0)
        self.assertEqual(len(brief["executive_deck_slides"]), 3)


if __name__ == "__main__":
    unittest.main()

# ============================================================
# 한국 인구 vs ORION-8 baseline LDL-C 분포 비교 시뮬레이션
# ============================================================

set.seed(2026)

## 1. 입력값 정의

# --- ORION-8 기준분포 (ASCVD 서브그룹, mmol/L -> mg/dL 변환) ---
# 근거: ASCVD 서브그룹 baseline LDL-C = 2.7 ± 1.0 mmol/L (n = 2709)
mmol_to_mgdl <- 38.67
orion_mean <- 2.7 * mmol_to_mgdl   # ≈ 104.4 mg/dL
orion_sd   <- 1.0 * mmol_to_mgdl   # ≈ 38.7 mg/dL
orion_n    <- 2709

# --- 한국 KNHANES 기준분포 ---
# TODO: Module 1에서 계산한 실제 값으로 교체
kr_mean <- 87.42
kr_sd   <- 34.76
kr_n    <- 313

## 2. 몬테카를로 시뮬레이션
n_sim <- 100000
sim_orion <- rnorm(n_sim, mean = orion_mean, sd = orion_sd)
sim_kr    <- rnorm(n_sim, mean = kr_mean,    sd = kr_sd)

## 3. 한국 평균의 ORION 분포 내 위치 (Z-score / percentile)
z_score <- (kr_mean - orion_mean) / orion_sd
percentile_analytic <- pnorm(z_score) * 100
percentile_sim <- mean(sim_orion < kr_mean) * 100

cat(sprintf("Z-score: %.3f\n", z_score))
cat(sprintf("한국 평균의 ORION 분포 내 위치 (이론값): %.1f 백분위수\n", percentile_analytic))
cat(sprintf("한국 평균의 ORION 분포 내 위치 (시뮬레이션): %.1f 백분위수\n", percentile_sim))

## 4. 두 분포 간 Overlap Coefficient (OVL)
dens_range <- seq(min(c(sim_orion, sim_kr)), max(c(sim_orion, sim_kr)), length.out = 2000)
d_orion <- dnorm(dens_range, orion_mean, orion_sd)
d_kr    <- dnorm(dens_range, kr_mean, kr_sd)
overlap_coefficient <- sum(pmin(d_orion, d_kr) * diff(dens_range)[1])

cat(sprintf("Overlap Coefficient (OVL): %.3f\n", overlap_coefficient))
cat("(1에 가까울수록 두 인구집단이 유사 -> ORION 효과 외삽 신뢰도 높음)\n")

## 5. 두 평균 차이에 대한 불확실성 (표준오차 기반)
se_orion <- orion_sd / sqrt(orion_n)
se_kr    <- kr_sd / sqrt(kr_n)
se_diff  <- sqrt(se_orion^2 + se_kr^2)

diff_sim <- rnorm(n_sim, mean = kr_mean - orion_mean, sd = se_diff)
ci_95 <- quantile(diff_sim, c(0.025, 0.975))

cat(sprintf("한국-ORION 평균 차이: %.2f mg/dL (95%% CI: %.2f, %.2f)\n",
            kr_mean - orion_mean, ci_95[1], ci_95[2]))

## 6. 해석 가이드
cat("\n--- 해석 가이드 ---\n")
if (abs(z_score) <= 1) {
  cat("한국 평균이 ORION 분포의 ±1SD 이내에 위치함.\n")
  cat("-> ORION pooled 효과를 한국 인구에도 비교적 신뢰성 있게 외삽 가능.\n")
} else {
  cat("한국 평균이 ORION 분포의 ±1SD 밖에 위치함.\n")
  cat("-> ORION pooled 효과를 그대로 적용하기보다 불확실성을 명시할 필요.\n")
}

## 7. 시각화
plot_data <- data.frame(
  value = c(sim_orion, sim_kr),
  group = rep(c("ORION-8 (ASCVD subgroup)", "Korea (KNHANES)"), each = n_sim)
)

if (requireNamespace("ggplot2", quietly = TRUE)) {
  library(ggplot2)
  p <- ggplot(plot_data, aes(x = value, fill = group)) +
    geom_density(alpha = 0.4) +
    geom_vline(xintercept = kr_mean, linetype = "dashed") +
    geom_vline(xintercept = orion_mean, linetype = "dashed") +
    labs(title = "Baseline LDL-C 분포 비교: 한국 vs ORION-8",
         x = "LDL-C (mg/dL)", y = "Density") +
    theme_minimal()
  print(p)
}
source(here::here("R/package_loading.R"))
# 1-dimensional plots -----------------------------------------------------

ggplot(NHANES, aes(x = BMI)) +
  geom_density()

ggplot(NHANES, aes(x = BMI)) +
  geom_histogram()

ggplot(NHANES, aes(x = Education)) +
  geom_bar()


# 2-dimensional plots -----------------------------------------------------

two_nums <-
  ggplot(NHANES,
         aes(x = Age, y = BPSysAve))
two_nums +
  geom_point()

two_nums +
  geom_line()

two_nums +
  geom_hex()

two_nums +
  geom_smooth()

two_categ <-
  ggplot(NHANES, aes(x = Education,
                     fill = Diabetes))

two_categ +
  geom_bar()

two_categ +
  geom_bar(position = position_dodge())

two_mixed <-
  ggplot(NHANES, aes(
    x = Diabetes,
    y = TotChol
    ))

two_mixed +
  geom_boxplot()

NHANES %>%
  filter(!is.na(Diabetes)) %>%
  ggplot(aes(x = Diabetes,
             y = TotChol)) +
  geom_boxplot()

two_mixed +
  geom_jitter(width = 0.2)


# Exercise ----------------------------------------------------------------

# See the variables available
names(NHANES)

# 1 continuous
ggplot(NHANES, aes(x = SleepHrsNight)) +
  geom_histogram()

# 1 discrete
ggplot(NHANES, aes(x = PregnantNow)) +
  geom_bar()

# 2 continuous
ggplot(NHANES, aes(x = Weight, y = TotChol)) +
  geom_hex()

# 2 discrete
ggplot(NHANES, aes(x = Gender, fill = PregnantNow)) +
  geom_bar()

# 1 continous and 1 discrete
ggplot(NHANES, aes(x = AlcoholDay, y = Gender)) +
  geom_jitter(width = 0.5)


# 3-dimensions ------------------------------------------------------------

colour_plot_nums <-
  ggplot(NHANES, aes(
    x = BMI,
    y = BPSysAve,
    colour = HomeOwn
  ))

colour_plot_nums +
  geom_point()

colour_plot_nums +
  geom_smooth()

colour_plot_mixed <-
  ggplot(NHANES, aes(
    x = Gender,
    y = BPSysAve,
    colour = HomeOwn
  ))

colour_plot_mixed +
  geom_boxplot()

colour_plot_mixed +
  geom_violin()

colour_plot_nums +
  geom_point(aes(alpha = Age))

colour_plot_nums +
  geom_point(aes(size = Age))

colour_plot_nums +
  geom_smooth(aes(linetype = Diabetes))

colour_plot_mixed +
  geom_boxplot() +
    facet_grid(cols = vars(SurveyYr),
               rows = vars(PhysActive))

colour_plot_nums +
  geom_point() +
  geom_smooth() +
  facet_grid(cols = vars(SurveyYr))

base_boxplot <-
  ggplot(NHANES, aes(
    x = HomeOwn,
    fill = Education
  )) +
  geom_bar(
    position = position_dodge()
  )

base_boxplot +
  scale_fill_viridis_d()

base_boxplot +
  scale_fill_viridis_d(option = "A")

base_boxplot +
  scale_fill_brewer()

base_boxplot +
  scale_fill_brewer(type = "qual")


# Exercise ----------------------------------------------------------------

# 1. Two continuous, discrete, and one facet.
ggplot(NHANES, aes(x = Weight, y = TotChol, colour = HomeRooms)) +
  geom_point() +
  facet_grid(rows = vars(Gender))
# Optional: add another layer

# 2. Three continuous, with viridis
ggplot(NHANES, aes(x = Weight, y = AlcoholDay, colour = PhysActiveDays)) +
  geom_point() +
  scale_fill_viridis_d()

# 3. Three discrete, with brewer
ggplot(NHANES, aes(x = BMI, fill = Gender)) +
   +
  facet_ +
  scale_


# Themes, tables, title ---------------------------------------------------

basic_scatterplot <-
  ggplot(NHANES, aes(
    x = Height,
    y = Weight,
    colour = Age
  )) +
  geom_point(alpha = 0.5) +
  facet_grid(cols = vars(Gender)) +
  scale_colour_viridis_c()

basic_scatterplot

basic_scatterplot +
  theme_bw()

basic_scatterplot +
  theme_classic()

basic_scatterplot +
  theme_minimal()

basic_scatterplot +
  labs(x = "Heigth in cm",
       y = "Weight in kg",
       title = "Height and Weight with Age")

basic_scatterplot +
  labs(x = "Heigth in cm",
       y = "Weight in kg",
       title = "Height and Weight with Age") +
  theme_minimal()

basic_scatterplot +
  theme(
    panel.background = element_rect(
      fill = "pink")
  )

basic_scatterplot +
  theme(
    panel.background = element_rect(
      fill = "pink"),
    axis.line.x = element_line(colour = "green")
  )

custom_theme <-  theme(
  panel.background = element_rect(
    fill = "pink")
)

plot_to_save <- basic_scatterplot +
  custom_theme

ggsave(here::here("doc/beautiful-figure.pdf"),
  plot_to_save)


# Final exercise ----------------------------------------------------------


NHANES %>%
  filter(!is.na(Diabetes)) %>%
  ggplot(aes(x = Poverty,
             y = BMI,
             colour = Diabetes))+
  facet_grid(cols = vars(SurveyYr),
             rows = vars(Gender)) +
  scale_colour_viridis_d() +
  geom_point()


NHANES %>%
  filter(!is.na(Diabetes)) %>%
  ggplot(aes(x = TotChol,
             y = Education,
             colour = Diabetes))+
  facet_grid(cols = vars(Gender)) +
  scale_colour_viridis_d() +
  geom_boxplot()





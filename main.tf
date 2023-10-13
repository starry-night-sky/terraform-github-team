resource "github_team" "gh_team" {
  name        = var.name
  description = var.desc
  privacy     = "closed"
}

resource "github_team_membership" "gh_team_membership" {
  count = length(var.membership_list)
  team_id  = github_team.gh_team.id
  username = element(var.membership_list[*].username, count.index)
  role = element(var.membership_list[*].is_maintainer, count.index) ? "maintainer" : "member"
}

resource "github_team_repository" "gh_team_repository" {
  count = length(var.repo_accessibility)
  repository = element(var.repo_accessibility[*].repository_name, count.index)
  team_id    = github_team.gh_team.id
  permission = element(var.repo_accessibility[*].permission, count.index)
}

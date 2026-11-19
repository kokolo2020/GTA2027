-- Harbor City leaderboard (v0.34). Paste into Supabase: your project > SQL Editor > New query > Run.
-- One row per player (their random player id). The game reads the top 30 and updates its own row
-- every minute or two. Limits stop silly values; anyone with the game's public key can still write
-- their own row, so treat it as a friendly board, not a prize ladder.

create table if not exists public.leaderboard (
  uid        text primary key check (char_length(uid) between 6 and 40),
  name       text not null check (char_length(name) between 1 and 16),
  level      int  not null default 1 check (level between 1 and 20),
  xp         bigint not null default 0 check (xp between 0 and 1000000000),
  cash       bigint not null default 0 check (cash between 0 and 1000000000),
  ach        int  not null default 0 check (ach between 0 and 500),
  kind       int  not null default 0 check (kind between 0 and 1000000),
  updated_at timestamptz not null default now()
);

alter table public.leaderboard enable row level security;

drop policy if exists "leaderboard read" on public.leaderboard;
drop policy if exists "leaderboard insert" on public.leaderboard;
drop policy if exists "leaderboard update" on public.leaderboard;
create policy "leaderboard read"   on public.leaderboard for select to anon using (true);
create policy "leaderboard insert" on public.leaderboard for insert to anon with check (true);
create policy "leaderboard update" on public.leaderboard for update to anon using (true) with check (true);

grant select, insert, update on public.leaderboard to anon;

-- Keep updated_at fresh on every update.
create or replace function public.leaderboard_touch() returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end $$;
drop trigger if exists leaderboard_touch on public.leaderboard;
create trigger leaderboard_touch before update on public.leaderboard
  for each row execute function public.leaderboard_touch();

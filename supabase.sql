-- Supabase SQL Editor: wersja z kontami użytkowników
create table if not exists public.app_state (
  id integer primary key,
  payload jsonb not null default '{"employees":[],"leaves":[],"replacements":[]}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.app_state enable row level security;
drop policy if exists "team can read" on public.app_state;
drop policy if exists "team can insert" on public.app_state;
drop policy if exists "team can update" on public.app_state;
create policy "authenticated team read" on public.app_state for select to authenticated using (true);
create policy "authenticated team insert" on public.app_state for insert to authenticated with check (id=1);
create policy "authenticated team update" on public.app_state for update to authenticated using (id=1) with check (id=1);
do $$ begin alter publication supabase_realtime add table public.app_state; exception when duplicate_object then null; end $$;

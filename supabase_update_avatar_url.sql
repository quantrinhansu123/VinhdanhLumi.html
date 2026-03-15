-- Supabase/Postgres SQL
-- SQL nay tu dong tim bang trong schema public co ca 2 cot: name va avatar_url.
-- Neu database cua ban khong co bang nao dung 2 cot nay, hay chay query kiem tra o cuoi file.

begin;

create temporary table tmp_avatar_updates (
    name text,
    avatar_url text
) on commit drop;

insert into tmp_avatar_updates (name, avatar_url)
values
        ('Nguyễn Trần Thành Đạt', 'https://drive.google.com/thumbnail?id=1fzxkLW-U6tBrsoeVomSVko8rKHo3WlVc&sz=w800'),
        ('Trần Văn Tiến', 'https://drive.google.com/thumbnail?id=1iQAphZYehYbD72NWHgD9d4KX5xUcjSx1&sz=w800'),
        ('Hoàng Tuấn Cường', 'https://drive.google.com/thumbnail?id=1liZeqnJvvsrA_ChdfbjmMJUgqj2DIOLg&sz=w800'),
        ('Mạnh Cường', 'https://drive.google.com/thumbnail?id=1_nkhhVlm4KOuUA6aoKNAj4mE5MbF-x1d&sz=w800'),
        ('Đỗ Mạnh Cường', 'https://drive.google.com/thumbnail?id=1_nkhhVlm4KOuUA6aoKNAj4mE5MbF-x1d&sz=w800'),
        ('Nguyễn Thị Hiếu', 'https://drive.google.com/thumbnail?id=1GmH2VP-DMIhvTm-TG65WlYyXrbS8ygwD&sz=w800'),
        ('Vũ Viết Anh', 'https://drive.google.com/thumbnail?id=191tir-VO8tOm56eLFBLlYrqD8--P-feY&sz=w800'),
        ('Lục Trần Minh Trí', 'https://drive.google.com/thumbnail?id=1sKhy1W92Eet7dDNu-HzYiRsGsy0AU7Tm&sz=w800'),
        ('Nguyễn Hiền Lương', 'https://drive.google.com/thumbnail?id=1TOwTb8o4rAqtKPZmI_Y-8szk1vqwsfK-&sz=w800'),
        ('Trần Huy Hùng', 'https://drive.google.com/thumbnail?id=1o-Xp4KBa76vsrOqcA9BLL7iTM852w_l_&sz=w800'),
        ('Phạm Tiến Thành', 'https://drive.google.com/thumbnail?id=1wELVha3c9zpqrauTItzr8Qp0trfhN2TP&sz=w800'),
        ('Trần Quốc Khải', 'https://drive.google.com/thumbnail?id=1z21zunKRZRO5ffw6KfLXWNTu0LhS_YOX&sz=w800'),
        ('Nguyễn Thị Thủy Tiên', 'https://drive.google.com/thumbnail?id=1xMEP5-HfCBUEIVu8GSTg3S_x8RRuBQoY&sz=w800'),
        ('Đoàn Thị Kim Oanh', 'https://drive.google.com/thumbnail?id=1hdAmisoQwBdVMhDXh2ewNw8XXSp5gVLm&sz=w800'),
        ('Đinh Văn Khải', 'https://drive.google.com/thumbnail?id=18ezyaCwzGOeR-mZSa78QETJuHaYtXulS&sz=w800'),
        ('Lê Trung Hiếu', 'https://drive.google.com/thumbnail?id=10TE6KIyEcEpBLov_svb_Orn7OYCh_90G&sz=w800'),
        ('Nguyễn Quang Trường', 'https://drive.google.com/thumbnail?id=1W56nfGDCqbk_XVCLYg1N20_pFkBzcspO&sz=w800'),
        ('Phạm Tuyết Trinh', 'https://drive.google.com/thumbnail?id=1EnzOdwHdoO4qD9-6eYQjr6gLR-e9qNKo&sz=w800'),
        ('Trần Thị Ngọc Ánh', 'https://drive.google.com/thumbnail?id=1ah5FMqd1ucXenzgUvdUguOoVMfB_ZE0p&sz=w800'),
        ('Nguyễn Thị Thảo', 'https://drive.google.com/thumbnail?id=1rJbWkI_PRup9ZzskLq_Iq3zaurpgRp_x&sz=w800'),
        ('Đặng Thị Nga', 'https://drive.google.com/thumbnail?id=1gPoBL2d8WgsqrZ32vmrHWHdCNAkGx4u_&sz=w800'),
        ('Phạm Thị Yến', 'https://drive.google.com/thumbnail?id=1qBR5clqVzQbUPgwRudH8BSoPRl04bykF&sz=w800'),
        ('Phạm Thị Lệ', 'https://drive.google.com/thumbnail?id=1fLAdtsgJqYBn65P3Qc0ShPyix6klzaQN&sz=w800'),
        ('Nguyễn Mỹ Duyên', 'https://drive.google.com/thumbnail?id=10rC1xNt-Nvns1Xxel7IWquki9y9VaseO&sz=w800'),
        ('Dương Đức Mạnh', 'https://drive.google.com/thumbnail?id=1gIfuSEwGvGsb4o_HktaHupYGjJjVRqjb&sz=w800'),
        ('Trần Thị Hồng Nhung', 'https://drive.google.com/thumbnail?id=14hVANI_MT2w0DI3xNMCaht8s5E5FBXaK&sz=w800'),
        ('Phạm Văn Đạt', 'https://drive.google.com/thumbnail?id=1OpIuH43ybVBeb7HhrVvQQ9_h-NqU8gYg&sz=w800'),
        ('Nguyễn Anh Điệp', 'https://drive.google.com/thumbnail?id=1Y09ORLQEBIQN-Sad_qZhEV4kPc2VUA-U&sz=w800'),
        ('Nguyễn Tiến Mạnh', 'https://drive.google.com/thumbnail?id=1zudVOf4mQk4z1iuWyXWVKlzFyZQvxWSZ&sz=w800'),
        ('Giang Kiều Duyên', 'https://drive.google.com/thumbnail?id=1i0g02w_pv-Liz2MiqaeDzXyNIMfGXjET&sz=w800'),
        ('Hoàng Thị Uyên', 'https://drive.google.com/thumbnail?id=1Nz__Y9UsL_dDVD_lInd5_85-vk9VIBlo&sz=w800'),
        ('Phạm Thị Huyền Trang', 'https://drive.google.com/thumbnail?id=1LCDJyhTr-G_kEabC9vZcL-DqN1a7UlwS&sz=w800'),
        ('Nguyễn Mạnh Tú', 'https://drive.google.com/thumbnail?id=1NahrdJp2wQ2I-OW2CUCViKeqhXuk24Vm&sz=w800'),
        ('Phan Thu Hương', 'https://drive.google.com/thumbnail?id=1Hyo_yN8Np_lTbzwpb6LzUAWkvdhIjP-t&sz=w800'),
        ('Trần Uy Vũ', 'https://drive.google.com/thumbnail?id=1tInrkQELxm0Jca-dJsEXstHF0i6DNlMl&sz=w800'),
        ('Nguyễn Thị Ánh Nguyệt', 'https://drive.google.com/thumbnail?id=1zFyLEdL5SeE74bbfsJ1Wt8AbtH1qSAhQ&sz=w800'),
        ('Nguyễn Thị Ánh Nguyệt 1', 'https://drive.google.com/thumbnail?id=1zFyLEdL5SeE74bbfsJ1Wt8AbtH1qSAhQ&sz=w800'),
        ('Bùi Thị Hảo', 'https://drive.google.com/thumbnail?id=1jq8j2GvGaXsQFjnvUoIF9ACUl6t1jg_k&sz=w800'),
        ('Trần Bùi Lan Phương', 'https://drive.google.com/thumbnail?id=1ZzJ6qPS5kC6bP_kc-gyDJJbChwmoCpgR&sz=w800'),
        ('Văn Thị Anh', 'https://drive.google.com/thumbnail?id=1uugGRR4u9A12sLwSf4Kp9HQqSnpZObgc&sz=w800'),
        ('Nguyễn Thị Mỹ Hạnh', 'https://drive.google.com/thumbnail?id=146xx9zPBe_4JNx-AGYcDM68mEQCEi3EP&sz=w800'),
        ('Đỗ Thị Thanh Huệ', 'https://drive.google.com/thumbnail?id=1rGY7ZjnFZvkcXc-lR5vEJspu6YTCMjol&sz=w800'),
        ('Nguyễn Thị Thu', 'https://drive.google.com/thumbnail?id=1pkhZ__YRel6C6IEwK29YvNuR39LnQxfj&sz=w800'),
        ('Đồng Tố Dũng', 'https://drive.google.com/thumbnail?id=1vzshZNQFVZEe8HYJRFZ5oxx6JP9QIdYY&sz=w800'),
        ('Nguyễn Đức Huy', 'https://drive.google.com/thumbnail?id=1CoWTsxTzfZEp2yLpnuaMAjthdSKV8Y_f&sz=w800'),
        ('Nguyễn Thị Ngọc Ánh', 'https://drive.google.com/thumbnail?id=1hQ7s_Xg7LZmc_b7BhplrD5I_pMOZjPi1&sz=w800'),
        ('Đặng Thị Hoa', 'https://drive.google.com/thumbnail?id=1T3kCVcmZ4eoBDraFuv_ucXcRRILOUFV1&sz=w800'),
        ('Lê Thị Thuý', 'https://drive.google.com/thumbnail?id=1oBCubueLuQOnRa912bd0eQanmmcphux0&sz=w800'),
        ('Nguyễn Thị Hường', 'https://drive.google.com/thumbnail?id=1gP-HI-V-ig24pDx4n-9ZmhbFdBfI1js4&sz=w800'),
        ('Mai Thị Lý', 'https://drive.google.com/thumbnail?id=1k_eyFAFWs-5v1aYVLpnegprvJjvYiOYc&sz=w800'),
        ('Trần Thị Nhung', 'https://drive.google.com/thumbnail?id=1_QfAXZ-ZU7oChppYWiDoRaRxJqwCSr-6&sz=w800'),
        ('Hoàng Thị Hương Giang', 'https://drive.google.com/thumbnail?id=1YF8Jv_bT5fYY3qV89_EPxKwoKCWYBxUN&sz=w800'),
        ('Phạm Thị Phương Thảo', 'https://drive.google.com/thumbnail?id=1-3zQ-hLkiWB4LeVKMdZCasEsl8xFuwC_&sz=w800'),
        ('Đỗ Thị Thu Hằng', 'https://drive.google.com/thumbnail?id=137slyKEqqFZ_ErySbms6CaTIoMCwOzce&sz=w800'),
        ('Đỗ Thị Thu Uyên', 'https://drive.google.com/thumbnail?id=1Y4VJQlxgBORhVzz8PbPE7wKzew2E5xR9&sz=w800'),
        ('Nguyễn Văn Tuấn', 'https://drive.google.com/thumbnail?id=1bKhgPV1FTYg0PJZUS3T7087s3H7LSQMG&sz=w800');

do $$
declare
    target_table text;
begin
    select format('%I.%I', c.table_schema, c.table_name)
    into target_table
    from information_schema.columns as c
    where c.table_schema = 'public'
    group by c.table_schema, c.table_name
    having bool_or(c.column_name = 'name')
       and bool_or(c.column_name = 'avatar_url')
    order by
        case
            when c.table_name in ('profiles', 'users', 'members', 'employees', 'staff', 'nhansu', 'nhan_su') then 0
            else 1
        end,
        c.table_name
    limit 1;

    if target_table is null then
        raise exception 'Khong tim thay bang nao trong schema public co ca 2 cot name va avatar_url. Hay chay query kiem tra o cuoi file de xem ten bang.';
    end if;

    execute format(
        'update %s as p set avatar_url = src.avatar_url from tmp_avatar_updates as src where p.name = src.name',
        target_table
    );

    raise notice 'Da cap nhat avatar_url tren bang %', target_table;
end $$;

commit;

-- Neu script van bao khong tim thay bang, chay query nay de xem bang nao dang co cot name/avatar_url:
-- select table_schema, table_name,
--        string_agg(column_name, ', ' order by ordinal_position) as columns
-- from information_schema.columns
-- where table_schema = 'public'
-- group by table_schema, table_name
-- having bool_or(column_name = 'name')
--     or bool_or(column_name = 'avatar_url')
-- order by table_name;

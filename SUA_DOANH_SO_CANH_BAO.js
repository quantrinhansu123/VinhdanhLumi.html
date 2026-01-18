/***************************************************************
 * HƯỚNG DẪN SỬA "Thẻ cảnh báo.html"
 * Để doanh số LUÔN tính từ đầu tháng đến hôm nay
 ***************************************************************/

// ============================================================
// BƯỚC 1: Tìm hàm updateData() - dòng ~1462
// ============================================================

// ============================================================
// BƯỚC 2: THAY THẾ code từ dòng 1479-1505
// ============================================================

// ********** XÓA CODE CŨ NÀY (dòng 1479-1505): **********
/*
            const { start, end } = getDateRange(type, weekValue);
            // TUẦN HIỆN TẠI: KHÔNG lọc theo Kết quả Check (tính tất cả đơn)
            // TUẦN ĐÃ QUA: CÓ lọc theo Kết quả Check (chỉ tính đơn Ok)
            // THÁNG (tất cả): CÓ lọc theo Kết quả Check (chỉ tính đơn Ok)
            const shouldFilterStatus = (type === 'month') || (type === 'week' && !isCurrentPeriod);
            const stats = calculateStats(start, end, shouldFilterStatus, isCurrentPeriod);
            currentStats = stats; // Lưu stats để dùng cho vinh danh

            // Tạo timeLabel cho vinh danh
            let timeLabel = '';
            if (type === 'week') {
                // Tính toán thời gian tuần dựa trên ngày thực tế
                const { start: weekStart, end: weekEnd } = getDateRange(type, weekValue);
                const startDay = weekStart.getDate();
                const startMonth = weekStart.getMonth() + 1;
                const endDay = weekEnd.getDate();
                const endMonth = weekEnd.getMonth() + 1;
                timeLabel = `Tuần ${weekValue.replace('w', '')} (${startDay}/${startMonth} - ${endDay}/${endMonth})`;
            } else {
                const m = filterSettings ? filterSettings.month : (document.getElementById('filter-month') ? parseInt(document.getElementById('filter-month').value) : new Date().getMonth() + 1);
                const y = filterSettings ? filterSettings.year : (document.getElementById('filter-year') ? parseInt(document.getElementById('filter-year').value) : new Date().getFullYear());
                timeLabel = `Tháng ${m}/${y}`;
            }
            currentStats.timeLabel = timeLabel;

            document.getElementById('date-range-display').innerText =
                `${start.getDate()}/${start.getMonth() + 1}/${start.getFullYear()} - ${end.getDate()}/${end.getMonth() + 1}/${end.getFullYear()}`;
*/

// ********** THAY BẰNG CODE MỚI NÀY: **********

// ============================================
// CẢNH BÁO: LUÔN TÍNH TỪ ĐẦU THÁNG ĐẾN HÔM NAY
// ============================================
const now = new Date();
const start = new Date(now.getFullYear(), now.getMonth(), 1, 0, 0, 0, 0);
const end = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 23, 59, 59, 999);

console.log(`[CẢNH BÁO] Tính doanh số từ ${start.toLocaleDateString()} đến ${end.toLocaleDateString()}`);

// LUÔN tính tất cả đơn (không lọc theo Kết quả Check)
const shouldFilterStatus = false;
const stats = calculateStats(start, end, shouldFilterStatus, true);
currentStats = stats;

// Tạo timeLabel - Hiển thị tháng hiện tại
const currentMonth = now.getMonth() + 1;
const currentYear = now.getFullYear();
const currentDay = now.getDate();
const timeLabel = `Tháng ${currentMonth}/${currentYear} (đến ngày ${currentDay})`;
currentStats.timeLabel = timeLabel;

document.getElementById('date-range-display').innerText =
    `1/${currentMonth}/${currentYear} - ${currentDay}/${currentMonth}/${currentYear}`;


// ============================================================
// KẾT QUẢ SAU KHI SỬA:
// ============================================================

/*
1. Doanh số LUÔN tính từ ngày 1 tháng hiện tại đến hôm nay
   Ví dụ hôm nay 16/1/2026:
   - Start: 1/1/2026 00:00:00
   - End: 16/1/2026 23:59:59

2. KHÔNG lọc theo "Kết quả Check = Ok"
   - Tất cả đơn hàng đều được tính

3. Hiển thị trên header:
   - "1/1/2026 - 16/1/2026"
   - "Tháng 1/2026 (đến ngày 16)"

4. Cột "Doanh số" = Tổng tất cả đơn từ 1/1 → 16/1

5. KHÔNG phụ thuộc vào filter settings từ index.html nữa
*/

// ============================================================
// LƯU FILE VÀ REFRESH BROWSER ĐỂ THẤY THAY ĐỔI
// ============================================================

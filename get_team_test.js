// Script để lấy danh sách nhân sự team Test từ API HR
const HR_URL = 'https://lumi-6dff7-default-rtdb.asia-southeast1.firebasedatabase.app/datasheet/Nh%C3%A2ns%E1%BB%B1';

function findVal(obj, keys) {
    if (!obj) return null;
    if (!Array.isArray(keys)) keys = [keys];
    const lowerKeys = keys.map(k => k.toLowerCase().trim());
    for (let k in obj) {
        if (lowerKeys.includes(k.toLowerCase().trim())) {
            return obj[k];
        }
    }
    return null;
}

async function getTeamTestMembers() {
    try {
        console.log('Đang tải dữ liệu từ HR API...');
        const response = await fetch(HR_URL + '.json');
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        const data = await response.json();
        const hrData = Array.isArray(data) ? data : Object.values(data);
        
        console.log(`Tổng số nhân sự: ${hrData.length}`);
        
        // Lọc nhân sự có team là "test" (không phân biệt hoa thường)
        const teamTestMembers = hrData.filter(record => {
            const team = findVal(record, ['Team', 'TEAM', 'team', 'Bộ phận', 'Bộ Phận']);
            const teamStr = String(team || '').toLowerCase().trim();
            return teamStr === 'test';
        });

        console.log(`\n=== Tìm thấy ${teamTestMembers.length} nhân sự trong team Test ===\n`);
        
        if (teamTestMembers.length === 0) {
            console.log('Không tìm thấy nhân sự nào trong team Test');
            return [];
        }

        // In danh sách tên
        console.log('DANH SÁCH TÊN:');
        console.log('-------------------');
        teamTestMembers.forEach((member, index) => {
            const name = findVal(member, ['Họ và Tên', 'Họ Và Tên', 'Họ và tên', 'Tên', 'Name', 'Họ tên']);
            const position = findVal(member, ['Chức vụ', 'Vị trí', 'Position', 'Chức vụ']);
            const branch = findVal(member, ['Chi nhánh', 'chi nhánh', 'Chi Nhánh', 'Branch']);
            const email = findVal(member, ['Email', 'email', 'E-mail']);
            
            console.log(`${index + 1}. ${name || 'N/A'}`);
            if (position) console.log(`   Chức vụ: ${position}`);
            if (branch) console.log(`   Chi nhánh: ${branch}`);
            if (email) console.log(`   Email: ${email}`);
            console.log('');
        });

        // Trả về danh sách tên đơn giản
        const names = teamTestMembers.map(member => {
            return findVal(member, ['Họ và Tên', 'Họ Và Tên', 'Họ và tên', 'Tên', 'Name', 'Họ tên']);
        }).filter(Boolean);

        console.log('\n=== DANH SÁCH TÊN (chỉ tên) ===');
        names.forEach((name, index) => {
            console.log(`${index + 1}. ${name}`);
        });

        return teamTestMembers;
    } catch (error) {
        console.error('Lỗi khi tải dữ liệu:', error);
        throw error;
    }
}

// Chạy hàm
getTeamTestMembers().then(members => {
    console.log(`\n✅ Hoàn thành! Tổng cộng ${members.length} nhân sự team Test`);
}).catch(err => {
    console.error('❌ Lỗi:', err);
});

// Script để kiểm tra tất cả các team có chứa "test"
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

async function checkTeams() {
    try {
        console.log('Đang tải dữ liệu từ HR API...');
        const response = await fetch(HR_URL + '.json');
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        const data = await response.json();
        const hrData = Array.isArray(data) ? data : Object.values(data);
        
        console.log(`Tổng số nhân sự: ${hrData.length}\n`);
        
        // Lấy tất cả các team unique
        const teamMap = new Map();
        
        hrData.forEach(record => {
            const team = findVal(record, ['Team', 'TEAM', 'team', 'Bộ phận', 'Bộ Phận']);
            const teamStr = String(team || '').trim();
            if (teamStr) {
                if (!teamMap.has(teamStr.toLowerCase())) {
                    teamMap.set(teamStr.toLowerCase(), teamStr);
                }
            }
        });

        console.log('=== TẤT CẢ CÁC TEAM ===');
        const allTeams = Array.from(teamMap.values()).sort();
        allTeams.forEach((team, index) => {
            console.log(`${index + 1}. ${team}`);
        });

        // Tìm các team có chứa "test" (không phân biệt hoa thường)
        console.log('\n=== CÁC TEAM CÓ CHỨA "TEST" ===');
        const testTeams = allTeams.filter(team => 
            team.toLowerCase().includes('test')
        );

        if (testTeams.length === 0) {
            console.log('Không tìm thấy team nào chứa "test"');
        } else {
            testTeams.forEach((team, index) => {
                console.log(`${index + 1}. ${team}`);
                
                // Đếm số nhân sự trong team này
                const members = hrData.filter(record => {
                    const recordTeam = findVal(record, ['Team', 'TEAM', 'team', 'Bộ phận', 'Bộ Phận']);
                    return String(recordTeam || '').trim() === team;
                });
                
                console.log(`   → ${members.length} nhân sự`);
                
                // In danh sách tên
                members.forEach(member => {
                    const name = findVal(member, ['Họ và Tên', 'Họ Và Tên', 'Họ và tên', 'Tên', 'Name', 'Họ tên']);
                    if (name) {
                        console.log(`      - ${name}`);
                    }
                });
                console.log('');
            });
        }

    } catch (error) {
        console.error('Lỗi:', error);
    }
}

checkTeams();

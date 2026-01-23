// Script để tìm kiếm "test" trong tất cả các trường dữ liệu
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

async function searchTest() {
    try {
        console.log('Đang tải dữ liệu từ HR API...');
        const response = await fetch(HR_URL + '.json');
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        const data = await response.json();
        const hrData = Array.isArray(data) ? data : Object.values(data);
        
        console.log(`Tổng số nhân sự: ${hrData.length}\n`);
        
        // Tìm kiếm "test" trong tất cả các trường
        const results = [];
        
        hrData.forEach(record => {
            let found = false;
            let foundFields = [];
            
            for (let key in record) {
                const value = String(record[key] || '').toLowerCase();
                if (value.includes('test')) {
                    found = true;
                    foundFields.push(`${key}: ${record[key]}`);
                }
            }
            
            if (found) {
                const name = findVal(record, ['Họ và Tên', 'Họ Và Tên', 'Họ và tên', 'Tên', 'Name', 'Họ tên']);
                const team = findVal(record, ['Team', 'TEAM', 'team', 'Bộ phận', 'Bộ Phận']);
                results.push({
                    name: name || 'N/A',
                    team: team || 'N/A',
                    foundFields: foundFields
                });
            }
        });

        if (results.length === 0) {
            console.log('❌ Không tìm thấy bất kỳ nhân sự nào có chứa "test" trong dữ liệu');
        } else {
            console.log(`✅ Tìm thấy ${results.length} nhân sự có chứa "test":\n`);
            results.forEach((result, index) => {
                console.log(`${index + 1}. ${result.name}`);
                console.log(`   Team: ${result.team}`);
                console.log(`   Các trường chứa "test":`);
                result.foundFields.forEach(field => {
                    console.log(`      - ${field}`);
                });
                console.log('');
            });
        }

        // In danh sách tên đơn giản
        if (results.length > 0) {
            console.log('\n=== DANH SÁCH TÊN ===');
            results.forEach((result, index) => {
                console.log(`${index + 1}. ${result.name}`);
            });
        }

    } catch (error) {
        console.error('Lỗi:', error);
    }
}

searchTest();

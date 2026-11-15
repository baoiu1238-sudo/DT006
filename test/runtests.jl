using Test
include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

@testset "DT006 - Dao mang tai cho" begin
    # TC01: 4 phần tử
    a1 = [1, 2, 3, 4]
    @test giai_bai(a1) == ([4, 3, 2, 1], 2) 
    @test a1 == [4, 3, 2, 1]

    # TC02: 5 phần tử
    a2 = [1, 2, 3, 4, 5]
    @test giai_bai(a2) == ([5, 4, 3, 2, 1], 2)

    # TC03: 1 phần tử
    a3 = [9]
    @test giai_bai(a3) == ([9], 0)

    # TC04: mảng rỗng
    a4 = Int[]
    @test giai_bai(a4) == (Int[], 0)

    # TC05: có số trùng và số âm
    a5 = [2, 2, -1]
    @test giai_bai(a5) == ([-1, 2, 2], 1)
   
    # TC06: mảng có 2 phần tử
    a6 = [3, 6]
    @test giai_bai(a6) == ([6, 3], 1)

    # TC07: các phần tử đều âm
    a7 = [-7, -9, -10]
    @test giai_bai(a7) == ([-10, -9, -7], 1)

    # TC08: có số âm, số 0 và số dương
    a8 = [0, -20, 65, 0]
    @test giai_bai(a8) == ([0, 65, -20, 0], 2)

    # TC09: hai phần tử ở hai đầu bằng nhau
    a09 = [23, 3, 23]
    @test giai_bai(a09) == ([23, 3, 23], 1)

    # TC10: mảng có 10000 phần tử
    a10 = collect(1:10000)
    ket_qua10 = giai_bai(a10)
    @test ket_qua10 == (collect(10000:-1:1), 5000)

    # TC11: dữ liệu có phần tử không phải số nguyên
    a11 = [5, "sáu", 7]
    @test kiem_tra_dau_vao(a11) == false
    @test_throws ArgumentError giai_bai(a11)

    # TC12: đảo bản sao hai lần thì trở về mảng ban đầu
    ban_dau = [5, 67, 0, 43]
    thu = copy(ban_dau)
    giai_bai(thu)
    giai_bai(thu)
    @test thu == ban_dau

end

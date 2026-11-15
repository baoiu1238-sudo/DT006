include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai

function in_ket_qua(ma_ca, du_lieu, expected)
    println("DT006 - DAO MANG TAI CHO")
    println("Ca: ", ma_ca)
    println("Input: ", du_lieu)
    println("Expected: ", expected)

    actual = giai_bai(du_lieu)
    println("Actual: ", actual)
    println("Kiem tra: ", actual == expected ? "DUNG" : "SAI")
end

function chay_ca(ca)
    if ca == 1
        in_ket_qua("TC01", [1, 2, 3, 4], ([4, 3, 2, 1], 2))
    elseif ca == 2
        in_ket_qua("TC02", [1, 2, 3, 4, 5], ([5, 4, 3, 2, 1], 2))
    elseif ca == 3
        in_ket_qua("TC03", [9], ([9], 0))
    elseif ca == 4
        in_ket_qua("TC04", Int[], (Int[], 0))
    elseif ca == 5
        in_ket_qua("TC05", [2, 2, -1], ([-1, 2, 2], 1))
    elseif ca == 6
        in_ket_qua("TC06", [3, 6], ([6, 3], 1))
    elseif ca == 7
        in_ket_qua("TC07", [-7, -9, -10], ([-10, -9, -7], 1))
    elseif ca == 8
        in_ket_qua("TC08", [0, -20, 65, 0], ([0, 65, -20, 0], 2))
    elseif ca == 9
        in_ket_qua("TC09", [23, 3, 23], ([23, 3, 23], 1))
    elseif ca == 10
        du_lieu = collect(1:10000)
        doi_cho = last(giai_bai(du_lieu))
        dung = length(du_lieu) == 10000 &&
               first(du_lieu) == 10000 &&
               last(du_lieu) == 1 &&
               doi_cho == 5000

        println("DT006 - TC10: mang 10000 phan tu")
        println("Actual: length=", length(du_lieu),
                "; phan tu dau=", first(du_lieu),
                "; phan tu cuoi=", last(du_lieu),
                "; doi_cho=", doi_cho)
        println("Kiem tra: ", dung ? "DUNG" : "SAI")
    elseif ca == 11
    du_lieu = Any[5, "sáu", 7]
    println("DT006 - TC11: input sai")
    println("Input: ", du_lieu)
    println("Expected: false, ArgumentError")

    hop_le = kiem_tra_dau_vao(du_lieu)
    try
        giai_bai(du_lieu)
    catch loi
        if loi isa ArgumentError
            println("Actual: ", hop_le, ", ", typeof(loi))
        else
            rethrow()
        end
    end
    elseif ca == 12
        ban_dau = [5, 67, 0, 43]
        thu = copy(ban_dau)

        lan_1 = giai_bai(thu)
        lan_2 = giai_bai(thu)

        println("DT006 - TC12: dao hai lan")
        println("Mang ban dau: ", ban_dau)
        println("Sau lan dao thu nhat: ", lan_1)
        println("Sau lan dao thu hai: ", lan_2)
        println("Bang mang ban dau: ", thu == ban_dau)
    else
        throw(ArgumentError("Chon --ca=1 den --ca=12"))
    end
end

if isempty(ARGS)
    println("--- Vi du 1 ---")
    chay_ca(1)
    println("\n--- Vi du 2 ---")
    chay_ca(4)
elseif length(ARGS) == 1 && startswith(ARGS[1], "--ca=")
    so_ca = tryparse(Int, split(ARGS[1], "=")[2])
    so_ca === nothing && throw(ArgumentError("Ma ca phai la so"))
    chay_ca(so_ca)
else
    throw(ArgumentError("Dung mac dinh hoac chon --ca=1 den --ca=12"))
end
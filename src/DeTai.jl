module DeTai

export kiem_tra_dau_vao, giai_bai

function kiem_tra_dau_vao(du_lieu)
        if !(du_lieu isa Vector{Int}) || length(du_lieu) > 10000
        return false
    end
    return true
end

function giai_bai(du_lieu)
    if !kiem_tra_dau_vao(du_lieu)
        throw(ArgumentError("Dữ liệu đầu vào không hợp lệ"))
    end

    trai = 1
    phai = length(du_lieu)
    doi_cho = 0

    while trai < phai
        doi_cho += 1
        du_lieu[trai], du_lieu[phai] = du_lieu[phai], du_lieu[trai]
        trai += 1
        phai -= 1
        
    end
    
    return du_lieu, doi_cho
end

end # module DeTai

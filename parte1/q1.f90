program ajuste1

    implicit none

    integer :: ios, i, rank
    integer, parameter :: N = 17
    double precision :: sumx, sumy
    double precision, dimension(N) :: x, y

    ! did you know that status="unknown" is not only optional
    ! but the default value, if you don't explicit it?
    open(unit=100, file="tabela1.dat", iostat=ios, action="read")
    if ( ios /= 0 ) stop "Erro na leitura do arquivo 100."

    do i=1, N, 1
        read(100, *) x(i), y(i)
        sumx = sumx + x(i)
        sumy = sumy + y(i)
    end do

    

    close(unit=100)

end program ajuste1

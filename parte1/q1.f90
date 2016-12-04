program ajuste1

    implicit none

    integer :: ios, i, j, rank
    integer, parameter :: N = 17 !datasheet size
    double precision :: sumx, sumy
    double precision, dimension(N) :: x, y

    ! did you know that status="unknown" is not only optional
    ! but the default value, if you don't explicit it?
    open(unit=100, file="tabela1.dat", iostat=ios, action="read")
    if ( ios /= 0 ) stop "Erro na leitura do arquivo 100."
    do i=1, N, 1
        read(100, *) x(i), y(i)
    end do
    close(unit=100)

    read(*,*) rank

contains

    ! solves system Ax=B, dumps answer in x
    subroutine solveSystem(A, x, B, i, n)
        implicit none

        integer, intent(in) :: i, n

        double precision, dimension(i, n), intent(in) :: A
        double precision, dimension(n), intent(in) :: B
        double precision, dimension(i), intent(out) :: x

        

    end subroutine

end program ajuste1

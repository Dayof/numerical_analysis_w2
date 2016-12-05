program trapezios
    implicit none

    integer :: i, j, k
    integer, parameter :: N = 16
    real, parameter :: h = 0.1
    real :: sum
    real, dimension(0:N) :: x, y

    open(unit=11, file="data/tabela1.dat", status="unknown",  action="read")

    do i=0, N
        read(11, *) x(i), y(i)
    enddo

    close(unit=11)

    open(unit=12, file="data/question4.dat", status="unknown",  action="write")

        sum = (h/2.0)*y(0) + (h/2.0)*y(n)
        do i=1, N-1
            sum = sum + h*y(i)
        enddo
        write(12,*) sum

    close(unit=12)

end program trapezios

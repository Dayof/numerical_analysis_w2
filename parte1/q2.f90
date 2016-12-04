program question2

    implicit none

    integer :: i
    integer, parameter :: N = 16
    real :: t
    real, dimension(N) :: x, y

    t = 1.8

    open(unit=11, file="data/tabela1.dat", status="unknown",  action="read")

    do i=0, N
        read(11, *) x(i), y(i)
    enddo

    close(unit=11)

    open(unit=12, file="data/question2.dat", status="unknown",  action="write")

        write(12,*) P(t, x, y)
        write(*,*) P(t, x, y)

    close(unit=12)

contains
    function P(t, x, y)

        implicit none

        integer :: i
        real :: t, P
        real, dimension(N) :: x, y

        P = 0

        do i=0, N
            P = P + y(i)*L(i, t, x)
        enddo

        return
    end function

    function L(i, t, x)

        implicit none

        integer :: i, j
        real :: L, t
        real, dimension(N) :: x

        L = 1

        do j=0, N
            if(j .ne. i) then
                L = L * ((t - x(j))/(t - x(i)))
            endif
        enddo

        return
    endfunction
end program question2

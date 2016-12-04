program question2

    implicit none

    integer :: i, j, k
    integer, parameter :: N = 16
    real :: Pn, P
    real, dimension(0:N) :: x, y

    open(unit=11, file="data/tabela1.dat", status="unknown",  action="read")

    do i=0, N
        read(11, *) x(i), y(i)
    enddo

    close(unit=11)

    open(unit=12, file="data/question2.dat", status="unknown",  action="write")

        do k=0, N
            Pn = 0
            do i=0, N
                P = 1
                do j=0, N
                    if(i .ne. j) then
                        P = P*((x(k) - x(j))/(x(i) - x(j)))
                    endif
                enddo
                Pn = (P*y(i-1)) + Pn
            enddo
            write(12,*) x(k), Pn
        enddo

    close(unit=12)
end program question2

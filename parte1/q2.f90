program question2

    implicit none

    integer :: i
    integer, parameter :: N = 3

    open(unit=11, file="data/question2.dat", status="unknown",  action="write")

    do i=1, N
        write(11,*) "olar"
    end do


    close(unit=11)
end program question2

program coeficienteR2

    implicit none

    double precision :: sqres=0.0d0, sqtot=0.0d0, temp
    integer, parameter :: N=16
    integer :: i=0, j

    double precision, dimension(0:10) :: adjust
    double precision, dimension(0:N,2) :: v

    adjust = 0.0d0

    open(unit=100, file="data/question1.dat")
        read(100, *) adjust(:)
    close(unit=100)

    open(unit=101, file="data/tabela1.dat")
        do i = 0, N, 1
            read(101,*) v(i,1), v(i,2)
        end do
    close(unit=101)

    do i = 0, N, 1
        temp = adjust(0)
        do j=1, 10, 1
            temp = temp + adjust(j)*v(i,1)**j
        end do
        sqtot = sqtot + v(i,2)**2
        sqres = sqres + (temp - v(i,2))**2
    end do

    write(*,*) 1 - sqres / sqtot

end program

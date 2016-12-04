program ajuste1

    ! All matrixes are 0-indexed in this solution.
    ! This is solely for readability, because powers also start at 0.

    implicit none

    integer :: ios, i, j, rank
    integer, parameter :: N = 16 !datasheet size
    double precision, dimension(0:N, 0:0) :: x, y
    double precision, dimension(:,:), allocatable :: Vander, VanTrans, Gram
    double precision, dimension(:,:), allocatable :: B, alpha

    ! did you know that status="unknown" is not only optional
    ! but the default value, if you don't explicit it?
    open(unit=100, file="data/tabela1.dat", iostat=ios, action="read")
    if ( ios /= 0 ) stop "Erro na leitura do arquivo 'tabela1.dat'."
    do i=0, N, 1
        read(100, *) x(i, 0), y(i, 0)
    end do
    close(unit=100)

    read(*,*) rank

    allocate(Vander(0:N, 0:rank))
    allocate(VanTrans(0:rank, 0:N))
    allocate(Gram(0:rank, 0:rank))
    allocate(B(0:rank, 0:0))
    allocate(alpha(0:rank, 0:0))

    ! Vandermonde matrix
    do i=0, N, 1
        do j=0, rank
            Vander(i,j) = x(i, 0)**j
        end do
    end do

    !Transpose matrix
    do i=0, N, 1
        do j=0, rank
            VanTrans(j,i) = Vander(i,j)
        end do
    end do

    ! Gram = VanTrans * Vander
    call multiply(VanTrans, Vander, Gram, rank, N, rank)

    ! B = VanTrans * y
    call multiply(VanTrans, y, B, rank, N, 0)

    ! solve Gram * alpha = B
    call solveSystem(Gram, alpha, B, rank)

    open(unit=101, file="data/question1.dat")
        write(101,*) alpha(:,0)
    close(unit=101)

    deallocate(alpha)
    deallocate(B)
    deallocate(Gram)
    deallocate(VanTrans)
    deallocate(Vander)

contains
    ! solves system Ax=B, dumps answer in x
    ! uses GaussSeidel
    subroutine solveSystem(A, x, B, n)
        implicit none

        integer, intent(in) :: n

        double precision, dimension(0:n, 0:n), intent(in) :: A
        double precision, dimension(0:n, 0:0), intent(in) :: B
        double precision, dimension(0:n, 0:0), intent(out) :: x

        integer :: iter, i, j
        double precision :: sum

        x = 0.0
        do iter=1, 100000
            do i=0, n
                sum = 0.0
                do j=0, n
                    if(j.ne.i) then
                        sum = sum + A(i,j)*x(j,0)
                    end if
                end do
                x(i,0) = (B(i,0)-sum)/A(i,i)
            end do
        end do
    end subroutine

    subroutine multiply(m1, m2, m3, X, Y, Z)
        implicit none

        integer, intent(in) :: X,Y,Z
        double precision, dimension(0:X,0:Y), intent(in) :: m1
        double precision, dimension(0:Y,0:Z), intent(in) :: m2
        double precision, dimension(0:X,0:Z), intent(out) :: m3

        double precision :: sum
        integer :: i, j, k

        do i=0, X
            do j=0, Z

                sum = 0.0
                do k=0, Y
                    sum = sum + m1(i,k)*m2(k,j)
                end do
                m3(i,j) = sum

            end do
        end do

        return
    end subroutine

end program ajuste1

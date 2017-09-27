define amix_vimrc::vimrc ( $user = $title, $awesome_version = true ) {
  if $user == 'root' {
    $home = '/root'
  } else {
    $home = "/home/$user"
  }

  vcsrepo { "$home/.vim_runtime":
      ensure      => present,
      provider    => git,
      source      => 'https://github.com/amix/vimrc.git',
      user        => $user,
      submodules  => false,
  }

  $path = '/bin'

  if $awesome_version {
    exec { "${user}_install_awesome_vimrc":
      path    => $path,
      command => 'sh ~/.vim_runtime/install_awesome_vimrc.sh',
      user    => $user,
      require => Vcsrepo["$home/.vim_runtime"],
    }
  } else {
    exec { "${user}_install_basic_vimrc":
      path    => $path,
      command => 'sh ~/.vim_runtime/install_basic_vimrc.sh',
      user    => $user,
      require => Vcsrepo["$home/.vim_runtime"],
    }
  }
}

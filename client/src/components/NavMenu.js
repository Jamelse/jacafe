import React, {useState} from "react";
import { Menu, MenuItem, Button } from '@mui/material'

function NavMenu(){
  const [anchorEl, setAnchorEl] = useState(null);
  const open = Boolean(anchorEl);

  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };
  
  const handleClose = () => {
    setAnchorEl(null);
  };

  return (
    <>
      <Button sx={{ color: 'text.primary'}}
        id="basic-button"
        aria-controls={open ? 'basic-menu' : undefined}
        aria-haspopup="true"
        aria-expanded={open ? 'true' : undefined}
        onClick={handleClick}>
          Menu
      </Button>
      <Menu
        id="basic-menu"
        disableScrollLock={true}
        anchorEl={anchorEl}
        open={open}
        onClose={handleClose}
        MenuListProps={{
          'aria-labelledby': 'basic-button',}}>
        <MenuItem onClick={handleClose}>Hot Coffees</MenuItem>
        <MenuItem onClick={handleClose}>Cold Coffees</MenuItem>
      </Menu>
      </>
  )
}

export default NavMenu
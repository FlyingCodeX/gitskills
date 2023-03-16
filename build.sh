000000000000b900 <rtl8125_init_one>:
    b900:	d503201f 	nop
    b904:	d503201f 	nop
{
    b908:	d503233f 	paciasp
    b90c:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
    b910:	910003fd 	mov	x29, sp
    b914:	a90363f7 	stp	x23, x24, [sp, #48]
        board_idx++;
    b918:	90000018 	adrp	x24, 0 <__ll_sc_atomic64_or>
    b91c:	91000318 	add	x24, x24, #0x0
{
    b920:	a90153f3 	stp	x19, x20, [sp, #16]
    b924:	a9025bf5 	stp	x21, x22, [sp, #32]
    b928:	aa0003f6 	mov	x22, x0
    b92c:	d5384100 	mrs	x0, sp_el0
    b930:	a9046bf9 	stp	x25, x26, [sp, #64]
    b934:	a90573fb 	stp	x27, x28, [sp, #80]
    b938:	f942a001 	ldr	x1, [x0, #1344]
    b93c:	f9003fe1 	str	x1, [sp, #120]
    b940:	d2800001 	mov	x1, #0x0                   	// #0
        board_idx++;
    b944:	b9401b00 	ldr	w0, [x24, #24]
    b948:	11000400 	add	w0, w0, #0x1
    b94c:	b9001b00 	str	w0, [x24, #24]
        if (netif_msg_drv(&debug))
    b950:	b9401f00 	ldr	w0, [x24, #28]
    b954:	36000100 	tbz	w0, #0, b974 <rtl8125_init_one+0x74>
                printk(KERN_INFO "%s 2.5Gigabit Ethernet driver %s loaded\n",
    b958:	90000002 	adrp	x2, 0 <__ll_sc_atomic64_or>
    b95c:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    b960:	90000000 	adrp	x0, 0 <__ll_sc_atomic64_or>
    b964:	91000042 	add	x2, x2, #0x0
    b968:	91000021 	add	x1, x1, #0x0
    b96c:	91000000 	add	x0, x0, #0x0
    b970:	94000000 	bl	0 <printk>
        dev = alloc_etherdev_mq(sizeof (*tp), R8125_MAX_QUEUES);
    b974:	52977e00 	mov	w0, #0xbbf0                	// #48112
    b978:	52800082 	mov	w2, #0x4                   	// #4
    b97c:	72a00020 	movk	w0, #0x1, lsl #16
    b980:	2a0203e1 	mov	w1, w2
    b984:	94000000 	bl	0 <alloc_etherdev_mqs>
    b988:	aa0003f4 	mov	x20, x0
        if (dev == NULL) {
    b98c:	b5000220 	cbnz	x0, b9d0 <rtl8125_init_one+0xd0>
                if (netif_msg_drv(&debug))
    b990:	b9401f00 	ldr	w0, [x24, #28]
        int rc = -ENOMEM, i, pm_cap;
    b994:	12800161 	mov	w1, #0xfffffff4            	// #-12
    b998:	b90067e1 	str	w1, [sp, #100]
                if (netif_msg_drv(&debug))
    b99c:	360000a0 	tbz	w0, #0, b9b0 <rtl8125_init_one+0xb0>
                        dev_err(&pdev->dev, "unable to alloc new ethernet\n");
    b9a0:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    b9a4:	9102c2c0 	add	x0, x22, #0xb0
    b9a8:	91000021 	add	x1, x1, #0x0
    b9ac:	94000000 	bl	0 <_dev_err>
}
    b9b0:	d5384100 	mrs	x0, sp_el0
    b9b4:	91150000 	add	x0, x0, #0x540
    b9b8:	f9403fe1 	ldr	x1, [sp, #120]
    b9bc:	f9400002 	ldr	x2, [x0]
    b9c0:	eb020021 	subs	x1, x1, x2
    b9c4:	d2800002 	mov	x2, #0x0                   	// #0
    b9c8:	54009840 	b.eq	ccd0 <rtl8125_init_one+0x13d0>  // b.none
    b9cc:	94000000 	bl	0 <__stack_chk_fail>
        tp->dev = dev;
    b9d0:	91240013 	add	x19, x0, #0x900
        SET_NETDEV_DEV(dev, &pdev->dev);
    b9d4:	9102c2d7 	add	x23, x22, #0xb0
    b9d8:	f9026e97 	str	x23, [x20, #1240]
        tp->msg_enable = netif_msg_init(debug.msg_enable, R8125_MSG_DEFAULT);
    b9dc:	b9401f00 	ldr	w0, [x24, #28]
        tp->dev = dev;
    b9e0:	a900d276 	stp	x22, x20, [x19, #8]
        if (debug_value < 0 || debug_value >= (sizeof(u32) * 8))
    b9e4:	71007c1f 	cmp	w0, #0x1f
    b9e8:	54000328 	b.hi	ba4c <rtl8125_init_one+0x14c>  // b.pmore
        if (debug_value == 0)   /* no output */
    b9ec:	34000080 	cbz	w0, b9fc <rtl8125_init_one+0xfc>
        return (1 << debug_value) - 1;
    b9f0:	52800021 	mov	w1, #0x1                   	// #1
    b9f4:	1ac02020 	lsl	w0, w1, w0
    b9f8:	51000400 	sub	w0, w0, #0x1
        tp->msg_enable = netif_msg_init(debug.msg_enable, R8125_MSG_DEFAULT);
    b9fc:	b937e260 	str	w0, [x19, #14304]
        if (!aspm)
    ba00:	b9401300 	ldr	w0, [x24, #16]
    ba04:	35000080 	cbnz	w0, ba14 <rtl8125_init_one+0x114>
                pci_disable_link_state(pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1 |
    ba08:	aa1603e0 	mov	x0, x22
    ba0c:	528000e1 	mov	w1, #0x7                   	// #7
    ba10:	94000000 	bl	0 <pci_disable_link_state>
        rc = pci_enable_device(pdev);
    ba14:	aa1603e0 	mov	x0, x22
    ba18:	94000000 	bl	0 <pci_enable_device>
    ba1c:	b90067e0 	str	w0, [sp, #100]
        if (rc < 0) {
    ba20:	2a0003e0 	mov	w0, w0
    ba24:	36f80180 	tbz	w0, #31, ba54 <rtl8125_init_one+0x154>
                if (netif_msg_probe(tp))
    ba28:	b977e260 	ldr	w0, [x19, #14304]
    ba2c:	360800a0 	tbz	w0, #1, ba40 <rtl8125_init_one+0x140>
                        dev_err(&pdev->dev, "enable failure\n");
    ba30:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    ba34:	aa1703e0 	mov	x0, x23
    ba38:	91000021 	add	x1, x1, #0x0
    ba3c:	94000000 	bl	0 <_dev_err>
        free_netdev(dev);
    ba40:	aa1403e0 	mov	x0, x20
    ba44:	94000000 	bl	0 <kfree>
    ba48:	17ffffda 	b	b9b0 <rtl8125_init_one+0xb0>
                return default_msg_enable_bits;
    ba4c:	52800660 	mov	w0, #0x33                  	// #51
    ba50:	17ffffeb 	b	b9fc <rtl8125_init_one+0xfc>
        if (pci_set_mwi(pdev) < 0) {
    ba54:	aa1603e0 	mov	x0, x22
    ba58:	94000000 	bl	0 <pci_set_mwi>
    ba5c:	36f800e0 	tbz	w0, #31, ba78 <rtl8125_init_one+0x178>
                if (netif_msg_drv(&debug))
    ba60:	b9401f00 	ldr	w0, [x24, #28]
    ba64:	360000a0 	tbz	w0, #0, ba78 <rtl8125_init_one+0x178>
                        dev_info(&pdev->dev, "Mem-Wr-Inval unavailable.\n");
    ba68:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    ba6c:	aa1703e0 	mov	x0, x23
    ba70:	91000021 	add	x1, x1, #0x0
    ba74:	94000000 	bl	0 <_dev_info>
        pm_cap = pci_find_capability(pdev, PCI_CAP_ID_PM);
    ba78:	aa1603e0 	mov	x0, x22
    ba7c:	52800021 	mov	w1, #0x1                   	// #1
    ba80:	94000000 	bl	0 <pci_find_capability>
        if (pm_cap) {
    ba84:	34000280 	cbz	w0, bad4 <rtl8125_init_one+0x1d4>
                pci_read_config_word(pdev, pm_cap + PCI_PM_CTRL, &pwr_command);
    ba88:	11001001 	add	w1, w0, #0x4
    ba8c:	9101c3e2 	add	x2, sp, #0x70
    ba90:	aa1603e0 	mov	x0, x22
    ba94:	94000000 	bl	0 <pci_read_config_word>
        if (!(pci_resource_flags(pdev, 2) & IORESOURCE_MEM)) {
    ba98:	f9424ec0 	ldr	x0, [x22, #1176]
    ba9c:	374802a0 	tbnz	w0, #9, baf0 <rtl8125_init_one+0x1f0>
                if (netif_msg_probe(tp))
    baa0:	b977e260 	ldr	w0, [x19, #14304]
                rc = -ENODEV;
    baa4:	12800241 	mov	w1, #0xffffffed            	// #-19
    baa8:	b90067e1 	str	w1, [sp, #100]
                if (netif_msg_probe(tp))
    baac:	360800a0 	tbz	w0, #1, bac0 <rtl8125_init_one+0x1c0>
                        dev_err(&pdev->dev, "region #1 not an MMIO resource, aborting\n");
    bab0:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bab4:	91000021 	add	x1, x1, #0x0
                        dev_err(&pdev->dev, "Invalid PCI region size(s), aborting\n");
    bab8:	aa1703e0 	mov	x0, x23
    babc:	94000000 	bl	0 <_dev_err>
        pci_clear_mwi(pdev);
    bac0:	aa1603e0 	mov	x0, x22
    bac4:	94000000 	bl	0 <pci_clear_mwi>
        pci_disable_device(pdev);
    bac8:	aa1603e0 	mov	x0, x22
    bacc:	94000000 	bl	0 <pci_disable_device>
    bad0:	17ffffdc 	b	ba40 <rtl8125_init_one+0x140>
                if (netif_msg_probe(tp)) {
    bad4:	b977e260 	ldr	w0, [x19, #14304]
    bad8:	360ffe00 	tbz	w0, #1, ba98 <rtl8125_init_one+0x198>
                        dev_err(&pdev->dev, "PowerManagement capability not found.\n");
    badc:	aa1703e0 	mov	x0, x23
    bae0:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bae4:	91000021 	add	x1, x1, #0x0
    bae8:	94000000 	bl	0 <_dev_err>
    baec:	17ffffeb 	b	ba98 <rtl8125_init_one+0x198>
        if (pci_resource_len(pdev, 2) < R8125_REGS_SIZE) {
    baf0:	f94242c1 	ldr	x1, [x22, #1152]
    baf4:	f94246c0 	ldr	x0, [x22, #1160]
    baf8:	aa000022 	orr	x2, x1, x0
    bafc:	b40000a2 	cbz	x2, bb10 <rtl8125_init_one+0x210>
    bb00:	91000400 	add	x0, x0, #0x1
    bb04:	cb010000 	sub	x0, x0, x1
    bb08:	f103fc1f 	cmp	x0, #0xff
    bb0c:	54000108 	b.hi	bb2c <rtl8125_init_one+0x22c>  // b.pmore
                if (netif_msg_probe(tp))
    bb10:	b977e260 	ldr	w0, [x19, #14304]
                rc = -ENODEV;
    bb14:	12800241 	mov	w1, #0xffffffed            	// #-19
    bb18:	b90067e1 	str	w1, [sp, #100]
                if (netif_msg_probe(tp))
    bb1c:	360ffd20 	tbz	w0, #1, bac0 <rtl8125_init_one+0x1c0>
                        dev_err(&pdev->dev, "Invalid PCI region size(s), aborting\n");
    bb20:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bb24:	91000021 	add	x1, x1, #0x0
    bb28:	17ffffe4 	b	bab8 <rtl8125_init_one+0x1b8>
        rc = pci_request_regions(pdev, MODULENAME);
    bb2c:	aa1603e0 	mov	x0, x22
    bb30:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bb34:	91000021 	add	x1, x1, #0x0
    bb38:	94000000 	bl	0 <pci_request_regions>
    bb3c:	b90067e0 	str	w0, [sp, #100]
        if (rc < 0) {
    bb40:	2a0003e0 	mov	w0, w0
    bb44:	36f800c0 	tbz	w0, #31, bb5c <rtl8125_init_one+0x25c>
                if (netif_msg_probe(tp))
    bb48:	b977e260 	ldr	w0, [x19, #14304]
    bb4c:	360ffba0 	tbz	w0, #1, bac0 <rtl8125_init_one+0x1c0>
                        dev_err(&pdev->dev, "could not request regions.\n");
    bb50:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bb54:	91000021 	add	x1, x1, #0x0
    bb58:	17ffffd8 	b	bab8 <rtl8125_init_one+0x1b8>
        if ((sizeof(dma_addr_t) > 4) &&
    bb5c:	b9402300 	ldr	w0, [x24, #32]
    bb60:	34000480 	cbz	w0, bbf0 <rtl8125_init_one+0x2f0>
            !dma_set_mask(&pdev->dev, DMA_BIT_MASK(64)) &&
    bb64:	aa1703e0 	mov	x0, x23
    bb68:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
    bb6c:	94000000 	bl	0 <dma_set_mask>
            use_dac &&
    bb70:	35000400 	cbnz	w0, bbf0 <rtl8125_init_one+0x2f0>
            !dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64))) {
    bb74:	aa1703e0 	mov	x0, x23
    bb78:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
    bb7c:	94000000 	bl	0 <dma_set_coherent_mask>
            !dma_set_mask(&pdev->dev, DMA_BIT_MASK(64)) &&
    bb80:	35000380 	cbnz	w0, bbf0 <rtl8125_init_one+0x2f0>
                dev->features |= NETIF_F_HIGHDMA;
    bb84:	f9406680 	ldr	x0, [x20, #200]
    bb88:	b27b0000 	orr	x0, x0, #0x20
    bb8c:	f9006680 	str	x0, [x20, #200]
        ioaddr = ioremap(pci_resource_start(pdev, 2), pci_resource_len(pdev, 2));
    bb90:	f94242c0 	ldr	x0, [x22, #1152]
    bb94:	f94246c2 	ldr	x2, [x22, #1160]
    bb98:	aa020001 	orr	x1, x0, x2
    bb9c:	b4000061 	cbz	x1, bba8 <rtl8125_init_one+0x2a8>
    bba0:	91000442 	add	x2, x2, #0x1
    bba4:	cb000041 	sub	x1, x2, x0
    bba8:	9000001a 	adrp	x26, 0 <arm64_use_ng_mappings>
    bbac:	d281e2e3 	mov	x3, #0xf17                 	// #3863
    bbb0:	f2e00d03 	movk	x3, #0x68, lsl #48
    bbb4:	39400342 	ldrb	w2, [x26]
    bbb8:	7100005f 	cmp	w2, #0x0
    bbbc:	d280e2e2 	mov	x2, #0x717                 	// #1815
    bbc0:	f2e00d02 	movk	x2, #0x68, lsl #48
    bbc4:	9a821062 	csel	x2, x3, x2, ne  // ne = any
    bbc8:	94000000 	bl	0 <__ioremap>
    bbcc:	aa0003f9 	mov	x25, x0
        if (ioaddr == NULL) {
    bbd0:	b50002e0 	cbnz	x0, bc2c <rtl8125_init_one+0x32c>
                if (netif_msg_probe(tp))
    bbd4:	b977e260 	ldr	w0, [x19, #14304]
                rc = -EIO;
    bbd8:	12800081 	mov	w1, #0xfffffffb            	// #-5
    bbdc:	b90067e1 	str	w1, [sp, #100]
                if (netif_msg_probe(tp))
    bbe0:	36080200 	tbz	w0, #1, bc20 <rtl8125_init_one+0x320>
                        dev_err(&pdev->dev, "cannot remap MMIO, aborting\n");
    bbe4:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bbe8:	91000021 	add	x1, x1, #0x0
    bbec:	1400000b 	b	bc18 <rtl8125_init_one+0x318>
                rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
    bbf0:	aa1703e0 	mov	x0, x23
    bbf4:	b2407fe1 	mov	x1, #0xffffffff            	// #4294967295
    bbf8:	94000000 	bl	0 <dma_set_mask>
    bbfc:	b90067e0 	str	w0, [sp, #100]
                if (rc < 0) {
    bc00:	2a0003e0 	mov	w0, w0
    bc04:	36fffc60 	tbz	w0, #31, bb90 <rtl8125_init_one+0x290>
                        if (netif_msg_probe(tp))
    bc08:	b977e260 	ldr	w0, [x19, #14304]
    bc0c:	360800a0 	tbz	w0, #1, bc20 <rtl8125_init_one+0x320>
                                dev_err(&pdev->dev, "DMA configuration failed.\n");
    bc10:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bc14:	91000021 	add	x1, x1, #0x0
                        dev_err(&pdev->dev, "cannot remap MMIO, aborting\n");
    bc18:	aa1703e0 	mov	x0, x23
    bc1c:	94000000 	bl	0 <_dev_err>
        pci_release_regions(pdev);
    bc20:	aa1603e0 	mov	x0, x22
    bc24:	94000000 	bl	0 <pci_release_regions>
    bc28:	17ffffa6 	b	bac0 <rtl8125_init_one+0x1c0>
        tp->mmio_addr = ioaddr;
    bc2c:	f9048299 	str	x25, [x20, #2304]
        val32 = RTL_R32(tp, TxConfig);
    bc30:	91010000 	add	x0, x0, #0x40
        struct pci_dev *pdev = tp->pci_dev;
    bc34:	f940067b 	ldr	x27, [x19, #8]
	asm volatile(ALTERNATIVE("ldr %w0, [%1]",
    bc38:	b9400000 	ldr	w0, [x0]
        val32 = RTL_R32(tp, TxConfig);
    bc3c:	d50331bf 	dmb	oshld
    bc40:	2a0003e1 	mov	w1, w0
    bc44:	ca010021 	eor	x1, x1, x1
    bc48:	b5000001 	cbnz	x1, bc48 <rtl8125_init_one+0x348>
        reg = val32 & 0x7c800000;
    bc4c:	52af9001 	mov	w1, #0x7c800000            	// #2088763392
    bc50:	0a010001 	and	w1, w0, w1
        switch (reg) {
    bc54:	52ac1002 	mov	w2, #0x60800000            	// #1619001344
        ICVerID = val32 & 0x00700000;
    bc58:	120c0800 	and	w0, w0, #0x700000
        switch (reg) {
    bc5c:	6b02003f 	cmp	w1, w2
    bc60:	540001c0 	b.eq	bc98 <rtl8125_init_one+0x398>  // b.none
    bc64:	52ac8002 	mov	w2, #0x64000000            	// #1677721600
    bc68:	6b02003f 	cmp	w1, w2
    bc6c:	54000b00 	b.eq	bdcc <rtl8125_init_one+0x4cc>  // b.none
                printk("unknown chip version (%x)\n",reg);
    bc70:	90000000 	adrp	x0, 0 <__ll_sc_atomic64_or>
    bc74:	91000000 	add	x0, x0, #0x0
    bc78:	94000000 	bl	0 <printk>
                tp->mcfg = CFG_METHOD_DEFAULT;
    bc7c:	52800100 	mov	w0, #0x8                   	// #8
    bc80:	b937fe60 	str	w0, [x19, #14332]
                tp->HwIcVerUnknown = TRUE;
    bc84:	91406e60 	add	x0, x19, #0x1b, lsl #12
    bc88:	52800021 	mov	w1, #0x1                   	// #1
                tp->efuse_ver = EFUSE_NOT_SUPPORT;
    bc8c:	3927001f 	strb	wzr, [x0, #2496]
                tp->HwIcVerUnknown = TRUE;
    bc90:	392c8001 	strb	w1, [x0, #2848]
                break;
    bc94:	14000007 	b	bcb0 <rtl8125_init_one+0x3b0>
                if (ICVerID == 0x00000000) {
    bc98:	350008a0 	cbnz	w0, bdac <rtl8125_init_one+0x4ac>
                        tp->mcfg = CFG_METHOD_2;
    bc9c:	52800040 	mov	w0, #0x2                   	// #2
                        tp->mcfg = CFG_METHOD_4;
    bca0:	b937fe60 	str	w0, [x19, #14332]
                tp->efuse_ver = EFUSE_SUPPORT_V4;
    bca4:	91406e60 	add	x0, x19, #0x1b, lsl #12
    bca8:	52800081 	mov	w1, #0x4                   	// #4
    bcac:	39270001 	strb	w1, [x0, #2496]
        if (pdev->subsystem_vendor == 0x8162) {
    bcb0:	79408361 	ldrh	w1, [x27, #64]
    bcb4:	52902c40 	mov	w0, #0x8162                	// #33122
    bcb8:	6b00003f 	cmp	w1, w0
    bcbc:	540000c1 	b.ne	bcd4 <rtl8125_init_one+0x3d4>  // b.any
    bcc0:	b977fe60 	ldr	w0, [x19, #14332]
                if (tp->mcfg == CFG_METHOD_3)
    bcc4:	71000c1f 	cmp	w0, #0x3
    bcc8:	540008e1 	b.ne	bde4 <rtl8125_init_one+0x4e4>  // b.any
                        tp->mcfg = CFG_METHOD_6;
    bccc:	528000c0 	mov	w0, #0x6                   	// #6
                        tp->mcfg = CFG_METHOD_7;
    bcd0:	b937fe60 	str	w0, [x19, #14332]
                if (tp->mcfg == rtl_chip_info[i].mcfg)
    bcd4:	b977fe62 	ldr	w2, [x19, #14332]
    bcd8:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bcdc:	91000021 	add	x1, x1, #0x0
        for (i = ARRAY_SIZE(rtl_chip_info) - 1; i >= 0; i--) {
    bce0:	528000c0 	mov	w0, #0x6                   	// #6
                if (tp->mcfg == rtl_chip_info[i].mcfg)
    bce4:	39426023 	ldrb	w3, [x1, #152]
    bce8:	6b03005f 	cmp	w2, w3
    bcec:	54000200 	b.eq	bd2c <rtl8125_init_one+0x42c>  // b.none
        for (i = ARRAY_SIZE(rtl_chip_info) - 1; i >= 0; i--) {
    bcf0:	51000400 	sub	w0, w0, #0x1
    bcf4:	d1006021 	sub	x1, x1, #0x18
    bcf8:	3100041f 	cmn	w0, #0x1
    bcfc:	54ffff41 	b.ne	bce4 <rtl8125_init_one+0x3e4>  // b.any
                if (netif_msg_probe(tp))
    bd00:	b977e260 	ldr	w0, [x19, #14304]
    bd04:	36080120 	tbz	w0, #1, bd28 <rtl8125_init_one+0x428>
                        dev_printk(KERN_DEBUG, &pdev->dev, "unknown chip version, assuming %s\n", rtl_chip_info[0].name);
    bd08:	90000003 	adrp	x3, 0 <__ll_sc_atomic64_or>
    bd0c:	90000002 	adrp	x2, 0 <__ll_sc_atomic64_or>
    bd10:	90000000 	adrp	x0, 0 <__ll_sc_atomic64_or>
    bd14:	91000063 	add	x3, x3, #0x0
    bd18:	91000042 	add	x2, x2, #0x0
    bd1c:	aa1703e1 	mov	x1, x23
    bd20:	91000000 	add	x0, x0, #0x0
    bd24:	94000000 	bl	0 <dev_printk>
                i++;
    bd28:	52800000 	mov	w0, #0x0                   	// #0
        tp->chipset = i;
    bd2c:	b937fa60 	str	w0, [x19, #14328]
        if (rc)
    bd30:	b94067e0 	ldr	w0, [sp, #100]
    bd34:	35ffe3e0 	cbnz	w0, b9b0 <rtl8125_init_one+0xb0>
        tp->set_speed = rtl8125_set_speed_xmii;
    bd38:	91406260 	add	x0, x19, #0x18, lsl #12
    bd3c:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bd40:	91000021 	add	x1, x1, #0x0
        tp->max_irq_nvecs = 1;
    bd44:	9140129b 	add	x27, x20, #0x4, lsl #12
        tp->set_speed = rtl8125_set_speed_xmii;
    bd48:	f91cec01 	str	x1, [x0, #14808]
        tp->get_settings = rtl8125_gset_xmii;
    bd4c:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bd50:	91000021 	add	x1, x1, #0x0
    bd54:	f91cf001 	str	x1, [x0, #14816]
        tp->phy_reset_enable = rtl8125_xmii_reset_enable;
    bd58:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bd5c:	91000021 	add	x1, x1, #0x0
    bd60:	f91cf401 	str	x1, [x0, #14824]
        tp->phy_reset_pending = rtl8125_xmii_reset_pending;
    bd64:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bd68:	91000021 	add	x1, x1, #0x0
    bd6c:	f91cf801 	str	x1, [x0, #14832]
        tp->link_ok = rtl8125_xmii_link_ok;
    bd70:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bd74:	91000021 	add	x1, x1, #0x0
    bd78:	f91cfc01 	str	x1, [x0, #14840]
        tp->max_irq_nvecs = 1;
    bd7c:	b20003e0 	mov	x0, #0x100000001           	// #4294967297
        struct pci_dev *pdev = tp->pci_dev;
    bd80:	f940067c 	ldr	x28, [x19, #8]
        tp->max_irq_nvecs = 1;
    bd84:	f801c360 	stur	x0, [x27, #28]
        switch (tp->mcfg) {
    bd88:	b977fe60 	ldr	w0, [x19, #14332]
    bd8c:	7100141f 	cmp	w0, #0x5
    bd90:	54000328 	b.hi	bdf4 <rtl8125_init_one+0x4f4>  // b.pmore
    bd94:	71000c1f 	cmp	w0, #0x3
    bd98:	54000329 	b.ls	bdfc <rtl8125_init_one+0x4fc>  // b.plast
                tp->max_irq_nvecs = R8125_MAX_MSIX_VEC_8125B;
    bd9c:	d2800400 	mov	x0, #0x20                  	// #32
    bda0:	f2c00220 	movk	x0, #0x11, lsl #32
    bda4:	f801c360 	stur	x0, [x27, #28]
                break;
    bda8:	14000015 	b	bdfc <rtl8125_init_one+0x4fc>
                } else if (ICVerID == 0x100000) {
    bdac:	7144001f 	cmp	w0, #0x100, lsl #12
    bdb0:	52800060 	mov	w0, #0x3                   	// #3
                        tp->mcfg = CFG_METHOD_5;
    bdb4:	b937fe60 	str	w0, [x19, #14332]
                } else if (ICVerID == 0x100000) {
    bdb8:	54fff760 	b.eq	bca4 <rtl8125_init_one+0x3a4>  // b.none
                        tp->HwIcVerUnknown = TRUE;
    bdbc:	91406e60 	add	x0, x19, #0x1b, lsl #12
    bdc0:	52800021 	mov	w1, #0x1                   	// #1
    bdc4:	392c8001 	strb	w1, [x0, #2848]
    bdc8:	17ffffb7 	b	bca4 <rtl8125_init_one+0x3a4>
                if (ICVerID == 0x00000000) {
    bdcc:	35000060 	cbnz	w0, bdd8 <rtl8125_init_one+0x4d8>
                        tp->mcfg = CFG_METHOD_4;
    bdd0:	52800080 	mov	w0, #0x4                   	// #4
    bdd4:	17ffffb3 	b	bca0 <rtl8125_init_one+0x3a0>
                } else if (ICVerID == 0x100000) {
    bdd8:	7144001f 	cmp	w0, #0x100, lsl #12
    bddc:	528000a0 	mov	w0, #0x5                   	// #5
    bde0:	17fffff5 	b	bdb4 <rtl8125_init_one+0x4b4>
                else if (tp->mcfg == CFG_METHOD_5)
    bde4:	7100141f 	cmp	w0, #0x5
    bde8:	54fff761 	b.ne	bcd4 <rtl8125_init_one+0x3d4>  // b.any
                        tp->mcfg = CFG_METHOD_7;
    bdec:	528000e0 	mov	w0, #0x7                   	// #7
    bdf0:	17ffffb8 	b	bcd0 <rtl8125_init_one+0x3d0>
        switch (tp->mcfg) {
    bdf4:	71001c1f 	cmp	w0, #0x7
    bdf8:	54fffd20 	b.eq	bd9c <rtl8125_init_one+0x49c>  // b.none
        if ((nvecs = rtl8125_enable_msix(tp)) > 0)
    bdfc:	aa1303e0 	mov	x0, x19
    be00:	94000000 	bl	b838 <rtl8125_enable_msix>
    be04:	2a0003f5 	mov	w21, w0
    be08:	7100001f 	cmp	w0, #0x0
    be0c:	54000b4c 	b.gt	bf74 <rtl8125_init_one+0x674>
        else if (!pci_enable_msi(pdev))
    be10:	aa1c03e0 	mov	x0, x28
    be14:	94000000 	bl	0 <pci_enable_msi>
                msi |= RTL_FEATURE_MSI;
    be18:	52800041 	mov	w1, #0x2                   	// #2
        else if (!pci_enable_msi(pdev))
    be1c:	340000c0 	cbz	w0, be34 <rtl8125_init_one+0x534>
                dev_info(&pdev->dev, "no MSI/MSI-X. Back to INTx.\n");
    be20:	9102c380 	add	x0, x28, #0xb0
    be24:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    be28:	91000021 	add	x1, x1, #0x0
    be2c:	94000000 	bl	0 <_dev_info>
        unsigned msi = 0;
    be30:	52800001 	mov	w1, #0x0                   	// #0
        if (!(msi & RTL_FEATURE_MSIX) || nvecs < 1)
    be34:	52800020 	mov	w0, #0x1                   	// #1
    be38:	36100061 	tbz	w1, #2, be44 <rtl8125_init_one+0x544>
    be3c:	710002bf 	cmp	w21, #0x0
    be40:	1a80c2a0 	csel	w0, w21, w0, gt
        tp->features |= msi;
    be44:	91406262 	add	x2, x19, #0x18, lsl #12
        tp->irq_nvecs = nvecs;
    be48:	b9371a60 	str	w0, [x19, #14104]
        tp->features |= msi;
    be4c:	b97b1040 	ldr	w0, [x2, #15120]
    be50:	2a010001 	orr	w1, w0, w1
    be54:	b93b1041 	str	w1, [x2, #15120]
        switch (tp->mcfg) {
    be58:	b977fe60 	ldr	w0, [x19, #14332]
        struct pci_dev *pdev = tp->pci_dev;
    be5c:	f940067c 	ldr	x28, [x19, #8]
        switch (tp->mcfg) {
    be60:	51000800 	sub	w0, w0, #0x2
    be64:	7100141f 	cmp	w0, #0x5
    be68:	54000128 	b.hi	be8c <rtl8125_init_one+0x58c>  // b.pmore
                tp->bios_setting = RTL_R32(tp, TimeInt2);
    be6c:	f9448280 	ldr	x0, [x20, #2304]
    be70:	91023000 	add	x0, x0, #0x8c
    be74:	b9400000 	ldr	w0, [x0]
    be78:	d50331bf 	dmb	oshld
    be7c:	2a0003e1 	mov	w1, w0
    be80:	ca010021 	eor	x1, x1, x1
    be84:	b5000001 	cbnz	x1, be84 <rtl8125_init_one+0x584>
    be88:	b939d440 	str	w0, [x2, #14804]
        switch (tp->mcfg) {
    be8c:	b977fe60 	ldr	w0, [x19, #14332]
    be90:	51000800 	sub	w0, w0, #0x2
    be94:	7100041f 	cmp	w0, #0x1
    be98:	54000728 	b.hi	bf7c <rtl8125_init_one+0x67c>  // b.pmore
                tp->HwPkgDet = rtl8125_mac_ocp_read(tp, 0xDC00);
    be9c:	12847fe1 	mov	w1, #0xffffdc00            	// #-9216
    bea0:	aa1303e0 	mov	x0, x19
    bea4:	94000000 	bl	7ea4 <rtl8125_mac_ocp_read>
                tp->HwPkgDet = (tp->HwPkgDet >> 3) & 0x07;
    bea8:	d3431400 	ubfx	x0, x0, #3, #3
    beac:	91406e61 	add	x1, x19, #0x1b, lsl #12
    beb0:	392e3c20 	strb	w0, [x1, #2959]
        if (HW_DASH_SUPPORT_TYPE_3(tp) && tp->HwPkgDet == 0x06)
    beb4:	91406260 	add	x0, x19, #0x18, lsl #12
    beb8:	52800061 	mov	w1, #0x3                   	// #3
    bebc:	72a0c001 	movk	w1, #0x600, lsl #16
    bec0:	b97b8c00 	ldr	w0, [x0, #15244]
    bec4:	12083c00 	and	w0, w0, #0xff0000ff
    bec8:	6b01001f 	cmp	w0, w1
    becc:	54000041 	b.ne	bed4 <rtl8125_init_one+0x5d4>  // b.any
                eee_enable = 0;
    bed0:	b900271f 	str	wzr, [x24, #36]
        switch (tp->mcfg) {
    bed4:	b977fe60 	ldr	w0, [x19, #14332]
    bed8:	51000800 	sub	w0, w0, #0x2
    bedc:	7100141f 	cmp	w0, #0x5
    bee0:	540000e8 	b.hi	befc <rtl8125_init_one+0x5fc>  // b.pmore
                tp->HwSuppNowIsOobVer = 1;
    bee4:	91406e60 	add	x0, x19, #0x1b, lsl #12
    bee8:	52800021 	mov	w1, #0x1                   	// #1
    beec:	392d2001 	strb	w1, [x0, #2888]
                tp->HwPcieSNOffset = 0x16C;
    bef0:	91406260 	add	x0, x19, #0x18, lsl #12
    bef4:	52802d81 	mov	w1, #0x16c                 	// #364
    bef8:	b93b6401 	str	w1, [x0, #15204]
        if (HW_DASH_SUPPORT_DASH(tp) && rtl8125_check_dash(tp))
    befc:	91406e63 	add	x3, x19, #0x1b, lsl #12
    bf00:	91240295 	add	x21, x20, #0x900
    bf04:	396e3060 	ldrb	w0, [x3, #2956]
    bf08:	51000800 	sub	w0, w0, #0x2
    bf0c:	12001c00 	and	w0, w0, #0xff
    bf10:	7100041f 	cmp	w0, #0x1
    bf14:	540003e9 	b.ls	bf90 <rtl8125_init_one+0x690>  // b.plast
    bf18:	392e347f 	strb	wzr, [x3, #2957]
        if (aspm) {
    bf1c:	b9401300 	ldr	w0, [x24, #16]
    bf20:	34000b00 	cbz	w0, c080 <rtl8125_init_one+0x780>
                switch (tp->mcfg) {
    bf24:	b977fe60 	ldr	w0, [x19, #14332]
    bf28:	51000800 	sub	w0, w0, #0x2
    bf2c:	7100141f 	cmp	w0, #0x5
    bf30:	540000e8 	b.hi	bf4c <rtl8125_init_one+0x64c>  // b.pmore
                        tp->org_pci_offset_99 = rtl8125_csi_fun0_read_byte(tp, 0x99);
    bf34:	52801321 	mov	w1, #0x99                  	// #153
    bf38:	aa1303e0 	mov	x0, x19
    bf3c:	97ffda36 	bl	2814 <rtl8125_csi_fun0_read_byte>
                        tp->org_pci_offset_99 &= ~(BIT_5|BIT_6);
    bf40:	12197400 	and	w0, w0, #0xffffff9f
    bf44:	91406e61 	add	x1, x19, #0x1b, lsl #12
    bf48:	392c5020 	strb	w0, [x1, #2836]
                switch (tp->mcfg) {
    bf4c:	b977fe60 	ldr	w0, [x19, #14332]
    bf50:	51000800 	sub	w0, w0, #0x2
    bf54:	7100141f 	cmp	w0, #0x5
    bf58:	54000948 	b.hi	c080 <rtl8125_init_one+0x780>  // b.pmore
    bf5c:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bf60:	91000021 	add	x1, x1, #0x0
    bf64:	38604820 	ldrb	w0, [x1, w0, uxtw]
    bf68:	10000061 	adr	x1, bf74 <rtl8125_init_one+0x674>
    bf6c:	8b208820 	add	x0, x1, w0, sxtb #2
    bf70:	d61f0000 	br	x0
                msi |= RTL_FEATURE_MSIX;
    bf74:	52800081 	mov	w1, #0x4                   	// #4
    bf78:	17ffffaf 	b	be34 <rtl8125_init_one+0x534>
                tp->HwSuppDashVer = 0;
    bf7c:	91406e61 	add	x1, x19, #0x1b, lsl #12
        switch (tp->mcfg) {
    bf80:	7100141f 	cmp	w0, #0x5
                tp->HwSuppDashVer = 0;
    bf84:	392e303f 	strb	wzr, [x1, #2956]
        switch (tp->mcfg) {
    bf88:	54fff968 	b.hi	beb4 <rtl8125_init_one+0x5b4>  // b.pmore
    bf8c:	17ffffc4 	b	be9c <rtl8125_init_one+0x59c>
                if (rtl8125_ocp_read(tp, 0x128, 1) & BIT_0)
    bf90:	aa1303e0 	mov	x0, x19
    bf94:	52800022 	mov	w2, #0x1                   	// #1
    bf98:	52802501 	mov	w1, #0x128                 	// #296
    bf9c:	f90037e3 	str	x3, [sp, #104]
    bfa0:	94000000 	bl	a264 <rtl8125_ocp_read>
    bfa4:	12000000 	and	w0, w0, #0x1
        if (HW_DASH_SUPPORT_DASH(tp) && rtl8125_check_dash(tp))
    bfa8:	f94037e3 	ldr	x3, [sp, #104]
    bfac:	392e3460 	strb	w0, [x3, #2957]
        if (tp->DASH) {
    bfb0:	340004e0 	cbz	w0, c04c <rtl8125_init_one+0x74c>
                if (HW_DASH_SUPPORT_TYPE_3(tp)) {
    bfb4:	396e3060 	ldrb	w0, [x3, #2956]
    bfb8:	71000c1f 	cmp	w0, #0x3
    bfbc:	54000461 	b.ne	c048 <rtl8125_init_one+0x748>  // b.any
                        CmacMemPhysAddress = rtl8125_csi_other_fun_read(tp, 0, 0x18);
    bfc0:	aa1303e0 	mov	x0, x19
    bfc4:	52800301 	mov	w1, #0x18                  	// #24
    bfc8:	97ffd9c7 	bl	26e4 <rtl8125_csi_other_fun_read.constprop.0>
                        if (!(CmacMemPhysAddress & BIT_0)) {
    bfcc:	36000140 	tbz	w0, #0, bff4 <rtl8125_init_one+0x6f4>
                                if (netif_msg_probe(tp))
    bfd0:	b977e260 	ldr	w0, [x19, #14304]
    bfd4:	360800a0 	tbz	w0, #1, bfe8 <rtl8125_init_one+0x6e8>
                                        dev_err(&pdev->dev, "cannot remap CMAC MMIO, aborting\n");
    bfd8:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    bfdc:	9102c380 	add	x0, x28, #0xb0
    bfe0:	91000021 	add	x1, x1, #0x0
    bfe4:	94000000 	bl	0 <_dev_err>
                                tp->DASH = 0;
    bfe8:	91406e60 	add	x0, x19, #0x1b, lsl #12
    bfec:	392e341f 	strb	wzr, [x0, #2957]
    bff0:	14000016 	b	c048 <rtl8125_init_one+0x748>
                        CmacMemPhysAddress = rtl8125_csi_other_fun_read(tp, 0, 0x18);
    bff4:	2a0003e3 	mov	w3, w0
                                if (CmacMemPhysAddress & BIT_2)
    bff8:	361000e0 	tbz	w0, #2, c014 <rtl8125_init_one+0x714>
                                        CmacMemPhysAddress |=  (u64)rtl8125_csi_other_fun_read(tp, 0, 0x1C) << 32;
    bffc:	aa1303e0 	mov	x0, x19
    c000:	52800381 	mov	w1, #0x1c                  	// #28
    c004:	f90037e3 	str	x3, [sp, #104]
    c008:	97ffd9b7 	bl	26e4 <rtl8125_csi_other_fun_read.constprop.0>
    c00c:	f94037e3 	ldr	x3, [sp, #104]
    c010:	aa008063 	orr	x3, x3, x0, lsl #32
                                cmac_ioaddr = ioremap(CmacMemPhysAddress, R8125_REGS_SIZE);
    c014:	39400340 	ldrb	w0, [x26]
    c018:	d281e2e2 	mov	x2, #0xf17                 	// #3863
    c01c:	f2e00d02 	movk	x2, #0x68, lsl #48
    c020:	d2802001 	mov	x1, #0x100                 	// #256
    c024:	7100001f 	cmp	w0, #0x0
    c028:	d280e2e0 	mov	x0, #0x717                 	// #1815
    c02c:	f2e00d00 	movk	x0, #0x68, lsl #48
    c030:	9a801042 	csel	x2, x2, x0, ne  // ne = any
    c034:	927c6c60 	and	x0, x3, #0xfffffff0
    c038:	94000000 	bl	0 <__ioremap>
                        if (cmac_ioaddr == NULL) {
    c03c:	b4fffca0 	cbz	x0, bfd0 <rtl8125_init_one+0x6d0>
                                tp->mapped_cmac_ioaddr = cmac_ioaddr;
    c040:	914062a1 	add	x1, x21, #0x18, lsl #12
    c044:	f91dc820 	str	x0, [x1, #15248]
                eee_enable = 0;
    c048:	b900271f 	str	wzr, [x24, #36]
        if	(HW_DASH_SUPPORT_TYPE_3(tp))
    c04c:	91406e60 	add	x0, x19, #0x1b, lsl #12
    c050:	396e3000 	ldrb	w0, [x0, #2956]
    c054:	71000c1f 	cmp	w0, #0x3
    c058:	54fff621 	b.ne	bf1c <rtl8125_init_one+0x61c>  // b.any
                tp->cmac_ioaddr = tp->mapped_cmac_ioaddr;
    c05c:	91406260 	add	x0, x19, #0x18, lsl #12
    c060:	f95dc801 	ldr	x1, [x0, #15248]
    c064:	f91dcc01 	str	x1, [x0, #15256]
    c068:	17ffffad 	b	bf1c <rtl8125_init_one+0x61c>
                        tp->org_pci_offset_180 = rtl8125_csi_fun0_read_byte(tp, 0x264);
    c06c:	52804c81 	mov	w1, #0x264                 	// #612
                        tp->org_pci_offset_180 = rtl8125_csi_fun0_read_byte(tp, 0x214);
    c070:	aa1303e0 	mov	x0, x19
    c074:	97ffd9e8 	bl	2814 <rtl8125_csi_fun0_read_byte>
    c078:	91406e61 	add	x1, x19, #0x1b, lsl #12
    c07c:	392c5420 	strb	w0, [x1, #2837]
        pci_read_config_byte(pdev, 0x80, &tp->org_pci_offset_80);
    c080:	91406e62 	add	x2, x19, #0x1b, lsl #12
    c084:	52801001 	mov	w1, #0x80                  	// #128
    c088:	912c5c42 	add	x2, x2, #0xb17
    c08c:	aa1c03e0 	mov	x0, x28
    c090:	94000000 	bl	0 <pci_read_config_byte>
        pci_read_config_byte(pdev, 0x81, &tp->org_pci_offset_81);
    c094:	91406e62 	add	x2, x19, #0x1b, lsl #12
    c098:	52801021 	mov	w1, #0x81                  	// #129
    c09c:	912c6042 	add	x2, x2, #0xb18
    c0a0:	aa1c03e0 	mov	x0, x28
    c0a4:	94000000 	bl	0 <pci_read_config_byte>
                tp->use_timer_interrrupt = TRUE;
    c0a8:	91406e61 	add	x1, x19, #0x1b, lsl #12
        switch (tp->mcfg) {
    c0ac:	b977fe60 	ldr	w0, [x19, #14332]
                tp->use_timer_interrrupt = TRUE;
    c0b0:	52800022 	mov	w2, #0x1                   	// #1
    c0b4:	392c6422 	strb	w2, [x1, #2841]
        if (timer_count == 0 || tp->mcfg == CFG_METHOD_DEFAULT)
    c0b8:	b9402b01 	ldr	w1, [x24, #40]
    c0bc:	34000061 	cbz	w1, c0c8 <rtl8125_init_one+0x7c8>
    c0c0:	7100201f 	cmp	w0, #0x8
    c0c4:	54000061 	b.ne	c0d0 <rtl8125_init_one+0x7d0>  // b.any
                tp->use_timer_interrrupt = FALSE;
    c0c8:	91406e61 	add	x1, x19, #0x1b, lsl #12
    c0cc:	392c643f 	strb	wzr, [x1, #2841]
        switch (tp->mcfg) {
    c0d0:	51000801 	sub	w1, w0, #0x2
    c0d4:	7100143f 	cmp	w1, #0x5
    c0d8:	54000468 	b.hi	c164 <rtl8125_init_one+0x864>  // b.pmore
                tp->HwSuppMagicPktVer = WAKEUP_MAGIC_PACKET_V3;
    c0dc:	91407282 	add	x2, x20, #0x1c, lsl #12
    c0e0:	52806063 	mov	w3, #0x303                 	// #771
    c0e4:	7908b043 	strh	w3, [x2, #1112]
        switch (tp->mcfg) {
    c0e8:	51000c02 	sub	w2, w0, #0x3
    c0ec:	7100105f 	cmp	w2, #0x4
    c0f0:	54000088 	b.hi	c100 <rtl8125_init_one+0x800>  // b.pmore
                tp->HwSuppD0SpeedUpVer = 1;
    c0f4:	91406e62 	add	x2, x19, #0x1b, lsl #12
    c0f8:	52800023 	mov	w3, #0x1                   	// #1
    c0fc:	392dc043 	strb	w3, [x2, #2928]
        switch (tp->mcfg) {
    c100:	7100143f 	cmp	w1, #0x5
    c104:	540000a8 	b.hi	c118 <rtl8125_init_one+0x818>  // b.pmore
                tp->HwSuppCheckPhyDisableModeVer = 3;
    c108:	91406ea2 	add	x2, x21, #0x1b, lsl #12
    c10c:	52800063 	mov	w3, #0x3                   	// #3
    c110:	392d6843 	strb	w3, [x2, #2906]
                tp->HwSuppTxNoCloseVer = 3;
    c114:	392da043 	strb	w3, [x2, #2920]
        if (tp->HwSuppTxNoCloseVer > 0 && tx_no_close_enable == 1)
    c118:	91406ea2 	add	x2, x21, #0x1b, lsl #12
    c11c:	90000018 	adrp	x24, 0 <__ll_sc_atomic64_or>
    c120:	9100031c 	add	x28, x24, #0x0
    c124:	396da043 	ldrb	w3, [x2, #2920]
    c128:	340000a3 	cbz	w3, c13c <rtl8125_init_one+0x83c>
    c12c:	b9402f83 	ldr	w3, [x28, #44]
    c130:	7100047f 	cmp	w3, #0x1
    c134:	54000041 	b.ne	c13c <rtl8125_init_one+0x83c>  // b.any
                tp->EnableTxNoClose = TRUE;
    c138:	392da443 	strb	w3, [x2, #2921]
        switch (tp->mcfg) {
    c13c:	71000c1f 	cmp	w0, #0x3
    c140:	54000188 	b.hi	c170 <rtl8125_init_one+0x870>  // b.pmore
    c144:	7100041f 	cmp	w0, #0x1
    c148:	54000189 	b.ls	c178 <rtl8125_init_one+0x878>  // b.plast
                tp->RequireLSOPatch = TRUE;
    c14c:	91406ea2 	add	x2, x21, #0x1b, lsl #12
    c150:	52800023 	mov	w3, #0x1                   	// #1
    c154:	392d2c43 	strb	w3, [x2, #2891]
                break;
    c158:	14000008 	b	c178 <rtl8125_init_one+0x878>
                        tp->org_pci_offset_180 = rtl8125_csi_fun0_read_byte(tp, 0x214);
    c15c:	52804281 	mov	w1, #0x214                 	// #532
    c160:	17ffffc4 	b	c070 <rtl8125_init_one+0x770>
                tp->HwSuppMagicPktVer = WAKEUP_MAGIC_PACKET_NOT_SUPPORT;
    c164:	91406e62 	add	x2, x19, #0x1b, lsl #12
    c168:	392d605f 	strb	wzr, [x2, #2904]
        switch (tp->mcfg) {
    c16c:	17ffffdf 	b	c0e8 <rtl8125_init_one+0x7e8>
        switch (tp->mcfg) {
    c170:	7100181f 	cmp	w0, #0x6
    c174:	54fffec0 	b.eq	c14c <rtl8125_init_one+0x84c>  // b.none
        switch (tp->mcfg) {
    c178:	7100143f 	cmp	w1, #0x5
    c17c:	54000148 	b.hi	c1a4 <rtl8125_init_one+0x8a4>  // b.pmore
    c180:	90000002 	adrp	x2, 0 <__ll_sc_atomic64_or>
    c184:	91000042 	add	x2, x2, #0x0
    c188:	38614841 	ldrb	w1, [x2, w1, uxtw]
    c18c:	10000062 	adr	x2, c198 <rtl8125_init_one+0x898>
    c190:	8b218841 	add	x1, x2, w1, sxtb #2
    c194:	d61f0020 	br	x1
                tp->sw_ram_code_ver = NIC_RAMCODE_VERSION_CFG_METHOD_2;
    c198:	91406aa1 	add	x1, x21, #0x1a, lsl #12
    c19c:	52816222 	mov	w2, #0xb11                 	// #2833
                tp->sw_ram_code_ver = NIC_RAMCODE_VERSION_CFG_METHOD_5;
    c1a0:	79364822 	strh	w2, [x1, #6948]
        if (tp->HwIcVerUnknown) {
    c1a4:	91406ea1 	add	x1, x21, #0x1b, lsl #12
    c1a8:	396c8021 	ldrb	w1, [x1, #2848]
    c1ac:	340000a1 	cbz	w1, c1c0 <rtl8125_init_one+0x8c0>
                tp->NotWrRamCodeToMicroP = TRUE;
    c1b0:	91407281 	add	x1, x20, #0x1c, lsl #12
    c1b4:	52802022 	mov	w2, #0x101                 	// #257
    c1b8:	91100021 	add	x1, x1, #0x400
    c1bc:	78021022 	sturh	w2, [x1, #33]
        switch (tp->mcfg) {
    c1c0:	71000c1f 	cmp	w0, #0x3
    c1c4:	54000060 	b.eq	c1d0 <rtl8125_init_one+0x8d0>  // b.none
    c1c8:	7100181f 	cmp	w0, #0x6
    c1cc:	54000181 	b.ne	c1fc <rtl8125_init_one+0x8fc>  // b.any
                if ((rtl8125_mac_ocp_read(tp, 0xD442) & BIT_5) &&
    c1d0:	aa1303e0 	mov	x0, x19
    c1d4:	128577a1 	mov	w1, #0xffffd442            	// #-11198
    c1d8:	94000000 	bl	7ea4 <rtl8125_mac_ocp_read>
    c1dc:	36280100 	tbz	w0, #5, c1fc <rtl8125_init_one+0x8fc>
                    (mdio_direct_read_phy_ocp(tp, 0xD068) & BIT_1))
    c1e0:	aa1303e0 	mov	x0, x19
    c1e4:	1285f2e1 	mov	w1, #0xffffd068            	// #-12184
    c1e8:	97ffd81d 	bl	225c <mdio_direct_read_phy_ocp>
                if ((rtl8125_mac_ocp_read(tp, 0xD442) & BIT_5) &&
    c1ec:	36080080 	tbz	w0, #1, c1fc <rtl8125_init_one+0x8fc>
                        tp->RequirePhyMdiSwapPatch = TRUE;
    c1f0:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c1f4:	52800021 	mov	w1, #0x1                   	// #1
    c1f8:	392d2801 	strb	w1, [x0, #2890]
        switch (tp->mcfg) {
    c1fc:	b977fea0 	ldr	w0, [x21, #14332]
    c200:	51000801 	sub	w1, w0, #0x2
    c204:	7100143f 	cmp	w1, #0x5
    c208:	54000168 	b.hi	c234 <rtl8125_init_one+0x934>  // b.pmore
                tp->HwSuppMacMcuVer = 2;
    c20c:	91406ea2 	add	x2, x21, #0x1b, lsl #12
    c210:	52800043 	mov	w3, #0x2                   	// #2
        switch (tp->mcfg) {
    c214:	7100141f 	cmp	w0, #0x5
                tp->HwSuppMacMcuVer = 2;
    c218:	392fb043 	strb	w3, [x2, #3052]
                tp->MacMcuPageSize = RTL8125_MAC_MCU_PAGE_SIZE;
    c21c:	91406aa2 	add	x2, x21, #0x1a, lsl #12
    c220:	52802003 	mov	w3, #0x100                 	// #256
    c224:	7937dc43 	strh	w3, [x2, #7150]
        switch (tp->mcfg) {
    c228:	540001c8 	b.hi	c260 <rtl8125_init_one+0x960>  // b.pmore
    c22c:	71000c1f 	cmp	w0, #0x3
    c230:	540001c8 	b.hi	c268 <rtl8125_init_one+0x968>  // b.pmore
                tp->HwSuppNumTxQueues = 1;
    c234:	320083e2 	mov	w2, #0x10001               	// #65537
    c238:	1400000e 	b	c270 <rtl8125_init_one+0x970>
                tp->sw_ram_code_ver = NIC_RAMCODE_VERSION_CFG_METHOD_3;
    c23c:	91406aa1 	add	x1, x21, #0x1a, lsl #12
    c240:	52816662 	mov	w2, #0xb33                 	// #2867
    c244:	17ffffd7 	b	c1a0 <rtl8125_init_one+0x8a0>
                tp->sw_ram_code_ver = NIC_RAMCODE_VERSION_CFG_METHOD_4;
    c248:	91406aa1 	add	x1, x21, #0x1a, lsl #12
    c24c:	528162e2 	mov	w2, #0xb17                 	// #2839
    c250:	17ffffd4 	b	c1a0 <rtl8125_init_one+0x8a0>
                tp->sw_ram_code_ver = NIC_RAMCODE_VERSION_CFG_METHOD_5;
    c254:	91406aa1 	add	x1, x21, #0x1a, lsl #12
    c258:	52816e82 	mov	w2, #0xb74                 	// #2932
    c25c:	17ffffd1 	b	c1a0 <rtl8125_init_one+0x8a0>
        switch (tp->mcfg) {
    c260:	71001c1f 	cmp	w0, #0x7
    c264:	54fffe81 	b.ne	c234 <rtl8125_init_one+0x934>  // b.any
                tp->HwSuppNumTxQueues = 2;
    c268:	52800042 	mov	w2, #0x2                   	// #2
    c26c:	72a00082 	movk	w2, #0x4, lsl #16
                tp->HwSuppNumTxQueues = 1;
    c270:	b9010762 	str	w2, [x27, #260]
        tp->num_tx_rings = 1;
    c274:	52800022 	mov	w2, #0x1                   	// #1
    c278:	b9380aa2 	str	w2, [x21, #14344]
        switch (tp->mcfg) {
    c27c:	7100141f 	cmp	w0, #0x5
    c280:	54000148 	b.hi	c2a8 <rtl8125_init_one+0x9a8>  // b.pmore
    c284:	71000c1f 	cmp	w0, #0x3
    c288:	54000149 	b.ls	c2b0 <rtl8125_init_one+0x9b0>  // b.plast
                tp->HwSuppRssVer = 5;
    c28c:	91406ea2 	add	x2, x21, #0x1b, lsl #12
    c290:	528000a3 	mov	w3, #0x5                   	// #5
    c294:	392fa043 	strb	w3, [x2, #3048]
                tp->HwSuppIndirTblEntries = 128;
    c298:	91406aa2 	add	x2, x21, #0x1a, lsl #12
    c29c:	52801003 	mov	w3, #0x80                  	// #128
    c2a0:	7937d443 	strh	w3, [x2, #7146]
                break;
    c2a4:	14000003 	b	c2b0 <rtl8125_init_one+0x9b0>
        switch (tp->mcfg) {
    c2a8:	71001c1f 	cmp	w0, #0x7
    c2ac:	54ffff00 	b.eq	c28c <rtl8125_init_one+0x98c>  // b.none
        tp->num_rx_rings = 1;
    c2b0:	52800022 	mov	w2, #0x1                   	// #1
    c2b4:	b9380ea2 	str	w2, [x21, #14348]
                tp->tx_ring[i].hw_clo_ptr_reg = (u16)(HW_CLO_PTR0_8125 + i * 4);
    c2b8:	91402282 	add	x2, x20, #0x8, lsl #12
    c2bc:	52850043 	mov	w3, #0x2802                	// #10242
    c2c0:	72a50003 	movk	w3, #0x2800, lsl #16
                tp->rx_ring[i].num_rx_desc = rx;
    c2c4:	52808004 	mov	w4, #0x400                 	// #1024
        switch (tp->mcfg) {
    c2c8:	7100141f 	cmp	w0, #0x5
                tp->tx_ring[i].hw_clo_ptr_reg = (u16)(HW_CLO_PTR0_8125 + i * 4);
    c2cc:	b9014043 	str	w3, [x2, #320]
        tp->tx_ring[0].tdsar_reg = TxDescStartAddrLow;
    c2d0:	91401aa2 	add	x2, x21, #0x6, lsl #12
    c2d4:	52800403 	mov	w3, #0x20                  	// #32
    c2d8:	79308843 	strh	w3, [x2, #6212]
                tp->tx_ring[i].hw_clo_ptr_reg = (u16)(HW_CLO_PTR0_8125 + i * 4);
    c2dc:	91403282 	add	x2, x20, #0xc, lsl #12
    c2e0:	528500c3 	mov	w3, #0x2806                	// #10246
    c2e4:	72a50083 	movk	w3, #0x2804, lsl #16
    c2e8:	b9017843 	str	w3, [x2, #376]
                tp->tx_ring[i].tdsar_reg = (u16)(TNPDS_Q1_LOW_8125 + (i - 1) * 8);
    c2ec:	91402aa2 	add	x2, x21, #0xa, lsl #12
    c2f0:	52842003 	mov	w3, #0x2100                	// #8448
    c2f4:	7930f843 	strh	w3, [x2, #6268]
        tp->rx_ring[0].rdsar_reg = RxDescAddrLow;
    c2f8:	91403aa2 	add	x2, x21, #0xe, lsl #12
    c2fc:	52801c83 	mov	w3, #0xe4                  	// #228
    c300:	79315043 	strh	w3, [x2, #6312]
                tp->rx_ring[i].rdsar_reg = (u16)(RDSAR_Q1_LOW_8125 + (i - 1) * 8);
    c304:	91404aa2 	add	x2, x21, #0x12, lsl #12
    c308:	52880003 	mov	w3, #0x4000                	// #16384
    c30c:	7931b043 	strh	w3, [x2, #6360]
    c310:	91405aa2 	add	x2, x21, #0x16, lsl #12
    c314:	52880103 	mov	w3, #0x4008                	// #16392
    c318:	79321043 	strh	w3, [x2, #6408]
    c31c:	91406aa2 	add	x2, x21, #0x1a, lsl #12
    c320:	52880203 	mov	w3, #0x4010                	// #16400
    c324:	79327043 	strh	w3, [x2, #6456]
        tp->isr_reg[0] = ISR0_8125;
    c328:	91407282 	add	x2, x20, #0x1c, lsl #12
    c32c:	d2800783 	mov	x3, #0x3c                  	// #60
    c330:	91080042 	add	x2, x2, #0x200
    c334:	f2a10043 	movk	x3, #0x802, lsl #16
    c338:	f2c100c3 	movk	x3, #0x806, lsl #32
    c33c:	f2e10143 	movk	x3, #0x80a, lsl #48
    c340:	f807c043 	stur	x3, [x2, #124]
        tp->imr_reg[0] = IMR0_8125;
    c344:	d2800703 	mov	x3, #0x38                  	// #56
    c348:	f2a10003 	movk	x3, #0x800, lsl #16
    c34c:	f2c10083 	movk	x3, #0x804, lsl #32
    c350:	f2e10103 	movk	x3, #0x808, lsl #48
    c354:	f8084043 	stur	x3, [x2, #132]
                tp->rx_ring[i].num_rx_desc = rx;
    c358:	914022a3 	add	x3, x21, #0x8, lsl #12
    c35c:	b9389464 	str	w4, [x3, #14484]
                tp->tx_ring[i].num_tx_desc = tx;
    c360:	b93826a4 	str	w4, [x21, #14372]
        switch (tp->mcfg) {
    c364:	540003e8 	b.hi	c3e0 <rtl8125_init_one+0xae0>  // b.pmore
    c368:	71000c1f 	cmp	w0, #0x3
    c36c:	540003e9 	b.ls	c3e8 <rtl8125_init_one+0xae8>  // b.plast
                tp->HwSuppPtpVer = 1;
    c370:	91406ea3 	add	x3, x21, #0x1b, lsl #12
    c374:	52800024 	mov	w4, #0x1                   	// #1
        switch (tp->mcfg) {
    c378:	7100141f 	cmp	w0, #0x5
                tp->HwSuppPtpVer = 1;
    c37c:	392f7064 	strb	w4, [x3, #3036]
        switch (tp->mcfg) {
    c380:	540003a8 	b.hi	c3f4 <rtl8125_init_one+0xaf4>  // b.pmore
    c384:	71000c1f 	cmp	w0, #0x3
    c388:	54000309 	b.ls	c3e8 <rtl8125_init_one+0xae8>  // b.plast
                tp->HwSuppIsrVer = 2;
    c38c:	91406ea3 	add	x3, x21, #0x1b, lsl #12
    c390:	52800044 	mov	w4, #0x2                   	// #2
                tp->HwSuppIsrVer = 1;
    c394:	392da864 	strb	w4, [x3, #2922]
        tp->HwCurrIsrVer = tp->HwSuppIsrVer;
    c398:	91406ea4 	add	x4, x21, #0x1b, lsl #12
    c39c:	396da883 	ldrb	w3, [x4, #2922]
    c3a0:	392dac83 	strb	w3, [x4, #2923]
        if (tp->HwSuppIsrVer == 2) {
    c3a4:	7100087f 	cmp	w3, #0x2
    c3a8:	54000141 	b.ne	c3d0 <rtl8125_init_one+0xad0>  // b.any
                if (!(tp->features & RTL_FEATURE_MSIX) ||
    c3ac:	914062a4 	add	x4, x21, #0x18, lsl #12
    c3b0:	b97b1086 	ldr	w6, [x4, #15120]
    c3b4:	36100086 	tbz	w6, #2, c3c4 <rtl8125_init_one+0xac4>
    c3b8:	b9771aa6 	ldr	w6, [x21, #14104]
    c3bc:	710040df 	cmp	w6, #0x10
    c3c0:	54004728 	b.hi	cca4 <rtl8125_init_one+0x13a4>  // b.pmore
                        tp->HwCurrIsrVer = 1;
    c3c4:	91406ea4 	add	x4, x21, #0x1b, lsl #12
    c3c8:	52800026 	mov	w6, #0x1                   	// #1
    c3cc:	392dac86 	strb	w6, [x4, #2923]
                tp->intr_mask = LinkChg | RxDescUnavail | TxOK | RxOK | SWInt;
    c3d0:	d28026a4 	mov	x4, #0x135                 	// #309
    c3d4:	f2c80404 	movk	x4, #0x4020, lsl #32
    c3d8:	f8074044 	stur	x4, [x2, #116]
    c3dc:	14000235 	b	ccb0 <rtl8125_init_one+0x13b0>
        switch (tp->mcfg) {
    c3e0:	71001c1f 	cmp	w0, #0x7
    c3e4:	54fffc60 	b.eq	c370 <rtl8125_init_one+0xa70>  // b.none
                tp->HwSuppIsrVer = 1;
    c3e8:	91406ea3 	add	x3, x21, #0x1b, lsl #12
    c3ec:	52800024 	mov	w4, #0x1                   	// #1
    c3f0:	17ffffe9 	b	c394 <rtl8125_init_one+0xa94>
        switch (tp->mcfg) {
    c3f4:	71001c1f 	cmp	w0, #0x7
    c3f8:	54fffca0 	b.eq	c38c <rtl8125_init_one+0xa8c>  // b.none
    c3fc:	17fffffb 	b	c3e8 <rtl8125_init_one+0xae8>
                tp->HwSuppIntMitiVer = 3;
    c400:	91406ea2 	add	x2, x21, #0x1b, lsl #12
    c404:	52800064 	mov	w4, #0x3                   	// #3
                tp->HwSuppIntMitiVer = 4;
    c408:	392db044 	strb	w4, [x2, #2924]
        switch (tp->mcfg) {
    c40c:	7100143f 	cmp	w1, #0x5
    c410:	54000088 	b.hi	c420 <rtl8125_init_one+0xb20>  // b.pmore
                tp->HwSuppExtendTallyCounterVer = 1;
    c414:	91406ea1 	add	x1, x21, #0x1b, lsl #12
    c418:	52800022 	mov	w2, #0x1                   	// #1
    c41c:	392db422 	strb	w2, [x1, #2925]
        timer_count_v2 = (timer_count / 0x100);
    c420:	b9402b81 	ldr	w1, [x28, #40]
    c424:	52802002 	mov	w2, #0x100                 	// #256
        switch (tp->mcfg) {
    c428:	7100141f 	cmp	w0, #0x5
        timer_count_v2 = (timer_count / 0x100);
    c42c:	1ac20c21 	sdiv	w1, w1, w2
    c430:	b9003381 	str	w1, [x28, #48]
        switch (tp->mcfg) {
    c434:	540001a8 	b.hi	c468 <rtl8125_init_one+0xb68>  // b.pmore
    c438:	71000c1f 	cmp	w0, #0x3
    c43c:	540001a9 	b.ls	c470 <rtl8125_init_one+0xb70>  // b.plast
                if (tp->HwSuppIsrVer == 2) {
    c440:	7100087f 	cmp	w3, #0x2
    c444:	54000161 	b.ne	c470 <rtl8125_init_one+0xb70>  // b.any
                        tp->RequireRduNonStopPatch = 1;
    c448:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c44c:	52800021 	mov	w1, #0x1                   	// #1
    c450:	392ca001 	strb	w1, [x0, #2856]
                        tp->EnableRss = 0;
    c454:	392fa41f 	strb	wzr, [x0, #3049]
    c458:	14000006 	b	c470 <rtl8125_init_one+0xb70>
                tp->HwSuppIntMitiVer = 4;
    c45c:	91406ea2 	add	x2, x21, #0x1b, lsl #12
    c460:	52800084 	mov	w4, #0x4                   	// #4
    c464:	17ffffe9 	b	c408 <rtl8125_init_one+0xb08>
        switch (tp->mcfg) {
    c468:	71001c1f 	cmp	w0, #0x7
    c46c:	54fffea0 	b.eq	c440 <rtl8125_init_one+0xb40>  // b.none
        tp->InitRxDescType = RX_DESC_RING_TYPE_1;
    c470:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c474:	52800021 	mov	w1, #0x1                   	// #1
    c478:	392f6001 	strb	w1, [x0, #3032]
        if (tp->EnableRss || tp->EnablePtp)
    c47c:	396fa401 	ldrb	w1, [x0, #3049]
    c480:	35000061 	cbnz	w1, c48c <rtl8125_init_one+0xb8c>
    c484:	396f7400 	ldrb	w0, [x0, #3037]
    c488:	34000080 	cbz	w0, c498 <rtl8125_init_one+0xb98>
                tp->InitRxDescType = RX_DESC_RING_TYPE_3;
    c48c:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c490:	52800061 	mov	w1, #0x3                   	// #3
    c494:	392f6001 	strb	w1, [x0, #3032]
        if (tp->InitRxDescType == RX_DESC_RING_TYPE_3)
    c498:	91406ea0 	add	x0, x21, #0x1b, lsl #12
        tp->RxDescLength = RX_DESC_LEN_TYPE_1;
    c49c:	91406abb 	add	x27, x21, #0x1a, lsl #12
                tp->RxDescLength = RX_DESC_LEN_TYPE_3;
    c4a0:	52800202 	mov	w2, #0x10                  	// #16
        if (tp->InitRxDescType == RX_DESC_RING_TYPE_3)
    c4a4:	f90037e0 	str	x0, [sp, #104]
        tp->rtl8125_rx_config = rtl_chip_info[tp->chipset].RCR_Cfg;
    c4a8:	90000003 	adrp	x3, 0 <__ll_sc_atomic64_or>
    c4ac:	91000063 	add	x3, x3, #0x0
        if (tp->InitRxDescType == RX_DESC_RING_TYPE_3)
    c4b0:	396f6001 	ldrb	w1, [x0, #3032]
                tp->RxDescLength = RX_DESC_LEN_TYPE_3;
    c4b4:	52800400 	mov	w0, #0x20                  	// #32
    c4b8:	71000c3f 	cmp	w1, #0x3
    c4bc:	1a820000 	csel	w0, w0, w2, eq  // eq = none
    c4c0:	7937b760 	strh	w0, [x27, #7130]
        tp->rtl8125_rx_config = rtl_chip_info[tp->chipset].RCR_Cfg;
    c4c4:	d2800302 	mov	x2, #0x18                  	// #24
    c4c8:	b9b7faa0 	ldrsw	x0, [x21, #14328]
    c4cc:	9b020c00 	madd	x0, x0, x2, x3
    c4d0:	914062a2 	add	x2, x21, #0x18, lsl #12
    c4d4:	b9400c00 	ldr	w0, [x0, #12]
    c4d8:	32080003 	orr	w3, w0, #0x1000000
    c4dc:	1a831000 	csel	w0, w0, w3, ne  // ne = any
    c4e0:	b9396c40 	str	w0, [x2, #14700]
        tp->NicCustLedValue = RTL_R16(tp, CustomLED);
    c4e4:	f9448280 	ldr	x0, [x20, #2304]
    c4e8:	91006000 	add	x0, x0, #0x18
    c4ec:	97ffceeb 	bl	98 <__raw_readw>
    c4f0:	d50331bf 	dmb	oshld
    c4f4:	92403c01 	and	x1, x0, #0xffff
    c4f8:	ca010021 	eor	x1, x1, x1
    c4fc:	b5000001 	cbnz	x1, c4fc <rtl8125_init_one+0xbfc>
    c500:	7936af60 	strh	w0, [x27, #6998]
        if (disable_pm_support)
    c504:	9000001b 	adrp	x27, 0 <__ll_sc_atomic64_or>
    c508:	9100037b 	add	x27, x27, #0x0
    c50c:	b9401b60 	ldr	w0, [x27, #24]
    c510:	34002ca0 	cbz	w0, caa4 <rtl8125_init_one+0x11a4>
        u32 wol_opts = 0;
    c514:	5280001a 	mov	w26, #0x0                   	// #0
        tp->wol_opts = rtl8125_get_hw_wol(tp);
    c518:	914062a0 	add	x0, x21, #0x18, lsl #12
        tp->wol_enabled = (tp->wol_opts) ? WOL_ENABLED : WOL_DISABLED;
    c51c:	7100035f 	cmp	w26, #0x0
    c520:	1a9f07e1 	cset	w1, ne  // ne = any
        tp->wol_opts = rtl8125_get_hw_wol(tp);
    c524:	b939bc1a 	str	w26, [x0, #14780]
        tp->wol_enabled = (tp->wol_opts) ? WOL_ENABLED : WOL_DISABLED;
    c528:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c52c:	3926e001 	strb	w1, [x0, #2488]
        if (tp->mcfg == CFG_METHOD_6 || tp->mcfg == CFG_METHOD_7)
    c530:	b9400300 	ldr	w0, [x24]
    c534:	b977fea1 	ldr	w1, [x21, #14332]
    c538:	710fa01f 	cmp	w0, #0x3e8
    c53c:	51001823 	sub	w3, w1, #0x6
    c540:	1a9f07e2 	cset	w2, ne  // ne = any
    c544:	7100047f 	cmp	w3, #0x1
    c548:	54003028 	b.hi	cb4c <rtl8125_init_one+0x124c>  // b.pmore
        if ((*spd != SPEED_1000) &&
    c54c:	7101901f 	cmp	w0, #0x64
    c550:	7a401844 	ccmp	w2, #0x0, #0x4, ne  // ne = any
    c554:	540000a0 	b.eq	c568 <rtl8125_init_one+0xc68>  // b.none
            (*spd != SPEED_100) &&
    c558:	7100281f 	cmp	w0, #0xa
    c55c:	54000060 	b.eq	c568 <rtl8125_init_one+0xc68>  // b.none
                *spd = SPEED_1000;
    c560:	52807d00 	mov	w0, #0x3e8                 	// #1000
    c564:	b9000300 	str	w0, [x24]
        if ((*dup != DUPLEX_FULL) && (*dup != DUPLEX_HALF))
    c568:	39401380 	ldrb	w0, [x28, #4]
    c56c:	7100041f 	cmp	w0, #0x1
    c570:	54000069 	b.ls	c57c <rtl8125_init_one+0xc7c>  // b.plast
                *dup = DUPLEX_FULL;
    c574:	52800020 	mov	w0, #0x1                   	// #1
    c578:	39001380 	strb	w0, [x28, #4]
        if ((*aut != AUTONEG_ENABLE) && (*aut != AUTONEG_DISABLE))
    c57c:	39402380 	ldrb	w0, [x28, #8]
    c580:	7100041f 	cmp	w0, #0x1
    c584:	54000069 	b.ls	c590 <rtl8125_init_one+0xc90>  // b.plast
                *aut = AUTONEG_ENABLE;
    c588:	52800020 	mov	w0, #0x1                   	// #1
    c58c:	39002380 	strb	w0, [x28, #8]
        *adv &= (ADVERTISED_10baseT_Half |
    c590:	b9400f80 	ldr	w0, [x28, #12]
    c594:	528007e2 	mov	w2, #0x3f                  	// #63
    c598:	72001400 	ands	w0, w0, #0x3f
    c59c:	1a821000 	csel	w0, w0, w2, ne  // ne = any
        *adv &= (ADVERTISED_10baseT_Half |
    c5a0:	b9000f80 	str	w0, [x28, #12]
        tp->autoneg = autoneg_mode;
    c5a4:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c5a8:	b9400b82 	ldr	w2, [x28, #8]
        if (tp->mcfg != CFG_METHOD_DEFAULT) {
    c5ac:	7100203f 	cmp	w1, #0x8
        tp->speed = speed_mode;
    c5b0:	b9400303 	ldr	w3, [x24]
        tp->autoneg = autoneg_mode;
    c5b4:	39270802 	strb	w2, [x0, #2498]
        tp->speed = speed_mode;
    c5b8:	914062a2 	add	x2, x21, #0x18, lsl #12
    c5bc:	b939c443 	str	w3, [x2, #14788]
        tp->duplex = duplex_mode;
    c5c0:	b9400783 	ldr	w3, [x28, #4]
    c5c4:	39270c03 	strb	w3, [x0, #2499]
        tp->advertising = advertising_mode;
    c5c8:	b9400f80 	ldr	w0, [x28, #12]
        tp->max_jumbo_frame_size = rtl_chip_info[tp->chipset].jumbo_frame_sz;
    c5cc:	d2800303 	mov	x3, #0x18                  	// #24
        tp->advertising = advertising_mode;
    c5d0:	b939c840 	str	w0, [x2, #14792]
        tp->fcpause = rtl8125_fc_full;
    c5d4:	52800060 	mov	w0, #0x3                   	// #3
    c5d8:	b939cc40 	str	w0, [x2, #14796]
        tp->max_jumbo_frame_size = rtl_chip_info[tp->chipset].jumbo_frame_sz;
    c5dc:	90000000 	adrp	x0, 0 <__ll_sc_atomic64_or>
    c5e0:	91000000 	add	x0, x0, #0x0
    c5e4:	b9b7faa2 	ldrsw	x2, [x21, #14328]
    c5e8:	9b030042 	madd	x2, x2, x3, x0
        dev->min_mtu = ETH_MIN_MTU;
    c5ec:	52800883 	mov	w3, #0x44                  	// #68
        tp->max_jumbo_frame_size = rtl_chip_info[tp->chipset].jumbo_frame_sz;
    c5f0:	b9401442 	ldr	w2, [x2, #20]
    c5f4:	b937f6a2 	str	w2, [x21, #14324]
        dev->min_mtu = ETH_MIN_MTU;
    c5f8:	b9022e83 	str	w3, [x20, #556]
        dev->max_mtu = tp->max_jumbo_frame_size;
    c5fc:	b9023282 	str	w2, [x20, #560]
        if (tp->mcfg != CFG_METHOD_DEFAULT) {
    c600:	540001c0 	b.eq	c638 <rtl8125_init_one+0xd38>  // b.none
                eee->eee_enabled = eee_enable;
    c604:	91407282 	add	x2, x20, #0x1c, lsl #12
    c608:	b9402783 	ldr	w3, [x28, #36]
    c60c:	91129042 	add	x2, x2, #0x4a4
                switch (tp->mcfg) {
    c610:	51001021 	sub	w1, w1, #0x4
                eee->supported  = SUPPORTED_100baseT_Full |
    c614:	7100043f 	cmp	w1, #0x1
    c618:	52900501 	mov	w1, #0x8028                	// #32808
                eee->eee_enabled = eee_enable;
    c61c:	b9001443 	str	w3, [x2, #20]
                eee->supported  = SUPPORTED_100baseT_Full |
    c620:	52800503 	mov	w3, #0x28                  	// #40
    c624:	1a818061 	csel	w1, w3, w1, hi  // hi = pmore
                eee->advertised = mmd_eee_adv_to_ethtool_adv_t(MDIO_EEE_1000T | MDIO_EEE_100TX);
    c628:	29008c41 	stp	w1, w3, [x2, #4]
                eee->tx_lpi_timer = dev->mtu + ETH_HLEN + 0x20;
    c62c:	b9422a81 	ldr	w1, [x20, #552]
    c630:	1100b821 	add	w1, w1, #0x2e
    c634:	b9001c41 	str	w1, [x2, #28]
        tp->ptp_master_mode = enable_ptp_master_mode;
    c638:	91406ea1 	add	x1, x21, #0x1b, lsl #12
    c63c:	b9402b62 	ldr	w2, [x27, #40]
                        poll = rtl8125_poll;
    c640:	9000001a 	adrp	x26, 0 <__ll_sc_atomic64_or>
                                poll = rtl8125_poll_msix_rx;
    c644:	9000001b 	adrp	x27, 0 <__ll_sc_atomic64_or>
                if (tp->features & RTL_FEATURE_MSIX &&
    c648:	914062bc 	add	x28, x21, #0x18, lsl #12
                        poll = rtl8125_poll;
    c64c:	9100035a 	add	x26, x26, #0x0
        tp->ptp_master_mode = enable_ptp_master_mode;
    c650:	392f7822 	strb	w2, [x1, #3038]
        RTL_NET_DEVICE_OPS(rtl8125_netdev_ops);
    c654:	91332001 	add	x1, x0, #0xcc8
        SET_ETHTOOL_OPS(dev, &rtl8125_ethtool_ops);
    c658:	913be000 	add	x0, x0, #0xef8
    c65c:	a91f0281 	stp	x1, x0, [x20, #496]
        dev->watchdog_timeo = RTL8125_TX_TIMEOUT;
    c660:	5280e100 	mov	w0, #0x708                 	// #1800
    c664:	b9043a80 	str	w0, [x20, #1080]
                                poll = rtl8125_poll_msix_rx;
    c668:	9100037b 	add	x27, x27, #0x0
        for (i=0; i<tp->irq_nvecs; i++) {
    c66c:	52800018 	mov	w24, #0x0                   	// #0
        dev->irq = rtl8125_get_irq(pdev);
    c670:	b943fec0 	ldr	w0, [x22, #1020]
        dev->base_addr = (unsigned long) ioaddr;
    c674:	f9001a99 	str	x25, [x20, #48]
    c678:	91246299 	add	x25, x20, #0x918
        dev->irq = rtl8125_get_irq(pdev);
    c67c:	b9003a80 	str	w0, [x20, #56]
        for (i=0; i<tp->irq_nvecs; i++) {
    c680:	b9771aa0 	ldr	w0, [x21, #14104]
    c684:	6b18001f 	cmp	w0, w24
    c688:	54002928 	b.hi	cbac <rtl8125_init_one+0x12ac>  // b.pmore
        if (tp->mcfg != CFG_METHOD_DEFAULT) {
    c68c:	b977fea0 	ldr	w0, [x21, #14332]
    c690:	7100201f 	cmp	w0, #0x8
    c694:	54000080 	b.eq	c6a4 <rtl8125_init_one+0xda4>  // b.none
                dev->features |= NETIF_F_HW_VLAN_TX | NETIF_F_HW_VLAN_RX;
    c698:	f9406680 	ldr	x0, [x20, #200]
    c69c:	b2790400 	orr	x0, x0, #0x180
    c6a0:	f9006680 	str	x0, [x20, #200]
        tp->cp_cmd |= RTL_R16(tp, CPlusCmd);
    c6a4:	f9448280 	ldr	x0, [x20, #2304]
    c6a8:	91038000 	add	x0, x0, #0xe0
    c6ac:	97ffce7b 	bl	98 <__raw_readw>
    c6b0:	12003c01 	and	w1, w0, #0xffff
    c6b4:	d50331bf 	dmb	oshld
    c6b8:	92403c00 	and	x0, x0, #0xffff
    c6bc:	ca000000 	eor	x0, x0, x0
    c6c0:	b5000000 	cbnz	x0, c6c0 <rtl8125_init_one+0xdc0>
    c6c4:	91406aa2 	add	x2, x21, #0x1a, lsl #12
    c6c8:	7972e040 	ldrh	w0, [x2, #6512]
    c6cc:	2a000020 	orr	w0, w1, w0
    c6d0:	7932e040 	strh	w0, [x2, #6512]
        if (tp->mcfg != CFG_METHOD_DEFAULT) {
    c6d4:	b977fea0 	ldr	w0, [x21, #14332]
    c6d8:	7100201f 	cmp	w0, #0x8
    c6dc:	54000280 	b.eq	c72c <rtl8125_init_one+0xe2c>  // b.none
                dev->vlan_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_TSO |
    c6e0:	d2800461 	mov	x1, #0x23                  	// #35
    c6e4:	f2a00021 	movk	x1, #0x1, lsl #16
    c6e8:	f9007281 	str	x1, [x20, #224]
                dev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
    c6ec:	b9421e81 	ldr	w1, [x20, #540]
                dev->features |= NETIF_F_IP_CSUM;
    c6f0:	f9406680 	ldr	x0, [x20, #200]
                dev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
    c6f4:	32110021 	orr	w1, w1, #0x8000
    c6f8:	b9021e81 	str	w1, [x20, #540]
                dev->hw_features |= NETIF_F_IPV6_CSUM | NETIF_F_TSO6;
    c6fc:	d2803261 	mov	x1, #0x193                 	// #403
    c700:	f2a00221 	movk	x1, #0x11, lsl #16
    c704:	f2c32001 	movk	x1, #0x1900, lsl #32
    c708:	f9006a81 	str	x1, [x20, #208]
                dev->features |=  NETIF_F_IPV6_CSUM;
    c70c:	d2800241 	mov	x1, #0x12                  	// #18
    c710:	f2c02001 	movk	x1, #0x100, lsl #32
    c714:	aa010000 	orr	x0, x0, x1
    c718:	f9006680 	str	x0, [x20, #200]
}

static inline void netif_set_gso_max_size(struct net_device *dev,
					  unsigned int size)
{
	dev->gso_max_size = size;
    c71c:	529f4000 	mov	w0, #0xfa00                	// #64000
    c720:	b9081280 	str	w0, [x20, #2064]
                dev->gso_max_segs = NIC_MAX_PHYS_BUF_COUNT_LSO2;
    c724:	52800800 	mov	w0, #0x40                  	// #64
    c728:	79102a80 	strh	w0, [x20, #2068]
        INIT_DELAYED_WORK(&tp->reset_task, rtl8125_reset_task);
    c72c:	914062b8 	add	x24, x21, #0x18, lsl #12
 * the result is an empty list.
 */
static inline void INIT_LIST_HEAD(struct list_head *list)
{
	WRITE_ONCE(list->next, list);
	list->prev = list;
    c730:	9140729a 	add	x26, x20, #0x1c, lsl #12
	WRITE_ONCE(list->next, list);
    c734:	9140629b 	add	x27, x20, #0x18, lsl #12
	list->prev = list;
    c738:	9110035a 	add	x26, x26, #0x400
    c73c:	b27b7bfc 	mov	x28, #0xfffffffe0           	// #68719476704
    c740:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c744:	f91d031c 	str	x28, [x24, #14848]
    c748:	91282000 	add	x0, x0, #0xa08
	WRITE_ONCE(list->next, list);
    c74c:	f9218760 	str	x0, [x27, #17160]
    c750:	90000019 	adrp	x25, 0 <delayed_work_timer_fn>
	list->prev = list;
    c754:	f8110340 	stur	x0, [x26, #-240]
    c758:	90000000 	adrp	x0, 0 <__ll_sc_atomic64_or>
    c75c:	91000000 	add	x0, x0, #0x0
    c760:	f91d0f00 	str	x0, [x24, #14872]
    c764:	91000339 	add	x25, x25, #0x0
    c768:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c76c:	aa1903e1 	mov	x1, x25
    c770:	91288000 	add	x0, x0, #0xa20
    c774:	d2800004 	mov	x4, #0x0                   	// #0
    c778:	d2800003 	mov	x3, #0x0                   	// #0
    c77c:	52a00402 	mov	w2, #0x200000              	// #2097152
    c780:	94000000 	bl	0 <init_timer_key>
        INIT_DELAYED_WORK(&tp->esd_task, rtl8125_esd_task);
    c784:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c788:	f91d2f1c 	str	x28, [x24, #14936]
    c78c:	91298000 	add	x0, x0, #0xa60
	WRITE_ONCE(list->next, list);
    c790:	f921b360 	str	x0, [x27, #17248]
	list->prev = list;
    c794:	f8168340 	stur	x0, [x26, #-152]
    c798:	90000000 	adrp	x0, 0 <__ll_sc_atomic64_or>
    c79c:	91000000 	add	x0, x0, #0x0
    c7a0:	f91d3b00 	str	x0, [x24, #14960]
    c7a4:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c7a8:	aa1903e1 	mov	x1, x25
    c7ac:	9129e000 	add	x0, x0, #0xa78
    c7b0:	d2800004 	mov	x4, #0x0                   	// #0
    c7b4:	d2800003 	mov	x3, #0x0                   	// #0
    c7b8:	52a00402 	mov	w2, #0x200000              	// #2097152
    c7bc:	94000000 	bl	0 <init_timer_key>
        INIT_DELAYED_WORK(&tp->linkchg_task, rtl8125_linkchg_task);
    c7c0:	f91d5b1c 	str	x28, [x24, #15024]
    c7c4:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c7c8:	aa1903e1 	mov	x1, x25
    c7cc:	912ae000 	add	x0, x0, #0xab8
	WRITE_ONCE(list->next, list);
    c7d0:	f921df60 	str	x0, [x27, #17336]
	list->prev = list;
    c7d4:	f81c0340 	stur	x0, [x26, #-64]
    c7d8:	90000000 	adrp	x0, 0 <__ll_sc_atomic64_or>
    c7dc:	91000000 	add	x0, x0, #0x0
    c7e0:	f91d6700 	str	x0, [x24, #15048]
    c7e4:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c7e8:	d2800004 	mov	x4, #0x0                   	// #0
    c7ec:	912b4000 	add	x0, x0, #0xad0
    c7f0:	d2800003 	mov	x3, #0x0                   	// #0
    c7f4:	52a00402 	mov	w2, #0x200000              	// #2097152
    c7f8:	94000000 	bl	0 <init_timer_key>
        retval = netif_set_real_num_tx_queues(tp->dev, tp->num_tx_rings);
    c7fc:	b9780aa1 	ldr	w1, [x21, #14344]
    c800:	91240298 	add	x24, x20, #0x900
    c804:	f9400aa0 	ldr	x0, [x21, #16]
    c808:	94000000 	bl	0 <netif_set_real_num_tx_queues>
    c80c:	2a0003f9 	mov	w25, w0
        if (retval < 0)
    c810:	37f82080 	tbnz	w0, #31, cc20 <rtl8125_init_one+0x1320>
        retval = netif_set_real_num_rx_queues(tp->dev, tp->num_rx_rings);
    c814:	b9780ea1 	ldr	w1, [x21, #14348]
    c818:	f9400aa0 	ldr	x0, [x21, #16]
    c81c:	94000000 	bl	0 <netif_set_real_num_rx_queues>
    c820:	2a0003f9 	mov	w25, w0
        if (rc < 0)
    c824:	37f81fe0 	tbnz	w0, #31, cc20 <rtl8125_init_one+0x1320>
        rtl8125_exit_oob(dev);
    c828:	aa1403e0 	mov	x0, x20
    c82c:	97fffa38 	bl	b10c <rtl8125_exit_oob>
        rtl8125_powerup_pll(dev);
    c830:	aa1403e0 	mov	x0, x20
    c834:	97ffefb6 	bl	870c <rtl8125_powerup_pll>
        rtl8125_hw_init(dev);
    c838:	aa1403e0 	mov	x0, x20
    c83c:	97fffb1e 	bl	b4b4 <rtl8125_hw_init>
        rtl8125_hw_reset(dev);
    c840:	aa1403e0 	mov	x0, x20
    c844:	94000000 	bl	ae84 <rtl8125_hw_reset>
        rtl8125_eeprom_type(tp);
    c848:	aa1303e0 	mov	x0, x19
    c84c:	94000000 	bl	148ec <rtl8125_eeprom_type>
        if (tp->eeprom_type == EEPROM_TYPE_93C46 || tp->eeprom_type == EEPROM_TYPE_93C56)
    c850:	91406ea0 	add	x0, x21, #0x1b, lsl #12
    c854:	39670400 	ldrb	w0, [x0, #2497]
    c858:	51000400 	sub	w0, w0, #0x1
    c85c:	12001c00 	and	w0, w0, #0xff
    c860:	7100041f 	cmp	w0, #0x1
    c864:	54000068 	b.hi	c870 <rtl8125_init_one+0xf70>  // b.pmore
                rtl8125_set_eeprom_sel_low(tp);
    c868:	aa1303e0 	mov	x0, x19
    c86c:	94000000 	bl	14c1c <rtl8125_set_eeprom_sel_low>
                mac_addr[i] = RTL_R8(tp, MAC0 + i);
    c870:	9101cbf9 	add	x25, sp, #0x72
        for (i=0; i<tp->irq_nvecs; i++) {
    c874:	d280001a 	mov	x26, #0x0                   	// #0
                mac_addr[i] = RTL_R8(tp, MAC0 + i);
    c878:	f9400300 	ldr	x0, [x24]
    c87c:	8b1a0000 	add	x0, x0, x26
    c880:	97ffce02 	bl	88 <__raw_readb>
    c884:	d50331bf 	dmb	oshld
    c888:	92401c01 	and	x1, x0, #0xff
    c88c:	ca010021 	eor	x1, x1, x1
    c890:	b5000001 	cbnz	x1, c890 <rtl8125_init_one+0xf90>
    c894:	38396b40 	strb	w0, [x26, x25]
        for (i = 0; i < MAC_ADDR_LEN; i++)
    c898:	9100075a 	add	x26, x26, #0x1
    c89c:	f1001b5f 	cmp	x26, #0x6
    c8a0:	54fffec1 	b.ne	c878 <rtl8125_init_one+0xf78>  // b.any
            tp->mcfg == CFG_METHOD_6 ||
    c8a4:	b977ff00 	ldr	w0, [x24, #14332]
    c8a8:	51000800 	sub	w0, w0, #0x2
        if(tp->mcfg == CFG_METHOD_2 ||
    c8ac:	7100141f 	cmp	w0, #0x5
    c8b0:	54000268 	b.hi	c8fc <rtl8125_init_one+0xffc>  // b.pmore
                *(u32*)&mac_addr[0] = RTL_R32(tp, BACKUP_ADDR0_8125);
    c8b4:	f9400300 	ldr	x0, [x24]
    c8b8:	d2833c01 	mov	x1, #0x19e0                	// #6624
    c8bc:	8b010000 	add	x0, x0, x1
    c8c0:	b9400000 	ldr	w0, [x0]
    c8c4:	d50331bf 	dmb	oshld
    c8c8:	2a0003e1 	mov	w1, w0
    c8cc:	ca010021 	eor	x1, x1, x1
    c8d0:	b5000001 	cbnz	x1, c8d0 <rtl8125_init_one+0xfd0>
    c8d4:	b80723e0 	stur	w0, [sp, #114]
                *(u16*)&mac_addr[4] = RTL_R16(tp, BACKUP_ADDR1_8125);
    c8d8:	d2833c82 	mov	x2, #0x19e4                	// #6628
    c8dc:	f9400300 	ldr	x0, [x24]
    c8e0:	8b020000 	add	x0, x0, x2
    c8e4:	97ffcded 	bl	98 <__raw_readw>
    c8e8:	d50331bf 	dmb	oshld
    c8ec:	92403c01 	and	x1, x0, #0xffff
    c8f0:	ca010021 	eor	x1, x1, x1
    c8f4:	b5000001 	cbnz	x1, c8f4 <rtl8125_init_one+0xff4>
    c8f8:	7900efe0 	strh	w0, [sp, #118]
	u32 a = *(const u32 *)addr;
    c8fc:	b84723e1 	ldur	w1, [sp, #114]
	return !is_multicast_ether_addr(addr) && !is_zero_ether_addr(addr);
    c900:	37000081 	tbnz	w1, #0, c910 <rtl8125_init_one+0x1010>
	return ((*(const u32 *)addr) | (*(const u16 *)(addr + 4))) == 0;
    c904:	7940efe0 	ldrh	w0, [sp, #118]
    c908:	2a010000 	orr	w0, w0, w1
        if (!is_valid_ether_addr(mac_addr)) {
    c90c:	35000360 	cbnz	w0, c978 <rtl8125_init_one+0x1078>
                netif_err(tp, probe, dev, "Invalid ether addr %pM\n",
    c910:	b977e300 	ldr	w0, [x24, #14304]
    c914:	360800c0 	tbz	w0, #1, c92c <rtl8125_init_one+0x102c>
    c918:	90000001 	adrp	x1, 0 <__ll_sc_atomic64_or>
    c91c:	aa1903e2 	mov	x2, x25
    c920:	91000021 	add	x1, x1, #0x0
    c924:	aa1403e0 	mov	x0, x20
    c928:	94000000 	bl	0 <netdev_err>
 * Generate a random Ethernet address (MAC) that is not multicast
 * and has the local assigned bit set.
 */

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D571EFBEF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 16:56:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jhDlK-000821-9z; Fri, 05 Jun 2020 14:56:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jhDlJ-00081q-N9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 14:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SY6p+M1PZXV3o83RdZ49ZcMK0+RTil8PEaA7X9gY+uo=; b=ma1Mvazt4Im9zgYg4C+QSSHtI2
 2zzz45X4paxTMmyJe0w3tuMsW5nvdnvV0s3cb+te8IuquVhs5Vv+K6oArXqAtKWVIzjhLgGlKohUl
 Ax2YtOUxaG5bcu+qakU+13FeWfARjIzIzDXd6EtChTUUjFtYH5fINx6EepdhN9PEmGCA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SY6p+M1PZXV3o83RdZ49ZcMK0+RTil8PEaA7X9gY+uo=; b=HqF1eT5745fdBCZ7w0TIVMf4Ma
 GXt4xNEALam9aR1JdqYGfbQiCN8p8TMTLuMPTmvBSlSv6Uk3eLRzuHftbfVtgkPrDaPJRcET4Z5mK
 P407uiTRz+Xq/DPPdZDv+6FVZtL1hjo6vtfNwxwqpuckTUs9uQiPpvqROaq17XEvWB5o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jhDlF-00721I-FZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 14:56:01 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F00B22065C;
 Fri,  5 Jun 2020 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591368947;
 bh=jVExFbYyqo+jOtcbkX/v+ZpPRATRxIAj3YmD1qZv140=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qKdqR8W/+q4rH6SoE0lgUXaIz/f7EMZ1LWXPKg62liD9LwQbMCKTyEdDI8geLlQt1
 OM5VKoJlBl6SccoiGZFzQBQnuIDRZURZXlKez6CpZAz2vE+kdusVvqWWW0A2BF0WBB
 fOPGAQwxGMa6ytOcPNwktRcPCw7zscXit1Tx4tS4=
Date: Fri, 5 Jun 2020 07:55:46 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: kernel test robot <lkp@intel.com>
Message-ID: <20200605145546.GA227721@google.com>
References: <202006051725.63EW72i7%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202006051725.63EW72i7%lkp@intel.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jhDlF-00721I-FZ
Subject: Re: [f2fs-dev] [f2fs:dev-test 48/48] fs/f2fs/super.c:3303:12:
 warning: stack frame size of 2064 bytes in function 'f2fs_fill_super'
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: clang-built-linux@googlegroups.com, linux-f2fs-devel@lists.sourceforge.net,
 kbuild-all@lists.01.org, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric,

Could you PTAL?

On 06/05, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> head:   adf3d3a53cf13d0998c699ba43d8582c875179e3
> commit: adf3d3a53cf13d0998c699ba43d8582c875179e3 [48/48] f2fs: don't return vmalloc() memory from f2fs_kmalloc()
> config: powerpc64-randconfig-r011-20200605 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ac47588bc4ff5927a01ed6fcd269ce86aba52a7c)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc64 cross compiling tool for clang build
>         # apt-get install binutils-powerpc64-linux-gnu
>         git checkout adf3d3a53cf13d0998c699ba43d8582c875179e3
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> In file included from arch/powerpc/include/asm/hardirq.h:6:
> In file included from include/linux/irq.h:20:
> In file included from include/linux/io.h:13:
> In file included from arch/powerpc/include/asm/io.h:605:
> arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/io.h:602:3: note: expanded from macro 'DEF_PCI_AC_NORET'
> __do_##name al;                                                    ^~~~~~~~~~~~~~
> <scratch space>:50:1: note: expanded from here
> __do_insw
> ^
> arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_insw'
> #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
> ~~~~~~~~~~~~~~~~~~~~~^
> In file included from fs/f2fs/super.c:12:
> In file included from include/linux/buffer_head.h:14:
> In file included from include/linux/pagemap.h:11:
> In file included from include/linux/highmem.h:10:
> In file included from include/linux/hardirq.h:9:
> In file included from arch/powerpc/include/asm/hardirq.h:6:
> In file included from include/linux/irq.h:20:
> In file included from include/linux/io.h:13:
> In file included from arch/powerpc/include/asm/io.h:605:
> arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/io.h:602:3: note: expanded from macro 'DEF_PCI_AC_NORET'
> __do_##name al;                                                    ^~~~~~~~~~~~~~
> <scratch space>:52:1: note: expanded from here
> __do_insl
> ^
> arch/powerpc/include/asm/io.h:544:56: note: expanded from macro '__do_insl'
> #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
> ~~~~~~~~~~~~~~~~~~~~~^
> In file included from fs/f2fs/super.c:12:
> In file included from include/linux/buffer_head.h:14:
> In file included from include/linux/pagemap.h:11:
> In file included from include/linux/highmem.h:10:
> In file included from include/linux/hardirq.h:9:
> In file included from arch/powerpc/include/asm/hardirq.h:6:
> In file included from include/linux/irq.h:20:
> In file included from include/linux/io.h:13:
> In file included from arch/powerpc/include/asm/io.h:605:
> arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/io.h:602:3: note: expanded from macro 'DEF_PCI_AC_NORET'
> __do_##name al;                                                    ^~~~~~~~~~~~~~
> <scratch space>:54:1: note: expanded from here
> __do_outsb
> ^
> arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_outsb'
> #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
> ~~~~~~~~~~~~~~~~~~~~~^
> In file included from fs/f2fs/super.c:12:
> In file included from include/linux/buffer_head.h:14:
> In file included from include/linux/pagemap.h:11:
> In file included from include/linux/highmem.h:10:
> In file included from include/linux/hardirq.h:9:
> In file included from arch/powerpc/include/asm/hardirq.h:6:
> In file included from include/linux/irq.h:20:
> In file included from include/linux/io.h:13:
> In file included from arch/powerpc/include/asm/io.h:605:
> arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/io.h:602:3: note: expanded from macro 'DEF_PCI_AC_NORET'
> __do_##name al;                                                    ^~~~~~~~~~~~~~
> <scratch space>:56:1: note: expanded from here
> __do_outsw
> ^
> arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_outsw'
> #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
> ~~~~~~~~~~~~~~~~~~~~~^
> In file included from fs/f2fs/super.c:12:
> In file included from include/linux/buffer_head.h:14:
> In file included from include/linux/pagemap.h:11:
> In file included from include/linux/highmem.h:10:
> In file included from include/linux/hardirq.h:9:
> In file included from arch/powerpc/include/asm/hardirq.h:6:
> In file included from include/linux/irq.h:20:
> In file included from include/linux/io.h:13:
> In file included from arch/powerpc/include/asm/io.h:605:
> arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/io.h:602:3: note: expanded from macro 'DEF_PCI_AC_NORET'
> __do_##name al;                                                    ^~~~~~~~~~~~~~
> <scratch space>:58:1: note: expanded from here
> __do_outsl
> ^
> arch/powerpc/include/asm/io.h:547:58: note: expanded from macro '__do_outsl'
> #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
> ~~~~~~~~~~~~~~~~~~~~~^
> >> fs/f2fs/super.c:3303:12: warning: stack frame size of 2064 bytes in function 'f2fs_fill_super' [-Wframe-larger-than=]
> static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> ^
> 13 warnings generated.
> 
> vim +/f2fs_fill_super +3303 fs/f2fs/super.c
> 
> 84b89e5d943d8d Jaegeuk Kim      2018-02-22  3302  
> aff063e266cbf4 Jaegeuk Kim      2012-11-02 @3303  static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3304  {
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3305  	struct f2fs_sb_info *sbi;
> da554e48caab95 hujianyang       2015-05-21  3306  	struct f2fs_super_block *raw_super;
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3307  	struct inode *root;
> 99e3e858a486cc Sheng Yong       2016-05-11  3308  	int err;
> aa2c8c43e4a5c2 Chao Yu          2019-02-19  3309  	bool skip_recovery = false, need_fsck = false;
> dabc4a5c60f796 Jaegeuk Kim      2015-01-23  3310  	char *options = NULL;
> e8240f656d4d5d Chao Yu          2015-12-15  3311  	int recovery, i, valid_super_block;
> 8f1dbbbbdfe9ba Shuoran Liu      2016-01-27  3312  	struct curseg_info *seg_i;
> aa2c8c43e4a5c2 Chao Yu          2019-02-19  3313  	int retry_cnt = 1;
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3314  
> ed2e621a95d704 Jaegeuk Kim      2014-08-08  3315  try_onemore:
> da554e48caab95 hujianyang       2015-05-21  3316  	err = -EINVAL;
> da554e48caab95 hujianyang       2015-05-21  3317  	raw_super = NULL;
> e8240f656d4d5d Chao Yu          2015-12-15  3318  	valid_super_block = -1;
> da554e48caab95 hujianyang       2015-05-21  3319  	recovery = 0;
> da554e48caab95 hujianyang       2015-05-21  3320  
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3321  	/* allocate memory for f2fs-specific super block info */
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3322  	sbi = kzalloc(sizeof(struct f2fs_sb_info), GFP_KERNEL);
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3323  	if (!sbi)
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3324  		return -ENOMEM;
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3325  
> df728b0f6954c3 Jaegeuk Kim      2016-03-23  3326  	sbi->sb = sb;
> df728b0f6954c3 Jaegeuk Kim      2016-03-23  3327  
> 43b6573bac95d7 Keith Mok        2016-03-02  3328  	/* Load the checksum driver */
> 43b6573bac95d7 Keith Mok        2016-03-02  3329  	sbi->s_chksum_driver = crypto_alloc_shash("crc32", 0, 0);
> 43b6573bac95d7 Keith Mok        2016-03-02  3330  	if (IS_ERR(sbi->s_chksum_driver)) {
> dcbb4c10e6d969 Joe Perches      2019-06-18  3331  		f2fs_err(sbi, "Cannot load crc32 driver.");
> 43b6573bac95d7 Keith Mok        2016-03-02  3332  		err = PTR_ERR(sbi->s_chksum_driver);
> 43b6573bac95d7 Keith Mok        2016-03-02  3333  		sbi->s_chksum_driver = NULL;
> 43b6573bac95d7 Keith Mok        2016-03-02  3334  		goto free_sbi;
> 43b6573bac95d7 Keith Mok        2016-03-02  3335  	}
> 43b6573bac95d7 Keith Mok        2016-03-02  3336  
> ff9234ad4e9747 Namjae Jeon      2013-01-12  3337  	/* set a block size */
> 6bacf52fb58aeb Jaegeuk Kim      2013-12-06  3338  	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
> dcbb4c10e6d969 Joe Perches      2019-06-18  3339  		f2fs_err(sbi, "unable to set blocksize");
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3340  		goto free_sbi;
> a07ef784356cf9 Namjae Jeon      2012-12-30  3341  	}
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3342  
> df728b0f6954c3 Jaegeuk Kim      2016-03-23  3343  	err = read_raw_super_block(sbi, &raw_super, &valid_super_block,
> e8240f656d4d5d Chao Yu          2015-12-15  3344  								&recovery);
> c0d39e65ba3243 Namjae Jeon      2013-03-17  3345  	if (err)
> 9076a75f8e0f23 Gu Zheng         2013-10-14  3346  		goto free_sbi;
> 9076a75f8e0f23 Gu Zheng         2013-10-14  3347  
> 5fb08372a68936 Gu Zheng         2013-06-07  3348  	sb->s_fs_info = sbi;
> 52763a4b7a2112 Jaegeuk Kim      2016-06-13  3349  	sbi->raw_super = raw_super;
> 52763a4b7a2112 Jaegeuk Kim      2016-06-13  3350  
> 704956ecf5bcdc Chao Yu          2017-07-31  3351  	/* precompute checksum seed for metadata */
> 7beb01f74415c5 Chao Yu          2018-10-24  3352  	if (f2fs_sb_has_inode_chksum(sbi))
> 704956ecf5bcdc Chao Yu          2017-07-31  3353  		sbi->s_chksum_seed = f2fs_chksum(sbi, ~0, raw_super->uuid,
> 704956ecf5bcdc Chao Yu          2017-07-31  3354  						sizeof(raw_super->uuid));
> 704956ecf5bcdc Chao Yu          2017-07-31  3355  
> d1b959c8770260 Damien Le Moal   2016-10-28  3356  	/*
> d1b959c8770260 Damien Le Moal   2016-10-28  3357  	 * The BLKZONED feature indicates that the drive was formatted with
> d1b959c8770260 Damien Le Moal   2016-10-28  3358  	 * zone alignment optimization. This is optional for host-aware
> d1b959c8770260 Damien Le Moal   2016-10-28  3359  	 * devices, but mandatory for host-managed zoned block devices.
> d1b959c8770260 Damien Le Moal   2016-10-28  3360  	 */
> d1b959c8770260 Damien Le Moal   2016-10-28  3361  #ifndef CONFIG_BLK_DEV_ZONED
> 7beb01f74415c5 Chao Yu          2018-10-24  3362  	if (f2fs_sb_has_blkzoned(sbi)) {
> dcbb4c10e6d969 Joe Perches      2019-06-18  3363  		f2fs_err(sbi, "Zoned block device support is not enabled");
> 1727f317219bfc Chao Yu          2017-06-12  3364  		err = -EOPNOTSUPP;
> d1b959c8770260 Damien Le Moal   2016-10-28  3365  		goto free_sb_buf;
> d1b959c8770260 Damien Le Moal   2016-10-28  3366  	}
> d1b959c8770260 Damien Le Moal   2016-10-28  3367  #endif
> 498c5e9fcd10c8 Yunlei He        2015-05-07  3368  	default_options(sbi);
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3369  	/* parse mount options */
> dabc4a5c60f796 Jaegeuk Kim      2015-01-23  3370  	options = kstrdup((const char *)data, GFP_KERNEL);
> dabc4a5c60f796 Jaegeuk Kim      2015-01-23  3371  	if (data && !options) {
> dabc4a5c60f796 Jaegeuk Kim      2015-01-23  3372  		err = -ENOMEM;
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3373  		goto free_sb_buf;
> dabc4a5c60f796 Jaegeuk Kim      2015-01-23  3374  	}
> dabc4a5c60f796 Jaegeuk Kim      2015-01-23  3375  
> dabc4a5c60f796 Jaegeuk Kim      2015-01-23  3376  	err = parse_options(sb, options);
> dabc4a5c60f796 Jaegeuk Kim      2015-01-23  3377  	if (err)
> dabc4a5c60f796 Jaegeuk Kim      2015-01-23  3378  		goto free_options;
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3379  
> e0afc4d6d0d3e7 Chao Yu          2015-12-31  3380  	sbi->max_file_blocks = max_file_blocks();
> e0afc4d6d0d3e7 Chao Yu          2015-12-31  3381  	sb->s_maxbytes = sbi->max_file_blocks <<
> e0afc4d6d0d3e7 Chao Yu          2015-12-31  3382  				le32_to_cpu(raw_super->log_blocksize);
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3383  	sb->s_max_links = F2FS_LINK_MAX;
> aff063e266cbf4 Jaegeuk Kim      2012-11-02  3384  
> 5aba54302a46fd Daniel Rosenberg 2019-07-23  3385  	err = f2fs_setup_casefold(sbi);
> 5aba54302a46fd Daniel Rosenberg 2019-07-23  3386  	if (err)
> 5aba54302a46fd Daniel Rosenberg 2019-07-23  3387  		goto free_options;
> 5aba54302a46fd Daniel Rosenberg 2019-07-23  3388  
> 
> :::::: The code at line 3303 was first introduced by commit
> :::::: aff063e266cbf4754021d8e5d16ee418560906fd f2fs: add super block operations
> 
> :::::: TO: Jaegeuk Kim <jaegeuk.kim@samsung.com>
> :::::: CC: Jaegeuk Kim <jaegeuk.kim@samsung.com>
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

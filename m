Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0CF79E5B5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Sep 2023 13:04:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qgNfq-0007g1-6T;
	Wed, 13 Sep 2023 11:04:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1qgNfg-0007fb-O5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Sep 2023 11:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dmdW6YsXchx4F9Fn3hDDJ7YMBCPw39gioeTMl2XDJf8=; b=eAG+9RCFo/98VIn3h0/rr/mwZ2
 pUX1y2v4wP1V/fixXVUY95Kh1pUvituglj83gTBtr/tbCglsFmgx2qyJvoW1qA7StRIOtWeNllAad
 ZeeicxLgKmhYgywM13jGg4Oo6mZQBEr10L/qHhjccJmWRSypoAELjjcvzZvIgZAmA2Ps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dmdW6YsXchx4F9Fn3hDDJ7YMBCPw39gioeTMl2XDJf8=; b=I
 UjBTIfatWUtF9umnGjj16U0IafQHqRDtad3Okz4pYEq4WuILZI0JWqFYf3J1lGyDJnDS8C6PStVds
 A3fbZrFzrEedoyYWEbjP7y2prsFVv1oUt+0wLsORh278p6e4LtL3rIvQG5cM/+WC7hooxyS/eI7M5
 Zj7O5r9xw+wlzOnI=;
Received: from mgamail.intel.com ([192.55.52.88])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qgNfc-0001zZ-Ui for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Sep 2023 11:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694603073; x=1726139073;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=o75pkzL8hE8MlB27drtG7HJ970mpOPOXAgZVWPdc4eQ=;
 b=EMg3G7BtMSchO+wr5d83nFPvkWxhqJsnEGrFzutS5DiWJS9F11OIstK8
 8I2NMPjclpKxLjT74dsOxpMM6wewN62lXR0g6a01Jc6yz+eHs6IgnEC4p
 eX/aX5qGFKmIg7NvZjewQbvSqQ54Shc0A+M9j+mnpkQD4YXyQoP9DMMkQ
 XN5EaSoIbip3eZA7MGMGorAew8vTnDydiEG6e43Ji1Y6nVWoZJXdeJ7A9
 BUDDDfleo5dSuDnVhm7yY4wRwxYePYi2BeRY0V5Th4jG3QXYN6/j3mUdZ
 tjJB+DX5WfPJtzp3nb3b6IXISS1JB0e02Y81+r0MlGa6Lb7ylKB0Hkvws w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409578292"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="409578292"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 04:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="1074910277"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="1074910277"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 13 Sep 2023 04:04:24 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qgNfR-0000Qj-19;
 Wed, 13 Sep 2023 11:04:21 +0000
Date: Wed, 13 Sep 2023 19:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <202309131837.F3EVkv15-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 67dadd6ef509ed922ec667ef6b0ef0cdbb2fe04c commit:
 e152f298a65c86ab89200d2d32132ab359c66a3c
 [8/9] f2fs: Support Bloc [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.88 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qgNfc-0001zZ-Ui
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 8/9] fs/f2fs/inode.c:320:7:
 warning: format specifies type 'size_t' (aka 'unsigned int') but the
 argument has type 'unsigned long'
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, llvm@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   67dadd6ef509ed922ec667ef6b0ef0cdbb2fe04c
commit: e152f298a65c86ab89200d2d32132ab359c66a3c [8/9] f2fs: Support Block Size == Page Size
config: arm-randconfig-r032-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131837.F3EVkv15-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131837.F3EVkv15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131837.F3EVkv15-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/inode.c:320:7: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     320 |                         f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
         |                                                                                                         ~~~
         |                                                                                                         %lu
     321 |                                   __func__, inode->i_ino, fi->i_inline_xattr_size,
     322 |                                   MAX_INLINE_XATTR_SIZE);
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2321:39: note: expanded from macro 'f2fs_warn'
    2321 |         f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
   fs/f2fs/xattr.h:88:4: note: expanded from macro 'MAX_INLINE_XATTR_SIZE'
      88 |                         (DEF_ADDRS_PER_INODE -                          \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      89 |                         F2FS_TOTAL_EXTRA_ATTR_SIZE / sizeof(__le32) -   \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      90 |                         DEF_INLINE_RESERVED_SIZE -                      \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      91 |                         MIN_INLINE_DENTRY_SIZE / sizeof(__le32))
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +320 fs/f2fs/inode.c

698a5c8c8e0559 Yangtao Li   2023-04-08  278  
e34438c903b653 Chao Yu      2018-06-29  279  static bool sanity_check_inode(struct inode *inode, struct page *node_page)
5d64600d4f337d Jaegeuk Kim  2018-04-24  280  {
5d64600d4f337d Jaegeuk Kim  2018-04-24  281  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
18dd6470c2d14d Chao Yu      2018-07-08  282  	struct f2fs_inode_info *fi = F2FS_I(inode);
4c8ff7095bef64 Chao Yu      2019-11-01  283  	struct f2fs_inode *ri = F2FS_INODE(node_page);
e34438c903b653 Chao Yu      2018-06-29  284  	unsigned long long iblocks;
e34438c903b653 Chao Yu      2018-06-29  285  
e34438c903b653 Chao Yu      2018-06-29  286  	iblocks = le64_to_cpu(F2FS_INODE(node_page)->i_blocks);
e34438c903b653 Chao Yu      2018-06-29  287  	if (!iblocks) {
dcbb4c10e6d969 Joe Perches  2019-06-18  288  		f2fs_warn(sbi, "%s: corrupted inode i_blocks i_ino=%lx iblocks=%llu, run fsck to fix.",
e34438c903b653 Chao Yu      2018-06-29  289  			  __func__, inode->i_ino, iblocks);
e34438c903b653 Chao Yu      2018-06-29  290  		return false;
e34438c903b653 Chao Yu      2018-06-29  291  	}
e34438c903b653 Chao Yu      2018-06-29  292  
e34438c903b653 Chao Yu      2018-06-29  293  	if (ino_of_node(node_page) != nid_of_node(node_page)) {
dcbb4c10e6d969 Joe Perches  2019-06-18  294  		f2fs_warn(sbi, "%s: corrupted inode footer i_ino=%lx, ino,nid: [%u, %u] run fsck to fix.",
e34438c903b653 Chao Yu      2018-06-29  295  			  __func__, inode->i_ino,
e34438c903b653 Chao Yu      2018-06-29  296  			  ino_of_node(node_page), nid_of_node(node_page));
e34438c903b653 Chao Yu      2018-06-29  297  		return false;
e34438c903b653 Chao Yu      2018-06-29  298  	}
5d64600d4f337d Jaegeuk Kim  2018-04-24  299  
f240d3aaf5a155 Chao Yu      2023-05-31  300  	if (f2fs_has_extra_attr(inode)) {
f240d3aaf5a155 Chao Yu      2023-05-31  301  		if (!f2fs_sb_has_extra_attr(sbi)) {
dcbb4c10e6d969 Joe Perches  2019-06-18  302  			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
76d56d4ab4f2a9 Chao Yu      2018-06-25  303  				  __func__, inode->i_ino);
76d56d4ab4f2a9 Chao Yu      2018-06-25  304  			return false;
76d56d4ab4f2a9 Chao Yu      2018-06-25  305  		}
18dd6470c2d14d Chao Yu      2018-07-08  306  		if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
f240d3aaf5a155 Chao Yu      2023-05-31  307  			fi->i_extra_isize < F2FS_MIN_EXTRA_ATTR_SIZE ||
18dd6470c2d14d Chao Yu      2018-07-08  308  			fi->i_extra_isize % sizeof(__le32)) {
dcbb4c10e6d969 Joe Perches  2019-06-18  309  			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
18dd6470c2d14d Chao Yu      2018-07-08  310  				  __func__, inode->i_ino, fi->i_extra_isize,
18dd6470c2d14d Chao Yu      2018-07-08  311  				  F2FS_TOTAL_EXTRA_ATTR_SIZE);
18dd6470c2d14d Chao Yu      2018-07-08  312  			return false;
18dd6470c2d14d Chao Yu      2018-07-08  313  		}
f240d3aaf5a155 Chao Yu      2023-05-31  314  		if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
dd6c89b5f2b93c Chao Yu      2019-03-04  315  			f2fs_has_inline_xattr(inode) &&
dd6c89b5f2b93c Chao Yu      2019-03-04  316  			(!fi->i_inline_xattr_size ||
dd6c89b5f2b93c Chao Yu      2019-03-04  317  			fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
dcbb4c10e6d969 Joe Perches  2019-06-18  318  			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
dd6c89b5f2b93c Chao Yu      2019-03-04  319  				  __func__, inode->i_ino, fi->i_inline_xattr_size,
dd6c89b5f2b93c Chao Yu      2019-03-04 @320  				  MAX_INLINE_XATTR_SIZE);
dd6c89b5f2b93c Chao Yu      2019-03-04  321  			return false;
dd6c89b5f2b93c Chao Yu      2019-03-04  322  		}
f240d3aaf5a155 Chao Yu      2023-05-31  323  		if (f2fs_sb_has_compression(sbi) &&
f240d3aaf5a155 Chao Yu      2023-05-31  324  			fi->i_flags & F2FS_COMPR_FL &&
f240d3aaf5a155 Chao Yu      2023-05-31  325  			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
f240d3aaf5a155 Chao Yu      2023-05-31  326  						i_compress_flag)) {
f240d3aaf5a155 Chao Yu      2023-05-31  327  			if (!sanity_check_compress_inode(inode, ri))
f240d3aaf5a155 Chao Yu      2023-05-31  328  				return false;
f240d3aaf5a155 Chao Yu      2023-05-31  329  		}
f240d3aaf5a155 Chao Yu      2023-05-31  330  	} else if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
f240d3aaf5a155 Chao Yu      2023-05-31  331  		f2fs_warn(sbi, "%s: corrupted inode ino=%lx, run fsck to fix.",
f240d3aaf5a155 Chao Yu      2023-05-31  332  			  __func__, inode->i_ino);
f240d3aaf5a155 Chao Yu      2023-05-31  333  		return false;
f240d3aaf5a155 Chao Yu      2023-05-31  334  	}
f240d3aaf5a155 Chao Yu      2023-05-31  335  
f240d3aaf5a155 Chao Yu      2023-05-31  336  	if (!f2fs_sb_has_extra_attr(sbi)) {
f240d3aaf5a155 Chao Yu      2023-05-31  337  		if (f2fs_sb_has_project_quota(sbi)) {
f240d3aaf5a155 Chao Yu      2023-05-31  338  			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
f240d3aaf5a155 Chao Yu      2023-05-31  339  				  __func__, inode->i_ino, F2FS_FEATURE_PRJQUOTA);
f240d3aaf5a155 Chao Yu      2023-05-31  340  			return false;
f240d3aaf5a155 Chao Yu      2023-05-31  341  		}
f240d3aaf5a155 Chao Yu      2023-05-31  342  		if (f2fs_sb_has_inode_chksum(sbi)) {
f240d3aaf5a155 Chao Yu      2023-05-31  343  			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
f240d3aaf5a155 Chao Yu      2023-05-31  344  				  __func__, inode->i_ino, F2FS_FEATURE_INODE_CHKSUM);
f240d3aaf5a155 Chao Yu      2023-05-31  345  			return false;
f240d3aaf5a155 Chao Yu      2023-05-31  346  		}
f240d3aaf5a155 Chao Yu      2023-05-31  347  		if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
f240d3aaf5a155 Chao Yu      2023-05-31  348  			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
f240d3aaf5a155 Chao Yu      2023-05-31  349  				  __func__, inode->i_ino, F2FS_FEATURE_FLEXIBLE_INLINE_XATTR);
f240d3aaf5a155 Chao Yu      2023-05-31  350  			return false;
f240d3aaf5a155 Chao Yu      2023-05-31  351  		}
f240d3aaf5a155 Chao Yu      2023-05-31  352  		if (f2fs_sb_has_inode_crtime(sbi)) {
f240d3aaf5a155 Chao Yu      2023-05-31  353  			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
f240d3aaf5a155 Chao Yu      2023-05-31  354  				  __func__, inode->i_ino, F2FS_FEATURE_INODE_CRTIME);
f240d3aaf5a155 Chao Yu      2023-05-31  355  			return false;
f240d3aaf5a155 Chao Yu      2023-05-31  356  		}
f240d3aaf5a155 Chao Yu      2023-05-31  357  		if (f2fs_sb_has_compression(sbi)) {
f240d3aaf5a155 Chao Yu      2023-05-31  358  			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
f240d3aaf5a155 Chao Yu      2023-05-31  359  				  __func__, inode->i_ino, F2FS_FEATURE_COMPRESSION);
f240d3aaf5a155 Chao Yu      2023-05-31  360  			return false;
f240d3aaf5a155 Chao Yu      2023-05-31  361  		}
f240d3aaf5a155 Chao Yu      2023-05-31  362  	}
dd6c89b5f2b93c Chao Yu      2019-03-04  363  
677a82b44ebf26 Chao Yu      2022-05-18  364  	if (f2fs_sanity_check_inline_data(inode)) {
dcbb4c10e6d969 Joe Perches  2019-06-18  365  		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
bcbfbd604dcba4 Chao Yu      2018-06-29  366  			  __func__, inode->i_ino, inode->i_mode);
bcbfbd604dcba4 Chao Yu      2018-06-29  367  		return false;
bcbfbd604dcba4 Chao Yu      2018-06-29  368  	}
bcbfbd604dcba4 Chao Yu      2018-06-29  369  
bcbfbd604dcba4 Chao Yu      2018-06-29  370  	if (f2fs_has_inline_dentry(inode) && !S_ISDIR(inode->i_mode)) {
dcbb4c10e6d969 Joe Perches  2019-06-18  371  		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_dentry, run fsck to fix",
bcbfbd604dcba4 Chao Yu      2018-06-29  372  			  __func__, inode->i_ino, inode->i_mode);
bcbfbd604dcba4 Chao Yu      2018-06-29  373  		return false;
bcbfbd604dcba4 Chao Yu      2018-06-29  374  	}
bcbfbd604dcba4 Chao Yu      2018-06-29  375  
f6322f3f1212e0 Eric Biggers 2020-10-08  376  	if ((fi->i_flags & F2FS_CASEFOLD_FL) && !f2fs_sb_has_casefold(sbi)) {
f6322f3f1212e0 Eric Biggers 2020-10-08  377  		f2fs_warn(sbi, "%s: inode (ino=%lx) has casefold flag, but casefold feature is off",
f6322f3f1212e0 Eric Biggers 2020-10-08  378  			  __func__, inode->i_ino);
f6322f3f1212e0 Eric Biggers 2020-10-08  379  		return false;
f6322f3f1212e0 Eric Biggers 2020-10-08  380  	}
f6322f3f1212e0 Eric Biggers 2020-10-08  381  
5d64600d4f337d Jaegeuk Kim  2018-04-24  382  	return true;
5d64600d4f337d Jaegeuk Kim  2018-04-24  383  }
5d64600d4f337d Jaegeuk Kim  2018-04-24  384  

:::::: The code at line 320 was first introduced by commit
:::::: dd6c89b5f2b93ceced4111e7b69d4efd8c312713 f2fs: fix to do sanity check with inode.i_inline_xattr_size

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

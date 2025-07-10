Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE5AFFAA8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 09:18:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S+h/OGRBAWHgVaGx6gmCwDM6vG8hDI9f0t/8E8I+mDg=; b=ZMOgnNQ/qf8cKiV30oS6aneNuI
	qRofOkESGkGxGx8d7qKdRBGOlbKjE1xhph9kYHkBJujMxjdeDXgtszbH9YHiDTlKpifdi7LpEEBvV
	MdbAdaZemf3dzwUIJicIj2xBWCA/fhotUQBslY81qf+ucEDEcytO0/duZ5DOq5+Zez98=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZlYH-0006Qj-Tb;
	Thu, 10 Jul 2025 07:18:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1uZlYG-0006Qc-L3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 07:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a+eIfSNqkd0NhsyBmCH4WlBYuZ65cOoNm5RWc3I+GWA=; b=eD5P54vR3dSYFsIwj4Cqvcs6Z3
 SIs578YTogBzTpRBhA7UCGhzWS6+9xdz1anYhW8CfAkPO+kMNfOPMYR6lhjbP613JHPcjeTKPGvxG
 srzawvqMQJosQGFCpKBMhgRzDFfHvqTJNt46MZ4Bnifwu1EeqahI/lSbRQJjhvx+vuPc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a+eIfSNqkd0NhsyBmCH4WlBYuZ65cOoNm5RWc3I+GWA=; b=B
 ZutjXiDhaLkz2kSc1uWExaM53y1cViVvFiTj3Ve/4QCfn8R9Aax4hWNOaY9njbd7o/bREQc3flBs5
 JSQ01VW4wOYhLb4GnqOsI4a2wSr7z47QNjRbcd0mp912NGUqk6qOlj9Ja5EhKajUuDvwMinWUGtGd
 hJ0QcBWxglgnMGOM=;
Received: from mgamail.intel.com ([198.175.65.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZlYG-0004Kh-1L for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 07:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752131920; x=1783667920;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=3DN4pKgaetx6w60UiqUaI5FlT4cSG/d2uDOewryM/k8=;
 b=gfRSxc5D8mAcmpTugohAS3cIy32P7yp1WEjq41Dx2gYRr5+Hdig02SbA
 PnAfGqF8wcSZoefOWFBjH7c7tAhG5y/nj1JZHl64Sm7pEDfJ5vEf7crlr
 pIVi0RpMuajaQ6fxl4954qZYGxQGHOCggyeejdsk2eX+TmYnK56Q06RYb
 OpvDZB/J3C74hhhisnC4t4/KwQtjEwuO2hfO8JWWE0nXG+I8Ohpamgd2M
 GeDcE+T8bOh2ECCN8voPelykKtPbPlAAcS/Iwm6V2r7vbLgeewMe+g3QA
 4/sE7A28dkvgJZkvASEzoC/XyXCmij3Mlf6nnMGzqDbZ6ww/kFfTd/0MI Q==;
X-CSE-ConnectionGUID: x6hMGj8lTNyG8SO6KQnaoA==
X-CSE-MsgGUID: dwu40CYiTX+cguau+CzD0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65854745"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="65854745"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:18:30 -0700
X-CSE-ConnectionGUID: wjygWLF1RoqA/piQU+fS7Q==
X-CSE-MsgGUID: HU1/jqVATlGFg9vfrvM+Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156727716"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2025 00:18:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uZlY1-0004f3-1u;
 Thu, 10 Jul 2025 07:18:25 +0000
Date: Thu, 10 Jul 2025 15:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <202507101514.gTDqNbBm-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: bc8610a18daa4a611d189374031fe1fa3c603423 commit:
 9f506c758707749076b4ec2402007670c6f35558
 [65/93] f2fs: Use a foli [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZlYG-0004Kh-1L
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 65/93] fs/f2fs/data.c:58:70:
 warning: passing argument 1 of 'fscrypt_pagecache_folio' discards 'const'
 qualifier from pointer target type
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   bc8610a18daa4a611d189374031fe1fa3c603423
commit: 9f506c758707749076b4ec2402007670c6f35558 [65/93] f2fs: Use a folio in f2fs_is_cp_guaranteed()
config: i386-buildonly-randconfig-001-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101514.gTDqNbBm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101514.gTDqNbBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101514.gTDqNbBm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_is_cp_guaranteed':
>> fs/f2fs/data.c:58:70: warning: passing argument 1 of 'fscrypt_pagecache_folio' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
         |                                                                      ^~~~~
   In file included from fs/f2fs/f2fs.h:28,
                    from fs/f2fs/data.c:24:
   include/linux/fscrypt.h:527:67: note: expected 'struct folio *' but argument is of type 'const struct folio *'
     527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
         |                                                     ~~~~~~~~~~~~~~^~~~~~~~~~~~


vim +58 fs/f2fs/data.c

    49	
    50	bool f2fs_is_cp_guaranteed(const struct page *page)
    51	{
    52		const struct folio *folio = page_folio(page);
    53		struct address_space *mapping = folio->mapping;
    54		struct inode *inode;
    55		struct f2fs_sb_info *sbi;
    56	
    57		if (fscrypt_is_bounce_folio(folio))
  > 58			return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
    59	
    60		inode = mapping->host;
    61		sbi = F2FS_I_SB(inode);
    62	
    63		if (inode->i_ino == F2FS_META_INO(sbi) ||
    64				inode->i_ino == F2FS_NODE_INO(sbi) ||
    65				S_ISDIR(inode->i_mode))
    66			return true;
    67	
    68		if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
    69				folio_test_f2fs_gcing(folio))
    70			return true;
    71		return false;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

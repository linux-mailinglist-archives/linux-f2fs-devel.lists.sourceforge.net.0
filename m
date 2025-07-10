Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3BAFFAA7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 09:18:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=awgFhoZgQTHlIiSKnr1xbogQKF4k0aKgihkWh/69gdw=; b=U9Es4n0ZISD54ovKfaEnuTT5Iq
	k6nrAlxOePeb8Xj0hJ7DZ5oaXFIgwGVuOLVbk2pcbdncx6lTYtm8bgbyCDBg+KYs6Fq2Lp+PA4Zcu
	rDew2SziDvcxUZnsvteyKQ9FE2u9btiCbuU2hEezUtiA2vzz+W3BX8pClqmgWZTSH1DI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZlYJ-0004iZ-BX;
	Thu, 10 Jul 2025 07:18:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1uZlYH-0004iF-C7
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 07:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a6UYQY1uZr7GnK+O9HvDGB71a3lhCAAkwDsP1oXN+Vw=; b=nBBAxJDAHkof6xePZrXv2JuJAs
 dB5CrtQbiOYGr2XNspjyNqieWvGhG6eoxdYnvW8KJK0FcRrMzEDGaVUSwZpjWAfdRxON+56bVSMtI
 nUxFPAlxEzydxlZ6xWkr9+Hob3Ecral91Plz2GGXU0uIVX+VTRjNIMwRhG/T1lgwqZvs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a6UYQY1uZr7GnK+O9HvDGB71a3lhCAAkwDsP1oXN+Vw=; b=W
 cGGmAxOl70VW2w3GlkIq5sryzp3CPOBeNaVO+OEh8dnMmVfbqgUGDx4l2Z3DgYg1um/mS9xPVyFZg
 AAmqB5qe504UKum4dm+Eb+bKN9sE6jF4fgK0l4AsZE4Pf+DUnHrdzREwBIATSyhiPSV8kan5TgOuw
 Mu/65k/hwvfrmwKk=;
Received: from mgamail.intel.com ([198.175.65.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZlYG-0004Kh-Ni for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 07:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752131920; x=1783667920;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=KCIJ9MRY/XQnVYRAuimMORPAQ2dSU6Y7v2W7uF7Vlj0=;
 b=mW7GUrKrEYLtFyftl3ks301y+rGY6YHkPZm8SWfZ2vPibxNHtK3mkyep
 SsAhYb/WsMMFimJJr9J02zRbUBkUCX//eN7piL6uGE2S5iPaSgyep0jPP
 d6rzXlP1EBXN7E5uroHja6z15tPNCiC8h5cwmWVN/CAP2JtDd61nqO9FU
 HIqv2kjbyEkRm4y/YTKwWTa217UuPFDqDsY3ckyJ/jhH2d8aXma2De0tH
 J2vBIHXNfx9UQ5HrPM27JKoELDrVX3ghEq85AEeYTLSbTB3TrzTWwVY3E
 7fRQn//eLX89GDevMNiMxkepc/trF49zCodLAqvHw1O2uJiQkhoglIvNW Q==;
X-CSE-ConnectionGUID: PvWlp/ZmQiidYTtJ8BeDOg==
X-CSE-MsgGUID: GBp5BlovTvqHfSWtOxxFgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65854746"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="65854746"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:18:30 -0700
X-CSE-ConnectionGUID: VKfc2npuQ0ORH8regQGDbA==
X-CSE-MsgGUID: EG3YYGzMSFic7bgwKrMQJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156727715"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2025 00:18:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uZlY1-0004f1-1r;
 Thu, 10 Jul 2025 07:18:25 +0000
Date: Thu, 10 Jul 2025 15:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <202507101412.50ND2WEX-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZlYG-0004Kh-Ni
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 65/93] fs/f2fs/data.c:58:56:
 error: passing 'const struct folio *' to parameter of type 'struct folio *'
 discards qualifiers
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
head:   bc8610a18daa4a611d189374031fe1fa3c603423
commit: 9f506c758707749076b4ec2402007670c6f35558 [65/93] f2fs: Use a folio in f2fs_is_cp_guaranteed()
config: s390-randconfig-002-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101412.50ND2WEX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101412.50ND2WEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101412.50ND2WEX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
         |                                                                      ^~~~~
   include/linux/fscrypt.h:527:67: note: passing argument to parameter 'bounce_folio' here
     527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
         |                                                                   ^
   1 error generated.


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

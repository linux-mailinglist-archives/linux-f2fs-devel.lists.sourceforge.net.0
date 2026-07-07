Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wRjQKlS5TGr7ogEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Jul 2026 10:31:16 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE9E719207
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Jul 2026 10:31:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="K9v/QS3N";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fKu5szRy;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="j8/tOKgh";
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=ITWrqkWP;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=intel.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQ4XsW0d4355WXxgnGfpAATYZRgKgqbja8mRnba2OOE=; b=K9v/QS3NAEbNTa0lnJs/hHGnDt
	6qtiijD9Qe5QkIImQk38qZnciLIiUcqaFfkjzkko2qfdR8g0Qrb18M7YUlTzcuCI0GA6WlDK7B+Tx
	1CBxrbK2h9tOlccAJ7fEVN2I92E6VKWKZFvcCcwcGIaH7qAYw54kMydRP2BV0jo2fjOg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wh1Cq-000179-9C;
	Tue, 07 Jul 2026 08:31:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1wh1CX-00016i-Gv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 08:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oY6mpHaIocZBbxsm3nug/4tZcqB9u0RPYtP30PYOPvM=; b=fKu5szRyqDWUjFZABfINzZVa6N
 w6o6PzlLnN2q2c9AF1f35aPFkyKzhIArtdDN9Ah+Y3Cqp6q3itF0xZOMOWf9VeAkFm1miXFyIv2jB
 cRtxNIIgtA4dCZHb305XcNjjnFP/Or7KcPntb/x6f0Ipgb6WrOqiJmrn5olXB4Q6HM5o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oY6mpHaIocZBbxsm3nug/4tZcqB9u0RPYtP30PYOPvM=; b=j8/tOKghBdpNHMmrfkEUUPHM39
 hR75m1yrPyMupO6vTqzHvxTg9w4w/ihk41poINiYaz6ePoly7gD8Sdd8oLLeJm49H0gyCISiO1Ct3
 aa64IU4bVa+Y9xrfONR6SgrwR4bITVgpQ0GDC3VRcwuhjfxZmse7i2yfGZQcX5q+ShP8=;
Received: from mgamail.intel.com ([192.198.163.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wh1CV-0007yI-8d for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 08:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783413043; x=1814949043;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nP5SS8TSn5a1GQ/GBM9vcN4zxKMjiK9AstDAgspH3Ms=;
 b=ITWrqkWPxUzF0flDZiXBvljO6lFJoNI1bEPY0QG9LjynTtL6msVzwvbi
 qGoRdFpp8f2o0gw/9a6ID3jwnVtr3vQrXMhDC85n396/LtwD4xLgS5S0J
 Yz6/6A0Z6dOURZwOsTa2pLCUGbvyRQ7j7Xc8ingUq2t4069jKVD9v9JOl
 g4fPVUyWk7ovOF6OS7Ls/ioygf9waJz12WOfvSULcJJwhSSI9V9rU2GKA
 /wm+TyV5NpX5i29+xAygOqHqh6kcHEN59j/WhoeiQYcA0xleSqWmKzU+G
 eVGeGEH/h17YflacLgKX0ltL3eIlkaX8wIF5LTK9m6KgkkjYB60B/WzIk w==;
X-CSE-ConnectionGUID: 8uQuvZs4S4ypLOV6GcE79A==
X-CSE-MsgGUID: 2WbjhEedR6ysC7ovRMA6ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83031795"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="83031795"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 01:30:33 -0700
X-CSE-ConnectionGUID: LZSYVUCuQJyacjLdi8uxMg==
X-CSE-MsgGUID: dM7jaC+ZThG2ZHIge1VmMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="254588886"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 07 Jul 2026 01:30:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wh1Bt-00000000F9t-3HG1;
 Tue, 07 Jul 2026 08:30:06 +0000
Date: Tue, 7 Jul 2026 16:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yonggil Song <yonggil.song@samsung.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
Message-ID: <202607071623.ZxOpKv3S-lkp@intel.com>
References: <20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe@epcms2p1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe@epcms2p1>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yonggil, kernel test robot noticed the following build
 warnings: [auto build test WARNING on
 cb8ff3ead9a3fc43727980be58c7099506f65261]
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wh1CV-0007yI-8d
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce gcless mount option to avoid
 foreground GC
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 llvm@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, oe-kbuild-all@lists.linux.dev,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yonggil.song@samsung.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:llvm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:oe-kbuild-all@lists.linux.dev,m:sukka.kim@samsung.com,m:dongjin_.kim@samsung.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,intel.com:s=Intel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,intel.com:-];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:from_mime,intel.com:email,intel.com:mid,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEE9E719207

Hi Yonggil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb8ff3ead9a3fc43727980be58c7099506f65261]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonggil-Song/f2fs-introduce-gcless-mount-option-to-avoid-foreground-GC/20260706-154229
base:   cb8ff3ead9a3fc43727980be58c7099506f65261
patch link:    https://lore.kernel.org/r/20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe%40epcms2p1
patch subject: [PATCH] f2fs: introduce gcless mount option to avoid foreground GC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260707/202607071623.ZxOpKv3S-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607071623.ZxOpKv3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607071623.ZxOpKv3S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:14:
>> fs/f2fs/f2fs.h:2945:4: warning: shift count >= width of type [-Wshift-count-overflow]
    2945 |                         test_opt(sbi, RESERVE_NODE));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/f2fs/dir.c:14:
   fs/f2fs/f2fs.h:2953:6: warning: shift count >= width of type [-Wshift-count-overflow]
    2953 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   2 warnings generated.
--
   In file included from fs/f2fs/super.c:33:
>> fs/f2fs/f2fs.h:2945:4: warning: shift count >= width of type [-Wshift-count-overflow]
    2945 |                         test_opt(sbi, RESERVE_NODE));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/f2fs/super.c:33:
   fs/f2fs/f2fs.h:2953:6: warning: shift count >= width of type [-Wshift-count-overflow]
    2953 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
>> fs/f2fs/super.c:520:6: warning: shift count >= width of type [-Wshift-count-overflow]
     520 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:526:39: warning: shift count >= width of type [-Wshift-count-overflow]
     526 |         if (!test_opt(sbi, RESERVE_ROOT) && !test_opt(sbi, RESERVE_NODE) &&
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:1528:6: warning: shift count >= width of type [-Wshift-count-overflow]
    1528 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:1529:21: warning: shift count >= width of type [-Wshift-count-overflow]
    1529 |                         (ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_NODE)) &&
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:1534:21: warning: shift count >= width of type [-Wshift-count-overflow]
    1534 |                 ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_NODE);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:2475:37: warning: shift count >= width of type [-Wshift-count-overflow]
    2475 |         if (test_opt(sbi, RESERVE_ROOT) || test_opt(sbi, RESERVE_NODE))
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:150:26: note: expanded from macro 'test_opt'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   8 warnings generated.


vim +2945 fs/f2fs/f2fs.h

e48e16f3e37fac Daeho Jeong 2026-01-10  2916  
3bac20a8f011b8 Jaegeuk Kim 2022-11-30  2917  extern void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync);
0abd675e97e60d Chao Yu     2017-07-09  2918  static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
000519f27866af Chao Yu     2017-07-06  2919  					struct inode *inode, bool is_inode)
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2920  {
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2921  	block_t	valid_block_count;
2141879369681f Chunhai Guo 2025-08-07  2922  	unsigned int valid_node_count, avail_user_node_count;
0f1c6ede6da9f7 Chao Yu     2024-02-20  2923  	unsigned int avail_user_block_count;
af033b2aa8a874 Chao Yu     2018-09-20  2924  	int err;
0abd675e97e60d Chao Yu     2017-07-09  2925  
af033b2aa8a874 Chao Yu     2018-09-20  2926  	if (is_inode) {
af033b2aa8a874 Chao Yu     2018-09-20  2927  		if (inode) {
af033b2aa8a874 Chao Yu     2018-09-20  2928  			err = dquot_alloc_inode(inode);
af033b2aa8a874 Chao Yu     2018-09-20  2929  			if (err)
af033b2aa8a874 Chao Yu     2018-09-20  2930  				return err;
af033b2aa8a874 Chao Yu     2018-09-20  2931  		}
af033b2aa8a874 Chao Yu     2018-09-20  2932  	} else {
af033b2aa8a874 Chao Yu     2018-09-20  2933  		err = dquot_reserve_block(inode, 1);
af033b2aa8a874 Chao Yu     2018-09-20  2934  		if (err)
af033b2aa8a874 Chao Yu     2018-09-20  2935  			return err;
0abd675e97e60d Chao Yu     2017-07-09  2936  	}
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2937  
c40e15a9a59f79 Yangtao Li  2022-12-21  2938  	if (time_to_inject(sbi, FAULT_BLOCK))
812c60564ca721 Chao Yu     2017-11-13  2939  		goto enospc;
812c60564ca721 Chao Yu     2017-11-13  2940  
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2941  	spin_lock(&sbi->stat_lock);
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2942  
0f1c6ede6da9f7 Chao Yu     2024-02-20  2943  	valid_block_count = sbi->total_valid_block_count + 1;
2141879369681f Chunhai Guo 2025-08-07  2944  	avail_user_block_count = get_available_block_count(sbi, inode,
2141879369681f Chunhai Guo 2025-08-07 @2945  			test_opt(sbi, RESERVE_NODE));
300a842937fbcf Chao Yu     2021-12-11  2946  
0f1c6ede6da9f7 Chao Yu     2024-02-20  2947  	if (unlikely(valid_block_count > avail_user_block_count)) {
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2948  		spin_unlock(&sbi->stat_lock);
0abd675e97e60d Chao Yu     2017-07-09  2949  		goto enospc;
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2950  	}
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2951  
2141879369681f Chunhai Guo 2025-08-07  2952  	avail_user_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
2141879369681f Chunhai Guo 2025-08-07  2953  	if (test_opt(sbi, RESERVE_NODE) &&
2141879369681f Chunhai Guo 2025-08-07  2954  			!__allow_reserved_root(sbi, inode, true))
2141879369681f Chunhai Guo 2025-08-07  2955  		avail_user_node_count -= F2FS_OPTION(sbi).root_reserved_nodes;
ef86d70994b57c Gu Zheng    2013-11-19  2956  	valid_node_count = sbi->total_valid_node_count + 1;
2141879369681f Chunhai Guo 2025-08-07  2957  	if (unlikely(valid_node_count > avail_user_node_count)) {
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2958  		spin_unlock(&sbi->stat_lock);
0abd675e97e60d Chao Yu     2017-07-09  2959  		goto enospc;
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2960  	}
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2961  
ef86d70994b57c Gu Zheng    2013-11-19  2962  	sbi->total_valid_node_count++;
ef86d70994b57c Gu Zheng    2013-11-19  2963  	sbi->total_valid_block_count++;
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2964  	spin_unlock(&sbi->stat_lock);
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2965  
000519f27866af Chao Yu     2017-07-06  2966  	if (inode) {
000519f27866af Chao Yu     2017-07-06  2967  		if (is_inode)
000519f27866af Chao Yu     2017-07-06  2968  			f2fs_mark_inode_dirty_sync(inode, true);
000519f27866af Chao Yu     2017-07-06  2969  		else
0abd675e97e60d Chao Yu     2017-07-09  2970  			f2fs_i_blocks_write(inode, 1, true, true);
000519f27866af Chao Yu     2017-07-06  2971  	}
ef86d70994b57c Gu Zheng    2013-11-19  2972  
41382ec43255b5 Jaegeuk Kim 2016-05-16  2973  	percpu_counter_inc(&sbi->alloc_valid_block_count);
0abd675e97e60d Chao Yu     2017-07-09  2974  	return 0;
0abd675e97e60d Chao Yu     2017-07-09  2975  
0abd675e97e60d Chao Yu     2017-07-09  2976  enospc:
af033b2aa8a874 Chao Yu     2018-09-20  2977  	if (is_inode) {
af033b2aa8a874 Chao Yu     2018-09-20  2978  		if (inode)
af033b2aa8a874 Chao Yu     2018-09-20  2979  			dquot_free_inode(inode);
af033b2aa8a874 Chao Yu     2018-09-20  2980  	} else {
0abd675e97e60d Chao Yu     2017-07-09  2981  		dquot_release_reservation_block(inode, 1);
af033b2aa8a874 Chao Yu     2018-09-20  2982  	}
0abd675e97e60d Chao Yu     2017-07-09  2983  	return -ENOSPC;
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2984  }
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2985  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

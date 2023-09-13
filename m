Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3C079E2E2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Sep 2023 11:03:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qgLmL-0001Cv-PS;
	Wed, 13 Sep 2023 09:03:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1qgLmH-0001Cd-Ow
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Sep 2023 09:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tBcnVeITrAd89fnvmEAnOvP8jWOj1u/hHmUpIVpG7FY=; b=i+woBpI0W9Ibm3+mI4keG/N5Kw
 /g4P3ZEgPtcxEh30n2sSb9tofns8Uhu5Kkto4hDlsdsGncUBg11wOVfi5v16mXNyiv0PbzU0hyJ6D
 8KUBSrDWEPK59dbuDmYB+2KcJVocpK7VF6CCR6puKyTuq8+4q7lmn/EqPja0vBwDIj3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tBcnVeITrAd89fnvmEAnOvP8jWOj1u/hHmUpIVpG7FY=; b=L
 ss66uAlnsiE7r0SlFgCHWDEf1wjdS+lVFmW3si3SR1NMLxXTpsRR38x4MEVodXLrJhlAPSou/vxnW
 K1/B54E1yJcj/puTxUweXHDSgqF8HpP072MrGoA2lnMHc7l7DQvDUavWgTWSDO8LMgJ34VnM/tLMn
 gGwTflMxn+jiOcFU=;
Received: from mgamail.intel.com ([134.134.136.100])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qgLmC-003Khk-PY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Sep 2023 09:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694595792; x=1726131792;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=zPrJW5WprCYsSPhbhwiH/I+FS4FF9Lhh/gzaxBZstGM=;
 b=c3SHCukJ0T5HuXIF6ZjUYBnlpNEz4eWhgFRwjKuSA/aRRaPQhUq2oGML
 e5R1FIp4fhGvrl3U7RyUv5ID6OMOvZtF8KTEya70oOYfUYZVcIxcTTiJl
 EPtWuKQJbgYiO6D2ssyJj8kTMn/JfksGUQTGrAJ/RFQwm+AjQ5pVIyZpy
 OFvuZ1gKZt/E/7bTrqN7l++Bk9JlUNEWzGuUUNOsi0qZI+5MjqgcuwMME
 xSBZ91ZGHHjafP4K69d+M4D7xvObidBt2nj91/qCx+dZJURYgJV3lO8El
 XYW88XHbtepOUtS5m8GSMyIu5Bfq8sP+r8OQVDU8y42C9wkwJUhbMkp7a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="445044435"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="445044435"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="814149187"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="814149187"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2023 02:03:05 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qgLm3-0000Ir-1T;
 Wed, 13 Sep 2023 09:03:03 +0000
Date: Wed, 13 Sep 2023 17:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <202309131625.SJzoZDIO-lkp@intel.com>
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
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.100 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qgLmC-003Khk-PY
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 8/9]
 include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of
 type 'size_t', but argument 6 has type 'long unsigned int'
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
head:   67dadd6ef509ed922ec667ef6b0ef0cdbb2fe04c
commit: e152f298a65c86ab89200d2d32132ab359c66a3c [8/9] f2fs: Support Block Size == Page Size
config: sparc-randconfig-r031-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131625.SJzoZDIO-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131625.SJzoZDIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131625.SJzoZDIO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/f2fs/inode.c:8:
   fs/f2fs/inode.c: In function 'sanity_check_inode':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:2321:26: note: in expansion of macro 'KERN_WARNING'
    2321 |         f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~
   fs/f2fs/inode.c:318:25: note: in expansion of macro 'f2fs_warn'
     318 |                         f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
         |                         ^~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 016BEAB60C1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 May 2025 04:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jv0hK3MxygQMKDrIv6/t5IewfPbr57uqgd4ZsEgPQVI=; b=BY0nvvVDpJ0utbN19ecfkM07NR
	buW+R4kFJ9pS9ZgC3QEjn65MiBuCFcNopQvOjH4xf0o790CdZ3Rd+UPskMMDu84d8CAeoHTzv5VgX
	neQpiOjycABsKGmZPBTUO943BMCRM1hBBUmaOoue/d+hugJq5C5qMsNTFrXEcG2BoBro=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uF1zt-0006Ri-6T;
	Wed, 14 May 2025 02:37:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1uF1zr-0006Ra-GJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 02:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N+VhyvRJY6jD9mhSgPSA0yyEjofXEKLkNjsfRDUsuIA=; b=hLwzlhcARqInjtbHdr2biefClT
 AiSHUZzTIvf1yWOVKN7kIQjfwVFplSsN9vtY7czieiPmVAI7p8LEnO07ZDSTkYz+b8U4YrB2hz79l
 YsHDId89EhDTRXifW8Eei56P++LM+7EWXNOhisxh8DvWEwaZ02KjsL3XAWJotY15H4v4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N+VhyvRJY6jD9mhSgPSA0yyEjofXEKLkNjsfRDUsuIA=; b=A
 ++cjOavqqmzo+NMYKdhUWWURLdpAplHb9dH4AGl8EqiqrwOpAMWpYF2cel7IWtfQo4al4GCafCR97
 rAc3lblD0z8xQrAUmY2ejVk0H+Xpeh9aPt39d6NGIgCUR179dVBuszsbEXVXzc9GVHaDqZ+HwnDXP
 JIz340bFnQjFz2JE=;
Received: from mgamail.intel.com ([192.198.163.17])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uF1zq-0005U2-K4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 02:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747190247; x=1778726247;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=tKxEawiPDguAoa6FhlfOXnvM/FxGFFtl1F5xuCMCeeY=;
 b=JQ7CL+Cv9Ba3rxptWmfFuowUUO/pqNxpFvpfxlu9JJTytcjbL2njl6yG
 6ONwxtqe2F4eDydJVHuIq8XrW25Vv6WxH9MwdHWR7YMB14RkeLA4W+qVK
 c89uu0iBmPI/GAMbWFB58tfxgW20PFk3v8N86YmGnLs+AH80tkuG8/CJ9
 E0BpIwsaDb5zaOIxs6Y8zPuLjVlhe2eg1iQQtrwMS4HaPp68Y9WJffmFT
 ReJty0Ak6DRzvDDyAhVJj5G57K02+UdHXo9YpIY+njUcks1m266j1UP5V
 YAAEJgpxCgZfHE3vg3m//xZ33tqSINUSz4ZSC3rIz+p/kkU+aphURqU6a g==;
X-CSE-ConnectionGUID: U1zsWU1QSDWz3bWGQZkJ7A==
X-CSE-MsgGUID: pxZNG9NVS/yFCIXq4liOvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48996424"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="48996424"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 19:37:16 -0700
X-CSE-ConnectionGUID: QjeHAsQ+ROSkrF4EIBq+PA==
X-CSE-MsgGUID: le9D11xwRDG9xzdeivIEXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="138817573"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040)
 ([10.211.3.150])
 by orviesa008.jf.intel.com with ESMTP; 13 May 2025 19:37:14 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uF1zb-00015q-35;
 Wed, 14 May 2025 02:37:11 +0000
Date: Wed, 14 May 2025 10:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Message-ID: <202505141028.6gTS0aOI-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 869734b9a4ef9440e80dba629c688ed3277a7779 commit:
 5cefc0eae8b492a1eaa645f11d0dbe362d8d8700
 [186/191] f2fs: separate [...] 
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.198.163.17 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uF1zq-0005U2-K4
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 186/191]
 include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of
 type 'long unsigned int', but argument 4 has type 'unsigned int'
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
 Eric Sandeen <sandeen@redhat.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   869734b9a4ef9440e80dba629c688ed3277a7779
commit: 5cefc0eae8b492a1eaa645f11d0dbe362d8d8700 [186/191] f2fs: separate the options parsing and options checking
config: arm-randconfig-2006-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141028.6gTS0aOI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141028.6gTS0aOI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141028.6gTS0aOI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from fs/f2fs/super.c:8:
   fs/f2fs/super.c: In function 'handle_mount_opt':
>> include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
         |                  ^~~~~~~~
   fs/f2fs/f2fs.h:1883:26: note: in expansion of macro 'KERN_ERR'
    1883 |  f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~
   fs/f2fs/super.c:766:4: note: in expansion of macro 'f2fs_err'
     766 |    f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
         |    ^~~~~~~~


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

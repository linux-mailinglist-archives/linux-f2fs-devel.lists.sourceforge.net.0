Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90400AF6672
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jul 2025 01:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0S3KSAgIVAHt01HBopSn1zMvu8Wdw+JVOGd1GGZ4Scc=; b=lzmNc1adcn/ch18qlkaEGCHq+E
	Zm5SZOz2UR0RGx+MSQOI9uloMGKIliEuCKFh2zJG7ueqzTdAvdccdue40Md7aXuxx0HBRTo+cvlG0
	dGDEofwcaf6rRRT4HsJEIGGiBLMEiziM3sJfnBxcPApmeLzadyTj0Ybh/iQoC4rHNkAc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uX7IK-0000bR-7M;
	Wed, 02 Jul 2025 23:55:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1uX7II-0000bJ-97
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 23:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yren8CqVeUWl+LWrxJWS0BoqLHG122fkTN54YBvQ/PM=; b=NuEMwk/sijmMJ41d5YOQx0MYFe
 XbX9fVkFrn99p66SDXF4/29f/aqmecjdvdMUYLXfW2dMVc9ELJvl3qFooTnZ3SpuQDPmQNAiu5XFh
 Dy9Ea0Ws9CUDQ599ZfhdsCHyRkBXfYKp3uCARx+wSse3s4CSQfU8jQQS6n7cLv1tgtgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Yren8CqVeUWl+LWrxJWS0BoqLHG122fkTN54YBvQ/PM=; b=F
 TRikzvIEaEKINYWK4hlWjPoeEbM68RY+9oPVYYmXpeja3q7y9LIr3qtJ4CMerFhupXhB2fsett8Eo
 VuZv+hotulMAeiz743jXlKYtA1bUIdXDGEJsBWhFQalnKNRasVITCjw62iW9O7SVC/r1O5lMlY9F8
 zkj7EggE4FXuJVxg=;
Received: from mgamail.intel.com ([192.198.163.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uX7IH-0005s7-OF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 23:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751500514; x=1783036514;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=s3OPQSzwPg00hV1YzATCwvchQlSKdU8S5Xd5zApaiGM=;
 b=OAP67UKgolvSSOcE6buW8yZHr1z4J47PXSEiPjWX0xqY0J4Z8BjNmBP2
 bC3qxG/wpAmf6kBL+k16xnZpkXGUB4WSsKWgVWrcsRFHe107j9OPccdlZ
 35DOx0S765RRlGvOf71vwQsVYb3waii+syaKOdbCAvV/eioFR97l7casK
 uxoFMaMkx6dSUccGXMusQVkZztQbcwRwa3RE4NzCtFfQBxOwlA0HhBytG
 Gz5dES8cpD9mCrBiWNOiQLMb25nO97x0JEPM+rgjuqXwwd70F0YQCUGe9
 f2ybG5MBQXOQ/ZgeabuL+hdx6pQG/PBXWOLT2GS+nQSvamLzC2J6XgKIo Q==;
X-CSE-ConnectionGUID: 8R+gWz0MQweuPWLVPPy/mg==
X-CSE-MsgGUID: nXj2bVpgTledmPZDiTOVEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57623243"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57623243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:55:03 -0700
X-CSE-ConnectionGUID: fMFjjWJOQ2W8QYTRwqewsg==
X-CSE-MsgGUID: 8olKBYQZTUOkWla7g+/AAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="158782410"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121)
 ([10.91.175.65])
 by orviesa004.jf.intel.com with ESMTP; 02 Jul 2025 16:55:02 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uX7I3-0000Mv-0B;
 Wed, 02 Jul 2025 23:54:59 +0000
Date: Thu, 3 Jul 2025 01:54:52 +0200
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Message-ID: <202507030123.7D6FE7m9-lkp@intel.com>
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
 dev-test head: 90548c634bd0dc691ec01fefc0e4960afc49c5eb commit:
 74c8de2976b01dd602a808ac92f037fcae2fdc5c
 [26/28] f2fs: separate t [...] 
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
X-Headers-End: 1uX7IH-0005s7-OF
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 26/28]
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
head:   90548c634bd0dc691ec01fefc0e4960afc49c5eb
commit: 74c8de2976b01dd602a808ac92f037fcae2fdc5c [26/28] f2fs: separate the options parsing and options checking
config: arc-randconfig-2001-20250702 (https://download.01.org/0day-ci/archive/20250703/202507030123.7D6FE7m9-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030123.7D6FE7m9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030123.7D6FE7m9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
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
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   fs/f2fs/f2fs.h:1889:26: note: in expansion of macro 'KERN_ERR'
     f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
                             ^~~~~~~~
   fs/f2fs/super.c:767:4: note: in expansion of macro 'f2fs_err'
       f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
       ^~~~~~~~
   fs/f2fs/super.c:767:57: note: format string is defined here
       f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
                                                          ~~^
                                                          %u


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

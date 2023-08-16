Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B677D95F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 06:12:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW7t0-0004M2-5X;
	Wed, 16 Aug 2023 04:11:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1qW7sx-0004Lj-O4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 04:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=svpBd5S2P/nTNVG35aYLso5/U4QoonV663ICFqQiRno=; b=IToDQZwecTd2WzrEJJ4A7Fx8aT
 k5rYUYY1oJ4pU/1h5EdFRD5W0zLcMw+naW20tbEUKkezCIONKlk1DhEeUX4kPsacEA8ov+ExyV2GG
 Jt0jCSkpZvIPelzodlI89uHiydQnafrRVz4cZS7VqyX3TYYmJN9PS6HR9ee5Ij6aHRsw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=svpBd5S2P/nTNVG35aYLso5/U4QoonV663ICFqQiRno=; b=SNO6GmYLcPg/h1YuxVyEWYGKMW
 suU0aV3OOMU8fA53WXU3Vdc0SaaL7qeVaKN5iYwMVeMqvqc74+Qjnmguc/AHBwwQF8OP1wSjlt9fU
 OxHRytYQBzYCNZr8GvZft1utADAJcn7jNTIFvBp98RM2NbfMo9GRn+8aKmiSKF7svrb4=;
Received: from mgamail.intel.com ([192.55.52.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qW7su-006mMw-Jc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 04:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692159112; x=1723695112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+hM076mTtFVP/XFcJDY1enqLmYazFXdz1WhZ1vHbVPY=;
 b=G1/bpN0Pv5G5UdQhknoLpnsLalo7aHUOyh300zJpjdT2SYWXVl2Zw1VG
 HdOHwd5vWdMlxR2BLJR5f02nmpk7i7x2z7xw32Om7gZFZ2h/vFx7dfoHJ
 bEmh2bNrNDdi0zX1Goeq6B0m9wK4/mkTTKaNzpAo1DTK8dub9bBloGUhe
 +PXSSdIvMec3EPpRTnpBQ9OMqUnVP40C1O55XRiVH1ePwd0FOred0GMna
 pjCkA3do/zeyb4DxpPMOOTgTeRwQCc0FX/BHQcrNqxV+VfkfXUVurlU9k
 O+9hC3suVlBPXbwZv+rPcUIchFKfZTR+SQcEscCeoT4wGXNQrix1HQq/6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458786768"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="458786768"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 21:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="683895889"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="683895889"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 15 Aug 2023 21:11:40 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qW7sh-0001Tt-07;
 Wed, 16 Aug 2023 04:11:39 +0000
Date: Wed, 16 Aug 2023 12:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Message-ID: <202308161231.MjDoxlOG-lkp@intel.com>
References: <20230816011432.1966838-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230816011432.1966838-2-drosen@google.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daniel,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on 0cc81b1ad51287847e494e055e5d3426f95e7921] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.43 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qW7su-006mMw-Jc
Subject: Re: [f2fs-dev] [PATCH 1/1] ANDROID: f2fs: Support Block Size ==
 Page Size
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
Cc: Daniel Rosenberg <drosen@google.com>, Chao Yu <yuchao0@huawei.com>,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0cc81b1ad51287847e494e055e5d3426f95e7921]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Rosenberg/ANDROID-f2fs-Support-Block-Size-Page-Size/20230816-091721
base:   0cc81b1ad51287847e494e055e5d3426f95e7921
patch link:    https://lore.kernel.org/r/20230816011432.1966838-2-drosen%40google.com
patch subject: [PATCH 1/1] ANDROID: f2fs: Support Block Size == Page Size
config: m68k-randconfig-r013-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161231.MjDoxlOG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161231.MjDoxlOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161231.MjDoxlOG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
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
   fs/f2fs/f2fs.h:2315:26: note: in expansion of macro 'KERN_WARNING'
    2315 |         f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~
   fs/f2fs/inode.c:325:25: note: in expansion of macro 'f2fs_warn'
     325 |                         f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
         |                         ^~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

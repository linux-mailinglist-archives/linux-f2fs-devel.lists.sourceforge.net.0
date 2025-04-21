Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A00C6A9544E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Apr 2025 18:36:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u6u80-0007ix-Th;
	Mon, 21 Apr 2025 16:36:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1u6u7x-0007ia-C6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 16:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+xVhiIynlBbUjSvg+sRBr0begU4s2nH1Pst1br8v3RM=; b=VymexYtetHCGBIaa/Aq/ZjaPLH
 julJIcd6qoxl78qWug6IppOxV4dDRZEaohiYd1a0ONJOhH72HZyI6a7Myj89EbUOUoXMqY2wRz5g1
 FTgrVp9TfQzL3N9iH4XmGXXeiQwr8tSz1Y3WX9NsWwDxGh0qD353E97cL0U6PaaWK7xE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+xVhiIynlBbUjSvg+sRBr0begU4s2nH1Pst1br8v3RM=; b=eVXy1Sg6TNv4zEBa6T8trjFClA
 lhWwpPTRQCO+5PLGPOVk63ovue/OnTwbNShXpfn0pQt00ROZXVRMEYMuPaUtc5F/EwpKMBaikNQ8v
 SRrTEtbg8PrArWfWXTTi/7CQ8xo+KnSju7oF3w7ZG5KtuSNLaMSNyZlB8y3xAv0J1ENU=;
Received: from mgamail.intel.com ([192.198.163.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u6u7e-0001wz-Gf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 16:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745253355; x=1776789355;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BIzR/H1F8de4lehses21qFDRgo7tYE5kewNC7o51Z8s=;
 b=ILqtitmJrX/OVEc729nwrvJrxUcclld2b/OQT4i4cmflyD/sxZyiHvqO
 FQqPcniyRCZEcp9v6urajXbdm6uN0U326gZIhAb70fkNhu1a5KIQq+hVl
 tLAhXES6TyLr9eLWgUMc1TZqw1uMxMLtFxtf7cqOhY9p3xVxbvWKmsNSo
 qnnb8cyI5sT4WYvhTdKHjl+VSn7wgv5E7GCQrGjuJAt7GH5CJFhGPxkEt
 ihuHELoxiuiRYdYUuAcwQK3VAgJEqkgfLNvnm+Wa88XCT8y+JMu8hK0Fd
 s9U+r6Jy4EeDNkcE9vF+e2+4sBcgxMXRqOrhzycCMdDA3g7VMsZsmqt/t w==;
X-CSE-ConnectionGUID: cMvxyUjJQLC+NT2LyRvr6A==
X-CSE-MsgGUID: lQQcNCVaTJ+Zjiob8tV8lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="72183694"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="72183694"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 09:35:44 -0700
X-CSE-ConnectionGUID: Wh3D6qZUReScpja4mF35IQ==
X-CSE-MsgGUID: 7PHXhzACSmiMwrQIePfuug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="132726322"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 21 Apr 2025 09:35:41 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u6u7P-0000El-1V;
 Mon, 21 Apr 2025 16:35:39 +0000
Date: Tue, 22 Apr 2025 00:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <202504220033.8EDCfvWU-lkp@intel.com>
References: <20250420154647.1233033-6-sandeen@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250420154647.1233033-6-sandeen@redhat.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Eric,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on v6.15-rc3] [also build test WARNING on
 linus/master]
 [cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev next-20250417] [If
 your patch is applied to the wrong git tree, [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.7 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.7 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.198.163.7 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u6u7e-0001wz-Gf
Subject: Re: [f2fs-dev] [PATCH 5/7] f2fs: separate the options parsing and
 options checking
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
Cc: Eric Sandeen <sandeen@redhat.com>, lihongbo22@huawei.com,
 oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.15-rc3]
[also build test WARNING on linus/master]
[cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Sandeen/f2fs-Add-fs-parameter-specifications-for-mount-options/20250421-220156
base:   v6.15-rc3
patch link:    https://lore.kernel.org/r/20250420154647.1233033-6-sandeen%40redhat.com
patch subject: [PATCH 5/7] f2fs: separate the options parsing and options checking
config: arc-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250422/202504220033.8EDCfvWU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220033.8EDCfvWU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220033.8EDCfvWU-lkp@intel.com/

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
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:1871:33: note: in expansion of macro 'KERN_ERR'
    1871 |         f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~
   fs/f2fs/super.c:763:25: note: in expansion of macro 'f2fs_err'
     763 |                         f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
         |                         ^~~~~~~~
   fs/f2fs/super.c:718:15: warning: unused variable 'name' [-Wunused-variable]
     718 |         char *name;
         |               ^~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

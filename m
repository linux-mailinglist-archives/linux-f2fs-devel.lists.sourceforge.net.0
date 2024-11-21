Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0497E9D4847
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 08:44:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE1rf-0002OC-IQ;
	Thu, 21 Nov 2024 07:44:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1tE1rd-0002O5-Ts
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 07:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/7n9GnC/ITrcNKrMW2YifuRIWWtcthaKuCgV7h+9R50=; b=UPQRoGjglzguD+0m7yuAMKgnCT
 2V93mGRQ/WiQ62LNze9R/KJPnRtliw96y7YCzyWg2eDWwAbuoutOnY/W9yKg0dLrzOTzytWvMBMWv
 yf0BYW7B4Lhd9ZtRVqHuz1ZnJrjhXFN/RlHONYux85uFVroxtVjJhUbKaYR/DoDHbtsQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/7n9GnC/ITrcNKrMW2YifuRIWWtcthaKuCgV7h+9R50=; b=j
 EuCHSyCXn/z/YUFDucWzA/HDDoJ4S1y/gfyR9iF31pwcJFpDZSFQ8nODojn0ei/BzLv2KK37+mv1g
 Qz3ZD9ooWGOprbcSSZ5H1vuQPpjRyKbv1zFzjvsMLZdNTQ20sOYtUQ4pe+C/OC6jr/O9Eo0jpQ8tV
 cWux4oc9oupHwjZw=;
Received: from mgamail.intel.com ([198.175.65.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tE1rZ-0007D0-2i for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 07:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732175069; x=1763711069;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=0TLbLPLBgcM3iGjdM8q6JOi1u/2UwoegboxVplByXgc=;
 b=dk5a94I0serDVSwuTwwEmrm+kCGeg8UVKx5qZF+qEsvsD5k8ZNSeYaGr
 Bxzc4I4SiO9Gsj4HX1QwqYmXp1xFNl0SCPu8iO9qf+hYjNvOWInmwXog7
 9CzxDgV/+d8oqOrUrcrmc2PDWfk+4u0JPqwNwN2+gtyVwF4PLVljnjFmX
 TSbT9ZEM4mbf41F56W2Ri9pDR15hdsJibxdJamxrsQOJcTrPvfmZnzwej
 P/O0up8UwqGL3xoyUqh6JQsx+PGVfD1dMmmCNu/LCDUzf5/bnk9vwxAfy
 Z151Ht7ecVnKjzxARx4wjq/TxxV1Hdd4SJ82KPsZs0wEMW1dSiCnsLfZH A==;
X-CSE-ConnectionGUID: LXgH+VKPTbOe33YG4vA7WA==
X-CSE-MsgGUID: Hsj3yY1UTqmRkAHYCMYSfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32419537"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32419537"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 23:44:23 -0800
X-CSE-ConnectionGUID: Cta6EdotQ2a2azWLvS5Dpg==
X-CSE-MsgGUID: yVnXHSnHTNKR1szQnH1Ycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="94237216"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2024 23:44:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tE1rO-0002ep-1z;
 Thu, 21 Nov 2024 07:44:18 +0000
Date: Thu, 21 Nov 2024 15:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <202411211538.Tus6kZm1-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 05735334776f7f446fbda9fd7efa7d9f835096ca commit:
 98eebae9535e3ca2df2157d29a37c1b74d8deb79
 [35/36] f2fs: fix changi [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.18 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.18 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.18 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tE1rZ-0007D0-2i
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 35/36] ERROR: modpost:
 "f2fs_check_and_fix_write_pointer" [fs/f2fs/f2fs.ko] undefined!
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
Cc: Chao Yu <yuchao0@huawei.com>, llvm@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   05735334776f7f446fbda9fd7efa7d9f835096ca
commit: 98eebae9535e3ca2df2157d29a37c1b74d8deb79 [35/36] f2fs: fix changing cursegs if recovery fails on zoned device
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241121/202411211538.Tus6kZm1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211538.Tus6kZm1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211538.Tus6kZm1-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from fs/f2fs/segment.c:9:
In file included from include/linux/f2fs_fs.h:11:
In file included from include/linux/pagemap.h:8:
In file included from include/linux/mm.h:2213:
include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
|                            ~~~~~~~~~~~~~~~~~~~~~ ^
505 |                            item];
|                            ~~~~
include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
|                            ~~~~~~~~~~~~~~~~~~~~~ ^
512 |                            NR_VM_NUMA_EVENT_ITEMS +
|                            ~~~~~~~~~~~~~~~~~~~~~~
include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
|                               ~~~~~~~~~~~ ^ ~~~
include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
|                            ~~~~~~~~~~~~~~~~~~~~~ ^
525 |                            NR_VM_NUMA_EVENT_ITEMS +
|                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/segment.c:5452:5: warning: no previous prototype for function 'f2fs_fix_curseg_write_pointer' [-Wmissing-prototypes]
5452 | int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
|     ^
fs/f2fs/segment.c:5452:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
5452 | int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
| ^
| static
>> fs/f2fs/segment.c:5457:5: warning: no previous prototype for function 'f2fs_check_write_pointer' [-Wmissing-prototypes]
5457 | int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
|     ^
fs/f2fs/segment.c:5457:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
5457 | int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
| ^
| static
6 warnings generated.
--
>> ERROR: modpost: "f2fs_check_and_fix_write_pointer" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

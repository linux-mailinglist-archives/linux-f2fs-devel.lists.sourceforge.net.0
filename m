Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C05AAB1BD6D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Aug 2025 01:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RotA7xldDbdKbY9tpDrC76yT1/vlt9Xdun7nUMR24oU=; b=hxe3dVCwh9BnUkwHoiExBnlav6
	DBXBnMBCbBGT8CdZSY6RO7e5aHpn2V5x6iRkjOih9juBND36J5mNmFO6cxA2O5WI9V+OL31pnnrTK
	vY7g9nPYC4ZukDLJLDerIZypcZitv4TiduwdmgCRi/ttbAE96g/6bHDXUDcFudLp7Cjg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujRFU-0006KH-De;
	Tue, 05 Aug 2025 23:39:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ujRFT-0006KA-2I
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 23:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e5z1jeKRmzGmZRjTmjfFW2lKnN7WZBZRscNWNxiwh30=; b=b2huqvK6/wSa7vTe9zLUHTJh8y
 jWq1WhFuVZorghFmiaQQpAg208tP8DbWBad6KFbZjVfp3WMY94li4ZQhYI72BJGcEUlMb+cyhD5PT
 xRgsCIDMM9aRovC8mgX/YX5rYqWKjgpnJ3VuuJkn2mwVuDH470XsjgPSPDG4azKB1tIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e5z1jeKRmzGmZRjTmjfFW2lKnN7WZBZRscNWNxiwh30=; b=G
 5LatZ7GCue+6s2M449OLDoCYaf7WpIe9pRx3gqM/6xoUCuBJozHr7vOEU9d2ZjtYxVqdrmjKnHEva
 BN51zNDlK3QjOGaBvIPx6dR1L2zQrlg1IQSyn1UmOnRBJXmAEXWI/wfvglU4Pqbo0OKQ7U+KHjRjt
 5o68RiZ6GaELeWII=;
Received: from mgamail.intel.com ([192.198.163.13])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujRFS-0002To-GJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 23:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437154; x=1785973154;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=w3h8/qBLm1K4Qc4izU/DPJn+Kzc6b1RMeQ8MIMXOea0=;
 b=C9qlNYZ6XziU1y1aeYBj1hJhDfuaR5mL/zj62UJR8BgZZ/PihjiyUsR8
 7mWfc3yxdz5+Y8geJUIZZvLFkMWh5U8ALT/Fu2A+eir2J5+xgkpmP2H7q
 0Y7AhhtD6ZUGlo2FAOEHcDInSswIQ7/rM6rjNSrleJitkZeLUAawKb3ZW
 pHP7BPZDkeMIPKwoG/9wAnRJwCm8dC7IukQw3kvfgDGajRzDO5m46Tkgr
 PeVyNVNFSoCNzBuH9sJG9wtkV5wysYC5j9TcYCArWVvif9yJFUaubZzYU
 C/mqbvYP3Jp3G0jl1oKn5pNrENGzvVTnuEpW9ttlUiWnEt/SQC+WS0KYo A==;
X-CSE-ConnectionGUID: JUV/0QG1SAezw2Um4Aj9PQ==
X-CSE-MsgGUID: /+yGSG7XTj6T7CqYuT5mvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="59363318"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="59363318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:39:04 -0700
X-CSE-ConnectionGUID: AQTTAwnsQSaVuGQzgHjRMQ==
X-CSE-MsgGUID: g6bNQh3YTHGlnGqhahXOmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="165043014"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 05 Aug 2025 16:39:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ujRFB-0000q5-2k;
 Tue, 05 Aug 2025 23:38:58 +0000
Date: Wed, 6 Aug 2025 07:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Message-ID: <202508060732.lODuFyrt-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 55c1de831d3eda713fb732eb92043b862f8033d6 commit:
 55c1de831d3eda713fb732eb92043b862f8033d6
 [13/13] f2fs: Add bggc_b [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujRFS-0002To-GJ
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 13/13] fs/f2fs/f2fs.h:3051:24:
 error: 'struct f2fs_sb_info' has no member named 'bggc_block_io'
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
head:   55c1de831d3eda713fb732eb92043b862f8033d6
commit: 55c1de831d3eda713fb732eb92043b862f8033d6 [13/13] f2fs: Add bggc_block_io to adjust the priority of BG_GC when issuing IO
config: s390-randconfig-002-20250806 (https://download.01.org/0day-ci/archive/20250806/202508060732.lODuFyrt-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060732.lODuFyrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060732.lODuFyrt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/extent_cache.c:18:
   fs/f2fs/f2fs.h: In function 'is_idle':
>> fs/f2fs/f2fs.h:3051:24: error: 'struct f2fs_sb_info' has no member named 'bggc_block_io'
    3051 |                 if (sbi->bggc_block_io == READ_IO_PRIOR && is_inflight_read_io(sbi))
         |                        ^~
   fs/f2fs/f2fs.h:3053:24: error: 'struct f2fs_sb_info' has no member named 'bggc_block_io'
    3053 |                 if (sbi->bggc_block_io == ALL_IO_PRIOR && is_inflight_io(sbi, type))
         |                        ^~


vim +3051 fs/f2fs/f2fs.h

  3041	
  3042	static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
  3043	{
  3044		bool zoned_gc = (type == GC_TIME &&
  3045				F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_BLKZONED));
  3046	
  3047		if (sbi->gc_mode == GC_URGENT_HIGH)
  3048			return true;
  3049	
  3050		if (zoned_gc) {
> 3051			if (sbi->bggc_block_io == READ_IO_PRIOR && is_inflight_read_io(sbi))
  3052				return false;
  3053			if (sbi->bggc_block_io == ALL_IO_PRIOR && is_inflight_io(sbi, type))
  3054				return false;
  3055		} else {
  3056			if (is_inflight_io(sbi, type))
  3057				return false;
  3058		}
  3059	
  3060		if (sbi->gc_mode == GC_URGENT_MID)
  3061			return true;
  3062	
  3063		if (sbi->gc_mode == GC_URGENT_LOW &&
  3064				(type == DISCARD_TIME || type == GC_TIME))
  3065			return true;
  3066	
  3067		if (zoned_gc)
  3068			return true;
  3069	
  3070		return f2fs_time_over(sbi, type);
  3071	}
  3072	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EE784FFD1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Feb 2024 23:24:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rYZHo-0001ss-Lq;
	Fri, 09 Feb 2024 22:23:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1rYZHn-0001si-Ck
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Feb 2024 22:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kY6r2iKf20Hk2WiHY0E53v/7OOafxZhsZmyKeWZz6Wg=; b=VkUNaWTknxoIpJh7HrdQNIIYJL
 EWKyql2RYguBn4rwWoI+Vp7j9c1GQYAwfNO9jNnbu+nEmpaKT1tHQrmZNTb32AC/0Ax3N5ltNobI2
 WlHgTohy/cfB542tygUZ4nVzqSl/NubRyloRo6ogdWAIw1FNZ2auBT/A6nBvWoAYLkYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kY6r2iKf20Hk2WiHY0E53v/7OOafxZhsZmyKeWZz6Wg=; b=g
 mRsEvLidi/VjdwPSV6CoZ3sRC+Ne40smFoZ7I9qAqrEtt0+0j9CsP9+79X1N6ROp8vqm0YQKYKXjD
 bU3g1jwfRQTBOqsJ508MUeT4u1Rl1yb2/oYtGTuSREGGxbaxt9bCh6eR2GdIdH7BynKnfAycLCIVa
 6wiPVQwL5S9y51NE=;
Received: from mgamail.intel.com ([192.198.163.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rYZHi-00042K-35 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Feb 2024 22:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707517430; x=1739053430;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=TxMhQynAi0TWjg+eWlX7wo0fy3/iS4Wsd7hy+iYYy8w=;
 b=R2iZ6rmUm5vmpw7THrn70fQHPG/HpLfjNJk3dcBQ+Ny2iHsr+8gAPQEJ
 LKi6/CDHEOUSIzVOYdvS83twMhS+gssgNfgHaX+BD3C3dMQOd5dfezk9W
 MErnuFbQsrbeIo0jCC430SNLZRKNaggHaqy1Xs+5RVKKIELmt0L+JjAGd
 u4kFVulfxgd4YVRqnwHTivpZ00p8aMoa8EEiIIW++omalnfhFQmxxJuqK
 oMGPwBhZoZnx51PygMZB/zKiGihcpHmpOhKMO0qk18BhbuEEyw6i2D0IL
 6R/D4XVW5LTzCAGtQmx2roQPBYN7q97hIjpBnKgQJ4eoqxAH/Z+aF/btX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="19016978"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; d="scan'208";a="19016978"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 14:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="2254838"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2024 14:23:44 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rYZHa-0005AQ-0H;
 Fri, 09 Feb 2024 22:23:42 +0000
Date: Sat, 10 Feb 2024 06:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <202402100609.eXG721f8-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, FYI,
 the error/warning was bisected to this commit, 
 please ignore it if it's irrelevant. tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 4469e8487429b45bba20b1f95f34143a1a16ab5d commit:
 728f5c019e921428fac77ee4fd48a03b2d435c19
 [18/20] f2fs: use BLKS_P [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rYZHi-00042K-35
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 18/20] segment.c:undefined
 reference to `__divdi3'
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Daeho Jeong <daehojeong@google.com>,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   4469e8487429b45bba20b1f95f34143a1a16ab5d
commit: 728f5c019e921428fac77ee4fd48a03b2d435c19 [18/20] f2fs: use BLKS_PER_SEG, BLKS_PER_SEC, and SEGS_PER_SEC
config: i386-buildonly-randconfig-002-20240210 (https://download.01.org/0day-ci/archive/20240210/202402100609.eXG721f8-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100609.eXG721f8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100609.eXG721f8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/f2fs/segment.o: in function `f2fs_need_SSR':
>> segment.c:(.text+0x57fd): undefined reference to `__divdi3'
>> ld: segment.c:(.text+0x5819): undefined reference to `__divdi3'
   ld: segment.c:(.text+0x5838): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

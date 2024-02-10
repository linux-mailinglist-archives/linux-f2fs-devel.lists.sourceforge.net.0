Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9A85023C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Feb 2024 03:43:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rYdKj-0001i6-4b;
	Sat, 10 Feb 2024 02:43:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1rYdKg-0001hm-PG
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 10 Feb 2024 02:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vprl4YPr+DcFlJuB5P+CQEM/DsvoHkYi92BnK+K07/0=; b=aWTHMI3FK1LEppV/UK095UimUe
 kCtHAX7dm9IRBbcyNNz72qC2CufRTI9kOe8TWjf4oRUY8TSGRweL4BIIdliiq3poct3oPu/0bod8t
 yErxIAvpUMXIiDlfw6ktgrImdRezD2O20Ng6/goIK8T+64AObg1yDtSZKnJC48bdE+NI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vprl4YPr+DcFlJuB5P+CQEM/DsvoHkYi92BnK+K07/0=; b=A
 +ZyVtACf3Futjf9p/e68RxtOXC1PLUHZ6ulBoR5x9pLiS5XY02QHkx03BZp1Fh1FQCZxtSYdG6pqV
 ma5UcADfI6VR8f6rjCfgcWEXtyD2EuMLhxpmbwpebx3X55JoFRshNnnlFkXt1L0WUWUMYIcoNrNCz
 VI8FyvbFV461h/WQ=;
Received: from mgamail.intel.com ([198.175.65.17])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rYdKb-000676-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 10 Feb 2024 02:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707532986; x=1739068986;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=iNNfVeNivjvuug1ViolbgJ5TwJ3il4titR6Dy379UaM=;
 b=RuGa710E99yu9FOCzrZmbcB6k8+fPMu3o0fVip5u4IbZtBC1S5Q7skB6
 Zicx9hY2b9ZryIKrIk+a/Fpy5hf0ykX7+489uoWh6Jq0XVCae9VCIi8qq
 KktGYuyZzR23NpDlE1fgiL+bSA/0J0tGgRdbWaU1tl1Oi/JC23MutzOr+
 eNpSF46tZrDUVEj7LMaPi52WOMG6DqGaa7eV+GQfiqlEnIJbS/S+SWXR8
 xmSTtV+S2wwa8kdoRCLv6cqgzdm86O0RqW2WiSn1rOWG+z00Mh3OcGd4h
 VKgowBlcODK3WQ/1w7B1cAAu68gDuAMWN2KEaueh4cOiyvSrVTWJDVG2u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1679414"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="1679414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 18:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="2402903"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2024 18:42:59 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rYdKT-0005Hy-03;
 Sat, 10 Feb 2024 02:42:57 +0000
Date: Sat, 10 Feb 2024 10:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <202402101027.xBy2m1xD-lkp@intel.com>
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
X-Headers-End: 1rYdKb-000676-W2
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 18/20] fs/f2fs/f2fs.h:2522:
 undefined reference to `__divdi3'
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
config: i386-randconfig-001-20240210 (https://download.01.org/0day-ci/archive/20240210/202402101027.xBy2m1xD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101027.xBy2m1xD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101027.xBy2m1xD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/f2fs/segment.o: in function `get_blocktype_secs':
>> fs/f2fs/f2fs.h:2522: undefined reference to `__divdi3'
>> ld: fs/f2fs/f2fs.h:2522: undefined reference to `__divdi3'
>> ld: fs/f2fs/f2fs.h:2522: undefined reference to `__divdi3'
>> ld: fs/f2fs/f2fs.h:2522: undefined reference to `__divdi3'
>> ld: fs/f2fs/f2fs.h:2522: undefined reference to `__divdi3'


vim +2522 fs/f2fs/f2fs.h

  2519	
  2520	static inline int get_blocktype_secs(struct f2fs_sb_info *sbi, int block_type)
  2521	{
> 2522		return (get_pages(sbi, block_type) + BLKS_PER_SEC(sbi) - 1) /
  2523								BLKS_PER_SEC(sbi);
  2524	}
  2525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

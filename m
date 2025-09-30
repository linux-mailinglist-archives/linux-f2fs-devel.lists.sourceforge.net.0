Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB21ABAAE99
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 03:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fh1FV4KLoURCgAccp6RXP2M1EpUTpXYlpZhf2Gzz9YQ=; b=hWjBrPMxwiPjVEauvjjzOQcZ/f
	kjw098fhvl8aqV8DNoQumwaNJBhRHcwPM9bVch+5L6tSUsumqo6qfW6/LICVLem0Wl4av6IHYyYtl
	nNFZ+RP6OIbih1/uPL6b3gnuZ5qDyOYuNTB85EfTSchd7eQC5vgxHC5FWhHUb/YpsTQE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3PT5-0003ct-3W;
	Tue, 30 Sep 2025 01:47:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1v3PT3-0003cn-CB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 01:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=19YTQnCXd7Y5NtNZo8OIBaSy1J3QAx7J2aUBHNUGy8M=; b=NBA+11GdzoEF6I5eVsh6YHLVDW
 kfz0/J1eLB9kLV+lUMH0s7eywDr6C4BMmyx1olIl2PvYePfL2YGTMffSTvLqzW5PhgAMIEnj4Nd2H
 z2a2BH+L9KaR2Q0l+2pkwV6J0rDRxdirgTUCkPlDKFU8xvegyVJT14AiBMbSbM6LTSic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=19YTQnCXd7Y5NtNZo8OIBaSy1J3QAx7J2aUBHNUGy8M=; b=G0llwoXDVeuF5YCBPivWnhBx0Z
 awbbtZbAnAGsyqSuQqgTDwxFQ5/CEkEDWNxWHfKl8i9JTzwfi8qGSTgkkPflac+SEDTZ2L5DZOpAx
 4IAItNfhOhDCXo8FDrVukSKfCa4fPazpkN4VWvNndztqZV9hhPnNLJ1A/g0ZRNkGo81A=;
Received: from mgamail.intel.com ([198.175.65.17])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3PT2-0002Gp-FO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 01:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759196868; x=1790732868;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HgStWjYtyMljxtoehnaC6lpeJVqBYQGuOxxP3cAccdo=;
 b=Yr86Gpu2ZHgTGgDfQPqVGHE1Z+16BZmXtf1CeB3TwRnJIrqDpaWr9XES
 Bayg6u0sba56/Sf0BtX0assDqJhfdb6EUntZSrRoEhQYvY+wdTIQtPK5C
 eeNZJGYKxFYmtj0J90ND8k1nVIHP3ROZlLJzvkyGPqPxNY1EawxIoW8ft
 KyNoovDPPtXnX0k2MFxhiV3EX0onPkRjG6ZJW2vtUy8KBlb1jq4f8KpAT
 FnGfI/kZWXGZVdR54gQo8ZcLtV3i0eLYDKGoFV5FvLmhPK5r9vcd8D91M
 LzAISgUicmyFcRKjcu9SROjk7g8+BEVW7TvCveaBzdmfOkgXwomVhGXCk A==;
X-CSE-ConnectionGUID: 1hlHHLMwSSi3oJUaLdNVJw==
X-CSE-MsgGUID: /WT8hM+TTMKNUmPEHs7cig==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61404396"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61404396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 18:47:42 -0700
X-CSE-ConnectionGUID: MC0JFXgtTmCRKCgKeYCDXg==
X-CSE-MsgGUID: FGhQtfEzRxa6drq++mMHtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="209335217"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2025 18:47:39 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v3PSq-0000ol-2H;
 Tue, 30 Sep 2025 01:47:36 +0000
Date: Tue, 30 Sep 2025 09:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Sun <sunjunchao@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org
Message-ID: <202509300954.4OaImb0r-lkp@intel.com>
References: <20250929095544.308392-1-sunjunchao@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250929095544.308392-1-sunjunchao@bytedance.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Julian,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on kdave/for-next] [also build test ERROR on
 ceph-client/testing
 ceph-client/for-linus tytso-ext4/dev jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev
 gfs2/for-next akpm-mm/mm-everything [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3PT2-0002Gp-FO
Subject: Re: [f2fs-dev] [PATCH] fs: Make wbc_to_tag() extern and use it in
 fs.
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
Cc: brauner@kernel.org, tytso@mit.edu, agruenba@redhat.com, jack@suse.cz,
 willy@infradead.org, clm@fb.com, adilger.kernel@dilger.ca,
 oe-kbuild-all@lists.linux.dev, dsterba@suse.com, jaegeuk@kernel.org,
 idryomov@gmail.com, xiubli@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Julian,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on ceph-client/testing ceph-client/for-linus tytso-ext4/dev jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev gfs2/for-next akpm-mm/mm-everything linus/master v6.17 next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Sun/fs-Make-wbc_to_tag-extern-and-use-it-in-fs/20250929-175656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20250929095544.308392-1-sunjunchao%40bytedance.com
patch subject: [PATCH] fs: Make wbc_to_tag() extern and use it in fs.
config: s390-randconfig-001-20250930 (https://download.01.org/0day-ci/archive/20250930/202509300954.4OaImb0r-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509300954.4OaImb0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509300954.4OaImb0r-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-mmio.o
>> ERROR: modpost: "wbc_to_tag" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

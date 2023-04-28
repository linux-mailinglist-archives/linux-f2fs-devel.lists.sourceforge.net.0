Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3F76F1956
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Apr 2023 15:24:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1psO5d-0006mB-J8;
	Fri, 28 Apr 2023 13:24:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1psO5c-0006m5-3x
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Apr 2023 13:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gyw6c5NXaMxV6+l+bCkRTryCrhVpO/xKUe1tEPi9Gx4=; b=Xv9MGrrBiPoOWdEuEKGSrzJtco
 vmzOPL6Yxl7XcniRnpt++ss6Df0wORhmpcze/GBHM6DknzvasESNmATUHzeWY+IX8tyfjjjyHKJAb
 y7HLXzJOmpRxAPmrLT3DI3Ui1QBqiEKmeVrDpPExnIpq/8Now5o7SMvy9DnakPG4HYdc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gyw6c5NXaMxV6+l+bCkRTryCrhVpO/xKUe1tEPi9Gx4=; b=RNelQXR4ttsXWSWUdO+Mbl9XR4
 azrV7qsyK2iNZ5x/WuUNI2i1ch71/3vjbf4hYbHuXEuSlBchjI+Cqr2rhO1avnK5s9B7ShVCzeuKw
 GzQXUa7vO49mhi1R6/MprvqDq6zkcenXzfBlZFFV87FU6Z9N4M5bNCQppTgdoxHDn6vI=;
Received: from mga14.intel.com ([192.55.52.115])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1psO5b-0001Os-Fm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Apr 2023 13:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682688283; x=1714224283;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oB6VWPH6ulg8K295XZM6A23hQpKHxYtitORTOenls3A=;
 b=hPH2ju3Rf97pBPALTuRWShGtXLshS/4mcj+SmdCKETbNzB9WUUT+rmNj
 xIrNxPD0WsXz/0UqbMkZbQJzpBkD9R3n34KNXkykN3DcHxELNP3eOlLq8
 KA8Mx7o8H/V5XmqwVSsVETOj4TYR5lMsOT/opY3guY+kPuI0yeuoSGihh
 uvuPnAamNr15NVG0Evcu8W8avUs6TZj1K7i+RWa4xLE8wyIKsnlZAkEIC
 +eXlJcOhCSuTvKinEaktBDtKqfaMxKaK29MhaPEKbMkR0OXNtwgurnOOL
 0Up1IxZjnSaguB0Ss8zf4BI0S6obx8a622sLN56tQ2LyzHQVapyAHhPM7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="347769124"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="347769124"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 06:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="819010528"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="819010528"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 28 Apr 2023 06:24:34 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1psO5R-0000SF-10;
 Fri, 28 Apr 2023 13:24:33 +0000
Date: Fri, 28 Apr 2023 21:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Daejun Park <daejun7.park@samsung.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Message-ID: <202304282103.nYW33DnO-lkp@intel.com>
References: <20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a@epcms2p3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a@epcms2p3>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daejun,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test ERROR on
 jaegeuk-f2fs/dev linus/master next-20230427] [cannot apply to v6.3] [If your
 patch is applied to the wrong git tree, kindly d [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.115 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1psO5b-0001Os-Fm
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add async reset zone command support
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
Cc: llvm@lists.linux.dev, beomsu kim <beomsu7.kim@samsung.com>,
 oe-kbuild-all@lists.linux.dev, Seokhwan Kim <sukka.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daejun,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master next-20230427]
[cannot apply to v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daejun-Park/f2fs-add-async-reset-zone-command-support/20230428-105944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a%40epcms2p3
patch subject: [PATCH v3] f2fs: add async reset zone command support
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230428/202304282103.nYW33DnO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2f3e641e3de509a5ed879fb10fdf3377fd9ca0d9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daejun-Park/f2fs-add-async-reset-zone-command-support/20230428-105944
        git checkout 2f3e641e3de509a5ed879fb10fdf3377fd9ca0d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304282103.nYW33DnO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/segment.c:1789:5: error: implicit declaration of function '__submit_zone_reset_cmd' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                   __submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
                                   ^
   1 error generated.


vim +/__submit_zone_reset_cmd +1789 fs/f2fs/segment.c

  1775	
  1776	/* This should be covered by global mutex, &sit_i->sentry_lock */
  1777	static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
  1778	{
  1779		struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
  1780		struct discard_cmd *dc;
  1781		bool need_wait = false;
  1782	
  1783		mutex_lock(&dcc->cmd_lock);
  1784		dc = __lookup_discard_cmd(sbi, blkaddr);
  1785		if (dc) {
  1786			if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(dc->bdev)) {
  1787				/* force submit zone reset */
  1788				if (dc->state == D_PREP)
> 1789					__submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
  1790								&dcc->wait_list, NULL);
  1791				dc->ref++;
  1792				need_wait = true;
  1793			} else {
  1794				if (dc->state == D_PREP) {
  1795					__punch_discard_cmd(sbi, dc, blkaddr);
  1796				} else {
  1797					dc->ref++;
  1798					need_wait = true;
  1799				}
  1800			}
  1801		}
  1802		mutex_unlock(&dcc->cmd_lock);
  1803	
  1804		if (need_wait)
  1805			__wait_one_discard_bio(sbi, dc);
  1806	}
  1807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

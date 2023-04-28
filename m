Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B94F66F11B5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Apr 2023 08:16:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1psHPF-0001t6-Fh;
	Fri, 28 Apr 2023 06:16:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1psHPE-0001t0-KW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Apr 2023 06:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8tnj+gwosRcIaGpUFlCNKQbG4KKo1fEovwT2ZO0oH3s=; b=miZeOd1f+x38WiAak2ViHEMq/M
 tH/RzzIOdIDciHiJY8pxjQFhQ8BUVQM1McHybgoQiDVscdj8TeinI3Ci04J/p5VjAwXWhLTjG0dWQ
 AmfO/iLq1tKypAwFovEXDOEEhj9CCuEe4MqiSxTgGhl8k1RIklViSqHhKJBmLlPuZjXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8tnj+gwosRcIaGpUFlCNKQbG4KKo1fEovwT2ZO0oH3s=; b=j2/iEeJnv6h1xToT1P4yqk5xTJ
 DHVIcPiIaHRutPcKzOARlunS0f63LSTF8qNEyoNN+6+kzXg+ZqR21TTVxMGhta1qfhgvhVi7zxfWH
 raZoIYEYOshf+y85alBl9umkeFji79MH1LVmthaRKDJF2Ln7L4xx3gFiDw7mOIRf1zss=;
Received: from mga18.intel.com ([134.134.136.126])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1psHPD-005SRx-3y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Apr 2023 06:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682662591; x=1714198591;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sfL9oKdMGiqAv8zuZWM1sYcfhkWY/sjDNL9L6OdNe28=;
 b=f8NhmUaCga+N3+MxjN0xeZNl+L8u3vZChPySmd8CMVm0OLIDjCIWhJeH
 26APJdaMoCJxA0YihN4evQbskqNBbI0S7BbVuG0hLP+af+aMauvIwd526
 2lGtaoXkOzc/tYPSbNw+la/RoiWIS7SMrBUELdzX0MSCYBf66Fq++XMXK
 R7iRJVlvs2ao/wmvY8pXszD4aSn2NF3s41+D1mdmmpLO/ySTo/UneFf9b
 /SgzSdsObR2EiUn6DcZvEjQ2K/rMJ3+hzMiu8uw5la1wOYvV0VyMmsgLi
 S30vv4WwVEie0tKELZTRrfzB/joJsCewhar251T1koTnMmnuUAlTwqaNJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="331963737"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="331963737"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 23:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="672037937"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="672037937"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 27 Apr 2023 23:16:22 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1psHP3-0000C1-0k;
 Fri, 28 Apr 2023 06:16:21 +0000
Date: Fri, 28 Apr 2023 14:16:15 +0800
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
Message-ID: <202304281424.WrTeoZ4B-lkp@intel.com>
References: <20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a@epcms2p3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a@epcms2p3>
X-Spam-Score: -0.4 (/)
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
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-Headers-End: 1psHPD-005SRx-3y
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>, beomsu kim <beomsu7.kim@samsung.com>,
 oe-kbuild-all@lists.linux.dev
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
config: microblaze-randconfig-r024-20230427 (https://download.01.org/0day-ci/archive/20230428/202304281424.WrTeoZ4B-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2f3e641e3de509a5ed879fb10fdf3377fd9ca0d9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daejun-Park/f2fs-add-async-reset-zone-command-support/20230428-105944
        git checkout 2f3e641e3de509a5ed879fb10fdf3377fd9ca0d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281424.WrTeoZ4B-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/segment.c: In function 'f2fs_wait_discard_bio':
>> fs/f2fs/segment.c:1789:33: error: implicit declaration of function '__submit_zone_reset_cmd' [-Werror=implicit-function-declaration]
    1789 |                                 __submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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

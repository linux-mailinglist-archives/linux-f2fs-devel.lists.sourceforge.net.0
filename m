Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DF1719FCA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 16:24:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4jEJ-0006iZ-5l;
	Thu, 01 Jun 2023 14:24:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1q4jEH-0006iT-LA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 14:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m+Bcd+z/I1GFWJRDjuwgNvUWZo14rSo9EaM3TS+U4XM=; b=NYUD5WWcUY152/LiTph1QRxxl2
 TKx3Ob67VKloA5S0RfLwE1kwiHYzNnrhc4bO312ZhkTTPFXfOZOf17cCtApoMQpUropTSm7sW2hSt
 u6Cq4jPvWkMh8C5jxAIHEzQv62wlaQ+DGf7ryRipb6EcH9idUJ7iAEnGHuWLoWIoQ41I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m+Bcd+z/I1GFWJRDjuwgNvUWZo14rSo9EaM3TS+U4XM=; b=lwm9V9g9YRATdPWNKZPjQ6k0Vg
 FrrnWHxnMOH/83kvmZF6WLlnploX3zIP+Vi0mq94TcsiXox+o0ywBhf+fYYTMBksOkxvnTuwGpWpY
 XSl/xeBtjkM5juPu/iV0692AyZ2McFn2h6qeCxjgBkeChdWcW884dT1vYCKUVLzt3t9E=;
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4jEG-008Qsu-Ha for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 14:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685629480; x=1717165480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tp+SjkGXZe+Un/c0ek5fly5NDhncMHaC/CSumCRPt88=;
 b=WR0hvtbZQ4DKTYgosXS0jBW7JKcxtclqYQgPLwz9BVIc7g54iJjcj8Mc
 KsskvDZiPAFhI0Yb3Hi0Jdr4yFvGLF2v/YOXgZygv0mvYD74G6HSvWFDU
 G9mNzUnYs1OXq4daZZ8TeN7+2Kw7X6872l1EgrKGcujzkYzBxJPb8cYaw
 lpiR6sP4cp4V319dqs29eUJaZdlPbDkjCnrwtI2KfkrvVuz5dTxTWg66w
 Mxi7w7MHBfk5oVmgLWhyWp5fzsTKdTiqxb5ZSHUR0qN0XBWe/BfhFumpZ
 +xYb/gzI/3svHBYsk49Jf6jlc2ouK0QTimzwapjpq7CKz7gE7FBjiwUgd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419088755"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="419088755"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="657813874"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="657813874"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 01 Jun 2023 07:19:17 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q4j93-0002M4-0M;
 Thu, 01 Jun 2023 14:19:17 +0000
Date: Thu, 1 Jun 2023 22:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: beomsu kim <beomsu7.kim@samsung.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <202306011750.kDn4yxlq-lkp@intel.com>
References: <20230531082038epcms2p256f9db0d7ac377d404694354db1c3ebc@epcms2p2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230531082038epcms2p256f9db0d7ac377d404694354db1c3ebc@epcms2p2>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi beomsu,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on v6.4-rc4] [also build test ERROR on linus/master
 next-20230601] [cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev] [If
 your patch is applied to the wrong git tree, kind [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.31 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4jEG-008Qsu-Ha
Subject: Re: [f2fs-dev] [PATCH] f2fs: including waf data in f2fs status
 information
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>,
 Seonghun Kim <seonghun-sui.kim@samsung.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi beomsu,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.4-rc4]
[also build test ERROR on linus/master next-20230601]
[cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/beomsu-kim/f2fs-including-waf-data-in-f2fs-status-information/20230531-162208
base:   7877cb91f1081754a1487c144d85dc0d2e2e7fc4
patch link:    https://lore.kernel.org/r/20230531082038epcms2p256f9db0d7ac377d404694354db1c3ebc%40epcms2p2
patch subject: [PATCH] f2fs: including waf data in f2fs status information
config: x86_64-randconfig-a005-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011750.kDn4yxlq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/3a2228fdedf76cc8448b358d07b77eb26d1299a4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review beomsu-kim/f2fs-including-waf-data-in-f2fs-status-information/20230531-162208
        git checkout 3a2228fdedf76cc8448b358d07b77eb26d1299a4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011750.kDn4yxlq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/f2fs/iostat.c: In function 'iostat_info_seq_show':
>> fs/f2fs/iostat.c:37:37: error: implicit declaration of function 'F2FS_STAT'; did you mean 'F2FS_CKPT'? [-Werror=implicit-function-declaration]
      37 |         struct f2fs_stat_info *si = F2FS_STAT(sbi);
         |                                     ^~~~~~~~~
         |                                     F2FS_CKPT
>> fs/f2fs/iostat.c:37:37: warning: initialization of 'struct f2fs_stat_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> fs/f2fs/iostat.c:46:46: error: invalid use of undefined type 'struct f2fs_stat_info'
      46 |                 data_written_to_storage += si->sbi->iostat_bytes[j];
         |                                              ^~
   fs/f2fs/iostat.c:48:43: error: invalid use of undefined type 'struct f2fs_stat_info'
      48 |                 data_written_by_user += si->sbi->iostat_bytes[j];
         |                                           ^~
   cc1: some warnings being treated as errors


vim +37 fs/f2fs/iostat.c

    26	
    27	#define IOSTAT_INFO_SHOW(name, type)					\
    28		seq_printf(seq, "%-23s %-16llu %-16llu %-16llu\n",		\
    29				name":", sbi->iostat_bytes[type],		\
    30				sbi->iostat_count[type],			\
    31				iostat_get_avg_bytes(sbi, type))
    32	
    33	int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
    34	{
    35		struct super_block *sb = seq->private;
    36		struct f2fs_sb_info *sbi = F2FS_SB(sb);
  > 37		struct f2fs_stat_info *si = F2FS_STAT(sbi);
    38		int j;
    39		unsigned long long waf = 0;
    40		unsigned long long data_written_to_storage = 0, data_written_by_user = 0;
    41	
    42		if (!sbi->iostat_enable)
    43			return 0;
    44	
    45		for (j = FS_DATA_IO; j <= FS_CP_META_IO; j++)
  > 46			data_written_to_storage += si->sbi->iostat_bytes[j];
    47		for (j = FS_DATA_IO; j <= FS_CDATA_IO; j++)
    48			data_written_by_user += si->sbi->iostat_bytes[j];
    49	
    50		if (data_written_by_user > 0)
    51			waf = data_written_to_storage * 100 / data_written_by_user;
    52	
    53		seq_printf(seq, "time:		%-16llu\n", ktime_get_real_seconds());
    54		seq_printf(seq, "\t\t\t%-16s %-16s %-16s\n",
    55					"io_bytes", "count", "avg_bytes");
    56	
    57		/* print app write IOs */
    58		seq_puts(seq, "[WRITE]\n");
    59		IOSTAT_INFO_SHOW("app buffered data", APP_BUFFERED_IO);
    60		IOSTAT_INFO_SHOW("app direct data", APP_DIRECT_IO);
    61		IOSTAT_INFO_SHOW("app mapped data", APP_MAPPED_IO);
    62		IOSTAT_INFO_SHOW("app buffered cdata", APP_BUFFERED_CDATA_IO);
    63		IOSTAT_INFO_SHOW("app mapped cdata", APP_MAPPED_CDATA_IO);
    64	
    65		/* print fs write IOs */
    66		IOSTAT_INFO_SHOW("fs data", FS_DATA_IO);
    67		IOSTAT_INFO_SHOW("fs cdata", FS_CDATA_IO);
    68		IOSTAT_INFO_SHOW("fs node", FS_NODE_IO);
    69		IOSTAT_INFO_SHOW("fs meta", FS_META_IO);
    70		IOSTAT_INFO_SHOW("fs gc data", FS_GC_DATA_IO);
    71		IOSTAT_INFO_SHOW("fs gc node", FS_GC_NODE_IO);
    72		IOSTAT_INFO_SHOW("fs cp data", FS_CP_DATA_IO);
    73		IOSTAT_INFO_SHOW("fs cp node", FS_CP_NODE_IO);
    74		IOSTAT_INFO_SHOW("fs cp meta", FS_CP_META_IO);
    75	
    76		/* print app read IOs */
    77		seq_puts(seq, "[READ]\n");
    78		IOSTAT_INFO_SHOW("app buffered data", APP_BUFFERED_READ_IO);
    79		IOSTAT_INFO_SHOW("app direct data", APP_DIRECT_READ_IO);
    80		IOSTAT_INFO_SHOW("app mapped data", APP_MAPPED_READ_IO);
    81		IOSTAT_INFO_SHOW("app buffered cdata", APP_BUFFERED_CDATA_READ_IO);
    82		IOSTAT_INFO_SHOW("app mapped cdata", APP_MAPPED_CDATA_READ_IO);
    83	
    84		/* print fs read IOs */
    85		IOSTAT_INFO_SHOW("fs data", FS_DATA_READ_IO);
    86		IOSTAT_INFO_SHOW("fs gc data", FS_GDATA_READ_IO);
    87		IOSTAT_INFO_SHOW("fs cdata", FS_CDATA_READ_IO);
    88		IOSTAT_INFO_SHOW("fs node", FS_NODE_READ_IO);
    89		IOSTAT_INFO_SHOW("fs meta", FS_META_READ_IO);
    90	
    91		/* print other IOs */
    92		seq_puts(seq, "[OTHER]\n");
    93		IOSTAT_INFO_SHOW("fs discard", FS_DISCARD_IO);
    94		IOSTAT_INFO_SHOW("fs flush", FS_FLUSH_IO);
    95	
    96		/* print waf */
    97		seq_puts(seq, "[WAF]\n");
    98		seq_printf(seq, "fs waf:		%llu.%02llu\n", waf / 100, waf % 100);
    99	
   100		return 0;
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

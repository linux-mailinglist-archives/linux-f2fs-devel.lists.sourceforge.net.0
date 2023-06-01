Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D1B71933C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 08:30:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4bpW-0005X8-BD;
	Thu, 01 Jun 2023 06:30:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1q4bpS-0005Wh-1z
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 06:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MCcvq9BPsAsGWM3ai+5jI8C2U2wjcsNZG0HVhKBchBU=; b=fTC+qreYUNsnCind0mYM7/ABai
 en2jou08eiz2cFTDi+NNVel3TDUAgx1jsYAkO9V3s+R3yiTn3cwwP9XQ/LSUPB5byq/QjKZhH8rHD
 Whgh8Hq+IsmsuSiwOoAIIjg8wQQa3wqFbtuG7HXRZhuC/S0dHVjKkStqYJJ1/kCbzdSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MCcvq9BPsAsGWM3ai+5jI8C2U2wjcsNZG0HVhKBchBU=; b=YISTR+EHZrD27KGfRAuhmQBzP1
 kM5IcBZIS3iRLQ/Vbf/ECMH1QESSUys/LEL08sLucPhvPFNc16ZOEc3liT/+K5VC8/qvEsqnI469e
 tVW4BFuhcyfZnHq0iv92bFdCBA+u1z1Vy10p1h+DkyvKtc+uk8WTMhDWJAxGBiYMcMcQ=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4bpP-0083tq-WE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 06:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685601032; x=1717137032;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z668EnpKrSGrlD56vE6qiil0fRmPsI7NbSqs14itwR8=;
 b=HQyQqj0QWGT6F9JvkWqjqOYfnXN5NyFvGsJ9hhYJlld87gbpqmTLcEzI
 6u0yS6uFX6v4c7nHrhtIG4762rdEG0/P0oz0FqfQQ0RvZyvP1SSSJMDAh
 qXoRJAwOYTVbRPELvvXbTESGuW1xMxieFwD8GQDfXCw7ImcgiWr9T58K8
 nf4l6ISNpOQvq+Tn63wmnxTz0JP29VQFFCzw9Koa3jc15Vpx6M2nfsHut
 Unbj8B6bJL+lv4j6EtTwa9ORIZkL/kL2L6a+/F3fugnBvMD87rcvGJVWr
 rQYhjq1Mz5LlIKdlu9deNnkNgoqiD+RWy+JMQNY8gPpyNA7TKF9f93s0t g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="352966990"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; d="scan'208";a="352966990"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 23:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="881499754"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; d="scan'208";a="881499754"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 31 May 2023 23:30:07 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q4bp0-00020L-2m;
 Thu, 01 Jun 2023 06:30:06 +0000
Date: Thu, 1 Jun 2023 14:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: beomsu kim <beomsu7.kim@samsung.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <202306011410.W02TPFn1-lkp@intel.com>
References: <20230531082038epcms2p256f9db0d7ac377d404694354db1c3ebc@epcms2p2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230531082038epcms2p256f9db0d7ac377d404694354db1c3ebc@epcms2p2>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi beomsu,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on v6.4-rc4] [also build test ERROR on linus/master
 next-20230601] [cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev] [If
 your patch is applied to the wrong git tree, kind [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.93 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4bpP-0083tq-WE
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
Cc: llvm@lists.linux.dev, Seonghun Kim <seonghun-sui.kim@samsung.com>,
 oe-kbuild-all@lists.linux.dev, Seokhwan Kim <sukka.kim@samsung.com>
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
config: x86_64-randconfig-x065-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011410.W02TPFn1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3a2228fdedf76cc8448b358d07b77eb26d1299a4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review beomsu-kim/f2fs-including-waf-data-in-f2fs-status-information/20230531-162208
        git checkout 3a2228fdedf76cc8448b358d07b77eb26d1299a4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011410.W02TPFn1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/f2fs/iostat.c:37:30: error: implicit declaration of function 'F2FS_STAT' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           struct f2fs_stat_info *si = F2FS_STAT(sbi);
                                       ^
>> fs/f2fs/iostat.c:37:25: warning: incompatible integer to pointer conversion initializing 'struct f2fs_stat_info *' with an expression of type 'int' [-Wint-conversion]
           struct f2fs_stat_info *si = F2FS_STAT(sbi);
                                  ^    ~~~~~~~~~~~~~~
>> fs/f2fs/iostat.c:46:32: error: incomplete definition of type 'struct f2fs_stat_info'
                   data_written_to_storage += si->sbi->iostat_bytes[j];
                                              ~~^
   fs/f2fs/iostat.c:37:9: note: forward declaration of 'struct f2fs_stat_info'
           struct f2fs_stat_info *si = F2FS_STAT(sbi);
                  ^
   fs/f2fs/iostat.c:48:29: error: incomplete definition of type 'struct f2fs_stat_info'
                   data_written_by_user += si->sbi->iostat_bytes[j];
                                           ~~^
   fs/f2fs/iostat.c:37:9: note: forward declaration of 'struct f2fs_stat_info'
           struct f2fs_stat_info *si = F2FS_STAT(sbi);
                  ^
   1 warning and 3 errors generated.


vim +/F2FS_STAT +37 fs/f2fs/iostat.c

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

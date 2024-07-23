Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2F893A8C2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 23:32:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWN7C-0005xm-6v;
	Tue, 23 Jul 2024 21:32:10 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1sWN7A-0005xg-RV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 21:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XHNYKugtE19gvqT4wq80ODscpg+uPF4spV/fTNcunaw=; b=Ke8f8w8eW7Ihd9VQ0Y6IInxhFm
 AjQQ952uKMxjdiWLSxpcqS95gpL4q8KM5O7SK0YV7Z1SrpzsMqcBd0vnXoIuNFJ2HJtWXuxv0WSll
 AkuSN+jrtUTjRu7avkkz84gcGs9NpVcc+XRTr7p/qFLvpWWSIDQCVUY7Dd0+UFrO0Egw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XHNYKugtE19gvqT4wq80ODscpg+uPF4spV/fTNcunaw=; b=ILYzZsh/GvlpiLeBDrr3/DcXzs
 2Q7Ds9S7SUvYyqKlxdM7eunzhL3kLG50teqcnv3RMGGPpmUf44AaHLKSHbsdTJMQCh2qfk3wuiF8t
 8EJB/4XXVc+t5qc2+eIzDqi25FExg92N2CS0IoTh37qrTbariCECx6uF458EjDyA3BEM=;
Received: from mgamail.intel.com ([198.175.65.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWN79-0004s6-QC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 21:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721770328; x=1753306328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=emqRXC4zbFB95UYh4yI6o+bUQDFgG7kIbVNfc6B+a/s=;
 b=PBodOEhHozomkdhcoNHyE4xXk7rp6ifrbSXhUCRgvakKFaFOV/wlse88
 9OKJ0RzJx9nzSDZxiIXkWUov8ZdZhPDT783oMuEyRi6dHM0lohkkaJg3Y
 xsarkak6zz3nFLHNLqNQv+g6dDDSu1t50u6YoE43dbfVKCkQkamS/kLH4
 Gx8YsORpON/H3TV2oH6derRz1BCKbG1sFg8ZmZzDd+zeSsuitiSut7MZ0
 0OXt7rgEC2edieBeg8V+TdMsTp3oanOLtnryL1/C+DwO20moiuS/r8KDQ
 sPwv8v71DNfUdB/CvLsAeHBa6LtD0c67T4IX3b8pi2r/ce/WexAWeMHHg A==;
X-CSE-ConnectionGUID: rrgaUgbhTz2WRipFD0a4Pg==
X-CSE-MsgGUID: 8eyx2kHaTt2XkkKmAsa+cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="41946568"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="41946568"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 14:31:58 -0700
X-CSE-ConnectionGUID: 9PnZNZK5ROSFsJZBagkOvg==
X-CSE-MsgGUID: nknNECQjS+WNfr/mbbyZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="52598208"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 23 Jul 2024 14:31:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sWN6s-000mN4-1a;
 Tue, 23 Jul 2024 21:31:50 +0000
Date: Wed, 24 Jul 2024 05:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <youling.tang@linux.dev>, Arnd Bergmann <arnd@arndb.de>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Chris Mason <chris.mason@fusionio.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 tytso@mit.edu, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 Chao Yu <chao@kernel.org>, Christoph Hellwig <hch@infradead.org>
Message-ID: <202407240502.xqotqBQ1-lkp@intel.com>
References: <20240723083239.41533-5-youling.tang@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240723083239.41533-5-youling.tang@linux.dev>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Youling, kernel test robot noticed the following build
 warnings: [auto build test WARNING on kdave/for-next] [also build test WARNING
 on linus/master next-20240723] [cannot apply to jaegeuk-f2fs/dev-test
 jaegeuk-f2fs/dev
 soc/for-next v6.10] [If your patch is applie [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [198.175.65.9 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: git-scm.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.9 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.9 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWN79-0004s6-QC
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: Use module_{subinit,
 subeixt} helper macros
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
Cc: linux-arch@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-modules@vger.kernel.org, youling.tang@linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Youling,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master next-20240723]
[cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev soc/for-next v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youling-Tang/module-Add-module_subinit-_noexit-and-module_subeixt-helper-macros/20240723-164434
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20240723083239.41533-5-youling.tang%40linux.dev
patch subject: [PATCH 4/4] f2fs: Use module_{subinit, subeixt} helper macros
config: arm64-randconfig-002-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240502.xqotqBQ1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240502.xqotqBQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240502.xqotqBQ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:13:
   fs/f2fs/f2fs.h: In function 'f2fs_create_root_stats':
>> fs/f2fs/f2fs.h:4131:1: warning: no return statement in function returning non-void [-Wreturn-type]
    4131 | static inline int __init f2fs_create_root_stats(void) { }
         | ^~~~~~
--
   In file included from fs/f2fs/data.c:25:
   fs/f2fs/f2fs.h: In function 'f2fs_create_root_stats':
>> fs/f2fs/f2fs.h:4131:1: warning: no return statement in function returning non-void [-Wreturn-type]
    4131 | static inline int __init f2fs_create_root_stats(void) { }
         | ^~~~~~
   fs/f2fs/data.c: In function 'f2fs_mpage_readpages':
   fs/f2fs/data.c:2373:17: warning: variable 'index' set but not used [-Wunused-but-set-variable]
    2373 |         pgoff_t index;
         |                 ^~~~~
--
   aarch64-linux-ld: warning: orphan section `.subexitcall.exit' from `fs/ext4/super.o' being placed in section `.subexitcall.exit'
   aarch64-linux-ld: warning: orphan section `.subinitcall.init' from `fs/ext4/super.o' being placed in section `.subinitcall.init'
>> aarch64-linux-ld: warning: orphan section `.subexitcall.exit' from `fs/f2fs/super.o' being placed in section `.subexitcall.exit'
>> aarch64-linux-ld: warning: orphan section `.subinitcall.init' from `fs/f2fs/super.o' being placed in section `.subinitcall.init'
   aarch64-linux-ld: warning: orphan section `.subexitcall.exit' from `fs/ext4/super.o' being placed in section `.subexitcall.exit'
   aarch64-linux-ld: warning: orphan section `.subinitcall.init' from `fs/ext4/super.o' being placed in section `.subinitcall.init'
>> aarch64-linux-ld: warning: orphan section `.subexitcall.exit' from `fs/f2fs/super.o' being placed in section `.subexitcall.exit'
>> aarch64-linux-ld: warning: orphan section `.subinitcall.init' from `fs/f2fs/super.o' being placed in section `.subinitcall.init'
   aarch64-linux-ld: warning: orphan section `.subexitcall.exit' from `fs/ext4/super.o' being placed in section `.subexitcall.exit'
   aarch64-linux-ld: warning: orphan section `.subinitcall.init' from `fs/ext4/super.o' being placed in section `.subinitcall.init'
>> aarch64-linux-ld: warning: orphan section `.subexitcall.exit' from `fs/f2fs/super.o' being placed in section `.subexitcall.exit'
>> aarch64-linux-ld: warning: orphan section `.subinitcall.init' from `fs/f2fs/super.o' being placed in section `.subinitcall.init'


vim +4131 fs/f2fs/f2fs.h

  4128	
  4129	static inline int f2fs_build_stats(struct f2fs_sb_info *sbi) { return 0; }
  4130	static inline void f2fs_destroy_stats(struct f2fs_sb_info *sbi) { }
> 4131	static inline int __init f2fs_create_root_stats(void) { }
  4132	static inline void f2fs_destroy_root_stats(void) { }
  4133	static inline void f2fs_update_sit_info(struct f2fs_sb_info *sbi) {}
  4134	#endif
  4135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

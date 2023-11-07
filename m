Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF447E3568
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Nov 2023 07:58:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0G2H-0007P6-Fh;
	Tue, 07 Nov 2023 06:58:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1r0G2G-0007Oz-Cz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 06:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QiYxqFDBvD/T9Q6dkDI21CM/+s0KgrqSvFWjWO9pRZI=; b=bdrDp7DhuyGfJt5mgd66hadynD
 GULl7Y3trejgYrHFTuftk215xnlOWwOycbNzRdVsYS/gSGxhcQdaaoes4xmDyDZu2uthW94L+1wge
 05HhS8nVR36Aagq7TIeDX+IOhPuow3zaJa7menUWKYnA9879dO7mTjJGBTFuzBdOoFLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QiYxqFDBvD/T9Q6dkDI21CM/+s0KgrqSvFWjWO9pRZI=; b=SdGvFtwZsYQxwHVYvh+Z+b4T7H
 T+fKov2k6xGDNrpHt4j+KSawFnqouVyUQm9aoFVG0x1pPYnUl6MIC7PsQ8cvQ+T2lHyILofoGEjMJ
 5+yx66CNFxkFwTQYk5uBsISr+e21ZdQ1S8FLFKNWlPLyZt2xkyRVy8TUH4GV33qb0ZVM=;
Received: from mgamail.intel.com ([198.175.65.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r0G2D-0005Bf-A0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 06:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699340282; x=1730876282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eHKi3cWMbNTKD8oTr73ZVJofUYlGiNX/ZJ7LuaMkJsU=;
 b=aDqLC4ESFhkkBerWxSrtArk8IyIU3tneHNvezhGr8+oLeejhIAQH/kMt
 2qAd0DxJprFVWLuTbCqcx0GdBpgHCgyfRl0EvyRT3qzsXbuWGvnqJnfYj
 Ty+Nh9z0W6CneViX9bfwwYNJC+s/I7BcIoeiZhp9iZBrEtXiSxpsVf0NB
 uSE6SPk2rdKAM7KAsJFlib1x50ayaxQtDM5xbT/jCDg8JkFikTYBcQAsU
 QKYe8LGZv+85W1W0R9LxWePakwr84LduVEImPfac3RyljwcFoEjpiA6uF
 EJujVql7ZRy7WUDih8nNLVhLwlYRlsI24ySBCZ7K5PqKQtniqtL1CLxTe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="8091597"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="8091597"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 22:42:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="936052345"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="936052345"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 06 Nov 2023 22:42:24 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r0Fn4-0006y4-0X;
 Tue, 07 Nov 2023 06:42:22 +0000
Date: Tue, 7 Nov 2023 14:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: dslab@lzu.edu.cn, jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202311071353.SmED46lo-lkp@intel.com>
References: <20231106121418.3675-1-dslab@lzu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231106121418.3675-1-dslab@lzu.edu.cn>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, kernel test robot noticed the following build errors:
 [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test ERROR on
 jaegeuk-f2fs/dev linus/master v6.6 next-20231107] [If your patch is applied
 to the wrong git tree, kindly drop us a note. And [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r0G2D-0005Bf-A0
Subject: Re: [f2fs-dev] [PATCH] f2fs: the name of a struct is wrong in a
 comment.
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
Cc: Yang Hubin <yanghb2019@lzu.edu.cn>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master v6.6 next-20231107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/dslab-lzu-edu-cn/f2fs-the-name-of-a-struct-is-wrong-in-a-comment/20231106-201822
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20231106121418.3675-1-dslab%40lzu.edu.cn
patch subject: [PATCH] f2fs: the name of a struct is wrong in a comment.
config: parisc-randconfig-001-20231107 (https://download.01.org/0day-ci/archive/20231107/202311071353.SmED46lo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311071353.SmED46lo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311071353.SmED46lo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/f2fs/segment.c:9:
>> include/linux/f2fs_fs.h:474:66: error: expected ']' before 'SIT_JOURNA'
     474 |                                 sizeof(struct nat_journal_entry))SIT_JOURNA
         |                                                                  ^~~~~~~~~~
   include/linux/f2fs_fs.h:501:23: note: in expansion of macro 'NAT_JOURNAL_RESERVED'
     501 |         __u8 reserved[NAT_JOURNAL_RESERVED];
         |                       ^~~~~~~~~~~~~~~~~~~~
>> include/linux/f2fs_fs.h:502:1: warning: no semicolon at end of struct or union
     502 | } __packed;
         | ^


vim +474 include/linux/f2fs_fs.h

   468	
   469	#define SUM_JOURNAL_SIZE	(F2FS_BLKSIZE - SUM_FOOTER_SIZE -\
   470					SUM_ENTRY_SIZE)
   471	#define NAT_JOURNAL_ENTRIES	((SUM_JOURNAL_SIZE - 2) /\
   472					sizeof(struct nat_journal_entry))
   473	#define NAT_JOURNAL_RESERVED	((SUM_JOURNAL_SIZE - 2) %\
 > 474					sizeof(struct nat_journal_entry))SIT_JOURNA
   475	#define SIT_JOURNAL_ENTRIES	((SUM_JOURNAL_SIZE - 2) /\
   476					sizeof(struct sit_journal_entry))
   477	#define SIT_JOURNAL_RESERVED	((SUM_JOURNAL_SIZE - 2) %\
   478					sizeof(struct sit_journal_entry))
   479	
   480	/* Reserved area should make size of f2fs_extra_info equals to
   481	 * that of nat_journal and sit_journal.
   482	 */
   483	#define EXTRA_INFO_RESERVED	(SUM_JOURNAL_SIZE - 2 - 8)
   484	
   485	/*
   486	 * frequently updated NAT/SIT entries can be stored in the spare area in
   487	 * summary blocks
   488	 */
   489	enum {
   490		NAT_JOURNAL = 0,
   491		SIT_JOURNAL
   492	};
   493	
   494	struct nat_journal_entry {
   495		__le32 nid;
   496		struct f2fs_nat_entry ne;
   497	} __packed;
   498	
   499	struct nat_journal {
   500		struct nat_journal_entry entries[NAT_JOURNAL_ENTRIES];
   501		__u8 reserved[NAT_JOURNAL_RESERVED];
 > 502	} __packed;
   503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

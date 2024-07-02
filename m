Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4657924A16
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 23:52:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOlQa-0006lC-Kd;
	Tue, 02 Jul 2024 21:52:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1sOlQY-0006l3-GR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 21:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5x0zt1XbztS8FaCBSurhk40AsbuZQhd9drW8nBfXYhQ=; b=kx/SyDnkf1aNBt4/9EUgrM2Rxt
 E5Ele4zv0psDmoNrUWInGPDFWiFtN8CwxoB/7xd9TVV6sxlqVlqALIRTK5uNAjalEWzl35W2PCc6V
 77aZ0IXbTKVhHHknPUKRto2xUHCk4e7mbjv2mQk/VfetUjKBQWqzAmQoL1oe5aCe3ODw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5x0zt1XbztS8FaCBSurhk40AsbuZQhd9drW8nBfXYhQ=; b=msqn9iLwkzzdPZ409chQqZrTui
 MZfjzGQvMtSQOAvuHRIWkL5T25OoMV5ZG5pvrmo81S5XXViW8E0ZyauQs1411NyFW9m88sYGbAhz2
 iDD/fnCmmWsMexEiUgVgnVIvZ4uK9qovRfgWUnhnz+CLT4UM6MvEVPnDfOjLOx3CjWwQ=;
Received: from mgamail.intel.com ([198.175.65.17])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOlQX-00077o-N1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 21:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719957161; x=1751493161;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2vi2262ofkIpSqDu0RdKa2alzQl8bJKkhCzzzh5dGsE=;
 b=VKZDpWY6HnEjSLuBJ/0WUuvOPbpjLdIshUZ7evF67TTOGGZrBncsSGDD
 D2TPMcOE4d/WWyRtREZzC572QiXyXfVseGHEjqHKCjpS7yj++40myl4Fw
 busKoMifcvM0m73JmxVC3FryBmNkAJsHBPhMe4jTIHrTJzoWBoLAqpuTl
 END02nXdljOCXki2yJZpMIlc/CdFfbUS7HrMDDqV2owiLDexfcz/EBtRP
 j45wTeQ9Alh6QJFNdHfKIlGQxctnSwv20l01He4sllYPC0qePJxUwKDdy
 cZ6JGoaTyoKxjenst2r7ZldsKUaF23CXozWH+zeAdQFdvS4p/NOGT9Z9T A==;
X-CSE-ConnectionGUID: dZenhXI+RWSN0IQGmul9jw==
X-CSE-MsgGUID: Kj5XLXceRiS7w0W1uKEO/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17279513"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="17279513"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 14:52:30 -0700
X-CSE-ConnectionGUID: ZPpZJ0HyQKC37SE5SYai4A==
X-CSE-MsgGUID: j3LNAZn7SSqsw/VaADq4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46452243"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 02 Jul 2024 14:52:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sOlQE-000Oiv-39;
 Tue, 02 Jul 2024 21:52:22 +0000
Date: Wed, 3 Jul 2024 05:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Sun <yi.sun@unisoc.com>, sunyibuaa@gmail.com, tj@kernel.org,
 jiangshanlai@gmail.com, jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202407030547.MbODytSE-lkp@intel.com>
References: <20240701075138.1144575-2-yi.sun@unisoc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701075138.1144575-2-yi.sun@unisoc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yi, kernel test robot noticed the following build errors:
 [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test ERROR on
 jaegeuk-f2fs/dev tj-wq/for-next linus/master v6.10-rc6 next-20240702] [If
 your patch is applied to the wrong git tree, kindly [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: git-scm.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.175.65.17 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.17 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.17 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sOlQX-00077o-N1
Subject: Re: [f2fs-dev] [PATCH v2 1/2] workqueue: new struct io_work
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
Cc: yunlongxing23@gmail.com, ebiggers@google.com, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 oe-kbuild-all@lists.linux.dev, yi.sun@unisoc.com, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yi,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev tj-wq/for-next linus/master v6.10-rc6 next-20240702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-Sun/workqueue-new-struct-io_work/20240701-155343
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20240701075138.1144575-2-yi.sun%40unisoc.com
patch subject: [PATCH v2 1/2] workqueue: new struct io_work
config: arc-tb10x_defconfig (https://download.01.org/0day-ci/archive/20240703/202407030547.MbODytSE-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030547.MbODytSE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030547.MbODytSE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: kernel/workqueue.o: in function `may_adjust_io_work_task_ioprio':
   kernel/workqueue.c:2682:(.text+0xbb0): undefined reference to `set_task_ioprio'
>> arc-elf-ld: kernel/workqueue.c:2682:(.text+0xbb0): undefined reference to `set_task_ioprio'
   arc-elf-ld: kernel/workqueue.o: in function `restore_io_work_task_ioprio':
   kernel/workqueue.c:2698:(.text+0xbc8): undefined reference to `set_task_ioprio'
   arc-elf-ld: kernel/workqueue.c:2698:(.text+0xbc8): undefined reference to `set_task_ioprio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

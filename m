Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF2917768
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jun 2024 06:33:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sMKL5-0000ay-D8;
	Wed, 26 Jun 2024 04:32:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1sMKL2-0000al-Jf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jun 2024 04:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ke6RM86lPy/oMm1oRfsG1Zaq4G1gygXuHm2w11s4FGo=; b=am64RHfN6jLzSaL5ra/uh0wDIY
 w68dxSPtPrZpjAtBrYQhAYW2NwnbbKoHj4UhGr9JStax9klTT1mYAxPd/Me/S1CXx4BWX51o5I/V4
 +Lvq+ySwtxdBrguWKNx/1wC7fwsiXIuFJFrIQefpfnchmCg11SNt4/bE6tJdAx/dLd9M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ke6RM86lPy/oMm1oRfsG1Zaq4G1gygXuHm2w11s4FGo=; b=KVz/uMhT2tYPSCxTGSqbxmIDKV
 U9alb+qO1Y+cttgTxm0sggOmi6ahI83gpkt67rD+h3A94zZyqERX7oCyWDkW/t77BsZ0obofqwJA8
 FGbpjtbkTntbCUpRMuZOjFzXj0pCEmhScx+05w8Qpg01hL2txQjnRVSo7epIcPJGeK9w=;
Received: from mgamail.intel.com ([192.198.163.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sMKL1-00054E-KK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jun 2024 04:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719376375; x=1750912375;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EEIDDclEXrFxIlDPjEEHaH4SxxP50Cs/OkDqBbkICAo=;
 b=aJxKtWZLW8k9q1ugaXM2YhhMkvnLHfEBUMIuaTZuszdkXwWdDkGKzhGy
 wxXMvHEXmRZMVG1hA6GSkrpGCn/9P3ipXBxYYXegpWJdFnHF6g81e8mCb
 8qNw2ofV3vabf4xBf7t1drcyaZ3sLcUVZkNWV8M0MvaECKPnocyf4CqYV
 RO0nJwOD/yevIzMCfWNtiuTVx/UIelqrSw4GSydkvhIttDUurXzbv0/P0
 y9ol2rZ8029MtNMVvVogYYQfJqyqvMWL5qFS1bzsQKYucbpp3cfvLS/Cl
 6kZzsG78nGgh/TrlnbMaDvg1jSCCtYYd36ymowmRGq530GUXi4h1tWpAs g==;
X-CSE-ConnectionGUID: 4pHV1JW/TFiup/1pIC3uGg==
X-CSE-MsgGUID: 1yToRpVwQVuDZH9ud+pqdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27047216"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="27047216"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 21:32:45 -0700
X-CSE-ConnectionGUID: BZXaXxd4SYmIa6XkquD/cA==
X-CSE-MsgGUID: JZgoqd7HTIu6stcORBAWKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="44308317"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 25 Jun 2024 21:32:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sMKKk-000Ez0-2V;
 Wed, 26 Jun 2024 04:32:38 +0000
Date: Wed, 26 Jun 2024 12:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Sun <yi.sun@unisoc.com>, sunyibuaa@gmail.com, tj@kernel.org,
 jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202406261201.0hc4qgvm-lkp@intel.com>
References: <20240621062617.595007-2-yi.sun@unisoc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621062617.595007-2-yi.sun@unisoc.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yi, kernel test robot noticed the following build errors:
 [auto build test ERROR on tj-wq/for-next] [also build test ERROR on
 jaegeuk-f2fs/dev-test
 jaegeuk-f2fs/dev linus/master v6.10-rc5 next-20240625] [If your patch is
 applied to the wrong git tree, kindly [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [192.198.163.11 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.11 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.11 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [192.198.163.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sMKL1-00054E-KK
Subject: Re: [f2fs-dev] [PATCH 1/2] workqueue: add io priority to work_struct
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
 jiangshanlai@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tj-wq/for-next]
[also build test ERROR on jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.10-rc5 next-20240625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-Sun/workqueue-add-io-priority-to-work_struct/20240625-165935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-next
patch link:    https://lore.kernel.org/r/20240621062617.595007-2-yi.sun%40unisoc.com
patch subject: [PATCH 1/2] workqueue: add io priority to work_struct
config: arm-randconfig-003-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261201.0hc4qgvm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261201.0hc4qgvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261201.0hc4qgvm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/workqueue.o: in function `restore_work_task_ioprio':
>> workqueue.c:(.text+0xd2e): undefined reference to `set_task_ioprio'
   arm-linux-gnueabi-ld: kernel/workqueue.o: in function `may_adjust_work_task_ioprio':
   workqueue.c:(.text+0xd18): undefined reference to `set_task_ioprio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

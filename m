Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60A93AAFE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 04:15:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWRXC-0006Vy-7w;
	Wed, 24 Jul 2024 02:15:18 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sWRXA-0006Vr-Qg
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MLUfk9gi7OCPJH9Y7tsnfPUpLHamp4aWw3nheTJInOk=; b=Id6xxIOiGL3dAfd0p8sTQ4+kk/
 vmoILeEDaNifyvLnMBRNeyjxfJdMp8hJIP3s7vKUFXI4axmgD2/qv0t99M7I9yqoE6Eg4XohlYBvP
 Ha0BNETlt4XLqkGPlmJ6Ri6dWZcdC1gBwYP852VXR78bkZ61YGzr3/rGS7VE5Gbvf3yk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MLUfk9gi7OCPJH9Y7tsnfPUpLHamp4aWw3nheTJInOk=; b=eQXe+7GWmiv5EdYDnIjDq3oQq6
 cLGVRIOapcdpz+/qnil2jV8+lIHdbM7cbhXZQ0+GDuqPO/loUlP6SjoA+UCNkJezaTPQN14g2NaDg
 GukpVXlvEzmHta0S/WmUXDZuicr7czelk3mvgxZeefMSs2i2Mvg+ogx+0JDDIvyKFoO8=;
Received: from out-170.mta1.migadu.com ([95.215.58.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWRXA-0002CX-21 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:15:17 +0000
Message-ID: <4b932baf-9b43-42cd-9d9b-8048009d6d42@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1721787309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLUfk9gi7OCPJH9Y7tsnfPUpLHamp4aWw3nheTJInOk=;
 b=h0HlnRfzLN2pF/0Djo3ulN2R/8hakmdUblUS8AMiDZvzdfcac3jnIdfoJnkofQkSy/5Kv4
 ruGT11NG/QXJU/JV90HgCY8W5hKXZ0PjyFwlGHLGr9cVWDehFUhwydQ4hZWs/TacOJtqIQ
 s6MbaR10dt+l4Zl2DHJZxMX7IgFCLUc=
Date: Wed, 24 Jul 2024 10:14:58 +0800
MIME-Version: 1.0
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Chris Mason
 <chris.mason@fusionio.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, tytso@mit.edu,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>,
 Christoph Hellwig <hch@infradead.org>
References: <20240723083239.41533-5-youling.tang@linux.dev>
 <202407240204.KcPiCniO-lkp@intel.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
In-Reply-To: <202407240204.KcPiCniO-lkp@intel.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 24/07/2024 02:51, kernel test robot wrote: > Hi Youling, 
 > > kernel test robot noticed the following build warnings: > > [auto build
 test WARNING on kdave/for-next] > [also build test WARNING on li [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.170 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.170 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWRXA-0002CX-21
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
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-modules@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 24/07/2024 02:51, kernel test robot wrote:
> Hi Youling,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on kdave/for-next]
> [also build test WARNING on linus/master next-20240723]
> [cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev soc/for-next v6.10]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Youling-Tang/module-Add-module_subinit-_noexit-and-module_subeixt-helper-macros/20240723-164434
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
> patch link:    https://lore.kernel.org/r/20240723083239.41533-5-youling.tang%40linux.dev
> patch subject: [PATCH 4/4] f2fs: Use module_{subinit, subeixt} helper macros
> config: i386-buildonly-randconfig-004-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240204.KcPiCniO-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240204.KcPiCniO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240204.KcPiCniO-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     In file included from fs/f2fs/node.c:16:
>>> fs/f2fs/f2fs.h:4131:57: warning: non-void function does not return a value [-Wreturn-type]
>      4131 | static inline int __init f2fs_create_root_stats(void) { }

I'll fix it later.
static inline int __init f2fs_create_root_stats(void) { return 0; }
>           |                                                         ^
>     1 warning generated.
> --
>     In file included from fs/f2fs/data.c:25:
>>> fs/f2fs/f2fs.h:4131:57: warning: non-void function does not return a value [-Wreturn-type]
>      4131 | static inline int __init f2fs_create_root_stats(void) { }
>           |                                                         ^
>     fs/f2fs/data.c:2373:10: warning: variable 'index' set but not used [-Wunused-but-set-variable]
>      2373 |         pgoff_t index;
>           |                 ^
>     2 warnings generated.
index = folio_index(folio);
This statement should be moved to CONFIG_F2FS_FS_COMPRESSION.

I'll send a separate patch to fix it if it needs to be modified.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E1D6D42F2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 13:06:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjI1M-0006Mf-26;
	Mon, 03 Apr 2023 11:06:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1pjI1K-0006MZ-Bv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 11:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=juCW158bZIhH8JsVsO3D0ASWe7mmX043Cg4yt6u/qKo=; b=gqzQoPWVHneVubnODvXMEqTuSB
 Cdb4Kusf6NkDAvziinwUeZ8wv3aRGupOlwO/1QceulNnxBx7bq21Kmbwrp+VlRbhqo60uTI4PfcCq
 DVpqMvz675KaAZEeD/PpEEHiNNGH1Lt1dQnBBEuOQ3woGPGb1eiJYgajtCvr/Kmqztao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=juCW158bZIhH8JsVsO3D0ASWe7mmX043Cg4yt6u/qKo=; b=cocPA2vb6t5kwYJ541Hfox3qCj
 pk2rLaDkHFtesRZxfvsbrzh9/0NKcMc5Q8dWWKpYupcwoNhdxjkO+FUa/D54kuyS8v6SSVOrqcpa5
 n7DmJgBjW2+UxdDgQooUWgSx3sgvAomJeZ00yH9gmEcDZO7rFMFFR0a0kphOqb34kvnE=;
Received: from mga05.intel.com ([192.55.52.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjI1J-00DhLd-HZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 11:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680520001; x=1712056001;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CqkvZ0UozjqPbCvZ0FQQl+3N0cFqmjk9EOtoxPrpbQs=;
 b=Vd4D1jZdKkmqKBfSQCtvQw2uZvCRf95vGidjDcKFb+Z0twwyQD7z4s5o
 J4ouzoTMxd039gR6V/7msL0ZbL9PVKq38fqRSjPlQsm5iL7nNsSSOVPvd
 2jdzlERgbGK4/klbR4OX00ERT5Fa9tEWyM2drHfyE+BApk/uvc7mD1+el
 CBJKXKHSBdyl9ZACDUts9K/HhSe2dl8Wtkbq+x7s1cd9eVeMyHlU97hBa
 Wx6Rtw7xRS77+ZL5l3Q4sNkM9n3a3bwcPflsGkHrp+kVbC1+XQUChyIz4
 0NyzyXzM/rCbVEBtgIl36OVyV/47TwfNVH5AdzpXA/zFKZ69zTzpP7+lC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="428155433"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="428155433"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 04:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="931980969"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="931980969"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2023 04:06:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pjI0g-000ODd-0X;
 Mon, 03 Apr 2023 11:06:02 +0000
Date: Mon, 3 Apr 2023 19:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202304031801.hGbHuuBP-lkp@intel.com>
References: <20230403031723.43870-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403031723.43870-1-frank.li@vivo.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yangtao,
 I love your patch! Yet something to improve: [auto
 build test ERROR on jaegeuk-f2fs/dev-test] [also build test ERROR on
 jaegeuk-f2fs/dev
 linus/master v6.3-rc5 next-20230331] [If your patch is applied to the wrong
 git tree, kindly drop us a note. [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.43 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjI1J-00DhLd-HZ
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: support FAULT_LOCK type fault
 injection
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
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, Yangtao Li <frank.li@vivo.com>,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yangtao,

I love your patch! Yet something to improve:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master v6.3-rc5 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/f2fs-support-FAULT_LOCK-type-fault-injection/20230403-111853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230403031723.43870-1-frank.li%40vivo.com
patch subject: [PATCH v4] f2fs: support FAULT_LOCK type fault injection
config: i386-randconfig-a006-20230403 (https://download.01.org/0day-ci/archive/20230403/202304031801.hGbHuuBP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7a551520921cdc8921f448714472af3014da4f50
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yangtao-Li/f2fs-support-FAULT_LOCK-type-fault-injection/20230403-111853
        git checkout 7a551520921cdc8921f448714472af3014da4f50
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304031801.hGbHuuBP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:13:
>> fs/f2fs/f2fs.h:2174:60: error: incompatible pointer types passing 'struct rw_semaphore *' to parameter of type 'struct f2fs_rwsem *' [-Werror,-Wincompatible-pointer-types]
           wait_event(sem->read_waiters, f2fs_down_read_trylock(sbi, &sem->internal_rwsem));
                                                                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/wait.h:343:6: note: expanded from macro 'wait_event'
           if (condition)                                                          \
               ^~~~~~~~~
   fs/f2fs/f2fs.h:2164:25: note: passing argument to parameter 'sem' here
                                           struct f2fs_rwsem *sem)
                                                              ^
>> fs/f2fs/f2fs.h:2174:60: error: incompatible pointer types passing 'struct rw_semaphore *' to parameter of type 'struct f2fs_rwsem *' [-Werror,-Wincompatible-pointer-types]
           wait_event(sem->read_waiters, f2fs_down_read_trylock(sbi, &sem->internal_rwsem));
                                                                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/wait.h:345:24: note: expanded from macro 'wait_event'
           __wait_event(wq_head, condition);                                       \
                                 ^~~~~~~~~
   include/linux/wait.h:325:31: note: expanded from macro '__wait_event'
           (void)___wait_event(wq_head, condition, TASK_UNINTERRUPTIBLE, 0, 0,     \
                                        ^~~~~~~~~
   include/linux/wait.h:310:7: note: expanded from macro '___wait_event'
                   if (condition)                                                  \
                       ^~~~~~~~~
   fs/f2fs/f2fs.h:2164:25: note: passing argument to parameter 'sem' here
                                           struct f2fs_rwsem *sem)
                                                              ^
   2 errors generated.


vim +2174 fs/f2fs/f2fs.h

  2170	
  2171	static inline void f2fs_down_read(struct f2fs_sb_info *sbi, struct f2fs_rwsem *sem)
  2172	{
  2173	#ifdef CONFIG_F2FS_UNFAIR_RWSEM
> 2174		wait_event(sem->read_waiters, f2fs_down_read_trylock(sbi, &sem->internal_rwsem));
  2175	#else
  2176		down_read(&sem->internal_rwsem);
  2177	#endif
  2178	}
  2179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE866D6B14
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 20:02:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjkyo-00036o-D3;
	Tue, 04 Apr 2023 18:02:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1pjkyl-00036h-A6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 18:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j+7ZCT+Pf0YcsfPITU7CN2rDsQIDtzejfhpbv6GMkxk=; b=kA6nTJqhy5o1prRrdKrKTYBqgS
 9kbo7UleSceV1lAcJwsMfC/FUVD4moepP/Ks5BkWY/wXVpgozwDQNQCE7qcT7V18UqRZN9Q81Qycu
 cH2TqrAF+rMsqVt6feeHZ93/a/XKFnkBqFd9YUi4yPghorzeWJt4KnfGRefNCrPQAG/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j+7ZCT+Pf0YcsfPITU7CN2rDsQIDtzejfhpbv6GMkxk=; b=i2UyWa+j9f5+l2Dt1S9LuixcYQ
 T7MxR/EWvgo2ArB8pdmYl/gL2WU/tyK4FokVZKLUXy1id3OG2ij3QtDcJJ3SXha6/HUtXGcXQbmMB
 p295S0C5plpBR4gepB57WPHwaNsGEveKUR0GIjSroi33Io2ywAimuY2cbR1v25u5msFA=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjkyi-0003yL-TJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 18:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680631316; x=1712167316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pKl3HEZ6pw4XTW76clROp444ezAtoai1AXFHPcYLmqk=;
 b=W3fylwzaYxU/Kc5ryb4NekLeznJv+ZD7HcH4i8hVw4+G8edVGtEtOykB
 XLFaFM0LuiSkF76QAEynwIyd6h2iicMnp7FDOWN5yJGFKnmjRZmGq+diN
 li1mjfhKA2P4nDfF2G+IMGzEAxBH1p2ZqlI4GM3rnKEJzN8KAVIuxgKQ9
 vdL6RX9G/eZz643VmNuVe2ycnlvm29JR/sO0oREjnj/ZwG6rfwVpJt5cU
 Vg5nybwWJCin15NmeFOH3LHgKHk8iFIQzVB+ekKq1VjN3L+eyOX+TOcVH
 67Y/T5zYxFJfC0Hg1C+s87cxhnXDV1m9NgD+zBkQb1XuzcQygNTvsEUhw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370081690"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="370081690"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="932533140"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="932533140"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 04 Apr 2023 11:01:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pjkyQ-000Py2-22;
 Tue, 04 Apr 2023 18:01:38 +0000
Date: Wed, 5 Apr 2023 02:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, djwong@kernel.org,
 dchinner@redhat.com, ebiggers@kernel.org, hch@infradead.org,
 linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Message-ID: <202304050102.zJkNrHah-lkp@intel.com>
References: <20230404145319.2057051-21-aalbersh@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-21-aalbersh@redhat.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Andrey,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on xfs-linux/for-next] [also build test ERROR on
 kdave/for-next
 tytso-ext4/dev jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.3-rc5]
 [cannot apply to next-20230404] [If [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.88 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjkyi-0003yL-TJ
Subject: Re: [f2fs-dev] [PATCH v2 20/23] xfs: add fs-verity support
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
Cc: linux-ext4@vger.kernel.org, agruenba@redhat.com,
 damien.lemoal@opensource.wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, oe-kbuild-all@lists.linux.dev, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 Andrey Albershteyn <aalbersh@redhat.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Andrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on kdave/for-next tytso-ext4/dev jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.3-rc5]
[cannot apply to next-20230404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Albershteyn/xfs-Add-new-name-to-attri-d/20230404-230224
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230404145319.2057051-21-aalbersh%40redhat.com
patch subject: [PATCH v2 20/23] xfs: add fs-verity support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230405/202304050102.zJkNrHah-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1324353702eaba7da1643d589631adcaedf9a046
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andrey-Albershteyn/xfs-Add-new-name-to-attri-d/20230404-230224
        git checkout 1324353702eaba7da1643d589631adcaedf9a046
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304050102.zJkNrHah-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'xfs_check_ondisk_structs',
       inlined from 'init_xfs_fs' at fs/xfs/xfs_super.c:2307:2:
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_1674' declared with attribute error: XFS: value of strlen(XFS_VERITY_DESCRIPTOR_NAME) is wrong, expected XFS_VERITY_DESCRIPTOR_NAME_LEN
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_ondisk.h:19:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      19 |         BUILD_BUG_ON_MSG((value) != (expected), \
         |         ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_ondisk.h:194:9: note: in expansion of macro 'XFS_CHECK_VALUE'
     194 |         XFS_CHECK_VALUE(strlen(XFS_VERITY_DESCRIPTOR_NAME),
         |         ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_1674 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

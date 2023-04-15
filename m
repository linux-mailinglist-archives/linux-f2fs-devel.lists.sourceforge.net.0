Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0CD6E31F3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Apr 2023 16:44:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pnh8A-0003rJ-Gf;
	Sat, 15 Apr 2023 14:43:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1pnh87-0003rC-E7
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Apr 2023 14:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rLb5Wt5AKgsDa+VHDggXzmMGBMowMRSRXgdcexTg3qk=; b=PxXl32Gl9z1fLpfBntTAHlVs27
 2c9fhjW0U4wZIcIJH0z11IqzL/Q351Xs8ytX8FDaOiYMyLmwmM5TAsDY074SgX9uX8Z+CVI7QyeMI
 uQVGNP0JQJ2x1FznK27n/+bLPCTK+P5femDJ5QX77ozuMpor93mwpTYJ+Rus52ooRcPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rLb5Wt5AKgsDa+VHDggXzmMGBMowMRSRXgdcexTg3qk=; b=SqqDFNCqXYyi9j9ILhg76Hn1IZ
 clEXrzYjr6yPHVfUwoTQvpVmtU31kj2CU4v0YfZOAnjBfM+Y9EGuI7BVNbdncW3Rrn4wyG2/hosE6
 2SG4GXzH/o/VmBsa2InRrXI8BbIgfXB1opXyNWb+bBm5w97eb3vmwq8gkFZmyfCeKnk0=;
Received: from mga04.intel.com ([192.55.52.120])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pnh86-008jiG-5T for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Apr 2023 14:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681569834; x=1713105834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c2lMCSvwqFQY1REy4vSaDvs3TbQ8k9zYaciNwSsJzNY=;
 b=O7dKs1aOgdfQ7AxGN7buLflQiuybWHZPh8pRtaqyNPVLuxqVZJHocTbe
 a6aKs7NQ/YH7NCSAVCH0qo2Rwz+aJbo1Tf/ZT3JKGiLSQsTGohdOPFbED
 H0Um/Qruvqy0xrBvs5r/ADUy1IdvKs1xmFddlAvBvdEz05zPucydLTu1l
 pB57DHPuCtW1zk+UFfzkdv+Z+U7/hqLkJ4FOUbTiAlkqwB6cts0bHahw5
 nz/gib/SdsGgz6v7MwBscNDi6/qkvIev16mkLYKzlJOHJt0yrMxV5U8VT
 U0jaVaIOWp1OW/JJpPFNwbrwTmJTCi7CiSTmdhUyZnUT6ozDNkqdU+lEs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="343407698"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="343407698"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2023 07:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="814269800"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="814269800"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 15 Apr 2023 07:43:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pnh7v-000b7l-1w;
 Sat, 15 Apr 2023 14:43:43 +0000
Date: Sat, 15 Apr 2023 22:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Message-ID: <202304152234.wjaY3IYm-lkp@intel.com>
References: <20230415132446.13063-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415132446.13063-1-frank.li@vivo.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yangtao, kernel test robot noticed the following build
 warnings: [auto build test WARNING on jaegeuk-f2fs/dev-test] [also build test
 WARNING on jaegeuk-f2fs/dev] [cannot apply to linus/master v6.3-rc6] [If
 your patch is applied to the wrong git tree, kindly drop us [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.120 listed in list.dnswl.org]
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
X-Headers-End: 1pnh86-008jiG-5T
Subject: Re: [f2fs-dev] [PATCH] f2fs: refactor struct f2fs_attr macro
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
Cc: linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yangtao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev]
[cannot apply to linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/f2fs-refactor-struct-f2fs_attr-macro/20230415-212520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230415132446.13063-1-frank.li%40vivo.com
patch subject: [PATCH] f2fs: refactor struct f2fs_attr macro
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304152234.wjaY3IYm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/280d6a5b38dd6b5a5303f5426e9f71466a13f047
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yangtao-Li/f2fs-refactor-struct-f2fs_attr-macro/20230415-212520
        git checkout 280d6a5b38dd6b5a5303f5426e9f71466a13f047
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152234.wjaY3IYm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/sysfs.c:981:1: warning: data definition has no type or storage class
     981 | FAULT_INFO_TYPE_GENERAL_RW_ATTR(inject_type);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/sysfs.c:981:1: error: type defaults to 'int' in declaration of 'FAULT_INFO_TYPE_GENERAL_RW_ATTR' [-Werror=implicit-int]
>> fs/f2fs/sysfs.c:981:1: warning: parameter names (without types) in function declaration
   fs/f2fs/sysfs.c:1045:27: error: 'f2fs_attr_inject_type' undeclared here (not in a function); did you mean 'f2fs_attr_inject_rate'?
    1045 | #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
         |                           ^~~~~~~~~~
   fs/f2fs/sysfs.c:1094:9: note: in expansion of macro 'ATTR_LIST'
    1094 |         ATTR_LIST(inject_type),
         |         ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +981 fs/f2fs/sysfs.c

   977	
   978	/* FAULT_INFO ATTR */
   979	#ifdef CONFIG_F2FS_FAULT_INJECTION
   980	FAULT_INFO_RATE_GENERAL_RW_ATTR(inject_rate);
 > 981	FAULT_INFO_TYPE_GENERAL_RW_ATTR(inject_type);
   982	#endif
   983	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

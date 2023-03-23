Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 570E46C5CB7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 03:38:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfAqM-0004Bj-GP;
	Thu, 23 Mar 2023 02:38:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1pfAqL-0004Bc-4m
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 02:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BdmJDKIfphMfgBtR7LuIBQXSb+73p1ykUF/o9VjYKZ4=; b=gYYYnBnzl5uT0tF2JXvP5hxFcm
 yp2wVpQSa2XM0viazLKRouopFDtpLDnReEYkMjb9XAARO2S2Bb8ZPusQ4Hf69y9d5ztILAidKjpfc
 yV3zGIMg+jkDrPzqxCqMU8I9E11UWcKPP+zNLmshnkZfIAAnrGKsqwVYwM34bjm4Sv7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BdmJDKIfphMfgBtR7LuIBQXSb+73p1ykUF/o9VjYKZ4=; b=A7EUWPIKJhNDyHGdBPpXjNgUDT
 n5goQMYTijs4IyRrRzc4HI3Tome3ZhmGxtPExblaCfU1DyvF7KVFPiRAKYdgn3T2miPKMoJRkrG4y
 4qi2V9wT1jEB8Zi2Zk1VICS+8WABT35jUoy6ileWJNIrwUyi0AAp/WIF1krLy0YIjv5E=;
Received: from mga04.intel.com ([192.55.52.120])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfAqL-0002hm-46 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 02:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679539101; x=1711075101;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NVzhAprKO7gzBk6TU2LvPqa0tyYsN5S2OZgjE9c3DBU=;
 b=F+gmAPSjS0k9ZhpcbJyObFcYXSreZi5ciCwVZoeHc4D5s388OvA7a+2B
 gNedRd6jm40pyJlMADX5mpDOfq5RtvXhaYfZg1UBpQb5+/jJzoJOJGiQH
 golhP4SzU58W0ABsUtn/sZXC7GHOuSIn8EJMD4jEvA6UTS6/RG6jH7/sR
 h/Bz1l7ETQS5rPOMb/2BWocrgOTUQ+ekHAUqk1l5L0IY27JqQXN6YqdFA
 y99/KfexDHkF+zKP4WxJFrdHicYzp6/j9C9ONGv4UgYRCLPHjTcoJ2qhg
 cZ1YZNB0UTrEUaAeWC6dJatWT1BfIfo2ptJ3+nTCvjzT1escOmlO8Y73k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338099620"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="338099620"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="712490028"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="712490028"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 22 Mar 2023 19:38:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pfAq5-000Dry-0L;
 Thu, 23 Mar 2023 02:38:05 +0000
Date: Thu, 23 Mar 2023 10:37:42 +0800
From: kernel test robot <lkp@intel.com>
To: Yohan Joung <jyh429@gmail.com>, jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202303231039.GKLRE8O5-lkp@intel.com>
References: <20230322131408.1192-1-jyh429@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322131408.1192-1-jyh429@gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yohan, Thank you for the patch! Yet something to improve:
 [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test ERROR on
 jaegeuk-f2fs/dev] [If your patch is applied to the wrong git tree, kindly
 drop us a note. And when submitting patch, we sugge [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfAqL-0002hm-46
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix align check for npo2
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
Cc: Yohan Joung <jyh429@gmail.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yohan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yohan-Joung/f2fs-fix-align-check-for-npo2/20230322-211529
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230322131408.1192-1-jyh429%40gmail.com
patch subject: [PATCH] f2fs: fix align check for npo2
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230323/202303231039.GKLRE8O5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3531dd5850533df89bd45af9fd59ed4693d6d5aa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yohan-Joung/f2fs-fix-align-check-for-npo2/20230322-211529
        git checkout 3531dd5850533df89bd45af9fd59ed4693d6d5aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231039.GKLRE8O5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [fs/f2fs/f2fs.ko] undefined!
>> ERROR: modpost: "__moddi3" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

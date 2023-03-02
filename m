Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AFE6A7AB4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Mar 2023 06:03:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pXb65-00059X-QT;
	Thu, 02 Mar 2023 05:03:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1pXb62-00059K-UE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Mar 2023 05:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o2JpzVVJAuoNTBc3u1jzjEuSW3k8ehdaxqp2TNtZI74=; b=QT1NaVoV1V8fqR8LTlpHLZO5Yw
 I4/bO2+8rZKW2QMk/stgGmjiD+nJlR0md2xpElhukopbBXG0U806iOFHDtJL7Cdjjv2PPvSGrn0qD
 25s1uiAvMwIRnS0Jt6gryI39c8XswPRHhKPYGPS5BvLe1Ms0UyC6kPGGtEDXggWPEfh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o2JpzVVJAuoNTBc3u1jzjEuSW3k8ehdaxqp2TNtZI74=; b=IsSOwAOaZg+oxcKjOXMkNtxSJO
 vjowiErstjbo07XRhGKU2kLQpIi99bxD6ktcmRvT2qlnlSq7AOijH9hPeJmVn71RzbBDRtIi8z5PD
 8KB8ERHck6L3kwZkDHlkZ8zuXba6WOHqBEtWo603kMOQ1BU5cQQejpBzNmwf+tqxlJxY=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pXb5x-0004va-TX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Mar 2023 05:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677733390; x=1709269390;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QCrY8IccKuFkKPyKDtCnKQ/AOitu19+NGq+DifguEqE=;
 b=dY2rAmZYnnBNoWeAtT4vxp3qhJpVrOQ1/Z0Yw715W0ldlcWgrrqCZCTk
 6xOe1hVnGqThhS0fg6xPAwlT3qDGfV1p65AT0Kwun8tkW+9Lrb2qr223J
 oqdBIjYqrkJ+OLvqkqMakC0aZmP1sMJUV9KxBNURzndEncJ3uHWztx596
 B/jKRUDoHJqMI+uYng7Oio3fwLPHrJXUdxvhxyH1QGdNZiV3YO1QNFByq
 5bKGoXmv0OFhT6mNFeuahwOwhNlIS+sFRJfuwSwamSAunqEWdtHXw4aod
 eco3m3zfAddGeDEfqttNbLnPuSj9oN8IEZLEStNL3mHOoG3L70OYPPABe g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332101779"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="332101779"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 21:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="1003963694"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="1003963694"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 01 Mar 2023 21:03:02 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pXb5p-0000Dx-2k;
 Thu, 02 Mar 2023 05:03:01 +0000
Date: Thu, 2 Mar 2023 13:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202303021251.ExUzrEYm-lkp@intel.com>
References: <20230301152212.53951-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230301152212.53951-1-frank.li@vivo.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yangtao,
 I love your patch! Yet something to improve: [auto
 build test ERROR on jaegeuk-f2fs/dev-test] [also build test ERROR on
 jaegeuk-f2fs/dev
 linus/master next-20230302] [cannot apply to v6.2] [If your patch is applied
 to the wrong git tree, kindly d [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.93 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pXb5x-0004va-TX
Subject: Re: [f2fs-dev] [PATCH] f2fs: add discard_cpuset mount opt
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
[also build test ERROR on jaegeuk-f2fs/dev linus/master next-20230302]
[cannot apply to v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/f2fs-add-discard_cpuset-mount-opt/20230301-232500
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230301152212.53951-1-frank.li%40vivo.com
patch subject: [PATCH] f2fs: add discard_cpuset mount opt
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230302/202303021251.ExUzrEYm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fdcaea1b50e37d5bcfcc186db80237edc04cfafc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yangtao-Li/f2fs-add-discard_cpuset-mount-opt/20230301-232500
        git checkout fdcaea1b50e37d5bcfcc186db80237edc04cfafc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021251.ExUzrEYm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kthread_bind_mask" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

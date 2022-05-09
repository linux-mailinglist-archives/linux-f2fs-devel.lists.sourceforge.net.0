Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF95207AE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 May 2022 00:30:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1noBtf-0004q4-Kv; Mon, 09 May 2022 22:30:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1noBtN-0004pn-8R
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 May 2022 22:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qtlh0uqS+ZoKvRt7eThXD9WFDQ3+bIWAtSqJ5UWSIWY=; b=KkuZAN5a6aLG3waP499m//xuQ2
 urMV2PjAmjxVhj+67HRFtXatQQsEqcjqg9olSv9qgeHA6Zi6UYNwU9/Ec8R+fcmPEbqhHJF8ImYUV
 HjZ8klfwSHRxn4tDF9X+b+sLat5Za9ImVEtaJV2piQMv5NjtJazGrDYsWfsiGrm1dMV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qtlh0uqS+ZoKvRt7eThXD9WFDQ3+bIWAtSqJ5UWSIWY=; b=UgQpT8yRzqA9jLF9J7z8RYYHxi
 UqJ3xu2QrGiM+tOahH5PbaVwzqFIj1SXZpbRkVI9QT0fWAxkOcwO5JgSjHa65nEHK71ZiYXZAxlbu
 M0SSbKxJEXmSEuDhme0+gUyuKPYBT3qWyWj9IdN7Zcf9QEpzxzJBMyBcXUkz9e/WQ3Bg=;
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1noBtJ-006lx9-Hz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 May 2022 22:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652135409; x=1683671409;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l7oUeQy/HV7AuYW8cUuoACsDI/rpWawVCuiMBlaqBSM=;
 b=gSz7Qic4NNaiQcH7gOVHHE9llRwHTsFNsbrr5CHVD/xfJ/fFpzfEcHj2
 IXSTPp3Yibwrwx8ELnl6Nh1em3I0n/++HilJ6R2cX6rmatRxud4nPIofl
 JhjcWwFk9M/bopMCtD/lYdM04l7w9eKP5ddg/cFDQpM4XvA3spE+cMz82
 2ATiTpcRb8RQPPQIQdsQfWYPAApiTyJVPOcv1zaBwn7dSOzmWjj+gRPYh
 oHIyl1JotfQr/yPf73lDxuRdx83CobHMTztKF040gk4uvwEmWxaO5g579
 jYZGuk4iFlJt5eLZqLwXIdnU+2GapYld38mKeH2GDIOKCTGLoxKq2Vw+i A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="329781755"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="329781755"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 15:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="593102653"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 09 May 2022 15:30:00 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1noBt9-000Gxw-Bh;
 Mon, 09 May 2022 22:29:59 +0000
Date: Tue, 10 May 2022 06:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>, tytso@mit.edu,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org
Message-ID: <202205100642.aJFfVuMb-lkp@intel.com>
References: <20220429182728.14008-8-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429182728.14008-8-krisman@collabora.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Gabriel, I love your patch! Perhaps something to improve:
 [auto build test WARNING on tytso-ext4/dev] [also build test WARNING on
 jaegeuk-f2fs/dev-test
 linus/master v5.18-rc6 next-20220509] [If your patch is applied to the wrong
 git tree, kindly drop us a no [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.31 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1noBtJ-006lx9-Hz
Subject: Re: [f2fs-dev] [PATCH v3 7/7] f2fs: Reuse generic_ci_match for ci
 comparisons
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
Cc: kernel@collabora.com, kbuild-all@lists.01.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Gabriel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on jaegeuk-f2fs/dev-test linus/master v5.18-rc6 next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/Clean-up-the-case-insenstive-lookup-path/20220430-022957
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20220510/202205100642.aJFfVuMb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/293ba304c3d9ce0d65df81e519822c3e66152acc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gabriel-Krisman-Bertazi/Clean-up-the-case-insenstive-lookup-path/20220430-022957
        git checkout 293ba304c3d9ce0d65df81e519822c3e66152acc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/f2fs/dir.c: In function 'f2fs_match_name':
>> fs/f2fs/dir.c:216:29: warning: unused variable 'u' [-Wunused-variable]
     216 |         struct unicode_name u;
         |                             ^


vim +/u +216 fs/f2fs/dir.c

   210	
   211	static inline int f2fs_match_name(const struct inode *dir,
   212					   const struct f2fs_filename *fname,
   213					   const u8 *de_name, u32 de_name_len)
   214	{
   215		struct fscrypt_name f;
 > 216		struct unicode_name u;
   217	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

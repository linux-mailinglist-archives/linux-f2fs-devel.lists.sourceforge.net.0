Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F505573F6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 09:29:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4HHU-0001FH-MO; Thu, 23 Jun 2022 07:29:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1o4HHS-0001FA-Gd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 07:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HCorMPvR4ZCch8BkLsoZ4DHL5v2XagS0WJPvQFaB+wg=; b=FcdpX7YqWzskPpejZ64memdl48
 7KEjVw2p9KK/hd1Y7f31WVYa8/Q6xH9Z0Ruy3AUjAwzUzoZxNYAOTiVZHB2OxGinraO94YVh54d1S
 Lc6bNSmene74WBmgUdbZqrfA/cOR1IwYszXq0+SaJWEzQsVnTqn9+m6wfnGL+nbLynWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HCorMPvR4ZCch8BkLsoZ4DHL5v2XagS0WJPvQFaB+wg=; b=bPSA4Qfm2tZ0pBxyu9POzZos71
 4wJg+MwxnQ1dB5U1tdCBkbWxKOa1WydKyoz3oM2BX9IuPfVhZHpXPwKtomIt31ZkLZkm0EFfw7Nyy
 hXgKWp3V5GAoOQbPcifa6sZLl7hASQ3/rlPKptKw7aYI7eQ1uPGF5/Rr0qetIyGOEmxA=;
Received: from mga05.intel.com ([192.55.52.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o4HHP-00056s-1G
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 07:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655969371; x=1687505371;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r6+u7rtwUPyah+DHyy+CWmgovPjWOMdGY0liClTcjRE=;
 b=Bf4vSTkN9ag/scFkfuuOH8x6dbHdaJndALwDzxXg3VDh2GTJlYiFM42c
 +Cd6t0t81FMD7742E2ANiIdPKxcbMYxtV92t/yZtoeas65fX5l6wsYd0t
 HSGxMDkSOvyOgnlic1CzgGJjdYp5WdMd3Pz6a/rdx55Mcj1tEKICWyZH3
 u43kKWgyy9SggFMrN7jokpjoxzj7u2YU62+8buk4Z8Vf07NYXCgNXiwS7
 JzNT9JJYiqm34lvd9XZ8uPx4iqIE/RhSnqXO5JqM6Wg/0NVbnR5CwHe2e
 nz8Rd6C0aHFK0jSjOo+Kf7UorWqdNPXATp7e/vtruA8Y+h9Oy7CuSQFAv A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="366970296"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="366970296"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 00:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="621218836"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 23 Jun 2022 00:29:21 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o4HHF-0000r3-2k;
 Thu, 23 Jun 2022 07:29:21 +0000
Date: Thu, 23 Jun 2022 15:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>,
 viro@zeniv.linux.org.uk, tytso@mit.edu, jaegeuk@kernel.org
Message-ID: <202206231550.0JrilBjp-lkp@intel.com>
References: <20220622194603.102655-7-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622194603.102655-7-krisman@collabora.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Gabriel,
 I love your patch! Yet something to improve: [auto
 build test ERROR on tytso-ext4/dev] [also build test ERROR on
 jaegeuk-f2fs/dev-test
 linus/master v5.19-rc3 next-20220622] [If your patch is applied to the wrong
 git tree, kindly drop us a note. [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o4HHP-00056s-1G
Subject: Re: [f2fs-dev] [PATCH 6/7] ext4: Enable negative dentries on
 case-insensitive lookup
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
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Gabriel,

I love your patch! Yet something to improve:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on jaegeuk-f2fs/dev-test linus/master v5.19-rc3 next-20220622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/Support-negative-dentries-on-case-insensitive-directories/20220623-034942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: x86_64-randconfig-a006 (https://download.01.org/0day-ci/archive/20220623/202206231550.0JrilBjp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/69488ccc517a48af2f1cec0efb84651397edf6f6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gabriel-Krisman-Bertazi/Support-negative-dentries-on-case-insensitive-directories/20220623-034942
        git checkout 69488ccc517a48af2f1cec0efb84651397edf6f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "d_set_casefold_lookup" [fs/ext4/ext4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

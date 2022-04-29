Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67B514524
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 11:13:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkMh7-0004ur-4K; Fri, 29 Apr 2022 09:13:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1nkMgg-0004uU-58
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 09:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bMHQE5XDDcoJWe9jLCR4bo+MV9U96x5tBgzDB6SgQ9w=; b=Vepe1aXnyWhx8/G4rgDUZnS3If
 yG2szYzlrAbX39APPdU9ZyYe/KWWvIjPgYBEOLTMA5+BBYWQU/dL0734KrKIyV/clQodB8Z/NBXWV
 OHtKmBEJjFTQulWiavzIzfwB3e5h84szqM2btPrtBns5oOkyez58HzSU3+shnhANpn/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bMHQE5XDDcoJWe9jLCR4bo+MV9U96x5tBgzDB6SgQ9w=; b=SLgabVF1tfa85DDFR+BMxU6N6r
 7UffuW3awUCwAzlD9+DsEUdj0hSRokDc2GrWaGQVaqzPJVSeQEmQx5/YZuEthHIGbceqUlIzhLVix
 twUuCIfzoboEfrcGzwAUwVTjy2MFMJqpepuf3jkVYWl0n0GjScFtlOPRIOUw2z/Biae4=;
Received: from mga05.intel.com ([192.55.52.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkMgb-0000q6-2d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 09:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651223593; x=1682759593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WvVA5+NEGvGHKo4bBbjpjpGTrqc4XhUW3hsaD3IKD4s=;
 b=g2Kup6Fxu+pwwbw8OvKISnA8Me8rcu7nrtvkcKGaNH5b4TBV7EOCXwcD
 kn907ycOeky/n20GDQZ01G/zU1t10HbVgnebbdgBwPfhwJGQkeJvMoqtX
 YRgiLfBd519t2AwJ1v14fPn7C9TbmTTh29Ifln7Gtga/BxEIcCNeNOAwC
 t/bzfJOMm+xQckeOmw9Ylz+Y58/asl1JCTqhzi4XezAWk43tgy2gHIyx9
 mDwanVlXBLO+5IX2qeiKM29Fmwfo53neexNuiyXbxahZ7SuXaXOcNptJZ
 XLi0gGrJL9SkmAc9e3aLiA5befPz9E04uf4eZhD3YBtkKELgvIHEUsxmu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="353017561"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="353017561"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 02:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="542303431"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 29 Apr 2022 02:13:03 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nkMgQ-0006Al-EM;
 Fri, 29 Apr 2022 09:13:02 +0000
Date: Fri, 29 Apr 2022 17:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>, tytso@mit.edu,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org
Message-ID: <202204291733.QRyzoWB6-lkp@intel.com>
References: <20220428221027.269084-8-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428221027.269084-8-krisman@collabora.com>
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
 linus/master v5.18-rc4 next-20220428] [If your patch is applied to the wrong
 git tree, kindly drop us a note. [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nkMgb-0000q6-2d
Subject: Re: [f2fs-dev] [PATCH v2 7/7] f2fs: Reuse generic_ci_match for ci
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

I love your patch! Yet something to improve:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on jaegeuk-f2fs/dev-test linus/master v5.18-rc4 next-20220428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/Clean-up-the-case-insenstive-lookup-path/20220429-061233
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: microblaze-buildonly-randconfig-r004-20220428 (https://download.01.org/0day-ci/archive/20220429/202204291733.QRyzoWB6-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8955999168ad8e2d440ec534ebe26830da9bc6f6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gabriel-Krisman-Bertazi/Clean-up-the-case-insenstive-lookup-path/20220429-061233
        git checkout 8955999168ad8e2d440ec534ebe26830da9bc6f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "generic_ci_match" [fs/f2fs/f2fs.ko] undefined!
ERROR: modpost: "generic_ci_match" [fs/ext4/ext4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

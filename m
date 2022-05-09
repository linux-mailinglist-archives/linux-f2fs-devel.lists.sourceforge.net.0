Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DF55205B5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 May 2022 22:14:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1no9ll-0001Xf-E7; Mon, 09 May 2022 20:14:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1no9lk-0001XY-3n
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 May 2022 20:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kjxqZ7Cj7yjdOSHgNV1DBh1xVYQcep4ciFOcGPAinNQ=; b=haMbivRFyNtyVPSek7m7lPhvFX
 jL8JPoB9iTsTa6D85rq/CfABMjp21hEVeMtqSG2Glfbc9MiQwVgKdNg0JTDv7cY28Ka/y+wFaba33
 IBscdqJVJf44ZbXBr+Ui2QHv3twcUwGBNSAJbUGUjzBnFXPdSGGZXIeigpB6ZnKZ4Bjk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kjxqZ7Cj7yjdOSHgNV1DBh1xVYQcep4ciFOcGPAinNQ=; b=biuukftU1ZVR5T8d2l5sI3pIwe
 y5bFzFsvn1VJSdIjNf2l7cGYgCWMC3DVZSAT9LCM0ZPh45lv4C8eSsTeLbr5Yq1QeJBr1perot1JE
 5edkaAWI+GlEjORnncDgUKN+xdTUIUgOPrzyGbFpLzcx61jXhsoL9H7n4FHmvyOrDZO8=;
Received: from mga04.intel.com ([192.55.52.120])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1no9lg-006fh4-PH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 May 2022 20:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652127248; x=1683663248;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=98NTZW356s2vkebqyy8B1DF/f4Bdfbp8TMw5zU5Y5mQ=;
 b=gqx7L0vNx0IOAq/j41Zbls92ukQrmw4ZMZkpEnndPgnXWZDX3bWTrNVZ
 cyJ6psmGg/cVTobh9HH0t9UeoVOYMmOjFmyu5VYehlYLYxLFKNw6bQEOW
 EgE6TQ/ewAvNb+beNf1d6HNTe7xQdUSWks+EsOZm1b3NecHObq2GqT8kv
 VeG26AczUgnsdg/YzR6UIorkh5fJmJYOXBLnHZc6WL6G9Gfz8nbK5iNma
 /bGOktms9QWtVC4LzbrWQocYD+o058HfYzdXwTfwtz9puHgzFV5B9Z7Bf
 Mh/PUCIU/GxTpctxLahsohalIr+46I5vf0kB+6xJYuuw1ueopnSTof0R0 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="268001358"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="268001358"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 13:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="570331315"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 09 May 2022 13:13:56 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1no9lT-000GrS-QF;
 Mon, 09 May 2022 20:13:55 +0000
Date: Tue, 10 May 2022 04:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>, tytso@mit.edu,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org
Message-ID: <202205100425.howJyxrE-lkp@intel.com>
References: <20220429182728.14008-4-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429182728.14008-4-krisman@collabora.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Gabriel, I love your patch! Perhaps something to improve:
 [auto build test WARNING on tytso-ext4/dev] [also build test WARNING on
 jaegeuk-f2fs/dev-test
 linus/master v5.18-rc6 next-20220509] [If your patch is applied to the wrong
 git tree, kindly drop us a no [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1no9lg-006fh4-PH
Subject: Re: [f2fs-dev] [PATCH v3 3/7] ext4: Implement ci comparison using
 unicode_name
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
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20220510/202205100425.howJyxrE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/825d568247e8fc56f2f7e657c434936c7961cefc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gabriel-Krisman-Bertazi/Clean-up-the-case-insenstive-lookup-path/20220430-022957
        git checkout 825d568247e8fc56f2f7e657c434936c7961cefc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/ext4/ fs/f2fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/ext4/namei.c: In function 'ext4_match':
   fs/ext4/namei.c:1431:13: warning: unused variable 'ret' [-Wunused-variable]
    1431 |         int ret;
         |             ^~~
>> fs/ext4/namei.c:1429:29: warning: unused variable 'u' [-Wunused-variable]
    1429 |         struct unicode_name u;
         |                             ^


vim +/u +1429 fs/ext4/namei.c

  1419	
  1420	/*
  1421	 * Test whether a directory entry matches the filename being searched for.
  1422	 *
  1423	 * Return: %true if the directory entry matches, otherwise %false.
  1424	 */
  1425	static bool ext4_match(struct inode *parent,
  1426				      const struct ext4_filename *fname,
  1427				      struct ext4_dir_entry_2 *de)
  1428	{
> 1429		struct unicode_name u;
  1430		struct fscrypt_name f;
  1431		int ret;
  1432	
  1433		if (!de->inode)
  1434			return false;
  1435	
  1436		f.usr_fname = fname->usr_fname;
  1437		f.disk_name = fname->disk_name;
  1438	#ifdef CONFIG_FS_ENCRYPTION
  1439		f.crypto_buf = fname->crypto_buf;
  1440	#endif
  1441	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

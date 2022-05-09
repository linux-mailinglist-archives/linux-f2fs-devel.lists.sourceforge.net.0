Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26403520432
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 May 2022 20:09:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1no7ox-0008Ug-JZ; Mon, 09 May 2022 18:09:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1no7ow-0008Ua-6Y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 May 2022 18:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wk/XU5UOCvsT0360eVfIFFZGzFQ/oQcfTG/2JsEsax0=; b=kXrS/fxL4ZK7pGqLwLO7AW4KJD
 x6aCU8TRRqHkWeo+ABy5oKfaTe5BvOq3bSKByI8d/kPyp7rB570fMpFRKtaxsd5cdNAu1xqcTmKXT
 wneA0RtnJMLp7t3n+UWD/elyqtdcW56mDtwQftyYhEjP+fXd4I/aUD5x0v1feiagdrq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wk/XU5UOCvsT0360eVfIFFZGzFQ/oQcfTG/2JsEsax0=; b=mkUFsMBzmcNWbVnNvDHPN329wm
 LmSF3goZAI3dYhaVYcKe9JBUAk5C5TyjIpChfgTzDhqoj7JK5PYgJxnzl3mO0ez3lTAgSelA2Dcow
 4zB1L8TA5/oWWLeh9cTMrftxKLYdOepnZMM+WFxfdgwrp8n6x6sUByFT+qUpF8QnekKk=;
Received: from mga02.intel.com ([134.134.136.20])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1no7ot-006XhI-2w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 May 2022 18:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652119759; x=1683655759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8ZI7mfbzahJdoiSrtu+vjsMRnRrViVdIknttglmat18=;
 b=Eu4qz/tAc0WdsclKqPsuSTIm3of0cFDu02ws2U5YaS3q+IdcIt3zpyt6
 ZD4b1kU0sRhni+NsMz4kOVvuNzbzvcXnBpN6BvKzI92RvkZJ/yJje1Cny
 YDTx485JpDt0Do8k4c8GLdvi20RMJ+YfEXF4W4A1ynTzoMqvGVkQp5vew
 wwIoytPhTTpJY4t6Pv4tj07Bz/rSzLZ1IEPZ0peOtsYNGVxHM2PltyFDT
 oAi0BR6D21wcsgUsssJ0sJpI91/gIZ5WJCAjXPYWo9gosIFbUuuVkfXQ8
 yun/1cqHstWn6HX3EMf6QJ6N9nq71nWjxjrb8hgl1+ivsOnyWOsi3X5B+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="256666555"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="256666555"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 11:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="894473113"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 09 May 2022 11:08:51 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1no7oQ-000Gko-I8;
 Mon, 09 May 2022 18:08:50 +0000
Date: Tue, 10 May 2022 02:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>, tytso@mit.edu,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org
Message-ID: <202205100125.ebeEi8X2-lkp@intel.com>
References: <20220429182728.14008-2-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429182728.14008-2-krisman@collabora.com>
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
 medium trust [134.134.136.20 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [134.134.136.20 listed in wl.mailspike.net]
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
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1no7ot-006XhI-2w
Subject: Re: [f2fs-dev] [PATCH v3 1/7] ext4: Match the f2fs ci_compare
 implementation
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
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20220510/202205100125.ebeEi8X2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/6bf2e9e6750865e9e033adc185eacd37e8b5b0dd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gabriel-Krisman-Bertazi/Clean-up-the-case-insenstive-lookup-path/20220430-022957
        git checkout 6bf2e9e6750865e9e033adc185eacd37e8b5b0dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/ext4/ fs/f2fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/ext4/namei.c: In function 'ext4_match':
>> fs/ext4/namei.c:1430:13: warning: unused variable 'ret' [-Wunused-variable]
    1430 |         int ret;
         |             ^~~


vim +/ret +1430 fs/ext4/namei.c

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
  1429		struct fscrypt_name f;
> 1430		int ret;
  1431	
  1432		if (!de->inode)
  1433			return false;
  1434	
  1435		f.usr_fname = fname->usr_fname;
  1436		f.disk_name = fname->disk_name;
  1437	#ifdef CONFIG_FS_ENCRYPTION
  1438		f.crypto_buf = fname->crypto_buf;
  1439	#endif
  1440	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 380CD8133A3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 15:53:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDn53-00048V-Hi;
	Thu, 14 Dec 2023 14:52:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1rDn51-00048K-0q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 14:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dUnKdLTurK1dJtZ0w34BOhxy2DT7t6QIaXujat2v8PM=; b=bVZj81ovMvlQZN6BAmNDW4hv32
 saMmfb1Mpg5D4nDkEbRcnmGd2E75Pq95+VBSyoYgJ5fFjzzqafE6x01A3MxE/R3tdX+Y7V6+QkBQH
 OKLk02my0ItAMi6dxhtT7ldl6EfI5IlK/W8CcMhrXLq7onBNopZ7zNtSVckImD5wA8ys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dUnKdLTurK1dJtZ0w34BOhxy2DT7t6QIaXujat2v8PM=; b=Oa5oVHUuj0JgEwX7pSkfuGDbOC
 bDX59Kk8/hk9L9G6QLBIZRBpUzHmVfnDfkHZkApGeMFPuTU0xQ3YtGL86Yxq82/mTHGuTyRJV3iCP
 BVW7BBmF+01YvgbDcqGLOr7bQRj4ejGLZPxUvzJoumcZuybcE36+jnHJIPe4hcl3W3Rw=;
Received: from mgamail.intel.com ([192.55.52.93])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDn4x-0002Ao-Ei for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 14:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702565567; x=1734101567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ODhwqCqXmS7joN9elVUFunOPRQ2tuEhEQcIHRfDVNIw=;
 b=mpe0RgHF7s4f/jOZwk2U+TAhXEnz8IsAO1Pl/SXOXoWbNRThf4EkGPRj
 MaHl2P4iw0vkB91URSppAee20QWx/6zhVfVHLidhb9uOaJJR5m1V+/k7k
 I9CP+FWsn6UlfnUqpmSV8/dFKbM6ZxCZ/sfetrJ3WfclloVChHeRUVVaW
 uj34ic/OjzvA8aSgcCb0WL7rNoe38LmRnkbIHE3dSpWwfj3KMiVwe5q2D
 wASO517NxqfU+72cGOcKWhP+x5ZFupTwgDJSQeEoCS0iIlvUuYKGHmJyi
 cjLsTyGoItEbluLCI6aiHxlLu06hppsV00eFsClsiEQc30xF1eTxlbcie A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="392303424"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="392303424"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:52:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892491877"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="892491877"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 14 Dec 2023 06:52:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rDn4i-000MBk-1f;
 Thu, 14 Dec 2023 14:52:32 +0000
Date: Thu, 14 Dec 2023 22:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>, viro@zeniv.linux.org.uk,
 ebiggers@kernel.org, jaegeuk@kernel.org, tytso@mit.edu
Message-ID: <202312142213.uyrNJniX-lkp@intel.com>
References: <20231213234031.1081-9-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231213234031.1081-9-krisman@suse.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Gabriel, kernel test robot noticed the following build
 warnings: [auto build test WARNING on jaegeuk-f2fs/dev-test] [also build test
 WARNING on jaegeuk-f2fs/dev tytso-ext4/dev linus/master v6.7-rc5
 next-20231214]
 [If your patch is applied to the wrong git tree, kin [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.93 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDn4x-0002Ao-Ei
Subject: Re: [f2fs-dev] [PATCH 8/8] fscrypt: Move d_revalidate configuration
 back into fscrypt
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Gabriel Krisman Bertazi <krisman@suse.de>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Gabriel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev tytso-ext4/dev linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/dcache-Add-helper-to-disable-d_revalidate-for-a-specific-dentry/20231214-074322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20231213234031.1081-9-krisman%40suse.de
patch subject: [PATCH 8/8] fscrypt: Move d_revalidate configuration back into fscrypt
config: x86_64-randconfig-123-20231214 (https://download.01.org/0day-ci/archive/20231214/202312142213.uyrNJniX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312142213.uyrNJniX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142213.uyrNJniX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/libfs.c:1778:39: warning: unused variable 'generic_encrypted_dentry_ops' [-Wunused-const-variable]
   static const struct dentry_operations generic_encrypted_dentry_ops = {
                                         ^
   1 warning generated.


vim +/generic_encrypted_dentry_ops +1778 fs/libfs.c

608af703519a58 Daniel Rosenberg 2020-11-19  1776  
608af703519a58 Daniel Rosenberg 2020-11-19  1777  #ifdef CONFIG_FS_ENCRYPTION
608af703519a58 Daniel Rosenberg 2020-11-19 @1778  static const struct dentry_operations generic_encrypted_dentry_ops = {
608af703519a58 Daniel Rosenberg 2020-11-19  1779  	.d_revalidate = fscrypt_d_revalidate,
608af703519a58 Daniel Rosenberg 2020-11-19  1780  };
608af703519a58 Daniel Rosenberg 2020-11-19  1781  #endif
608af703519a58 Daniel Rosenberg 2020-11-19  1782  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

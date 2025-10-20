Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1204CBF3C77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Oct 2025 23:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xo9H4jNqJTM3DhaCGmOB3Z2SZNWo2lnM29zyOslAaj4=; b=Ltgjlz9XVVehgYHe14ADIb90lj
	JShF59TRb6agXkXfrRmZ5UiDbbtLY6iW5ZNuOowrlL8cj5mhxGBTW8o6Bksqy/gXYtfRVeUNlte8G
	3dOqJufFM4nweZkZjlTmggue+QYJRtVQKO7LdFihNL0ZA+W1sMHfKL5HcM0vARhFMtRY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vAxgL-00006M-Up;
	Mon, 20 Oct 2025 21:44:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1vAxgK-00006E-7N
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 21:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XlhwvXwoYCR9JXG/PZIfDjnMD22HUkhPmYzKCS6H7vw=; b=CMNI4AlL3UaFmeu/AKz0hZ0pgM
 i6qSmwISgG2s66DomWgXnK+9LgN9Fe8ZAWEBtC8oUMSVGCoqefrOwdzuSY1jBTRzboVMgwzWay3tc
 q/u0w95xf19yrBFwaSeSPq111pUjhdFIsLwr3Ja3GB1FyPdIKvtloBXyqhTCxg2zakis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XlhwvXwoYCR9JXG/PZIfDjnMD22HUkhPmYzKCS6H7vw=; b=I
 N/+fwZO8vdkpKeR3UoIHckoDrPe4V2fOpL3SC+D5b5VtcGUNEzoyo+kw690OkrMwigBs06MaT09PB
 R5QpwJLzmlygnLUOcfAXLugS1hj3kTTWfjQeSI2SL03xsH+FZtmJCQSfaVzfRi8IMfqvcm0ViAyuV
 WSi5t9LqvS2eBOow=;
Received: from mgamail.intel.com ([192.198.163.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vAxgJ-000862-Lf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 21:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760996684; x=1792532684;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=TdqPhK2oSqzhQWHD2plO/33DziiQxFST67/1Lm1SR90=;
 b=OLpC159V5Kwd2dhlgYH6/PkP4f8MgpCjFt9tk+lCDK/i6Jp4NsVDodl6
 nwHl49S61SysP6Ju9T6PekjUNy4xsIdpkdU/xG+rD4kppG0nqVwL6cL8P
 jFex/dldcj4K/TbFK1Od3QawneI89oZvV0E90ddCju5fIvdRAsPssvxm+
 h2IHBiNwCO/rSjtyG6Knp4Yojl/4LIQgRIelYEym8kb+CBSy8k39jjOiG
 Ui+FEOHBoayF/odGMR/cmpYGCm82ipc5qyiObXaCvTXuDcrCFL5Zj8RLM
 PIWhfYySOiuxiHkGDmdxad/auzy0HtWm0DWvk4XFZr9nQq4xs9JmUoCGB g==;
X-CSE-ConnectionGUID: Ys703F1zTLWjza2yRlacBA==
X-CSE-MsgGUID: SfeQrlH8SGmMaAgbEBbtOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74464063"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="74464063"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:44:38 -0700
X-CSE-ConnectionGUID: FXOobT3LSSqbkd3fpgkqHQ==
X-CSE-MsgGUID: q5Bmp6XjTdicTRvXmKBNJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="187452039"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 20 Oct 2025 14:44:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vAxgA-000ABR-2U;
 Mon, 20 Oct 2025 21:44:34 +0000
Date: Tue, 21 Oct 2025 05:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <202510210534.6otvnCrN-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 29604ca50fd305d7fb8bea7a031dbb25275c4336 commit:
 5792ac38f3d5b1ebb2399e149395d8a622302f9c
 [14/15] f2fs: use global [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vAxgJ-000862-Lf
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 14/15] fs/f2fs/xattr.c:26:19:
 sparse: sparse: symbol 'inline_xattr_slab' was not declared. Should it be
 static?
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   29604ca50fd305d7fb8bea7a031dbb25275c4336
commit: 5792ac38f3d5b1ebb2399e149395d8a622302f9c [14/15] f2fs: use global inline_xattr_slab instead of per-sb slab cache
config: x86_64-randconfig-r111-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210534.6otvnCrN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210534.6otvnCrN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210534.6otvnCrN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/xattr.c:844:1: sparse: sparse: no newline at end of file
>> fs/f2fs/xattr.c:26:19: sparse: sparse: symbol 'inline_xattr_slab' was not declared. Should it be static?

vim +/inline_xattr_slab +26 fs/f2fs/xattr.c

    25	
  > 26	struct kmem_cache *inline_xattr_slab;
    27	static void *xattr_alloc(struct f2fs_sb_info *sbi, int size, bool *is_inline)
    28	{
    29		if (likely(size == DEFAULT_XATTR_SLAB_SIZE)) {
    30			*is_inline = true;
    31			return f2fs_kmem_cache_alloc(inline_xattr_slab,
    32						GFP_F2FS_ZERO, false, sbi);
    33		}
    34		*is_inline = false;
    35		return f2fs_kzalloc(sbi, size, GFP_NOFS);
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

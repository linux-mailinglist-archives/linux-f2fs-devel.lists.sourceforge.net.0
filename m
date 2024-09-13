Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B90E977993
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Sep 2024 09:25:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sp0fr-0002u2-UA;
	Fri, 13 Sep 2024 07:24:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1sp0fp-0002tw-Oi
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 07:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZByVLXIUAVESYR15NEpFrphycW/eW/PwfVFbMCN+tjY=; b=dPwBTrhNkyc5r2XBRt0pjMShrz
 RBaIfNu+qXaEvrDgcqInmPctmrb38ShBlyNdJGuaSqW+uxRVqKOsrJpcwIr5B8xnZvCljzWTFIkAb
 2qSHMD1MmpFP6JIwbTASuymfReaNT8i/yKp6JYV6jlaA2WLJNcgGYQBkIs48hNzYz7R0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZByVLXIUAVESYR15NEpFrphycW/eW/PwfVFbMCN+tjY=; b=BO1fhl/dauIe9Z8YOhsoaGiAc2
 Nf/E1UHcCThsR/Adazd355k73PZUu0wBMfPKSkosM5a+BmPVmEWxYoT9Tp7lq98nt0fWhe49RL9kp
 xma/+8mgdTVdAKVKAA2ZKdZPVNAWLdznNjVDvtc4ZEmizymDPjIu7SBFjSs9jF+CflBs=;
Received: from mgamail.intel.com ([198.175.65.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sp0fk-0002VV-Vu for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 07:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726212293; x=1757748293;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cAJ2hc6styUeyvqM7IkmTg7zicHXIvNVTcF+iiLVlH0=;
 b=EVIE0oCB2dlLFKZcD423zUZSBdrk59un4whsPDr7WouCqSG1ppFAZYg+
 ZNB8WXCwd3G75F6tZZSwvOEbj05yYN+nRBNWVKQCDhs5g/ylqRnVQtBwa
 3Sl7ZsYi+6EmU7WKb6J0vw5WjdFaGE476cl9wZduKHmm8geo7bPQDQe/a
 Or1E+VZAJyp4x2ZPEKfC+lSHnMdjFB3sw2is9XTQ/gBTL+EQFcAGMRK5q
 ZaIpPKVAV83Dm9Y5uyhKhoQ7RMGl8luS/jA5AE8g7rfrpOHvbIhLdEoe5
 CNPs8BaqZp2RCeZ+bSv/k+q6g7GqP4jjFnKAAdmjz+o+pESTvwCV3jY+2 A==;
X-CSE-ConnectionGUID: xHISaoEqToSAbFOwhWI0Hg==
X-CSE-MsgGUID: 1qa/0Z8WSqytow8Yr7JjuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36449460"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="36449460"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 00:24:42 -0700
X-CSE-ConnectionGUID: Ap6loFj6TAau8vbuXS7KOQ==
X-CSE-MsgGUID: fLxY4fpNQv2k4at0hR2Z6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="72565824"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2024 00:24:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sp0fV-00068O-2s;
 Fri, 13 Sep 2024 07:24:37 +0000
Date: Fri, 13 Sep 2024 15:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Wu Bo <bo.wu@vivo.com>, linux-kernel@vger.kernel.org
Message-ID: <202409131549.6E5c04Zg-lkp@intel.com>
References: <57e1dbb2f348ab61cbc82be7161d788a08b5fbed.1726024117.git.bo.wu@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57e1dbb2f348ab61cbc82be7161d788a08b5fbed.1726024117.git.bo.wu@vivo.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Wu,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on 67784a74e258a467225f0e68335df77acd67b7ab] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.12 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sp0fk-0002VV-Vu
Subject: Re: [f2fs-dev] [PATCH v2 13/13] f2fs: implement inline tail forward
 recovery
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
Cc: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 oe-kbuild-all@lists.linux.dev, Wu Bo <wubo.oduw@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Wu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67784a74e258a467225f0e68335df77acd67b7ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Wu-Bo/f2fs-add-inline-tail-mount-option/20240911-114705
base:   67784a74e258a467225f0e68335df77acd67b7ab
patch link:    https://lore.kernel.org/r/57e1dbb2f348ab61cbc82be7161d788a08b5fbed.1726024117.git.bo.wu%40vivo.com
patch subject: [PATCH v2 13/13] f2fs: implement inline tail forward recovery
config: x86_64-randconfig-121-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131549.6E5c04Zg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131549.6E5c04Zg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131549.6E5c04Zg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/inline.c:457:27: sparse: sparse: cast to restricted __le32

vim +457 fs/f2fs/inline.c

   416	
   417	int f2fs_recover_inline_tail(struct inode *inode, struct page *npage)
   418	{
   419		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
   420		struct f2fs_inode *ri = NULL;
   421		void *src_addr, *dst_addr;
   422		struct page *ipage;
   423	
   424		if (IS_INODE(npage))
   425			ri = F2FS_INODE(npage);
   426	
   427		if (f2fs_has_inline_tail(inode) &&
   428				ri && (le32_to_cpu(ri->i_flags) & F2FS_INLINE_TAIL)) {
   429	process_inline:
   430			if (!(ri->i_inline & F2FS_DATA_EXIST))
   431				return 0;
   432	
   433			ipage = f2fs_get_node_page(sbi, inode->i_ino);
   434			if (IS_ERR(ipage))
   435				return PTR_ERR(ipage);
   436	
   437			f2fs_wait_on_page_writeback(ipage, NODE, true, true);
   438	
   439			src_addr = inline_data_addr(inode, npage);
   440			dst_addr = inline_data_addr(inode, ipage);
   441			memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
   442	
   443			set_inode_flag(inode, FI_DATA_EXIST);
   444	
   445			set_page_dirty(ipage);
   446			f2fs_put_page(ipage, 1);
   447			return 0;
   448		}
   449	
   450		if (f2fs_has_inline_tail(inode)) {
   451			ipage = f2fs_get_node_page(sbi, inode->i_ino);
   452			if (IS_ERR(ipage))
   453				return PTR_ERR(ipage);
   454			f2fs_truncate_inline_inode(inode, ipage, 0);
   455			clear_inode_flag(inode, FI_INLINE_TAIL);
   456			f2fs_put_page(ipage, 1);
 > 457		} else if (ri && (le32_to_cpu(ri->i_inline) & F2FS_INLINE_TAIL)) {
   458			int ret;
   459	
   460			ret = f2fs_truncate_blocks(inode,
   461					COMPACT_ADDRS_PER_INODE >> PAGE_SHIFT, false);
   462			if (ret)
   463				return ret;
   464			goto process_inline;
   465		}
   466		return 0;
   467	}
   468	struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
   469						const struct f2fs_filename *fname,
   470						struct page **res_page)
   471	{
   472		struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
   473		struct f2fs_dir_entry *de;
   474		struct f2fs_dentry_ptr d;
   475		struct page *ipage;
   476		void *inline_dentry;
   477	
   478		ipage = f2fs_get_node_page(sbi, dir->i_ino);
   479		if (IS_ERR(ipage)) {
   480			*res_page = ipage;
   481			return NULL;
   482		}
   483	
   484		inline_dentry = inline_data_addr(dir, ipage);
   485	
   486		make_dentry_ptr_inline(dir, &d, inline_dentry);
   487		de = f2fs_find_target_dentry(&d, fname, NULL);
   488		unlock_page(ipage);
   489		if (IS_ERR(de)) {
   490			*res_page = ERR_CAST(de);
   491			de = NULL;
   492		}
   493		if (de)
   494			*res_page = ipage;
   495		else
   496			f2fs_put_page(ipage, 0);
   497	
   498		return de;
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

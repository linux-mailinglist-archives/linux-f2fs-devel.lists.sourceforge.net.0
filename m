Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE8596AC7E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 00:48:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slcJZ-0001fw-RI;
	Tue, 03 Sep 2024 22:47:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1slcJY-0001fq-Cd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 22:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gu46iluZAu8sVeXHcEJ0/g5EI5wyIZ2RXowRNqXHfd8=; b=d6OSNStZZ8gj6IxeuG1x8kW4Bf
 ngCdH35pI5i1tscjuYZ5e+JjXsbkPzgrYn5F/QD6PfJYGphhW/xTMExjD5M/EtRiWR1fMEaOICXiS
 9xQSw5/6aI+sdWGE422C9eQ0R3c+8O1DKHT/M0nf9uWcAwaTAX5KLylA+MIdgoDQCYrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gu46iluZAu8sVeXHcEJ0/g5EI5wyIZ2RXowRNqXHfd8=; b=i7a3nRofjpFW07KhNESmfUD4Pz
 NwFUxHvUPlYyW5ptt7eQiUoVCL7ks7GaSCJfhhOWeLx0Tuv0VNqPvbiymDxKFa0I8INsAEtqLY3JQ
 QRxdgrkyEJHfLieZmMD6KGswvymJYKnb+15A0Jyg5HyLIbU8OR/nCUmVAzvHbCfV57Lo=;
Received: from mgamail.intel.com ([192.198.163.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slcJS-0000XI-Uf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 22:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725403671; x=1756939671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iO/fNMW/wiTNAaqtQ6ViRfRRPRXDsdCIOiMd8CyEKww=;
 b=FiLlEpXP6jKQeYby6q7WDSX44aFCTfC7NWXyikyuNdNGYRiYKEJWGicb
 eNqJ7NBMy3oz8xVSvkgusWkCifzNA6pRJzzy4tOopuLKxRV75iKiAQPfE
 3ogCKnYiV9TDeqex89G6fhCUw9RhtvkYmuVcYlymfMpyKmj0vvIUANeaS
 4fHk14Z7a1p+3vJ3dmlL2I3Drxv1YpjsCJyJXv1qZonBlMHFVv/4kFW1N
 mktQFEad9VGkMWF2ESBVEDbDpuLNaJ/HNhTpkZybOrB9WQXBRP0HJrZLH
 xUfT6v2cc5UfvnaKXmEVZ7Nfdq8isXQCDwdQv9VpJVTC+z2cp07laeOwV w==;
X-CSE-ConnectionGUID: 4DSpht6ISPCTh65NuhtNHw==
X-CSE-MsgGUID: ZlfBogb1ToeGPyTsAo2LUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34637222"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="34637222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 15:47:40 -0700
X-CSE-ConnectionGUID: qDXGN2SpRcmbs2Z1fHbSoA==
X-CSE-MsgGUID: 7jsQSHVFTSO3IMmq2uCzug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69223688"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 03 Sep 2024 15:47:38 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1slcJD-0007JK-3D;
 Tue, 03 Sep 2024 22:47:35 +0000
Date: Wed, 4 Sep 2024 06:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Wu Bo <bo.wu@vivo.com>, linux-kernel@vger.kernel.org
Message-ID: <202409040652.Gn2vQXRR-lkp@intel.com>
References: <b6e9e02244cf2460df1256e257103e2c77fae2a9.1725334811.git.bo.wu@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6e9e02244cf2460df1256e257103e2c77fae2a9.1725334811.git.bo.wu@vivo.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Wu,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on v6.11-rc6] [also build test WARNING on
 linus/master]
 [cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev next-20240903] [If
 your patch is applied to the wrong git tree, [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.198.163.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slcJS-0000XI-Uf
Subject: Re: [f2fs-dev] [PATCH 13/13] f2fs: implement inline tail forward
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

[auto build test WARNING on v6.11-rc6]
[also build test WARNING on linus/master]
[cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev next-20240903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wu-Bo/f2fs-add-inline-tail-mount-option/20240903-164436
base:   v6.11-rc6
patch link:    https://lore.kernel.org/r/b6e9e02244cf2460df1256e257103e2c77fae2a9.1725334811.git.bo.wu%40vivo.com
patch subject: [PATCH 13/13] f2fs: implement inline tail forward recovery
config: arc-randconfig-r112-20240903 (https://download.01.org/0day-ci/archive/20240904/202409040652.Gn2vQXRR-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240904/202409040652.Gn2vQXRR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040652.Gn2vQXRR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/inline.c:428:34: sparse: sparse: restricted __le32 degrades to integer

vim +428 fs/f2fs/inline.c

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
 > 428				ri && (ri->i_flags & F2FS_INLINE_TAIL)) {
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
   457		} else if (ri && (ri->i_inline & F2FS_INLINE_TAIL)) {
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

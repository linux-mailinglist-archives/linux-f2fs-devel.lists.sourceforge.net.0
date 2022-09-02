Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 620DC5AB90A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 21:58:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oUCoL-0007bT-S7;
	Fri, 02 Sep 2022 19:58:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oUCoK-0007bM-8j
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 19:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DTiD0UDAHCowanUgvvoQMaLfSVgWjAaJf25jpBUdDhk=; b=N9iv4zaGZooPrQpAcBCm1cqzEK
 3QSVDCQwcwQWSFA+4NEuvbF6oYYxvYIASfGlL4rxMAS/SCo8sOp/xep+KfrIyDOAS1njqmLd2s5i+
 D9ZFXwFDu/mrYL6+N1iz+wt5xCUaO9ZpZqoJvDCFMampw0tL86Xd11ucAbaw1ehpCSRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DTiD0UDAHCowanUgvvoQMaLfSVgWjAaJf25jpBUdDhk=; b=bOkNgXJqY6C/mv2bLoOayIM5TQ
 mz7PXXNg+hHl7H5gi6ZYesed6eI6y0Y+L5l1dvobbp0bp2JsfkD8X2HnP2Y1lxKZrPEvwfzyUrawN
 YAyid4GUSGfkmbUtwR5vpjMNIKC9Dgbx26SsT1ETMV3NPdSg6mQ5ZSm5dNyj+kSxCJXs=;
Received: from mga09.intel.com ([134.134.136.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oUCoG-00Bjfa-JZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 19:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662148716; x=1693684716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G1QyHL0Y+ZESOJ/0sIvIcNrwO+n+VamVBy4zwBJD12w=;
 b=RxjPBeL5FnkdE+BJS37R0eIfCSIhNWQNm+TKqOqRaNrusHdjmq9llZpp
 QTQo/fEmCWtUpiAr/5hN5Wwv6RNOLOD3JGnS5loZ7H2VbMXYjOwoB4UXk
 nI45xg12BxjjhSF39Uz3cpaDdORM5GqF9RsG3gi4VLhEKMvpFLG7J8Eay
 ngO4LzuxcO4YcEKkFfoJo9SkzRW8mvSLYibIgsLCBtzNAWdNCmG3Uuvih
 gOO+s4eDER1Uec8e55ZlCoaBzyu2C6CIXROdXojn2xkwb3OrbL+bJncHe
 pEHPaDxp+5jUzo7TtU2m1qNApfvnbMITZGC8NSj7HspeP74vzjT84dL7Q w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="296859518"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="296859518"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 12:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="643037848"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 02 Sep 2022 12:58:20 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oUCnz-0000Yt-2J;
 Fri, 02 Sep 2022 19:58:19 +0000
Date: Sat, 3 Sep 2022 03:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
Message-ID: <202209030346.t02z8VfY-lkp@intel.com>
References: <20220901220138.182896-15-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901220138.182896-15-vishal.moola@gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi "Vishal,
 Thank you for the patch! Yet something to improve:
 [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test ERROR on
 kdave/for-next linus/master v6.0-rc3] [cannot apply to ceph-client/for-linus
 next-20220901] [If your patch is applied to the [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: githubusercontent.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [134.134.136.24 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.24 listed in list.dnswl.org]
 0.0 T_SPF_PERMERROR        SPF: test of record failed (permerror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oUCoG-00Bjfa-JZ
Subject: Re: [f2fs-dev] [PATCH 14/23] f2fs: Convert f2fs_write_cache_pages()
 to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 kbuild-all@lists.01.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi "Vishal,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on kdave/for-next linus/master v6.0-rc3]
[cannot apply to ceph-client/for-linus next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/Convert-to-filemap_get_folios_tag/20220902-060430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
config: hexagon-randconfig-r045-20220901 (https://download.01.org/0day-ci/archive/20220903/202209030346.t02z8VfY-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6c74320953cd3749db95f9f09c1fc7d044933635
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Moola-Oracle/Convert-to-filemap_get_folios_tag/20220902-060430
        git checkout 6c74320953cd3749db95f9f09c1fc7d044933635
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:3016:18: error: use of undeclared identifier 'nr_pages'; did you mean 'dir_pages'?
                                           &fbatch, i, nr_pages, true))
                                                       ^~~~~~~~
                                                       dir_pages
   include/linux/pagemap.h:1404:29: note: 'dir_pages' declared here
   static inline unsigned long dir_pages(struct inode *inode)
                               ^
>> fs/f2fs/data.c:3017:11: error: use of undeclared label 'lock_page'
                                           goto lock_page;
                                                ^
   2 errors generated.


vim +3016 fs/f2fs/data.c

  2908	
  2909	/*
  2910	 * This function was copied from write_cche_pages from mm/page-writeback.c.
  2911	 * The major change is making write step of cold data page separately from
  2912	 * warm/hot data page.
  2913	 */
  2914	static int f2fs_write_cache_pages(struct address_space *mapping,
  2915						struct writeback_control *wbc,
  2916						enum iostat_type io_type)
  2917	{
  2918		int ret = 0;
  2919		int done = 0, retry = 0;
  2920		struct folio_batch fbatch;
  2921		struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
  2922		struct bio *bio = NULL;
  2923		sector_t last_block;
  2924	#ifdef CONFIG_F2FS_FS_COMPRESSION
  2925		struct inode *inode = mapping->host;
  2926		struct compress_ctx cc = {
  2927			.inode = inode,
  2928			.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
  2929			.cluster_size = F2FS_I(inode)->i_cluster_size,
  2930			.cluster_idx = NULL_CLUSTER,
  2931			.rpages = NULL,
  2932			.nr_rpages = 0,
  2933			.cpages = NULL,
  2934			.valid_nr_cpages = 0,
  2935			.rbuf = NULL,
  2936			.cbuf = NULL,
  2937			.rlen = PAGE_SIZE * F2FS_I(inode)->i_cluster_size,
  2938			.private = NULL,
  2939		};
  2940	#endif
  2941		int nr_folios;
  2942		pgoff_t index;
  2943		pgoff_t end;		/* Inclusive */
  2944		pgoff_t done_index;
  2945		int range_whole = 0;
  2946		xa_mark_t tag;
  2947		int nwritten = 0;
  2948		int submitted = 0;
  2949		int i;
  2950	
  2951		folio_batch_init(&fbatch);
  2952	
  2953		if (get_dirty_pages(mapping->host) <=
  2954					SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
  2955			set_inode_flag(mapping->host, FI_HOT_DATA);
  2956		else
  2957			clear_inode_flag(mapping->host, FI_HOT_DATA);
  2958	
  2959		if (wbc->range_cyclic) {
  2960			index = mapping->writeback_index; /* prev offset */
  2961			end = -1;
  2962		} else {
  2963			index = wbc->range_start >> PAGE_SHIFT;
  2964			end = wbc->range_end >> PAGE_SHIFT;
  2965			if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
  2966				range_whole = 1;
  2967		}
  2968		if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
  2969			tag = PAGECACHE_TAG_TOWRITE;
  2970		else
  2971			tag = PAGECACHE_TAG_DIRTY;
  2972	retry:
  2973		retry = 0;
  2974		if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
  2975			tag_pages_for_writeback(mapping, index, end);
  2976		done_index = index;
  2977		while (!done && !retry && (index <= end)) {
  2978			nr_folios = filemap_get_folios_tag(mapping, &index, end,
  2979					tag, &fbatch);
  2980			if (nr_folios == 0)
  2981				break;
  2982	
  2983			for (i = 0; i < nr_folios; i++) {
  2984				struct folio *folio = fbatch.folios[i];
  2985				bool need_readd;
  2986	readd:
  2987				need_readd = false;
  2988	#ifdef CONFIG_F2FS_FS_COMPRESSION
  2989				if (f2fs_compressed_file(inode)) {
  2990					void *fsdata = NULL;
  2991					struct page *pagep;
  2992					int ret2;
  2993	
  2994					ret = f2fs_init_compress_ctx(&cc);
  2995					if (ret) {
  2996						done = 1;
  2997						break;
  2998					}
  2999	
  3000					if (!f2fs_cluster_can_merge_page(&cc,
  3001									folio->index)) {
  3002						ret = f2fs_write_multi_pages(&cc,
  3003							&submitted, wbc, io_type);
  3004						if (!ret)
  3005							need_readd = true;
  3006						goto result;
  3007					}
  3008	
  3009					if (unlikely(f2fs_cp_error(sbi)))
  3010						goto lock_folio;
  3011	
  3012					if (!f2fs_cluster_is_empty(&cc))
  3013						goto lock_folio;
  3014	
  3015					if (f2fs_all_cluster_page_ready(&cc,
> 3016						&fbatch, i, nr_pages, true))
> 3017						goto lock_page;
  3018	
  3019					ret2 = f2fs_prepare_compress_overwrite(
  3020								inode, &pagep,
  3021								folio->index, &fsdata);
  3022					if (ret2 < 0) {
  3023						ret = ret2;
  3024						done = 1;
  3025						break;
  3026					} else if (ret2 &&
  3027						(!f2fs_compress_write_end(inode,
  3028							fsdata, folio->index, 1) ||
  3029						 !f2fs_all_cluster_page_ready(&cc,
  3030							&fbatch, i, nr_folios,
  3031							false))) {
  3032						retry = 1;
  3033						break;
  3034					}
  3035				}
  3036	#endif
  3037				/* give a priority to WB_SYNC threads */
  3038				if (atomic_read(&sbi->wb_sync_req[DATA]) &&
  3039						wbc->sync_mode == WB_SYNC_NONE) {
  3040					done = 1;
  3041					break;
  3042				}
  3043	#ifdef CONFIG_F2FS_FS_COMPRESSION
  3044	lock_folio:
  3045	#endif
  3046				done_index = folio->index;
  3047	retry_write:
  3048				folio_lock(folio);
  3049	
  3050				if (unlikely(folio->mapping != mapping)) {
  3051	continue_unlock:
  3052					folio_unlock(folio);
  3053					continue;
  3054				}
  3055	
  3056				if (!folio_test_dirty(folio)) {
  3057					/* someone wrote it for us */
  3058					goto continue_unlock;
  3059				}
  3060	
  3061				if (folio_test_writeback(folio)) {
  3062					if (wbc->sync_mode != WB_SYNC_NONE)
  3063						f2fs_wait_on_page_writeback(
  3064								&folio->page,
  3065								DATA, true, true);
  3066					else
  3067						goto continue_unlock;
  3068				}
  3069	
  3070				if (!folio_clear_dirty_for_io(folio))
  3071					goto continue_unlock;
  3072	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

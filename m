Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9695ABA47
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 23:40:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oUEP0-0002bn-7j;
	Fri, 02 Sep 2022 21:40:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oUEOz-0002bg-FP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 21:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0jCukkhnBlF7Oq6mUDTOX3mm2uqAMe30rizyVw541S4=; b=aOXnA2a9yEoMXFNTtwWepJs+u2
 z0BVej0fEVKVr2l2LiyQty8+JARcifRFBHx3ay7OrPnijgus86c731kN7AhOPDHIRsWXueRS6nTlk
 Fv3yAaXSyj4rPFX0LVZKHb6z2K2aRE/ZnCEWf1iGx2e4XBiOstIH37FiMkBXW3WKvbNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0jCukkhnBlF7Oq6mUDTOX3mm2uqAMe30rizyVw541S4=; b=ZSwGulgOuLGOzkr9/P/HtpGujO
 /SG9/Y/V/vlQQtlw8zigobEYQ0vzYPxR1OzLP+9IKlO/we9a1IV6k9Wc3QwHyqqpEe7sU4MkNi8jC
 hZE28QkPcGCUbT7miSRUzBOv6bBRKQyS3C4A/19TjriiAhra9dBpM62NOcTG8fIwZUWY=;
Received: from mga14.intel.com ([192.55.52.115])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oUEOw-00BotK-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 21:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662154834; x=1693690834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HksWenRhyuRs7h/PR6mpnNs+GL/O4/v36GNHyfdYvWA=;
 b=jiyPRhvgtXFB7e0ZwEirhBuGxbvDlIgjQkzxSp0FqnJh5A4cUclOX8Qp
 6xowuy9+dVV36BBwL1agrBM7e8ZGQ7SmVMwwZUUTR8xLmKa7HXDI0g7J7
 4SRexudqLwWfooYeLjIrGcEkPevIthz9kJTgsyc6WMuY9mfl8o9h+ZY//
 vK7NY5YeAx+rSNA5svOdqM7fp/pdqtpd/IeCE+h6QYIRnm4TesicpDhcl
 0hbAGUynxLfFxMblRaLG1ewhlGpDiUX4D5w4XD8TQn1jxBV1wmGIXzLmM
 HVw4ywMvQ4jp1kVNcKwZSXWcS9aVRUNW0CLEG/39IGnunVfImK8iugh+/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="296099520"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="296099520"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 14:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="564106825"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 02 Sep 2022 14:40:25 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oUEOm-0000dc-2p;
 Fri, 02 Sep 2022 21:40:24 +0000
Date: Sat, 3 Sep 2022 05:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
Message-ID: <202209030512.9yAy8edt-lkp@intel.com>
References: <20220901220138.182896-15-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901220138.182896-15-vishal.moola@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi "Vishal,
 Thank you for the patch! Yet something to improve:
 [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test ERROR on
 kdave/for-next linus/master v6.0-rc3] [cannot apply to ceph-client/for-linus
 next-20220901] [If your patch is applied to the [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: githubusercontent.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.115 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_PERMERROR        SPF: test of record failed (permerror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oUEOw-00BotK-Ns
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
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
config: arc-randconfig-r043-20220901 (https://download.01.org/0day-ci/archive/20220903/202209030512.9yAy8edt-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6c74320953cd3749db95f9f09c1fc7d044933635
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Moola-Oracle/Convert-to-filemap_get_folios_tag/20220902-060430
        git checkout 6c74320953cd3749db95f9f09c1fc7d044933635
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_write_cache_pages':
>> fs/f2fs/data.c:3016:53: error: 'nr_pages' undeclared (first use in this function); did you mean 'dir_pages'?
    3016 |                                         &fbatch, i, nr_pages, true))
         |                                                     ^~~~~~~~
         |                                                     dir_pages
   fs/f2fs/data.c:3016:53: note: each undeclared identifier is reported only once for each function it appears in
>> fs/f2fs/data.c:3017:41: error: label 'lock_page' used but not defined
    3017 |                                         goto lock_page;
         |                                         ^~~~


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

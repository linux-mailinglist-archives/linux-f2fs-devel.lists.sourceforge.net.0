Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6E3BAAEFF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 03:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LsuDbO2t6ersPkVYYxFyT6kytyMSssUr5zHFFBevLw=; b=CyI+UBO2xKXI43m7dyKC8o3PGw
	2wQFo2/u2jQ14w0IpRFZy+w+2+O3SzZVTIDUFQtUCETfvRf4/qMnpq97c2wzfGfpW5veFUTFFdzYc
	AbofQ03lvpSJjkG8wFeSZoIL+p+gK0R5EQC1I2x54zuefZwT3kSzVeAEuV5nwXNqHH6o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3Pdo-0007M1-3I;
	Tue, 30 Sep 2025 01:58:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1v3Pdm-0007LS-Ld
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 01:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1nsYuIjh0ltXaFbCvTOuVOiGRKap14d+svRrQ63WfSI=; b=QgS5Crk7Zmh9ArFEkxl9fseCKI
 kWaHo/+KYph1QfnlS0Jy6Fg7ijy9A2zjfT2UMDVwoctZz+ovYxfMsdHMm8aJjVNHjQ/8uydCeMmss
 vrj3o0TxaX+Y7X4eTLxi9mI6cT9MtP4uK7bkLuA+vXz2wkZq7T1srFKdWUD1Cb14c8mY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1nsYuIjh0ltXaFbCvTOuVOiGRKap14d+svRrQ63WfSI=; b=HiglhkGkPD2/LEIOvw7JuLB5tg
 sut88JdqRRxAxXSwDOns9+bVKMtzj/JYLlOfN2eoQUSbYbJxNPhUEUQJD568kPT5UwqWBtCWQcjyA
 yat3JOMMhLQyYsva3mECfPCQUwTMSvpl20HjbyU0ohuE+wNVpHbUp304FEMhXcKIhHM0=;
Received: from mgamail.intel.com ([198.175.65.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3Pdm-0002lY-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 01:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759197535; x=1790733535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tB20YtoaQNm1TRsLJW3oQQhC60mlpvbrxY7xlXH5rUU=;
 b=Amr7v9wwQW0Ehspfyi2ODGgCAjs/EzVHgRcJzDM3ALYePVwLHnWLt4gX
 6wtRIpsHAras/lXR/N/y3SiXtA1cmUjud8pq0KR1QRePqim9aAj3GbCyM
 Yvk9uKnt8VN3ORinOeMwvNACpbmUihNir3cZ+qq/EpjfiCtpR9nO+FfeN
 oO+RG+5AhQJGP6w5k/9dhGLsV9CkSIJmVYQ4JyNE6JeN6krslUIA0AwKz
 35pFQgTc+GDOHEeCxZYEioH+i73ORArQd6C6sc7S1c1Q8pLiwJtPglTFU
 +iRulu6deUbgp6rW2/XNK/Oz/69gk7uGyQzP6oK4zcKK7aerTKFve5XEK Q==;
X-CSE-ConnectionGUID: jWtvdDxkQxKgRLPBJYd3Fg==
X-CSE-MsgGUID: JearZp3uQRWWa9uW/ZlGlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61489970"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61489970"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 18:58:44 -0700
X-CSE-ConnectionGUID: uCXbLUXmRxehKCeiFvuH/A==
X-CSE-MsgGUID: vc2P2cxGS5ujUsnH2zHRzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="178188959"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 29 Sep 2025 18:58:40 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v3PdV-0000p5-1R;
 Tue, 30 Sep 2025 01:58:37 +0000
Date: Tue, 30 Sep 2025 09:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Sun <sunjunchao@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org
Message-ID: <202509300940.yjAtss49-lkp@intel.com>
References: <20250929111349.448324-1-sunjunchao@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250929111349.448324-1-sunjunchao@bytedance.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Julian,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on kdave/for-next] [also build test ERROR on
 ceph-client/testing
 ceph-client/for-linus tytso-ext4/dev jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev
 gfs2/for-next akpm-mm/mm-everything [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3Pdm-0002lY-Ns
Subject: Re: [f2fs-dev] [PATCH v2] fs: Make wbc_to_tag() inline and use it
 in fs.
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
Cc: brauner@kernel.org, tytso@mit.edu, agruenba@redhat.com, jack@suse.cz,
 willy@infradead.org, clm@fb.com, adilger.kernel@dilger.ca,
 oe-kbuild-all@lists.linux.dev, dsterba@suse.com, jaegeuk@kernel.org,
 idryomov@gmail.com, xiubli@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Julian,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on ceph-client/testing ceph-client/for-linus tytso-ext4/dev jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev gfs2/for-next akpm-mm/mm-everything linus/master v6.17 next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Sun/fs-Make-wbc_to_tag-inline-and-use-it-in-fs/20250929-191847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20250929111349.448324-1-sunjunchao%40bytedance.com
patch subject: [PATCH v2] fs: Make wbc_to_tag() inline and use it in fs.
config: arc-randconfig-001-20250930 (https://download.01.org/0day-ci/archive/20250930/202509300940.yjAtss49-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509300940.yjAtss49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509300940.yjAtss49-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page-writeback.c: In function 'writeback_get_folio':
>> mm/page-writeback.c:2456:5: error: implicit declaration of function 'wbc_to_tag' [-Werror=implicit-function-declaration]
    2456 |     wbc_to_tag(wbc), &wbc->fbatch);
         |     ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/f2fs/data.c: In function 'f2fs_write_cache_pages':
>> fs/f2fs/data.c:3006:8: error: implicit declaration of function 'wbc_to_tag' [-Werror=implicit-function-declaration]
    3006 |  tag = wbc_to_tag(wbc);
         |        ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/btrfs/extent_io.c: In function 'extent_write_cache_pages':
>> fs/btrfs/extent_io.c:2463:8: error: implicit declaration of function 'wbc_to_tag' [-Werror=implicit-function-declaration]
    2463 |  tag = wbc_to_tag(wbc);
         |        ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/ext4/inode.c: In function 'mpage_prepare_extent_to_map':
>> fs/ext4/inode.c:2622:8: error: implicit declaration of function 'wbc_to_tag' [-Werror=implicit-function-declaration]
    2622 |  tag = wbc_to_tag(mpd->wbc);
         |        ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/wbc_to_tag +2456 mm/page-writeback.c

751e0d559c62a8 Matthew Wilcox (Oracle  2024-02-15  2444) 
e6d0ab87c8efe9 Matthew Wilcox (Oracle  2024-02-15  2445) static struct folio *writeback_get_folio(struct address_space *mapping,
751e0d559c62a8 Matthew Wilcox (Oracle  2024-02-15  2446) 		struct writeback_control *wbc)
751e0d559c62a8 Matthew Wilcox (Oracle  2024-02-15  2447) {
e6d0ab87c8efe9 Matthew Wilcox (Oracle  2024-02-15  2448) 	struct folio *folio;
e6d0ab87c8efe9 Matthew Wilcox (Oracle  2024-02-15  2449) 
a2cbc13638d909 Matthew Wilcox (Oracle  2024-02-15  2450) retry:
e6d0ab87c8efe9 Matthew Wilcox (Oracle  2024-02-15  2451) 	folio = folio_batch_next(&wbc->fbatch);
e6d0ab87c8efe9 Matthew Wilcox (Oracle  2024-02-15  2452) 	if (!folio) {
751e0d559c62a8 Matthew Wilcox (Oracle  2024-02-15  2453) 		folio_batch_release(&wbc->fbatch);
751e0d559c62a8 Matthew Wilcox (Oracle  2024-02-15  2454) 		cond_resched();
751e0d559c62a8 Matthew Wilcox (Oracle  2024-02-15  2455) 		filemap_get_folios_tag(mapping, &wbc->index, wbc_end(wbc),
751e0d559c62a8 Matthew Wilcox (Oracle  2024-02-15 @2456) 				wbc_to_tag(wbc), &wbc->fbatch);
e6d0ab87c8efe9 Matthew Wilcox (Oracle  2024-02-15  2457) 		folio = folio_batch_next(&wbc->fbatch);
a2cbc13638d909 Matthew Wilcox (Oracle  2024-02-15  2458) 		if (!folio)
a2cbc13638d909 Matthew Wilcox (Oracle  2024-02-15  2459) 			return NULL;
e6d0ab87c8efe9 Matthew Wilcox (Oracle  2024-02-15  2460) 	}
e6d0ab87c8efe9 Matthew Wilcox (Oracle  2024-02-15  2461) 
a2cbc13638d909 Matthew Wilcox (Oracle  2024-02-15  2462) 	folio_lock(folio);
a2cbc13638d909 Matthew Wilcox (Oracle  2024-02-15  2463) 	if (unlikely(!folio_prepare_writeback(mapping, wbc, folio))) {
a2cbc13638d909 Matthew Wilcox (Oracle  2024-02-15  2464) 		folio_unlock(folio);
a2cbc13638d909 Matthew Wilcox (Oracle  2024-02-15  2465) 		goto retry;
a2cbc13638d909 Matthew Wilcox (Oracle  2024-02-15  2466) 	}
a2cbc13638d909 Matthew Wilcox (Oracle  2024-02-15  2467) 
a2cbc13638d909 Matthew Wilcox (Oracle  2024-02-15  2468) 	trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
e6d0ab87c8efe9 Matthew Wilcox (Oracle  2024-02-15  2469) 	return folio;
751e0d559c62a8 Matthew Wilcox (Oracle  2024-02-15  2470) }
751e0d559c62a8 Matthew Wilcox (Oracle  2024-02-15  2471) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

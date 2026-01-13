Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E8ED1B199
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 20:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Message-ID:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AS3K6DmolIIKsvUHCaaSkkEKn0vwR/g6lX5PlvZ7h74=; b=kz4i5yiIJ+FMoIOnx8hLG1jjl3
	DFbBHlst0uFI2G9GZR7EkxHROBo6ESWrkJsZupNOSbmkIUIbEqaEyO1HMhLMinFVv9eEuTyEr5EnA
	GiKk4Xe/+prhcyGil3ao+7fOj+fvav4JzJWVrGj+LLjsI6o5nP5hwpSWoHN2YJ7xwvqw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfkMo-0004En-Vu;
	Tue, 13 Jan 2026 19:47:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1vfkMn-0004Ee-77
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 19:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EKjtr1ywpxmYqlbCI2LrviySRYaBP7LHA5PZ1F04zWM=; b=aZihz/7f8uo8MVWsqvOr3eD0ce
 LN5j0a6Y5U3bRfD5qL05cPsxS+P/S1NExNPNZQcfXntLzJXDmxu/SmsEGEHXVj4BTmtlLB5zCViN4
 DiP6AlZPjFuRmLEfnyv+QsktQ9Ykyh7SiBzDsdLm02/pL755QVBrEkItfMOdyHUvC4oc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EKjtr1ywpxmYqlbCI2LrviySRYaBP7LHA5PZ1F04zWM=; b=IaF/zemVlvhGq+LT9i3T8B0StB
 SX20FiZhu4i9duimA6+VFnkAXq2Z2h45dq/TDWJgipt3lAF5S0haDoIVNFOrmIAV//5CpKlll9H0o
 GlpZl2wZ3u7DdOIEUiduFwA3jJDyfYIpOSaknBkek+qYCghCsz5BJtqfLMWPm2iJReZk=;
Received: from mgamail.intel.com ([192.198.163.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfkMm-0006fQ-K3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 19:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768333668; x=1799869668;
 h=date:from:to:cc:subject:message-id;
 bh=qxmHdKHCIu14utVCPo5GsYAQ2YqqZdIlOq3eMH5gX6A=;
 b=J70XEKX0T+UakRc8x5b5e5NfkQO5d0Jnjn+lja5+C/thwf3bFqF7hmmd
 FQYqOkrtN2q58WCKxUYRGqx1mhsCj0mgEPUYcbJbEhJWs1Um2NCUZ/Az5
 m0UdZGFhIPJZ19sPghV1YCbD61QOVgl1brsU0kWj8ttKFGePAVpErVqvN
 kEGzCSF3dYAMlduFJzI8IQ33ilCxlHxzh5JpUtyE8B60Bz0vWmIojXMlF
 7jWqhhkmlCa3gvW54OQ5y1/Jvi3nYYZZdbCForFRt6V7B1BL8my0OPLVc
 kxHasNdZgJrtAV/sN3L/7KtrD9BNt2ob6luDW3oyyd15eMV5douIBXAIe Q==;
X-CSE-ConnectionGUID: 6hRyZLi4QaGXxSzMQWqn5A==
X-CSE-MsgGUID: Qo4lLcAvQyaUNBdOm9cXDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68834354"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="68834354"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 11:47:43 -0800
X-CSE-ConnectionGUID: 7v4vRwnZQKmp2f+NS0UhgA==
X-CSE-MsgGUID: OL5nw5m0QOCscMIX0Z9TpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204263531"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 11:47:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vfkMc-00000000FIR-2bIf;
 Tue, 13 Jan 2026 19:47:38 +0000
Date: Wed, 14 Jan 2026 03:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <202601140305.KrgvXyN6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 96bc5abf22b2308817c557c08d6cffff9607955f commit:
 05e65c14ea59a401cec4284e9d612f9d5dc1b3f8
 [1/43] f2fs: support lar [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfkMm-0006fQ-K3
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 1/43] fs/f2fs/data.c:2406:39:
 sparse: sparse: Using plain integer as NULL pointer
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
Cc: linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   96bc5abf22b2308817c557c08d6cffff9607955f
commit: 05e65c14ea59a401cec4284e9d612f9d5dc1b3f8 [1/43] f2fs: support large folio for immutable non-compressed case
config: i386-randconfig-061-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140305.KrgvXyN6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140305.KrgvXyN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140305.KrgvXyN6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/data.c:2406:39: sparse: sparse: Using plain integer as NULL pointer

vim +2406 fs/f2fs/data.c

  2400	
  2401	static int f2fs_read_data_large_folio(struct inode *inode,
  2402			struct readahead_control *rac, struct folio *folio)
  2403	{
  2404		struct bio *bio = NULL;
  2405		sector_t last_block_in_bio = 0;
> 2406		struct f2fs_map_blocks map = {0, };
  2407		pgoff_t index, offset;
  2408		unsigned max_nr_pages = rac ? readahead_count(rac) :
  2409					folio_nr_pages(folio);
  2410		unsigned nrpages;
  2411		struct f2fs_folio_state *ffs;
  2412		int ret = 0;
  2413	
  2414		if (!IS_IMMUTABLE(inode))
  2415			return -EOPNOTSUPP;
  2416	
  2417		if (f2fs_compressed_file(inode))
  2418			return -EOPNOTSUPP;
  2419	
  2420		map.m_seg_type = NO_CHECK_TYPE;
  2421	
  2422		if (rac)
  2423			folio = readahead_folio(rac);
  2424	next_folio:
  2425		if (!folio)
  2426			goto out;
  2427	
  2428		index = folio->index;
  2429		offset = 0;
  2430		ffs = NULL;
  2431		nrpages = folio_nr_pages(folio);
  2432	
  2433		for (; nrpages; nrpages--) {
  2434			sector_t block_nr;
  2435			/*
  2436			 * Map blocks using the previous result first.
  2437			 */
  2438			if ((map.m_flags & F2FS_MAP_MAPPED) &&
  2439					index > map.m_lblk &&
  2440					index < (map.m_lblk + map.m_len))
  2441				goto got_it;
  2442	
  2443			/*
  2444			 * Then do more f2fs_map_blocks() calls until we are
  2445			 * done with this page.
  2446			 */
  2447			memset(&map, 0, sizeof(map));
  2448			map.m_seg_type = NO_CHECK_TYPE;
  2449			map.m_lblk = index;
  2450			map.m_len = max_nr_pages;
  2451	
  2452			ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
  2453			if (ret)
  2454				goto err_out;
  2455	got_it:
  2456			if ((map.m_flags & F2FS_MAP_MAPPED)) {
  2457				block_nr = map.m_pblk + index - map.m_lblk;
  2458				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
  2459							DATA_GENERIC_ENHANCE_READ)) {
  2460					ret = -EFSCORRUPTED;
  2461					goto err_out;
  2462				}
  2463			} else {
  2464				folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
  2465				if (f2fs_need_verity(inode, index) &&
  2466				    !fsverity_verify_page(folio_file_page(folio,
  2467									index))) {
  2468					ret = -EIO;
  2469					goto err_out;
  2470				}
  2471				continue;
  2472			}
  2473	
  2474			/*
  2475			 * This page will go to BIO.  Do we need to send this
  2476			 * BIO off first?
  2477			 */
  2478			if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
  2479							last_block_in_bio, block_nr) ||
  2480				!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
  2481	submit_and_realloc:
  2482				f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2483				bio = NULL;
  2484			}
  2485			if (bio == NULL)
  2486				bio = f2fs_grab_read_bio(inode, block_nr,
  2487						max_nr_pages,
  2488						f2fs_ra_op_flags(rac),
  2489						index, false);
  2490	
  2491			/*
  2492			 * If the page is under writeback, we need to wait for
  2493			 * its completion to see the correct decrypted data.
  2494			 */
  2495			f2fs_wait_on_block_writeback(inode, block_nr);
  2496	
  2497			if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
  2498						offset << PAGE_SHIFT))
  2499				goto submit_and_realloc;
  2500	
  2501			if (folio_test_large(folio)) {
  2502				ffs = ffs_find_or_alloc(folio);
  2503	
  2504				/* set the bitmap to wait */
  2505				spin_lock_irq(&ffs->state_lock);
  2506				ffs->read_pages_pending++;
  2507				spin_unlock_irq(&ffs->state_lock);
  2508			}
  2509	
  2510			inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
  2511			f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
  2512					F2FS_BLKSIZE);
  2513			last_block_in_bio = block_nr;
  2514			index++;
  2515			offset++;
  2516		}
  2517		if (rac) {
  2518			folio = readahead_folio(rac);
  2519			goto next_folio;
  2520		}
  2521	err_out:
  2522		/* Nothing was submitted. */
  2523		if (!bio) {
  2524			if (!ret)
  2525				folio_mark_uptodate(folio);
  2526			folio_unlock(folio);
  2527			return ret;
  2528		}
  2529	
  2530		if (ret) {
  2531			f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2532	
  2533			/* Wait bios and clear uptodate. */
  2534			folio_lock(folio);
  2535			folio_clear_uptodate(folio);
  2536			folio_unlock(folio);
  2537		}
  2538	out:
  2539		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2540		return ret;
  2541	}
  2542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

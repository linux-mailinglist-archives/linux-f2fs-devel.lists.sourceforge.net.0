Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 591C8CF78A5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 10:31:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNoo/qKcXw481nvl8QHjy+5EzeKdxs+0vvmKfykq9pc=; b=aVJtC/LW1//eNc0cx8cRGcgmNp
	D3AoNjtaomGV3MMSsAtKjxPIDyzhzA3ZlAtoCTlObHkoajuwah28LGLmEVoUhm06njS5aJwmMPBIW
	QPRGdMEO8I9PoNU22nX62e3Tl5Wnw/tZ3e1kxcga7RVoZDjBmOF0F+nlqfBPuffhAwCA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd3Ow-0001Ea-HH;
	Tue, 06 Jan 2026 09:30:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1vd3Ov-0001EU-Aj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 09:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IkJ1hlMOHnO1WqxbXnaGg5CD2jLEtkh8fpBaAhc4rgo=; b=QEConxsEh+9ZvJCGO45qRCmYAa
 6KygXlm2L0ksZB/yZhgEMPq7j2u1BcxhYW+8R/DMFULXJKecKaJlPmofeVjcH3CItktS0st29zsrH
 EmYKpdr/cKGfU5sU7HOxZKRUwq9YiRCzis+TQ6M2PqjP2LGm83gZlWrJDuKJasaF7m8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IkJ1hlMOHnO1WqxbXnaGg5CD2jLEtkh8fpBaAhc4rgo=; b=Nj3UzlQMBe8ny7EJPvFCW9w41f
 WhaB8nLSRwOtbBQ5Khbc7qyc/h+daJGpb/zPQXWZZs79MKlp3i/YeV/kUgO/573PqOo5zHB8J59rG
 qeeo2ChgfpopVqGvfSpuOQofGVWmCnrvzRhZHM8jtXG9UeJ3rNoOOqhiPKHbb+MdOdHo=;
Received: from mgamail.intel.com ([192.198.163.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd3Ou-00026i-7w for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 09:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767691852; x=1799227852;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9A84fjymSv9Vu+C9GDOc1qrBye/BZMsWGoquy16U+B4=;
 b=UPY7BIBmv66N4I3GVdBRTU6gBab/KdzRotzIpHBGB6Yq1S13tkeK9RPX
 PJVbAh8y+a9dADROREomr5U52SgmX1ApgG++gXoAlWNREHvd9gz0Eaf88
 aQrbJYcMLPkp2tyiRgu6r6JAtot1cf4bXOvl+yG4BW40Id8XE5fLWJSjz
 CKEsCGiNuEPSVQzA9zUcD78lABCmTFtT2oVQxmQD/3dPBRZVbDVlLQiB+
 guRVe7J/N2AVXsuNrw39ZyrmlByln+5iAfjy/B/Kd4exx47hIesEzoX4l
 V17XRlWpWuoqDUfztAXc5rAOMzFWflUjyNeXMVnFUoKP85ULhiB7jC0GA g==;
X-CSE-ConnectionGUID: a2RCppEETRGjw+Xq1dFUcw==
X-CSE-MsgGUID: r70xVnzAQR2Mb9c0DUn57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="56620743"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="56620743"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 01:30:47 -0800
X-CSE-ConnectionGUID: r/8mLZ1LStq9ZEC7RXKUoA==
X-CSE-MsgGUID: PX6EmKYIRXyWUnSIWIPfqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="203578511"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa)
 ([10.211.93.152])
 by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2026 01:30:44 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vd3Ok-000000001ID-37KG;
 Tue, 06 Jan 2026 09:30:42 +0000
Date: Tue, 6 Jan 2026 10:30:01 +0100
From: kernel test robot <lkp@intel.com>
To: Nanzhe Zhao <nzzhao@126.com>, Kim Jaegeuk <jaegeuk@kernel.org>
Message-ID: <202601061013.MBnRTOrG-lkp@intel.com>
References: <20260105153101.152892-4-nzzhao@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105153101.152892-4-nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Nanzhe,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on 48b5439e04ddf4508ecaf588219012dc81d947c0] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vd3Ou-00026i-7w
Subject: Re: [f2fs-dev] [PATCH v1 3/5] f2fs: add f2fs_block_needs_zeroing()
 to handle hole blocks
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
Cc: Nanzhe Zhao <nzzhao@126.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Nanzhe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 48b5439e04ddf4508ecaf588219012dc81d947c0]

url:    https://github.com/intel-lab-lkp/linux/commits/Nanzhe-Zhao/f2fs-Zero-f2fs_folio_state-on-allocation/20260106-005006
base:   48b5439e04ddf4508ecaf588219012dc81d947c0
patch link:    https://lore.kernel.org/r/20260105153101.152892-4-nzzhao%40126.com
patch subject: [PATCH v1 3/5] f2fs: add f2fs_block_needs_zeroing() to handle hole blocks
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260106/202601061013.MBnRTOrG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061013.MBnRTOrG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061013.MBnRTOrG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/data.c:2485:13: warning: variable 'block_nr' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2485 |                 } else if((map.m_flags & F2FS_MAP_MAPPED)) {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2527:39: note: uninitialized use occurs here
    2527 |                 f2fs_wait_on_block_writeback(inode, block_nr);
         |                                                     ^~~~~~~~
   fs/f2fs/data.c:2485:10: note: remove the 'if' if its condition is always true
    2485 |                 } else if((map.m_flags & F2FS_MAP_MAPPED)) {
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2454:20: note: initialize the variable 'block_nr' to silence this warning
    2454 |                 sector_t block_nr;
         |                                  ^
         |                                   = 0
   1 warning generated.


vim +2485 fs/f2fs/data.c

  2420	
  2421	static int f2fs_read_data_large_folio(struct inode *inode,
  2422			struct readahead_control *rac, struct folio *folio)
  2423	{
  2424		struct bio *bio = NULL;
  2425		sector_t last_block_in_bio = 0;
  2426		struct f2fs_map_blocks map = {0, };
  2427		pgoff_t index, offset;
  2428		unsigned max_nr_pages = rac ? readahead_count(rac) :
  2429					folio_nr_pages(folio);
  2430		unsigned nrpages;
  2431		struct f2fs_folio_state *ffs;
  2432		int ret = 0;
  2433	
  2434		if (!IS_IMMUTABLE(inode))
  2435			return -EOPNOTSUPP;
  2436	
  2437		if (f2fs_compressed_file(inode))
  2438			return -EOPNOTSUPP;
  2439	
  2440		map.m_seg_type = NO_CHECK_TYPE;
  2441	
  2442		if (rac)
  2443			folio = readahead_folio(rac);
  2444	next_folio:
  2445		if (!folio)
  2446			goto out;
  2447	
  2448		index = folio->index;
  2449		offset = 0;
  2450		ffs = NULL;
  2451		nrpages = folio_nr_pages(folio);
  2452	
  2453		for (; nrpages; nrpages--) {
  2454			sector_t block_nr;
  2455			/*
  2456			 * Map blocks using the previous result first.
  2457			 */
  2458			if ((map.m_flags & F2FS_MAP_MAPPED) &&
  2459					index > map.m_lblk &&
  2460					index < (map.m_lblk + map.m_len))
  2461				goto got_it;
  2462	
  2463			/*
  2464			 * Then do more f2fs_map_blocks() calls until we are
  2465			 * done with this page.
  2466			 */
  2467			memset(&map, 0, sizeof(map));
  2468			map.m_seg_type = NO_CHECK_TYPE;
  2469			map.m_lblk = index;
  2470			map.m_len = max_nr_pages;
  2471	
  2472			ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
  2473			if (ret)
  2474				goto err_out;
  2475	got_it:
  2476			if ((f2fs_block_needs_zeroing(&map))) {
  2477				folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
  2478				if (f2fs_need_verity(inode, index) &&
  2479				    !fsverity_verify_page(folio_file_page(folio,
  2480									index))) {
  2481					ret = -EIO;
  2482					goto err_out;
  2483				}
  2484				continue;
> 2485			} else if((map.m_flags & F2FS_MAP_MAPPED)) {
  2486				block_nr = map.m_pblk + index - map.m_lblk;
  2487				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
  2488							DATA_GENERIC_ENHANCE_READ)) {
  2489					ret = -EFSCORRUPTED;
  2490					goto err_out;
  2491				}
  2492			}
  2493	
  2494			/* We must increment read_pages_pending before possible BIOs submitting
  2495			 * to prevent from premature folio_end_read() call on folio
  2496			 */
  2497			if (folio_test_large(folio)) {
  2498				ffs = ffs_find_or_alloc(folio);
  2499	
  2500				/* set the bitmap to wait */
  2501				spin_lock_irq(&ffs->state_lock);
  2502				ffs->read_pages_pending++;
  2503				spin_unlock_irq(&ffs->state_lock);
  2504			}
  2505	
  2506			/*
  2507			 * This page will go to BIO.  Do we need to send this
  2508			 * BIO off first?
  2509			 */
  2510			if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
  2511							last_block_in_bio, block_nr) ||
  2512				!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
  2513	submit_and_realloc:
  2514				f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2515				bio = NULL;
  2516			}
  2517			if (bio == NULL)
  2518				bio = f2fs_grab_read_bio(inode, block_nr,
  2519						max_nr_pages,
  2520						f2fs_ra_op_flags(rac),
  2521						index, false);
  2522	
  2523			/*
  2524			 * If the page is under writeback, we need to wait for
  2525			 * its completion to see the correct decrypted data.
  2526			 */
  2527			f2fs_wait_on_block_writeback(inode, block_nr);
  2528	
  2529			if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
  2530						offset << PAGE_SHIFT))
  2531				goto submit_and_realloc;
  2532	
  2533			inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
  2534			f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
  2535					F2FS_BLKSIZE);
  2536			last_block_in_bio = block_nr;
  2537			index++;
  2538			offset++;
  2539		}
  2540		trace_f2fs_read_folio(folio, DATA);
  2541		if (rac) {
  2542			folio = readahead_folio(rac);
  2543			goto next_folio;
  2544		}
  2545	err_out:
  2546		/* Nothing was submitted. */
  2547		if (!bio) {
  2548			if (!ret)
  2549				folio_mark_uptodate(folio);
  2550			folio_unlock(folio);
  2551			return ret;
  2552		}
  2553	
  2554		if (ret) {
  2555			f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2556	
  2557			/* Wait bios and clear uptodate. */
  2558			folio_lock(folio);
  2559			folio_clear_uptodate(folio);
  2560			folio_unlock(folio);
  2561		}
  2562	out:
  2563		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2564		return ret;
  2565	}
  2566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

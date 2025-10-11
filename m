Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B876FBCEF9D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Oct 2025 06:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GihSouDjRqzXa02xJyaS6nO6OcDw8ADWSwphVD7VlvI=; b=gPozxgwvJy52uH/DbplA4zNrn4
	NUZjYRVqsKJpQceMGJGJGtAdOb794+xhpPd/LBC4oQ7hIuVXssJhmDtvP14hxHkwUSZgR2SyMKAIv
	RZ7LuGglBroAOoTFP5v9/Rw/nxyxjo0p9szCdqMT0k970Wl6JfxTCSg4B3EMrjx1GtvI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7QnM-0005S6-19;
	Sat, 11 Oct 2025 04:01:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1v7QnJ-0005S0-TA
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 04:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UoNtbSGjGr7Ug9uzlEIYnZ0IoU+cMW0VsqOFBGzjZaY=; b=ClZhMOtvhv+sTKVlnGmVbN9ndC
 XTwirUb3fDJpMl0MMOs5YjOaoToRRctcPuHkSAWR0mP/bRoi9GnRlJ7MTgHTC7szm2jYM/2hxgXce
 NgIQ0dtWSL3T+zUrdOheU+ubMVFY/6VEPDVZf7hCfjUJWF2nowldThIbpnDl2OHhuLzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UoNtbSGjGr7Ug9uzlEIYnZ0IoU+cMW0VsqOFBGzjZaY=; b=FHAdWHkwSLEqtl8ZpvyyFtHoxs
 A6uOKl8l+DMX8w2KcoyMkTHMh4ibf530h0rtZ8BXdwf7WCbuSJrr6UZoh5HqNkV3JpbB1usb/b0C2
 bv2L8tIGiDKDZ//3CV0CBxCWCnCvG9m5U3s0XJGmgsPV/oDIZ5X365ZWY8YtDJ03NDyU=;
Received: from mgamail.intel.com ([198.175.65.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v7QnI-0007FQ-Hx for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 04:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760155281; x=1791691281;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LAWqyZh6RM8QY+k+7Vznz1/hpDEza9OmeHL4c2f30eI=;
 b=BQoWcKYIwOiE/rwMYDCYkmWAh04oGuUgZ7w6cgVRfQAT5r0o126dVt+p
 FH96MAjw12gGhqb9JCjME0eA95cXx17OdOr6M5lyfVDcchbaa6LT2GiFp
 yJzqvhVcv++Q3uR5wpIFx/wheU+va9Fte9NAdT2OfStbmR3KD2F2UcBa5
 5rCwt1K2uB751IA9lv3bDVCnQ6KjSRTK2/S0tkZmIPUNX9PMLdtuVZeUR
 MZLHVvQKV7sZtMJf7B33iNgq9XW72pUQsiBdT5vKt+jUA/Lzny0reLf57
 KLNVZzYcbBdwN8ibybiXgX+tcczjCIRhIS6s+M4gcaEMoIBliyz0oh7FT g==;
X-CSE-ConnectionGUID: utuPyR2ySzel01QG0wnGSA==
X-CSE-MsgGUID: IOabnY6/RliyFDnfYVoZnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62413673"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="62413673"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 21:01:10 -0700
X-CSE-ConnectionGUID: 4/hOoYOkRbiH6Nc5ln8nTw==
X-CSE-MsgGUID: MBRpolQIQk22GzppLy2fsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="185501395"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 10 Oct 2025 21:01:07 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v7Qn3-0003VX-0y;
 Sat, 11 Oct 2025 04:01:05 +0000
Date: Sat, 11 Oct 2025 12:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
Message-ID: <202510111151.zDEs4Y0k-lkp@intel.com>
References: <20251007180819.3858285-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251007180819.3858285-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daeho,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on v6.17] [cannot apply to jaegeuk-f2fs/dev-test
 jaegeuk-f2fs/dev
 linus/master next-20251010] [If your patch is applied to the wrong git tree,
 kindly drop us a note. And when su [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [198.175.65.18 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v7QnI-0007FQ-Hx
Subject: Re: [f2fs-dev] [PATCH] f2fs: revert summary entry count from 2048
 to 512 in 16kb block support
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
Cc: Daeho Jeong <daehojeong@google.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daeho,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.17]
[cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daeho-Jeong/f2fs-revert-summary-entry-count-from-2048-to-512-in-16kb-block-support/20251010-093707
base:   v6.17
patch link:    https://lore.kernel.org/r/20251007180819.3858285-1-daeho43%40gmail.com
patch subject: [PATCH] f2fs: revert summary entry count from 2048 to 512 in 16kb block support
config: arc-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111151.zDEs4Y0k-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111151.zDEs4Y0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111151.zDEs4Y0k-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/gc.c: In function 'do_garbage_collect':
>> fs/f2fs/gc.c:1861:1: error: label at end of compound statement
    1861 | skip:
         | ^~~~


vim +1861 fs/f2fs/gc.c

7bc0900347e069 Jaegeuk Kim             2012-11-02  1718  
718e53fa633f84 Chao Yu                 2016-01-23  1719  static int do_garbage_collect(struct f2fs_sb_info *sbi,
718e53fa633f84 Chao Yu                 2016-01-23  1720  				unsigned int start_segno,
7dede88659df38 Chao Yu                 2021-02-20  1721  				struct gc_inode_list *gc_list, int gc_type,
9748c2ddea4a3f Daeho Jeong             2024-09-09  1722  				bool force_migrate, bool one_time)
7bc0900347e069 Jaegeuk Kim             2012-11-02  1723  {
c718379b6b0954 Jaegeuk Kim             2013-04-24  1724  	struct blk_plug plug;
718e53fa633f84 Chao Yu                 2016-01-23  1725  	unsigned int segno = start_segno;
a60108f7dfb586 Jaegeuk Kim             2024-02-06  1726  	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
8c890c4c603427 Daeho Jeong             2024-09-09  1727  	unsigned int sec_end_segno;
e3080b0120a15e Chao Yu                 2018-10-24  1728  	int seg_freed = 0, migrated = 0;
718e53fa633f84 Chao Yu                 2016-01-23  1729  	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
718e53fa633f84 Chao Yu                 2016-01-23  1730  						SUM_TYPE_DATA : SUM_TYPE_NODE;
9bf1dcbdfdc889 Chao Yu                 2023-08-08  1731  	unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
2e154d8454d8bc Daeho Jeong             2025-10-07  1732  	int submitted = 0, sum_blk_cnt;
7bc0900347e069 Jaegeuk Kim             2012-11-02  1733  
8c890c4c603427 Daeho Jeong             2024-09-09  1734  	if (__is_large_section(sbi)) {
8c890c4c603427 Daeho Jeong             2024-09-09  1735  		sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
e3080b0120a15e Chao Yu                 2018-10-24  1736  
de881df97768d0 Aravind Ramesh          2020-07-16  1737  		/*
de881df97768d0 Aravind Ramesh          2020-07-16  1738  		 * zone-capacity can be less than zone-size in zoned devices,
de881df97768d0 Aravind Ramesh          2020-07-16  1739  		 * resulting in less than expected usable segments in the zone,
8c890c4c603427 Daeho Jeong             2024-09-09  1740  		 * calculate the end segno in the zone which can be garbage
8c890c4c603427 Daeho Jeong             2024-09-09  1741  		 * collected
de881df97768d0 Aravind Ramesh          2020-07-16  1742  		 */
de881df97768d0 Aravind Ramesh          2020-07-16  1743  		if (f2fs_sb_has_blkzoned(sbi))
8c890c4c603427 Daeho Jeong             2024-09-09  1744  			sec_end_segno -= SEGS_PER_SEC(sbi) -
2af583afcf9d54 liuderong               2024-09-11  1745  					f2fs_usable_segs_in_sec(sbi);
de881df97768d0 Aravind Ramesh          2020-07-16  1746  
9748c2ddea4a3f Daeho Jeong             2024-09-09  1747  		if (gc_type == BG_GC || one_time) {
2223fe652f7596 Daeho Jeong             2024-09-09  1748  			unsigned int window_granularity =
8c890c4c603427 Daeho Jeong             2024-09-09  1749  				sbi->migration_window_granularity;
8c890c4c603427 Daeho Jeong             2024-09-09  1750  
2223fe652f7596 Daeho Jeong             2024-09-09  1751  			if (f2fs_sb_has_blkzoned(sbi) &&
2223fe652f7596 Daeho Jeong             2024-09-09  1752  					!has_enough_free_blocks(sbi,
9a481a1c16f465 Daeho Jeong             2024-09-09  1753  					sbi->gc_thread->boost_zoned_gc_percent))
9a481a1c16f465 Daeho Jeong             2024-09-09  1754  				window_granularity *=
1d4c5dbba1a53a Daeho Jeong             2025-07-28  1755  					sbi->gc_thread->boost_gc_multiple;
2223fe652f7596 Daeho Jeong             2024-09-09  1756  
2223fe652f7596 Daeho Jeong             2024-09-09  1757  			end_segno = start_segno + window_granularity;
2223fe652f7596 Daeho Jeong             2024-09-09  1758  		}
2223fe652f7596 Daeho Jeong             2024-09-09  1759  
8c890c4c603427 Daeho Jeong             2024-09-09  1760  		if (end_segno > sec_end_segno)
8c890c4c603427 Daeho Jeong             2024-09-09  1761  			end_segno = sec_end_segno;
8c890c4c603427 Daeho Jeong             2024-09-09  1762  	}
8c890c4c603427 Daeho Jeong             2024-09-09  1763  
093749e296e29a Chao Yu                 2020-08-04  1764  	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
093749e296e29a Chao Yu                 2020-08-04  1765  
2e154d8454d8bc Daeho Jeong             2025-10-07  1766  	segno = rounddown(segno, SUMS_PER_BLOCK);
2e154d8454d8bc Daeho Jeong             2025-10-07  1767  	sum_blk_cnt = (end_segno - segno + SUMS_PER_BLOCK - 1) / SUMS_PER_BLOCK;
718e53fa633f84 Chao Yu                 2016-01-23  1768  	/* readahead multi ssa blocks those have contiguous address */
2c70c5e3874e8c Chao Yu                 2018-10-24  1769  	if (__is_large_section(sbi))
4d57b86dd86404 Chao Yu                 2018-05-30  1770  		f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
2e154d8454d8bc Daeho Jeong             2025-10-07  1771  					sum_blk_cnt, META_SSA, true);
718e53fa633f84 Chao Yu                 2016-01-23  1772  
718e53fa633f84 Chao Yu                 2016-01-23  1773  	/* reference all summary page */
718e53fa633f84 Chao Yu                 2016-01-23  1774  	while (segno < end_segno) {
2e154d8454d8bc Daeho Jeong             2025-10-07  1775  		struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno);
2e154d8454d8bc Daeho Jeong             2025-10-07  1776  
2e154d8454d8bc Daeho Jeong             2025-10-07  1777  		segno += SUMS_PER_BLOCK;
5d895f7beae94f Matthew Wilcox (Oracle  2025-03-31  1778) 		if (IS_ERR(sum_folio)) {
5d895f7beae94f Matthew Wilcox (Oracle  2025-03-31  1779) 			int err = PTR_ERR(sum_folio);
edc55aaf0d1712 Jaegeuk Kim             2018-09-17  1780  
2e154d8454d8bc Daeho Jeong             2025-10-07  1781  			end_segno = segno - SUMS_PER_BLOCK;
2e154d8454d8bc Daeho Jeong             2025-10-07  1782  			segno = rounddown(start_segno, SUMS_PER_BLOCK);
2e154d8454d8bc Daeho Jeong             2025-10-07  1783  			while (segno < end_segno) {
5d895f7beae94f Matthew Wilcox (Oracle  2025-03-31  1784) 				sum_folio = filemap_get_folio(META_MAPPING(sbi),
edc55aaf0d1712 Jaegeuk Kim             2018-09-17  1785  						GET_SUM_BLOCK(sbi, segno));
5d895f7beae94f Matthew Wilcox (Oracle  2025-03-31  1786) 				folio_put_refs(sum_folio, 2);
2e154d8454d8bc Daeho Jeong             2025-10-07  1787  				segno += SUMS_PER_BLOCK;
edc55aaf0d1712 Jaegeuk Kim             2018-09-17  1788  			}
edc55aaf0d1712 Jaegeuk Kim             2018-09-17  1789  			return err;
edc55aaf0d1712 Jaegeuk Kim             2018-09-17  1790  		}
5d895f7beae94f Matthew Wilcox (Oracle  2025-03-31  1791) 		folio_unlock(sum_folio);
718e53fa633f84 Chao Yu                 2016-01-23  1792  	}
7bc0900347e069 Jaegeuk Kim             2012-11-02  1793  
c718379b6b0954 Jaegeuk Kim             2013-04-24  1794  	blk_start_plug(&plug);
c718379b6b0954 Jaegeuk Kim             2013-04-24  1795  
2e154d8454d8bc Daeho Jeong             2025-10-07  1796  	segno = start_segno;
2e154d8454d8bc Daeho Jeong             2025-10-07  1797  	while (segno < end_segno) {
2e154d8454d8bc Daeho Jeong             2025-10-07  1798  		unsigned int cur_segno;
718e53fa633f84 Chao Yu                 2016-01-23  1799  		/* find segment summary of victim */
5d895f7beae94f Matthew Wilcox (Oracle  2025-03-31  1800) 		struct folio *sum_folio = filemap_get_folio(META_MAPPING(sbi),
718e53fa633f84 Chao Yu                 2016-01-23  1801  					GET_SUM_BLOCK(sbi, segno));
2e154d8454d8bc Daeho Jeong             2025-10-07  1802  		unsigned int block_end_segno = rounddown(segno, SUMS_PER_BLOCK)
2e154d8454d8bc Daeho Jeong             2025-10-07  1803  						+ SUMS_PER_BLOCK;
2e154d8454d8bc Daeho Jeong             2025-10-07  1804  
2e154d8454d8bc Daeho Jeong             2025-10-07  1805  		if (block_end_segno > end_segno)
2e154d8454d8bc Daeho Jeong             2025-10-07  1806  			block_end_segno = end_segno;
2e154d8454d8bc Daeho Jeong             2025-10-07  1807  
2e154d8454d8bc Daeho Jeong             2025-10-07  1808  		if (!folio_test_uptodate(sum_folio) ||
2e154d8454d8bc Daeho Jeong             2025-10-07  1809  		    unlikely(f2fs_cp_error(sbi)))
2e154d8454d8bc Daeho Jeong             2025-10-07  1810  			goto next_block;
2e154d8454d8bc Daeho Jeong             2025-10-07  1811  
2e154d8454d8bc Daeho Jeong             2025-10-07  1812  		for (cur_segno = segno; cur_segno < block_end_segno;
2e154d8454d8bc Daeho Jeong             2025-10-07  1813  				cur_segno++) {
2e154d8454d8bc Daeho Jeong             2025-10-07  1814  			struct f2fs_summary_block *sum;
718e53fa633f84 Chao Yu                 2016-01-23  1815  
2e154d8454d8bc Daeho Jeong             2025-10-07  1816  			if (get_valid_blocks(sbi, cur_segno, false) == 0)
d6c66cd19ef322 Yunlong Song            2018-10-24  1817  				goto freed;
dabfbbc8f91450 Jaegeuk Kim             2020-02-09  1818  			if (gc_type == BG_GC && __is_large_section(sbi) &&
e3080b0120a15e Chao Yu                 2018-10-24  1819  					migrated >= sbi->migration_granularity)
e3080b0120a15e Chao Yu                 2018-10-24  1820  				goto skip;
de0dcc40f6e24d Jaegeuk Kim             2016-10-12  1821  
2e154d8454d8bc Daeho Jeong             2025-10-07  1822  			sum = SUM_BLK_PAGE_ADDR(sum_folio, cur_segno);
10d255c3540239 Chao Yu                 2018-07-04  1823  			if (type != GET_SUM_TYPE((&sum->footer))) {
2e154d8454d8bc Daeho Jeong             2025-10-07  1824  				f2fs_err(sbi, "Inconsistent segment (%u) type "
2e154d8454d8bc Daeho Jeong             2025-10-07  1825  						"[%d, %d] in SSA and SIT",
2e154d8454d8bc Daeho Jeong             2025-10-07  1826  						cur_segno, type,
2e154d8454d8bc Daeho Jeong             2025-10-07  1827  						GET_SUM_TYPE((&sum->footer)));
a9cfee0ef98e99 Chao Yu                 2022-09-28  1828  				f2fs_stop_checkpoint(sbi, false,
a9cfee0ef98e99 Chao Yu                 2022-09-28  1829  					STOP_CP_REASON_CORRUPTED_SUMMARY);
e3080b0120a15e Chao Yu                 2018-10-24  1830  				goto skip;
10d255c3540239 Chao Yu                 2018-07-04  1831  			}
7bc0900347e069 Jaegeuk Kim             2012-11-02  1832  
9236cac5666ea8 Jaegeuk Kim             2015-05-28  1833  			/*
9236cac5666ea8 Jaegeuk Kim             2015-05-28  1834  			 * this is to avoid deadlock:
9236cac5666ea8 Jaegeuk Kim             2015-05-28  1835  			 * - lock_page(sum_page)     - f2fs_replace_block
3d26fa6be3c487 Chao Yu                 2017-10-30  1836  			 *  - check_valid_map()        - down_write(sentry_lock)
3d26fa6be3c487 Chao Yu                 2017-10-30  1837  			 *   - down_read(sentry_lock) - change_curseg()
9236cac5666ea8 Jaegeuk Kim             2015-05-28  1838  			 *                              - lock_page(sum_page)
9236cac5666ea8 Jaegeuk Kim             2015-05-28  1839  			 */
718e53fa633f84 Chao Yu                 2016-01-23  1840  			if (type == SUM_TYPE_NODE)
2e154d8454d8bc Daeho Jeong             2025-10-07  1841  				submitted += gc_node_segment(sbi, sum->entries,
2e154d8454d8bc Daeho Jeong             2025-10-07  1842  						cur_segno, gc_type);
48018b4cfd07dd Chao Yu                 2018-09-13  1843  			else
2e154d8454d8bc Daeho Jeong             2025-10-07  1844  				submitted += gc_data_segment(sbi, sum->entries,
2e154d8454d8bc Daeho Jeong             2025-10-07  1845  						gc_list, cur_segno,
2e154d8454d8bc Daeho Jeong             2025-10-07  1846  						gc_type, force_migrate);
c718379b6b0954 Jaegeuk Kim             2013-04-24  1847  
9bf1dcbdfdc889 Chao Yu                 2023-08-08  1848  			stat_inc_gc_seg_count(sbi, data_type, gc_type);
07c6b5933ebf58 Daeho Jeong             2021-07-09  1849  			sbi->gc_reclaimed_segs[sbi->gc_mode]++;
8c7b9ac129d096 Jaegeuk Kim             2020-02-09  1850  			migrated++;
c56f16dab0dfc8 Chao Yu                 2017-08-11  1851  
d6c66cd19ef322 Yunlong Song            2018-10-24  1852  freed:
c56f16dab0dfc8 Chao Yu                 2017-08-11  1853  			if (gc_type == FG_GC &&
2e154d8454d8bc Daeho Jeong             2025-10-07  1854  				get_valid_blocks(sbi, cur_segno, false) == 0)
c56f16dab0dfc8 Chao Yu                 2017-08-11  1855  				seg_freed++;
e3080b0120a15e Chao Yu                 2018-10-24  1856  
e219aecfd4b766 Yonggil Song            2022-11-22  1857  			if (__is_large_section(sbi))
e219aecfd4b766 Yonggil Song            2022-11-22  1858  				sbi->next_victim_seg[gc_type] =
2e154d8454d8bc Daeho Jeong             2025-10-07  1859  					(cur_segno + 1 < sec_end_segno) ?
2e154d8454d8bc Daeho Jeong             2025-10-07  1860  						cur_segno + 1 : NULL_SEGNO;
e3080b0120a15e Chao Yu                 2018-10-24 @1861  skip:
2e154d8454d8bc Daeho Jeong             2025-10-07  1862  		}
2e154d8454d8bc Daeho Jeong             2025-10-07  1863  next_block:
5d895f7beae94f Matthew Wilcox (Oracle  2025-03-31  1864) 		folio_put_refs(sum_folio, 2);
2e154d8454d8bc Daeho Jeong             2025-10-07  1865  		segno = block_end_segno;
718e53fa633f84 Chao Yu                 2016-01-23  1866  	}
718e53fa633f84 Chao Yu                 2016-01-23  1867  
48018b4cfd07dd Chao Yu                 2018-09-13  1868  	if (submitted)
9bf1dcbdfdc889 Chao Yu                 2023-08-08  1869  		f2fs_submit_merged_write(sbi, data_type);
718e53fa633f84 Chao Yu                 2016-01-23  1870  
718e53fa633f84 Chao Yu                 2016-01-23  1871  	blk_finish_plug(&plug);
718e53fa633f84 Chao Yu                 2016-01-23  1872  
9bf1dcbdfdc889 Chao Yu                 2023-08-08  1873  	if (migrated)
9bf1dcbdfdc889 Chao Yu                 2023-08-08  1874  		stat_inc_gc_sec_count(sbi, data_type, gc_type);
17d899df4678a1 Chao Yu                 2016-02-22  1875  
c56f16dab0dfc8 Chao Yu                 2017-08-11  1876  	return seg_freed;
7bc0900347e069 Jaegeuk Kim             2012-11-02  1877  }
7bc0900347e069 Jaegeuk Kim             2012-11-02  1878  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

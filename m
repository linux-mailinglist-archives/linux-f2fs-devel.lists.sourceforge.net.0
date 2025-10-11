Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B556BCEF57
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Oct 2025 05:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EN2IVewwphAUgy8pUzpR3z2cc7pNCEUkNNIkwXpXFYo=; b=LcFHE0x+TOc8UHOdf1MWcFNJNu
	cLUsgCOMJN6vr4Bs5SYmosGrRQtMmqqxYCWZSa6LkI7ISa3UFQ0TdTHMi50JV0r/QTH3DCTMw94Uz
	fmyQkJxcsLI3oPf4B5l9pvdmjQEeExskPTcx3hc6fCezxnwGtTMpjewqLWfntgQeMyrk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7QT5-0008Sm-Pp;
	Sat, 11 Oct 2025 03:40:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1v7QSy-0008SZ-GD
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 03:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KNJ4WMO+zfNXQKjtFCHQE8cqEq3J49/NJi/I1d2SgLM=; b=KzqjHc9epTIc/nq2KqbvblabAe
 r3f8J5mWFqQLQtO+uvdkbswJkTSaEd8POdGLQHQ9Zhi02utFtf5zLBFlDq/TvR2IymwcuQEZSjkbm
 MuzsSy5sbW5ZMgziQtq6j30sj3q4APY/4TqB7873qvLkZ13wopCyolwQMfgvm/PI6dbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KNJ4WMO+zfNXQKjtFCHQE8cqEq3J49/NJi/I1d2SgLM=; b=V0J9vT9lMe82qA+5/6ZXGTDEfp
 KNbfxu/iyFQDxV4mEtiSR6HEp+IezHfpnEjBK9ib+1PbUXoi8k3avycdHV5mAj+n2NzrXOLEviIS3
 QXhjlHBsfWyWE1bsb9wpVwpbCP5CjTd7OaSNktr6JVnTkal4YrlAMPGZLCpdXljiO1aw=;
Received: from mgamail.intel.com ([198.175.65.13])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v7QSw-0006QD-Tk for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 03:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760154019; x=1791690019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7mCzyjL+Xaiazdoh5gJUUZKnqWu7Ztzw+tgv/EgZT4s=;
 b=j23+fzINc8ouDgXmQBhKntxN5YME3+T7lBgubZ+RKf0agh9P3sLM7G1E
 +GoLaaTUH59h0011QeAOhUOzqgHG/nfvJ14O6NT0YDSmmLd4klrFanCB0
 YUKRTv6M3lW6tWvxZ1JIGIbJc4s3v0NPqgzNsGqB8NJpKi8DiSu5fhTXw
 n1kd4IV9D7Jg9FcSwZlNGymgX6dOASYRRkLs6h61dgu+BitKi+eWpGW3s
 Jyz76MyWv3QyTZorvQujI7QJ6+sVOn8/KsVhip1Gw/FPgZ9bnpKZrQxmb
 2B6AlNqqQD+iqdChwXstzEsfLnB52so6IGBn+Pir/njkbDlxoIOHwFvco A==;
X-CSE-ConnectionGUID: m2LG1wjTQ4i1J/luV9VnoA==
X-CSE-MsgGUID: s8Pkc+wjTJe0JhlWbJlYMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73476871"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="73476871"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 20:40:09 -0700
X-CSE-ConnectionGUID: sJXRp9iSQAGb+vj89FYDEQ==
X-CSE-MsgGUID: iM3DC+vCT+ynEtLyC2YahQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="180236752"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 10 Oct 2025 20:40:06 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v7QSh-0003UV-1o;
 Sat, 11 Oct 2025 03:40:03 +0000
Date: Sat, 11 Oct 2025 11:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
Message-ID: <202510111112.Z3YnKrkU-lkp@intel.com>
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
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on v6.17] [cannot apply to jaegeuk-f2fs/dev-test
 jaegeuk-f2fs/dev linus/master next-20251010] [If your patch is applied to
 the wrong git tree, kindly drop us a note. And when [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [198.175.65.13 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v7QSw-0006QD-Tk
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
Cc: llvm@lists.linux.dev, Daeho Jeong <daehojeong@google.com>,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daeho,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.17]
[cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daeho-Jeong/f2fs-revert-summary-entry-count-from-2048-to-512-in-16kb-block-support/20251010-093707
base:   v6.17
patch link:    https://lore.kernel.org/r/20251007180819.3858285-1-daeho43%40gmail.com
patch subject: [PATCH] f2fs: revert summary entry count from 2048 to 512 in 16kb block support
config: riscv-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111112.Z3YnKrkU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111112.Z3YnKrkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111112.Z3YnKrkU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/gc.c:1862:3: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
    1862 |                 }
         |                 ^
   1 warning generated.


vim +1862 fs/f2fs/gc.c

  1718	
  1719	static int do_garbage_collect(struct f2fs_sb_info *sbi,
  1720					unsigned int start_segno,
  1721					struct gc_inode_list *gc_list, int gc_type,
  1722					bool force_migrate, bool one_time)
  1723	{
  1724		struct blk_plug plug;
  1725		unsigned int segno = start_segno;
  1726		unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
  1727		unsigned int sec_end_segno;
  1728		int seg_freed = 0, migrated = 0;
  1729		unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
  1730							SUM_TYPE_DATA : SUM_TYPE_NODE;
  1731		unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
  1732		int submitted = 0, sum_blk_cnt;
  1733	
  1734		if (__is_large_section(sbi)) {
  1735			sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
  1736	
  1737			/*
  1738			 * zone-capacity can be less than zone-size in zoned devices,
  1739			 * resulting in less than expected usable segments in the zone,
  1740			 * calculate the end segno in the zone which can be garbage
  1741			 * collected
  1742			 */
  1743			if (f2fs_sb_has_blkzoned(sbi))
  1744				sec_end_segno -= SEGS_PER_SEC(sbi) -
  1745						f2fs_usable_segs_in_sec(sbi);
  1746	
  1747			if (gc_type == BG_GC || one_time) {
  1748				unsigned int window_granularity =
  1749					sbi->migration_window_granularity;
  1750	
  1751				if (f2fs_sb_has_blkzoned(sbi) &&
  1752						!has_enough_free_blocks(sbi,
  1753						sbi->gc_thread->boost_zoned_gc_percent))
  1754					window_granularity *=
  1755						sbi->gc_thread->boost_gc_multiple;
  1756	
  1757				end_segno = start_segno + window_granularity;
  1758			}
  1759	
  1760			if (end_segno > sec_end_segno)
  1761				end_segno = sec_end_segno;
  1762		}
  1763	
  1764		sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
  1765	
  1766		segno = rounddown(segno, SUMS_PER_BLOCK);
  1767		sum_blk_cnt = (end_segno - segno + SUMS_PER_BLOCK - 1) / SUMS_PER_BLOCK;
  1768		/* readahead multi ssa blocks those have contiguous address */
  1769		if (__is_large_section(sbi))
  1770			f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
  1771						sum_blk_cnt, META_SSA, true);
  1772	
  1773		/* reference all summary page */
  1774		while (segno < end_segno) {
  1775			struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno);
  1776	
  1777			segno += SUMS_PER_BLOCK;
  1778			if (IS_ERR(sum_folio)) {
  1779				int err = PTR_ERR(sum_folio);
  1780	
  1781				end_segno = segno - SUMS_PER_BLOCK;
  1782				segno = rounddown(start_segno, SUMS_PER_BLOCK);
  1783				while (segno < end_segno) {
  1784					sum_folio = filemap_get_folio(META_MAPPING(sbi),
  1785							GET_SUM_BLOCK(sbi, segno));
  1786					folio_put_refs(sum_folio, 2);
  1787					segno += SUMS_PER_BLOCK;
  1788				}
  1789				return err;
  1790			}
  1791			folio_unlock(sum_folio);
  1792		}
  1793	
  1794		blk_start_plug(&plug);
  1795	
  1796		segno = start_segno;
  1797		while (segno < end_segno) {
  1798			unsigned int cur_segno;
  1799			/* find segment summary of victim */
  1800			struct folio *sum_folio = filemap_get_folio(META_MAPPING(sbi),
  1801						GET_SUM_BLOCK(sbi, segno));
  1802			unsigned int block_end_segno = rounddown(segno, SUMS_PER_BLOCK)
  1803							+ SUMS_PER_BLOCK;
  1804	
  1805			if (block_end_segno > end_segno)
  1806				block_end_segno = end_segno;
  1807	
  1808			if (!folio_test_uptodate(sum_folio) ||
  1809			    unlikely(f2fs_cp_error(sbi)))
  1810				goto next_block;
  1811	
  1812			for (cur_segno = segno; cur_segno < block_end_segno;
  1813					cur_segno++) {
  1814				struct f2fs_summary_block *sum;
  1815	
  1816				if (get_valid_blocks(sbi, cur_segno, false) == 0)
  1817					goto freed;
  1818				if (gc_type == BG_GC && __is_large_section(sbi) &&
  1819						migrated >= sbi->migration_granularity)
  1820					goto skip;
  1821	
  1822				sum = SUM_BLK_PAGE_ADDR(sum_folio, cur_segno);
  1823				if (type != GET_SUM_TYPE((&sum->footer))) {
  1824					f2fs_err(sbi, "Inconsistent segment (%u) type "
  1825							"[%d, %d] in SSA and SIT",
  1826							cur_segno, type,
  1827							GET_SUM_TYPE((&sum->footer)));
  1828					f2fs_stop_checkpoint(sbi, false,
  1829						STOP_CP_REASON_CORRUPTED_SUMMARY);
  1830					goto skip;
  1831				}
  1832	
  1833				/*
  1834				 * this is to avoid deadlock:
  1835				 * - lock_page(sum_page)     - f2fs_replace_block
  1836				 *  - check_valid_map()        - down_write(sentry_lock)
  1837				 *   - down_read(sentry_lock) - change_curseg()
  1838				 *                              - lock_page(sum_page)
  1839				 */
  1840				if (type == SUM_TYPE_NODE)
  1841					submitted += gc_node_segment(sbi, sum->entries,
  1842							cur_segno, gc_type);
  1843				else
  1844					submitted += gc_data_segment(sbi, sum->entries,
  1845							gc_list, cur_segno,
  1846							gc_type, force_migrate);
  1847	
  1848				stat_inc_gc_seg_count(sbi, data_type, gc_type);
  1849				sbi->gc_reclaimed_segs[sbi->gc_mode]++;
  1850				migrated++;
  1851	
  1852	freed:
  1853				if (gc_type == FG_GC &&
  1854					get_valid_blocks(sbi, cur_segno, false) == 0)
  1855					seg_freed++;
  1856	
  1857				if (__is_large_section(sbi))
  1858					sbi->next_victim_seg[gc_type] =
  1859						(cur_segno + 1 < sec_end_segno) ?
  1860							cur_segno + 1 : NULL_SEGNO;
  1861	skip:
> 1862			}
  1863	next_block:
  1864			folio_put_refs(sum_folio, 2);
  1865			segno = block_end_segno;
  1866		}
  1867	
  1868		if (submitted)
  1869			f2fs_submit_merged_write(sbi, data_type);
  1870	
  1871		blk_finish_plug(&plug);
  1872	
  1873		if (migrated)
  1874			stat_inc_gc_sec_count(sbi, data_type, gc_type);
  1875	
  1876		return seg_freed;
  1877	}
  1878	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

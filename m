Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABADAAD3AD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 04:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnGTFEkU4z7xLDot+bT7iaFz5HEJEQAG8UybX9D/p9c=; b=V7SeVTxr/xC/L4Qvokx8xYf19r
	OtDyVSyy7j0ikQdLhGF6vbILjHQLDEVWoLSgfnhjw4JG1E/dwr4/932KOMBkTxAQt+4ip34R6icuZ
	42M5fwIbGai7WUTMb6NS0Cwu+w43FzU3+GeW/mFrQU3hEH/iExaekdYWdOR8LGGw7XmA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCV0d-0007ue-H6;
	Wed, 07 May 2025 02:59:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCV0X-0007uU-QD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 02:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dO8TAPurZkifBnz64RkWqBzxKCBuNRyIgG7Aa137fNk=; b=DjRTbfshRVoaROxu+SEmJLVvA1
 wC4kk40BBXiTiJJNTjBqrHPyrrJHF/DnO9bB91CObSuqB5m3bm3mGV553o98pOgZ05qm+IZNoVEOe
 UGgaPrw5mDm9S9fludSh4MdFwZaUjHO5/aPh3WhU7OUYfBD3LQSeLCMX+HQ+2z0dtMcU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dO8TAPurZkifBnz64RkWqBzxKCBuNRyIgG7Aa137fNk=; b=Yx/LTbSEeVerLEqKJmUMpoyK//
 Q/On47ukPtk23eKbTGInFcmbZhgWMe5uwpRkDWzID6w02lFoYdXAGk3ntj6F/7gJx/NiuPyI2z+vV
 cz6tYYI3xu6YexZvouvjNgAucokgm2n2IEjZmxfRXgrzaFvm4hlsNmoebJhC9k8kdjwY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCV0H-00085M-PC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 02:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 035E2A4CC93;
 Wed,  7 May 2025 02:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FEFC4CEE4;
 Wed,  7 May 2025 02:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746586754;
 bh=WNFiF4kuKCChVMZrDDhU+ewRqWYYEI+6NjXa6pEqMyE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=iozilQ9EbZvIWw9A5/gyxPVAk3bsz70K/QzFu82rR5uJjixBHUOBIldp9XBYppZkq
 DZ0nFoLvz1rILDPUXnuVktmXXoMcS2ndOGpz8GUYMyJtzNMyUnZX6uGC85yqZsECmR
 uAujy5nMzHfLAVxA03e32c1cXzC93Vdl5UGWjDvVclCtwCTO2WO2poELuWNRB49J+9
 BTew6k1olbSa0OEPUz+uyeh1oYU0+VG+Ycpc1WkHdaBkUvcu8hG5hYOpnTupx90Mi4
 ILJ2GayT8DfDoRJkblEmS87+1LImLNywSyODnsgzUX8LT7JTqyRUxqU1IIWCd1E7Pq
 8TEWfiiakFDGA==
Message-ID: <75dc33f0-7415-4d73-8f0e-6887281bc35f@kernel.org>
Date: Wed, 7 May 2025 10:59:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Matthew Wilcox <willy@infradead.org>
References: <aBR_H0zPfg5Sbj4z@stanley.mountain>
Content-Language: en-US
In-Reply-To: <aBR_H0zPfg5Sbj4z@stanley.mountain>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/2/25 16:15, Dan Carpenter wrote: > Hello Matthew Wilcox
 (Oracle), > > Commit 5d895f7beae9 ("f2fs: Use folios in do_garbage_collect()")
 from > Mar 31, 2025 (linux-next), leads to the following Sma [...] 
 Content analysis details:   (-3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCV0H-00085M-PC
Subject: Re: [f2fs-dev] [bug report] f2fs: Use folios in do_garbage_collect()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/2/25 16:15, Dan Carpenter wrote:
> Hello Matthew Wilcox (Oracle),
> 
> Commit 5d895f7beae9 ("f2fs: Use folios in do_garbage_collect()") from
> Mar 31, 2025 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	fs/f2fs/gc.c:1799 do_garbage_collect()
> 	error: 'sum_folio' dereferencing possible ERR_PTR()
> 
> fs/f2fs/gc.c
>     1716 static int do_garbage_collect(struct f2fs_sb_info *sbi,
>     1717                                 unsigned int start_segno,
>     1718                                 struct gc_inode_list *gc_list, int gc_type,
>     1719                                 bool force_migrate, bool one_time)
>     1720 {
>     1721         struct blk_plug plug;
>     1722         unsigned int segno = start_segno;
>     1723         unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
>     1724         unsigned int sec_end_segno;
>     1725         int seg_freed = 0, migrated = 0;
>     1726         unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
>     1727                                                 SUM_TYPE_DATA : SUM_TYPE_NODE;
>     1728         unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
>     1729         int submitted = 0;
>     1730 
>     1731         if (__is_large_section(sbi)) {
>     1732                 sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
>     1733 
>     1734                 /*
>     1735                  * zone-capacity can be less than zone-size in zoned devices,
>     1736                  * resulting in less than expected usable segments in the zone,
>     1737                  * calculate the end segno in the zone which can be garbage
>     1738                  * collected
>     1739                  */
>     1740                 if (f2fs_sb_has_blkzoned(sbi))
>     1741                         sec_end_segno -= SEGS_PER_SEC(sbi) -
>     1742                                         f2fs_usable_segs_in_sec(sbi);
>     1743 
>     1744                 if (gc_type == BG_GC || one_time) {
>     1745                         unsigned int window_granularity =
>     1746                                 sbi->migration_window_granularity;
>     1747 
>     1748                         if (f2fs_sb_has_blkzoned(sbi) &&
>     1749                                         !has_enough_free_blocks(sbi,
>     1750                                         sbi->gc_thread->boost_zoned_gc_percent))
>     1751                                 window_granularity *=
>     1752                                         BOOST_GC_MULTIPLE;
>     1753 
>     1754                         end_segno = start_segno + window_granularity;
>     1755                 }
>     1756 
>     1757                 if (end_segno > sec_end_segno)
>     1758                         end_segno = sec_end_segno;
>     1759         }
>     1760 
>     1761         sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
>     1762 
>     1763         /* readahead multi ssa blocks those have contiguous address */
>     1764         if (__is_large_section(sbi))
>     1765                 f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
>     1766                                         end_segno - segno, META_SSA, true);
>     1767 
>     1768         /* reference all summary page */
>     1769         while (segno < end_segno) {
>     1770                 struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno++);
>     1771                 if (IS_ERR(sum_folio)) {
>     1772                         int err = PTR_ERR(sum_folio);
>     1773 
>     1774                         end_segno = segno - 1;
>     1775                         for (segno = start_segno; segno < end_segno; segno++) {
>     1776                                 sum_folio = filemap_get_folio(META_MAPPING(sbi),
>     1777                                                 GET_SUM_BLOCK(sbi, segno));
>     1778                                 folio_put_refs(sum_folio, 2);
>     1779                         }
>     1780                         return err;
>     1781                 }
>     1782                 folio_unlock(sum_folio);
>     1783         }
>     1784 
>     1785         blk_start_plug(&plug);
>     1786 
>     1787         for (segno = start_segno; segno < end_segno; segno++) {
>     1788                 struct f2fs_summary_block *sum;
>     1789 
>     1790                 /* find segment summary of victim */
>     1791                 struct folio *sum_folio = filemap_get_folio(META_MAPPING(sbi),
>     1792                                         GET_SUM_BLOCK(sbi, segno));
> 
> Smatch gets a bit confused here and thinks filemap_get_folio() can return
> a lot of different error pointers, but really filemap_get_folio() can only
> return ERR_PTR(-ENOENT).  And possibly in this context, it can't even
> return that?

Dan,

It shouldn't fail due to we have grabbed that page in do_garbage_collect() as below,
and haven't released the reference yet.

>     1768         /* reference all summary page */
>     1769         while (segno < end_segno) {
>     1770                 struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno++);

> 
> One time email warning etc.  I could also mark filemap_get_folio() as
> a no fail function to prevent false positives.

So, it doesn't mean filemap_get_folio() never fail, can Smatch detect above
condition to avoid triggering warning?

Thanks,

> 
>     1793 
>     1794                 if (get_valid_blocks(sbi, segno, false) == 0)
>     1795                         goto freed;
>     1796                 if (gc_type == BG_GC && __is_large_section(sbi) &&
>     1797                                 migrated >= sbi->migration_granularity)
>     1798                         goto skip;
> --> 1799                 if (!folio_test_uptodate(sum_folio) ||
>                                                   ^^^^^^^^^
> Dereferenced here.
> 
>     1800                     unlikely(f2fs_cp_error(sbi)))
>     1801                         goto skip;
>     1802 
> 
> regards,
> dan carpenter
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

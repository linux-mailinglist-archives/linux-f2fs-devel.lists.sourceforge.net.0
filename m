Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A9AA6CB5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 May 2025 10:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZjSQ+jAC1NA995zIBa3tlwogH8kbnvRMHzgv3NzAc74=; b=b6uRlxU6wxbYIWfX/Phhu1Wveo
	Mtf7jKXS+PbLx18vw+La9aGLO3R3qBhQPt+htaSvlH6M3ibF7e+7kzq2DdyRkkpBu6YyPcY9liWf4
	aJ/9+yW8+QLbJOhyA8Kc9HhTwh2HrU1a65tvRfVlQlayVz4AYFd7NqBxKA2zn903kVwA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uAlyl-00045d-Gb;
	Fri, 02 May 2025 08:42:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dan.carpenter@linaro.org>) id 1uAly2-00044i-Oc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 May 2025 08:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fsXoIHBbg4TXash19nLxZLVddPU286hTJ7W7k+dtKwg=; b=TfdwABSVFee9jREZgrKKNtQUvn
 hPAE9XHBntK3zrN/XeW4qv1LFlfqign18QMyoOCuQOgT7BRiyvjWJ2sQfMWEUiJJ/KZwNVAYWQKZv
 fhnvJnQGmXRoBL96VI5bxJSyKx42dTbiM6HX6xG0+langKk+idtzuB7XrWGJMQ9gEffs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fsXoIHBbg4TXash19nLxZLVddPU286hTJ7W7k+dtKwg=; b=c
 tiLjuNdiq54muoSMXbaxujPaBC9PTtiji4XJJ/7wUYVU2MSWPeBq9maAASmnsphTZwHyes/2EORH3
 EHV1aronl4UR/6vvEbzhnDERXFO5r2BeHKMoPz7ANu1TVi78jDIjdYKq0pfmrwsH7nWDvss5sQJ2/
 5oKNehs2R3F47CKk=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uAlxm-0003te-NK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 May 2025 08:41:58 +0000
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9eb1eso2960161a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 02 May 2025 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746175291; x=1746780091; darn=lists.sourceforge.net;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fsXoIHBbg4TXash19nLxZLVddPU286hTJ7W7k+dtKwg=;
 b=iKMtQYbaMXK8AFD6GfcN6TkdSJo4ShouLYW7yapFP8CsKm0+CV47RcZQaJkxWPEDjh
 n8ZoiW8K4SPNmVB6ylgJVQ6pufGDzwEKrO1KcKyDmwZvF8VsF9OKJSogPj6MvqixGiAk
 jQYEvjWxoeRrC8Q3Mr+SxegYCvFiySydadUB2l8+8s6EgrMmDUuETswrYR0T8u3DT41D
 Tm4PtaWjb0vLMk9WPlG+sWeUCnq+WHRM/C7FXK6udeRFDUgZDy8IwMc07ZQ9pkAMz8Gv
 H3lCa/z2ju59LR/zdjZs6+iwiH0RQ0VPF0+MG7KxZsLoEF9PPiwPeJTFwOcyDnLsGHlp
 XwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746175291; x=1746780091;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fsXoIHBbg4TXash19nLxZLVddPU286hTJ7W7k+dtKwg=;
 b=QSYHZldFnVT/+NZLu66p3Kcmyqi/6KOxofjd8Kqk55KIRVhJs4NRRU3XOnQgAQmeEQ
 UHfctX3TbCzd1ROr4+f2XO5FycqDS9oB3EGEDLN2ywsM79wBjAiVFrXYrOd96ZqZqiko
 fpWggYMTCqJS7vdduqVx4yxxhlrK0UgK8gn53RBI/bj7Jhp9Kz7Jim4ActVspYXDvzJ5
 T0DlZm1AufQfPZCTUTerLzg2kSQYXAjOtunbzFRq65zy47OLf+T6XYQ9V4e1ricp8F5M
 JjTQ21HCxNOF1LyK/1qvMN9+YBMLICHoFeskj2IIuCKIRhqXmRM15+EnujjwMlLfP7VI
 TwDQ==
X-Gm-Message-State: AOJu0YykdtFKH1N9nW9E2EqQxR9SMpV4E9fb59esAPLCi0rKNNOteHnP
 OEZtB7UyHJ14VcebAP+Kz5DdM3oxehZ+5AgoFGOK27Ud83o3LlG4dG7iXQ1me/UCgtqE8UCllbm
 q
X-Gm-Gg: ASbGncstMPB81yNaKO20KwyZh3+mEKg9vUkcWKrR1xyWB3tXOXwarrTPr5Et8FRQn4R
 RjyavZCeZl8XQLqIyDPM7yVW/LSJ0AIwbzQ3wmIlc4MD8DCEYUnkcFUm+Fr82EAx8d5pka6VxCF
 p5zNQhaCplUQ3Mc4+3sIRwPBH2vBrMU60VpF49XlSTkW4gpJ9XBiuK1T5WMyWkCgirosTjUcgyt
 kZ+nPKMJ8bNnr5Yn8OtD7k3+KlZA1xKlGWgmXW6xcBD1z+utbsXyjdoLNR+YE5+3EPWGpKpLfgv
 Q+B5lji9q862ZqcWRst8bMnF3CPlLkBNWnfQBZB11zV/2g==
X-Google-Smtp-Source: AGHT+IE9KUrZbbASjOPA2I5a1F7slvIv46ZP7JXIpgpcX0swM26KoVICOspNNiDVtwt+Wj1UZyvsgw==
X-Received: by 2002:a5d:59ad:0:b0:39c:30f7:b6ad with SMTP id
 ffacd0b85a97d-3a098464114mr1401215f8f.18.1746173731305; 
 Fri, 02 May 2025 01:15:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099b0f09dsm1443702f8f.63.2025.05.02.01.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 01:15:30 -0700 (PDT)
Date: Fri, 2 May 2025 11:15:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aBR_H0zPfg5Sbj4z@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Matthew Wilcox (Oracle), Commit 5d895f7beae9 ("f2fs:
 Use folios in do_garbage_collect()") from Mar 31, 2025 (linux-next), leads
 to the following Smatch static checker warning: fs/f2fs/gc.c:1799
 do_garbage_collect()
 error: 'sum_folio' dereferencing possible ERR_PTR() 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.51 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.208.51 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.208.51 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uAlxm-0003te-NK
Subject: [f2fs-dev] [bug report] f2fs: Use folios in do_garbage_collect()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Matthew Wilcox (Oracle),

Commit 5d895f7beae9 ("f2fs: Use folios in do_garbage_collect()") from
Mar 31, 2025 (linux-next), leads to the following Smatch static
checker warning:

	fs/f2fs/gc.c:1799 do_garbage_collect()
	error: 'sum_folio' dereferencing possible ERR_PTR()

fs/f2fs/gc.c
    1716 static int do_garbage_collect(struct f2fs_sb_info *sbi,
    1717                                 unsigned int start_segno,
    1718                                 struct gc_inode_list *gc_list, int gc_type,
    1719                                 bool force_migrate, bool one_time)
    1720 {
    1721         struct blk_plug plug;
    1722         unsigned int segno = start_segno;
    1723         unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
    1724         unsigned int sec_end_segno;
    1725         int seg_freed = 0, migrated = 0;
    1726         unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
    1727                                                 SUM_TYPE_DATA : SUM_TYPE_NODE;
    1728         unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
    1729         int submitted = 0;
    1730 
    1731         if (__is_large_section(sbi)) {
    1732                 sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
    1733 
    1734                 /*
    1735                  * zone-capacity can be less than zone-size in zoned devices,
    1736                  * resulting in less than expected usable segments in the zone,
    1737                  * calculate the end segno in the zone which can be garbage
    1738                  * collected
    1739                  */
    1740                 if (f2fs_sb_has_blkzoned(sbi))
    1741                         sec_end_segno -= SEGS_PER_SEC(sbi) -
    1742                                         f2fs_usable_segs_in_sec(sbi);
    1743 
    1744                 if (gc_type == BG_GC || one_time) {
    1745                         unsigned int window_granularity =
    1746                                 sbi->migration_window_granularity;
    1747 
    1748                         if (f2fs_sb_has_blkzoned(sbi) &&
    1749                                         !has_enough_free_blocks(sbi,
    1750                                         sbi->gc_thread->boost_zoned_gc_percent))
    1751                                 window_granularity *=
    1752                                         BOOST_GC_MULTIPLE;
    1753 
    1754                         end_segno = start_segno + window_granularity;
    1755                 }
    1756 
    1757                 if (end_segno > sec_end_segno)
    1758                         end_segno = sec_end_segno;
    1759         }
    1760 
    1761         sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
    1762 
    1763         /* readahead multi ssa blocks those have contiguous address */
    1764         if (__is_large_section(sbi))
    1765                 f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
    1766                                         end_segno - segno, META_SSA, true);
    1767 
    1768         /* reference all summary page */
    1769         while (segno < end_segno) {
    1770                 struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno++);
    1771                 if (IS_ERR(sum_folio)) {
    1772                         int err = PTR_ERR(sum_folio);
    1773 
    1774                         end_segno = segno - 1;
    1775                         for (segno = start_segno; segno < end_segno; segno++) {
    1776                                 sum_folio = filemap_get_folio(META_MAPPING(sbi),
    1777                                                 GET_SUM_BLOCK(sbi, segno));
    1778                                 folio_put_refs(sum_folio, 2);
    1779                         }
    1780                         return err;
    1781                 }
    1782                 folio_unlock(sum_folio);
    1783         }
    1784 
    1785         blk_start_plug(&plug);
    1786 
    1787         for (segno = start_segno; segno < end_segno; segno++) {
    1788                 struct f2fs_summary_block *sum;
    1789 
    1790                 /* find segment summary of victim */
    1791                 struct folio *sum_folio = filemap_get_folio(META_MAPPING(sbi),
    1792                                         GET_SUM_BLOCK(sbi, segno));

Smatch gets a bit confused here and thinks filemap_get_folio() can return
a lot of different error pointers, but really filemap_get_folio() can only
return ERR_PTR(-ENOENT).  And possibly in this context, it can't even
return that?

One time email warning etc.  I could also mark filemap_get_folio() as
a no fail function to prevent false positives.

    1793 
    1794                 if (get_valid_blocks(sbi, segno, false) == 0)
    1795                         goto freed;
    1796                 if (gc_type == BG_GC && __is_large_section(sbi) &&
    1797                                 migrated >= sbi->migration_granularity)
    1798                         goto skip;
--> 1799                 if (!folio_test_uptodate(sum_folio) ||
                                                  ^^^^^^^^^
Dereferenced here.

    1800                     unlikely(f2fs_cp_error(sbi)))
    1801                         goto skip;
    1802 

regards,
dan carpenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

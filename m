Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3A60B766
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 21:23:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on32m-0005Dg-JU;
	Mon, 24 Oct 2022 19:23:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1on32k-0005DZ-Gt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 19:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YNQKfFH/J4u1O0RDYXKWFImeY+htr9CT0XG4blIptF8=; b=YkOL+E4zeq4qn5s7Kqg0Vn+TXk
 Asfckfnevd3QDynWExN3j7sAJNZX3YdxmwAhVJ45v4ptLw6HzrBO+329YWXQTG+DwEewfjkZZwTjG
 x+ANvJqaloPdzLpsVHUyOIqe+UwnF13hx5ufcbhsCRwrnLkubMalZ9NybtOhi5NpdEq0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YNQKfFH/J4u1O0RDYXKWFImeY+htr9CT0XG4blIptF8=; b=AK3RtRGVyUXQBLRqYKoJdYEH/D
 6GGF8zwqSBBhSOjhUbEsj/EyM53TCpxiFqXN4hQ2TuAhSQZGkLVLlsSqI3NtpFqbqg0+OF+kMCBHt
 N0w2IAqdtpxH/IrIILrIx6dpzJzY3BHRu46yUl4ozZtkxyyVhn/ODEZRRirkHjg0LnLE=;
Received: from mail-yw1-f177.google.com ([209.85.128.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1on32i-00G1G6-Mr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 19:23:26 +0000
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-36d2188004bso33420897b3.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Oct 2022 12:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YNQKfFH/J4u1O0RDYXKWFImeY+htr9CT0XG4blIptF8=;
 b=BZ07ttqeleBSPnDK6U+YYl4PqDUBbDSEX+WjIwTCayimKOvCWQ7QJMsRTbYZsiVgqd
 EPz3Kssuzqwb+DuV01u77FroRmxl2Oh6cZq5to1O1dgnkU1zmgohLPGe1Vnqvzt4EEfq
 UidgeyS0Y9tA7MFOSRR/Hl408Q6977DSlBV5an5pjChLODwH4qrSLz+huTxqO2oeeugs
 Y5lojn/s8STiv9jUlWIiLpxr1Ml7lBHDrgQGF6DCe76VDPmKxmi79ylCmm7nM5tyKHUQ
 XKsULy6TfrVTx89x+MSxKDo6XFVnqqivPcXKUNiJ2AXL3gDfjx2EKDTvO6VMcUmcvqOP
 zWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YNQKfFH/J4u1O0RDYXKWFImeY+htr9CT0XG4blIptF8=;
 b=nFrnJIumspMsIFtndI3nNV1GPzSP6ML3YhF5wtjPL8FTYull/1re6bH2edL9hTkPs1
 FqgGYv4TY7Joi/HNqNvkQpREL93IVfPC9OWBGJidCoBdabVJyKq6o2T23npwJQ7kxEz0
 4zpX19d9PYU9aKRcjnKnREW5/IIosN3tY5EX3K99dI5lMajHOJu+XvkMfMFwKpGTglbf
 WmxOFAp+c7TpxUYQGmnfQS+c8vV4lfJRFu2poGNzfb+GDk6dkFAyluj9h69d79fueB0e
 EskAWb846fri1bagIDTgfQfMK5B2chWUIPIYJptT4rojjlxtWFtnzC+YBbuji48X8yPp
 i46A==
X-Gm-Message-State: ACrzQf2YW3/pVuizwxVexOMJST//3kRIykylSH8236uIIrUS47A5+trU
 HWfaR567uZqSMssvSetSp9Lnj5AbieG8ik/bC6mTNDs8xFU=
X-Google-Smtp-Source: AMsMyM4zQHncqMnc13JolI9a0bQPoGwvoozFFIXgkb0S+8TY5Wbz7IROxLSB7QZhSNOK0oJhcsH0Lm1a9opE48XevoI=
X-Received: by 2002:a81:71c6:0:b0:36a:5682:2c44 with SMTP id
 m189-20020a8171c6000000b0036a56822c44mr14280778ywc.308.1666639398914; Mon, 24
 Oct 2022 12:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-18-vishal.moola@gmail.com>
In-Reply-To: <20221017202451.4951-18-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 24 Oct 2022 12:23:07 -0700
Message-ID: <CAOzc2pya9kuNYT3Uff3wVmrZ3JVSnFs2kwH5CK8ite6Qn67mRg@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle) wrote:
 > > Converted function to use folios throughout. This is in preparation for
 > the removal of find_get_pgaes_range_tag(). > > Also had to [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.177 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.177 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1on32i-00G1G6-Mr
Subject: Re: [f2fs-dev] [PATCH v3 17/23] gfs2: Convert
 gfs2_write_cache_jdata() to use filemap_get_folios_tag()
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
 agruenba@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, rpeterso@redhat.com, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> Converted function to use folios throughout. This is in preparation for
> the removal of find_get_pgaes_range_tag().
>
> Also had to modify and rename gfs2_write_jdata_pagevec() to take in
> and utilize folio_batch rather than pagevec and use folios rather
> than pages. gfs2_write_jdata_batch() now supports large folios.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/gfs2/aops.c | 64 +++++++++++++++++++++++++++-----------------------
>  1 file changed, 35 insertions(+), 29 deletions(-)
>
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 05bee80ac7de..8f87c2551a3d 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -195,67 +195,71 @@ static int gfs2_writepages(struct address_space *mapping,
>  }
>
>  /**
> - * gfs2_write_jdata_pagevec - Write back a pagevec's worth of pages
> + * gfs2_write_jdata_batch - Write back a folio batch's worth of folios
>   * @mapping: The mapping
>   * @wbc: The writeback control
> - * @pvec: The vector of pages
> - * @nr_pages: The number of pages to write
> + * @fbatch: The batch of folios
>   * @done_index: Page index
>   *
>   * Returns: non-zero if loop should terminate, zero otherwise
>   */
>
> -static int gfs2_write_jdata_pagevec(struct address_space *mapping,
> +static int gfs2_write_jdata_batch(struct address_space *mapping,
>                                     struct writeback_control *wbc,
> -                                   struct pagevec *pvec,
> -                                   int nr_pages,
> +                                   struct folio_batch *fbatch,
>                                     pgoff_t *done_index)
>  {
>         struct inode *inode = mapping->host;
>         struct gfs2_sbd *sdp = GFS2_SB(inode);
> -       unsigned nrblocks = nr_pages * (PAGE_SIZE >> inode->i_blkbits);
> +       unsigned nrblocks;
>         int i;
>         int ret;
> +       int nr_pages = 0;
> +       int nr_folios = folio_batch_count(fbatch);
> +
> +       for (i = 0; i < nr_folios; i++)
> +               nr_pages += folio_nr_pages(fbatch->folios[i]);
> +       nrblocks = nr_pages * (PAGE_SIZE >> inode->i_blkbits);
>
>         ret = gfs2_trans_begin(sdp, nrblocks, nrblocks);
>         if (ret < 0)
>                 return ret;
>
> -       for(i = 0; i < nr_pages; i++) {
> -               struct page *page = pvec->pages[i];
> +       for (i = 0; i < nr_folios; i++) {
> +               struct folio *folio = fbatch->folios[i];
>
> -               *done_index = page->index;
> +               *done_index = folio->index;
>
> -               lock_page(page);
> +               folio_lock(folio);
>
> -               if (unlikely(page->mapping != mapping)) {
> +               if (unlikely(folio->mapping != mapping)) {
>  continue_unlock:
> -                       unlock_page(page);
> +                       folio_unlock(folio);
>                         continue;
>                 }
>
> -               if (!PageDirty(page)) {
> +               if (!folio_test_dirty(folio)) {
>                         /* someone wrote it for us */
>                         goto continue_unlock;
>                 }
>
> -               if (PageWriteback(page)) {
> +               if (folio_test_writeback(folio)) {
>                         if (wbc->sync_mode != WB_SYNC_NONE)
> -                               wait_on_page_writeback(page);
> +                               folio_wait_writeback(folio);
>                         else
>                                 goto continue_unlock;
>                 }
>
> -               BUG_ON(PageWriteback(page));
> -               if (!clear_page_dirty_for_io(page))
> +               BUG_ON(folio_test_writeback(folio));
> +               if (!folio_clear_dirty_for_io(folio))
>                         goto continue_unlock;
>
>                 trace_wbc_writepage(wbc, inode_to_bdi(inode));
>
> -               ret = __gfs2_jdata_writepage(page, wbc);
> +               ret = __gfs2_jdata_writepage(&folio->page, wbc);
>                 if (unlikely(ret)) {
>                         if (ret == AOP_WRITEPAGE_ACTIVATE) {
> -                               unlock_page(page);
> +                               folio_unlock(folio);
>                                 ret = 0;
>                         } else {
>
> @@ -268,7 +272,8 @@ static int gfs2_write_jdata_pagevec(struct address_space *mapping,
>                                  * not be suitable for data integrity
>                                  * writeout).
>                                  */
> -                               *done_index = page->index + 1;
> +                               *done_index = folio->index +
> +                                       folio_nr_pages(folio);
>                                 ret = 1;
>                                 break;
>                         }
> @@ -305,8 +310,8 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
>  {
>         int ret = 0;
>         int done = 0;
> -       struct pagevec pvec;
> -       int nr_pages;
> +       struct folio_batch fbatch;
> +       int nr_folios;
>         pgoff_t writeback_index;
>         pgoff_t index;
>         pgoff_t end;
> @@ -315,7 +320,7 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
>         int range_whole = 0;
>         xa_mark_t tag;
>
> -       pagevec_init(&pvec);
> +       folio_batch_init(&fbatch);
>         if (wbc->range_cyclic) {
>                 writeback_index = mapping->writeback_index; /* prev offset */
>                 index = writeback_index;
> @@ -341,17 +346,18 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
>                 tag_pages_for_writeback(mapping, index, end);
>         done_index = index;
>         while (!done && (index <= end)) {
> -               nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> -                               tag);
> -               if (nr_pages == 0)
> +               nr_folios = filemap_get_folios_tag(mapping, &index, end,
> +                               tag, &fbatch);
> +               if (nr_folios == 0)
>                         break;
>
> -               ret = gfs2_write_jdata_pagevec(mapping, wbc, &pvec, nr_pages, &done_index);
> +               ret = gfs2_write_jdata_batch(mapping, wbc, &fbatch,
> +                               &done_index);
>                 if (ret)
>                         done = 1;
>                 if (ret > 0)
>                         ret = 0;
> -               pagevec_release(&pvec);
> +               folio_batch_release(&fbatch);
>                 cond_resched();
>         }
>
> --
> 2.36.1
>

Would anyone familiar with gfs2 have time to look over this patch (17/23)?
I've cc-ed the gfs2 supporters, feedback would be appreciated.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

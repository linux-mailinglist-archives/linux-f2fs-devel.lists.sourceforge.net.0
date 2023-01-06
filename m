Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470765FC54
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jan 2023 08:58:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDhc4-0006cT-FU;
	Fri, 06 Jan 2023 07:58:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <agruenba@redhat.com>) id 1pDhc1-0006c1-AK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 07:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xmb3IcLHCLsi/xOiQHUkWYlXfS8doiaC8cJwdmVUFK4=; b=OtXgrYF7m81nzfZ+a3wefTEk3x
 toy+fRGveGT1U+b/nTOld1T/Ej4xmp/twN4/6R/IFFkU3jh3vlIpeqSXafcNJ/QZqB0AhvKjk3pFE
 25oHPsyBldb1WKtXgHKmrhKkgN7J093mvMMUXyb59oBnRhKDrSP0NiN6cnPMbTiawoew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xmb3IcLHCLsi/xOiQHUkWYlXfS8doiaC8cJwdmVUFK4=; b=hXhgEfOK+Fs98vtJmm1rkZmkGM
 E81bgT94gj0mVpNUB8ZCqfpUrXQ4/FfkMCu8q6z2Q+rkbfpn8Ozzl4P7V1uhVBZx6toveZXJpNrjx
 541s+nDzU4asCXOjIhgS0M5CzaMLFihDsYkxqb56llgzTEYoxoHVnU9WT5o9blr/fmQc=;
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pDhbq-0000fA-0O for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 07:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672991854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xmb3IcLHCLsi/xOiQHUkWYlXfS8doiaC8cJwdmVUFK4=;
 b=SLVzg7+qVCkSPwpEXCMyFeNPY9fsRC3J6m6t9JyyNaGFIjjHxovBVrdPL/kwwpyv/tLyr+
 uAEuds0xSUup0UDOyInIosfoE5Z2o/gfG+Wqj40CVNLzVuwrG63GucOn2dCZ3OWAJ+VClz
 dumlyhgYGDzQ/s+rMBR1O1MSWa7geiY=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-Ya7LFmTFMO-IOoPIO71zRA-1; Fri, 06 Jan 2023 02:57:32 -0500
X-MC-Unique: Ya7LFmTFMO-IOoPIO71zRA-1
Received: by mail-yb1-f200.google.com with SMTP id
 l194-20020a2525cb000000b007b411fbdc13so1134576ybl.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 05 Jan 2023 23:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xmb3IcLHCLsi/xOiQHUkWYlXfS8doiaC8cJwdmVUFK4=;
 b=aGndAbvV54hs5YzRVR/EzY/0nY08SDpugM5uowIt9Gr83mY2jor9OHRK5GC/PT8C6Q
 v79mqv6cH+e4qGJUaX/51WRe6UIP1t3Iyr4nolE9KpmEQ2IsZHoeAhVg8Z45DSHtbwtb
 i0aeY2fadiqasf/HSOR0x+1QVS+fDRLBsjp2RcgPNdBn1KgodpEX1JlyY4FXpog5fA3K
 WDKCRngpK0jNMuZewSbzFgxfKmUVs22I2lKXsPv/Yl+yWCoaJf+2aKHHnXKSXiPBq1Tm
 hB6tFUPU0DHxHQG6WbnbUJE0QQe8OIjM2uwVIB3uE01DUPm9RhDRtl9dzvF8qpHI/7by
 5H+w==
X-Gm-Message-State: AFqh2kqaKwqhRMbDDfoeM5T/BYrwMmoobK0Mq7MlgbVn6CbRaUoKX0r+
 UH5xnHd7EzIYQfRhMUH8es7QpWTdoCkVBzyf890DEVeLFXwUlni5ielEoOBi2HmNEfCSBUNYWiL
 +PIFug6+pd3BBUtkwPGxVceTwiXRSZ+Lu4ehOvczbbrYtXiev7mPNEQ==
X-Received: by 2002:a05:690c:87:b0:46f:36b1:a27 with SMTP id
 be7-20020a05690c008700b0046f36b10a27mr4200661ywb.147.1672991851849; 
 Thu, 05 Jan 2023 23:57:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuC/bbIcMr4bQ8ok16zXLqM2NrU98mA2WJd0uc+HAfHs8BnKxPTLzGpg1jIsSESD/q9eqv3v1Jyw7xgl7+RWvk=
X-Received: by 2002:a05:690c:87:b0:46f:36b1:a27 with SMTP id
 be7-20020a05690c008700b0046f36b10a27mr4200651ywb.147.1672991851590; Thu, 05
 Jan 2023 23:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20230104211448.4804-1-vishal.moola@gmail.com>
 <20230104211448.4804-18-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-18-vishal.moola@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 6 Jan 2023 08:57:20 +0100
Message-ID: <CAHc6FU55EfV0qvtpPUWAvHm72kPd7Rzb8=-GX0oFgfJonXt7Pg@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 4,
 2023 at 10:15 PM Vishal Moola (Oracle) <vishal.moola@gmail.com>
 wrote: > Converted function to use folios throughout. This is in preparation
 for > the removal of find_get_pgaes_range_ta [...] 
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pDhbq-0000fA-0O
Subject: Re: [f2fs-dev] [Cluster-devel] [PATCH v5 17/23] gfs2: Convert
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 4, 2023 at 10:15 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Converted function to use folios throughout. This is in preparation for
> the removal of find_get_pgaes_range_tag(). This change removes 8 calls
> to compound_head().
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
> index e782b4f1d104..0a47068f9acc 100644
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
> 2.38.1
>

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

Thanks,
Andreas



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

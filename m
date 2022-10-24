Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6160B798
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 21:27:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on36D-0007oA-HE;
	Mon, 24 Oct 2022 19:27:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1on36C-0007o4-9G
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 19:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=msuUebF694+hZC0rqt6N8CJWQi+fRr7tKzxI1kK1XSA=; b=EcBR4je1GFHrh12iFwOXpiIIx4
 RV0LAd8M1qqP8LgiuxZ46vjQ+PUDrYESM5efuiB2PaU4OoWCheRkS39zG0dRxTk80xkV2wCZwP44K
 E+g5KQg95lr0NYCd4qou77Miz1nDrt+vEfaXUVau48fwqS57NqdXUoPuxB2P+x0HiJSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=msuUebF694+hZC0rqt6N8CJWQi+fRr7tKzxI1kK1XSA=; b=b9tovWSv0w6CejfDuYniGHDnuQ
 Dl/OWJL6ajHp0XEHISDjXHYSmIDF/7x2Gljlr9uPJ1rVkbfEfTxxVSMIZLGJp9QWhqxrU8DCr6EPZ
 +WftFRv/v8U94jdAQfEXbFjGz5Yi40qIPONXiiWG2/6bll0kXjaZm3/cFkWEGJfGzzrk=;
Received: from mail-yb1-f177.google.com ([209.85.219.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1on36A-00G1NV-HR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 19:27:00 +0000
Received: by mail-yb1-f177.google.com with SMTP id e62so12130569yba.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Oct 2022 12:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=msuUebF694+hZC0rqt6N8CJWQi+fRr7tKzxI1kK1XSA=;
 b=Nbh/LUYRRXN+W8H+09HFirleOER72S3l+cyZmuDy+8Pib1Gn+U4wfzzFfRtAjMjFcF
 fvo3jJ3RCWGObovpQORWc3/9IkNJGMgPUfku6KvUFl6cu6AMUPfoT9oK95yTGj66jhjH
 7WGhQNpuF6d0iem0QTBy19EivSDPd2VqHFxQ3x16D8kkerWE0rDHVR2hrPPsFrR5kbrm
 D3RRZ03JmkZtNZSKaozG5JauPmqkajAnvSOqe8wpHj28aX62NhSnkQiYABEysxpon0kM
 LH9dhzEwQZXR7plJ46sFDvDg1wrk4joIrl4DRR8/CJkQwJDkuqnpXoWVFb+tCDqZEjny
 JZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=msuUebF694+hZC0rqt6N8CJWQi+fRr7tKzxI1kK1XSA=;
 b=Zl8zNx46Y/nFjO9OtaDtNyn+Il3KUWVlVGcOnNVQZiaqGAcwm3YFD+gAGM63hxDqkL
 gxKsWiLbhTHZMqTZXO+wpopeuMgYn61UAIiLdXVQY2ciflUML23qSFmMNU2gjbAv9bJP
 ikm/y1kTJq4UCc6ds2ZgjY8d6T2MQVEqXrQutsGzbpBn8pqx5RMMOR1VS1gh+qgiypLe
 cBXxO4rEYsSlHAXDR6pUigfC44Nm0M1NvmwDMoRQCeGfdApLOsTUW4vXSJDq+DrUl7WR
 Z+uJY3RwxnSVvUbUGGwu3i2C0vKsvG20v8naKd6eQCkFye5zxZ1gxpBBMJyy/LM9w4oA
 oIxg==
X-Gm-Message-State: ACrzQf1vfqaQQyjMTqyfZGZeRNQdBeoZstkNxZwCAo7deexDnFjdtD2w
 EX5MS/nMHw5iJIwqLVcbWp4xSyBX2RFRUNvMXwB+ye7UQOw=
X-Google-Smtp-Source: AMsMyM5vg8N9dDW35cXYnRV0vMdNWWQOk5I20+pSLu1UdubJKDDQpcDyA6OCK60nRt7T9Q9hMWGXE3CrFggT3+iul/0=
X-Received: by 2002:a5b:9c5:0:b0:6ca:d6da:30c1 with SMTP id
 y5-20020a5b09c5000000b006cad6da30c1mr8707218ybq.372.1666639612737; Mon, 24
 Oct 2022 12:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-11-vishal.moola@gmail.com>
In-Reply-To: <20221017202451.4951-11-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 24 Oct 2022 12:26:41 -0700
Message-ID: <CAOzc2pz53R5ZT0=U8uav9=FL7_rn+6pUrkfeTZ-bx5_3Pac-xg@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle) wrote:
 > > Converted the function to use folios throughout. This is in preparation
 > for the removal of find_get_pages_range_tag(). Now supports [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.177 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1on36A-00G1NV-HR
Subject: Re: [f2fs-dev] [PATCH v3 10/23] ext4: Convert
 mpage_prepare_extent_to_map() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org, tytso@mit.edu,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> Converted the function to use folios throughout. This is in preparation
> for the removal of find_get_pages_range_tag(). Now supports large
> folios.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/ext4/inode.c | 55 ++++++++++++++++++++++++-------------------------
>  1 file changed, 27 insertions(+), 28 deletions(-)
>
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 2b5ef1b64249..69a0708c8e87 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -2572,8 +2572,8 @@ static int ext4_da_writepages_trans_blocks(struct inode *inode)
>  static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>  {
>         struct address_space *mapping = mpd->inode->i_mapping;
> -       struct pagevec pvec;
> -       unsigned int nr_pages;
> +       struct folio_batch fbatch;
> +       unsigned int nr_folios;
>         long left = mpd->wbc->nr_to_write;
>         pgoff_t index = mpd->first_page;
>         pgoff_t end = mpd->last_page;
> @@ -2587,18 +2587,17 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>                 tag = PAGECACHE_TAG_TOWRITE;
>         else
>                 tag = PAGECACHE_TAG_DIRTY;
> -
> -       pagevec_init(&pvec);
> +       folio_batch_init(&fbatch);
>         mpd->map.m_len = 0;
>         mpd->next_page = index;
>         while (index <= end) {
> -               nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> -                               tag);
> -               if (nr_pages == 0)
> +               nr_folios = filemap_get_folios_tag(mapping, &index, end,
> +                               tag, &fbatch);
> +               if (nr_folios == 0)
>                         break;
>
> -               for (i = 0; i < nr_pages; i++) {
> -                       struct page *page = pvec.pages[i];
> +               for (i = 0; i < nr_folios; i++) {
> +                       struct folio *folio = fbatch.folios[i];
>
>                         /*
>                          * Accumulated enough dirty pages? This doesn't apply
> @@ -2612,10 +2611,10 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>                                 goto out;
>
>                         /* If we can't merge this page, we are done. */
> -                       if (mpd->map.m_len > 0 && mpd->next_page != page->index)
> +                       if (mpd->map.m_len > 0 && mpd->next_page != folio->index)
>                                 goto out;
>
> -                       lock_page(page);
> +                       folio_lock(folio);
>                         /*
>                          * If the page is no longer dirty, or its mapping no
>                          * longer corresponds to inode we are writing (which
> @@ -2623,16 +2622,16 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>                          * page is already under writeback and we are not doing
>                          * a data integrity writeback, skip the page
>                          */
> -                       if (!PageDirty(page) ||
> -                           (PageWriteback(page) &&
> +                       if (!folio_test_dirty(folio) ||
> +                           (folio_test_writeback(folio) &&
>                              (mpd->wbc->sync_mode == WB_SYNC_NONE)) ||
> -                           unlikely(page->mapping != mapping)) {
> -                               unlock_page(page);
> +                           unlikely(folio->mapping != mapping)) {
> +                               folio_unlock(folio);
>                                 continue;
>                         }
>
> -                       wait_on_page_writeback(page);
> -                       BUG_ON(PageWriteback(page));
> +                       folio_wait_writeback(folio);
> +                       BUG_ON(folio_test_writeback(folio));
>
>                         /*
>                          * Should never happen but for buggy code in
> @@ -2643,33 +2642,33 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>                          *
>                          * [1] https://lore.kernel.org/linux-mm/20180103100430.GE4911@quack2.suse.cz
>                          */
> -                       if (!page_has_buffers(page)) {
> -                               ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", page->index);
> -                               ClearPageDirty(page);
> -                               unlock_page(page);
> +                       if (!folio_buffers(folio)) {
> +                               ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", folio->index);
> +                               folio_clear_dirty(folio);
> +                               folio_unlock(folio);
>                                 continue;
>                         }
>
>                         if (mpd->map.m_len == 0)
> -                               mpd->first_page = page->index;
> -                       mpd->next_page = page->index + 1;
> +                               mpd->first_page = folio->index;
> +                       mpd->next_page = folio->index + folio_nr_pages(folio);
>                         /* Add all dirty buffers to mpd */
> -                       lblk = ((ext4_lblk_t)page->index) <<
> +                       lblk = ((ext4_lblk_t)folio->index) <<
>                                 (PAGE_SHIFT - blkbits);
> -                       head = page_buffers(page);
> +                       head = folio_buffers(folio);
>                         err = mpage_process_page_bufs(mpd, head, head, lblk);
>                         if (err <= 0)
>                                 goto out;
>                         err = 0;
> -                       left--;
> +                       left -= folio_nr_pages(folio);
>                 }
> -               pagevec_release(&pvec);
> +               folio_batch_release(&fbatch);
>                 cond_resched();
>         }
>         mpd->scanned_until_end = 1;
>         return 0;
>  out:
> -       pagevec_release(&pvec);
> +       folio_batch_release(&fbatch);
>         return err;
>  }
>
> --
> 2.36.1
>

Does anyone have some time to look over this ext4 patch this week?
Feedback is appreciated.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

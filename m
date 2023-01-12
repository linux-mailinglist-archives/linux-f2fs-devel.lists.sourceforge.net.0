Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D8667C61
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 18:16:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pG1Bi-0007Z3-En;
	Thu, 12 Jan 2023 17:16:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pG1Bc-0007Yq-Ph
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 17:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ueu49HbYyw3uKaxLdkdNJFDLhnVwdUbocDy8yp3uK6U=; b=QahTQ7OAXhU5PWLrXqbF9EpOOU
 z8foFahxm6+NEIu4d5cvLtJ4CmfkhJCPmubwVqt9ad5vwKaa5fBai6skUuu/XwYvaJT8mguYsXXK5
 b2k3slV6AAO61tVWriTypOIt1i3XPCgeCBWgkewf7njqY3OjCl33viMziSM/zgrhLs8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ueu49HbYyw3uKaxLdkdNJFDLhnVwdUbocDy8yp3uK6U=; b=jlhxy56g5a77b2LwHzgUdoqPKh
 Ro+VcBDnweu1IvhYpTLJeTkbK5Q0mW2ELJZN0N9Khk/ifmfYTCsqnP4riRToLq8HUZf8H5VdeuwtH
 tBfxj/2XjfSu/VAjfNkOubzR28c4zZFVqoNp57I0vY+A3hiD4GARtmVcT1qGWNSynYBs=;
Received: from mail-yb1-f178.google.com ([209.85.219.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pG1BZ-0001S9-Vz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 17:16:20 +0000
Received: by mail-yb1-f178.google.com with SMTP id a9so2800798ybb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Jan 2023 09:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ueu49HbYyw3uKaxLdkdNJFDLhnVwdUbocDy8yp3uK6U=;
 b=NC4oLmKyiU3uGHOrCu0neAT7WGQm+evGATS22zDmNdb+/2NhuIG0f1cXd+Oo71x2x/
 d9fjT4jYSUOUBJWL+/XfoQRQcJircib0hCIQNig7qcjc8w6s9NDKCE8BxNIxJ/QIPawr
 cGDcDEgYwNMISqTlSdoe2gi9E7vXeiwnnDNv9jj5eXpGknHXsQrJmwtldQVLWCvhl3ZG
 lIyceotTUmoEX6Dvf7U4pSHAwxk6VUESS1YrPAshFBx/sv/5P+3kMTg7lyJXQYkVLv/j
 nhYbgnk5O/zNb7Ew31BfnKA81FkIZ4oEZPonWMG3EVzYgOtn38OFepH0Ci/+hw4YNxsB
 DwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ueu49HbYyw3uKaxLdkdNJFDLhnVwdUbocDy8yp3uK6U=;
 b=QZipcYloSzs8qIgf9xI+P1bp9jfCMxScdh15ygrEys7FnieGqAUasHFucLnFghSK8e
 DCIOKehJi386aJxcOHfsQcOdInIKYx4ToGJulrPzWF+ekTZnm5JpVEauqhIH3P8lh8Zv
 niDOljUoc+W5vIXazJEIxypxz9vjuiqhOaAC3pejrW5rsFktyja4XtNK+8vyGZ6gJ26Y
 Ej0ASQmh/rAomI898lw1v4qMd6CsXUT/xo5a+D97NlsVLZMLg7ZABP7wm5gIXBeavIMb
 1YW1OXmj+b0LHepyi0BDWhjtgLPrxZe8f6BGUURbSLdfB/UjceFkxbTJCuLol1FzRbv7
 4kYg==
X-Gm-Message-State: AFqh2kqrZXBlIuGWey5NiDajDOhF74ntTy8SXSQmU+LcbFVOCRhLmhtT
 4kfdBvo3YHk0ArQBf6BUfa1CZxA6LA1GB6gp3SU=
X-Google-Smtp-Source: AMrXdXt4S29867pWpNEcWUZVtr/uqb3UM4fpVgRhzCkqlx5R6lghcyEfD/1N+9wnCtzwrdSh12ePIMINBFYAmF+ldAs=
X-Received: by 2002:a25:abea:0:b0:762:b86:e82e with SMTP id
 v97-20020a25abea000000b007620b86e82emr8539372ybi.407.1673543771906; Thu, 12
 Jan 2023 09:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20230104211448.4804-1-vishal.moola@gmail.com>
 <20230104211448.4804-11-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-11-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 12 Jan 2023 09:16:00 -0800
Message-ID: <CAOzc2pwoY74wdgCn2b=u391BNDmzOQ32e7yDt-ULwoNkhZ_4ig@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org, tytso@mit.edu
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 4, 2023 at 1:15 PM Vishal Moola (Oracle) wrote:
 > > Converted the function to use folios throughout. This is in preparation
 > for the removal of find_get_pages_range_tag(). Now supports [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.178 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pG1BZ-0001S9-Vz
Subject: Re: [f2fs-dev] [PATCH v5 10/23] ext4: Convert
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 4, 2023 at 1:15 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> Converted the function to use folios throughout. This is in preparation
> for the removal of find_get_pages_range_tag(). Now supports large
> folios. This change removes 11 calls to compound_head().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/ext4/inode.c | 65 ++++++++++++++++++++++++-------------------------
>  1 file changed, 32 insertions(+), 33 deletions(-)
>
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 9d9f414f99fe..fb6cd994e59a 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -2595,8 +2595,8 @@ static bool ext4_page_nomap_can_writeout(struct page *page)
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
> @@ -2610,18 +2610,17 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
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
> @@ -2635,10 +2634,10 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
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
> @@ -2646,16 +2645,16 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
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
> @@ -2666,49 +2665,49 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
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
>                         /*
>                          * Writeout for transaction commit where we cannot
>                          * modify metadata is simple. Just submit the page.
>                          */
>                         if (!mpd->can_map) {
> -                               if (ext4_page_nomap_can_writeout(page)) {
> -                                       err = mpage_submit_page(mpd, page);
> +                               if (ext4_page_nomap_can_writeout(&folio->page)) {
> +                                       err = mpage_submit_page(mpd, &folio->page);
>                                         if (err < 0)
>                                                 goto out;
>                                 } else {
> -                                       unlock_page(page);
> -                                       mpd->first_page++;
> +                                       folio_unlock(folio);
> +                                       mpd->first_page += folio_nr_pages(folio);
>                                 }
>                         } else {
>                                 /* Add all dirty buffers to mpd */
> -                               lblk = ((ext4_lblk_t)page->index) <<
> +                               lblk = ((ext4_lblk_t)folio->index) <<
>                                         (PAGE_SHIFT - blkbits);
> -                               head = page_buffers(page);
> +                               head = folio_buffers(folio);
>                                 err = mpage_process_page_bufs(mpd, head, head,
> -                                                             lblk);
> +                                               lblk);
>                                 if (err <= 0)
>                                         goto out;
>                                 err = 0;
>                         }
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
> 2.38.1
>

Could someone review this ext4 patch, please? This is one of the
2 remaining patches that need to be looked at in the series.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

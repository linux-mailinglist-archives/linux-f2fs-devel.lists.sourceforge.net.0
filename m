Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753D5AC023
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  3 Sep 2022 19:38:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oUX6L-00072z-FK;
	Sat, 03 Sep 2022 17:38:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1oUX6J-00072t-Ld
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Sep 2022 17:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xX2O58QMupv9rWIX/wz0TD9J8Ed7HqVnisBNPZl6V04=; b=eJ5TNqJw/AY9gFNGkQhRUYulVH
 SZq6dwZJHC5esXzFCGaNFc4iAH97Ybbrb1T5AfQjTKcGA9ttrD1GvKjdX4IaTPnzvFYVoCx0/+TzI
 08IHmw8mkAuClsA4NtcqvvAVD8kY2NBFlSAkcN/x6CyYYpEzO9phEkcuVL0hHmkhbN0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xX2O58QMupv9rWIX/wz0TD9J8Ed7HqVnisBNPZl6V04=; b=cfuPFEH7noVr5HSqjRfsyenrVc
 WFXFLTf0/w13AvBB7OH6qdADvE1mVD+GXA9eZ9RcxzQEwUw0hCCn5LExLiYWK2KPsWw37IvVDmeDx
 ojNW1y8Zj5vh9260lOZ3EasiopjNYdIGzSBToDu51XRrhZ5YlMCEwI/sUOciwBqi9tqo=;
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oUX6F-0002no-6u for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Sep 2022 17:38:35 +0000
Received: by mail-lj1-f178.google.com with SMTP id s15so5239972ljp.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 03 Sep 2022 10:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xX2O58QMupv9rWIX/wz0TD9J8Ed7HqVnisBNPZl6V04=;
 b=P/hsH1QKS4072Gai1EmOGCnjPTQWZiiOiE+P26T80mgV0tbTOnkDXKC3nEWi1Xoe/A
 Hs7LLFSp+fCaJRWZVqv/8C2xzImMvLQoTDYUfx6u9PmIwXRQtB9n4gGmx+GH0S1f7zYT
 EpKdDfbdqDAHgNmhwbrPGp06lVMfmsEbewBLDb/B+dQfW30xzF8F2l2F/gidKFJKBG6M
 xlYX6S3WMrWsrSfVCDpCmKqprjSkUDidSKYHiXrhQ6jx9rWQ1os07RE+QbroswHSap0D
 gOYyJOlFnRdNpKj+sEkb2UqwaGfM6EvoZTNoU3eDmRl2MoAiXkF/RCfX0IxvBDH8/V+n
 XD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xX2O58QMupv9rWIX/wz0TD9J8Ed7HqVnisBNPZl6V04=;
 b=q2DEZg6gftyrOIX9qboz5JY2dm719k1dAzmogfFkrR4B/8ueg+v61rocLfxHscCKYH
 k6NeUDaThyOC961SRyHTTztzjEZxjSmprqIGkxzTvHsHMdgG1og6FLM58hPWRiI6j1sc
 qyWd8v7L+jnh3JKbMFmCN5ZpRHj9Kp5Uvy+Ep62FpTH2/HOU82Jeby0iuY3y8pIyN6BL
 zumC9x+dfdk3V+ex8lzysZ26rWGQ3f3RqIj8qPbdF6yubOGpY8vKyj87Wim7W9ZpcLoq
 cfXhdu1LowNO8FggP9IhN6M4WBkT+iWB5tKP1xbuaTRWw6+uo1qF2ak1f1p0vqNc9oxy
 uOYw==
X-Gm-Message-State: ACgBeo0DVaVYKr6JRKj8Z06dOIQ1sRDh6JPDCkwvL3AtY62U1l4pfe1t
 BD5INfzJ87sZXBFaK/ia1MvAe5SvYes6NED6ieA=
X-Google-Smtp-Source: AA6agR7+UPXECkLr9xecEnlHY9jJP9Sk53/z1csaRMZh+iBcI4PkxC6eajktqUCZxUcf8SInATP1uw7iY4QjQlwWETk=
X-Received: by 2002:a2e:b8d5:0:b0:25f:e94d:10a2 with SMTP id
 s21-20020a2eb8d5000000b0025fe94d10a2mr13425885ljp.274.1662226704352; Sat, 03
 Sep 2022 10:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-19-vishal.moola@gmail.com>
In-Reply-To: <20220901220138.182896-19-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 4 Sep 2022 02:38:06 +0900
Message-ID: <CAKFNMo=YwdFOQNUuwNvYn6u41C8A2M905-nDkEFRejPZ2_svYg@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 2, 2022 at 7:07 AM Vishal Moola (Oracle) wrote:
 > > Convert function to use folios throughout. This is in preparation for
 > the removal of find_get_pages_range_tag(). > > Signed-off-by: Vi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.178 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [konishi.ryusuke[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oUX6F-0002no-6u
Subject: Re: [f2fs-dev] [PATCH 18/23] nilfs2: Convert
 nilfs_lookup_dirty_data_buffers() to use filemap_get_folios_tag()
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

On Fri, Sep 2, 2022 at 7:07 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/segment.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
> index 0afe0832c754..e95c667bdc8f 100644
> --- a/fs/nilfs2/segment.c
> +++ b/fs/nilfs2/segment.c
> @@ -680,7 +680,7 @@ static size_t nilfs_lookup_dirty_data_buffers(struct inode *inode,
>                                               loff_t start, loff_t end)
>  {
>         struct address_space *mapping = inode->i_mapping;
> -       struct pagevec pvec;
> +       struct folio_batch fbatch;
>         pgoff_t index = 0, last = ULONG_MAX;
>         size_t ndirties = 0;
>         int i;
> @@ -694,23 +694,26 @@ static size_t nilfs_lookup_dirty_data_buffers(struct inode *inode,
>                 index = start >> PAGE_SHIFT;
>                 last = end >> PAGE_SHIFT;
>         }
> -       pagevec_init(&pvec);
> +       folio_batch_init(&fbatch);
>   repeat:
>         if (unlikely(index > last) ||
> -           !pagevec_lookup_range_tag(&pvec, mapping, &index, last,
> -                               PAGECACHE_TAG_DIRTY))
> +             !filemap_get_folios_tag(mapping, &index, last,
> +                     PAGECACHE_TAG_DIRTY, &fbatch))
>                 return ndirties;
>
> -       for (i = 0; i < pagevec_count(&pvec); i++) {
> +       for (i = 0; i < folio_batch_count(&fbatch); i++) {
>                 struct buffer_head *bh, *head;
> -               struct page *page = pvec.pages[i];
> +               struct folio *folio = fbatch.folios[i];
>
> -               lock_page(page);
> -               if (!page_has_buffers(page))
> -                       create_empty_buffers(page, i_blocksize(inode), 0);
> -               unlock_page(page);

> +               head = folio_buffers(folio);
> +               folio_lock(folio);

Could you please swap these two lines to keep the "head" check in the lock?

Thanks,
Ryusuke Konishi


> +               if (!head) {
> +                       create_empty_buffers(&folio->page, i_blocksize(inode), 0);
> +                       head = folio_buffers(folio);
> +               }
> +               folio_unlock(folio);
>
> -               bh = head = page_buffers(page);
> +               bh = head;
>                 do {
>                         if (!buffer_dirty(bh) || buffer_async_write(bh))
>                                 continue;
> @@ -718,13 +721,13 @@ static size_t nilfs_lookup_dirty_data_buffers(struct inode *inode,
>                         list_add_tail(&bh->b_assoc_buffers, listp);
>                         ndirties++;
>                         if (unlikely(ndirties >= nlimit)) {
> -                               pagevec_release(&pvec);
> +                               folio_batch_release(&fbatch);
>                                 cond_resched();
>                                 return ndirties;
>                         }
>                 } while (bh = bh->b_this_page, bh != head);
>         }
> -       pagevec_release(&pvec);
> +       folio_batch_release(&fbatch);
>         cond_resched();
>         goto repeat;
>  }
> --
> 2.36.1
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

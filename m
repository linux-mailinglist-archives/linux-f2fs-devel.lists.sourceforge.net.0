Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C904540F2E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jun 2022 21:03:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyeU7-0001ZK-TD; Tue, 07 Jun 2022 19:03:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <schumakeranna@gmail.com>)
 id 1nyeU6-0001ZA-I2; Tue, 07 Jun 2022 19:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YvJr1HjhCxOrlCoCkGFSV+IIsFWm48YyeI3AKcRnUIQ=; b=j5jR763w011u4lj2hailGDeDIS
 Q79a0ySkgTZdnlqvDqWs9gSQuKIlmZHrLyAO/Orr+p9kBoY7IZBpOKcSPxq104iCXCL6TPxP6eUoe
 UNNmFacQIkRpLaRxrvQVn9/3OWk0lZEEaAE/5MQzsZNvysbUWUMo6woyXAL1uUUU/W14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YvJr1HjhCxOrlCoCkGFSV+IIsFWm48YyeI3AKcRnUIQ=; b=Z31KpbAvFo5RtkAStQMFhBdU+5
 AvJoeuIi7eBRnIUfzXEkl1gWxGQoYMq4O9JaGUmzS84vZXi6S9Mp2FbaeXfGTlW0ZFXTgH5OCrblJ
 jTHgTCoGH65HBwpd/6WBm0eH7Sj9NWdDKb818MUuzuJb5oPZqenJAne+PUiKG7WlmCQk=;
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nyeU4-0004T3-Ow; Tue, 07 Jun 2022 19:03:22 +0000
Received: by mail-wr1-f49.google.com with SMTP id h5so25458426wrb.0;
 Tue, 07 Jun 2022 12:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YvJr1HjhCxOrlCoCkGFSV+IIsFWm48YyeI3AKcRnUIQ=;
 b=Hms/G7n+Cgo9Oo8KkEEkY+zOKSfNSr0x2sJyW+zhwaVgQz3O94b2GcLqEXQ5rpNStl
 0HKAm9+ZoLlNQPtIgr4cociDPkwCkncIQHflys8+rX7ekkN9msPRJi3y7Z32ZVcY4EiS
 7BqJ/vQjOoHIBqnzmxcFtWqT7QYEfBo1Q/O2ARB7Zezb9YKydEPEtT4frki2lnbWxGbh
 +l4HGgVODycuk5l12Ov27ifMex6LzR4b2/m50DSQAyRbCNVvVRI16BLqIO5hxeYWqMZf
 1B5FmkDuafNHVx7eJh5UtqIQKDfI2oiQry9cQbb6BsPHPbHKrMcf9dIskCLmEL3K7DH1
 6oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YvJr1HjhCxOrlCoCkGFSV+IIsFWm48YyeI3AKcRnUIQ=;
 b=aFeA0pt+nAap811KqIBGaPLf85L5MOBh3g9S3DcaVEs29F9sD43TZVGSNFuxZFQKRa
 im1TuSRpM0w6ZUHpobB+u0se/ymkZl8hqo/RYc40DaT3bgefC3Mo0qsZLjLg2OttCrvN
 MW8ZxEViK54nQrzITy0hGLZlOwJ5WiVVkp6Yxs0+ClwEXfDLmqhgKdaNhTaUrHzuHgUy
 fia0nry8GyEnPHOk8jSa7u1SQs0d8JW5KmPwYPduz+iWLjnQLddflDP+w+2LuG0zdhdl
 F1RE7EE/nMn39PyOXtrZkQnfWoaW724ZkpCSJgV1KueO8FfXEf4w5T5uRa73j1L0FVVm
 XYzw==
X-Gm-Message-State: AOAM531gn2HuvDNlW3mCbdvvpA8TVtYfh4wdU/Tqm2yEFumy6PjXvzua
 wDGANEmg0GGJ7zTl6SzEYxQD06YuN1/rFCOOEus=
X-Google-Smtp-Source: ABdhPJzCEhxBgnE2TvKp0j//I+yGIGt10PvMUBcSniQ/uliTPAhBtZXCX4ft7FKRwzuXla8IHTC/85U5DKgXrpVCjbg=
X-Received: by 2002:a5d:62c7:0:b0:216:fa41:2f81 with SMTP id
 o7-20020a5d62c7000000b00216fa412f81mr17337284wrv.249.1654628595478; Tue, 07
 Jun 2022 12:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-8-willy@infradead.org>
In-Reply-To: <20220606204050.2625949-8-willy@infradead.org>
From: Anna Schumaker <schumaker.anna@gmail.com>
Date: Tue, 7 Jun 2022 15:02:59 -0400
Message-ID: <CAFX2Jf=ugChaWF0Je=ew_-shhdSJYXy5dkjqsoL=9B37QWv3bA@mail.gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 6, 2022 at 7:37 PM Matthew Wilcox (Oracle) wrote:
 > > Use a folio throughout this function. migrate_page() will be converted
 > later. > > Signed-off-by: Matthew Wilcox (Oracle) Looks fairly
 straightforward.
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [schumakeranna[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.49 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nyeU4-0004T3-Ow
Subject: Re: [f2fs-dev] [PATCH 07/20] nfs: Convert to migrate_folio
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
Cc: linux-aio@kvack.org, Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 cluster-devel@redhat.com, linux-ntfs-dev@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-xfs <linux-xfs@vger.kernel.org>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 6, 2022 at 7:37 PM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
>
> Use a folio throughout this function.  migrate_page() will be converted
> later.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Looks fairly straightforward.

Acked-by: Anna Schumaker <Anna.Schumaker@Netapp.com>

> ---
>  fs/nfs/file.c     |  4 +---
>  fs/nfs/internal.h |  6 ++++--
>  fs/nfs/write.c    | 16 ++++++++--------
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 2d72b1b7ed74..549baed76351 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -533,9 +533,7 @@ const struct address_space_operations nfs_file_aops = {
>         .write_end = nfs_write_end,
>         .invalidate_folio = nfs_invalidate_folio,
>         .release_folio = nfs_release_folio,
> -#ifdef CONFIG_MIGRATION
> -       .migratepage = nfs_migrate_page,
> -#endif
> +       .migrate_folio = nfs_migrate_folio,
>         .launder_folio = nfs_launder_folio,
>         .is_dirty_writeback = nfs_check_dirty_writeback,
>         .error_remove_page = generic_error_remove_page,
> diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
> index 8f8cd6e2d4db..437ebe544aaf 100644
> --- a/fs/nfs/internal.h
> +++ b/fs/nfs/internal.h
> @@ -578,8 +578,10 @@ void nfs_clear_pnfs_ds_commit_verifiers(struct pnfs_ds_commit_info *cinfo)
>  #endif
>
>  #ifdef CONFIG_MIGRATION
> -extern int nfs_migrate_page(struct address_space *,
> -               struct page *, struct page *, enum migrate_mode);
> +int nfs_migrate_folio(struct address_space *, struct folio *dst,
> +               struct folio *src, enum migrate_mode);
> +#else
> +#define nfs_migrate_folio NULL
>  #endif
>
>  static inline int
> diff --git a/fs/nfs/write.c b/fs/nfs/write.c
> index 1c706465d090..649b9e633459 100644
> --- a/fs/nfs/write.c
> +++ b/fs/nfs/write.c
> @@ -2119,27 +2119,27 @@ int nfs_wb_page(struct inode *inode, struct page *page)
>  }
>
>  #ifdef CONFIG_MIGRATION
> -int nfs_migrate_page(struct address_space *mapping, struct page *newpage,
> -               struct page *page, enum migrate_mode mode)
> +int nfs_migrate_folio(struct address_space *mapping, struct folio *dst,
> +               struct folio *src, enum migrate_mode mode)
>  {
>         /*
> -        * If PagePrivate is set, then the page is currently associated with
> +        * If the private flag is set, the folio is currently associated with
>          * an in-progress read or write request. Don't try to migrate it.
>          *
>          * FIXME: we could do this in principle, but we'll need a way to ensure
>          *        that we can safely release the inode reference while holding
> -        *        the page lock.
> +        *        the folio lock.
>          */
> -       if (PagePrivate(page))
> +       if (folio_test_private(src))
>                 return -EBUSY;
>
> -       if (PageFsCache(page)) {
> +       if (folio_test_fscache(src)) {
>                 if (mode == MIGRATE_ASYNC)
>                         return -EBUSY;
> -               wait_on_page_fscache(page);
> +               folio_wait_fscache(src);
>         }
>
> -       return migrate_page(mapping, newpage, page, mode);
> +       return migrate_page(mapping, &dst->page, &src->page, mode);
>  }
>  #endif
>
> --
> 2.35.1
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C886D60B7BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 21:31:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on3Ab-0000nc-EM;
	Mon, 24 Oct 2022 19:31:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1on3AZ-0000nS-Uu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 19:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ewURVtEZDzlu0i+gVIVlIwdo2AKdKjYywGZcJK82PeY=; b=B85CRck/5YYLi5qLsZc8ywfxJ5
 ETsZoBqIga9Pv6nWk+AyAWCasfTuGmeBiDdz/IUoQa9LydECVCXGcDDByxttgiJAOka2PSQwVCGjD
 zB++jXYSXDxbdLyzRRFYPMZq9ZcMqYGBFILMIUpsi0N1SzuqD8qD524VE7JvBfzmhgGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ewURVtEZDzlu0i+gVIVlIwdo2AKdKjYywGZcJK82PeY=; b=hkd7Whf+N4Gd7B2NFcbtBEyJLS
 1TnSUD9a4HZtGD9rLXq7Vw6XMArjfS2pbThODikWeU4PLPZwNXR6Ikgo2bgD7ghv0LNJYRj/ErI0l
 11oJZI5qToDmmT4yRzxqf4UisuKn/n3S5pmCkW8b0+0pTXnW6C/kxVc014h2aqS1aREg=;
Received: from mail-yb1-f172.google.com ([209.85.219.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1on3AV-00070h-Gj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 19:31:31 +0000
Received: by mail-yb1-f172.google.com with SMTP id e62so12143297yba.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Oct 2022 12:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ewURVtEZDzlu0i+gVIVlIwdo2AKdKjYywGZcJK82PeY=;
 b=pvb2n989P4g452NhPl3a7ovLcs0nrAlug6GLmwQOWVXp8sZf4hJMVc75J+1AdeaR5B
 jTPfEsL3DxRnXGA7sUdDXsbNz9yiIRbkdJnpbTPKyuqZjCtxmSrHQ8G13WCC1Iuw5z+o
 sb4RzMo24wxwjit5EZW/pEDJsdJvyK01K/zuT64THd3AukYqfUeJn+21U43e4WOGV7AE
 TRjlBL3V1r6EQNYSf744jlDgboUSn44k7FA4sUf3fJvYekNs22FOZgtNlymJimDJwZ6+
 t25uP2Y+j8/iUSZasJ8p1q+kJXQcLGIToESALHyDssHFEsfrxGDSk2to5cSEMGM1zWKn
 AmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ewURVtEZDzlu0i+gVIVlIwdo2AKdKjYywGZcJK82PeY=;
 b=vGYwSvu62cXL/NwHSo6Qv+c3mdc1Sc6XmjgPrUXTBW/Ki8KExfqTD4mS9VGqPrgKAB
 yEB9ijXsfbfq46q9CYtaFqYnEgKgbebYMH1VXn6OYX9BrSWN5jrKdar5TFHzxY27/phI
 6MZtIXN2mizM3qSWk2vIleLARD6ZAhGLHjvo6P/ypQ83sRXfSry8Kx+2umTP8dol16TX
 b96Z0z6YsgMn7J12c9tkMwwOltUFpwv+pp7P1ZE1LL/kQh4RFN9BYnIJmvDKffuKiOri
 HoCBANTgl9+i4U+ZTtxP7vZ19nEkHuZEsxcpwaIwGo0jYZoVric6PigkaWf966kQwszu
 FM5A==
X-Gm-Message-State: ACrzQf3r8BMwGBq0M78wfdfgc8t3jaP6EQg3J+baxZGztP+kParw53Ct
 w6xcW1Bw03T2k7N0tY5c2zAGR58KiHmtvyGjipoZ+kIsDfckqA==
X-Google-Smtp-Source: AMsMyM6B6fNnp2prURoNrQAhN6Lbp6rH2u1B/iqqAEW6OHySGJ/tzUiCXpuF8+v7sMB52Tmf+g8Xaw+7Yytz7WdTgT4=
X-Received: by 2002:a25:3bd0:0:b0:6ca:6428:ac94 with SMTP id
 i199-20020a253bd0000000b006ca6428ac94mr16397507yba.462.1666639881517; Mon, 24
 Oct 2022 12:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-12-vishal.moola@gmail.com>
In-Reply-To: <20221017202451.4951-12-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 24 Oct 2022 12:31:10 -0700
Message-ID: <CAOzc2pwKoyy4i4zBKhvoKmN8cezUxjDhjYZnK9GLcJniQVPoGA@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle) wrote:
 > > Convert function to use a folio_batch instead of pagevec. This is in
 > preparation for the removal of find_get_pages_range_tag(). > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1on3AV-00070h-Gj
Subject: Re: [f2fs-dev] [PATCH v3 11/23] f2fs: Convert
 f2fs_fsync_node_pages() to use filemap_get_folios_tag()
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
 cluster-devel@redhat.com, linux-mm@kvack.org, jaegeuk@kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> Convert function to use a folio_batch instead of pagevec. This is in
> preparation for the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/f2fs/node.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 983572f23896..e8b72336c096 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1728,12 +1728,12 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>                         unsigned int *seq_id)
>  {
>         pgoff_t index;
> -       struct pagevec pvec;
> +       struct folio_batch fbatch;
>         int ret = 0;
>         struct page *last_page = NULL;
>         bool marked = false;
>         nid_t ino = inode->i_ino;
> -       int nr_pages;
> +       int nr_folios;
>         int nwritten = 0;
>
>         if (atomic) {
> @@ -1742,20 +1742,21 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>                         return PTR_ERR_OR_ZERO(last_page);
>         }
>  retry:
> -       pagevec_init(&pvec);
> +       folio_batch_init(&fbatch);
>         index = 0;
>
> -       while ((nr_pages = pagevec_lookup_tag(&pvec, NODE_MAPPING(sbi), &index,
> -                               PAGECACHE_TAG_DIRTY))) {
> +       while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
> +                                       (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
> +                                       &fbatch))) {
>                 int i;
>
> -               for (i = 0; i < nr_pages; i++) {
> -                       struct page *page = pvec.pages[i];
> +               for (i = 0; i < nr_folios; i++) {
> +                       struct page *page = &fbatch.folios[i]->page;
>                         bool submitted = false;
>
>                         if (unlikely(f2fs_cp_error(sbi))) {
>                                 f2fs_put_page(last_page, 0);
> -                               pagevec_release(&pvec);
> +                               folio_batch_release(&fbatch);
>                                 ret = -EIO;
>                                 goto out;
>                         }
> @@ -1821,7 +1822,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>                                 break;
>                         }
>                 }
> -               pagevec_release(&pvec);
> +               folio_batch_release(&fbatch);
>                 cond_resched();
>
>                 if (ret || marked)
> --
> 2.36.1
>

Following up on these f2fs patches (11/23, 12/23, 13/23, 14/23, 15/23,
16/23). Does anyone have time to review them this week?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

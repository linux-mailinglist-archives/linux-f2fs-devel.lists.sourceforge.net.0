Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D02A19246F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 10:43:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH2ZG-0005yQ-1h; Wed, 25 Mar 2020 09:43:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <miklos@szeredi.hu>) id 1jH2ZF-0005yK-F6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 09:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WJC80u+Ifj4HCTJaBhCcmeQxlknM9aDMikhj5e78Hk4=; b=SnPgHdgSVNhfkPvebLrIGq5ufH
 CnwoXiFy77DdI/lLGyMJQfUbgNQ9qUwOWyCRjtHjsy996vv8s/TY9cRlED60JbtwF3FTKF5eU4rSC
 yXly2GLFjZA/R+e+Czbtr0ewg3mCv6bi7B9LEOJNmscR8oXxsYeHSAIrcEUrUZuxLrDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WJC80u+Ifj4HCTJaBhCcmeQxlknM9aDMikhj5e78Hk4=; b=MjpnglaM5YPDFUdx1vIcanmJWM
 WdQ3sswXbEektwgS7SAMgGw220l4/cVdzJU/2szHTxeekWq8OLicq0gvcrecutLHAadmCceMc/hCM
 i5w0GQnd0ps1q4q9o3GIlOnmQaZKbafD6V+q59x9SpOXcyi7BhUODBIEa3JZ/tRP6IJ8=;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jH2Z7-006Upq-4b
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 09:43:21 +0000
Received: by mail-il1-f193.google.com with SMTP id g15so1203340ilj.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2020 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WJC80u+Ifj4HCTJaBhCcmeQxlknM9aDMikhj5e78Hk4=;
 b=DMyiJnazMqjl2qfzafo7tIFEtefoZjrSvPvqu5sHfAPRBEZ/A1uRJU7icYztbxoEQB
 g5CF3/s4HPa6oNzbsswDGOeOH6b8cPtSAM9SODfnMoawOYaqGUMD64MMEV4CyYGxaNCK
 u3cNVaqIoy9X6Y4p8jTdkYJcnnoetQuPBsAYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WJC80u+Ifj4HCTJaBhCcmeQxlknM9aDMikhj5e78Hk4=;
 b=V9L4NokH5RFftZlIH7Sj1eNhqOw8TJ1ztM/1/CaxX6V9U6JuhRJKyU53LACkM5SKA1
 A8/l3gDNcbbE8RHvhzWjedCVqlSL8odLLNj47vYlNopHbCO5+L8hMF/1cZgSl3s9tfLW
 mlO5zLX6q6u4b/m4KovNeQF60YD1+nF/ahkq25saMpAtT5083WRCwihIkx+N6kpn4ivr
 w1z8OoV0An9zOL82lK/IbD4LqgNuaytcIsAnL17eoRFEGAF7uR46yBzYi3R3n2PriRye
 t+GuRQRCmMQu2+RcnmfpUs6ESXdqPbLB6kwgJckctGGtc726cX472n+j8jbwxg+R1yKj
 PDLw==
X-Gm-Message-State: ANhLgQ0s4OsV0eBNRDgV5IcztAG6gMls7gubr3cU8LJ2PAy2CiCi1IkM
 79bKij4A7/1IAqHT310TOTUcuu6gG2b4fXHv6L5OrQ==
X-Google-Smtp-Source: ADFU+vsgfIWqTVfFvZZGiDAww03tclKMezpcFsmTHkThxRNJbwZiwKmblFARFxQj+PxAwoovscn7WyTAXThKOCyBwVE=
X-Received: by 2002:a92:9fd0:: with SMTP id z77mr2593848ilk.257.1585129387289; 
 Wed, 25 Mar 2020 02:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200323202259.13363-1-willy@infradead.org>
 <20200323202259.13363-25-willy@infradead.org>
In-Reply-To: <20200323202259.13363-25-willy@infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 25 Mar 2020 10:42:56 +0100
Message-ID: <CAJfpegu7EFcWrg3bP+-2BX_kb52RrzBCo_U3QKYzUkZfe4EjDA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.193 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jH2Z7-006Upq-4b
Subject: Re: [f2fs-dev] [PATCH v10 24/25] fuse: Convert from readpages to
 readahead
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
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 Dave Chinner <dchinner@redhat.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Mar 23, 2020 at 9:23 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> Use the new readahead operation in fuse.  Switching away from the
> read_cache_pages() helper gets rid of an implicit call to put_page(),
> so we can get rid of the get_page() call in fuse_readpages_fill().
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Dave Chinner <dchinner@redhat.com>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  fs/fuse/file.c | 46 +++++++++++++++++++---------------------------
>  1 file changed, 19 insertions(+), 27 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 9d67b830fb7a..5749505bcff6 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -923,9 +923,8 @@ struct fuse_fill_data {
>         unsigned int max_pages;
>  };
>
> -static int fuse_readpages_fill(void *_data, struct page *page)
> +static int fuse_readpages_fill(struct fuse_fill_data *data, struct page *page)
>  {
> -       struct fuse_fill_data *data = _data;
>         struct fuse_io_args *ia = data->ia;
>         struct fuse_args_pages *ap = &ia->ap;
>         struct inode *inode = data->inode;
> @@ -941,10 +940,8 @@ static int fuse_readpages_fill(void *_data, struct page *page)
>                                         fc->max_pages);
>                 fuse_send_readpages(ia, data->file);
>                 data->ia = ia = fuse_io_alloc(NULL, data->max_pages);
> -               if (!ia) {
> -                       unlock_page(page);
> +               if (!ia)
>                         return -ENOMEM;
> -               }
>                 ap = &ia->ap;
>         }
>
> @@ -954,7 +951,6 @@ static int fuse_readpages_fill(void *_data, struct page *page)
>                 return -EIO;
>         }
>
> -       get_page(page);
>         ap->pages[ap->num_pages] = page;
>         ap->descs[ap->num_pages].length = PAGE_SIZE;
>         ap->num_pages++;
> @@ -962,37 +958,33 @@ static int fuse_readpages_fill(void *_data, struct page *page)
>         return 0;
>  }
>
> -static int fuse_readpages(struct file *file, struct address_space *mapping,
> -                         struct list_head *pages, unsigned nr_pages)
> +static void fuse_readahead(struct readahead_control *rac)
>  {
> -       struct inode *inode = mapping->host;
> +       struct inode *inode = rac->mapping->host;
>         struct fuse_conn *fc = get_fuse_conn(inode);
>         struct fuse_fill_data data;
> -       int err;
> +       struct page *page;
>
> -       err = -EIO;
>         if (is_bad_inode(inode))
> -               goto out;
> +               return;
>
> -       data.file = file;
> +       data.file = rac->file;
>         data.inode = inode;
> -       data.nr_pages = nr_pages;
> -       data.max_pages = min_t(unsigned int, nr_pages, fc->max_pages);
> -;
> +       data.nr_pages = readahead_count(rac);
> +       data.max_pages = min_t(unsigned int, data.nr_pages, fc->max_pages);
>         data.ia = fuse_io_alloc(NULL, data.max_pages);
> -       err = -ENOMEM;
>         if (!data.ia)
> -               goto out;
> +               return;
>
> -       err = read_cache_pages(mapping, pages, fuse_readpages_fill, &data);
> -       if (!err) {
> -               if (data.ia->ap.num_pages)
> -                       fuse_send_readpages(data.ia, file);
> -               else
> -                       fuse_io_free(data.ia);
> +       while ((page = readahead_page(rac))) {
> +               if (fuse_readpages_fill(&data, page) != 0)

Shouldn't this unlock + put page on error?

Otherwise looks good.

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

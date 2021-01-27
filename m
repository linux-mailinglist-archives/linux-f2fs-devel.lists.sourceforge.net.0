Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B9330546A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Jan 2021 08:22:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4f9r-0002Fg-Vd; Wed, 27 Jan 2021 07:22:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <song@kernel.org>) id 1l4f9p-0002FV-1R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jan 2021 07:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F7WOzbHYieYbjVRWFhSaBjp7IQ9GHp5JECpzQk1IYxs=; b=fv4RD5NJ6C29z53Yr0L/pf2Ucd
 fCWQ58umNT3H+dFENfeTiXrbYFBnyhj7yPVrcXVAPYu75weD1VbagA24tLVscTNx97t+b4ioukS73
 JwnUFbdU/5UJciyXgMfiPfuo14U5ryhVzTLG1mSQJ6KAigeaCCu4YLf7sAz7GwHJWZzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F7WOzbHYieYbjVRWFhSaBjp7IQ9GHp5JECpzQk1IYxs=; b=aEAO6y06Vi0MYmU1CDv7XizJzZ
 XFr7H8NQ6WJYdRT3TjWImh6LK4uY8T9U+XWrsJKS8iwb+GFkqD+0BLPkZt1YfIH8gf20QC3w3q0aO
 fL/r0+dO7NbzI0HXociUen9mzkVBJTRKDsnJJkkEk3nAktH/4nahMM521Gcp8H5stsUo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4f9n-009o0z-HO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jan 2021 07:22:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D5E920760
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jan 2021 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611732134;
 bh=UmXZ4WGct5TD5g2zWBqeUZIY7+IEh1H1mojHQndD4p0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oDBiPqUDddARVPP8esIP80QkXjEj9+85T5QDZeh7nu2cYyt+eQZA8QDXikjpMwlat
 MNfPUAT8hEpYvyQzrx6AP5DR+ANmDLKNYdk+3I1Le4ClABg804A6YrqVAha+HDnXt3
 aXXje54ZXGe396yLREjvTO7F28tQlsy1EwE9vIS6460xIuuh3AzToqKFH1MkXqxaCP
 /NJx/3JofqwPazejWSqyqiZGHT+4SBSDqNllnI/Q9rYdu+otPvNjz6i73xOtGWI2Ql
 1f8AcHX5BqzHDL4QaB+j75p6mcXxGRjds0fAREsI+L/1LEC6UF0JYg2RbF8i9aAb9k
 jpAFtWZcqE2ig==
Received: by mail-lf1-f52.google.com with SMTP id p21so1228990lfu.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Jan 2021 23:22:14 -0800 (PST)
X-Gm-Message-State: AOAM530b8VtFy99E0YaQKQcYhiwdKfdsssxn4plkX8+w0BSaWPJCLWwj
 wLYddlzx/5z8mxGLyo6KU5GX2qOHQ6gRHq8ojKk=
X-Google-Smtp-Source: ABdhPJxflUggj8S5jQsQ3WpKvrE0C44XGXqHsiBc4rX5F3+Z0c1NJpDcJfbjDkFKR5D14faCz9LusUBrixofxv3V23Y=
X-Received: by 2002:a05:6512:5c6:: with SMTP id
 o6mr4374679lfo.281.1611732132634; 
 Tue, 26 Jan 2021 23:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-13-hch@lst.de>
In-Reply-To: <20210126145247.1964410-13-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 23:22:01 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6sVtB-baGn46_o6NVynuxQfy9_FuhC2ZK0cKu5cQHWDg@mail.gmail.com>
Message-ID: <CAPhsuW6sVtB-baGn46_o6NVynuxQfy9_FuhC2ZK0cKu5cQHWDg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l4f9n-009o0z-HO
Subject: Re: [f2fs-dev] [PATCH 12/17] md: simplify sync_page_io
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
Cc: Mike Snitzer <snitzer@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 dm-devel@redhat.com, drbd-dev@lists.linbit.com,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-nilfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-raid <linux-raid@vger.kernel.org>, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 26, 2021 at 7:14 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use an on-stack bio and biovec for the single page synchronous I/O.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/md.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index e2b9dbb6e888f6..6a27f52007c871 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -1021,29 +1021,29 @@ int md_super_wait(struct mddev *mddev)
>  int sync_page_io(struct md_rdev *rdev, sector_t sector, int size,
>                  struct page *page, int op, int op_flags, bool metadata_op)
>  {
> -       struct bio *bio = md_bio_alloc_sync(rdev->mddev);
> -       int ret;
> +       struct bio bio;
> +       struct bio_vec bvec;
> +
> +       bio_init(&bio, &bvec, 1);
>
>         if (metadata_op && rdev->meta_bdev)
> -               bio_set_dev(bio, rdev->meta_bdev);
> +               bio_set_dev(&bio, rdev->meta_bdev);
>         else
> -               bio_set_dev(bio, rdev->bdev);
> -       bio_set_op_attrs(bio, op, op_flags);
> +               bio_set_dev(&bio, rdev->bdev);
> +       bio.bi_opf = op | op_flags;
>         if (metadata_op)
> -               bio->bi_iter.bi_sector = sector + rdev->sb_start;
> +               bio.bi_iter.bi_sector = sector + rdev->sb_start;
>         else if (rdev->mddev->reshape_position != MaxSector &&
>                  (rdev->mddev->reshape_backwards ==
>                   (sector >= rdev->mddev->reshape_position)))
> -               bio->bi_iter.bi_sector = sector + rdev->new_data_offset;
> +               bio.bi_iter.bi_sector = sector + rdev->new_data_offset;
>         else
> -               bio->bi_iter.bi_sector = sector + rdev->data_offset;
> -       bio_add_page(bio, page, size, 0);
> +               bio.bi_iter.bi_sector = sector + rdev->data_offset;
> +       bio_add_page(&bio, page, size, 0);
>
> -       submit_bio_wait(bio);
> +       submit_bio_wait(&bio);
>
> -       ret = !bio->bi_status;
> -       bio_put(bio);
> -       return ret;
> +       return !bio.bi_status;
>  }
>  EXPORT_SYMBOL_GPL(sync_page_io);
>
> --
> 2.29.2
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

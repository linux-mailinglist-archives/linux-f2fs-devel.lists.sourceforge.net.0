Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6765305456
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Jan 2021 08:21:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4f9B-0002Cd-Px; Wed, 27 Jan 2021 07:21:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <song@kernel.org>) id 1l4f99-0002CU-UH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jan 2021 07:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1VK3Qtpbfd08Y0+EHBVjyNuugqRW26buSmbPlvGpwqE=; b=i5TeclMXZeoNSbcyeYCh5+44Ju
 oGye6HSY3VyHfawknLJjKmedPKQB88ltJLJwLl9+2x+YqIBCquOhNuePOaDsJV2kcewak06b/E8BQ
 sS1rJHmuHeGm+aYRqPxY1UxpC8Ekr/f9qE6snDRQVtU2NoKer8//O5qIXS3K5ClHm7vQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1VK3Qtpbfd08Y0+EHBVjyNuugqRW26buSmbPlvGpwqE=; b=VUWJlqoem6/MMDkrr+Q3jd+t9k
 QKpG8Q24B8eiaMIVOhv98MU8aDnxO3UQM7Ahm53wETu3RVXeiOMS5vDxHUV8swJ1FTliBTN/vUZ5c
 fesvaGSORJ667nvwi9TPNIcRyPcv3pnxOeu4ZYtTdl911sAzWZ9XDjSYz3wzPytAi+7A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4f8w-00Czeo-Ss
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jan 2021 07:21:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A0C120756
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jan 2021 07:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611732089;
 bh=PHGvgPZS9fmzb8WwHWTDSJ0PUf4j0hQIB49cA17Ux8M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aOcLULEJAETe0ZlQOMFoWv+xV+961UgFHoRNBzUMPi/oFzrgBLf6fpFTjN/IS05QO
 zYzdqWHKfbJrw60OF8NQxrmzPpTarFG5BYYhXfdM82s2hq4GFbvrBTg0+/gc9t50It
 YL3Oe/Z9JLGMVM5I+aLWcGsKrktoXC5hMjaVZsxS33HhjLk4OG2Duzg5eJzML2qsTX
 SvIigcKxB7d/BjQsPegVpK8LEUO0LIj3aQP1HkoGMEQsssBIbzs2Nv5jASFVBV6Rrv
 RhIZkevlJdJVxgQR3wvBJsdnYdlgcaGm25mcIExHcY0pbsKd4dATwjIkTayV/aOI2P
 9V2GznHJHrLLQ==
Received: by mail-lf1-f46.google.com with SMTP id f1so1266645lfu.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Jan 2021 23:21:28 -0800 (PST)
X-Gm-Message-State: AOAM531Cqj51FHMFOwE3nxNP/zOT3ZzVNajrT13VyDB8Pd7KkxUcuYR2
 gMvHyxYoQIkqZKvp5MQvtonI9TeuQCBTQoecgcs=
X-Google-Smtp-Source: ABdhPJxzU6eEXjGgMsXjIbLicQlntxxKhHAHPBju5x4svSgsvP73GNvKL+gYo0RpjmVTLgHo2j69VOR6hw/D9eon+xA=
X-Received: by 2002:a05:6512:b1b:: with SMTP id
 w27mr4516614lfu.10.1611732087108; 
 Tue, 26 Jan 2021 23:21:27 -0800 (PST)
MIME-Version: 1.0
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-12-hch@lst.de>
In-Reply-To: <20210126145247.1964410-12-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 23:21:16 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4SRXoOjfU5GHoOGfONjb1yMT7HEyHLZb4E4vNARF44jw@mail.gmail.com>
Message-ID: <CAPhsuW4SRXoOjfU5GHoOGfONjb1yMT7HEyHLZb4E4vNARF44jw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l4f8w-00Czeo-Ss
Subject: Re: [f2fs-dev] [PATCH 11/17] md: remove bio_alloc_mddev
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

On Tue, Jan 26, 2021 at 7:12 AM Christoph Hellwig <hch@lst.de> wrote:
>
> bio_alloc_mddev is never called with a NULL mddev, and ->bio_set is
> initialized in md_run, so it always must be initialized as well.  Just
> open code the remaining call to bio_alloc_bioset.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/md.c     | 12 +-----------
>  drivers/md/md.h     |  2 --
>  drivers/md/raid1.c  |  2 +-
>  drivers/md/raid10.c |  2 +-
>  4 files changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 7d1bb24add3107..e2b9dbb6e888f6 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -340,16 +340,6 @@ static int start_readonly;
>   */
>  static bool create_on_open = true;
>
> -struct bio *bio_alloc_mddev(gfp_t gfp_mask, int nr_iovecs,
> -                           struct mddev *mddev)
> -{
> -       if (!mddev || !bioset_initialized(&mddev->bio_set))
> -               return bio_alloc(gfp_mask, nr_iovecs);
> -
> -       return bio_alloc_bioset(gfp_mask, nr_iovecs, &mddev->bio_set);
> -}
> -EXPORT_SYMBOL_GPL(bio_alloc_mddev);
> -
>  static struct bio *md_bio_alloc_sync(struct mddev *mddev)
>  {
>         if (!mddev || !bioset_initialized(&mddev->sync_set))
> @@ -613,7 +603,7 @@ static void submit_flushes(struct work_struct *ws)
>                         atomic_inc(&rdev->nr_pending);
>                         atomic_inc(&rdev->nr_pending);
>                         rcu_read_unlock();
> -                       bi = bio_alloc_mddev(GFP_NOIO, 0, mddev);
> +                       bi = bio_alloc_bioset(GFP_NOIO, 0, &mddev->bio_set);
>                         bi->bi_end_io = md_end_flush;
>                         bi->bi_private = rdev;
>                         bio_set_dev(bi, rdev->bdev);
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index f13290ccc1c248..bcbba1b5ec4a71 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -742,8 +742,6 @@ extern void md_rdev_clear(struct md_rdev *rdev);
>  extern void md_handle_request(struct mddev *mddev, struct bio *bio);
>  extern void mddev_suspend(struct mddev *mddev);
>  extern void mddev_resume(struct mddev *mddev);
> -extern struct bio *bio_alloc_mddev(gfp_t gfp_mask, int nr_iovecs,
> -                                  struct mddev *mddev);
>
>  extern void md_reload_sb(struct mddev *mddev, int raid_disk);
>  extern void md_update_sb(struct mddev *mddev, int force);
> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
> index 3b19141cdb4bc2..d2378765dc154f 100644
> --- a/drivers/md/raid1.c
> +++ b/drivers/md/raid1.c
> @@ -1104,7 +1104,7 @@ static void alloc_behind_master_bio(struct r1bio *r1_bio,
>         int i = 0;
>         struct bio *behind_bio = NULL;
>
> -       behind_bio = bio_alloc_mddev(GFP_NOIO, vcnt, r1_bio->mddev);
> +       behind_bio = bio_alloc_bioset(GFP_NOIO, vcnt, &r1_bio->mddev->bio_set);
>         if (!behind_bio)
>                 return;
>
> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
> index be8f14afb6d143..e1eefbec15d444 100644
> --- a/drivers/md/raid10.c
> +++ b/drivers/md/raid10.c
> @@ -4531,7 +4531,7 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
>                 return sectors_done;
>         }
>
> -       read_bio = bio_alloc_mddev(GFP_KERNEL, RESYNC_PAGES, mddev);
> +       read_bio = bio_alloc_bioset(GFP_KERNEL, RESYNC_PAGES, &mddev->bio_set);
>
>         bio_set_dev(read_bio, rdev->bdev);
>         read_bio->bi_iter.bi_sector = (r10_bio->devs[r10_bio->read_slot].addr
> --
> 2.29.2
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

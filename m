Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B35230546F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Jan 2021 08:23:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4fAl-0002JF-4Y; Wed, 27 Jan 2021 07:23:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <song@kernel.org>) id 1l4fAj-0002J9-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jan 2021 07:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vPU5Uuhi/mnJZA648+ZkaCWfuH8BWmnza0VsYmSMGLQ=; b=YktdJwUKPY97sUKANC2VSeGqcA
 +N4EK6NffT3YiBpS+PgV1WJZjPRnApZ7t5Jyb6jcCPHNrxTRXnVs72SnQmfLDKIRg4UUqYFtV2+sd
 U5mFvb43bfDnUCf+49uHjlXZ0V+WO746/ABtCkJZW57OO1GIOi/Ryu2UJd4hXGqeImG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vPU5Uuhi/mnJZA648+ZkaCWfuH8BWmnza0VsYmSMGLQ=; b=UOKP+ObJYCFwElqRJnpxNu/EhA
 bms0sqG/UM6fLiLms+DQCDDMrHlCCdzI9qFjsCFXnaNwQTGU5is9FaE5JYMr06b0gif++mJLP+Sxi
 gmuFpEKsq8AEN5eVXJ6oYK9L/Bb/ww6mhp8gDETXNEr1chw3XOXMYW6bnlGMt0W+I51I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4fAW-00Czhf-Ak
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jan 2021 07:23:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BB4A2075E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jan 2021 07:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611732179;
 bh=wys3sZM3KFLi7kSDIT+8OH9R8Mzfn9WfVwnN3287ktM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Bec44/no8t56Z502LgnlM+Qg3a7iRfwb8LyhJ+o5g82IaOznb97Gk8xlDwtFm7y0Q
 4B+/tC5K9lGgUBiHyhE00pi36rFGRQbfNmoExpX38MvaaIEiIlo5Xpl02zb3d2+c9I
 6QT/NDPMg5Mj36lJBF9f+RFUcTIY2MmljvRbc0DiIULgDdoXmR4KXliM+gH3VlyPk6
 mHWoOAExmkNvS6m/z6G7b4ZdKBJLDixAbo/Wzlpm3cgdfJxA927Fy/aSbJhFzA/wq4
 2ciHhZnN+TzrdwTTB4DOYnCFwWnsw1IL4QMJJGrVzDQalyZsi3zFFnOCUMa/DMqtOX
 AkooKL+eqRW2g==
Received: by mail-lj1-f176.google.com with SMTP id c18so892333ljd.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Jan 2021 23:22:59 -0800 (PST)
X-Gm-Message-State: AOAM531CdP0mSjmMYE5y5k+eDY+Lb60VRzIhY9us9X7Jc+DxMLZPaSDQ
 aZIenEinHRPIkVU7m3cBHZT/wTFZ6yzj/UNulW0=
X-Google-Smtp-Source: ABdhPJwT4SgEWFQYI+aGplxcgngrqXZ09YVZXq+be6TcwdS2L0sd+F5PxgqsedykGzzK3GAh/e6zF7ilKInCLGcj5r0=
X-Received: by 2002:a2e:b8d3:: with SMTP id s19mr5116366ljp.97.1611732177533; 
 Tue, 26 Jan 2021 23:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-14-hch@lst.de>
In-Reply-To: <20210126145247.1964410-14-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 23:22:46 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4AViTNjq1mp6zvbEJ8zKdK7__BfXEsvATTBWraK2u1Jg@mail.gmail.com>
Message-ID: <CAPhsuW4AViTNjq1mp6zvbEJ8zKdK7__BfXEsvATTBWraK2u1Jg@mail.gmail.com>
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
X-Headers-End: 1l4fAW-00Czhf-Ak
Subject: Re: [f2fs-dev] [PATCH 13/17] md: remove md_bio_alloc_sync
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

On Tue, Jan 26, 2021 at 7:17 AM Christoph Hellwig <hch@lst.de> wrote:
>
> md_bio_alloc_sync is never called with a NULL mddev, and ->sync_set is
> initialized in md_run, so it always must be initialized as well.  Just
> open code the remaining call to bio_alloc_bioset.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/md.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 6a27f52007c871..399c81bddc1ae1 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -340,14 +340,6 @@ static int start_readonly;
>   */
>  static bool create_on_open = true;
>
> -static struct bio *md_bio_alloc_sync(struct mddev *mddev)
> -{
> -       if (!mddev || !bioset_initialized(&mddev->sync_set))
> -               return bio_alloc(GFP_NOIO, 1);
> -
> -       return bio_alloc_bioset(GFP_NOIO, 1, &mddev->sync_set);
> -}
> -
>  /*
>   * We have a system wide 'event count' that is incremented
>   * on any 'interesting' event, and readers of /proc/mdstat
> @@ -989,7 +981,7 @@ void md_super_write(struct mddev *mddev, struct md_rdev *rdev,
>         if (test_bit(Faulty, &rdev->flags))
>                 return;
>
> -       bio = md_bio_alloc_sync(mddev);
> +       bio = bio_alloc_bioset(GFP_NOIO, 1, &mddev->sync_set);
>
>         atomic_inc(&rdev->nr_pending);
>
> --
> 2.29.2
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

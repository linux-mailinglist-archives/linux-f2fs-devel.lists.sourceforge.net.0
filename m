Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDA84C8DBD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Mar 2022 15:31:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nP3Wi-0007fH-Up; Tue, 01 Mar 2022 14:30:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <miklos@szeredi.hu>) id 1nP3Wh-0007f7-PX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Mar 2022 14:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0rqEHtyUvKInY3eDADJFtpu+gdfZq4axYpoJEFqNG8M=; b=E+soizibqazKSEO1gIaO8NEu7K
 +ackrd/R4qmlUn0p9gsTQ4hNQT/8pGYtefJbUN37Aw/M/f4r5UlMoHQLWhXXe8FxtiShLCu6Fu05u
 Jaz3/D+n/W2OxsnpWnXv1PxzpJBUCS4RHqrHQjxP/0YbnDAJuN6kGItPQLrIDKcnVALA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0rqEHtyUvKInY3eDADJFtpu+gdfZq4axYpoJEFqNG8M=; b=cU9uzMirLYj4ut6rHT0rovR5Qs
 oYS/2FjF67MwFMaypat2cpgmEMsD3XrhANN0gUl4ikoAWQ6/Ym0sizCmrd+kMapbm533KQh6nczXX
 wXSbXtWDSFLR8GJOUsoMthW9DvgGmGzSbTB7dnVCv6ELhnen1hqWSCbdh+xiOg8CRj7s=;
Received: from mail-il1-f179.google.com ([209.85.166.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nP3We-001MXo-Jt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Mar 2022 14:30:54 +0000
Received: by mail-il1-f179.google.com with SMTP id x14so7537913ill.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Mar 2022 06:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rqEHtyUvKInY3eDADJFtpu+gdfZq4axYpoJEFqNG8M=;
 b=I2qodJt4VEaNZJyZteahkXLrk3gcBP6spDM9mba7O5eU1RB0noMF3SaBN+E8vfdw3Y
 GW1Qja0562jHy97CnNHFiAvEnhDIzFZuk2nVuHxePbR8HX9rviCDiIna9neO0UiGoLDn
 jsXu+RAKBdy7qxqlxo03hClTY9xe+rR+zNfDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rqEHtyUvKInY3eDADJFtpu+gdfZq4axYpoJEFqNG8M=;
 b=bhDu+PvemzpZ0zQkeuznhZS/S9KBVnbI/vT6StpKToaosFQYWRnHK0TPLFsvLubLqd
 ww+Rx2pEfRF1josU1IANkI0dQDD3GG1I0xv17iQqjNAhw/gT8XalkPlJXprK3kdJ8ZXn
 qEauai0IVsBLUU7cbFh7QbdaKT5l95wrnvX/BQseixR7OW7pxyOnNTeahQAVsbs3EOlT
 /z6ajT7D5E7Yt4qnU6naLrauDmg8+DG5YxrrIGH1TJ4hmatkdq8ZeQDOMhXzRtbyRY8S
 HXHDspYY8E70ycJHQt0FyzZ240TWuPlLJ3YA7SG6FR/orFyaXQS03SIbRN10+3gw08UZ
 zGWA==
X-Gm-Message-State: AOAM533pp9WfZ0z9WvOsRcYrMoWLRJiZ9tTchVWT5V0dmE8q2hpMQv8p
 8OuaObt/3WyXvm7DA4G0wcsYguWSKdDabTzXZGjbsQ8GXKw=
X-Google-Smtp-Source: ABdhPJwFD3IYwN4qrYy++4yIV02k4VVunIMIlONHamgVoi7ny6ji/ttTCSgiD81N18MIcwz3ac7fQNZ2oqyazBRiwXg=
X-Received: by 2002:a92:ca4a:0:b0:2ba:878e:fd12 with SMTP id
 q10-20020a92ca4a000000b002ba878efd12mr22464625ilo.139.1646141263901; Tue, 01
 Mar 2022 05:27:43 -0800 (PST)
MIME-Version: 1.0
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>
 <164549983737.9187.2627117501000365074.stgit@noble.brown>
In-Reply-To: <164549983737.9187.2627117501000365074.stgit@noble.brown>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 1 Mar 2022 14:27:33 +0100
Message-ID: <CAJfpegsGOFD46KM8pxFAemokv9OOsCSHk=ag6jZZ=VscijMXZQ@mail.gmail.com>
To: NeilBrown <neilb@suse.de>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 22 Feb 2022 at 04:18,
 NeilBrown <neilb@suse.de> wrote:
 > > The bdi congestion tracking in not widely used and will be removed. >
 > Fuse is one of a small number of filesystems that uses it, se [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.179 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.179 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1nP3We-001MXo-Jt
Subject: Re: [f2fs-dev] [PATCH 04/11] fuse: remove reliance on bdi congestion
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
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Ilya Dryomov <idryomov@gmail.com>, Ext4 <linux-ext4@vger.kernel.org>,
 linux-nilfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Linux NFS list <linux-nfs@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Wu Fengguang <fengguang.wu@intel.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 22 Feb 2022 at 04:18, NeilBrown <neilb@suse.de> wrote:
>
> The bdi congestion tracking in not widely used and will be removed.
>
> Fuse is one of a small number of filesystems that uses it, setting both
> the sync (read) and async (write) congestion flags at what it determines
> are appropriate times.
>
> The only remaining effect of the sync flag is to cause read-ahead to be
> skipped.
> The only remaining effect of the async flag is to cause (some)
> WB_SYNC_NONE writes to be skipped.
>
> So instead of setting the flags, change:
>  - .readahead to stop when it has submitted all non-async pages
>     for read.
>  - .writepages to do nothing if WB_SYNC_NONE and the flag would be set
>  - .writepage to return AOP_WRITEPAGE_ACTIVATE if WB_SYNC_NONE
>     and the flag would be set.
>
> The writepages change causes a behavioural change in that pageout() can
> now return PAGE_ACTIVATE instead of PAGE_KEEP, so SetPageActive() will
> be called on the page which (I think) will further delay the next attempt
> at writeout.  This might be a good thing.
>
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  fs/fuse/control.c |   17 -----------------
>  fs/fuse/dev.c     |    8 --------
>  fs/fuse/file.c    |   17 +++++++++++++++++
>  3 files changed, 17 insertions(+), 25 deletions(-)
>
> diff --git a/fs/fuse/control.c b/fs/fuse/control.c
> index 000d2e5627e9..7cede9a3bc96 100644
> --- a/fs/fuse/control.c
> +++ b/fs/fuse/control.c
> @@ -164,7 +164,6 @@ static ssize_t fuse_conn_congestion_threshold_write(struct file *file,
>  {
>         unsigned val;
>         struct fuse_conn *fc;
> -       struct fuse_mount *fm;
>         ssize_t ret;
>
>         ret = fuse_conn_limit_write(file, buf, count, ppos, &val,
> @@ -178,22 +177,6 @@ static ssize_t fuse_conn_congestion_threshold_write(struct file *file,
>         down_read(&fc->killsb);
>         spin_lock(&fc->bg_lock);
>         fc->congestion_threshold = val;
> -
> -       /*
> -        * Get any fuse_mount belonging to this fuse_conn; s_bdi is
> -        * shared between all of them
> -        */
> -
> -       if (!list_empty(&fc->mounts)) {
> -               fm = list_first_entry(&fc->mounts, struct fuse_mount, fc_entry);
> -               if (fc->num_background < fc->congestion_threshold) {
> -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> -               } else {
> -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> -               }
> -       }
>         spin_unlock(&fc->bg_lock);
>         up_read(&fc->killsb);
>         fuse_conn_put(fc);
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index cd54a529460d..e1b4a846c90d 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -315,10 +315,6 @@ void fuse_request_end(struct fuse_req *req)
>                                 wake_up(&fc->blocked_waitq);
>                 }
>
> -               if (fc->num_background == fc->congestion_threshold && fm->sb) {
> -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> -               }
>                 fc->num_background--;
>                 fc->active_background--;
>                 flush_bg_queue(fc);
> @@ -540,10 +536,6 @@ static bool fuse_request_queue_background(struct fuse_req *req)
>                 fc->num_background++;
>                 if (fc->num_background == fc->max_background)
>                         fc->blocked = 1;
> -               if (fc->num_background == fc->congestion_threshold && fm->sb) {
> -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> -               }
>                 list_add_tail(&req->list, &fc->bg_queue);
>                 flush_bg_queue(fc);
>                 queued = true;
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 829094451774..94747bac3489 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -966,6 +966,14 @@ static void fuse_readahead(struct readahead_control *rac)
>                 struct fuse_io_args *ia;
>                 struct fuse_args_pages *ap;
>
> +               if (fc->num_background >= fc->congestion_threshold &&
> +                   rac->ra->async_size >= readahead_count(rac))
> +                       /*
> +                        * Congested and only async pages left, so skip the
> +                        * rest.
> +                        */
> +                       break;

Ah, you are taking care of it here...

Regarding the async part: a potential (corner?) case is if task A is
reading region X and triggering readahead for region Y and at the same
time task B is reading region Y.  In the congestion case it can happen
that non-uptodate pages in Y are truncated off the pagecache while B
is waiting for them to become uptodate.

This shouldn't be too hard to trigger, just need two sequential
readers of the same file, where one is just ahead of the other.  I'll
try to do a test program for this case specifically.

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

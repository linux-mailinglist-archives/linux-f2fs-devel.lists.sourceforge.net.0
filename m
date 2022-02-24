Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A7C4C3457
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Feb 2022 19:10:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nNIZl-0001zh-Gm; Thu, 24 Feb 2022 18:10:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1nNIZk-0001za-A4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Feb 2022 18:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5eZDgcxBiEahgQGqIVo4NOwq5Qo0wc2zSQHHLGRnIQM=; b=Ci3nmOHOezqxCuAIZg7UCqf67I
 TWHr17cvmktyUDwlWQfPVl/jQOcOx4a6Yt0NVUBT4yXbqs3/Rf+hm48PEct10tqcJtucmAqlw9RXO
 UCL27GfljiZufX6y4GM/fKEMfelckaF0a6rT3WSoQeXSNb0zQ29gEh1rL8YdfE8Td+0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5eZDgcxBiEahgQGqIVo4NOwq5Qo0wc2zSQHHLGRnIQM=; b=Fwg7GrAhKTwDfJAdYZkHYAsrod
 a2SuoPx0THWRH6oTNqSGKC4KLHkjCPOMvt224fewJrRbgHxhsrWgOhW7XkHFiFX2RDLnxrjrHSbku
 Zw0nDhXWCBpqjL2SGIvmDDqvqnbbB7AgzEsksEqia7A/kRuSX0l/oDSxq/vtDP4Z0ZNA=;
Received: from mail-yw1-f173.google.com ([209.85.128.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nNIZf-00DtQw-Ab
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Feb 2022 18:10:46 +0000
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2d646fffcc2so7121397b3.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Feb 2022 10:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5eZDgcxBiEahgQGqIVo4NOwq5Qo0wc2zSQHHLGRnIQM=;
 b=hOAnqSTI/Gh9yfCHqk+7dOsYcudQiruj8mpt7dmfjM5mWHLmv0u3d04DW8ALfBIXMG
 jo1aQNu8b37er4WOYMPhB0UKNBWuYIbVmK1S5rZBnKtE3j6emTQsT3qFtpIheorsTivo
 5oFwymdPrzK0TL7yVgoFRt/N/qYgq59XcFETBcR/mN/BchTGsA3oSWbl70lTpcsstt5O
 nRtu1Pud8PUcNNfPv5BadE0iVwqkk4S+ioB/E0TkrKnbVoRVJH4C91+Hcq3PdR/ymM2E
 gaQI4Q/rQrPyeTqMR7KeZVadtXbPVvCVGUzET6Lt8AJ66Q92342VKnjcz1C6+ONF0BvN
 RdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5eZDgcxBiEahgQGqIVo4NOwq5Qo0wc2zSQHHLGRnIQM=;
 b=y8T/0MVyOLQcsXtMXTX852Z//W9ed5jjnzGNBwm59PwtbtIqrMmQV3sxESwRhLQVPW
 peUDmvClAJ9Lh3qkhtxNQ0qhVv2Dwto+zW58xfTsgSi5xMSm6snLwdFlEfoWgIfCEXFh
 n9/ijnnwoQzKe1lb4SBNg7qtLcsEm9D2AQnCpv/Nwtfy+haGsSiupHbzrH3b+z4QhvfO
 I8kQzcE0g0x/JDft3/7jOlK8i0WJpDQ37aV77HJFHADNCTd20wNX8TcOCE7vkw/axYMm
 rE+59YBSIIb34zm5GHdL/keCeVccm2Yj6F8RdzWCm/icETbrMf5WREtaYjMNfpHlA1YR
 r5kQ==
X-Gm-Message-State: AOAM531OgUoiHFKqGO/cPY9X4qI6EC/SW9RrS7dkq9izQDbuKnMa85aV
 mDBhwIQYttfDtypwFCoPwEnCzEzkApulGNBk3vc=
X-Google-Smtp-Source: ABdhPJzAIqYPKdGLE2EeqFKSCMroLeeiWgQwRfA5B8K+sGjJ+1Pn3nTjD/EQPHmJEn7zy85dqMfSQ0Bfo7hIsT3Znj8=
X-Received: by 2002:a81:83d7:0:b0:2d6:b550:21b8 with SMTP id
 t206-20020a8183d7000000b002d6b55021b8mr3756069ywf.188.1645726237054; Thu, 24
 Feb 2022 10:10:37 -0800 (PST)
MIME-Version: 1.0
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
 <164447147262.23354.13106570458589592051.stgit@noble.brown>
In-Reply-To: <164447147262.23354.13106570458589592051.stgit@noble.brown>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 25 Feb 2022 03:10:24 +0900
Message-ID: <CAKFNMokgJMxfvdwc4isNj_gQHAecJF2tq3j8HRhhxW_xN5L5_Q@mail.gmail.com>
To: NeilBrown <neilb@suse.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 10, 2022 at 2:41 PM NeilBrown wrote: > > These
 functions are no longer useful as no BDIs report congestions any > more.
 > > Removing the test on bdi_write_contested() in current_may_thro [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.173 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [konishi.ryusuke[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.173 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nNIZf-00DtQw-Ab
Subject: Re: [f2fs-dev] [PATCH 08/11] Remove bdi_congested() and
 wb_congested() and related functions
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
 "Darrick J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nilfs <linux-nilfs@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Wu Fengguang <fengguang.wu@intel.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 10, 2022 at 2:41 PM NeilBrown <neilb@suse.de> wrote:
>
> These functions are no longer useful as no BDIs report congestions any
> more.
>
> Removing the test on bdi_write_contested() in current_may_throttle()
> could cause a small change in behaviour, but only when PF_LOCAL_THROTTLE
> is set.
>
> So replace the calls by 'false' and simplify the code - and remove the
> functions.
>
> Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com> (for nilfs bits)
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  drivers/block/drbd/drbd_int.h |    3 ---
>  drivers/block/drbd/drbd_req.c |    3 +--
>  fs/ext2/ialloc.c              |    5 -----
>  fs/nilfs2/segbuf.c            |   15 ---------------
>  fs/xfs/xfs_buf.c              |    3 ---
>  include/linux/backing-dev.h   |   26 --------------------------
>  mm/vmscan.c                   |    4 +---
>  7 files changed, 2 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
> index f27d5b0f9a0b..f804b1bfb3e6 100644
> --- a/drivers/block/drbd/drbd_int.h
> +++ b/drivers/block/drbd/drbd_int.h
> @@ -638,9 +638,6 @@ enum {
>         STATE_SENT,             /* Do not change state/UUIDs while this is set */
>         CALLBACK_PENDING,       /* Whether we have a call_usermodehelper(, UMH_WAIT_PROC)
>                                  * pending, from drbd worker context.
> -                                * If set, bdi_write_congested() returns true,
> -                                * so shrink_page_list() would not recurse into,
> -                                * and potentially deadlock on, this drbd worker.
>                                  */
>         DISCONNECT_SENT,
>
> diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
> index 3235532ae077..2e5fb7e442e3 100644
> --- a/drivers/block/drbd/drbd_req.c
> +++ b/drivers/block/drbd/drbd_req.c
> @@ -909,8 +909,7 @@ static bool remote_due_to_read_balancing(struct drbd_device *device, sector_t se
>
>         switch (rbm) {
>         case RB_CONGESTED_REMOTE:
> -               return bdi_read_congested(
> -                       device->ldev->backing_bdev->bd_disk->bdi);
> +               return 0;
>         case RB_LEAST_PENDING:
>                 return atomic_read(&device->local_cnt) >
>                         atomic_read(&device->ap_pending_cnt) + atomic_read(&device->rs_pending_cnt);
> diff --git a/fs/ext2/ialloc.c b/fs/ext2/ialloc.c
> index df14e750e9fe..998dd2ac8008 100644
> --- a/fs/ext2/ialloc.c
> +++ b/fs/ext2/ialloc.c
> @@ -170,11 +170,6 @@ static void ext2_preread_inode(struct inode *inode)
>         unsigned long offset;
>         unsigned long block;
>         struct ext2_group_desc * gdp;
> -       struct backing_dev_info *bdi;
> -
> -       bdi = inode_to_bdi(inode);
> -       if (bdi_rw_congested(bdi))
> -               return;
>
>         block_group = (inode->i_ino - 1) / EXT2_INODES_PER_GROUP(inode->i_sb);
>         gdp = ext2_get_group_desc(inode->i_sb, block_group, NULL);
> diff --git a/fs/nilfs2/segbuf.c b/fs/nilfs2/segbuf.c
> index 43287b0d3e9b..c4510f79037f 100644
> --- a/fs/nilfs2/segbuf.c
> +++ b/fs/nilfs2/segbuf.c
> @@ -343,17 +343,6 @@ static int nilfs_segbuf_submit_bio(struct nilfs_segment_buffer *segbuf,
>         struct bio *bio = wi->bio;
>         int err;
>
> -       if (segbuf->sb_nbio > 0 &&
> -           bdi_write_congested(segbuf->sb_super->s_bdi)) {
> -               wait_for_completion(&segbuf->sb_bio_event);
> -               segbuf->sb_nbio--;
> -               if (unlikely(atomic_read(&segbuf->sb_err))) {
> -                       bio_put(bio);
> -                       err = -EIO;
> -                       goto failed;
> -               }
> -       }
> -
>         bio->bi_end_io = nilfs_end_bio_write;
>         bio->bi_private = segbuf;
>         bio_set_op_attrs(bio, mode, mode_flags);
> @@ -365,10 +354,6 @@ static int nilfs_segbuf_submit_bio(struct nilfs_segment_buffer *segbuf,
>         wi->nr_vecs = min(wi->max_pages, wi->rest_blocks);
>         wi->start = wi->end;
>         return 0;
> -
> - failed:
> -       wi->bio = NULL;
> -       return err;
>  }

In this revised version, "int err" is no longer used, so could you
delete it as well ?

Regards,
Ryusuke Konishi

>
>  /**
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index b45e0d50a405..b7ebcfe6b8d3 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -843,9 +843,6 @@ xfs_buf_readahead_map(
>  {
>         struct xfs_buf          *bp;
>
> -       if (bdi_read_congested(target->bt_bdev->bd_disk->bdi))
> -               return;
> -
>         xfs_buf_read_map(target, map, nmaps,
>                      XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
>                      __this_address);
> diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
> index 860b675c2929..2d764566280c 100644
> --- a/include/linux/backing-dev.h
> +++ b/include/linux/backing-dev.h
> @@ -135,11 +135,6 @@ static inline bool writeback_in_progress(struct bdi_writeback *wb)
>
>  struct backing_dev_info *inode_to_bdi(struct inode *inode);
>
> -static inline int wb_congested(struct bdi_writeback *wb, int cong_bits)
> -{
> -       return wb->congested & cong_bits;
> -}
> -
>  long congestion_wait(int sync, long timeout);
>
>  static inline bool mapping_can_writeback(struct address_space *mapping)
> @@ -391,27 +386,6 @@ static inline void wb_blkcg_offline(struct blkcg *blkcg)
>
>  #endif /* CONFIG_CGROUP_WRITEBACK */
>
> -static inline int bdi_congested(struct backing_dev_info *bdi, int cong_bits)
> -{
> -       return wb_congested(&bdi->wb, cong_bits);
> -}
> -
> -static inline int bdi_read_congested(struct backing_dev_info *bdi)
> -{
> -       return bdi_congested(bdi, 1 << WB_sync_congested);
> -}
> -
> -static inline int bdi_write_congested(struct backing_dev_info *bdi)
> -{
> -       return bdi_congested(bdi, 1 << WB_async_congested);
> -}
> -
> -static inline int bdi_rw_congested(struct backing_dev_info *bdi)
> -{
> -       return bdi_congested(bdi, (1 << WB_sync_congested) |
> -                                 (1 << WB_async_congested));
> -}
> -
>  const char *bdi_dev_name(struct backing_dev_info *bdi);
>
>  #endif /* _LINUX_BACKING_DEV_H */
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index ce8492939bd3..0b930556c4f2 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -2362,9 +2362,7 @@ static unsigned int move_pages_to_lru(struct lruvec *lruvec,
>   */
>  static int current_may_throttle(void)
>  {
> -       return !(current->flags & PF_LOCAL_THROTTLE) ||
> -               current->backing_dev_info == NULL ||
> -               bdi_write_congested(current->backing_dev_info);
> +       return !(current->flags & PF_LOCAL_THROTTLE);
>  }
>
>  /*
>
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B059A995
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 01:45:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPBgU-0003Tq-Eh;
	Fri, 19 Aug 2022 23:45:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oPBgT-0003Tk-OQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ne8NPr/5Q1KJtVWHdqeS3uv7K6aawcxyBWkq9p0gIXA=; b=ban6joRGZbacVNeO10yp4E19TV
 mtKQtU8cCdLg14PvQBfAiYUZWjJY0KS1MscPhomZOvpwjVk3CLodQJJuxX7uHwPSpwQ4UacrMynfd
 ayCBS3UVCC8NN2cAefI/cqEbMn/D3DPUeZQ0SeSuy2n5Rm/eFvZCHfrm6YL3ar09qF/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ne8NPr/5Q1KJtVWHdqeS3uv7K6aawcxyBWkq9p0gIXA=; b=CGcLx2vr2u/1VDJz+NRVkV4bir
 rVcRmZWEETnkEnirsSs7I96vtGRobWqIsvh1ZvthnZvQ9fbR6RRUEzjcDMO4Boo4Opp9ox8Wz0sTH
 f21LbHSopjG/ad1ZDaEYCnI7fXxTPlZ6oasoTNOe6tWN+zcYYQTI5ejtZ4SFPBAUQHTw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPBgS-009wUD-UP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:45:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8427561811;
 Fri, 19 Aug 2022 23:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CDAC433C1;
 Fri, 19 Aug 2022 23:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660952742;
 bh=ReA/aTtN7AhOmS8Zel0bQVh+VA7K0t+KoHtpyI8D2DE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kBOwcsTkR4NRBffjcXt9f07NtZcNPAIgz52hEZwdRkgz9croAauxJAiiWzP4YdL2B
 yuJ1jobQe28Iht0LfEL1fb6VfKNGzouMN8WbLdlfrHgR/zOurFGylqCxT+82SCwHhA
 kHFRAhSM0RnNMjE+ENLtZ86Ra1yGOYfr+4H+l89S4AqFwiA0iuNsvbfCAyoHCwUb2N
 dH2LAP1wrQpuhLjToc9Xnm/jjJKDd5J3dWNAcqVqbYCXQ3KhebCTiNkJOG1be2dNnc
 InxtUMcnb40tJSKAA3AbM12NdBPF+XXFsT0B55wgDpJ+a/+suW/WJTF2vUymY7OezJ
 LXogtmetMhedA==
Date: Fri, 19 Aug 2022 16:45:41 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: guo weichao <guoweichao@msn.com>
Message-ID: <YwAgpQ+djc3yYURu@google.com>
References: <1660276608-751-1-git-send-email-guoweichao@oppo.com>
 <YvaQFmrvi5/8YcXm@google.com>
 <DM5PR17MB095307935ABD5D5A6EEDD050C6699@DM5PR17MB0953.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM5PR17MB095307935ABD5D5A6EEDD050C6699@DM5PR17MB0953.namprd17.prod.outlook.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/14, guo weichao wrote: > Hi Jaegeuk, > > IMO,
 defragment
 is important for many user scenarios. If it's still fragment after defrag,
 users may trigger more defrag ioctls, which hurts performance [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPBgS-009wUD-UP
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate consective blkaddrs for
 defragment
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
Cc: "zhangshiming@oppo.com" <zhangshiming@oppo.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/14, guo weichao wrote:
> Hi Jaegeuk,
> 
> IMO, defragment is important for many user scenarios. If it's still fragment after defrag, users may trigger more defrag ioctls, which hurts performance & device lifetime. So how about add an idle check & retry one more time besides adding "wb_sync_req[DATA]" count, draft liked the following:
> 
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> +#define DEFRAG_RETRY_COUNT 2
> +#define DEFRAG_WAIT_SEC 10
> 
> @@ -2508,7 +2512,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>                                                 range->start + range->len - 1);
>         if (err)
>                 goto out;
> +frag_check:
>         /*
>          * lookup mapping info in extent cache, skip defragmenting if physical
>          * block addresses are continuous.
> @@ -2611,9 +2615,16 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
> 
>                 clear_inode_flag(inode, FI_SKIP_WRITES);
> 
> +               wait_secs = 0;
> +               while (!is_idle(sbi, REQ_TIME) && wait_secs++ < DEFRAG_WAIT_SEC)
> +                       msleep(1000);
> +               atomic_inc(&sbi->wb_sync_req[DATA]);
>                 err = filemap_fdatawrite(inode->i_mapping);
> +               atomic_dec(&sbi->wb_sync_req[DATA]);
>                 if (err)
>                         goto out;
> +               else if (retries++ < DEFRAG_RETRY_COUNT)
> +                       goto frag_check;

Doesn't it need to run some GCs to get a consecutive free sections?
What is the goal here? How can we quantify the fragmented level?

> ________________________________
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> To: Weichao Guo <guoweichao@oppo.com>
> CC: zhangshiming@oppo.com <zhangshiming@oppo.com>; linux-f2fs-devel@lists.sourceforge.net <linux-f2fs-devel@lists.sourceforge.net>
> Title: Re: [f2fs-dev] [PATCH] f2fs: allocate consective blkaddrs for defragment
> 
> Hi Weichao,
> 
> On 08/12, Weichao Guo wrote:
> > When we try to defrag a file, its data blocks may mess with others if there
> > are lots of concurrent writes. This causes the file is still fragmented
> > after defrag. So It's better to isolate defrag writes from others.
> 
> I really don't want to add more log like this. What about using
> wb_sync_req[DATA] to prevent async writes at least?
> 
> >
> > Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> > Signed-off-by: Chao Yu <chao@kernel.org>
> > ---
> >  fs/f2fs/debug.c   | 4 ++++
> >  fs/f2fs/f2fs.h    | 2 ++
> >  fs/f2fs/file.c    | 5 +++++
> >  fs/f2fs/segment.c | 7 +++++++
> >  fs/f2fs/segment.h | 5 ++++-
> >  5 files changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> > index c014715..d85dc17 100644
> > --- a/fs/f2fs/debug.c
> > +++ b/fs/f2fs/debug.c
> > @@ -442,6 +442,10 @@ static int stat_show(struct seq_file *s, void *v)
> >                           si->curseg[CURSEG_ALL_DATA_ATGC],
> >                           si->cursec[CURSEG_ALL_DATA_ATGC],
> >                           si->curzone[CURSEG_ALL_DATA_ATGC]);
> > +             seq_printf(s, "  - DEFRAG   data: %8d %8d %8d\n",
> > +                        si->curseg[CURSEG_COLD_DATA_DEFRAG],
> > +                        si->cursec[CURSEG_COLD_DATA_DEFRAG],
> > +                        si->curzone[CURSEG_COLD_DATA_DEFRAG]);
> >                seq_printf(s, "\n  - Valid: %d\n  - Dirty: %d\n",
> >                           si->main_area_segs - si->dirty_count -
> >                           si->prefree_count - si->free_segs,
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 3c7cdb7..5f9a185 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -760,6 +760,7 @@ enum {
> >        FI_COMPRESS_RELEASED,   /* compressed blocks were released */
> >        FI_ALIGNED_WRITE,       /* enable aligned write */
> >        FI_COW_FILE,            /* indicate COW file */
> > +     FI_DEFRAG_WRITE,        /* indicate defragment writes need consective blkaddrs*/
> >        FI_MAX,                 /* max flag, never be used */
> >  };
> >
> > @@ -1017,6 +1018,7 @@ enum {
> >        CURSEG_COLD_DATA_PINNED = NR_PERSISTENT_LOG,
> >                                /* pinned file that needs consecutive block address */
> >        CURSEG_ALL_DATA_ATGC,   /* SSR alloctor in hot/warm/cold data area */
> > +     CURSEG_COLD_DATA_DEFRAG,/* used for defragment which needs consective blkaddrs */
> >        NO_CHECK_TYPE,          /* number of persistent & inmem log */
> >  };
> >
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index ce4905a0..f104e2e 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -2626,7 +2626,12 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
> >
> >                clear_inode_flag(inode, FI_SKIP_WRITES);
> >
> > +             set_inode_flag(inode, FI_DEFRAG_WRITE);
> > +             f2fs_lock_op(sbi);
> > +             f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_DEFRAG, false);
> > +             f2fs_unlock_op(sbi);
> >                err = filemap_fdatawrite(inode->i_mapping);
> > +             clear_inode_flag(inode, FI_DEFRAG_WRITE);
> >                if (err)
> >                        goto out;
> >        }
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 0de21f8..17e7d14 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -2749,6 +2749,7 @@ static void __f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
> >  void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi)
> >  {
> >        __f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
> > +     __f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_DEFRAG);
> >
> >        if (sbi->am.atgc_enabled)
> >                __f2fs_save_inmem_curseg(sbi, CURSEG_ALL_DATA_ATGC);
> > @@ -2774,6 +2775,7 @@ static void __f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type)
> >  void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi)
> >  {
> >        __f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
> > +     __f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_DEFRAG);
> >
> >        if (sbi->am.atgc_enabled)
> >                __f2fs_restore_inmem_curseg(sbi, CURSEG_ALL_DATA_ATGC);
> > @@ -3161,6 +3163,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
> >                if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
> >                        return CURSEG_COLD_DATA_PINNED;
> >
> > +             if (is_inode_flag_set(inode, FI_DEFRAG_WRITE))
> > +                     return CURSEG_COLD_DATA_DEFRAG;
> > +
> >                if (page_private_gcing(fio->page)) {
> >                        if (fio->sbi->am.atgc_enabled &&
> >                                (fio->io_type == FS_DATA_IO) &&
> > @@ -4332,6 +4337,8 @@ static int build_curseg(struct f2fs_sb_info *sbi)
> >                        array[i].seg_type = CURSEG_COLD_DATA;
> >                else if (i == CURSEG_ALL_DATA_ATGC)
> >                        array[i].seg_type = CURSEG_COLD_DATA;
> > +             else if (i == CURSEG_COLD_DATA_DEFRAG)
> > +                     array[i].seg_type = CURSEG_COLD_DATA;
> >                array[i].segno = NULL_SEGNO;
> >                array[i].next_blkoff = 0;
> >                array[i].inited = false;
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index d1d6376..75e2aa8 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -44,7 +44,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
> >         ((seg) == CURSEG_I(sbi, CURSEG_WARM_NODE)->segno) ||    \
> >         ((seg) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno) ||    \
> >         ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno) ||     \
> > -      ((seg) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno))
> > +      ((seg) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno) ||        \
> > +      ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_DEFRAG)->segno))
> >
> >  #define IS_CURSEC(sbi, secno)                                                \
> >        (((secno) == CURSEG_I(sbi, CURSEG_HOT_DATA)->segno /            \
> > @@ -62,6 +63,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
> >         ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno /     \
> >          (sbi)->segs_per_sec) ||        \
> >         ((secno) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno /        \
> > +       (sbi)->segs_per_sec) ||        \
> > +      ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_DEFRAG)->segno /     \
> >          (sbi)->segs_per_sec))
> >
> >  #define MAIN_BLKADDR(sbi)                                            \
> > --
> > 2.7.4
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

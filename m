Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC66838CE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 22:38:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMyL8-00062w-RD;
	Tue, 31 Jan 2023 21:38:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1pMyL7-00062m-GW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 21:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g7KiHJKNQlVH6BWgkWRX1AnGHj/+veU515WC/Pfk8pI=; b=dZX3+CvtJU9zenRCkWsGz3rzwd
 QLCjDHC/S8cgPR4VDbqXMtghouXqTWzYSEAX1QUrCaJVGfowU3eogjb9qtl66cnEWdtd9/B/pbxeb
 YgwH55CpKIzjeVOKhsCwUB72aACg2qMGdt0pZMd/u7/CTAzMnr6iefOANgJDD2FdzPmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g7KiHJKNQlVH6BWgkWRX1AnGHj/+veU515WC/Pfk8pI=; b=bAHuR1M5Ecyucn6SCgnCjcs+G5
 Tnvjqs+4sLjJhv4Pmd+U1psju2M2ijNf45OdfLDL4cYePvoUXSW8MMWi+nJoUPcn/m/+Ca867dBmV
 02DshGks49iW1j7FEdHAciMBmdvs43b/w1htr1JBD7GFgPkKIfQDKy2g/q0WSqIvoDRg=;
Received: from mail-yb1-f174.google.com ([209.85.219.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pMyL1-0002TX-VI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 21:38:52 +0000
Received: by mail-yb1-f174.google.com with SMTP id t16so19926430ybk.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 Jan 2023 13:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g7KiHJKNQlVH6BWgkWRX1AnGHj/+veU515WC/Pfk8pI=;
 b=Ejjw6BCdSZ+VQKcHE/Qxn8b9uxskZbLz+sTyOaiDSaHdaekkfqlagIf6t2iU1XRFX+
 0vt/cTb22bd13CoN5Wy5nAf6FG3g7IqaT3bLOkcRYe775twNmP/wdYZK/OiXjBNl4I4U
 Xu/gFVAq9MJr9uIcCXH3ElDyAprHFLxRWaK1PxMiN764GgEwXiIfjbeGhaL1lLHKK01e
 O4KU9+Erjfve/Rf/VTHtxbZuFbea6fuaH9MuHjxbNC1BR8MBZ46YuAQA0ugyy9m2sNAR
 MF0Zhv/gDfJMQZnLbQDqkyLs1NPtzeubCw2MFwIn56aQtBZfnLOXKBKu/i+yqLYoxcXY
 Y/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g7KiHJKNQlVH6BWgkWRX1AnGHj/+veU515WC/Pfk8pI=;
 b=1LwSltnKG5RbxagxZJLgQCaTif887LySmf0+SeeNS4U76E4D0X291g/5r4iYiK4Zy6
 s8OrU6wGGqBdeWufhic2QJuip9C+4GdCTz7QD6WbADGdbUakZ97uXHutOhoIJGMTyoKB
 he+M+8UsE0g7sJ0wQPQvtYe+/3jYeuw0BlfpnGjho/uz+FDwhqeg/bC7Q1UaBmYKrg/0
 dfCF6U1DUTyPLZnd9/hIDNIBDyj24SJx70/IcN8SWsjqMQ6dLXPBB5Hb9udhhqOPGw8m
 03mMpXh773YV5H0RKA4kUTSNZo68DwUEEaukBit/qZP4ibcG0XIC91V2UxbToFI7hROE
 Y1SQ==
X-Gm-Message-State: AO0yUKUeRtJ2l3PwRH/lGoI9WZdI4NUBydJjCazRjHk41EeXyP9P+u75
 Ch0YEZR3ckZuhL5aGW9Mz+F6A+HBO98TvATC89g=
X-Google-Smtp-Source: AK7set+u7jsd92iLptvbks8IOwEyG8Zq7Aiy7BQB85G1uwjMG2NCpzgQQg1ZBNtIcnLgOuMtNIiQDPby4i+MNPEsztM=
X-Received: by 2002:a25:cf14:0:b0:7bf:8191:8ee8 with SMTP id
 f20-20020a25cf14000000b007bf81918ee8mr54393ybg.476.1675201122946; Tue, 31 Jan
 2023 13:38:42 -0800 (PST)
MIME-Version: 1.0
References: <20230113004933.2082072-1-daeho43@gmail.com>
 <ed5f65a7-13bb-581c-cfb5-df5ab30fbc4c@kernel.org>
 <CACOAw_zhVgS84gOXpfZuvptMgsZDhP3QX2EFm=5CoKibB+3V1A@mail.gmail.com>
 <8f1c15a3-d056-7709-af45-fe7cba56463f@kernel.org>
 <CACOAw_zSaZ5JKFtFSxRK3a5_260AYbeYCMzHL11pD8=mWM91Sw@mail.gmail.com>
In-Reply-To: <CACOAw_zSaZ5JKFtFSxRK3a5_260AYbeYCMzHL11pD8=mWM91Sw@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 31 Jan 2023 13:38:31 -0800
Message-ID: <CACOAw_xjNz2AKa+MMqpVKo4SOC_ptbXY1P3S4tY2g8JneTzkPQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 31, 2023 at 11:13 AM Daeho Jeong wrote: > > Hi
 Chao, > > On Tue, Jan 31, 2023 at 3:37 AM Chao Yu wrote: > > > > Hi Daeho,
 > > > > On 2023/1/31 0:34, Daeho Jeong wrote: > > > Hi Chao, > [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.174 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pMyL1-0002TX-VI
Subject: Re: [f2fs-dev] [PATCH] f2fs: synchronize atomic write aborts
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org,
 syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 31, 2023 at 11:13 AM Daeho Jeong <daeho43@gmail.com> wrote:
>
> Hi Chao,
>
> On Tue, Jan 31, 2023 at 3:37 AM Chao Yu <chao@kernel.org> wrote:
> >
> > Hi Daeho,
> >
> > On 2023/1/31 0:34, Daeho Jeong wrote:
> > > Hi Chao,
> > >
> > > I read your patch series now and I like it.
> >
> > Thank you for checking the patches. :)
> >
> > > However, how about a race condition between start_atomic_write and
> > > abort_atomic_write?
> >
> > Yup, I noticed that issue, I guess we can avoid this race condition by
> > covering these two flows w/ i_atomic_sem.
> >
> > > abort_atomic_write is called without inode_lock in closing filp scenarios.
> > > What do you think about this?
> >
> > I'm fine w/ your change as it's more clean, but it's better to drop cow_inode's
> > page cache if atomic_write is committed or aborted to avoid caching obsolete page?
>
> It's better to put that part in f2fs_abort_atomic_write().
> On top of that, maybe, we should move
> f2fs_do_truncate_blocks(fi->cow_inode, 0, true) part from
> f2fs_ioc_start_atomic_write() to f2fs_abort_atomic_write(), too.

Oh, we shouldn't touch the f2fs_do_truncate_blocks() part, since there
might be some left writeback after aborting atomic write.
Plz. review it related to the timing of calling truncate_inode_pages_final().

>
> Thanks,
>
> >
> > Thanks,
> >
> > >
> > > Thanks,
> > >
> > >
> > > On Fri, Jan 27, 2023 at 6:07 PM Chao Yu <chao@kernel.org> wrote:
> > >>
> > >> Hi Daeho, Jaegeuk,
> > >>
> > >> Please take a look at patchset in below link:
> > >>
> > >> https://lore.kernel.org/linux-f2fs-devel/20230109034453.490176-1-chao@kernel.org/T/#t
> > >>
> > >> In PATCH 4/5, I'm trying to fix the same issue w/ alternative way, let me
> > >> know your preference. :)
> > >>
> > >> One comment as below.
> > >>
> > >> On 2023/1/13 8:49, Daeho Jeong wrote:
> > >>> From: Daeho Jeong <daehojeong@google.com>
> > >>>
> > >>> To fix a race condition between atomic write aborts, I use the inode
> > >>> lock and make COW inode to be re-usable thoroughout the whole
> > >>> atomic file inode lifetime.
> > >>>
> > >>> Reported-by: syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
> > >>> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> > >>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > >>> ---
> > >>>    fs/f2fs/file.c    | 43 ++++++++++++++++++++++++++++---------------
> > >>>    fs/f2fs/inode.c   | 11 +++++++++--
> > >>>    fs/f2fs/segment.c |  3 ---
> > >>>    fs/f2fs/super.c   |  2 --
> > >>>    4 files changed, 37 insertions(+), 22 deletions(-)
> > >>>
> > >>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > >>> index ecbc8c135b49..ff072a9ed258 100644
> > >>> --- a/fs/f2fs/file.c
> > >>> +++ b/fs/f2fs/file.c
> > >>> @@ -1866,7 +1866,10 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
> > >>>                        atomic_read(&inode->i_writecount) != 1)
> > >>>                return 0;
> > >>>
> > >>> +     inode_lock(inode);
> > >>>        f2fs_abort_atomic_write(inode, true);
> > >>> +     inode_unlock(inode);
> > >>> +
> > >>>        return 0;
> > >>>    }
> > >>>
> > >>> @@ -1880,8 +1883,11 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
> > >>>         * until all the writers close its file. Since this should be done
> > >>>         * before dropping file lock, it needs to do in ->flush.
> > >>>         */
> > >>> -     if (F2FS_I(inode)->atomic_write_task == current)
> > >>> +     if (F2FS_I(inode)->atomic_write_task == current) {
> > >>> +             inode_lock(inode);
> > >>>                f2fs_abort_atomic_write(inode, true);
> > >>> +             inode_unlock(inode);
> > >>> +     }
> > >>>        return 0;
> > >>>    }
> > >>>
> > >>> @@ -2087,19 +2093,28 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
> > >>>                goto out;
> > >>>        }
> > >>>
> > >>> -     /* Create a COW inode for atomic write */
> > >>> -     pinode = f2fs_iget(inode->i_sb, fi->i_pino);
> > >>> -     if (IS_ERR(pinode)) {
> > >>> -             f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > >>> -             ret = PTR_ERR(pinode);
> > >>> -             goto out;
> > >>> -     }
> > >>> +     /* Check if the inode already has a COW inode */
> > >>> +     if (fi->cow_inode == NULL) {
> > >>> +             /* Create a COW inode for atomic write */
> > >>> +             pinode = f2fs_iget(inode->i_sb, fi->i_pino);
> > >>> +             if (IS_ERR(pinode)) {
> > >>> +                     f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > >>> +                     ret = PTR_ERR(pinode);
> > >>> +                     goto out;
> > >>> +             }
> > >>>
> > >>> -     ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
> > >>> -     iput(pinode);
> > >>> -     if (ret) {
> > >>> -             f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > >>> -             goto out;
> > >>> +             ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
> > >>> +             iput(pinode);
> > >>> +             if (ret) {
> > >>> +                     f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > >>> +                     goto out;
> > >>> +             }
> > >>> +
> > >>> +             set_inode_flag(fi->cow_inode, FI_COW_FILE);
> > >>> +             clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
> > >>> +     } else {
> > >>> +             /* Reuse the already created COW inode */
> > >>> +             f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
> > >>>        }
> > >>>
> > >>>        f2fs_write_inode(inode, NULL);
> > >>> @@ -2107,8 +2122,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
> > >>>        stat_inc_atomic_inode(inode);
> > >>>
> > >>>        set_inode_flag(inode, FI_ATOMIC_FILE);
> > >>> -     set_inode_flag(fi->cow_inode, FI_COW_FILE);
> > >>> -     clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
> > >>>
> > >>>        isize = i_size_read(inode);
> > >>>        fi->original_i_size = isize;
> > >>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > >>> index ff6cf66ed46b..4921f7209e28 100644
> > >>> --- a/fs/f2fs/inode.c
> > >>> +++ b/fs/f2fs/inode.c
> > >>> @@ -766,11 +766,18 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
> > >>>    void f2fs_evict_inode(struct inode *inode)
> > >>>    {
> > >>>        struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > >>> -     nid_t xnid = F2FS_I(inode)->i_xattr_nid;
> > >>> +     struct f2fs_inode_info *fi = F2FS_I(inode);
> > >>> +     nid_t xnid = fi->i_xattr_nid;
> > >>>        int err = 0;
> > >>>
> > >>>        f2fs_abort_atomic_write(inode, true);
> > >>>
> > >>> +     if (fi->cow_inode) {
> > >>> +             clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> > >>> +             iput(fi->cow_inode);
> > >>> +             fi->cow_inode = NULL;
> > >>> +     }
> > >>> +
> > >>>        trace_f2fs_evict_inode(inode);
> > >>>        truncate_inode_pages_final(&inode->i_data);
> > >>>
> > >>> @@ -857,7 +864,7 @@ void f2fs_evict_inode(struct inode *inode)
> > >>>        stat_dec_inline_inode(inode);
> > >>>        stat_dec_compr_inode(inode);
> > >>>        stat_sub_compr_blocks(inode,
> > >>> -                     atomic_read(&F2FS_I(inode)->i_compr_blocks));
> > >>> +                     atomic_read(&fi->i_compr_blocks));
> > >>>
> > >>>        if (likely(!f2fs_cp_error(sbi) &&
> > >>>                                !is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> > >>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > >>> index ae3c4e5474ef..536d7c674b04 100644
> > >>> --- a/fs/f2fs/segment.c
> > >>> +++ b/fs/f2fs/segment.c
> > >>> @@ -192,9 +192,6 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
> > >>>        if (!f2fs_is_atomic_file(inode))
> > >>>                return;
> > >>>
> > >>> -     clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> > >>> -     iput(fi->cow_inode);
> > >>> -     fi->cow_inode = NULL;
> > >>>        release_atomic_write_cnt(inode);
> > >>>        clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
> > >>>        clear_inode_flag(inode, FI_ATOMIC_REPLACE);
> > >>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > >>> index 1f812b9ce985..10463f084d30 100644
> > >>> --- a/fs/f2fs/super.c
> > >>> +++ b/fs/f2fs/super.c
> > >>> @@ -1430,8 +1430,6 @@ static int f2fs_drop_inode(struct inode *inode)
> > >>>                        atomic_inc(&inode->i_count);
> > >>>                        spin_unlock(&inode->i_lock);
> > >>>
> > >>> -                     f2fs_abort_atomic_write(inode, true);
> > >>
> > >> In order to avoid caching obsolete page of cow_inode, how about truncating
> > >> them here?
> > >>
> > >> if (f2fs_is_atomic_file() && cow_inode)
> > >>          truncate_inode_pages_final(&cow_inode->i_data);
> > >>
> > >> Thanks,
> > >>
> > >>> -
> > >>>                        /* should remain fi->extent_tree for writepage */
> > >>>                        f2fs_destroy_extent_node(inode);
> > >>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

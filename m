Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6244A69518A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 21:14:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRfDx-0007Ld-Uu;
	Mon, 13 Feb 2023 20:14:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1pRfDx-0007LX-DQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 20:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVBZe7FHVHxsSQIXf3WpSgVuZprABFUjQYlhoNVCR64=; b=CRen21IMZftk1mRqcPxaunnDjI
 h/xxGZ2enS6lbCL8d47zpVsq+flf//wEQ5uPir7KxZ4Z3W14Li7LnVC1X88T5GQRI3nIXChp+tg+Q
 1gWKDxqZmvWowZbla1WwF6+wGF2WoMQnh/jSXrWmKMahcUat2YU4qTOqV1M98eNW1P/k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DVBZe7FHVHxsSQIXf3WpSgVuZprABFUjQYlhoNVCR64=; b=SxoBAVhaEQmhkf2TTB3HeZYru4
 sDlsR//A2DArVUQu4Gs4PtuwT/8oDhcQ67ehJ1jFAuUCH8EeKOzrB/yh4gO+W5tcgd2pEBV5U/9Qi
 10kBgV8Ym9dm1LBxjfCa1QrXcLo0npMSevs1/fEEHkdcgvfV12zobZ9B+Zo7TdPapmJs=;
Received: from mail-yw1-f171.google.com ([209.85.128.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pRfDv-003QmM-Qw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 20:14:52 +0000
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-52ecd867d89so130665367b3.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Feb 2023 12:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DVBZe7FHVHxsSQIXf3WpSgVuZprABFUjQYlhoNVCR64=;
 b=DXYXMqkm9VM+ixvfhyWjwEU7GB98j2w3mIeX9aKCNqrfnONjizGGw2SdHddg8N5tl2
 E00LrwudUDCFtOPc0zaWWLwicR7UrqVht+HK+GRWItmnZjBW4llgaIGym59BdZTGXqOJ
 e9EnkR5F8L8fUGjaTiN9/IPXVLCuku46pLbcXOkWiidFwHUrCwal3eo+tahWe9fjmCOg
 xm27drN0CQYRtQcCskcmeSAmnDeXv7J9AZPOIyL7vWsz81xG5zyNBT1ldsXNADD0eZOv
 6Pk3rj9F69fAsWajh1bXsI4+yiDErEaOz0GgUsM6qZlA8UlZmr/uud9aWeF5a2TkpKjQ
 ztMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DVBZe7FHVHxsSQIXf3WpSgVuZprABFUjQYlhoNVCR64=;
 b=ze9SC4Y0A6Cn/cA55bmkL4q9beMI3NifXZ3UNu+M8DWuGF55JS9fRTx8i+8mMxkPB2
 7vC9MclyqtWuqYDudPsB2Kvnf1Utx92XLbGnlHW+8kkUfHiVVuJUQA0q9KSB6UdJE6V2
 hINxc30woWvyL/1yTA3Y8aMcXynyRIWgIKI+cemhxXYHMInDJ7VbC/XV80SGi70+1wmE
 3S/XfmcPGSzygyEB80svYD+pqDmAwWONhG45E0/qtiV3Co3+0yxD0kAmhvRV3EipN6aO
 tI19TpOnf1EecZAUY0zn148WNdYtSPP+VgLz/hb6QViD4U2Q8cVEaF+QfZaPgyyCvTc5
 Z0BA==
X-Gm-Message-State: AO0yUKVO0l0cZJr9G/xhEoyulNMi+UTGTGdhulfVG7M8h5+SLQpyENk/
 y/uCQQyeT/4PxnNlH5/byXZwxFrxcvrjzqj/EDA=
X-Google-Smtp-Source: AK7set+r5/WDZDUysolD6CVwopt5Ni7Zs7kVqgz/wqaChX0iJ5QDirFJk362e+g/2RSK1kXsahvaBzfaO+ig/BwhnzA=
X-Received: by 2002:a0d:d48e:0:b0:52f:b76:e21d with SMTP id
 w136-20020a0dd48e000000b0052f0b76e21dmr857600ywd.493.1676319286021; Mon, 13
 Feb 2023 12:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20230209181819.2333522-1-daeho43@gmail.com>
 <18916dd5-67cc-fe21-f78b-8a6dfbcb1c97@kernel.org>
In-Reply-To: <18916dd5-67cc-fe21-f78b-8a6dfbcb1c97@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 13 Feb 2023 12:14:34 -0800
Message-ID: <CACOAw_w5Mc3aqS_RD_W7MdLGFQV3O_Jq1WSAVKAxJkEk5uUgeQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 13,
 2023 at 1:47 AM Chao Yu wrote: > > On 2023/2/10
 2:18, Daeho Jeong wrote: > > From: Daeho Jeong > > > > To fix a race condition
 between atomic write aborts, I use the inode > > lock [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.171 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pRfDv-003QmM-Qw
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

On Mon, Feb 13, 2023 at 1:47 AM Chao Yu <chao@kernel.org> wrote:
>
> On 2023/2/10 2:18, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > To fix a race condition between atomic write aborts, I use the inode
> > lock and make COW inode to be re-usable thoroughout the whole
> > atomic file inode lifetime.
> >
> > Reported-by: syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
> > Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >   fs/f2fs/file.c    | 44 +++++++++++++++++++++++++++++---------------
> >   fs/f2fs/inode.c   | 11 +++++++++--
> >   fs/f2fs/segment.c |  3 ---
> >   fs/f2fs/super.c   |  2 --
> >   4 files changed, 38 insertions(+), 22 deletions(-)
> >
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 300eae8b5415..6436c52e7913 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1863,7 +1863,10 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
> >                       atomic_read(&inode->i_writecount) != 1)
> >               return 0;
> >
> > +     inode_lock(inode);
> >       f2fs_abort_atomic_write(inode, true);
> > +     inode_unlock(inode);
> > +
> >       return 0;
> >   }
> >
> > @@ -1878,8 +1881,12 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
> >        * before dropping file lock, it needs to do in ->flush.
> >        */
> >       if (F2FS_I(inode)->atomic_write_task == current &&
> > -                             (current->flags & PF_EXITING))
> > +                             (current->flags & PF_EXITING)) {
> > +             inode_lock(inode);
> >               f2fs_abort_atomic_write(inode, true);
> > +             inode_unlock(inode);
> > +     }
> > +
> >       return 0;
> >   }
> >
> > @@ -2085,19 +2092,28 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
> >               goto out;
> >       }
> >
> > -     /* Create a COW inode for atomic write */
> > -     pinode = f2fs_iget(inode->i_sb, fi->i_pino);
> > -     if (IS_ERR(pinode)) {
> > -             f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > -             ret = PTR_ERR(pinode);
> > -             goto out;
> > -     }
> > +     /* Check if the inode already has a COW inode */
> > +     if (fi->cow_inode == NULL) {
> > +             /* Create a COW inode for atomic write */
> > +             pinode = f2fs_iget(inode->i_sb, fi->i_pino);
> > +             if (IS_ERR(pinode)) {
> > +                     f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > +                     ret = PTR_ERR(pinode);
> > +                     goto out;
> > +             }
> >
> > -     ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
> > -     iput(pinode);
> > -     if (ret) {
> > -             f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > -             goto out;
> > +             ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
> > +             iput(pinode);
> > +             if (ret) {
> > +                     f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > +                     goto out;
> > +             }
> > +
> > +             set_inode_flag(fi->cow_inode, FI_COW_FILE);
> > +             clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
> > +     } else {
> > +             /* Reuse the already created COW inode */
> > +             f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
> >       }
> >
> >       f2fs_write_inode(inode, NULL);
> > @@ -2105,8 +2121,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
> >       stat_inc_atomic_inode(inode);
> >
> >       set_inode_flag(inode, FI_ATOMIC_FILE);
> > -     set_inode_flag(fi->cow_inode, FI_COW_FILE);
> > -     clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
> >
> >       isize = i_size_read(inode);
> >       fi->original_i_size = isize;
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index 28c9c72dda2a..7bf660d4cad9 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -777,11 +777,18 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
> >   void f2fs_evict_inode(struct inode *inode)
> >   {
> >       struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > -     nid_t xnid = F2FS_I(inode)->i_xattr_nid;
> > +     struct f2fs_inode_info *fi = F2FS_I(inode);
> > +     nid_t xnid = fi->i_xattr_nid;
> >       int err = 0;
> >
> >       f2fs_abort_atomic_write(inode, true);
> >
> > +     if (fi->cow_inode) {
> > +             clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> > +             iput(fi->cow_inode);
> > +             fi->cow_inode = NULL;
> > +     }
>
> It looks "fi->cow_inode = NULL" here may race w/ cow_inode allocation in
> f2fs_ioc_start_atomic_write due to f2fs_write_inode() has not been covered
> by inode_lock()? IIUC.

Sorry, I couldn't understand it, since I couldn't find any relation
between f2fs_ioc_start_atomic_write and f2fs_write_inode. Could you
elaborate more on this? I thought the code might be safe, since it
happens in the inode eviction phase.

>
> Thanks,
>
> > +
> >       trace_f2fs_evict_inode(inode);
> >       truncate_inode_pages_final(&inode->i_data);
> >
> > @@ -866,7 +873,7 @@ void f2fs_evict_inode(struct inode *inode)
> >       stat_dec_inline_inode(inode);
> >       stat_dec_compr_inode(inode);
> >       stat_sub_compr_blocks(inode,
> > -                     atomic_read(&F2FS_I(inode)->i_compr_blocks));
> > +                     atomic_read(&fi->i_compr_blocks));
> >
> >       if (likely(!f2fs_cp_error(sbi) &&
> >                               !is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index ead3f35f501d..719329c1808c 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -192,9 +192,6 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
> >       if (!f2fs_is_atomic_file(inode))
> >               return;
> >
> > -     clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> > -     iput(fi->cow_inode);
> > -     fi->cow_inode = NULL;
> >       release_atomic_write_cnt(inode);
> >       clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
> >       clear_inode_flag(inode, FI_ATOMIC_REPLACE);
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index c11a161ba5be..aa55dc12aff2 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1427,8 +1427,6 @@ static int f2fs_drop_inode(struct inode *inode)
> >                       atomic_inc(&inode->i_count);
> >                       spin_unlock(&inode->i_lock);
> >
> > -                     f2fs_abort_atomic_write(inode, true);
> > -
> >                       /* should remain fi->extent_tree for writepage */
> >                       f2fs_destroy_extent_node(inode);
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

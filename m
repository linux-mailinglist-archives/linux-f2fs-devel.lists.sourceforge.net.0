Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC9B681680
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jan 2023 17:35:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMX7T-0003Vy-Kl;
	Mon, 30 Jan 2023 16:34:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1pMX7S-0003Vs-1m
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 16:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YJlgsoytMCN6/7tvjZnri1SsWgn2chjeiM3w7UC4Ajk=; b=Rs9UWHjf/hDOqibmScx+UQs5A0
 3v1PhDBy2j/VUW3Y5ygrI3awPX2SvVBM78k70hL9qixctSP9NJV6OBJtWCsQppKjpDPK4zf44Nn4e
 frOMCJejr7HHtPD73VpsNswO+zWa6TtnSVBNt8+fRkYPFOoXslhyDyeUCk82zfQoBnkY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YJlgsoytMCN6/7tvjZnri1SsWgn2chjeiM3w7UC4Ajk=; b=URm0yyB/IxF+EPpn4gxJCi2NuE
 YkESzku2UcOb42DWiM8T6v00b8JXnfSeaJGLVKWZgQ9DKRVlv7pZ4Dmyyj19wEY6pK/ELRuCNCirv
 i1uGgnIRgq7rIC2L4CQuUqFp4PUIKhbzk9Scb6E+HudD/QBsLo4RXwpIGIqYxg+vQcrw=;
Received: from mail-yb1-f170.google.com ([209.85.219.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pMX7N-003vJ5-VU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 16:34:57 +0000
Received: by mail-yb1-f170.google.com with SMTP id b1so14692148ybn.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jan 2023 08:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YJlgsoytMCN6/7tvjZnri1SsWgn2chjeiM3w7UC4Ajk=;
 b=YRUDr+oKskF7RsQ/N89W6WQJu3G9391I1ffXA67sWNUyt0kJSQkCaLDQ8I1dcsOiTm
 uXddU048JDOh2+Ayjlp5V3M+sdsijtpVGBin7i41cSXBN+nk/UhR0fTlSzpLIGx8UFZx
 dX6rOI/622vkjK0ciJ3oK3pzeg7Gup0yrzwwNvgClWXwZfRvQDtoXn72PLZFcI/ijajQ
 mtPKF64sSC3q9Uc59xkbPf0EN+6T0YNyItmyF1JFTR42mXPDoy5xSIuxtoLDXCrDqb39
 flZ/laa4XB4YBea+OOzafr+BtM8c+G+iQifCjJjujpBKG1FzKE/tBTkvgV9sTkMpuQ68
 8BsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YJlgsoytMCN6/7tvjZnri1SsWgn2chjeiM3w7UC4Ajk=;
 b=N77WCfOjoHi8UCH70EvWs0uT9/SCnVAFkr1UzJjfUTB5+KgHpAlvmm/98qdgoKzO2I
 hAvR2KSl5gjUJ2kqqNTaTM1sCE9D0dTyXC+o2TDjdIcyEGfR7ygv997+xFyUB4TiDtkn
 Kh9Li4YJt+PoeOfpSxBSwwN5HESSvKi0/Uzz/kMBf8gfrXaIu9zIhdHAnxz8KlU4dyLH
 C54k4R6ea457YlANTeb+fJWDNthvZhm+ZVInPb7gxS7IM17YkydVDYIzGINQUEmW/1WR
 yFatVunF9FhgyP01LpFfLVjznvqNAzFVpnaqJGJkfCY4O4f1c8LvZa+ngCWAEGYHYsMM
 0zVQ==
X-Gm-Message-State: AO0yUKUv7Cje/cYus9fXN8cQQ+C+qjsVfnY5saJzn8TyE7uoXcHJ93pM
 VbM9tdn8IfgtIKmdH1qW6UnwRX0l+IHUNE1AZTM=
X-Google-Smtp-Source: AK7set9fBPLMv602EzCykDHuTMu+qSxAnMpdIu0oy1pIB+b48XZoZzsR4N+r4CeTm0kvRquqnxwRVPSzQ3LtjRx2/O4=
X-Received: by 2002:a25:c789:0:b0:80b:623b:136e with SMTP id
 w131-20020a25c789000000b0080b623b136emr2031794ybe.467.1675096488142; Mon, 30
 Jan 2023 08:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20230113004933.2082072-1-daeho43@gmail.com>
 <ed5f65a7-13bb-581c-cfb5-df5ab30fbc4c@kernel.org>
In-Reply-To: <ed5f65a7-13bb-581c-cfb5-df5ab30fbc4c@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 30 Jan 2023 08:34:36 -0800
Message-ID: <CACOAw_zhVgS84gOXpfZuvptMgsZDhP3QX2EFm=5CoKibB+3V1A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, I read your patch series now and I like it. However,
 how about a race condition between start_atomic_write and abort_atomic_write?
 abort_atomic_write is called without inode_lock in closing filp scena [...]
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.170 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pMX7N-003vJ5-VU
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

Hi Chao,

I read your patch series now and I like it.
However, how about a race condition between start_atomic_write and
abort_atomic_write?
abort_atomic_write is called without inode_lock in closing filp scenarios.
What do you think about this?

Thanks,


On Fri, Jan 27, 2023 at 6:07 PM Chao Yu <chao@kernel.org> wrote:
>
> Hi Daeho, Jaegeuk,
>
> Please take a look at patchset in below link:
>
> https://lore.kernel.org/linux-f2fs-devel/20230109034453.490176-1-chao@kernel.org/T/#t
>
> In PATCH 4/5, I'm trying to fix the same issue w/ alternative way, let me
> know your preference. :)
>
> One comment as below.
>
> On 2023/1/13 8:49, Daeho Jeong wrote:
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
> >   fs/f2fs/file.c    | 43 ++++++++++++++++++++++++++++---------------
> >   fs/f2fs/inode.c   | 11 +++++++++--
> >   fs/f2fs/segment.c |  3 ---
> >   fs/f2fs/super.c   |  2 --
> >   4 files changed, 37 insertions(+), 22 deletions(-)
> >
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index ecbc8c135b49..ff072a9ed258 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1866,7 +1866,10 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
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
> > @@ -1880,8 +1883,11 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
> >        * until all the writers close its file. Since this should be done
> >        * before dropping file lock, it needs to do in ->flush.
> >        */
> > -     if (F2FS_I(inode)->atomic_write_task == current)
> > +     if (F2FS_I(inode)->atomic_write_task == current) {
> > +             inode_lock(inode);
> >               f2fs_abort_atomic_write(inode, true);
> > +             inode_unlock(inode);
> > +     }
> >       return 0;
> >   }
> >
> > @@ -2087,19 +2093,28 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
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
> > @@ -2107,8 +2122,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
> >       stat_inc_atomic_inode(inode);
> >
> >       set_inode_flag(inode, FI_ATOMIC_FILE);
> > -     set_inode_flag(fi->cow_inode, FI_COW_FILE);
> > -     clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
> >
> >       isize = i_size_read(inode);
> >       fi->original_i_size = isize;
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index ff6cf66ed46b..4921f7209e28 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -766,11 +766,18 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
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
> > +
> >       trace_f2fs_evict_inode(inode);
> >       truncate_inode_pages_final(&inode->i_data);
> >
> > @@ -857,7 +864,7 @@ void f2fs_evict_inode(struct inode *inode)
> >       stat_dec_inline_inode(inode);
> >       stat_dec_compr_inode(inode);
> >       stat_sub_compr_blocks(inode,
> > -                     atomic_read(&F2FS_I(inode)->i_compr_blocks));
> > +                     atomic_read(&fi->i_compr_blocks));
> >
> >       if (likely(!f2fs_cp_error(sbi) &&
> >                               !is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index ae3c4e5474ef..536d7c674b04 100644
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
> > index 1f812b9ce985..10463f084d30 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1430,8 +1430,6 @@ static int f2fs_drop_inode(struct inode *inode)
> >                       atomic_inc(&inode->i_count);
> >                       spin_unlock(&inode->i_lock);
> >
> > -                     f2fs_abort_atomic_write(inode, true);
>
> In order to avoid caching obsolete page of cow_inode, how about truncating
> them here?
>
> if (f2fs_is_atomic_file() && cow_inode)
>         truncate_inode_pages_final(&cow_inode->i_data);
>
> Thanks,
>
> > -
> >                       /* should remain fi->extent_tree for writepage */
> >                       f2fs_destroy_extent_node(inode);
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

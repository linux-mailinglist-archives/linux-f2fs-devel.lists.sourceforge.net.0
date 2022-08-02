Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14042587520
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Aug 2022 03:42:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oIguz-0001oM-N5; Tue, 02 Aug 2022 01:41:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oIguy-0001oG-Pz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 01:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eCncDecnT9D4TjZAx5d+YZOA9sfVSktUEGS2mLxDo8Q=; b=jZ3MBD0aR4DGUCubS2BLs32ebk
 X35TQanE87MGWrcVrito4qHnHFUu2K4kf8Dgpw1iNvHEUlxZT3DzLf2HPoe86780h4l+c6fEAit7n
 EB3LaPUX4Xi+1e0LIukXC3hn3PuIG/0TigHkA49RhFC+EcjzST/jQuy1IT9yXrGsrdmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eCncDecnT9D4TjZAx5d+YZOA9sfVSktUEGS2mLxDo8Q=; b=RTRjtemioX1Tvvh5BFt4JHpCim
 ENaHAaV264ctK38ARM+1WiDEM4DYGzIHys67IuHCOOxpiT2UD9jnOQNwjKOkNHBfQAxeGsUHvJZCR
 DfRT8/iICulVau5i2GudcKTn1fnvfD6XmO3WGvthRstIrAGyK/dzWWXpUK0gA9Ehm4Io=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oIguv-0002ej-RY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 01:41:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DA9FBB8190C;
 Tue,  2 Aug 2022 01:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588EAC433D6;
 Tue,  2 Aug 2022 01:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659404503;
 bh=t/fKJPC3nkSuPHZydD7hHIqWuTS2YprxFWHmP6K1j7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lOvN2Hqe9BFF2CjdZi4YiWsLDiqMoVNlE3OxhGkIkDitkLzVE0TSRkErXGdTQ7PdE
 3xkASBgR2Nocikr2Jfaq7/hu2dB9jm4e71Cl5uk5bLko/GryZVXB+3sSIhCUYdbnsw
 CLmPzajrmkOKSAIL37EAGP08CNUWYE3VE3C/gbao/Y3Yrfd1oEnYly6GNoOVHl+e8R
 88/9EbYvQLjdsby4uj6p22X4A9OgIXEn5nczXeZ3IcEqOnoA7qLQRFNG/buG8XLVfR
 Ykytx5kVSJuJcrG7Guo0YiTbPHBM4YT672HmLFNkoKbtHSJ8Vq3vlpiFRyg6uWCu62
 2af3UPUZn6q/g==
Date: Mon, 1 Aug 2022 18:41:41 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YuiA1UcEV8PnUXeU@google.com>
References: <20220801112604.3406642-1-yebin10@huawei.com>
 <CACOAw_yes-aq2EMvXA6hCmV9FLXtRXXwaMW2iB3d7ynjPKa78Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_yes-aq2EMvXA6hCmV9FLXtRXXwaMW2iB3d7ynjPKa78Q@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/01, Daeho Jeong wrote: > On Mon, Aug 1, 2022 at 4:15
 AM Ye Bin via Linux-f2fs-devel > <linux-f2fs-devel@lists.sourceforge.net>
 wrote: > > > > There is issue as follows when test f2fs atomic writ [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oIguv-0002ej-RY
Subject: Re: [f2fs-dev] [PATCH -next v2] f2fs: fix null-ptr-deref in
 f2fs_get_dnode_of_data
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
Cc: linux-kernel@vger.kernel.org, Ye Bin <yebin10@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/01, Daeho Jeong wrote:
> On Mon, Aug 1, 2022 at 4:15 AM Ye Bin via Linux-f2fs-devel
> <linux-f2fs-devel@lists.sourceforge.net> wrote:
> >
> > There is issue as follows when test f2fs atomic write:
> > F2FS-fs (loop0): Can't find valid F2FS filesystem in 2th superblock
> > F2FS-fs (loop0): invalid crc_offset: 0
> > F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=1, run fsck to fix.
> > F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=2, run fsck to fix.
> > ==================================================================
> > BUG: KASAN: null-ptr-deref in f2fs_get_dnode_of_data+0xac/0x16d0
> > Read of size 8 at addr 0000000000000028 by task rep/1990
> >
> > CPU: 4 PID: 1990 Comm: rep Not tainted 5.19.0-rc6-next-20220715 #266
> > Call Trace:
> >  <TASK>
> >  dump_stack_lvl+0x6e/0x91
> >  print_report.cold+0x49a/0x6bb
> >  kasan_report+0xa8/0x130
> >  f2fs_get_dnode_of_data+0xac/0x16d0
> >  f2fs_do_write_data_page+0x2a5/0x1030
> >  move_data_page+0x3c5/0xdf0
> >  do_garbage_collect+0x2015/0x36c0
> >  f2fs_gc+0x554/0x1d30
> >  f2fs_balance_fs+0x7f5/0xda0
> >  f2fs_write_single_data_page+0xb66/0xdc0
> >  f2fs_write_cache_pages+0x716/0x1420
> >  f2fs_write_data_pages+0x84f/0x9a0
> >  do_writepages+0x130/0x3a0
> >  filemap_fdatawrite_wbc+0x87/0xa0
> >  file_write_and_wait_range+0x157/0x1c0
> >  f2fs_do_sync_file+0x206/0x12d0
> >  f2fs_sync_file+0x99/0xc0
> >  vfs_fsync_range+0x75/0x140
> >  f2fs_file_write_iter+0xd7b/0x1850
> >  vfs_write+0x645/0x780
> >  ksys_write+0xf1/0x1e0
> >  do_syscall_64+0x3b/0x90
> >  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> >
> > As 3db1de0e582c commit changed atomic write way which new a cow_inode for
> > atomic write file, and also mark cow_inode as FI_ATOMIC_FILE.
> > When f2fs_do_write_data_page write cow_inode will use cow_inode's cow_inode
> > which is NULL. Then will trigger null-ptr-deref.
> > To solve above issue, introduce FI_COW_FILE flag for COW inode.
> >
> > Fiexes: 3db1de0e582c("f2fs: change the current atomic write way")
> > Signed-off-by: Ye Bin <yebin10@huawei.com>
> > ---
> >  fs/f2fs/f2fs.h    | 6 ++++++
> >  fs/f2fs/file.c    | 2 +-
> >  fs/f2fs/segment.c | 5 +++--
> >  3 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 8579b59b8a05..101f0064ee25 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -758,6 +758,7 @@ enum {
> >         FI_ENABLE_COMPRESS,     /* enable compression in "user" compression mode */
> >         FI_COMPRESS_RELEASED,   /* compressed blocks were released */
> >         FI_ALIGNED_WRITE,       /* enable aligned write */
> > +       FI_COW_FILE,            /* indicate COW file */
> >         FI_MAX,                 /* max flag, never be used */
> >  };
> >
> > @@ -3207,6 +3208,11 @@ static inline bool f2fs_is_atomic_file(struct inode *inode)
> >         return is_inode_flag_set(inode, FI_ATOMIC_FILE);
> >  }
> >
> > +static inline bool f2fs_is_cow_file(struct inode *inode)
> > +{
> > +       return is_inode_flag_set(inode, FI_COW_FILE);
> > +}
> > +
> >  static inline bool f2fs_is_first_block_written(struct inode *inode)
> >  {
> >         return is_inode_flag_set(inode, FI_FIRST_BLOCK_WRITTEN);
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index a90184900698..973a479f9a3d 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -2062,7 +2062,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> >         spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
> >
> >         set_inode_flag(inode, FI_ATOMIC_FILE);
> > -       set_inode_flag(fi->cow_inode, FI_ATOMIC_FILE);
> > +       set_inode_flag(fi->cow_inode, FI_COW_FILE);
> >         clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
> >         f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> >
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 44a04a832e24..6d5fc221ef35 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -193,7 +193,7 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
> >         if (f2fs_is_atomic_file(inode)) {
> >                 if (clean)
> >                         truncate_inode_pages_final(inode->i_mapping);
> > -               clear_inode_flag(fi->cow_inode, FI_ATOMIC_FILE);
> > +               clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> >                 iput(fi->cow_inode);
> >                 fi->cow_inode = NULL;
> >                 clear_inode_flag(inode, FI_ATOMIC_FILE);
> > @@ -3166,7 +3166,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
> >                         return CURSEG_COLD_DATA;
> >                 if (file_is_hot(inode) ||
> >                                 is_inode_flag_set(inode, FI_HOT_DATA) ||
> > -                               f2fs_is_atomic_file(inode))
> > +                               f2fs_is_atomic_file(inode) ||
> 
> I think we can remove f2fs_is_atomic_file(inode) now.

I removed it and applied the patch. :)
Thanks,

> 
> > +                               f2fs_is_cow_file(inode))
> >                         return CURSEG_HOT_DATA;
> >                 return f2fs_rw_hint_to_seg_type(inode->i_write_hint);
> >         } else {
> > --
> > 2.31.1
> >
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

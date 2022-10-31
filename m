Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DD4613D70
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Oct 2022 19:37:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1opZf3-0007bl-8X;
	Mon, 31 Oct 2022 18:37:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1opZf2-0007bf-PL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Oct 2022 18:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYvB3MdHGb4WqcG5KWsuFiuDCNd6Mkda7w7kVNhi+P8=; b=Y6S6wsm9GuUKztYq20lgmVPRGb
 LRYt4SnrWh3tZgycIOjX+siRB9vXVTDmgCz3J/Fot8c4XoTvyQHKmlp7HPOPthwbom21NOPjMTVf+
 2K5Cfuw37EafyVy3G2Fh0VAvghbt1sxQL+hzAVULCGjtG5wxxy2w2j1sCK4bva3Fti9M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uYvB3MdHGb4WqcG5KWsuFiuDCNd6Mkda7w7kVNhi+P8=; b=YTeQ7X2bDbMSMX3fLdjfBTBNL3
 cPEflxzvRT6Pv5sfFLMeLNkGrIOMEkTLdJdbGQ1NSGqr6ViHX69ih8BiWQ9rOk55VaWFmya3HJdXJ
 rSCoaPjfxH+bcbYioQzXuLxRNFrmbSKwCI7YGYpEVlk2Js1tew31DkQ+Ok0AD9t0sD1U=;
Received: from mail-yb1-f181.google.com ([209.85.219.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1opZf1-0077IZ-VV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Oct 2022 18:37:24 +0000
Received: by mail-yb1-f181.google.com with SMTP id i127so14668773ybc.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Oct 2022 11:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uYvB3MdHGb4WqcG5KWsuFiuDCNd6Mkda7w7kVNhi+P8=;
 b=a4U2ZgrYOij8m1lXlDkkiecnJRNlYfS96MWm78NAox/Il5678GohDKdDHWGlszW6Iy
 plnq8tYSj8qcrvVPxEjYuavvrrWSiB4hqZFoMYJ/+wntH+Zfy0ckC1zSnZ4gIwqIDUgr
 Mg2QJEv5YGQlOzK7ipb3qzTw3vjLGT3zvyOBgWChzydA4doJ35ralelspo5luQhYajD+
 nevuDjxyB7ECVPY/NeXEj08d3eWoAmsKrh9qA7SSCid0pJnLoTyOb3/Uu5MRq6KOihJU
 PTrNnBn3FsUgjI59Shlh6YpqekBUwAELSNBg8DJePwd+EoLwpyk/OVaxK8+R/3uCjLsq
 Bf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uYvB3MdHGb4WqcG5KWsuFiuDCNd6Mkda7w7kVNhi+P8=;
 b=dT5oxfkNmE4UOj2Mrm570GjYWYw+e9quQnUAsc+kHZsIfBl1Upp25Jb1IVbDww/Waj
 PbHB7be4YtChqVkH9Ok1avoSxy57fndolVBP8+DyLCsfb4OIwoHhU6IpS/Lp1DSCCRt/
 w8T9B5wOwUv3jZU2mN1HtSmirEZwrfVcGn25HfTmxqQBnjilsYfL+eyvaP62KPwaTrh7
 WTvgaoB+CxOMMFjETCIZhEgqfPMq4QxzP85O284F4SZ94xAbVFAItqDe2S5GyCAwW+Ku
 fAA4c0wMb7DdvIwddHWY9GVpY2M+DlZ5yPwVioaKeaBnh4YLyqccsCNM3F1JY1Xzm7bq
 SqSg==
X-Gm-Message-State: ACrzQf3GKWnaKqVlAooi8B85Y5QHJvp++sGfe7jzlCkrs6RSPIcB0AXl
 6JuaT3ovjOe0Rg2k1g1KttbGrNs7AmBVZyx+6kOHusyJsfo=
X-Google-Smtp-Source: AMsMyM40F+9hLV6kHwc6e4BnozkJVXLAS8bG+Kzkej67VudzhaWzpSLx4XJzBD0tB7NAfLUY4XtqCshm6RjHB6CRvmw=
X-Received: by 2002:a5b:842:0:b0:6a3:cf26:755d with SMTP id
 v2-20020a5b0842000000b006a3cf26755dmr13030281ybq.608.1667241438095; Mon, 31
 Oct 2022 11:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221018170017.672824-1-daeho43@gmail.com>
 <4bbefd79-7f01-efc3-7c7e-339a8d5d9952@kernel.org>
In-Reply-To: <4bbefd79-7f01-efc3-7c7e-339a8d5d9952@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 31 Oct 2022 11:37:07 -0700
Message-ID: <CACOAw_x+FNUAoYPw4BoRd+SHErV0QZi=UTgDDNPRkeS3n6P6wA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Oct 28,
 2022 at 7:48 PM Chao Yu wrote: > > On 2022/10/19
 1:00, Daeho Jeong wrote: > > From: Daeho Jeong > > > > We need to make sure
 i_size doesn't change until atomic write commit is > > [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.181 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1opZf1-0077IZ-VV
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: correct i_size change for
 atomic writes
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 28, 2022 at 7:48 PM Chao Yu <chao@kernel.org> wrote:
>
> On 2022/10/19 1:00, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > We need to make sure i_size doesn't change until atomic write commit is
> > successful and restore it when commit is failed.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> > v5: prevent only i_size update for atomic files when dirtying inode
> > v4: move i_size update after clearing atomic file flag in
> >      f2fs_abort_atomic_write()
> > v3: make sure inode is clean while atomic writing
> > ---
> >   fs/f2fs/f2fs.h    |  8 ++++++++
> >   fs/f2fs/file.c    | 18 +++++++++++-------
> >   fs/f2fs/inode.c   |  5 ++++-
> >   fs/f2fs/segment.c | 14 ++++++++++----
> >   4 files changed, 33 insertions(+), 12 deletions(-)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index e7e750e6b332..68d2a3383c38 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -764,6 +764,7 @@ enum {
> >       FI_COMPRESS_RELEASED,   /* compressed blocks were released */
> >       FI_ALIGNED_WRITE,       /* enable aligned write */
> >       FI_COW_FILE,            /* indicate COW file */
> > +     FI_ATOMIC_COMMIT,       /* indicate atomic commit completed except disk sync */
>
> How about FI_ATOMIC_WRITTEN or FI_ATOMIC_COMMITTED? which may be
> more readable?

Sounds reasonable. I will take FI_ATOMIC_COMMITTED.

>
> >       FI_MAX,                 /* max flag, never be used */
> >   };
> >
> > @@ -822,6 +823,7 @@ struct f2fs_inode_info {
> >       unsigned int i_cluster_size;            /* cluster size */
> >
> >       unsigned int atomic_write_cnt;
> > +     loff_t original_i_size;         /* original i_size before atomic write */
> >   };
> >
> >   static inline void get_extent_info(struct extent_info *ext,
> > @@ -3072,6 +3074,8 @@ static inline void f2fs_i_blocks_write(struct inode *inode,
> >               set_inode_flag(inode, FI_AUTO_RECOVER);
> >   }
> >
> > +static inline bool f2fs_is_atomic_file(struct inode *inode);
> > +
> >   static inline void f2fs_i_size_write(struct inode *inode, loff_t i_size)
> >   {
> >       bool clean = !is_inode_flag_set(inode, FI_DIRTY_INODE);
> > @@ -3081,6 +3085,10 @@ static inline void f2fs_i_size_write(struct inode *inode, loff_t i_size)
> >               return;
> >
> >       i_size_write(inode, i_size);
> > +
> > +     if (f2fs_is_atomic_file(inode))
> > +             return;
> > +
> >       f2fs_mark_inode_dirty_sync(inode, true);
> >       if (clean || recover)
> >               set_inode_flag(inode, FI_AUTO_RECOVER);
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index ec9ee0f6d502..7ce629c95f4a 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1991,6 +1991,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> >       struct f2fs_inode_info *fi = F2FS_I(inode);
> >       struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> >       struct inode *pinode;
> > +     loff_t isize;
> >       int ret;
> >
> >       if (!inode_owner_or_capable(mnt_userns, inode))
> > @@ -2049,7 +2050,12 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> >               f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> >               goto out;
> >       }
> > -     f2fs_i_size_write(fi->cow_inode, i_size_read(inode));
> > +
> > +     f2fs_write_inode(inode, NULL);
> > +
> > +     isize = i_size_read(inode);
> > +     fi->original_i_size = isize;
> > +     f2fs_i_size_write(fi->cow_inode, isize);
> >
> >       stat_inc_atomic_inode(inode);
> >
> > @@ -2087,16 +2093,14 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
> >
> >       if (f2fs_is_atomic_file(inode)) {
> >               ret = f2fs_commit_atomic_write(inode);
> > -             if (ret)
> > -                     goto unlock_out;
> > -
> > -             ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
> >               if (!ret)
> > -                     f2fs_abort_atomic_write(inode, false);
> > +                     ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
> > +
> > +             f2fs_abort_atomic_write(inode, ret);
> >       } else {
> >               ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
> >       }
> > -unlock_out:
> > +
> >       inode_unlock(inode);
> >       mnt_drop_write_file(filp);
> >       return ret;
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index 9f0d3864d9f1..044f132b87bc 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -621,9 +621,12 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
> >       ri->i_uid = cpu_to_le32(i_uid_read(inode));
> >       ri->i_gid = cpu_to_le32(i_gid_read(inode));
> >       ri->i_links = cpu_to_le32(inode->i_nlink);
> > -     ri->i_size = cpu_to_le64(i_size_read(inode));
> >       ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(inode->i_blocks) + 1);
> >
> > +     if (!f2fs_is_atomic_file(inode) ||
> > +                     is_inode_flag_set(inode, FI_ATOMIC_COMMIT))
> > +             ri->i_size = cpu_to_le64(i_size_read(inode));
>
> So we expect that below flow can update i_size correctly, right?

Yes, right.

Thanks,

>
> - f2fs_ioc_commit_atomic_write
>   - f2fs_do_sync_file
>    - f2fs_skip_inode_update
>    - f2fs_write_inode
>     - f2fs_update_inode_page
>      - f2fs_update_inode
>
> Thanks,
>
> > +
> >       if (et) {
> >               read_lock(&et->lock);
> >               set_raw_extent(&et->largest, &ri->i_ext);
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 289bcb7ca300..264b4e352319 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -192,14 +192,18 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
> >       if (!f2fs_is_atomic_file(inode))
> >               return;
> >
> > -     if (clean)
> > -             truncate_inode_pages_final(inode->i_mapping);
> >       clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> >       iput(fi->cow_inode);
> >       fi->cow_inode = NULL;
> >       release_atomic_write_cnt(inode);
> > +     clear_inode_flag(inode, FI_ATOMIC_COMMIT);
> >       clear_inode_flag(inode, FI_ATOMIC_FILE);
> >       stat_dec_atomic_inode(inode);
> > +
> > +     if (clean) {
> > +             truncate_inode_pages_final(inode->i_mapping);
> > +             f2fs_i_size_write(inode, fi->original_i_size);
> > +     }
> >   }
> >
> >   static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
> > @@ -335,10 +339,12 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
> >       }
> >
> >   out:
> > -     if (ret)
> > +     if (ret) {
> >               sbi->revoked_atomic_block += fi->atomic_write_cnt;
> > -     else
> > +     } else {
> >               sbi->committed_atomic_block += fi->atomic_write_cnt;
> > +             set_inode_flag(inode, FI_ATOMIC_COMMIT);
> > +     }
> >
> >       __complete_revoke_list(inode, &revoke_list, ret ? true : false);
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

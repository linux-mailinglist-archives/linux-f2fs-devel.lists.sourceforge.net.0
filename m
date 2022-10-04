Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 203785F4816
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Oct 2022 19:13:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oflTV-0003My-HU;
	Tue, 04 Oct 2022 17:12:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1oflTU-0003Mp-Bh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 17:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EmhBd/ixMNCkwruC6kr5MbMa9TbfRNFLbCf68YThMPU=; b=V7b8l+9aUt5CxHvbUxeqYbmm5x
 N0b3aE4GgUTB5fKi+qr83ZUVA5kfB11Pwjiz2JRfqCFZiqY5GpjRa1D4m/+2NjDyLT4EuZ71wiOTK
 MylK5e4LXuhpm7ESilGXO6660cbV+8D96+kp1SdOvQR0Aooj3sGyHRDgKpCKlnU14RQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EmhBd/ixMNCkwruC6kr5MbMa9TbfRNFLbCf68YThMPU=; b=Ehq76IWQq0yImJpnZNBPUwwjLx
 +qLVlsXmaCIwSxIEhgi7egIQAgu6gGlLkmWKLDLtPZGln/LkR+Bz8lPhHHU+GJ3fXgfmy9TXN32/H
 7EqXBW8wGh2j39Kmw8V7cI5/iuT2JM27BRfkVGeQctfgu4bfW9noDhy7UPE/dWfF0kes=;
Received: from mail-yb1-f172.google.com ([209.85.219.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oflTT-00Cc9v-Me for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 17:12:56 +0000
Received: by mail-yb1-f172.google.com with SMTP id j7so17534850ybb.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Oct 2022 10:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=EmhBd/ixMNCkwruC6kr5MbMa9TbfRNFLbCf68YThMPU=;
 b=FYl2FxaMxfS+0aIiZ41P6XHDbibu9keioiITd+6lHtZI4K9ltTfu1IcwiEwBEzmyyt
 Sj2wTFejQrxknCOCx9FbTPPWvCjbFLc+nSjXsOV+r5O1RoUGUjZN5ZkopEj6Wuy6yTkP
 MpZKxV7HwkxEi3hNbQDwfNqqTSB4nRGw+RjDhMi0YAB5hUAIzGmr0e4clxEUJMKZodVa
 SEzGUEVAsb3CWlFrQSRimb9c2DjA/jR/yRyK0H6DSn5mE7QCCzmnzY4N9m5uC+YcHB3O
 J51aMxDkHw7wuN8u3gDLQZJcsR42+eko6XMgU1g6dEDP9JSs3pt/p9uZp+Flmnhy8M4t
 Juew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=EmhBd/ixMNCkwruC6kr5MbMa9TbfRNFLbCf68YThMPU=;
 b=I4MwYgp7wRQwk653yAqYNOgB+SxV6/ao2klmkLCdXnDiHdvfVyGMS5UgsC7AkhBKed
 +W9hF0B8hCDiD2j2IsdL+HbfGw3CErDvp8/tYWIKHchW6lE4n6pvyrVMZZRRzTh5L/mQ
 Yu1kL86sJLpava+WAJFEHzceiG+8IzleezsevIPDVkOLY6Ih39PuouHYMvdz4g+B2hBK
 6WH/JXGfQJoZZ1s3w1KifFMSAW12QeBGBZThIk59aL8kERmBftgwZmbqgkAqjVCHqQsz
 PqQhlc1H/mxlA8iEUPGq88j8QiI9pVtxRT33E2vvoyY0XQ4YiH3gjRXoWgB7QViAyTU1
 ESiw==
X-Gm-Message-State: ACrzQf3UTAWSOVouHftK2b2nEyxbz/Qcq1GKLSxR6TGuvnnwtVUIxzFK
 ytPCnakbl9oMyXcqhRXXIt3PCrV153yYLXonwlUooZ6sqXg=
X-Google-Smtp-Source: AMsMyM7UO9jexB/0usH2L3NfpRAol3kYJlpetMOHxNp94Hdw+mMtK0KsLpNu5wRmjm5HdElbWYnG8jo37IurptxqQJg=
X-Received: by 2002:a5b:90:0:b0:68e:26dd:c4a7 with SMTP id
 b16-20020a5b0090000000b0068e26ddc4a7mr26916194ybp.6.1664903569857; 
 Tue, 04 Oct 2022 10:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221004001050.3269377-1-daeho43@gmail.com>
 <85cc583c-279c-2d65-4cfd-ebd54468c6f5@kernel.org>
In-Reply-To: <85cc583c-279c-2d65-4cfd-ebd54468c6f5@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 4 Oct 2022 10:12:38 -0700
Message-ID: <CACOAw_xR0sr3j=6v+7vqs77Hk=tZ3BqxKBFyKpawe_rpUJsf=Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 4,
 2022 at 8:41 AM Chao Yu wrote: > > On 2022/10/4
 8:10, Daeho Jeong wrote: > > From: Daeho Jeong > > > > We need to make sure
 i_size doesn't change until atomic write commit is > > su [...] 
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
 no trust [209.85.219.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oflTT-00Cc9v-Me
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: correct i_size change for
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

On Tue, Oct 4, 2022 at 8:41 AM Chao Yu <chao@kernel.org> wrote:
>
> On 2022/10/4 8:10, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > We need to make sure i_size doesn't change until atomic write commit is
> > successful and restore it when commit is failed.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> > v3: make sure inode is clean while atomic writing
> > ---
> >   fs/f2fs/f2fs.h    |  1 +
> >   fs/f2fs/file.c    | 18 +++++++++++-------
> >   fs/f2fs/inode.c   |  3 +++
> >   fs/f2fs/segment.c |  4 +++-
> >   4 files changed, 18 insertions(+), 8 deletions(-)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index dee7b67a17a6..539da7f12cfc 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -821,6 +821,7 @@ struct f2fs_inode_info {
> >       unsigned int i_cluster_size;            /* cluster size */
> >
> >       unsigned int atomic_write_cnt;
> > +     loff_t original_i_size;         /* original i_size before atomic write */
> >   };
> >
> >   static inline void get_extent_info(struct extent_info *ext,
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 5efe0e4a725a..ce2336d2f688 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1989,6 +1989,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> >       struct f2fs_inode_info *fi = F2FS_I(inode);
> >       struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> >       struct inode *pinode;
> > +     loff_t isize;
> >       int ret;
> >
> >       if (!inode_owner_or_capable(mnt_userns, inode))
> > @@ -2047,7 +2048,12 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
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
> >       spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
> >       sbi->atomic_files++;
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
> > index cde0a3dc80c3..64d7772b4cd9 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -30,6 +30,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
> >       if (f2fs_inode_dirtied(inode, sync))
> >               return;
> >
> > +     if (f2fs_is_atomic_file(inode))
> > +             return;
> > +
> >       mark_inode_dirty_sync(inode);
> >   }
> >
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 460048f3c850..143b7ea0fb8e 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -193,8 +193,10 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
> >       if (!f2fs_is_atomic_file(inode))
> >               return;
> >
> > -     if (clean)
> > +     if (clean) {
> >               truncate_inode_pages_final(inode->i_mapping);
> > +             f2fs_i_size_write(inode, fi->original_i_size);
>
> inode has atomic_write flag, it can not be set dirtied here, how
> about writing i_size ater clear_inode_flag(inode, FI_ATOMIC_FILE)?

Oh, right.
Thanks~!

>
> Thanks,
>
> > +     }
> >       clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> >       iput(fi->cow_inode);
> >       fi->cow_inode = NULL;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

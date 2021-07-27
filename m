Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A583D7B3F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jul 2021 18:42:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8Q9h-0007I7-Dq; Tue, 27 Jul 2021 16:42:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1m8Q9f-0007I0-I0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 16:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ON7q0cRtYLSty813NUaupFpkMI6FU3tfgheJEaRd1H0=; b=aRU1EG3PQ5vytHBLsqsEl0Bp9z
 XYoN7lQQ/YwWbXJIx7Y7f/wunzwuumZgHkOOo05S6x/6uRoMFPdg8bxqDp8E0cUjx7PtTvp3vbfJP
 Ugf658wPxbUpPtlqajAkvdEeZuKCpQod1sl4iIpZRdsJZSwMFV+MHMx/apdfA3DTGXKg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ON7q0cRtYLSty813NUaupFpkMI6FU3tfgheJEaRd1H0=; b=jn1QQ/bzAc6ooaAvR8vtT5tRK4
 4npmg9efJYjPA1rhR8x9CopYN8IH1iTcopDD1IXcrJPWu3S4dQDVwz95nHM8G3nCwSAiVNmoFUyUX
 WuI4TwagTlefkb/VjL0x6AQg9EIZp2hv4UkRNhY320/RQYvrJvPiQNK19WOJSVIeTD5E=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m8Q9Z-004PaK-3K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 16:42:07 +0000
Received: by mail-lj1-f172.google.com with SMTP id r23so13582687lji.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Jul 2021 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ON7q0cRtYLSty813NUaupFpkMI6FU3tfgheJEaRd1H0=;
 b=Styo7U3xQ60+p2Gllfc090JptnVjEBjJrK6SZ52HzDUNCAWs3BPwrMLKE2EKOdN4U3
 3hsunmhBHs+Ah6vcnpDQMGHMbJQs/MktQ3WF4XJpQKZUIbFTPC3aEpOFam0imZFIVR09
 Hu93rR+VMcbDGYQLJwMUL4o9O6AlfN8wTsQkHQtul7RqZJMP4yJ5mZYwFsiMxxY4lAMj
 DSieXvRefwByRsoDF/zOQysqhhCWdNCr0iRZtx4T9dcR9VJ2awpoIVmDNUh13aE1+Azg
 DmHnOORoqUWQpMHHTzKW8Qq6ugXhydIb/yLui6ti8AmcrYZjsxMEQuHrcAexb8jailrR
 sTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ON7q0cRtYLSty813NUaupFpkMI6FU3tfgheJEaRd1H0=;
 b=l2oWz/9AnCZ0ZzQMCzIr12RJF6TOwBDLlkx9nJ5UqzeZog5hSHtq16QMAGBHR9cqSG
 0e/Zxjkp5PGDaCXjNwLvwD7p3KfcFM7bKWj0gYkoesEvjcM+4lLB32f08SI+F9e6yBEe
 wdaI5/e5o6Dy3wO9cQeOMMS+guob6VC+oSFqYTyKyT1p2F0NvXCHW5g9el6bIU9nv3gR
 56VHwxwth0hfu5MrHkrvDfI8cSD652bD1Kzs04qi0njoE63DdY7dz5rPzCZkaIejgXwV
 +XKWzMH28W8RnlLIaimeZoXF9BzKB8E48VaUpw3ZXzF7eEJfHwj+a32IpjafDShmQQyF
 01ig==
X-Gm-Message-State: AOAM532nBGwkcE5iBWbiwcqYVo9XIYjPjgb5m8kzaK2yOrxWlVX9MFgg
 WzFLjuzSk4V76boSayOIjM7R++2Aa4s1ZaSChuA=
X-Google-Smtp-Source: ABdhPJziUdehrE8hWu7Q1ESI+Jw3ICyKRDSHjeBjsNTlQxW31dikbvpkcSQXzZmH+xOJoHoHX2to6l+TIyTiheT/Y7I=
X-Received: by 2002:a05:651c:1549:: with SMTP id
 y9mr15779622ljp.335.1627404114569; 
 Tue, 27 Jul 2021 09:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210726041819.2059593-1-daeho43@gmail.com>
 <f9555521-8878-2d46-36f1-3032bb8bbc0a@kernel.org>
In-Reply-To: <f9555521-8878-2d46-36f1-3032bb8bbc0a@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 27 Jul 2021 09:41:43 -0700
Message-ID: <CACOAw_zvFcV-5ePrFOr-bo2DxXyFzjDTSo-7aPcXG6jtNweEbA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m8Q9Z-004PaK-3K
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: change fiemap way in printing
 compression chunk
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
Cc: Daeho Jeong <daehojeong@google.com>, Eric Biggers <ebiggers@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

How about adding this?

skip_fill:

        if (map.m_pblk == COMPRESS_ADDR) {

                if (start_blk & (cluster_size - 1)) {

                        ret = -EFSCORRUPTED;

                        goto out;

                }

                compr_cluster = true;

                count_in_cluster = 1;

        } else if (compr_appended) {

On Tue, Jul 27, 2021 at 3:19 AM Chao Yu <chao@kernel.org> wrote:
>
> On 2021/7/26 12:18, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > When we print out a discontinuous compression chunk, it shows like a
> > continuous chunk now. To show it more correctly, I've changed the way of
> > printing fiemap info like below. Plus, eliminated NEW_ADDR(-1) in fiemap
> > info, since it is not in fiemap user api manual.
> >
> > Let's assume 16KB compression cluster.
> >
> > <before>
> >     Logical          Physical         Length           Flags
> > 0:  0000000000000000 00000002c091f000 0000000000004000 1008
> > 1:  0000000000004000 00000002c0920000 0000000000004000 1008
> >    ...
> > 9:  0000000000034000 0000000f8c623000 0000000000004000 1008
> > 10: 0000000000038000 000000101a6eb000 0000000000004000 1008
> >
> > <after>
> > 0:  0000000000000000 00000002c091f000 0000000000004000 1008
> > 1:  0000000000004000 00000002c0920000 0000000000004000 1008
> >    ...
> > 9:  0000000000034000 0000000f8c623000 0000000000001000 1008
> > 10: 0000000000035000 000000101a6ea000 0000000000003000 1008
> > 11: 0000000000038000 000000101a6eb000 0000000000002000 1008
> > 12: 000000000003a000 00000002c3544000 0000000000002000 1008
> >
> > Flags
> > 0x1000 => FIEMAP_EXTENT_MERGED
> > 0x0008 => FIEMAP_EXTENT_ENCODED
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > Tested-by: Eric Biggers <ebiggers@google.com>
> >
> > ---
> > v4: initialized count_in_cluster
> > v3: fix the missing last extent flag issue
> > v2: changed the print format
> > ---
> >   fs/f2fs/data.c | 75 ++++++++++++++++++++++++++++----------------------
> >   1 file changed, 42 insertions(+), 33 deletions(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 3a01a1b50104..1a716c3b5457 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1843,8 +1843,9 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
> >       u64 logical = 0, phys = 0, size = 0;
> >       u32 flags = 0;
> >       int ret = 0;
> > -     bool compr_cluster = false;
> > +     bool compr_cluster = false, compr_appended;
> >       unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
> > +     unsigned int count_in_cluster = 0;
> >       loff_t maxbytes;
> >
> >       if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
> > @@ -1892,15 +1893,17 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
> >       map.m_next_pgofs = &next_pgofs;
> >       map.m_seg_type = NO_CHECK_TYPE;
> >
> > -     if (compr_cluster)
> > -             map.m_len = cluster_size - 1;
> > +     if (compr_cluster) {
> > +             map.m_lblk += 1;
> > +             map.m_len = cluster_size - count_in_cluster;
> > +     }
> >
> >       ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
> >       if (ret)
> >               goto out;
> >
> >       /* HOLE */
> > -     if (!(map.m_flags & F2FS_MAP_FLAGS)) {
> > +     if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
> >               start_blk = next_pgofs;
> >
> >               if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
> > @@ -1910,6 +1913,14 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
> >               flags |= FIEMAP_EXTENT_LAST;
> >       }
> >
> > +     compr_appended = false;
> > +     /* In a case of compressed cluster, append this to the last extent */
> > +     if (compr_cluster && ((map.m_flags & F2FS_MAP_UNWRITTEN) ||
> > +                     !(map.m_flags & F2FS_MAP_FLAGS))) {
> > +             compr_appended = true;
> > +             goto skip_fill;
> > +     }
> > +
> >       if (size) {
> >               flags |= FIEMAP_EXTENT_MERGED;
> >               if (IS_ENCRYPTED(inode))
> > @@ -1926,38 +1937,36 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
> >       if (start_blk > last_blk)
> >               goto out;
> >
> > -     if (compr_cluster) {
> > -             compr_cluster = false;
> > -
> > -
> > -             logical = blks_to_bytes(inode, start_blk - 1);
> > -             phys = blks_to_bytes(inode, map.m_pblk);
> > -             size = blks_to_bytes(inode, cluster_size);
> > -
> > -             flags |= FIEMAP_EXTENT_ENCODED;
> > -
> > -             start_blk += cluster_size - 1;
> > -
> > -             if (start_blk > last_blk)
> > -                     goto out;
> > -
> > -             goto prep_next;
> > -     }
> > -
> > +skip_fill:
> >       if (map.m_pblk == COMPRESS_ADDR) {
>
> Looks good, but one more thing I concern is how about detecting and
> returning -EFSCORRUPTED for below corrupted metadata cases:
> - [COMPRESS_ADDR, blkaddr, COMPRESS_ADDR, NEW_ADDR]
> - [blkaddr, COMPRESS_ADDR, NULL_ADDR, NULL_ADDR]
>
> Thanks,
>
> >               compr_cluster = true;
> > -             start_blk++;
> > -             goto prep_next;
> > -     }
> > -
> > -     logical = blks_to_bytes(inode, start_blk);
> > -     phys = blks_to_bytes(inode, map.m_pblk);
> > -     size = blks_to_bytes(inode, map.m_len);
> > -     flags = 0;
> > -     if (map.m_flags & F2FS_MAP_UNWRITTEN)
> > -             flags = FIEMAP_EXTENT_UNWRITTEN;
> > +             count_in_cluster = 1;
> > +     } else if (compr_appended) {
> > +             unsigned int appended_blks = cluster_size -
> > +                                             count_in_cluster + 1;
> > +             size += blks_to_bytes(inode, appended_blks);
> > +             start_blk += appended_blks;
> > +             compr_cluster = false;
> > +     } else {
> > +             logical = blks_to_bytes(inode, start_blk);
> > +             phys = __is_valid_data_blkaddr(map.m_pblk) ?
> > +                     blks_to_bytes(inode, map.m_pblk) : 0;
> > +             size = blks_to_bytes(inode, map.m_len);
> > +             flags = 0;
> > +
> > +             if (compr_cluster) {
> > +                     flags = FIEMAP_EXTENT_ENCODED;
> > +                     count_in_cluster += map.m_len;
> > +                     if (count_in_cluster == cluster_size) {
> > +                             compr_cluster = false;
> > +                             size += blks_to_bytes(inode, 1);
> > +                     }
> > +             } else if (map.m_flags & F2FS_MAP_UNWRITTEN) {
> > +                     flags = FIEMAP_EXTENT_UNWRITTEN;
> > +             }
> >
> > -     start_blk += bytes_to_blks(inode, size);
> > +             start_blk += bytes_to_blks(inode, size);
> > +     }
> >
> >   prep_next:
> >       cond_resched();
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

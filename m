Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDD73D310A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 02:49:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6jNj-00062n-CC; Fri, 23 Jul 2021 00:49:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1m6jNh-00062Y-QG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 00:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R2WR76y4EE4IKn9g23ZCfDxjyNDy+13+LWLZTGdDMJQ=; b=ZvqZ4NE7+EBghbdasdHVpLW1b8
 o3u8LNI1l+uzSFBUJLM8nbxaUYUYZx8eGbsxqsfPapjKbRvfCuJ000l/dXTxGetaR34v8oKYCxJLz
 a1Bth0WE/RlNid8B2itX2Mw4Qn7rYf3k7dZfuOvlfkFD8NnDDEOZxUGIgmpNKh6uosqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R2WR76y4EE4IKn9g23ZCfDxjyNDy+13+LWLZTGdDMJQ=; b=NvciStGT0iGUvwwf6LqEzei3p9
 gStMIYyVU39Zw5ocnEdFVewGM8ur0nTbCGrkG59C/HGOV70KP6rKLpe0agkwNeICMMudarLvgb44d
 n1DpPFTQzmbwqT+RavBzT8BdcskIjwR6bp61ifKsLogwheomHwWs1TkntQICQHx5K/Uk=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6jNa-0005MV-Nq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 00:49:37 +0000
Received: by mail-lj1-f172.google.com with SMTP id x24so5886069ljm.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jul 2021 17:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R2WR76y4EE4IKn9g23ZCfDxjyNDy+13+LWLZTGdDMJQ=;
 b=CKIz8q0ZCZM0Q8O4lVDY1q+MHMPl96BgWOOtBaXt6rd56XVfVUDwC5LAmZ9Wum4B+w
 dhjLNF4NLVixabI/TSL0Xd7AIq5J8AwmNA6ftJy8XWqAjvFUicSQaCKCT05daJ9adAH5
 W1xIViHPUN/EYS3dzN11eLA8C6j+yjsReL5/W6yw7sh6Peb6SeValxVNMYzlXDoTEjSZ
 tcgQgJdAJHxvCybAHva3wEkWN1N1wGlAkgfQANzuv8oHruHMXTbChHFAgRpoG50dIv3z
 Uc+nY4J9WD4Y6bmPoNv8N5LY9iV/VWtAbcjd8WRvEKjUX4hgN2whnmgVPhjFeNuG8Z5v
 blnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R2WR76y4EE4IKn9g23ZCfDxjyNDy+13+LWLZTGdDMJQ=;
 b=hgh7bkAqxZgZtF4THXA2VBv9cD6u2d/zyyAe1qMkp6tPFQCLfqV6AoAL3fHB3YWsZU
 /CcymwC9bADPdsOEx42XmyJYRJNCXtQ7Anaz60St8j7o5ej9P/xbGE5OXKQ/sUTdT/Px
 kdXGxo8E89VBsbpt85+hrVwjJHj5k3ReHYMVj4m1UTRz3IOPdSQPorfzmvouF4TB1Ew4
 5hrDalVaBU7Ff4uo5TFY+dmvX9efNzljyAkqKeQShys4pZzYAcpvbooickV3POg7scRk
 AVb36J7GtaxPoVhSVt458oWAqShFuASpEH1MlDC/pMm0K+VSUIWazF9LbP2DbG9rlGGB
 SUmw==
X-Gm-Message-State: AOAM533qqlWtlHuGeCS+AqiteEeakScpwnTxxdnXIuRO/dQLKzOvvJaj
 wULi+9ss9PnCwLADl0kITAqEHYaPhMlN5Pulx3w=
X-Google-Smtp-Source: ABdhPJyG5UUGNMqrzydpuJDEOwYAMik2fLtY+SeyvJRqGx5SNtI/Rgw5aYPQB/8OJgngoOhzRThkJ5viWsSOjMYshX8=
X-Received: by 2002:a05:651c:1549:: with SMTP id
 y9mr1690336ljp.335.1627001364043; 
 Thu, 22 Jul 2021 17:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210722211921.3791312-1-daeho43@gmail.com>
 <dc7776c7-2694-5eea-fe9a-12191c833389@kernel.org>
In-Reply-To: <dc7776c7-2694-5eea-fe9a-12191c833389@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 22 Jul 2021 17:49:12 -0700
Message-ID: <CACOAw_wznnE_pMh_9aVYJdyF-JUn46AZ28hh_GSWcxSJYWsjkw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6jNa-0005MV-Nq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change fiemap way in printing
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 22, 2021 at 5:20 PM Chao Yu <chao@kernel.org> wrote:
>
> Hi Daeho,
>
> On 2021/7/23 5:19, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > When we print out a discontinuous compression chunk, it shows like a
> > continuous chunk now. To show it more correctly, I've changed the way of
> > printing fiemap info like below. Plus, eliminated NEW_ADDR(-1) in fiemap
> > info, since it is not in fiemap user api manual.
> >
> >     Logical          Physical         Length           Flags
> > 0: 0000000000000000 0000000fdf692000 0000000000004000 1008
> > 1: 0000000000004000 0000000fdf693000 0000000000004000 1008
> > 2: 0000000000008000 0000000fdf694000 0000000000004000 1008
> > 3: 000000000000c000 0000000fdf695000 0000000000004000 1008
> > 4: 0000000000010000 0000000fdf696000 000000000000c000 1000
> > 5: 000000000001c000 0000000f8c60d000 0000000000010000 1000
> > 6: 000000000002c000 0000000f8c61d000 0000000000004000 1008
> > 7: 0000000000030000 0000000f8c620000 0000000000004000 1008
> > 8: 0000000000034000 0000000f8c623000 0000000000001000 1008
> > 9: 0000000000035000 0000000fc7af4000 0000000000003000 1008
>
> I wrote a file some like this:
>
> i_addr[0x9] cluster flag                [0xfffffffe : 4294967294]
> i_addr[0xa]                             [0x   72800 : 468992]
> i_addr[0xb] reserved flag               [0xffffffff : 4294967295]
> i_addr[0xc] reserved flag               [0xffffffff : 4294967295]
> i_addr[0xd] cluster flag                [0xfffffffe : 4294967294]
> i_addr[0xe]                             [0x   72801 : 468993]
> i_addr[0xf] reserved flag               [0xffffffff : 4294967295]
> i_addr[0x10] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x11]                            [0x   72832 : 469042]
> i_addr[0x12]                            [0x   72802 : 468994]
> i_addr[0x13]                            [0x   72833 : 469043]
> i_addr[0x14]                            [0x   72834 : 469044]
> i_addr[0x15] cluster flag               [0xfffffffe : 4294967294]
> i_addr[0x16]                            [0x   72803 : 468995]
> i_addr[0x17] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x18] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x19]                            [0x   72835 : 469045]
> i_addr[0x1a]                            [0x   72804 : 468996]
> i_addr[0x1b]                            [0x   72836 : 469046]
> i_addr[0x1c]                            [0x   72837 : 469047]
> i_addr[0x1d] cluster flag               [0xfffffffe : 4294967294]
> i_addr[0x1e]                            [0x   72805 : 468997]
> i_addr[0x1f] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x20] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x21] cluster flag               [0xfffffffe : 4294967294]
> i_addr[0x22]                            [0x   72806 : 468998]
> i_addr[0x23] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x24] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x25] cluster flag               [0xfffffffe : 4294967294]
> i_addr[0x26]                            [0x   72807 : 468999]
> i_addr[0x27] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x28] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x29] cluster flag               [0xfffffffe : 4294967294]
> i_addr[0x2a]                            [0x   72808 : 469000]
> i_addr[0x2b] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x2c] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x2d] cluster flag               [0xfffffffe : 4294967294]
> i_addr[0x2e]                            [0x   72809 : 469001]
> i_addr[0x2f] reserved flag              [0xffffffff : 4294967295]
> i_addr[0x30] reserved flag              [0xffffffff : 4294967295]
> i_nid[0]                                [0x       0 : 0]
> i_nid[1]                                [0x       0 : 0]
> i_nid[2]                                [0x       0 : 0]
> i_nid[3]                                [0x       0 : 0]
> i_nid[4]                                [0x       0 : 0]
>
> xfs_io file -c "fiemap -v" shows:
>
> before:
>   EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
>     0: [0..31]:         3751936..3751967    32 0x1008
>     1: [32..63]:        3751944..3751975    32 0x1008
>     2: [64..71]:        3752336..3752343     8 0x1000
>     3: [72..79]:        3751952..3751959     8 0x1000
>     4: [80..95]:        3752344..3752359    16 0x1000
>     5: [96..127]:       3751960..3751991    32 0x1008
>     6: [128..135]:      3752360..3752367     8 0x1000
>     7: [136..143]:      3751968..3751975     8 0x1000
>     8: [144..159]:      3752368..3752383    16 0x1000
>     9: [160..191]:      3751976..3752007    32 0x1008
>    10: [192..223]:      3751984..3752015    32 0x1008
>    11: [224..255]:      3751992..3752023    32 0x1008
>    12: [256..287]:      3752000..3752031    32 0x1008
>    13: [288..319]:      3752008..3752039    32 0x1009
>
> after:
>     0: [0..31]:         3751936..3751967    32 0x1008
>     1: [32..63]:        3751944..3751975    32 0x1008
>     2: [64..71]:        3752336..3752343     8 0x1000
>     3: [72..79]:        3751952..3751959     8 0x1000
>     4: [80..95]:        3752344..3752359    16 0x1000
>     5: [96..127]:       3751960..3751991    32 0x1008
>     6: [128..135]:      3752360..3752367     8 0x1000
>     7: [136..143]:      3751968..3751975     8 0x1000
>     8: [144..159]:      3752368..3752383    16 0x1000
>     9: [160..191]:      3751976..3752007    32 0x1008
>    10: [192..223]:      3751984..3752015    32 0x1008
>    11: [224..255]:      3751992..3752023    32 0x1008
>    12: [256..287]:      3752000..3752031    32 0x1008
>    13: [288..319]:      3752008..3752039    32 0x1008
>
> I don't see any obvious difference, except w/ current patch, last
> FIEMAP_EXTENT_LAST is missing.
>
> Sorry, I didn't get the point of this patch, could you please explain
> more details for that problem this patch tries to fix and show the
> difference before/after the patch in commit message?
>
> Thanks,
>
> >
> > Flags
> > 0x1000 => FIEMAP_EXTENT_MERGED
> > 0x0008 => FIEMAP_EXTENT_ENCODED
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> >
> > ---
> > v2: changed the print format
> > ---
> >   fs/f2fs/data.c | 76 ++++++++++++++++++++++++++++----------------------
> >   1 file changed, 42 insertions(+), 34 deletions(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 3a01a1b50104..058dc751e3a6 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1843,8 +1843,9 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
> >       u64 logical = 0, phys = 0, size = 0;
> >       u32 flags = 0;
> >       int ret = 0;
> > -     bool compr_cluster = false;
> > +     bool compr_cluster = false, compr_appended;
> >       unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
> > +     unsigned int count_in_cluster;
> >       loff_t maxbytes;
> >
> >       if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
> > @@ -1892,8 +1893,10 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
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
> > @@ -1903,11 +1906,23 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
> >       if (!(map.m_flags & F2FS_MAP_FLAGS)) {
> >               start_blk = next_pgofs;
> >
> > -             if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
> > +             if (blks_to_bytes(inode, start_blk) >= blks_to_bytes(inode,
> >                                               max_inode_blocks(inode)))
> > +                     flags |= FIEMAP_EXTENT_LAST;
> > +             else if (!compr_cluster)
> >                       goto prep_next;
> > +     }
> > +
> > +     compr_appended = false;
> > +     /* In a case of compressed cluster, append this to the last extent */
> > +     if (compr_cluster && ((map.m_flags & F2FS_MAP_UNWRITTEN) ||
> > +                     !(map.m_flags & F2FS_MAP_FLAGS))) {
> > +             unsigned int appended_blks = cluster_size - count_in_cluster + 1;
> >
> > -             flags |= FIEMAP_EXTENT_LAST;
> > +             size += blks_to_bytes(inode, appended_blks);
> > +             if (map.m_flags & F2FS_MAP_UNWRITTEN)
> > +                     start_blk += appended_blks;
> > +             compr_appended = true;
> >       }
> >
> >       if (size) {
> > @@ -1926,38 +1941,31 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
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
> >       if (map.m_pblk == COMPRESS_ADDR) {
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

Oh, I am sorry for too concrete exlpanation.
I am trying to fix this issue. Let's assume 4 block cluster, which has
been compressed with 3 blocks whose address is 0x1000, 0x5000 and
0x9000.
This cluster is discontinous cluster. In this condition, the previous
version just returns one extent starting from 0x1000 and we are
missing the information related to 0x5000 and 0x9000.
The current version will return 3 extents like below.
Logical Physical Len
0x0      0x1000.  0x1000
0x1.     0x5000.  0x1000
0x2.     0x9000.  0x2000

Thank you for letting me know a bug. I will fix it.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

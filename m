Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 913786008FB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 10:44:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okLjW-0001sp-NG;
	Mon, 17 Oct 2022 08:44:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dvyukov@google.com>) id 1okLjV-0001si-Bb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 08:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qwIwAcqWBfBMRrm9KF2boeBuiPaxpIOUZ43XencQIbo=; b=gtk5qeagWaRh90CwxwVirsDDMO
 eiXoIa6MNH7fWhJBamK5689iN7pf1sUkZNo5CLhOOx7RElYwSAjZOGWml+pfo7ZefMXp7MhZ8Zqtp
 Q4U3kPNZuFUPSoK5/oYSfw+vIxiSQ70/fV52m73q8dGGHfuQiStnRCo4UCQ/esQCXMlc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qwIwAcqWBfBMRrm9KF2boeBuiPaxpIOUZ43XencQIbo=; b=AK2R0t/rPHJeMoVJf1VBbMQZ/I
 bMqFvYwoDAEW9TzWQHqMAjFFeM/a9Vhn5C5ex2MqvKcjZ+s54tVGCV8GVtU800JDrnz8YilS+RQAg
 lVNJU88lhRbQ5i56305GP1KPGgFNPMDIuGLQAHWE91sQ9Qyq+6RT4kbwtZhcperiwsiE=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okLjJ-0002Zo-Qy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 08:44:16 +0000
Received: by mail-lj1-f169.google.com with SMTP id c20so13090400ljj.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qwIwAcqWBfBMRrm9KF2boeBuiPaxpIOUZ43XencQIbo=;
 b=Nrfotfa7MvpY7q0BJxF8GYRMfDoStqAH0gkcWf1bZUF+k/4FN4VrpQKYK3jZBNkZbU
 9nUYp6FlyhtT/GVq0w+Zl4xOv/B2vJTf3IO5Pe/89dj2ynrkpCw9MAiTwWTe0rDsYm5n
 OmQYUbH2dGgKPJGXIi4hqk/f+drAbYZB/w54lgCD1bgdPLIN5KGeLnBGZqdp6wjrulW/
 SKzruULcjVdI61kdj3R8GeeunRA5I5xWFb8h58+PEB2JkOBlKLqnW+uXpsPUBhNPT3nm
 ekW5pqYozDIRwNqbAFHW2Ragfrv47U6CG0jcv0h+KnvFqOT+UyZh5v4TBs9BU/YeHZVC
 rkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qwIwAcqWBfBMRrm9KF2boeBuiPaxpIOUZ43XencQIbo=;
 b=R4IFUiS34KPdBUJOGcuOV/zMkuSl/9YSOojIH2T+wXaNtFgw3c+rt2hp1YZJEFRBYs
 b+yT4krHI+8UFDmc2UeaNjKK4DXYi2Vph37LOZ4I87+IrH2qKGQQtjF4N9z7NPrOs5BZ
 VEuAM6JlxTjX/7TTbo4Ze56+D669rwqrXMgEj3NvQTg198AL6R6rspIOKk8XZ/CMlORL
 BBugFtphx5ESUAZ7NlTTRGBro8JTs3lq5nzTFCrN0TUeTW1X8Kd+4aHTp6c7JO9N7GMR
 tZumHvLHupIrPK2wspf7GOvxYglbBrPq7tLCYhbP8MSlULE+AQJOrbeU3t4WcAJrxBaB
 vV7g==
X-Gm-Message-State: ACrzQf3j+1dS4pKTDP9n8I91PvL/uodwC6duWUy3oiJHoG5UkYKwKRhK
 I80wHmC5CJ0aG+YDOcvw8qW1ZVz7uMy3K1enjLkdPA==
X-Google-Smtp-Source: AMsMyM7sr3h7oQemK/dOL+YtBSU21PIPjg5e9KcVS4lXt6tQt+i3ydRApB3/QcxDIS2D9ndM4Qe96lBxOkubafTa0gs=
X-Received: by 2002:a2e:b5af:0:b0:26f:d634:2f0d with SMTP id
 f15-20020a2eb5af000000b0026fd6342f0dmr3852031ljn.33.1665996247476; Mon, 17
 Oct 2022 01:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
 <20221014084837.1787196-4-hrkanabar@gmail.com>
 <5bc906b3-ccb5-a385-fcb6-fc51c8fea3fd@suse.com>
In-Reply-To: <5bc906b3-ccb5-a385-fcb6-fc51c8fea3fd@suse.com>
Date: Mon, 17 Oct 2022 10:43:55 +0200
Message-ID: <CACT4Y+YeSOZPN+ek6vSLhsCugJ3iGF35-sghnZt4qQJ36DA6mA@mail.gmail.com>
To: Qu Wenruo <wqu@suse.com>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 14 Oct 2022 at 12:24,
 'Qu Wenruo' via kasan-dev <kasan-dev@googlegroups.com>
 wrote: > > On 2022/10/14 16:48, Hrutvik Kanabar wrote: > > From: Hrutvik
 Kanabar <hrutvik@google.com> > > > > When [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.169 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1okLjJ-0002Zo-Qy
Subject: Re: [f2fs-dev] [PATCH RFC 3/7] fs/btrfs: support
 `DISABLE_FS_CSUM_VERIFICATION` config option
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
From: Dmitry Vyukov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Cc: "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Hrutvik Kanabar <hrutvik@google.com>, kasan-dev@googlegroups.com,
 Hrutvik Kanabar <hrkanabar@gmail.com>, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Marco Elver <elver@google.com>,
 Josef Bacik <josef@toxicpanda.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Anton Altaparmakov <anton@tuxera.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Aleksandr Nogikh <nogikh@google.com>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 14 Oct 2022 at 12:24, 'Qu Wenruo' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On 2022/10/14 16:48, Hrutvik Kanabar wrote:
> > From: Hrutvik Kanabar <hrutvik@google.com>
> >
> > When `DISABLE_FS_CSUM_VERIFICATION` is enabled, bypass checksum
> > verification.
> >
> > Signed-off-by: Hrutvik Kanabar <hrutvik@google.com>
>
> I always want more fuzz for btrfs, so overall this is pretty good.
>
> But there are some comments related to free space cache part.
>
> Despite the details, I'm wondering would it be possible for your fuzzing
> tool to do a better job at user space? Other than relying on loosen
> checks from kernel?
>
> For example, implement a (mostly) read-only tool to do the following
> workload:
>
> - Open the fs
>    Including understand the checksum algo, how to re-generate the csum.
>
> - Read out the used space bitmap
>    In btrfs case, it's going to read the extent tree, process the
>    backrefs items.
>
> - Choose the victim sectors and corrupt them
>    Obviously, vitims should be choosen from above used space bitmap.
>
> - Re-calculate the checksum for above corrupted sectors
>    For btrfs, if it's a corrupted metadata, re-calculate the checksum.
>
> By this, we can avoid such change to kernel, and still get a much better
> coverage.
>
> If you need some help on such user space tool, I'm pretty happy to
> provide help.
>
> > ---
> >   fs/btrfs/check-integrity.c  | 3 ++-
> >   fs/btrfs/disk-io.c          | 6 ++++--
> >   fs/btrfs/free-space-cache.c | 3 ++-
> >   fs/btrfs/inode.c            | 3 ++-
> >   fs/btrfs/scrub.c            | 9 ++++++---
> >   5 files changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/fs/btrfs/check-integrity.c b/fs/btrfs/check-integrity.c
> > index 98c6e5feab19..eab82593a325 100644
> > --- a/fs/btrfs/check-integrity.c
> > +++ b/fs/btrfs/check-integrity.c
> > @@ -1671,7 +1671,8 @@ static noinline_for_stack int btrfsic_test_for_metadata(
> >               crypto_shash_update(shash, data, sublen);
> >       }
> >       crypto_shash_final(shash, csum);
> > -     if (memcmp(csum, h->csum, fs_info->csum_size))
> > +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
> > +         memcmp(csum, h->csum, fs_info->csum_size))
> >               return 1;
> >
> >       return 0; /* is metadata */
> > diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
> > index a2da9313c694..7cd909d44b24 100644
> > --- a/fs/btrfs/disk-io.c
> > +++ b/fs/btrfs/disk-io.c
> > @@ -184,7 +184,8 @@ static int btrfs_check_super_csum(struct btrfs_fs_info *fs_info,
> >       crypto_shash_digest(shash, raw_disk_sb + BTRFS_CSUM_SIZE,
> >                           BTRFS_SUPER_INFO_SIZE - BTRFS_CSUM_SIZE, result);
> >
> > -     if (memcmp(disk_sb->csum, result, fs_info->csum_size))
> > +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
> > +         memcmp(disk_sb->csum, result, fs_info->csum_size))
> >               return 1;
> >
> >       return 0;
> > @@ -494,7 +495,8 @@ static int validate_extent_buffer(struct extent_buffer *eb)
> >       header_csum = page_address(eb->pages[0]) +
> >               get_eb_offset_in_page(eb, offsetof(struct btrfs_header, csum));
> >
> > -     if (memcmp(result, header_csum, csum_size) != 0) {
> > +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
> > +         memcmp(result, header_csum, csum_size) != 0) {
>
> I believe this is the main thing fuzzing would take advantage of.
>
> It would be much better if this is the only override...
>
> >               btrfs_warn_rl(fs_info,
> >   "checksum verify failed on logical %llu mirror %u wanted " CSUM_FMT " found " CSUM_FMT " level %d",
> >                             eb->start, eb->read_mirror,
> > diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
> > index f4023651dd68..203c8a9076a6 100644
> > --- a/fs/btrfs/free-space-cache.c
> > +++ b/fs/btrfs/free-space-cache.c
> > @@ -574,7 +574,8 @@ static int io_ctl_check_crc(struct btrfs_io_ctl *io_ctl, int index)
> >       io_ctl_map_page(io_ctl, 0);
> >       crc = btrfs_crc32c(crc, io_ctl->orig + offset, PAGE_SIZE - offset);
> >       btrfs_crc32c_final(crc, (u8 *)&crc);
> > -     if (val != crc) {
> > +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
> > +         val != crc) {
>
> I'm already seeing this to cause problems, especially for btrfs.
>
> Btrfs has a very strong dependency on free space tracing, as all of our
> metadata (and data by default) relies on COW to keep the fs consistent.
>
> I tried a lot of different methods in the past to make sure we won't
> write into previously used space, but it's causing a lot of performance
> impact.
>
> Unlike tree-checker, we can not easily got a centerlized space to handle
> all the free space cross-check thing (thus it's only verified by things
> like btrfs-check).
>
> Furthermore, even if you skip this override, with latest default
> free-space-tree feature, free space info is stored in regular btrfs
> metadata (tree blocks), with regular metadata checksum protection.
>
> Thus I'm pretty sure we will have tons of reports on this, and
> unfortunately we can only go whac-a-mole way for it.

Hi Qu,

I don't fully understand what you mean. Could you please elaborate?

Do you mean that btrfs uses this checksum check to detect blocks that
were written to w/o updating the checksum?




> >               btrfs_err_rl(io_ctl->fs_info,
> >                       "csum mismatch on free space cache");
> >               io_ctl_unmap_page(io_ctl);
> > diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> > index b0807c59e321..1a49d897b5c1 100644
> > --- a/fs/btrfs/inode.c
> > +++ b/fs/btrfs/inode.c
> > @@ -3434,7 +3434,8 @@ int btrfs_check_sector_csum(struct btrfs_fs_info *fs_info, struct page *page,
> >       crypto_shash_digest(shash, kaddr, fs_info->sectorsize, csum);
> >       kunmap_local(kaddr);
> >
> > -     if (memcmp(csum, csum_expected, fs_info->csum_size))
> > +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
> > +         memcmp(csum, csum_expected, fs_info->csum_size))
>
> This skips data csum check, I don't know how valueable it is, but this
> should be harmless mostly.
>
> If we got reports related to this, it would be a nice surprise.
>
> >               return -EIO;
> >       return 0;
> >   }
> > diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
> > index f260c53829e5..a7607b492f47 100644
> > --- a/fs/btrfs/scrub.c
> > +++ b/fs/btrfs/scrub.c
> > @@ -1997,7 +1997,8 @@ static int scrub_checksum_data(struct scrub_block *sblock)
> >
> >       crypto_shash_digest(shash, kaddr, fs_info->sectorsize, csum);
> >
> > -     if (memcmp(csum, sector->csum, fs_info->csum_size))
> > +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
> > +         memcmp(csum, sector->csum, fs_info->csum_size))
>
> Same as data csum verification overide.
> Not necessary/useful but good to have.
>
> >               sblock->checksum_error = 1;
> >       return sblock->checksum_error;
> >   }
> > @@ -2062,7 +2063,8 @@ static int scrub_checksum_tree_block(struct scrub_block *sblock)
> >       }
> >
> >       crypto_shash_final(shash, calculated_csum);
> > -     if (memcmp(calculated_csum, on_disk_csum, sctx->fs_info->csum_size))
> > +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
> > +         memcmp(calculated_csum, on_disk_csum, sctx->fs_info->csum_size))
>
> This is much less valueable, since it's only affecting scrub, and scrub
> itself is already very little checking the content of metadata.

Could you please elaborate here as well?
This is less valuable from what perspective?
The data loaded from disk can have any combination of
(correct/incorrect metadata) x (correct/incorrect checksum).
Correctness of metadata and checksum are effectively orthogonal,
right?



> Thanks,
> Qu
>
> >               sblock->checksum_error = 1;
> >
> >       return sblock->header_error || sblock->checksum_error;
> > @@ -2099,7 +2101,8 @@ static int scrub_checksum_super(struct scrub_block *sblock)
> >       crypto_shash_digest(shash, kaddr + BTRFS_CSUM_SIZE,
> >                       BTRFS_SUPER_INFO_SIZE - BTRFS_CSUM_SIZE, calculated_csum);
> >
> > -     if (memcmp(calculated_csum, s->csum, sctx->fs_info->csum_size))
> > +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
> > +         memcmp(calculated_csum, s->csum, sctx->fs_info->csum_size))
> >               ++fail_cor;
> >
> >       return fail_cor + fail_gen;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

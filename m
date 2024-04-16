Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36D8A71B3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 18:52:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwm2R-0006jX-1i;
	Tue, 16 Apr 2024 16:52:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rwm2P-0006jP-Cu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 16:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o3NK4ApjrVejbGdhUa2m6FSs14iQcVlP0qT22q+Np74=; b=j9h2pb3oWRr4rVA1hvGKKSMwSW
 M0Paw1WDKqqXtrr9MTOSkZ6fSm+jmwqSMYApcZyHFxnBLs1geerVxXs3HuaMbsJnYFSMB7IDyiGnT
 D0/i9TLtbCET+B/iJmeFSuPDqI79966E0hwJJX5V/nK44E0PZcX8A6TibRT4jpHo+WDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o3NK4ApjrVejbGdhUa2m6FSs14iQcVlP0qT22q+Np74=; b=LJbmjrqhgnVDkJLsE/oa8WDMsn
 sGObYPqGMiMVCliYTG9H2d+IEP5C/MdzabGB2iNO+sMy0mKJpxK0LAomvI6k3jr/WfLNrRZVivsR+
 i087e1UhWQ6rlTkPM1SvD6UlKR64py0jx5Chg/CNJQlHbpJQDZvLWPTa1nhupxeZdWpk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rwm2O-0006oZ-EP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 16:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D7F3161135
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 16:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53097C113CE;
 Tue, 16 Apr 2024 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713286318;
 bh=zsJUJUHsUii8pk3VPP4/T8lQBZVw2zTFN2rO4MceCCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TCExYtqiRiPix/+v3Qt62/DvyXI4I92QuMJH21WNqRrqzFHAnRJHS55VCgBlIrPc/
 jTVKoZTsWAqv3kVZ+J0NLGEvwUVa0ultnjOQAYVadiJuJjednwRjKqCFevrdHKbB4A
 3UdbCiKj5N1cSYbW1EK5vpNicn2RpVAh/6fkwHROuzlEWNCZnnSo2Yz0zj4kNp06cM
 ewamrJJ9+2VThOZZn/j+dFyyC/OWMk5oonCVPvEq028Gm3m/rP5uNlVSVLAV0stZJl
 0k8vmmtnEAUdBZf0MX3075nDEG41Xmx2w+Hj4st+5ST0PybXNVx3JEQHt63ucsTvl2
 08EfATKQHaMZw==
Date: Tue, 16 Apr 2024 16:51:56 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Zh6srBQx6era9vA7@google.com>
References: <20240407135848.3638669-1-chao@kernel.org>
 <Zhmje71C7FOTIfom@google.com>
 <2ca3cb91-1db5-4a9b-9dd0-8caad2d09f31@kernel.org>
 <Zhvz-_pqlCEZrUHB@google.com>
 <2dee7da9-e65d-47c0-a7f5-2e952e4aa784@kernel.org>
 <36c2974c-8a4a-4da0-b497-aef4c9647f94@kernel.org>
 <ca038b66-7dc0-4315-807d-bd1dc9cc281b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca038b66-7dc0-4315-807d-bd1dc9cc281b@kernel.org>
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/16, Chao Yu wrote: > On 2024/4/15 22:01, Chao Yu wrote:
 > > On 2024/4/15 11:26, Chao Yu wrote: > > > On 2024/4/14 23:19, Jaegeuk
 Kim wrote: > > > > It seems this caused kernel hang. Chao, have y [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rwm2O-0006oZ-EP
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: zone: don't block IO if there is
 remained open zone
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/16, Chao Yu wrote:
> On 2024/4/15 22:01, Chao Yu wrote:
> > On 2024/4/15 11:26, Chao Yu wrote:
> > > On 2024/4/14 23:19, Jaegeuk Kim wrote:
> > > > It seems this caused kernel hang. Chao, have you tested this patch =
enough?
> > > =

> > > Jaegeuk,
> > > =

> > > Oh, I've checked this patch w/ fsstress before submitting it, but mis=
sed
> > > the SPO testcase... do you encounter kernel hang w/ SPO testcase?
> > =

> > I did see any hang issue w/ por_fsstress testcase, which testcase do yo=
u use?
> =

> Sorry, I mean I haven't reproduced it yet...

I'd prefer to check this patch later. Have you tested on Zoned device with
nullblk?

> =

> Thanks,
> =

> > =

> > Thanks,
> > =

> > > =

> > > Anyway, let me test it more.
> > > =

> > > Thanks,
> > > =

> > > > =

> > > > On 04/13, Chao Yu wrote:
> > > > > On 2024/4/13 5:11, Jaegeuk Kim wrote:
> > > > > > On 04/07, Chao Yu wrote:
> > > > > > > max open zone may be larger than log header number of f2fs, f=
or
> > > > > > > such case, it doesn't need to wait last IO in previous zone, =
let's
> > > > > > > introduce available_open_zone semaphore, and reduce it once we
> > > > > > > submit first write IO in a zone, and increase it after comple=
tion
> > > > > > > of last IO in the zone.
> > > > > > > =

> > > > > > > Cc: Daeho Jeong <daeho43@gmail.com>
> > > > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > > > ---
> > > > > > > v3:
> > > > > > > - avoid race condition in between __submit_merged_bio()
> > > > > > > and __allocate_new_segment().
> > > > > > > =A0=A0 fs/f2fs/data.c=A0=A0=A0 | 105 ++++++++++++++++++++++++=
++++++----------------
> > > > > > > =A0=A0 fs/f2fs/f2fs.h=A0=A0=A0 |=A0 34 ++++++++++++---
> > > > > > > =A0=A0 fs/f2fs/iostat.c=A0 |=A0=A0 7 ++++
> > > > > > > =A0=A0 fs/f2fs/iostat.h=A0 |=A0=A0 2 +
> > > > > > > =A0=A0 fs/f2fs/segment.c |=A0 43 ++++++++++++++++---
> > > > > > > =A0=A0 fs/f2fs/segment.h |=A0 12 +++++-
> > > > > > > =A0=A0 fs/f2fs/super.c=A0=A0 |=A0=A0 2 +
> > > > > > > =A0=A0 7 files changed, 156 insertions(+), 49 deletions(-)
> > > > > > > =

> > > > > > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > > > > > index 0d88649c60a5..18a4ac0a06bc 100644
> > > > > > > --- a/fs/f2fs/data.c
> > > > > > > +++ b/fs/f2fs/data.c
> > > > > > > @@ -373,11 +373,10 @@ static void f2fs_write_end_io(struct bi=
o *bio)
> > > > > > > =A0=A0 #ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > =A0=A0 static void f2fs_zone_write_end_io(struct bio *bio)
> > > > > > > =A0=A0 {
> > > > > > > -=A0=A0=A0 struct f2fs_bio_info *io =3D (struct f2fs_bio_info=
 *)bio->bi_private;
> > > > > > > +=A0=A0=A0 struct f2fs_sb_info *sbi =3D iostat_get_bio_privat=
e(bio);
> > > > > > > -=A0=A0=A0 bio->bi_private =3D io->bi_private;
> > > > > > > -=A0=A0=A0 complete(&io->zone_wait);
> > > > > > > =A0=A0=A0=A0=A0=A0 f2fs_write_end_io(bio);
> > > > > > > +=A0=A0=A0 up(&sbi->available_open_zones);
> > > > > > > =A0=A0 }
> > > > > > > =A0=A0 #endif
> > > > > > > @@ -531,6 +530,24 @@ static void __submit_merged_bio(struct f=
2fs_bio_info *io)
> > > > > > > =A0=A0=A0=A0=A0=A0 if (!io->bio)
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > > +#ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > +=A0=A0=A0 if (io->open_zone) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 /*
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0 * if there is no open zone, it will=
 wait for last IO in
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0 * previous zone before submitting n=
ew IO.
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 down(&fio->sbi->available_open_zones);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 io->open_zone =3D false;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 io->zone_openned =3D true;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +
> > > > > > > +=A0=A0=A0 if (io->close_zone) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 io->bio->bi_end_io =3D f2fs_zone_write=
_end_io;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 io->zone_openned =3D false;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 io->close_zone =3D false;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +#endif
> > > > > > > +
> > > > > > > =A0=A0=A0=A0=A0=A0 if (is_read_io(fio->op)) {
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 trace_f2fs_prepare_read_bio(io=
->sbi->sb, fio->type, io->bio);
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_submit_read_bio(io->sbi, =
io->bio, fio->type);
> > > > > > > @@ -601,9 +618,9 @@ int f2fs_init_write_merge_io(struct f2fs_=
sb_info *sbi)
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 INIT_LIST_HEAD(&sb=
i->write_io[i][j].bio_list);
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 init_f2fs_rwsem(&s=
bi->write_io[i][j].bio_list_lock);
> > > > > > > =A0=A0 #ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 init_completion(&sbi->writ=
e_io[i][j].zone_wait);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sbi->write_io[i][j].zone_p=
ending_bio =3D NULL;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sbi->write_io[i][j].bi_pri=
vate =3D NULL;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sbi->write_io[i][j].open_z=
one =3D false;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sbi->write_io[i][j].zone_o=
penned =3D false;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sbi->write_io[i][j].close_=
zone =3D false;
> > > > > > > =A0=A0 #endif
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > =A0=A0=A0=A0=A0=A0 }
> > > > > > > @@ -634,6 +651,31 @@ static void __f2fs_submit_merged_write(s=
truct f2fs_sb_info *sbi,
> > > > > > > =A0=A0=A0=A0=A0=A0 f2fs_up_write(&io->io_rwsem);
> > > > > > > =A0=A0 }
> > > > > > > +void f2fs_blkzoned_submit_merged_write(struct f2fs_sb_info *=
sbi, int type)
> > > > > > > +{
> > > > > > > +#ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > +=A0=A0=A0 struct f2fs_bio_info *io;
> > > > > > > +
> > > > > > > +=A0=A0=A0 if (!f2fs_sb_has_blkzoned(sbi))
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > > +
> > > > > > > +=A0=A0=A0 io =3D sbi->write_io[PAGE_TYPE(type)] + type_to_te=
mp(type);
> > > > > > > +
> > > > > > > +=A0=A0=A0 f2fs_down_write(&io->io_rwsem);
> > > > > > > +=A0=A0=A0 if (io->zone_openned) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (io->bio) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 io->close_zone =3D true;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __submit_merged_bio(io);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 } else if (io->zone_openned) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 up(&sbi->available_open_zo=
nes);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 io->zone_openned =3D false;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > +=A0=A0=A0 }
> > > > > > > +=A0=A0=A0 f2fs_up_write(&io->io_rwsem);
> > > > > > > +#endif
> > > > > > > +
> > > > > > > +}
> > > > > > > +
> > > > > > > =A0=A0 static void __submit_merged_write_cond(struct f2fs_sb_=
info *sbi,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct=
 inode *inode, struct page *page,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nid_t =
ino, enum page_type type, bool force)
> > > > > > > @@ -918,22 +960,16 @@ int f2fs_merge_page_bio(struct f2fs_io_=
info *fio)
> > > > > > > =A0=A0 }
> > > > > > > =A0=A0 #ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > -static bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, bl=
ock_t blkaddr)
> > > > > > > +static bool is_blkaddr_zone_boundary(struct f2fs_sb_info *sb=
i,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bl=
ock_t blkaddr, bool start)
> > > > > > > =A0=A0 {
> > > > > > > -=A0=A0=A0 int devi =3D 0;
> > > > > > > +=A0=A0=A0 if (!f2fs_blkaddr_in_seqzone(sbi, blkaddr))
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > > +
> > > > > > > +=A0=A0=A0 if (start)
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return (blkaddr % sbi->blocks_per_blkz=
) =3D=3D 0;
> > > > > > > +=A0=A0=A0 return (blkaddr % sbi->blocks_per_blkz =3D=3D sbi-=
>blocks_per_blkz - 1);
> > > > > > > -=A0=A0=A0 if (f2fs_is_multi_device(sbi)) {
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 devi =3D f2fs_target_device_index(sbi,=
 blkaddr);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (blkaddr < FDEV(devi).start_blk ||
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 blkaddr > FDEV(devi).end_b=
lk) {
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_err(sbi, "Invalid blo=
ck %x", blkaddr);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 blkaddr -=3D FDEV(devi).start_blk;
> > > > > > > -=A0=A0=A0 }
> > > > > > > -=A0=A0=A0 return bdev_is_zoned(FDEV(devi).bdev) &&
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 f2fs_blkz_is_seq(sbi, devi, blkaddr) &&
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 (blkaddr % sbi->blocks_per_blkz =3D=3D=
 sbi->blocks_per_blkz - 1);
> > > > > > > =A0=A0 }
> > > > > > > =A0=A0 #endif
> > > > > > > @@ -944,20 +980,14 @@ void f2fs_submit_page_write(struct f2fs=
_io_info *fio)
> > > > > > > =A0=A0=A0=A0=A0=A0 struct f2fs_bio_info *io =3D sbi->write_io=
[btype] + fio->temp;
> > > > > > > =A0=A0=A0=A0=A0=A0 struct page *bio_page;
> > > > > > > =A0=A0=A0=A0=A0=A0 enum count_type type;
> > > > > > > +#ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > +=A0=A0=A0 bool blkzoned =3D f2fs_sb_has_blkzoned(sbi) && bty=
pe < META;
> > > > > > > +#endif
> > > > > > > =A0=A0=A0=A0=A0=A0 f2fs_bug_on(sbi, is_read_io(fio->op));
> > > > > > > =A0=A0=A0=A0=A0=A0 f2fs_down_write(&io->io_rwsem);
> > > > > > > =A0=A0 next:
> > > > > > > -#ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > -=A0=A0=A0 if (f2fs_sb_has_blkzoned(sbi) && btype < META && i=
o->zone_pending_bio) {
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 wait_for_completion_io(&io->zone_wait);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 bio_put(io->zone_pending_bio);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 io->zone_pending_bio =3D NULL;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 io->bi_private =3D NULL;
> > > > > > > -=A0=A0=A0 }
> > > > > > > -#endif
> > > > > > > -
> > > > > > > =A0=A0=A0=A0=A0=A0 if (fio->in_list) {
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_lock(&io->io_lock);
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (list_empty(&io->io_list)) {
> > > > > > > @@ -985,6 +1015,11 @@ void f2fs_submit_page_write(struct f2fs=
_io_info *fio)
> > > > > > > =A0=A0=A0=A0=A0=A0 type =3D WB_DATA_TYPE(bio_page, fio->compr=
essed_page);
> > > > > > > =A0=A0=A0=A0=A0=A0 inc_page_count(sbi, type);
> > > > > > > +#ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > +=A0=A0=A0 if (blkzoned && is_blkaddr_zone_boundary(sbi, fio-=
>new_blkaddr, true))
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 io->open_zone =3D true;
> > > > > > > +#endif
> > > > > > > +
> > > > > > > =A0=A0=A0=A0=A0=A0 if (io->bio &&
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (!io_is_mergeable(sbi, io->bio=
, io, fio, io->last_block_in_bio,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
fio->new_blkaddr) ||
> > > > > > > @@ -1010,15 +1045,11 @@ void f2fs_submit_page_write(struct f2=
fs_io_info *fio)
> > > > > > > =A0=A0=A0=A0=A0=A0 io->last_block_in_bio =3D fio->new_blkaddr;
> > > > > > > =A0=A0=A0=A0=A0=A0 trace_f2fs_submit_page_write(fio->page, fi=
o);
> > > > > > > +
> > > > > > > =A0=A0 #ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > -=A0=A0=A0 if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 is_end_zone_blkaddr(sbi, f=
io->new_blkaddr)) {
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 bio_get(io->bio);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 reinit_completion(&io->zone_wait);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 io->bi_private =3D io->bio->bi_private;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 io->bio->bi_private =3D io;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 io->bio->bi_end_io =3D f2fs_zone_write=
_end_io;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 io->zone_pending_bio =3D io->bio;
> > > > > > > +=A0=A0=A0 if (blkzoned &&
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 is_blkaddr_zone_boundary(sbi, fio->new=
_blkaddr, false)) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 io->close_zone =3D true;
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __submit_merged_bio(io);
> > > > > > > =A0=A0=A0=A0=A0=A0 }
> > > > > > > =A0=A0 #endif
> > > > > > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > > > > index 694f8a52cb84..8a26530cf4fb 100644
> > > > > > > --- a/fs/f2fs/f2fs.h
> > > > > > > +++ b/fs/f2fs/f2fs.h
> > > > > > > @@ -1234,16 +1234,16 @@ struct f2fs_bio_info {
> > > > > > > =A0=A0=A0=A0=A0=A0 struct bio *bio;=A0=A0=A0=A0=A0=A0=A0 /* b=
ios to merge */
> > > > > > > =A0=A0=A0=A0=A0=A0 sector_t last_block_in_bio;=A0=A0=A0 /* la=
st block number */
> > > > > > > =A0=A0=A0=A0=A0=A0 struct f2fs_io_info fio;=A0=A0=A0 /* store=
 buffered io info. */
> > > > > > > -#ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > -=A0=A0=A0 struct completion zone_wait;=A0=A0=A0 /* condition=
 value for the previous open zone to close */
> > > > > > > -=A0=A0=A0 struct bio *zone_pending_bio;=A0=A0=A0 /* pending =
bio for the previous zone */
> > > > > > > -=A0=A0=A0 void *bi_private;=A0=A0=A0=A0=A0=A0=A0 /* previous=
 bi_private for pending bio */
> > > > > > > -#endif
> > > > > > > =A0=A0=A0=A0=A0=A0 struct f2fs_rwsem io_rwsem;=A0=A0=A0 /* bl=
ocking op for bio */
> > > > > > > =A0=A0=A0=A0=A0=A0 spinlock_t io_lock;=A0=A0=A0=A0=A0=A0=A0 /=
* serialize DATA/NODE IOs */
> > > > > > > =A0=A0=A0=A0=A0=A0 struct list_head io_list;=A0=A0=A0 /* trac=
k fios */
> > > > > > > =A0=A0=A0=A0=A0=A0 struct list_head bio_list;=A0=A0=A0 /* bio=
 entry list head */
> > > > > > > =A0=A0=A0=A0=A0=A0 struct f2fs_rwsem bio_list_lock;=A0=A0=A0 =
/* lock to protect bio entry list */
> > > > > > > +#ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > +=A0=A0=A0 bool open_zone;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /=
* open a zone */
> > > > > > > +=A0=A0=A0 bool zone_openned;=A0=A0=A0=A0=A0=A0=A0 /* zone ha=
s been openned */
> > > > > > > +=A0=A0=A0 bool close_zone;=A0=A0=A0=A0=A0=A0=A0 /* close a z=
one */
> > > > > > > +#endif
> > > > > > > =A0=A0 };
> > > > > > > =A0=A0 #define FDEV(i)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 (sbi->devs[i])
> > > > > > > @@ -1560,6 +1560,7 @@ struct f2fs_sb_info {
> > > > > > > =A0=A0 #ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > =A0=A0=A0=A0=A0=A0 unsigned int blocks_per_blkz;=A0=A0=A0=A0=
=A0=A0=A0 /* F2FS blocks per zone */
> > > > > > > =A0=A0=A0=A0=A0=A0 unsigned int max_open_zones;=A0=A0=A0=A0=
=A0=A0=A0 /* max open zone resources of the zoned device */
> > > > > > > +=A0=A0=A0 struct semaphore available_open_zones;=A0=A0=A0 /*=
 available open zones */
> > > > > > > =A0=A0 #endif
> > > > > > > =A0=A0=A0=A0=A0=A0 /* for node-related operations */
> > > > > > > @@ -3822,6 +3823,7 @@ void f2fs_destroy_bio_entry_cache(void);
> > > > > > > =A0=A0 void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, st=
ruct bio *bio,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum page_ty=
pe type);
> > > > > > > =A0=A0 int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi);
> > > > > > > +void f2fs_blkzoned_submit_merged_write(struct f2fs_sb_info *=
sbi, int type);
> > > > > > > =A0=A0 void f2fs_submit_merged_write(struct f2fs_sb_info *sbi=
, enum page_type type);
> > > > > > > =A0=A0 void f2fs_submit_merged_write_cond(struct f2fs_sb_info=
 *sbi,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct=
 inode *inode, struct page *page,
> > > > > > > @@ -4469,6 +4471,28 @@ static inline bool f2fs_blkz_is_seq(st=
ruct f2fs_sb_info *sbi, int devi,
> > > > > > > =A0=A0=A0=A0=A0=A0 return test_bit(zno, FDEV(devi).blkz_seq);
> > > > > > > =A0=A0 }
> > > > > > > +
> > > > > > > +static inline bool f2fs_blkaddr_in_seqzone(struct f2fs_sb_in=
fo *sbi,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 block_t blkaddr)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 int devi =3D 0;
> > > > > > > +
> > > > > > > +=A0=A0=A0 if (f2fs_is_multi_device(sbi)) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 devi =3D f2fs_target_device_index(sbi,=
 blkaddr);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (blkaddr < FDEV(devi).start_blk ||
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 blkaddr > FDEV(devi).end_b=
lk) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_err(sbi, "Invalid blo=
ck %x", blkaddr);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 blkaddr -=3D FDEV(devi).start_blk;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +
> > > > > > > +=A0=A0=A0 if (!bdev_is_zoned(FDEV(devi).bdev) ||
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 !f2fs_blkz_is_seq(sbi, devi, blkaddr))
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > > +
> > > > > > > +=A0=A0=A0 return true;
> > > > > > =

> > > > > > Applied as below.
> > > > > > =

> > > > > > @@ -4485,11 +4485,8 @@ static inline bool f2fs_blkaddr_in_seqzo=
ne(struct f2fs_sb_info *sbi,
> > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 blkaddr -=
=3D FDEV(devi).start_blk;
> > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > =

> > > > > > -=A0=A0=A0=A0=A0=A0 if (!bdev_is_zoned(FDEV(devi).bdev) ||
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !f2fs_blkz_is_seq(s=
bi, devi, blkaddr))
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0 return true;
> > > > > > +=A0=A0=A0=A0=A0=A0 return bdev_is_zoned(FDEV(devi).bdev) &&
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_blkz_is_seq(sb=
i, devi, blkaddr);
> > > > > =

> > > > > Looks good, thank you for cleanup.
> > > > > =

> > > > > Thanks,
> > > > > =

> > > > > > =A0=A0 }
> > > > > > =A0=A0 #endif
> > > > > > =

> > > > > > > +}
> > > > > > > =A0=A0 #endif
> > > > > > > =A0=A0 static inline int f2fs_bdev_index(struct f2fs_sb_info =
*sbi,
> > > > > > > diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
> > > > > > > index f8703038e1d8..a8626e297876 100644
> > > > > > > --- a/fs/f2fs/iostat.c
> > > > > > > +++ b/fs/f2fs/iostat.c
> > > > > > > @@ -237,6 +237,13 @@ static inline void __update_iostat_laten=
cy(struct bio_iostat_ctx *iostat_ctx,
> > > > > > > =A0=A0=A0=A0=A0=A0 spin_unlock_irqrestore(&sbi->iostat_lat_lo=
ck, flags);
> > > > > > > =A0=A0 }
> > > > > > > +void *iostat_get_bio_private(struct bio *bio)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 struct bio_iostat_ctx *iostat_ctx =3D bio->bi_priv=
ate;
> > > > > > > +
> > > > > > > +=A0=A0=A0 return iostat_ctx->sbi;
> > > > > > > +}
> > > > > > > +
> > > > > > > =A0=A0 void iostat_update_and_unbind_ctx(struct bio *bio)
> > > > > > > =A0=A0 {
> > > > > > > =A0=A0=A0=A0=A0=A0 struct bio_iostat_ctx *iostat_ctx =3D bio-=
>bi_private;
> > > > > > > diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
> > > > > > > index eb99d05cf272..9006c3d41590 100644
> > > > > > > --- a/fs/f2fs/iostat.h
> > > > > > > +++ b/fs/f2fs/iostat.h
> > > > > > > @@ -58,6 +58,7 @@ static inline struct bio_post_read_ctx *get=
_post_read_ctx(struct bio *bio)
> > > > > > > =A0=A0=A0=A0=A0=A0 return iostat_ctx->post_read_ctx;
> > > > > > > =A0=A0 }
> > > > > > > +extern void *iostat_get_bio_private(struct bio *bio);
> > > > > > > =A0=A0 extern void iostat_update_and_unbind_ctx(struct bio *b=
io);
> > > > > > > =A0=A0 extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_i=
nfo *sbi,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct bio *bio, struct bio_po=
st_read_ctx *ctx);
> > > > > > > @@ -68,6 +69,7 @@ extern void f2fs_destroy_iostat(struct f2fs=
_sb_info *sbi);
> > > > > > > =A0=A0 #else
> > > > > > > =A0=A0 static inline void f2fs_update_iostat(struct f2fs_sb_i=
nfo *sbi, struct inode *inode,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum iostat_type type, unsigne=
d long long io_bytes) {}
> > > > > > > +static inline void *iostat_get_bio_private(struct bio *bio) =
{ return bio->bi_private; }
> > > > > > > =A0=A0 static inline void iostat_update_and_unbind_ctx(struct=
 bio *bio) {}
> > > > > > > =A0=A0 static inline void iostat_alloc_and_bind_ctx(struct f2=
fs_sb_info *sbi,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct bio *bio, struct bio_po=
st_read_ctx *ctx) {}
> > > > > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > > > > index 4fd76e867e0a..4a3cf2888faf 100644
> > > > > > > --- a/fs/f2fs/segment.c
> > > > > > > +++ b/fs/f2fs/segment.c
> > > > > > > @@ -3140,6 +3140,9 @@ static int __allocate_new_segment(struc=
t f2fs_sb_info *sbi, int type,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return err;
> > > > > > > =A0=A0=A0=A0=A0=A0 stat_inc_seg_type(sbi, curseg);
> > > > > > > =A0=A0=A0=A0=A0=A0 locate_dirty_segment(sbi, old_segno);
> > > > > > > +
> > > > > > > +=A0=A0=A0 f2fs_blkzoned_submit_merged_write(sbi, type);
> > > > > > > +
> > > > > > > =A0=A0=A0=A0=A0=A0 return 0;
> > > > > > > =A0=A0 }
> > > > > > > @@ -3461,12 +3464,7 @@ static int __get_segment_type(struct f=
2fs_io_info *fio)
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_bug_on(fio->sbi, true);
> > > > > > > =A0=A0=A0=A0=A0=A0 }
> > > > > > > -=A0=A0=A0 if (IS_HOT(type))
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 fio->temp =3D HOT;
> > > > > > > -=A0=A0=A0 else if (IS_WARM(type))
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 fio->temp =3D WARM;
> > > > > > > -=A0=A0=A0 else
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 fio->temp =3D COLD;
> > > > > > > +=A0=A0=A0 fio->temp =3D type_to_temp(type);
> > > > > > > =A0=A0=A0=A0=A0=A0 return type;
> > > > > > > =A0=A0 }
> > > > > > > @@ -4132,6 +4130,27 @@ static int restore_curseg_summaries(st=
ruct f2fs_sb_info *sbi)
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > > > > =A0=A0=A0=A0=A0=A0 }
> > > > > > > +#ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > +=A0=A0=A0 if (f2fs_sb_has_blkzoned(sbi)) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 for (type =3D 0; type < NR_PERSISTENT_=
LOG; type++) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct curseg_info *curseg=
 =3D CURSEG_I(sbi, type);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum page_type ptype;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum temp_type temp;
> > > > > > > +
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!(curseg->next_blkoff =
% sbi->blocks_per_blkz))
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > > > > +
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!f2fs_blkaddr_in_seqzo=
ne(sbi,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ST=
ART_BLOCK(sbi, curseg->segno)))
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > > > > +
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ptype =3D PAGE_TYPE(type);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 temp =3D type_to_temp(type=
);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 down(&sbi->available_open_=
zones);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sbi->write_io[ptype][temp]=
.zone_openned =3D true;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > +=A0=A0=A0 }
> > > > > > > +#endif
> > > > > > > =A0=A0=A0=A0=A0=A0 return 0;
> > > > > > > =A0=A0 }
> > > > > > > @@ -5451,6 +5470,18 @@ static void destroy_curseg(struct f2fs=
_sb_info *sbi)
> > > > > > > =A0=A0=A0=A0=A0=A0 for (i =3D 0; i < NR_CURSEG_TYPE; i++) {
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(array[i].sum_blk);
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(array[i].journal);
> > > > > > > +
> > > > > > > +#ifdef CONFIG_BLK_DEV_ZONED
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (f2fs_sb_has_blkzoned(sbi)) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum page_type ptype =3D P=
AGE_TYPE(i);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum temp_type temp =3D ty=
pe_to_temp(i);
> > > > > > > +
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sbi->write_io[ptype][t=
emp].zone_openned) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 up(&sbi->avail=
able_open_zones);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sbi->write_io[=
ptype][temp].zone_openned =3D false;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > +#endif
> > > > > > > =A0=A0=A0=A0=A0=A0 }
> > > > > > > =A0=A0=A0=A0=A0=A0 kfree(array);
> > > > > > > =A0=A0 }
> > > > > > > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > > > > > > index e1c0f418aa11..855978ca869f 100644
> > > > > > > --- a/fs/f2fs/segment.h
> > > > > > > +++ b/fs/f2fs/segment.h
> > > > > > > @@ -24,7 +24,8 @@
> > > > > > > =A0=A0 #define IS_DATASEG(t)=A0=A0=A0 ((t) <=3D CURSEG_COLD_D=
ATA)
> > > > > > > =A0=A0 #define IS_NODESEG(t)=A0=A0=A0 ((t) >=3D CURSEG_HOT_NO=
DE && (t) <=3D CURSEG_COLD_NODE)
> > > > > > > -#define SE_PAGETYPE(se)=A0=A0=A0 ((IS_NODESEG((se)->type) ? =
NODE : DATA))
> > > > > > > +#define PAGE_TYPE(t)=A0=A0=A0 (IS_NODESEG(t) ? NODE : DATA)
> > > > > > > +#define SE_PAGETYPE(se)=A0=A0=A0 (PAGE_TYPE((se)->type))
> > > > > > > =A0=A0 static inline void sanity_check_seg_type(struct f2fs_s=
b_info *sbi,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 unsigned short seg_type)
> > > > > > > @@ -965,3 +966,12 @@ static inline unsigned int first_zoned_s=
egno(struct f2fs_sb_info *sbi)
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return GET_SEGNO(s=
bi, FDEV(devi).start_blk);
> > > > > > > =A0=A0=A0=A0=A0=A0 return 0;
> > > > > > > =A0=A0 }
> > > > > > > +
> > > > > > > +static inline enum temp_type type_to_temp(int type)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 if (IS_HOT(type))
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return HOT;
> > > > > > > +=A0=A0=A0 else if (IS_WARM(type))
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return WARM;
> > > > > > > +=A0=A0=A0 return COLD;
> > > > > > > +}
> > > > > > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > > > > index fdf358c7f808..954baa6c100d 100644
> > > > > > > --- a/fs/f2fs/super.c
> > > > > > > +++ b/fs/f2fs/super.c
> > > > > > > @@ -3893,6 +3893,8 @@ static int init_blkz_info(struct f2fs_s=
b_info *sbi, int devi)
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sbi->m=
ax_open_zones, F2FS_OPTION(sbi).active_logs);
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > +
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 sema_init(&sbi->available_open_zones, =
sbi->max_open_zones);
> > > > > > > =A0=A0=A0=A0=A0=A0 }
> > > > > > > =A0=A0=A0=A0=A0=A0 zone_sectors =3D bdev_zone_sectors(bdev);
> > > > > > > -- =

> > > > > > > 2.40.1
> > > =

> > > =

> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > =

> > =

> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EA1ABA1EB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 May 2025 19:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+X1d6JbJKZ8JZHy5NXPq41e9Nx+FKfRwztqr65xCB1U=; b=U6CtyKDwfQjXqaJwkf2FCCdyCN
	yLSGMuF8tzWKPotCx5+Ro8IfHJPxz8SN9ZQGgpCMmZzKmkASgkON5V4oidp7RI/eQWk4hLP8Zlxgm
	qLqfzQsYDjq3fqjFY95WC7d31Meu9nsrs+AnpC7H1/YWAP7YR3cO9iiksNuiWywCB+Ks=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uFyyD-0006F4-Jt;
	Fri, 16 May 2025 17:35:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uFyyB-0006Ex-Mt
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 May 2025 17:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dmxLVFEVWqWGNeFgsMC/7Qoz6LMTdjW/N+ZC8DjxLNY=; b=gpnZksmjS2GLoWRsvRb+U1l1O4
 CsRYsoPAADF1KYW/cRmtS+tEAkk5sjRiyerXoER7hx4EUoPCvzMxPh+gP7fHSBarBhiTO9fpSUwND
 tu95vCItoIBP5TgkRJKIK0pzNQdF3OvyX93SZQF55RYfGXURhI13nsqLpfXfaWyXnMh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dmxLVFEVWqWGNeFgsMC/7Qoz6LMTdjW/N+ZC8DjxLNY=; b=itkmRPFCahmKJ6w9ctnxLyFxzp
 ED0KKLyKo7UGRq6HEWh8bYP04livDkCFGKM4BAPEKYhBS1vl7xlCsXuqCT6dFiUrFTihz1u4Ehe06
 p06nC2VJmLEYzb3URzKICauOSyhu48JWaIrwsIcMIiqWOjCMbnElOpvA6KnEarLNmSHw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uFyyA-0003YR-IE for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 May 2025 17:35:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AD5B9A4C519;
 Fri, 16 May 2025 17:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FADC4CEE4;
 Fri, 16 May 2025 17:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747416932;
 bh=MPTekxGp1fJB0qA5+SBiPb0jqUXH8X7HX6LExy+cHFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cwvj3VD8e/alOnRN0tnbaGzel+7m032NProVyuNMKgq/8BldGo+Dj0dA4YWfis6Et
 gk5Fbgy9jBeSl6Dn4WFQupbdotDYNPPMlxBH4OvOYr+0bgZP67Gq7ArdPm+yAfoVZe
 QZKLS2Sv0y3LXwPHT9MU3fx6AL2Fhet4gYXRlJH2r1xC5KsZRBgaATEXV08Bx9rEFR
 1hj1Mdjg4OQg5maRuu2Jh77M1HlDBRVI2JqXDTwH9vMVLgCY5Vkm+CwazrOKo5npTa
 cs/+SfnzyxS3xv3wLvcsVpgN7lA0my0+cWHM7sBkhCLnk3NhjlFXukhDoEfYU3Tc0I
 3nTTyVzWUaQNw==
Date: Fri, 16 May 2025 17:35:30 +0000
To: Hongbo Li <lihongbo22@huawei.com>
Message-ID: <aCd3YoPS_wm2dcff@google.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-8-sandeen@redhat.com>
 <ff2c9a74-f359-4bcc-9792-46af946c70ad@kernel.org>
 <63d1977d-2f0b-4c58-9867-0dc1285815a0@huawei.com>
 <979015aa-433d-4057-a454-afaea2c68131@kernel.org>
 <2ea178cb-1ed3-40ba-8dc6-8fa3bff06850@huawei.com>
 <aCS3LZ3IOMgiissx@google.com>
 <ceeb4951-ee88-4cae-b20a-8c06edf2bfc3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ceeb4951-ee88-4cae-b20a-8c06edf2bfc3@huawei.com>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/16, Hongbo Li wrote: > > > On 2025/5/14 23:30, Jaegeuk
 Kim wrote: > > Hi, Hongbo, > > > > It seems we're getting more issues in
 the patch set. May I ask for some > > help sending the new patch s [...] 
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uFyyA-0003YR-IE
Subject: Re: [f2fs-dev] [PATCH V3 7/7] f2fs: switch to the new mount api
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Eric Sandeen <sandeen@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/16, Hongbo Li wrote:
> =

> =

> On 2025/5/14 23:30, Jaegeuk Kim wrote:
> > Hi, Hongbo,
> > =

> > It seems we're getting more issues in the patch set. May I ask for some
> > help sending the new patch series having all the fixes that I made as w=
ell
> > as addressing the concerns? You can get the patches from [1].
> > =

> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/lo=
g/?h=3Ddev-test
> > =

> =

> Hi, Jaegeuk
> =

> I will discuss these issues with Eric. It may take some time, but not too
> long. When we send the next version, should we resend this patch series
> based on dev-test after modifying the code, only removing your S-O-B?
> (You'll ultimately add your S-O-B back yourself)

Hi Hongbo,

Thank you for this hard work. Could you please resend the entire patch-set =
based
on dev-test w/o my SOB? I'm going to dequeue the series from dev-test. Inst=
ead,
I rebased the latest version onto [2].

Please also consider another report, [1].

[1] https://lore.kernel.org/linux-f2fs-devel/2f16981b-0e13-4c64-83a8-d0e0b4=
297348@suswa.mountain/T/#u
[2] https://github.com/jaegeuk/f2fs/commits/mount/

> =

> Thanks,
> Hongbo
> =

> > On 05/14, Hongbo Li wrote:
> > > =

> > > =

> > > On 2025/5/14 12:03, Chao Yu wrote:
> > > > On 5/14/25 10:33, Hongbo Li wrote:
> > > > > =

> > > > > =

> > > > > On 2025/5/13 16:59, Chao Yu wrote:
> > > > > > On 4/24/25 01:08, Eric Sandeen wrote:
> > > > > > > From: Hongbo Li <lihongbo22@huawei.com>
> > > > > > > =

> > > > > > > The new mount api will execute .parse_param, .init_fs_context=
, .get_tree
> > > > > > > and will call .remount if remount happened. So we add the nec=
essary
> > > > > > > functions for the fs_context_operations. If .init_fs_context =
is added,
> > > > > > > the old .mount should remove.
> > > > > > > =

> > > > > > > See Documentation/filesystems/mount_api.rst for more informat=
ion.
> > > > > > =

> > > > > > mkfs.f2fs -f -O extra_attr,flexible_inline_xattr /dev/vdb
> > > > > > mount -o inline_xattr_size=3D512 /dev/vdb /mnt/f2fs
> > > > > > mount: /mnt/f2fs: wrong fs type, bad option, bad superblock on =
/dev/vdb, missing codepage or helper program, or other error.
> > > > > >   =A0=A0=A0=A0=A0=A0=A0 dmesg(1) may have more information afte=
r failed mount system call.
> > > > > > dmesg
> > > > > > [ 1758.202282] F2FS-fs (vdb): Image doesn't support compression
> > > > > > [ 1758.202286] F2FS-fs (vdb): inline_xattr_size option should b=
e set with inline_xattr option
> > > > > > =

> > > > > > Eric, Hongbo, can you please take a look at this issue?
> > > > > > =

> > > > > Sorry, we only check the option hold in ctx, we should do the dou=
ble check in sbi. Or other elegant approaches.
> > > > > =

> > > > > For the "support compression", is it also the error in this testc=
ase?
> > > > =

> > > > I think so, I checked this w/ additional logs, and found this:
> > > > =

> > > > #define F2FS_MOUNT_INLINE_XATTR_SIZE	0x00080000
> > > > #define F2FS_SPEC_compress_chksum		(1 << 19) /* equal to 0x00080000)
> > > > =

> > > > 	if (!f2fs_sb_has_compression(sbi)) {
> > > > 		if (test_compression_spec(ctx->opt_mask) ||
> > > > 			ctx_test_opt(ctx, F2FS_MOUNT_COMPRESS_CACHE))
> > > > 			f2fs_info(sbi, "Image doesn't support compression");
> > > > 		clear_compression_spec(ctx);
> > > > 		ctx->opt_mask &=3D ~F2FS_MOUNT_COMPRESS_CACHE;
> > > > 		return 0;
> > > > 	}
> > > > =

> > > > We should use test_compression_spec(ctx->spec_mask) instead of
> > > > test_compression_spec(ctx->opt_mask) to check special mask of compr=
ession
> > > > option?
> > > > =

> > > =

> > > Yeah, you're right. test_compression_spec is used to check spec_mask,=
 and we
> > > got it wrong.
> > > =

> > > Thanks,
> > > Hongbo
> > > =

> > > > Thanks,
> > > > =

> > > > > =

> > > > > Thanks,
> > > > > Hongbo
> > > > > =

> > > > > > Thanks,
> > > > > > =

> > > > > > > =

> > > > > > > Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> > > > > > > [sandeen: forward port]
> > > > > > > Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> > > > > > > ---
> > > > > > >   =A0 fs/f2fs/super.c | 156 +++++++++++++++++++--------------=
---------------
> > > > > > >   =A0 1 file changed, 62 insertions(+), 94 deletions(-)
> > > > > > > =

> > > > > > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > > > > index 37497fd80bb9..041bd6c482a0 100644
> > > > > > > --- a/fs/f2fs/super.c
> > > > > > > +++ b/fs/f2fs/super.c
> > > > > > > @@ -1141,47 +1141,6 @@ static int f2fs_parse_param(struct fs_=
context *fc, struct fs_parameter *param)
> > > > > > >   =A0=A0=A0=A0=A0 return 0;
> > > > > > >   =A0 }
> > > > > > >   =A0 -static int parse_options(struct fs_context *fc, char *=
options)
> > > > > > > -{
> > > > > > > -=A0=A0=A0 struct fs_parameter param;
> > > > > > > -=A0=A0=A0 char *key;
> > > > > > > -=A0=A0=A0 int ret;
> > > > > > > -
> > > > > > > -=A0=A0=A0 if (!options)
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 return 0;
> > > > > > > -
> > > > > > > -=A0=A0=A0 while ((key =3D strsep(&options, ",")) !=3D NULL) {
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (*key) {
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 size_t v_len =3D 0;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 char *value =3D strchr(key=
, '=3D');
> > > > > > > -
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.type =3D fs_value_is=
_flag;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.string =3D NULL;
> > > > > > > -
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (value) {
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (value =3D=
=3D key)
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 co=
ntinue;
> > > > > > > -
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *value++ =3D 0;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v_len =3D strl=
en(value);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.string =
=3D kmemdup_nul(value, v_len, GFP_KERNEL);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!param.str=
ing)
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 re=
turn -ENOMEM;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.type =3D=
 fs_value_is_string;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > -
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.key =3D key;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.size =3D v_len;
> > > > > > > -
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D f2fs_parse_param(f=
c, &param);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(param.string);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret < 0)
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > -=A0=A0=A0 }
> > > > > > > -=A0=A0=A0 return 0;
> > > > > > > -}
> > > > > > > -
> > > > > > >   =A0 /*
> > > > > > >   =A0=A0 * Check quota settings consistency.
> > > > > > >   =A0=A0 */
> > > > > > > @@ -2583,13 +2542,12 @@ static void f2fs_enable_checkpoint(st=
ruct f2fs_sb_info *sbi)
> > > > > > >   =A0=A0=A0=A0=A0 f2fs_flush_ckpt_thread(sbi);
> > > > > > >   =A0 }
> > > > > > >   =A0 -static int f2fs_remount(struct super_block *sb, int *f=
lags, char *data)
> > > > > > > +static int __f2fs_remount(struct fs_context *fc, struct supe=
r_block *sb)
> > > > > > >   =A0 {
> > > > > > >   =A0=A0=A0=A0=A0 struct f2fs_sb_info *sbi =3D F2FS_SB(sb);
> > > > > > >   =A0=A0=A0=A0=A0 struct f2fs_mount_info org_mount_opt;
> > > > > > > -=A0=A0=A0 struct f2fs_fs_context ctx;
> > > > > > > -=A0=A0=A0 struct fs_context fc;
> > > > > > >   =A0=A0=A0=A0=A0 unsigned long old_sb_flags;
> > > > > > > +=A0=A0=A0 unsigned int flags =3D fc->sb_flags;
> > > > > > >   =A0=A0=A0=A0=A0 int err;
> > > > > > >   =A0=A0=A0=A0=A0 bool need_restart_gc =3D false, need_stop_g=
c =3D false;
> > > > > > >   =A0=A0=A0=A0=A0 bool need_restart_flush =3D false, need_sto=
p_flush =3D false;
> > > > > > > @@ -2635,7 +2593,7 @@ static int f2fs_remount(struct super_bl=
ock *sb, int *flags, char *data)
> > > > > > >   =A0 #endif
> > > > > > >   =A0 =A0=A0=A0=A0=A0 /* recover superblocks we couldn't writ=
e due to previous RO mount */
> > > > > > > -=A0=A0=A0 if (!(*flags & SB_RDONLY) && is_sbi_flag_set(sbi, =
SBI_NEED_SB_WRITE)) {
> > > > > > > +=A0=A0=A0 if (!(flags & SB_RDONLY) && is_sbi_flag_set(sbi, S=
BI_NEED_SB_WRITE)) {
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D f2fs_commit_super(sbi, =
false);
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_info(sbi, "Try to recover =
all the superblocks, ret: %d",
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 err);
> > > > > > > @@ -2645,21 +2603,11 @@ static int f2fs_remount(struct super_=
block *sb, int *flags, char *data)
> > > > > > >   =A0 =A0=A0=A0=A0=A0 default_options(sbi, true);
> > > > > > >   =A0 -=A0=A0=A0 memset(&fc, 0, sizeof(fc));
> > > > > > > -=A0=A0=A0 memset(&ctx, 0, sizeof(ctx));
> > > > > > > -=A0=A0=A0 fc.fs_private =3D &ctx;
> > > > > > > -=A0=A0=A0 fc.purpose =3D FS_CONTEXT_FOR_RECONFIGURE;
> > > > > > > -
> > > > > > > -=A0=A0=A0 /* parse mount options */
> > > > > > > -=A0=A0=A0 err =3D parse_options(&fc, data);
> > > > > > > -=A0=A0=A0 if (err)
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > > > > -
> > > > > > > -=A0=A0=A0 err =3D f2fs_check_opt_consistency(&fc, sb);
> > > > > > > +=A0=A0=A0 err =3D f2fs_check_opt_consistency(fc, sb);
> > > > > > >   =A0=A0=A0=A0=A0 if (err < 0)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > > > >   =A0 -=A0=A0=A0 f2fs_apply_options(&fc, sb);
> > > > > > > +=A0=A0=A0 f2fs_apply_options(fc, sb);
> > > > > > >   =A0 =A0 #ifdef CONFIG_BLK_DEV_ZONED
> > > > > > >   =A0=A0=A0=A0=A0 if (f2fs_sb_has_blkzoned(sbi) &&
> > > > > > > @@ -2678,20 +2626,20 @@ static int f2fs_remount(struct super_=
block *sb, int *flags, char *data)
> > > > > > >   =A0=A0=A0=A0=A0=A0 * Previous and new state of filesystem i=
s RO,
> > > > > > >   =A0=A0=A0=A0=A0=A0 * so skip checking GC and FLUSH_MERGE co=
nditions.
> > > > > > >   =A0=A0=A0=A0=A0=A0 */
> > > > > > > -=A0=A0=A0 if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
> > > > > > > +=A0=A0=A0 if (f2fs_readonly(sb) && (flags & SB_RDONLY))
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto skip;
> > > > > > >   =A0 -=A0=A0=A0 if (f2fs_dev_is_readonly(sbi) && !(*flags & =
SB_RDONLY)) {
> > > > > > > +=A0=A0=A0 if (f2fs_dev_is_readonly(sbi) && !(flags & SB_RDON=
LY)) {
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D -EROFS;
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > > > >   =A0=A0=A0=A0=A0 }
> > > > > > >   =A0 =A0 #ifdef CONFIG_QUOTA
> > > > > > > -=A0=A0=A0 if (!f2fs_readonly(sb) && (*flags & SB_RDONLY)) {
> > > > > > > +=A0=A0=A0 if (!f2fs_readonly(sb) && (flags & SB_RDONLY)) {
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D dquot_suspend(sb, -1);
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (err < 0)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > > > > -=A0=A0=A0 } else if (f2fs_readonly(sb) && !(*flags & SB_RDON=
LY)) {
> > > > > > > +=A0=A0=A0 } else if (f2fs_readonly(sb) && !(flags & SB_RDONL=
Y)) {
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 /* dquot_resume needs RW */
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 sb->s_flags &=3D ~SB_RDONLY;
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sb_any_quota_suspended(sb))=
 {
> > > > > > > @@ -2747,7 +2695,7 @@ static int f2fs_remount(struct super_bl=
ock *sb, int *flags, char *data)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > > > >   =A0=A0=A0=A0=A0 }
> > > > > > >   =A0 -=A0=A0=A0 if ((*flags & SB_RDONLY) && test_opt(sbi, DI=
SABLE_CHECKPOINT)) {
> > > > > > > +=A0=A0=A0 if ((flags & SB_RDONLY) && test_opt(sbi, DISABLE_C=
HECKPOINT)) {
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D -EINVAL;
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_warn(sbi, "disabling check=
point not compatible with read-only");
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > > > > @@ -2758,7 +2706,7 @@ static int f2fs_remount(struct super_bl=
ock *sb, int *flags, char *data)
> > > > > > >   =A0=A0=A0=A0=A0=A0 * or if background_gc =3D off is passed =
in mount
> > > > > > >   =A0=A0=A0=A0=A0=A0 * option. Also sync the filesystem.
> > > > > > >   =A0=A0=A0=A0=A0=A0 */
> > > > > > > -=A0=A0=A0 if ((*flags & SB_RDONLY) ||
> > > > > > > +=A0=A0=A0 if ((flags & SB_RDONLY) ||
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (F2FS_OPTION(sbi).b=
ggc_mode =3D=3D BGGC_MODE_OFF &&
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !test_opt(sbi, GC_M=
ERGE))) {
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sbi->gc_thread) {
> > > > > > > @@ -2772,7 +2720,7 @@ static int f2fs_remount(struct super_bl=
ock *sb, int *flags, char *data)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 need_stop_gc =3D true;
> > > > > > >   =A0=A0=A0=A0=A0 }
> > > > > > >   =A0 -=A0=A0=A0 if (*flags & SB_RDONLY) {
> > > > > > > +=A0=A0=A0 if (flags & SB_RDONLY) {
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 sync_inodes_sb(sb);
> > > > > > >   =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(sbi, SBI_IS_DI=
RTY);
> > > > > > > @@ -2785,7 +2733,7 @@ static int f2fs_remount(struct super_bl=
ock *sb, int *flags, char *data)
> > > > > > >   =A0=A0=A0=A0=A0=A0 * We stop issue flush thread if FS is mo=
unted as RO
> > > > > > >   =A0=A0=A0=A0=A0=A0 * or if flush_merge is not passed in mou=
nt option.
> > > > > > >   =A0=A0=A0=A0=A0=A0 */
> > > > > > > -=A0=A0=A0 if ((*flags & SB_RDONLY) || !test_opt(sbi, FLUSH_M=
ERGE)) {
> > > > > > > +=A0=A0=A0 if ((flags & SB_RDONLY) || !test_opt(sbi, FLUSH_ME=
RGE)) {
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 clear_opt(sbi, FLUSH_MERGE);
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_destroy_flush_cmd_control(=
sbi, false);
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 need_restart_flush =3D true;
> > > > > > > @@ -2827,7 +2775,7 @@ static int f2fs_remount(struct super_bl=
ock *sb, int *flags, char *data)
> > > > > > >   =A0=A0=A0=A0=A0=A0 * triggered while remount and we need to=
 take care of it before
> > > > > > >   =A0=A0=A0=A0=A0=A0 * returning from remount.
> > > > > > >   =A0=A0=A0=A0=A0=A0 */
> > > > > > > -=A0=A0=A0 if ((*flags & SB_RDONLY) || test_opt(sbi, DISABLE_=
CHECKPOINT) ||
> > > > > > > +=A0=A0=A0 if ((flags & SB_RDONLY) || test_opt(sbi, DISABLE_C=
HECKPOINT) ||
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !test_opt(sbi, MERG=
E_CHECKPOINT)) {
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_stop_ckpt_thread(sbi);
> > > > > > >   =A0=A0=A0=A0=A0 } else {
> > > > > > > @@ -2854,7 +2802,7 @@ static int f2fs_remount(struct super_bl=
ock *sb, int *flags, char *data)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 (test_opt(sbi, POSIX_ACL) ? SB_=
POSIXACL : 0);
> > > > > > >   =A0 =A0=A0=A0=A0=A0 limit_reserve_root(sbi);
> > > > > > > -=A0=A0=A0 *flags =3D (*flags & ~SB_LAZYTIME) | (sb->s_flags =
& SB_LAZYTIME);
> > > > > > > +=A0=A0=A0 fc->sb_flags =3D (flags & ~SB_LAZYTIME) | (sb->s_f=
lags & SB_LAZYTIME);
> > > > > > >   =A0 =A0=A0=A0=A0=A0 sbi->umount_lock_holder =3D NULL;
> > > > > > >   =A0=A0=A0=A0=A0 return 0;
> > > > > > > @@ -3523,7 +3471,6 @@ static const struct super_operations f2=
fs_sops =3D {
> > > > > > >   =A0=A0=A0=A0=A0 .freeze_fs=A0=A0=A0 =3D f2fs_freeze,
> > > > > > >   =A0=A0=A0=A0=A0 .unfreeze_fs=A0=A0=A0 =3D f2fs_unfreeze,
> > > > > > >   =A0=A0=A0=A0=A0 .statfs=A0=A0=A0=A0=A0=A0=A0 =3D f2fs_statf=
s,
> > > > > > > -=A0=A0=A0 .remount_fs=A0=A0=A0 =3D f2fs_remount,
> > > > > > >   =A0=A0=A0=A0=A0 .shutdown=A0=A0=A0 =3D f2fs_shutdown,
> > > > > > >   =A0 };
> > > > > > >   =A0 @@ -4745,16 +4692,13 @@ static void f2fs_tuning_paramet=
ers(struct f2fs_sb_info *sbi)
> > > > > > >   =A0=A0=A0=A0=A0 sbi->readdir_ra =3D true;
> > > > > > >   =A0 }
> > > > > > >   =A0 -static int f2fs_fill_super(struct super_block *sb, voi=
d *data, int silent)
> > > > > > > +static int f2fs_fill_super(struct super_block *sb, struct fs=
_context *fc)
> > > > > > >   =A0 {
> > > > > > >   =A0=A0=A0=A0=A0 struct f2fs_sb_info *sbi;
> > > > > > >   =A0=A0=A0=A0=A0 struct f2fs_super_block *raw_super;
> > > > > > > -=A0=A0=A0 struct f2fs_fs_context ctx;
> > > > > > > -=A0=A0=A0 struct fs_context fc;
> > > > > > >   =A0=A0=A0=A0=A0 struct inode *root;
> > > > > > >   =A0=A0=A0=A0=A0 int err;
> > > > > > >   =A0=A0=A0=A0=A0 bool skip_recovery =3D false, need_fsck =3D=
 false;
> > > > > > > -=A0=A0=A0 char *options =3D NULL;
> > > > > > >   =A0=A0=A0=A0=A0 int recovery, i, valid_super_block;
> > > > > > >   =A0=A0=A0=A0=A0 struct curseg_info *seg_i;
> > > > > > >   =A0=A0=A0=A0=A0 int retry_cnt =3D 1;
> > > > > > > @@ -4767,9 +4711,6 @@ static int f2fs_fill_super(struct super=
_block *sb, void *data, int silent)
> > > > > > >   =A0=A0=A0=A0=A0 raw_super =3D NULL;
> > > > > > >   =A0=A0=A0=A0=A0 valid_super_block =3D -1;
> > > > > > >   =A0=A0=A0=A0=A0 recovery =3D 0;
> > > > > > > -=A0=A0=A0 memset(&fc, 0, sizeof(fc));
> > > > > > > -=A0=A0=A0 memset(&ctx, 0, sizeof(ctx));
> > > > > > > -=A0=A0=A0 fc.fs_private =3D &ctx;
> > > > > > >   =A0 =A0=A0=A0=A0=A0 /* allocate memory for f2fs-specific su=
per block info */
> > > > > > >   =A0=A0=A0=A0=A0 sbi =3D kzalloc(sizeof(struct f2fs_sb_info)=
, GFP_KERNEL);
> > > > > > > @@ -4820,22 +4761,12 @@ static int f2fs_fill_super(struct sup=
er_block *sb, void *data, int silent)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 sizeof(raw_super->uuid));
> > > > > > >   =A0 =A0=A0=A0=A0=A0 default_options(sbi, false);
> > > > > > > -=A0=A0=A0 /* parse mount options */
> > > > > > > -=A0=A0=A0 options =3D kstrdup((const char *)data, GFP_KERNEL=
);
> > > > > > > -=A0=A0=A0 if (data && !options) {
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 err =3D -ENOMEM;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 goto free_sb_buf;
> > > > > > > -=A0=A0=A0 }
> > > > > > > -
> > > > > > > -=A0=A0=A0 err =3D parse_options(&fc, options);
> > > > > > > -=A0=A0=A0 if (err)
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 goto free_options;
> > > > > > >   =A0 -=A0=A0=A0 err =3D f2fs_check_opt_consistency(&fc, sb);
> > > > > > > +=A0=A0=A0 err =3D f2fs_check_opt_consistency(fc, sb);
> > > > > > >   =A0=A0=A0=A0=A0 if (err < 0)
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 goto free_options;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 goto free_sb_buf;
> > > > > > >   =A0 -=A0=A0=A0 f2fs_apply_options(&fc, sb);
> > > > > > > +=A0=A0=A0 f2fs_apply_options(fc, sb);
> > > > > > >   =A0 =A0=A0=A0=A0=A0 sb->s_maxbytes =3D max_file_blocks(NULL=
) <<
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 le32_to=
_cpu(raw_super->log_blocksize);
> > > > > > > @@ -5160,7 +5091,6 @@ static int f2fs_fill_super(struct super=
_block *sb, void *data, int silent)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (err)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto sync_free_meta;
> > > > > > >   =A0=A0=A0=A0=A0 }
> > > > > > > -=A0=A0=A0 kvfree(options);
> > > > > > >   =A0 =A0=A0=A0=A0=A0 /* recover broken superblock */
> > > > > > >   =A0=A0=A0=A0=A0 if (recovery) {
> > > > > > > @@ -5255,7 +5185,6 @@ static int f2fs_fill_super(struct super=
_block *sb, void *data, int silent)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(F2FS_OPTION(sbi).s_qf_nam=
es[i]);
> > > > > > >   =A0 #endif
> > > > > > >   =A0=A0=A0=A0=A0 fscrypt_free_dummy_policy(&F2FS_OPTION(sbi)=
.dummy_enc_policy);
> > > > > > > -=A0=A0=A0 kvfree(options);
> > > > > > >   =A0 free_sb_buf:
> > > > > > >   =A0=A0=A0=A0=A0 kfree(raw_super);
> > > > > > >   =A0 free_sbi:
> > > > > > > @@ -5271,14 +5200,39 @@ static int f2fs_fill_super(struct sup=
er_block *sb, void *data, int silent)
> > > > > > >   =A0=A0=A0=A0=A0 return err;
> > > > > > >   =A0 }
> > > > > > >   =A0 -static struct dentry *f2fs_mount(struct file_system_ty=
pe *fs_type, int flags,
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const char *dev_name, void=
 *data)
> > > > > > > +static int f2fs_get_tree(struct fs_context *fc)
> > > > > > >   =A0 {
> > > > > > > -=A0=A0=A0 return mount_bdev(fs_type, flags, dev_name, data, =
f2fs_fill_super);
> > > > > > > +=A0=A0=A0 return get_tree_bdev(fc, f2fs_fill_super);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int f2fs_reconfigure(struct fs_context *fc)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 struct super_block *sb =3D fc->root->d_sb;
> > > > > > > +
> > > > > > > +=A0=A0=A0 return __f2fs_remount(fc, sb);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void f2fs_fc_free(struct fs_context *fc)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 struct f2fs_fs_context *ctx =3D fc->fs_private;
> > > > > > > +=A0=A0=A0 int i;
> > > > > > > +
> > > > > > > +=A0=A0=A0 if (!ctx)
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > > +
> > > > > > > +#ifdef CONFIG_QUOTA
> > > > > > > +=A0=A0=A0 for (i =3D 0; i < MAXQUOTAS; i++)
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]=
);
> > > > > > > +#endif
> > > > > > > +=A0=A0=A0 fscrypt_free_dummy_policy(&F2FS_CTX_INFO(ctx).dumm=
y_enc_policy);
> > > > > > > +=A0=A0=A0 kfree(ctx);
> > > > > > >   =A0 }
> > > > > > >   =A0 =A0 static const struct fs_context_operations f2fs_cont=
ext_ops =3D {
> > > > > > >   =A0=A0=A0=A0=A0 .parse_param=A0=A0=A0 =3D f2fs_parse_param,
> > > > > > > +=A0=A0=A0 .get_tree=A0=A0=A0 =3D f2fs_get_tree,
> > > > > > > +=A0=A0=A0 .reconfigure =3D f2fs_reconfigure,
> > > > > > > +=A0=A0=A0 .free=A0=A0=A0 =3D f2fs_fc_free,
> > > > > > >   =A0 };
> > > > > > >   =A0 =A0 static void kill_f2fs_super(struct super_block *sb)
> > > > > > > @@ -5322,10 +5276,24 @@ static void kill_f2fs_super(struct su=
per_block *sb)
> > > > > > >   =A0=A0=A0=A0=A0 }
> > > > > > >   =A0 }
> > > > > > >   =A0 +static int f2fs_init_fs_context(struct fs_context *fc)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 struct f2fs_fs_context *ctx;
> > > > > > > +
> > > > > > > +=A0=A0=A0 ctx =3D kzalloc(sizeof(struct f2fs_fs_context), GF=
P_KERNEL);
> > > > > > > +=A0=A0=A0 if (!ctx)
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
> > > > > > > +
> > > > > > > +=A0=A0=A0 fc->fs_private =3D ctx;
> > > > > > > +=A0=A0=A0 fc->ops =3D &f2fs_context_ops;
> > > > > > > +
> > > > > > > +=A0=A0=A0 return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > >   =A0 static struct file_system_type f2fs_fs_type =3D {
> > > > > > >   =A0=A0=A0=A0=A0 .owner=A0=A0=A0=A0=A0=A0=A0 =3D THIS_MODULE,
> > > > > > >   =A0=A0=A0=A0=A0 .name=A0=A0=A0=A0=A0=A0=A0 =3D "f2fs",
> > > > > > > -=A0=A0=A0 .mount=A0=A0=A0=A0=A0=A0=A0 =3D f2fs_mount,
> > > > > > > +=A0=A0=A0 .init_fs_context =3D f2fs_init_fs_context,
> > > > > > >   =A0=A0=A0=A0=A0 .kill_sb=A0=A0=A0 =3D kill_f2fs_super,
> > > > > > >   =A0=A0=A0=A0=A0 .fs_flags=A0=A0=A0 =3D FS_REQUIRES_DEV | FS=
_ALLOW_IDMAP,
> > > > > > >   =A0 };
> > > > > > =

> > > > =

> > > > =

> > =

> > =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

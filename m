Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C628AAB6FD6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 May 2025 17:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ye0alspG+uck2XJSp+VcDCg405bCItRbgtpbK66NASU=; b=df/sIK9/nCqT9JPzSUSt6N3Ag3
	Nej4HgCyChAqqUuRAa/hF1i/5fkKmrTCDdru8HE2Mp1BV78te3jf2Ot42PJcROHN61aWyEUNZbnWG
	lWDVUP0xrnB3kQs2/N+W4Jcb5TKULI1tOGX5HCsTgXMWQis8xj3nWeec5imv9kIBybj4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uFE4W-0007ma-Mg;
	Wed, 14 May 2025 15:31:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uFE4V-0007mP-8m
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T66WFeLDl5tANA3AV5JhSpccU4FSmss2ID4S79erExU=; b=Iv7XYDWnmy+wqdx+jf3c62obBc
 LxA4ns8lOQZrLletLR6l2reft7sW05OOuBBfxobn3qdeUSkMryKLxo4TKJ/80vA4q1pzobS5VLthN
 bvag7/g1tUXqdQkg/H42lFoszumH9t8zj1SvgeWgkN0GPl7jY+9hTBmAEg7bXUl44KKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T66WFeLDl5tANA3AV5JhSpccU4FSmss2ID4S79erExU=; b=myo+NK+bVRwzLAMlrnnvcC0SfX
 r5KJEwMSjTpshkQoA+5SKyS4t/qWY2pO93c3xIy/u2YQQHPFozIqTiQYhI0BZaX3edMECtONR2XYH
 ooI7UFKGpgTZcDs4EIm7iz3QpYTEZ5r0QHC6MGzGecviTMss56BOBNRRyaZmhP6kjcU0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uFE4T-0001PR-T4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:31:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 046085C2B46;
 Wed, 14 May 2025 15:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95B1C4CEED;
 Wed, 14 May 2025 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747236655;
 bh=WMWbEExOSKwyXgOEjUWgGcplV+n4pAYX0mSi0pWsXcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IM86HjWKd1c938NlxPyK6EINAQlOisPXhQdAX4Mc32QdZjznhvdV90iZBq/GhxdZM
 Vdp8jJPWD80R/GSxKKXhJRB//GSC5FTOdjiFrnNS7c+mq2vanrU3yPEbP8yM3O8Wm7
 MKMDG3wrVMsxBFXIcRm16t9nzYN0vCzeLsaLa7Xl8gAKvihziU3wiD2CluqhnwOxHZ
 P+ZFfhJ+RsU8sZt+1jk8Edo6o5SzWuaGrh27cAWyAtmXZ7lPb8ToIyO3FJdX3xe40W
 Ey/EAIC8HVry1As0T6+NLwwsx4XPmbecUI44aX4huA5Q6Z3AJSiyKrVtUvMLfiQbfw
 X+joedDKMPMwQ==
Date: Wed, 14 May 2025 15:30:53 +0000
To: Hongbo Li <lihongbo22@huawei.com>
Message-ID: <aCS3LZ3IOMgiissx@google.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-8-sandeen@redhat.com>
 <ff2c9a74-f359-4bcc-9792-46af946c70ad@kernel.org>
 <63d1977d-2f0b-4c58-9867-0dc1285815a0@huawei.com>
 <979015aa-433d-4057-a454-afaea2c68131@kernel.org>
 <2ea178cb-1ed3-40ba-8dc6-8fa3bff06850@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ea178cb-1ed3-40ba-8dc6-8fa3bff06850@huawei.com>
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Hongbo, It seems we're getting more issues in the patch
 set. May I ask for some help sending the new patch series having all the
 fixes that I made as well as addressing the concerns? You can get the patches
 f [...] Content analysis details:   (-6.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uFE4T-0001PR-T4
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

Hi, Hongbo,

It seems we're getting more issues in the patch set. May I ask for some
help sending the new patch series having all the fixes that I made as well
as addressing the concerns? You can get the patches from [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=
=3Ddev-test

On 05/14, Hongbo Li wrote:
> =

> =

> On 2025/5/14 12:03, Chao Yu wrote:
> > On 5/14/25 10:33, Hongbo Li wrote:
> > > =

> > > =

> > > On 2025/5/13 16:59, Chao Yu wrote:
> > > > On 4/24/25 01:08, Eric Sandeen wrote:
> > > > > From: Hongbo Li <lihongbo22@huawei.com>
> > > > > =

> > > > > The new mount api will execute .parse_param, .init_fs_context, .g=
et_tree
> > > > > and will call .remount if remount happened. So we add the necessa=
ry
> > > > > functions for the fs_context_operations. If .init_fs_context is a=
dded,
> > > > > the old .mount should remove.
> > > > > =

> > > > > See Documentation/filesystems/mount_api.rst for more information.
> > > > =

> > > > mkfs.f2fs -f -O extra_attr,flexible_inline_xattr /dev/vdb
> > > > mount -o inline_xattr_size=3D512 /dev/vdb /mnt/f2fs
> > > > mount: /mnt/f2fs: wrong fs type, bad option, bad superblock on /dev=
/vdb, missing codepage or helper program, or other error.
> > > >  =A0=A0=A0=A0=A0=A0=A0 dmesg(1) may have more information after fai=
led mount system call.
> > > > dmesg
> > > > [ 1758.202282] F2FS-fs (vdb): Image doesn't support compression
> > > > [ 1758.202286] F2FS-fs (vdb): inline_xattr_size option should be se=
t with inline_xattr option
> > > > =

> > > > Eric, Hongbo, can you please take a look at this issue?
> > > > =

> > > Sorry, we only check the option hold in ctx, we should do the double =
check in sbi. Or other elegant approaches.
> > > =

> > > For the "support compression", is it also the error in this testcase?
> > =

> > I think so, I checked this w/ additional logs, and found this:
> > =

> > #define F2FS_MOUNT_INLINE_XATTR_SIZE	0x00080000
> > #define F2FS_SPEC_compress_chksum		(1 << 19) /* equal to 0x00080000)
> > =

> > 	if (!f2fs_sb_has_compression(sbi)) {
> > 		if (test_compression_spec(ctx->opt_mask) ||
> > 			ctx_test_opt(ctx, F2FS_MOUNT_COMPRESS_CACHE))
> > 			f2fs_info(sbi, "Image doesn't support compression");
> > 		clear_compression_spec(ctx);
> > 		ctx->opt_mask &=3D ~F2FS_MOUNT_COMPRESS_CACHE;
> > 		return 0;
> > 	}
> > =

> > We should use test_compression_spec(ctx->spec_mask) instead of
> > test_compression_spec(ctx->opt_mask) to check special mask of compressi=
on
> > option?
> > =

> =

> Yeah, you're right. test_compression_spec is used to check spec_mask, and=
 we
> got it wrong.
> =

> Thanks,
> Hongbo
> =

> > Thanks,
> > =

> > > =

> > > Thanks,
> > > Hongbo
> > > =

> > > > Thanks,
> > > > =

> > > > > =

> > > > > Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> > > > > [sandeen: forward port]
> > > > > Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> > > > > ---
> > > > >  =A0 fs/f2fs/super.c | 156 +++++++++++++++++++-------------------=
----------
> > > > >  =A0 1 file changed, 62 insertions(+), 94 deletions(-)
> > > > > =

> > > > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > > index 37497fd80bb9..041bd6c482a0 100644
> > > > > --- a/fs/f2fs/super.c
> > > > > +++ b/fs/f2fs/super.c
> > > > > @@ -1141,47 +1141,6 @@ static int f2fs_parse_param(struct fs_cont=
ext *fc, struct fs_parameter *param)
> > > > >  =A0=A0=A0=A0=A0 return 0;
> > > > >  =A0 }
> > > > >  =A0 -static int parse_options(struct fs_context *fc, char *optio=
ns)
> > > > > -{
> > > > > -=A0=A0=A0 struct fs_parameter param;
> > > > > -=A0=A0=A0 char *key;
> > > > > -=A0=A0=A0 int ret;
> > > > > -
> > > > > -=A0=A0=A0 if (!options)
> > > > > -=A0=A0=A0=A0=A0=A0=A0 return 0;
> > > > > -
> > > > > -=A0=A0=A0 while ((key =3D strsep(&options, ",")) !=3D NULL) {
> > > > > -=A0=A0=A0=A0=A0=A0=A0 if (*key) {
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 size_t v_len =3D 0;
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 char *value =3D strchr(key, '=
=3D');
> > > > > -
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.type =3D fs_value_is_fla=
g;
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.string =3D NULL;
> > > > > -
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (value) {
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (value =3D=3D k=
ey)
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 contin=
ue;
> > > > > -
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *value++ =3D 0;
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v_len =3D strlen(v=
alue);
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.string =3D k=
memdup_nul(value, v_len, GFP_KERNEL);
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!param.string)
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return=
 -ENOMEM;
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.type =3D fs_=
value_is_string;
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > -
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.key =3D key;
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 param.size =3D v_len;
> > > > > -
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D f2fs_parse_param(fc, &=
param);
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(param.string);
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret < 0)
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > > -=A0=A0=A0 }
> > > > > -=A0=A0=A0 return 0;
> > > > > -}
> > > > > -
> > > > >  =A0 /*
> > > > >  =A0=A0 * Check quota settings consistency.
> > > > >  =A0=A0 */
> > > > > @@ -2583,13 +2542,12 @@ static void f2fs_enable_checkpoint(struct=
 f2fs_sb_info *sbi)
> > > > >  =A0=A0=A0=A0=A0 f2fs_flush_ckpt_thread(sbi);
> > > > >  =A0 }
> > > > >  =A0 -static int f2fs_remount(struct super_block *sb, int *flags,=
 char *data)
> > > > > +static int __f2fs_remount(struct fs_context *fc, struct super_bl=
ock *sb)
> > > > >  =A0 {
> > > > >  =A0=A0=A0=A0=A0 struct f2fs_sb_info *sbi =3D F2FS_SB(sb);
> > > > >  =A0=A0=A0=A0=A0 struct f2fs_mount_info org_mount_opt;
> > > > > -=A0=A0=A0 struct f2fs_fs_context ctx;
> > > > > -=A0=A0=A0 struct fs_context fc;
> > > > >  =A0=A0=A0=A0=A0 unsigned long old_sb_flags;
> > > > > +=A0=A0=A0 unsigned int flags =3D fc->sb_flags;
> > > > >  =A0=A0=A0=A0=A0 int err;
> > > > >  =A0=A0=A0=A0=A0 bool need_restart_gc =3D false, need_stop_gc =3D=
 false;
> > > > >  =A0=A0=A0=A0=A0 bool need_restart_flush =3D false, need_stop_flu=
sh =3D false;
> > > > > @@ -2635,7 +2593,7 @@ static int f2fs_remount(struct super_block =
*sb, int *flags, char *data)
> > > > >  =A0 #endif
> > > > >  =A0 =A0=A0=A0=A0=A0 /* recover superblocks we couldn't write due=
 to previous RO mount */
> > > > > -=A0=A0=A0 if (!(*flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_=
NEED_SB_WRITE)) {
> > > > > +=A0=A0=A0 if (!(flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_N=
EED_SB_WRITE)) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D f2fs_commit_super(sbi, false=
);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_info(sbi, "Try to recover all t=
he superblocks, ret: %d",
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 err);
> > > > > @@ -2645,21 +2603,11 @@ static int f2fs_remount(struct super_bloc=
k *sb, int *flags, char *data)
> > > > >  =A0 =A0=A0=A0=A0=A0 default_options(sbi, true);
> > > > >  =A0 -=A0=A0=A0 memset(&fc, 0, sizeof(fc));
> > > > > -=A0=A0=A0 memset(&ctx, 0, sizeof(ctx));
> > > > > -=A0=A0=A0 fc.fs_private =3D &ctx;
> > > > > -=A0=A0=A0 fc.purpose =3D FS_CONTEXT_FOR_RECONFIGURE;
> > > > > -
> > > > > -=A0=A0=A0 /* parse mount options */
> > > > > -=A0=A0=A0 err =3D parse_options(&fc, data);
> > > > > -=A0=A0=A0 if (err)
> > > > > -=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > > -
> > > > > -=A0=A0=A0 err =3D f2fs_check_opt_consistency(&fc, sb);
> > > > > +=A0=A0=A0 err =3D f2fs_check_opt_consistency(fc, sb);
> > > > >  =A0=A0=A0=A0=A0 if (err < 0)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > >  =A0 -=A0=A0=A0 f2fs_apply_options(&fc, sb);
> > > > > +=A0=A0=A0 f2fs_apply_options(fc, sb);
> > > > >  =A0 =A0 #ifdef CONFIG_BLK_DEV_ZONED
> > > > >  =A0=A0=A0=A0=A0 if (f2fs_sb_has_blkzoned(sbi) &&
> > > > > @@ -2678,20 +2626,20 @@ static int f2fs_remount(struct super_bloc=
k *sb, int *flags, char *data)
> > > > >  =A0=A0=A0=A0=A0=A0 * Previous and new state of filesystem is RO,
> > > > >  =A0=A0=A0=A0=A0=A0 * so skip checking GC and FLUSH_MERGE conditi=
ons.
> > > > >  =A0=A0=A0=A0=A0=A0 */
> > > > > -=A0=A0=A0 if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
> > > > > +=A0=A0=A0 if (f2fs_readonly(sb) && (flags & SB_RDONLY))
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto skip;
> > > > >  =A0 -=A0=A0=A0 if (f2fs_dev_is_readonly(sbi) && !(*flags & SB_RD=
ONLY)) {
> > > > > +=A0=A0=A0 if (f2fs_dev_is_readonly(sbi) && !(flags & SB_RDONLY))=
 {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D -EROFS;
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > >  =A0=A0=A0=A0=A0 }
> > > > >  =A0 =A0 #ifdef CONFIG_QUOTA
> > > > > -=A0=A0=A0 if (!f2fs_readonly(sb) && (*flags & SB_RDONLY)) {
> > > > > +=A0=A0=A0 if (!f2fs_readonly(sb) && (flags & SB_RDONLY)) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D dquot_suspend(sb, -1);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (err < 0)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > > -=A0=A0=A0 } else if (f2fs_readonly(sb) && !(*flags & SB_RDONLY))=
 {
> > > > > +=A0=A0=A0 } else if (f2fs_readonly(sb) && !(flags & SB_RDONLY)) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 /* dquot_resume needs RW */
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 sb->s_flags &=3D ~SB_RDONLY;
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sb_any_quota_suspended(sb)) {
> > > > > @@ -2747,7 +2695,7 @@ static int f2fs_remount(struct super_block =
*sb, int *flags, char *data)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > >  =A0=A0=A0=A0=A0 }
> > > > >  =A0 -=A0=A0=A0 if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE=
_CHECKPOINT)) {
> > > > > +=A0=A0=A0 if ((flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECK=
POINT)) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D -EINVAL;
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_warn(sbi, "disabling checkpoint=
 not compatible with read-only");
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > > @@ -2758,7 +2706,7 @@ static int f2fs_remount(struct super_block =
*sb, int *flags, char *data)
> > > > >  =A0=A0=A0=A0=A0=A0 * or if background_gc =3D off is passed in mo=
unt
> > > > >  =A0=A0=A0=A0=A0=A0 * option. Also sync the filesystem.
> > > > >  =A0=A0=A0=A0=A0=A0 */
> > > > > -=A0=A0=A0 if ((*flags & SB_RDONLY) ||
> > > > > +=A0=A0=A0 if ((flags & SB_RDONLY) ||
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (F2FS_OPTION(sbi).bggc_m=
ode =3D=3D BGGC_MODE_OFF &&
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !test_opt(sbi, GC_MERGE)=
)) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sbi->gc_thread) {
> > > > > @@ -2772,7 +2720,7 @@ static int f2fs_remount(struct super_block =
*sb, int *flags, char *data)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 need_stop_gc =3D true;
> > > > >  =A0=A0=A0=A0=A0 }
> > > > >  =A0 -=A0=A0=A0 if (*flags & SB_RDONLY) {
> > > > > +=A0=A0=A0 if (flags & SB_RDONLY) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 sync_inodes_sb(sb);
> > > > >  =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(sbi, SBI_IS_DIRTY);
> > > > > @@ -2785,7 +2733,7 @@ static int f2fs_remount(struct super_block =
*sb, int *flags, char *data)
> > > > >  =A0=A0=A0=A0=A0=A0 * We stop issue flush thread if FS is mounted=
 as RO
> > > > >  =A0=A0=A0=A0=A0=A0 * or if flush_merge is not passed in mount op=
tion.
> > > > >  =A0=A0=A0=A0=A0=A0 */
> > > > > -=A0=A0=A0 if ((*flags & SB_RDONLY) || !test_opt(sbi, FLUSH_MERGE=
)) {
> > > > > +=A0=A0=A0 if ((flags & SB_RDONLY) || !test_opt(sbi, FLUSH_MERGE)=
) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 clear_opt(sbi, FLUSH_MERGE);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_destroy_flush_cmd_control(sbi, =
false);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 need_restart_flush =3D true;
> > > > > @@ -2827,7 +2775,7 @@ static int f2fs_remount(struct super_block =
*sb, int *flags, char *data)
> > > > >  =A0=A0=A0=A0=A0=A0 * triggered while remount and we need to take=
 care of it before
> > > > >  =A0=A0=A0=A0=A0=A0 * returning from remount.
> > > > >  =A0=A0=A0=A0=A0=A0 */
> > > > > -=A0=A0=A0 if ((*flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHEC=
KPOINT) ||
> > > > > +=A0=A0=A0 if ((flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECK=
POINT) ||
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !test_opt(sbi, MERGE_CHE=
CKPOINT)) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_stop_ckpt_thread(sbi);
> > > > >  =A0=A0=A0=A0=A0 } else {
> > > > > @@ -2854,7 +2802,7 @@ static int f2fs_remount(struct super_block =
*sb, int *flags, char *data)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 (test_opt(sbi, POSIX_ACL) ? SB_POSIX=
ACL : 0);
> > > > >  =A0 =A0=A0=A0=A0=A0 limit_reserve_root(sbi);
> > > > > -=A0=A0=A0 *flags =3D (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB=
_LAZYTIME);
> > > > > +=A0=A0=A0 fc->sb_flags =3D (flags & ~SB_LAZYTIME) | (sb->s_flags=
 & SB_LAZYTIME);
> > > > >  =A0 =A0=A0=A0=A0=A0 sbi->umount_lock_holder =3D NULL;
> > > > >  =A0=A0=A0=A0=A0 return 0;
> > > > > @@ -3523,7 +3471,6 @@ static const struct super_operations f2fs_s=
ops =3D {
> > > > >  =A0=A0=A0=A0=A0 .freeze_fs=A0=A0=A0 =3D f2fs_freeze,
> > > > >  =A0=A0=A0=A0=A0 .unfreeze_fs=A0=A0=A0 =3D f2fs_unfreeze,
> > > > >  =A0=A0=A0=A0=A0 .statfs=A0=A0=A0=A0=A0=A0=A0 =3D f2fs_statfs,
> > > > > -=A0=A0=A0 .remount_fs=A0=A0=A0 =3D f2fs_remount,
> > > > >  =A0=A0=A0=A0=A0 .shutdown=A0=A0=A0 =3D f2fs_shutdown,
> > > > >  =A0 };
> > > > >  =A0 @@ -4745,16 +4692,13 @@ static void f2fs_tuning_parameters(s=
truct f2fs_sb_info *sbi)
> > > > >  =A0=A0=A0=A0=A0 sbi->readdir_ra =3D true;
> > > > >  =A0 }
> > > > >  =A0 -static int f2fs_fill_super(struct super_block *sb, void *da=
ta, int silent)
> > > > > +static int f2fs_fill_super(struct super_block *sb, struct fs_con=
text *fc)
> > > > >  =A0 {
> > > > >  =A0=A0=A0=A0=A0 struct f2fs_sb_info *sbi;
> > > > >  =A0=A0=A0=A0=A0 struct f2fs_super_block *raw_super;
> > > > > -=A0=A0=A0 struct f2fs_fs_context ctx;
> > > > > -=A0=A0=A0 struct fs_context fc;
> > > > >  =A0=A0=A0=A0=A0 struct inode *root;
> > > > >  =A0=A0=A0=A0=A0 int err;
> > > > >  =A0=A0=A0=A0=A0 bool skip_recovery =3D false, need_fsck =3D fals=
e;
> > > > > -=A0=A0=A0 char *options =3D NULL;
> > > > >  =A0=A0=A0=A0=A0 int recovery, i, valid_super_block;
> > > > >  =A0=A0=A0=A0=A0 struct curseg_info *seg_i;
> > > > >  =A0=A0=A0=A0=A0 int retry_cnt =3D 1;
> > > > > @@ -4767,9 +4711,6 @@ static int f2fs_fill_super(struct super_blo=
ck *sb, void *data, int silent)
> > > > >  =A0=A0=A0=A0=A0 raw_super =3D NULL;
> > > > >  =A0=A0=A0=A0=A0 valid_super_block =3D -1;
> > > > >  =A0=A0=A0=A0=A0 recovery =3D 0;
> > > > > -=A0=A0=A0 memset(&fc, 0, sizeof(fc));
> > > > > -=A0=A0=A0 memset(&ctx, 0, sizeof(ctx));
> > > > > -=A0=A0=A0 fc.fs_private =3D &ctx;
> > > > >  =A0 =A0=A0=A0=A0=A0 /* allocate memory for f2fs-specific super b=
lock info */
> > > > >  =A0=A0=A0=A0=A0 sbi =3D kzalloc(sizeof(struct f2fs_sb_info), GFP=
_KERNEL);
> > > > > @@ -4820,22 +4761,12 @@ static int f2fs_fill_super(struct super_b=
lock *sb, void *data, int silent)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 sizeof(raw_super->uuid));
> > > > >  =A0 =A0=A0=A0=A0=A0 default_options(sbi, false);
> > > > > -=A0=A0=A0 /* parse mount options */
> > > > > -=A0=A0=A0 options =3D kstrdup((const char *)data, GFP_KERNEL);
> > > > > -=A0=A0=A0 if (data && !options) {
> > > > > -=A0=A0=A0=A0=A0=A0=A0 err =3D -ENOMEM;
> > > > > -=A0=A0=A0=A0=A0=A0=A0 goto free_sb_buf;
> > > > > -=A0=A0=A0 }
> > > > > -
> > > > > -=A0=A0=A0 err =3D parse_options(&fc, options);
> > > > > -=A0=A0=A0 if (err)
> > > > > -=A0=A0=A0=A0=A0=A0=A0 goto free_options;
> > > > >  =A0 -=A0=A0=A0 err =3D f2fs_check_opt_consistency(&fc, sb);
> > > > > +=A0=A0=A0 err =3D f2fs_check_opt_consistency(fc, sb);
> > > > >  =A0=A0=A0=A0=A0 if (err < 0)
> > > > > -=A0=A0=A0=A0=A0=A0=A0 goto free_options;
> > > > > +=A0=A0=A0=A0=A0=A0=A0 goto free_sb_buf;
> > > > >  =A0 -=A0=A0=A0 f2fs_apply_options(&fc, sb);
> > > > > +=A0=A0=A0 f2fs_apply_options(fc, sb);
> > > > >  =A0 =A0=A0=A0=A0=A0 sb->s_maxbytes =3D max_file_blocks(NULL) <<
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 le32_to_cpu(=
raw_super->log_blocksize);
> > > > > @@ -5160,7 +5091,6 @@ static int f2fs_fill_super(struct super_blo=
ck *sb, void *data, int silent)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (err)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto sync_free_meta;
> > > > >  =A0=A0=A0=A0=A0 }
> > > > > -=A0=A0=A0 kvfree(options);
> > > > >  =A0 =A0=A0=A0=A0=A0 /* recover broken superblock */
> > > > >  =A0=A0=A0=A0=A0 if (recovery) {
> > > > > @@ -5255,7 +5185,6 @@ static int f2fs_fill_super(struct super_blo=
ck *sb, void *data, int silent)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(F2FS_OPTION(sbi).s_qf_names[i]=
);
> > > > >  =A0 #endif
> > > > >  =A0=A0=A0=A0=A0 fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dumm=
y_enc_policy);
> > > > > -=A0=A0=A0 kvfree(options);
> > > > >  =A0 free_sb_buf:
> > > > >  =A0=A0=A0=A0=A0 kfree(raw_super);
> > > > >  =A0 free_sbi:
> > > > > @@ -5271,14 +5200,39 @@ static int f2fs_fill_super(struct super_b=
lock *sb, void *data, int silent)
> > > > >  =A0=A0=A0=A0=A0 return err;
> > > > >  =A0 }
> > > > >  =A0 -static struct dentry *f2fs_mount(struct file_system_type *f=
s_type, int flags,
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const char *dev_name, void *da=
ta)
> > > > > +static int f2fs_get_tree(struct fs_context *fc)
> > > > >  =A0 {
> > > > > -=A0=A0=A0 return mount_bdev(fs_type, flags, dev_name, data, f2fs=
_fill_super);
> > > > > +=A0=A0=A0 return get_tree_bdev(fc, f2fs_fill_super);
> > > > > +}
> > > > > +
> > > > > +static int f2fs_reconfigure(struct fs_context *fc)
> > > > > +{
> > > > > +=A0=A0=A0 struct super_block *sb =3D fc->root->d_sb;
> > > > > +
> > > > > +=A0=A0=A0 return __f2fs_remount(fc, sb);
> > > > > +}
> > > > > +
> > > > > +static void f2fs_fc_free(struct fs_context *fc)
> > > > > +{
> > > > > +=A0=A0=A0 struct f2fs_fs_context *ctx =3D fc->fs_private;
> > > > > +=A0=A0=A0 int i;
> > > > > +
> > > > > +=A0=A0=A0 if (!ctx)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > +
> > > > > +#ifdef CONFIG_QUOTA
> > > > > +=A0=A0=A0 for (i =3D 0; i < MAXQUOTAS; i++)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
> > > > > +#endif
> > > > > +=A0=A0=A0 fscrypt_free_dummy_policy(&F2FS_CTX_INFO(ctx).dummy_en=
c_policy);
> > > > > +=A0=A0=A0 kfree(ctx);
> > > > >  =A0 }
> > > > >  =A0 =A0 static const struct fs_context_operations f2fs_context_o=
ps =3D {
> > > > >  =A0=A0=A0=A0=A0 .parse_param=A0=A0=A0 =3D f2fs_parse_param,
> > > > > +=A0=A0=A0 .get_tree=A0=A0=A0 =3D f2fs_get_tree,
> > > > > +=A0=A0=A0 .reconfigure =3D f2fs_reconfigure,
> > > > > +=A0=A0=A0 .free=A0=A0=A0 =3D f2fs_fc_free,
> > > > >  =A0 };
> > > > >  =A0 =A0 static void kill_f2fs_super(struct super_block *sb)
> > > > > @@ -5322,10 +5276,24 @@ static void kill_f2fs_super(struct super_=
block *sb)
> > > > >  =A0=A0=A0=A0=A0 }
> > > > >  =A0 }
> > > > >  =A0 +static int f2fs_init_fs_context(struct fs_context *fc)
> > > > > +{
> > > > > +=A0=A0=A0 struct f2fs_fs_context *ctx;
> > > > > +
> > > > > +=A0=A0=A0 ctx =3D kzalloc(sizeof(struct f2fs_fs_context), GFP_KE=
RNEL);
> > > > > +=A0=A0=A0 if (!ctx)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
> > > > > +
> > > > > +=A0=A0=A0 fc->fs_private =3D ctx;
> > > > > +=A0=A0=A0 fc->ops =3D &f2fs_context_ops;
> > > > > +
> > > > > +=A0=A0=A0 return 0;
> > > > > +}
> > > > > +
> > > > >  =A0 static struct file_system_type f2fs_fs_type =3D {
> > > > >  =A0=A0=A0=A0=A0 .owner=A0=A0=A0=A0=A0=A0=A0 =3D THIS_MODULE,
> > > > >  =A0=A0=A0=A0=A0 .name=A0=A0=A0=A0=A0=A0=A0 =3D "f2fs",
> > > > > -=A0=A0=A0 .mount=A0=A0=A0=A0=A0=A0=A0 =3D f2fs_mount,
> > > > > +=A0=A0=A0 .init_fs_context =3D f2fs_init_fs_context,
> > > > >  =A0=A0=A0=A0=A0 .kill_sb=A0=A0=A0 =3D kill_f2fs_super,
> > > > >  =A0=A0=A0=A0=A0 .fs_flags=A0=A0=A0 =3D FS_REQUIRES_DEV | FS_ALLO=
W_IDMAP,
> > > > >  =A0 };
> > > > =

> > =

> > =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

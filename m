Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A5F628C48
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 23:46:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouiDO-0002iJ-77;
	Mon, 14 Nov 2022 22:46:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ouiDM-0002iD-7A
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 22:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YKch3UO4slUTW7CnTw6vU8GEHnk+pfCTgI6jt3I33po=; b=GIRifk6O8UidegSsBSnoXc0OnR
 Zs81utgYcOCEyHkdnEewnY8c2A4WoUvD9563gcDgpeOhdc7R4GJgrfBHJh3usdKCponM4p70yGdJT
 rth8IvgoDAZ+MvWceAC+MTD8s+iUfDs3ZRSZm5pptFa7aRU2BZz0+DJhPs31safxwg/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YKch3UO4slUTW7CnTw6vU8GEHnk+pfCTgI6jt3I33po=; b=WvbOIbTBDEWIN/q0FxYkhWv1jL
 hBu2sPiNmkB5iDtv8k3yr6lxCVeqLTLm40qgBRNjM/kC83gulyysYN27wyaFCa7ng83d0gnKKBtvk
 C4tLjrE63B7xXv7fmQh86JmDMVC0JHGMad2jj2rHQcJXK0Nebnoo3KsK1yXE7kHWweM4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouiDG-008LkA-Mw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 22:46:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41624B811FF;
 Mon, 14 Nov 2022 22:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA244C433C1;
 Mon, 14 Nov 2022 22:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668465950;
 bh=3IhYBx0SX+YEtBzDo5Dr3ZMxwBVh2424f+LtKdeF+m8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cPTcaiifAZlQYIPajcfnFxC2vjEMJT+DpiwXdH0UWmKGcE7ORCQZKVk0DagC72ul4
 RX0ru4XCEoP0IRzXrGJm+xx2PLFFcleGITTYTIVYPnqIuUoOqB4FsdGU0x6dcvfGgM
 etGIqUcIhlSkWjCS2cUZMteB+ii12iJ6C7LQt2T6XvmOj5bTGticho33XqcVdd27z6
 sqf99J/a1u3M6Q/VC1qHO5NQGP+SEdzgg2N+jBNErQ8VeaipNOMd21NeusYlFqqTMl
 7DSM8yDzqqlloMsgWN3LQ0oJ7zLeTCIe57LpnvxMitjE4MUijVyWOnMaiE6NSdx6sP
 q3nChw8GdyuIg==
Date: Mon, 14 Nov 2022 14:45:49 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y3LFHWK3feGRfLT1@google.com>
References: <20221106132748.134306-1-chao@kernel.org>
 <Y2l9V4Mi7lZo7ApM@google.com>
 <8768086f-c4be-1823-1904-6369e8c0d704@kernel.org>
 <0f31c3ff-aa4f-f7bc-be0f-e47c43f2544f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f31c3ff-aa4f-f7bc-be0f-e47c43f2544f@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/14, Chao Yu wrote: > On 2022/11/8 9:17, Chao Yu wrote:
 > > Jaegeuk, > > > > On 2022/11/8 5:49, Jaegeuk Kim wrote: > > > Chao, >
 > > > > > Could you please run xfstests since I met some issues wi [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ouiDG-008LkA-Mw
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: support
 errors=remount-ro|continue|panic mountoption
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/14, Chao Yu wrote:
> On 2022/11/8 9:17, Chao Yu wrote:
> > Jaegeuk,
> > =

> > On 2022/11/8 5:49, Jaegeuk Kim wrote:
> > > Chao,
> > > =

> > > Could you please run xfstests since I met some issues with this?
> > > I had to drop this to test other patches.
> > =

> > Oops, I ran xfstests on v5, I didn't see any issus... and in v6 I just =
rebase
> > codes on ("f2fs: fix to avoid accessing uninitialized spinlock"), there=
 is no
> > critial changes.
> =

> I did test w/ this patch on top of last dev-test branch, however, I don't=
 see
> any hang backtrace...
> =

> Could you please provide xfstest option to me?
> e.g. F2FS_MOUNT_OPTIONS/F2FS_MKFS_OPTIONS
> =

> > =

> > Did you keep any kernel/xfstest logs?
> =

> If it is easier to reproduce the bug in your environment, could you pleas=
e provide
> the log?

I'm testing this v6 patch, and it looks like working. Let me keep testing. =
:)

> =

> > =

> > Thanks,
> > =

> > > =

> > > Thanks,
> > > =

> > > On 11/06, Chao Yu wrote:
> > > > This patch supports errors=3Dremount-ro|continue|panic mount option.
> > > > =

> > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > ---
> > > > v6:
> > > > - rebase the code
> > > > =A0 Documentation/filesystems/f2fs.rst |=A0=A0 4 +
> > > > =A0 fs/f2fs/checkpoint.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 7 +-
> > > > =A0 fs/f2fs/f2fs.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 18 +++-
> > > > =A0 fs/f2fs/file.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 5 --
> > > > =A0 fs/f2fs/gc.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 2 +-
> > > > =A0 fs/f2fs/super.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 135 ++++++++++++++++++++++++++---
> > > > =A0 6 files changed, 147 insertions(+), 24 deletions(-)
> > > > =

> > > > diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/fil=
esystems/f2fs.rst
> > > > index 6e67c5e6c7c3..1d73bc91b9ae 100644
> > > > --- a/Documentation/filesystems/f2fs.rst
> > > > +++ b/Documentation/filesystems/f2fs.rst
> > > > @@ -343,6 +343,10 @@ memory=3D%s=A0=A0=A0=A0=A0=A0=A0=A0 Control me=
mory mode. This supports "normal" and "low" modes.
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Because of the nature of=
 low memory devices, in this mode, f2fs
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 will try to save memory =
sometimes by sacrificing performance.
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "normal" mode is the def=
ault mode and same as before.
> > > > +errors=3D%s=A0=A0=A0=A0=A0=A0=A0=A0 Specify f2fs behavior on criti=
cal errors. This supports modes:
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "panic", "continue" and "remo=
unt-ro", respectively, trigger
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 panic immediately, continue w=
ithout doing anything, and remount
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 the partition in read-only mo=
de (default behavior).
> > > > =A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =A0 Debugfs Entries
> > > > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > > > index 56f7d0d6a8b2..913cea4ebea4 100644
> > > > --- a/fs/f2fs/checkpoint.c
> > > > +++ b/fs/f2fs/checkpoint.c
> > > > @@ -30,12 +30,9 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *s=
bi, bool end_io,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 unsigned char reason)
> > > > =A0 {
> > > > =A0=A0=A0=A0=A0 f2fs_build_fault_attr(sbi, 0, 0);
> > > > -=A0=A0=A0 set_ckpt_flags(sbi, CP_ERROR_FLAG);
> > > > -=A0=A0=A0 if (!end_io) {
> > > > +=A0=A0=A0 if (!end_io)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_flush_merged_writes(sbi);
> > > > -
> > > > -=A0=A0=A0=A0=A0=A0=A0 f2fs_handle_stop(sbi, reason);
> > > > -=A0=A0=A0 }
> > > > +=A0=A0=A0 f2fs_handle_critical_error(sbi, reason, end_io);
> > > > =A0 }
> > > > =A0 /*
> > > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > index 04ef4cce3d7f..af9e114d03a6 100644
> > > > --- a/fs/f2fs/f2fs.h
> > > > +++ b/fs/f2fs/f2fs.h
> > > > @@ -161,6 +161,7 @@ struct f2fs_mount_info {
> > > > =A0=A0=A0=A0=A0 int fs_mode;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* fs=
 mode: LFS or ADAPTIVE */
> > > > =A0=A0=A0=A0=A0 int bggc_mode;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* =
bggc mode: off, on or sync */
> > > > =A0=A0=A0=A0=A0 int memory_mode;=A0=A0=A0=A0=A0=A0=A0 /* memory mod=
e */
> > > > +=A0=A0=A0 int errors;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* errors p=
arameter */
> > > > =A0=A0=A0=A0=A0 int discard_unit;=A0=A0=A0=A0=A0=A0=A0 /*
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
* discard command's offset/size should
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
* be aligned to this unit: block,
> > > > @@ -1381,7 +1382,11 @@ enum {
> > > > =A0=A0=A0=A0=A0 MEMORY_MODE_LOW,=A0=A0=A0 /* memory mode for low me=
mry devices */
> > > > =A0 };
> > > > -
> > > > +enum errors_option {
> > > > +=A0=A0=A0 MOUNT_ERRORS_READONLY,=A0=A0=A0 /* remount fs ro on erro=
rs */
> > > > +=A0=A0=A0 MOUNT_ERRORS_CONTINUE,=A0=A0=A0 /* continue on errors */
> > > > +=A0=A0=A0 MOUNT_ERRORS_PANIC,=A0=A0=A0 /* panic on errors */
> > > > +};
> > > > =A0 static inline int f2fs_test_bit(unsigned int nr, char *addr);
> > > > =A0 static inline void f2fs_set_bit(unsigned int nr, char *addr);
> > > > @@ -1818,7 +1823,13 @@ struct f2fs_sb_info {
> > > > =A0=A0=A0=A0=A0 struct workqueue_struct *post_read_wq;=A0=A0=A0 /* =
post read workqueue */
> > > > -=A0=A0=A0 unsigned char errors[MAX_F2FS_ERRORS];=A0=A0=A0 /* error=
 flags */
> > > > +=A0=A0=A0 /*
> > > > +=A0=A0=A0=A0 * If we are in irq context, let's update error inform=
ation into
> > > > +=A0=A0=A0=A0 * on-disk superblock in the work.
> > > > +=A0=A0=A0=A0 */
> > > > +=A0=A0=A0 struct work_struct s_error_work;
> > > > +=A0=A0=A0 unsigned char errors[MAX_F2FS_ERRORS];=A0=A0=A0=A0=A0=A0=
=A0 /* error flags */
> > > > +=A0=A0=A0 unsigned char stop_reason[MAX_STOP_REASON];=A0=A0=A0 /* =
stop reason */
> > > > =A0=A0=A0=A0=A0 spinlock_t error_lock;=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /* protect errors array */
> > > > =A0=A0=A0=A0=A0 bool error_dirty;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/* errors of sb is dirty */
> > > > @@ -3563,7 +3574,8 @@ int f2fs_enable_quota_files(struct f2fs_sb_in=
fo *sbi, bool rdonly);
> > > > =A0 int f2fs_quota_sync(struct super_block *sb, int type);
> > > > =A0 loff_t max_file_blocks(struct inode *inode);
> > > > =A0 void f2fs_quota_off_umount(struct super_block *sb);
> > > > -void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reas=
on);
> > > > +void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned=
 char reason,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 bool irq_context);
> > > > =A0 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char =
error);
> > > > =A0 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
> > > > =A0 int f2fs_sync_fs(struct super_block *sb, int sync);
> > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > index c605a4f2bce2..9df5fac57666 100644
> > > > --- a/fs/f2fs/file.c
> > > > +++ b/fs/f2fs/file.c
> > > > @@ -2197,7 +2197,6 @@ static int f2fs_ioc_shutdown(struct file *fil=
p, unsigned long arg)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D 0;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_stop_check=
point(sbi, false,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 STOP_CP_REASON_SHUTDOWN);
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(sbi, SB=
I_IS_SHUTDOWN);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 trace_f2fs_shut=
down(sbi, in, ret);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > > @@ -2210,7 +2209,6 @@ static int f2fs_ioc_shutdown(struct file *fil=
p, unsigned long arg)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_stop_checkpoint(sbi, false, STOP_C=
P_REASON_SHUTDOWN);
> > > > -=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 thaw_bdev(sb->s_bdev);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > =A0=A0=A0=A0=A0 case F2FS_GOING_DOWN_METASYNC:
> > > > @@ -2219,16 +2217,13 @@ static int f2fs_ioc_shutdown(struct file *f=
ilp, unsigned long arg)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_stop_checkpoint(sbi, false, STOP_C=
P_REASON_SHUTDOWN);
> > > > -=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > =A0=A0=A0=A0=A0 case F2FS_GOING_DOWN_NOSYNC:
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_stop_checkpoint(sbi, false, STOP_C=
P_REASON_SHUTDOWN);
> > > > -=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > =A0=A0=A0=A0=A0 case F2FS_GOING_DOWN_METAFLUSH:
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_sync_meta_pages(sbi, META, LONG_MA=
X, FS_META_IO);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_stop_checkpoint(sbi, false, STOP_C=
P_REASON_SHUTDOWN);
> > > > -=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > =A0=A0=A0=A0=A0 case F2FS_GOING_DOWN_NEED_FSCK:
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(sbi, SBI_NEED_FSCK);
> > > > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > > > index 6466db75af5d..72f165048a3c 100644
> > > > --- a/fs/f2fs/gc.c
> > > > +++ b/fs/f2fs/gc.c
> > > > @@ -59,7 +59,7 @@ static int gc_thread_func(void *data)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (gc_th->gc_wake)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gc_th->gc_wake =3D 0;
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (try_to_freeze()) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (try_to_freeze() || f2fs_readonly(sbi->sb=
)) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 stat_other_skip_bggc_count(=
sbi);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > index afa6f9155bed..3e06b2acc73a 100644
> > > > --- a/fs/f2fs/super.c
> > > > +++ b/fs/f2fs/super.c
> > > > @@ -163,6 +163,7 @@ enum {
> > > > =A0=A0=A0=A0=A0 Opt_nogc_merge,
> > > > =A0=A0=A0=A0=A0 Opt_discard_unit,
> > > > =A0=A0=A0=A0=A0 Opt_memory_mode,
> > > > +=A0=A0=A0 Opt_errors,
> > > > =A0=A0=A0=A0=A0 Opt_err,
> > > > =A0 };
> > > > @@ -241,6 +242,7 @@ static match_table_t f2fs_tokens =3D {
> > > > =A0=A0=A0=A0=A0 {Opt_nogc_merge, "nogc_merge"},
> > > > =A0=A0=A0=A0=A0 {Opt_discard_unit, "discard_unit=3D%s"},
> > > > =A0=A0=A0=A0=A0 {Opt_memory_mode, "memory=3D%s"},
> > > > +=A0=A0=A0 {Opt_errors, "errors=3D%s"},
> > > > =A0=A0=A0=A0=A0 {Opt_err, NULL},
> > > > =A0 };
> > > > @@ -1259,6 +1261,25 @@ static int parse_options(struct super_block =
*sb, char *options, bool is_remount)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(name);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > +=A0=A0=A0=A0=A0=A0=A0 case Opt_errors:
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 name =3D match_strdup(&args[0]);
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!name)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!strcmp(name, "remount-ro"))=
 {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 F2FS_OPTION(sbi).err=
ors =3D
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 MOUNT_ERRORS_READONLY;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 } else if (!strcmp(name, "contin=
ue")) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 F2FS_OPTION(sbi).err=
ors =3D
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 MOUNT_ERRORS_CONTINUE;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 } else if (!strcmp(name, "panic"=
)) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 F2FS_OPTION(sbi).err=
ors =3D
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 MOUNT_ERRORS_PANIC;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 } else {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(name);
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(name);
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 default:
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_err(sbi, "Unrecognized=
 mount option \"%s\" or missing value",
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p);
> > > > @@ -1621,6 +1642,9 @@ static void f2fs_put_super(struct super_block=
 *sb)
> > > > =A0=A0=A0=A0=A0 f2fs_destroy_node_manager(sbi);
> > > > =A0=A0=A0=A0=A0 f2fs_destroy_segment_manager(sbi);
> > > > +=A0=A0=A0 /* flush s_error_work before sbi destroy */
> > > > +=A0=A0=A0 flush_work(&sbi->s_error_work);
> > > > +
> > > > =A0=A0=A0=A0=A0 f2fs_destroy_post_read_wq(sbi);
> > > > =A0=A0=A0=A0=A0 kvfree(sbi->ckpt);
> > > > @@ -2047,6 +2071,13 @@ static int f2fs_show_options(struct seq_file=
 *seq, struct dentry *root)
> > > > =A0=A0=A0=A0=A0 else if (F2FS_OPTION(sbi).memory_mode =3D=3D MEMORY=
_MODE_LOW)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 seq_printf(seq, ",memory=3D%s", "low");
> > > > +=A0=A0=A0 if (F2FS_OPTION(sbi).errors =3D=3D MOUNT_ERRORS_READONLY)
> > > > +=A0=A0=A0=A0=A0=A0=A0 seq_printf(seq, ",errors=3D%s", "remount-ro"=
);
> > > > +=A0=A0=A0 else if (F2FS_OPTION(sbi).errors =3D=3D MOUNT_ERRORS_CON=
TINUE)
> > > > +=A0=A0=A0=A0=A0=A0=A0 seq_printf(seq, ",errors=3D%s", "continue");
> > > > +=A0=A0=A0 else if (F2FS_OPTION(sbi).errors =3D=3D MOUNT_ERRORS_PAN=
IC)
> > > > +=A0=A0=A0=A0=A0=A0=A0 seq_printf(seq, ",errors=3D%s", "panic");
> > > > +
> > > > =A0=A0=A0=A0=A0 return 0;
> > > > =A0 }
> > > > @@ -2069,6 +2100,7 @@ static void default_options(struct f2fs_sb_in=
fo *sbi)
> > > > =A0=A0=A0=A0=A0 F2FS_OPTION(sbi).compress_mode =3D COMPR_MODE_FS;
> > > > =A0=A0=A0=A0=A0 F2FS_OPTION(sbi).bggc_mode =3D BGGC_MODE_ON;
> > > > =A0=A0=A0=A0=A0 F2FS_OPTION(sbi).memory_mode =3D MEMORY_MODE_NORMAL;
> > > > +=A0=A0=A0 F2FS_OPTION(sbi).errors =3D MOUNT_ERRORS_READONLY;
> > > > =A0=A0=A0=A0=A0 sbi->sb->s_flags &=3D ~SB_INLINECRYPT;
> > > > @@ -2270,6 +2302,9 @@ static int f2fs_remount(struct super_block *s=
b, int *flags, char *data)
> > > > =A0=A0=A0=A0=A0 if (err)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto restore_opts;
> > > > +=A0=A0=A0 /* flush outstanding errors before changing fs state */
> > > > +=A0=A0=A0 flush_work(&sbi->s_error_work);
> > > > +
> > > > =A0=A0=A0=A0=A0 /*
> > > > =A0=A0=A0=A0=A0=A0 * Previous and new state of filesystem is RO,
> > > > =A0=A0=A0=A0=A0=A0 * so skip checking GC and FLUSH_MERGE conditions.
> > > > @@ -3863,45 +3898,60 @@ int f2fs_commit_super(struct f2fs_sb_info *=
sbi, bool recover)
> > > > =A0=A0=A0=A0=A0 return err;
> > > > =A0 }
> > > > -void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reas=
on)
> > > > +static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned ch=
ar reason)
> > > > +{
> > > > +=A0=A0=A0 unsigned long flags;
> > > > +
> > > > +=A0=A0=A0 spin_lock_irqsave(&sbi->error_lock, flags);
> > > > +=A0=A0=A0 if (sbi->stop_reason[reason] < ((1 << BITS_PER_BYTE) - 1=
))
> > > > +=A0=A0=A0=A0=A0=A0=A0 sbi->stop_reason[reason]++;
> > > > +=A0=A0=A0 spin_unlock_irqrestore(&sbi->error_lock, flags);
> > > > +}
> > > > +
> > > > +static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
> > > > =A0 {
> > > > =A0=A0=A0=A0=A0 struct f2fs_super_block *raw_super =3D F2FS_RAW_SUP=
ER(sbi);
> > > > +=A0=A0=A0 unsigned long flags;
> > > > =A0=A0=A0=A0=A0 int err;
> > > > =A0=A0=A0=A0=A0 f2fs_down_write(&sbi->sb_lock);
> > > > -=A0=A0=A0 if (raw_super->s_stop_reason[reason] < ((1 << BITS_PER_B=
YTE) - 1))
> > > > -=A0=A0=A0=A0=A0=A0=A0 raw_super->s_stop_reason[reason]++;
> > > > +=A0=A0=A0 spin_lock_irqsave(&sbi->error_lock, flags);
> > > > +=A0=A0=A0 memcpy(raw_super->s_stop_reason, sbi->stop_reason, MAX_S=
TOP_REASON);
> > > > +=A0=A0=A0 spin_unlock_irqrestore(&sbi->error_lock, flags);
> > > > =A0=A0=A0=A0=A0 err =3D f2fs_commit_super(sbi, false);
> > > > -=A0=A0=A0 if (err)
> > > > -=A0=A0=A0=A0=A0=A0=A0 f2fs_err(sbi, "f2fs_commit_super fails to re=
cord reason:%u err:%d",
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 reason, err);
> > > > +
> > > > =A0=A0=A0=A0=A0 f2fs_up_write(&sbi->sb_lock);
> > > > +=A0=A0=A0 if (err)
> > > > +=A0=A0=A0=A0=A0=A0=A0 f2fs_err(sbi, "f2fs_commit_super fails to re=
cord err:%d", err);
> > > > =A0 }
> > > > =A0 static void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned=
 char flag)
> > > > =A0 {
> > > > -=A0=A0=A0 spin_lock(&sbi->error_lock);
> > > > +=A0=A0=A0 unsigned long flags;
> > > > +
> > > > +=A0=A0=A0 spin_lock_irqsave(&sbi->error_lock, flags);
> > > > =A0=A0=A0=A0=A0 if (!test_bit(flag, (unsigned long *)sbi->errors)) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 set_bit(flag, (unsigned long *)sbi->err=
ors);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 sbi->error_dirty =3D true;
> > > > =A0=A0=A0=A0=A0 }
> > > > -=A0=A0=A0 spin_unlock(&sbi->error_lock);
> > > > +=A0=A0=A0 spin_unlock_irqrestore(&sbi->error_lock, flags);
> > > > =A0 }
> > > > =A0 static bool f2fs_update_errors(struct f2fs_sb_info *sbi)
> > > > =A0 {
> > > > +=A0=A0=A0 unsigned long flags;
> > > > =A0=A0=A0=A0=A0 bool need_update =3D false;
> > > > -=A0=A0=A0 spin_lock(&sbi->error_lock);
> > > > +=A0=A0=A0 spin_lock_irqsave(&sbi->error_lock, flags);
> > > > =A0=A0=A0=A0=A0 if (sbi->error_dirty) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 memcpy(F2FS_RAW_SUPER(sbi)->s_errors, s=
bi->errors,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 MAX_F2FS_ERRORS);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 sbi->error_dirty =3D false;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 need_update =3D true;
> > > > =A0=A0=A0=A0=A0 }
> > > > -=A0=A0=A0 spin_unlock(&sbi->error_lock);
> > > > +=A0=A0=A0 spin_unlock_irqrestore(&sbi->error_lock, flags);
> > > > =A0=A0=A0=A0=A0 return need_update;
> > > > =A0 }
> > > > @@ -3925,6 +3975,67 @@ void f2fs_handle_error(struct f2fs_sb_info *=
sbi, unsigned char error)
> > > > =A0=A0=A0=A0=A0 f2fs_up_write(&sbi->sb_lock);
> > > > =A0 }
> > > > +static bool system_going_down(void)
> > > > +{
> > > > +=A0=A0=A0 return system_state =3D=3D SYSTEM_HALT || system_state =
=3D=3D SYSTEM_POWER_OFF
> > > > +=A0=A0=A0=A0=A0=A0=A0 || system_state =3D=3D SYSTEM_RESTART;
> > > > +}
> > > > +
> > > > +void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned=
 char reason,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 bool irq_context)
> > > > +{
> > > > +=A0=A0=A0 struct super_block *sb =3D sbi->sb;
> > > > +=A0=A0=A0 bool shutdown =3D reason =3D=3D STOP_CP_REASON_SHUTDOWN;
> > > > +=A0=A0=A0 bool continue_fs =3D !shutdown &&
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 F2FS_OPTION(sbi).errors =3D=3D M=
OUNT_ERRORS_CONTINUE;
> > > > +
> > > > +=A0=A0=A0 if (!continue_fs && !f2fs_readonly(sb))
> > > > +=A0=A0=A0=A0=A0=A0=A0 set_ckpt_flags(sbi, CP_ERROR_FLAG);
> > > > +
> > > > +=A0=A0=A0 if (!bdev_read_only(sb->s_bdev)) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 save_stop_reason(sbi, reason);
> > > > +
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (irq_context)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 schedule_work(&sbi->s_error_work=
);
> > > > +=A0=A0=A0=A0=A0=A0=A0 else
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_record_stop_reason(sbi);
> > > > +=A0=A0=A0 }
> > > > +
> > > > +=A0=A0=A0 /*
> > > > +=A0=A0=A0=A0 * We force ERRORS_RO behavior when system is rebootin=
g. Otherwise we
> > > > +=A0=A0=A0=A0 * could panic during 'reboot -f' as the underlying de=
vice got already
> > > > +=A0=A0=A0=A0 * disabled.
> > > > +=A0=A0=A0=A0 */
> > > > +=A0=A0=A0 if (F2FS_OPTION(sbi).errors =3D=3D MOUNT_ERRORS_PANIC &&
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !shutdown && !system=
_going_down() &&
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !is_sbi_flag_set(sbi=
, SBI_IS_SHUTDOWN))
> > > > +=A0=A0=A0=A0=A0=A0=A0 panic("F2FS-fs (device %s): panic forced aft=
er error\n",
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 sb->s_id);
> > > > +
> > > > +=A0=A0=A0 if (shutdown)
> > > > +=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > > > +
> > > > +=A0=A0=A0 /* continue filesystem operators if errors=3Dcontinue */
> > > > +=A0=A0=A0 if (continue_fs || f2fs_readonly(sb))
> > > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > > +
> > > > +=A0=A0=A0 f2fs_warn(sbi, "Remounting filesystem read-only");
> > > > +=A0=A0=A0 /*
> > > > +=A0=A0=A0=A0 * Make sure updated value of ->s_mount_flags will be =
visible before
> > > > +=A0=A0=A0=A0 * ->s_flags update
> > > > +=A0=A0=A0=A0 */
> > > > +=A0=A0=A0 smp_wmb();
> > > > +=A0=A0=A0 sb->s_flags |=3D SB_RDONLY;
> > > > +}
> > > > +
> > > > +static void f2fs_record_error_work(struct work_struct *work)
> > > > +{
> > > > +=A0=A0=A0 struct f2fs_sb_info *sbi =3D container_of(work,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct f=
2fs_sb_info, s_error_work);
> > > > +
> > > > +=A0=A0=A0 f2fs_record_stop_reason(sbi);
> > > > +}
> > > > +
> > > > =A0 static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
> > > > =A0 {
> > > > =A0=A0=A0=A0=A0 struct f2fs_super_block *raw_super =3D F2FS_RAW_SUP=
ER(sbi);
> > > > @@ -4205,8 +4316,10 @@ static int f2fs_fill_super(struct super_bloc=
k *sb, void *data, int silent)
> > > > =A0=A0=A0=A0=A0 if (err)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto free_bio_info;
> > > > +=A0=A0=A0 INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
> > > > =A0=A0=A0=A0=A0 spin_lock_init(&sbi->error_lock);
> > > > =A0=A0=A0=A0=A0 memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_E=
RRORS);
> > > > +=A0=A0=A0 memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_S=
TOP_REASON);
> > > > =A0=A0=A0=A0=A0 init_f2fs_rwsem(&sbi->cp_rwsem);
> > > > =A0=A0=A0=A0=A0 init_f2fs_rwsem(&sbi->quota_sem);
> > > > @@ -4542,6 +4655,8 @@ static int f2fs_fill_super(struct super_block=
 *sb, void *data, int silent)
> > > > =A0=A0=A0=A0=A0 f2fs_destroy_segment_manager(sbi);
> > > > =A0 stop_ckpt_thread:
> > > > =A0=A0=A0=A0=A0 f2fs_stop_ckpt_thread(sbi);
> > > > +=A0=A0=A0 /* flush s_error_work before sbi destroy */
> > > > +=A0=A0=A0 flush_work(&sbi->s_error_work);
> > > > =A0=A0=A0=A0=A0 f2fs_destroy_post_read_wq(sbi);
> > > > =A0 free_devices:
> > > > =A0=A0=A0=A0=A0 destroy_device_list(sbi);
> > > > -- =

> > > > 2.36.1
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

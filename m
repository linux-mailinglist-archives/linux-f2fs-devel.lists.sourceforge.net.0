Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F4B4D5A69
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Mar 2022 06:22:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nSXjr-0006v8-2g; Fri, 11 Mar 2022 05:22:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nSXjj-0006um-3L
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Mar 2022 05:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mDeEHIlQVrya1rE2r2goriT79IGdI5UrfUgh4sqmBx0=; b=RDOqTxqTiMhBxHkSGUeCUJTJcI
 2FbdwrCokcOuTz2RNGPe/O4nDfrOXZyoGT/u69KmfNhOjU4G1Vm/1F2mN51ab+PfpZJ28NhrZzHuw
 HCTW0VPgDCEhkysR77O4GWHJcwvAYK1UCocV1v91Y+t8Xk/8yNS1pCwSQHAjG9H/T6qw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mDeEHIlQVrya1rE2r2goriT79IGdI5UrfUgh4sqmBx0=; b=UXg9eTp9GodCt0bBPxDuYhsL5V
 RohAm3Zh3mFuR61d4pw9cZ6ON7fNSP3KkHbH1LWEnrDGHOiy/s6V2y/hCTgOXcDFLiWSDRQDtycsu
 rFPTjyFn+hmDopvG52cvL5OLvUv7KZ3XaPQg6VmOd6Lot4hbAVytbSWANYbz9//QR1Rs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nSXjg-00BkvF-96
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Mar 2022 05:22:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F0F7BB8285A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Mar 2022 05:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891D5C340EC;
 Fri, 11 Mar 2022 05:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646976156;
 bh=oL9xNmpFzV9lCLgpLRHPTjZe5BUE6eOLLbZMuT6xG3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rL3uE1rovFFy+ykodgxYGrbzyrq74oAm497mrTPmcEfeKnW8fw7QdAkbkIWHW860O
 OaQfmJrlg1slxyby76HNfoTWhyRjw8iO7JWtZPP0MwRW7uCtiSXmyWeSUwO+BvNpfB
 TZmrfH/L0WKNKVsOi2dhunnBRQSig+ODCRxD2h6ZvjXKSmflUIE8TajqUrpNUmnNoe
 s+tqDSUmYzEFF/4i/x4Jo8xhTrX8RTYOwrO1usfRXqG4iEhPZfwem+JmzgTeh42yCi
 Sx90+1kN4r01P+TaqMRA3JEeNdJSxrn6TaIb+eEPBjXq0FKpEEZSTe/DhFX5BlsHhF
 GrYrM16MF+aYA==
Date: Thu, 10 Mar 2022 21:22:35 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YircmwS2pYVutF8R@google.com>
References: <20220309214834.3408741-1-jaegeuk@kernel.org>
 <2a5564bb-463e-d163-0042-34fad42e2e46@kernel.org>
 <a475c925-cfe4-abf7-f909-0d883df391a2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a475c925-cfe4-abf7-f909-0d883df391a2@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/11, Chao Yu wrote: > Jaegeuk, > > Could you please send
 v2 patch to mailing list? as I saw the revised > one has been merged in dev
 branch. Oops, it seems I sent a wrong patch as v2. I sent it again. 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nSXjg-00BkvF-96
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: evict inode cache for frozen fs
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

On 03/11, Chao Yu wrote:
> Jaegeuk,
> =

> Could you please send v2 patch to mailing list? as I saw the revised
> one has been merged in dev branch.

Oops, it seems I sent a wrong patch as v2. I sent it again.

> =

> Otherwise, I've no idea where I should reply "Reviewed-by" tag to...
> =

> Thanks,
> =

> On 2022/3/10 9:53, Chao Yu wrote:
> > On 2022/3/10 5:48, Jaegeuk Kim wrote:
> > > Let's purge inode cache in order to avoid the below deadlock.
> > > =

> > > [freeze test]=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 shrinkder
> > > freeze_super
> > > =A0 - pwercpu_down_write(SB_FREEZE_FS)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - super_cache_scan
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - down_read(&sb->s_u=
mount)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - prune_icache=
_sb
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - dispose_l=
ist
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - evict
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - f2f=
s_evict_inode
> > > thaw_super
> > > =A0 - down_write(&sb->s_umount);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - __p=
ercpu_down_read(SB_FREEZE_FS)
> > =

> > Ah, finally we catch this. :)
> > =

> > > =

> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > ---
> > > =A0 fs/f2fs/debug.c | 1 +
> > > =A0 fs/f2fs/f2fs.h=A0 | 1 +
> > > =A0 fs/f2fs/inode.c | 6 ++++--
> > > =A0 fs/f2fs/super.c | 4 ++++
> > > =A0 4 files changed, 10 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> > > index 9a13902c7702..cba5eab24595 100644
> > > --- a/fs/f2fs/debug.c
> > > +++ b/fs/f2fs/debug.c
> > > @@ -338,6 +338,7 @@ static char *s_flag[] =3D {
> > > =A0=A0=A0=A0=A0 [SBI_QUOTA_SKIP_FLUSH]=A0=A0=A0 =3D " quota_skip_flus=
h",
> > > =A0=A0=A0=A0=A0 [SBI_QUOTA_NEED_REPAIR]=A0=A0=A0 =3D " quota_need_rep=
air",
> > > =A0=A0=A0=A0=A0 [SBI_IS_RESIZEFS]=A0=A0=A0 =3D " resizefs",
> > > +=A0=A0=A0 [SBI_IS_FREEZING]=A0=A0=A0 =3D " freezefs",
> > =

> > Could you please update description of "sb_status" entry in
> > Documentation/ABI/testing/sysfs-fs-f2fs as well?
> > =

> > Thanks,
> > =

> > > =A0 };
> > > =A0 static int stat_show(struct seq_file *s, void *v)
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index 68d791ec8b27..da729f53daa8 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -1293,6 +1293,7 @@ enum {
> > > =A0=A0=A0=A0=A0 SBI_QUOTA_SKIP_FLUSH,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 /* skip flushing quota in current CP */
> > > =A0=A0=A0=A0=A0 SBI_QUOTA_NEED_REPAIR,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 /* quota file may be corrupted */
> > > =A0=A0=A0=A0=A0 SBI_IS_RESIZEFS,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* =
resizefs is in process */
> > > +=A0=A0=A0 SBI_IS_FREEZING,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* freez=
efs is in process */
> > > =A0 };
> > > =A0 enum {
> > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > index ab8e0c06c78c..71f232dcf3c2 100644
> > > --- a/fs/f2fs/inode.c
> > > +++ b/fs/f2fs/inode.c
> > > @@ -778,7 +778,8 @@ void f2fs_evict_inode(struct inode *inode)
> > > =A0=A0=A0=A0=A0 f2fs_remove_ino_entry(sbi, inode->i_ino, UPDATE_INO);
> > > =A0=A0=A0=A0=A0 f2fs_remove_ino_entry(sbi, inode->i_ino, FLUSH_INO);
> > > -=A0=A0=A0 sb_start_intwrite(inode->i_sb);
> > > +=A0=A0=A0 if (!is_sbi_flag_set(sbi, SBI_IS_FREEZING))
> > > +=A0=A0=A0=A0=A0=A0=A0 sb_start_intwrite(inode->i_sb);
> > > =A0=A0=A0=A0=A0 set_inode_flag(inode, FI_NO_ALLOC);
> > > =A0=A0=A0=A0=A0 i_size_write(inode, 0);
> > > =A0 retry:
> > > @@ -809,7 +810,8 @@ void f2fs_evict_inode(struct inode *inode)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (dquot_initialize_needed(inode))
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(sbi, SBI_QUOTA_N=
EED_REPAIR);
> > > =A0=A0=A0=A0=A0 }
> > > -=A0=A0=A0 sb_end_intwrite(inode->i_sb);
> > > +=A0=A0=A0 if (!is_sbi_flag_set(sbi, SBI_IS_FREEZING))
> > > +=A0=A0=A0=A0=A0=A0=A0 sb_end_intwrite(inode->i_sb);
> > > =A0 no_delete:
> > > =A0=A0=A0=A0=A0 dquot_drop(inode);
> > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > index 8e3840973077..4b570b5c2674 100644
> > > --- a/fs/f2fs/super.c
> > > +++ b/fs/f2fs/super.c
> > > @@ -1663,11 +1663,15 @@ static int f2fs_freeze(struct super_block *sb)
> > > =A0=A0=A0=A0=A0 /* ensure no checkpoint required */
> > > =A0=A0=A0=A0=A0 if (!llist_empty(&F2FS_SB(sb)->cprc_info.issue_list))
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > +
> > > +=A0=A0=A0 /* to avoid deadlock on f2fs_evict_inode->SB_FREEZE_FS */
> > > +=A0=A0=A0 set_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
> > > =A0=A0=A0=A0=A0 return 0;
> > > =A0 }
> > > =A0 static int f2fs_unfreeze(struct super_block *sb)
> > > =A0 {
> > > +=A0=A0=A0 clear_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
> > > =A0=A0=A0=A0=A0 return 0;
> > > =A0 }
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

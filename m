Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5E2744431
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jun 2023 23:59:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qFM9N-000482-UZ;
	Fri, 30 Jun 2023 21:59:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qFM9M-00047v-Bg
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jun 2023 21:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LfaNd4H/yqHn/KlvZfj/Wint8Jy1G3LM+FVhS/YgzB0=; b=c1XZO44E8Z7dOL/QHtms6j00XC
 TrGGh/1JtZLQVGtMbAQuyV+UtxBb2ztfMuzKSQQiY0Ja6aJgnl3GpqPHnv3Cp6duiysCyuKJNf509
 d/nhA+QKfs2Zn8oet+YdaNcCfBrDkz51+DlD3v6YhjMck//r4bllTqG6YvGNYIhH279M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LfaNd4H/yqHn/KlvZfj/Wint8Jy1G3LM+FVhS/YgzB0=; b=BDXJgIBhYcxni8VW0Vbm8SUYWr
 DanLrUWmEA2FyJ4gA+yWeq7trS4Lgda1pmPaSX0+goVCRusqy3fbtCKkqr3cb+bcVWsCKYos+spFn
 /II8j8wyVCIJnPtPZb8r4dwzSmSlsw0gBuqjrDBtbcD7u7J46+CLsXfKIFL30zNQqbhk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qFM9M-002UEd-7M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jun 2023 21:59:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B991D617CE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Jun 2023 21:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119B7C433C8;
 Fri, 30 Jun 2023 21:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688162366;
 bh=4CzdQn4ciJqKeDlkI0KBYAkchYKjJViZEWBLKEznCcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GcehTUwmbgNoxCn5YEanOegVLp2qgAyGRTKDq4K6M+wNpSs0ggjGj4HStjCczb5WB
 AZJdh7GgORV2paYXwzJPbFOc44+cn+Z0C4MhcvHgcDSbFiF5FmDUGrvDVMr36YifLz
 42049RufavE4z2wdHRnHchYCWFB9KicX3OW7pBu8KbZP3hpBseyOeeeQ2+AzNp7elG
 vJ3QOt/FgI+kzDqmgFzBL7tLGyPUQqLGirSEoq+n/vMvr+GDJdAQZiU68cNHNySOTM
 zd5p+6pPCajsn53qeLmbtbJ6GQWFB/Er3WEARIQbDfbXSQ8WgQWElK0SmTcIZLFlIW
 8dV9YkYpT6HHw==
Date: Fri, 30 Jun 2023 14:59:24 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZJ9QPLd6LF9dy5bm@google.com>
References: <20230613233940.3643362-1-jaegeuk@kernel.org>
 <e5788348-b547-8e10-21af-90544f3aa75c@kernel.org>
 <ZJvqZTX1SIwvDCUn@google.com>
 <e4ee00c4-c20a-4613-87ec-3b144d6252ed@kernel.org>
 <ZJx8/0eOB4PcftQe@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZJx8/0eOB4PcftQe@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/28, Jaegeuk Kim wrote: > On 06/28, Chao Yu wrote: >
 > On 2023/6/28 16:08,
 Jaegeuk Kim wrote: > > > Thread #1: > > > > > > [122554.641906][
 T92] f2fs_getxattr+0xd4/0x5fc > > > -> waiting for f2fs [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qFM9M-002UEd-7M
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix deadlock in i_xattr_sem and
 inode page lock and fix the original issue
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/28, Jaegeuk Kim wrote:
> On 06/28, Chao Yu wrote:
> > On 2023/6/28 16:08, Jaegeuk Kim wrote:
> > > Thread #1:
> > > 
> > > [122554.641906][   T92]  f2fs_getxattr+0xd4/0x5fc
> > >      -> waiting for f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> > > 
> > > [122554.641927][   T92]  __f2fs_get_acl+0x50/0x284
> > > [122554.641948][   T92]  f2fs_init_acl+0x84/0x54c
> > > [122554.641969][   T92]  f2fs_init_inode_metadata+0x460/0x5f0
> > > [122554.641990][   T92]  f2fs_add_inline_entry+0x11c/0x350
> > >      -> Locked dir->inode_page by f2fs_get_node_page()
> > > 
> > > [122554.642009][   T92]  f2fs_do_add_link+0x100/0x1e4
> > > [122554.642025][   T92]  f2fs_create+0xf4/0x22c
> > > [122554.642047][   T92]  vfs_create+0x130/0x1f4
> > > 
> > > Thread #2:
> > > 
> > > [123996.386358][   T92]  __get_node_page+0x8c/0x504
> > >      -> waiting for dir->inode_page lock
> > > 
> > > [123996.386383][   T92]  read_all_xattrs+0x11c/0x1f4
> > > [123996.386405][   T92]  __f2fs_setxattr+0xcc/0x528
> > > [123996.386424][   T92]  f2fs_setxattr+0x158/0x1f4
> > >      -> f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
> > > 
> > > [123996.386443][   T92]  __f2fs_set_acl+0x328/0x430
> > > [123996.386618][   T92]  f2fs_set_acl+0x38/0x50
> > > [123996.386642][   T92]  posix_acl_chmod+0xc8/0x1c8
> > > [123996.386669][   T92]  f2fs_setattr+0x5e0/0x6bc
> > > [123996.386689][   T92]  notify_change+0x4d8/0x580
> > > [123996.386717][   T92]  chmod_common+0xd8/0x184
> > > [123996.386748][   T92]  do_fchmodat+0x60/0x124
> > > [123996.386766][   T92]  __arm64_sys_fchmodat+0x28/0x3c
> > 
> > Back to the race condition, my question is why we can chmod on inode before
> > it has been created?
> 
> This is touching the directory.

Chao,

Do you have other concern? Otherwise, I'll include this into the next pull
request.

Thanks,

> 
> > 
> > Thanks,
> > 
> > > 
> > > Fixes: 27161f13e3c3 "f2fs: avoid race in between read xattr & write xattr"
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > ---
> > >   fs/f2fs/dir.c   | 9 ++++++++-
> > >   fs/f2fs/xattr.c | 6 ++++--
> > >   2 files changed, 12 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> > > index 887e55988450..d635c58cf5a3 100644
> > > --- a/fs/f2fs/dir.c
> > > +++ b/fs/f2fs/dir.c
> > > @@ -775,8 +775,15 @@ int f2fs_add_dentry(struct inode *dir, const struct f2fs_filename *fname,
> > >   {
> > >   	int err = -EAGAIN;
> > > -	if (f2fs_has_inline_dentry(dir))
> > > +	if (f2fs_has_inline_dentry(dir)) {
> > > +		/*
> > > +		 * Should get i_xattr_sem to keep the lock order:
> > > +		 * i_xattr_sem -> inode_page lock used by f2fs_setxattr.
> > > +		 */
> > > +		f2fs_down_read(&F2FS_I(dir)->i_xattr_sem);
> > >   		err = f2fs_add_inline_entry(dir, fname, inode, ino, mode);
> > > +		f2fs_up_read(&F2FS_I(dir)->i_xattr_sem);
> > > +	}
> > >   	if (err == -EAGAIN)
> > >   		err = f2fs_add_regular_entry(dir, fname, inode, ino, mode);
> > > diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> > > index 213805d3592c..476b186b90a6 100644
> > > --- a/fs/f2fs/xattr.c
> > > +++ b/fs/f2fs/xattr.c
> > > @@ -528,10 +528,12 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
> > >   	if (len > F2FS_NAME_LEN)
> > >   		return -ERANGE;
> > > -	f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> > > +	if (!ipage)
> > > +		f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> > >   	error = lookup_all_xattrs(inode, ipage, index, len, name,
> > >   				&entry, &base_addr, &base_size, &is_inline);
> > > -	f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
> > > +	if (!ipage)
> > > +		f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
> > >   	if (error)
> > >   		return error;
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0837B73E03E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jun 2023 15:11:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDm0I-0002Ei-VV;
	Mon, 26 Jun 2023 13:11:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qDm0H-0002Ec-HQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 13:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JR5gWuGE8p5LNBTbmjLBS5zj5BbLwMtbvEcw/mMegYA=; b=SGmrK1d9T8ATKQ3IdGhWlJUcpU
 jJKk6on9M4QB116x4+5iJfsJjZAAt68Xt/rvTBg5crV9f+Z/VM6/JuY2ylp7He7xsC9kP/xozRjNB
 sWvpcQR5wua5qw8yMzBCIOY5uvRO7fO5H7ubyrEKv58zfD1iUU+CUatg4z3TT0yEW2Ds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JR5gWuGE8p5LNBTbmjLBS5zj5BbLwMtbvEcw/mMegYA=; b=mnHW320gTgVr/B3evguJ55ESU6
 CuJcGRILLLU/jnap5Rw2YEJIVAAnDiJRK5wv3Jl5yS2+lYhs8aDbw2QCoAsYDf1p2x4BbbWV5FV18
 jVoLwS5mLl60u4K6Q6sFj2vAXsrnKXvJwmVIl5iHaLlqI4piQkL/H+vJUqbH2wcJ+GTY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDm0H-00FEIu-0A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 13:11:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96D6D60DF4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Jun 2023 13:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6ED5C433C8;
 Mon, 26 Jun 2023 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687785091;
 bh=QWLhY0WmgE3ZgYjbHZWwDgy3RC+cobEngYywAsB2rbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YvtoOULIkY8ThUrAIHWVodHnqdwU+JErImxeJGmzYo7XJPTBstGcCwT40iZSxa6um
 Xas1S+mzFiuJy2dOT9vD3M2cqtD0jsZCtRR5wbOdodYHFVmuD6epegUQ7CaiLZBZuZ
 hUEkjvtkPKYPX5FKjQG4WT3vQpVw2sx+IXNaxAP6MMSQ+5KrEVSm9+I69Tj7rcan81
 WnKpV1GbvQctRiVxqNv0B3uakgx7Zt7jhsypCjbsNiVg7VE3gxIHKdcJLXw15Obt9r
 r84TeKOc40SvwVdquxLOiGRQClKwoS5GK0Tb1DzvZGbiYMO7LHl7W0ZRAvo0VhCX+P
 ByFSE32nZwbIg==
Date: Mon, 26 Jun 2023 06:11:29 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZJmOgRADvLP/4rMJ@google.com>
References: <20230613233940.3643362-1-jaegeuk@kernel.org>
 <e5788348-b547-8e10-21af-90544f3aa75c@kernel.org>
 <d0ec4a04-ab81-7e71-ad56-5b22e1815919@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0ec4a04-ab81-7e71-ad56-5b22e1815919@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 06/25, Chao Yu wrote: > On 2023/6/25 15:26, Chao Yu wrote:
    > > One concern below: > > > > Thread A:                    Thread B: > >
    - f2fs_getxattr > >  - lookup_all_xattrs > >   - read_inline_xat [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qDm0H-00FEIu-0A
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove i_xattr_sem to avoid deadlock
 and fix the original issue
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/25, Chao Yu wrote:
> On 2023/6/25 15:26, Chao Yu wrote:
> > One concern below:
> > =

> > Thread A:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Thre=
ad B:
> > - f2fs_getxattr
> >  =A0- lookup_all_xattrs
> >  =A0 - read_inline_xattr
> >  =A0=A0 - f2fs_get_node_page(ino)
> >  =A0=A0 - memcpy inline xattr
> >  =A0=A0 - f2fs_put_page
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
- f2fs_setxattr
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 - __f2fs_setxattr
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 - __f2fs_setxattr
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 - write_all_xattrs
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 - write xnode and inode
> >  =A0 ---> inline xattr may out of update here.
> >  =A0 - read_xattr_block
> >  =A0=A0 - f2fs_get_node_page(xnid)
> >  =A0=A0 - memcpy xnode xattr
> >  =A0=A0 - f2fs_put_page
> > =

> > Do we need to keep xattr_{get,set} being atomical operation?
> =

> It seems xfstest starts to complain w/ below message...

I don't see any failure. Which test do you see?

> =

> [ 3400.856443] F2FS-fs (vdc): inode (2187) has invalid last xattr entry, =
entry_size: 21468
> [ 3400.864042] F2FS-fs (vdc): inode (1595) has invalid last xattr entry, =
entry_size: 26580
> [ 3400.865764] F2FS-fs (vdc): inode (2187) has invalid last xattr entry, =
entry_size: 21468
> [ 3400.880067] F2FS-fs (vdc): inode (9839) has corrupted xattr
> [ 3400.880714] F2FS-fs (vdc): inode (10855) has corrupted xattr
> =

> Thanks,
> =

> > =

> > Thanks,
> > =

> > > =

> > > I think we don't need to truncate xattr pages eagerly which introduce=
s lots of
> > > data races without big benefits.
> > > =

> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > ---
> > > =A0 fs/f2fs/f2fs.h=A0 |=A0 1 -
> > > =A0 fs/f2fs/super.c |=A0 1 -
> > > =A0 fs/f2fs/xattr.c | 31 ++++++++-----------------------
> > > =A0 3 files changed, 8 insertions(+), 25 deletions(-)
> > > =

> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index 3f5b161dd743..7b9af2d51656 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -838,7 +838,6 @@ struct f2fs_inode_info {
> > > =A0=A0=A0=A0=A0 /* avoid racing between foreground op and gc */
> > > =A0=A0=A0=A0=A0 struct f2fs_rwsem i_gc_rwsem[2];
> > > -=A0=A0=A0 struct f2fs_rwsem i_xattr_sem; /* avoid racing between rea=
ding and changing EAs */
> > > =A0=A0=A0=A0=A0 int i_extra_isize;=A0=A0=A0=A0=A0=A0=A0 /* size of ex=
tra space located in i_addr */
> > > =A0=A0=A0=A0=A0 kprojid_t i_projid;=A0=A0=A0=A0=A0=A0=A0 /* id for pr=
oject quota */
> > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > index 1b2c788ed80d..c917fa771f0e 100644
> > > --- a/fs/f2fs/super.c
> > > +++ b/fs/f2fs/super.c
> > > @@ -1418,7 +1418,6 @@ static struct inode *f2fs_alloc_inode(struct su=
per_block *sb)
> > > =A0=A0=A0=A0=A0 INIT_LIST_HEAD(&fi->gdirty_list);
> > > =A0=A0=A0=A0=A0 init_f2fs_rwsem(&fi->i_gc_rwsem[READ]);
> > > =A0=A0=A0=A0=A0 init_f2fs_rwsem(&fi->i_gc_rwsem[WRITE]);
> > > -=A0=A0=A0 init_f2fs_rwsem(&fi->i_xattr_sem);
> > > =A0=A0=A0=A0=A0 /* Will be used by directory only */
> > > =A0=A0=A0=A0=A0 fi->i_dir_level =3D F2FS_SB(sb)->dir_level;
> > > diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> > > index 213805d3592c..bdc8a55085a2 100644
> > > --- a/fs/f2fs/xattr.c
> > > +++ b/fs/f2fs/xattr.c
> > > @@ -433,7 +433,7 @@ static inline int write_all_xattrs(struct inode *=
inode, __u32 hsize,
> > > =A0 {
> > > =A0=A0=A0=A0=A0 struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > > =A0=A0=A0=A0=A0 size_t inline_size =3D inline_xattr_size(inode);
> > > -=A0=A0=A0 struct page *in_page =3D NULL;
> > > +=A0=A0=A0 struct page *in_page =3D ipage;
> > > =A0=A0=A0=A0=A0 void *xattr_addr;
> > > =A0=A0=A0=A0=A0 void *inline_addr =3D NULL;
> > > =A0=A0=A0=A0=A0 struct page *xpage;
> > > @@ -446,29 +446,19 @@ static inline int write_all_xattrs(struct inode=
 *inode, __u32 hsize,
> > > =A0=A0=A0=A0=A0 /* write to inline xattr */
> > > =A0=A0=A0=A0=A0 if (inline_size) {
> > > -=A0=A0=A0=A0=A0=A0=A0 if (ipage) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 inline_addr =3D inline_xattr_addr(=
inode, ipage);
> > > -=A0=A0=A0=A0=A0=A0=A0 } else {
> > > +=A0=A0=A0=A0=A0=A0=A0 if (!in_page) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 in_page =3D f2fs_get_node_pag=
e(sbi, inode->i_ino);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(in_page)) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_alloc_nid_fa=
iled(sbi, new_nid);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(in=
_page);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 inline_addr =3D inline_xattr_addr(=
inode, in_page);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > +=A0=A0=A0=A0=A0=A0=A0 inline_addr =3D inline_xattr_addr(inode, in_pa=
ge);
> > > -=A0=A0=A0=A0=A0=A0=A0 f2fs_wait_on_page_writeback(ipage ? ipage : in=
_page,
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 NODE, true, true);
> > > -=A0=A0=A0=A0=A0=A0=A0 /* no need to use xattr node block */
> > > +=A0=A0=A0=A0=A0=A0=A0 f2fs_wait_on_page_writeback(in_page, NODE, tru=
e, true);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (hsize <=3D inline_size) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D f2fs_truncate_xattr_node(i=
node);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_alloc_nid_failed(sbi, new_nid=
);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (err) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_put_page(in_page,=
 1);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return err;
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 memcpy(inline_addr, txattr_ad=
dr, inline_size);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_page_dirty(ipage ? ipage : in_=
page);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_page_dirty(in_page);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto in_page_out;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > =A0=A0=A0=A0=A0 }
> > > @@ -502,12 +492,13 @@ static inline int write_all_xattrs(struct inode=
 *inode, __u32 hsize,
> > > =A0=A0=A0=A0=A0 memcpy(xattr_addr, txattr_addr + inline_size, VALID_X=
ATTR_BLOCK_SIZE);
> > > =A0=A0=A0=A0=A0 if (inline_size)
> > > -=A0=A0=A0=A0=A0=A0=A0 set_page_dirty(ipage ? ipage : in_page);
> > > +=A0=A0=A0=A0=A0=A0=A0 set_page_dirty(in_page);
> > > =A0=A0=A0=A0=A0 set_page_dirty(xpage);
> > > =A0=A0=A0=A0=A0 f2fs_put_page(xpage, 1);
> > > =A0 in_page_out:
> > > -=A0=A0=A0 f2fs_put_page(in_page, 1);
> > > +=A0=A0=A0 if (in_page !=3D ipage)
> > > +=A0=A0=A0=A0=A0=A0=A0 f2fs_put_page(in_page, 1);
> > > =A0=A0=A0=A0=A0 return err;
> > > =A0 }
> > > @@ -528,10 +519,8 @@ int f2fs_getxattr(struct inode *inode, int index=
, const char *name,
> > > =A0=A0=A0=A0=A0 if (len > F2FS_NAME_LEN)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ERANGE;
> > > -=A0=A0=A0 f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> > > =A0=A0=A0=A0=A0 error =3D lookup_all_xattrs(inode, ipage, index, len,=
 name,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &entry, &base_add=
r, &base_size, &is_inline);
> > > -=A0=A0=A0 f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
> > > =A0=A0=A0=A0=A0 if (error)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return error;
> > > @@ -565,9 +554,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry, cha=
r *buffer, size_t buffer_size)
> > > =A0=A0=A0=A0=A0 int error;
> > > =A0=A0=A0=A0=A0 size_t rest =3D buffer_size;
> > > -=A0=A0=A0 f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> > > =A0=A0=A0=A0=A0 error =3D read_all_xattrs(inode, NULL, &base_addr);
> > > -=A0=A0=A0 f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
> > > =A0=A0=A0=A0=A0 if (error)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return error;
> > > @@ -794,9 +781,7 @@ int f2fs_setxattr(struct inode *inode, int index,=
 const char *name,
> > > =A0=A0=A0=A0=A0 f2fs_balance_fs(sbi, true);
> > > =A0=A0=A0=A0=A0 f2fs_lock_op(sbi);
> > > -=A0=A0=A0 f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
> > > =A0=A0=A0=A0=A0 err =3D __f2fs_setxattr(inode, index, name, value, si=
ze, ipage, flags);
> > > -=A0=A0=A0 f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
> > > =A0=A0=A0=A0=A0 f2fs_unlock_op(sbi);
> > > =A0=A0=A0=A0=A0 f2fs_update_time(sbi, REQ_TIME);
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

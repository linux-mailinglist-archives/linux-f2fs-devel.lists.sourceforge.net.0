Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69992740A91
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jun 2023 10:07:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qEQD0-0007EQ-9M;
	Wed, 28 Jun 2023 08:07:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qEQCx-0007EK-QU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jun 2023 08:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gbyGZHfHD3A0CThh/P1FB1PwsjFeBiZywR3Y8Z8tBEM=; b=PhX/6RwSNFMqKXl1FmGjrx2Unb
 C8q3Ycs99VIX3HIT3ZmWOqaMFW+7NOCVwMAdCVti/u3IzJsP2xnwnHlj3pTAxl1SsqpFelkLRQ12t
 7azCPC87vuUQn0nL0XvG8a+bjQUhrA8w/MV36XfecYLIKVQ9yyV4ZBOi4rQVmWdFjf/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gbyGZHfHD3A0CThh/P1FB1PwsjFeBiZywR3Y8Z8tBEM=; b=ZARfRcDOqtN3Eu6Y1LOXRIfVE2
 Y6rvsHB7tdGRfKbbNKLj7D7Udf+unfSisKgp4M4qOHT1VHkDzeRcc4AYHb4zdSqdHg9oXAanVXpWf
 dLKQQDhQUHBLDj4ZpN4tWtih4o3d2AFqpPpx56oXPhv5dpTcqNGp6Me0PjqiuQNFtD4M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qEQCx-0004Pt-1m for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jun 2023 08:07:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A2F661325
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Jun 2023 08:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72539C433C8;
 Wed, 28 Jun 2023 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687939636;
 bh=IOSxMIm++J/AtvG+30u6yhS8IDwIG/Uc3jBJXaL2v1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZJeqKGgVWg5IBQHSCInLraK5jpK5xXuP6otl/gct3F4+5nWR4zd2ROPP+cAILOXCs
 LIhaNN/35LDYehBBBm6cL2ZTEW6e4H0hp9egR1zSqoqeFmGxNKQX8T6lRAIAs/Z8vI
 iUV1Gft01eER0aYZYL01KgzOev0M36fSykrcU95DrvbMxIyJcWzEJ8QBvf9JWrlLuu
 LJcycs+ldlaQNuFuvG+c8aM0EkqM0ZNF24/wYnxeRVukMTwAwf7OtxLmJ1uHDJkzlI
 sV2XASFW8pWhoe30lJYXuLUjKnX8iqxVWP+YlzWQT8nnLpAMghv8tluO1lHZMTwui8
 VsnVAIMgGl3tw==
Date: Wed, 28 Jun 2023 01:07:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZJvqMpWiit24BnXL@google.com>
References: <20230613233940.3643362-1-jaegeuk@kernel.org>
 <e5788348-b547-8e10-21af-90544f3aa75c@kernel.org>
 <d0ec4a04-ab81-7e71-ad56-5b22e1815919@kernel.org>
 <ZJmOgRADvLP/4rMJ@google.com>
 <8a370c8e-3b5f-5ea7-5839-76896d1ec69e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a370c8e-3b5f-5ea7-5839-76896d1ec69e@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 06/27, Chao Yu wrote: > On 2023/6/26 21:11, Jaegeuk Kim
    wrote: > > On 06/25, Chao Yu wrote: > > > On 2023/6/25 15:26, Chao Yu wrote:
    > > > > One concern below: > > > > > > > > Thread A:             [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qEQCx-0004Pt-1m
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

On 06/27, Chao Yu wrote:
> On 2023/6/26 21:11, Jaegeuk Kim wrote:
> > On 06/25, Chao Yu wrote:
> > > On 2023/6/25 15:26, Chao Yu wrote:
> > > > One concern below:
> > > > =

> > > > Thread A:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
Thread B:
> > > > - f2fs_getxattr
> > > >   =A0- lookup_all_xattrs
> > > >   =A0 - read_inline_xattr
> > > >   =A0=A0 - f2fs_get_node_page(ino)
> > > >   =A0=A0 - memcpy inline xattr
> > > >   =A0=A0 - f2fs_put_page
> > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 - f2fs_setxattr
> > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 - __f2fs_setxattr
> > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 - __f2fs_setxattr
> > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 - write_all_xattrs
> > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 - write xnode and inode
> > > >   =A0 ---> inline xattr may out of update here.
> > > >   =A0 - read_xattr_block
> > > >   =A0=A0 - f2fs_get_node_page(xnid)
> > > >   =A0=A0 - memcpy xnode xattr
> > > >   =A0=A0 - f2fs_put_page
> > > > =

> > > > Do we need to keep xattr_{get,set} being atomical operation?
> > > =

> > > It seems xfstest starts to complain w/ below message...
> > =

> > I don't see any failure. Which test do you see?
> =

> 051, 083, ... 467, 642
> =

> Testcase doesn't fail, but kernel log shows inode has corrupted xattr.

I got it. It seems I had to fix the above issue only while keeping the sem.=
 :(

> =

> > =

> > > =

> > > [ 3400.856443] F2FS-fs (vdc): inode (2187) has invalid last xattr ent=
ry, entry_size: 21468
> > > [ 3400.864042] F2FS-fs (vdc): inode (1595) has invalid last xattr ent=
ry, entry_size: 26580
> > > [ 3400.865764] F2FS-fs (vdc): inode (2187) has invalid last xattr ent=
ry, entry_size: 21468
> > > [ 3400.880067] F2FS-fs (vdc): inode (9839) has corrupted xattr
> > > [ 3400.880714] F2FS-fs (vdc): inode (10855) has corrupted xattr
> > > =

> > > Thanks,
> > > =

> > > > =

> > > > Thanks,
> > > > =

> > > > > =

> > > > > I think we don't need to truncate xattr pages eagerly which intro=
duces lots of
> > > > > data races without big benefits.
> > > > > =

> > > > > Cc: <stable@vger.kernel.org>
> > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > ---
> > > > >  =A0 fs/f2fs/f2fs.h=A0 |=A0 1 -
> > > > >  =A0 fs/f2fs/super.c |=A0 1 -
> > > > >  =A0 fs/f2fs/xattr.c | 31 ++++++++-----------------------
> > > > >  =A0 3 files changed, 8 insertions(+), 25 deletions(-)
> > > > > =

> > > > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > > index 3f5b161dd743..7b9af2d51656 100644
> > > > > --- a/fs/f2fs/f2fs.h
> > > > > +++ b/fs/f2fs/f2fs.h
> > > > > @@ -838,7 +838,6 @@ struct f2fs_inode_info {
> > > > >  =A0=A0=A0=A0=A0 /* avoid racing between foreground op and gc */
> > > > >  =A0=A0=A0=A0=A0 struct f2fs_rwsem i_gc_rwsem[2];
> > > > > -=A0=A0=A0 struct f2fs_rwsem i_xattr_sem; /* avoid racing between=
 reading and changing EAs */
> > > > >  =A0=A0=A0=A0=A0 int i_extra_isize;=A0=A0=A0=A0=A0=A0=A0 /* size =
of extra space located in i_addr */
> > > > >  =A0=A0=A0=A0=A0 kprojid_t i_projid;=A0=A0=A0=A0=A0=A0=A0 /* id f=
or project quota */
> > > > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > > index 1b2c788ed80d..c917fa771f0e 100644
> > > > > --- a/fs/f2fs/super.c
> > > > > +++ b/fs/f2fs/super.c
> > > > > @@ -1418,7 +1418,6 @@ static struct inode *f2fs_alloc_inode(struc=
t super_block *sb)
> > > > >  =A0=A0=A0=A0=A0 INIT_LIST_HEAD(&fi->gdirty_list);
> > > > >  =A0=A0=A0=A0=A0 init_f2fs_rwsem(&fi->i_gc_rwsem[READ]);
> > > > >  =A0=A0=A0=A0=A0 init_f2fs_rwsem(&fi->i_gc_rwsem[WRITE]);
> > > > > -=A0=A0=A0 init_f2fs_rwsem(&fi->i_xattr_sem);
> > > > >  =A0=A0=A0=A0=A0 /* Will be used by directory only */
> > > > >  =A0=A0=A0=A0=A0 fi->i_dir_level =3D F2FS_SB(sb)->dir_level;
> > > > > diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> > > > > index 213805d3592c..bdc8a55085a2 100644
> > > > > --- a/fs/f2fs/xattr.c
> > > > > +++ b/fs/f2fs/xattr.c
> > > > > @@ -433,7 +433,7 @@ static inline int write_all_xattrs(struct ino=
de *inode, __u32 hsize,
> > > > >  =A0 {
> > > > >  =A0=A0=A0=A0=A0 struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > > > >  =A0=A0=A0=A0=A0 size_t inline_size =3D inline_xattr_size(inode);
> > > > > -=A0=A0=A0 struct page *in_page =3D NULL;
> > > > > +=A0=A0=A0 struct page *in_page =3D ipage;
> > > > >  =A0=A0=A0=A0=A0 void *xattr_addr;
> > > > >  =A0=A0=A0=A0=A0 void *inline_addr =3D NULL;
> > > > >  =A0=A0=A0=A0=A0 struct page *xpage;
> > > > > @@ -446,29 +446,19 @@ static inline int write_all_xattrs(struct i=
node *inode, __u32 hsize,
> > > > >  =A0=A0=A0=A0=A0 /* write to inline xattr */
> > > > >  =A0=A0=A0=A0=A0 if (inline_size) {
> > > > > -=A0=A0=A0=A0=A0=A0=A0 if (ipage) {
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 inline_addr =3D inline_xattr_a=
ddr(inode, ipage);
> > > > > -=A0=A0=A0=A0=A0=A0=A0 } else {
> > > > > +=A0=A0=A0=A0=A0=A0=A0 if (!in_page) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 in_page =3D f2fs_get_nod=
e_page(sbi, inode->i_ino);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(in_page)) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_alloc_n=
id_failed(sbi, new_nid);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_E=
RR(in_page);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 inline_addr =3D inline_xattr_a=
ddr(inode, in_page);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > +=A0=A0=A0=A0=A0=A0=A0 inline_addr =3D inline_xattr_addr(inode, i=
n_page);
> > > > > -=A0=A0=A0=A0=A0=A0=A0 f2fs_wait_on_page_writeback(ipage ? ipage =
: in_page,
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 NODE, true, true);
> > > > > -=A0=A0=A0=A0=A0=A0=A0 /* no need to use xattr node block */
> > > > > +=A0=A0=A0=A0=A0=A0=A0 f2fs_wait_on_page_writeback(in_page, NODE,=
 true, true);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (hsize <=3D inline_size) {
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D f2fs_truncate_xattr_no=
de(inode);
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_alloc_nid_failed(sbi, new=
_nid);
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (err) {
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_put_page(in_p=
age, 1);
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return err;
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 memcpy(inline_addr, txat=
tr_addr, inline_size);
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_page_dirty(ipage ? ipage :=
 in_page);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_page_dirty(in_page);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto in_page_out;
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > >  =A0=A0=A0=A0=A0 }
> > > > > @@ -502,12 +492,13 @@ static inline int write_all_xattrs(struct i=
node *inode, __u32 hsize,
> > > > >  =A0=A0=A0=A0=A0 memcpy(xattr_addr, txattr_addr + inline_size, VA=
LID_XATTR_BLOCK_SIZE);
> > > > >  =A0=A0=A0=A0=A0 if (inline_size)
> > > > > -=A0=A0=A0=A0=A0=A0=A0 set_page_dirty(ipage ? ipage : in_page);
> > > > > +=A0=A0=A0=A0=A0=A0=A0 set_page_dirty(in_page);
> > > > >  =A0=A0=A0=A0=A0 set_page_dirty(xpage);
> > > > >  =A0=A0=A0=A0=A0 f2fs_put_page(xpage, 1);
> > > > >  =A0 in_page_out:
> > > > > -=A0=A0=A0 f2fs_put_page(in_page, 1);
> > > > > +=A0=A0=A0 if (in_page !=3D ipage)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 f2fs_put_page(in_page, 1);
> > > > >  =A0=A0=A0=A0=A0 return err;
> > > > >  =A0 }
> > > > > @@ -528,10 +519,8 @@ int f2fs_getxattr(struct inode *inode, int i=
ndex, const char *name,
> > > > >  =A0=A0=A0=A0=A0 if (len > F2FS_NAME_LEN)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ERANGE;
> > > > > -=A0=A0=A0 f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> > > > >  =A0=A0=A0=A0=A0 error =3D lookup_all_xattrs(inode, ipage, index,=
 len, name,
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &entry, &bas=
e_addr, &base_size, &is_inline);
> > > > > -=A0=A0=A0 f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
> > > > >  =A0=A0=A0=A0=A0 if (error)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 return error;
> > > > > @@ -565,9 +554,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry,=
 char *buffer, size_t buffer_size)
> > > > >  =A0=A0=A0=A0=A0 int error;
> > > > >  =A0=A0=A0=A0=A0 size_t rest =3D buffer_size;
> > > > > -=A0=A0=A0 f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> > > > >  =A0=A0=A0=A0=A0 error =3D read_all_xattrs(inode, NULL, &base_add=
r);
> > > > > -=A0=A0=A0 f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
> > > > >  =A0=A0=A0=A0=A0 if (error)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 return error;
> > > > > @@ -794,9 +781,7 @@ int f2fs_setxattr(struct inode *inode, int in=
dex, const char *name,
> > > > >  =A0=A0=A0=A0=A0 f2fs_balance_fs(sbi, true);
> > > > >  =A0=A0=A0=A0=A0 f2fs_lock_op(sbi);
> > > > > -=A0=A0=A0 f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
> > > > >  =A0=A0=A0=A0=A0 err =3D __f2fs_setxattr(inode, index, name, valu=
e, size, ipage, flags);
> > > > > -=A0=A0=A0 f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
> > > > >  =A0=A0=A0=A0=A0 f2fs_unlock_op(sbi);
> > > > >  =A0=A0=A0=A0=A0 f2fs_update_time(sbi, REQ_TIME);
> > > > =

> > > > =

> > > > _______________________________________________
> > > > Linux-f2fs-devel mailing list
> > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

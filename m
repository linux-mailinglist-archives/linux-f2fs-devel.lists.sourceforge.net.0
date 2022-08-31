Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 655DB5A7441
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Aug 2022 05:05:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTE2l-0004gl-3G;
	Wed, 31 Aug 2022 03:05:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oTE2k-0004ge-6F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Aug 2022 03:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fiU+T4aq9Zqm/GX0PZIUwWGsMdUHVXCSO6SbM+9PwdI=; b=A1A3xX4zSQSkiCxk4Uinkec6He
 q62uAxV5i16Ny/7OyM8FJfuLp1FG3uDU4eVGVvpVDQxjKhne/bQlwLRgnmzzEWFYYWuaVFpY+i1US
 A9hUV9HyRSfv+foPv25sS6ZntzP5lrvbOZWV6xr2x0yk4oZYvKvn2KtF1YSNShpRvAb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fiU+T4aq9Zqm/GX0PZIUwWGsMdUHVXCSO6SbM+9PwdI=; b=DaozGKgUBzgIwUwpVNjZoRPnP1
 kLnNxU8ff/f9F41/kAeCjDTiQs54afayCI1xSJXs6r1aNW6rAUQAAsQ+uJ7zmZS2zrlIEL+4YfKyD
 C5xb844/eZs88riS5iAv6oQNe2EwMw9z/d+d9UzT2FoyU5i7rjH5aN/h/SUeQ49H/9gU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oTE2e-0005Me-TH for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Aug 2022 03:05:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B468761927;
 Wed, 31 Aug 2022 03:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00040C433D6;
 Wed, 31 Aug 2022 03:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661915114;
 bh=dVup0T/Gm724oVjCg6gv0zTexmWsoNH4XnK67lgI7vE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQ30ftyUYj4WNesdVZUK9vAqMkE3skgwTYdXxXPOBfBzazE8a93xVE4JGmbGcPvEb
 PB6qBqbBZaTTb21dHtzVekH9LPpziKxNQF9fLI9dQFsVqicqg3Hly3XL95+KA6dLp+
 brMfAWgTDhPNB8aogrWkaTA/qO5fXLC5/7+qk8SuoVzSY9nUqYkywc5Cu+hkKNkI4v
 NOV5W8zpZ47zcxAtHwfkyICuzMvzhGLdOpy9eR2RgH5hR8qsRYmYroiEUvX5P8Hyqc
 Rl2XWH8wLl4ivgj/a3Z7tepiOmLG7lhvBr98cOs7BaxVL5B42V5xi9NkbXu9kmtH7M
 Su6HC6623/5mQ==
Date: Tue, 30 Aug 2022 20:05:12 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yw7P6BkNZmqxji3B@google.com>
References: <20220829215206.3082124-1-jaegeuk@kernel.org>
 <cbc4bfe5-14f9-a4e0-c9c5-6b6b06437d5d@kernel.org>
 <Yw55Ebk8zLIgBFfn@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yw55Ebk8zLIgBFfn@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/30, Jaegeuk Kim wrote: > On 08/30, Chao Yu wrote: >
 > On 2022/8/30 5:52, Jaegeuk Kim wrote: > > > Sometimes we can get a cached
 meta_inode which has no aops yet. Let's set it > > > all the time [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oTE2e-0005Me-TH
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix missing mapping caused by the
 mount/umount race
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
Cc: syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/30, Jaegeuk Kim wrote:
> On 08/30, Chao Yu wrote:
> > On 2022/8/30 5:52, Jaegeuk Kim wrote:
> > > Sometimes we can get a cached meta_inode which has no aops yet. Let's set it
> > > all the time to fix the below panic.
> > > 
> > > Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> > > Mem abort info:
> > >    ESR = 0x0000000086000004
> > >    EC = 0x21: IABT (current EL), IL = 32 bits
> > >    SET = 0, FnV = 0
> > >    EA = 0, S1PTW = 0
> > >    FSC = 0x04: level 0 translation fault
> > > user pgtable: 4k pages, 48-bit VAs, pgdp=0000000109ee4000
> > > [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> > > Internal error: Oops: 86000004 [#1] PREEMPT SMP
> > > Modules linked in:
> > > CPU: 1 PID: 3045 Comm: syz-executor330 Not tainted 6.0.0-rc2-syzkaller-16455-ga41a877bc12d #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
> > > pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > pc : 0x0
> > > lr : folio_mark_dirty+0xbc/0x208 mm/page-writeback.c:2748
> > > sp : ffff800012783970
> > > x29: ffff800012783970 x28: 0000000000000000 x27: ffff800012783b08
> > > x26: 0000000000000001 x25: 0000000000000400 x24: 0000000000000001
> > > x23: ffff0000c736e000 x22: 0000000000000045 x21: 05ffc00000000015
> > > x20: ffff0000ca7403b8 x19: fffffc00032ec600 x18: 0000000000000181
> > > x17: ffff80000c04d6bc x16: ffff80000dbb8658 x15: 0000000000000000
> > > x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> > > x11: ff808000083e9814 x10: 0000000000000000 x9 : ffff8000083e9814
> > > x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> > > x5 : ffff0000cbb19000 x4 : ffff0000cb3d2000 x3 : ffff0000cbb18f80
> > > x2 : fffffffffffffff0 x1 : fffffc00032ec600 x0 : ffff0000ca7403b8
> > > Call trace:
> > >   0x0
> > >   set_page_dirty+0x38/0xbc mm/folio-compat.c:62
> > >   f2fs_update_meta_page+0x80/0xa8 fs/f2fs/segment.c:2369
> > >   do_checkpoint+0x794/0xea8 fs/f2fs/checkpoint.c:1522
> > >   f2fs_write_checkpoint+0x3b8/0x568 fs/f2fs/checkpoint.c:1679
> > > 
> > > Cc: stable@vger.kernel.org
> > > Reported-by: syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > ---
> > >   fs/f2fs/inode.c | 13 ++++++++-----
> > >   1 file changed, 8 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > index 6d11c365d7b4..1feb0a8a699e 100644
> > > --- a/fs/f2fs/inode.c
> > > +++ b/fs/f2fs/inode.c
> > > @@ -490,10 +490,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> > >   	if (!inode)
> > >   		return ERR_PTR(-ENOMEM);
> > > -	if (!(inode->i_state & I_NEW)) {
> > > -		trace_f2fs_iget(inode);
> > > -		return inode;
> > > -	}
> > > +	/* We can see an old cached inode. Let's set the aops all the time. */
> > 
> > Why an old cached inode (has no I_NEW flag) has NULL a_ops pointer? If it is a bad
> > inode, it should be unhashed before unlock_new_inode().
> 
> I'm trying to dig further tho, it's not a bad inode, nor I_FREEING | I_CLEAR.
> It's very werid that thie meta inode is found in newly created superblock by
> the global hash table. I've checked that the same superblock pointer was used
> in the previous tests, but inode was evictied all the time.

I'll drop this patch, since it turned out there is a bug in reiserfs which
doesn't free the root inode (ino=2). That leads f2fs to find an ino=2 with
the previous superblock point used by reiserfs. That stale inode has no valid
inode that f2fs can use. I tried to find where the root cause is in reiserfs,
but it seems quite hard to catch one.

- reiserfs_fill_super
 - reiserfs_xattr_init
  - create_privroot
   - xattr_mkdir
    - reiserfs_new_inode
     - reiserfs_get_unused_objectid returned 0 due to map crash

It seems the error path doesn't handle the root inode properly.

> 
> > 
> > Thanks,
> > 
> > >   	if (ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi))
> > >   		goto make_now;
> > > @@ -502,6 +499,11 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> > >   		goto make_now;
> > >   #endif
> > > +	if (!(inode->i_state & I_NEW)) {
> > > +		trace_f2fs_iget(inode);
> > > +		return inode;
> > > +	}
> > > +
> > >   	ret = do_read_inode(inode);
> > >   	if (ret)
> > >   		goto bad_inode;
> > > @@ -557,7 +559,8 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> > >   		file_dont_truncate(inode);
> > >   	}
> > > -	unlock_new_inode(inode);
> > > +	if (inode->i_state & I_NEW)
> > > +		unlock_new_inode(inode);
> > >   	trace_f2fs_iget(inode);
> > >   	return inode;
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

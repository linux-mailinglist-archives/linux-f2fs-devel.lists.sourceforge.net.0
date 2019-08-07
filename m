Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 953D284272
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2019 04:28:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvBgh-0007Y4-22; Wed, 07 Aug 2019 02:28:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hvBgg-0007Xx-9Q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 02:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eImGL6TTZst1utMxaDKiHgxuHleoyPwky/U4cv/ZbQg=; b=POE0WbCfTCZR+z/mCQ3wUutmfk
 J03asjy9JkLK1XUxhyWEXOaDgOHCzKTR11qB6kdqgcj5Amh1cEoI20/ncAP66P9PB84LI4mkWBPXa
 yp6OC09k68FL0UeAmF8t7rMSBYBkJfJjuGeeXBL0BvccuF87p6RUopuAfZJT8FC7J1e4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eImGL6TTZst1utMxaDKiHgxuHleoyPwky/U4cv/ZbQg=; b=hLDpBupZ6el4zNM3XZdD1Fsy53
 WBLnnGvs8rqB1Iyg06POSzEhhdPIR3ARNLl0VfcanW7vKmoVGLdg10hgnH+Q0ODDgyqc06p+GBMa7
 2zGMXqJMAO4O0pTvyqcSKdYieKVMbxIG8DoY2fwcN5FttYd3Hf4LGY3L3E4KkcOcoNBY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvBge-00D27t-SR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 02:28:26 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 357F8208C3;
 Wed,  7 Aug 2019 02:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565144899;
 bh=kAPqZgMiEJBOHLg4HgSJpagctrKDoCvXOcQ+d915Rq0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nHSnYlFF1BWM+Sf6Okt/EBvz4E6lXNt33iJgOn8AFXwojCBhrB8JpDl7+09lQDIfa
 E3PM6nK+HtvWQKez+TfyeBJXvrwnkzh3dapqy6MM19ilRiAaqOYyXOmLJcZgEE8MS1
 Og8HQ1XI8HPXpCT029TmPgas/4fZv6bVpVwsmKgA=
Date: Tue, 6 Aug 2019 19:28:18 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Ritesh Harjani <riteshh@codeaurora.org>
Message-ID: <20190807022818.GA75065@jaegeuk-macbookpro.roam.corp.google.com>
References: <1542607377-25446-1-git-send-email-riteshh@codeaurora.org>
 <0a2feb36-8f71-67a0-381c-2e487d658145@huawei.com>
 <c5387fdb-6b20-ed3d-e9a5-ae55b5dbdd37@codeaurora.org>
 <20181119210340.GA33805@jaegeuk-macbookpro.roam.corp.google.com>
 <182b74e8-4148-4180-763c-a79b10bd0612@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <182b74e8-4148-4180-763c-a79b10bd0612@codeaurora.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hvBge-00D27t-SR
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: remove stale inode entry before
 eviction from gdirty_list
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/20, Ritesh Harjani wrote:
> =

> On 11/20/2018 2:33 AM, Jaegeuk Kim wrote:
> > On 11/19, Ritesh Harjani wrote:
> > > Hi Chao,
> > > =

> > > On 11/19/2018 12:09 PM, Chao Yu wrote:
> > > > Hi Ritesh,
> > > > =

> > > > On 2018/11/19 14:02, Ritesh Harjani wrote:
> > > > > This is seen when CP_ERROR_FLAG is not set & FS may be corrupted.
> > > > > There is a case observed where dirty stale inode pointer data is =
still
> > > > > present in the gdirty_list causing panic on access while doing
> > > > > checkpoint operation.
> > > > > =

> > > > > WARNING: CPU: 3 PID: 1827 at
> > > > > kernel/msm-4.14/fs/f2fs/inode.c:567
> > > > > f2fs_evict_inode+0x364/0x37c
> > > > > <...>
> > > > > [42246.776289] BUG: spinlock bad magic on CPU#4, 1245
> > > > > [42246.782674] Unable to handle kernel paging request at virtual =
address 6b6b6b6b6b713b
> > > > > <...>
> > > > > [42246.896370] task: ffffffc0f0434080 task.stack: ffffff8023ea0000
> > > > > [42246.902465] pc : spin_bug+0x80/0xb8
> > > > > [42246.906055] lr : spin_bug+0x64/0xb8
> > > > > <...>
> > > > > [42247.122346] Call trace:
> > > > > [42247.124876]  spin_bug+0x80/0xb8
> > > > > [42247.128110]  do_raw_spin_lock+0xe8/0x118
> > > > > [42247.132144]  _raw_spin_lock+0x24/0x30
> > > > > [42247.135916]  igrab+0x20/0x6c
> > > > > [42247.138894]  f2fs_sync_inode_meta+0x58/0xc0
> > > > > [42247.143199]  write_checkpoint+0x1c4/0xecc
> > > > > [42247.147322]  f2fs_sync_fs+0x118/0x170
> > > > > [42247.151096]  f2fs_do_sync_file+0x4f0/0x798
> > > > > [42247.155311]  f2fs_sync_file+0x54/0x6c
> > > > > [42247.159087]  vfs_fsync_range+0x90/0xac
> > > > > [42247.162950]  vfs_fsync+0x2c/0x38
> > > > > [42247.166278]  do_fsync+0x3c/0x78
> > > > > [42247.169515]  SyS_fdatasync+0x20/0x30
> > > > > =

> > > > > Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
> > > > > ---
> > > > >    fs/f2fs/inode.c | 10 ++++++----
> > > > >    1 file changed, 6 insertions(+), 4 deletions(-)
> > > > > =

> > > > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > > > index 91ceee0..c57f636 100644
> > > > > --- a/fs/f2fs/inode.c
> > > > > +++ b/fs/f2fs/inode.c
> > > > > @@ -702,11 +702,13 @@ void f2fs_evict_inode(struct inode *inode)
> > > > >    	stat_dec_inline_dir(inode);
> > > > >    	stat_dec_inline_inode(inode);
> > > > > -	if (likely(!is_set_ckpt_flags(sbi, CP_ERROR_FLAG) &&
> > > > > -				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> > > > > -		f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
> > > > > -	else
> > > > > +	if (unlikely(is_inode_flag_set(inode, FI_DIRTY_INODE))) {
> > > > >    		f2fs_inode_synced(inode);
> > > > > +		f2fs_msg(sbi->sb, KERN_WARNING,
> > > > > +			 "inconsistent dirty inode:%u entry found during eviction\n",
> > > > > +			 inode->i_ino);
> > > > > +		f2fs_bug_on(sbi, 1);
> > > > IIRC, Jaegeuk added below condition to avoid f2fs_bug_on during doi=
ng test
> > > > w/ checkpoint error injection, if we remove this, we may still enco=
unter
> > > > such problem.
> > > > =

> > > > if (likely(!is_set_ckpt_flags(sbi, CP_ERROR_FLAG)))
> > > Ok, agreed. Does below sounds good then?
> > > The idea is to go ahead and call f2fs_inode_synced(inode) when the in=
ode
> > > FI_DIRTY_INODE flag is set irrespective of CP_ERROR_FLAG set or not. =
Because
> > > otherwise there is a stale inode entry which will
> > > remain in gdirty_list =3D> causing kernel panic in checkpoint path.
> > > =

> > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > index 91ceee0..00915c2 100644
> > > --- a/fs/f2fs/inode.c
> > > +++ b/fs/f2fs/inode.c
> > > @@ -702,11 +702,15 @@ void f2fs_evict_inode(struct inode *inode)
> > >  =A0=A0=A0=A0=A0=A0=A0 stat_dec_inline_dir(inode);
> > >  =A0=A0=A0=A0=A0=A0=A0 stat_dec_inline_inode(inode);
> > > =

> > > -=A0=A0=A0=A0=A0=A0 if (likely(!is_set_ckpt_flags(sbi, CP_ERROR_FLAG)=
 &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 !is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_bug_on(sbi, is_inode=
_flag_set(inode, FI_DIRTY_INODE));
> > > -=A0=A0=A0=A0=A0=A0 else
> > > +=A0=A0=A0=A0=A0=A0 if (unlikely(is_inode_flag_set(inode, FI_DIRTY_IN=
ODE))) {
> > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_inode_synced(inod=
e);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_msg(sbi->sb, KERN_WA=
RNING,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 "inconsistent dirty inode:%u entry found during
> > > eviction\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 inode->i_ino);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if ((!is_set_ckpt_flags(s=
bi, CP_ERROR_FLAG) &&
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 !is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f=
2fs_bug_on(sbi, 1);
> > > +=A0=A0=A0=A0=A0=A0 }
> > > =

> > > > So I'd like to know what kind of case can make dirty inode during e=
vict(),
> > > > can you explain more?
> > > Yes, we also could not get exact path about when this can happen. But=
 below
> > > are the parallel ongoing contexts when the issue is seen:-
> > > We do suspect that there is something already wrong in the FS even be=
fore
> > > when this issue occurred (due to "inconsistent node block" logs). Thi=
s could
> > > be due to some other underlying storage driver issue.
> > > Not sure though.
> > > =

> > > 1. unlinkat operation causing f2fs_evict_inode causing a warning (as
> > > mentioned in the commit text).
> > > 2. echo 3 > /proc/sys/vm/drop_caches.
> > > 3. Rename operation on some file.
> > > 4. vfs_fsync -> doing checkpointing =3D> this causes a kernel panic s=
ince
> > > stale inode entry is still present which got freed from f2fs_evict_in=
ode
> > > path.
> > > =

> > > Some error logs which were seen long before this issue occurred.
> > > [42219.089810]=A0F2FS-fs=A0(mmcblk0p75):=A0inconsistent=A0node=A0bloc=
k,=A0nid:50018,=A0node_footer[nid:50327,ino:50327,ofs:0,cpver:1214650599628=
2773182,blkaddr:515484]
> > > [42219.104281]=A0F2FS-fs=A0(mmcblk0p75):=A0inconsistent=A0node=A0bloc=
k,=A0nid:49836,=A0node_footer[nid:50228,ino:50228,ofs:0,cpver:1023024729425=
6961017,blkaddr:1496346]
> > > [42219.118723]=A0F2FS-fs=A0(mmcblk0p75):=A0inconsistent=A0node=A0bloc=
k,=A0nid:50327,=A0node_footer[nid:0,ino:0,ofs:0,cpver:0,blkaddr:0]
> > > [42219.130782]=A0F2FS-fs=A0(mmcblk0p75):=A0inconsistent=A0node=A0bloc=
k,=A0nid:50228,=A0node_footer[nid:0,ino:0,ofs:0,cpver:0,blkaddr:0]
> > I've concerned that this patch hides the bug and makes the partition be=
ing more
> > corrupted. We have to figure out where such the node block were generat=
ed.
> This issue seems to be mostly due to problem from underlying storage driv=
er.
> As of now the suspect

Hi Ritesh,

I'm hitting this issue, and could you please elaborate the problem in stora=
ge
driver that you mentioned?

Thanks,

> is not from f2fs since we don't see this issue on a different configurati=
on
> of storage driver.
> The above patch is mainly to fix a kernel crash when the system/FS has
> actually gone bad due to some other subsystem causing corruption.
> We thought it is a good fix to have because anyways if there is a dirty
> inode found during eviction,
> then we should remove any stale entries of it from RAM data structures,
> before freeing the inode (with a warning msg).
> =

> > How many patches have you cherry-picked? Which kernel version are you u=
sing?
> kernel 4.14. Yes we do have all the patches pulled from android aosp.
> > Have you enabled ICE?
> Yes. ICE is enabled.
> =

> =

> Thanks
> Ritesh
> =

> > =

> > Thanks,
> > =

> > =

> > > Thanks,
> > > =

> > > > Thanks,
> > > > =

> > > > > +	}
> > > > >    	/* ino =3D=3D 0, if f2fs_new_inode() was failed t*/
> > > > >    	if (inode->i_ino)
> > > > > =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

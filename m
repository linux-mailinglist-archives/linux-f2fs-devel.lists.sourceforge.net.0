Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E376E0D4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 09:06:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRSPf-0005cL-8N;
	Thu, 03 Aug 2023 07:06:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qRSPd-0005cA-6v
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 07:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NOZI/l3L3KOSwr33UWCYkZpjITeZur6tmYRYTjntZV0=; b=N3P1GZO9bKewag56foCJcwX5CM
 Iv1977N3ngRtStOpc1d1K3EgOW2RD6cVwtxYEY8N19sqjoLQ6NRbWzhRDhoXwS2XPz6t0sckONnMT
 zMTmRMbLci98HpPQKRBqMoWEChykOW1eXhcZS7AWnaczqN/7ki2/Xx31fvyunHlTsO3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NOZI/l3L3KOSwr33UWCYkZpjITeZur6tmYRYTjntZV0=; b=PkT7WYCGiOwsQiMFvwwD61tYOd
 0mBLkVmeNt2Fx9wNO2jCf/1Ov5XFC28Uq3KJI9/4qBKl06d8Rku1+B0XjKHJGgbog7m2dcGlGU680
 1qOTEpCtfwCsebRgZQKwKHhKlgXspSnaw0Hs86aUVGRml9rF2R7B2OvMnyf7+14mQnMg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRSPb-00BV40-Bp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 07:06:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9037661C17;
 Thu,  3 Aug 2023 07:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8B8C433C7;
 Thu,  3 Aug 2023 07:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691046373;
 bh=q5HEh93m22+IZ7gJ0ht4CIPca9ZIugEYnaPvq20Gjuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K7UhWAmHViQApxb4uEFZrC7NgM4L98YWGA8RqmJSuKws6QfloHZYz2gu1jyPObkgz
 rJxDzSRQnw1K4pXJOSbYSQwEHQGHEgpocuMnPLyGqXwysQNLhUfpr9nXqz/I7vEWHU
 Xyq0E7GBSXm+tlg7gDzjWZJiiMF3px3+dfpcHG121egWkUzTPQBnCY0uSqoCY/0Kr0
 ZBpFxVuNI9TULQg5bdi3e7SZRLX5rY79l7KLMQCUVHdnr6WpsAje202RHEqOcZVFgo
 7miM6YWTEiuxqRbsDMbuOSLOG9Nu93OzU+EfWoCfeFibJ4Z6IjLTxS3vlPbG54qPVW
 uZsk7io+itqAw==
Date: Thu, 3 Aug 2023 09:05:55 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230803-mulmig-rennen-adbe9b2a6608@brauner>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-5-a794c2b7abca@kernel.org>
 <20230802174853.GC11352@frogsfrogsfrogs>
 <16f46a9e6d88582d53d31a320589a7ba9d232e0c.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16f46a9e6d88582d53d31a320589a7ba9d232e0c.camel@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 02, 2023 at 02:21:49PM -0400, Jeff Layton wrote:
 > On Wed, 2023-08-02 at 10:48 -0700, Darrick J. Wong wrote: > > On Tue, Jul
 25, 2023 at 10:58:18AM -0400, Jeff Layton wrote: > > > Enable m [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qRSPb-00BV40-Bp
Subject: Re: [f2fs-dev] [PATCH v6 5/7] xfs: switch to multigrain timestamps
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Dave Chinner <david@fromorbit.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 linux-f2fs-devel@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Anthony Iliopoulos <ailiop@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 02, 2023 at 02:21:49PM -0400, Jeff Layton wrote:
> On Wed, 2023-08-02 at 10:48 -0700, Darrick J. Wong wrote:
> > On Tue, Jul 25, 2023 at 10:58:18AM -0400, Jeff Layton wrote:
> > > Enable multigrain timestamps, which should ensure that there is an
> > > apparent change to the timestamp whenever it has been written after
> > > being actively observed via getattr.
> > > 
> > > Also, anytime the mtime changes, the ctime must also change, and those
> > > are now the only two options for xfs_trans_ichgtime. Have that function
> > > unconditionally bump the ctime, and ASSERT that XFS_ICHGTIME_CHG is
> > > always set.
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/xfs/libxfs/xfs_trans_inode.c | 6 +++---
> > >  fs/xfs/xfs_iops.c               | 4 ++--
> > >  fs/xfs/xfs_super.c              | 2 +-
> > >  3 files changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
> > > index 6b2296ff248a..ad22656376d3 100644
> > > --- a/fs/xfs/libxfs/xfs_trans_inode.c
> > > +++ b/fs/xfs/libxfs/xfs_trans_inode.c
> > > @@ -62,12 +62,12 @@ xfs_trans_ichgtime(
> > >  	ASSERT(tp);
> > >  	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
> > >  
> > > -	tv = current_time(inode);
> > > +	/* If the mtime changes, then ctime must also change */
> > > +	ASSERT(flags & XFS_ICHGTIME_CHG);
> > >  
> > > +	tv = inode_set_ctime_current(inode);
> > >  	if (flags & XFS_ICHGTIME_MOD)
> > >  		inode->i_mtime = tv;
> > > -	if (flags & XFS_ICHGTIME_CHG)
> > > -		inode_set_ctime_to_ts(inode, tv);
> > >  	if (flags & XFS_ICHGTIME_CREATE)
> > >  		ip->i_crtime = tv;
> > >  }
> > > diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> > > index 3a9363953ef2..3f89ef5a2820 100644
> > > --- a/fs/xfs/xfs_iops.c
> > > +++ b/fs/xfs/xfs_iops.c
> > > @@ -573,10 +573,10 @@ xfs_vn_getattr(
> > >  	stat->gid = vfsgid_into_kgid(vfsgid);
> > >  	stat->ino = ip->i_ino;
> > >  	stat->atime = inode->i_atime;
> > > -	stat->mtime = inode->i_mtime;
> > > -	stat->ctime = inode_get_ctime(inode);
> > >  	stat->blocks = XFS_FSB_TO_BB(mp, ip->i_nblocks + ip->i_delayed_blks);
> > >  
> > > +	fill_mg_cmtime(request_mask, inode, stat);
> > 
> > Huh.  I would've thought @stat would come first since that's what we're
> > acting upon, but ... eh. :)
> > 
> > If everyone else is ok with the fill_mg_cmtime signature,
> > Acked-by: Darrick J. Wong <djwong@kernel.org>
> > 
> > 
> 
> Good point. We can change the signature. I think xfs is the only caller
> outside of the generic vfs right now, and it'd be best to do it now.
> 
> Christian, would you prefer that I send an updated series, or patches on
> top of vfs.ctime that can be folded in?

Let's fold instead of inundate everyone with almost 100 patches.
When I'll apply I'll remind everyone where the series can be pulled
from anyway.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

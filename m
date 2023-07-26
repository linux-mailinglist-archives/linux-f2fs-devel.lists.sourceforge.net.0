Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0675763442
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 12:49:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOc5U-00029F-I0;
	Wed, 26 Jul 2023 10:49:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qOc5T-000299-4V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 10:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lKAjDEZiszSoFsBTR1fl69tu1uQ5pOqk7Qgu8YPXxME=; b=WZ1Pp7Y3o6NOtvb/fK5Ru8k9bI
 Qw9lDlNDsbV1c2qPFZ/iwDAmjCvJ/2MJDEWDUTZBX9k+oqBs67+iWkgPIAm9cYzfUcdUSoCBQcY8V
 utb4kEvISjLTFbHQnaKYKhZJBGFNJq7a5dQLkHkauNqtvHz4QSUsZMxRdmHRXZV4eqmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lKAjDEZiszSoFsBTR1fl69tu1uQ5pOqk7Qgu8YPXxME=; b=SM7w1F7VDXoE0aEGrCZeOaN17q
 BPkIhtQofhY0EJ2UvF5HIJ7MTt5FobJwjlJBfXprMPbA2NwMJ9putnD+IrUFO9lg9VoO4rEL8fWs6
 654wT7Nk4550tCIiE6pxfYsiApje/uQhBaiuLHpyXOOZMug/7FdDlEtfsZAb0fjtTLdc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOc5S-002wsi-CB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 10:49:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8E6561A6A;
 Wed, 26 Jul 2023 10:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C146FC433C7;
 Wed, 26 Jul 2023 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690368579;
 bh=2dfZYSb7SXGkMObcrfK4A6YGYYkg6dqmecGQRsejOiM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=nlKvlRJi9pgRH+6o2ty2NFubBfldMbVG92auYpu5rLnD7BHetmDU9VKYf6sT5m1Lw
 9z8nCOyKDUhe+AxVNHBpmS6G2dD8dJzX+rJji+yaVhGIr54DxEXSQ8Naflc5EqkZXm
 oMx3oc62nv59pQtbN4bwMHejWgL7/m3Ho4bpcELYand2g/GOfOpkZzzw8UfdxYWu0D
 cRTsM9p1Zy07AvT/CyljCNa9RVmM27z0pUsiEqV9U73RULJVyyi4xsIH17O7pCeT7K
 2vuopndVreRhDXzjIQrwQNhfO8nP7E7b/KPlwkbJ15nkxHodGzG9a+hw+kyXBC4p1M
 3/8b9w+0ZBn0Q==
Message-ID: <4d4a9a3c59ed2efe5132c01f08a7719c2ea60f04.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Date: Wed, 26 Jul 2023 06:49:36 -0400
In-Reply-To: <1da81657-2ee1-0ef3-c222-66e00d021c24@linux.alibaba.com>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
 <1da81657-2ee1-0ef3-c222-66e00d021c24@linux.alibaba.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2023-07-26 at 17:40 +0800, Joseph Qi wrote: > > On
 7/25/23 10:58 PM, Jeff Layton wrote: > > generic_fillattr just fills in the
 entire stat struct indiscriminately > > today, copying data from [...] 
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qOc5S-002wsi-CB
Subject: Re: [f2fs-dev] [PATCH v6 1/7] fs: pass the request_mask to
 generic_fillattr
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
Cc: Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, codalist@coda.cs.cmu.edu, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 Anthony Iliopoulos <ailiop@suse.com>, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 2023-07-26 at 17:40 +0800, Joseph Qi wrote:
> 
> On 7/25/23 10:58 PM, Jeff Layton wrote:
> > generic_fillattr just fills in the entire stat struct indiscriminately
> > today, copying data from the inode. There is at least one attribute
> > (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> > and we're looking at adding more with the addition of multigrain
> > timestamps.
> > 
> > Add a request_mask argument to generic_fillattr and have most callers
> > just pass in the value that is passed to getattr. Have other callers
> > (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> > STATX_CHANGE_COOKIE into generic_fillattr.
> > 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/9p/vfs_inode.c       |  4 ++--
> >  fs/9p/vfs_inode_dotl.c  |  4 ++--
> >  fs/afs/inode.c          |  2 +-
> >  fs/btrfs/inode.c        |  2 +-
> >  fs/ceph/inode.c         |  2 +-
> >  fs/coda/inode.c         |  3 ++-
> >  fs/ecryptfs/inode.c     |  5 +++--
> >  fs/erofs/inode.c        |  2 +-
> >  fs/exfat/file.c         |  2 +-
> >  fs/ext2/inode.c         |  2 +-
> >  fs/ext4/inode.c         |  2 +-
> >  fs/f2fs/file.c          |  2 +-
> >  fs/fat/file.c           |  2 +-
> >  fs/fuse/dir.c           |  2 +-
> >  fs/gfs2/inode.c         |  2 +-
> >  fs/hfsplus/inode.c      |  2 +-
> >  fs/kernfs/inode.c       |  2 +-
> >  fs/libfs.c              |  4 ++--
> >  fs/minix/inode.c        |  2 +-
> >  fs/nfs/inode.c          |  2 +-
> >  fs/nfs/namespace.c      |  3 ++-
> >  fs/ntfs3/file.c         |  2 +-
> >  fs/ocfs2/file.c         |  2 +-
> >  fs/orangefs/inode.c     |  2 +-
> >  fs/proc/base.c          |  4 ++--
> >  fs/proc/fd.c            |  2 +-
> >  fs/proc/generic.c       |  2 +-
> >  fs/proc/proc_net.c      |  2 +-
> >  fs/proc/proc_sysctl.c   |  2 +-
> >  fs/proc/root.c          |  3 ++-
> >  fs/smb/client/inode.c   |  2 +-
> >  fs/smb/server/smb2pdu.c | 22 +++++++++++-----------
> >  fs/smb/server/vfs.c     |  3 ++-
> >  fs/stat.c               | 18 ++++++++++--------
> >  fs/sysv/itree.c         |  3 ++-
> >  fs/ubifs/dir.c          |  2 +-
> >  fs/udf/symlink.c        |  2 +-
> >  fs/vboxsf/utils.c       |  2 +-
> >  include/linux/fs.h      |  2 +-
> >  mm/shmem.c              |  2 +-
> >  40 files changed, 70 insertions(+), 62 deletions(-)
> > 
> 
> ...
> 
> > diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
> > index 1b337ebce4df..8184499ae7a5 100644
> > --- a/fs/ocfs2/file.c
> > +++ b/fs/ocfs2/file.c
> > @@ -1319,7 +1319,7 @@ int ocfs2_getattr(struct mnt_idmap *idmap, const struct path *path,
> >  		goto bail;
> >  	}
> >  
> > -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> > +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
> 
> For ocfs2 part, looks fine to me.
> 
> Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> 
> >  	/*
> >  	 * If there is inline data in the inode, the inode will normally not
> >  	 * have data blocks allocated (it may have an external xattr block).
> 
> ...
> 
> > diff --git a/fs/stat.c b/fs/stat.c
> > index 8c2b30af19f5..062f311b5386 100644
> > --- a/fs/stat.c
> > +++ b/fs/stat.c
> > @@ -29,6 +29,7 @@
> >  /**
> >   * generic_fillattr - Fill in the basic attributes from the inode struct
> >   * @idmap:	idmap of the mount the inode was found from
> > + * @req_mask	statx request_mask
> 
> s/req_mask/request_mask
> 

Thanks. Fixed in my tree.

> >   * @inode:	Inode to use as the source
> >   * @stat:	Where to fill in the attributes
> >   *
> > @@ -42,8 +43,8 @@
> >   * uid and gid filds. On non-idmapped mounts or if permission checking is to be
> >   * performed on the raw inode simply passs @nop_mnt_idmap.
> >   */
> > -void generic_fillattr(struct mnt_idmap *idmap, struct inode *inode,
> > -		      struct kstat *stat)
> > +void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
> > +		      struct inode *inode, struct kstat *stat)
> >  {
> >  	vfsuid_t vfsuid = i_uid_into_vfsuid(idmap, inode);
> >  	vfsgid_t vfsgid = i_gid_into_vfsgid(idmap, inode);
> > @@ -61,6 +62,12 @@ void generic_fillattr(struct mnt_idmap *idmap, struct inode *inode,
> >  	stat->ctime = inode_get_ctime(inode);
> >  	stat->blksize = i_blocksize(inode);
> >  	stat->blocks = inode->i_blocks;
> > +
> > +	if ((request_mask & STATX_CHANGE_COOKIE) && IS_I_VERSION(inode)) {
> > +		stat->result_mask |= STATX_CHANGE_COOKIE;
> > +		stat->change_cookie = inode_query_iversion(inode);
> > +	}
> > +
> >  }
> >  EXPORT_SYMBOL(generic_fillattr);
> >  
> > @@ -123,17 +130,12 @@ int vfs_getattr_nosec(const struct path *path, struct kstat *stat,
> >  	stat->attributes_mask |= (STATX_ATTR_AUTOMOUNT |
> >  				  STATX_ATTR_DAX);
> >  
> > -	if ((request_mask & STATX_CHANGE_COOKIE) && IS_I_VERSION(inode)) {
> > -		stat->result_mask |= STATX_CHANGE_COOKIE;
> > -		stat->change_cookie = inode_query_iversion(inode);
> > -	}
> > -
> >  	idmap = mnt_idmap(path->mnt);
> >  	if (inode->i_op->getattr)
> >  		return inode->i_op->getattr(idmap, path, stat,
> >  					    request_mask, query_flags);
> >  
> > -	generic_fillattr(idmap, inode, stat);
> > +	generic_fillattr(idmap, request_mask, inode, stat);
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(vfs_getattr_nosec);
> 
> ...
> 

-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

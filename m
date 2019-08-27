Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD089EF62
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2019 17:50:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2djM-0002O6-NR; Tue, 27 Aug 2019 15:50:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jlayton@kernel.org>)
 id 1i2djL-0002Nt-Lg; Tue, 27 Aug 2019 15:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jMLcBSO0LFyDi/jJAIJFfbTSqNnqrbR5Cc7lwlSQoT4=; b=kfii6BtoGhbBP/kpK5wYGgmK9T
 hw9zuWhniGRE52Zad1Se2oE7cF/wedwvyqsPxnwczxmigu9vrBO+agb8MHMX48xEfE/7ReoRuQkE7
 ryaVgGE3W+qHRnT1FpxIh1ur0p9oqB0h0eNiMcSMskjeQLX7z0tBC4LU5zaBRLsEeZPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jMLcBSO0LFyDi/jJAIJFfbTSqNnqrbR5Cc7lwlSQoT4=; b=mfvpok+qMsztoAO99lts1BuKhz
 3BklRtUnC7h5BfxY5cMkhu4f8VprNowOHNUjlXWavSaGZo1wBCX3bvu+hPiLVsKna8TF33Gh4VhzI
 zMK5tL5QPHJF4h3XJgTiLvw/IkSwYd+7zRbu1KXN7ypkSyaYMrq7CKBd8JLc5TSEloL8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2djH-0051tN-6l; Tue, 27 Aug 2019 15:49:59 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 833FF2184D;
 Tue, 27 Aug 2019 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566920989;
 bh=bbgW62YNwOw6nr0OoLy9qjvU2nnCXSu3OBPYD+Bupp4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=L2rOWfFTV9ZENo9sY6rTomCTkAVi6eVgtVnTG5LG9plQ1qzOy8kmqkEIkcKlJccsb
 6oQCfNdLugesaJKgynlWsJQg7kb5LVkyYTK4cR8c58Kwfjmh9eQhwGZ7v/8NIZG3RI
 XOEmwVN1iC+LyMlqc3dSWBw7KJ+TXshlVw7j4UqM=
Message-ID: <dfc0fea49dfc77cb7631abb76e1e64ed745d25dd.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Mark Salyzyn <salyzyn@android.com>, linux-kernel@vger.kernel.org
Date: Tue, 27 Aug 2019 11:49:41 -0400
In-Reply-To: <20190827150544.151031-1-salyzyn@android.com>
References: <20190827150544.151031-1-salyzyn@android.com>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i2djH-0051tN-6l
Subject: Re: [f2fs-dev] [PATCH v8] Add flags option to get xattr method
 paired to __vfs_getxattr
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
 Mike Marshall <hubcap@omnibond.com>, James Morris <jmorris@namei.org>,
 devel@lists.orangefs.org, Eric Van Hensbergen <ericvh@gmail.com>,
 Joel Becker <jlbec@evilplan.org>, Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
 selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 devel@driverdev.osuosl.org, "J.
 Bruce Fields" <bfields@redhat.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, cluster-devel@redhat.com,
 Steve French <sfrench@samba.org>, v9fs-developer@lists.sourceforge.net,
 Bharath Vedartham <linux.bhar@gmail.com>, Jann Horn <jannh@google.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
 linux-unionfs@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 2019-08-27 at 08:05 -0700, Mark Salyzyn wrote:
> Replace arguments for get and set xattr methods, and __vfs_getxattr
> and __vfs_setaxtr functions with a reference to the following now
> common argument structure:
> 
> struct xattr_gs_args {
> 	struct dentry *dentry;
> 	struct inode *inode;
> 	const char *name;
> 	union {
> 		void *buffer;
> 		const void *value;
> 	};
> 	size_t size;
> 	int flags;
> };
> 
> Which in effect adds a flags option to the get method and
> __vfs_getxattr function.
> 
> Add a flag option to get xattr method that has bit flag of
> XATTR_NOSECURITY passed to it.  XATTR_NOSECURITY is generally then
> set in the __vfs_getxattr path when called by security
> infrastructure.
> 
> This handles the case of a union filesystem driver that is being
> requested by the security layer to report back the xattr data.
> 
> For the use case where access is to be blocked by the security layer.
> 
> The path then could be security(dentry) ->
> __vfs_getxattr({dentry...XATTR_NOSECURITY}) ->
> handler->get({dentry...XATTR_NOSECURITY}) ->
> __vfs_getxattr({lower_dentry...XATTR_NOSECURITY}) ->
> lower_handler->get({lower_dentry...XATTR_NOSECURITY})
> which would report back through the chain data and success as
> expected, the logging security layer at the top would have the
> data to determine the access permissions and report back the target
> context that was blocked.
> 
> Without the get handler flag, the path on a union filesystem would be
> the errant security(dentry) -> __vfs_getxattr(dentry) ->
> handler->get(dentry) -> vfs_getxattr(lower_dentry) -> nested ->
> security(lower_dentry, log off) -> lower_handler->get(lower_dentry)
> which would report back through the chain no data, and -EACCES.
> 
> For selinux for both cases, this would translate to a correctly
> determined blocked access. In the first case with this change a correct avc
> log would be reported, in the second legacy case an incorrect avc log
> would be reported against an uninitialized u:object_r:unlabeled:s0
> context making the logs cosmetically useless for audit2allow.
> 
> This patch series is inert and is the wide-spread addition of the
> flags option for xattr functions, and a replacement of __vfs_getxattr
> with __vfs_getxattr({...XATTR_NOSECURITY}).
> 
> Signed-off-by: Mark Salyzyn <salyzyn@android.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Cc: Stephen Smalley <sds@tycho.nsa.gov>
> Cc: linux-kernel@vger.kernel.org
> Cc: kernel-team@android.com
> Cc: linux-security-module@vger.kernel.org
> Cc: stable@vger.kernel.org # 4.4, 4.9, 4.14 & 4.19
> ---
> v8:
> - Documentation reported 'struct xattr_gs_flags' rather than
>   'struct xattr_gs_flags *args' as argument to get and set methods.
> 
> v7:
> - missed spots in fs/9p/acl.c, fs/afs/xattr.c, fs/ecryptfs/crypto.c,
>   fs/ubifs/xattr.c, fs/xfs/libxfs/xfs_attr.c,
>   security/integrity/evm/evm_main.c and security/smack/smack_lsm.c.
> 
> v6:
> - kernfs missed a spot
> 
> v5:
> - introduce struct xattr_gs_args for get and set methods,
>   __vfs_getxattr and __vfs_setxattr functions.
> - cover a missing spot in ext2.
> - switch from snprintf to scnprintf for correctness.
> 
> v4:
> - ifdef __KERNEL__ around XATTR_NOSECURITY to
>   keep it colocated in uapi headers.
> 
> v3:
> - poor aim on ubifs not ubifs_xattr_get, but static xattr_get
> 
> v2:
> - Missed a spot: ubifs, erofs and afs.
> 
> v1:
> - Removed from an overlayfs patch set, and made independent.
>   Expect this to be the basis of some security improvements.
> ---
>  Documentation/filesystems/Locking |  10 ++-
>  drivers/staging/erofs/xattr.c     |   8 +--
>  fs/9p/acl.c                       |  51 +++++++-------
>  fs/9p/xattr.c                     |  19 +++--
>  fs/afs/xattr.c                    | 112 +++++++++++++-----------------
>  fs/btrfs/xattr.c                  |  36 +++++-----
>  fs/ceph/xattr.c                   |  40 +++++------
>  fs/cifs/xattr.c                   |  72 +++++++++----------
>  fs/ecryptfs/crypto.c              |  20 +++---
>  fs/ecryptfs/inode.c               |  36 ++++++----
>  fs/ecryptfs/mmap.c                |  39 ++++++-----
>  fs/ext2/xattr_security.c          |  16 ++---
>  fs/ext2/xattr_trusted.c           |  15 ++--
>  fs/ext2/xattr_user.c              |  19 +++--
>  fs/ext4/xattr_security.c          |  15 ++--
>  fs/ext4/xattr_trusted.c           |  15 ++--
>  fs/ext4/xattr_user.c              |  19 +++--
>  fs/f2fs/xattr.c                   |  42 +++++------
>  fs/fuse/xattr.c                   |  23 +++---
>  fs/gfs2/xattr.c                   |  18 ++---
>  fs/hfs/attr.c                     |  15 ++--
>  fs/hfsplus/xattr.c                |  17 +++--
>  fs/hfsplus/xattr_security.c       |  13 ++--
>  fs/hfsplus/xattr_trusted.c        |  13 ++--
>  fs/hfsplus/xattr_user.c           |  13 ++--
>  fs/jffs2/security.c               |  16 ++---
>  fs/jffs2/xattr_trusted.c          |  16 ++---
>  fs/jffs2/xattr_user.c             |  16 ++---
>  fs/jfs/xattr.c                    |  33 ++++-----
>  fs/kernfs/inode.c                 |  23 +++---
>  fs/nfs/nfs4proc.c                 |  28 ++++----
>  fs/ocfs2/xattr.c                  |  52 ++++++--------
>  fs/orangefs/xattr.c               |  19 ++---
>  fs/overlayfs/inode.c              |  43 ++++++------
>  fs/overlayfs/overlayfs.h          |   6 +-
>  fs/overlayfs/super.c              |  53 ++++++--------
>  fs/posix_acl.c                    |  23 +++---
>  fs/reiserfs/xattr.c               |   2 +-
>  fs/reiserfs/xattr_security.c      |  22 +++---
>  fs/reiserfs/xattr_trusted.c       |  22 +++---
>  fs/reiserfs/xattr_user.c          |  22 +++---
>  fs/squashfs/xattr.c               |  10 +--
>  fs/ubifs/xattr.c                  |  33 +++++----
>  fs/xattr.c                        | 112 ++++++++++++++++++------------
>  fs/xfs/libxfs/xfs_attr.c          |   4 +-
>  fs/xfs/libxfs/xfs_attr.h          |   2 +-
>  fs/xfs/xfs_xattr.c                |  35 +++++-----
>  include/linux/xattr.h             |  26 ++++---
>  include/uapi/linux/xattr.h        |   7 +-
>  mm/shmem.c                        |  21 +++---
>  net/socket.c                      |  16 ++---
>  security/commoncap.c              |  29 +++++---
>  security/integrity/evm/evm_main.c |  13 +++-
>  security/selinux/hooks.c          |  28 ++++++--
>  security/smack/smack_lsm.c        |  38 ++++++----
>  55 files changed, 732 insertions(+), 734 deletions(-)
> 
> 

[...]

>  
> diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
> index 939eab7aa219..c4fee624291b 100644
> --- a/fs/ceph/xattr.c
> +++ b/fs/ceph/xattr.c
> @@ -1179,22 +1179,21 @@ int __ceph_setxattr(struct inode *inode, const char *name,
>  }
>  
>  static int ceph_get_xattr_handler(const struct xattr_handler *handler,
> -				  struct dentry *dentry, struct inode *inode,
> -				  const char *name, void *value, size_t size)
> +				  struct xattr_gs_args *args)
>  {
> -	if (!ceph_is_valid_xattr(name))
> +	if (!ceph_is_valid_xattr(args->name))
>  		return -EOPNOTSUPP;
> -	return __ceph_getxattr(inode, name, value, size);
> +	return __ceph_getxattr(args->inode, args->name,
> +			       args->buffer, args->size);
>  }
>  
>  static int ceph_set_xattr_handler(const struct xattr_handler *handler,
> -				  struct dentry *unused, struct inode *inode,
> -				  const char *name, const void *value,
> -				  size_t size, int flags)
> +				  struct xattr_gs_args *args)
>  {
> -	if (!ceph_is_valid_xattr(name))
> +	if (!ceph_is_valid_xattr(args->name))
>  		return -EOPNOTSUPP;
> -	return __ceph_setxattr(inode, name, value, size, flags);
> +	return __ceph_setxattr(args->inode, args->name,
> +			       args->value, args->size, args->flags);
>  }
>  
>  static const struct xattr_handler ceph_other_xattr_handler = {
> @@ -1300,25 +1299,22 @@ void ceph_security_invalidate_secctx(struct inode *inode)
>  }
>  
>  static int ceph_xattr_set_security_label(const struct xattr_handler *handler,
> -				    struct dentry *unused, struct inode *inode,
> -				    const char *key, const void *buf,
> -				    size_t buflen, int flags)
> +					 struct xattr_gs_args *args)
>  {
> -	if (security_ismaclabel(key)) {
> -		const char *name = xattr_full_name(handler, key);
> -		return __ceph_setxattr(inode, name, buf, buflen, flags);
> -	}
> +	if (security_ismaclabel(args->name))
> +		return __ceph_setxattr(args->inode,
> +				       xattr_full_name(handler, args->name),
> +				       args->value, args->size, args->flags);
>  	return  -EOPNOTSUPP;
>  }
>  
>  static int ceph_xattr_get_security_label(const struct xattr_handler *handler,
> -				    struct dentry *unused, struct inode *inode,
> -				    const char *key, void *buf, size_t buflen)
> +					 struct xattr_gs_args *args)
>  {
> -	if (security_ismaclabel(key)) {
> -		const char *name = xattr_full_name(handler, key);
> -		return __ceph_getxattr(inode, name, buf, buflen);
> -	}
> +	if (security_ismaclabel(args->name))
> +		return __ceph_getxattr(args->inode,
> +				       xattr_full_name(handler, args->name),
> +				       args->buffer, args->size);
>  	return  -EOPNOTSUPP;
>  }
>  

The ceph bits look fine to me. Note that we do have some patches queued
up for v5.4 that might have some merge conflicts here. Shouldn't be too
hard to fix it up though.

Acked-by: Jeff Layton <jlayton@kernel.org>




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

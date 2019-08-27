Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E139EAC0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2019 16:20:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2cKX-0006iL-DI; Tue, 27 Aug 2019 14:20:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>)
 id 1i2cKU-0006hv-Sl; Tue, 27 Aug 2019 14:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vsMENPboMxoptqxPJ1a0ohEkPoRZEhPwghulq6q40fs=; b=hncnnaO/mqjcreTZYSwekemelm
 nMU5Ih5M49Fpet41Ec+AeMUKLA/v5hXvB4FQnQRY3o2uCFvqg0vSeZRhQk5EcTmGrqUiOHFYiwIiF
 CndDren2IEQJtXoQi959F8tZBUfCezZBVA5QE0G7amsosrnlB0AuCFV/fJmUVoRposwI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vsMENPboMxoptqxPJ1a0ohEkPoRZEhPwghulq6q40fs=; b=jqSpcuUYDnhkj4VEPXgrFFVJZh
 XjCneLMJoWKSscdS4c1wQzQfO198gIHbFBUgZsCTpBsa2gO/trILA7/7alDtnVsAOugRQornE9UMu
 jM5xNEZM0tO/SMruI0Kt/IXaHAiZ7ggcUZQuaV4PMaUUuMsetzkjWn4HtdkOvJdPMknU=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2cKP-004uXs-6h; Tue, 27 Aug 2019 14:20:14 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0A664ACC6;
 Tue, 27 Aug 2019 14:19:59 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id DBFE91E4362; Tue, 27 Aug 2019 16:19:52 +0200 (CEST)
Date: Tue, 27 Aug 2019 16:19:52 +0200
From: Jan Kara <jack@suse.cz>
To: Mark Salyzyn <salyzyn@android.com>
Message-ID: <20190827141952.GB10098@quack2.suse.cz>
References: <20190820180716.129882-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820180716.129882-1-salyzyn@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1i2cKP-004uXs-6h
Subject: Re: [f2fs-dev] [PATCH v7] Add flags option to get xattr method
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Eric Sandeen <sandeen@sandeen.net>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Joel Becker <jlbec@evilplan.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Hugh Dickins <hughd@google.com>,
 kernel-team@android.com, selinux@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, reiserfs-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical@lists.samba.org, Steve French <sfrench@samba.org>,
 Bob Peterson <rpeterso@redhat.com>, Tejun Heo <tj@kernel.org>,
 linux-erofs@lists.ozlabs.org, Anna Schumaker <anna.schumaker@netapp.com>,
 ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
 Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>, Jeff Mahoney <jeffm@suse.com>,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 devel@driverdev.osuosl.org, "J. Bruce Fields" <bfields@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-security-module@vger.kernel.org, cluster-devel@redhat.com,
 v9fs-developer@lists.sourceforge.net, Bharath Vedartham <linux.bhar@gmail.com>,
 Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 netdev@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 stable@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue 20-08-19 11:06:48, Mark Salyzyn wrote:
> diff --git a/Documentation/filesystems/Locking b/Documentation/filesystems/Locking
> index 204dd3ea36bb..e2687f21c7d6 100644
> --- a/Documentation/filesystems/Locking
> +++ b/Documentation/filesystems/Locking
> @@ -101,12 +101,10 @@ of the locking scheme for directory operations.
>  ----------------------- xattr_handler operations -----------------------
>  prototypes:
>  	bool (*list)(struct dentry *dentry);
> -	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
> -		   struct inode *inode, const char *name, void *buffer,
> -		   size_t size);
> -	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
> -		   struct inode *inode, const char *name, const void *buffer,
> -		   size_t size, int flags);
> +	int (*get)(const struct xattr_handler *handler,
> +		   struct xattr_gs_flags);
> +	int (*set)(const struct xattr_handler *handler,
> +		   struct xattr_gs_flags);

The prototype here is really "struct xattr_gs_flags *args", isn't it?
Otherwise feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

for the ext2, ext4, ocfs2, reiserfs, and the generic fs/* bits. 

								Honza

>  
>  locking rules:
>  	all may block
> diff --git a/drivers/staging/erofs/xattr.c b/drivers/staging/erofs/xattr.c
> index df40654b9fbb..41dcfc82f0b2 100644
> --- a/drivers/staging/erofs/xattr.c
> +++ b/drivers/staging/erofs/xattr.c
> @@ -462,10 +462,9 @@ int erofs_getxattr(struct inode *inode, int index,
>  }
>  
>  static int erofs_xattr_generic_get(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *name, void *buffer, size_t size)
> +				   struct xattr_gs_args *args)
>  {
> -	struct erofs_sb_info *const sbi = EROFS_I_SB(inode);
> +	struct erofs_sb_info *const sbi = EROFS_I_SB(args->inode);
>  
>  	switch (handler->flags) {
>  	case EROFS_XATTR_INDEX_USER:
> @@ -482,7 +481,8 @@ static int erofs_xattr_generic_get(const struct xattr_handler *handler,
>  		return -EINVAL;
>  	}
>  
> -	return erofs_getxattr(inode, handler->flags, name, buffer, size);
> +	return erofs_getxattr(args->inode, handler->flags, args->name,
> +			      args->buffer, args->size);
>  }
>  
>  const struct xattr_handler erofs_xattr_user_handler = {
> diff --git a/fs/9p/acl.c b/fs/9p/acl.c
> index 6261719f6f2a..2f5184de75c4 100644
> --- a/fs/9p/acl.c
> +++ b/fs/9p/acl.c
> @@ -213,60 +213,61 @@ int v9fs_acl_mode(struct inode *dir, umode_t *modep,
>  }
>  
>  static int v9fs_xattr_get_acl(const struct xattr_handler *handler,
> -			      struct dentry *dentry, struct inode *inode,
> -			      const char *name, void *buffer, size_t size)
> +			      struct xattr_gs_args *args)
>  {
>  	struct v9fs_session_info *v9ses;
>  	struct posix_acl *acl;
>  	int error;
>  
> -	v9ses = v9fs_dentry2v9ses(dentry);
> +	v9ses = v9fs_dentry2v9ses(args->dentry);
>  	/*
>  	 * We allow set/get/list of acl when access=client is not specified
>  	 */
>  	if ((v9ses->flags & V9FS_ACCESS_MASK) != V9FS_ACCESS_CLIENT)
> -		return v9fs_xattr_get(dentry, handler->name, buffer, size);
> +		return v9fs_xattr_get(args->dentry, handler->name,
> +				      args->buffer, args->size);
>  
> -	acl = v9fs_get_cached_acl(inode, handler->flags);
> +	acl = v9fs_get_cached_acl(args->inode, handler->flags);
>  	if (IS_ERR(acl))
>  		return PTR_ERR(acl);
>  	if (acl == NULL)
>  		return -ENODATA;
> -	error = posix_acl_to_xattr(&init_user_ns, acl, buffer, size);
> +	error = posix_acl_to_xattr(&init_user_ns, acl,
> +				   args->buffer, args->size);
>  	posix_acl_release(acl);
>  
>  	return error;
>  }
>  
>  static int v9fs_xattr_set_acl(const struct xattr_handler *handler,
> -			      struct dentry *dentry, struct inode *inode,
> -			      const char *name, const void *value,
> -			      size_t size, int flags)
> +			      struct xattr_gs_args *args)
>  {
>  	int retval;
>  	struct posix_acl *acl;
>  	struct v9fs_session_info *v9ses;
>  
> -	v9ses = v9fs_dentry2v9ses(dentry);
> +	v9ses = v9fs_dentry2v9ses(args->dentry);
>  	/*
>  	 * set the attribute on the remote. Without even looking at the
>  	 * xattr value. We leave it to the server to validate
>  	 */
>  	if ((v9ses->flags & V9FS_ACCESS_MASK) != V9FS_ACCESS_CLIENT)
> -		return v9fs_xattr_set(dentry, handler->name, value, size,
> -				      flags);
> +		return v9fs_xattr_set(args->dentry, handler->name,
> +				      args->value, args->size, args->flags);
>  
> -	if (S_ISLNK(inode->i_mode))
> +	if (S_ISLNK(args->inode->i_mode))
>  		return -EOPNOTSUPP;
> -	if (!inode_owner_or_capable(inode))
> +	if (!inode_owner_or_capable(args->inode))
>  		return -EPERM;
> -	if (value) {
> +	if (args->value) {
>  		/* update the cached acl value */
> -		acl = posix_acl_from_xattr(&init_user_ns, value, size);
> +		acl = posix_acl_from_xattr(&init_user_ns,
> +					   args->value, args->size);
>  		if (IS_ERR(acl))
>  			return PTR_ERR(acl);
>  		else if (acl) {
> -			retval = posix_acl_valid(inode->i_sb->s_user_ns, acl);
> +			retval = posix_acl_valid(args->inode->i_sb->s_user_ns,
> +						 acl);
>  			if (retval)
>  				goto err_out;
>  		}
> @@ -279,7 +280,8 @@ static int v9fs_xattr_set_acl(const struct xattr_handler *handler,
>  			struct iattr iattr = { 0 };
>  			struct posix_acl *old_acl = acl;
>  
> -			retval = posix_acl_update_mode(inode, &iattr.ia_mode, &acl);
> +			retval = posix_acl_update_mode(args->inode,
> +						       &iattr.ia_mode, &acl);
>  			if (retval)
>  				goto err_out;
>  			if (!acl) {
> @@ -289,19 +291,19 @@ static int v9fs_xattr_set_acl(const struct xattr_handler *handler,
>  				 * update ACL.
>  				 */
>  				posix_acl_release(old_acl);
> -				value = NULL;
> -				size = 0;
> +				args->value = NULL;
> +				args->size = 0;
>  			}
>  			iattr.ia_valid = ATTR_MODE;
>  			/* FIXME should we update ctime ?
>  			 * What is the following setxattr update the
>  			 * mode ?
>  			 */
> -			v9fs_vfs_setattr_dotl(dentry, &iattr);
> +			v9fs_vfs_setattr_dotl(args->dentry, &iattr);
>  		}
>  		break;
>  	case ACL_TYPE_DEFAULT:
> -		if (!S_ISDIR(inode->i_mode)) {
> +		if (!S_ISDIR(args->inode->i_mode)) {
>  			retval = acl ? -EINVAL : 0;
>  			goto err_out;
>  		}
> @@ -309,9 +311,10 @@ static int v9fs_xattr_set_acl(const struct xattr_handler *handler,
>  	default:
>  		BUG();
>  	}
> -	retval = v9fs_xattr_set(dentry, handler->name, value, size, flags);
> +	retval = v9fs_xattr_set(args->dentry, handler->name,
> +				args->value, args->size, args->flags);
>  	if (!retval)
> -		set_cached_acl(inode, handler->flags, acl);
> +		set_cached_acl(args->inode, handler->flags, acl);
>  err_out:
>  	posix_acl_release(acl);
>  	return retval;
> diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
> index ac8ff8ca4c11..36d4c309be08 100644
> --- a/fs/9p/xattr.c
> +++ b/fs/9p/xattr.c
> @@ -138,22 +138,19 @@ ssize_t v9fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>  }
>  
>  static int v9fs_xattr_handler_get(const struct xattr_handler *handler,
> -				  struct dentry *dentry, struct inode *inode,
> -				  const char *name, void *buffer, size_t size)
> +				  struct xattr_gs_args *args)
>  {
> -	const char *full_name = xattr_full_name(handler, name);
> -
> -	return v9fs_xattr_get(dentry, full_name, buffer, size);
> +	return v9fs_xattr_get(args->dentry,
> +			      xattr_full_name(handler, args->name),
> +			      args->buffer, args->size);
>  }
>  
>  static int v9fs_xattr_handler_set(const struct xattr_handler *handler,
> -				  struct dentry *dentry, struct inode *inode,
> -				  const char *name, const void *value,
> -				  size_t size, int flags)
> +				  struct xattr_gs_args *args)
>  {
> -	const char *full_name = xattr_full_name(handler, name);
> -
> -	return v9fs_xattr_set(dentry, full_name, value, size, flags);
> +	return v9fs_xattr_set(args->dentry,
> +			      xattr_full_name(handler, args->name),
> +			      args->value, args->size, args->flags);
>  }
>  
>  static struct xattr_handler v9fs_xattr_user_handler = {
> diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
> index 5552d034090a..787ae107642d 100644
> --- a/fs/afs/xattr.c
> +++ b/fs/afs/xattr.c
> @@ -38,13 +38,11 @@ ssize_t afs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>   * Get a file's ACL.
>   */
>  static int afs_xattr_get_acl(const struct xattr_handler *handler,
> -			     struct dentry *dentry,
> -			     struct inode *inode, const char *name,
> -			     void *buffer, size_t size)
> +			     struct xattr_gs_args *args)
>  {
>  	struct afs_fs_cursor fc;
>  	struct afs_status_cb *scb;
> -	struct afs_vnode *vnode = AFS_FS_I(inode);
> +	struct afs_vnode *vnode = AFS_FS_I(args->inode);
>  	struct afs_acl *acl = NULL;
>  	struct key *key;
>  	int ret = -ENOMEM;
> @@ -76,9 +74,9 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
>  
>  	if (ret == 0) {
>  		ret = acl->size;
> -		if (size > 0) {
> -			if (acl->size <= size)
> -				memcpy(buffer, acl->data, acl->size);
> +		if (args->size > 0) {
> +			if (acl->size <= args->size)
> +				memcpy(args->buffer, acl->data, acl->size);
>  			else
>  				ret = -ERANGE;
>  		}
> @@ -96,25 +94,23 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
>   * Set a file's AFS3 ACL.
>   */
>  static int afs_xattr_set_acl(const struct xattr_handler *handler,
> -                             struct dentry *dentry,
> -                             struct inode *inode, const char *name,
> -                             const void *buffer, size_t size, int flags)
> +			     struct xattr_gs_args *args)
>  {
>  	struct afs_fs_cursor fc;
>  	struct afs_status_cb *scb;
> -	struct afs_vnode *vnode = AFS_FS_I(inode);
> +	struct afs_vnode *vnode = AFS_FS_I(args->inode);
>  	struct afs_acl *acl = NULL;
>  	struct key *key;
>  	int ret = -ENOMEM;
>  
> -	if (flags == XATTR_CREATE)
> +	if (args->flags == XATTR_CREATE)
>  		return -EINVAL;
>  
>  	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
>  	if (!scb)
>  		goto error;
>  
> -	acl = kmalloc(sizeof(*acl) + size, GFP_KERNEL);
> +	acl = kmalloc(sizeof(*acl) + args->size, GFP_KERNEL);
>  	if (!acl)
>  		goto error_scb;
>  
> @@ -124,8 +120,8 @@ static int afs_xattr_set_acl(const struct xattr_handler *handler,
>  		goto error_acl;
>  	}
>  
> -	acl->size = size;
> -	memcpy(acl->data, buffer, size);
> +	acl->size = args->size;
> +	memcpy(acl->data, args->value, args->size);
>  
>  	ret = -ERESTARTSYS;
>  	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
> @@ -161,25 +157,23 @@ static const struct xattr_handler afs_xattr_afs_acl_handler = {
>   * Get a file's YFS ACL.
>   */
>  static int afs_xattr_get_yfs(const struct xattr_handler *handler,
> -			     struct dentry *dentry,
> -			     struct inode *inode, const char *name,
> -			     void *buffer, size_t size)
> +			     struct xattr_gs_args *args)
>  {
>  	struct afs_fs_cursor fc;
>  	struct afs_status_cb *scb;
> -	struct afs_vnode *vnode = AFS_FS_I(inode);
> +	struct afs_vnode *vnode = AFS_FS_I(args->inode);
>  	struct yfs_acl *yacl = NULL;
>  	struct key *key;
>  	char buf[16], *data;
>  	int which = 0, dsize, ret = -ENOMEM;
>  
> -	if (strcmp(name, "acl") == 0)
> +	if (strcmp(args->name, "acl") == 0)
>  		which = 0;
> -	else if (strcmp(name, "acl_inherited") == 0)
> +	else if (strcmp(args->name, "acl_inherited") == 0)
>  		which = 1;
> -	else if (strcmp(name, "acl_num_cleaned") == 0)
> +	else if (strcmp(args->name, "acl_num_cleaned") == 0)
>  		which = 2;
> -	else if (strcmp(name, "vol_acl") == 0)
> +	else if (strcmp(args->name, "vol_acl") == 0)
>  		which = 3;
>  	else
>  		return -EOPNOTSUPP;
> @@ -228,11 +222,11 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>  		break;
>  	case 1:
>  		data = buf;
> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>  		break;
>  	case 2:
>  		data = buf;
> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>  		break;
>  	case 3:
>  		data = yacl->vol_acl->data;
> @@ -244,12 +238,12 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>  	}
>  
>  	ret = dsize;
> -	if (size > 0) {
> -		if (dsize > size) {
> +	if (args->size > 0) {
> +		if (dsize > args->size) {
>  			ret = -ERANGE;
>  			goto error_key;
>  		}
> -		memcpy(buffer, data, dsize);
> +		memcpy(args->buffer, data, dsize);
>  	}
>  
>  error_key:
> @@ -266,31 +260,29 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>   * Set a file's YFS ACL.
>   */
>  static int afs_xattr_set_yfs(const struct xattr_handler *handler,
> -                             struct dentry *dentry,
> -                             struct inode *inode, const char *name,
> -                             const void *buffer, size_t size, int flags)
> +			     struct xattr_gs_args *args)
>  {
>  	struct afs_fs_cursor fc;
>  	struct afs_status_cb *scb;
> -	struct afs_vnode *vnode = AFS_FS_I(inode);
> +	struct afs_vnode *vnode = AFS_FS_I(args->inode);
>  	struct afs_acl *acl = NULL;
>  	struct key *key;
>  	int ret = -ENOMEM;
>  
> -	if (flags == XATTR_CREATE ||
> -	    strcmp(name, "acl") != 0)
> +	if (args->flags == XATTR_CREATE ||
> +	    strcmp(args->name, "acl") != 0)
>  		return -EINVAL;
>  
>  	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
>  	if (!scb)
>  		goto error;
>  
> -	acl = kmalloc(sizeof(*acl) + size, GFP_KERNEL);
> +	acl = kmalloc(sizeof(*acl) + args->size, GFP_KERNEL);
>  	if (!acl)
>  		goto error_scb;
>  
> -	acl->size = size;
> -	memcpy(acl->data, buffer, size);
> +	acl->size = args->size;
> +	memcpy(acl->data, args->value, args->size);
>  
>  	key = afs_request_key(vnode->volume->cell);
>  	if (IS_ERR(key)) {
> @@ -332,20 +324,18 @@ static const struct xattr_handler afs_xattr_yfs_handler = {
>   * Get the name of the cell on which a file resides.
>   */
>  static int afs_xattr_get_cell(const struct xattr_handler *handler,
> -			      struct dentry *dentry,
> -			      struct inode *inode, const char *name,
> -			      void *buffer, size_t size)
> +			      struct xattr_gs_args *args)
>  {
> -	struct afs_vnode *vnode = AFS_FS_I(inode);
> +	struct afs_vnode *vnode = AFS_FS_I(args->inode);
>  	struct afs_cell *cell = vnode->volume->cell;
>  	size_t namelen;
>  
>  	namelen = cell->name_len;
> -	if (size == 0)
> +	if (args->size == 0)
>  		return namelen;
> -	if (namelen > size)
> +	if (namelen > args->size)
>  		return -ERANGE;
> -	memcpy(buffer, cell->name, namelen);
> +	memcpy(args->buffer, cell->name, namelen);
>  	return namelen;
>  }
>  
> @@ -359,30 +349,30 @@ static const struct xattr_handler afs_xattr_afs_cell_handler = {
>   * hex numbers separated by colons.
>   */
>  static int afs_xattr_get_fid(const struct xattr_handler *handler,
> -			     struct dentry *dentry,
> -			     struct inode *inode, const char *name,
> -			     void *buffer, size_t size)
> +			     struct xattr_gs_args *args)
>  {
> -	struct afs_vnode *vnode = AFS_FS_I(inode);
> +	struct afs_vnode *vnode = AFS_FS_I(args->inode);
>  	char text[16 + 1 + 24 + 1 + 8 + 1];
>  	size_t len;
>  
>  	/* The volume ID is 64-bit, the vnode ID is 96-bit and the
>  	 * uniquifier is 32-bit.
>  	 */
> -	len = sprintf(text, "%llx:", vnode->fid.vid);
> +	len = scnprintf(text, sizeof(text), "%llx:", vnode->fid.vid);
>  	if (vnode->fid.vnode_hi)
> -		len += sprintf(text + len, "%x%016llx",
> +		len += scnprintf(text + len, sizeof(text) - len, "%x%016llx",
>  			       vnode->fid.vnode_hi, vnode->fid.vnode);
>  	else
> -		len += sprintf(text + len, "%llx", vnode->fid.vnode);
> -	len += sprintf(text + len, ":%x", vnode->fid.unique);
> +		len += scnprintf(text + len, sizeof(text) - len, "%llx",
> +				 vnode->fid.vnode);
> +	len += scnprintf(text + len, sizeof(text) - len, ":%x",
> +			 vnode->fid.unique);
>  
> -	if (size == 0)
> +	if (args->size == 0)
>  		return len;
> -	if (len > size)
> +	if (len > args->size)
>  		return -ERANGE;
> -	memcpy(buffer, text, len);
> +	memcpy(args->buffer, text, len);
>  	return len;
>  }
>  
> @@ -395,20 +385,18 @@ static const struct xattr_handler afs_xattr_afs_fid_handler = {
>   * Get the name of the volume on which a file resides.
>   */
>  static int afs_xattr_get_volume(const struct xattr_handler *handler,
> -			      struct dentry *dentry,
> -			      struct inode *inode, const char *name,
> -			      void *buffer, size_t size)
> +			      struct xattr_gs_args *args)
>  {
> -	struct afs_vnode *vnode = AFS_FS_I(inode);
> +	struct afs_vnode *vnode = AFS_FS_I(args->inode);
>  	const char *volname = vnode->volume->name;
>  	size_t namelen;
>  
>  	namelen = strlen(volname);
> -	if (size == 0)
> +	if (args->size == 0)
>  		return namelen;
> -	if (namelen > size)
> +	if (namelen > args->size)
>  		return -ERANGE;
> -	memcpy(buffer, volname, namelen);
> +	memcpy(args->buffer, volname, namelen);
>  	return namelen;
>  }
>  
> diff --git a/fs/btrfs/xattr.c b/fs/btrfs/xattr.c
> index 95d9aebff2c4..e47a0e461bd2 100644
> --- a/fs/btrfs/xattr.c
> +++ b/fs/btrfs/xattr.c
> @@ -352,33 +352,30 @@ ssize_t btrfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>  }
>  
>  static int btrfs_xattr_handler_get(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *name, void *buffer, size_t size)
> +				   struct xattr_gs_args *args)
>  {
> -	name = xattr_full_name(handler, name);
> -	return btrfs_getxattr(inode, name, buffer, size);
> +	return btrfs_getxattr(args->inode,
> +			      xattr_full_name(handler, args->name),
> +			      args->buffer, args->size);
>  }
>  
>  static int btrfs_xattr_handler_set(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *name, const void *buffer,
> -				   size_t size, int flags)
> +				   struct xattr_gs_args *args)
>  {
> -	name = xattr_full_name(handler, name);
> -	return btrfs_setxattr_trans(inode, name, buffer, size, flags);
> +	return btrfs_setxattr_trans(args->inode,
> +				    xattr_full_name(handler, args->name),
> +				    args->value, args->size, args->flags);
>  }
>  
>  static int btrfs_xattr_handler_set_prop(const struct xattr_handler *handler,
> -					struct dentry *unused, struct inode *inode,
> -					const char *name, const void *value,
> -					size_t size, int flags)
> +					struct xattr_gs_args *args)
>  {
>  	int ret;
>  	struct btrfs_trans_handle *trans;
> -	struct btrfs_root *root = BTRFS_I(inode)->root;
> +	struct btrfs_root *root = BTRFS_I(args->inode)->root;
>  
> -	name = xattr_full_name(handler, name);
> -	ret = btrfs_validate_prop(name, value, size);
> +	ret = btrfs_validate_prop(xattr_full_name(handler, args->name),
> +				  args->value, args->size);
>  	if (ret)
>  		return ret;
>  
> @@ -386,11 +383,12 @@ static int btrfs_xattr_handler_set_prop(const struct xattr_handler *handler,
>  	if (IS_ERR(trans))
>  		return PTR_ERR(trans);
>  
> -	ret = btrfs_set_prop(trans, inode, name, value, size, flags);
> +	ret = btrfs_set_prop(trans, args->inode, args->name,
> +			     args->value, args->size, args->flags);
>  	if (!ret) {
> -		inode_inc_iversion(inode);
> -		inode->i_ctime = current_time(inode);
> -		ret = btrfs_update_inode(trans, root, inode);
> +		inode_inc_iversion(args->inode);
> +		args->inode->i_ctime = current_time(args->inode);
> +		ret = btrfs_update_inode(trans, root, args->inode);
>  		BUG_ON(ret);
>  	}
>  
> diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
> index 37b458a9af3a..71395a8e5ec7 100644
> --- a/fs/ceph/xattr.c
> +++ b/fs/ceph/xattr.c
> @@ -1170,22 +1170,21 @@ int __ceph_setxattr(struct inode *inode, const char *name,
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
> @@ -1291,25 +1290,22 @@ void ceph_security_invalidate_secctx(struct inode *inode)
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
> diff --git a/fs/cifs/xattr.c b/fs/cifs/xattr.c
> index 9076150758d8..2506d12c7e5d 100644
> --- a/fs/cifs/xattr.c
> +++ b/fs/cifs/xattr.c
> @@ -48,13 +48,11 @@
>  enum { XATTR_USER, XATTR_CIFS_ACL, XATTR_ACL_ACCESS, XATTR_ACL_DEFAULT };
>  
>  static int cifs_xattr_set(const struct xattr_handler *handler,
> -			  struct dentry *dentry, struct inode *inode,
> -			  const char *name, const void *value,
> -			  size_t size, int flags)
> +			  struct xattr_gs_args *args)
>  {
>  	int rc = -EOPNOTSUPP;
>  	unsigned int xid;
> -	struct super_block *sb = dentry->d_sb;
> +	struct super_block *sb = args->dentry->d_sb;
>  	struct cifs_sb_info *cifs_sb = CIFS_SB(sb);
>  	struct tcon_link *tlink;
>  	struct cifs_tcon *pTcon;
> @@ -67,7 +65,7 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
>  
>  	xid = get_xid();
>  
> -	full_path = build_path_from_dentry(dentry);
> +	full_path = build_path_from_dentry(args->dentry);
>  	if (full_path == NULL) {
>  		rc = -ENOMEM;
>  		goto out;
> @@ -78,7 +76,7 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
>  	/* if proc/fs/cifs/streamstoxattr is set then
>  		search server for EAs or streams to
>  		returns as xattrs */
> -	if (size > MAX_EA_VALUE_SIZE) {
> +	if (args->size > MAX_EA_VALUE_SIZE) {
>  		cifs_dbg(FYI, "size of EA value too large\n");
>  		rc = -EOPNOTSUPP;
>  		goto out;
> @@ -91,29 +89,30 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
>  
>  		if (pTcon->ses->server->ops->set_EA)
>  			rc = pTcon->ses->server->ops->set_EA(xid, pTcon,
> -				full_path, name, value, (__u16)size,
> +				full_path, args->name,
> +				args->value, (__u16)args->size,
>  				cifs_sb->local_nls, cifs_sb);
>  		break;
>  
>  	case XATTR_CIFS_ACL: {
>  		struct cifs_ntsd *pacl;
>  
> -		if (!value)
> +		if (!args->value)
>  			goto out;
> -		pacl = kmalloc(size, GFP_KERNEL);
> +		pacl = kmalloc(args->size, GFP_KERNEL);
>  		if (!pacl) {
>  			rc = -ENOMEM;
>  		} else {
> -			memcpy(pacl, value, size);
> -			if (value &&
> +			memcpy(pacl, args->value, args->size);
> +			if (args->value &&
>  			    pTcon->ses->server->ops->set_acl)
>  				rc = pTcon->ses->server->ops->set_acl(pacl,
> -						size, inode,
> +						args->size, args->inode,
>  						full_path, CIFS_ACL_DACL);
>  			else
>  				rc = -EOPNOTSUPP;
>  			if (rc == 0) /* force revalidate of the inode */
> -				CIFS_I(inode)->time = 0;
> +				CIFS_I(args->inode)->time = 0;
>  			kfree(pacl);
>  		}
>  		break;
> @@ -121,11 +120,11 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
>  
>  	case XATTR_ACL_ACCESS:
>  #ifdef CONFIG_CIFS_POSIX
> -		if (!value)
> +		if (!args->value)
>  			goto out;
>  		if (sb->s_flags & SB_POSIXACL)
>  			rc = CIFSSMBSetPosixACL(xid, pTcon, full_path,
> -				value, (const int)size,
> +				args->value, (const int)args->size,
>  				ACL_TYPE_ACCESS, cifs_sb->local_nls,
>  				cifs_remap(cifs_sb));
>  #endif  /* CONFIG_CIFS_POSIX */
> @@ -133,11 +132,11 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
>  
>  	case XATTR_ACL_DEFAULT:
>  #ifdef CONFIG_CIFS_POSIX
> -		if (!value)
> +		if (!args->value)
>  			goto out;
>  		if (sb->s_flags & SB_POSIXACL)
>  			rc = CIFSSMBSetPosixACL(xid, pTcon, full_path,
> -				value, (const int)size,
> +				args->value, (const int)args->size,
>  				ACL_TYPE_DEFAULT, cifs_sb->local_nls,
>  				cifs_remap(cifs_sb));
>  #endif  /* CONFIG_CIFS_POSIX */
> @@ -198,12 +197,11 @@ static int cifs_creation_time_get(struct dentry *dentry, struct inode *inode,
>  
>  
>  static int cifs_xattr_get(const struct xattr_handler *handler,
> -			  struct dentry *dentry, struct inode *inode,
> -			  const char *name, void *value, size_t size)
> +			  struct xattr_gs_args *args)
>  {
>  	ssize_t rc = -EOPNOTSUPP;
>  	unsigned int xid;
> -	struct super_block *sb = dentry->d_sb;
> +	struct super_block *sb = args->dentry->d_sb;
>  	struct cifs_sb_info *cifs_sb = CIFS_SB(sb);
>  	struct tcon_link *tlink;
>  	struct cifs_tcon *pTcon;
> @@ -216,7 +214,7 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
>  
>  	xid = get_xid();
>  
> -	full_path = build_path_from_dentry(dentry);
> +	full_path = build_path_from_dentry(args->dentry);
>  	if (full_path == NULL) {
>  		rc = -ENOMEM;
>  		goto out;
> @@ -225,14 +223,17 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
>  	/* return alt name if available as pseudo attr */
>  	switch (handler->flags) {
>  	case XATTR_USER:
> -		cifs_dbg(FYI, "%s:querying user xattr %s\n", __func__, name);
> -		if ((strcmp(name, CIFS_XATTR_ATTRIB) == 0) ||
> -		    (strcmp(name, SMB3_XATTR_ATTRIB) == 0)) {
> -			rc = cifs_attrib_get(dentry, inode, value, size);
> +		cifs_dbg(FYI, "%s:querying user xattr %s\n", __func__,
> +			 args->name);
> +		if ((strcmp(args->name, CIFS_XATTR_ATTRIB) == 0) ||
> +		    (strcmp(args->name, SMB3_XATTR_ATTRIB) == 0)) {
> +			rc = cifs_attrib_get(args->dentry, args->inode,
> +					     args->buffer, args->size);
>  			break;
> -		} else if ((strcmp(name, CIFS_XATTR_CREATETIME) == 0) ||
> -		    (strcmp(name, SMB3_XATTR_CREATETIME) == 0)) {
> -			rc = cifs_creation_time_get(dentry, inode, value, size);
> +		} else if ((strcmp(args->name, CIFS_XATTR_CREATETIME) == 0) ||
> +		    (strcmp(args->name, SMB3_XATTR_CREATETIME) == 0)) {
> +			rc = cifs_creation_time_get(args->dentry, args->inode,
> +						    args->buffer, args->size);
>  			break;
>  		}
>  
> @@ -241,7 +242,8 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
>  
>  		if (pTcon->ses->server->ops->query_all_EAs)
>  			rc = pTcon->ses->server->ops->query_all_EAs(xid, pTcon,
> -				full_path, name, value, size, cifs_sb);
> +				full_path, args->name,
> +				args->buffer, args->size, cifs_sb);
>  		break;
>  
>  	case XATTR_CIFS_ACL: {
> @@ -252,17 +254,17 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
>  			goto out; /* rc already EOPNOTSUPP */
>  
>  		pacl = pTcon->ses->server->ops->get_acl(cifs_sb,
> -				inode, full_path, &acllen);
> +				args->inode, full_path, &acllen);
>  		if (IS_ERR(pacl)) {
>  			rc = PTR_ERR(pacl);
>  			cifs_dbg(VFS, "%s: error %zd getting sec desc\n",
>  				 __func__, rc);
>  		} else {
> -			if (value) {
> -				if (acllen > size)
> +			if (args->buffer) {
> +				if (acllen > args->size)
>  					acllen = -ERANGE;
>  				else
> -					memcpy(value, pacl, acllen);
> +					memcpy(args->buffer, pacl, acllen);
>  			}
>  			rc = acllen;
>  			kfree(pacl);
> @@ -274,7 +276,7 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
>  #ifdef CONFIG_CIFS_POSIX
>  		if (sb->s_flags & SB_POSIXACL)
>  			rc = CIFSSMBGetPosixACL(xid, pTcon, full_path,
> -				value, size, ACL_TYPE_ACCESS,
> +				args->buffer, args->size, ACL_TYPE_ACCESS,
>  				cifs_sb->local_nls,
>  				cifs_remap(cifs_sb));
>  #endif  /* CONFIG_CIFS_POSIX */
> @@ -284,7 +286,7 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
>  #ifdef CONFIG_CIFS_POSIX
>  		if (sb->s_flags & SB_POSIXACL)
>  			rc = CIFSSMBGetPosixACL(xid, pTcon, full_path,
> -				value, size, ACL_TYPE_DEFAULT,
> +				args->buffer, args->size, ACL_TYPE_DEFAULT,
>  				cifs_sb->local_nls,
>  				cifs_remap(cifs_sb));
>  #endif  /* CONFIG_CIFS_POSIX */
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index f91db24bbf3b..5fbda6491920 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -1114,20 +1114,24 @@ ecryptfs_write_metadata_to_xattr(struct dentry *ecryptfs_dentry,
>  				 char *page_virt, size_t size)
>  {
>  	int rc;
> -	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(ecryptfs_dentry);
> -	struct inode *lower_inode = d_inode(lower_dentry);
> +	struct xattr_gs_args lower = {};
>  
> -	if (!(lower_inode->i_opflags & IOP_XATTR)) {
> +	lower.dentry = ecryptfs_dentry_to_lower(ecryptfs_dentry);
> +	lower.inode = d_inode(lower.dentry);
> +
> +	if (!(lower.inode->i_opflags & IOP_XATTR)) {
>  		rc = -EOPNOTSUPP;
>  		goto out;
>  	}
>  
> -	inode_lock(lower_inode);
> -	rc = __vfs_setxattr(lower_dentry, lower_inode, ECRYPTFS_XATTR_NAME,
> -			    page_virt, size, 0);
> +	lower.name = ECRYPTFS_XATTR_NAME;
> +	lower.value = page_virt;
> +	lower.size = size;
> +	inode_lock(lower.inode);
> +	rc = __vfs_setxattr(&lower);
>  	if (!rc && ecryptfs_inode)
> -		fsstack_copy_attr_all(ecryptfs_inode, lower_inode);
> -	inode_unlock(lower_inode);
> +		fsstack_copy_attr_all(ecryptfs_inode, lower.inode);
> +	inode_unlock(lower.inode);
>  out:
>  	return rc;
>  }
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 18426f4855f1..fc4435847a45 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -1009,16 +1009,24 @@ ecryptfs_setxattr(struct dentry *dentry, struct inode *inode,
>  
>  ssize_t
>  ecryptfs_getxattr_lower(struct dentry *lower_dentry, struct inode *lower_inode,
> -			const char *name, void *value, size_t size)
> +			const char *name, void *buffer, size_t size)
>  {
>  	int rc;
> +	struct xattr_gs_args args;
>  
>  	if (!(lower_inode->i_opflags & IOP_XATTR)) {
>  		rc = -EOPNOTSUPP;
>  		goto out;
>  	}
> +	memset(&args, 0, sizeof(args));
> +	args.dentry = lower_dentry;
> +	args.inode = lower_inode;
> +	args.name = name;
> +	args.buffer = buffer;
> +	args.size = size;
> +	args.flags = XATTR_NOSECURITY;
>  	inode_lock(lower_inode);
> -	rc = __vfs_getxattr(lower_dentry, lower_inode, name, value, size);
> +	rc = __vfs_getxattr(&args);
>  	inode_unlock(lower_inode);
>  out:
>  	return rc;
> @@ -1102,23 +1110,23 @@ const struct inode_operations ecryptfs_main_iops = {
>  };
>  
>  static int ecryptfs_xattr_get(const struct xattr_handler *handler,
> -			      struct dentry *dentry, struct inode *inode,
> -			      const char *name, void *buffer, size_t size)
> +			      struct xattr_gs_args *args)
>  {
> -	return ecryptfs_getxattr(dentry, inode, name, buffer, size);
> +	return ecryptfs_getxattr(args->dentry, args->inode, args->name,
> +				 args->buffer, args->size);
>  }
>  
>  static int ecryptfs_xattr_set(const struct xattr_handler *handler,
> -			      struct dentry *dentry, struct inode *inode,
> -			      const char *name, const void *value, size_t size,
> -			      int flags)
> +			      struct xattr_gs_args *args)
>  {
> -	if (value)
> -		return ecryptfs_setxattr(dentry, inode, name, value, size, flags);
> -	else {
> -		BUG_ON(flags != XATTR_REPLACE);
> -		return ecryptfs_removexattr(dentry, inode, name);
> -	}
> +	if (args->value)
> +		return ecryptfs_setxattr(args->dentry, args->inode, args->name,
> +					 args->value, args->size, args->flags);
> +	else if (args->flags != XATTR_REPLACE)
> +		return -EINVAL;
> +	else
> +		return ecryptfs_removexattr(args->dentry, args->inode,
> +					    args->name);
>  }
>  
>  static const struct xattr_handler ecryptfs_xattr_handler = {
> diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
> index cffa0c1ec829..90dc0354ec5e 100644
> --- a/fs/ecryptfs/mmap.c
> +++ b/fs/ecryptfs/mmap.c
> @@ -402,37 +402,40 @@ struct kmem_cache *ecryptfs_xattr_cache;
>  
>  static int ecryptfs_write_inode_size_to_xattr(struct inode *ecryptfs_inode)
>  {
> -	ssize_t size;
> -	void *xattr_virt;
> -	struct dentry *lower_dentry =
> -		ecryptfs_inode_to_private(ecryptfs_inode)->lower_file->f_path.dentry;
> -	struct inode *lower_inode = d_inode(lower_dentry);
> +	struct xattr_gs_args args;
>  	int rc;
>  
> -	if (!(lower_inode->i_opflags & IOP_XATTR)) {
> +	memset(&args, 0, sizeof(args));
> +	args.dentry = ecryptfs_inode_to_private(ecryptfs_inode)->
> +		lower_file->f_path.dentry;
> +	args.inode = d_inode(args.dentry);
> +	if (!(args.inode->i_opflags & IOP_XATTR)) {
>  		printk(KERN_WARNING
>  		       "No support for setting xattr in lower filesystem\n");
>  		rc = -ENOSYS;
>  		goto out;
>  	}
> -	xattr_virt = kmem_cache_alloc(ecryptfs_xattr_cache, GFP_KERNEL);
> -	if (!xattr_virt) {
> +	args.buffer = kmem_cache_alloc(ecryptfs_xattr_cache, GFP_KERNEL);
> +	if (!args.buffer) {
>  		rc = -ENOMEM;
>  		goto out;
>  	}
> -	inode_lock(lower_inode);
> -	size = __vfs_getxattr(lower_dentry, lower_inode, ECRYPTFS_XATTR_NAME,
> -			      xattr_virt, PAGE_SIZE);
> -	if (size < 0)
> -		size = 8;
> -	put_unaligned_be64(i_size_read(ecryptfs_inode), xattr_virt);
> -	rc = __vfs_setxattr(lower_dentry, lower_inode, ECRYPTFS_XATTR_NAME,
> -			    xattr_virt, size, 0);
> -	inode_unlock(lower_inode);
> +	args.name = ECRYPTFS_XATTR_NAME;
> +	args.size = PAGE_SIZE;
> +	args.flags = XATTR_NOSECURITY;
> +	inode_lock(args.inode);
> +	args.size = __vfs_getxattr(&args);
> +	if (args.size < 0)
> +		args.size = 8;
> +	put_unaligned_be64(i_size_read(ecryptfs_inode), args.buffer);
> +	args.flags = 0;
> +	args.value = args.buffer;
> +	rc = __vfs_setxattr(&args);
> +	inode_unlock(args.inode);
>  	if (rc)
>  		printk(KERN_ERR "Error whilst attempting to write inode size "
>  		       "to lower file xattr; rc = [%d]\n", rc);
> -	kmem_cache_free(ecryptfs_xattr_cache, xattr_virt);
> +	kmem_cache_free(ecryptfs_xattr_cache, args.buffer);
>  out:
>  	return rc;
>  }
> diff --git a/fs/ext2/xattr_security.c b/fs/ext2/xattr_security.c
> index 9a682e440acb..d651d4a7c9ca 100644
> --- a/fs/ext2/xattr_security.c
> +++ b/fs/ext2/xattr_security.c
> @@ -10,21 +10,19 @@
>  
>  static int
>  ext2_xattr_security_get(const struct xattr_handler *handler,
> -			struct dentry *unused, struct inode *inode,
> -			const char *name, void *buffer, size_t size)
> +			struct xattr_gs_args *args)
>  {
> -	return ext2_xattr_get(inode, EXT2_XATTR_INDEX_SECURITY, name,
> -			      buffer, size);
> +	return ext2_xattr_get(args->inode, EXT2_XATTR_INDEX_SECURITY,
> +			      args->name, args->buffer, args->size);
>  }
>  
>  static int
>  ext2_xattr_security_set(const struct xattr_handler *handler,
> -			struct dentry *unused, struct inode *inode,
> -			const char *name, const void *value,
> -			size_t size, int flags)
> +			struct xattr_gs_args *args)
>  {
> -	return ext2_xattr_set(inode, EXT2_XATTR_INDEX_SECURITY, name,
> -			      value, size, flags);
> +	return ext2_xattr_set(args->inode, EXT2_XATTR_INDEX_SECURITY,
> +			      args->name, args->value, args->size,
> +			      args->flags);
>  }
>  
>  static int ext2_initxattrs(struct inode *inode, const struct xattr *xattr_array,
> diff --git a/fs/ext2/xattr_trusted.c b/fs/ext2/xattr_trusted.c
> index 49add1107850..41390dd0386a 100644
> --- a/fs/ext2/xattr_trusted.c
> +++ b/fs/ext2/xattr_trusted.c
> @@ -17,21 +17,18 @@ ext2_xattr_trusted_list(struct dentry *dentry)
>  
>  static int
>  ext2_xattr_trusted_get(const struct xattr_handler *handler,
> -		       struct dentry *unused, struct inode *inode,
> -		       const char *name, void *buffer, size_t size)
> +		       struct xattr_gs_args *args)
>  {
> -	return ext2_xattr_get(inode, EXT2_XATTR_INDEX_TRUSTED, name,
> -			      buffer, size);
> +	return ext2_xattr_get(args->inode, EXT2_XATTR_INDEX_TRUSTED, args->name,
> +			      args->buffer, args->size);
>  }
>  
>  static int
>  ext2_xattr_trusted_set(const struct xattr_handler *handler,
> -		       struct dentry *unused, struct inode *inode,
> -		       const char *name, const void *value,
> -		       size_t size, int flags)
> +		       struct xattr_gs_args *args)
>  {
> -	return ext2_xattr_set(inode, EXT2_XATTR_INDEX_TRUSTED, name,
> -			      value, size, flags);
> +	return ext2_xattr_set(args->inode, EXT2_XATTR_INDEX_TRUSTED, args->name,
> +			      args->value, args->size, args->flags);
>  }
>  
>  const struct xattr_handler ext2_xattr_trusted_handler = {
> diff --git a/fs/ext2/xattr_user.c b/fs/ext2/xattr_user.c
> index c243a3b4d69d..1ef881890dde 100644
> --- a/fs/ext2/xattr_user.c
> +++ b/fs/ext2/xattr_user.c
> @@ -19,26 +19,23 @@ ext2_xattr_user_list(struct dentry *dentry)
>  
>  static int
>  ext2_xattr_user_get(const struct xattr_handler *handler,
> -		    struct dentry *unused, struct inode *inode,
> -		    const char *name, void *buffer, size_t size)
> +		    struct xattr_gs_args *args)
>  {
> -	if (!test_opt(inode->i_sb, XATTR_USER))
> +	if (!test_opt(args->inode->i_sb, XATTR_USER))
>  		return -EOPNOTSUPP;
> -	return ext2_xattr_get(inode, EXT2_XATTR_INDEX_USER,
> -			      name, buffer, size);
> +	return ext2_xattr_get(args->inode, EXT2_XATTR_INDEX_USER, args->name,
> +			      args->buffer, args->size);
>  }
>  
>  static int
>  ext2_xattr_user_set(const struct xattr_handler *handler,
> -		    struct dentry *unused, struct inode *inode,
> -		    const char *name, const void *value,
> -		    size_t size, int flags)
> +		    struct xattr_gs_args *args)
>  {
> -	if (!test_opt(inode->i_sb, XATTR_USER))
> +	if (!test_opt(args->inode->i_sb, XATTR_USER))
>  		return -EOPNOTSUPP;
>  
> -	return ext2_xattr_set(inode, EXT2_XATTR_INDEX_USER,
> -			      name, value, size, flags);
> +	return ext2_xattr_set(args->inode, EXT2_XATTR_INDEX_USER, args->name,
> +			      args->value, args->size, args->flags);
>  }
>  
>  const struct xattr_handler ext2_xattr_user_handler = {
> diff --git a/fs/ext4/xattr_security.c b/fs/ext4/xattr_security.c
> index 197a9d8a15ef..71ed703e01fe 100644
> --- a/fs/ext4/xattr_security.c
> +++ b/fs/ext4/xattr_security.c
> @@ -14,21 +14,18 @@
>  
>  static int
>  ext4_xattr_security_get(const struct xattr_handler *handler,
> -			struct dentry *unused, struct inode *inode,
> -			const char *name, void *buffer, size_t size)
> +			struct xattr_gs_args *args)
>  {
> -	return ext4_xattr_get(inode, EXT4_XATTR_INDEX_SECURITY,
> -			      name, buffer, size);
> +	return ext4_xattr_get(args->inode, EXT4_XATTR_INDEX_SECURITY,
> +			      args->name, args->buffer, args->size);
>  }
>  
>  static int
>  ext4_xattr_security_set(const struct xattr_handler *handler,
> -			struct dentry *unused, struct inode *inode,
> -			const char *name, const void *value,
> -			size_t size, int flags)
> +			struct xattr_gs_args *args)
>  {
> -	return ext4_xattr_set(inode, EXT4_XATTR_INDEX_SECURITY,
> -			      name, value, size, flags);
> +	return ext4_xattr_set(args->inode, EXT4_XATTR_INDEX_SECURITY,
> +			      args->name, args->value, args->size, args->flags);
>  }
>  
>  static int
> diff --git a/fs/ext4/xattr_trusted.c b/fs/ext4/xattr_trusted.c
> index e9389e5d75c3..ed347a978102 100644
> --- a/fs/ext4/xattr_trusted.c
> +++ b/fs/ext4/xattr_trusted.c
> @@ -21,21 +21,18 @@ ext4_xattr_trusted_list(struct dentry *dentry)
>  
>  static int
>  ext4_xattr_trusted_get(const struct xattr_handler *handler,
> -		       struct dentry *unused, struct inode *inode,
> -		       const char *name, void *buffer, size_t size)
> +		       struct xattr_gs_args *args)
>  {
> -	return ext4_xattr_get(inode, EXT4_XATTR_INDEX_TRUSTED,
> -			      name, buffer, size);
> +	return ext4_xattr_get(args->inode, EXT4_XATTR_INDEX_TRUSTED,
> +			      args->name, args->buffer, args->size);
>  }
>  
>  static int
>  ext4_xattr_trusted_set(const struct xattr_handler *handler,
> -		       struct dentry *unused, struct inode *inode,
> -		       const char *name, const void *value,
> -		       size_t size, int flags)
> +		       struct xattr_gs_args *args)
>  {
> -	return ext4_xattr_set(inode, EXT4_XATTR_INDEX_TRUSTED,
> -			      name, value, size, flags);
> +	return ext4_xattr_set(args->inode, EXT4_XATTR_INDEX_TRUSTED,
> +			      args->name, args->value, args->size, args->flags);
>  }
>  
>  const struct xattr_handler ext4_xattr_trusted_handler = {
> diff --git a/fs/ext4/xattr_user.c b/fs/ext4/xattr_user.c
> index d4546184b34b..86e9f5a9284d 100644
> --- a/fs/ext4/xattr_user.c
> +++ b/fs/ext4/xattr_user.c
> @@ -20,25 +20,22 @@ ext4_xattr_user_list(struct dentry *dentry)
>  
>  static int
>  ext4_xattr_user_get(const struct xattr_handler *handler,
> -		    struct dentry *unused, struct inode *inode,
> -		    const char *name, void *buffer, size_t size)
> +		    struct xattr_gs_args *args)
>  {
> -	if (!test_opt(inode->i_sb, XATTR_USER))
> +	if (!test_opt(args->inode->i_sb, XATTR_USER))
>  		return -EOPNOTSUPP;
> -	return ext4_xattr_get(inode, EXT4_XATTR_INDEX_USER,
> -			      name, buffer, size);
> +	return ext4_xattr_get(args->inode, EXT4_XATTR_INDEX_USER,
> +			      args->name, args->buffer, args->size);
>  }
>  
>  static int
>  ext4_xattr_user_set(const struct xattr_handler *handler,
> -		    struct dentry *unused, struct inode *inode,
> -		    const char *name, const void *value,
> -		    size_t size, int flags)
> +		    struct xattr_gs_args *args)
>  {
> -	if (!test_opt(inode->i_sb, XATTR_USER))
> +	if (!test_opt(args->inode->i_sb, XATTR_USER))
>  		return -EOPNOTSUPP;
> -	return ext4_xattr_set(inode, EXT4_XATTR_INDEX_USER,
> -			      name, value, size, flags);
> +	return ext4_xattr_set(args->inode, EXT4_XATTR_INDEX_USER,
> +			      args->name, args->value, args->size, args->flags);
>  }
>  
>  const struct xattr_handler ext4_xattr_user_handler = {
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index b32c45621679..4fd47b84616f 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -23,10 +23,9 @@
>  #include "xattr.h"
>  
>  static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
> -		struct dentry *unused, struct inode *inode,
> -		const char *name, void *buffer, size_t size)
> +				  struct xattr_gs_args *args)
>  {
> -	struct f2fs_sb_info *sbi = F2FS_SB(inode->i_sb);
> +	struct f2fs_sb_info *sbi = F2FS_SB(args->inode->i_sb);
>  
>  	switch (handler->flags) {
>  	case F2FS_XATTR_INDEX_USER:
> @@ -39,16 +38,14 @@ static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
>  	default:
>  		return -EINVAL;
>  	}
> -	return f2fs_getxattr(inode, handler->flags, name,
> -			     buffer, size, NULL);
> +	return f2fs_getxattr(args->inode, handler->flags, args->name,
> +			     args->buffer, args->size, NULL);
>  }
>  
>  static int f2fs_xattr_generic_set(const struct xattr_handler *handler,
> -		struct dentry *unused, struct inode *inode,
> -		const char *name, const void *value,
> -		size_t size, int flags)
> +				  struct xattr_gs_args *args)
>  {
> -	struct f2fs_sb_info *sbi = F2FS_SB(inode->i_sb);
> +	struct f2fs_sb_info *sbi = F2FS_SB(args->inode->i_sb);
>  
>  	switch (handler->flags) {
>  	case F2FS_XATTR_INDEX_USER:
> @@ -61,8 +58,8 @@ static int f2fs_xattr_generic_set(const struct xattr_handler *handler,
>  	default:
>  		return -EINVAL;
>  	}
> -	return f2fs_setxattr(inode, handler->flags, name,
> -					value, size, NULL, flags);
> +	return f2fs_setxattr(args->inode, handler->flags, args->name,
> +			     args->value, args->size, NULL, args->flags);
>  }
>  
>  static bool f2fs_xattr_user_list(struct dentry *dentry)
> @@ -78,36 +75,33 @@ static bool f2fs_xattr_trusted_list(struct dentry *dentry)
>  }
>  
>  static int f2fs_xattr_advise_get(const struct xattr_handler *handler,
> -		struct dentry *unused, struct inode *inode,
> -		const char *name, void *buffer, size_t size)
> +				 struct xattr_gs_args *args)
>  {
> -	if (buffer)
> -		*((char *)buffer) = F2FS_I(inode)->i_advise;
> +	if (args->buffer)
> +		*((char *)args->buffer) = F2FS_I(args->inode)->i_advise;
>  	return sizeof(char);
>  }
>  
>  static int f2fs_xattr_advise_set(const struct xattr_handler *handler,
> -		struct dentry *unused, struct inode *inode,
> -		const char *name, const void *value,
> -		size_t size, int flags)
> +				 struct xattr_gs_args *args)
>  {
> -	unsigned char old_advise = F2FS_I(inode)->i_advise;
> +	unsigned char old_advise = F2FS_I(args->inode)->i_advise;
>  	unsigned char new_advise;
>  
> -	if (!inode_owner_or_capable(inode))
> +	if (!inode_owner_or_capable(args->inode))
>  		return -EPERM;
> -	if (value == NULL)
> +	if (args->value == NULL)
>  		return -EINVAL;
>  
> -	new_advise = *(char *)value;
> +	new_advise = *(char *)args->value;
>  	if (new_advise & ~FADVISE_MODIFIABLE_BITS)
>  		return -EINVAL;
>  
>  	new_advise = new_advise & FADVISE_MODIFIABLE_BITS;
>  	new_advise |= old_advise & ~FADVISE_MODIFIABLE_BITS;
>  
> -	F2FS_I(inode)->i_advise = new_advise;
> -	f2fs_mark_inode_dirty_sync(inode, true);
> +	F2FS_I(args->inode)->i_advise = new_advise;
> +	f2fs_mark_inode_dirty_sync(args->inode, true);
>  	return 0;
>  }
>  
> diff --git a/fs/fuse/xattr.c b/fs/fuse/xattr.c
> index 433717640f78..8b8fb719d498 100644
> --- a/fs/fuse/xattr.c
> +++ b/fs/fuse/xattr.c
> @@ -175,21 +175,19 @@ int fuse_removexattr(struct inode *inode, const char *name)
>  }
>  
>  static int fuse_xattr_get(const struct xattr_handler *handler,
> -			 struct dentry *dentry, struct inode *inode,
> -			 const char *name, void *value, size_t size)
> +			  struct xattr_gs_args *args)
>  {
> -	return fuse_getxattr(inode, name, value, size);
> +	return fuse_getxattr(args->inode, args->name, args->buffer, args->size);
>  }
>  
>  static int fuse_xattr_set(const struct xattr_handler *handler,
> -			  struct dentry *dentry, struct inode *inode,
> -			  const char *name, const void *value, size_t size,
> -			  int flags)
> +			  struct xattr_gs_args *args)
>  {
> -	if (!value)
> -		return fuse_removexattr(inode, name);
> +	if (!args->value)
> +		return fuse_removexattr(args->inode, args->name);
>  
> -	return fuse_setxattr(inode, name, value, size, flags);
> +	return fuse_setxattr(args->inode, args->name,
> +			     args->value, args->size, args->flags);
>  }
>  
>  static bool no_xattr_list(struct dentry *dentry)
> @@ -198,16 +196,13 @@ static bool no_xattr_list(struct dentry *dentry)
>  }
>  
>  static int no_xattr_get(const struct xattr_handler *handler,
> -			struct dentry *dentry, struct inode *inode,
> -			const char *name, void *value, size_t size)
> +			struct xattr_gs_args *args)
>  {
>  	return -EOPNOTSUPP;
>  }
>  
>  static int no_xattr_set(const struct xattr_handler *handler,
> -			struct dentry *dentry, struct inode *nodee,
> -			const char *name, const void *value,
> -			size_t size, int flags)
> +			struct xattr_gs_args *args)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
> index bbe593d16bea..bf8e1bd17a29 100644
> --- a/fs/gfs2/xattr.c
> +++ b/fs/gfs2/xattr.c
> @@ -587,10 +587,9 @@ static int __gfs2_xattr_get(struct inode *inode, const char *name,
>  }
>  
>  static int gfs2_xattr_get(const struct xattr_handler *handler,
> -			  struct dentry *unused, struct inode *inode,
> -			  const char *name, void *buffer, size_t size)
> +			  struct xattr_gs_args *args)
>  {
> -	struct gfs2_inode *ip = GFS2_I(inode);
> +	struct gfs2_inode *ip = GFS2_I(args->inode);
>  	struct gfs2_holder gh;
>  	int ret;
>  
> @@ -603,7 +602,8 @@ static int gfs2_xattr_get(const struct xattr_handler *handler,
>  	} else {
>  		gfs2_holder_mark_uninitialized(&gh);
>  	}
> -	ret = __gfs2_xattr_get(inode, name, buffer, size, handler->flags);
> +	ret = __gfs2_xattr_get(args->inode, args->name,
> +			       args->buffer, args->size, handler->flags);
>  	if (gfs2_holder_initialized(&gh))
>  		gfs2_glock_dq_uninit(&gh);
>  	return ret;
> @@ -1214,11 +1214,9 @@ int __gfs2_xattr_set(struct inode *inode, const char *name,
>  }
>  
>  static int gfs2_xattr_set(const struct xattr_handler *handler,
> -			  struct dentry *unused, struct inode *inode,
> -			  const char *name, const void *value,
> -			  size_t size, int flags)
> +			  struct xattr_gs_args *args)
>  {
> -	struct gfs2_inode *ip = GFS2_I(inode);
> +	struct gfs2_inode *ip = GFS2_I(args->inode);
>  	struct gfs2_holder gh;
>  	int ret;
>  
> @@ -1237,7 +1235,9 @@ static int gfs2_xattr_set(const struct xattr_handler *handler,
>  			return -EIO;
>  		gfs2_holder_mark_uninitialized(&gh);
>  	}
> -	ret = __gfs2_xattr_set(inode, name, value, size, flags, handler->flags);
> +	ret = __gfs2_xattr_set(args->inode, args->name,
> +			       args->value, args->size,
> +			       args->flags, handler->flags);
>  	if (gfs2_holder_initialized(&gh))
>  		gfs2_glock_dq_uninit(&gh);
>  	return ret;
> diff --git a/fs/hfs/attr.c b/fs/hfs/attr.c
> index 74fa62643136..b3355368dc58 100644
> --- a/fs/hfs/attr.c
> +++ b/fs/hfs/attr.c
> @@ -114,21 +114,20 @@ static ssize_t __hfs_getxattr(struct inode *inode, enum hfs_xattr_type type,
>  }
>  
>  static int hfs_xattr_get(const struct xattr_handler *handler,
> -			 struct dentry *unused, struct inode *inode,
> -			 const char *name, void *value, size_t size)
> +			 struct xattr_gs_args *args)
>  {
> -	return __hfs_getxattr(inode, handler->flags, value, size);
> +	return __hfs_getxattr(args->inode, handler->flags,
> +			      args->buffer, args->size);
>  }
>  
>  static int hfs_xattr_set(const struct xattr_handler *handler,
> -			 struct dentry *unused, struct inode *inode,
> -			 const char *name, const void *value, size_t size,
> -			 int flags)
> +			 struct xattr_gs_args *args)
>  {
> -	if (!value)
> +	if (!args->value)
>  		return -EOPNOTSUPP;
>  
> -	return __hfs_setxattr(inode, handler->flags, value, size, flags);
> +	return __hfs_setxattr(args->inode, handler->flags,
> +			      args->value, args->size, args->flags);
>  }
>  
>  static const struct xattr_handler hfs_creator_handler = {
> diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
> index bb0b27d88e50..b6cc7f18bce8 100644
> --- a/fs/hfsplus/xattr.c
> +++ b/fs/hfsplus/xattr.c
> @@ -838,14 +838,13 @@ static int hfsplus_removexattr(struct inode *inode, const char *name)
>  }
>  
>  static int hfsplus_osx_getxattr(const struct xattr_handler *handler,
> -				struct dentry *unused, struct inode *inode,
> -				const char *name, void *buffer, size_t size)
> +				struct xattr_gs_args *args)
>  {
>  	/*
>  	 * Don't allow retrieving properly prefixed attributes
>  	 * by prepending them with "osx."
>  	 */
> -	if (is_known_namespace(name))
> +	if (is_known_namespace(args->name))
>  		return -EOPNOTSUPP;
>  
>  	/*
> @@ -854,19 +853,18 @@ static int hfsplus_osx_getxattr(const struct xattr_handler *handler,
>  	 * creates), so we pass the name through unmodified (after
>  	 * ensuring it doesn't conflict with another namespace).
>  	 */
> -	return __hfsplus_getxattr(inode, name, buffer, size);
> +	return __hfsplus_getxattr(args->inode, args->name,
> +				  args->buffer, args->size);
>  }
>  
>  static int hfsplus_osx_setxattr(const struct xattr_handler *handler,
> -				struct dentry *unused, struct inode *inode,
> -				const char *name, const void *buffer,
> -				size_t size, int flags)
> +				struct xattr_gs_args *args)
>  {
>  	/*
>  	 * Don't allow setting properly prefixed attributes
>  	 * by prepending them with "osx."
>  	 */
> -	if (is_known_namespace(name))
> +	if (is_known_namespace(args->name))
>  		return -EOPNOTSUPP;
>  
>  	/*
> @@ -875,7 +873,8 @@ static int hfsplus_osx_setxattr(const struct xattr_handler *handler,
>  	 * creates), so we pass the name through unmodified (after
>  	 * ensuring it doesn't conflict with another namespace).
>  	 */
> -	return __hfsplus_setxattr(inode, name, buffer, size, flags);
> +	return __hfsplus_setxattr(args->inode, args->name,
> +				  args->value, args->size, args->flags);
>  }
>  
>  const struct xattr_handler hfsplus_xattr_osx_handler = {
> diff --git a/fs/hfsplus/xattr_security.c b/fs/hfsplus/xattr_security.c
> index cfbe6a3bfb1e..8a8185eca12e 100644
> --- a/fs/hfsplus/xattr_security.c
> +++ b/fs/hfsplus/xattr_security.c
> @@ -14,20 +14,19 @@
>  #include "xattr.h"
>  
>  static int hfsplus_security_getxattr(const struct xattr_handler *handler,
> -				     struct dentry *unused, struct inode *inode,
> -				     const char *name, void *buffer, size_t size)
> +				     struct xattr_gs_args *args)
>  {
> -	return hfsplus_getxattr(inode, name, buffer, size,
> +	return hfsplus_getxattr(args->inode, args->name,
> +				args->buffer, args->size,
>  				XATTR_SECURITY_PREFIX,
>  				XATTR_SECURITY_PREFIX_LEN);
>  }
>  
>  static int hfsplus_security_setxattr(const struct xattr_handler *handler,
> -				     struct dentry *unused, struct inode *inode,
> -				     const char *name, const void *buffer,
> -				     size_t size, int flags)
> +				     struct xattr_gs_args *args)
>  {
> -	return hfsplus_setxattr(inode, name, buffer, size, flags,
> +	return hfsplus_setxattr(args->inode, args->name,
> +				args->value, args->size, args->flags,
>  				XATTR_SECURITY_PREFIX,
>  				XATTR_SECURITY_PREFIX_LEN);
>  }
> diff --git a/fs/hfsplus/xattr_trusted.c b/fs/hfsplus/xattr_trusted.c
> index fbad91e1dada..a682a2e363e7 100644
> --- a/fs/hfsplus/xattr_trusted.c
> +++ b/fs/hfsplus/xattr_trusted.c
> @@ -13,20 +13,19 @@
>  #include "xattr.h"
>  
>  static int hfsplus_trusted_getxattr(const struct xattr_handler *handler,
> -				    struct dentry *unused, struct inode *inode,
> -				    const char *name, void *buffer, size_t size)
> +				    struct xattr_gs_args *args)
>  {
> -	return hfsplus_getxattr(inode, name, buffer, size,
> +	return hfsplus_getxattr(args->inode, args->name,
> +				args->buffer, args->size,
>  				XATTR_TRUSTED_PREFIX,
>  				XATTR_TRUSTED_PREFIX_LEN);
>  }
>  
>  static int hfsplus_trusted_setxattr(const struct xattr_handler *handler,
> -				    struct dentry *unused, struct inode *inode,
> -				    const char *name, const void *buffer,
> -				    size_t size, int flags)
> +				    struct xattr_gs_args *args)
>  {
> -	return hfsplus_setxattr(inode, name, buffer, size, flags,
> +	return hfsplus_setxattr(args->inode, args->name,
> +				args->buffer, args->size, args->flags,
>  				XATTR_TRUSTED_PREFIX, XATTR_TRUSTED_PREFIX_LEN);
>  }
>  
> diff --git a/fs/hfsplus/xattr_user.c b/fs/hfsplus/xattr_user.c
> index 74d19faf255e..9b58d7ec263d 100644
> --- a/fs/hfsplus/xattr_user.c
> +++ b/fs/hfsplus/xattr_user.c
> @@ -13,20 +13,19 @@
>  #include "xattr.h"
>  
>  static int hfsplus_user_getxattr(const struct xattr_handler *handler,
> -				 struct dentry *unused, struct inode *inode,
> -				 const char *name, void *buffer, size_t size)
> +				 struct xattr_gs_args *args)
>  {
>  
> -	return hfsplus_getxattr(inode, name, buffer, size,
> +	return hfsplus_getxattr(args->inode, args->name,
> +				args->buffer, args->size,
>  				XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN);
>  }
>  
>  static int hfsplus_user_setxattr(const struct xattr_handler *handler,
> -				 struct dentry *unused, struct inode *inode,
> -				 const char *name, const void *buffer,
> -				 size_t size, int flags)
> +				 struct xattr_gs_args *args)
>  {
> -	return hfsplus_setxattr(inode, name, buffer, size, flags,
> +	return hfsplus_setxattr(args->inode, args->name,
> +				args->value, args->size, args->flags,
>  				XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN);
>  }
>  
> diff --git a/fs/jffs2/security.c b/fs/jffs2/security.c
> index c2332e30f218..6aa552db3807 100644
> --- a/fs/jffs2/security.c
> +++ b/fs/jffs2/security.c
> @@ -49,20 +49,18 @@ int jffs2_init_security(struct inode *inode, struct inode *dir,
>  
>  /* ---- XATTR Handler for "security.*" ----------------- */
>  static int jffs2_security_getxattr(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *name, void *buffer, size_t size)
> +				   struct xattr_gs_args *args)
>  {
> -	return do_jffs2_getxattr(inode, JFFS2_XPREFIX_SECURITY,
> -				 name, buffer, size);
> +	return do_jffs2_getxattr(args->inode, JFFS2_XPREFIX_SECURITY,
> +				 args->name, args->buffer, args->size);
>  }
>  
>  static int jffs2_security_setxattr(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *name, const void *buffer,
> -				   size_t size, int flags)
> +				   struct xattr_gs_args *args)
>  {
> -	return do_jffs2_setxattr(inode, JFFS2_XPREFIX_SECURITY,
> -				 name, buffer, size, flags);
> +	return do_jffs2_setxattr(args->inode, JFFS2_XPREFIX_SECURITY,
> +				 args->name, args->value, args->size,
> +				 args->flags);
>  }
>  
>  const struct xattr_handler jffs2_security_xattr_handler = {
> diff --git a/fs/jffs2/xattr_trusted.c b/fs/jffs2/xattr_trusted.c
> index 5d6030826c52..5d235175d6fd 100644
> --- a/fs/jffs2/xattr_trusted.c
> +++ b/fs/jffs2/xattr_trusted.c
> @@ -17,20 +17,18 @@
>  #include "nodelist.h"
>  
>  static int jffs2_trusted_getxattr(const struct xattr_handler *handler,
> -				  struct dentry *unused, struct inode *inode,
> -				  const char *name, void *buffer, size_t size)
> +				  struct xattr_gs_args *args)
>  {
> -	return do_jffs2_getxattr(inode, JFFS2_XPREFIX_TRUSTED,
> -				 name, buffer, size);
> +	return do_jffs2_getxattr(args->inode, JFFS2_XPREFIX_TRUSTED,
> +				 args->name, args->buffer, args->size);
>  }
>  
>  static int jffs2_trusted_setxattr(const struct xattr_handler *handler,
> -				  struct dentry *unused, struct inode *inode,
> -				  const char *name, const void *buffer,
> -				  size_t size, int flags)
> +				  struct xattr_gs_args *args)
>  {
> -	return do_jffs2_setxattr(inode, JFFS2_XPREFIX_TRUSTED,
> -				 name, buffer, size, flags);
> +	return do_jffs2_setxattr(args->inode, JFFS2_XPREFIX_TRUSTED,
> +				 args->name, args->value, args->size,
> +				 args->flags);
>  }
>  
>  static bool jffs2_trusted_listxattr(struct dentry *dentry)
> diff --git a/fs/jffs2/xattr_user.c b/fs/jffs2/xattr_user.c
> index 9d027b4abcf9..a35a0785e72b 100644
> --- a/fs/jffs2/xattr_user.c
> +++ b/fs/jffs2/xattr_user.c
> @@ -17,20 +17,18 @@
>  #include "nodelist.h"
>  
>  static int jffs2_user_getxattr(const struct xattr_handler *handler,
> -			       struct dentry *unused, struct inode *inode,
> -			       const char *name, void *buffer, size_t size)
> +			       struct xattr_gs_args *args)
>  {
> -	return do_jffs2_getxattr(inode, JFFS2_XPREFIX_USER,
> -				 name, buffer, size);
> +	return do_jffs2_getxattr(args->inode, JFFS2_XPREFIX_USER,
> +				 args->name, args->buffer, args->size);
>  }
>  
>  static int jffs2_user_setxattr(const struct xattr_handler *handler,
> -			       struct dentry *unused, struct inode *inode,
> -			       const char *name, const void *buffer,
> -			       size_t size, int flags)
> +			       struct xattr_gs_args *args)
>  {
> -	return do_jffs2_setxattr(inode, JFFS2_XPREFIX_USER,
> -				 name, buffer, size, flags);
> +	return do_jffs2_setxattr(args->inode, JFFS2_XPREFIX_USER,
> +				 args->name, args->value, args->size,
> +				 args->flags);
>  }
>  
>  const struct xattr_handler jffs2_user_xattr_handler = {
> diff --git a/fs/jfs/xattr.c b/fs/jfs/xattr.c
> index db41e7803163..225fc440ff62 100644
> --- a/fs/jfs/xattr.c
> +++ b/fs/jfs/xattr.c
> @@ -924,39 +924,36 @@ static int __jfs_xattr_set(struct inode *inode, const char *name,
>  }
>  
>  static int jfs_xattr_get(const struct xattr_handler *handler,
> -			 struct dentry *unused, struct inode *inode,
> -			 const char *name, void *value, size_t size)
> +			 struct xattr_gs_args *args)
>  {
> -	name = xattr_full_name(handler, name);
> -	return __jfs_getxattr(inode, name, value, size);
> +	return __jfs_getxattr(args->inode, xattr_full_name(handler, args->name),
> +			      args->buffer, args->size);
>  }
>  
>  static int jfs_xattr_set(const struct xattr_handler *handler,
> -			 struct dentry *unused, struct inode *inode,
> -			 const char *name, const void *value,
> -			 size_t size, int flags)
> +			 struct xattr_gs_args *args)
>  {
> -	name = xattr_full_name(handler, name);
> -	return __jfs_xattr_set(inode, name, value, size, flags);
> +	return __jfs_xattr_set(args->inode,
> +			       xattr_full_name(handler, args->name),
> +			       args->value, args->size, args->flags);
>  }
>  
>  static int jfs_xattr_get_os2(const struct xattr_handler *handler,
> -			     struct dentry *unused, struct inode *inode,
> -			     const char *name, void *value, size_t size)
> +			     struct xattr_gs_args *args)
>  {
> -	if (is_known_namespace(name))
> +	if (is_known_namespace(args->name))
>  		return -EOPNOTSUPP;
> -	return __jfs_getxattr(inode, name, value, size);
> +	return __jfs_getxattr(args->inode, args->name,
> +			      args->buffer, args->size);
>  }
>  
>  static int jfs_xattr_set_os2(const struct xattr_handler *handler,
> -			     struct dentry *unused, struct inode *inode,
> -			     const char *name, const void *value,
> -			     size_t size, int flags)
> +			     struct xattr_gs_args *args)
>  {
> -	if (is_known_namespace(name))
> +	if (is_known_namespace(args->name))
>  		return -EOPNOTSUPP;
> -	return __jfs_xattr_set(inode, name, value, size, flags);
> +	return __jfs_xattr_set(args->inode, args->name,
> +			       args->value, args->size, args->flags);
>  }
>  
>  static const struct xattr_handler jfs_user_xattr_handler = {
> diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
> index f3f3984cce80..1ae646a0b20b 100644
> --- a/fs/kernfs/inode.c
> +++ b/fs/kernfs/inode.c
> @@ -288,13 +288,13 @@ int kernfs_iop_permission(struct inode *inode, int mask)
>  }
>  
>  int kernfs_xattr_get(struct kernfs_node *kn, const char *name,
> -		     void *value, size_t size)
> +		     void *buffer, size_t size)
>  {
>  	struct kernfs_iattrs *attrs = kernfs_iattrs_noalloc(kn);
>  	if (!attrs)
>  		return -ENODATA;
>  
> -	return simple_xattr_get(&attrs->xattrs, name, value, size);
> +	return simple_xattr_get(&attrs->xattrs, name, buffer, size);
>  }
>  
>  int kernfs_xattr_set(struct kernfs_node *kn, const char *name,
> @@ -308,24 +308,21 @@ int kernfs_xattr_set(struct kernfs_node *kn, const char *name,
>  }
>  
>  static int kernfs_vfs_xattr_get(const struct xattr_handler *handler,
> -				struct dentry *unused, struct inode *inode,
> -				const char *suffix, void *value, size_t size)
> +				struct xattr_gs_args *args)
>  {
> -	const char *name = xattr_full_name(handler, suffix);
> -	struct kernfs_node *kn = inode->i_private;
> +	struct kernfs_node *kn = args->inode->i_private;
>  
> -	return kernfs_xattr_get(kn, name, value, size);
> +	return kernfs_xattr_get(kn, xattr_full_name(handler, args->name),
> +				args->buffer, args->size);
>  }
>  
>  static int kernfs_vfs_xattr_set(const struct xattr_handler *handler,
> -				struct dentry *unused, struct inode *inode,
> -				const char *suffix, const void *value,
> -				size_t size, int flags)
> +				struct xattr_gs_args *args)
>  {
> -	const char *name = xattr_full_name(handler, suffix);
> -	struct kernfs_node *kn = inode->i_private;
> +	struct kernfs_node *kn = args->inode->i_private;
>  
> -	return kernfs_xattr_set(kn, name, value, size, flags);
> +	return kernfs_xattr_set(kn, xattr_full_name(handler, args->name),
> +				args->value, args->size, args->flags);
>  }
>  
>  static const struct xattr_handler kernfs_trusted_xattr_handler = {
> diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
> index 1406858bae6c..1f0388440ec9 100644
> --- a/fs/nfs/nfs4proc.c
> +++ b/fs/nfs/nfs4proc.c
> @@ -7209,18 +7209,15 @@ nfs4_release_lockowner(struct nfs_server *server, struct nfs4_lock_state *lsp)
>  #define XATTR_NAME_NFSV4_ACL "system.nfs4_acl"
>  
>  static int nfs4_xattr_set_nfs4_acl(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *key, const void *buf,
> -				   size_t buflen, int flags)
> +				   struct xattr_gs_args *args)
>  {
> -	return nfs4_proc_set_acl(inode, buf, buflen);
> +	return nfs4_proc_set_acl(args->inode, args->value, args->size);
>  }
>  
>  static int nfs4_xattr_get_nfs4_acl(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *key, void *buf, size_t buflen)
> +				   struct xattr_gs_args *args)
>  {
> -	return nfs4_proc_get_acl(inode, buf, buflen);
> +	return nfs4_proc_get_acl(args->inode, args->buffer, args->size);
>  }
>  
>  static bool nfs4_xattr_list_nfs4_acl(struct dentry *dentry)
> @@ -7231,22 +7228,21 @@ static bool nfs4_xattr_list_nfs4_acl(struct dentry *dentry)
>  #ifdef CONFIG_NFS_V4_SECURITY_LABEL
>  
>  static int nfs4_xattr_set_nfs4_label(const struct xattr_handler *handler,
> -				     struct dentry *unused, struct inode *inode,
> -				     const char *key, const void *buf,
> -				     size_t buflen, int flags)
> +				     struct xattr_gs_args *args)
>  {
> -	if (security_ismaclabel(key))
> -		return nfs4_set_security_label(inode, buf, buflen);
> +	if (security_ismaclabel(args->name))
> +		return nfs4_set_security_label(args->inode,
> +					       args->value, args->size);
>  
>  	return -EOPNOTSUPP;
>  }
>  
>  static int nfs4_xattr_get_nfs4_label(const struct xattr_handler *handler,
> -				     struct dentry *unused, struct inode *inode,
> -				     const char *key, void *buf, size_t buflen)
> +				     struct xattr_gs_args *args)
>  {
> -	if (security_ismaclabel(key))
> -		return nfs4_get_security_label(inode, buf, buflen);
> +	if (security_ismaclabel(args->name))
> +		return nfs4_get_security_label(args->inode,
> +					       args->buffer, args->size);
>  	return -EOPNOTSUPP;
>  }
>  
> diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
> index 90c830e3758e..25ac1557e303 100644
> --- a/fs/ocfs2/xattr.c
> +++ b/fs/ocfs2/xattr.c
> @@ -7241,20 +7241,18 @@ int ocfs2_init_security_and_acl(struct inode *dir,
>   * 'security' attributes support
>   */
>  static int ocfs2_xattr_security_get(const struct xattr_handler *handler,
> -				    struct dentry *unused, struct inode *inode,
> -				    const char *name, void *buffer, size_t size)
> +				    struct xattr_gs_args *args)
>  {
> -	return ocfs2_xattr_get(inode, OCFS2_XATTR_INDEX_SECURITY,
> -			       name, buffer, size);
> +	return ocfs2_xattr_get(args->inode, OCFS2_XATTR_INDEX_SECURITY,
> +			       args->name, args->buffer, args->size);
>  }
>  
>  static int ocfs2_xattr_security_set(const struct xattr_handler *handler,
> -				    struct dentry *unused, struct inode *inode,
> -				    const char *name, const void *value,
> -				    size_t size, int flags)
> +				    struct xattr_gs_args *args)
>  {
> -	return ocfs2_xattr_set(inode, OCFS2_XATTR_INDEX_SECURITY,
> -			       name, value, size, flags);
> +	return ocfs2_xattr_set(args->inode, OCFS2_XATTR_INDEX_SECURITY,
> +			       args->name, args->value, args->size,
> +			       args->flags);
>  }
>  
>  static int ocfs2_initxattrs(struct inode *inode, const struct xattr *xattr_array,
> @@ -7313,20 +7311,18 @@ const struct xattr_handler ocfs2_xattr_security_handler = {
>   * 'trusted' attributes support
>   */
>  static int ocfs2_xattr_trusted_get(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *name, void *buffer, size_t size)
> +				   struct xattr_gs_args *args)
>  {
> -	return ocfs2_xattr_get(inode, OCFS2_XATTR_INDEX_TRUSTED,
> -			       name, buffer, size);
> +	return ocfs2_xattr_get(args->inode, OCFS2_XATTR_INDEX_TRUSTED,
> +			       args->name, args->buffer, args->size);
>  }
>  
>  static int ocfs2_xattr_trusted_set(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *name, const void *value,
> -				   size_t size, int flags)
> +				   struct xattr_gs_args *args)
>  {
> -	return ocfs2_xattr_set(inode, OCFS2_XATTR_INDEX_TRUSTED,
> -			       name, value, size, flags);
> +	return ocfs2_xattr_set(args->inode, OCFS2_XATTR_INDEX_TRUSTED,
> +			       args->name, args->value, args->size,
> +			       args->flags);
>  }
>  
>  const struct xattr_handler ocfs2_xattr_trusted_handler = {
> @@ -7339,29 +7335,27 @@ const struct xattr_handler ocfs2_xattr_trusted_handler = {
>   * 'user' attributes support
>   */
>  static int ocfs2_xattr_user_get(const struct xattr_handler *handler,
> -				struct dentry *unused, struct inode *inode,
> -				const char *name, void *buffer, size_t size)
> +				struct xattr_gs_args *args)
>  {
> -	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
> +	struct ocfs2_super *osb = OCFS2_SB(args->inode->i_sb);
>  
>  	if (osb->s_mount_opt & OCFS2_MOUNT_NOUSERXATTR)
>  		return -EOPNOTSUPP;
> -	return ocfs2_xattr_get(inode, OCFS2_XATTR_INDEX_USER, name,
> -			       buffer, size);
> +	return ocfs2_xattr_get(args->inode, OCFS2_XATTR_INDEX_USER, args->name,
> +			       args->buffer, args->size);
>  }
>  
>  static int ocfs2_xattr_user_set(const struct xattr_handler *handler,
> -				struct dentry *unused, struct inode *inode,
> -				const char *name, const void *value,
> -				size_t size, int flags)
> +				struct xattr_gs_args *args)
>  {
> -	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
> +	struct ocfs2_super *osb = OCFS2_SB(args->inode->i_sb);
>  
>  	if (osb->s_mount_opt & OCFS2_MOUNT_NOUSERXATTR)
>  		return -EOPNOTSUPP;
>  
> -	return ocfs2_xattr_set(inode, OCFS2_XATTR_INDEX_USER,
> -			       name, value, size, flags);
> +	return ocfs2_xattr_set(args->inode, OCFS2_XATTR_INDEX_USER,
> +			       args->name, args->value, args->size,
> +			       args->flags);
>  }
>  
>  const struct xattr_handler ocfs2_xattr_user_handler = {
> diff --git a/fs/orangefs/xattr.c b/fs/orangefs/xattr.c
> index bdc285aea360..d222922af141 100644
> --- a/fs/orangefs/xattr.c
> +++ b/fs/orangefs/xattr.c
> @@ -526,24 +526,17 @@ ssize_t orangefs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>  }
>  
>  static int orangefs_xattr_set_default(const struct xattr_handler *handler,
> -				      struct dentry *unused,
> -				      struct inode *inode,
> -				      const char *name,
> -				      const void *buffer,
> -				      size_t size,
> -				      int flags)
> +				      struct xattr_gs_args *args)
>  {
> -	return orangefs_inode_setxattr(inode, name, buffer, size, flags);
> +	return orangefs_inode_setxattr(args->inode, args->name,
> +				       args->value, args->size, args->flags);
>  }
>  
>  static int orangefs_xattr_get_default(const struct xattr_handler *handler,
> -				      struct dentry *unused,
> -				      struct inode *inode,
> -				      const char *name,
> -				      void *buffer,
> -				      size_t size)
> +				      struct xattr_gs_args *args)
>  {
> -	return orangefs_inode_getxattr(inode, name, buffer, size);
> +	return orangefs_inode_getxattr(args->inode, args->name,
> +				       args->buffer, args->size);
>  
>  }
>  
> diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
> index 7663aeb85fa3..a14d450b8564 100644
> --- a/fs/overlayfs/inode.c
> +++ b/fs/overlayfs/inode.c
> @@ -318,60 +318,61 @@ bool ovl_is_private_xattr(const char *name)
>  		       sizeof(OVL_XATTR_PREFIX) - 1) == 0;
>  }
>  
> -int ovl_xattr_set(struct dentry *dentry, struct inode *inode, const char *name,
> -		  const void *value, size_t size, int flags)
> +int ovl_xattr_set(struct xattr_gs_args *args)
>  {
>  	int err;
> -	struct dentry *upperdentry = ovl_i_dentry_upper(inode);
> -	struct dentry *realdentry = upperdentry ?: ovl_dentry_lower(dentry);
> +	struct dentry *upperdentry = ovl_i_dentry_upper(args->inode);
> +	struct dentry *realdentry =
> +		upperdentry ?: ovl_dentry_lower(args->dentry);
>  	const struct cred *old_cred;
>  
> -	err = ovl_want_write(dentry);
> +	err = ovl_want_write(args->dentry);
>  	if (err)
>  		goto out;
>  
> -	if (!value && !upperdentry) {
> -		err = vfs_getxattr(realdentry, name, NULL, 0);
> +	if (!args->value && !upperdentry) {
> +		err = vfs_getxattr(realdentry, args->name, NULL, 0);
>  		if (err < 0)
>  			goto out_drop_write;
>  	}
>  
>  	if (!upperdentry) {
> -		err = ovl_copy_up(dentry);
> +		err = ovl_copy_up(args->dentry);
>  		if (err)
>  			goto out_drop_write;
>  
> -		realdentry = ovl_dentry_upper(dentry);
> +		realdentry = ovl_dentry_upper(args->dentry);
>  	}
>  
> -	old_cred = ovl_override_creds(dentry->d_sb);
> -	if (value)
> -		err = vfs_setxattr(realdentry, name, value, size, flags);
> +	old_cred = ovl_override_creds(args->dentry->d_sb);
> +	if (args->value)
> +		err = vfs_setxattr(realdentry, args->name,
> +				   args->value, args->size, args->flags);
>  	else {
> -		WARN_ON(flags != XATTR_REPLACE);
> -		err = vfs_removexattr(realdentry, name);
> +		WARN_ON(args->flags != XATTR_REPLACE);
> +		err = vfs_removexattr(realdentry, args->name);
>  	}
>  	revert_creds(old_cred);
>  
>  	/* copy c/mtime */
> -	ovl_copyattr(d_inode(realdentry), inode);
> +	ovl_copyattr(d_inode(realdentry), args->inode);
>  
>  out_drop_write:
> -	ovl_drop_write(dentry);
> +	ovl_drop_write(args->dentry);
>  out:
>  	return err;
>  }
>  
> -int ovl_xattr_get(struct dentry *dentry, struct inode *inode, const char *name,
> -		  void *value, size_t size)
> +int ovl_xattr_get(struct xattr_gs_args *args)
>  {
>  	ssize_t res;
>  	const struct cred *old_cred;
>  	struct dentry *realdentry =
> -		ovl_i_dentry_upper(inode) ?: ovl_dentry_lower(dentry);
> +		ovl_i_dentry_upper(args->inode) ?:
> +		ovl_dentry_lower(args->dentry);
>  
> -	old_cred = ovl_override_creds(dentry->d_sb);
> -	res = vfs_getxattr(realdentry, name, value, size);
> +	old_cred = ovl_override_creds(args->dentry->d_sb);
> +	res = vfs_getxattr(realdentry, args->name, args->buffer, args->size);
>  	revert_creds(old_cred);
>  	return res;
>  }
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index 6934bcf030f0..c6a8ec049099 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -353,10 +353,8 @@ int ovl_setattr(struct dentry *dentry, struct iattr *attr);
>  int ovl_getattr(const struct path *path, struct kstat *stat,
>  		u32 request_mask, unsigned int flags);
>  int ovl_permission(struct inode *inode, int mask);
> -int ovl_xattr_set(struct dentry *dentry, struct inode *inode, const char *name,
> -		  const void *value, size_t size, int flags);
> -int ovl_xattr_get(struct dentry *dentry, struct inode *inode, const char *name,
> -		  void *value, size_t size);
> +int ovl_xattr_set(struct xattr_gs_args *args);
> +int ovl_xattr_get(struct xattr_gs_args *args);
>  ssize_t ovl_listxattr(struct dentry *dentry, char *list, size_t size);
>  struct posix_acl *ovl_get_acl(struct inode *inode, int type);
>  int ovl_update_time(struct inode *inode, struct timespec64 *ts, int flags);
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index b368e2e102fa..e41359ba9159 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -853,26 +853,24 @@ static unsigned int ovl_split_lowerdirs(char *str)
>  
>  static int __maybe_unused
>  ovl_posix_acl_xattr_get(const struct xattr_handler *handler,
> -			struct dentry *dentry, struct inode *inode,
> -			const char *name, void *buffer, size_t size)
> +			struct xattr_gs_args *args)
>  {
> -	return ovl_xattr_get(dentry, inode, handler->name, buffer, size);
> +	return ovl_xattr_get(args);
>  }
>  
>  static int __maybe_unused
>  ovl_posix_acl_xattr_set(const struct xattr_handler *handler,
> -			struct dentry *dentry, struct inode *inode,
> -			const char *name, const void *value,
> -			size_t size, int flags)
> +			struct xattr_gs_args *args)
>  {
> -	struct dentry *workdir = ovl_workdir(dentry);
> -	struct inode *realinode = ovl_inode_real(inode);
> +	struct dentry *workdir = ovl_workdir(args->dentry);
> +	struct inode *realinode = ovl_inode_real(args->inode);
>  	struct posix_acl *acl = NULL;
>  	int err;
>  
>  	/* Check that everything is OK before copy-up */
> -	if (value) {
> -		acl = posix_acl_from_xattr(&init_user_ns, value, size);
> +	if (args->value) {
> +		acl = posix_acl_from_xattr(&init_user_ns,
> +					   args->value, args->size);
>  		if (IS_ERR(acl))
>  			return PTR_ERR(acl);
>  	}
> @@ -881,12 +879,13 @@ ovl_posix_acl_xattr_set(const struct xattr_handler *handler,
>  		goto out_acl_release;
>  	if (!realinode->i_op->set_acl)
>  		goto out_acl_release;
> -	if (handler->flags == ACL_TYPE_DEFAULT && !S_ISDIR(inode->i_mode)) {
> +	if (handler->flags == ACL_TYPE_DEFAULT &&
> +	    !S_ISDIR(args->inode->i_mode)) {
>  		err = acl ? -EACCES : 0;
>  		goto out_acl_release;
>  	}
>  	err = -EPERM;
> -	if (!inode_owner_or_capable(inode))
> +	if (!inode_owner_or_capable(args->inode))
>  		goto out_acl_release;
>  
>  	posix_acl_release(acl);
> @@ -895,20 +894,20 @@ ovl_posix_acl_xattr_set(const struct xattr_handler *handler,
>  	 * Check if sgid bit needs to be cleared (actual setacl operation will
>  	 * be done with mounter's capabilities and so that won't do it for us).
>  	 */
> -	if (unlikely(inode->i_mode & S_ISGID) &&
> +	if (unlikely(args->inode->i_mode & S_ISGID) &&
>  	    handler->flags == ACL_TYPE_ACCESS &&
> -	    !in_group_p(inode->i_gid) &&
> -	    !capable_wrt_inode_uidgid(inode, CAP_FSETID)) {
> +	    !in_group_p(args->inode->i_gid) &&
> +	    !capable_wrt_inode_uidgid(args->inode, CAP_FSETID)) {
>  		struct iattr iattr = { .ia_valid = ATTR_KILL_SGID };
>  
> -		err = ovl_setattr(dentry, &iattr);
> +		err = ovl_setattr(args->dentry, &iattr);
>  		if (err)
>  			return err;
>  	}
>  
> -	err = ovl_xattr_set(dentry, inode, handler->name, value, size, flags);
> +	err = ovl_xattr_set(args);
>  	if (!err)
> -		ovl_copyattr(ovl_inode_real(inode), inode);
> +		ovl_copyattr(ovl_inode_real(args->inode), args->inode);
>  
>  	return err;
>  
> @@ -918,33 +917,27 @@ ovl_posix_acl_xattr_set(const struct xattr_handler *handler,
>  }
>  
>  static int ovl_own_xattr_get(const struct xattr_handler *handler,
> -			     struct dentry *dentry, struct inode *inode,
> -			     const char *name, void *buffer, size_t size)
> +			     struct xattr_gs_args *args)
>  {
>  	return -EOPNOTSUPP;
>  }
>  
>  static int ovl_own_xattr_set(const struct xattr_handler *handler,
> -			     struct dentry *dentry, struct inode *inode,
> -			     const char *name, const void *value,
> -			     size_t size, int flags)
> +			     struct xattr_gs_args *args)
>  {
>  	return -EOPNOTSUPP;
>  }
>  
>  static int ovl_other_xattr_get(const struct xattr_handler *handler,
> -			       struct dentry *dentry, struct inode *inode,
> -			       const char *name, void *buffer, size_t size)
> +			       struct xattr_gs_args *args)
>  {
> -	return ovl_xattr_get(dentry, inode, name, buffer, size);
> +	return ovl_xattr_get(args);
>  }
>  
>  static int ovl_other_xattr_set(const struct xattr_handler *handler,
> -			       struct dentry *dentry, struct inode *inode,
> -			       const char *name, const void *value,
> -			       size_t size, int flags)
> +			       struct xattr_gs_args *args)
>  {
> -	return ovl_xattr_set(dentry, inode, name, value, size, flags);
> +	return ovl_xattr_set(args);
>  }
>  
>  static const struct xattr_handler __maybe_unused
> diff --git a/fs/posix_acl.c b/fs/posix_acl.c
> index 84ad1c90d535..8cc7310386fe 100644
> --- a/fs/posix_acl.c
> +++ b/fs/posix_acl.c
> @@ -831,24 +831,24 @@ EXPORT_SYMBOL (posix_acl_to_xattr);
>  
>  static int
>  posix_acl_xattr_get(const struct xattr_handler *handler,
> -		    struct dentry *unused, struct inode *inode,
> -		    const char *name, void *value, size_t size)
> +		    struct xattr_gs_args *args)
>  {
>  	struct posix_acl *acl;
>  	int error;
>  
> -	if (!IS_POSIXACL(inode))
> +	if (!IS_POSIXACL(args->inode))
>  		return -EOPNOTSUPP;
> -	if (S_ISLNK(inode->i_mode))
> +	if (S_ISLNK(args->inode->i_mode))
>  		return -EOPNOTSUPP;
>  
> -	acl = get_acl(inode, handler->flags);
> +	acl = get_acl(args->inode, handler->flags);
>  	if (IS_ERR(acl))
>  		return PTR_ERR(acl);
>  	if (acl == NULL)
>  		return -ENODATA;
>  
> -	error = posix_acl_to_xattr(&init_user_ns, acl, value, size);
> +	error = posix_acl_to_xattr(&init_user_ns, acl,
> +				   args->buffer, args->size);
>  	posix_acl_release(acl);
>  
>  	return error;
> @@ -878,19 +878,18 @@ EXPORT_SYMBOL(set_posix_acl);
>  
>  static int
>  posix_acl_xattr_set(const struct xattr_handler *handler,
> -		    struct dentry *unused, struct inode *inode,
> -		    const char *name, const void *value,
> -		    size_t size, int flags)
> +		    struct xattr_gs_args *args)
>  {
>  	struct posix_acl *acl = NULL;
>  	int ret;
>  
> -	if (value) {
> -		acl = posix_acl_from_xattr(&init_user_ns, value, size);
> +	if (args->value) {
> +		acl = posix_acl_from_xattr(&init_user_ns,
> +					   args->value, args->size);
>  		if (IS_ERR(acl))
>  			return PTR_ERR(acl);
>  	}
> -	ret = set_posix_acl(inode, handler->flags, acl);
> +	ret = set_posix_acl(args->inode, handler->flags, acl);
>  	posix_acl_release(acl);
>  	return ret;
>  }
> diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> index b5b26d8a192c..b949a55b95bd 100644
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -765,7 +765,7 @@ reiserfs_xattr_get(struct inode *inode, const char *name, void *buffer,
>  /* This is the implementation for the xattr plugin infrastructure */
>  static inline const struct xattr_handler *
>  find_xattr_handler_prefix(const struct xattr_handler **handlers,
> -			   const char *name)
> +			  const char *name)
>  {
>  	const struct xattr_handler *xah;
>  
> diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
> index 20be9a0e5870..6d436ef207d1 100644
> --- a/fs/reiserfs/xattr_security.c
> +++ b/fs/reiserfs/xattr_security.c
> @@ -10,27 +10,25 @@
>  #include <linux/uaccess.h>
>  
>  static int
> -security_get(const struct xattr_handler *handler, struct dentry *unused,
> -	     struct inode *inode, const char *name, void *buffer, size_t size)
> +security_get(const struct xattr_handler *handler, struct xattr_gs_args *args)
>  {
> -	if (IS_PRIVATE(inode))
> +	if (IS_PRIVATE(args->inode))
>  		return -EPERM;
>  
> -	return reiserfs_xattr_get(inode, xattr_full_name(handler, name),
> -				  buffer, size);
> +	return reiserfs_xattr_get(args->inode,
> +				  xattr_full_name(handler, args->name),
> +				  args->buffer, args->size);
>  }
>  
>  static int
> -security_set(const struct xattr_handler *handler, struct dentry *unused,
> -	     struct inode *inode, const char *name, const void *buffer,
> -	     size_t size, int flags)
> +security_set(const struct xattr_handler *handler, struct xattr_gs_args *args)
>  {
> -	if (IS_PRIVATE(inode))
> +	if (IS_PRIVATE(args->inode))
>  		return -EPERM;
>  
> -	return reiserfs_xattr_set(inode,
> -				  xattr_full_name(handler, name),
> -				  buffer, size, flags);
> +	return reiserfs_xattr_set(args->inode,
> +				  xattr_full_name(handler, args->name),
> +				  args->value, args->size, args->flags);
>  }
>  
>  static bool security_list(struct dentry *dentry)
> diff --git a/fs/reiserfs/xattr_trusted.c b/fs/reiserfs/xattr_trusted.c
> index 5ed48da3d02b..46dfc6e2e150 100644
> --- a/fs/reiserfs/xattr_trusted.c
> +++ b/fs/reiserfs/xattr_trusted.c
> @@ -9,27 +9,25 @@
>  #include <linux/uaccess.h>
>  
>  static int
> -trusted_get(const struct xattr_handler *handler, struct dentry *unused,
> -	    struct inode *inode, const char *name, void *buffer, size_t size)
> +trusted_get(const struct xattr_handler *handler, struct xattr_gs_args *args)
>  {
> -	if (!capable(CAP_SYS_ADMIN) || IS_PRIVATE(inode))
> +	if (!capable(CAP_SYS_ADMIN) || IS_PRIVATE(args->inode))
>  		return -EPERM;
>  
> -	return reiserfs_xattr_get(inode, xattr_full_name(handler, name),
> -				  buffer, size);
> +	return reiserfs_xattr_get(args->inode,
> +				  xattr_full_name(handler, args->name),
> +				  args->buffer, args->size);
>  }
>  
>  static int
> -trusted_set(const struct xattr_handler *handler, struct dentry *unused,
> -	    struct inode *inode, const char *name, const void *buffer,
> -	    size_t size, int flags)
> +trusted_set(const struct xattr_handler *handler, struct xattr_gs_args *args)
>  {
> -	if (!capable(CAP_SYS_ADMIN) || IS_PRIVATE(inode))
> +	if (!capable(CAP_SYS_ADMIN) || IS_PRIVATE(args->inode))
>  		return -EPERM;
>  
> -	return reiserfs_xattr_set(inode,
> -				  xattr_full_name(handler, name),
> -				  buffer, size, flags);
> +	return reiserfs_xattr_set(args->inode,
> +				  xattr_full_name(handler, args->name),
> +				  args->value, args->size, args->flags);
>  }
>  
>  static bool trusted_list(struct dentry *dentry)
> diff --git a/fs/reiserfs/xattr_user.c b/fs/reiserfs/xattr_user.c
> index a573ca45bacc..4a0bafe62d05 100644
> --- a/fs/reiserfs/xattr_user.c
> +++ b/fs/reiserfs/xattr_user.c
> @@ -8,25 +8,23 @@
>  #include <linux/uaccess.h>
>  
>  static int
> -user_get(const struct xattr_handler *handler, struct dentry *unused,
> -	 struct inode *inode, const char *name, void *buffer, size_t size)
> +user_get(const struct xattr_handler *handler, struct xattr_gs_args *args)
>  {
> -	if (!reiserfs_xattrs_user(inode->i_sb))
> +	if (!reiserfs_xattrs_user(args->inode->i_sb))
>  		return -EOPNOTSUPP;
> -	return reiserfs_xattr_get(inode, xattr_full_name(handler, name),
> -				  buffer, size);
> +	return reiserfs_xattr_get(args->inode,
> +				  xattr_full_name(handler, args->name),
> +				  args->buffer, args->size);
>  }
>  
>  static int
> -user_set(const struct xattr_handler *handler, struct dentry *unused,
> -	 struct inode *inode, const char *name, const void *buffer,
> -	 size_t size, int flags)
> +user_set(const struct xattr_handler *handler, struct xattr_gs_args *args)
>  {
> -	if (!reiserfs_xattrs_user(inode->i_sb))
> +	if (!reiserfs_xattrs_user(args->inode->i_sb))
>  		return -EOPNOTSUPP;
> -	return reiserfs_xattr_set(inode,
> -				  xattr_full_name(handler, name),
> -				  buffer, size, flags);
> +	return reiserfs_xattr_set(args->inode,
> +				  xattr_full_name(handler, args->name),
> +				  args->value, args->size, args->flags);
>  }
>  
>  static bool user_list(struct dentry *dentry)
> diff --git a/fs/squashfs/xattr.c b/fs/squashfs/xattr.c
> index e1e3f3dd5a06..c6403f187ced 100644
> --- a/fs/squashfs/xattr.c
> +++ b/fs/squashfs/xattr.c
> @@ -199,15 +199,11 @@ static int squashfs_xattr_get(struct inode *inode, int name_index,
>  	return err;
>  }
>  
> -
>  static int squashfs_xattr_handler_get(const struct xattr_handler *handler,
> -				      struct dentry *unused,
> -				      struct inode *inode,
> -				      const char *name,
> -				      void *buffer, size_t size)
> +				      struct xattr_gs_args *args)
>  {
> -	return squashfs_xattr_get(inode, handler->flags, name,
> -		buffer, size);
> +	return squashfs_xattr_get(args->inode, handler->flags, args->name,
> +				  args->buffer, args->size);
>  }
>  
>  /*
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index 9aefbb60074f..aec02d94f2d6 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -668,30 +668,29 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
>  #endif
>  
>  static int xattr_get(const struct xattr_handler *handler,
> -			   struct dentry *dentry, struct inode *inode,
> -			   const char *name, void *buffer, size_t size)
> +		     struct xattr_gs_args *args)
>  {
> -	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
> -		inode->i_ino, dentry, size);
> +	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", args->name,
> +		args->inode->i_ino, args->dentry, args->size);
>  
> -	name = xattr_full_name(handler, name);
> -	return ubifs_xattr_get(inode, name, buffer, size);
> +	return ubifs_xattr_get(args->inode,
> +			       xattr_full_name(handler, args->name),
> +			       args->buffer, args->size);
>  }
>  
>  static int xattr_set(const struct xattr_handler *handler,
> -			   struct dentry *dentry, struct inode *inode,
> -			   const char *name, const void *value,
> -			   size_t size, int flags)
> +		     struct xattr_gs_args *args)
>  {
>  	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
> -		name, inode->i_ino, dentry, size);
> -
> -	name = xattr_full_name(handler, name);
> -
> -	if (value)
> -		return ubifs_xattr_set(inode, name, value, size, flags, true);
> -	else
> -		return ubifs_xattr_remove(inode, name);
> +		args->name, args->inode->i_ino, args->dentry, args->size);
> +
> +	if (args->value)
> +		return ubifs_xattr_set(args->inode,
> +				       xattr_full_name(handler, args->name),
> +				       args->value, args->size,
> +				       args->flags, true);
> +	return ubifs_xattr_remove(args->inode,
> +				  xattr_full_name(handler, args->name));
>  }
>  
>  static const struct xattr_handler ubifs_user_xattr_handler = {
> diff --git a/fs/xattr.c b/fs/xattr.c
> index 90dd78f0eb27..dceb5afe79be 100644
> --- a/fs/xattr.c
> +++ b/fs/xattr.c
> @@ -135,19 +135,18 @@ xattr_permission(struct inode *inode, const char *name, int mask)
>  }
>  
>  int
> -__vfs_setxattr(struct dentry *dentry, struct inode *inode, const char *name,
> -	       const void *value, size_t size, int flags)
> +__vfs_setxattr(struct xattr_gs_args *args)
>  {
>  	const struct xattr_handler *handler;
>  
> -	handler = xattr_resolve_name(inode, &name);
> +	handler = xattr_resolve_name(args->inode, &args->name);
>  	if (IS_ERR(handler))
>  		return PTR_ERR(handler);
>  	if (!handler->set)
>  		return -EOPNOTSUPP;
> -	if (size == 0)
> -		value = "";  /* empty EA, do not remove */
> -	return handler->set(handler, dentry, inode, name, value, size, flags);
> +	if (args->size == 0)
> +		args->value = "";  /* empty EA, do not remove */
> +	return handler->set(handler, args);
>  }
>  EXPORT_SYMBOL(__vfs_setxattr);
>  
> @@ -178,7 +177,16 @@ int __vfs_setxattr_noperm(struct dentry *dentry, const char *name,
>  	if (issec)
>  		inode->i_flags &= ~S_NOSEC;
>  	if (inode->i_opflags & IOP_XATTR) {
> -		error = __vfs_setxattr(dentry, inode, name, value, size, flags);
> +		struct xattr_gs_args args = {
> +			.dentry = dentry,
> +			.inode = inode,
> +			.name = name,
> +			.value = value,
> +			.size = size,
> +			.flags = flags,
> +		};
> +
> +		error = __vfs_setxattr(&args);
>  		if (!error) {
>  			fsnotify_xattr(dentry);
>  			security_inode_post_setxattr(dentry, name, value,
> @@ -268,68 +276,61 @@ vfs_getxattr_alloc(struct dentry *dentry, const char *name, char **xattr_value,
>  		   size_t xattr_size, gfp_t flags)
>  {
>  	const struct xattr_handler *handler;
> -	struct inode *inode = dentry->d_inode;
> -	char *value = *xattr_value;
> +	struct xattr_gs_args args;
>  	int error;
>  
> -	error = xattr_permission(inode, name, MAY_READ);
> +	error = xattr_permission(dentry->d_inode, name, MAY_READ);
>  	if (error)
>  		return error;
>  
> -	handler = xattr_resolve_name(inode, &name);
> +	handler = xattr_resolve_name(dentry->d_inode, &name);
>  	if (IS_ERR(handler))
>  		return PTR_ERR(handler);
>  	if (!handler->get)
>  		return -EOPNOTSUPP;
> -	error = handler->get(handler, dentry, inode, name, NULL, 0);
> +	memset(&args, 0, sizeof(args));
> +	args.inode = dentry->d_inode;
> +	args.dentry = dentry;
> +	args.name = name;
> +	error = handler->get(handler, &args);
>  	if (error < 0)
>  		return error;
>  
> -	if (!value || (error > xattr_size)) {
> -		value = krealloc(*xattr_value, error + 1, flags);
> -		if (!value)
> +	args.buffer = *xattr_value;
> +	if (!*xattr_value || (error > xattr_size)) {
> +		args.buffer = krealloc(*xattr_value, error + 1, flags);
> +		if (!args.buffer)
>  			return -ENOMEM;
> -		memset(value, 0, error + 1);
> +		memset(args.buffer, 0, error + 1);
>  	}
>  
> -	error = handler->get(handler, dentry, inode, name, value, error);
> -	*xattr_value = value;
> +	args.size = error;
> +	error = handler->get(handler, &args);
> +	*xattr_value = args.buffer;
>  	return error;
>  }
>  
>  ssize_t
> -__vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *name,
> -	       void *value, size_t size)
> +__vfs_getxattr(struct xattr_gs_args *args)
>  {
>  	const struct xattr_handler *handler;
> -
> -	handler = xattr_resolve_name(inode, &name);
> -	if (IS_ERR(handler))
> -		return PTR_ERR(handler);
> -	if (!handler->get)
> -		return -EOPNOTSUPP;
> -	return handler->get(handler, dentry, inode, name, value, size);
> -}
> -EXPORT_SYMBOL(__vfs_getxattr);
> -
> -ssize_t
> -vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
> -{
> -	struct inode *inode = dentry->d_inode;
>  	int error;
>  
> -	error = xattr_permission(inode, name, MAY_READ);
> +	if (args->flags & XATTR_NOSECURITY)
> +		goto nolsm;
> +	error = xattr_permission(args->inode, args->name, MAY_READ);
>  	if (error)
>  		return error;
>  
> -	error = security_inode_getxattr(dentry, name);
> +	error = security_inode_getxattr(args->dentry, args->name);
>  	if (error)
>  		return error;
>  
> -	if (!strncmp(name, XATTR_SECURITY_PREFIX,
> +	if (!strncmp(args->name, XATTR_SECURITY_PREFIX,
>  				XATTR_SECURITY_PREFIX_LEN)) {
> -		const char *suffix = name + XATTR_SECURITY_PREFIX_LEN;
> -		int ret = xattr_getsecurity(inode, suffix, value, size);
> +		const char *suffix = args->name + XATTR_SECURITY_PREFIX_LEN;
> +		int ret = xattr_getsecurity(args->inode, suffix,
> +					    args->buffer, args->size);
>  		/*
>  		 * Only overwrite the return value if a security module
>  		 * is actually active.
> @@ -339,7 +340,27 @@ vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
>  		return ret;
>  	}
>  nolsm:
> -	return __vfs_getxattr(dentry, inode, name, value, size);
> +	handler = xattr_resolve_name(args->inode, &args->name);
> +	if (IS_ERR(handler))
> +		return PTR_ERR(handler);
> +	if (!handler->get)
> +		return -EOPNOTSUPP;
> +	return handler->get(handler, args);
> +}
> +EXPORT_SYMBOL(__vfs_getxattr);
> +
> +ssize_t
> +vfs_getxattr(struct dentry *dentry, const char *name, void *buffer, size_t size)
> +{
> +	struct xattr_gs_args args = {
> +		.dentry = dentry,
> +		.inode = dentry->d_inode,
> +		.name = name,
> +		.buffer = buffer,
> +		.size = size,
> +	};
> +
> +	return __vfs_getxattr(&args);
>  }
>  EXPORT_SYMBOL_GPL(vfs_getxattr);
>  
> @@ -366,15 +387,20 @@ EXPORT_SYMBOL_GPL(vfs_listxattr);
>  int
>  __vfs_removexattr(struct dentry *dentry, const char *name)
>  {
> -	struct inode *inode = d_inode(dentry);
>  	const struct xattr_handler *handler;
> +	struct xattr_gs_args args;
>  
> -	handler = xattr_resolve_name(inode, &name);
> +	handler = xattr_resolve_name(d_inode(dentry), &name);
>  	if (IS_ERR(handler))
>  		return PTR_ERR(handler);
>  	if (!handler->set)
>  		return -EOPNOTSUPP;
> -	return handler->set(handler, dentry, inode, name, NULL, 0, XATTR_REPLACE);
> +	memset(&args, 0, sizeof(args));
> +	args.dentry = dentry;
> +	args.inode = d_inode(dentry);
> +	args.name = name;
> +	args.flags = XATTR_REPLACE;
> +	return handler->set(handler, &args);
>  }
>  EXPORT_SYMBOL(__vfs_removexattr);
>  
> diff --git a/fs/xfs/libxfs/xfs_attr.c b/fs/xfs/libxfs/xfs_attr.c
> index d48fcf11cc35..60fec712f60b 100644
> --- a/fs/xfs/libxfs/xfs_attr.c
> +++ b/fs/xfs/libxfs/xfs_attr.c
> @@ -305,7 +305,7 @@ int
>  xfs_attr_set(
>  	struct xfs_inode	*dp,
>  	const unsigned char	*name,
> -	unsigned char		*value,
> +	const unsigned char	*value,
>  	int			valuelen,
>  	int			flags)
>  {
> @@ -324,7 +324,7 @@ xfs_attr_set(
>  	if (error)
>  		return error;
>  
> -	args.value = value;
> +	args.value = (unsigned char *)value;
>  	args.valuelen = valuelen;
>  	args.op_flags = XFS_DA_OP_ADDNAME | XFS_DA_OP_OKNOENT;
>  	args.total = xfs_attr_calc_size(&args, &local);
> diff --git a/fs/xfs/libxfs/xfs_attr.h b/fs/xfs/libxfs/xfs_attr.h
> index ff28ebf3b635..afe184e5fb01 100644
> --- a/fs/xfs/libxfs/xfs_attr.h
> +++ b/fs/xfs/libxfs/xfs_attr.h
> @@ -145,7 +145,7 @@ int xfs_attr_get_ilocked(struct xfs_inode *ip, struct xfs_da_args *args);
>  int xfs_attr_get(struct xfs_inode *ip, const unsigned char *name,
>  		 unsigned char *value, int *valuelenp, int flags);
>  int xfs_attr_set(struct xfs_inode *dp, const unsigned char *name,
> -		 unsigned char *value, int valuelen, int flags);
> +		 const unsigned char *value, int valuelen, int flags);
>  int xfs_attr_set_args(struct xfs_da_args *args);
>  int xfs_attr_remove(struct xfs_inode *dp, const unsigned char *name, int flags);
>  int xfs_attr_remove_args(struct xfs_da_args *args);
> diff --git a/fs/xfs/xfs_xattr.c b/fs/xfs/xfs_xattr.c
> index 3123b5aaad2a..313a828a3d1f 100644
> --- a/fs/xfs/xfs_xattr.c
> +++ b/fs/xfs/xfs_xattr.c
> @@ -17,20 +17,20 @@
>  
>  
>  static int
> -xfs_xattr_get(const struct xattr_handler *handler, struct dentry *unused,
> -		struct inode *inode, const char *name, void *value, size_t size)
> +xfs_xattr_get(const struct xattr_handler *handler, struct xattr_gs_args *args)
>  {
>  	int xflags = handler->flags;
> -	struct xfs_inode *ip = XFS_I(inode);
> -	int error, asize = size;
> +	struct xfs_inode *ip = XFS_I(args->inode);
> +	int error, asize = args->size;
>  
>  	/* Convert Linux syscall to XFS internal ATTR flags */
> -	if (!size) {
> +	if (!args->size) {
>  		xflags |= ATTR_KERNOVAL;
> -		value = NULL;
> +		args->buffer = NULL;
>  	}
>  
> -	error = xfs_attr_get(ip, (unsigned char *)name, value, &asize, xflags);
> +	error = xfs_attr_get(ip, (const unsigned char *)args->name,
> +			     args->buffer, &asize, xflags);
>  	if (error)
>  		return error;
>  	return asize;
> @@ -59,26 +59,25 @@ xfs_forget_acl(
>  }
>  
>  static int
> -xfs_xattr_set(const struct xattr_handler *handler, struct dentry *unused,
> -		struct inode *inode, const char *name, const void *value,
> -		size_t size, int flags)
> +xfs_xattr_set(const struct xattr_handler *handler, struct xattr_gs_args *args)
>  {
>  	int			xflags = handler->flags;
> -	struct xfs_inode	*ip = XFS_I(inode);
> +	struct xfs_inode	*ip = XFS_I(args->inode);
>  	int			error;
>  
>  	/* Convert Linux syscall to XFS internal ATTR flags */
> -	if (flags & XATTR_CREATE)
> +	if (args->flags & XATTR_CREATE)
>  		xflags |= ATTR_CREATE;
> -	if (flags & XATTR_REPLACE)
> +	if (args->flags & XATTR_REPLACE)
>  		xflags |= ATTR_REPLACE;
>  
> -	if (!value)
> -		return xfs_attr_remove(ip, (unsigned char *)name, xflags);
> -	error = xfs_attr_set(ip, (unsigned char *)name,
> -				(void *)value, size, xflags);
> +	if (!args->value)
> +		return xfs_attr_remove(ip, (const unsigned char *)args->name,
> +				       xflags);
> +	error = xfs_attr_set(ip, (const unsigned char *)args->name,
> +			     args->value, args->size, xflags);
>  	if (!error)
> -		xfs_forget_acl(inode, name, xflags);
> +		xfs_forget_acl(args->inode, args->name, xflags);
>  
>  	return error;
>  }
> diff --git a/include/linux/xattr.h b/include/linux/xattr.h
> index 6dad031be3c2..b2afbdcf000f 100644
> --- a/include/linux/xattr.h
> +++ b/include/linux/xattr.h
> @@ -25,17 +25,27 @@ struct dentry;
>   * name.  When @prefix is set instead, match attributes with that prefix and
>   * with a non-empty suffix.
>   */
> +struct xattr_gs_args {
> +	struct dentry *dentry;
> +	struct inode *inode;
> +	const char *name;
> +	union {
> +		void *buffer;
> +		const void *value;
> +	};
> +	size_t size;
> +	int flags;
> +};
> +
>  struct xattr_handler {
>  	const char *name;
>  	const char *prefix;
>  	int flags;      /* fs private flags */
>  	bool (*list)(struct dentry *dentry);
> -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
> -		   struct inode *inode, const char *name, void *buffer,
> -		   size_t size);
> -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
> -		   struct inode *inode, const char *name, const void *buffer,
> -		   size_t size, int flags);
> +	int (*get)(const struct xattr_handler *handler,
> +		   struct xattr_gs_args *args);
> +	int (*set)(const struct xattr_handler *handler,
> +		   struct xattr_gs_args *args);
>  };
>  
>  const char *xattr_full_name(const struct xattr_handler *, const char *);
> @@ -46,10 +56,10 @@ struct xattr {
>  	size_t value_len;
>  };
>  
> -ssize_t __vfs_getxattr(struct dentry *, struct inode *, const char *, void *, size_t);
> +ssize_t __vfs_getxattr(struct xattr_gs_args *args);
>  ssize_t vfs_getxattr(struct dentry *, const char *, void *, size_t);
>  ssize_t vfs_listxattr(struct dentry *d, char *list, size_t size);
> -int __vfs_setxattr(struct dentry *, struct inode *, const char *, const void *, size_t, int);
> +int __vfs_setxattr(struct xattr_gs_args *args);
>  int __vfs_setxattr_noperm(struct dentry *, const char *, const void *, size_t, int);
>  int vfs_setxattr(struct dentry *, const char *, const void *, size_t, int);
>  int __vfs_removexattr(struct dentry *, const char *);
> diff --git a/include/uapi/linux/xattr.h b/include/uapi/linux/xattr.h
> index c1395b5bd432..1eba02616274 100644
> --- a/include/uapi/linux/xattr.h
> +++ b/include/uapi/linux/xattr.h
> @@ -17,8 +17,11 @@
>  #if __UAPI_DEF_XATTR
>  #define __USE_KERNEL_XATTR_DEFS
>  
> -#define XATTR_CREATE	0x1	/* set value, fail if attr already exists */
> -#define XATTR_REPLACE	0x2	/* set value, fail if attr does not exist */
> +#define XATTR_CREATE	 0x1	/* set value, fail if attr already exists */
> +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does not exist */
> +#ifdef __KERNEL__ /* following is kernel internal, colocated for maintenance */
> +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security check */
> +#endif
>  #endif
>  
>  /* Namespaces */
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 2bed4761f279..c84687f57e43 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -3205,24 +3205,23 @@ static int shmem_initxattrs(struct inode *inode,
>  }
>  
>  static int shmem_xattr_handler_get(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *name, void *buffer, size_t size)
> +				   struct xattr_gs_args *args)
>  {
> -	struct shmem_inode_info *info = SHMEM_I(inode);
> +	struct shmem_inode_info *info = SHMEM_I(args->inode);
>  
> -	name = xattr_full_name(handler, name);
> -	return simple_xattr_get(&info->xattrs, name, buffer, size);
> +	return simple_xattr_get(&info->xattrs,
> +				xattr_full_name(handler, args->name),
> +				args->buffer, args->size);
>  }
>  
>  static int shmem_xattr_handler_set(const struct xattr_handler *handler,
> -				   struct dentry *unused, struct inode *inode,
> -				   const char *name, const void *value,
> -				   size_t size, int flags)
> +				   struct xattr_gs_args *args)
>  {
> -	struct shmem_inode_info *info = SHMEM_I(inode);
> +	struct shmem_inode_info *info = SHMEM_I(args->inode);
>  
> -	name = xattr_full_name(handler, name);
> -	return simple_xattr_set(&info->xattrs, name, value, size, flags);
> +	return simple_xattr_set(&info->xattrs,
> +				xattr_full_name(handler, args->name),
> +				args->value, args->size, args->flags);
>  }
>  
>  static const struct xattr_handler shmem_security_xattr_handler = {
> diff --git a/net/socket.c b/net/socket.c
> index 6a9ab7a8b1d2..7920caece7cc 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -299,15 +299,15 @@ static const struct dentry_operations sockfs_dentry_operations = {
>  };
>  
>  static int sockfs_xattr_get(const struct xattr_handler *handler,
> -			    struct dentry *dentry, struct inode *inode,
> -			    const char *suffix, void *value, size_t size)
> +			    struct xattr_gs_args *args)
>  {
> -	if (value) {
> -		if (dentry->d_name.len + 1 > size)
> +	if (args->buffer) {
> +		if (args->dentry->d_name.len + 1 > args->size)
>  			return -ERANGE;
> -		memcpy(value, dentry->d_name.name, dentry->d_name.len + 1);
> +		memcpy(args->buffer, args->dentry->d_name.name,
> +		       args->dentry->d_name.len + 1);
>  	}
> -	return dentry->d_name.len + 1;
> +	return args->dentry->d_name.len + 1;
>  }
>  
>  #define XATTR_SOCKPROTONAME_SUFFIX "sockprotoname"
> @@ -320,9 +320,7 @@ static const struct xattr_handler sockfs_xattr_handler = {
>  };
>  
>  static int sockfs_security_xattr_set(const struct xattr_handler *handler,
> -				     struct dentry *dentry, struct inode *inode,
> -				     const char *suffix, const void *value,
> -				     size_t size, int flags)
> +				     struct xattr_gs_args *args)
>  {
>  	/* Handled by LSM. */
>  	return -EAGAIN;
> diff --git a/security/commoncap.c b/security/commoncap.c
> index f4ee0ae106b2..c58b684d5d9a 100644
> --- a/security/commoncap.c
> +++ b/security/commoncap.c
> @@ -294,11 +294,15 @@ int cap_capset(struct cred *new,
>   */
>  int cap_inode_need_killpriv(struct dentry *dentry)
>  {
> -	struct inode *inode = d_backing_inode(dentry);
> -	int error;
> +	struct xattr_gs_args args;
> +
> +	memset(&args, 0, sizeof(args));
> +	args.dentry = dentry;
> +	args.inode = d_backing_inode(dentry);
> +	args.name = XATTR_NAME_CAPS;
> +	args.flags = XATTR_NOSECURITY;
>  
> -	error = __vfs_getxattr(dentry, inode, XATTR_NAME_CAPS, NULL, 0);
> -	return error > 0;
> +	return __vfs_getxattr(&args) > 0;
>  }
>  
>  /**
> @@ -570,7 +574,7 @@ static inline int bprm_caps_from_vfs_caps(struct cpu_vfs_cap_data *caps,
>   */
>  int get_vfs_caps_from_disk(const struct dentry *dentry, struct cpu_vfs_cap_data *cpu_caps)
>  {
> -	struct inode *inode = d_backing_inode(dentry);
> +	struct xattr_gs_args args;
>  	__u32 magic_etc;
>  	unsigned tocopy, i;
>  	int size;
> @@ -580,13 +584,20 @@ int get_vfs_caps_from_disk(const struct dentry *dentry, struct cpu_vfs_cap_data
>  	struct user_namespace *fs_ns;
>  
>  	memset(cpu_caps, 0, sizeof(struct cpu_vfs_cap_data));
> +	memset(&args, 0, sizeof(args));
>  
> -	if (!inode)
> +	args.dentry = (struct dentry *)dentry;
> +	args.inode = d_backing_inode(args.dentry);
> +	if (!args.inode)
>  		return -ENODATA;
>  
> -	fs_ns = inode->i_sb->s_user_ns;
> -	size = __vfs_getxattr((struct dentry *)dentry, inode,
> -			      XATTR_NAME_CAPS, &data, XATTR_CAPS_SZ);
> +	fs_ns = args.inode->i_sb->s_user_ns;
> +
> +	args.name = XATTR_NAME_CAPS;
> +	args.buffer = &data;
> +	args.size = XATTR_CAPS_SZ;
> +	args.flags = XATTR_NOSECURITY;
> +	size = __vfs_getxattr(&args);
>  	if (size == -ENODATA || size == -EOPNOTSUPP)
>  		/* no data, that's ok */
>  		return -ENODATA;
> diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
> index f9a81b187fae..a53ef9281186 100644
> --- a/security/integrity/evm/evm_main.c
> +++ b/security/integrity/evm/evm_main.c
> @@ -91,16 +91,23 @@ static bool evm_key_loaded(void)
>  
>  static int evm_find_protected_xattrs(struct dentry *dentry)
>  {
> -	struct inode *inode = d_backing_inode(dentry);
> +	struct xattr_gs_args args;
>  	struct xattr_list *xattr;
>  	int error;
>  	int count = 0;
>  
> -	if (!(inode->i_opflags & IOP_XATTR))
> +	memset(&args, 0, sizeof(args));
> +	args.dentry = dentry;
> +	args.inode = d_backing_inode(dentry);
> +
> +	if (!(args.inode->i_opflags & IOP_XATTR))
>  		return -EOPNOTSUPP;
>  
> +	args.flags = XATTR_NOSECURITY;
> +
>  	list_for_each_entry_rcu(xattr, &evm_config_xattrnames, list) {
> -		error = __vfs_getxattr(dentry, inode, xattr->name, NULL, 0);
> +		args.name = xattr->name;
> +		error = __vfs_getxattr(&args);
>  		if (error < 0) {
>  			if (error == -ENODATA)
>  				continue;
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 74dd46de01b6..23c3a2c468f7 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -540,6 +540,8 @@ static int sb_finish_set_opts(struct super_block *sb)
>  	int rc = 0;
>  
>  	if (sbsec->behavior == SECURITY_FS_USE_XATTR) {
> +		struct xattr_gs_args args;
> +
>  		/* Make sure that the xattr handler exists and that no
>  		   error other than -ENODATA is returned by getxattr on
>  		   the root directory.  -ENODATA is ok, as this may be
> @@ -552,7 +554,12 @@ static int sb_finish_set_opts(struct super_block *sb)
>  			goto out;
>  		}
>  
> -		rc = __vfs_getxattr(root, root_inode, XATTR_NAME_SELINUX, NULL, 0);
> +		memset(&args, 0, sizeof(args));
> +		args.dentry = root;
> +		args.inode = root_inode;
> +		args.name = XATTR_NAME_SELINUX;
> +		args.flags = XATTR_NOSECURITY;
> +		rc = __vfs_getxattr(&args);
>  		if (rc < 0 && rc != -ENODATA) {
>  			if (rc == -EOPNOTSUPP)
>  				pr_warn("SELinux: (dev %s, type "
> @@ -1371,6 +1378,7 @@ static int inode_doinit_use_xattr(struct inode *inode, struct dentry *dentry,
>  	char *context;
>  	unsigned int len;
>  	int rc;
> +	struct xattr_gs_args args;
>  
>  	len = INITCONTEXTLEN;
>  	context = kmalloc(len + 1, GFP_NOFS);
> @@ -1378,12 +1386,21 @@ static int inode_doinit_use_xattr(struct inode *inode, struct dentry *dentry,
>  		return -ENOMEM;
>  
>  	context[len] = '\0';
> -	rc = __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX, context, len);
> +	memset(&args, 0, sizeof(args));
> +	args.dentry = dentry;
> +	args.inode = inode;
> +	args.name = XATTR_NAME_SELINUX;
> +	args.buffer = context;
> +	args.size = len;
> +	args.flags = XATTR_NOSECURITY;
> +	rc = __vfs_getxattr(&args);
>  	if (rc == -ERANGE) {
>  		kfree(context);
>  
>  		/* Need a larger buffer.  Query for the right size. */
> -		rc = __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX, NULL, 0);
> +		args.buffer = NULL;
> +		args.size = 0;
> +		rc = __vfs_getxattr(&args);
>  		if (rc < 0)
>  			return rc;
>  
> @@ -1393,8 +1410,9 @@ static int inode_doinit_use_xattr(struct inode *inode, struct dentry *dentry,
>  			return -ENOMEM;
>  
>  		context[len] = '\0';
> -		rc = __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX,
> -				    context, len);
> +		args.buffer = context;
> +		args.size = len;
> +		rc = __vfs_getxattr(&args);
>  	}
>  	if (rc < 0) {
>  		kfree(context);
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 4c5e5a438f8b..91e585bd1823 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -282,25 +282,32 @@ static struct smack_known *smk_fetch(const char *name, struct inode *ip,
>  					struct dentry *dp)
>  {
>  	int rc;
> -	char *buffer;
>  	struct smack_known *skp = NULL;
> +	struct xattr_gs_args args;
>  
>  	if (!(ip->i_opflags & IOP_XATTR))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> -	buffer = kzalloc(SMK_LONGLABEL, GFP_KERNEL);
> -	if (buffer == NULL)
> +	memset(&args, 0, sizeof(args));
> +	args.dentry = dp;
> +	args.inode = ip;
> +	args.name = name;
> +	args.buffer = kzalloc(SMK_LONGLABEL, GFP_KERNEL);
> +	args.size = SMK_LONGLABEL;
> +	args.flags = XATTR_NOSECURITY;
> +
> +	if (args.buffer == NULL)
>  		return ERR_PTR(-ENOMEM);
>  
> -	rc = __vfs_getxattr(dp, ip, name, buffer, SMK_LONGLABEL);
> +	rc = __vfs_getxattr(&args);
>  	if (rc < 0)
>  		skp = ERR_PTR(rc);
>  	else if (rc == 0)
>  		skp = NULL;
>  	else
> -		skp = smk_import_entry(buffer, rc);
> +		skp = smk_import_entry(args.buffer, rc);
>  
> -	kfree(buffer);
> +	kfree(args.buffer);
>  
>  	return skp;
>  }
> @@ -3424,6 +3431,8 @@ static void smack_d_instantiate(struct dentry *opt_dentry, struct inode *inode)
>  		 * Transmuting directory
>  		 */
>  		if (S_ISDIR(inode->i_mode)) {
> +			struct xattr_gs_args args;
> +
>  			/*
>  			 * If this is a new directory and the label was
>  			 * transmuted when the inode was initialized
> @@ -3433,16 +3442,19 @@ static void smack_d_instantiate(struct dentry *opt_dentry, struct inode *inode)
>  			 * If there is a transmute attribute on the
>  			 * directory mark the inode.
>  			 */
> +			memset(&args, 0, sizeof(args));
> +			args.dentry = dp;
> +			args.inode = inode;
> +			args.name = XATTR_NAME_SMACKTRANSMUTE;
> +			args.size = TRANS_TRUE_SIZE;
>  			if (isp->smk_flags & SMK_INODE_CHANGED) {
>  				isp->smk_flags &= ~SMK_INODE_CHANGED;
> -				rc = __vfs_setxattr(dp, inode,
> -					XATTR_NAME_SMACKTRANSMUTE,
> -					TRANS_TRUE, TRANS_TRUE_SIZE,
> -					0);
> +				args.value = TRANS_TRUE;
> +				rc = __vfs_setxattr(&args);
>  			} else {
> -				rc = __vfs_getxattr(dp, inode,
> -					XATTR_NAME_SMACKTRANSMUTE, trattr,
> -					TRANS_TRUE_SIZE);
> +				args.buffer = trattr;
> +				args.flags = XATTR_NOSECURITY;
> +				rc = __vfs_getxattr(&args);
>  				if (rc >= 0 && strncmp(trattr, TRANS_TRUE,
>  						       TRANS_TRUE_SIZE) != 0)
>  					rc = -EINVAL;
> -- 
> 2.23.0.rc1.153.gdeed80330f-goog
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

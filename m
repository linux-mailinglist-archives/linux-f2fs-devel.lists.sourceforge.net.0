Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E71BD76D5BC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 19:43:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRFsg-0006td-L8;
	Wed, 02 Aug 2023 17:43:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qRFsf-0006tW-JB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 17:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=on46TR0PG7DVelHR3zn3xUYFr6M8mgCbnmDAv08qxog=; b=feSPDiixZIYTZglwgwh0BOAyR/
 g/i6g33E85SIZC7MCBW1sZhlpH+UOfksYfyVoBiCan1qUVXPi9iFk5VZogu7JSBMpBk5CBxP2V6WV
 y3mM8NBlBZ5yGmrqb+Aslc7msxrn8v4qZrOoEqke209Z5CvsBjRQaFKQA/6fpyOwLT30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=on46TR0PG7DVelHR3zn3xUYFr6M8mgCbnmDAv08qxog=; b=NJ8ni7oa12KqdJQcLNnhL8axd4
 EjN0X6nUmaCVA7N1LlcNJzYxh3CO60gbWUCxo8Ly7WM+aCh/EfcPfdX+IYwk/DLMR96+DJvLqujKk
 Zfh/cILE9nfi6PToRS58651MvV+8618v4zGfthMDZSwMLJKZagCzhqfEYdT3rfELs9+s=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qRFsc-0000Hu-PV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 17:43:30 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CF11C1F381;
 Wed,  2 Aug 2023 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1690998197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=on46TR0PG7DVelHR3zn3xUYFr6M8mgCbnmDAv08qxog=;
 b=z0kmbMAb0iTxfE9ccrFxOL1aAUXQkPf+UFU8P0ILYho1k/n+QlF5ULYEM2sCaJkgYPx/jl
 ko4Fp5VTnvhIq/m3TpXAWO96UPLpGnpgy0xYZxFWKbEGFK+faAFuTv9Of92Y9HBBL41zSV
 53FDiykl0Nbog3zYSZNlsC6MaYspwL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1690998197;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=on46TR0PG7DVelHR3zn3xUYFr6M8mgCbnmDAv08qxog=;
 b=5Wv78hand14Q+1PxgXgWmSwYiLOB+qgAZsJRcxLepE32Lm3v1PlJXmHzKp+xytNH1KUyl+
 Zr8Zc5lu4ZhCstAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A79B413919;
 Wed,  2 Aug 2023 17:43:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7H3oKLWVymRUbQAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 02 Aug 2023 17:43:17 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 235B5A076B; Wed,  2 Aug 2023 19:43:17 +0200 (CEST)
Date: Wed, 2 Aug 2023 19:43:17 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230802174317.typkahs7ijoqjvs4@quack3>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 25-07-23 10:58:14,
 Jeff Layton wrote: > generic_fillattr
 just fills in the entire stat struct indiscriminately > today, copying data
 from the inode. There is at least one attribute > (STATX_CHA [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRFsc-0000Hu-PV
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
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
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
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue 25-07-23 10:58:14, Jeff Layton wrote:
> generic_fillattr just fills in the entire stat struct indiscriminately
> today, copying data from the inode. There is at least one attribute
> (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> and we're looking at adding more with the addition of multigrain
> timestamps.
> 
> Add a request_mask argument to generic_fillattr and have most callers
> just pass in the value that is passed to getattr. Have other callers
> (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> STATX_CHANGE_COOKIE into generic_fillattr.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/9p/vfs_inode.c       |  4 ++--
>  fs/9p/vfs_inode_dotl.c  |  4 ++--
>  fs/afs/inode.c          |  2 +-
>  fs/btrfs/inode.c        |  2 +-
>  fs/ceph/inode.c         |  2 +-
>  fs/coda/inode.c         |  3 ++-
>  fs/ecryptfs/inode.c     |  5 +++--
>  fs/erofs/inode.c        |  2 +-
>  fs/exfat/file.c         |  2 +-
>  fs/ext2/inode.c         |  2 +-
>  fs/ext4/inode.c         |  2 +-
>  fs/f2fs/file.c          |  2 +-
>  fs/fat/file.c           |  2 +-
>  fs/fuse/dir.c           |  2 +-
>  fs/gfs2/inode.c         |  2 +-
>  fs/hfsplus/inode.c      |  2 +-
>  fs/kernfs/inode.c       |  2 +-
>  fs/libfs.c              |  4 ++--
>  fs/minix/inode.c        |  2 +-
>  fs/nfs/inode.c          |  2 +-
>  fs/nfs/namespace.c      |  3 ++-
>  fs/ntfs3/file.c         |  2 +-
>  fs/ocfs2/file.c         |  2 +-
>  fs/orangefs/inode.c     |  2 +-
>  fs/proc/base.c          |  4 ++--
>  fs/proc/fd.c            |  2 +-
>  fs/proc/generic.c       |  2 +-
>  fs/proc/proc_net.c      |  2 +-
>  fs/proc/proc_sysctl.c   |  2 +-
>  fs/proc/root.c          |  3 ++-
>  fs/smb/client/inode.c   |  2 +-
>  fs/smb/server/smb2pdu.c | 22 +++++++++++-----------
>  fs/smb/server/vfs.c     |  3 ++-
>  fs/stat.c               | 18 ++++++++++--------
>  fs/sysv/itree.c         |  3 ++-
>  fs/ubifs/dir.c          |  2 +-
>  fs/udf/symlink.c        |  2 +-
>  fs/vboxsf/utils.c       |  2 +-
>  include/linux/fs.h      |  2 +-
>  mm/shmem.c              |  2 +-
>  40 files changed, 70 insertions(+), 62 deletions(-)
> 
> diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
> index 16d85e6033a3..d24d1f20e922 100644
> --- a/fs/9p/vfs_inode.c
> +++ b/fs/9p/vfs_inode.c
> @@ -1016,7 +1016,7 @@ v9fs_vfs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  	p9_debug(P9_DEBUG_VFS, "dentry: %p\n", dentry);
>  	v9ses = v9fs_dentry2v9ses(dentry);
>  	if (v9ses->cache & (CACHE_META|CACHE_LOOSE)) {
> -		generic_fillattr(&nop_mnt_idmap, inode, stat);
> +		generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  		return 0;
>  	} else if (v9ses->cache & CACHE_WRITEBACK) {
>  		if (S_ISREG(inode->i_mode)) {
> @@ -1037,7 +1037,7 @@ v9fs_vfs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  		return PTR_ERR(st);
>  
>  	v9fs_stat2inode(st, d_inode(dentry), dentry->d_sb, 0);
> -	generic_fillattr(&nop_mnt_idmap, d_inode(dentry), stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, d_inode(dentry), stat);
>  
>  	p9stat_free(st);
>  	kfree(st);
> diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
> index 464ea73d1bf8..8e8d5d2a13d8 100644
> --- a/fs/9p/vfs_inode_dotl.c
> +++ b/fs/9p/vfs_inode_dotl.c
> @@ -451,7 +451,7 @@ v9fs_vfs_getattr_dotl(struct mnt_idmap *idmap,
>  	p9_debug(P9_DEBUG_VFS, "dentry: %p\n", dentry);
>  	v9ses = v9fs_dentry2v9ses(dentry);
>  	if (v9ses->cache & (CACHE_META|CACHE_LOOSE)) {
> -		generic_fillattr(&nop_mnt_idmap, inode, stat);
> +		generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  		return 0;
>  	} else if (v9ses->cache) {
>  		if (S_ISREG(inode->i_mode)) {
> @@ -476,7 +476,7 @@ v9fs_vfs_getattr_dotl(struct mnt_idmap *idmap,
>  		return PTR_ERR(st);
>  
>  	v9fs_stat2inode_dotl(st, d_inode(dentry), 0);
> -	generic_fillattr(&nop_mnt_idmap, d_inode(dentry), stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, d_inode(dentry), stat);
>  	/* Change block size to what the server returned */
>  	stat->blksize = st->st_blksize;
>  
> diff --git a/fs/afs/inode.c b/fs/afs/inode.c
> index 6b636f43f548..1c794a1896aa 100644
> --- a/fs/afs/inode.c
> +++ b/fs/afs/inode.c
> @@ -773,7 +773,7 @@ int afs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  
>  	do {
>  		read_seqbegin_or_lock(&vnode->cb_lock, &seq);
> -		generic_fillattr(&nop_mnt_idmap, inode, stat);
> +		generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  		if (test_bit(AFS_VNODE_SILLY_DELETED, &vnode->flags) &&
>  		    stat->nlink > 0)
>  			stat->nlink -= 1;
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index bcccd551f547..7346059209aa 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -8773,7 +8773,7 @@ static int btrfs_getattr(struct mnt_idmap *idmap,
>  				  STATX_ATTR_IMMUTABLE |
>  				  STATX_ATTR_NODUMP);
>  
> -	generic_fillattr(idmap, inode, stat);
> +	generic_fillattr(idmap, request_mask, inode, stat);
>  	stat->dev = BTRFS_I(inode)->root->anon_dev;
>  
>  	spin_lock(&BTRFS_I(inode)->lock);
> diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
> index 5f6e93714f5a..fd05d68e2990 100644
> --- a/fs/ceph/inode.c
> +++ b/fs/ceph/inode.c
> @@ -2467,7 +2467,7 @@ int ceph_getattr(struct mnt_idmap *idmap, const struct path *path,
>  			return err;
>  	}
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	stat->ino = ceph_present_inode(inode);
>  
>  	/*
> diff --git a/fs/coda/inode.c b/fs/coda/inode.c
> index 3e64679c1620..0c7c2528791e 100644
> --- a/fs/coda/inode.c
> +++ b/fs/coda/inode.c
> @@ -256,7 +256,8 @@ int coda_getattr(struct mnt_idmap *idmap, const struct path *path,
>  {
>  	int err = coda_revalidate_inode(d_inode(path->dentry));
>  	if (!err)
> -		generic_fillattr(&nop_mnt_idmap, d_inode(path->dentry), stat);
> +		generic_fillattr(&nop_mnt_idmap, request_mask,
> +				 d_inode(path->dentry), stat);
>  	return err;
>  }
>  
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index b491bb239c8f..992d9c7e64ae 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -982,7 +982,7 @@ static int ecryptfs_getattr_link(struct mnt_idmap *idmap,
>  
>  	mount_crypt_stat = &ecryptfs_superblock_to_private(
>  						dentry->d_sb)->mount_crypt_stat;
> -	generic_fillattr(&nop_mnt_idmap, d_inode(dentry), stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, d_inode(dentry), stat);
>  	if (mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES) {
>  		char *target;
>  		size_t targetsiz;
> @@ -1011,7 +1011,8 @@ static int ecryptfs_getattr(struct mnt_idmap *idmap,
>  	if (!rc) {
>  		fsstack_copy_attr_all(d_inode(dentry),
>  				      ecryptfs_inode_to_lower(d_inode(dentry)));
> -		generic_fillattr(&nop_mnt_idmap, d_inode(dentry), stat);
> +		generic_fillattr(&nop_mnt_idmap, request_mask,
> +				 d_inode(dentry), stat);
>  		stat->blocks = lower_stat.blocks;
>  	}
>  	return rc;
> diff --git a/fs/erofs/inode.c b/fs/erofs/inode.c
> index c9bbdf7c34db..edc8ec7581b8 100644
> --- a/fs/erofs/inode.c
> +++ b/fs/erofs/inode.c
> @@ -369,7 +369,7 @@ int erofs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  	stat->attributes_mask |= (STATX_ATTR_COMPRESSED |
>  				  STATX_ATTR_IMMUTABLE);
>  
> -	generic_fillattr(idmap, inode, stat);
> +	generic_fillattr(idmap, request_mask, inode, stat);
>  	return 0;
>  }
>  
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index f40ecfeee3a4..32395ef686a2 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -232,7 +232,7 @@ int exfat_getattr(struct mnt_idmap *idmap, const struct path *path,
>  	struct inode *inode = d_backing_inode(path->dentry);
>  	struct exfat_inode_info *ei = EXFAT_I(inode);
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	exfat_truncate_atime(&stat->atime);
>  	stat->result_mask |= STATX_BTIME;
>  	stat->btime.tv_sec = ei->i_crtime.tv_sec;
> diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
> index 1259995977d2..acbab27fe957 100644
> --- a/fs/ext2/inode.c
> +++ b/fs/ext2/inode.c
> @@ -1628,7 +1628,7 @@ int ext2_getattr(struct mnt_idmap *idmap, const struct path *path,
>  			STATX_ATTR_IMMUTABLE |
>  			STATX_ATTR_NODUMP);
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	return 0;
>  }
>  
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 86696b40c58f..6683076ecb2f 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -5535,7 +5535,7 @@ int ext4_getattr(struct mnt_idmap *idmap, const struct path *path,
>  				  STATX_ATTR_NODUMP |
>  				  STATX_ATTR_VERITY);
>  
> -	generic_fillattr(idmap, inode, stat);
> +	generic_fillattr(idmap, request_mask, inode, stat);
>  	return 0;
>  }
>  
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index b018800223c4..35886a52edfb 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -882,7 +882,7 @@ int f2fs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  				  STATX_ATTR_NODUMP |
>  				  STATX_ATTR_VERITY);
>  
> -	generic_fillattr(idmap, inode, stat);
> +	generic_fillattr(idmap, request_mask, inode, stat);
>  
>  	/* we need to show initial sectors used for inline_data/dentries */
>  	if ((S_ISREG(inode->i_mode) && f2fs_has_inline_data(inode)) ||
> diff --git a/fs/fat/file.c b/fs/fat/file.c
> index 456477946dd9..e887e9ab7472 100644
> --- a/fs/fat/file.c
> +++ b/fs/fat/file.c
> @@ -401,7 +401,7 @@ int fat_getattr(struct mnt_idmap *idmap, const struct path *path,
>  	struct inode *inode = d_inode(path->dentry);
>  	struct msdos_sb_info *sbi = MSDOS_SB(inode->i_sb);
>  
> -	generic_fillattr(idmap, inode, stat);
> +	generic_fillattr(idmap, request_mask, inode, stat);
>  	stat->blksize = sbi->cluster_size;
>  
>  	if (sbi->options.nfs == FAT_NFS_NOSTALE_RO) {
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 672245ee0394..881524b9a55a 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1222,7 +1222,7 @@ static int fuse_update_get_attr(struct inode *inode, struct file *file,
>  		forget_all_cached_acls(inode);
>  		err = fuse_do_getattr(inode, stat, file);
>  	} else if (stat) {
> -		generic_fillattr(&nop_mnt_idmap, inode, stat);
> +		generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  		stat->mode = fi->orig_i_mode;
>  		stat->ino = fi->orig_ino;
>  	}
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 2ded6c813f20..200cabf3b393 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -2071,7 +2071,7 @@ static int gfs2_getattr(struct mnt_idmap *idmap,
>  				  STATX_ATTR_IMMUTABLE |
>  				  STATX_ATTR_NODUMP);
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  
>  	if (gfs2_holder_initialized(&gh))
>  		gfs2_glock_dq_uninit(&gh);
> diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
> index 40c61ab4a918..c65c8c4b03dd 100644
> --- a/fs/hfsplus/inode.c
> +++ b/fs/hfsplus/inode.c
> @@ -298,7 +298,7 @@ int hfsplus_getattr(struct mnt_idmap *idmap, const struct path *path,
>  	stat->attributes_mask |= STATX_ATTR_APPEND | STATX_ATTR_IMMUTABLE |
>  				 STATX_ATTR_NODUMP;
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	return 0;
>  }
>  
> diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
> index 89a9b4dcf109..af37be68bf06 100644
> --- a/fs/kernfs/inode.c
> +++ b/fs/kernfs/inode.c
> @@ -190,7 +190,7 @@ int kernfs_iop_getattr(struct mnt_idmap *idmap,
>  
>  	down_read(&root->kernfs_iattr_rwsem);
>  	kernfs_refresh_inode(kn, inode);
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	up_read(&root->kernfs_iattr_rwsem);
>  
>  	return 0;
> diff --git a/fs/libfs.c b/fs/libfs.c
> index b27260e0c14a..0a9f3c426548 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -33,7 +33,7 @@ int simple_getattr(struct mnt_idmap *idmap, const struct path *path,
>  		   unsigned int query_flags)
>  {
>  	struct inode *inode = d_inode(path->dentry);
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	stat->blocks = inode->i_mapping->nrpages << (PAGE_SHIFT - 9);
>  	return 0;
>  }
> @@ -1585,7 +1585,7 @@ static int empty_dir_getattr(struct mnt_idmap *idmap,
>  			     u32 request_mask, unsigned int query_flags)
>  {
>  	struct inode *inode = d_inode(path->dentry);
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	return 0;
>  }
>  
> diff --git a/fs/minix/inode.c b/fs/minix/inode.c
> index 8a4fc9420b36..df575473c1cc 100644
> --- a/fs/minix/inode.c
> +++ b/fs/minix/inode.c
> @@ -656,7 +656,7 @@ int minix_getattr(struct mnt_idmap *idmap, const struct path *path,
>  	struct super_block *sb = path->dentry->d_sb;
>  	struct inode *inode = d_inode(path->dentry);
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	if (INODE_VERSION(inode) == MINIX_V1)
>  		stat->blocks = (BLOCK_SIZE / 512) * V1_minix_blocks(stat->size, sb);
>  	else
> diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> index 1283fdfa4b0a..e21c073158e5 100644
> --- a/fs/nfs/inode.c
> +++ b/fs/nfs/inode.c
> @@ -912,7 +912,7 @@ int nfs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  	/* Only return attributes that were revalidated. */
>  	stat->result_mask = nfs_get_valid_attrmask(inode) | request_mask;
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	stat->ino = nfs_compat_user_ino64(NFS_FILEID(inode));
>  	stat->change_cookie = inode_peek_iversion_raw(inode);
>  	stat->attributes_mask |= STATX_ATTR_CHANGE_MONOTONIC;
> diff --git a/fs/nfs/namespace.c b/fs/nfs/namespace.c
> index 19d51ebf842c..e7494cdd957e 100644
> --- a/fs/nfs/namespace.c
> +++ b/fs/nfs/namespace.c
> @@ -215,7 +215,8 @@ nfs_namespace_getattr(struct mnt_idmap *idmap,
>  	if (NFS_FH(d_inode(path->dentry))->size != 0)
>  		return nfs_getattr(idmap, path, stat, request_mask,
>  				   query_flags);
> -	generic_fillattr(&nop_mnt_idmap, d_inode(path->dentry), stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, d_inode(path->dentry),
> +			 stat);
>  	return 0;
>  }
>  
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 12788601dc84..962f12ce6c0a 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -85,7 +85,7 @@ int ntfs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  
>  	stat->attributes_mask |= STATX_ATTR_COMPRESSED | STATX_ATTR_ENCRYPTED;
>  
> -	generic_fillattr(idmap, inode, stat);
> +	generic_fillattr(idmap, request_mask, inode, stat);
>  
>  	stat->result_mask |= STATX_BTIME;
>  	stat->btime = ni->i_crtime;
> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
> index 1b337ebce4df..8184499ae7a5 100644
> --- a/fs/ocfs2/file.c
> +++ b/fs/ocfs2/file.c
> @@ -1319,7 +1319,7 @@ int ocfs2_getattr(struct mnt_idmap *idmap, const struct path *path,
>  		goto bail;
>  	}
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	/*
>  	 * If there is inline data in the inode, the inode will normally not
>  	 * have data blocks allocated (it may have an external xattr block).
> diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
> index 9014bbcc8031..a52c30e80f45 100644
> --- a/fs/orangefs/inode.c
> +++ b/fs/orangefs/inode.c
> @@ -871,7 +871,7 @@ int orangefs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  	ret = orangefs_inode_getattr(inode,
>  	    request_mask & STATX_SIZE ? ORANGEFS_GETATTR_SIZE : 0);
>  	if (ret == 0) {
> -		generic_fillattr(&nop_mnt_idmap, inode, stat);
> +		generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  
>  		/* override block size reported to stat */
>  		if (!(request_mask & STATX_SIZE))
> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index d8388fc0a362..2bf67a0e0bcc 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -1966,7 +1966,7 @@ int pid_getattr(struct mnt_idmap *idmap, const struct path *path,
>  	struct proc_fs_info *fs_info = proc_sb_info(inode->i_sb);
>  	struct task_struct *task;
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  
>  	stat->uid = GLOBAL_ROOT_UID;
>  	stat->gid = GLOBAL_ROOT_GID;
> @@ -3900,7 +3900,7 @@ static int proc_task_getattr(struct mnt_idmap *idmap,
>  {
>  	struct inode *inode = d_inode(path->dentry);
>  	struct task_struct *p = get_proc_task(inode);
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  
>  	if (p) {
>  		stat->nlink += get_nr_threads(p);
> diff --git a/fs/proc/fd.c b/fs/proc/fd.c
> index b3140deebbbf..6276b3938842 100644
> --- a/fs/proc/fd.c
> +++ b/fs/proc/fd.c
> @@ -352,7 +352,7 @@ static int proc_fd_getattr(struct mnt_idmap *idmap,
>  	struct inode *inode = d_inode(path->dentry);
>  	int rv = 0;
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  
>  	/* If it's a directory, put the number of open fds there */
>  	if (S_ISDIR(inode->i_mode)) {
> diff --git a/fs/proc/generic.c b/fs/proc/generic.c
> index 42ae38ff6e7e..775ce0bcf08c 100644
> --- a/fs/proc/generic.c
> +++ b/fs/proc/generic.c
> @@ -146,7 +146,7 @@ static int proc_getattr(struct mnt_idmap *idmap,
>  		}
>  	}
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	return 0;
>  }
>  
> diff --git a/fs/proc/proc_net.c b/fs/proc/proc_net.c
> index 78f9e6b469c0..2ba31b6d68c0 100644
> --- a/fs/proc/proc_net.c
> +++ b/fs/proc/proc_net.c
> @@ -308,7 +308,7 @@ static int proc_tgid_net_getattr(struct mnt_idmap *idmap,
>  
>  	net = get_proc_task_net(inode);
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  
>  	if (net != NULL) {
>  		stat->nlink = net->proc_net->nlink;
> diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
> index 6bc10e7e0ff7..bf06344a42cc 100644
> --- a/fs/proc/proc_sysctl.c
> +++ b/fs/proc/proc_sysctl.c
> @@ -849,7 +849,7 @@ static int proc_sys_getattr(struct mnt_idmap *idmap,
>  	if (IS_ERR(head))
>  		return PTR_ERR(head);
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	if (table)
>  		stat->mode = (stat->mode & S_IFMT) | table->mode;
>  
> diff --git a/fs/proc/root.c b/fs/proc/root.c
> index a86e65a608da..9191248f2dac 100644
> --- a/fs/proc/root.c
> +++ b/fs/proc/root.c
> @@ -314,7 +314,8 @@ static int proc_root_getattr(struct mnt_idmap *idmap,
>  			     const struct path *path, struct kstat *stat,
>  			     u32 request_mask, unsigned int query_flags)
>  {
> -	generic_fillattr(&nop_mnt_idmap, d_inode(path->dentry), stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, d_inode(path->dentry),
> +			 stat);
>  	stat->nlink = proc_root.nlink + nr_processes();
>  	return 0;
>  }
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index 218f03dd3f52..93fe43789d7a 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -2540,7 +2540,7 @@ int cifs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  			return rc;
>  	}
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	stat->blksize = cifs_sb->ctx->bsize;
>  	stat->ino = CIFS_I(inode)->uniqueid;
>  
> diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
> index f9099831c8ff..2a084d35233a 100644
> --- a/fs/smb/server/smb2pdu.c
> +++ b/fs/smb/server/smb2pdu.c
> @@ -4391,8 +4391,8 @@ static int get_file_basic_info(struct smb2_query_info_rsp *rsp,
>  	}
>  
>  	basic_info = (struct smb2_file_basic_info *)rsp->Buffer;
> -	generic_fillattr(file_mnt_idmap(fp->filp), file_inode(fp->filp),
> -			 &stat);
> +	generic_fillattr(file_mnt_idmap(fp->filp), STATX_BASIC_STATS,
> +			 file_inode(fp->filp), &stat);
>  	basic_info->CreationTime = cpu_to_le64(fp->create_time);
>  	time = ksmbd_UnixTimeToNT(stat.atime);
>  	basic_info->LastAccessTime = cpu_to_le64(time);
> @@ -4417,7 +4417,7 @@ static void get_file_standard_info(struct smb2_query_info_rsp *rsp,
>  	struct kstat stat;
>  
>  	inode = file_inode(fp->filp);
> -	generic_fillattr(file_mnt_idmap(fp->filp), inode, &stat);
> +	generic_fillattr(file_mnt_idmap(fp->filp), STATX_BASIC_STATS, inode, &stat);
>  
>  	sinfo = (struct smb2_file_standard_info *)rsp->Buffer;
>  	delete_pending = ksmbd_inode_pending_delete(fp);
> @@ -4471,7 +4471,7 @@ static int get_file_all_info(struct ksmbd_work *work,
>  		return PTR_ERR(filename);
>  
>  	inode = file_inode(fp->filp);
> -	generic_fillattr(file_mnt_idmap(fp->filp), inode, &stat);
> +	generic_fillattr(file_mnt_idmap(fp->filp), STATX_BASIC_STATS, inode, &stat);
>  
>  	ksmbd_debug(SMB, "filename = %s\n", filename);
>  	delete_pending = ksmbd_inode_pending_delete(fp);
> @@ -4548,8 +4548,8 @@ static void get_file_stream_info(struct ksmbd_work *work,
>  	int buf_free_len;
>  	struct smb2_query_info_req *req = ksmbd_req_buf_next(work);
>  
> -	generic_fillattr(file_mnt_idmap(fp->filp), file_inode(fp->filp),
> -			 &stat);
> +	generic_fillattr(file_mnt_idmap(fp->filp), STATX_BASIC_STATS,
> +			 file_inode(fp->filp), &stat);
>  	file_info = (struct smb2_file_stream_info *)rsp->Buffer;
>  
>  	buf_free_len =
> @@ -4639,8 +4639,8 @@ static void get_file_internal_info(struct smb2_query_info_rsp *rsp,
>  	struct smb2_file_internal_info *file_info;
>  	struct kstat stat;
>  
> -	generic_fillattr(file_mnt_idmap(fp->filp), file_inode(fp->filp),
> -			 &stat);
> +	generic_fillattr(file_mnt_idmap(fp->filp), STATX_BASIC_STATS,
> +			 file_inode(fp->filp), &stat);
>  	file_info = (struct smb2_file_internal_info *)rsp->Buffer;
>  	file_info->IndexNumber = cpu_to_le64(stat.ino);
>  	rsp->OutputBufferLength =
> @@ -4665,7 +4665,7 @@ static int get_file_network_open_info(struct smb2_query_info_rsp *rsp,
>  	file_info = (struct smb2_file_ntwrk_info *)rsp->Buffer;
>  
>  	inode = file_inode(fp->filp);
> -	generic_fillattr(file_mnt_idmap(fp->filp), inode, &stat);
> +	generic_fillattr(file_mnt_idmap(fp->filp), STATX_BASIC_STATS, inode, &stat);
>  
>  	file_info->CreationTime = cpu_to_le64(fp->create_time);
>  	time = ksmbd_UnixTimeToNT(stat.atime);
> @@ -4726,8 +4726,8 @@ static void get_file_compression_info(struct smb2_query_info_rsp *rsp,
>  	struct smb2_file_comp_info *file_info;
>  	struct kstat stat;
>  
> -	generic_fillattr(file_mnt_idmap(fp->filp), file_inode(fp->filp),
> -			 &stat);
> +	generic_fillattr(file_mnt_idmap(fp->filp), STATX_BASIC_STATS,
> +			 file_inode(fp->filp), &stat);
>  
>  	file_info = (struct smb2_file_comp_info *)rsp->Buffer;
>  	file_info->CompressedFileSize = cpu_to_le64(stat.blocks << 9);
> diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
> index e35914457350..d0e94b73931a 100644
> --- a/fs/smb/server/vfs.c
> +++ b/fs/smb/server/vfs.c
> @@ -1650,7 +1650,8 @@ int ksmbd_vfs_fill_dentry_attrs(struct ksmbd_work *work,
>  	u64 time;
>  	int rc;
>  
> -	generic_fillattr(idmap, d_inode(dentry), ksmbd_kstat->kstat);
> +	generic_fillattr(idmap, STATX_BASIC_STATS, d_inode(dentry),
> +			 ksmbd_kstat->kstat);
>  
>  	time = ksmbd_UnixTimeToNT(ksmbd_kstat->kstat->ctime);
>  	ksmbd_kstat->create_time = time;
> diff --git a/fs/stat.c b/fs/stat.c
> index 8c2b30af19f5..062f311b5386 100644
> --- a/fs/stat.c
> +++ b/fs/stat.c
> @@ -29,6 +29,7 @@
>  /**
>   * generic_fillattr - Fill in the basic attributes from the inode struct
>   * @idmap:	idmap of the mount the inode was found from
> + * @req_mask	statx request_mask
>   * @inode:	Inode to use as the source
>   * @stat:	Where to fill in the attributes
>   *
> @@ -42,8 +43,8 @@
>   * uid and gid filds. On non-idmapped mounts or if permission checking is to be
>   * performed on the raw inode simply passs @nop_mnt_idmap.
>   */
> -void generic_fillattr(struct mnt_idmap *idmap, struct inode *inode,
> -		      struct kstat *stat)
> +void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
> +		      struct inode *inode, struct kstat *stat)
>  {
>  	vfsuid_t vfsuid = i_uid_into_vfsuid(idmap, inode);
>  	vfsgid_t vfsgid = i_gid_into_vfsgid(idmap, inode);
> @@ -61,6 +62,12 @@ void generic_fillattr(struct mnt_idmap *idmap, struct inode *inode,
>  	stat->ctime = inode_get_ctime(inode);
>  	stat->blksize = i_blocksize(inode);
>  	stat->blocks = inode->i_blocks;
> +
> +	if ((request_mask & STATX_CHANGE_COOKIE) && IS_I_VERSION(inode)) {
> +		stat->result_mask |= STATX_CHANGE_COOKIE;
> +		stat->change_cookie = inode_query_iversion(inode);
> +	}
> +
>  }
>  EXPORT_SYMBOL(generic_fillattr);
>  
> @@ -123,17 +130,12 @@ int vfs_getattr_nosec(const struct path *path, struct kstat *stat,
>  	stat->attributes_mask |= (STATX_ATTR_AUTOMOUNT |
>  				  STATX_ATTR_DAX);
>  
> -	if ((request_mask & STATX_CHANGE_COOKIE) && IS_I_VERSION(inode)) {
> -		stat->result_mask |= STATX_CHANGE_COOKIE;
> -		stat->change_cookie = inode_query_iversion(inode);
> -	}
> -
>  	idmap = mnt_idmap(path->mnt);
>  	if (inode->i_op->getattr)
>  		return inode->i_op->getattr(idmap, path, stat,
>  					    request_mask, query_flags);
>  
> -	generic_fillattr(idmap, inode, stat);
> +	generic_fillattr(idmap, request_mask, inode, stat);
>  	return 0;
>  }
>  EXPORT_SYMBOL(vfs_getattr_nosec);
> diff --git a/fs/sysv/itree.c b/fs/sysv/itree.c
> index dba6a2ef26f1..edb94e55de8e 100644
> --- a/fs/sysv/itree.c
> +++ b/fs/sysv/itree.c
> @@ -449,7 +449,8 @@ int sysv_getattr(struct mnt_idmap *idmap, const struct path *path,
>  		 struct kstat *stat, u32 request_mask, unsigned int flags)
>  {
>  	struct super_block *s = path->dentry->d_sb;
> -	generic_fillattr(&nop_mnt_idmap, d_inode(path->dentry), stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, d_inode(path->dentry),
> +			 stat);
>  	stat->blocks = (s->s_blocksize / 512) * sysv_nblocks(s, stat->size);
>  	stat->blksize = s->s_blocksize;
>  	return 0;
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 3a1ba8ba308a..2f48c58d47cd 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -1654,7 +1654,7 @@ int ubifs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  				STATX_ATTR_ENCRYPTED |
>  				STATX_ATTR_IMMUTABLE);
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	stat->blksize = UBIFS_BLOCK_SIZE;
>  	stat->size = ui->ui_size;
>  
> diff --git a/fs/udf/symlink.c b/fs/udf/symlink.c
> index 779b5c2c75f6..f7eaf7b14594 100644
> --- a/fs/udf/symlink.c
> +++ b/fs/udf/symlink.c
> @@ -149,7 +149,7 @@ static int udf_symlink_getattr(struct mnt_idmap *idmap,
>  	struct inode *inode = d_backing_inode(dentry);
>  	struct page *page;
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	page = read_mapping_page(inode->i_mapping, 0, NULL);
>  	if (IS_ERR(page))
>  		return PTR_ERR(page);
> diff --git a/fs/vboxsf/utils.c b/fs/vboxsf/utils.c
> index 576b91d571c5..83f20dd15522 100644
> --- a/fs/vboxsf/utils.c
> +++ b/fs/vboxsf/utils.c
> @@ -252,7 +252,7 @@ int vboxsf_getattr(struct mnt_idmap *idmap, const struct path *path,
>  	if (err)
>  		return err;
>  
> -	generic_fillattr(&nop_mnt_idmap, d_inode(dentry), kstat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, d_inode(dentry), kstat);
>  	return 0;
>  }
>  
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 39076ea6a360..42d1434cc427 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2919,7 +2919,7 @@ extern void page_put_link(void *);
>  extern int page_symlink(struct inode *inode, const char *symname, int len);
>  extern const struct inode_operations page_symlink_inode_operations;
>  extern void kfree_link(void *);
> -void generic_fillattr(struct mnt_idmap *, struct inode *, struct kstat *);
> +void generic_fillattr(struct mnt_idmap *, u32, struct inode *, struct kstat *);
>  void generic_fill_statx_attr(struct inode *inode, struct kstat *stat);
>  extern int vfs_getattr_nosec(const struct path *, struct kstat *, u32, unsigned int);
>  extern int vfs_getattr(const struct path *, struct kstat *, u32, unsigned int);
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 310b0544eae3..b154af49d2df 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1073,7 +1073,7 @@ static int shmem_getattr(struct mnt_idmap *idmap,
>  	stat->attributes_mask |= (STATX_ATTR_APPEND |
>  			STATX_ATTR_IMMUTABLE |
>  			STATX_ATTR_NODUMP);
> -	generic_fillattr(idmap, inode, stat);
> +	generic_fillattr(idmap, request_mask, inode, stat);
>  
>  	if (shmem_is_huge(inode, 0, false, NULL, 0))
>  		stat->blksize = HPAGE_PMD_SIZE;
> 
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

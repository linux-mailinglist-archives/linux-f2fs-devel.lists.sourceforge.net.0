Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE9F773953
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Aug 2023 11:25:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTIxs-0005oN-4J;
	Tue, 08 Aug 2023 09:25:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qTIxq-0005oH-Qy
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 09:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1DEnEiKO284zxT4/+fvA4uuffbMofkDORo642+Wc/io=; b=cnWsnT/YIvbWBA2whw+uY73iT0
 TbCMlJd306pH8Etrpn/OY9iiP6UO4r/roDMeU/YO2aVZtYUAnlSEzf9oBbZKQGfXPA+wAIsgBTwzH
 6PXKQik8HogvaEBNPOc+NdthQhVho7lcm8AI62aQBxDK1RtfkRKG5dAc7nLPJOIv7YgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1DEnEiKO284zxT4/+fvA4uuffbMofkDORo642+Wc/io=; b=FqfJaYzJUSzNboICA3+E5js767
 GPgE26b2ZC5AMLPu39Kbb3r1el/IIl1aV1H+TJZV7Opj1NbbuJuCwoIEe65kgK5lUKfcvckaIXUJT
 Iogghe6MoOpG9JfNdSbHdJyvSwd9TFapUohWm6JCR80EQybLMcZvR2w1fCeeaoyer4wg=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTIxq-0001fx-Jo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 09:25:19 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE16022481;
 Tue,  8 Aug 2023 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691486712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1DEnEiKO284zxT4/+fvA4uuffbMofkDORo642+Wc/io=;
 b=ix372cs3mbIkTWg1MsYpwEmHKxymfpU2fRqMoB3bdsY5L5+d88wTzMILXUNjN2Hey8brqp
 /zdSMsRPF0pQ9mO8VTms56EAKaxrkXcWWBEAdzVrBPrId8dDBBUjH8L2jH5yiaPdY8XiST
 M7jwu5Zs1qGSi0jn9fW7GgGyREZQvck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691486712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1DEnEiKO284zxT4/+fvA4uuffbMofkDORo642+Wc/io=;
 b=nz47GajxRXd1Kr3p+NB1XcBjrQKYlyuj0q3UvQcQR7hQOVOIMR3ZkrS9KehXlRYW0RhdS3
 rOQzce0ROF9jIWAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D531F13451;
 Tue,  8 Aug 2023 09:25:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SiMINPcJ0mSNFwAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 08 Aug 2023 09:25:11 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 5F488A0769; Tue,  8 Aug 2023 11:25:11 +0200 (CEST)
Date: Tue, 8 Aug 2023 11:25:11 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230808092511.jh4lxer2dztdajpo@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-3-d1dec143a704@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-mgctime-v7-3-d1dec143a704@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 07-08-23 15:38:34,
 Jeff Layton wrote: > In future patches
 we're going to change how the ctime is updated > to keep track of when it
 has been queried. The way that the update_time > operation wo [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qTIxq-0001fx-Jo
Subject: Re: [f2fs-dev] [PATCH v7 03/13] fs: drop the timespec64 arg from
 generic_update_time
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
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Benjamin Coddington <bcodding@redhat.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Amir Goldstein <amir73il@gmail.com>,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
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

On Mon 07-08-23 15:38:34, Jeff Layton wrote:
> In future patches we're going to change how the ctime is updated
> to keep track of when it has been queried. The way that the update_time
> operation works (and a lot of its callers) make this difficult, since
> they grab a timestamp early and then pass it down to eventually be
> copied into the inode.
> 
> All of the existing update_time callers pass in the result of
> current_time() in some fashion. Drop the "time" parameter from
> generic_update_time, and rework it to fetch its own timestamp.
> 
> This change means that an update_time could fetch a different timestamp
> than was seen in inode_needs_update_time. update_time is only ever
> called with one of two flag combinations: Either S_ATIME is set, or
> S_MTIME|S_CTIME|S_VERSION are set.
> 
> With this change we now treat the flags argument as an indicator that
> some value needed to be updated when last checked, rather than an
> indication to update specific timestamps.
> 
> Rework the logic for updating the timestamps and put it in a new
> inode_update_timestamps helper that other update_time routines can use.
> S_ATIME is as treated as we always have, but if any of the other three
> are set, then we attempt to update all three.
> 
> Also, some callers of generic_update_time need to know what timestamps
> were actually updated. Change it to return an S_* flag mask to indicate
> that and rework the callers to expect it.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/gfs2/inode.c     |  3 +-
>  fs/inode.c          | 84 +++++++++++++++++++++++++++++++++++++++++------------
>  fs/orangefs/inode.c |  3 +-
>  fs/ubifs/file.c     |  6 ++--
>  fs/xfs/xfs_iops.c   |  6 ++--
>  include/linux/fs.h  |  3 +-
>  6 files changed, 80 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 200cabf3b393..f1f04557aa21 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -2155,7 +2155,8 @@ static int gfs2_update_time(struct inode *inode, struct timespec64 *time,
>  		if (error)
>  			return error;
>  	}
> -	return generic_update_time(inode, time, flags);
> +	generic_update_time(inode, flags);
> +	return 0;
>  }
>  
>  static const struct inode_operations gfs2_file_iops = {
> diff --git a/fs/inode.c b/fs/inode.c
> index 3fc251bfaf73..e07e45f6cd01 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -1881,29 +1881,76 @@ static int relatime_need_update(struct vfsmount *mnt, struct inode *inode,
>  	return 0;
>  }
>  
> -int generic_update_time(struct inode *inode, struct timespec64 *time, int flags)
> +/**
> + * inode_update_timestamps - update the timestamps on the inode
> + * @inode: inode to be updated
> + * @flags: S_* flags that needed to be updated
> + *
> + * The update_time function is called when an inode's timestamps need to be
> + * updated for a read or write operation. This function handles updating the
> + * actual timestamps. It's up to the caller to ensure that the inode is marked
> + * dirty appropriately.
> + *
> + * In the case where any of S_MTIME, S_CTIME, or S_VERSION need to be updated,
> + * attempt to update all three of them. S_ATIME updates can be handled
> + * independently of the rest.
> + *
> + * Returns a set of S_* flags indicating which values changed.
> + */
> +int inode_update_timestamps(struct inode *inode, int flags)
>  {
> -	int dirty_flags = 0;
> +	int updated = 0;
> +	struct timespec64 now;
> +
> +	if (flags & (S_MTIME|S_CTIME|S_VERSION)) {
> +		struct timespec64 ctime = inode_get_ctime(inode);
>  
> -	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
> -		if (flags & S_ATIME)
> -			inode->i_atime = *time;
> -		if (flags & S_CTIME)
> -			inode_set_ctime_to_ts(inode, *time);
> -		if (flags & S_MTIME)
> -			inode->i_mtime = *time;
> -
> -		if (inode->i_sb->s_flags & SB_LAZYTIME)
> -			dirty_flags |= I_DIRTY_TIME;
> -		else
> -			dirty_flags |= I_DIRTY_SYNC;
> +		now = inode_set_ctime_current(inode);
> +		if (!timespec64_equal(&now, &ctime))
> +			updated |= S_CTIME;
> +		if (!timespec64_equal(&now, &inode->i_mtime)) {
> +			inode->i_mtime = now;
> +			updated |= S_MTIME;
> +		}
> +		if (IS_I_VERSION(inode) && inode_maybe_inc_iversion(inode, updated))
> +			updated |= S_VERSION;
> +	} else {
> +		now = current_time(inode);
>  	}
>  
> -	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
> -		dirty_flags |= I_DIRTY_SYNC;
> +	if (flags & S_ATIME) {
> +		if (!timespec64_equal(&now, &inode->i_atime)) {
> +			inode->i_atime = now;
> +			updated |= S_ATIME;
> +		}
> +	}
> +	return updated;
> +}
> +EXPORT_SYMBOL(inode_update_timestamps);
> +
> +/**
> + * generic_update_time - update the timestamps on the inode
> + * @inode: inode to be updated
> + * @flags: S_* flags that needed to be updated
> + *
> + * The update_time function is called when an inode's timestamps need to be
> + * updated for a read or write operation. In the case where any of S_MTIME, S_CTIME,
> + * or S_VERSION need to be updated we attempt to update all three of them. S_ATIME
> + * updates can be handled done independently of the rest.
> + *
> + * Returns a S_* mask indicating which fields were updated.
> + */
> +int generic_update_time(struct inode *inode, int flags)
> +{
> +	int updated = inode_update_timestamps(inode, flags);
> +	int dirty_flags = 0;
>  
> +	if (updated & (S_ATIME|S_MTIME|S_CTIME))
> +		dirty_flags = inode->i_sb->s_flags & SB_LAZYTIME ? I_DIRTY_TIME : I_DIRTY_SYNC;
> +	if (updated & S_VERSION)
> +		dirty_flags |= I_DIRTY_SYNC;
>  	__mark_inode_dirty(inode, dirty_flags);
> -	return 0;
> +	return updated;
>  }
>  EXPORT_SYMBOL(generic_update_time);
>  
> @@ -1915,7 +1962,8 @@ int inode_update_time(struct inode *inode, struct timespec64 *time, int flags)
>  {
>  	if (inode->i_op->update_time)
>  		return inode->i_op->update_time(inode, time, flags);
> -	return generic_update_time(inode, time, flags);
> +	generic_update_time(inode, flags);
> +	return 0;
>  }
>  EXPORT_SYMBOL(inode_update_time);
>  
> diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
> index a52c30e80f45..3afa2a69bc63 100644
> --- a/fs/orangefs/inode.c
> +++ b/fs/orangefs/inode.c
> @@ -903,9 +903,10 @@ int orangefs_permission(struct mnt_idmap *idmap,
>  int orangefs_update_time(struct inode *inode, struct timespec64 *time, int flags)
>  {
>  	struct iattr iattr;
> +
>  	gossip_debug(GOSSIP_INODE_DEBUG, "orangefs_update_time: %pU\n",
>  	    get_khandle_from_ino(inode));
> -	generic_update_time(inode, time, flags);
> +	flags = generic_update_time(inode, flags);
>  	memset(&iattr, 0, sizeof iattr);
>          if (flags & S_ATIME)
>  		iattr.ia_valid |= ATTR_ATIME;
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index 436b27d7c58f..df9086b19cd0 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -1387,8 +1387,10 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
>  			.dirtied_ino_d = ALIGN(ui->data_len, 8) };
>  	int err, release;
>  
> -	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
> -		return generic_update_time(inode, time, flags);
> +	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT)) {
> +		generic_update_time(inode, flags);
> +		return 0;
> +	}
>  
>  	err = ubifs_budget_space(c, &req);
>  	if (err)
> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> index 3a9363953ef2..731f45391baa 100644
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@ -1042,8 +1042,10 @@ xfs_vn_update_time(
>  
>  	if (inode->i_sb->s_flags & SB_LAZYTIME) {
>  		if (!((flags & S_VERSION) &&
> -		      inode_maybe_inc_iversion(inode, false)))
> -			return generic_update_time(inode, now, flags);
> +		      inode_maybe_inc_iversion(inode, false))) {
> +			generic_update_time(inode, flags);
> +			return 0;
> +		}
>  
>  		/* Capture the iversion update that just occurred */
>  		log_flags |= XFS_ILOG_CORE;
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 85977cdeda94..bb3c2c4f871f 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2343,7 +2343,8 @@ extern int current_umask(void);
>  
>  extern void ihold(struct inode * inode);
>  extern void iput(struct inode *);
> -extern int generic_update_time(struct inode *, struct timespec64 *, int);
> +int inode_update_timestamps(struct inode *inode, int flags);
> +int generic_update_time(struct inode *, int);
>  
>  /* /sys/fs */
>  extern struct kobject *fs_kobj;
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

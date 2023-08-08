Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA377398A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Aug 2023 12:06:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTJbM-0007kM-0d;
	Tue, 08 Aug 2023 10:06:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qTJbJ-0007k9-Tu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 10:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cOTJYjkBLnwjV/lxEVtUyReuFAMisDvl/3KW3rcsa80=; b=lYlIeyvvQJnA1bptLWw7zNG6IQ
 rAAUOeOm3mhKhtbhOEjEk2pOidgQ0F1PAuuT2a/n01Lt1rylIV7D722nhKZx8EpSERATiEvv8HHuP
 k1+LwMyjW1tfFG9ywn0dOjHNFmvBokfqcSAzX4OzLdtvJq5nFVeX8085JlEWkh+8iyyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cOTJYjkBLnwjV/lxEVtUyReuFAMisDvl/3KW3rcsa80=; b=UJ8l9n5g0mVqWgbV/TRNEZnP70
 o4R3V5snq+Il9TMf5rViag3bSphlf+lTeqtGDz4C+7eojzfjLJWUQlq+6oZd/9cXgzYT982NeJc1c
 sNjNdshjipHhzPy1C6nh118t/9pe7pfF7+xQE3AM5SLOxTnc24tEGxyRaqPd1CwasOf4=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTJbI-00Gswx-JZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 10:06:06 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48E552031C;
 Tue,  8 Aug 2023 10:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691489158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cOTJYjkBLnwjV/lxEVtUyReuFAMisDvl/3KW3rcsa80=;
 b=RYwrn0fdjwhhRR7l27SfhU6sEIZlfDKsRmqY6BlBC/mbMQlEPGtvhbIdRr7h8egn/oN8yh
 Oz6U9UuTleHENrCE1avR3NSOn0guqcLSLu7iBXijjb70nxn/BQDxhjUWhk7QvvA5/v4PB8
 VNLrqst7KIs78O2ejOjXiqcNSNVttFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691489158;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cOTJYjkBLnwjV/lxEVtUyReuFAMisDvl/3KW3rcsa80=;
 b=3BwMkd6c3zAZ5/EGX3xW7irKJimW+k7SoacxDa/XvD8/WW5BAqfXsGAeW7PnSgHdphBpnB
 7inqEIuyeW8nM7Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CBE0139E9;
 Tue,  8 Aug 2023 10:05:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id riV+CoYT0mRzKwAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 08 Aug 2023 10:05:58 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 9F18AA0769; Tue,  8 Aug 2023 12:05:57 +0200 (CEST)
Date: Tue, 8 Aug 2023 12:05:57 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230808100557.dowlxz2destpseqr@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-13-d1dec143a704@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-mgctime-v7-13-d1dec143a704@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 07-08-23 15:38:44,
 Jeff Layton wrote: > Enable multigrain
 timestamps, which should ensure that there is an > apparent change to the
 timestamp whenever it has been written after > being actively [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qTJbI-00Gswx-JZ
Subject: Re: [f2fs-dev] [PATCH v7 13/13] btrfs: convert to multigrain
 timestamps
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

On Mon 07-08-23 15:38:44, Jeff Layton wrote:
> Enable multigrain timestamps, which should ensure that there is an
> apparent change to the timestamp whenever it has been written after
> being actively observed via getattr.
> 
> Beyond enabling the FS_MGTIME flag, this patch eliminates
> update_time_for_write, which goes to great pains to avoid in-memory
> stores. Just have it overwrite the timestamps unconditionally.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> Acked-by: David Sterba <dsterba@suse.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/btrfs/file.c  | 24 ++++--------------------
>  fs/btrfs/super.c |  5 +++--
>  2 files changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> index d7a9ece7a40b..b9e75c9f95ac 100644
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@ -1106,25 +1106,6 @@ void btrfs_check_nocow_unlock(struct btrfs_inode *inode)
>  	btrfs_drew_write_unlock(&inode->root->snapshot_lock);
>  }
>  
> -static void update_time_for_write(struct inode *inode)
> -{
> -	struct timespec64 now, ctime;
> -
> -	if (IS_NOCMTIME(inode))
> -		return;
> -
> -	now = current_time(inode);
> -	if (!timespec64_equal(&inode->i_mtime, &now))
> -		inode->i_mtime = now;
> -
> -	ctime = inode_get_ctime(inode);
> -	if (!timespec64_equal(&ctime, &now))
> -		inode_set_ctime_to_ts(inode, now);
> -
> -	if (IS_I_VERSION(inode))
> -		inode_inc_iversion(inode);
> -}
> -
>  static int btrfs_write_check(struct kiocb *iocb, struct iov_iter *from,
>  			     size_t count)
>  {
> @@ -1156,7 +1137,10 @@ static int btrfs_write_check(struct kiocb *iocb, struct iov_iter *from,
>  	 * need to start yet another transaction to update the inode as we will
>  	 * update the inode when we finish writing whatever data we write.
>  	 */
> -	update_time_for_write(inode);
> +	if (!IS_NOCMTIME(inode)) {
> +		inode->i_mtime = inode_set_ctime_current(inode);
> +		inode_inc_iversion(inode);
> +	}
>  
>  	start_pos = round_down(pos, fs_info->sectorsize);
>  	oldsize = i_size_read(inode);
> diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
> index f1dd172d8d5b..8eda51b095c9 100644
> --- a/fs/btrfs/super.c
> +++ b/fs/btrfs/super.c
> @@ -2144,7 +2144,7 @@ static struct file_system_type btrfs_fs_type = {
>  	.name		= "btrfs",
>  	.mount		= btrfs_mount,
>  	.kill_sb	= btrfs_kill_super,
> -	.fs_flags	= FS_REQUIRES_DEV | FS_BINARY_MOUNTDATA,
> +	.fs_flags	= FS_REQUIRES_DEV | FS_BINARY_MOUNTDATA | FS_MGTIME,
>  };
>  
>  static struct file_system_type btrfs_root_fs_type = {
> @@ -2152,7 +2152,8 @@ static struct file_system_type btrfs_root_fs_type = {
>  	.name		= "btrfs",
>  	.mount		= btrfs_mount_root,
>  	.kill_sb	= btrfs_kill_super,
> -	.fs_flags	= FS_REQUIRES_DEV | FS_BINARY_MOUNTDATA | FS_ALLOW_IDMAP,
> +	.fs_flags	= FS_REQUIRES_DEV | FS_BINARY_MOUNTDATA |
> +			  FS_ALLOW_IDMAP | FS_MGTIME,
>  };
>  
>  MODULE_ALIAS_FS("btrfs");
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

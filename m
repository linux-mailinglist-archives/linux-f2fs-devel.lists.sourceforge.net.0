Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKYpOjLCd2nKkgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 20:36:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0549B8CA0F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 20:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8c8px1DW3lgM8YOAmdkuQ3nvwp0sX3Ga+xvyXV9SW9Q=; b=bBuZ9cVQLMifiCn5zpTrJcsVy4
	i+JYLZBQBxURCbwjrjxnK5SkpC9Od31pziaOAf+OP1dt+N+BGUf1z/F/w2KG/sJ1AzH6PORIA9CB9
	/T3WR0D90aPvWTdTlTQ7YS9B+0ce+9oYiIPYrbg2o95y4VvLAlmcwSgoVo49rfjIhMjI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkSNh-0003Gu-Pw;
	Mon, 26 Jan 2026 19:36:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vkSNg-0003Go-9F
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 19:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XupCy10h9sKjOhcc25+mWuB8Ndwuqvtlo6vcY/1cQQw=; b=GgC9puJl/fupSjTslUbb8MmOvg
 FF1C2uufhWJvv7yOp9YvRmEmzq13+dE/fq2JyvVFTZMMzYMic8kmvWGsezb//G3jkuQovWTEySynL
 xzJV3xkIap2zyJk9zyOsNCcYTHOruZUAmQZlB475f6im8xnrgbogo0PXD/07Lc4+4vlg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XupCy10h9sKjOhcc25+mWuB8Ndwuqvtlo6vcY/1cQQw=; b=D85NCENb3lKO+yV+WaU+8n7Ihw
 rmtsWBKt1Ks6eIdF9UqnsoXy3oFelweBvO6Hj+Co+jofIBI6JDjVG/AXN2FRRemeT035Vie0lvZxI
 tlh3onRBL8FyCWRJzJ0hOIoLgL665R5RCCKXGdWP+BSdMRH3XOKTfTZP1Jamb+8Je10A=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkSNf-0006Zf-O4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 19:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DC95160097;
 Mon, 26 Jan 2026 19:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F93EC116C6;
 Mon, 26 Jan 2026 19:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769456160;
 bh=ALq1Gxo/8AggH02FyfwCVoC1IfEhVWmA1BvvPkAj8io=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mj0lKNdbG5Tk2RnjN5uudhlr9bcfb9+ApP8lvxYZq5Lcx55Ut7MJv4S9Jksn8yQOi
 KzoB+2f98PYhvwd4kfaB4VpFjhgQaQ6pKsPtjAo0q22ENIPNsNK06TiQc13SgHnnJH
 DHiCcNCMwhzssppz5A9xUl/C1YB2Ej+26OvzPe9Uwg/bk3ocYxo9FD2ZeUCY9cxswR
 E7pehXmeClVICelOEU5eJch/tTF2QMRgkH1w4C/5yzZZqiUu6QlcTSz8h1SK5+6YZd
 7E1RcYSlyZMXySEAkAkR5RUUxGtKZbPOapqH8FY6ygSh8ZYewkMxTcJ/qwtcjp7+tq
 w4gwcCh5VVCpw==
Date: Mon, 26 Jan 2026 11:35:59 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260126193559.GU5910@frogsfrogsfrogs>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-17-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126045212.1381843-17-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 26, 2026 at 05:51:02AM +0100, Christoph Hellwig
 wrote: > Use the kernel's resizable hash table (rhashtable) to find the >
 fsverity_info. This way file systems that want to support fsverity [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vkSNf-0006Zf-O4
Subject: Re: [f2fs-dev] [PATCH 16/16] fsverity: use a hashtable to find the
 fsverity_info
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lst.de:email]
X-Rspamd-Queue-Id: 0549B8CA0F
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 05:51:02AM +0100, Christoph Hellwig wrote:
> Use the kernel's resizable hash table (rhashtable) to find the
> fsverity_info.  This way file systems that want to support fsverity don't
> have to bloat every inode in the system with an extra pointer.  The
> trade-off is that looking up the fsverity_info is a bit more expensive
> now, but the main operations are still dominated by I/O and hashing
> overhead.
> 
> The rhashtable implementations requires no external synchronization, and
> the _fast versions of the APIs provide the RCU critical sections required
> by the implementation.  Because struct fsverity_info is only removed on
> inode eviction and does not contain a reference count, there is no need
> for an extended critical section to grab a reference or validate the
> object state.  The file open path uses rhashtable_lookup_get_insert_fast,
> which can either find an existing object for the hash key or insert a
> new one in a single atomic operation, so that concurrent opens never
> allocate duplicate fsverity_info structure.  FS_IOC_ENABLE_VERITY must
> already be synchronized by a combination of i_rwsem and file system flags
> and uses rhashtable_lookup_insert_fast, which errors out on an existing
> object for the hash key as an additional safety check.
> 
> Because insertion into the hash table now happens before S_VERITY is set,
> fsverity just becomes a barrier and a flag check and doesn't have to look
> up the fsverity_info at all, so there is only a single lookup per
> ->read_folio or ->readahead invocation.  For btrfs there is an additional
> one for each bio completion, while for ext4 and f2fs the fsverity_info
> is stored in the per-I/O context and reused for the completion workqueue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me now; sorry about missing the smb_mb thing that ebiggers
caught.

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/btrfs/btrfs_inode.h       |  4 --
>  fs/btrfs/inode.c             |  3 --
>  fs/btrfs/verity.c            |  2 -
>  fs/ext4/ext4.h               |  4 --
>  fs/ext4/super.c              |  3 --
>  fs/ext4/verity.c             |  2 -
>  fs/f2fs/f2fs.h               |  3 --
>  fs/f2fs/super.c              |  3 --
>  fs/f2fs/verity.c             |  2 -
>  fs/verity/enable.c           | 30 +++++++-----
>  fs/verity/fsverity_private.h | 17 +++----
>  fs/verity/open.c             | 75 +++++++++++++++++++-----------
>  fs/verity/verify.c           |  2 +-
>  include/linux/fsverity.h     | 90 ++++++++++++------------------------
>  14 files changed, 104 insertions(+), 136 deletions(-)
> 
> diff --git a/fs/btrfs/btrfs_inode.h b/fs/btrfs/btrfs_inode.h
> index 73602ee8de3f..55c272fe5d92 100644
> --- a/fs/btrfs/btrfs_inode.h
> +++ b/fs/btrfs/btrfs_inode.h
> @@ -339,10 +339,6 @@ struct btrfs_inode {
>  
>  	struct rw_semaphore i_mmap_lock;
>  
> -#ifdef CONFIG_FS_VERITY
> -	struct fsverity_info *i_verity_info;
> -#endif
> -
>  	struct inode vfs_inode;
>  };
>  
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index 67c64efc5099..93b2ce75fb06 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -8097,9 +8097,6 @@ static void init_once(void *foo)
>  	struct btrfs_inode *ei = foo;
>  
>  	inode_init_once(&ei->vfs_inode);
> -#ifdef CONFIG_FS_VERITY
> -	ei->i_verity_info = NULL;
> -#endif
>  }
>  
>  void __cold btrfs_destroy_cachep(void)
> diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
> index c152bef71e8b..cd96fac4739f 100644
> --- a/fs/btrfs/verity.c
> +++ b/fs/btrfs/verity.c
> @@ -795,8 +795,6 @@ static int btrfs_write_merkle_tree_block(struct file *file, const void *buf,
>  }
>  
>  const struct fsverity_operations btrfs_verityops = {
> -	.inode_info_offs         = (int)offsetof(struct btrfs_inode, i_verity_info) -
> -				   (int)offsetof(struct btrfs_inode, vfs_inode),
>  	.begin_enable_verity     = btrfs_begin_enable_verity,
>  	.end_enable_verity       = btrfs_end_enable_verity,
>  	.get_verity_descriptor   = btrfs_get_verity_descriptor,
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 56112f201cac..60c549bc894e 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -1205,10 +1205,6 @@ struct ext4_inode_info {
>  #ifdef CONFIG_FS_ENCRYPTION
>  	struct fscrypt_inode_info *i_crypt_info;
>  #endif
> -
> -#ifdef CONFIG_FS_VERITY
> -	struct fsverity_info *i_verity_info;
> -#endif
>  };
>  
>  /*
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 86131f4d8718..1fb0c90c7a4b 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1484,9 +1484,6 @@ static void init_once(void *foo)
>  #ifdef CONFIG_FS_ENCRYPTION
>  	ei->i_crypt_info = NULL;
>  #endif
> -#ifdef CONFIG_FS_VERITY
> -	ei->i_verity_info = NULL;
> -#endif
>  }
>  
>  static int __init init_inodecache(void)
> diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
> index 54ae4d4a176c..e3ab3ba8799b 100644
> --- a/fs/ext4/verity.c
> +++ b/fs/ext4/verity.c
> @@ -380,8 +380,6 @@ static int ext4_write_merkle_tree_block(struct file *file, const void *buf,
>  }
>  
>  const struct fsverity_operations ext4_verityops = {
> -	.inode_info_offs	= (int)offsetof(struct ext4_inode_info, i_verity_info) -
> -				  (int)offsetof(struct ext4_inode_info, vfs_inode),
>  	.begin_enable_verity	= ext4_begin_enable_verity,
>  	.end_enable_verity	= ext4_end_enable_verity,
>  	.get_verity_descriptor	= ext4_get_verity_descriptor,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f2fcadc7a6fe..8ee8a7bc012c 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -974,9 +974,6 @@ struct f2fs_inode_info {
>  #ifdef CONFIG_FS_ENCRYPTION
>  	struct fscrypt_inode_info *i_crypt_info; /* filesystem encryption info */
>  #endif
> -#ifdef CONFIG_FS_VERITY
> -	struct fsverity_info *i_verity_info; /* filesystem verity info */
> -#endif
>  };
>  
>  static inline void get_read_extent_info(struct extent_info *ext,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index c4c225e09dc4..cd00d030edda 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -504,9 +504,6 @@ static void init_once(void *foo)
>  #ifdef CONFIG_FS_ENCRYPTION
>  	fi->i_crypt_info = NULL;
>  #endif
> -#ifdef CONFIG_FS_VERITY
> -	fi->i_verity_info = NULL;
> -#endif
>  }
>  
>  #ifdef CONFIG_QUOTA
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 628e8eafa96a..4f5230d871f7 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -278,8 +278,6 @@ static int f2fs_write_merkle_tree_block(struct file *file, const void *buf,
>  }
>  
>  const struct fsverity_operations f2fs_verityops = {
> -	.inode_info_offs	= (int)offsetof(struct f2fs_inode_info, i_verity_info) -
> -				  (int)offsetof(struct f2fs_inode_info, vfs_inode),
>  	.begin_enable_verity	= f2fs_begin_enable_verity,
>  	.end_enable_verity	= f2fs_end_enable_verity,
>  	.get_verity_descriptor	= f2fs_get_verity_descriptor,
> diff --git a/fs/verity/enable.c b/fs/verity/enable.c
> index c56c18e2605b..94c88c419054 100644
> --- a/fs/verity/enable.c
> +++ b/fs/verity/enable.c
> @@ -265,9 +265,24 @@ static int enable_verity(struct file *filp,
>  		goto rollback;
>  	}
>  
> +	/*
> +	 * Add the fsverity_info into the hash table before finishing the
> +	 * initialization so that we don't have to undo the enabling when memory
> +	 * allocation for the hash table fails.  This is safe because looking up
> +	 * the fsverity_info always first checks the S_VERITY flag on the inode,
> +	 * which will only be set at the very end of the ->end_enable_verity
> +	 * method.
> +	 */
> +	err = fsverity_set_info(vi);
> +	if (err)
> +		goto rollback;
> +
>  	/*
>  	 * Tell the filesystem to finish enabling verity on the file.
> -	 * Serialized with ->begin_enable_verity() by the inode lock.
> +	 * Serialized with ->begin_enable_verity() by the inode lock.  The file
> +	 * system needs to set the S_VERITY flag on the inode at the very end of
> +	 * the method, at which point the fsverity information can be accessed
> +	 * by other threads.
>  	 */
>  	inode_lock(inode);
>  	err = vops->end_enable_verity(filp, desc, desc_size, params.tree_size);
> @@ -275,19 +290,10 @@ static int enable_verity(struct file *filp,
>  	if (err) {
>  		fsverity_err(inode, "%ps() failed with err %d",
>  			     vops->end_enable_verity, err);
> -		fsverity_free_info(vi);
> +		fsverity_remove_info(vi);
>  	} else if (WARN_ON_ONCE(!IS_VERITY(inode))) {
> +		fsverity_remove_info(vi);
>  		err = -EINVAL;
> -		fsverity_free_info(vi);
> -	} else {
> -		/* Successfully enabled verity */
> -
> -		/*
> -		 * Readers can start using the inode's verity info immediately,
> -		 * so it can't be rolled back once set.  So don't set it until
> -		 * just after the filesystem has successfully enabled verity.
> -		 */
> -		fsverity_set_info(inode, vi);
>  	}
>  out:
>  	kfree(params.hashstate);
> diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
> index f9f3936b0a89..4d4a0a560562 100644
> --- a/fs/verity/fsverity_private.h
> +++ b/fs/verity/fsverity_private.h
> @@ -11,6 +11,7 @@
>  #define pr_fmt(fmt) "fs-verity: " fmt
>  
>  #include <linux/fsverity.h>
> +#include <linux/rhashtable.h>
>  
>  /*
>   * Implementation limit: maximum depth of the Merkle tree.  For now 8 is plenty;
> @@ -63,13 +64,14 @@ struct merkle_tree_params {
>   * fsverity_info - cached verity metadata for an inode
>   *
>   * When a verity file is first opened, an instance of this struct is allocated
> - * and a pointer to it is stored in the file's in-memory inode.  It remains
> - * until the inode is evicted.  It caches information about the Merkle tree
> - * that's needed to efficiently verify data read from the file.  It also caches
> - * the file digest.  The Merkle tree pages themselves are not cached here, but
> - * the filesystem may cache them.
> + * and a pointer to it is stored in the global hash table, indexed by the inode
> + * pointer value.  It remains alive until the inode is evicted.  It caches
> + * information about the Merkle tree that's needed to efficiently verify data
> + * read from the file.  It also caches the file digest.  The Merkle tree pages
> + * themselves are not cached here, but the filesystem may cache them.
>   */
>  struct fsverity_info {
> +	struct rhash_head rhash_head;
>  	struct merkle_tree_params tree_params;
>  	u8 root_hash[FS_VERITY_MAX_DIGEST_SIZE];
>  	u8 file_digest[FS_VERITY_MAX_DIGEST_SIZE];
> @@ -127,9 +129,8 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
>  struct fsverity_info *fsverity_create_info(struct inode *inode,
>  					   struct fsverity_descriptor *desc);
>  
> -void fsverity_set_info(struct inode *inode, struct fsverity_info *vi);
> -
> -void fsverity_free_info(struct fsverity_info *vi);
> +int fsverity_set_info(struct fsverity_info *vi);
> +void fsverity_remove_info(struct fsverity_info *vi);
>  
>  int fsverity_get_descriptor(struct inode *inode,
>  			    struct fsverity_descriptor **desc_ret);
> diff --git a/fs/verity/open.c b/fs/verity/open.c
> index 128502cf0a23..1bde8fe79b3f 100644
> --- a/fs/verity/open.c
> +++ b/fs/verity/open.c
> @@ -12,6 +12,14 @@
>  #include <linux/slab.h>
>  
>  static struct kmem_cache *fsverity_info_cachep;
> +static struct rhashtable fsverity_info_hash;
> +
> +static const struct rhashtable_params fsverity_info_hash_params = {
> +	.key_len		= sizeof_field(struct fsverity_info, inode),
> +	.key_offset		= offsetof(struct fsverity_info, inode),
> +	.head_offset		= offsetof(struct fsverity_info, rhash_head),
> +	.automatic_shrinking	= true,
> +};
>  
>  /**
>   * fsverity_init_merkle_tree_params() - initialize Merkle tree parameters
> @@ -170,6 +178,13 @@ static void compute_file_digest(const struct fsverity_hash_alg *hash_alg,
>  	desc->sig_size = sig_size;
>  }
>  
> +static void fsverity_free_info(struct fsverity_info *vi)
> +{
> +	kfree(vi->tree_params.hashstate);
> +	kvfree(vi->hash_block_verified);
> +	kmem_cache_free(fsverity_info_cachep, vi);
> +}
> +
>  /*
>   * Create a new fsverity_info from the given fsverity_descriptor (with optional
>   * appended builtin signature), and check the signature if present.  The
> @@ -241,33 +256,18 @@ struct fsverity_info *fsverity_create_info(struct inode *inode,
>  	return ERR_PTR(err);
>  }
>  
> -void fsverity_set_info(struct inode *inode, struct fsverity_info *vi)
> +int fsverity_set_info(struct fsverity_info *vi)
>  {
> -	/*
> -	 * Multiple tasks may race to set the inode's verity info pointer, so
> -	 * use cmpxchg_release().  This pairs with the smp_load_acquire() in
> -	 * fsverity_get_info().  I.e., publish the pointer with a RELEASE
> -	 * barrier so that other tasks can ACQUIRE it.
> -	 */
> -	if (cmpxchg_release(fsverity_info_addr(inode), NULL, vi) != NULL) {
> -		/* Lost the race, so free the verity info we allocated. */
> -		fsverity_free_info(vi);
> -		/*
> -		 * Afterwards, the caller may access the inode's verity info
> -		 * directly, so make sure to ACQUIRE the winning verity info.
> -		 */
> -		(void)fsverity_get_info(inode);
> -	}
> +	return rhashtable_lookup_insert_fast(&fsverity_info_hash,
> +			&vi->rhash_head, fsverity_info_hash_params);
>  }
>  
> -void fsverity_free_info(struct fsverity_info *vi)
> +struct fsverity_info *__fsverity_get_info(const struct inode *inode)
>  {
> -	if (!vi)
> -		return;
> -	kfree(vi->tree_params.hashstate);
> -	kvfree(vi->hash_block_verified);
> -	kmem_cache_free(fsverity_info_cachep, vi);
> +	return rhashtable_lookup_fast(&fsverity_info_hash, &inode,
> +			fsverity_info_hash_params);
>  }
> +EXPORT_SYMBOL_GPL(__fsverity_get_info);
>  
>  static bool validate_fsverity_descriptor(struct inode *inode,
>  					 const struct fsverity_descriptor *desc,
> @@ -352,7 +352,7 @@ int fsverity_get_descriptor(struct inode *inode,
>  
>  static int ensure_verity_info(struct inode *inode)
>  {
> -	struct fsverity_info *vi = fsverity_get_info(inode);
> +	struct fsverity_info *vi = fsverity_get_info(inode), *found;
>  	struct fsverity_descriptor *desc;
>  	int err;
>  
> @@ -369,8 +369,18 @@ static int ensure_verity_info(struct inode *inode)
>  		goto out_free_desc;
>  	}
>  
> -	fsverity_set_info(inode, vi);
> -	err = 0;
> +	/*
> +	 * Multiple tasks may race to set the inode's verity info, in which case
> +	 * we might find an existing fsverity_info in the hash table.
> +	 */
> +	found = rhashtable_lookup_get_insert_fast(&fsverity_info_hash,
> +			&vi->rhash_head, fsverity_info_hash_params);
> +	if (found) {
> +		fsverity_free_info(vi);
> +		if (IS_ERR(found))
> +			err = PTR_ERR(found);
> +	}
> +
>  out_free_desc:
>  	kfree(desc);
>  	return err;
> @@ -384,16 +394,25 @@ int __fsverity_file_open(struct inode *inode, struct file *filp)
>  }
>  EXPORT_SYMBOL_GPL(__fsverity_file_open);
>  
> +void fsverity_remove_info(struct fsverity_info *vi)
> +{
> +	rhashtable_remove_fast(&fsverity_info_hash, &vi->rhash_head,
> +			fsverity_info_hash_params);
> +	fsverity_free_info(vi);
> +}
> +
>  void fsverity_cleanup_inode(struct inode *inode)
>  {
> -	struct fsverity_info **vi_addr = fsverity_info_addr(inode);
> +	struct fsverity_info *vi = fsverity_get_info(inode);
>  
> -	fsverity_free_info(*vi_addr);
> -	*vi_addr = NULL;
> +	if (vi)
> +		fsverity_remove_info(vi);
>  }
>  
>  void __init fsverity_init_info_cache(void)
>  {
> +	if (rhashtable_init(&fsverity_info_hash, &fsverity_info_hash_params))
> +		panic("failed to initialize fsverity hash\n");
>  	fsverity_info_cachep = KMEM_CACHE_USERCOPY(
>  					fsverity_info,
>  					SLAB_RECLAIM_ACCOUNT | SLAB_PANIC,
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index 57aea5a2a0ee..75b997a936c7 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -320,7 +320,7 @@ fsverity_init_verification_context(struct fsverity_verification_context *ctx,
>  	ctx->inode = vi->inode;
>  	ctx->vi = vi;
>  	ctx->num_pending = 0;
> -	if (vi->tree_params.hash_alg->algo_id == HASH_ALGO_SHA256 &&
> +	if (ctx->vi->tree_params.hash_alg->algo_id == HASH_ALGO_SHA256 &&
>  	    sha256_finup_2x_is_optimized())
>  		ctx->max_pending = 2;
>  	else
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 1d70b270e90a..c8958971f65a 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -30,13 +30,6 @@ struct fsverity_info;
>  
>  /* Verity operations for filesystems */
>  struct fsverity_operations {
> -	/**
> -	 * The offset of the pointer to struct fsverity_info in the
> -	 * filesystem-specific part of the inode, relative to the beginning of
> -	 * the common part of the inode (the 'struct inode').
> -	 */
> -	ptrdiff_t inode_info_offs;
> -
>  	/**
>  	 * Begin enabling verity on the given file.
>  	 *
> @@ -142,40 +135,6 @@ struct fsverity_operations {
>  };
>  
>  #ifdef CONFIG_FS_VERITY
> -
> -/*
> - * Returns the address of the verity info pointer within the filesystem-specific
> - * part of the inode.  (To save memory on filesystems that don't support
> - * fsverity, a field in 'struct inode' itself is no longer used.)
> - */
> -static inline struct fsverity_info **
> -fsverity_info_addr(const struct inode *inode)
> -{
> -	VFS_WARN_ON_ONCE(inode->i_sb->s_vop->inode_info_offs == 0);
> -	return (void *)inode + inode->i_sb->s_vop->inode_info_offs;
> -}
> -
> -static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
> -{
> -	/*
> -	 * Since this function can be called on inodes belonging to filesystems
> -	 * that don't support fsverity at all, and fsverity_info_addr() doesn't
> -	 * work on such filesystems, we have to start with an IS_VERITY() check.
> -	 * Checking IS_VERITY() here is also useful to minimize the overhead of
> -	 * fsverity_active() on non-verity files.
> -	 */
> -	if (!IS_VERITY(inode))
> -		return NULL;
> -
> -	/*
> -	 * Pairs with the cmpxchg_release() in fsverity_set_info().  I.e.,
> -	 * another task may publish the inode's verity info concurrently,
> -	 * executing a RELEASE barrier.  Use smp_load_acquire() here to safely
> -	 * ACQUIRE the memory the other task published.
> -	 */
> -	return smp_load_acquire(fsverity_info_addr(inode));
> -}
> -
>  /* enable.c */
>  
>  int fsverity_ioctl_enable(struct file *filp, const void __user *arg);
> @@ -204,18 +163,6 @@ void fsverity_enqueue_verify_work(struct work_struct *work);
>  
>  #else /* !CONFIG_FS_VERITY */
>  
> -/*
> - * Provide a stub to allow code using this to compile.  All callsites should be
> - * guarded by compiler dead code elimination, and this forces a link error if
> - * not.
> - */
> -struct fsverity_info **fsverity_info_addr(const struct inode *inode);
> -
> -static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
> -{
> -	return NULL;
> -}
> -
>  /* enable.c */
>  
>  static inline int fsverity_ioctl_enable(struct file *filp,
> @@ -296,18 +243,39 @@ static inline bool fsverity_verify_page(struct fsverity_info *vi,
>   * fsverity_active() - do reads from the inode need to go through fs-verity?
>   * @inode: inode to check
>   *
> - * This checks whether the inode's verity info has been set.
> - *
> - * Filesystems call this from ->readahead() to check whether the pages need to
> - * be verified or not.  Don't use IS_VERITY() for this purpose; it's subject to
> - * a race condition where the file is being read concurrently with
> - * FS_IOC_ENABLE_VERITY completing.  (S_VERITY is set before the verity info.)
> + * This checks whether the inode's verity info has been set, and reads need
> + * to verify the verity information.
>   *
>   * Return: true if reads need to go through fs-verity, otherwise false
>   */
> -static inline bool fsverity_active(const struct inode *inode)
> +static __always_inline bool fsverity_active(const struct inode *inode)
> +{
> +	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) {
> +		/*
> +		 * This pairs with the try_cmpxchg in set_mask_bits()
> +		 * used to set the S_VERITY bit in i_flags.
> +		 */
> +		smp_mb();
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * fsverity_get_info - get fsverity information for an inode
> + * @inode: inode to operate on.
> + *
> + * This gets the fsverity_info for @inode if it exists.  Safe to call without
> + * knowin that a fsverity_info exist for @inode, including on file systems that
> + * do not support fsverity.
> + */
> +struct fsverity_info *__fsverity_get_info(const struct inode *inode);
> +static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
>  {
> -	return fsverity_get_info(inode) != NULL;
> +	if (!fsverity_active(inode))
> +		return NULL;
> +	return __fsverity_get_info(inode);
>  }
>  
>  /**
> -- 
> 2.47.3
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

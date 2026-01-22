Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DAYKE+VcmksmQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 22:23:27 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9896DB83
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 22:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPDsy6opLAu4U0RqPhfU1nMsdzzaabo2qWsLOiViVDQ=; b=Nwj4Gxoz3631/5ndb08MVflyUw
	IC2jimpmPsiJKO87ttxK2kUvccToHCX2BLpt3vPOirqYieV42vvLvqiepa/OBZ99pmic34KFoLowh
	Zq/OE+VIQoEsWEpF/7+nWU835J4lAy4kt8z6CKSIsh42LxIADtXRRYNlWJT6KO5JlZTw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj29E-0008J2-Ln;
	Thu, 22 Jan 2026 21:23:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vj29D-0008Ip-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 21:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u6U1eKs7FtDn7QuuPTXuNtn5raRia1mYlRmh+Azed8U=; b=YTTN2kmWCVxmHh+fItwlE28tWP
 fry4SCyXuLJws2KRcRIzTcig7LDhffdvixFcn52FbK0OSs70FIbhr/+/88Uj9VNZw3zI6z4pSo/JK
 GLpuRdfpgv/tGXfMaEW8Ettpk4AXyyPBuCSpf6UiRUN99FN72JJ1SopJ4T8iCINhEwyA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u6U1eKs7FtDn7QuuPTXuNtn5raRia1mYlRmh+Azed8U=; b=cOTw10FniyFyX0TaUABA5LOg9G
 tNUNYCIZkSLrMw33um34Tk8Tnbnun9A5YmNKwGppfum7ELHBNohsDgOMRDXZEq1vW7ngzRaZwULwe
 JI0e9p6hnkKswsqDqkUWUwwX/wFjp73pexlL3uOFvWWPL3aqGLjZwSyFqeNmuawuK3iE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj29D-0004cF-DE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 21:23:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C42EA601D5;
 Thu, 22 Jan 2026 21:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC3CC116C6;
 Thu, 22 Jan 2026 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769116997;
 bh=0E0Y8wsqJ+yOMAQ4nu9GNNF6bw/35ygZ2QAwswXS4vg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iYqJ0K+ugsFxKRUIYHjG1TDtiUsx2nCAdR3j72YHrTYhOk/VoYlV+xesp22IIaLdS
 1fjsWE0gmIz/0CuMxMKVWU9pVSSXgGB2UpWka+NjfLUs57nNLxoQn23TM7sAqSptUd
 xvXHIfzRq+RBLtwuI6o4mjYcC6bPzV+tNw0yUazdQGlp7NNppD3SLF3chINkB/l1Aj
 tMlYC56a/THCWlvwpx70crpYuMARDzxMtBpP9JQ/fxRYE7NsLxGOo56ggX+X+agCWy
 dcmsM9/S5ZsoH60m/cEaMLdJ9WZDqxpnWkAOFvJ1vs2Dhb+AlRqGBQu0S5989n50os
 0v2AQn9NN3jhg==
Date: Thu, 22 Jan 2026 13:23:16 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260122212316.GC5910@frogsfrogsfrogs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-4-hch@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 09:21:59AM +0100, Christoph Hellwig
 wrote: > This will make an iomap implementation of the method easier. > >
 Signed-off-by: Christoph Hellwig <hch@lst.de> Much better... Reviewed-by:
 "Darrick J. Wong" <djwong@kernel.org> 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj29D-0004cF-DE
Subject: Re: [f2fs-dev] [PATCH 03/11] fsverity: pass struct file to
 ->write_merkle_tree_block
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.964];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: ED9896DB83
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:21:59AM +0100, Christoph Hellwig wrote:
> This will make an iomap implementation of the method easier.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Much better...
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/btrfs/verity.c        | 5 +++--
>  fs/ext4/verity.c         | 6 +++---
>  fs/f2fs/verity.c         | 6 +++---
>  fs/verity/enable.c       | 9 +++++----
>  include/linux/fsverity.h | 4 ++--
>  5 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
> index a2ac3fb68bc8..e7643c22a6bf 100644
> --- a/fs/btrfs/verity.c
> +++ b/fs/btrfs/verity.c
> @@ -774,16 +774,17 @@ static struct page *btrfs_read_merkle_tree_page(struct inode *inode,
>  /*
>   * fsverity op that writes a Merkle tree block into the btree.
>   *
> - * @inode:	inode to write a Merkle tree block for
> + * @file:	file to write a Merkle tree block for
>   * @buf:	Merkle tree block to write
>   * @pos:	the position of the block in the Merkle tree (in bytes)
>   * @size:	the Merkle tree block size (in bytes)
>   *
>   * Returns 0 on success or negative error code on failure
>   */
> -static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
> +static int btrfs_write_merkle_tree_block(struct file *file, const void *buf,
>  					 u64 pos, unsigned int size)
>  {
> +	struct inode *inode = file_inode(file);
>  	loff_t merkle_pos = merkle_file_pos(inode);
>  
>  	if (merkle_pos < 0)
> diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
> index 415d9c4d8a32..2ce4cf8a1e31 100644
> --- a/fs/ext4/verity.c
> +++ b/fs/ext4/verity.c
> @@ -380,12 +380,12 @@ static struct page *ext4_read_merkle_tree_page(struct inode *inode,
>  	return folio_file_page(folio, index);
>  }
>  
> -static int ext4_write_merkle_tree_block(struct inode *inode, const void *buf,
> +static int ext4_write_merkle_tree_block(struct file *file, const void *buf,
>  					u64 pos, unsigned int size)
>  {
> -	pos += ext4_verity_metadata_pos(inode);
> +	pos += ext4_verity_metadata_pos(file_inode(file));
>  
> -	return pagecache_write(inode, buf, size, pos);
> +	return pagecache_write(file_inode(file), buf, size, pos);
>  }
>  
>  const struct fsverity_operations ext4_verityops = {
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 05b935b55216..c1c4d8044681 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -278,12 +278,12 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
>  	return folio_file_page(folio, index);
>  }
>  
> -static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
> +static int f2fs_write_merkle_tree_block(struct file *file, const void *buf,
>  					u64 pos, unsigned int size)
>  {
> -	pos += f2fs_verity_metadata_pos(inode);
> +	pos += f2fs_verity_metadata_pos(file_inode(file));
>  
> -	return pagecache_write(inode, buf, size, pos);
> +	return pagecache_write(file_inode(file), buf, size, pos);
>  }
>  
>  const struct fsverity_operations f2fs_verityops = {
> diff --git a/fs/verity/enable.c b/fs/verity/enable.c
> index 95ec42b84797..c56c18e2605b 100644
> --- a/fs/verity/enable.c
> +++ b/fs/verity/enable.c
> @@ -41,14 +41,15 @@ static int hash_one_block(const struct merkle_tree_params *params,
>  	return 0;
>  }
>  
> -static int write_merkle_tree_block(struct inode *inode, const u8 *buf,
> +static int write_merkle_tree_block(struct file *file, const u8 *buf,
>  				   unsigned long index,
>  				   const struct merkle_tree_params *params)
>  {
> +	struct inode *inode = file_inode(file);
>  	u64 pos = (u64)index << params->log_blocksize;
>  	int err;
>  
> -	err = inode->i_sb->s_vop->write_merkle_tree_block(inode, buf, pos,
> +	err = inode->i_sb->s_vop->write_merkle_tree_block(file, buf, pos,
>  							  params->block_size);
>  	if (err)
>  		fsverity_err(inode, "Error %d writing Merkle tree block %lu",
> @@ -135,7 +136,7 @@ static int build_merkle_tree(struct file *filp,
>  			err = hash_one_block(params, &buffers[level]);
>  			if (err)
>  				goto out;
> -			err = write_merkle_tree_block(inode,
> +			err = write_merkle_tree_block(filp,
>  						      buffers[level].data,
>  						      level_offset[level],
>  						      params);
> @@ -155,7 +156,7 @@ static int build_merkle_tree(struct file *filp,
>  			err = hash_one_block(params, &buffers[level]);
>  			if (err)
>  				goto out;
> -			err = write_merkle_tree_block(inode,
> +			err = write_merkle_tree_block(filp,
>  						      buffers[level].data,
>  						      level_offset[level],
>  						      params);
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index ea1ed2e6c2f9..e22cf84fe83a 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -116,7 +116,7 @@ struct fsverity_operations {
>  	/**
>  	 * Write a Merkle tree block to the given inode.
>  	 *
> -	 * @inode: the inode for which the Merkle tree is being built
> +	 * @file: the file for which the Merkle tree is being built
>  	 * @buf: the Merkle tree block to write
>  	 * @pos: the position of the block in the Merkle tree (in bytes)
>  	 * @size: the Merkle tree block size (in bytes)
> @@ -126,7 +126,7 @@ struct fsverity_operations {
>  	 *
>  	 * Return: 0 on success, -errno on failure
>  	 */
> -	int (*write_merkle_tree_block)(struct inode *inode, const void *buf,
> +	int (*write_merkle_tree_block)(struct file *file, const void *buf,
>  				       u64 pos, unsigned int size);
>  };
>  
> -- 
> 2.47.3
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

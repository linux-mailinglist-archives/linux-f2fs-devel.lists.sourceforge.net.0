Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGhGNsRqr2nzYAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 01:50:12 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C2243221
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 01:50:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cl469WkOTGLN4IocXnDhNQVdyxwo0Vc/FxJZbKZ+C1I=; b=j94GO9S3Hrdj6M7vru2AwnXOjx
	LXpfChwdewx5oSSP/RWGwr25goxBM1PkVfWaMg2DWNQfKVU3cPzsa9GiDQ1DJ2bmI5RQTfb89od7Z
	354pf9cEYtKbKyEBj2HPc0+VtASEi2TBTFQ3Y/qpFKMTXQcYOiDkxqhm9uDZb3dCu3lg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzlIW-0006id-4t;
	Tue, 10 Mar 2026 00:50:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzlIU-0006iX-OG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 00:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cM7SYRh203iorqUQwXNJAu1GC76tk712TdNw4t8aNhA=; b=S+ddr4kCWeyNNRS5OHpYYY9D+K
 3Ncnq8NWgUFeYFiEssXAW6FxfkJkCd2+WqpR6GtqR2lNNNL6SVoQVm1pg2O6NoeBkQEAUCMR8jxk4
 5IF4x9TLWUF1XOV8TYM4GYau3cRSAHpMp7pWWbnfp1kBOz0wQwoJSvVHKK/7WUfLRQuU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cM7SYRh203iorqUQwXNJAu1GC76tk712TdNw4t8aNhA=; b=Vx90Zsp5bo/ovtYgeKzqAteAxt
 1vQSh37czH5BttBu9IAU3awhyMPzAw7G9HASw0zNBUx/8i+T8Vnz1aiMGD9hcuFPZhMUAw1s0Cb19
 QQcLCAa5cQbVasHCG2GQTFA4uiebpxm9ZSvLzBxGb5bPQ0+m3BwdZzeWWmdPlzRQ04Ag=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzlIU-0006Xt-7C for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 00:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E7B8643A67;
 Tue, 10 Mar 2026 00:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD59C19423;
 Tue, 10 Mar 2026 00:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773103795;
 bh=m5e1BbgSDz/Jp6ApfzlcRflHEVyII/7PM1S61xMzj00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cuw2OQeOpgO+Knj/hmcnUNStlVQf+YgVnexAxVyuiJG9vIBXm57WxbfD1VlBf6+7L
 7SPC+tpiC3D1MhOtUHc1gXqCGIhDk/T3Dr2C58uUIkmJ7AM7cl4nQ/uvaCu2j/8zI6
 pFfzjaEd6K6ybU1M0xdA8HjZ9Ri0tw68cabtqn6hO5LZkvVYn24faqJHdLU9p68M/n
 47AydTSM3hpoU663OFWRkbaJUWE1SW5yQH0pgivzazgjGdPPWHECO6KRQSy5I4TMM5
 VEZNKGIlAg68JTLq8u7GU5zxRfA2mvx/GgRc+zSeekv8tU3pzEinoM3F0lKuvdqGQZ
 MBsz0h92GQKBA==
Date: Mon, 9 Mar 2026 17:49:55 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310004955.GY6033@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-6-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-6-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:20PM +0100, Andrey Albershteyn
 wrote: > Let filesystem iterate over hashes in the block and check if these
 are > hashes of zeroed data blocks. XFS will use this to decide [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzlIU-0006Xt-7C
Subject: Re: [f2fs-dev] [PATCH v4 05/25] fsverity: pass digest size and hash
 of the empty block to ->write
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
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: E43C2243221
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:23:20PM +0100, Andrey Albershteyn wrote:
> Let filesystem iterate over hashes in the block and check if these are
> hashes of zeroed data blocks. XFS will use this to decide if it want to
> store tree block full of these hashes.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

Seems reasonable enough to me, though we'll see when I get to the actual
users...
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/btrfs/verity.c        | 6 +++++-
>  fs/ext4/verity.c         | 4 +++-
>  fs/f2fs/verity.c         | 4 +++-
>  fs/verity/enable.c       | 4 +++-
>  include/linux/fsverity.h | 6 +++++-
>  5 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
> index 0062b3a55781..6d8d3808d75d 100644
> --- a/fs/btrfs/verity.c
> +++ b/fs/btrfs/verity.c
> @@ -773,11 +773,15 @@ static struct page *btrfs_read_merkle_tree_page(struct inode *inode,
>   * @buf:	Merkle tree block to write
>   * @pos:	the position of the block in the Merkle tree (in bytes)
>   * @size:	the Merkle tree block size (in bytes)
> + * @zero_digest:	the hash of a merkle block-sized buffer of zeroes
> + * @digest_size:	size of zero_digest, in bytes
>   *
>   * Returns 0 on success or negative error code on failure
>   */
>  static int btrfs_write_merkle_tree_block(struct file *file, const void *buf,
> -					 u64 pos, unsigned int size)
> +					 u64 pos, unsigned int size,
> +					 const u8 *zero_digest,
> +					 unsigned int digest_size)
>  {
>  	struct inode *inode = file_inode(file);
>  	loff_t merkle_pos = merkle_file_pos(inode);
> diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
> index ca61da53f313..347945ac23a4 100644
> --- a/fs/ext4/verity.c
> +++ b/fs/ext4/verity.c
> @@ -374,7 +374,9 @@ static void ext4_readahead_merkle_tree(struct inode *inode, pgoff_t index,
>  }
>  
>  static int ext4_write_merkle_tree_block(struct file *file, const void *buf,
> -					u64 pos, unsigned int size)
> +					u64 pos, unsigned int size,
> +					const u8 *zero_digest,
> +					unsigned int digest_size)
>  {
>  	pos += ext4_verity_metadata_pos(file_inode(file));
>  
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 92ebcc19cab0..b3b3e71604ac 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -270,7 +270,9 @@ static void f2fs_readahead_merkle_tree(struct inode *inode, pgoff_t index,
>  }
>  
>  static int f2fs_write_merkle_tree_block(struct file *file, const void *buf,
> -					u64 pos, unsigned int size)
> +					u64 pos, unsigned int size,
> +					const u8 *zero_digest,
> +					unsigned int digest_size)
>  {
>  	pos += f2fs_verity_metadata_pos(file_inode(file));
>  
> diff --git a/fs/verity/enable.c b/fs/verity/enable.c
> index 42dfed1ce0ce..ad4ff71d7dd9 100644
> --- a/fs/verity/enable.c
> +++ b/fs/verity/enable.c
> @@ -50,7 +50,9 @@ static int write_merkle_tree_block(struct file *file, const u8 *buf,
>  	int err;
>  
>  	err = inode->i_sb->s_vop->write_merkle_tree_block(file, buf, pos,
> -							  params->block_size);
> +							  params->block_size,
> +							  params->zero_digest,
> +							  params->digest_size);
>  	if (err)
>  		fsverity_err(inode, "Error %d writing Merkle tree block %lu",
>  			     err, index);
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index b490b2c8a393..1ca8de129323 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -124,6 +124,8 @@ struct fsverity_operations {
>  	 * @buf: the Merkle tree block to write
>  	 * @pos: the position of the block in the Merkle tree (in bytes)
>  	 * @size: the Merkle tree block size (in bytes)
> +	 * @zero_digest: the hash of a merkle block-sized buffer of zeroes
> +	 * @digest_size: size of zero_digest, in bytes
>  	 *
>  	 * This is only called between ->begin_enable_verity() and
>  	 * ->end_enable_verity().
> @@ -131,7 +133,9 @@ struct fsverity_operations {
>  	 * Return: 0 on success, -errno on failure
>  	 */
>  	int (*write_merkle_tree_block)(struct file *file, const void *buf,
> -				       u64 pos, unsigned int size);
> +				       u64 pos, unsigned int size,
> +				       const u8 *zero_digest,
> +				       unsigned int digest_size);
>  };
>  
>  #ifdef CONFIG_FS_VERITY
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

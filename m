Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCj7GCWVcmksmQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 22:22:45 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC56D6DB54
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 22:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uwDx8B1NRPmHGT9Ux2o56/y1HC//9lLoeo781Px+cU=; b=Ys0t45GXqDtFmxnVxyKbh3sH9K
	5PNwB6cATijiBz8Cj6NK+R5paLSxkbiU2DkqhTrs5XvpS8FFRIyf5NX7zud+r4SCY+VN84LomXYr8
	cEStW1UV85uyZn2NCAq73uG+BpsCAaaFSRSdBJPHyxFI8KTEyRD9NspUKzUz1N5tulY0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj28V-0001Jr-Qd;
	Thu, 22 Jan 2026 21:22:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vj28U-0001Jl-QO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 21:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kpb2uKGQq5Ha50ht5yTK3Oj+YcS6Rpf8qLdqBhrr0SA=; b=fBYs5KUOFsyXbt9IX5gvmd24iL
 iSwyV6KdI40gVA+Xviu0vrQQxzsMZ06bT4V+ekSnQ+brBh5nYIOlFam3vr4tCMTlpMqF7fxRvkJCw
 CV/8IFJQLV2bJgXzcHS/qnCFsExjpKsHILQcbszhIaBl7IQdg276E2qLJ65OfOAKmcBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kpb2uKGQq5Ha50ht5yTK3Oj+YcS6Rpf8qLdqBhrr0SA=; b=Y22UCSGYbLZOA+eshVRSeaTjsv
 Qd398NfdVo8MphJApZvBQTM3FW+dNlRPmtNi/jGRRwqaoWurSzvv9/nqtTHHExYu/cuPgMwU22Co0
 TtyPv65mxI7NNED8QYb1EsFmGUen+Vj5PzSRx1xie0G6nu5X60Bf5Byk1reWin4v0wm4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj28U-0004av-64 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 21:22:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7A83C601D9;
 Thu, 22 Jan 2026 21:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FF9C116C6;
 Thu, 22 Jan 2026 21:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769116952;
 bh=B+jnuGYgQo83TrhiEfEXS+wVSPnlTv4IH6jqS1kNwwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PtelV9A+J6P1rl+oOlYGbsHZ1fooIwtDLA3d0XEZZWPBHtbSj578s/6UAKEgNugZ0
 cBClTHW6w0IXU6JUah0jpSzRp3z0dWJCW/MYuxFeX6V2L0ug3+a1S+SKgXudxqh3Td
 qFWHU1W/15F2YIBxVD3sxAP0jm4vafSiJdUWGawkMJEc9cyIcPd9eZtAEueGlspy8F
 Ut/yCcWedetrpag13j9fULX75iJYVfUKdcKPV90id87aoc4f3jx79morkytLrwWoSi
 diRmPhYFaPwboREXO3QUmGbvUmuUXCyraEhrThedai1tvbAF0nufYNEtS3QBTN0eoU
 63NX5HmxrcMRw==
Date: Thu, 22 Jan 2026 13:22:31 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260122212231.GB5910@frogsfrogsfrogs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-3-hch@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 09:21:58AM +0100, Christoph Hellwig
 wrote: > Directly remove the fsverity_info from the hash and free it from
 > clear_inode instead of requiring file systems to handle it. > > [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj28U-0004av-64
Subject: Re: [f2fs-dev] [PATCH 02/11] fs,
 fsverity: clear out fsverity_info from common code
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
	NEURAL_HAM(-0.00)[-0.966];
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
X-Rspamd-Queue-Id: BC56D6DB54
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:21:58AM +0100, Christoph Hellwig wrote:
> Directly remove the fsverity_info from the hash and free it from
> clear_inode instead of requiring file systems to handle it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Also seems like a reasonable hoist, so
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/btrfs/inode.c         | 10 +++-------
>  fs/ext4/super.c          |  1 -
>  fs/f2fs/inode.c          |  1 -
>  fs/inode.c               |  9 +++++++++
>  fs/verity/open.c         |  3 +--
>  include/linux/fsverity.h | 26 ++------------------------
>  6 files changed, 15 insertions(+), 35 deletions(-)
> 
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index a2b5b440637e..67c64efc5099 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -34,7 +34,6 @@
>  #include <linux/sched/mm.h>
>  #include <linux/iomap.h>
>  #include <linux/unaligned.h>
> -#include <linux/fsverity.h>
>  #include "misc.h"
>  #include "ctree.h"
>  #include "disk-io.h"
> @@ -5571,11 +5570,8 @@ void btrfs_evict_inode(struct inode *inode)
>  
>  	trace_btrfs_inode_evict(inode);
>  
> -	if (!root) {
> -		fsverity_cleanup_inode(inode);
> -		clear_inode(inode);
> -		return;
> -	}
> +	if (!root)
> +		goto clear_inode;
>  
>  	fs_info = inode_to_fs_info(inode);
>  	evict_inode_truncate_pages(inode);
> @@ -5675,7 +5671,7 @@ void btrfs_evict_inode(struct inode *inode)
>  	 * to retry these periodically in the future.
>  	 */
>  	btrfs_remove_delayed_node(BTRFS_I(inode));
> -	fsverity_cleanup_inode(inode);
> +clear_inode:
>  	clear_inode(inode);
>  }
>  
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 87205660c5d0..86131f4d8718 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1527,7 +1527,6 @@ void ext4_clear_inode(struct inode *inode)
>  		EXT4_I(inode)->jinode = NULL;
>  	}
>  	fscrypt_put_encryption_info(inode);
> -	fsverity_cleanup_inode(inode);
>  }
>  
>  static struct inode *ext4_nfs_get_inode(struct super_block *sb,
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 38b8994bc1b2..ee332b994348 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -1000,7 +1000,6 @@ void f2fs_evict_inode(struct inode *inode)
>  	}
>  out_clear:
>  	fscrypt_put_encryption_info(inode);
> -	fsverity_cleanup_inode(inode);
>  	clear_inode(inode);
>  }
>  
> diff --git a/fs/inode.c b/fs/inode.c
> index 379f4c19845c..38dbdfbb09ba 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -14,6 +14,7 @@
>  #include <linux/cdev.h>
>  #include <linux/memblock.h>
>  #include <linux/fsnotify.h>
> +#include <linux/fsverity.h>
>  #include <linux/mount.h>
>  #include <linux/posix_acl.h>
>  #include <linux/buffer_head.h> /* for inode_has_buffers */
> @@ -773,6 +774,14 @@ void dump_mapping(const struct address_space *mapping)
>  
>  void clear_inode(struct inode *inode)
>  {
> +	/*
> +	 * Only IS_VERITY() inodes can have verity info, so start by checking
> +	 * for IS_VERITY() (which is faster than retrieving the pointer to the
> +	 * verity info).  This minimizes overhead for non-verity inodes.
> +	 */
> +	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
> +		fsverity_cleanup_inode(inode);
> +
>  	/*
>  	 * We have to cycle the i_pages lock here because reclaim can be in the
>  	 * process of removing the last page (in __filemap_remove_folio())
> diff --git a/fs/verity/open.c b/fs/verity/open.c
> index 2aa5eae5a540..090cb77326ee 100644
> --- a/fs/verity/open.c
> +++ b/fs/verity/open.c
> @@ -384,14 +384,13 @@ int __fsverity_file_open(struct inode *inode, struct file *filp)
>  }
>  EXPORT_SYMBOL_GPL(__fsverity_file_open);
>  
> -void __fsverity_cleanup_inode(struct inode *inode)
> +void fsverity_cleanup_inode(struct inode *inode)
>  {
>  	struct fsverity_info **vi_addr = fsverity_info_addr(inode);
>  
>  	fsverity_free_info(*vi_addr);
>  	*vi_addr = NULL;
>  }
> -EXPORT_SYMBOL_GPL(__fsverity_cleanup_inode);
>  
>  void __init fsverity_init_info_cache(void)
>  {
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 86fb1708676b..ea1ed2e6c2f9 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -179,26 +179,6 @@ int fsverity_get_digest(struct inode *inode,
>  /* open.c */
>  
>  int __fsverity_file_open(struct inode *inode, struct file *filp);
> -void __fsverity_cleanup_inode(struct inode *inode);
> -
> -/**
> - * fsverity_cleanup_inode() - free the inode's verity info, if present
> - * @inode: an inode being evicted
> - *
> - * Filesystems must call this on inode eviction to free the inode's verity info.
> - */
> -static inline void fsverity_cleanup_inode(struct inode *inode)
> -{
> -	/*
> -	 * Only IS_VERITY() inodes can have verity info, so start by checking
> -	 * for IS_VERITY() (which is faster than retrieving the pointer to the
> -	 * verity info).  This minimizes overhead for non-verity inodes.
> -	 */
> -	if (IS_VERITY(inode))
> -		__fsverity_cleanup_inode(inode);
> -	else
> -		VFS_WARN_ON_ONCE(*fsverity_info_addr(inode) != NULL);
> -}
>  
>  /* read_metadata.c */
>  
> @@ -250,10 +230,6 @@ static inline int __fsverity_file_open(struct inode *inode, struct file *filp)
>  	return -EOPNOTSUPP;
>  }
>  
> -static inline void fsverity_cleanup_inode(struct inode *inode)
> -{
> -}
> -
>  /* read_metadata.c */
>  
>  static inline int fsverity_ioctl_read_metadata(struct file *filp,
> @@ -331,4 +307,6 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> +void fsverity_cleanup_inode(struct inode *inode);
> +
>  #endif	/* _LINUX_FSVERITY_H */
> -- 
> 2.47.3
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

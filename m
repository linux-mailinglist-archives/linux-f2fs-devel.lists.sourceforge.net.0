Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEIdLIzscWl6ZAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 10:23:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D6964785
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 10:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiAYtvoWIazlpIB4HprvQalm+1m1bng1Xojc0DnnXd8=; b=jjutpvVDiHDaor4yYwOwf+6vdI
	/mxjIwRBqk9SCZ0qEYQ7hHuyELpBuKCCsG4SoSbbuKuu+ZtyP5MwAHak1cw/qRAVNmSN1RlHXo6Pw
	hBZppIwW9ykXi4PEXQEer5T13WYMzdDBnBRWT3Cn5Q+gcK81A4eKzp/wcnEB1+SnyZxM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viquM-0007jW-K2;
	Thu, 22 Jan 2026 09:23:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1viquL-0007jO-7i
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 09:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mU2Ks98F5J+AbPp8AUVSHb8mtwCciz++x0FIFFNKyxI=; b=lDwfu6YHOk/LQUTSVBdlSHAVDZ
 3Z9rslvtmNek1MBgVN7SqPCqiW5mqxOXpG+b3DeldO3ZDkGAC8auNdXOKd3YIxfT6GJ001idIRZqk
 6lGynFVFuA2hq4XqPksebJR2H+PWNXCijbHYjwR3dO0uBEspehHvZGofYzuFpfIl4GQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mU2Ks98F5J+AbPp8AUVSHb8mtwCciz++x0FIFFNKyxI=; b=mOcit9ymsLahmZOyXrUlgljZvr
 6YpulvK+N0xf+7AckHgnzfNjgm81gUFcM7o12lxRcnyyVSeyg61CUYUz6svxau+HU6SHOeVDg6GcD
 rUPOJgRdpyU9P0lB+P088CWkJ+1anKjIa5crk8EVjZawUA07SD8+a14WORdZYyghX2MY=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1viquK-0002Ab-G6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 09:23:17 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2788E5BD13;
 Thu, 22 Jan 2026 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769073785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mU2Ks98F5J+AbPp8AUVSHb8mtwCciz++x0FIFFNKyxI=;
 b=xCFSu/Zpyn+/2VG1Gp9/FliKrefPraGT574m11SLEJCk2gTW92CCpasEPDaGdxCE6eUKD2
 gWz94q7otNJHJ9lfk7lgxrUWZiyQOB521V47RJYpOaB3t0BK1qVLOsdNj1Oda81HiRhrFs
 QoX8L+Nx65Fwj9PqeF9tvwAM8YpO/Cs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769073785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mU2Ks98F5J+AbPp8AUVSHb8mtwCciz++x0FIFFNKyxI=;
 b=uAi3BOKd2uuFDcGW4kLYdDgozzz8l0JN8Hj8gGcCTdq5Pln5nu0eiERtI16C33dFYiFhe0
 zJZQKSTMfH8UuzCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769073785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mU2Ks98F5J+AbPp8AUVSHb8mtwCciz++x0FIFFNKyxI=;
 b=xCFSu/Zpyn+/2VG1Gp9/FliKrefPraGT574m11SLEJCk2gTW92CCpasEPDaGdxCE6eUKD2
 gWz94q7otNJHJ9lfk7lgxrUWZiyQOB521V47RJYpOaB3t0BK1qVLOsdNj1Oda81HiRhrFs
 QoX8L+Nx65Fwj9PqeF9tvwAM8YpO/Cs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769073785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mU2Ks98F5J+AbPp8AUVSHb8mtwCciz++x0FIFFNKyxI=;
 b=uAi3BOKd2uuFDcGW4kLYdDgozzz8l0JN8Hj8gGcCTdq5Pln5nu0eiERtI16C33dFYiFhe0
 zJZQKSTMfH8UuzCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C4BF13930;
 Thu, 22 Jan 2026 09:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DoA7InjscWnkEAAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 22 Jan 2026 09:23:04 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id AA13CA082E; Thu, 22 Jan 2026 10:15:12 +0100 (CET)
Date: Thu, 22 Jan 2026 10:15:12 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <izxwgrpegtwftqsuhv5pdodwttqsdyvzvfom3fj75msdxhjdul@yl7z3inr6fvr>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-3-hch@lst.de>
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 22-01-26 09:21:58, Christoph Hellwig wrote: > Directly
 remove the fsverity_info from the hash and free it from > clear_inode instead
 of requiring file systems to handle it. > > Signed-off-by: C [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1viquK-0002Ab-G6
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
X-Spamd-Result: default: False [-0.61 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[suse.cz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,suse.cz:email,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01D6964785
X-Rspamd-Action: no action

On Thu 22-01-26 09:21:58, Christoph Hellwig wrote:
> Directly remove the fsverity_info from the hash and free it from
> clear_inode instead of requiring file systems to handle it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

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
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

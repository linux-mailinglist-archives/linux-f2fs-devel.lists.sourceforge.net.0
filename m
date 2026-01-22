Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCQJEvjpcWkONAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 10:12:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 339DE644B1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 10:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEkWmUzSNBmvgGJI20cLziYvBZQ+l4Gri4uG7WpzqRU=; b=LXfpvYFe/j4oUyj1+gGZGtQmKN
	M9fR+xgczalJJqzm0ZYxBo4DIG37W07c7bsFKoFAFY4uvC4BR6SkysD9RlDHKwZaewcZrpv6cL05s
	chWukay/lIAWSjHW4FpWDpzdwFPleZPtaDGpEglL3hvP/tsp+iYnP6DWiV7XEgX/yHyw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viqje-0000MA-Sf;
	Thu, 22 Jan 2026 09:12:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1viqjd-0000M2-M9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 09:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qXIUvLZQSYyui9YEvQR72Ui+TDRCWzjQqAG1YFLyf8o=; b=k2RDXhQ9fdUPLcfYQ7z+JrjoYp
 hVwtJ4KaWyqhupR74GnOEbocv6q47hmjEejn7NU713EK6Z0SPBmQxFNgaIsgCCTsspPeA+RRjHHQ0
 LYR0L/8Upy5FE+6UqaA3YmFfj07TRxZPw8h1mj3IcuII5PHAFF9fbsy3nSq5nAOO4CZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qXIUvLZQSYyui9YEvQR72Ui+TDRCWzjQqAG1YFLyf8o=; b=d8CC5UqQ6hZ6Kyv1zY/FUmTd8j
 yLWZMT32viUZIwGzp8Dwhl3E5hz6nHogxSMCjz18/ewOariPPfp9JiF9oEiAm/35hF7pI2zYh34NU
 VdulmWqsmFbOP57JCF5J9xt7W37Pnq2awj1p5uUjbwb9G33hxNdH1ThJKTmg74A22Zaw=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1viqjc-0001XC-QA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 09:12:13 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3ECE4336AE;
 Thu, 22 Jan 2026 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769073121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qXIUvLZQSYyui9YEvQR72Ui+TDRCWzjQqAG1YFLyf8o=;
 b=mNxR9NTf4MNm4dbAgIYUxYrzGGFH07I6d7bJNS2ndYMO2mG3AAYP2WfBpgj0jNE0qZxUV8
 ORK4xJnPFNBW7ZQ/Ykp8QFhXnOB8B4LIrJ7w/lICoOLas5V7m9d3SyCEtHBmys0vZMqC3X
 /QViu+bOEuVk14QwPwYZi0/eAHpPE9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769073121;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qXIUvLZQSYyui9YEvQR72Ui+TDRCWzjQqAG1YFLyf8o=;
 b=vOMJteb0HVbBiAPvqH72sm3kumUeHhvPK43vzi5uy4BSaKzjVlkwALpmjtMhFTduHHDD8j
 1addyf5fC1z5z/BQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=mNxR9NTf;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=vOMJteb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769073121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qXIUvLZQSYyui9YEvQR72Ui+TDRCWzjQqAG1YFLyf8o=;
 b=mNxR9NTf4MNm4dbAgIYUxYrzGGFH07I6d7bJNS2ndYMO2mG3AAYP2WfBpgj0jNE0qZxUV8
 ORK4xJnPFNBW7ZQ/Ykp8QFhXnOB8B4LIrJ7w/lICoOLas5V7m9d3SyCEtHBmys0vZMqC3X
 /QViu+bOEuVk14QwPwYZi0/eAHpPE9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769073121;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qXIUvLZQSYyui9YEvQR72Ui+TDRCWzjQqAG1YFLyf8o=;
 b=vOMJteb0HVbBiAPvqH72sm3kumUeHhvPK43vzi5uy4BSaKzjVlkwALpmjtMhFTduHHDD8j
 1addyf5fC1z5z/BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D005136B7;
 Thu, 22 Jan 2026 09:12:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qpkUB+HpcWlkHwAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 22 Jan 2026 09:12:01 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id BF523A082E; Thu, 22 Jan 2026 10:12:00 +0100 (CET)
Date: Thu, 22 Jan 2026 10:12:00 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <psd53y2tpgmbsgry7zc6ocfujwziicvgyobbrnlzfproeqfmci@ephcwktsfanm>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-2-hch@lst.de>
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 22-01-26 09:21:57, Christoph Hellwig wrote: > Add the
 check to reject truncates of fsverity files directly to > setattr_prepare
 instead of requiring the file system to handle it. > Besides remo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: suse.cz]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1viqjc-0001XC-QA
Subject: Re: [f2fs-dev] [PATCH 01/11] fs,
 fsverity: reject size changes on fsverity files in setattr_prepare
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.com:email];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 339DE644B1
X-Rspamd-Action: no action

On Thu 22-01-26 09:21:57, Christoph Hellwig wrote:
> Add the check to reject truncates of fsverity files directly to
> setattr_prepare instead of requiring the file system to handle it.
> Besides removing boilerplate code, this also fixes the complete lack of
> such check in btrfs.
> 
> Fixes: 146054090b08 ("btrfs: initial fsverity support")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/attr.c                | 12 +++++++++++-
>  fs/ext4/inode.c          |  4 ----
>  fs/f2fs/file.c           |  4 ----
>  fs/verity/open.c         |  8 --------
>  include/linux/fsverity.h | 25 -------------------------
>  5 files changed, 11 insertions(+), 42 deletions(-)
> 
> diff --git a/fs/attr.c b/fs/attr.c
> index b9ec6b47bab2..e7d7c6d19fe9 100644
> --- a/fs/attr.c
> +++ b/fs/attr.c
> @@ -169,7 +169,17 @@ int setattr_prepare(struct mnt_idmap *idmap, struct dentry *dentry,
>  	 * ATTR_FORCE.
>  	 */
>  	if (ia_valid & ATTR_SIZE) {
> -		int error = inode_newsize_ok(inode, attr->ia_size);
> +		int error;
> +
> +		/*
> +		 * Verity files are immutable, so deny truncates.  This isn't
> +		 * covered by the open-time check because sys_truncate() takes a
> +		 * path, not an open file.
> +		 */
> +		if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
> +			return -EPERM;
> +
> +		error = inode_newsize_ok(inode, attr->ia_size);
>  		if (error)
>  			return error;
>  	}
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 0c466ccbed69..8c2ef98fa530 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -5835,10 +5835,6 @@ int ext4_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  	if (error)
>  		return error;
>  
> -	error = fsverity_prepare_setattr(dentry, attr);
> -	if (error)
> -		return error;
> -
>  	if (is_quota_modification(idmap, inode, attr)) {
>  		error = dquot_initialize(inode);
>  		if (error)
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index d7047ca6b98d..da029fed4e5a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1074,10 +1074,6 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  	if (err)
>  		return err;
>  
> -	err = fsverity_prepare_setattr(dentry, attr);
> -	if (err)
> -		return err;
> -
>  	if (unlikely(IS_IMMUTABLE(inode)))
>  		return -EPERM;
>  
> diff --git a/fs/verity/open.c b/fs/verity/open.c
> index 77b1c977af02..2aa5eae5a540 100644
> --- a/fs/verity/open.c
> +++ b/fs/verity/open.c
> @@ -384,14 +384,6 @@ int __fsverity_file_open(struct inode *inode, struct file *filp)
>  }
>  EXPORT_SYMBOL_GPL(__fsverity_file_open);
>  
> -int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr)
> -{
> -	if (attr->ia_valid & ATTR_SIZE)
> -		return -EPERM;
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(__fsverity_prepare_setattr);
> -
>  void __fsverity_cleanup_inode(struct inode *inode)
>  {
>  	struct fsverity_info **vi_addr = fsverity_info_addr(inode);
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 5bc7280425a7..86fb1708676b 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -179,7 +179,6 @@ int fsverity_get_digest(struct inode *inode,
>  /* open.c */
>  
>  int __fsverity_file_open(struct inode *inode, struct file *filp);
> -int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
>  void __fsverity_cleanup_inode(struct inode *inode);
>  
>  /**
> @@ -251,12 +250,6 @@ static inline int __fsverity_file_open(struct inode *inode, struct file *filp)
>  	return -EOPNOTSUPP;
>  }
>  
> -static inline int __fsverity_prepare_setattr(struct dentry *dentry,
> -					     struct iattr *attr)
> -{
> -	return -EOPNOTSUPP;
> -}
> -
>  static inline void fsverity_cleanup_inode(struct inode *inode)
>  {
>  }
> @@ -338,22 +331,4 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> -/**
> - * fsverity_prepare_setattr() - prepare to change a verity inode's attributes
> - * @dentry: dentry through which the inode is being changed
> - * @attr: attributes to change
> - *
> - * Verity files are immutable, so deny truncates.  This isn't covered by the
> - * open-time check because sys_truncate() takes a path, not a file descriptor.
> - *
> - * Return: 0 on success, -errno on failure
> - */
> -static inline int fsverity_prepare_setattr(struct dentry *dentry,
> -					   struct iattr *attr)
> -{
> -	if (IS_VERITY(d_inode(dentry)))
> -		return __fsverity_prepare_setattr(dentry, attr);
> -	return 0;
> -}
> -
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

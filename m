Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLOWLemUcmksmQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 22:21:45 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE976DB12
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 22:21:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9zWXEY0nXc9WDRKABLnGgZcHzHFn452CHhGGwLpsTs=; b=Duel3I7TON0/PBSvNd67bI4NG5
	BwX4fSiMriLRDlHh6R7QC8ESnnEfsp+ExQ8CKnmek3n8UXbZYD5fCACIIGne8RwK/8XEYSNqB/2VD
	XK6Yr9gKDYlI5na/8RaZvAkhH3bj2/K91sEzdVa/Cz7USLyctjxL41D/9FfNSaANg18w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj27S-0000c3-KW;
	Thu, 22 Jan 2026 21:21:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vj27R-0000bw-Jx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 21:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qb8Wif7/qnatxQQlJZ465vYw8BpMNs+EBTocCO5CnSg=; b=TrBezSZq2axCgDofw8NmM7nz0H
 e5F6ZIjVcmCfT3LLPSY/dn0Q1q0hQEKF4Hm728ZSwmBOBfq58ksgMY235EWFK0qpDDIL28ecwRt0C
 yGJpEN2w/8azOKln5lfCzoHf8S5ThmRSD6EPKOuFjI2Sapa9omaaH4MWUrRFY7XrU3Pk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qb8Wif7/qnatxQQlJZ465vYw8BpMNs+EBTocCO5CnSg=; b=LtUHSFp12tFFKQKb+pX4Z9mfKA
 U3I3J2pFQnGSWGFttj50/P+nTkLKu2L8RA4TODBuTHSrnh/FThh6jUAYYQOtVNt8623c9GLMIWYAH
 03rTo/yIbVS0EKGgE19ejIiUFq8iN0YRXhkMWKdKCXFEH8uA+2iGCtUCYwvlpr541Ql0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj27R-0004Yq-1y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 21:21:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 983A04342D;
 Thu, 22 Jan 2026 21:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BCFC116C6;
 Thu, 22 Jan 2026 21:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769116882;
 bh=HuuV2V7oQdXHpZv2p1xtrH9rIpKzASmyg1enkricVyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vH0CIJFDafluSg7UmFnP+wjTXB3u+C5rT5g6Fzh5Bi3H+8e35YmszXezwTTlhPksL
 8WxIH7HbfjYE2Y/mAGaDpnlM+ypNi1FUDuIOso3Tirt6B66U+S/ZS6qetMBTOtw4UL
 9avQGMG35wKclM34S2LK+YX86Wqw07SE1YJp95eXHsOuq75HZatUlF+9lElX5oEPzM
 ll9Q/xIg+wx2+3Fk7N5zO03sT/D0ws0naqyXinxDVz6+IxEoM2QT+9BMd30BSdyCpD
 Us+c3wHkr/4tHMAzzKnwV0Kt9d6uoc19ORrVXfsl0nltbSvLUvvDjTRIfzmbDMkiyR
 PrHGcC77U9wQA==
Date: Thu, 22 Jan 2026 13:21:21 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260122212121.GA5910@frogsfrogsfrogs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-2-hch@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 09:21:57AM +0100, Christoph Hellwig
 wrote: > Add the check to reject truncates of fsverity files directly to
 > setattr_prepare instead of requiring the file system to handle it [...] 
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
X-Headers-End: 1vj27R-0004Yq-1y
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.958];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: DAE976DB12
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:21:57AM +0100, Christoph Hellwig wrote:
> Add the check to reject truncates of fsverity files directly to
> setattr_prepare instead of requiring the file system to handle it.
> Besides removing boilerplate code, this also fixes the complete lack of
> such check in btrfs.
> 
> Fixes: 146054090b08 ("btrfs: initial fsverity support")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Seems reasonable to me.
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

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
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OFMJ9xuc2mnvgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 13:51:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D067602C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 13:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BI2xncYr6HQB2iggzp92CFczI6DzWdi6TSleQDBm+Kg=; b=go3GbhaQYUdwwCQ8u0KRqx9f8C
	VN70SKJisFAzJlOn+r1dLxvTV07A/dGHdzzMOj8XGPPfF2iqGNxQKe2yeyVkXU2Or3cb/aQX0jdlA
	UQMq3+LnsQuF/X/LMmn4RX9iSSOZ0xgVLRYTR9APSBPfggxaxMhYVK/u8H633gOyTJLI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjGdP-0001r8-2H;
	Fri, 23 Jan 2026 12:51:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vjGdO-0001r1-49
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 12:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1QBsGPkrJit1kf9T7yuiKHKiU/20fvt+4sxaGfiykE8=; b=IOAOEb7DCJ80raDlK3PtgWtxZD
 raR/EgLfADsUETUlNR7hQZPmWr4s9hHwPIwIo91QAirm3aFJMs6soC0PbU5xzO3Oz0+h301hzpuql
 nJfYF74pNN3IriQMqAFHvlU3Bx3B3QfAQ37uUumV351o59UtfE+D2fj+liVn11ytKEyE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1QBsGPkrJit1kf9T7yuiKHKiU/20fvt+4sxaGfiykE8=; b=HmjFgcL4GIWPo7u2ayO6OtX+j6
 2CjjujFy5M8l3XzpYXBawx8JGYJtlihhc7SIKu4Ij00ExYRWt88m1EkJQO8ylyApCdIElBuUlS0v2
 wX6WHImB0LEKdW1omclFGlSjqgtMRKVveOvXB2fQSnZOGxnDADImtaMpXNwkdTmq9E0g=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vjGdN-00031X-9f for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 12:51:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 91FF85BCD3;
 Fri, 23 Jan 2026 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769172682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QBsGPkrJit1kf9T7yuiKHKiU/20fvt+4sxaGfiykE8=;
 b=fpTdwRbqvOQna99fTNRXOFSn568clx9HGjKoKu2cyLdfnlPD0WU2lwZwX+0v7MCeeah1ly
 bzVrdOkBEPZs8/jIDx9Ap0CrTyPOIkFuqxy1wwwXbe+eLGL3jrvEzhacFuSTpIe4p0TUDv
 DUtOFiqfwdauAgDuMsl7MliiZWxyskg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769172682;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QBsGPkrJit1kf9T7yuiKHKiU/20fvt+4sxaGfiykE8=;
 b=bDOzmcRjS5FFeWvpRPxz/W3ac1luOvr6dDzoMzVRMPwJ5yXVC+7S1h8/TKBczsWfb6Okl9
 FpGN8I7pQBixKSAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=fpTdwRbq;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=bDOzmcRj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769172682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QBsGPkrJit1kf9T7yuiKHKiU/20fvt+4sxaGfiykE8=;
 b=fpTdwRbqvOQna99fTNRXOFSn568clx9HGjKoKu2cyLdfnlPD0WU2lwZwX+0v7MCeeah1ly
 bzVrdOkBEPZs8/jIDx9Ap0CrTyPOIkFuqxy1wwwXbe+eLGL3jrvEzhacFuSTpIe4p0TUDv
 DUtOFiqfwdauAgDuMsl7MliiZWxyskg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769172682;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QBsGPkrJit1kf9T7yuiKHKiU/20fvt+4sxaGfiykE8=;
 b=bDOzmcRjS5FFeWvpRPxz/W3ac1luOvr6dDzoMzVRMPwJ5yXVC+7S1h8/TKBczsWfb6Okl9
 FpGN8I7pQBixKSAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CC22136AA;
 Fri, 23 Jan 2026 12:51:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PHu6Espuc2lHRQAAD6G6ig
 (envelope-from <jack@suse.cz>); Fri, 23 Jan 2026 12:51:22 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 0F5E4A0A1B; Fri, 23 Jan 2026 13:51:22 +0100 (CET)
Date: Fri, 23 Jan 2026 13:51:22 +0100
From: Jan Kara <jack@suse.cz>
To: Chuck Lever <cel@kernel.org>
Message-ID: <3drnol5zeenodg22c26yswnsk3pzn4csnwdbkgmicfmk4rrpkk@neidpou4eqgb>
References: <20260122160311.1117669-1-cel@kernel.org>
 <20260122160311.1117669-2-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122160311.1117669-2-cel@kernel.org>
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
 Content preview:  On Thu 22-01-26 11:02:56, Chuck Lever wrote: > From: Chuck
 Lever <chuck.lever@oracle.com> > > Enable upper layers such as NFSD to
 retrieve
 case sensitivity > information from file systems by adding FS [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [195.135.223.131 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vjGdN-00031X-9f
Subject: Re: [f2fs-dev] [PATCH v7 01/16] fs: Add case sensitivity flags to
 file_kattr
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
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, linux-cifs@vger.kernel.org, sfrench@samba.org,
 slava@dubeyko.com, linux-ext4@vger.kernel.org, linkinjeon@kernel.org,
 sprasad@microsoft.com, frank.li@vivo.com, linux-nfs@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cel@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[32];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,suse.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	NEURAL_HAM(-0.00)[-0.310];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[suse.cz,manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2D067602C
X-Rspamd-Action: no action

On Thu 22-01-26 11:02:56, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Enable upper layers such as NFSD to retrieve case sensitivity
> information from file systems by adding FS_XFLAG_CASEFOLD and
> FS_XFLAG_CASENONPRESERVING flags.
> 
> Filesystems report case-insensitive or case-nonpreserving behavior
> by setting these flags directly in fa->fsx_xflags. The default
> (flags unset) indicates POSIX semantics: case-sensitive and
> case-preserving. These flags are read-only; userspace cannot set
> them via ioctl.
> 
> Remove struct file_kattr initialization from fileattr_fill_xflags()
> and fileattr_fill_flags(). Callers at ioctl/syscall entry points
> zero-initialize the struct themselves, which allows them to pass
> hints (flags_valid, fsx_valid) to the filesystem's ->fileattr_get()
> callback via the fa argument. Filesystem handlers that invoke these
> fill functions can now set flags directly in fa->fsx_xflags before
> calling them, without the fill functions zeroing those values.
> 
> Case sensitivity information is exported to userspace via the
> fa_xflags field in the FS_IOC_FSGETXATTR ioctl and file_getattr()
> system call.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

This scheme looks good. But AFAICT declared 'fa' needs to be zeroed-out
also in file_getattr()? Otherwise the patch looks good to me.

								Honza

> @@ -323,7 +319,7 @@ int ioctl_setflags(struct file *file, unsigned int __user *argp)
>  {
>  	struct mnt_idmap *idmap = file_mnt_idmap(file);
>  	struct dentry *dentry = file->f_path.dentry;
> -	struct file_kattr fa;
> +	struct file_kattr fa = {};
>  	unsigned int flags;
>  	int err;
>  
> @@ -355,7 +351,7 @@ int ioctl_fssetxattr(struct file *file, void __user *argp)
>  {
>  	struct mnt_idmap *idmap = file_mnt_idmap(file);
>  	struct dentry *dentry = file->f_path.dentry;
> -	struct file_kattr fa;
> +	struct file_kattr fa = {};
>  	int err;
>  
>  	err = copy_fsxattr_from_user(&fa, argp);
> @@ -434,7 +430,7 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char __user *, filename,
>  	struct filename *name __free(putname) = NULL;
>  	unsigned int lookup_flags = 0;
>  	struct file_attr fattr;
> -	struct file_kattr fa;
> +	struct file_kattr fa = {};
>  	int error;
>  
>  	BUILD_BUG_ON(sizeof(struct file_attr) < FILE_ATTR_SIZE_VER0);
> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index 59eaad774371..f0417c4d1fca 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@ -496,7 +496,7 @@ xfs_ioc_fsgetxattra(
>  	xfs_inode_t		*ip,
>  	void			__user *arg)
>  {
> -	struct file_kattr	fa;
> +	struct file_kattr	fa = {};
>  
>  	xfs_ilock(ip, XFS_ILOCK_SHARED);
>  	xfs_fill_fsxattr(ip, XFS_ATTR_FORK, &fa);
> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index f89dcfad3f8f..709de829659f 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -16,7 +16,8 @@
>  
>  /* Read-only inode flags */
>  #define FS_XFLAG_RDONLY_MASK \
> -	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR)
> +	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | \
> +	 FS_XFLAG_CASEFOLD | FS_XFLAG_CASENONPRESERVING)
>  
>  /* Flags to indicate valid value of fsx_ fields */
>  #define FS_XFLAG_VALUES_MASK \
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 66ca526cf786..919148beaa8c 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -253,6 +253,8 @@ struct file_attr {
>  #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
>  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
>  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
> +#define FS_XFLAG_CASEFOLD	0x00020000	/* case-insensitive lookups */
> +#define FS_XFLAG_CASENONPRESERVING 0x00040000	/* case not preserved */
>  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
>  
>  /* the read-only stuff doesn't really belong here, but any other place is
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

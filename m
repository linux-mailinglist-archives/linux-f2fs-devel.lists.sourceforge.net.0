Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBsxMlfAcmmxpAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 01:27:03 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FC6EC48
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 01:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duBigxH/wk4v8cM3f35IZ7ZHzpYO7mO1eQPZQ64UWvQ=; b=VTnL1q/VjQBbejc6BqEolnYQoi
	mxFlaqdevT/o8ZGKDFll/Zv0lNnRib5v8t5GLOuFSlj8FopCe0xQ7t5g4xVlWGkCtwiaAjfaau9JC
	ZaSep4+Rmkfi/l3qzk3+z1UD0Y5Ha35LGFE/XtW+XIjiRNMyRm15dqFs5KQpdayAKhPo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj50q-0005EA-1h;
	Fri, 23 Jan 2026 00:26:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vj50o-0005E3-Cc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 00:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qxSwcKh6PKG3qRybKS7V+3XSYTcP1y6/XUZ6ENJTMAQ=; b=KIVlqwdlCeBY9g9tmC187fCbLw
 T/KseSeSU86OEApj5N58slyrovkuWXSmoGy/l7vRTxqs8f+wC/RLMG31BKH/i8r+J9UKhVpVyhYMU
 FnGbcF29TBQNDz5oP2skn0dWk5jN7cQX+Wf5x9LodY18kRQXOa5l6DMxPe446BibS1L4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qxSwcKh6PKG3qRybKS7V+3XSYTcP1y6/XUZ6ENJTMAQ=; b=CXjEYkzsGuCMN+vW1qmHbAmo9p
 0jUffOl8KjTOntX6rWZgPgA2EgzqAKzYWIjjnDSFELqavE1+R0Sv7rogNC3Q1Z9IEQxXA6ot9YQxA
 ZhM/wx/uC3VWj1VOIT5PMEcfMZIdmd0mAY5RmNnrqNqGSavaBSjuKZ9KUXFZ2VTmvUXU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj50n-0003on-M5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 00:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9519060018;
 Fri, 23 Jan 2026 00:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF66C116C6;
 Fri, 23 Jan 2026 00:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769128007;
 bh=YfAXxf1cY4mpxIHAXBxlEMPMeobd0tAG5Xh8cUgRe68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sgUZWjFj8UxZ2ChZk6Og6wlP6cNdN3AVy1A3DaINVBfqqudi37G6Ax/h9H4aHnttZ
 VxxaqJkeguW43TyDiwz3QIb9/AwLqHYIJFQ2S3SUMkcnHV7u1il9CeCyhadfCXIO2W
 kXCIyEp1UPZusG031b3IWNGqsu/SWAwGjgCP558+XHHMvjhFAsn7A6EsNE0GmPyjF6
 zg280RvYUHGuhiLYpjOvN4WzN3vB2Mm0o0ph9ZdFEi3YMumUc8b0Y2wwVHk37JjNVm
 ZrqO6h+yfpWNbWwLGr/XNyxxcAiOqN8b4Flkim1K+Ijqq9bS3unUlg/xh+pZaGgUL3
 VP2yHzSNVOjGQ==
Date: Thu, 22 Jan 2026 16:26:46 -0800
To: Chuck Lever <cel@kernel.org>
Message-ID: <20260123002646.GL5945@frogsfrogsfrogs>
References: <20260122160311.1117669-1-cel@kernel.org>
 <20260122160311.1117669-2-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122160311.1117669-2-cel@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 11:02:56AM -0500, Chuck Lever wrote:
 > From: Chuck Lever <chuck.lever@oracle.com> > > Enable upper layers such
 as NFSD to retrieve case sensitivity > information from file syst [...] 
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
X-Headers-End: 1vj50n-0003on-M5
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
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
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cel@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.803];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[suse.cz,manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email]
X-Rspamd-Queue-Id: EF3FC6EC48
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:02:56AM -0500, Chuck Lever wrote:
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

In hindsight I regret not asking for the file_kattr initialization
change to be in a separate patch.

> Case sensitivity information is exported to userspace via the
> fa_xflags field in the FS_IOC_FSGETXATTR ioctl and file_getattr()
> system call.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

The UAPI changes still look ok to me.  AFAICT the file_kattr
initialization now seem like they don't zap fields to confuse
vfs_fileattr_get.

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/file_attr.c           | 12 ++++--------
>  fs/xfs/xfs_ioctl.c       |  2 +-
>  include/linux/fileattr.h |  3 ++-
>  include/uapi/linux/fs.h  |  2 ++
>  4 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 13cdb31a3e94..6e37040fc5fa 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -15,12 +15,10 @@
>   * @fa:		fileattr pointer
>   * @xflags:	FS_XFLAG_* flags
>   *
> - * Set ->fsx_xflags, ->fsx_valid and ->flags (translated xflags).  All
> - * other fields are zeroed.
> + * Set ->fsx_xflags, ->fsx_valid and ->flags (translated xflags).
>   */
>  void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags)
>  {
> -	memset(fa, 0, sizeof(*fa));
>  	fa->fsx_valid = true;
>  	fa->fsx_xflags = xflags;
>  	if (fa->fsx_xflags & FS_XFLAG_IMMUTABLE)
> @@ -46,11 +44,9 @@ EXPORT_SYMBOL(fileattr_fill_xflags);
>   * @flags:	FS_*_FL flags
>   *
>   * Set ->flags, ->flags_valid and ->fsx_xflags (translated flags).
> - * All other fields are zeroed.
>   */
>  void fileattr_fill_flags(struct file_kattr *fa, u32 flags)
>  {
> -	memset(fa, 0, sizeof(*fa));
>  	fa->flags_valid = true;
>  	fa->flags = flags;
>  	if (fa->flags & FS_SYNC_FL)
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
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

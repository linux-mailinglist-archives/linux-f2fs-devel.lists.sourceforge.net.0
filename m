Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKPNHQ6CoWkUtgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 12:37:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD381B6A8C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 12:37:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djrqxUkd8C8RDu9eJBJkjKtfIP3LWV1LFnrReXzOBu8=; b=UCMV5vOgFqSDNx/8m6JGIIA1+f
	aSNl1F/sfO6pUBCdQUtKpabHxH6xbqhV1qZaXLom9SF9zNz0uwHUszsqQ6xMcJuq83JFXpBUFkjEg
	TTSPWYrnIsJcOV2EpxeglHN6sUXZGHeTcznGbl2lzXtBinkOIk+tFoFpI7ntsFPTmakE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvwAD-0008Qz-Ka;
	Fri, 27 Feb 2026 11:37:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vvwAC-0008Qs-Gr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 11:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+X4fgpfDrgOhU4ghCol/Vq0PcVN1+Gjhbbnr6+ASR9g=; b=gozVHgyMwLFIMfZcglqZytRooR
 PEe4r4rmpojWG3nXEl41sxb2VQXoC/Quiseyj8NkiwXSI1AT6aDRVZ3YFrTDmlfslsJDZosktAFEn
 ls7XzQYzNMa7/sRkvBcI4Of0y7Z5hOAo65KowRRTyI/3xt2h0cO9IE8qAkKqMQR6GwpI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+X4fgpfDrgOhU4ghCol/Vq0PcVN1+Gjhbbnr6+ASR9g=; b=NQt4O8vvrPar+D+v7ZdtifQyWB
 cAXOm/1FOo8Usp7vIWdOO+DnrXiehu+vPN8oc3Z2wZtm0dl4x+JBHD1Xcs1bIZSkW5O6boKSZJiKJ
 mboN5MM3KwpHjMqK0YiKnAWRUDZhAVNTLWYKiP9I6ZyjNauT0R8BGSWA8TThXsEv4oQ4=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vvwAC-0000YP-H2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 11:37:45 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0EBD75BDF8;
 Fri, 27 Feb 2026 11:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772192258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+X4fgpfDrgOhU4ghCol/Vq0PcVN1+Gjhbbnr6+ASR9g=;
 b=c2bIMXxsGVcCNyiju2yLzeIwp/V2ky8hoAZ3QEUkSujc6ayuYPPmwndfsK0pdk39aznV/Z
 9XqZzv2uJ3OuAKWchUAdV0wQUeI+RzVvBsDFnYe/lX0oBX9zddeSkte0N83aAGs0uUbrEz
 YMsEpAB5/DoKnKLij0sg/MB2ixSWlBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772192258;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+X4fgpfDrgOhU4ghCol/Vq0PcVN1+Gjhbbnr6+ASR9g=;
 b=+QPFFNE9NS7JS5ZWK2muggEZJTK7QKjDAUK1Xe2Zt2LOTXZskSGdI0aw2pNmpiA8rWDcwY
 DhAigLoJ1WxbVqDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=c2bIMXxs;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=+QPFFNE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772192258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+X4fgpfDrgOhU4ghCol/Vq0PcVN1+Gjhbbnr6+ASR9g=;
 b=c2bIMXxsGVcCNyiju2yLzeIwp/V2ky8hoAZ3QEUkSujc6ayuYPPmwndfsK0pdk39aznV/Z
 9XqZzv2uJ3OuAKWchUAdV0wQUeI+RzVvBsDFnYe/lX0oBX9zddeSkte0N83aAGs0uUbrEz
 YMsEpAB5/DoKnKLij0sg/MB2ixSWlBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772192258;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+X4fgpfDrgOhU4ghCol/Vq0PcVN1+Gjhbbnr6+ASR9g=;
 b=+QPFFNE9NS7JS5ZWK2muggEZJTK7QKjDAUK1Xe2Zt2LOTXZskSGdI0aw2pNmpiA8rWDcwY
 DhAigLoJ1WxbVqDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F38963EA69;
 Fri, 27 Feb 2026 11:37:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iKlgOwGCoWnaMgAAD6G6ig
 (envelope-from <jack@suse.cz>); Fri, 27 Feb 2026 11:37:37 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id B6B21A06D4; Fri, 27 Feb 2026 12:37:33 +0100 (CET)
Date: Fri, 27 Feb 2026 12:37:33 +0100
From: Jan Kara <jack@suse.cz>
To: Chuck Lever <cel@kernel.org>
Message-ID: <6fw3nxspwmbkyyobefnxe6piza4nmpfqx5pg5btjh6zisuqie3@i22cjwsgobtj>
References: <20260217214741.1928576-1-cel@kernel.org>
 <20260217214741.1928576-3-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260217214741.1928576-3-cel@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 17-02-26 16:47:26, Chuck Lever wrote: > From: Chuck
 Lever <chuck.lever@oracle.com> > > Enable upper layers such as NFSD to
 retrieve
 case sensitivity > information from file systems by adding FS [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vvwAC-0000YP-H2
Subject: Re: [f2fs-dev] [PATCH v8 02/17] fs: Add case sensitivity flags to
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
 slava@dubeyko.com, "Darrick J. Wong" <djwong@kernel.org>,
 linux-ext4@vger.kernel.org, linkinjeon@kernel.org, sprasad@microsoft.com,
 frank.li@vivo.com, linux-nfs@vger.kernel.org,
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cel@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:djwong@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[33];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,oracle.com:email,suse.com:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	NEURAL_HAM(-0.00)[-0.985];
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
X-Rspamd-Queue-Id: BAD381B6A8C
X-Rspamd-Action: no action

On Tue 17-02-26 16:47:26, Chuck Lever wrote:
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
> Case sensitivity information is exported to userspace via the
> fa_xflags field in the FS_IOC_FSGETXATTR ioctl and file_getattr()
> system call.
> 
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/file_attr.c           | 4 ++++
>  include/linux/fileattr.h | 3 ++-
>  include/uapi/linux/fs.h  | 7 +++++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 42aa511111a0..5d9a7ed159fb 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -37,6 +37,8 @@ void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags)
>  		fa->flags |= FS_PROJINHERIT_FL;
>  	if (fa->fsx_xflags & FS_XFLAG_VERITY)
>  		fa->flags |= FS_VERITY_FL;
> +	if (fa->fsx_xflags & FS_XFLAG_CASEFOLD)
> +		fa->flags |= FS_CASEFOLD_FL;
>  }
>  EXPORT_SYMBOL(fileattr_fill_xflags);
>  
> @@ -67,6 +69,8 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 flags)
>  		fa->fsx_xflags |= FS_XFLAG_PROJINHERIT;
>  	if (fa->flags & FS_VERITY_FL)
>  		fa->fsx_xflags |= FS_XFLAG_VERITY;
> +	if (fa->flags & FS_CASEFOLD_FL)
> +		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
>  }
>  EXPORT_SYMBOL(fileattr_fill_flags);
>  
> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index 3780904a63a6..58044b598016 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -16,7 +16,8 @@
>  
>  /* Read-only inode flags */
>  #define FS_XFLAG_RDONLY_MASK \
> -	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | FS_XFLAG_VERITY)
> +	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | FS_XFLAG_VERITY | \
> +	 FS_XFLAG_CASEFOLD | FS_XFLAG_CASENONPRESERVING)
>  
>  /* Flags to indicate valid value of fsx_ fields */
>  #define FS_XFLAG_VALUES_MASK \
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 70b2b661f42c..2fa003575e8b 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -254,6 +254,13 @@ struct file_attr {
>  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
>  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
>  #define FS_XFLAG_VERITY		0x00020000	/* fs-verity enabled */
> +/*
> + * Case handling flags (read-only, cannot be set via ioctl).
> + * Default (neither set) indicates POSIX semantics: case-sensitive
> + * lookups and case-preserving storage.
> + */
> +#define FS_XFLAG_CASEFOLD	0x00040000	/* case-insensitive lookups */
> +#define FS_XFLAG_CASENONPRESERVING 0x00080000	/* case not preserved */
>  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
>  
>  /* the read-only stuff doesn't really belong here, but any other place is
> -- 
> 2.53.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

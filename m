Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO0jECCDoWkUtgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 12:42:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 863D61B6B3E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 12:42:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQCDAWHsaBhX3PJhcCAOZJDBuPF8VHRHaSZqfQCN+Pc=; b=DYbtNE9WoV9zohEWYK1zxjaI6y
	TQhuAcHeAk5L/zA70I9J5PhhlbGbsOLLRU1cg546QoX+VV4EE+HKMwDJjKtC2uvLH2H3i9EesusjR
	UDtSh2+BURm2LV89TpnNd8Ugq4Es+hWiyt+t8flqqyN5e1hkNjsVI0KWrn5GeSISogrk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvwET-0002jo-Fz;
	Fri, 27 Feb 2026 11:42:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vvwER-0002jh-JU
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 11:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qG12wiRKgOO8u6RwbR07pPBNuzGPcHJrzObmSnVBirc=; b=SgurQNNh5uNiEPlN0KkBP7ij7J
 X1byv/Bu+nnvVCCc4zfSPUkfEWdvUhLL/GThOk5wbanc8SiAYfkyKpL20xRTr6v14tZEex+nPmSvC
 agJKwKjSMzKmEosDO8TBs66cjTgCdXcO3/hC4uPNDxa2V4zrIzneUYLWh55SA/qBaIao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qG12wiRKgOO8u6RwbR07pPBNuzGPcHJrzObmSnVBirc=; b=HTcmHMxk5UgmPUA7A8XQXGubAN
 x9cjx59tQonsaRxWZczHe0NDc+e1w9BqLIWBGWGnGwGCiRpEMudFCwgd26PyZynFDx1gXqcOuijaz
 ltu0ED+/LaRASnjdslRRTgsIixXX+79ppXoUC0G4zZE3pBMqc9L8d4MePtCOJKa08nf8=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vvwEQ-0000kj-RY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 11:42:07 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6206C5BDF8;
 Fri, 27 Feb 2026 11:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772192515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qG12wiRKgOO8u6RwbR07pPBNuzGPcHJrzObmSnVBirc=;
 b=cSjyoIKIty/awpt3O32urHzlZlUQu2NaAOCW3XksWm06aD8kLLEbgmOTr5URu6RiHklbOV
 wz8Y6pd1irWDENggWsYsFyP2uZCrCML9OYgv5zcZFBrQC5o9kAf9ZWABGYuSN93xShGila
 XXe3DT7f14Wjq1L9DW+TX1hcWY9QPBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772192515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qG12wiRKgOO8u6RwbR07pPBNuzGPcHJrzObmSnVBirc=;
 b=elIMZTPm3jz519UETh+ceoCo6aCdtsSYUoDF6WEAj6aLwLnTy/GO7sekbaWUo80Br4+FkE
 Fqb1EIr3jYh3qBDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772192515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qG12wiRKgOO8u6RwbR07pPBNuzGPcHJrzObmSnVBirc=;
 b=cSjyoIKIty/awpt3O32urHzlZlUQu2NaAOCW3XksWm06aD8kLLEbgmOTr5URu6RiHklbOV
 wz8Y6pd1irWDENggWsYsFyP2uZCrCML9OYgv5zcZFBrQC5o9kAf9ZWABGYuSN93xShGila
 XXe3DT7f14Wjq1L9DW+TX1hcWY9QPBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772192515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qG12wiRKgOO8u6RwbR07pPBNuzGPcHJrzObmSnVBirc=;
 b=elIMZTPm3jz519UETh+ceoCo6aCdtsSYUoDF6WEAj6aLwLnTy/GO7sekbaWUo80Br4+FkE
 Fqb1EIr3jYh3qBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 480063EA69;
 Fri, 27 Feb 2026 11:41:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FE2REQODoWmSNwAAD6G6ig
 (envelope-from <jack@suse.cz>); Fri, 27 Feb 2026 11:41:55 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 0D67EA06D4; Fri, 27 Feb 2026 12:41:55 +0100 (CET)
Date: Fri, 27 Feb 2026 12:41:55 +0100
From: Jan Kara <jack@suse.cz>
To: Chuck Lever <cel@kernel.org>
Message-ID: <ua7rmlnvbfiadpxeynekbabwqebhcop3rhaxji7s3mgnwzhhtd@frz77j6wm2eg>
References: <20260217214741.1928576-1-cel@kernel.org>
 <20260217214741.1928576-4-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260217214741.1928576-4-cel@kernel.org>
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 17-02-26 16:47:27, Chuck Lever wrote: > From: Chuck
 Lever <chuck.lever@oracle.com> > > Report FAT's case sensitivity behavior
 via the FS_XFLAG_CASEFOLD > and FS_XFLAG_CASENONPRESERVING flags. F [...]
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
X-Headers-End: 1vvwEQ-0000kj-RY
Subject: Re: [f2fs-dev] [PATCH v8 03/17] fat: Implement fileattr_get for
 case sensitivity
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,suse.cz:email,oracle.com:email,suse.com:email];
	NEURAL_HAM(-0.00)[-0.978];
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
X-Rspamd-Queue-Id: 863D61B6B3E
X-Rspamd-Action: no action

On Tue 17-02-26 16:47:27, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Report FAT's case sensitivity behavior via the FS_XFLAG_CASEFOLD
> and FS_XFLAG_CASENONPRESERVING flags. FAT filesystems are
> case-insensitive by default.
> 
> MSDOS supports a 'nocase' mount option that enables case-sensitive
> behavior; check this option when reporting case sensitivity.
> 
> VFAT long filename entries preserve case; without VFAT, only
> uppercased 8.3 short names are stored. MSDOS with 'nocase' also
> preserves case since the name-formatting code skips upcasing when
> 'nocase' is set. Check both options when reporting case preservation.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Looks good to me from general POV. It would be good to get confirmation
from FAT maintainer you've got all the corner cases of FAT configuration
right :) Anyway, feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/fat/fat.h         |  3 +++
>  fs/fat/file.c        | 22 ++++++++++++++++++++++
>  fs/fat/namei_msdos.c |  1 +
>  fs/fat/namei_vfat.c  |  1 +
>  4 files changed, 27 insertions(+)
> 
> diff --git a/fs/fat/fat.h b/fs/fat/fat.h
> index 0d269dba897b..c5bcd1063f9c 100644
> --- a/fs/fat/fat.h
> +++ b/fs/fat/fat.h
> @@ -10,6 +10,8 @@
>  #include <linux/fs_context.h>
>  #include <linux/fs_parser.h>
>  
> +struct file_kattr;
> +
>  /*
>   * vfat shortname flags
>   */
> @@ -407,6 +409,7 @@ extern void fat_truncate_blocks(struct inode *inode, loff_t offset);
>  extern int fat_getattr(struct mnt_idmap *idmap,
>  		       const struct path *path, struct kstat *stat,
>  		       u32 request_mask, unsigned int flags);
> +int fat_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
>  extern int fat_file_fsync(struct file *file, loff_t start, loff_t end,
>  			  int datasync);
>  
> diff --git a/fs/fat/file.c b/fs/fat/file.c
> index 124d9c5431c8..6823269a8604 100644
> --- a/fs/fat/file.c
> +++ b/fs/fat/file.c
> @@ -17,6 +17,7 @@
>  #include <linux/fsnotify.h>
>  #include <linux/security.h>
>  #include <linux/falloc.h>
> +#include <linux/fileattr.h>
>  #include "fat.h"
>  
>  static long fat_fallocate(struct file *file, int mode,
> @@ -396,6 +397,26 @@ void fat_truncate_blocks(struct inode *inode, loff_t offset)
>  	fat_flush_inodes(inode->i_sb, inode, NULL);
>  }
>  
> +int fat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
> +{
> +	struct msdos_sb_info *sbi = MSDOS_SB(dentry->d_sb);
> +
> +	/*
> +	 * FAT filesystems are case-insensitive by default. MSDOS
> +	 * supports a 'nocase' mount option for case-sensitive behavior.
> +	 *
> +	 * VFAT long filename entries preserve case. Without VFAT, only
> +	 * uppercased 8.3 short names are stored. MSDOS with 'nocase'
> +	 * also preserves case.
> +	 */
> +	if (!sbi->options.nocase)
> +		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
> +	if (!sbi->options.isvfat && !sbi->options.nocase)
> +		fa->fsx_xflags |= FS_XFLAG_CASENONPRESERVING;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fat_fileattr_get);
> +
>  int fat_getattr(struct mnt_idmap *idmap, const struct path *path,
>  		struct kstat *stat, u32 request_mask, unsigned int flags)
>  {
> @@ -573,5 +594,6 @@ EXPORT_SYMBOL_GPL(fat_setattr);
>  const struct inode_operations fat_file_inode_operations = {
>  	.setattr	= fat_setattr,
>  	.getattr	= fat_getattr,
> +	.fileattr_get	= fat_fileattr_get,
>  	.update_time	= fat_update_time,
>  };
> diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
> index 048c103b506a..4a3db08e51c0 100644
> --- a/fs/fat/namei_msdos.c
> +++ b/fs/fat/namei_msdos.c
> @@ -642,6 +642,7 @@ static const struct inode_operations msdos_dir_inode_operations = {
>  	.rename		= msdos_rename,
>  	.setattr	= fat_setattr,
>  	.getattr	= fat_getattr,
> +	.fileattr_get	= fat_fileattr_get,
>  	.update_time	= fat_update_time,
>  };
>  
> diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
> index 2acfe3123a72..18f4c316aa05 100644
> --- a/fs/fat/namei_vfat.c
> +++ b/fs/fat/namei_vfat.c
> @@ -1185,6 +1185,7 @@ static const struct inode_operations vfat_dir_inode_operations = {
>  	.rename		= vfat_rename2,
>  	.setattr	= fat_setattr,
>  	.getattr	= fat_getattr,
> +	.fileattr_get	= fat_fileattr_get,
>  	.update_time	= fat_update_time,
>  };
>  
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

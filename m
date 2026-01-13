Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B30D1892A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 12:50:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4CsSoSGQPhBQNH9/lqiPqhGZQ67X8lkUTKcIJ7P0Pg=; b=Zlg2Pe6EYqb59Bc9ug8oaoX19Y
	N9qkMK56jm0vUO6o7nwdalLfTUcRKIxoFDjGTGAUOa0OSuW6ib+9bsTJ8oCiPf/CwHTiz6EdOK4uU
	LMyw3+PaGUp1vzHHPoieL+Pk6M+5QKdwHu3DQDjLJgiSkij25XC8+6sjZFVZY3SW+zCA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfcug-0005F6-2q;
	Tue, 13 Jan 2026 11:50:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vfcue-0005Ez-G7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 11:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pq18dDX5CD5Cfl6Kg/C+3Qqm2uB0qsR8mSpxweaSoKk=; b=lygp6k+wvgU58N90KeSGtjbckP
 gouj4Td9GJ2hsSDjmjPdzkarH0AniUMlD5bC01tkvO3kktBUtkq/FpNAtloZCR9sdLCbQb97qdw9A
 HDAnZj+EY7NyvBQbqhVTNTZ0Vhi/fCWRBdlV3/jAIv0TM8H8LIN9Wsz3ePEaQAC30cas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pq18dDX5CD5Cfl6Kg/C+3Qqm2uB0qsR8mSpxweaSoKk=; b=TYZ7oO0f78q5cxQaXrvrgfIwcW
 qPfTgqBke3RKPuP7fFIJy+wrH6YyV6skIzZP0kKmdEpUyr+5lnfyWztG75UcVBfS6MwxrwVHmWbMD
 bu70rb8pbeLnMImN9GfS3b1NAxRmuQTs7QkXLO/+mW1cg6XVp68yyS2BLn7H8l/DpOs4=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfcud-0007Lu-GY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 11:50:16 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3AE43369C;
 Tue, 13 Jan 2026 11:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768305003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pq18dDX5CD5Cfl6Kg/C+3Qqm2uB0qsR8mSpxweaSoKk=;
 b=HFWDtQWNDhgqTP0KhX+5b4+K+WXtGVY1eXfiN1AcRlFTZbbbVV31q1CYEh+MymB6fNrLV1
 Dj5lSbjieMfL+eZUAx1yjWgYo1DzcP5/r13ww8C9Bc4JcNTTDhfBx7kbCVtOH4knZNahYx
 9mgtwBtA8tmwHOa25zjTou/Aeon7xDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768305003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pq18dDX5CD5Cfl6Kg/C+3Qqm2uB0qsR8mSpxweaSoKk=;
 b=z9fyN+rybrZSueCvrEtV2qCDIVwQ4CRduAxZZ9TClZU32CDCuB3mNhSCAqctq3iTsPzwHB
 UzIq9YKoeXB06hAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768305003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pq18dDX5CD5Cfl6Kg/C+3Qqm2uB0qsR8mSpxweaSoKk=;
 b=HFWDtQWNDhgqTP0KhX+5b4+K+WXtGVY1eXfiN1AcRlFTZbbbVV31q1CYEh+MymB6fNrLV1
 Dj5lSbjieMfL+eZUAx1yjWgYo1DzcP5/r13ww8C9Bc4JcNTTDhfBx7kbCVtOH4knZNahYx
 9mgtwBtA8tmwHOa25zjTou/Aeon7xDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768305003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pq18dDX5CD5Cfl6Kg/C+3Qqm2uB0qsR8mSpxweaSoKk=;
 b=z9fyN+rybrZSueCvrEtV2qCDIVwQ4CRduAxZZ9TClZU32CDCuB3mNhSCAqctq3iTsPzwHB
 UzIq9YKoeXB06hAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9522D3EA63;
 Tue, 13 Jan 2026 11:50:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3ahmJGsxZmm7LgAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 13 Jan 2026 11:50:03 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 41C37A08CF; Tue, 13 Jan 2026 12:50:03 +0100 (CET)
Date: Tue, 13 Jan 2026 12:50:03 +0100
From: Jan Kara <jack@suse.cz>
To: Chuck Lever <cel@kernel.org>
Message-ID: <anny6rybowuoul5frpcurykpegeo6bcy64nzx2toduckzxvjye@wf2xukl5fcsu>
References: <20260112174629.3729358-1-cel@kernel.org>
 <20260112174629.3729358-14-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112174629.3729358-14-cel@kernel.org>
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MISSING_XM_UA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[32];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RLmzfjx67n53eyz9asjm8u3pcw)];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[imap.suse.de,kernel.org,suse.cz,vger.kernel.org,lists.sourceforge.net,mail.parknet.co.jp,samsung.com,sony.com,paragon-software.com,dubeyko.com,physik.fu-berlin.de,vivo.com,mit.edu,dilger.ca,samba.org,manguebit.org,gmail.com,microsoft.com,chromium.org,oracle.com];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 12-01-26 12:46:26, Chuck Lever wrote: > From: Chuck
 Lever <chuck.lever@oracle.com> > > Upper layers such as NFSD need a way to
 query whether a > filesystem handles filenames in a case-sensitive [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vfcud-0007Lu-GY
Subject: Re: [f2fs-dev] [PATCH v3 13/16] isofs: Implement fileattr_get for
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
 adilger.kernel@dilger.ca, vira@imap.suse.de, linux-cifs@vger.kernel.org,
 sfrench@samba.org, slava@dubeyko.com, linux-ext4@vger.kernel.org,
 linkinjeon@kernel.org, sprasad@microsoft.com, frank.li@vivo.com,
 linux-nfs@vger.kernel.org, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 12-01-26 12:46:26, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Upper layers such as NFSD need a way to query whether a
> filesystem handles filenames in a case-sensitive manner so
> they can provide correct semantics to remote clients. Without
> this information, NFS exports of ISO 9660 filesystems cannot
> properly advertise their filename case behavior.
> 
> Implement isofs_fileattr_get() to report ISO 9660 case
> handling behavior. The 'check=r' (relaxed) mount option
> enables case-insensitive lookups, and this setting determines
> the value reported through the file_kattr structure. By
> default, Joliet extensions operate in relaxed mode while plain
> ISO 9660 uses strict (case-sensitive) mode. All ISO 9660
> variants are case-preserving, meaning filenames are stored
> exactly as they appear on the disc.
> 
> The callback is registered only on isofs_dir_inode_operations
> because isofs has no custom inode_operations for regular
> files, and symlinks use the generic page_symlink_inode_operations.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/isofs/dir.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
> index 09df40b612fb..717cdf726e83 100644
> --- a/fs/isofs/dir.c
> +++ b/fs/isofs/dir.c
> @@ -12,6 +12,7 @@
>   *  isofs directory handling functions
>   */
>  #include <linux/gfp.h>
> +#include <linux/fileattr.h>
>  #include "isofs.h"
>  
>  int isofs_name_translate(struct iso_directory_record *de, char *new, struct inode *inode)
> @@ -266,6 +267,15 @@ static int isofs_readdir(struct file *file, struct dir_context *ctx)
>  	return result;
>  }
>  
> +static int isofs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
> +{
> +	struct isofs_sb_info *sbi = ISOFS_SB(dentry->d_sb);
> +
> +	fa->case_insensitive = sbi->s_check == 'r';
> +	fa->case_preserving = true;
> +	return 0;
> +}
> +
>  const struct file_operations isofs_dir_operations =
>  {
>  	.llseek = generic_file_llseek,
> @@ -279,6 +289,7 @@ const struct file_operations isofs_dir_operations =
>  const struct inode_operations isofs_dir_inode_operations =
>  {
>  	.lookup = isofs_lookup,
> +	.fileattr_get = isofs_fileattr_get,
>  };
>  
>  
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

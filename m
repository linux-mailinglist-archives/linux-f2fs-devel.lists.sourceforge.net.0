Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDeMBCo+72le/AAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 12:44:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7F64712A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 12:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tf4qtAyF+/zS+jN8weSPxKqx73v35JpmEkxOo3DS1dU=; b=CvxQ6JnMp9Y7NmfufxJqeNG7EK
	ZVvYxquIJL9L4aLV7ITGk5PG50Jqwb2V2uDw7kInKLCLA6PmVjiMGe6nXp+X8Fjas5m/j8qpLLh8b
	BBLwd+oy0jfBcyj2zhUopsFNjJwY1M3CMZ9865LayIGDPaieK6BekesPSfAvjdRKuiMc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHJS6-0006GD-1D;
	Mon, 27 Apr 2026 10:44:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1wHJS3-0006G3-Ci
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 10:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7es2t5zILoUe2Xa+VUEaztNlgXB3uJkU01uqH8OQu+0=; b=Gs/Vbz2bYPi2El0x+Lw7kuUoFA
 H2clfKac0X9u4/dO6LZbCB/GwMIcP2Z6p63Qn22dVLQPFLgFtasDrIjq2x3eBs026r2eSh4e5+mKT
 +pBQSvCLQ3KqyosR+TUrTjAHw5egwmzXRI3n5WUfP0kW1ud9NPNertNzaIgXveR6GYfQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7es2t5zILoUe2Xa+VUEaztNlgXB3uJkU01uqH8OQu+0=; b=CAY1QV8HhKPTQUSZ86B5gbkwAG
 xADoEPEnep79VFZKS02W6Z1TDsASmAOVyrBY0uADqKlYUtlXQKRjwRJD9T0JEP6bY7sMvp7wHsfdz
 M31GPyDuT4yvND4VyVrEQf4X+RThZI8rmyLqaurpv9cWxvxTjM/T8REgtR9YRH8FDW1I=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wHJS2-0007Xe-84 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 10:44:31 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BE1B5BCD1;
 Mon, 27 Apr 2026 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1777286656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7es2t5zILoUe2Xa+VUEaztNlgXB3uJkU01uqH8OQu+0=;
 b=jGyfSB+007IZh5ANgTITYbICaCZ/mmpkLRGaHzvNZs2WLF2cSHpbAveyKv84KFB4G1Vv9Z
 1fuxiAoFtF+nO5YTy4KQDpY+nPGU3KmlpuIls7Qy9okLIf6OGxNp9zufvgHJkBfUD2UN1X
 SkJWXYLX6VoGcjm7j+cYrWQ67Radq/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1777286656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7es2t5zILoUe2Xa+VUEaztNlgXB3uJkU01uqH8OQu+0=;
 b=tsHzfwMgBRnW3DDcT662TObJG38GJs/vt/oMtwoSB6TP7VYJGSPodTxt0fZHmhVwyJHAyf
 8PLfeIxCQiQTuiCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=jGyfSB+0;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=tsHzfwMg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1777286656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7es2t5zILoUe2Xa+VUEaztNlgXB3uJkU01uqH8OQu+0=;
 b=jGyfSB+007IZh5ANgTITYbICaCZ/mmpkLRGaHzvNZs2WLF2cSHpbAveyKv84KFB4G1Vv9Z
 1fuxiAoFtF+nO5YTy4KQDpY+nPGU3KmlpuIls7Qy9okLIf6OGxNp9zufvgHJkBfUD2UN1X
 SkJWXYLX6VoGcjm7j+cYrWQ67Radq/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1777286656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7es2t5zILoUe2Xa+VUEaztNlgXB3uJkU01uqH8OQu+0=;
 b=tsHzfwMgBRnW3DDcT662TObJG38GJs/vt/oMtwoSB6TP7VYJGSPodTxt0fZHmhVwyJHAyf
 8PLfeIxCQiQTuiCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6EE4B593B0;
 Mon, 27 Apr 2026 10:44:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8N0NGwA+72mCKQAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 27 Apr 2026 10:44:16 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 29DBCA0AFF; Mon, 27 Apr 2026 12:44:08 +0200 (CEST)
Date: Mon, 27 Apr 2026 12:44:08 +0200
From: Jan Kara <jack@suse.cz>
To: Chuck Lever <cel@kernel.org>
Message-ID: <isfgwmd5hxjfn7dj7p54yzlhumx2hrkt3zw7fscs2ywm57g3hu@co27drpx24lq>
References: <20260424-case-sensitivity-v11-0-de5619beddaf@oracle.com>
 <20260424-case-sensitivity-v11-12-de5619beddaf@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424-case-sensitivity-v11-12-de5619beddaf@oracle.com>
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 24-04-26 21:53:14, Chuck Lever wrote: > From: Chuck
 Lever <chuck.lever@oracle.com> > > Upper layers such as NFSD need a way to
 query whether a > filesystem handles filenames in a case-sensitive [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wHJS2-0007Xe-84
Subject: Re: [f2fs-dev] [PATCH v11 12/15] isofs: Implement fileattr_get for
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
 cem@kernel.org, Roland Mainz <roland.mainz@nrubsig.org>,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
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
X-Rspamd-Queue-Id: 4A7F64712A1
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:cel@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,oracle.com:email,suse.cz:email,nrubsig.org:email];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[suse.cz,manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]

On Fri 24-04-26 21:53:14, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Upper layers such as NFSD need a way to query whether a
> filesystem handles filenames in a case-sensitive manner so
> they can provide correct semantics to remote clients. Without
> this information, NFS exports of ISO 9660 filesystems cannot
> advertise their filename case behavior.
> 
> Implement isofs_fileattr_get() to report ISO 9660 case handling
> behavior via the FS_XFLAG_CASEFOLD flag. The 'check=r' (relaxed)
> mount option enables case-insensitive lookups, and this setting
> determines the value reported. By default, Joliet extensions
> operate in relaxed mode while plain ISO 9660 uses strict
> (case-sensitive) mode. All ISO 9660 variants are case-preserving,
> meaning filenames are stored exactly as they appear on the disc.
> 
> Case handling is a superblock-wide property, so the callback
> must report the same value for every inode type. Regular files
> previously had no inode_operations; introduce
> isofs_file_inode_operations to carry the callback. Symlinks
> previously shared page_symlink_inode_operations; introduce
> isofs_symlink_inode_operations, which wires page_get_link
> alongside the callback, so that fileattr queries on a symlink
> reach the isofs implementation instead of returning
> -ENOIOCTLCMD. The flag is set in both fa->fsx_xflags and
> fa->flags so FS_IOC_FSGETXATTR and FS_IOC_GETFLAGS agree.
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

...

> @@ -281,6 +293,18 @@ const struct file_operations isofs_dir_operations =
>  const struct inode_operations isofs_dir_inode_operations =
>  {
>  	.lookup = isofs_lookup,
> +	.fileattr_get = isofs_fileattr_get,
> +};
> +
> +const struct inode_operations isofs_file_inode_operations =
> +{
> +	.fileattr_get = isofs_fileattr_get,
> +};
> +
> +const struct inode_operations isofs_symlink_inode_operations =
> +{
> +	.get_link = page_get_link,
> +	.fileattr_get = isofs_fileattr_get,
>  };

Hum, I thought casefolding is a directory attribute. At least I don't see
a big point in reporting it for regular files or symlinks (and then why not
report it for device nodes or named pipes?). So why did you decide for this
change?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

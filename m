Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A46BD1892D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 12:50:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJIShb2hchx131vLKspaHWO7406leYnuo1fkSqe6eZs=; b=W23KPik80VoYz1o/XTqRSePVaJ
	pUADP4vPIlsA8HRLr8j0V/xQS3TiBQKOXuNu6rmoNH6QmLs96XMbUPemB65R5bc03qA+/7H3Tk2Gv
	RXVEtkJBT/mniw4REXvoxFGHL8o/tto8m8eRFJmUTA6ivTK2i/gx4kTnvco8RrULDRmo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfcuu-0001xo-Md;
	Tue, 13 Jan 2026 11:50:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vfcut-0001xW-Pi
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 11:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EgNRi+aV6jB9u6bCyM5aaBQD8Pz1HwmkA+frhGt+2U8=; b=JtGayESgwh2F0luBCJXBVJXaLm
 nPYCVAqk3+K7fKC51hqO1e9R1cwmsjQK7+63U3B9b7etvjQiZYMJ3tvXmU8ddaeBbPdwLgnxHU163
 0R75xWu9YfaMURReSFHcWdHnBlU1thcR6nHSVIHHTt3LJFvJMSHnH4GIA4Pwrz389jC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EgNRi+aV6jB9u6bCyM5aaBQD8Pz1HwmkA+frhGt+2U8=; b=IUJiHPpmbpUsRQcWcte+nDVeAZ
 FuUOqyw8HlIp8r8NL3eZlc6U9ROUIzXXwYPbvSxFxVwkDpTdYAPQjuHahuP9dqGEM3pB8soaP935F
 Q9A+3xmDUdfYrpL3csX/0cFw8pZzKogpCyRIkiSV3aBRfFLYZ1fCStIGbcqZQiItbOuk=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfcus-0007NV-7U for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 11:50:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C99E33684;
 Tue, 13 Jan 2026 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768305018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EgNRi+aV6jB9u6bCyM5aaBQD8Pz1HwmkA+frhGt+2U8=;
 b=ybfTbTlOs0mjZYU+kOegPaJWwwsyWdZJFvh/IhjhtlM+NswaBFD0Tcq3sXMo6UKipzVpMG
 FOEApY0GPyhr2lPsXDFcfVvt5o0XanTfz9/NW6c8E+QvjvxXUjBcPOUbL1nx8qBShfURNv
 jgrkqpn6HBCaqCUIco8/Ufm4pyyN7Co=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768305018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EgNRi+aV6jB9u6bCyM5aaBQD8Pz1HwmkA+frhGt+2U8=;
 b=WR78M5pVO0K7T2BZI6ht+0pgqH5o/ONc4tEDfRjHT2gRrEdfy2XRdboRvibOPeAsXlQzdJ
 lPGJ8C+NLCo8x1Aw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=ybfTbTlO;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=WR78M5pV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768305018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EgNRi+aV6jB9u6bCyM5aaBQD8Pz1HwmkA+frhGt+2U8=;
 b=ybfTbTlOs0mjZYU+kOegPaJWwwsyWdZJFvh/IhjhtlM+NswaBFD0Tcq3sXMo6UKipzVpMG
 FOEApY0GPyhr2lPsXDFcfVvt5o0XanTfz9/NW6c8E+QvjvxXUjBcPOUbL1nx8qBShfURNv
 jgrkqpn6HBCaqCUIco8/Ufm4pyyN7Co=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768305018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EgNRi+aV6jB9u6bCyM5aaBQD8Pz1HwmkA+frhGt+2U8=;
 b=WR78M5pVO0K7T2BZI6ht+0pgqH5o/ONc4tEDfRjHT2gRrEdfy2XRdboRvibOPeAsXlQzdJ
 lPGJ8C+NLCo8x1Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EC433EA63;
 Tue, 13 Jan 2026 11:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7oscF3oxZmnSLgAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 13 Jan 2026 11:50:18 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 27F84A08CF; Tue, 13 Jan 2026 12:50:18 +0100 (CET)
Date: Tue, 13 Jan 2026 12:50:18 +0100
From: Jan Kara <jack@suse.cz>
To: Chuck Lever <cel@kernel.org>
Message-ID: <76zoosya47hgvau4bajvpqupogjpbx5wtljtwltp7pzggkyj7m@lco5on2kmf7g>
References: <20260112174629.3729358-1-cel@kernel.org>
 <20260112174629.3729358-8-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112174629.3729358-8-cel@kernel.org>
X-Spam-Score: -4.01
X-Spamd-Result: default: False [-4.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_THREE(0.00)[3]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[32]; RCVD_TLS_LAST(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLa77mm4gi8mw7uppieotozii3)];
 MISSING_XM_UA(0.00)[];
 FREEMAIL_CC(0.00)[imap.suse.de,kernel.org,suse.cz,vger.kernel.org,lists.sourceforge.net,mail.parknet.co.jp,samsung.com,sony.com,paragon-software.com,dubeyko.com,physik.fu-berlin.de,vivo.com,mit.edu,dilger.ca,samba.org,manguebit.org,gmail.com,microsoft.com,chromium.org,oracle.com];
 DKIM_TRACE(0.00)[suse.cz:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,suse.com:email]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6C99E33684
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 12-01-26 12:46:20, Chuck Lever wrote: > From: Chuck
 Lever <chuck.lever@oracle.com> > > Report ext4's case sensitivity behavior
 via file_kattr boolean > fields. ext4 always preserves case at res [...] 
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
X-Headers-End: 1vfcus-0007NV-7U
Subject: Re: [f2fs-dev] [PATCH v3 07/16] ext4: Report case sensitivity in
 fileattr_get
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

On Mon 12-01-26 12:46:20, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Report ext4's case sensitivity behavior via file_kattr boolean
> fields. ext4 always preserves case at rest.
> 
> Case sensitivity is a per-directory setting in ext4. If the queried
> inode is a casefolded directory, report case-insensitive; otherwise
> report case-sensitive (standard POSIX behavior).
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/ioctl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
> index 7ce0fc40aec2..653035017c7f 100644
> --- a/fs/ext4/ioctl.c
> +++ b/fs/ext4/ioctl.c
> @@ -996,6 +996,14 @@ int ext4_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
>  	if (ext4_has_feature_project(inode->i_sb))
>  		fa->fsx_projid = from_kprojid(&init_user_ns, ei->i_projid);
>  
> +	/*
> +	 * ext4 always preserves case. If this inode is a casefolded
> +	 * directory, report case-insensitive; otherwise report
> +	 * case-sensitive (standard POSIX behavior).
> +	 */
> +	fa->case_insensitive = IS_CASEFOLDED(inode);
> +	fa->case_preserving = true;
> +
>  	return 0;
>  }
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

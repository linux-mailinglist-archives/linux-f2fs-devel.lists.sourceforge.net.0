Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC0ED3A265
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 10:06:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XS+akO0luKAGNqRSHAHMJdyEn+knx9lB/zS5b1V0E2E=; b=Pvo8s7lbwNdEsbzjORU+ulzJ+K
	5h0BWzDFjd7X/Ua3TP6paBpI/Vr9ydbu8Ex/wtosZtE25zoiTf9MguAXP3GduqM5K5WLwPEGuk6QI
	nkBNS0I3p/6+LDCsjoKcYBXGCa6sDG7Fh29ky2PmmLOniRlapaPSFemBigN7l4kZpzN8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhlD5-00055P-Gk;
	Mon, 19 Jan 2026 09:06:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vhlD2-00055I-WE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 09:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WV7bGoR2PRO6j4igxWjiYheWWlYULse5GUTsUYL8BDk=; b=mxs6E4+VzDDU3vn5nZFk8yyVk7
 Frt3hX2Uit4IizbagFxo1APPLXddMQAY7OvSzdQzcduLCacht/BaO0W6gCw7yMr1sIvoO3AixJIGF
 jTYoGD0I34GcCg+KXmgDbifbYjbhbS7MLWh/zyWRQWpqVWJcwUtj0ACRcz3bh+8I0YRI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WV7bGoR2PRO6j4igxWjiYheWWlYULse5GUTsUYL8BDk=; b=iMpJS2o7jdYGbHH7TVLLM5oRQ3
 uV07E2xfOmIzSGJX5/GrpuqDgXNi8zpHDYH9/Go9G8szVqRiX+zkzeZ/hZP9POtcnWOLwlxYMf9yK
 DMlYXqmGitR/huQEI3MXDnUNIKD+quMHT9IiQdAEoZ4Nix6UCMi57dbQi3tvOrH8Usxk=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vhlD1-0007cB-Bd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 09:06:04 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AAEEB5BD21;
 Mon, 19 Jan 2026 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768813556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WV7bGoR2PRO6j4igxWjiYheWWlYULse5GUTsUYL8BDk=;
 b=pqm1FT36/jm6jURdU2bqiIqexQSvOfmfk8LpRJfM36fns+qDwJ+Bg6bgf4NGPPbKGdsi3M
 VtZHH3Td34t18FkNA03XtaX6NgiqhiZdlcj/0XhtZT+6ST64FEImwouEw0TAwBjhBJPR6m
 0wt3rJBWJaZFCUfhi3E6x0PFg/T6nsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768813556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WV7bGoR2PRO6j4igxWjiYheWWlYULse5GUTsUYL8BDk=;
 b=2qBvuQr+goPfaZg7KcDtjGzpWjwhz0o/abKRUT0ku2GkTCi9ZLDZ8J4N+yMb4BZ/jgPkMh
 qozwGmwu1O0GnAAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=pqm1FT36;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=2qBvuQr+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768813556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WV7bGoR2PRO6j4igxWjiYheWWlYULse5GUTsUYL8BDk=;
 b=pqm1FT36/jm6jURdU2bqiIqexQSvOfmfk8LpRJfM36fns+qDwJ+Bg6bgf4NGPPbKGdsi3M
 VtZHH3Td34t18FkNA03XtaX6NgiqhiZdlcj/0XhtZT+6ST64FEImwouEw0TAwBjhBJPR6m
 0wt3rJBWJaZFCUfhi3E6x0PFg/T6nsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768813556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WV7bGoR2PRO6j4igxWjiYheWWlYULse5GUTsUYL8BDk=;
 b=2qBvuQr+goPfaZg7KcDtjGzpWjwhz0o/abKRUT0ku2GkTCi9ZLDZ8J4N+yMb4BZ/jgPkMh
 qozwGmwu1O0GnAAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FB4A3EA63;
 Mon, 19 Jan 2026 09:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MD76JvTzbWnZOwAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 19 Jan 2026 09:05:56 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 67C91A0A29; Mon, 19 Jan 2026 10:05:56 +0100 (CET)
Date: Mon, 19 Jan 2026 10:05:56 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <tn4evey6q4ktzfu4vd2fmaz5j233cigw2grnyvzc4cnholsolb@z44vyuenknkl>
References: <20260119062250.3998674-1-hch@lst.de>
 <20260119062250.3998674-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119062250.3998674-4-hch@lst.de>
X-Spam-Score: -4.01
X-Spamd-Result: default: False [-4.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15]; MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_THREE(0.00)[3];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.cz:dkim];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_LAST(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: AAEEB5BD21
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 19-01-26 07:22:44, Christoph Hellwig wrote: > Call
 into fsverity_file_open from generic_file_open instead of requiring > the
 file system to handle it explicitly. > > Signed-off-by: Christoph He [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vhlD1-0007cB-Bd
Subject: Re: [f2fs-dev] [PATCH 3/6] fs,
 fsverity: handle fsverity in generic_file_open
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
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 19-01-26 07:22:44, Christoph Hellwig wrote:
> Call into fsverity_file_open from generic_file_open instead of requiring
> the file system to handle it explicitly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
...
> -int generic_file_open(struct inode * inode, struct file * filp)
> +int generic_file_open(struct inode *inode, struct file *filp)
>  {
>  	if (!(filp->f_flags & O_LARGEFILE) && i_size_read(inode) > MAX_NON_LFS)
>  		return -EOVERFLOW;
> +	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) {
> +		if (filp->f_mode & FMODE_WRITE)
> +			return -EPERM;
> +		return fsverity_file_open(inode, filp);
> +	}

Why do you check f_mode here when fsverity_file_open() checks for it as
well?

> -int __fsverity_file_open(struct inode *inode, struct file *filp)
> +/*
> + * When opening a verity file, deny the open if it is for writing.  Otherwise,
> + * set up the inode's verity info if not already done.
> + *
> + * When combined with fscrypt, this must be called after fscrypt_file_open().
> + * Otherwise, we won't have the key set up to decrypt the verity metadata.
> + */
> +int fsverity_file_open(struct inode *inode, struct file *filp)
>  {
>  	if (filp->f_mode & FMODE_WRITE)
>  		return -EPERM;
>  	return ensure_verity_info(inode);
>  }
> -EXPORT_SYMBOL_GPL(__fsverity_file_open);

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

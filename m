Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHHeJZpcd2maeQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 13:22:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C82708826A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 13:22:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZV03qW6cBqM38q0qeKkH0iGXoRVJI6KjXUeIkFMnGY=; b=gZfDnNdrqFFMoRsiiL0zS6EUku
	SG2QRAb7amS882tGs+2WIdkPe/mrzhSdwPFVthe3LTL5OClFno/hVgmdJ1Rq6wfvhCpvul566Y3tE
	c+iYFByydVFX52hwEANyKgzhjCUmH+IHEXYx+NEy/bNEt7UujvFNitxk8JdYP9SjWEiQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkLc0-0000Nm-HO;
	Mon, 26 Jan 2026 12:22:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vkLby-0000Nc-J3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 12:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XLK1XBcRKQJ5+EygseMZc3MfbkeMPZUxQu+WfGHZ1r8=; b=BPg9/rx7Lf6pRbmXQ+BU0JA5P2
 jMUsm3a4ZwWGVGxAcfAnbPj4zYCoCd79kssSGog3l1cKpgJyySNZFQDq4cLT+7zVpEAqyvS4N7Fup
 lPiFGvNN8MAbB1Y18WVPLYUCy16kLdgNDlIgbRinuMFOIC6CnwD+Vy47Nu7WJwEXyz3w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XLK1XBcRKQJ5+EygseMZc3MfbkeMPZUxQu+WfGHZ1r8=; b=jIU2z72/Zvy+iECipf8HALObEx
 r95pMCHmgIFy5LaEMH7IfC5QHijvaM0UsxijJ0FHyoxNZMre8IFSxPP3CidPCZefOLMWBnuzTFWka
 qVICYs0GQqqn3MZ4pIUU+rXCjn4lH7p98bUJnMzMEdoBf3ycVvY5dh58bMc/9kMqymuU=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vkLbx-0002V4-R3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 12:22:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D973833707;
 Mon, 26 Jan 2026 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769430138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XLK1XBcRKQJ5+EygseMZc3MfbkeMPZUxQu+WfGHZ1r8=;
 b=uzguEx/c1NB9HIbf6dlkv9sq5b+MRYYlZMrc6AP0m5cAaQI6RvBrBsK7S/iDaqTXFYu5d0
 vbaRjYTJrgdX82RdWCsGQrlj6a10D44TvCG1cUMTZpJfvKd5r2TOEsHNrnoeIev4ir1rPA
 h7Xp0JNVwA4WymDmOF34lsYN4CK/Cj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769430138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XLK1XBcRKQJ5+EygseMZc3MfbkeMPZUxQu+WfGHZ1r8=;
 b=Roe7cxTERHwk7aeETdABWWys3eYFhd4Ft5oBBxfbvx7moS9nNqi0LJYEEd/UmYGO2c8cse
 0qd2bjtmt3X/pRBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=0ayVdLJn;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=17nEggQQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769430137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XLK1XBcRKQJ5+EygseMZc3MfbkeMPZUxQu+WfGHZ1r8=;
 b=0ayVdLJncgowm9/fbhNwe1TbFR8oW3/TSoCb6pQWI0KwM8jG3XXJc93VTt3fLnx/20qZem
 DPFpeiMHJhh6WrGon2VupMHD5P3pHNUachVe+4IQb1Uc1cuZ/V0GLhvAW3WZnAAkoMnSaw
 7vrJJgjUt8iCR+KqJfpx1udih4HwMm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769430137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XLK1XBcRKQJ5+EygseMZc3MfbkeMPZUxQu+WfGHZ1r8=;
 b=17nEggQQPUCQlB3yIcK+KJaN51xDVxWj4RFIrAnquVrU9XLSGGU9pLTQAJmLHp5KHnJomy
 AdfcVMbHW2EdELBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C072B139F0;
 Mon, 26 Jan 2026 12:22:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lwjzLnlcd2nSDAAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 26 Jan 2026 12:22:17 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 75F78A0A4F; Mon, 26 Jan 2026 13:22:17 +0100 (CET)
Date: Mon, 26 Jan 2026 13:22:17 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <sxtvrsol43ygrpxdxxu6uecpfrtdzs2ryfvbxituivi5htg5ms@decdqt7bjgcx>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126045212.1381843-4-hch@lst.de>
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
 Content preview:  On Mon 26-01-26 05:50:49,
 Christoph Hellwig wrote: > Use IS_ENABLED
 to disable this code, leading to a slight size reduction: > > text data bss
 dec hex filename > 4121 376 16 4513 11a1 fs/ext4/readpag [...] 
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
X-Headers-End: 1vkLbx-0002V4-R3
Subject: Re: [f2fs-dev] [PATCH 03/16] ext4: don't build the fsverity work
 handler for !CONFIG_FS_VERITY
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lst.de:email,suse.cz:email,suse.com:email];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C82708826A
X-Rspamd-Action: no action

On Mon 26-01-26 05:50:49, Christoph Hellwig wrote:
> Use IS_ENABLED to disable this code, leading to a slight size reduction:
> 
>    text	   data	    bss	    dec	    hex	filename
>    4121	    376	     16	   4513	   11a1	fs/ext4/readpage.o.old
>    4030	    328	     16	   4374	   1116	fs/ext4/readpage.o
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/readpage.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index e7f2350c725b..267594ef0b2c 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -130,7 +130,8 @@ static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
>  		ctx->cur_step++;
>  		fallthrough;
>  	case STEP_VERITY:
> -		if (ctx->enabled_steps & (1 << STEP_VERITY)) {
> +		if (IS_ENABLED(CONFIG_FS_VERITY) &&
> +		    ctx->enabled_steps & (1 << STEP_VERITY)) {
>  			INIT_WORK(&ctx->work, verity_work);
>  			fsverity_enqueue_verify_work(&ctx->work);
>  			return;
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

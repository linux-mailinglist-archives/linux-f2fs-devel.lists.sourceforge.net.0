Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5JU3IWPCO2ppcQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 13:41:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6C6BDB9E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 13:41:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=AU8F2j5Z;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ZlTYPolc;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=inyod8uc;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_rsa header.b=hF6NfODF;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_ed25519 header.b=GY8PcayC;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_rsa header.b=hF6NfODF;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=none
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbbUtXkUvP6MobUuJn04TGl7kSMKxRJ/Hd7sYXNA/4o=; b=AU8F2j5Zb0swk6zWFQb/zm+UV3
	oPH0XY7vX44F8PD1fNxOWwta0oBQadE2dts94+NvzPstU0cOgKRTmwbSd5nxvGC/wti5M0FYHXpDn
	WGj4AS3Uesy85x9O++YDaPFvy7T+X/Cm4rd+IKEUkEttQVdxIoQ7CrACslVaiEyfEztY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcLyd-0000Ub-7L;
	Wed, 24 Jun 2026 11:41:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1wcLya-0000UU-GQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 11:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1FWZgxDjSUCom9Re05WOOJuJNeJjEZN52wMGosALaUs=; b=ZlTYPolchWWjXJpryfsZ/DpCd9
 7LRKb8vJVHCY9P7+530u9aYDrEXS+HY3iFSljq9Az4c6wPad9g4zz+RsR64hopqGMsqQ8UZ1oo1P6
 ppctHYEVOLsQq+3Lo2seOlRiFbRWsIwItxdahOoBveNY0s8FneXBBUjbJUdqMwRoxOeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1FWZgxDjSUCom9Re05WOOJuJNeJjEZN52wMGosALaUs=; b=inyod8uccavAMYd1uklYhIPEn2
 XnjV38Jyio7kRs6wxVli+yXrayG3GCBv8LDlGczKlNfUeEQof9R58WLzTabh4eCvTuI+SZEHUK9LM
 qMSdUutR/4xewDEVVzfQ1adopmuybs96+cVrD+tlnDgq86ucur4JJyDhzR28/yUN8vGE=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wcLyZ-0000c9-Qx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 11:41:05 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 684BF71314;
 Wed, 24 Jun 2026 11:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1782301257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1FWZgxDjSUCom9Re05WOOJuJNeJjEZN52wMGosALaUs=;
 b=hF6NfODFPkCXvzr0SSHA/NliEy6UInLzHmobMqkJkWJfYWzdB1aaFCcQ3SiNrr4QQigZ61
 IOck3SKBclnNectWeI+wu8MiofOCvj0ZXWfpy+xmlOOYlUfZExVRabhPdzvAJwfpomETeR
 45DUjs7WXol1xxnSafaemMVirLgl+FA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1782301257;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1FWZgxDjSUCom9Re05WOOJuJNeJjEZN52wMGosALaUs=;
 b=GY8PcayCGoSTcAmLpIduGlP87R01qakK2tGhInNlAk5tsyVp1pmYg7EgUSRtXuSA9+T442
 xJqVt0prij7hymBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1782301257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1FWZgxDjSUCom9Re05WOOJuJNeJjEZN52wMGosALaUs=;
 b=hF6NfODFPkCXvzr0SSHA/NliEy6UInLzHmobMqkJkWJfYWzdB1aaFCcQ3SiNrr4QQigZ61
 IOck3SKBclnNectWeI+wu8MiofOCvj0ZXWfpy+xmlOOYlUfZExVRabhPdzvAJwfpomETeR
 45DUjs7WXol1xxnSafaemMVirLgl+FA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1782301257;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1FWZgxDjSUCom9Re05WOOJuJNeJjEZN52wMGosALaUs=;
 b=GY8PcayCGoSTcAmLpIduGlP87R01qakK2tGhInNlAk5tsyVp1pmYg7EgUSRtXuSA9+T442
 xJqVt0prij7hymBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C833779A8;
 Wed, 24 Jun 2026 11:40:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PNKTFknCO2p9HgAAD6G6ig
 (envelope-from <jack@suse.cz>); Wed, 24 Jun 2026 11:40:57 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id EADF4A093E; Wed, 24 Jun 2026 13:40:56 +0200 (CEST)
Date: Wed, 24 Jun 2026 13:40:56 +0200
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <hu7h6ga2ndrsedjvjbemdevjzrhvtz7jx2hbc2rtmkskufckmi@yf3a6t4hhike>
References: <20260624050334.124606-1-ebiggers@kernel.org>
 <20260624050334.124606-11-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260624050334.124606-11-ebiggers@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 23-06-26 22:03:28,
 Eric Biggers wrote: > Now that fscrypt's
 file contents en/decryption is always implemented > using blk-crypto when
 the filesystem is block-based, the fs-layer > decryption co [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: suse.cz]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wcLyZ-0000c9-Qx
Subject: Re: [f2fs-dev] [PATCH 10/16] fs/buffer: Remove fs-layer decryption
 code
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
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:from_mime,suse.cz:email,suse.com:email];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FD6C6BDB9E

On Tue 23-06-26 22:03:28, Eric Biggers wrote:
> Now that fscrypt's file contents en/decryption is always implemented
> using blk-crypto when the filesystem is block-based, the fs-layer
> decryption code in fs/buffer.c is unused code.  Remove it.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Fine by me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/buffer.c | 45 ++++++++-------------------------------------
>  1 file changed, 8 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index 9af5f061a1f8..21dd9596a941 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -334,82 +334,53 @@ static void end_buffer_async_read(struct buffer_head *bh, int uptodate)
>  
>  still_busy:
>  	spin_unlock_irqrestore(&first->b_uptodate_lock, flags);
>  }
>  
> -struct postprocess_bh_ctx {
> +struct verify_bh_ctx {
>  	struct work_struct work;
>  	struct buffer_head *bh;
>  	struct fsverity_info *vi;
>  };
>  
>  static void verify_bh(struct work_struct *work)
>  {
> -	struct postprocess_bh_ctx *ctx =
> -		container_of(work, struct postprocess_bh_ctx, work);
> +	struct verify_bh_ctx *ctx =
> +		container_of(work, struct verify_bh_ctx, work);
>  	struct buffer_head *bh = ctx->bh;
>  	bool valid;
>  
>  	valid = fsverity_verify_blocks(ctx->vi, bh->b_folio, bh->b_size,
>  				       bh_offset(bh));
>  	end_buffer_async_read(bh, valid);
>  	kfree(ctx);
>  }
>  
> -static void decrypt_bh(struct work_struct *work)
> -{
> -	struct postprocess_bh_ctx *ctx =
> -		container_of(work, struct postprocess_bh_ctx, work);
> -	struct buffer_head *bh = ctx->bh;
> -	int err;
> -
> -	err = fscrypt_decrypt_pagecache_blocks(bh->b_folio, bh->b_size,
> -					       bh_offset(bh));
> -	if (err == 0 && ctx->vi) {
> -		/*
> -		 * We use different work queues for decryption and for verity
> -		 * because verity may require reading metadata pages that need
> -		 * decryption, and we shouldn't recurse to the same workqueue.
> -		 */
> -		INIT_WORK(&ctx->work, verify_bh);
> -		fsverity_enqueue_verify_work(&ctx->work);
> -		return;
> -	}
> -	end_buffer_async_read(bh, err == 0);
> -	kfree(ctx);
> -}
> -
>  /*
>   * I/O completion handler for block_read_full_folio() - folios
>   * which come unlocked at the end of I/O.
>   */
>  static void bh_end_async_read(struct bio *bio)
>  {
>  	struct buffer_head *bh;
>  	bool uptodate = bio_endio_bh(bio, &bh);
>  	struct inode *inode = bh->b_folio->mapping->host;
> -	bool decrypt = fscrypt_inode_uses_fs_layer_crypto(inode);
>  	struct fsverity_info *vi = NULL;
>  
>  	/* needed by ext4 */
>  	if (bh->b_folio->index < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
>  		vi = fsverity_get_info(inode);
>  
> -	/* Decrypt (with fscrypt) and/or verify (with fsverity) if needed. */
> -	if (uptodate && (decrypt || vi)) {
> -		struct postprocess_bh_ctx *ctx = kmalloc_obj(*ctx, GFP_ATOMIC);
> +	/* Verify (with fsverity) if needed. */
> +	if (vi && uptodate) {
> +		struct verify_bh_ctx *ctx = kmalloc_obj(*ctx, GFP_ATOMIC);
>  
>  		if (ctx) {
>  			ctx->bh = bh;
>  			ctx->vi = vi;
> -			if (decrypt) {
> -				INIT_WORK(&ctx->work, decrypt_bh);
> -				fscrypt_enqueue_decrypt_work(&ctx->work);
> -			} else {
> -				INIT_WORK(&ctx->work, verify_bh);
> -				fsverity_enqueue_verify_work(&ctx->work);
> -			}
> +			INIT_WORK(&ctx->work, verify_bh);
> +			fsverity_enqueue_verify_work(&ctx->work);
>  			return;
>  		}
>  		uptodate = false;
>  	}
>  	end_buffer_async_read(bh, uptodate);
> -- 
> 2.54.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

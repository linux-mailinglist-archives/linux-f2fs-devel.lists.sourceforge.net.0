Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFhKGjQQmmn+YAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Feb 2026 21:06:12 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1708316DC6D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Feb 2026 21:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydrOZQh2fYqFy6XvCkYiIEwCMuEzfpWMP4Z3RiwcZTc=; b=Y/1cx1NsR7uLwgxBYrpczPAOEE
	wtMTs8RR7vfD5mZVG3Amwlu/RL8Q0GlTfWGn8cZO9JaeESbFqZM8PkSOaWwCv/f8+YzCSDJPNQBFj
	Db2c2Bc+2N8x6NgsqVELU3cqCOVmvSl4mqyVImKwNHV/J5uadYjlBxaocNnKVyen4tsk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vttEu-0002yL-VU;
	Sat, 21 Feb 2026 20:06:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vttEH-0002wm-Gf
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Feb 2026 20:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pvPas3UDgY5PKp/J22NXOJGt9f12HnY609mP3p8dH8o=; b=fjRjqXikeG1YbGyi23V1JivIYr
 BiVFykF3fJ43m6n0rWbdAKxBWvYc+EdYaWc4X1AEeuxPlJ/aGSKbBxDakz+TXE/pF/0PGrYvCQBOX
 JKYRUcPcPJ2d29Rk7o1+3olTOhou//YusPtSFzNelObrLWZgbl9+IwhmEbdqxRgdT+uI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pvPas3UDgY5PKp/J22NXOJGt9f12HnY609mP3p8dH8o=; b=PCF2F1Bg7W4hWVNLC5lJCsho3d
 mMk6gUFa2bWk4eAW9tvhxTrJZUoQtdaetD6dNZbqQQmzvTqRWVi3FNsXEtnszDHzvrfnNrQSTL5Xn
 +sIgnZidbBxUJ0GHY4xehLQ24lgGGkJOQLAnCaEcqSeYfnNHoy+034MLZieKxcL73sKA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vtsv8-0002rL-50 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Feb 2026 19:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BAB96441E6;
 Sat, 21 Feb 2026 19:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F133C4CEF7;
 Sat, 21 Feb 2026 19:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771703136;
 bh=mFAiNSqsxsqOGhfi6yj61qlg7slrIqYxPPaW9O9Y60Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WEZIXEN5w0Og2gE8E5z1Crq5s0FzNg+4ErjWqUno3rrR6oGCcIwt4lcuDLkDA8fWz
 aePZIq5glzoDCW7sKquOgRO3wXyVzqSdF9RY5GAq51Ms3BwoWLd365JqTysUvqnpro
 Brik2jrScJl13SC7NgueLJwNS/zoIpD4qE+gF/JmgcpVEfEhGdFDp8SblpEv4wiGHj
 UOPSUdg3+HqN78Ow6K4gpBWm708TRX7ZYlIHfvORn6ka71mA4Vs/eWVSh7WVMj5T6Q
 XBaHgX/w3rR6cXkvfIt7zO8bPtKtMFeosoRV5zShagB0YEHK4UlfaKYdvmVJVJcZ6H
 oMKy2BZ3PpWkQ==
Date: Sat, 21 Feb 2026 11:45:34 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260221194534.GC2536@quark>
References: <20260218061531.3318130-1-hch@lst.de>
 <20260218061531.3318130-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260218061531.3318130-4-hch@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Feb 18, 2026 at 07:14:41AM +0100, Christoph Hellwig
 wrote: > diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
 [...] > /** > * fscrypt_set_bio_crypt_ctx_bh() - prepare a file co [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vtsv8-0002rL-50
Subject: Re: [f2fs-dev] [PATCH 3/9] fscrypt: pass a byte offset to
 fscrypt_set_bio_crypt_ctx
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 1708316DC6D
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 07:14:41AM +0100, Christoph Hellwig wrote:
> diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
[...]
> /**
>  * fscrypt_set_bio_crypt_ctx_bh() - prepare a file contents bio for inline
>  *				    crypto
>  * @bio: a bio which will eventually be submitted to the file
>  * @first_bh: the first buffer_head for which I/O will be submitted
>  * @gfp_mask: memory allocation flags
>  *
>  * Same as fscrypt_set_bio_crypt_ctx(), except this takes a buffer_head instead
>  * of an inode and block number directly.

Similarly, the above needs "block number" => "file position"

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

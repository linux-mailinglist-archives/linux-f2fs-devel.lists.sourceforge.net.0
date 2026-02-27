Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNLOEUYXomnFzAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 23:14:30 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AFB1BE94B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 23:14:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdyWsL74Xtm1KmxI84A24NzOOGxLgqp1vvlPZyg+QgM=; b=cb6tpg4NaLk/RT/XP9LVgvI/T/
	UdFg7QTZ16xwmdet4ar+WEINP4PWt7J5xXJSo7OzviHGYLT6HjPVoPDsk/6rJITJP69vw10c/M0pG
	jCq5CucuChAclQ/SVymxR8G4KV/4ylJeqLNCuzTIPgXFfEPjNvYq5ylbQIyO9mYN0eG4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vw66J-00024K-LJ;
	Fri, 27 Feb 2026 22:14:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vw66H-000243-Na
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 22:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUnUMw7j2L/llUD86rjd2RsNdiRWjk+G5FF5HNNmhGs=; b=mVkpTf00ZsnqpJE3C0ZC762pVr
 Yhpvvo3BQduHXAqNdx1Swvgu6lMfq+Eh+R9HhCcekrtJV6ZC0sEGw4gJXUPqEfnR122nF26mz2h5w
 kgzFCeuGQref67dFLLj0mBum9wGizOikoeFqRIoyckthnhAsvJfktCRwWAEmA5EgUvfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KUnUMw7j2L/llUD86rjd2RsNdiRWjk+G5FF5HNNmhGs=; b=bQtcYBdjVgPRj2URJBgP0U5Bhw
 PVX7v1LE9ssBeLUumgS7Ac/Col6cQMThUz5v2mFvQA75Oa9OGK8NNM2DuO4cyeBodzoFFP2SpK2Xe
 nSAXBHlRq5kLgP+uHIjA2l/AgSJz927Nb4YyTwS+TmK5bAkt7laEZBqcHhUINM2S3CBU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vw66I-0001Tv-3q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 22:14:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B45F041733;
 Fri, 27 Feb 2026 22:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCE9C116C6;
 Fri, 27 Feb 2026 22:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772230456;
 bh=OD9oM6xqU6NcK9zlUrfSd+7wx83iqogpQIBAUAduYSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tyqKuMvr51Qkoml64Qyp4F8Ma7FFI+z8svHFeouAYinZsgE5PNzQTA3y28z18H28f
 d8+JB9T0Fxcbn1+HYY5/xeHIFunPegfIRfOoA04ofFGMGci6HrwF5gaPfHMubj0jeO
 3xC72d40oRLht6Bwd1h/Gbw99LA3Dw6Rq2MTtvshe9Yoxkkc3XDJefW6XjWZR3k10T
 bwW3gjN5X0CnvimEKtB/wtWXQMsL+jJ6N4QhiMoDRHhP3zEaoPd9RLAqb+InSM0OFl
 r8zEwF2jDDfgW5Lux5bhA4s9kNHAMg9KUDG+T8vKuatb+780bP0tjCqJ+2lP7DZO5e
 x88q/wjbE/B+A==
Date: Fri, 27 Feb 2026 14:14:09 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260227221409.GB5357@quark>
References: <20260226144954.142278-1-hch@lst.de>
 <20260226144954.142278-13-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226144954.142278-13-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 26, 2026 at 06:49:32AM -0800, Christoph Hellwig
 wrote: > static int fscrypt_zeroout_range_inline_crypt(const struct inode
 *inode, > loff_t pos, sector_t sector, > - unsigned int len) > + u [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vw66I-0001Tv-3q
Subject: Re: [f2fs-dev] [PATCH 12/14] fscrypt: pass a byte length to
 fscrypt_zeroout_range
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
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
X-Rspamd-Queue-Id: 86AFB1BE94B
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 06:49:32AM -0800, Christoph Hellwig wrote:
>  static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
>  					      loff_t pos, sector_t sector,
> -					      unsigned int len)
> +					      u64 len)

This hunk should go in the "pass a byte length to
fscrypt_zeroout_range_inline_crypt" patch.

>   * @inode: the file's inode
>   * @pos: the first file position (in bytes) to zero out
>   * @pblk: the first filesystem physical block to zero out
> - * @len: number of blocks to zero out
> + * @len: bytes to zero out

Should document that 'len' must be a multiple of the filesystem block
size

> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 945613c95ffa..675ef741cb30 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -406,7 +406,8 @@ int ext4_issue_zeroout(struct inode *inode, ext4_lblk_t lblk, ext4_fsblk_t pblk,
>  
>  	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
>  		return fscrypt_zeroout_range(inode,
> -				(loff_t)lblk << inode->i_blkbits, pblk, len);
> +				(loff_t)lblk << inode->i_blkbits, pblk,
> +				len << inode->i_blkbits);
>  
>  	ret = sb_issue_zeroout(inode->i_sb, pblk, len, GFP_NOFS);
>  	if (ret > 0)
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 239c2666ceb5..5b7013f7f6a1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4164,7 +4164,7 @@ static int f2fs_secure_erase(struct block_device *bdev, struct inode *inode,
>  		if (IS_ENCRYPTED(inode))
>  			ret = fscrypt_zeroout_range(inode,
>  					(loff_t)off << inode->i_blkbits, block,
> -					len);
> +					len << inode->i_blkbits);

The two callers should cast len to u64 before shifting it by i_blkbits.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

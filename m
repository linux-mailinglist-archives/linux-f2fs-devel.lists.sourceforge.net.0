Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZHwBJ8t3MGqRTQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 00:08:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FDD68A49F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 00:08:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=dzx4Z3vv;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Ed01jXD8;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="iIM2O/ID";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=i1FkT+fa;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4rGipOjLfBDJHU+8egtoz66+XFyRnhiQjGj5U6gpc8=; b=dzx4Z3vv89vYCniW+E7Ks6Est8
	s2s/BD7yH6lbGCnzl5pFFV3H35DkiSMysLAKTmNn7dmz4WH0AulvrfCY8ZKrVN70Of05RjewdB2M0
	CfuYO+Adc6YvCCOyha5QgZZPf01r0+zG9O/J7jnm2kgziEQAeCX2RDkKLX42/gwQTels=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZFTM-0002FJ-Rd;
	Mon, 15 Jun 2026 22:08:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wZFTL-0002FC-2y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 22:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dMMzsQ1f0GS54dTClV0u+QjaNNDBUsBtvYGacLodqzA=; b=Ed01jXD864WnkR+NEOPEuPY09v
 o5o80lYM75Vc00FR0cUr0CShM9RHN/7N4HikdUhGeEGHgremak65X6dzjxf3i6J8cwnV//JDq/fiG
 K3+9Ry8Q87fE4y66IQ+D7uB3CvCLIWssQP7pTPwWU9c3tAiX7FjhI/wdWH5cfZLIU2o0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dMMzsQ1f0GS54dTClV0u+QjaNNDBUsBtvYGacLodqzA=; b=iIM2O/IDq38odq+CZ5PTVpM/da
 /nNy4EgEh0kweXzdxvdy1Fa65UTHXsxjyXBlVCZb0wustyiW8Tni6DOcoOTdwOHmC6igudr60QO+i
 fYqUi2S/slx/mkKGVsVphiZKzGxJ2QhRUnDFLLSDuQwnjO90Tm/p+ekrJmLQJXCTyKB8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZFTK-00063y-P6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 22:07:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C6446008A;
 Mon, 15 Jun 2026 22:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189741F000E9;
 Mon, 15 Jun 2026 22:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781561273;
 bh=dMMzsQ1f0GS54dTClV0u+QjaNNDBUsBtvYGacLodqzA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=i1FkT+fa3h8P/EIy9sjR9u8xdb6Za1QtBp+RcuyFsGp3tJdAv5bqASn+yN5pgVcfX
 G7EbC6SsM5Mpp9Lwya1e6bLd5aZwUVCqvwsESJhuydw4xEN0COYE9bh2I9Xpo9DDEg
 RXyN1Njr5pEdPe5TvzjWjweaOOlu4T1Q4Evf7fY1rBrTflNIpGi6uLKY2AnhFZndbG
 bBUIEJ5FiatXgUIoj/GCN/8HSon68rvig0bTv0W+vQ9zLVVuHU24+VYM3r8a/TXx9m
 uXib5V1V+JW1oH+Ru7WLzFN6L1I2vAaYdhG99P38j2L5r5dJFUq0SFn7yjnrd02nSz
 6tN5Drd32XzOQ==
Date: Mon, 15 Jun 2026 22:07:51 +0000
To: Chunhai Guo <guochunhai@vivo.com>
Message-ID: <ajB3t-bWsdKhiiY-@google.com>
References: <20260605100559.94843-1-guochunhai@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260605100559.94843-1-guochunhai@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/05,
 Chunhai Guo wrote: > Since commit 29c1e18a0bc5 ("fsck.f2fs:
 tune linear_lookup in > f2fs_do_mount()"), fsck_update_sb_flags() writes
 the superblock directly > and nothing sets c.invalid_sb w [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZFTK-00063y-P6
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: drop unused SB_ENCODE_FLAG
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS(0.00)[m:guochunhai@vivo.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38FDD68A49F

On 06/05, Chunhai Guo wrote:
> Since commit 29c1e18a0bc5 ("fsck.f2fs: tune linear_lookup in
> f2fs_do_mount()"), fsck_update_sb_flags() writes the superblock directly
> and nothing sets c.invalid_sb with SB_ENCODE_FLAG anymore. Drop the dead
> flag and simplify the SB_NEED_FIX check.

What if the tool runs without that kernel change?

> 
> BTW, SB_ENCODE_FLAG should originally have been 0x10, not 0x16, since
> invalid_sb is a bitmask.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
>  fsck/fsck.c       | 2 +-
>  include/f2fs_fs.h | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 4fca4dd7eb1b..85766118d04a 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -4001,7 +4001,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  		if (c.invalid_sb & SB_FS_ERRORS)
>  			memset(sb->s_errors, 0, MAX_F2FS_ERRORS);
>  
> -		if (c.invalid_sb & (SB_NEED_FIX | SB_ENCODE_FLAG))
> +		if (c.invalid_sb & SB_NEED_FIX)
>  			update_superblock(sb, SB_MASK_ALL);
>  
>  		/* to return FSCK_ERROR_CORRECTED */
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 21310fa6a1af..07772da6e67d 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1477,9 +1477,8 @@ enum {
>  #define SB_ABNORMAL_STOP	0x2	/* s_stop_reason is set except shutdown */
>  #define SB_FS_ERRORS		0x4	/* s_erros is set */
>  #define SB_INVALID		0x8	/* sb is invalid */
> -#define SB_ENCODE_FLAG		0x16	/* encode_flag */
>  #define SB_NEED_FIX		(SB_ABNORMAL_STOP | SB_FS_ERRORS |	\
> -				SB_INVALID | SB_ENCODE_FLAG)
> +				SB_INVALID)
>  
>  #define MAX_CACHE_SUMS			8
>  
> -- 
> 2.34.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ArwQNNGwKGrtIAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 02:33:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5C664F93
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 02:33:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=gwOM0YUi;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fC8YaVLI;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=I8t051EL;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=cQjfL6qz;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHa6VNBRlXWBiuPHhG8Ei/7Sp4iJDaS0e5BtbQjfShI=; b=gwOM0YUiqywE7iUZjhGvQ4X76L
	N18nT+DTHS856u+tFbgVnlCuR+f08Ljh+0vXcIyFv2Voj24t1sZLhbEqPYu7mDbHWejYuqyf0Aas9
	F9hLBQ4iEAIVH50plA4oZfH1TBnThGKZsw+vky8qOKelgDAXCkYflBNB1AQsFYAGWiWw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wX6sd-0004Ml-4T;
	Wed, 10 Jun 2026 00:33:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wX6sc-0004MX-17
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 00:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HacGq9vy/nwk7WKQRYcnSI6MhokQ7vpN7zhGoyls9ZM=; b=fC8YaVLIgUcbllX57CHRpdC0O2
 /ZFtPA5sOH5Gxay//d0DMdUjhB1cUaX95M63nWXBnr2xVpx/fr7Ca8sbLmIbz4wo/BSd0Mo4Jienk
 daoSPwcHSG2fG2qXNV0QnVWb96hg4L2qCBgvtQ4irpktx5N+tfMv5k4CHAkwvIMGB8fY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HacGq9vy/nwk7WKQRYcnSI6MhokQ7vpN7zhGoyls9ZM=; b=I8t051ELA0HqB0JxjnSnEQcCHm
 64ygS44RVH2Q2qI9cmrXwPxmkQWPHJ4AP0KKAS6aKCWAL8DclRfjNs1wky1JEckvAUQsy76zJyG/W
 gNBzcSy0Kk51UnEWmvMru8++CsIg2b9II/GGTQKb/odxudhcdfrFiH4jrrYRSPvWRPv0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wX6sa-00012N-U3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 00:33:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 17245416E4;
 Wed, 10 Jun 2026 00:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BC71F00893;
 Wed, 10 Jun 2026 00:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781051583;
 bh=HacGq9vy/nwk7WKQRYcnSI6MhokQ7vpN7zhGoyls9ZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=cQjfL6qzhkI/U3wSArxJuGF8j3F3XKbmefuECxQcwU9kujQ+ziJvWc8Buy299eihA
 zM+V6p8x2EcKgpURHejgubyLxZbJFHYNPbvhxu6LdwBpTgv6HyN6jFipFZ3fDOsr4Z
 nPwCXj+0nWANwDa8LVQ43pA64Xa5ON0OZbrhA1ml4i7ZcOjRwBcXdRvB0KpkU+IkgX
 FSw+JIO5mTh4YpiNpbgrKFaM3GZeMk48prfRk++5C9u6C6a7J8xP6LnNbavkldWa6f
 QvElaFybHYhEhpAgABH7MHkdjfQkVWo38xr+ZGQF0VigNFZBDSiQuV2edGZbAN/QzR
 RWduJ+nwctqsg==
Date: Wed, 10 Jun 2026 00:33:01 +0000
To: Wenjie Qi <qwjhust@gmail.com>
Message-ID: <aiiwvYnHRDE1FcMk@google.com>
References: <20260527054507.1900373-1-qiwenjie@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260527054507.1900373-1-qiwenjie@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/27, Wenjie Qi wrote: > F2FS iostat is optional and is
 disabled by default, but the direct > I/O submit path still allocates and
 binds a bio_iostat_ctx, updates > the submit timestamp, and replac [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wX6sa-00012N-U3
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip direct I/O iostat work when
 disabled
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
Cc: qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EE5C664F93

On 05/27, Wenjie Qi wrote:
> F2FS iostat is optional and is disabled by default, but the direct
> I/O submit path still allocates and binds a bio_iostat_ctx, updates
> the submit timestamp, and replaces bi_end_io for every DIO bio even
> when sbi->iostat_enable is false.
> 
> The end_io path also calls f2fs_update_iostat(), which returns
> immediately when iostat is disabled. This adds avoidable per-bio
> overhead to the default direct I/O hot path.
> 
> Skip DIO iostat context setup and the direct read/write byte updates
> when iostat is disabled. If iostat is enabled through sysfs before
> submission, the existing context allocation and latency accounting path
> is still used.
> 
> QEMU benchmark on a 1GiB F2FS virtio-blk image, with iostat_enable=0,
> 4KiB O_DIRECT I/O over a 64MiB file, 50000 iterations per run:
> 
>                          baseline     patched
>   direct_read median    65264.50 ns  55470.95 ns
>   direct_read recheck   65553.75 ns  55470.95 ns
>   direct_write median   68054.62 ns  56309.44 ns
>   direct_write recheck  66873.51 ns  56309.44 ns
> 
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
>  fs/f2fs/file.c   | 9 +++++++--
>  fs/f2fs/iostat.h | 6 ++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6edf0105dbc8..3ad8bd660b33 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4799,6 +4799,9 @@ static void f2fs_dio_iostat_start(struct f2fs_sb_info *sbi, struct bio *bio)
>  {
>  	void *bi_private = bio->bi_private;
>  
> +	if (!f2fs_iostat_enabled(sbi))
> +		return;
> +
>  	iostat_alloc_and_bind_ctx(sbi, bio, bi_private);
>  	iostat_update_submit_ctx(bio, DATA);
>  	bio->bi_end_io = f2fs_dio_end_bio;
> @@ -4816,7 +4819,8 @@ static int f2fs_dio_read_end_io(struct kiocb *iocb, ssize_t size, int error,
>  	dec_page_count(sbi, F2FS_DIO_READ);
>  	if (error)
>  		return error;
> -	f2fs_update_iostat(sbi, NULL, APP_DIRECT_READ_IO, size);
> +	if (f2fs_iostat_enabled(sbi))
> +		f2fs_update_iostat(sbi, NULL, APP_DIRECT_READ_IO, size);

f2fs_update_iostat() checks sbi->iostat_enable?

>  	return 0;
>  }
>  
> @@ -5097,7 +5101,8 @@ static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
>  	if (error)
>  		return error;
>  	f2fs_update_time(sbi, REQ_TIME);
> -	f2fs_update_iostat(sbi, NULL, APP_DIRECT_IO, size);
> +	if (f2fs_iostat_enabled(sbi))
> +		f2fs_update_iostat(sbi, NULL, APP_DIRECT_IO, size);
>  	return 0;
>  }
>  
> diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
> index 2025225b5bed..d3ef787575be 100644
> --- a/fs/f2fs/iostat.h
> +++ b/fs/f2fs/iostat.h
> @@ -44,6 +44,11 @@ struct bio_iostat_ctx {
>  	struct bio_post_read_ctx *post_read_ctx;
>  };
>  
> +static inline bool f2fs_iostat_enabled(struct f2fs_sb_info *sbi)
> +{
> +	return sbi->iostat_enable;
> +}
> +
>  static inline void iostat_update_submit_ctx(struct bio *bio,
>  			enum page_type type)
>  {
> @@ -72,6 +77,7 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *in
>  		enum iostat_type type, unsigned long long io_bytes) {}
>  static inline void f2fs_update_read_folio_count(struct f2fs_sb_info *sbi,
>  		struct folio *folio) {}
> +static inline bool f2fs_iostat_enabled(struct f2fs_sb_info *sbi) { return false; }
>  static inline void iostat_update_and_unbind_ctx(struct bio *bio) {}
>  static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
>  		struct bio *bio, struct bio_post_read_ctx *ctx) {}
> -- 
> 2.43.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q5zEFXxfMGoASQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 22:24:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8C0689D05
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 22:24:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=B6FvVhP+;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=AtOtiMeT;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=TdMv7LX0;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="fV/3h+j0";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFkDCqirmPnqc6z4UIQoljYaEzHhR2NHtlHsJC7bYEM=; b=B6FvVhP+/yoEAUk2/dtom0icpT
	UztQHKAmCuYSl19lPfBdZI7bSeX5VhS4kMXV187IMDeuPEiRZN38pWQ3QhrD3Ib1+35cs9tMQs43T
	ia+Guyveacjs2z5ivJhtlSxiqehNyTJylqIvT8K8Sxm+HLEuzMWmj5uim1z3JASLec20=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZDr0-0000ti-5i;
	Mon, 15 Jun 2026 20:24:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wZDqz-0000tZ-GY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 20:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xv0Xx+sFyQZR8z3JaDBhEyFdVXsngUf/nfHDbi4YiMk=; b=AtOtiMeTCn03NYL3RFa4DZLnr1
 rMHfBVOkjdW8pMSA22gR8D/dFJVruTpNP+zDQ6cNXTBWTYgcZJ1g+40CS5nelw1QMDDIeGZlaMh6u
 fMnQBLhk/D/15Lq8TwzSor2oOtEXZYOQDEwEuzNA50haz8LbwD0/6/8WxHHmhGXSDgbg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xv0Xx+sFyQZR8z3JaDBhEyFdVXsngUf/nfHDbi4YiMk=; b=TdMv7LX04jpR9njfYgtnY5//I9
 4fRsROPJNLwq4crOmIM46W2KmheW3nExlaDX8b1mgY+IhjsP6W56isd/tGY5xI+UXymk1VrJ58fBg
 buaQuukh6EQBfMtVguGxANgjFu7XF4LDSimvbbVDUgc7ePDwlFlLjdVVa1+puJxalBGU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZDqz-0000kd-3n for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 20:24:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E16742A33;
 Mon, 15 Jun 2026 20:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BD71F000E9;
 Mon, 15 Jun 2026 20:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781555046;
 bh=Xv0Xx+sFyQZR8z3JaDBhEyFdVXsngUf/nfHDbi4YiMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=fV/3h+j0lk70GkTZNTi89QESWOs9EdwFjGu/Gp3wY9R+HHRRWdlSKPLT3P8WzxX9H
 dlyxag3Z5yJpw7jQBZpIfV/NpqHBlTkl4y6gNd/o0OKOL8HuO1qyoDkYBNCwCeI4MT
 9uLhs6NbcWWyu0D0sXNZcBk6IFmWZCNKlVG3gHppg7DS+iWayYRZ1rkRzT6yZ4n0az
 ssWcvzxVh+dQqiJXHGl3FNFLEJNch6J5WxR2aQ5AWLE8yxEIDnBVwNekq/upp7Q/a6
 CAhHCaCx946ZyjXo5D2X1ar0bzli4zUCrRUe3Lfqoaguzb35+adlAr0fOj+WNWEH1W
 g5jlrvBseLHFg==
Date: Mon, 15 Jun 2026 20:24:05 +0000
To: Wenjie Qi <qwjhust@gmail.com>
Message-ID: <ajBfZSpf2I8s67ze@google.com>
References: <20260525061456.231710-1-qiwenjie@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525061456.231710-1-qiwenjie@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/25,
 Wenjie Qi wrote: > Compressed data writes are accounted
 as F2FS_WB_CP_DATA because they > write compressed pages through
 fio->compressed_page.
 Their end_io path > should therefore have the s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZDqz-0000kd-3n
Subject: Re: [f2fs-dev] [PATCH] f2fs: stop checkpoint on compressed write IO
 error
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
Cc: yuchao0@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FREEMAIL_TO(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:yuchao0@huawei.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:stable@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B8C0689D05

On 05/25, Wenjie Qi wrote:
> Compressed data writes are accounted as F2FS_WB_CP_DATA because they
> write compressed pages through fio->compressed_page.  Their end_io path
> should therefore have the same checkpoint-stop behavior as ordinary
> F2FS_WB_CP_DATA writes.
> 
> However, f2fs_compress_write_end_io() only records -EIO in the inode
> mapping when the bio fails.  The filesystem can keep checkpointing after
> that failure, so a later checkpoint may persist metadata that points to
> compressed data blocks whose writeback failed.
> 
> Stop checkpointing with STOP_CP_REASON_WRITE_FAIL for failed compressed
> F2FS_WB_CP_DATA writes, matching the ordinary data write end_io path.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Cc: stable@kernel.org
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
>  fs/f2fs/compress.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index caf522d667d6..9b1501004456 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1488,8 +1488,11 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
>  				f2fs_is_compressed_page(folio));
>  	int i;
>  
> -	if (unlikely(bio->bi_status != BLK_STS_OK))
> +	if (unlikely(bio->bi_status != BLK_STS_OK)) {
>  		mapping_set_error(cic->inode->i_mapping, -EIO);
> +		if (type == F2FS_WB_CP_DATA)

It turns out the type should not be F2FS_WB_CP_DATA.

> +			f2fs_stop_checkpoint(sbi, true, STOP_CP_REASON_WRITE_FAIL);
> +	}
>  
>  	f2fs_compress_free_page(page);
>  
> -- 
> 2.43.0
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

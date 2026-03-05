Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHs1OF2XqWlKAgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 15:46:53 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A837213C59
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 15:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:Mime-Version:Message-Id:From:Date:To:References:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDW6kgp2FAlH2zyiQGyzezQuq7QDgEP62FGx/3zsjUc=; b=IDqIL5/WJODiBnbarB4l9VPDG2
	4GYMBXgHD2dEXPv+R05nLyDOY4E+tDwDCdXMlTjYbsxk+Po7cqX+hyKCeHxLZvdK/M6YYsZSgCDDc
	Gjx2zbiMYRp6ZJfIEhP+v3xZHOSvZWmvquw5lvxtHsn1PlTqS0gxtpRxeMPAQUs8YtTc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vy9yQ-0004pd-7b;
	Thu, 05 Mar 2026 14:46:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <colyli@fnnas.com>) id 1vy9yO-0004pW-L2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 14:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:In-Reply-To:Mime-Version:
 Message-Id:From:Cc:Content-Type:Date:To:References:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fd+yf1MWzvARKFw8KBfrfEqR9xVpjfuoaal13vgTb08=; b=Hpr8ex/A2xLO33CFFIlIyQENBh
 AtD5X6hFUcLzRdPDZfT8H/JhYGJEkN9hXFd83r2gNEQOSETDwmyz6qdC3GhG6rrKEG6kM0CDCQIBr
 P5AZxZvwM/WUE7yOIbszh9wR9QHk/Cc2ureT6uIcvIVkVxa3gcV3LTk8kICQXFADqCeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:In-Reply-To:Mime-Version:Message-Id:From:Cc:
 Content-Type:Date:To:References:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fd+yf1MWzvARKFw8KBfrfEqR9xVpjfuoaal13vgTb08=; b=kD7462IOk6G7cOl8ENFu9Z94je
 qSkt5/mXMHfoQzilp+7hJzI5kohCgab2PYmSXNBiywyBXO99npLMKlFJJJ9N63Eno1N2wG4db9tEy
 MDVr9aNsI33xOliZUgB5qa1itpRe+NPorlJF/u85RMi9QbQhqgfGpSy4U2PnNYKimft4=;
Received: from sg-1-12.ptr.blmpb.com ([118.26.132.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vy9yN-00055S-S0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 14:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1772721137;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=fd+yf1MWzvARKFw8KBfrfEqR9xVpjfuoaal13vgTb08=;
 b=AAxZ2sSHWBbHI7bgo9b94IGyL9gbbFmnG2NRpr2rPRJHORW19c5D9fIVDKQmGT+SjHgHkT
 w9rTBRmAS7+aci8rWfM7wYOKLGRQnzJMIbXjN+AEn3+iu+I8HP9VaOkhlBNy7Miepdvy7t
 UiAagZ3L9669d9b9HdLl1d1kt7+OIufueeiBMmVyqxYcOF+mkzjmceodm2A5nCl4vYTDYe
 7qxP0ynSnam8VDnptEWPT0qLpJKADLMTFSAzRSAWnag2HxtiNXwEtRZAXpHePZpqV95Tky
 JhYfI8ghcEjCDB0EnM4Ax0kFdpMCCpE3TAh5Jm2IXeFDMhOo+zyImudtdQaCYA==
References: <20260304190424.291743-1-agruenba@redhat.com>
 <20260304190424.291743-5-agruenba@redhat.com>
To: "Andreas Gruenbacher" <agruenba@redhat.com>
X-Original-From: Coly Li <colyli@fnnas.com>
Date: Thu, 5 Mar 2026 22:32:13 +0800
X-Lms-Return-Path: <lba+269a993ef+6cdbe4+lists.sourceforge.net+colyli@fnnas.com>
Content-Disposition: inline
Received: from studio.local ([120.245.64.174]) by smtp.feishu.cn with ESMTPS;
 Thu, 05 Mar 2026 22:32:14 +0800
From: "Coly Li" <colyli@fnnas.com>
Message-Id: <aamTA2F84tiDbmF3@studio.local>
Mime-Version: 1.0
In-Reply-To: <20260304190424.291743-5-agruenba@redhat.com>
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 04, 2026 at 08:04:09PM +0800, Andreas Gruenbacher
 wrote: > Instead of setting bio->bi_status to BLK_STS_IOERR and calling >
 bio_endio(bio), use the shorthand bio_io_error(bio). > > Created [...] 
 Content analysis details:   (1.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [120.245.64.174 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vy9yN-00055S-S0
Subject: Re: [f2fs-dev] [PATCH 4/4] bio: use bio_io_error more often
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
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 3A837213C59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	MV_CASE(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:agruenba@redhat.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:hch@lst.de,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[colyli@fnnas.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,fnnas-com.20200927.dkim.feishu.cn:s=s1];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[fnnas.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[colyli@fnnas.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,fnnas-com.20200927.dkim.feishu.cn:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 08:04:09PM +0800, Andreas Gruenbacher wrote:
> Instead of setting bio->bi_status to BLK_STS_IOERR and calling
> bio_endio(bio), use the shorthand bio_io_error(bio).
> 
> Created with Coccinelle using the following semantic patch:
> 
> @@
> struct bio *bio;
> @@
> - bio->bi_status = BLK_STS_IOERR;
> - bio_endio(bio);
> + bio_io_error(bio);
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/fops.c                  | 3 +--
>  drivers/block/drbd/drbd_int.h | 3 +--
>  drivers/md/bcache/bcache.h    | 3 +--
>  drivers/md/bcache/request.c   | 6 ++----
>  drivers/md/dm-mpath.c         | 3 +--
>  drivers/md/dm-writecache.c    | 3 +--
>  fs/f2fs/segment.c             | 3 +--
>  7 files changed, 8 insertions(+), 16 deletions(-)
> 

[snipped]

>  
> diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
> index ec9ff9715081..e0c9d9eef0a0 100644
> --- a/drivers/md/bcache/bcache.h
> +++ b/drivers/md/bcache/bcache.h
> @@ -947,8 +947,7 @@ static inline void closure_bio_submit(struct cache_set *c,
>  {
>  	closure_get(cl);
>  	if (unlikely(test_bit(CACHE_SET_IO_DISABLE, &c->flags))) {
> -		bio->bi_status = BLK_STS_IOERR;
> -		bio_endio(bio);
> +		bio_io_error(bio);
>  		return;
>  	}
>  	submit_bio_noacct(bio);
> diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
> index 3fa3b13a410f..0f6fa0a2920b 100644
> --- a/drivers/md/bcache/request.c
> +++ b/drivers/md/bcache/request.c
> @@ -1178,8 +1178,7 @@ void cached_dev_submit_bio(struct bio *bio)
>  
>  	if (unlikely((d->c && test_bit(CACHE_SET_IO_DISABLE, &d->c->flags)) ||
>  		     dc->io_disable)) {
> -		bio->bi_status = BLK_STS_IOERR;
> -		bio_endio(bio);
> +		bio_io_error(bio);
>  		return;
>  	}
>  
> @@ -1283,8 +1282,7 @@ void flash_dev_submit_bio(struct bio *bio)
>  	struct bcache_device *d = bio->bi_bdev->bd_disk->private_data;
>  
>  	if (unlikely(d->c && test_bit(CACHE_SET_IO_DISABLE, &d->c->flags))) {
> -		bio->bi_status = BLK_STS_IOERR;
> -		bio_endio(bio);
> +		bio_io_error(bio);
>  		return;
>  	}
>  

For bcache part, I feel current hard code is explict and clear.
The bio_io_error() wrapper is not so directly understood. This is just
my opinion, not a strong objection. 

Thanks.

Coly Li


[snipped]


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

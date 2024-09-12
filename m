Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DEE9772CC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 22:37:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soqYs-0001dm-OO;
	Thu, 12 Sep 2024 20:37:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1soqYr-0001dg-MR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 20:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9yS7HA6fKYDCCYVIl+KdIxvAej4qJ3r4GXFGjMqBgvo=; b=dRtlrD8V1jqSYUCjKYmPUwCZY5
 5IntImlIT0i4y2QU5dDhqyA+br/6g2uhOIrRpJw/40/WQaviEa7TD2tkdTm2yjXNUioSF2EbFMoPc
 Zm64+EyIrNTlrPR62eYQEmJ5wHcnA+6AKePpz7z77122vvkz/kKJlZtXALhAtn07Rjzo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9yS7HA6fKYDCCYVIl+KdIxvAej4qJ3r4GXFGjMqBgvo=; b=dJHWbeDl44MF4y3zpC4WhdoEBP
 TcZ62Ux+wLEYdrC9FpOnEjm0ikQ+P5cme3owFLCt8WWUfME2mwqDqVCCTHeg6UYbZPzYhPK4JKLsj
 KiYUWhCn4DPHIJPaDujbGp/j8mNzi1d8tu8z0K4hGxZYkB1gf1j0GHmkF30qI1OIzCWI=;
Received: from 009.lax.mailroute.net ([199.89.1.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soqYr-0003zX-0X for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 20:37:05 +0000
Received: from localhost (localhost [127.0.0.1])
 by 009.lax.mailroute.net (Postfix) with ESMTP id 4X4TkZ655hzlgMVN;
 Thu, 12 Sep 2024 20:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:content-language:references:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received;
 s=mr01; t=1726173408; x=1728765409; bh=9yS7HA6fKYDCCYVIl+KdIxvA
 ej4qJ3r4GXFGjMqBgvo=; b=uSvi5fR2vmRTU5PsBWAozmgRWg15DQCoTw9QYG0Q
 JILXCI2W17PMdjeB0eCaY4R9b4p5zp9bb+bfYJlcGbHdBTfiFtQtMF3dUYguzo/Z
 TlwUp0S+sLzCJ2ZszrvHZG5CDzMw6iEjadRBSJIy5BAgA0y3vIeIBsfBENIkbnoW
 r11vxY1o7k84TSJpKMgfwayzh+k0/J3gvxSYRGPxCpPyAAVkWDiPCc0uq08D7fpJ
 66OjaML0t1A0/rH2BCmDW3sZR1xKfqOJVpFBi7aKD0+DNxhM9SCJFcr5+emr55CI
 a+9PjgbvNYdOfcQHlw3ysfvDS3LLjk0rwkbAPwa/6Q1aNQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Z4I_UPR0myMw; Thu, 12 Sep 2024 20:36:48 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net
 [73.231.117.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X4TkN0rMHzlgT1M;
 Thu, 12 Sep 2024 20:36:43 +0000 (UTC)
Message-ID: <53043e99-be5f-4fc6-be87-4ebcb8ce99b6@acm.org>
Date: Thu, 12 Sep 2024 13:36:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kanchan Joshi <joshi.k@samsung.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com, brauner@kernel.org,
 viro@zeniv.linux.org.uk, jack@suse.cz, jaegeuk@kernel.org,
 jlayton@kernel.org, chuck.lever@oracle.com
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151052epcas5p48b20962753b1e3171daf98f050d0b5af@epcas5p4.samsung.com>
 <20240910150200.6589-4-joshi.k@samsung.com>
Content-Language: en-US
In-Reply-To: <20240910150200.6589-4-joshi.k@samsung.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/10/24 8:01 AM,
 Kanchan Joshi wrote: > diff --git a/include/linux/rw_hint.h
 b/include/linux/rw_hint.h > index b9942f5f13d3..ff708a75e2f6 100644 > ---
 a/include/linux/rw_hint.h > +++ b/include/linu [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [199.89.1.12 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1soqYr-0003zX-0X
Subject: Re: [f2fs-dev] [PATCH v5 3/5] fcntl: add F_{SET/GET}_RW_HINT_EX
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
From: Bart Van Assche via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Bart Van Assche <bvanassche@acm.org>
Cc: vishak.g@samsung.com, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 javier.gonz@samsung.com, Nitesh Shetty <nj.shetty@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/10/24 8:01 AM, Kanchan Joshi wrote:
> diff --git a/include/linux/rw_hint.h b/include/linux/rw_hint.h
> index b9942f5f13d3..ff708a75e2f6 100644
> --- a/include/linux/rw_hint.h
> +++ b/include/linux/rw_hint.h
> @@ -21,4 +21,17 @@ enum rw_lifetime_hint {
>   static_assert(sizeof(enum rw_lifetime_hint) == 1);
>   #endif
>   
> +#define WRITE_HINT_TYPE_BIT	BIT(7)
> +#define WRITE_HINT_VAL_MASK	(WRITE_HINT_TYPE_BIT - 1)
> +#define WRITE_HINT_TYPE(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
> +				TYPE_RW_PLACEMENT_HINT : TYPE_RW_LIFETIME_HINT)
> +#define WRITE_HINT_VAL(h)	((h) & WRITE_HINT_VAL_MASK)
> +
> +#define WRITE_PLACEMENT_HINT(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
> +				 WRITE_HINT_VAL(h) : 0)
> +#define WRITE_LIFETIME_HINT(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
> +				 0 : WRITE_HINT_VAL(h))
> +
> +#define PLACEMENT_HINT_TYPE	WRITE_HINT_TYPE_BIT
> +#define MAX_PLACEMENT_HINT_VAL	(WRITE_HINT_VAL_MASK - 1)
>   #endif /* _LINUX_RW_HINT_H */

The above macros implement a union of two 7-bit types in an 8-bit field.
Wouldn't we be better of by using two separate 8-bit values such that we
don't need the above macros?

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

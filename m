Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B73338777DD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Mar 2024 19:04:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjNX2-0000WZ-4c;
	Sun, 10 Mar 2024 18:04:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david.laight@aculab.com>) id 1rjNWy-0000WP-QF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Mar 2024 18:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NNv/3Ap4lgv+JAaqLEJc5P0kyr8Viy9Oq1MrlGUATA0=; b=HWi21q8lR51ORhtadqZ2bScdat
 eLAprt76qxQ1JNe9RECDgjqu+AiaX7PIbf/pvexwVJqq7Rb2a6C2R3Qqsu9HS3lWUagGRGzw2twTP
 CE4XG8/DjYDiJJuqMGMq2bezP9A8qDRZcxXVoSRs0Yp2mAJb4BqecKnULXns83PjoSFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NNv/3Ap4lgv+JAaqLEJc5P0kyr8Viy9Oq1MrlGUATA0=; b=le1jf00NLv2QROyZB4xH0sSHLu
 hVc7uVqoE00RGo/Y+cGD0/qMm2V0OZR+PydmaRIE2Rq0S29B8uJWpIdGIjSUfW9+x+yIFvmwi79WG
 mTHEw6lpec+RW7zlD9TbUw/R4lwBye0GQdLAYXKdikGIqpgtb3nAIn9Zb14x/uTm+6ug=;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjNWo-00040X-4k for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Mar 2024 18:04:17 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-114-TNp10J7jNWOsLS4FIbmhqQ-1; Sun, 10 Mar 2024 17:46:05 +0000
X-MC-Unique: TNp10J7jNWOsLS4FIbmhqQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 10 Mar
 2024 17:46:15 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 10 Mar 2024 17:46:15 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Roman Smirnov' <r.smirnov@omp.ru>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "Chao Yu" <chao@kernel.org>
Thread-Topic: [PATCH] f2fs: Cast expression type to unsigned long in
 __count_extent_cache()
Thread-Index: AQHabtSs8qQLngIY8Ey8WBtnYc/JqbExQp7Q
Date: Sun, 10 Mar 2024 17:46:14 +0000
Message-ID: <b4f9780714e243a6af9f77ab00593ec1@AcuMS.aculab.com>
References: <20240305080943.6922-1-r.smirnov@omp.ru>
In-Reply-To: <20240305080943.6922-1-r.smirnov@omp.ru>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Roman Smirnov > Sent: 05 March 2024 08:10 > > Cast
 expression
 type to unsigned long in __count_extent_cache() > to prevent integer overflow.
 > > Found by Linux Verification Center (linuxtesting. [...] 
 Content analysis details:   (-1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [185.58.86.151 listed in list.dnswl.org]
 -1.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [185.58.86.151 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rjNWo-00040X-4k
Subject: Re: [f2fs-dev] [PATCH] f2fs: Cast expression type to unsigned long
 in __count_extent_cache()
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
Cc: "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karina Yankevich <k.yankevich@omp.ru>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Roman Smirnov
> Sent: 05 March 2024 08:10
> 
> Cast expression type to unsigned long in __count_extent_cache()
> to prevent integer overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace.

Another broken analysis tool :-)

> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>  fs/f2fs/shrinker.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 83d6fb97dcae..bb86a06c5d5e 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -33,7 +33,7 @@ static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
>  {
>  	struct extent_tree_info *eti = &sbi->extent_tree[type];
> 
> -	return atomic_read(&eti->total_zombie_tree) +
> +	return (unsigned long)atomic_read(&eti->total_zombie_tree) +
>  				atomic_read(&eti->total_ext_node);

Makes diddly-squit difference.

Both total_zombie_tree and totat_ext_node are 'int'.
If they are large enough that their sum wraps then the values
can individually wrap (to negative values).

You really don't want to cast 'int' to 'unsigned long' here
at all - implicitly or explicitly.
The cast will first promote 'int' to 'signed long'.
So a negative value will get sign extended to a very big value.

The best you can hope for is a 33bit result from wrapped 32bit
signed counters.
To get that you need to convert 'int' => 'unsigned int' => 'unsigned long'.
One way would be:
	return (atomic_read(&eti->total_zombie_tree) + 0u + 0ul) +
		(atomic_read(&eti->total_ext_node) + 0u);

Although changing the return type to 'unsigned int' would probably
be better.
I don't know what the values are, but if they are stats counters
then that would give a value that nicely wraps at 2^32 rather
that the strange wrap that the sum of two wrapping 32bit counters
has.

OTOH it may be that they are counts - and just can't get any where
near that big.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

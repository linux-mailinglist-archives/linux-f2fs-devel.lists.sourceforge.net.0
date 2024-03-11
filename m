Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C167878A21
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Mar 2024 22:36:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjnJl-0005vi-QU;
	Mon, 11 Mar 2024 21:36:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david.laight@aculab.com>) id 1rjnJl-0005va-DF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 21:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fia4YaK/0/KKF4PdJMLwrz+g5RM2Z5dKBBO+25vpH0g=; b=JHD7DCvBwT7yoS4FmaRc1iJsyT
 fWHvCQWVLS3QSo8hJDZ5bsAERH40uFMGQJWZpbGQPjA7JQ2SNr/mABNElnMojJkIgsHjMGwuhngJH
 NpZFi5hPYk4bCPI+d5ch8HOYVARZ+wWaVCOtfuYJcTFyUkrwK8pWsqXbUZXQI4FsyFcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fia4YaK/0/KKF4PdJMLwrz+g5RM2Z5dKBBO+25vpH0g=; b=Hj14Dr+izdUr+OiHHPI0xaByT+
 ziuLKvYr3sG6FguRu9QaIT4x4G6VNGhvgpGP0Dg3utFDKBsRoRlXRSUd9cP845TCnL20wzNE2xfRY
 WF6TY050pOtRIfnsBJAL6JiRJsSPMTZJhLk4NI7JYKJBO0JS/rke5Cj/20RZxOYHIVr4=;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjnJZ-0008In-To for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 21:36:22 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-70-yp59H5P9N3qvzFeyFl6C3w-1; Mon, 11 Mar 2024 21:19:43 +0000
X-MC-Unique: yp59H5P9N3qvzFeyFl6C3w-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 11 Mar
 2024 21:19:48 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 11 Mar 2024 21:19:48 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jaegeuk Kim' <jaegeuk@kernel.org>
Thread-Topic: [PATCH] f2fs: Cast expression type to unsigned long in
 __count_extent_cache()
Thread-Index: AQHabtSs8qQLngIY8Ey8WBtnYc/JqbExQp7QgAHHeICAAAg9sA==
Date: Mon, 11 Mar 2024 21:19:48 +0000
Message-ID: <15882d97fc0c4742a119128ccc12b5dd@AcuMS.aculab.com>
References: <20240305080943.6922-1-r.smirnov@omp.ru>
 <b4f9780714e243a6af9f77ab00593ec1@AcuMS.aculab.com>
 <Ze9rb0dRKt98kK54@google.com>
In-Reply-To: <Ze9rb0dRKt98kK54@google.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Jaegeuk Kim > Sent: 11 March 2024 20:37 > On 03/10,
 David Laight wrote: > > From: Roman Smirnov > > > Sent: 05 March 2024 08:10
 > > > > > > Cast expression type to unsigned long in __count_exten [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [185.58.85.151 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [185.58.85.151 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rjnJZ-0008In-To
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
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karina Yankevich <k.yankevich@omp.ru>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, 'Roman Smirnov' <r.smirnov@omp.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim
> Sent: 11 March 2024 20:37
> On 03/10, David Laight wrote:
> > From: Roman Smirnov
> > > Sent: 05 March 2024 08:10
> > >
> > > Cast expression type to unsigned long in __count_extent_cache()
> > > to prevent integer overflow.
> > >
> > > Found by Linux Verification Center (linuxtesting.org) with Svace.
> >
> > Another broken analysis tool :-)
> >
> > > Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> > > Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> > > ---
> > >  fs/f2fs/shrinker.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> > > index 83d6fb97dcae..bb86a06c5d5e 100644
> > > --- a/fs/f2fs/shrinker.c
> > > +++ b/fs/f2fs/shrinker.c
> > > @@ -33,7 +33,7 @@ static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
> > >  {
> > >  	struct extent_tree_info *eti = &sbi->extent_tree[type];
> > >
> > > -	return atomic_read(&eti->total_zombie_tree) +
> > > +	return (unsigned long)atomic_read(&eti->total_zombie_tree) +
> > >  				atomic_read(&eti->total_ext_node);
> >
> > Makes diddly-squit difference.
> >
> > Both total_zombie_tree and totat_ext_node are 'int'.
> > If they are large enough that their sum wraps then the values
> > can individually wrap (to negative values).
> >
> > You really don't want to cast 'int' to 'unsigned long' here
> > at all - implicitly or explicitly.
> > The cast will first promote 'int' to 'signed long'.
> > So a negative value will get sign extended to a very big value.
> 
> I thought, since total_zombie_tree won't get overflowed theoritically, the first
> cast to (unsigned long) could expand the space to cover the following
> total_ext_node.

If will force the arithmetic be done as 'unsigned long' so the
second value will go through the integer promotion rules to
get from 'int' to 'unsigned long', there is an intermediate
stage of 'signed long'.
So (on 64bit) the 32bit signed value is sign extended to a
64bit signed value and the converted to 64 bit unsigned (same
bit pattern on 2s compliment systems).
The cast itself will have done the same sign extension on the
first value.

If toal_ext_node can get anywhere near 31 bits it is also likely
to get negative as well.
At which point very silly things happen is pretty much all cases
unless you only zero-extend to 64 bits.

> 
> >
> > The best you can hope for is a 33bit result from wrapped 32bit
> > signed counters.
> > To get that you need to convert 'int' => 'unsigned int' => 'unsigned long'.
> > One way would be:
> > 	return (atomic_read(&eti->total_zombie_tree) + 0u + 0ul) +
> > 		(atomic_read(&eti->total_ext_node) + 0u);
> >
> > Although changing the return type to 'unsigned int' would probably
> > be better.
> > I don't know what the values are, but if they are stats counters
> > then that would give a value that nicely wraps at 2^32 rather
> > that the strange wrap that the sum of two wrapping 32bit counters
> > has.
> >
> > OTOH it may be that they are counts - and just can't get any where
> > near that big.
> >
> > 	David
> >
> > -
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> > Registration No: 1397386 (Wales)

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5490B2AD5F5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 13:17:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcSa8-0005GK-6u; Tue, 10 Nov 2020 12:17:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david.laight@aculab.com>) id 1kcSa6-0005Fu-UV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 12:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=82X0+70U+jiNchLXaqjQiZ+HubwLjOWaLNuJ2KZXOos=; b=J/o6uRjmCLD5F3sru7kEB7zPD5
 7KfnaF50K0HCMQQPTiR9IVK8ZUr3ndHJ5DfjhlAleuUJycaiLAqy0WK9VbkfGM+Ay8cadG7iDHtQ2
 WKZhW0mcBen7JuRqCKCLSgKGcqSY4QJCm4k8CF1aUdac60QGwlFXpYqeWH3w0VrsxkjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=82X0+70U+jiNchLXaqjQiZ+HubwLjOWaLNuJ2KZXOos=; b=lNwIW/5aS1K1+YEPWJ8t3u3FUl
 W0qXInYo4m6DPwQHaxivymq7zcv8RiT0fxbKnIJOyQ3Zg8cZmCJkoPJMjfQ/8kDF+669LvyBR+pHu
 UckTbsXaRh+i59MjiA5muCIBziS5+xw93KlijSaM1jN3j4zL5ObbZn0ad3aNhmcfIs0o=;
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1kcSZr-006ftV-OS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 12:17:02 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-216-ep7CIZcmM6mQ50C-RJpcMQ-1; Tue, 10 Nov 2020 12:16:37 +0000
X-MC-Unique: ep7CIZcmM6mQ50C-RJpcMQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 10 Nov 2020 12:16:37 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 10 Nov 2020 12:16:37 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Chao Yu' <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH] f2fs: compress: support chksum
Thread-Index: AQHWtyqj1VtcccaQGU+ZRA66ANZtT6nBRPmg
Date: Tue, 10 Nov 2020 12:16:37 +0000
Message-ID: <db1d478cda6642d1b08c3435e84944d9@AcuMS.aculab.com>
References: <20201102122333.76667-1-yuchao0@huawei.com>
 <20201102163123.GD529594@google.com>
 <756e482c-b638-1c09-3868-ae45d33ed2c2@huawei.com>
 <6b5bce0e-c967-b9cf-3544-a8e65595059c@huawei.com>
 <20201106211247.GA1474936@google.com>
 <908682bb-486c-222f-bea7-43fc961ef1b0@huawei.com>
 <20201109170625.GB2129970@google.com>
 <3417aea5-ace8-74be-ec26-f491dddea676@huawei.com>
 <20201110042353.GB1598246@google.com>
 <513c56d7-cefd-37a8-efdf-fa1ac8c2a1d3@huawei.com>
In-Reply-To: <513c56d7-cefd-37a8-efdf-fa1ac8c2a1d3@huawei.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [207.82.80.151 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [207.82.80.151 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kcSZr-006ftV-OS
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: support chksum
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu
> Sent: 10 November 2020 06:28
...
> Actually, I think the both results are the same, inode chksum doesn't match inode
> metadata, like current case that cluster chksum doesn't match cluster data, it
> doesn't matter how it becomes mismatched.
> 
> And also, in those inode corrupted cases, there should be some cases that hacker
> or fuzz tester injects random data in chksum intentionally, or bit-flipping happed
> on chksum value in inode, inode metadata (except inode chksum) is integrated though,
> we can not distinguish such cases from case of inode metadata (except inode chksum)
> corruption.

If you reverse the crc algotithm on the checksum error bits and get a
pattern with a small number of adjacent ones then that would be a burst
error that would generate the observed crc error.

So if you have a 32bit crc on an 8k byte buffer there are 64k bit positions
so (IIRC from my university days) you can fix an assumed 16 bit error burst.
That would be a bit dangerous through.
OTOH if you find an 8-bit error pattern you could assume (and fix)
a single byte corruption.

Whether that is worth doing depends on any assumed mechanisms
for generating corruptions.

I don't know of any ethernet hardware that uses the 32bit crc
to fix very short burst errors (or even single bit errors)
even though it could be done and burst errors are quite likely.
(Below Ge speeds.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B23E2A4369
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 11:51:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZtuI-0003uX-Ib; Tue, 03 Nov 2020 10:51:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david.laight@aculab.com>) id 1kZtuG-0003uA-FL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 10:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mSvVQTbtMPKQ0goqCVLx9Q0dnFv9sZFEjIiudUE8VXA=; b=XA2vw5BSPCes3emVQOOMMuWFiq
 KTdISsPOHx0n62SqbqHWfQ+tl03Qlozy0AX0XbGfAx5VlsY8QyrJyvc2Ov0ncUw5oPWu36cvpaQ7q
 56P+6njkKK/ZFXlpFcpPuVl6phIFo6A19wbYadwNSjkDUSSWrIDWNIGEeo5yxFeKuoSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mSvVQTbtMPKQ0goqCVLx9Q0dnFv9sZFEjIiudUE8VXA=; b=N24w1tcFCDxmOpvXL9XfSt9snV
 nx9fE8Ui/a+0OnoDnCWFDB7+eJIqjEiZ6qqH8eZOzwQEnGPVS5TJtqz3wzTlkbuz2LI1ws1nRABJ4
 mDpAusNQBJs4vwkLpBdiZQx2jZA53pvey1sF5ev2q9voT55uzURzPbb7TshKpKeoFHpk=;
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1kZtu8-007dfD-07
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 10:51:16 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-233-2rsIwucwNt6IOklb3brp3w-1; Tue, 03 Nov 2020 10:35:14 +0000
X-MC-Unique: 2rsIwucwNt6IOklb3brp3w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 3 Nov 2020 10:35:13 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 3 Nov 2020 10:35:13 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Chao Yu' <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH] f2fs: compress: support chksum
Thread-Index: AQHWsYo6GU/sZ9yvlUirgmcRS3PqXKm2M3MA
Date: Tue, 3 Nov 2020 10:35:13 +0000
Message-ID: <aa11afd31edb42979c03d2a27ed9e850@AcuMS.aculab.com>
References: <20201102122333.76667-1-yuchao0@huawei.com>
 <20201102163123.GD529594@google.com>
 <756e482c-b638-1c09-3868-ae45d33ed2c2@huawei.com>
 <6b5bce0e-c967-b9cf-3544-a8e65595059c@huawei.com>
In-Reply-To: <6b5bce0e-c967-b9cf-3544-a8e65595059c@huawei.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [207.82.80.151 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [207.82.80.151 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kZtu8-007dfD-07
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
> Sent: 03 November 2020 02:37
...
> >> Do we need to change fsck.f2fs to recover this?
> 
> However, we don't know which one is correct, compressed data or chksum value?
> if compressed data was corrupted, repairing chksum value doesn't help.
> 
> Or how about adding chksum values for both raw data and compressed data.

What errors are you trying to detect?

If there are errors in the data then 'fixing' the checksum is pointless.
(You've got garbage data - might as well not have the checksum).

If you are worried about the implementation of the compression
algorithm then a checksum of the raw data is needed.

If you want to try error correcting burst errors in the compressed
data then a crc of the compressed data can be used for error correction.

OTOH the most likely error is that the file meta-data and data sector
weren't both committed to disk when the system crashed.
In which case the checksum has done its job and the file is corrupt.
fsck should probably move the file to 'lost+found' for manual checking.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

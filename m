Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AAD2C20ED
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Nov 2020 10:12:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khUNG-00063v-IW; Tue, 24 Nov 2020 09:12:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david.laight@aculab.com>) id 1khUNF-00063o-FG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 09:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hxhsx7U6lHbJ5mC9Wsxd4zJH84fER7aqRnXZGRAP7To=; b=UHLdwtZeyZtmxt0myAwIY6r74a
 LVeRWvk9fPIYD6e14YZjDnEn14L2UDdgPlqKPd4w2hj0KE9l1DH8JHg5H/grZLD0LzqJUAxoeRsDu
 BeSbcFzIkDzPC8xJ2Zu74jfysAdUqnm+HLOuCnYyCtCJghDEebX1A8OtXErsnTfPEsLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hxhsx7U6lHbJ5mC9Wsxd4zJH84fER7aqRnXZGRAP7To=; b=hg4hZ+AgmB5K336ngW6pJM4YXh
 cbvRlwD9S3Y1h9jO5CBkuWDHDxdD0kFZNftXRxAlqdJrBdrNUyP8c9aY+rW343gcx+Zs6AgW9BisD
 qrOwA4V3Fa3a4QbKSQB9G7nKv7I0tt9dKa8hoqlFFU2OdbQC3+Lm77bjszmL3szQpbgM=;
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1khUNC-001yGM-9f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 09:12:33 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-62--NW9eR5TMCq62nAf3IBhNg-1; Tue, 24 Nov 2020 09:12:12 +0000
X-MC-Unique: -NW9eR5TMCq62nAf3IBhNg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 24 Nov 2020 09:12:12 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 24 Nov 2020 09:12:12 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Chao Yu' <yuchao0@huawei.com>, 'Sahitya Tummala'
 <stummala@codeaurora.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH] f2fs: change to use rwsem for cp_mutex
Thread-Index: AQHWwVm8Sokw4eOdHU6M1bsTH5HkTqnV8p0QgACp5gCAAGGJ4A==
Date: Tue, 24 Nov 2020 09:12:12 +0000
Message-ID: <effbe4f5edaf4d45a64d12c65e0dc6b0@AcuMS.aculab.com>
References: <1606109312-1944-1-git-send-email-stummala@codeaurora.org>
 <7f5213fb9b334d1290f019ab8ed6ee71@AcuMS.aculab.com>
 <a1b9a134-97a8-6fb7-2fdc-d4de91dff849@huawei.com>
In-Reply-To: <a1b9a134-97a8-6fb7-2fdc-d4de91dff849@huawei.com>
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
X-Headers-End: 1khUNC-001yGM-9f
Subject: Re: [f2fs-dev] [PATCH] f2fs: change to use rwsem for cp_mutex
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu
> Sent: 24 November 2020 03:12
> 
> On 2020/11/24 1:05, David Laight wrote:
> > From: Sahitya Tummala
> >> Sent: 23 November 2020 05:29
> >>
> >> Use rwsem to ensure serialization of the callers and to avoid
> >> starvation of high priority tasks, when the system is under
> >> heavy IO workload.
> >
> > I can't see any read lock requests.
> >
> > So why the change?
> 
> Hi David,
> 
> You can check the context of this patch in below link:
> 
> https://lore.kernel.org/linux-f2fs-devel/8e094021b958f9fe01df1183a2677882@codeaurora.org/T/#t
> 
> BTW, the root cause here is that mutex lock won't serialize callers, so there
> could be potential starvation problem when this lock is always grabbed by high
> priority tasks.

That doesn't seem right.

If I read the above correctly it was high priority tasks that were
being 'starved' precisely because mutex lock serializes wakers.

If you have a lock that is contended so much that it is held 100%
of the time you need a different locking strategy.

IIRC mutex locks are 'ticket' locks so that only one thread is woken
each time the mutex is released, and they are woken in the order
they went to sleep.

While this behaviour might not be the one you want, relying on
rwsem (which might happen currently to work differently) doesn't
seem the correct long term fix.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

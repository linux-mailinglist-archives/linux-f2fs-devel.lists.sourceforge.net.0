Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A818F2C11D7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Nov 2020 18:22:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khFYG-0002DT-A9; Mon, 23 Nov 2020 17:22:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david.laight@aculab.com>) id 1khFX1-00021S-4T
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 17:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MDS3fQuCUSBh3WGWac1V1sRYBJn4D4t1VCa8QqMw4t0=; b=UOyVbOysTXBbGfZuy5xXUAplJT
 XeDr0wpyS978Ibz3wcLgWSf7DFlHb6Wx5M/3NWkTOPmSHD/y/vLGrHYWmnipcHW66YhXXJLdGCB3b
 OBqv/fl9FXJNjeW5j/SFc9YWv6y4JA9uNTPLtGYD0C3Z4VdimaIv7NwEmIsuoh/t7Md0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MDS3fQuCUSBh3WGWac1V1sRYBJn4D4t1VCa8QqMw4t0=; b=nKmYSBcl+2h9Dl0gY1gR0XJiHL
 Wa/42Lt2BXzNXZ9WXJKRExTuKuVhZLWTjIb0CQi8009c85jJ4wBRbQ7VRUfOwHNNwQtxQv4eK1QEK
 k8FhvGimt9EDjxkp/JXHZuummOwTOluiCKBqzifMp79BZNYBIapN05W8nIB2g+H9pJTQ=;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1khFWu-000pyP-M3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 17:21:39 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-221-bItNLEhdNW-xmw5Eq5Xq4Q-1; Mon, 23 Nov 2020 17:05:09 +0000
X-MC-Unique: bItNLEhdNW-xmw5Eq5Xq4Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 23 Nov 2020 17:05:08 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 23 Nov 2020 17:05:08 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Sahitya Tummala' <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH] f2fs: change to use rwsem for cp_mutex
Thread-Index: AQHWwVm8Sokw4eOdHU6M1bsTH5HkTqnV8p0Q
Date: Mon, 23 Nov 2020 17:05:08 +0000
Message-ID: <7f5213fb9b334d1290f019ab8ed6ee71@AcuMS.aculab.com>
References: <1606109312-1944-1-git-send-email-stummala@codeaurora.org>
In-Reply-To: <1606109312-1944-1-git-send-email-stummala@codeaurora.org>
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
 trust [185.58.86.151 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [185.58.86.151 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1khFWu-000pyP-M3
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

From: Sahitya Tummala
> Sent: 23 November 2020 05:29
> 
> Use rwsem to ensure serialization of the callers and to avoid
> starvation of high priority tasks, when the system is under
> heavy IO workload.

I can't see any read lock requests.

So why the change?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

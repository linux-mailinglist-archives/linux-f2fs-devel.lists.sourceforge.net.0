Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E8D39B4DC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 10:27:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lp5BD-0001zU-66; Fri, 04 Jun 2021 08:27:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david.laight@aculab.com>) id 1lp5BB-0001zM-QX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 08:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E+yDohrw9vwb7PjFBzJ6gWoOQUX5MjbeCdunV93ekVk=; b=Kcl8xnxgq8v0/ySHG0OVgq8mJB
 7zHiH9wJyyZ47lpHYHAUGxvwGuEb7DpjRzG2MJF/SBPceYEYJX6bYY1xRjDWtDzCBJm70ZhtUeQTU
 kLGW3KyvHqL475+EizAQirvdMeUfd/i6tpuTe7zKUUhvFhPWnmPfWPZrQZKIh1/SPKMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E+yDohrw9vwb7PjFBzJ6gWoOQUX5MjbeCdunV93ekVk=; b=DQkjqF9DMCkkRLp0tGGtXwXbvv
 4oX7Mf3i3l2zi528DgGtr4fH29q/t7nsBrO2f+W8fMuVS2kPrLoMzJEn4Gz8hlzXWTwLKRHK6NpSE
 ciizFnYQc7ue/I+oOxGCCnzbIMU9S4aBpTnjsH0uC3GXjMfAZZ+vblVG8TWECC+TFehM=;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lp5B6-00031v-Ur
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 08:27:47 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-230-Ui8ma5gYO-inG2DxsBorfg-1; Fri, 04 Jun 2021 09:27:33 +0100
X-MC-Unique: Ui8ma5gYO-inG2DxsBorfg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Fri, 4 Jun 2021 09:27:32 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Fri, 4 Jun 2021 09:27:32 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jaegeuk Kim' <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Thread-Topic: [PATCH v2 2/2] f2fs: Advertise encrypted casefolding in sysfs
Thread-Index: AQHXWPxv6htlFlDG3kih+WsZuRk5JqsDg75Q
Date: Fri, 4 Jun 2021 08:27:32 +0000
Message-ID: <4f56f2781fac4b8bac1a78b0fecc318d@AcuMS.aculab.com>
References: <20210603095038.314949-1-drosen@google.com>
 <20210603095038.314949-3-drosen@google.com>
 <YLlj+h4RiT6FvyK6@sol.localdomain> <YLmv5Ykb3QUzDOlL@google.com>
In-Reply-To: <YLmv5Ykb3QUzDOlL@google.com>
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
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [185.58.85.151 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lp5B6-00031v-Ur
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Advertise encrypted casefolding
 in sysfs
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
Cc: Daniel Rosenberg <drosen@google.com>,
 "kernel-team@android.com" <kernel-team@android.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim
> Sent: 04 June 2021 05:45
...
> > > @@ -161,6 +161,9 @@ static ssize_t features_show(struct f2fs_attr *a,
> > >  	if (f2fs_sb_has_compression(sbi))
> > >  		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > >  				len ? ", " : "", "compression");
> > > +	if (f2fs_sb_has_casefold(sbi) && f2fs_sb_has_encrypt(sbi))
> > > +		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > +				len ? ", " : "", "encrypted_casefold");
> > >  	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > >  				len ? ", " : "", "pin_file");
> > >  	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");

Looking at that pattern, why don't you just append "tag, "
each time and then replace the final ", " with "\n" at the end.

Although if I wanted to quickly parse that in (say) a shell
script I wouldn't really want the ",".
OTOH it is too late to change that.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC939AC62
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jun 2021 23:11:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loucg-0003F1-Sy; Thu, 03 Jun 2021 21:11:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david.laight@aculab.com>) id 1loucf-0003El-Ml
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 21:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=llC2WpOQpUi6E4iHP20pf0OXusw2NlJj/2f7IFb/nQo=; b=cySo19qGrWcGvRwAxbAuKLFqL3
 469mPccWvoFlFl4684RDdTK9g4kuR0YK9uE4TksD7fK7ianiANRT0BDA3PLuA/lrHqiW8pnD9mine
 v8DzHwsVfKZU9wTEro/9o+6idUYi7S2O4WuX5mXLSywiAuCRmJHYwKmvxIE4iGbrDlAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=llC2WpOQpUi6E4iHP20pf0OXusw2NlJj/2f7IFb/nQo=; b=Wzoo5gtReA7dU2k4wlb81ZdgE0
 QBHmwqgiskOjzP1dnh0axAN66KPoJunKM56gh5BFnvRDzsbYnEjJXs4X0gdQmIQoxHqy9GJHd89DM
 nD0ojoI+KsPd6PY0pLkjJOp9Dn1jZAWyso6+wooxy2RN/F+q8UimJzm8FE92M/Qb06LU=;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loucV-0007kR-9Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 21:11:25 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-263-dIA6wV8cOrqlc1RzI2IVVQ-1; Thu, 03 Jun 2021 21:54:53 +0100
X-MC-Unique: dIA6wV8cOrqlc1RzI2IVVQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 21:54:52 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Thu, 3 Jun 2021 21:54:52 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Greg KH' <gregkh@linuxfoundation.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2 2/2] f2fs: Advertise encrypted casefolding in sysfs
Thread-Index: AQHXWKQQ6htlFlDG3kih+WsZuRk5JqsCwvWQ
Date: Thu, 3 Jun 2021 20:54:52 +0000
Message-ID: <ed3e4f591c354ec596db4edd148a0892@AcuMS.aculab.com>
References: <20210603095038.314949-1-drosen@google.com>
 <20210603095038.314949-3-drosen@google.com> <YLipSQxNaUDy9Ff1@kroah.com>
 <YLj36Fmz3dSHmkSG@google.com> <YLkQtDZFG1xKoqE5@kroah.com>
 <YLkXFu4ep8tP3jsh@google.com> <YLkblVt+v68KFXf7@kroah.com>
In-Reply-To: <YLkblVt+v68KFXf7@kroah.com>
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
X-Headers-End: 1loucV-0007kR-9Q
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

From: Greg KH
> Sent: 03 June 2021 19:13
> 
> On Thu, Jun 03, 2021 at 10:53:26AM -0700, Jaegeuk Kim wrote:
> > On 06/03, Greg KH wrote:
> > > On Thu, Jun 03, 2021 at 08:40:24AM -0700, Jaegeuk Kim wrote:
> > > > On 06/03, Greg KH wrote:
> > > > > On Thu, Jun 03, 2021 at 09:50:38AM +0000, Daniel Rosenberg wrote:
> > > > > > Older kernels don't support encryption with casefolding. This adds
> > > > > > the sysfs entry encrypted_casefold to show support for those combined
> > > > > > features. Support for this feature was originally added by
> > > > > > commit 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> > > > > >
> > > > > > Fixes: 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> > > > > > Cc: stable@vger.kernel.org # v5.11+
> > > > > > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> > > > > > ---
> > > > > >  fs/f2fs/sysfs.c | 15 +++++++++++++--
> > > > > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > > > > > index 09e3f258eb52..6604291a3cdf 100644
> > > > > > --- a/fs/f2fs/sysfs.c
> > > > > > +++ b/fs/f2fs/sysfs.c
> > > > > > @@ -161,6 +161,9 @@ static ssize_t features_show(struct f2fs_attr *a,
> > > > > >  	if (f2fs_sb_has_compression(sbi))
> > > > > >  		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > > > >  				len ? ", " : "", "compression");
> > > > > > +	if (f2fs_sb_has_casefold(sbi) && f2fs_sb_has_encrypt(sbi))
> > > > > > +		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > > > > +				len ? ", " : "", "encrypted_casefold");
> > > > > >  	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > > > >  				len ? ", " : "", "pin_file");
> > > > > >  	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
> > > > >
> > > > > This is a HUGE abuse of sysfs and should not be encouraged and added to.
> > > >
> > > > This feature entry was originally added in 2017. Let me try to clean this up
> > > > after merging this.
> > >
> > > Thank you.
> > >
> > > > > Please make these "one value per file" and do not keep growing a single
> > > > > file that has to be parsed otherwise you will break userspace tools.
> > > > >
> > > > > And I don't see a Documentation/ABI/ entry for this either :(
> > > >
> > > > There is in Documentation/ABI/testing/sysfs-fs-f2fs.
> > >
> > > So this new item was documented in the file before the kernel change was
> > > made?
> >
> > Do we need to describe all the strings in this entry?
> >
> > 203 What:           /sys/fs/f2fs/<disk>/features
> > 204 Date:           July 2017
> > 205 Contact:        "Jaegeuk Kim" <jaegeuk@kernel.org>
> > 206 Description:    Shows all enabled features in current device.
> 
> Of course!  Especially as this is a total violation of normal sysfs
> files, how else are you going to parse the thing?
> 
> Why wouldn't you describe the contents?
> 
> But again, please obsolete this file and make the features all
> individual
> files like they should be so that you do not have any parsing problems.

My 2c:

Isn't this a list of fixed strings - rather than a list of values.
So parsing isn't that difficult.
Although it would be more sensible to add new ones at the end.

If they were in separate files you'd need to start reading the
directory to find which names were supported (or known) and then
read the file itself to see if it was actually in use.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394271A345
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 17:53:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4kc2-0007wO-Mn;
	Thu, 01 Jun 2023 15:53:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david.laight@aculab.com>) id 1q4kc2-0007wI-9n
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 15:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qpxmZLZ5cP4CMuns31xPxEBaXDHT8A2MbAGGojZNp4s=; b=bgyGgeFEdHF84GASyri+HFv4EI
 jo1Az33bhwC+wmy/NhzSaUVXQFaRmSD0MkkCmztomC9ADL8fgLtFprUT+4gEWfzoIQggSr+2btexW
 ZVF5xOUgW7t4PoMm2xBTeQ+6BDPn+ipB7mnI47VymMqqsy2YhZ29cBJ3RGSgH9PmD18w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qpxmZLZ5cP4CMuns31xPxEBaXDHT8A2MbAGGojZNp4s=; b=OwODA2CFqWvxJUX8Oqf4Dz+KeB
 2+prlrT9jNaeRGomRyBD2e2XJ0HZej/2K2a4ONgWQsi9X8PO2yZ6egvn2zNpwPK8W220yUmTysi8T
 +i2eFLJyG458H5zkDVAjC69vIUbhjdhl57tNFjZlEoLVd7tQWj+X0By4pATvghiJM95c=;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4kbz-0001ND-UR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 15:53:18 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-263-AHup6Xd1OrWFzyw2F6GqSw-1; Thu, 01 Jun 2023 16:37:36 +0100
X-MC-Unique: AHup6Xd1OrWFzyw2F6GqSw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 1 Jun
 2023 16:37:32 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 1 Jun 2023 16:37:32 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jan Kara' <jack@suse.cz>, Christian Brauner <brauner@kernel.org>
Thread-Topic: [PATCH v2 4/6] fs: Establish locking order for unrelated
 directories
Thread-Index: AQHZlJ1FZufsO2GDRE+EhxV9kbhF9692EqgQ
Date: Thu, 1 Jun 2023 15:37:32 +0000
Message-ID: <c5f209a6263b4f039c5eafcafddf90ca@AcuMS.aculab.com>
References: <20230601104525.27897-1-jack@suse.cz>
 <20230601105830.13168-4-jack@suse.cz>
 <20230601-gebracht-gesehen-c779a56b3bf3@brauner>
 <20230601152449.h4ur5zrfqjqygujd@quack3>
In-Reply-To: <20230601152449.h4ur5zrfqjqygujd@quack3>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ... > > > + * Lock any non-NULL argument. The caller must
 make sure that if he is passing > > > + * in two directories,
 one is not ancestor
 of the other Not directly relevant to this change but is the 'not an ancestor'
 check actually robust? 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [185.58.86.151 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [185.58.86.151 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1q4kbz-0001ND-UR
Subject: Re: [f2fs-dev] [PATCH v2 4/6] fs: Establish locking order for
 unrelated directories
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
Cc: Ted Tso <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>, "Darrick
 J. Wong" <djwong@kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 Al Viro <viro@ZenIV.linux.org.uk>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

...
> > > + * Lock any non-NULL argument. The caller must make sure that if he is passing
> > > + * in two directories, one is not ancestor of the other

Not directly relevant to this change but is the 'not an ancestor'
check actually robust?

I found a condition in which the kernel 'pwd' code (which follows
the inode chain) failed to stop at the base of a chroot.

I suspect that the ancestor check would fail the same way.

IIRC the problematic code used unshare() to 'escape' from
a network natespace.
If it was inside a chroot (that wasn't on a mount point) there
ware two copies of the 'chroot /' inode and the match failed.

I might be able to find the test case.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

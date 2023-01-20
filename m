Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444767538A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jan 2023 12:43:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIpnN-0004xW-1v;
	Fri, 20 Jan 2023 11:42:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david.laight@aculab.com>) id 1pIpnL-0004xQ-Hv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 11:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e8FecXcOocV24EzXGtkpJ8Dhj7SttAoq1+DWjNIDOoY=; b=Zx6m9+OfVZGn4KtduLvqVGVwcr
 mEKVSE3HndRj3zVpuw9Cqq0rYMvu+9xqIc8KEASMEHU5VZvXo31ey86hPlfqMKTsJfoM/iTjQmS1m
 bvkQ6Rq2mNBbvJ9jqd9yidX7DWv8M7z7JvgvreMiBZhVDd1HN9hZ7vL6fWGanMIgYNwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e8FecXcOocV24EzXGtkpJ8Dhj7SttAoq1+DWjNIDOoY=; b=loofY380wC5EF4N/V00pEp8hjO
 1kjqKn3H2785K9x5z2gI84+Qe9Dtom4PLX0p/y9XKZlRE4DVRn7leYYF7RXuujCzccd67SGkybDRK
 vPTGD9qXVKRd4Nb0w1LglGDm3FesuLMDOIR+NheCJ7UP04xwn5oOH11heniUi5/7vtJY=;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIpnI-00A8fX-EK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 11:42:54 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-129-4gsduPDlOrGmwEjdKMB1gA-1; Fri, 20 Jan 2023 11:42:44 +0000
X-MC-Unique: 4gsduPDlOrGmwEjdKMB1gA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 11:42:42 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Fri, 20 Jan 2023 11:42:42 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Rob Landley
 <rob@landley.net>
Thread-Topic: Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
Thread-Index: AQHZLL5SlbpKhYJiU02AbZRDtfTmb66nLCYA
Date: Fri, 20 Jan 2023 11:42:42 +0000
Message-ID: <931141d03e8748cebad42aff1a508d7f@AcuMS.aculab.com>
References: <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
 <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
 <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
 <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
 <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
 <0d238f02-4d78-6f14-1b1b-f53f0317a910@physik.fu-berlin.de>
 <1732342f-49fe-c20e-b877-bc0a340e1a50@fu-berlin.de>
 <0f51dac4-836b-0ff2-38c6-5521745c1c88@landley.net>
 <20230120105341.GI25951@gate.crashing.org>
In-Reply-To: <20230120105341.GI25951@gate.crashing.org>
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
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Segher Boessenkool > Sent: 20 January 2023 10:54 ...
 > > > I suggest to file a bug against gcc complaining about a "spurious >
 > > warning", and using "-Werror -Wno-error-sizeof-pointer-div" unt [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [185.58.86.151 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1pIpnI-00A8fX-EK
Subject: Re: [f2fs-dev] Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Arnd
 Bergmann <arnd@arndb.de>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "Michael.Karcher" <Michael.Karcher@fu-berlin.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Segher Boessenkool
> Sent: 20 January 2023 10:54
...
> > > I suggest to file a bug against gcc complaining about a "spurious
> > > warning", and using "-Werror -Wno-error-sizeof-pointer-div" until gcc is
> > > adapted to not emit the warning about the pointer division if the result
> > > is not used.
> 
> Yeah.  If the first operand of a conditional operator is non-zero, the
> second operand is not evaluated, and if the first is zero, the third
> operand is not evaluated.  It is better if we do not warn about
> something we do not evaluate.  In cases like here where it is clear at
> compile time which branch is taken, that shouldn't be too hard.
> 
> Can someone please file a GCC PR?  With reduced testcase preferably.

It's not a bug.
All the operands of the conditional operator have to be valid.
It might be that the optimiser can discard one, but that happens
much later on.
Even the operands of choose_expr() have to be valid - but can
have different types.

I'm not sure what the code is trying to do or why it is failing.
Was it a fail in userspace - where the option to allow sizeof (void)
isn't allowed.

FWIW you can check for a compile-time NULL (or 0) with:
#define is_null(x) (sizeof *(0 : (void *)(x) ? (int *)0) != 1)

Although that is a compile-time error for non-NULL unless
'void *' arithmetic is allowed.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

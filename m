Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C271F6B046E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Mar 2023 11:33:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZr6o-0008Qx-Jn;
	Wed, 08 Mar 2023 10:33:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david.laight@aculab.com>) id 1pZr6k-0008QR-BO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Mar 2023 10:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6oJq2S5DkSgyuEiCBZu1W6z/4TgZv9HdLUKj/ZzNlOc=; b=LqIU2shOL+OpO/lAV0+gXiVnzq
 vK+tp5Z78Bb7Psb4cNd0ezDI6mVBZS9NBeZ03qfJjjtL6t4ifrKw1IbPgPL3rvuFrGBThxcaGdARs
 PCn0Q4herJlqup881CkAGdpZJ0Aa6bDQquV80yVq0AHGyQdh11Dm97bGZYWFPirrXY90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6oJq2S5DkSgyuEiCBZu1W6z/4TgZv9HdLUKj/ZzNlOc=; b=kpwJ0pnJbpIL1wNS7NUuM7xYyQ
 qUj/0r/UeShEuZYk5nt5FARGm58+motFHpPpuuYS58/ightpQq7YJZosvfpkCTECDON2ZVqxBd92K
 x35d1Z1F9awqagn0WuTbkGIO62wK4mMrGMABoHCecnjw1WINmqQ/QIcnEDBAF9HFxqGs=;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZr6i-000c5h-BL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Mar 2023 10:33:18 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-94-zZEPLqmLP0yTudXVspLNZQ-1; Wed, 08 Mar 2023 10:17:01 +0000
X-MC-Unique: zZEPLqmLP0yTudXVspLNZQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.47; Wed, 8 Mar
 2023 10:16:59 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.047; Wed, 8 Mar 2023 10:16:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Chao Yu' <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH] f2fs: fix unaligned field offset in 32-bits platform
Thread-Index: AQHZUQf4b45n81mohk6KYf6qmq4uP67wqZ1A
Date: Wed, 8 Mar 2023 10:16:59 +0000
Message-ID: <942fe8111fdb48e583b846f3e2902228@AcuMS.aculab.com>
References: <20230307151408.58490-1-chao@kernel.org>
In-Reply-To: <20230307151408.58490-1-chao@kernel.org>
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
 Content preview: From: Chao Yu <chao@kernel.org> > Sent: 07 March 2023 15:14
 > > F2FS-fs (dm-x): inconsistent rbtree, cur(3470333575168) next(3320009719808)
 > [ cut here ] > kernel BUG at fs/f2 [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [185.58.86.151 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1pZr6i-000c5h-BL
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix unaligned field offset in 32-bits
 platform
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>
> Sent: 07 March 2023 15:14
> 
> F2FS-fs (dm-x): inconsistent rbtree, cur(3470333575168) next(3320009719808)
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/gc.c:602!
> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> PC is at get_victim_by_default+0x13c0/0x1498
> LR is at f2fs_check_rb_tree_consistence+0xc4/0xd4
> ....
> [<c04d98b0>] (get_victim_by_default) from [<c04d4f44>] (f2fs_gc+0x220/0x6cc)
> [<c04d4f44>] (f2fs_gc) from [<c04d4780>] (gc_thread_func+0x2ac/0x708)
> [<c04d4780>] (gc_thread_func) from [<c015c774>] (kthread+0x1a8/0x1b4)
> [<c015c774>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> 
> The reason is there is __packed attribute in struct rb_entry, but there
> is no __packed attribute in struct victim_entry, so wrong offset of key
> field will be parsed in struct rb_entry in f2fs_check_rb_tree_consistence,
> it describes memory layouts of struct rb_entry and struct victim_entry in
> 32-bits platform as below:
> 
> struct rb_entry {
>    [0] struct rb_node rb_node;
>        union {
>            struct {...};
>   [12]     unsigned long long key;
>        } __packed;

This __packed removes the 4-byte pad before the union.
I bet it should be removed...

> }
> size of struct rb_entry: 20
> 
> struct victim_entry {
>    [0] struct rb_node rb_node;
>        union {
>            struct {...};
>   [16]     struct victim_info vi;
>        };
>   [32] struct list_head list;
> }
> size of struct victim_entry: 40
> 
> This patch tries to add __packed attribute in below structure:
> - discard_info, discard_cmd
> - extent_info, extent_node
> - victim_info, victim_entry
> in order to fix this unaligned field offset issue in 32-bits platform.

Have you looked at the amount of extra code that gets generated
on systems that fault misaligned accesses?

Plausibly adding __packed __aligned(4) will restrict the compiler
to just aligning 64bit items on 32bit boundaries.
But even then is you pass the address of a misaligned structure
to another function it will fault later of.

You haven't actually said where the misalignment comes from.
If the code is doing (foo *)(ptr + 1) then that is broken
when the alignments of 'ptr' and 'foo' differ.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

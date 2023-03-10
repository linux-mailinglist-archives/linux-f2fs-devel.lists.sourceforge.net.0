Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734E6B3A66
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Mar 2023 10:28:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1paZ3F-00076Y-VE;
	Fri, 10 Mar 2023 09:28:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david.laight@aculab.com>) id 1paZ3D-00076S-DG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Mar 2023 09:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c9g4fhb6CcwCrk3FgbNXPkWjt325J+bCAn/y357NsYs=; b=Uafe64y/hssLId1LCj2cJNX9xl
 CL62xEsiUc7ZWeWz1UrWmtv8HRzuGHwtyhq1dOk0Q7s7GSBarhocbaLaiRpZbPJLw8E8MWRtS3cgn
 ZArf5c8X9mDZMY+clXgpnvh/tZcdfLAm5KkU+W7wzk9BzFMk6TEK7U5++CvzptF4uf78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c9g4fhb6CcwCrk3FgbNXPkWjt325J+bCAn/y357NsYs=; b=E5MN56s6OT3mlZbe6LyQOTtNJH
 rjCmF4+8kA3ZH9ulMXePU2ERDCiAclopSRqawBMEbHUZt8EBxcxS7Kf6BYZ2SvPOHebopDAhoCFk8
 RVDdShhMk2mZaID9nZO5hOJK8lFrhsadiAbyLWN26RYDQDTbq9kHRNwSbBvoCFK4mkuE=;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1paZ39-000257-2p for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Mar 2023 09:28:35 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-159-vKUi8V-KMYKHbSDPHvzBqg-1; Fri, 10 Mar 2023 09:28:22 +0000
X-MC-Unique: vKUi8V-KMYKHbSDPHvzBqg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.47; Fri, 10 Mar
 2023 09:28:19 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.047; Fri, 10 Mar 2023 09:28:19 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jaegeuk Kim' <jaegeuk@kernel.org>
Thread-Topic: [PATCH] f2fs: fix unaligned field offset in 32-bits platform
Thread-Index: AQHZUQf4b45n81mohk6KYf6qmq4uP67wqZ1AgAJ5ZoCAAJUJQA==
Date: Fri, 10 Mar 2023 09:28:19 +0000
Message-ID: <362576043b2f4c56a3ea112364d04fcd@AcuMS.aculab.com>
References: <20230307151408.58490-1-chao@kernel.org>
 <942fe8111fdb48e583b846f3e2902228@AcuMS.aculab.com>
 <ZApxy2u9j3yKFRyS@google.com>
In-Reply-To: <ZApxy2u9j3yKFRyS@google.com>
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
 Content preview:  From: Jaegeuk Kim > Sent: 09 March 2023 23:55 > > On 03/08, 
 David Laight wrote: > > From: Chao Yu <chao@kernel.org> > > > Sent: 07 March
 2023 15:14 > > > > > > F2FS-fs (dm-x): inconsistent rbtree, cur [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [185.58.86.151 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1paZ39-000257-2p
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

From: Jaegeuk Kim
> Sent: 09 March 2023 23:55
> 
> On 03/08, David Laight wrote:
> > From: Chao Yu <chao@kernel.org>
> > > Sent: 07 March 2023 15:14
> > >
> > > F2FS-fs (dm-x): inconsistent rbtree, cur(3470333575168) next(3320009719808)
> > > ------------[ cut here ]------------
> > > kernel BUG at fs/f2fs/gc.c:602!
> > > Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> > > PC is at get_victim_by_default+0x13c0/0x1498
> > > LR is at f2fs_check_rb_tree_consistence+0xc4/0xd4
> > > ....
> > > [<c04d98b0>] (get_victim_by_default) from [<c04d4f44>] (f2fs_gc+0x220/0x6cc)
> > > [<c04d4f44>] (f2fs_gc) from [<c04d4780>] (gc_thread_func+0x2ac/0x708)
> > > [<c04d4780>] (gc_thread_func) from [<c015c774>] (kthread+0x1a8/0x1b4)
> > > [<c015c774>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> > >
> > > The reason is there is __packed attribute in struct rb_entry, but there
> > > is no __packed attribute in struct victim_entry, so wrong offset of key
> > > field will be parsed in struct rb_entry in f2fs_check_rb_tree_consistence,
> > > it describes memory layouts of struct rb_entry and struct victim_entry in
> > > 32-bits platform as below:
> > >
> > > struct rb_entry {
> > >    [0] struct rb_node rb_node;
> > >        union {
> > >            struct {...};
> > >   [12]     unsigned long long key;
> > >        } __packed;
> >
> > This __packed removes the 4-byte pad before the union.
> > I bet it should be removed...
> 
> struct rb_node {
>         unsigned long  __rb_parent_color;
>         struct rb_node *rb_right;
>         struct rb_node *rb_left;
> } __attribute__((aligned(sizeof(long))));
> 
> Hmm, isn't this aligned to 32bits originally? Why does 32bits pad 4-bytes
> if we remove __packed?

That attribute is entirely pointless.
IIRC It is a request to increase the alignment to that of long.
It wouldn't have any effect even if 'packed' was also specified.
(Unless you are building for 64-bit windows.)

The 'issue' is that on arm32 (unlike x86) 'long long' has
64bit alignment.
So without the __packed on the union there is a 4 byte hole
before the union.

...
> IIUC, the problem comes since we access the same object with two structures
> to handle rb_tree.
> 
> E.g.,
> 
> [struct extent_node]                   [struct rb_entry]
> struct rb_node rb_node;                struct rb_node rb_node;
>                                        union {
> struct extent_info ei;                   struct {
>   unsigned int fofs;                       unsigned int ofs;
>   unsigned int len;                        unsigned int len;
>                                          };
>                                          unsigned long long key;
>                                        } __packed;
> 
> So, I think if we get a different offset of fofs or ofs between in
> extent_node and rb_entry, further work'll access a wrong memory since
> we simply cast the object pointer between two.

That example actually happens to work.
But replace 'unsigned int' with 'long long' and it all fails.

That is horribly broken (by design).
You can't do that and expect it to work at all.
This is another case where you don't want __packed, but to
request a compilation error if padding was added.

The safest 'fix' (it is still broken by design) is to change the
alignment of rb_node to be that of 'long long' and remove the
__packed from the union.
That adds a 4 byte pad to rb_node on some, but not all, 32bit
architectures.
Then all the code that used the above pattern is (probably) ok.

You can use (if I've spelt them right) aligned(Alignof(long long))
but not aligned(__alignof(long long)) because the latter returns
the preferred alignment not the actual alignment (8 not 4 on x86).
I think Alignof() is ok for current kernels, but not for anything
that might get backported to stable.
You can use __alignof(struct {long long x;}).

Actually this should also work:
struct rb_node {
    union {
        long long alignment;
        struct {
            unsigned long  __rb_parent_color;
            struct rb_node *rb_right;
            struct rb_node *rb_left;
        }
    }
};

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

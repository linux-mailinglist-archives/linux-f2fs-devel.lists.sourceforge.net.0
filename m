Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 939784C7DCB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 23:50:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOoqZ-0000TS-LZ; Mon, 28 Feb 2022 22:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pobrn@protonmail.com>)
 id 1nOoqX-0000T9-9H; Mon, 28 Feb 2022 22:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Reply-To:Cc:From:To:Date:Sender:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EcotLxkQaYgY6ajZYic/GfxM/AoG16BTcQ37oNetF9g=; b=HEhZpV2GN7flNpyJBsoaeDqdvM
 5JR+9K0ml5dcJjYxCD5I8cfiTnXxtpl/s9A3AXrdTEW7WK0e0ODYTdz+PL5osq1d+Cfe4SJXZPXN0
 dXAs5cIb7vefCc400ct7zH/BKR105HjW7lmVUkAK7ilBtHhxVnBJ33DGcMUPQHfoKYq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Reply-To:Cc:From:To:Date:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EcotLxkQaYgY6ajZYic/GfxM/AoG16BTcQ37oNetF9g=; b=fpM6ieagdnTvRjgnUb0Mm5C0Tp
 YA5M+x2wBkUxkKg5FIGzDZfN/apC+PYNdMds2x/eQlIQ46kVN8vr+U9LvTgD0brqEaSelFf1AKX4T
 ZFaTR2p4BA0oWWg87rX6YaOVvX4cd2QNKjFdGGCw8WrhD1/fvdDG4LqJRvsthnfP06BU=;
Received: from mail-4316.protonmail.ch ([185.70.43.16])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nOoqV-000a2q-4k; Mon, 28 Feb 2022 22:50:23 +0000
Date: Mon, 28 Feb 2022 22:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1646088609;
 bh=EcotLxkQaYgY6ajZYic/GfxM/AoG16BTcQ37oNetF9g=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=cBGwkD0dY6C6UZ8ZjhjHcbwM06BMDKF9S/uxRi+rS2UvdSsFLFOG1HSm6qlJyiCUO
 uC1XgssvVNSFSsxdHJ1aOl5NwIA18vjg17jCvCkv13dOUO+5hOt3OCcfXLX2AxvryX
 lsXEg4vAoBljMT4ewAP2cK1EUDuyezakLW8pnSEAczd9xFJNkZ4Y3ZLxhFb22yslY3
 3xdTS3cTZ9GeOv+wrf2xTPfY4Kamc1tDDmDy3yCaRm+7b1f1xP0Y+5xR0FjORV+5kM
 cK85iRo45YcxaJSZ64KqeuDyrCIZDsEiDwE78vJR0ycrL/ZWpMTXDPzJnBHTv4Qo8t
 TiTx0AcdTLM/g==
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Message-ID: <Ax76nlte5gO6McgVlkdlM8SHBdfYoG0hb6pFO3MJ6iEg3VCk3kzPWFQ6HS2uVDB8eeyLSr4ku62pXF-FrsROsQvF_VDAW1I5lXTFZTkkMfk=@protonmail.com>
In-Reply-To: <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi 2022. február 28., hétfő 23:28 keltezéssel, James Bottomley
    írta: > [...] > Well, yes, but my objection is more to the size of churn
    than the > desire to do loop local. I'm not even sure loop loc [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [pobrn[at]protonmail.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
                             [185.70.43.16 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOoqV-000a2q-4k
Subject: Re: [f2fs-dev] [PATCH 2/6] treewide: remove using list iterator
 after loop body as a ptr
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
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkKCgoyMDIyLiBmZWJydcOhciAyOC4sIGjDqXRmxZEgMjM6Mjgga2VsdGV6w6lzc2VsLCBKYW1l
cyBCb3R0b21sZXkgw61ydGE6Cj4gWy4uLl0KPiBXZWxsLCB5ZXMsIGJ1dCBteSBvYmplY3Rpb24g
aXMgbW9yZSB0byB0aGUgc2l6ZSBvZiBjaHVybiB0aGFuIHRoZQo+IGRlc2lyZSB0byBkbyBsb29w
IGxvY2FsLiAgSSdtIG5vdCBldmVuIHN1cmUgbG9vcCBsb2NhbCBpcyBwb3NzaWJsZSwKPiBiZWNh
dXNlIGl0J3MgYWx3YXlzIGFubm95ZWQgbWUgdGhhdCBmb3IgKGludCBpID0gMDsgLi4uICBpbiBD
KysgZGVmaW5lcwo+IGkgaW4gdGhlIG91dGVyIHNjb3BlIG5vdCB0aGUgbG9vcCBzY29wZSwgd2hp
Y2ggaXMgd2h5IEkgbmV2ZXIgdXNlIGl0LgoKSXQgaXMgYXJndWFibHkgb2ZmLXRvcGljIHRvIHRo
ZSBkaXNjdXNzaW9uIGF0IGhhbmQsIGJ1dCBJIHRoaW5rIHlvdSBtaWdodCBiZQp0aGlua2luZyBv
ZiBzb21ldGhpbmcgZWxzZSAob3IgbWF5YmUgaXQgd2FzIHRoZSBjYXNlIGluIGFuIGFuY2llbnQg
dmVyc2lvbiBvZiBDKyspCmJlY2F1c2UgdGhhdCBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgY2FzZS4g
SWYgaXQgd2VyZSwKCiAgZm9yIChpbnQgaSAuLi4pIHsgLi4uIH0KICBmb3IgKGludCBpIC4uLikg
eyAuLi4gfQoKd291bGQgaGF2ZSB0byB0cmlnZ2VyIGEgcmVkZWNsYXJhdGlvbiBlcnJvciwgYnV0
IHRoYXQgaGFwcGVucyBuZWl0aGVyIGluIEMrKyBub3IgaW4gQy4KVGhlIHZhcmlhYmxlIGlzIGFs
c28gaW5hY2Nlc3NpYmxlIG91dHNpZGUgdGhlIGxvb3AuCgoKPiBbLi4uXQoKClJlZ2FyZHMsCkJh
cm5hYsOhcyBQxZFjemUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

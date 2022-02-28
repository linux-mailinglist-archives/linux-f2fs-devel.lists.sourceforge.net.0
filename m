Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C21FC4C7CA2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 23:01:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOo5B-0002t9-V9; Mon, 28 Feb 2022 22:01:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rppt@kernel.org>)
 id 1nOo5A-0002sd-MU; Mon, 28 Feb 2022 22:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P/DNDgEd0l9TOpRCWF1a8Xko9Vhvu9jCGYlkYfT6DgM=; b=cKQ9/sfsT9b40VszQF5Dd9ltg4
 BvBNeu28QfYMVpHascLX9QeXD1gWN6FPfIlfrIQSvXGBN5+Q+pj9RbTow/v8FYppqf3xfiJEkc6bB
 +hZ6dVUMll1zsujgiGu13dFq/ppa7Ty9KyDS9/5OAwTrIdcwCXF4nMu/lErxhtGFu1iA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References
 :In-Reply-To:Subject:CC:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P/DNDgEd0l9TOpRCWF1a8Xko9Vhvu9jCGYlkYfT6DgM=; b=jEHFc0k9MwwF+Zl5kJjQaRm7EV
 3Vvd8XL2XBv/eFPEcckIdrArQqvt1zTeDsZ730HtAtjPfComJ7zntKeDSj7ZuowEvxTAWuldzL074
 vw//4pgeQKewFQSzzRUa6/psoG9SCqhQhhErQ35Ii9SII6evvdDpJhjgrneqfRc7RU08=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nOo58-000XoG-Du; Mon, 28 Feb 2022 22:01:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5CBD2B8169B;
 Mon, 28 Feb 2022 22:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677EEC340F1;
 Mon, 28 Feb 2022 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646085677;
 bh=bmzYeqH+wd1Y/i05gxZoeqc9TywPR9wpt0imv9Fx7Nw=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=lb9MoeFhEeGqaET4WoooJnliR/Aftbuf2qgeJWcsJRMUD7lxaPDCkpbBw1fltPmKc
 jIEBu8SnVjgO3Aaf+8FYuXvVgG5MgAciJgva3R/8WVNn/ktDFk3hANDz2GKUoZWtxI
 SvipV/Wo2m8Yu0T44/FsB9ncJWS6zqb8Cis19xBBpG1gsQAhwdKCM2xymmzy1B6vAh
 NLgpj3CkfoCj7XXB9+t8bZHUSaMtCcXi/0/BYE3ppk5zRyoiwaHoQXmDsDHRdh2g9L
 BKDOg0IEHzQ+qInzyklcGdLSrMWPhR+ZxEuCQewyXU3mL+4cdRVVpWMroWAhmtcL3w
 /5xJdekiDQkIw==
Date: Mon, 28 Feb 2022 23:59:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Linus	Torvalds <torvalds@linux-foundation.org>
User-Agent: K-9 Mail for Android
In-Reply-To: <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
Message-ID: <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On February 28, 2022 10:42:53 PM GMT+02:00, James Bottomley
    <James.Bottomley@HansenPartnership.com> wrote: >On Mon, 2022-02-28 at 21:07
    +0100, Christian König wrote: >> Am 28.02.22 um 20:56 schrieb L [...] 
 
 Content analysis details:   (-5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.68.75 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nOo58-000XoG-Du
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiBGZWJydWFyeSAyOCwgMjAyMiAxMDo0Mjo1MyBQTSBHTVQrMDI6MDAsIEphbWVzIEJvdHRv
bWxleSA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT4gd3JvdGU6Cj5PbiBN
b24sIDIwMjItMDItMjggYXQgMjE6MDcgKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDI4LjAyLjIyIHVtIDIwOjU2IHNjaHJpZWIgTGludXMgVG9ydmFsZHM6Cj4+ID4gT24gTW9u
LCBGZWIgMjgsIDIwMjIgYXQgNDoxOSBBTSBDaHJpc3RpYW4gS8O2bmlnCj4+ID4gPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4+ID4gPiBJIGRvbid0IHRoaW5rIHRoYXQgdXNpbmcg
dGhlIGV4dHJhIHZhcmlhYmxlIG1ha2VzIHRoZSBjb2RlIGluIGFueQo+PiA+ID4gd2F5Cj4+ID4g
PiBtb3JlIHJlbGlhYmxlIG9yIGVhc2llciB0byByZWFkLgo+PiA+IFNvIEkgdGhpbmsgdGhlIG5l
eHQgc3RlcCBpcyB0byBkbyB0aGUgYXR0YWNoZWQgcGF0Y2ggKHdoaWNoCj4+ID4gcmVxdWlyZXMK
Pj4gPiB0aGF0ICItc3RkPWdudTExIiB0aGF0IHdhcyBkaXNjdXNzZWQgaW4gdGhlIG9yaWdpbmFs
IHRocmVhZCkuCj4+ID4gCj4+ID4gVGhhdCB3aWxsIGd1YXJhbnRlZSB0aGF0IHRoZSAncG9zJyBw
YXJhbWV0ZXIgb2YKPj4gPiBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkKPj4gPiBpcyBvbmx5IHVwZGF0
ZWQgSU5TSURFIHRoZSBmb3JfZWFjaF9saXN0X2VudHJ5KCkgbG9vcCwgYW5kIGNhbgo+PiA+IG5l
dmVyCj4+ID4gcG9pbnQgdG8gdGhlICh3cm9uZ2x5IHR5cGVkKSBoZWFkIGVudHJ5Lgo+PiA+IAo+
PiA+IEFuZCBJIHdvdWxkIGFjdHVhbGx5IGhvcGUgdGhhdCBpdCBzaG91bGQgYWN0dWFsbHkgY2F1
c2UgY29tcGlsZXIKPj4gPiB3YXJuaW5ncyBhYm91dCBwb3NzaWJseSB1bmluaXRpYWxpemVkIHZh
cmlhYmxlcyBpZiBwZW9wbGUgdGhlbiB1c2UKPj4gPiB0aGUKPj4gPiAncG9zJyBwb2ludGVyIG91
dHNpZGUgdGhlIGxvb3AuIEV4Y2VwdAo+PiA+IAo+PiA+ICAgKGEpIHRoYXQgY29kZSBpbiBzZ3gv
ZW5jbC5jIGN1cnJlbnRseSBpbml0aWFsaXplcyAndG1wJyB0byBOVUxMCj4+ID4gZm9yCj4+ID4g
aW5leHBsaWNhYmxlIHJlYXNvbnMgLSBwb3NzaWJseSBiZWNhdXNlIGl0IGFscmVhZHkgZXhwZWN0
ZWQgdGhpcwo+PiA+IGJlaGF2aW9yCj4+ID4gCj4+ID4gICAoYikgd2hlbiBJIHJlbW92ZSB0aGF0
IE5VTEwgaW5pdGlhbGl6ZXIsIEkgc3RpbGwgZG9uJ3QgZ2V0IGEKPj4gPiB3YXJuaW5nLAo+PiA+
IGJlY2F1c2Ugd2UndmUgZGlzYWJsZWQgLVduby1tYXliZS11bmluaXRpYWxpemVkIHNpbmNlIGl0
IHJlc3VsdHMgaW4KPj4gPiBzbwo+PiA+IG1hbnkgZmFsc2UgcG9zaXRpdmVzLgo+PiA+IAo+PiA+
IE9oIHdlbGwuCj4+ID4gCj4+ID4gQW55d2F5LCBnaXZlIHRoaXMgcGF0Y2ggYSBsb29rLCBhbmQg
YXQgbGVhc3QgaWYgaXQncyBleHBhbmRlZCB0byBkbwo+PiA+ICIocG9zKSA9IE5VTEwiIGluIHRo
ZSBlbnRyeSBzdGF0ZW1lbnQgZm9yIHRoZSBmb3ItbG9vcCwgaXQgd2lsbAo+PiA+IGF2b2lkIHRo
ZSBIRUFEIHR5cGUgY29uZnVzaW9uIHRoYXQgSmFrb2IgaXMgd29ya2luZyBvbi4gQW5kIEkgdGhp
bmsKPj4gPiBpbiBhIGNsZWFuZXIgd2F5IHRoYW4gdGhlIGhvcnJpZCBnYW1lcyBoZSBwbGF5cy4K
Pj4gPiAKPj4gPiAoQnV0IGl0IHdvbid0IGF2b2lkIHBvc3NpYmxlIENQVSBzcGVjdWxhdGlvbiBv
ZiBzdWNoIHR5cGUKPj4gPiBjb25mdXNpb24uIFRoYXQsIGluIG15IG9waW5pb24sIGlzIGEgY29t
cGxldGVseSBkaWZmZXJlbnQgaXNzdWUpCj4+IAo+PiBZZXMsIGNvbXBsZXRlbHkgYWdyZWUuCj4+
IAo+PiA+IEkgZG8gd2lzaCB3ZSBjb3VsZCBhY3R1YWxseSBwb2lzb24gdGhlICdwb3MnIHZhbHVl
IGFmdGVyIHRoZSBsb29wCj4+ID4gc29tZWhvdyAtIGJ1dCBjbGVhcmx5IHRoZSAibWlnaHQgYmUg
dW5pbml0aWFsaXplZCIgSSB3YXMgaG9waW5nIGZvcgo+PiA+IGlzbid0IHRoZSB3YXkgdG8gZG8g
aXQuCj4+ID4gCj4+ID4gQW55Ym9keSBoYXZlIGFueSBpZGVhcz8KPj4gCj4+IEkgdGhpbmsgd2Ug
c2hvdWxkIGxvb2sgYXQgdGhlIHVzZSBjYXNlcyB3aHkgY29kZSBpcyB0b3VjaGluZyAocG9zKQo+
PiBhZnRlciB0aGUgbG9vcC4KPj4gCj4+IEp1c3QgZnJvbSBza2ltbWluZyBvdmVyIHRoZSBwYXRj
aGVzIHRvIGNoYW5nZSB0aGlzIGFuZCBleHBlcmllbmNlCj4+IHdpdGggdGhlIGRyaXZlcnMvc3Vi
c3lzdGVtcyBJIGhlbHAgdG8gbWFpbnRhaW4gSSB0aGluayB0aGUgcHJpbWFyeQo+PiBwYXR0ZXJu
IGxvb2tzIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+IAo+PiBsaXN0X2Zvcl9lYWNoX2VudHJ5KGVu
dHJ5LCBoZWFkLCBtZW1iZXIpIHsKPj4gICAgICBpZiAoc29tZV9jb25kaXRpb25fY2hlY2tpbmco
ZW50cnkpKQo+PiAgICAgICAgICBicmVhazsKPj4gfQo+PiBkb19zb21ldGhpbmdfd2l0aChlbnRy
eSk7Cj4KPgo+QWN0dWFsbHksIHdlIHVzdWFsbHkgaGF2ZSBhIGNoZWNrIHRvIHNlZSBpZiB0aGUg
bG9vcCBmb3VuZCBhbnl0aGluZywKPmJ1dCBpbiB0aGF0IGNhc2UgaXQgc2hvdWxkIHNvbWV0aGlu
ZyBsaWtlCj4KPmlmIChsaXN0X2VudHJ5X2lzX2hlYWQoZW50cnksIGhlYWQsIG1lbWJlcikpIHsK
PiAgICByZXR1cm4gd2l0aCBlcnJvcjsKPn0KPmRvX3NvbWV0aGluX3dpdGgoZW50cnkpOwo+Cj5T
dWZmaWNlPyAgVGhlIGxpc3RfZW50cnlfaXNfaGVhZCgpIG1hY3JvIGlzIGRlc2lnbmVkIHRvIGNv
cGUgd2l0aCB0aGUKPmJvZ3VzIGVudHJ5IG9uIGhlYWQgcHJvYmxlbS4KCldvbid0IHN1ZmZpY2Ug
YmVjYXVzZSB0aGUgZW5kIGdvYWwgb2YgdGhpcyB3b3JrIGlzIHRvIGxpbWl0IHNjb3BlIG9mIGVu
dHJ5IG9ubHkgdG8gbG9vcC4gSGVuY2UgdGhlIG5lZWQgZm9yIGFkZGl0aW9uYWwgdmFyaWFibGUu
CgpCZXNpZGVzLCB0aGVyZSBhcmUgbm8gZ3VhcmFudGVlcyB0aGF0IHBlb3BsZSB3b24ndCBkb19z
b21ldGhpbmdfd2l0aChlbnRyeSkgd2l0aG91dCB0aGUgY2hlY2sgb3Igd29uJ3QgY29tcGFyZSBl
bnRyeSB0byBOVUxMIHRvIGNoZWNrIGlmIHRoZSBsb29wIGZpbmlzaGVkIHdpdGggYnJlYWsgb3Ig
bm90LgoKPkphbWVzCgoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

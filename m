Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E434C7CD2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 23:05:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOo9E-0006l8-Je; Mon, 28 Feb 2022 22:05:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>)
 id 1nOo9D-0006kO-FP; Mon, 28 Feb 2022 22:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rjAgW0TZYa01aB+RWuD5jL6/P65QVmPGzGS1fypwqkM=; b=Oz9CJVKHngBVk/8QJfgPfWyyWM
 o4seIp96b0RhtZKcMD6CBlnJQM88yXPnfWKwPgphstRxctj3LoehbgctyAhZspyZpMWafDuUQWpk8
 fR4VqASnsE2tLJ5oIVozDMlFjwNZL73n0iaBx5KjDkV4eLmojAAGs5VNUjMcMLk3mPuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rjAgW0TZYa01aB+RWuD5jL6/P65QVmPGzGS1fypwqkM=; b=LdBGJznrfgOkQamw6UDeqh293N
 7NEEPtOU9eMwyThJmFsGLt1Q0RSZ/Og08N9TfvGlDokHLpFTUiC2RK3HdCzE0a29unRNcMM0mDcXa
 jxTM2nf+Jbpvm+ji54RoH/wIBEVTXez5HW1uqUZ2YbLpRB4el7h7hkA1H3Tgx4y1hxnw=;
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOo9A-000Y0e-8g; Mon, 28 Feb 2022 22:05:36 +0000
Received: by mail-ej1-f50.google.com with SMTP id bg10so27685087ejb.4;
 Mon, 28 Feb 2022 14:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rjAgW0TZYa01aB+RWuD5jL6/P65QVmPGzGS1fypwqkM=;
 b=SsE2iptdX/xTNU84zbtZf+FZ8hKTkJX9H9ZM578+fdgJrDU7+0yGKs3Y1+Ec8zM22z
 4L/SCSccM9eH+aBbsU9p5ll5VTrDlXvOt1QFHQZ0QoX++s1RFseEQQ8VJGBWAvwFCFIq
 jeFzH1SGTYgHS7irPmR7cmG6wYjaX3+E6LxhLklpw86+z7E18Zuelcsa1QvD5X9AuKj5
 NYlhLrqxXUYjh+QgOiXwDeMKoQqdSp4BR7hulFUTvSZMfnkNflEuO+lrt30n2JUf7UIn
 5TdA8KwzIEgmQjPXnxPtLxIzLgpwPLiA+LehnjNWRY5HBdt4E59Tm/VNBLrMAmAi/DS2
 EEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rjAgW0TZYa01aB+RWuD5jL6/P65QVmPGzGS1fypwqkM=;
 b=OIOnnyrRF5Z2iqsb1zWccjcVfbkh2Xpzz6RkpmOG+NPiSHohagrBJkrHYZk96XlMmT
 58NXDut5+y0w0y36OZiz7aOEJ2grtpQqMtJ+ozJga1plMwiK1DcGuJ73wgXYREu3txUh
 iBFP8x6rR/WK5KEN49C6sp/0EH1qIRchudE+MNbsrq+/oObX3wy++ewi5o45PWDxmZI9
 YWGyxR6mTXFwJBuTDGxbjTPVR9d5VsR/IXEAKc4FIcIbZop9/xvIu10ylrwIZcZP7yVe
 Cl0qDeqptSclRyKHC9fV1OdKoM+Ko/kcSTKwDJt13qD/8OTZ2MAa/A6segQWoIsvedJ+
 ckog==
X-Gm-Message-State: AOAM53178+b/CWQSNKYBmfap9fE3yCIxSNV/E7/TUP9KlLJQwhU2rT4J
 F/c2KVe2rVTc/nB8QvvKD+k=
X-Google-Smtp-Source: ABdhPJy9dyrpbH/urhqhSpy7WKh/oklsnc56vlW33h3ZTWE1g0yI8U4qpehenqdC8nVSV7dV3sC9Vw==
X-Received: by 2002:a17:906:370f:b0:6ce:6e7:7344 with SMTP id
 d15-20020a170906370f00b006ce06e77344mr16083589ejc.654.1646085929715; 
 Mon, 28 Feb 2022 14:05:29 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a17090606c200b006a728f4a9bcsm4769566ejb.148.2022.02.28.14.05.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 14:05:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
Date: Mon, 28 Feb 2022 23:05:26 +0100
Message-Id: <192A6D7F-E803-47AE-9C7A-267B4E87C856@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  > On 28. Feb 2022, at 21:56, Christian König wrote: > > >
    > Am 28.02.22 um 21:42 schrieb James Bottomley: >> On Mon, 2022-02-28 at
   21:07 +0100, Christian König wrote: >>> Am 28.02.22 um 20:56 schr [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.50 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [jakobkoschel[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.50 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOo9A-000Y0e-8g
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
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
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
 v9fs-developer@lists.sourceforge.net,
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
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Cgo+IE9uIDI4LiBGZWIgMjAyMiwgYXQgMjE6NTYsIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gCj4gCj4gCj4gQW0gMjguMDIuMjIgdW0gMjE6NDIg
c2NocmllYiBKYW1lcyBCb3R0b21sZXk6Cj4+IE9uIE1vbiwgMjAyMi0wMi0yOCBhdCAyMTowNyAr
MDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDI4LjAyLjIyIHVtIDIwOjU2IHNj
aHJpZWIgTGludXMgVG9ydmFsZHM6Cj4+Pj4gT24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgNDoxOSBB
TSBDaHJpc3RpYW4gS8O2bmlnCj4+Pj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6
Cj4+Pj4gW1NOSVBdCj4+Pj4gQW55Ym9keSBoYXZlIGFueSBpZGVhcz8KPj4+IEkgdGhpbmsgd2Ug
c2hvdWxkIGxvb2sgYXQgdGhlIHVzZSBjYXNlcyB3aHkgY29kZSBpcyB0b3VjaGluZyAocG9zKQo+
Pj4gYWZ0ZXIgdGhlIGxvb3AuCj4+PiAKPj4+IEp1c3QgZnJvbSBza2ltbWluZyBvdmVyIHRoZSBw
YXRjaGVzIHRvIGNoYW5nZSB0aGlzIGFuZCBleHBlcmllbmNlCj4+PiB3aXRoIHRoZSBkcml2ZXJz
L3N1YnN5c3RlbXMgSSBoZWxwIHRvIG1haW50YWluIEkgdGhpbmsgdGhlIHByaW1hcnkKPj4+IHBh
dHRlcm4gbG9va3Mgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+IAo+Pj4gbGlzdF9mb3JfZWFjaF9l
bnRyeShlbnRyeSwgaGVhZCwgbWVtYmVyKSB7Cj4+PiAgICAgIGlmIChzb21lX2NvbmRpdGlvbl9j
aGVja2luZyhlbnRyeSkpCj4+PiAgICAgICAgICBicmVhazsKPj4+IH0KPj4+IGRvX3NvbWV0aGlu
Z193aXRoKGVudHJ5KTsKClRoZXJlIGFyZSBvdGhlciBjYXNlcyB3aGVyZSB0aGUgbGlzdCBpdGVy
YXRvciB2YXJpYWJsZSBpcyB1c2VkIGFmdGVyIHRoZSBsb29wClNvbWUgZXhhbXBsZXM6CgotIGxp
c3RfZm9yX2VhY2hfZW50cnlfY29udGludWUoKSBhbmQgbGlzdF9mb3JfZWFjaF9lbnRyeV9mcm9t
KCkuCgotIChhbHRob3VnaCB2ZXJ5IHJhcmUpIHRoZSBoZWFkIGlzIGFjdHVhbGx5IG9mIHRoZSBj
b3JyZWN0IHN0cnVjdCB0eXBlLgoJCShwcGM0NDBzcGVfZ2V0X2dyb3VwX2VudHJ5KCk6IGRyaXZl
cnMvZG1hL3BwYzR4eC9hZG1hLmM6MTQzNikKCi0gdG8gdXNlIHBvcy0+bGlzdCBmb3IgZXhhbXBs
ZSBmb3IgbGlzdF9hZGRfdGFpbCgpOgoJCShhZGRfc3RhdGljX3ZtX2Vhcmx5KCk6IGFyY2gvYXJt
L21tL2lvcmVtYXAuYzoxMDcpCgpJZiB0aGUgc2NvcGUgb2YgdGhlIGxpc3QgaXRlcmF0b3IgaXMg
bGltaXRlZCB0aG9zZSBzdGlsbCBuZWVkIGZpeGluZyBpbiBhIGRpZmZlcmVudCB3YXkuCgo+PiAK
Pj4gQWN0dWFsbHksIHdlIHVzdWFsbHkgaGF2ZSBhIGNoZWNrIHRvIHNlZSBpZiB0aGUgbG9vcCBm
b3VuZCBhbnl0aGluZywKPj4gYnV0IGluIHRoYXQgY2FzZSBpdCBzaG91bGQgc29tZXRoaW5nIGxp
a2UKPj4gCj4+IGlmIChsaXN0X2VudHJ5X2lzX2hlYWQoZW50cnksIGhlYWQsIG1lbWJlcikpIHsK
Pj4gICAgIHJldHVybiB3aXRoIGVycm9yOwo+PiB9Cj4+IGRvX3NvbWV0aGluX3dpdGgoZW50cnkp
Owo+PiAKPj4gU3VmZmljZT8gIFRoZSBsaXN0X2VudHJ5X2lzX2hlYWQoKSBtYWNybyBpcyBkZXNp
Z25lZCB0byBjb3BlIHdpdGggdGhlCj4+IGJvZ3VzIGVudHJ5IG9uIGhlYWQgcHJvYmxlbS4KPiAK
PiBUaGF0IHdpbGwgd29yayBhbmQgaXMgYWxzbyB3aGF0IHBlb3BsZSBhbHJlYWR5IGRvLgo+IAo+
IFRoZSBrZXkgcHJvYmxlbSBpcyB0aGF0IHdlIGxldCBwZW9wbGUgZG8gdGhlIHNhbWUgdGhpbmcg
b3ZlciBhbmQgb3ZlciBhZ2FpbiB3aXRoIHNsaWdodGx5IGRpZmZlcmVudCBpbXBsZW1lbnRhdGlv
bnMuCj4gCj4gT3V0IGluIHRoZSB3aWxkIEkndmUgc2VlbiBhdCBsZWFzdCB1c2luZyBhIHNlcGFy
YXRlIHZhcmlhYmxlLCB1c2luZyBhIGJvb2wgdG8gaW5kaWNhdGUgdGhhdCBzb21ldGhpbmcgd2Fz
IGZvdW5kIGFuZCBqdXN0IGFzc3VtaW5nIHRoYXQgdGhlIGxpc3QgaGFzIGFuIGVudHJ5Lgo+IAo+
IFRoZSBsYXN0IGNhc2UgaXMgYm9ndXMgYW5kIGJhc2ljYWxseSB3aGF0IGNhbiBicmVhayBiYWRs
eS4KPiAKPiBJZiB3ZSB3b3VsZCBoYXZlIGFuIHVuaWZpZWQgbWFjcm8gd2hpY2ggc2VhcmNoIGZv
ciBhbiBlbnRyeSBjb21iaW5lZCB3aXRoIGF1dG9tYXRlZCByZXBvcnRpbmcgb24gcGF0Y2hlcyB0
byB1c2UgdGhhdCBtYWNybyBJIHRoaW5rIHRoZSBwb3RlbnRpYWwgdG8gaW50cm9kdWNlIHN1Y2gg
aXNzdWVzIHdpbGwgYWxyZWFkeSBnbyBkb3duIG1hc3NpdmVseSB3aXRob3V0IGF1ZGl0aW5nIHRv
bnMgb2YgZXhpc3RpbmcgY29kZS4KCkhhdmluZyBhIHVuaWZpZWQgd2F5IHRvIGRvIHRoZSBzYW1l
IHRoaW5nIHdvdWxkIGluZGVlZCBiZSBncmVhdC4KCj4gCj4gUmVnYXJkcywKPiBDaHJpc3RpYW4u
Cj4gCj4+IAo+PiBKYW1lcwo+PiAKPj4gCj4gCgotIEpha29iCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

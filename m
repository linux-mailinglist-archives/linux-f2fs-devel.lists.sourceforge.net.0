Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F9615939
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 04:06:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oq45T-00080v-9B;
	Wed, 02 Nov 2022 03:06:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <fengnanchang@gmail.com>) id 1oq45R-00080p-HA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 03:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CoAqlvYzhp6p2pTWVpPRMvg3PFJhOl6shRjinSJg8Yk=; b=OiyAaGItU8CEKU6FybvLADyulM
 qCDF59e3pZvnoev5rAKmAcqh6VUglJM/uyt/SMEK3veLKuN+bQcE6Px2B0MDDcw8qrnT8cnbP4pWJ
 TDpeyf9NCPQnfxTRw0YPHQk+ppD102gCTHixfmrF9trWslHz+fZOIYliCsfL4eLaFC7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CoAqlvYzhp6p2pTWVpPRMvg3PFJhOl6shRjinSJg8Yk=; b=YG6khbbjW4JlJb1azvg/YYv0wF
 EP0LeYhApmNVKPt3PbJXiR827d4NwDoWsaSzdb26UuoxY81UkCNHGKaSH/89Pl9MRth/6mcrdHvtc
 skx3FNyJyzvaE8+tpYQRsbie0p/mBb3Pko7Xw4o+BQvaxqQdgouDenhlIkrx7FIzq5uY=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oq45N-008xzO-Be for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 03:06:41 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so885283pji.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Nov 2022 20:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CoAqlvYzhp6p2pTWVpPRMvg3PFJhOl6shRjinSJg8Yk=;
 b=YrnugBxnS2f8df1F/dTIqmXn/5w4bTBHdtaynf+eOhTHS9ZXRxjbnfcW/rgAfEW+lI
 YyydyZPrbHGkJ8/fgeHADFuxcXoh8WtwHVIVc9pj+8XJe7uzEVMpHe9xT+He7mSQOwPd
 jO3AJbAmg27KM4zxYEuqLY4LWswjszA9U32jSe0XFc4sitAKvYYHvJDvmwJoXCYWPSoW
 qzSAmHyzTtcASqHk4UMUe4jgOTjb5EqffTEHZQQ37T9yObrFGA+YvNLtXdtYIwyjPlXV
 1491DRxU2jtB3dvBqeninLJGkT8KatfJIneavU0LYKO4NNbif+tekHHwszsr+0vOocnP
 c1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CoAqlvYzhp6p2pTWVpPRMvg3PFJhOl6shRjinSJg8Yk=;
 b=iuKjMZ2EsjS83OVSwWyJNTGPUhOPLXUOrADEC7CMWbsOC514Kvz0J8VnKic0H3qwks
 UsIyzV2sNj5dAnYeq0hhO6NWfN1BNe107XM3C65VAWcgviWqrZc0ow/jKKDE55VXSzOo
 eDZleokbnzPcHwnjYjke+e/dkMcSJroRyK8mRZpq01gHXvvNW02afX23p0Zpfpa/OoNs
 W836m88a0R/Uy40HY6VnsejJRQ+cy044K8qS4FaRVBpB7JAO2zMTfpnjnTTVELJRWWww
 TgUAU+tBGn0tY4V3IyaaO+2pFf9oZUEw/aMbqh+Ey1M4o8ubr3DcQ9yWLcP3T4grPk88
 B2Vg==
X-Gm-Message-State: ACrzQf3x9uiT+yJS/qFOOlEoPMdVA5ez54bni3DSnAhretY4yylL2Xsf
 gLaKgBlQTR5eyWvHV/qjU00=
X-Google-Smtp-Source: AMsMyM6X6vDUagQzfrdnKZo5Zg0Iys0c8io2jN1kXnSD2kJAtisi07JXT8mIcbieC15X+QPM/n7CPQ==
X-Received: by 2002:a17:90a:cf06:b0:212:d9ab:811b with SMTP id
 h6-20020a17090acf0600b00212d9ab811bmr23740199pju.65.1667358391656; 
 Tue, 01 Nov 2022 20:06:31 -0700 (PDT)
Received: from smtpclient.apple ([2404:9dc0:cd01::15])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a056a0000cf00b00550724f8ea0sm7230692pfj.128.2022.11.01.20.06.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Nov 2022 20:06:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
From: fengnan chang <fengnanchang@gmail.com>
In-Reply-To: <Y2HQftXirAxvab6M@sol.localdomain>
Date: Wed, 2 Nov 2022 11:06:17 +0800
Message-Id: <694663F8-701D-4318-94D0-A1F532DDF6F9@gmail.com>
References: <20220608134852.476876-1-fengnanchang@gmail.com>
 <Y2HQftXirAxvab6M@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  > 2022年11月2日 10:05，Eric Biggers 写道： > > On Wed,
    Jun 08, 2022 at 09:48:52PM +0800, Fengnan Chang wrote: >> When decompressed
    failed, f2fs_prepare_compress_overwrite will enter >> endles [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.216.45 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [fengnanchang[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.216.45 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oq45N-008xzO-Be
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix hungtask when decompressed fail
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Cgo+IDIwMjLlubQxMeaciDLml6UgMTA6MDXvvIxFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGtlcm5l
bC5vcmc+IOWGmemBk++8mgo+IAo+IE9uIFdlZCwgSnVuIDA4LCAyMDIyIGF0IDA5OjQ4OjUyUE0g
KzA4MDAsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+IFdoZW4gZGVjb21wcmVzc2VkIGZhaWxlZCwg
ZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSB3aWxsIGVudGVyCj4+IGVuZGxlc3MgbG9v
cCwgbWF5IGNhc3VlIGh1bmd0YXNrLgo+PiAKPj4gWyAgIDE0LjA4ODY2NV0gRjJGUy1mcyAobnZt
ZTBuMSk6IGx6NCBkZWNvbXByZXNzIGZhaWxlZCwgcmV0Oi00MTU1Cj4+IFsgICAxNC4wODk4NTFd
IEYyRlMtZnMgKG52bWUwbjEpOiBsejQgZGVjb21wcmVzcyBmYWlsZWQsIHJldDotNDE1NQo+PiAK
Pj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT4K
PiAKPiBUaGlzIGNvbW1pdCBtZXNzYWdlIG9ubHkgZXhwbGFpbnMgdGhlIHByb2JsZW0sIG5vdCB0
aGUgc29sdXRpb24uICBJdCBzaG91bGQKPiBleHBsYWluIHRoZSBzb2x1dGlvbiB0b28uCj4gCj4g
QWxzbywgaWYgaXQncyBmaXhpbmcgYSBidWcsIGl0IG5lZWRzICdGaXhlcycgYW5kICdDYyBzdGFi
bGUnIHRhZ3MuCgpJ4oCZbGwgYWRkIG1vcmUgZXhwbGFuYXRpb24gYW5kIHRhZ3MsIHRoYW5rcy4K
Cj4gCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNz
LmMKPj4gaW5kZXggMjQ4MjRjZDk2ZjM2Li4xNzY0ZTM4NTkyNjIgMTAwNjQ0Cj4+IC0tLSBhL2Zz
L2YyZnMvY29tcHJlc3MuYwo+PiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMKPj4gQEAgLTEwNjAs
NyArMTA2MCw3IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUoc3RydWN0
IGNvbXByZXNzX2N0eCAqY2MsCj4+IAlzZWN0b3JfdCBsYXN0X2Jsb2NrX2luX2JpbzsKPj4gCXVu
c2lnbmVkIGZncF9mbGFnID0gRkdQX0xPQ0sgfCBGR1BfV1JJVEUgfCBGR1BfQ1JFQVQ7Cj4+IAlw
Z29mZl90IHN0YXJ0X2lkeCA9IHN0YXJ0X2lkeF9vZl9jbHVzdGVyKGNjKTsKPj4gLQlpbnQgaSwg
cmV0Owo+PiArCWludCBpLCByZXQsIHJldHJ5X2NvdW50ID0gMzsKPj4gCj4+IHJldHJ5Ogo+PiAJ
cmV0ID0gZjJmc19pc19jb21wcmVzc2VkX2NsdXN0ZXIoY2MtPmlub2RlLCBzdGFydF9pZHgpOwo+
PiBAQCAtMTEyMCw3ICsxMTIwLDEyIEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9jb21wcmVzc19vdmVy
d3JpdGUoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4+IAkJCWYyZnNfcHV0X3JwYWdlcyhjYyk7
Cj4+IAkJCWYyZnNfdW5sb2NrX3JwYWdlcyhjYywgaSArIDEpOwo+PiAJCQlmMmZzX2Rlc3Ryb3lf
Y29tcHJlc3NfY3R4KGNjLCB0cnVlKTsKPj4gLQkJCWdvdG8gcmV0cnk7Cj4+ICsJCQlyZXRyeV9j
b3VudC0tOwo+PiArCQkJaWYgKFBhZ2VFcnJvcihwYWdlKSAmJiAhcmV0cnlfY291bnQpIHsKPj4g
KwkJCQlyZXQgPSAtRUlPOwo+PiArCQkJCWdvdG8gb3V0Owo+PiArCQkJfSBlbHNlCj4gCj4gV2hh
dCBpcyB0aGUgcHVycG9zZSBvZiB1c2luZyBQR19lcnJvciBoZXJlPwoKSW4gdGhpcyB2ZXJzaW9u
LCB3ZSBzZXQgUEdfZXJyb3Igd2hlbiBjb21wcmVzc2VkIGZhaWxlZCwgc28gY2hlY2sgUEdfZXJy
b3IgaGVyZS4KTWF5YmUgd2UgY2FuIHJlbW92ZSBQR19lcnJvciBpbiBsYXRlcj8KCgo+IAo+IC0g
RXJpYwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==

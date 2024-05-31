Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5498D587E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 May 2024 04:04:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCrdW-0003Ig-N6;
	Fri, 31 May 2024 02:04:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sCrdV-0003IZ-O5
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 02:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UtdKftBjLw1N9HC8G3+wc8ylanj54jMj75O7JP4SknQ=; b=LP4e24h1l3CIWpeT95Pk6Y8DW7
 lE83z379YEM2QfFywSqs0cL+B1E4/ZIrkZtcr80Zx3I8XpQ2NZ+GWDg+CGDBjzMhCqa3v4UnYRZHi
 Q1HlrmHbnUueOi+onf2lGVZUDvrSWuoJodbv7O/wQuzXueKQhFsbY+kyOLamfoB5Z7J0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UtdKftBjLw1N9HC8G3+wc8ylanj54jMj75O7JP4SknQ=; b=A8Txx4B0j1fns0N5xUGTqdsZ7e
 ElsFoCh7/yxQhHHh9TIoeQHYZePK/cDaJc2tOkSsUhWJZ3O4qcIqjj+sdfy6nTO4fUesH9yxwJALu
 lSZhpskR2dVh58ntBgNDLwnD9ttZjE/zfG070ocBKEWt68db8iidPTOyJQdKLyARlnLo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCrdW-0003jC-SI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 02:04:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC93762A27;
 Fri, 31 May 2024 02:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA47C2BBFC;
 Fri, 31 May 2024 02:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717121083;
 bh=xiHCzmsgzj4m4XKxXeex3wTFqjckwvLq3FtWszdZ62Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dthSPucGRUGL+6aw3Cr9cas3+DxkbhNyIyN1/PH7mmiV73/90OJCM8/nxI+/tnvxw
 Y7KARKaNKWujrvoiX3d0RRZ1nY9I3oZoYBNVMVkbNiMoEB6P2xCESQ/QixPp8VUS/1
 2osBAfjnU93cvJlFi6EupaA2yAK2aVC1R1mzvL+n4ZG3K9XhWiqENwehdEgJi2jN9p
 QRCp/uG7q3tq2qOpneBkwdFNgYiITg+oq2hN5C5FHCOdXPxfm3kGjjWFnQv/ezxL3X
 IvIjBG1lZYMBH5Yjv9LojBqBMCTUzzBD6Rg3OHaF5FWgoS7A4Cs2aBknhqLG0V2ske
 g9vcTww1K2bKg==
Message-ID: <0a4b5b40-1532-44a4-a4d6-601ceced20a4@kernel.org>
Date: Fri, 31 May 2024 10:04:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
 <1d67715b-5f88-4940-969d-e098fd80ae2a@kernel.org>
 <CAHJ8P3LXYWQ+bLZHPn_5FLu3oi83ei8C9ZCzAXwa9oBdEKVDNA@mail.gmail.com>
 <CAHJ8P3+ro9YsU7jZWeAfiUh9uNFEj_=Wiaf2YRLVLBD5_9fM0g@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3+ro9YsU7jZWeAfiUh9uNFEj_=Wiaf2YRLVLBD5_9fM0g@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/5/30 17:49, Zhiguo Niu wrote: > On Mon, May 27, 2024
    at 12:07 PM Zhiguo Niu <niuzhiguo84@gmail.com> wrote: >> >> On Mon, May
    27, 2024 at 11:49 AM Chao Yu <chao@kernel.org> wrote: >>> >>> O [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [139.178.84.217 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sCrdW-0003jC-SI
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable atgc if atgc_age_threshold from
 user is less than elapsed_time
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC81LzMwIDE3OjQ5LCBaaGlndW8gTml1IHdyb3RlOgo+IE9uIE1vbiwgTWF5IDI3LCAy
MDI0IGF0IDEyOjA34oCvUE0gWmhpZ3VvIE5pdSA8bml1emhpZ3VvODRAZ21haWwuY29tPiB3cm90
ZToKPj4KPj4gT24gTW9uLCBNYXkgMjcsIDIwMjQgYXQgMTE6NDnigK9BTSBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIDIwMjQvNS8yMCAxOTozNiwgWmhpZ3VvIE5p
dSB3cm90ZToKPj4+PiBOb3cgYXRnYyBjYW4gYmUgZW5hYmxlZCBiYXNlZCBvbiB0aGUgZm9sbG93
aW5nIGNvbmRpdGlvbnM6Cj4+Pj4gLUFUR0MgbW91bnQgb3B0aW9uIGlzIHNldAo+Pj4+IC1lbGFw
c2VkX3RpbWUgaXMgbW9yZSB0aGFuIGF0Z2NfYWdlX3RocmVzaG9sZCBhbHJlYWR5Cj4+Pj4gYnV0
IHRoZXNlIGNvbmRpdGlvbnMgYXJlIGNoZWNrIHdoZW4gdW1vdW50ZWQtPm1vdW50ZWQgZGV2aWNl
IGFnYWluLgo+Pj4+IElmIHRoZSBkZXZpY2UgaGFzIG5vdCBiZSB1bW91bnRlZC0+bW91bnRlZCBm
b3IgYSBsb25nIHRpbWUsIGF0Z2MgY2FuCj4+Pj4gbm90IHdvcmsgZXZlbiB0aGUgYWJvdmUgY29u
ZGl0aW9ucyBtZXQuCj4+Pgo+Pj4gWmhpZ3VvLCBJIGRpZG4ndCBnZXQgaXQsIGNhbiB5b3UgcGxl
YXNlIGV4cGxhaW4gbW9yZSBhYm91dCB0aGlzIGlzc3VlPwo+Pj4KPj4+IFRoYW5rcywKPj4gSGkg
Q2hhbywKPj4KPj4gQXQgcHJlc2VudCwgdGhlIHBvaW50IG9mIGF0Z2MgZW5hbGUgaXMgY2hlY2tl
ZCBkdXJpbmcgdGhlIG1vdW50Cj4+IHByb2Nlc3MuIFdoYXQgSSBtZWFuIGlzIHRoYXQgaWYgYSBk
ZXZpY2UgaGFzIG5vdCBiZWVuIHJlYm9vdGVkCj4+IChyZS1tb3VudGVkKSBmb3IgYSBsb25nIHRp
bWUsIGV2ZW4gaWYgdGhlIGFib3ZlIHR3byBjb25kaXRpb25zIGFyZQo+PiBtZXQoQVRHQyBtb3Vu
dCBvcHRpb24gaXMgc2V0LCBhbmQgdGhlIGRldmljZSBoYXMgYmVlbiBwb3dlcmVkIG9uIGxvbmcK
Pj4gZW5vdWdo77yMIG1vcmUgdGhhbiBhdGdjIGRlZmF1bHQgdGhyZXNob2xkICksIGF0Z2MgY2Fu
bm90IGJlIGR5bmFtaWNhbGx5Cj4+IGVuYWJsZWQuCj4+Cj4+IElmIHRoZSB1c2VyIGlzIHVzZWQg
dG8gbm90IHJlc3RhcnRpbmcgdGhlIHBob25lIGFmdGVyIHR1cm5pbmcgaXQgb24sCj4+IGl0IHdp
bGwgYmUgZGlmZmljdWx0IHRvIHVzZSBhdGdjLgo+PiB0aGFua3MhCj4gSGkgQ2hhbywKPiBEbyB5
b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgb3IgY29tbWVudHMgb24gdGhpcz8KClpoaWd1bywKCkkg
cmVtZW1iZXIgdGhhdCBhdGdjIGNhbiBub3QgYmUgZW5hYmxlZCBhdCBydW50aW1lIGR1ZSB0byBz
b21lIHJlYXNvbnMsIGJ1dApJIG5lZWQgc29tZSB0aW1lIHRvIHJlY2FsbCBhbmQgY2hlY2sgdGhl
IGRldGFpbHMuLi4KClRoYW5rcywKCj4gdGhhbmtz77yBCj4gCj4+Pgo+Pj4+Cj4+Pj4gSXQgaXMg
YmV0dGVyIHRvIGVuYWJsZSBhdGdjIGR5bmFtaWNsbHkgd2hlbiB1c2VyIGNoYW5nZSBhdGdjX2Fn
ZV90aHJlc2hvbGQKPj4+PiBtZWFud2hpbGUgdGhpcyB2YWxlIGlzIGxlc3MgdGhhbiBlbGFwc2Vk
X3RpbWUgYW5kIEFUR0MgbW91bnQgb3B0aW9uIGlzIG9uLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGZz
L2YyZnMvZjJmcy5oICAgIHwgIDEgKwo+Pj4+ICAgIGZzL2YyZnMvc2VnbWVudC5jIHwgIDkgKysr
Ky0tLS0tCj4+Pj4gICAgZnMvZjJmcy9zeXNmcy5jICAgfCAxNiArKysrKysrKysrKysrKysrCj4+
Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+
PiBpbmRleCAxOTc0YjZhLi5lNDQxZDJkIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5o
Cj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+PiBAQCAtMzY5NCw2ICszNjk0LDcgQEAgdm9p
ZCBmMmZzX2NsZWFyX3ByZWZyZWVfc2VnbWVudHMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+
Pj4+ICAgIGludCBmMmZzX2luaXRfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSk7Cj4+Pj4gICAgdm9pZCBmMmZzX3NhdmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSk7Cj4+Pj4gICAgdm9pZCBmMmZzX3Jlc3RvcmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSk7Cj4+Pj4gK2ludCBmMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpKTsKPj4+PiAgICBpbnQgZjJmc19hbGxvY2F0ZV9zZWdtZW50X2Zv
cl9yZXNpemUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc3RhcnQsIHVuc2ln
bmVkIGludCBlbmQpOwo+Pj4+ICAgIGludCBmMmZzX2FsbG9jYXRlX25ld19zZWN0aW9uKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUsIGJvb2wgZm9yY2UpOwo+Pj4+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+Pj4gaW5kZXggNzFk
YzgwNDIuLjQ0OTIzZDQgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPj4+PiAr
KysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+IEBAIC0yOTMxLDE0ICsyOTMxLDExIEBAIHN0YXRp
YyBpbnQgZ2V0X2F0c3NyX3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlw
ZSwKPj4+PiAgICAgICAgcmV0dXJuIHJldDsKPj4+PiAgICB9Cj4+Pj4KPj4+PiAtc3RhdGljIGlu
dCBfX2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+Pj4g
K2ludCBmMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+
ICAgIHsKPj4+PiAgICAgICAgc3RydWN0IGN1cnNlZ19pbmZvICpjdXJzZWcgPSBDVVJTRUdfSShz
YmksIENVUlNFR19BTExfREFUQV9BVEdDKTsKPj4+PiAgICAgICAgaW50IHJldCA9IDA7Cj4+Pj4K
Pj4+PiAtICAgICBpZiAoIXNiaS0+YW0uYXRnY19lbmFibGVkKQo+Pj4+IC0gICAgICAgICAgICAg
cmV0dXJuIDA7Cj4+Pj4gLQo+Pj4+ICAgICAgICBmMmZzX2Rvd25fcmVhZCgmU01fSShzYmkpLT5j
dXJzZWdfbG9jayk7Cj4+Pj4KPj4+PiAgICAgICAgbXV0ZXhfbG9jaygmY3Vyc2VnLT5jdXJzZWdf
bXV0ZXgpOwo+Pj4+IEBAIC0yOTU1LDcgKzI5NTIsOSBAQCBzdGF0aWMgaW50IF9fZjJmc19pbml0
X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4+PiAgICB9Cj4+Pj4gICAg
aW50IGYyZnNfaW5pdF9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+
ICAgIHsKPj4+PiAtICAgICByZXR1cm4gX19mMmZzX2luaXRfYXRnY19jdXJzZWcoc2JpKTsKPj4+
PiArICAgICBpZiAoIXNiaS0+YW0uYXRnY19lbmFibGVkKQo+Pj4+ICsgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4+Pj4gKyAgICAgcmV0dXJuIGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzYmkpOwo+Pj4+
ICAgIH0KPj4+Pgo+Pj4+ICAgIHN0YXRpYyB2b2lkIF9fZjJmc19zYXZlX2lubWVtX2N1cnNlZyhz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlKQo+Pj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL3N5c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMKPj4+PiBpbmRleCAwOWQzZWNmLi43MjY3NmM1
IDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvc3lzZnMuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvc3lz
ZnMuYwo+Pj4+IEBAIC02NzMsNiArNjczLDIyIEBAIHN0YXRpYyBzc2l6ZV90IF9fc2JpX3N0b3Jl
KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+
Pj4+ICAgICAgICB9Cj4+Pj4KPj4+PiArICAgICBpZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUsICJh
dGdjX2FnZV90aHJlc2hvbGQiKSkgewo+Pj4+ICsgICAgICAgICAgICAgaWYgKHQgPCAwKQo+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+PiArICAgICAgICAgICAg
IHNiaS0+YW0uYWdlX3RocmVzaG9sZCA9IHQ7Cj4+Pj4gKyAgICAgICAgICAgICBpZiAoc2JpLT5h
bS5hdGdjX2VuYWJsZWQpCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBjb3VudDsK
Pj4+PiArCj4+Pj4gKyAgICAgICAgICAgICBpZiAodGVzdF9vcHQoc2JpLCBBVEdDKSAmJgo+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICBsZTY0X3RvX2NwdShzYmktPmNrcHQtPmVsYXBzZWRfdGlt
ZSkgPj0gdCkgewo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoZjJmc19pbml0X2F0Z2Nf
Y3Vyc2VnKHNiaSkpCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHNiaS0+YW0uYXRnY19lbmFibGVkID0g
dHJ1ZTsKPj4+PiArICAgICAgICAgICAgIH0KPj4+PiArICAgICAgICAgICAgIHJldHVybiBjb3Vu
dDsKPj4+PiArICAgICB9Cj4+Pj4gKwo+Pj4+ICAgICAgICBpZiAoIXN0cmNtcChhLT5hdHRyLm5h
bWUsICJnY19zZWdtZW50X21vZGUiKSkgewo+Pj4+ICAgICAgICAgICAgICAgIGlmICh0IDwgTUFY
X0dDX01PREUpCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICBzYmktPmdjX3NlZ21lbnRfbW9k
ZSA9IHQ7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=

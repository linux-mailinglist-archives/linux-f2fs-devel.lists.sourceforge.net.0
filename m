Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D2D80412B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Dec 2023 22:53:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAGsI-0005Mf-W1;
	Mon, 04 Dec 2023 21:53:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rAGsH-0005MV-2R
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 21:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qNWhwgxA2BiTvHW89Z07Z595FxAGmmg4SjHrT/mUPFA=; b=dDVU8A1O4o2mgE6wkJaAB6qivN
 waTMOLGmXDDxB3q4q6tfX/EftiHSXXTsyh/pfFVaAbGB0OS0bsqvc30Lqz1MdRhccz1l79YiCKWe6
 LXr6h5n4krf6biO2S1AV3lUN/vOzwJD8Q3m2kCXcOaRdBwhvmYUAlqUTnssbP9hr4LgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qNWhwgxA2BiTvHW89Z07Z595FxAGmmg4SjHrT/mUPFA=; b=IGjbOKOCpBTWgZ4UFn10OOdLK8
 DHQZUpLScJoMV3R3h2iXVyHdNVW0AoE5sW5BsKDDoyvZcya3564SqjCzB5mpjJ1OhkH9Swe94K8du
 nsr7MEmRYJgFP6xntURkVnsfl5b4RdyI5eYXOq2TadMx5tujuF0/LQuOzluW7YhIebIA=;
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAGsG-0006Y9-AB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 21:53:09 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6d9ac148ca3so472288a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Dec 2023 13:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701726777; x=1702331577; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNWhwgxA2BiTvHW89Z07Z595FxAGmmg4SjHrT/mUPFA=;
 b=JwJ9Jnsbz6UP2VAAl1iw7QP5N+9H0WmuJO8HETyg5/9xaSUfFR2evenqTGJ0kcYN19
 gtc0qcYFgLicENnbLNqc2iK9V8vXx3ooK34IkjM9HkFWa9b7slbwOGkaBHuCTTTsbsPY
 73bM3jmSoOHp8qagft3xKJXaN+IzQBbF3ufUiV40OcgQcPc23zt2DBeUVykc+svDR35+
 /lIaxk600h3gUhYZ10IC+zXkNBqGzObRuHfWeZmQYqLKatAiycvmE5x5XmrfT9jcNsrp
 ADqlmilgcZT7IZIrWzj7koId+JmNiRGH/Nje4NDL7gcDbFhEU5qIjVIkwjGEgUs6Ixtw
 NJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701726777; x=1702331577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qNWhwgxA2BiTvHW89Z07Z595FxAGmmg4SjHrT/mUPFA=;
 b=f1yWf6bT7B9ZXCPhIyqJuBTtp2g/VuspCSIC8KtRS7Wy+KYKbI1seti+mrgXgTiPDL
 0yE0pfwD/g5bxce9hVxrP/vpJeGAAs2lhGq9oZXuc16Kzzv/ufJy/uQK97QyKF3zJ0V4
 NVp9wCKBnZSAOk4igWKgC3hLGqCfxoVufXmHYVeoUan3Sdwv9Rd2jr+IwdQNijZZoVhZ
 APvwi5nJ3mixdknx5YtkSy3Cp7MSzlnCRQIRypgd1YRFKvYvPnmh6FIb1ou+B4Ax0Bx+
 7C2ZcQp/4rvhPpYtjGbEvAG3OT0taMamCqxxz7bsuCD4+3AoIyDfda2eG9K8yUk7YXyK
 5+KQ==
X-Gm-Message-State: AOJu0Yx5BAIdQNy6MsOyyiSfsoZOPXAkvzqaT+Od9mefF3SYuQ/w+FJF
 U1XhIu/zCAnh/cW6OXIweOXegTCK4xL4u7s71pDuQJkfOWo=
X-Google-Smtp-Source: AGHT+IGI3NuhYdnDsfW5NKV8CS89bnfjdUH54fiNP+eKer/Ubh3Ahm/hdA7CZIyoqaUWVK/5Nu33YkDO4XcJCeT2nHM=
X-Received: by 2002:a05:6830:459:b0:6d9:a231:73e2 with SMTP id
 d25-20020a056830045900b006d9a23173e2mr1888962otc.18.1701717094981; Mon, 04
 Dec 2023 11:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20231204180428.925779-1-jaegeuk@kernel.org>
 <20231204180428.925779-4-jaegeuk@kernel.org>
In-Reply-To: <20231204180428.925779-4-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 4 Dec 2023 11:11:24 -0800
Message-ID: <CACOAw_zF8o8=z0enFBciZF+SaYbBxHxg2rOh=aRdBuv=dpcvkg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  LGTM On Mon, Dec 4, 2023 at 10:07 AM Jaegeuk Kim wrote:
   > > In order to limit # of open zones, let's finish or reset zones given #
    of > valid blocks per section and its zone condition. > > Signed-off-b [...]
    
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.46 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.46 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rAGsG-0006Y9-AB
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: let's finish or reset zones all
 the time
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

TEdUTQoKT24gTW9uLCBEZWMgNCwgMjAyMyBhdCAxMDowN+KAr0FNIEphZWdldWsgS2ltIDxqYWVn
ZXVrQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSW4gb3JkZXIgdG8gbGltaXQgIyBvZiBvcGVuIHpv
bmVzLCBsZXQncyBmaW5pc2ggb3IgcmVzZXQgem9uZXMgZ2l2ZW4gIyBvZgo+IHZhbGlkIGJsb2Nr
cyBwZXIgc2VjdGlvbiBhbmQgaXRzIHpvbmUgY29uZGl0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiAtLS0KPiAgZnMvZjJmcy9zZWdtZW50
LmMgfCA3NCArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+IGluZGV4
IDkwODFjOWFmOTc3YS4uNTY5NmE0ZDM4MWZmIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc2VnbWVu
dC5jCj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBAQCAtNDg3MCw4MiArNDg3MCw0NCBAQCBz
dGF0aWMgaW50IGNoZWNrX3pvbmVfd3JpdGVfcG9pbnRlcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGYyZnNfZGV2
X2luZm8gKmZkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGJsa196b25lICp6b25lKQo+ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBpbnQgd3Bfc2Vnbm8sIHdw
X2Jsa29mZiwgem9uZV9zZWNubywgem9uZV9zZWdubywgc2Vnbm87Cj4gLSAgICAgICBibG9ja190
IHpvbmVfYmxvY2ssIHdwX2Jsb2NrLCBsYXN0X3ZhbGlkX2Jsb2NrOwo+ICsgICAgICAgdW5zaWdu
ZWQgaW50IHpvbmVfc2Vnbm87Cj4gKyAgICAgICBibG9ja190IHpvbmVfYmxvY2ssIHdwX2Jsb2Nr
LCB2YWxpZF9ibG9ja19jbnQ7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgbG9nX3NlY3RvcnNfcGVy
X2Jsb2NrID0gc2JpLT5sb2dfYmxvY2tzaXplIC0gU0VDVE9SX1NISUZUOwo+IC0gICAgICAgaW50
IGksIHMsIGIsIHJldDsKPiAtICAgICAgIHN0cnVjdCBzZWdfZW50cnkgKnNlOwo+ICsgICAgICAg
aW50IHJldDsKPgo+ICAgICAgICAgaWYgKHpvbmUtPnR5cGUgIT0gQkxLX1pPTkVfVFlQRV9TRVFX
UklURV9SRVEpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gICAgICAgICB3cF9ibG9j
ayA9IGZkZXYtPnN0YXJ0X2JsayArICh6b25lLT53cCA+PiBsb2dfc2VjdG9yc19wZXJfYmxvY2sp
Owo+IC0gICAgICAgd3Bfc2Vnbm8gPSBHRVRfU0VHTk8oc2JpLCB3cF9ibG9jayk7Cj4gLSAgICAg
ICB3cF9ibGtvZmYgPSB3cF9ibG9jayAtIFNUQVJUX0JMT0NLKHNiaSwgd3Bfc2Vnbm8pOwo+ICAg
ICAgICAgem9uZV9ibG9jayA9IGZkZXYtPnN0YXJ0X2JsayArICh6b25lLT5zdGFydCA+PiBsb2df
c2VjdG9yc19wZXJfYmxvY2spOwo+ICAgICAgICAgem9uZV9zZWdubyA9IEdFVF9TRUdOTyhzYmks
IHpvbmVfYmxvY2spOwo+IC0gICAgICAgem9uZV9zZWNubyA9IEdFVF9TRUNfRlJPTV9TRUcoc2Jp
LCB6b25lX3NlZ25vKTsKPiAtCj4gLSAgICAgICBpZiAoem9uZV9zZWdubyA+PSBNQUlOX1NFR1Mo
c2JpKSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4KPiAgICAgICAgIC8qCj4gICAgICAg
ICAgKiBTa2lwIGNoZWNrIG9mIHpvbmVzIGN1cnNlZ3MgcG9pbnQgdG8sIHNpbmNlCj4gICAgICAg
ICAgKiBmaXhfY3Vyc2VnX3dyaXRlX3BvaW50ZXIoKSBjaGVja3MgdGhlbS4KPiAgICAgICAgICAq
Lwo+IC0gICAgICAgZm9yIChpID0gMDsgaSA8IE5PX0NIRUNLX1RZUEU7IGkrKykKPiAtICAgICAg
ICAgICAgICAgaWYgKHpvbmVfc2Vjbm8gPT0gR0VUX1NFQ19GUk9NX1NFRyhzYmksCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1VSU0VHX0koc2Jp
LCBpKS0+c2Vnbm8pKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAg
ICAgaWYgKHpvbmVfc2Vnbm8gPj0gTUFJTl9TRUdTKHNiaSkgfHwKPiArICAgICAgICAgICBJU19D
VVJTRUMoc2JpLCBHRVRfU0VDX0ZST01fU0VHKHNiaSwgem9uZV9zZWdubykpKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gMDsKPgo+ICAgICAgICAgLyoKPiAtICAgICAgICAqIEdldCBsYXN0IHZh
bGlkIGJsb2NrIG9mIHRoZSB6b25lLgo+ICsgICAgICAgICogR2V0ICMgb2YgdmFsaWQgYmxvY2sg
b2YgdGhlIHpvbmUuCj4gICAgICAgICAgKi8KPiAtICAgICAgIGxhc3RfdmFsaWRfYmxvY2sgPSB6
b25lX2Jsb2NrIC0gMTsKPiAtICAgICAgIGZvciAocyA9IHNiaS0+c2Vnc19wZXJfc2VjIC0gMTsg
cyA+PSAwOyBzLS0pIHsKPiAtICAgICAgICAgICAgICAgc2Vnbm8gPSB6b25lX3NlZ25vICsgczsK
PiAtICAgICAgICAgICAgICAgc2UgPSBnZXRfc2VnX2VudHJ5KHNiaSwgc2Vnbm8pOwo+IC0gICAg
ICAgICAgICAgICBmb3IgKGIgPSBzYmktPmJsb2Nrc19wZXJfc2VnIC0gMTsgYiA+PSAwOyBiLS0p
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKGYyZnNfdGVzdF9iaXQoYiwgc2UtPmN1cl92
YWxpZF9tYXApKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYXN0X3ZhbGlk
X2Jsb2NrID0gU1RBUlRfQkxPQ0soc2JpLCBzZWdubykgKyBiOwo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgfQo+IC0gICAg
ICAgICAgICAgICBpZiAobGFzdF92YWxpZF9ibG9jayA+PSB6b25lX2Jsb2NrKQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAgICAgfQo+ICsgICAgICAgdmFsaWRfYmxvY2tf
Y250ID0gZ2V0X3ZhbGlkX2Jsb2NrcyhzYmksIHpvbmVfc2Vnbm8sIHRydWUpOwo+Cj4gLSAgICAg
ICAvKgo+IC0gICAgICAgICogV2hlbiBzYWZlbHkgdW5tb3VudGVkIGluIHRoZSBwcmV2aW91cyBt
b3VudCwgd2UgY2FuIHRydXN0IHdyaXRlCj4gLSAgICAgICAgKiBwb2ludGVycy4gT3RoZXJ3aXNl
LCBmaW5pc2ggem9uZXMuCj4gLSAgICAgICAgKi8KPiAtICAgICAgIGlmIChpc19zZXRfY2twdF9m
bGFncyhzYmksIENQX1VNT1VOVF9GTEFHKSkgewo+IC0gICAgICAgICAgICAgICAvKgo+IC0gICAg
ICAgICAgICAgICAgKiBUaGUgd3JpdGUgcG9pbnRlciBtYXRjaGVzIHdpdGggdGhlIHZhbGlkIGJs
b2NrcyBvcgo+IC0gICAgICAgICAgICAgICAgKiBhbHJlYWR5IHBvaW50cyB0byB0aGUgZW5kIG9m
IHRoZSB6b25lLgo+IC0gICAgICAgICAgICAgICAgKi8KPiAtICAgICAgICAgICAgICAgaWYgKChs
YXN0X3ZhbGlkX2Jsb2NrICsgMSA9PSB3cF9ibG9jaykgfHwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICh6b25lLT53cCA9PSB6b25lLT5zdGFydCArIHpvbmUtPmxlbikpCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gLSAgICAgICB9Cj4gKyAgICAgICBpZiAo
KCF2YWxpZF9ibG9ja19jbnQgJiYgem9uZS0+Y29uZCA9PSBCTEtfWk9ORV9DT05EX0VNUFRZKSB8
fAo+ICsgICAgICAgICAgICh2YWxpZF9ibG9ja19jbnQgJiYgem9uZS0+Y29uZCA9PSBCTEtfWk9O
RV9DT05EX0ZVTEwpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+IC0gICAgICAgaWYg
KGxhc3RfdmFsaWRfYmxvY2sgKyAxID09IHpvbmVfYmxvY2spIHsKPiAtICAgICAgICAgICAgICAg
aWYgKGlzX3NldF9ja3B0X2ZsYWdzKHNiaSwgQ1BfVU1PVU5UX0ZMQUcpKSB7Cj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgLyoKPiAtICAgICAgICAgICAgICAgICAgICAgICAgKiBJZiB0aGVyZSBp
cyBubyB2YWxpZCBibG9jayBpbiB0aGUgem9uZSBhbmQgaWYgd3JpdGUKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgKiBwb2ludGVyIGlzIG5vdCBhdCB6b25lIHN0YXJ0LCByZXNldCB0aGUgd3Jp
dGUKPiAtICAgICAgICAgICAgICAgICAgICAgICAgKiBwb2ludGVyLgo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGYyZnNfbm90aWNlKHNiaSwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiWm9uZSB3aXRob3V0IHZhbGlkIGJsb2Nr
IGhhcyBub24temVybyB3cml0ZSAiCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInBv
aW50ZXIuIFJlc2V0IHRoZSB3cml0ZSBwb2ludGVyOiB3cFsweCV4LDB4JXhdIiwKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB3cF9zZWdubywgd3BfYmxrb2ZmKTsKPiAtICAgICAgICAg
ICAgICAgfQo+ICsgICAgICAgaWYgKCF2YWxpZF9ibG9ja19jbnQpIHsKPiArICAgICAgICAgICAg
ICAgZjJmc19ub3RpY2Uoc2JpLCAiWm9uZSB3aXRob3V0IHZhbGlkIGJsb2NrIGhhcyBub24temVy
byB3cml0ZSAiCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJwb2ludGVyLiBSZXNldCB0
aGUgd3JpdGUgcG9pbnRlcjogY29uZFsweCV4XSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHpvbmUtPmNvbmQpOwo+ICAgICAgICAgICAgICAgICByZXQgPSBfX2YyZnNfaXNzdWVfZGlz
Y2FyZF96b25lKHNiaSwgZmRldi0+YmRldiwgem9uZV9ibG9jaywKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgem9uZS0+bGVuID4+IGxvZ19zZWN0b3JzX3Blcl9ibG9j
ayk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ZjJmc19lcnIoc2JpLCAiRGlzY2FyZCB6b25lIGZhaWxlZDogJXMgKGVycm5vPSVkKSIsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmRldi0+cGF0aCwgcmV0KTsKPiAtCj4gICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICB9Cj4KPiBAQCAtNDk1NywxMCArNDkx
OSw4IEBAIHN0YXRpYyBpbnQgY2hlY2tfem9uZV93cml0ZV9wb2ludGVyKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwKPiAgICAgICAgICAqIHNlbGVjdGVkIGZvciB3cml0ZSBvcGVyYXRpb24gdW50
aWwgaXQgZ2V0IGRpc2NhcmRlZC4KPiAgICAgICAgICAqLwo+ICAgICAgICAgZjJmc19ub3RpY2Uo
c2JpLCAiVmFsaWQgYmxvY2tzIGFyZSBub3QgYWxpZ25lZCB3aXRoIHdyaXRlICIKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgInBvaW50ZXI6IHZhbGlkIGJsb2NrWzB4JXgsMHgleF0gd3Bb
MHgleCwweCV4XSIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIEdFVF9TRUdOTyhzYmks
IGxhc3RfdmFsaWRfYmxvY2spLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBHRVRfQkxL
T0ZGX0ZST01fU0VHMChzYmksIGxhc3RfdmFsaWRfYmxvY2spLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICB3cF9zZWdubywgd3BfYmxrb2ZmKTsKPiArICAgICAgICAgICAgICAgICAgICJw
b2ludGVyOiB2YWxpZCBibG9ja1sweCV4LDB4JXhdIGNvbmRbMHgleF0iLAo+ICsgICAgICAgICAg
ICAgICAgICAgem9uZV9zZWdubywgdmFsaWRfYmxvY2tfY250LCB6b25lLT5jb25kKTsKPgo+ICAg
ICAgICAgcmV0ID0gYmxrZGV2X3pvbmVfbWdtdChmZGV2LT5iZGV2LCBSRVFfT1BfWk9ORV9GSU5J
U0gsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB6b25lLT5zdGFydCwgem9uZS0+
bGVuLCBHRlBfTk9GUyk7Cj4gLS0KPiAyLjQzLjAucmMyLjQ1MS5nODYzMWJjNzQ3Mi1nb29nCj4K
Pgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

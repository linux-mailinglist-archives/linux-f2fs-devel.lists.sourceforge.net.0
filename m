Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A628FC337
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jun 2024 08:00:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEjgu-000506-72;
	Wed, 05 Jun 2024 06:00:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sEjgs-0004zq-9y
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 06:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AZ8hI2v3Jfgp0yW8nd6gtJuT9yXGJAiH03ugTaPEmcU=; b=Kb62fc8qTTU9f27fogTh5oKn3X
 PH/I05nHk6ePpj1uQT8MVTISGwL3/ogpXvwOcE3BP/x5nmi5W4tra7mM+BnqgA9ehdMaLdaEITJIF
 lmtbSWcZXYAWiWGWOErwykhzCFx88xQR1roo9+0pWL6rO5XtDNQ0U9Jdv5oL6x8MagxA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AZ8hI2v3Jfgp0yW8nd6gtJuT9yXGJAiH03ugTaPEmcU=; b=EkvSVhijxMsL7LwAyAiaqKdIj4
 LWSlLCpqfaL5z+IJcsB55l/Kh3z9NzRzsbxHgAL5INAG0Z81ModWh4m65jsxDe+Ee6ZleAqty9zt5
 oSpAOF/m9QQnBEErRokd9yFGbLtihB8IiqQ5bw7vM3/SYLZUZ+KEnb+2rMM7I9LSnSxM=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sEjgs-0003LR-7N for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 06:00:06 +0000
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-35dcd5377c4so5484093f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Jun 2024 23:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717567194; x=1718171994; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZ8hI2v3Jfgp0yW8nd6gtJuT9yXGJAiH03ugTaPEmcU=;
 b=Z6MSQhTkuVLOP+HNi1ZQP1HvcsrgEJAVUgiSpQBZWW12ne6qSWpCQilShyDyvP74Ry
 IFinbyN8zof/rkawR5wBJ6Ar6aF/afamyEfxk+FgqmuefU11BIOFHBIdvop46kn6ZJjf
 IWAg3tMLzLmgV9xY3lcy85ZHZvztfvThIq6fkysFb725B+kDwnr2Q6XwOWxslCdtBD3G
 WCNpBAQVYI9vQCEIE21wbVpytzAbz1bEs30HRRoOPXfoJcnYeKZp6JH7cokZmFX4FIMt
 IBKc5ko4mMutv/w4sVjDQkLoLHZGj8qxfW0pdKvKAnrhAoCz3YR7qep/wjYNIHrDyNzd
 Ed8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717567194; x=1718171994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZ8hI2v3Jfgp0yW8nd6gtJuT9yXGJAiH03ugTaPEmcU=;
 b=Aa2Zg5YujxsqIItkxes6FoRqO5V6yIsL3xYh6xXVthnlUtGsVSEbluJDvZGSRkGQvO
 HBUbVd7YAa/GpVnUk6uhSJFE4bNZOo6P8WHjgtertb0Ff/ymnl6ijYXRf6hUuslT0MP0
 0+ZFBGHjvUDBAR+2xefrO8rsdmMOF53Eoog4L9OOj9iTdTIQbWalX55atT3mGDypbS5a
 v4007TRfTZn/YPOv03AJR1QTgYjF8ttmYDnESb9UictoWTYk4ib6PaUevO0d/ZygPI0p
 84qI0VJjn67ZTEwu7Z4g+lFtTiOOJkn/jOh3StWoOIGyldnC6UM6IrnzF1NYO11Q6lzU
 iBQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlPLL0ednOy2L6YJXtkWCTWBeFGXHo26ky0Z88kvHMeYENEj4ncMC5oK4l07VW96mN0bfYOIqScI92zra0mfAll79b31D5kH7TTEa7VBYQpMUy3wqDIQ==
X-Gm-Message-State: AOJu0Yyyz0C4Dg9wYSSgdj837yDBDhs52XStELIch6MQnUrvLXEMEyBa
 Aa4L7BWaxaHeaIW9DZTQJq7iDlke+StZeeYdSWF4qgYroY68yugZl7tfpyoccDBdCwQwZmRhcs5
 SQFoKrPf3qYaghneMGX95Q+6yc74=
X-Google-Smtp-Source: AGHT+IHiliPx0ALdMYvkld9eVusUhyWhRN5fBQD3CNvIMmQDsLQzudx78IeEjP7X2hFvR4pC4q9uU7OcGMRGlaoTjJw=
X-Received: by 2002:a5d:4f02:0:b0:346:e9c4:65b with SMTP id
 ffacd0b85a97d-35e84070e07mr842320f8f.27.1717567193606; Tue, 04 Jun 2024
 22:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
 <446c7e4a-2a1e-402d-8238-2eee7cdfd5c2@kernel.org>
 <CAHJ8P3J2NkSfVTEcpxR+n3CjtywMxxEDMg4cLSL=8UOX8KcM+Q@mail.gmail.com>
 <8b841ec1-cb43-462a-9e87-aecdb0755318@kernel.org>
In-Reply-To: <8b841ec1-cb43-462a-9e87-aecdb0755318@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 5 Jun 2024 13:59:42 +0800
Message-ID: <CAHJ8P3K_u=ZmXaMF5jUu_MPSJPAhKmEx4hyaTinMQ=nnLQ9aRA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Jun 5, 2024 at 11:48 AM Chao Yu wrote: > > On 2024/6/3
    17:05, Zhiguo Niu wrote: > > On Mon, Jun 3, 2024 at 3:41 PM Chao Yu wrote:
    > >> > >> On 2024/5/20 19:36, Zhiguo Niu wrote: > >>> [...] 
 
 Content analysis details:   (-5.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.221.45 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.45 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.45 listed in bl.score.senderscore.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.45 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sEjgs-0003LR-7N
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdW4gNSwgMjAyNCBhdCAxMTo0OOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzYvMyAxNzowNSwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IE9u
IE1vbiwgSnVuIDMsIDIwMjQgYXQgMzo0MeKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPj4KPiA+PiBPbiAyMDI0LzUvMjAgMTk6MzYsIFpoaWd1byBOaXUgd3JvdGU6Cj4g
Pj4+IE5vdyBhdGdjIGNhbiBiZSBlbmFibGVkIGJhc2VkIG9uIHRoZSBmb2xsb3dpbmcgY29uZGl0
aW9uczoKPiA+Pj4gLUFUR0MgbW91bnQgb3B0aW9uIGlzIHNldAo+ID4+PiAtZWxhcHNlZF90aW1l
IGlzIG1vcmUgdGhhbiBhdGdjX2FnZV90aHJlc2hvbGQgYWxyZWFkeQo+ID4+PiBidXQgdGhlc2Ug
Y29uZGl0aW9ucyBhcmUgY2hlY2sgd2hlbiB1bW91bnRlZC0+bW91bnRlZCBkZXZpY2UgYWdhaW4u
Cj4gPj4+IElmIHRoZSBkZXZpY2UgaGFzIG5vdCBiZSB1bW91bnRlZC0+bW91bnRlZCBmb3IgYSBs
b25nIHRpbWUsIGF0Z2MgY2FuCj4gPj4+IG5vdCB3b3JrIGV2ZW4gdGhlIGFib3ZlIGNvbmRpdGlv
bnMgbWV0Lgo+ID4+Pgo+ID4+PiBJdCBpcyBiZXR0ZXIgdG8gZW5hYmxlIGF0Z2MgZHluYW1pY2xs
eSB3aGVuIHVzZXIgY2hhbmdlIGF0Z2NfYWdlX3RocmVzaG9sZAo+ID4+PiBtZWFud2hpbGUgdGhp
cyB2YWxlIGlzIGxlc3MgdGhhbiBlbGFwc2VkX3RpbWUgYW5kIEFUR0MgbW91bnQgb3B0aW9uIGlz
IG9uLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVu
aXNvYy5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgICBmcy9mMmZzL2YyZnMuaCAgICB8ICAxICsKPiA+
Pj4gICAgZnMvZjJmcy9zZWdtZW50LmMgfCAgOSArKysrLS0tLS0KPiA+Pj4gICAgZnMvZjJmcy9z
eXNmcy5jICAgfCAxNiArKysrKysrKysrKysrKysrCj4gPj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiA+Pj4gaW5kZXggMTk3NGI2YS4uZTQ0
MWQyZCAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+Pj4gKysrIGIvZnMvZjJm
cy9mMmZzLmgKPiA+Pj4gQEAgLTM2OTQsNiArMzY5NCw3IEBAIHZvaWQgZjJmc19jbGVhcl9wcmVm
cmVlX3NlZ21lbnRzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Pj4gICAgaW50IGYyZnNf
aW5pdF9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+Pj4gICAgdm9p
ZCBmMmZzX3NhdmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPj4+
ICAgIHZvaWQgZjJmc19yZXN0b3JlX2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmkpOwo+ID4+PiAraW50IGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkpOwo+ID4+PiAgICBpbnQgZjJmc19hbGxvY2F0ZV9zZWdtZW50X2Zvcl9yZXNpemUoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPiA+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHN0YXJ0LCB1bnNpZ25lZCBpbnQgZW5k
KTsKPiA+Pj4gICAgaW50IGYyZnNfYWxsb2NhdGVfbmV3X3NlY3Rpb24oc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBpbnQgdHlwZSwgYm9vbCBmb3JjZSk7Cj4gPj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPj4+IGluZGV4IDcxZGM4MDQyLi40
NDkyM2Q0IDEwMDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4+PiArKysgYi9m
cy9mMmZzL3NlZ21lbnQuYwo+ID4+PiBAQCAtMjkzMSwxNCArMjkzMSwxMSBAQCBzdGF0aWMgaW50
IGdldF9hdHNzcl9zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUsCj4g
Pj4+ICAgICAgICByZXR1cm4gcmV0Owo+ID4+PiAgICB9Cj4gPj4+Cj4gPj4+IC1zdGF0aWMgaW50
IF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+Pj4g
K2ludCBmMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4+
PiAgICB7Cj4gPj4+ICAgICAgICBzdHJ1Y3QgY3Vyc2VnX2luZm8gKmN1cnNlZyA9IENVUlNFR19J
KHNiaSwgQ1VSU0VHX0FMTF9EQVRBX0FUR0MpOwo+ID4+PiAgICAgICAgaW50IHJldCA9IDA7Cj4g
Pj4+Cj4gPj4+IC0gICAgIGlmICghc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4gPj4+IC0gICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gPj4+IC0KPiA+Pj4gICAgICAgIGYyZnNfZG93bl9yZWFkKCZTTV9J
KHNiaSktPmN1cnNlZ19sb2NrKTsKPiA+Pj4KPiA+Pj4gICAgICAgIG11dGV4X2xvY2soJmN1cnNl
Zy0+Y3Vyc2VnX211dGV4KTsKPiA+Pj4gQEAgLTI5NTUsNyArMjk1Miw5IEBAIHN0YXRpYyBpbnQg
X19mMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4+PiAg
ICB9Cj4gPj4+ICAgIGludCBmMmZzX2luaXRfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSkKPiA+Pj4gICAgewo+ID4+PiAtICAgICByZXR1cm4gX19mMmZzX2luaXRfYXRnY19j
dXJzZWcoc2JpKTsKPiA+Pj4gKyAgICAgaWYgKCFzYmktPmFtLmF0Z2NfZW5hYmxlZCkKPiA+Pj4g
KyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4gKyAgICAgcmV0dXJuIGYyZnNfaW5pdF9hdGdj
X2N1cnNlZyhzYmkpOwo+ID4+PiAgICB9Cj4gPj4+Cj4gPj4+ICAgIHN0YXRpYyB2b2lkIF9fZjJm
c19zYXZlX2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlKQo+
ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4gPj4+
IGluZGV4IDA5ZDNlY2YuLjcyNjc2YzUgMTAwNjQ0Cj4gPj4+IC0tLSBhL2ZzL2YyZnMvc3lzZnMu
Ywo+ID4+PiArKysgYi9mcy9mMmZzL3N5c2ZzLmMKPiA+Pj4gQEAgLTY3Myw2ICs2NzMsMjIgQEAg
c3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+Pj4gICAg
ICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+ID4+PiAgICAgICAgfQo+ID4+Pgo+ID4+PiArICAg
ICBpZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUsICJhdGdjX2FnZV90aHJlc2hvbGQiKSkgewo+ID4+
PiArICAgICAgICAgICAgIGlmICh0IDwgMCkKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ID4+PiArICAgICAgICAgICAgIHNiaS0+YW0uYWdlX3RocmVzaG9sZCA9
IHQ7Cj4gPj4+ICsgICAgICAgICAgICAgaWYgKHNiaS0+YW0uYXRnY19lbmFibGVkKQo+ID4+PiAr
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+ID4+PiArCj4gPj4+ICsgICAgICAg
ICAgICAgaWYgKHRlc3Rfb3B0KHNiaSwgQVRHQykgJiYKPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIGxlNjRfdG9fY3B1KHNiaS0+Y2twdC0+ZWxhcHNlZF90aW1lKSA+PSB0KSB7Cj4gPj4KPiA+
IEhpIENoYW8sCj4gPj4gT2gsIEkgZ3Vlc3MgeW91IHdhbnQgdG8gZml4IHRoaXM6Cj4gPiBZZXMs
ICBTb3JyeSBmb3Igbm90IG1ha2luZyBpdCBjbGVhciBiZWZvcmUuCj4gPj4KPiA+PiBzdGF0aWMg
dm9pZCBpbml0X2F0Z2NfbWFuYWdlbWVudChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPj4g
ewo+ID4+IC4uLgo+ID4+ICAgICAgICAgIGlmICh0ZXN0X29wdChzYmksIEFUR0MpICYmCj4gPj4g
ICAgICAgICAgICAgICAgICBTSVRfSShzYmkpLT5lbGFwc2VkX3RpbWUgPj0gREVGX0dDX1RIUkVB
RF9BR0VfVEhSRVNIT0xEKQo+ID4+ICAgICAgICAgICAgICAgICAgYW0tPmF0Z2NfZW5hYmxlZCA9
IHRydWU7Cj4gPj4KPiA+PiBXaGF0IGFib3V0IGVuYWJsaW5nIGF0Z2NfZW5hYmxlZCBkdXJpbmcg
Y2hlY2twb2ludCBvbmNlIGVsYXBzZWQgdGltZSBpcwo+ID4+IHNhdGlzZmVkIHcvIHRoZSBjb25k
aXRpb24/IEkgZ3Vlc3MgdGhpcyBjYW4gZ2l2ZSBhbm90aGVyIGNoYW5jZSB3aGVuZXZlcgo+ID4+
IENQIGlzIGJlZW4gdHJpZ2dlcmVkLCBhbmQgaXQgY2FuIGF2b2lkIHRoZSByYWNpbmcgY29uZGl0
aW9uIGFzIHdlbGwuCj4gPiAxLiBJJ20gbm90IHN1cmUgaWYgdGhpcyB3aWxsIGluY3JlYXNlIGNo
ZWNrcG9pbnQgdGltZSBjb25zdW1wdGlvbj8KPgo+IFNpbmNlIGl0IHdvbid0IGluY3JlYXNlIGFu
eSBJTyB0aW1lLCBJIGd1ZXNzIGl0J3MgZmluZSB0b2xlcmF0ZSB0aW1lIGNvbnN1bWVkCj4gYnkg
aW5pdGlhbGl6YXRpb24gb2YgYXRnYyBjdXJzZWcuCj4KPiA+IDIuIGR5bmFtaWNhbGx5IGVuYWJs
aW5nIGF0Z2MgbWF5IGhhdmUgb3RoZXIgcHJvYmxlbXMuIElzIHRoaXMgY29uZmlybWVkPwo+Cj4g
SSB0aGluayBzbywgY2hlY2twb2ludCBoYXMgYXZvaWRlZCBtb3N0IHJhY2UgY2FzZXMuCj4KPiBT
bywgaG93IGRvIHlvdSB0aGluayBvZiBiZWxvdyBkaWZmOgpIaSBDaGFvLAogSSB0aGluayBmbG93
IGlzIG9rLCAgc29tZSBkZXRhaWxzIG5lZWQgdG8gYmUgZGlzY3Vzc2VkLgo+Cj4gLS0tCj4gICBm
cy9mMmZzL2NoZWNrcG9pbnQuYyB8ICAyICsrCj4gICBmcy9mMmZzL2YyZnMuaCAgICAgICB8ICAx
ICsKPiAgIGZzL2YyZnMvc2VnbWVudC5jICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKyst
LS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NoZWNrcG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2twb2lu
dC5jCj4gaW5kZXggNTVkNDQ0YmVjNWMwLi40YTczYmQ0ODFhMjUgMTAwNjQ0Cj4gLS0tIGEvZnMv
ZjJmcy9jaGVja3BvaW50LmMKPiArKysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+IEBAIC0xNzE4
LDYgKzE3MTgsOCBAQCBpbnQgZjJmc193cml0ZV9jaGVja3BvaW50KHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwgc3RydWN0IGNwX2NvbnRyb2wgKmNwYykKPiAgICAgICAgIH0KPgo+ICAgICAgICAg
ZjJmc19yZXN0b3JlX2lubWVtX2N1cnNlZyhzYmkpOwo+ICsgICAgICAgZjJmc19yZWluaXRfYXRn
Y19jdXJzZWcoc2JpKTsKPiArCj4gICAgICAgICBzdGF0X2luY19jcF9jb3VudChzYmkpOwo+ICAg
c3RvcDoKPiAgICAgICAgIHVuYmxvY2tfb3BlcmF0aW9ucyhzYmkpOwo+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gaW5kZXggOTY4OGRmMzMyMTQ3Li44ZDM4
NWExYzc1YWQgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiArKysgYi9mcy9mMmZzL2Yy
ZnMuaAo+IEBAIC0zNjkzLDYgKzM2OTMsNyBAQCB2b2lkIGYyZnNfcmVsZWFzZV9kaXNjYXJkX2Fk
ZHJzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gICBpbnQgZjJmc19ucGFnZXNfZm9yX3N1
bW1hcnlfZmx1c2goc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBib29sIGZvcl9yYSk7Cj4gICBi
b29sIGYyZnNfc2VnbWVudF9oYXNfZnJlZV9zbG90KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
aW50IHNlZ25vKTsKPiAgIGludCBmMmZzX2luaXRfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSk7Cj4gK2ludCBmMmZzX3JlaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmkpOwo+ICAgdm9pZCBmMmZzX3NhdmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSk7Cj4gICB2b2lkIGYyZnNfcmVzdG9yZV9pbm1lbV9jdXJzZWcoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiAgIGludCBmMmZzX2FsbG9jYXRlX3NlZ21lbnRfZm9yX3Jl
c2l6ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlLAo+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gaW5kZXggYmRjMjI0NzM4N2U4
Li42ZDQyNzNmYWYwNjEgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPiArKysgYi9m
cy9mMmZzL3NlZ21lbnQuYwo+IEBAIC0yOTQ5LDEyICsyOTQ5LDEyIEBAIHN0YXRpYyBpbnQgZ2V0
X2F0c3NyX3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPiAgICAg
ICAgIHJldHVybiByZXQ7Cj4gICB9Cj4KPiAtc3RhdGljIGludCBfX2YyZnNfaW5pdF9hdGdjX2N1
cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gK3N0YXRpYyBpbnQgX19mMmZzX2luaXRf
YXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBib29sIGZvcmNlKQo+ICAgewo+
ICAgICAgICAgc3RydWN0IGN1cnNlZ19pbmZvICpjdXJzZWcgPSBDVVJTRUdfSShzYmksIENVUlNF
R19BTExfREFUQV9BVEdDKTsKPiAgICAgICAgIGludCByZXQgPSAwOwo+Cj4gLSAgICAgICBpZiAo
IXNiaS0+YW0uYXRnY19lbmFibGVkKQo+ICsgICAgICAgaWYgKCFzYmktPmFtLmF0Z2NfZW5hYmxl
ZCAmJiAhZm9yY2UpCklzIHRoaXMgcGFyYW1ldGVyICAiZm9yY2UiIHVubmVjZXNzYXJ5PwppbiBt
b3VudCBmbG93LCBldmVuIGF0Z2MgZW5hYmxlIGNvbmRpdGlvbnMgYXJlIGFsbCBtZXQsIGl0IGlz
IG5vdAplbmFibGVkIGJlY2F1c2Ugb2YgZm9yY2U9ZmFsc2UuCk9yIGFtIEkgbWlzc2luZyBzb21l
dGhpbmc/Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gICAgICAgICBmMmZzX2Rvd25f
cmVhZCgmU01fSShzYmkpLT5jdXJzZWdfbG9jayk7Cj4gQEAgLTI5NzEsOSArMjk3MSwyOSBAQCBz
dGF0aWMgaW50IF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSkKPiAgICAgICAgIGYyZnNfdXBfcmVhZCgmU01fSShzYmkpLT5jdXJzZWdfbG9jayk7Cj4gICAg
ICAgICByZXR1cm4gcmV0Owo+ICAgfQo+ICsKPiAgIGludCBmMmZzX2luaXRfaW5tZW1fY3Vyc2Vn
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgIHsKPiAtICAgICAgIHJldHVybiBfX2YyZnNf
aW5pdF9hdGdjX2N1cnNlZyhzYmkpOwo+ICsgICAgICAgcmV0dXJuIF9fZjJmc19pbml0X2F0Z2Nf
Y3Vyc2VnKHNiaSwgZmFsc2UpOwo+ICt9Cj4gKwo+ICtpbnQgZjJmc19yZWluaXRfYXRnY19jdXJz
ZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ICt7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsK
PiArICAgICAgIGlmICghdGVzdF9vcHQoc2JpLCBBVEdDKSkKPiArICAgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4gKyAgICAgICBpZiAoc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4gKyAgICAgICAgICAg
ICAgIHJldHVybiAwOwo+ICsgICAgICAgaWYgKFNJVF9JKHNiaSktPmVsYXBzZWRfdGltZSA8IHNi
aS0+YW0uYWdlX3RocmVzaG9sZCkKU0lUKHNiaSktPmVsYXBzZWRfdGltZSBpcyBqdXN0IHVwZGF0
ZWQgaW4gbW91bnQgZmxvdywgc28KY2twdC0+ZWxhcHNlZF90aW1lIGlzICBtb3JlIHN1aXRhYmxl
IGhlcmU/CnRoYW5rcyEKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAg
cmV0ID0gX19mMmZzX2luaXRfYXRnY19jdXJzZWcoc2JpLCB0cnVlKTsKPiArICAgICAgIGlmICgh
cmV0KSB7Cj4gKyAgICAgICAgICAgICAgIHNiaS0+YW0uYXRnY19lbmFibGVkID0gdHJ1ZTsKPiAr
ICAgICAgICAgICAgICAgZjJmc19pbmZvKHNiaSwgInJlZW5hYmxlZCBhZ2UgdGhyZXNob2xkIEdD
Iik7Cj4gKyAgICAgICB9Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICAgfQo+Cj4gICBzdGF0aWMg
dm9pZCBfX2YyZnNfc2F2ZV9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBp
bnQgdHlwZSkKPiAtLQo+IDIuNDAuMQo+Cj4gPiB0aGFua3PvvIEKPiA+Pgo+ID4+IFRoYW5rcywK
PiA+Pgo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgaWYgKGYyZnNfaW5pdF9hdGdjX2N1cnNl
ZyhzYmkpKQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHNiaS0+YW0uYXRnY19lbmFibGVkID0gdHJ1
ZTsKPiA+Pj4gKyAgICAgICAgICAgICB9Cj4gPj4+ICsgICAgICAgICAgICAgcmV0dXJuIGNvdW50
Owo+ID4+PiArICAgICB9Cj4gPj4+ICsKPiA+Pj4gICAgICAgIGlmICghc3RyY21wKGEtPmF0dHIu
bmFtZSwgImdjX3NlZ21lbnRfbW9kZSIpKSB7Cj4gPj4+ICAgICAgICAgICAgICAgIGlmICh0IDwg
TUFYX0dDX01PREUpCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5nY19zZWdtZW50
X21vZGUgPSB0OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK

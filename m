Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A7D1071C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 04:16:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8W3t4gljM1+yktOqfWHKNoFEQD9UeC99NV8vcwmL7Q8=; b=BRGeN7XjmfSPa24JznDoPLrtNw
	GTOvcYTQJOo1D6VSNzuARPyKcHAS5sh/0Kb91nV/ELq31v5+/X3wNwzzxY0I8tIwyOBY9ITqvEpaW
	7wHfHnfgJ7xpk6x3dMwcmaOrFgzj7/bgI+OKrtfNuQ+en8HcUsiFoEvII/6bawhkV8QI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vf8PR-00022P-E0;
	Mon, 12 Jan 2026 03:16:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1vf8PQ-00022I-6U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 03:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YLaClJk1P2Gi6A1/mduhFX+p5GQ0ZVP1vyOhvQSc7Ks=; b=dV9+c8VHN0axdsJkstnDMHditU
 dzKqIR7Iu3KMRzdm5k/xEhOkFyeJbQDQR6luw9qTZks4UFkwnFmq5H6fXym8uMuTjU8iPiqlEqKgQ
 wQCsY+SxARLRSbTAXw2Hc8aFd8uknfVDJbLUZggkwICKx4RGmtt+L3BuzKogL3GI/djg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YLaClJk1P2Gi6A1/mduhFX+p5GQ0ZVP1vyOhvQSc7Ks=; b=Z5l2cmj0FMrLoZOu3xiZ5Qs5Dv
 VzLeowDLUYBxYqiobmXt8GLo+YjvU/e20cZgdfKCV5OLaQ3W3Supug9cZkbU2R9N8HMQo6wquV9Tb
 reCzMWu9zYHseets7syH6+XRc8M773mPqbSvIQ7jfyuzP2CO5YUtZ2xPuZ5bQ/sH1ePM=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vf8PP-0006dv-OT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 03:16:00 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-29efd139227so42142475ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 11 Jan 2026 19:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768187749; x=1768792549; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YLaClJk1P2Gi6A1/mduhFX+p5GQ0ZVP1vyOhvQSc7Ks=;
 b=X2ikf5D4u4kximyYEHOC4qQhxxQFZja7CIsEAmR54raWgax7CQynIkB3NEAUsNCAp3
 iPWJLIiLa0hY3rW3bCdC536KPSj9uPFk6/2FUwg/SGn4DR/Y9i9q7pUZC21FYXzb1QPI
 JBTeivGY28Ld0VEXzU0G+cTfTqMf/EH7u3XNusOlCELdlJyZ7skxmWyOq9bKppfSigda
 n/EPxC1gc3yjT2YpEQnCU8HPvNkOr3Ph4Ugecrajm6NUuoddTMchQnKIZZEKa2Ch01ju
 k2i7F6dXpTr+7nPPvtEkStFbP5bYOopYx+c4unssYf8R1fHmtulie39IwGMe3bk8t/h1
 Pjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768187749; x=1768792549;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YLaClJk1P2Gi6A1/mduhFX+p5GQ0ZVP1vyOhvQSc7Ks=;
 b=ljErQ2WHh+M3m/hZK+MmqR7jlev57BuYsNWmwn6x0h4kJIWEj+PgoNHIbzgaZf0Dsp
 kh9YIFcUNfUozzUBL4YdFHSvtn4HioL8LFw/e4O/AoGGoXbqpJeorpc+IqjQSgUNeFuk
 gBBw1PC/ZobzH7J9FVmCgTcTO5jFjDXg20JxsTaI0foLm0sv8a+iXKXhoXdBjIMuvjiR
 IS41cAuVpzTU2gNMA3Mze1WKzd/8vs0z9vW4hc/DynxdzIuvipUyI8zbAWrcc0kOH40k
 ksjZg+qWPwThzkYGHmFuWVNY1JNx1D3DTdkCPjLhDAwCaANfwIjCqk28cCvnCWwuaf2G
 ktIw==
X-Gm-Message-State: AOJu0YznTFbXy8oTm790JALfGSxJIhYLEfFN1xEZJYmWcHw5tDSjq9iy
 6HXJ0sgc8b691Rz2au5BJEpzJT9bqT6bEe5t9L+k3jyL9rR/m+WnP4vr
X-Gm-Gg: AY/fxX4u55VrUa/KMezAud4Bk83iuJ4OYIrebLx9H1tMlHvdG4H9GdbZvZzqq+xqxZm
 cTTsW1DUPivT5iHR/fIkyf4zlhQKoNQeDOYm1OJimGT0Mwm1wvOMlxxEYdOlIYwVLJU2kFll8W3
 Ctcl74mrOyjA1oYTKyUJGtGmVBdiQocodmKGR0zGCQJ0bBNvzJyp83UTDGpN86c2vz2nroGH8o0
 AJiYEVPK12WjSpUev04v3/Dmv69ARYsQotFuCOUBJVg/SQifPWKlB+6y2BuhxGTjtIwffKOs/o+
 davHo0uLsBRPtCw7yv+CtVm4zgtTDD4aagQfQFbFWmcOUgnn04t4AbEL719LjgTTDla6vlFrGmg
 Ng2X7YRI7Izeiek3MrHzqpmUdWmh9yH7dK/reOcFR0WSznnaRPeYBV9oMhXtAT/TLVksHU9Pqa/
 HGpPRA6AzZV1UYEB7kQJtHhac27f04eTxsC5CN2S1zFZtnUlDpvBbLukQ=
X-Google-Smtp-Source: AGHT+IFncfm5SJYVS/jfA5FLrQJzx6r8UTBkSx5Vd5CeXGFNzGt4foRQbGN6PkyyehSihJoCiSPGew==
X-Received: by 2002:a17:902:e888:b0:2a0:8963:c147 with SMTP id
 d9443c01a7336-2a3ee4cae62mr168041455ad.45.1768187748891; 
 Sun, 11 Jan 2026 19:15:48 -0800 (PST)
Received: from ?IPV6:2408:8607:1b00:8:8eec:4bff:fe94:a95d?
 ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cc78c0sm160730835ad.69.2026.01.11.19.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jan 2026 19:15:48 -0800 (PST)
Message-ID: <a7eb62df-6bea-4ccc-bbd0-816c432f0992@gmail.com>
Date: Mon, 12 Jan 2026 11:15:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20251231105219.2679546-1-jinbaoliu365@gmail.com>
 <4b79827c-a199-4978-bcdc-76af19190606@kernel.org>
Content-Language: en-US
From: liujinbao <jinbaoliu365@gmail.com>
In-Reply-To: <4b79827c-a199-4978-bcdc-76af19190606@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/1/8 09:32, Chao Yu wrote: > On 12/31/2025 6:52 PM,
 liujinbao1 wrote: >> From: liujinbao1 >> >> During SPO tests, when mounting
 F2FS, an -EINVAL error was returned. >> The issue originates f [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jinbaoliu365(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vf8PP-0006dv-OT
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: detect and fix NAT entry
 inconsistencies with dent_flag set
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
Cc: Sheng Yong <shengyong1@xiaomi.com>, Yongpeng Yang <yangyongpeng@xiaomi.com>,
 liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDIwMjYvMS84IDA5OjMyLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDEyLzMxLzIwMjUgNjo1MiBQ
TSwgbGl1amluYmFvMSB3cm90ZToKPj4gRnJvbTogbGl1amluYmFvMSA8bGl1amluYmFvMUB4aWFv
bWkuY29tPgo+Pgo+PiBEdXJpbmcgU1BPIHRlc3RzLCB3aGVuIG1vdW50aW5nIEYyRlMsIGFuIC1F
SU5WQUwgZXJyb3Igd2FzIHJldHVybmVkLgo+PiBUaGUgaXNzdWUgb3JpZ2luYXRlcyBmcm9tIHRo
ZSBmMmZzX3JlY292ZXJfaW5vZGVfcGFnZSBmdW5jdGlvbidzCj4+IGNoZWNrLCB3aGVyZSBvbGRf
bmkuYmxrX2FkZHIgIT0gTlVMTF9BRERSIHVuZGVyIHRoZSBjb25kaXRpb25zIG9mCj4+IElTX0lO
T0RFKGZvbGlvKSAmJiBpc19kZW50X2Rub2RlKGZvbGlvKS4KPj4gQWRkIGRldGVjdGlvbiBhbmQg
cmVwYWlyIGZvciB0aGlzIHNjZW5hcmlvIGluIGZzY2suCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNo
ZW5nIFlvbmcgPHNoZW5neW9uZzFAeGlhb21pLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWW9uZ3Bl
bmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEppbmJh
byBMaXUgPGxpdWppbmJhbzFAeGlhb21pLmNvbT4KPj4gLS0tCj4+IMKgIGZzY2svbW91bnQuYyB8
IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCBmc2NrL25vZGUuaMKgIHwgMTQgKysr
KysrKysrKysrKysKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9mc2NrL21vdW50LmMgYi9mc2NrL21vdW50LmMKPj4gaW5kZXggZjAzZmEy
ZC4uMDdiOGU2ZSAxMDA2NDQKPj4gLS0tIGEvZnNjay9tb3VudC5jCj4+ICsrKyBiL2ZzY2svbW91
bnQuYwo+PiBAQCAtMzg4MSw2ICszODgxLDcgQEAgaW50IGYyZnNfZmluZF9mc3luY19pbm9kZShz
dHJ1Y3QgZjJmc19zYl9pbmZvIAo+PiAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkKQo+PiDC
oCDCoMKgwqDCoMKgIHdoaWxlICgxKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZnN5
bmNfaW5vZGVfZW50cnkgKmVudHJ5Owo+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfbmF0
X2VudHJ5IG5hdF9lbnRyeTsKPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghZjJmc19pc192
YWxpZF9ibGthZGRyKHNiaSwgYmxrYWRkciwgTUVUQV9QT1IpKQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsKPj4gQEAgLTM4OTcsNiArMzg5OCwyOSBAQCBpbnQgZjJmc19maW5k
X2ZzeW5jX2lub2RlKHN0cnVjdCBmMmZzX3NiX2luZm8gCj4+ICpzYmksIHN0cnVjdCBsaXN0X2hl
YWQgKmhlYWQpCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRyeSA9IGdldF9mc3luY19pbm9k
ZShoZWFkLCBpbm9fb2Zfbm9kZShub2RlX2JsaykpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KCFlbnRyeSkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfSU5PREUobm9kZV9i
bGspICYmIGlzX2RlbnRfZG5vZGUobm9kZV9ibGspKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ2V0X25hdF9lbnRyeShzYmksIGlub19vZl9ub2RlKG5vZGVfYmxrKSwgJm5h
dF9lbnRyeSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG5hdF9lbnRy
eS5ibG9ja19hZGRyICE9IE5VTExfQUREUikgewo+Cj4gaXNfdmFsaWRfZGF0YV9ibGthZGRyKG5h
dF9lbnRyeS5ibG9ja19hZGRyKT8KIMKgwqAgWWVzCj4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmICghYy5maXhfb24pCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VSVF9NU0coImlubzogJXUgaXNfZGVudDol
ZCBuYXQgZW50cnkgCj4+IGJsa2FkZHIgaXMgJSNYXG4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlub19vZl9ub2RlKG5vZGVfYmxr
KSwgCj4+IGlzX2RlbnRfZG5vZGUobm9kZV9ibGspLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5hdF9lbnRyeS5ibG9ja19hZGRyKTsK
Pgo+IFNob3VsZCBjYWxsIEFTU0VSVF9NU0coKSBmaXJzdCB0byBwcmludCBsb2cgYW5kIHNldCBj
LmJ1Z19vbiwgdGhlbgo+IGNoZWNrIGMuZml4X29uPwo+CiDCoMKgwqAgWWVzCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmIChmMmZzX2Rldl9pc193cml0
YWJsZSgpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGludCByZXQgPSAwOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEFTU0VSVF9NU0coIlNldCBub2RlX2JsayAlI3ggZnN5bmMgZmxhZyBb
JXVdIAo+PiAtPiBbMF0iCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgIiBuZXh0X2Jsa2FkZHIgWyUjeF0gLT4gW05VTExfQUREUl1cbiIs
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYmxrYWRkciwgaXNfZnN5bmNfZG5vZGUobm9kZV9ibGspLAo+PiArIEYyRlNfTk9ERV9GT09U
RVIobm9kZV9ibGspLT5uZXh0X2Jsa2FkZHIpOwo+Cj4gRklYX01TRygiU2V0IG5vZGVfYmxrLi4u
Iik/Cj4KIMKgwqDCoCBZZXMKPj4gKyBGMkZTX05PREVfRk9PVEVSKG5vZGVfYmxrKS0+bmV4dF9i
bGthZGRyID0gTlVMTF9BRERSOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzZXRfZnN5bmNfbWFyayhub2RlX2JsaywgMCk7Cj4KPiBJIHN1c3BlY3Qg
dGhhdCBERU5UX0JJVF9TSElGVCBpcyBzZXQgaW5jb3JyZWN0bHk/IFNvIGNhbiB3ZSBqdXN0IGNs
ZWFyIAo+IERFTlRfQklUX1NISUZULAo+IGFuZCBjb250aW51ZSB0byByZWNvdmVyeSB0aGlzIGlu
b2RlIGJsb2NrPwo+Cj4gVGhhbmtzLAoKIMKgwqDCoCBPa++8jCBJJ2xswqAgdHJ5IGl0LgoKIMKg
wqDCoCBUaGFua3MKCj4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0ID0gZGV2X3dyaXRlX2Jsb2NrKG5vZGVfYmxrLCBibGthZGRyLAo+PiArIGYy
ZnNfaW9fdHlwZV90b19yd19oaW50KENVUlNFR19XQVJNX05PREUpKTsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVNTRVJUKHJldCA+PSAwKTsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBuZXh0
Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRyeSA9IGFkZF9mc3luY19pbm9kZShoZWFk
LCBpbm9fb2Zfbm9kZShub2RlX2JsaykpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIWVudHJ5KSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0g
LTE7Cj4+IGRpZmYgLS1naXQgYS9mc2NrL25vZGUuaCBiL2ZzY2svbm9kZS5oCj4+IGluZGV4IDE5
ZjFlNTcuLjdjMTZjYzggMTAwNjQ0Cj4+IC0tLSBhL2ZzY2svbm9kZS5oCj4+ICsrKyBiL2ZzY2sv
bm9kZS5oCj4+IEBAIC0xNzMsNiArMTczLDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfY29s
ZF9ub2RlKHN0cnVjdCAKPj4gZjJmc19ub2RlICpybiwgYm9vbCBpc19kaXIpCj4+IMKgwqDCoMKg
wqAgRjJGU19OT0RFX0ZPT1RFUihybiktPmZsYWcgPSBjcHVfdG9fbGUzMihmbGFnKTsKPj4gwqAg
fQo+PiDCoCArc3RhdGljIGlubGluZSB2b2lkIHNldF9tYXJrKHN0cnVjdCBmMmZzX25vZGUgKnJu
LCBpbnQgbWFyaywgaW50IHR5cGUpCj4+ICt7Cj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGZsYWcg
PSBsZTMyX3RvX2NwdShGMkZTX05PREVfRk9PVEVSKHJuKS0+ZmxhZyk7Cj4+ICsKPj4gK8KgwqDC
oCBpZiAobWFyaykKPj4gK8KgwqDCoMKgwqDCoMKgIGZsYWcgfD0gKDEgPDwgdHlwZSk7Cj4+ICvC
oMKgwqAgZWxzZQo+PiArwqDCoMKgwqDCoMKgwqAgZmxhZyAmPSB+KDEgPDwgdHlwZSk7Cj4+ICvC
oMKgwqAgRjJGU19OT0RFX0ZPT1RFUihybiktPmZsYWcgPSBjcHVfdG9fbGUzMihmbGFnKTsKPj4g
K30KPj4gKwo+PiArI2RlZmluZSBzZXRfZGVudHJ5X21hcmsocGFnZSwgbWFyaynCoMKgwqAgc2V0
X21hcmsocGFnZSwgbWFyaywgCj4+IERFTlRfQklUX1NISUZUKQo+PiArI2RlZmluZSBzZXRfZnN5
bmNfbWFyayhwYWdlLCBtYXJrKcKgwqDCoCBzZXRfbWFyayhwYWdlLCBtYXJrLCAKPj4gRlNZTkNf
QklUX1NISUZUKQo+PiArCj4+IMKgICNkZWZpbmUgaXNfZnN5bmNfZG5vZGUobm9kZV9ibGspwqDC
oMKgIGlzX25vZGUobm9kZV9ibGssIEZTWU5DX0JJVF9TSElGVCkKPj4gwqAgI2RlZmluZSBpc19k
ZW50X2Rub2RlKG5vZGVfYmxrKcKgwqDCoMKgwqDCoMKgIGlzX25vZGUobm9kZV9ibGssIAo+PiBE
RU5UX0JJVF9TSElGVCkKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

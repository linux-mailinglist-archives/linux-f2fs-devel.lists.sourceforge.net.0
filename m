Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DFCACC87F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 15:53:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5R3p4cviZK2eiiCHt+Mena7F2WKn0bl+MgxJ6VP5/Rs=; b=T56dO7jEVK9EjnUWUABl+SImwp
	r6ktLB0YTatdAI+Gp+2KEJ71ofp3F80Y5Mj9FE8Xj+WMtN/NZ5KXHgu0ghcK6Z1WiYFkoW8FzU+8v
	YGnxoL0/QdQ4gRvZeTGVRA93uUikYGvFhy5FSFLsIXznuRFpPMK6GwRcbFOlaGExpdCY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMS4g-00052s-JJ;
	Tue, 03 Jun 2025 13:53:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <anuj1072538@gmail.com>) id 1uMS4e-00052m-Jk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 13:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y3dgRxegT5qf67xryaScOvVUZaIAW5sj2uHc8EGQ1+g=; b=a97FU/Vq/mpfX53+vcy4LOg3sy
 We73KmLiukTdY0axw5eK6iocSOqi7Eiua9VpA7Jhp9BgfgEHUs48OnU0Qv1/rACenciP8hkHN/i+U
 n+Mofa8UaGjTXtT5ka2aN4N15OG2MxyQOoj9bE4s//LyMRcRCAxJQNinSQZ5FfEdi778=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y3dgRxegT5qf67xryaScOvVUZaIAW5sj2uHc8EGQ1+g=; b=aM3osQmOITQFyoZFuKfM63FU54
 93QjFYv2qbaQGH8V80v6JjiKUDpgfz+ZaS9ZT8aXPUmAtPbrCbKqi/l3kumxkylJgL1bZZ1qrO0np
 l44pLC5T3KzLna5BNmMubt3+L1QK5r26GiGKCJVL56GoJ0yPeXMMPOjs9EF0yTzcDgFg=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uMS4d-0003Yk-UJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 13:53:04 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-606ddbda275so186820a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Jun 2025 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748958777; x=1749563577; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y3dgRxegT5qf67xryaScOvVUZaIAW5sj2uHc8EGQ1+g=;
 b=AO3BDde25lDjMXfMH92pWrvCfW/YJT8GqPV6sMVrM1VNzgc4Z3uNRon+9aoBpUCs76
 Ire/vg2bpMusbT7dkD0ArySu3vpv0SiDfQj7Va+Zuhv/Klzc6T0q2tnGqgGReLH/IaF6
 YCNKXPKQlUGllt/pjcBRuRr2O70wRTpLfSXin6cMRi5I0tN1BmPTdOcHEP2+4ZpI9jhW
 VS+hnFzynsVS2Ql6ZyGID+0KgHn+XgBechRZiPBehZvuj1R4T++2T/FCY8sPHECjp+Hl
 5R1dtakMP8YMQffDA1vPTjhzRaGe8NHoQQIWqkDvmW0YPtAUqoolsb6BZaXH7kMq8Z1O
 2jbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748958777; x=1749563577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y3dgRxegT5qf67xryaScOvVUZaIAW5sj2uHc8EGQ1+g=;
 b=Rp5F+sS9jq+9v/LpoH/Ik46hScX8crJG+KCzUH7wb3nteediG9spbGHj0B3bw59BJu
 cdQdAuZ1qYWLXb1PTK/iqK6/2Ffxfo2Jfwqo+p9xnvvpU8n4tJv4uwULO2oaSkPhHSic
 +7nI8s0s5fCVYjuUqU64Gpn7gB2XmPwKMWlaWQzCu0cPJTtKqXqJo396AOhS1prJAB24
 7YGW/FSkvNkhQavGRcgFE73kX6icM+3OWE9sabUc+rJCFxQ0H0gx521Bat2wzmjDRkH9
 ofPeV8KNxwQoTfhr2VnEybUZssiKd/CghmFrBCgQCGKzrc5siRI91h/MUyJBR+H6lL+b
 NjvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo7IcHTsGELTKMZSEl6DPoqnbmF48JiLELjp3WBigJEGoRj3mjmsFjmvuaGFeQ3Xh2X7a5TNGWsHVWHbjuU6wi@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy6wpC7Wd10S7kJ669nHTLS88YHyawhmMFyRuIEWZn5ET4PXbHl
 R+BqmfJrXYUSgW/pKig15AvG39xMYBVZeKng6HjCSAesurYq5y2GNBAdsJa0BIk/h3zRwHnpMH/
 dktps162GJe/yrdlZ0fLTbO0e10Z7EA==
X-Gm-Gg: ASbGncuVH3DBoGZnU2xg/a6cNGzIHBaXanATWmokKQZg0UIPZ7GjUuMa8Sep6/6sBRI
 3jP3U6YKG+VNaK3jRTyJfuAZcJ9t3EvIpBV6jx5liixtcIAm8Wp5+wKACw4kpO7Gh25FqAOtqos
 etQgISRk0a+99f+syYdUglkOm4OB3LM/85ARjs8Ubl32aYP0UCw0GDS4YbmSseDZlbc9K6ufPAe
 Q==
X-Google-Smtp-Source: AGHT+IFus+lYy/Vn8DX7AejSTWq5DWSZv2otFfVWZOt+Ot1Cw3NBGg/aiRMWu1o2ZMIdoZsQp1gzV5igzu9cyaTxn5s=
X-Received: by 2002:a17:907:3f0f:b0:ad8:9909:20b5 with SMTP id
 a640c23a62f3a-adb496037b7mr1318776566b.56.1748958777045; Tue, 03 Jun 2025
 06:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250602141904.GA21996@lst.de>
 <c029d791-20ca-4f2e-926d-91856ba9d515@samsung.com>
 <20250603132434.GA10865@lst.de>
In-Reply-To: <20250603132434.GA10865@lst.de>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Tue, 3 Jun 2025 19:22:18 +0530
X-Gm-Features: AX0GCFs142Om3-wJu99daJuShs3COk0AlQwDiy7BvMajL8e3IU6AzAyzk8BCwWQ
Message-ID: <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Headers-End: 1uMS4d-0003Yk-UJ
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, jack@suse.cz, djwong@kernel.org, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 p.raghav@samsung.com, Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>,
 linux-nfs@vger.kernel.org, da.gomez@samsung.com, viro@zeniv.linux.org.uk,
 kundanthebest@gmail.com, jaegeuk@kernel.org, axboe@kernel.dk,
 brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org,
 anna@kernel.org, gost.dev@samsung.com, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gMywgMjAyNSBhdCA2OjU04oCvUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMDMsIDIwMjUgYXQgMDI6NDY6MjBQTSArMDUz
MCwgQW51aiBHdXB0YS9BbnVqIEd1cHRhIHdyb3RlOgo+ID4gT24gNi8yLzIwMjUgNzo0OSBQTSwg
Q2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+IE9uIFRodSwgTWF5IDI5LCAyMDI1IGF0IDA0
OjQ0OjUxUE0gKzA1MzAsIEt1bmRhbiBLdW1hciB3cm90ZToKPiA+ID4gV2VsbCwgdGhlIHByb3Bl
ciB0aGluZyB3b3VsZCBiZSB0byBmaWd1cmUgb3V0IGEgZ29vZCBkZWZhdWx0IGFuZCBub3QKPiA+
ID4ganVzdCBrZWVwIHRoaW5ncyBhcy1pcywgbm8/Cj4gPgo+ID4gV2Ugb2JzZXJ2ZWQgdGhhdCBz
b21lIGZpbGVzeXN0ZW1zLCBzdWNoIGFzIEJ0cmZzLCBkb24ndCBiZW5lZml0IGZyb20KPiA+IHRo
aXMgaW5mcmEgZHVlIHRvIHRoZWlyIGRpc3RpbmN0IHdyaXRlYmFjayBhcmNoaXRlY3R1cmUuIFRv
IHByZXNlcnZlCj4gPiBjdXJyZW50IGJlaGF2aW9yIGFuZCBhdm9pZCB1bmludGVuZGVkIGNoYW5n
ZXMgZm9yIHN1Y2ggZmlsZXN5c3RlbXMsCj4gPiB3ZSBoYXZlIGtlcHQgbnJfd2JfY3R4PTEgYXMg
dGhlIGRlZmF1bHQuIEZpbGVzeXN0ZW1zIHRoYXQgY2FuIHRha2UKPiA+IGFkdmFudGFnZSBvZiBw
YXJhbGxlbCB3cml0ZWJhY2sgKHhmcywgZXh0NCkgY2FuIG9wdC1pbiB2aWEgYSBtb3VudAo+ID4g
b3B0aW9uLiBBbHNvIHdlIHdhbnRlZCB0byByZWR1Y2UgcmlzayBkdXJpbmcgaW5pdGlhbCBpbnRl
Z3JhdGlvbiBhbmQKPiA+IGhlbmNlIGtlcHQgaXQgYXMgb3B0LWluLgo+Cj4gQSBtb3VudCBvcHRp
b24gaXMgYWJvdXQgdGhlIHdvcnN0IHBvc3NpYmxlIGludGVyZmFjZSBmb3IgYmVoYXZpb3IKPiB0
aGF0IGRlcGVuZHMgb24gZmlsZSBzeXN0ZW0gaW1wbGVtZW50YXRpb24gYW5kIHBvc3NpYmx5IGhh
cmR3YXJlCj4gY2hhY3RlcmlzdGljcy4gIFRoaXMgbmVlZHMgdG8gYmUgc2V0IGJ5IHRoZSBmaWxl
IHN5c3RlbXMsIHBvc3NpYmx5Cj4gdXNpbmcgZ2VuZXJpYyBoZWxwZXJzIHVzaW5nIGhhcmR3YXJl
IGluZm9ybWF0aW9uLgoKUmlnaHQsIHRoYXQgbWFrZXMgc2Vuc2UuIEluc3RlYWQgb2YgdXNpbmcg
YSBtb3VudCBvcHRpb24sIHdlIGNhbgppbnRyb2R1Y2UgZ2VuZXJpYyBoZWxwZXJzIHRvIGluaXRp
YWxpemUgbXVsdGlwbGUgd3JpdGViYWNrIGNvbnRleHRzCmJhc2VkIG9uIHVuZGVybHlpbmcgaGFy
ZHdhcmUgY2hhcmFjdGVyaXN0aWNzIOKAlCBlLmcuLCBudW1iZXIgb2YgQ1BVcyBvcgpOVU1BIHRv
cG9sb2d5LiBGaWxlc3lzdGVtcyBsaWtlIFhGUyBhbmQgRVhUNCBjYW4gdGhlbiBjYWxsIHRoZXNl
IGhlbHBlcnMKZHVyaW5nIG1vdW50IHRvIG9wdCBpbnRvIHBhcmFsbGVsIHdyaXRlYmFjayBpbiBh
IGNvbnRyb2xsZWQgd2F5LgoKPgo+ID4gVXNlZCBQTUVNIG9mIDZHCj4KPiBiYXR0ZXJ5L2NhcGFj
aXRvciBiYWNrZWQgRFJBTSwgb3Igb3B0YW5lPwoKV2UgZW11bGF0ZWQgUE1FTSB1c2luZyBEUkFN
IGJ5IGZvbGxvd2luZyB0aGUgc3RlcHMgaGVyZToKaHR0cHM6Ly93d3cuaW50ZWwuY29tL2NvbnRl
bnQvd3d3L3VzL2VuL2RldmVsb3Blci9hcnRpY2xlcy90cmFpbmluZy9ob3ctdG8tZW11bGF0ZS1w
ZXJzaXN0ZW50LW1lbW9yeS1vbi1hbi1pbnRlbC1hcmNoaXRlY3R1cmUtc2VydmVyLmh0bWwKCj4K
PiA+Cj4gPiBhbmQgTlZNZSBTU0Qgb2YgMy44NCBUQgo+Cj4gQ29uc3VtZXIgZHJpdmUsIGVudGVy
cHJpc2UgZHJpdmU/CgpJdCdzIGFuIGVudGVycHJpc2UtZ3JhZGUgZHJpdmUg4oCUIFNhbXN1bmcg
UE0xNzMzCgo+Cj4gPiBGb3IgeGZzIHVzZWQgdGhpcyBjb21tYW5kOgo+ID4geGZzX2lvIC1jICJz
dGF0IiAvbW50L3Rlc3RmaWxlCj4gPiBBbmQgZm9yIGV4dDQgdXNlZCB0aGlzOgo+ID4gZmlsZWZy
YWcgL21udC90ZXN0ZmlsZQo+Cj4gZmlsZWZyYWcgbWVyZ2VzIGNvbnRpZ3VvdXMgZXh0ZW50cywg
YW5kIG9ubHkgY291bnRzIHVwIGZvciBkaXNjb250aWd1b3VzCj4gbWFwcGluZ3MsIHdoaWxlIGZz
eGF0dHIubmV4dGVudHMgY291bnRzIGFsbCBleHRlbnQgZXZlbiBpZiB0aGV5IGFyZQo+IGNvbnRp
Z3VvdXMuICBTbyB5b3UgcHJvYmFibHkgd2FudCB0byB1c2UgZmlsZWZyYWcgZm9yIGJvdGggY2Fz
ZXMuCgpHb3QgaXQg4oCUIHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIFdlJ2xsIHN3aXRj
aCB0byB1c2luZyBmaWxlZnJhZwphbmQgd2lsbCBzaGFyZSB1cGRhdGVkIGV4dGVudCBjb3VudCBu
dW1iZXJzIGFjY29yZGluZ2x5LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

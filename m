Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E1C5BCF7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Nov 2025 08:37:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZdMlXsm83rXhR2PyFVJRyNpwU8sxj45S+XRPg7lXB8=; b=LyJl3Zm9zT90cd5Iyzuw8ORx6R
	NkU+Ki96qp1tFKAfFIDxoYfKXmd3FPrKSnvJgWiVYyUJzoIRjA2mPAnxm6YyxOu35pkKPq594s8OZ
	VKr3V/M6+fb3xY5AkCR/ZHBcq9Zs78+NRWygqPEEPBW6O80etx3Doai8b8V0i9WzoqB0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJoNL-0004iZ-Lp;
	Fri, 14 Nov 2025 07:37:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vJoND-0004i0-2K
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Nov 2025 07:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cl+LPekBidCE4DprJO8ubirVIqXHTvbIfgmKo/hjbLU=; b=OllCcoEg1w54sDI+AlLB06ULzw
 LiXdJMxe2hEn2EgNAR+hrEZFYAmduvs9A+0JkJGsAAQIy76bhkgKIVWdYZeaCf6rsWZy0Yf0pw0h2
 ScO7oZ34FD3nPzoa5X2ChpqJBX4YD0gq+cy2aN59OjV3B3FNXTk3alllH7Q7vmDFZLmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cl+LPekBidCE4DprJO8ubirVIqXHTvbIfgmKo/hjbLU=; b=IB131gUnHKRgLglUKSJkA/20lT
 II5iPMPvc7I8hka36SqsG1qyyw6o7koba6SnAXsEHPxpvSHFMoUF+R6c/1N69w0etl4XFyKPbxjZd
 1zfo3V9yPx0qeZWTaFIT2gRHrXvAqeZchOTsqgYFZckf0Mway6VXNRowtdyihgOMEUss=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vJoNC-0007og-5Y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Nov 2025 07:37:35 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-29558061c68so20977005ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Nov 2025 23:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763105848; x=1763710648; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cl+LPekBidCE4DprJO8ubirVIqXHTvbIfgmKo/hjbLU=;
 b=CvykMlh1kx5EDGbxEcivQr1TKH9dXKAFtQPoIt3HeGz41C1oee/dD4tkM6wbrwx03P
 vIG8NMdI2MZs3BK+xtv8btL6pVfNAZU5m30/OtrtYsllIRw5wGYGknEFVf9+9AXxdvLV
 4N3Oerb1QXFV4rAerSBPw50j7ZsOZNT7+aoFFTMkH71gfT7VTv1kmdjjaGyJmiYGgDpz
 I4+YAAgFf2/nrLebAb1uh679Vr96xIDMYQOcukJc2/TfWOQd6mzjMSWqVWSg7cFSgY6M
 SI+m6kRYhiEQieYpkre3VRzA1m4AHVYXDWHo5DbOMswYR7h/RZe+N/+m5K32ZRnSozzb
 RviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763105848; x=1763710648;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cl+LPekBidCE4DprJO8ubirVIqXHTvbIfgmKo/hjbLU=;
 b=SlNsHp4RCG2uGFPXly5WVvzuQSu42Xknb1qdhfgLYEDkYMFcL1qmOI3u0WTFfgI1St
 UMnbEBATxKz9eMzeu7KGvrQ3dk/DFuk5wE9GnI/n6goBT/BARqKjJ1mynOmMVKZGjHRy
 gaR23bRrzICPfe18MatTH+VuUFk2h1uJesip7WtqDTZnv9VSC09q3dztjyqfS/B3VR5y
 W379vsUkCtkP0zLuyT9I/emwDACvRt0NnBXsffkWID0gxxTfzlD21w9AFwgSxouKrW31
 ba1lvMU6YY2Xk4x1VWVv+FC0vw7gDfrOAoKIXUeJ6oVlXvyVk9uAulVTM09dJIrf2AAk
 X2Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOtW0E05m7MgPyi/Y6nVg5/9K5tEZPGKVo0HbdxeLQESS5rUp6/KTBshcTL4kp7LmdjenCkiJg785GX0B08qWz@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzyi6Y1yu9CDQ5f6xP60qDB/P66kHgihRqy6vejQce9zpi/8H0l
 8KBw+lvvqTszERwYtiJP3Kjbz7lm5mDSx4hnN/Lbc5n1KHagwmix4QskaHLDkxC6IyXubg==
X-Gm-Gg: ASbGnctWXw/HTsPgsI8/RXL3YuqDbavToFTYoPf9foVizaVeT17IPHOmby9ilgVIvDb
 7r7LzCke4Lcu8vR9jOX9KjP86TYR7HNUVUJBw+GV/4hvU3yaQOd8Kp3MwQGv/8ZwZJub+KYQ6a8
 WVHQJsyKPhnKOXMQ3fPlEy/TDLTSm0N/nfLULXkc/MHg7c7vfb3rJvrAN/iN6NJo38cYykGDUx/
 EdXCajkh3K+q2lpJMj+bo/LHxEhejcj7+Z5ceDURvLdxbnOa9mCr0mU7ZfIKuJQHCV7Yu4foJT+
 tuCdTOmn1Oteu/sB75AREq81Lpk5l25RyPM9qwRhmzWdoXWSbrJlxgReX4Sl6NvP/kEOmPBfCKu
 Tus+3CJoLQ9znCurthY2UTRAyJKiHXVi167uFs2r4oMeCPN8Ew3uyZNBy0aygiif/qa3z+bgI6l
 YazensJdWF7ud1hPV7s2pVo1IzvouJcDredCP07BpTvQ/0
X-Google-Smtp-Source: AGHT+IHVNIoH8DXPbQE8m4o8aVBlxWLMBnKkPPS4a2UcUrOqg2kDQ9Q0enhKG+dhme/4F1vfwwpnDA==
X-Received: by 2002:a17:902:ce8b:b0:297:c0f0:42a1 with SMTP id
 d9443c01a7336-2986a741b77mr24834245ad.44.1763105848262; 
 Thu, 13 Nov 2025 23:37:28 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2cf1c1sm46052675ad.111.2025.11.13.23.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 23:37:27 -0800 (PST)
Message-ID: <9df8fb59-8afb-4b20-b4fa-14bd873c9502@gmail.com>
Date: Fri, 14 Nov 2025 15:37:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang <yangyongpeng@xiaomi.com>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
 <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
 <aRT_KGOSGOGw3S4W@google.com>
 <4c31e634-f88e-4cec-8d1e-b8434a11ebee@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <4c31e634-f88e-4cec-8d1e-b8434a11ebee@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/14/25 08:51, Chao Yu via Linux-f2fs-devel wrote: > On
 11/13/2025 5:42 AM, Jaegeuk Kim wrote: >> This breaks the device giving 0
 open zone which was working. Hence, I >> dropped >> the change. >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vJoNC-0007og-5Y
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: fix handling of zoned block
 devices with max_open_zones == 0
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvMTQvMjUgMDg6NTEsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMTEvMTMvMjAyNSA1OjQyIEFNLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4gVGhpcyBicmVha3Mg
dGhlIGRldmljZSBnaXZpbmcgMCBvcGVuIHpvbmUgd2hpY2ggd2FzIHdvcmtpbmcuIEhlbmNlLCBJ
IAo+PiBkcm9wcGVkCj4+IHRoZSBjaGFuZ2UuCj4+Cj4+IE9uIDExLzEwLCBZb25ncGVuZyBZYW5n
IHdyb3RlOgo+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+
Cj4+Pgo+Pj4gV2hlbiBlbXVsYXRpbmcgYSBaTlMgU1NEIG9uIHFlbXUgd2l0aCB6b25lZC5tYXhf
b3BlbiBzZXQgdG8gMCwgdGhlCj4+PiBGMkZTIGNhbiBzdGlsbCBiZSBtb3VudGVkIHN1Y2Nlc3Nm
dWxseS4gVGhlIHN5c2ZzIGVudHJ5IHNob3dzCj4+PiBzYmktPm1heF9vcGVuX3pvbmVzIGFzIFVJ
TlRfTUFYLgo+Pj4KPj4+IHJvb3RAZmVkb3JhLXZtOn4jIGNhdCAvc3lzL2Jsb2NrL252bWUwbjEv
cXVldWUvem9uZWQKPj4+IGhvc3QtbWFuYWdlZAo+Pj4gcm9vdEBmZWRvcmEtdm06fiMgY2F0IC9z
eXMvYmxvY2svbnZtZTBuMS9xdWV1ZS9tYXhfb3Blbl96b25lcwo+Pj4gMAo+Pj4gcm9vdEBmZWRv
cmEtdm06fiMgbWtmcy5mMmZzIC1tIC1jIC9kZXYvbnZtZTBuMSAvZGV2L3ZkYQo+Pj4gcm9vdEBm
ZWRvcmEtdm06fiMgbW91bnQgL2Rldi92ZGEgL21udC9mMmZzLwo+Pj4gcm9vdEBmZWRvcmEtdm06
fiMgY2F0IC9zeXMvZnMvZjJmcy92ZGEvbWF4X29wZW5fem9uZXMKPj4+IDQyOTQ5NjcyOTUKPj4+
Cj4+PiBUaGUgcm9vdCBjYXVzZSBpcyB0aGF0IHNiaS0+bWF4X29wZW5fem9uZXMgaXMgaW5pdGlh
bGl6ZWQgdG8gVUlOVF9NQVgKPj4+IGFuZCBvbmx5IHVwZGF0ZWQgd2hlbiB0aGUgZGV2aWNl4oCZ
cyBtYXhfb3Blbl96b25lcyBpcyBncmVhdGVyIHRoYW4gMC4KPj4+IEhvd2V2ZXIsIGJvdGggdGhl
IHNjc2kgZHJpdmVyIChzZF96YmNfcmVhZF96b25lcyBtYXkgYXNzaWducyAwIHRvCj4+PiBkZXZp
Y2UncyBtYXhfb3Blbl96b25lcykgYW5kIHRoZSBudm1lIGRyaXZlciAobnZtZV9xdWVyeV96b25l
X2luZm8gZG9uJ3QKPj4+IGNoZWNrIG1heF9vcGVuX3pvbmVzKSBhbGxvdyBtYXhfb3Blbl96b25l
cyB0byBiZSAwLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGJ5IHByZXZlbnRp
bmcgbW91bnRpbmcgb24gem9uZWQgU1NEcyB3aGVuCj4+PiBtYXhfb3Blbl96b25lcyBpcyAwLCB3
aGlsZSBzdGlsbCBhbGxvd2luZyBTTVIgSEREcyB0byBiZSBtb3VudGVkLgo+Pj4gaW5pdF9ibGt6
X2luZm8oKSBpcyBvbmx5IGNhbGxlZCBieSBmMmZzX3NjYW5fZGV2aWNlcygpLCBhbmQgdGhlCj4+
PiBibGt6b25lZCBmZWF0dXJlIGhhcyBhbHJlYWR5IGJlZW4gY2hlY2tlZCB0aGVyZS4gU28sIHRo
aXMgcGF0Y2ggYWxzbwo+Pj4gcmVtb3ZlIHJlZHVuZGFudCB6b25lZCBkZXZpY2UgY2hlY2tzLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWku
Y29tPgo+Pj4gLS0tCj4+PiDCoCBmcy9mMmZzL3N1cGVyLmMgfCAzNiArKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25z
KCspLCAxNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5j
IGIvZnMvZjJmcy9zdXBlci5jCj4+PiBpbmRleCBkYjdhZmI4MDY0MTEuLjZkYzg5NDVlMjRhZiAx
MDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+Pj4gKysrIGIvZnMvZjJmcy9zdXBlci5j
Cj4+PiBAQCAtNDM1MywyMSArNDM1Myw2IEBAIHN0YXRpYyBpbnQgaW5pdF9ibGt6X2luZm8oc3Ry
dWN0IGYyZnNfc2JfaW5mbyAKPj4+ICpzYmksIGludCBkZXZpKQo+Pj4gwqDCoMKgwqDCoCB1bnNp
Z25lZCBpbnQgbWF4X29wZW5fem9uZXM7Cj4+PiDCoMKgwqDCoMKgIGludCByZXQ7Cj4+PiAtwqDC
oMKgIGlmICghZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPj4+IC3CoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gMDsKPj4+IC0KPj4+IC3CoMKgwqAgaWYgKGJkZXZfaXNfem9uZWQoRkRFVihkZXZpKS5i
ZGV2KSkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgIG1heF9vcGVuX3pvbmVzID0gYmRldl9tYXhfb3Bl
bl96b25lcyhiZGV2KTsKPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAobWF4X29wZW5fem9uZXMgJiYg
KG1heF9vcGVuX3pvbmVzIDwgc2JpLT5tYXhfb3Blbl96b25lcykpCj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzYmktPm1heF9vcGVuX3pvbmVzID0gbWF4X29wZW5fem9uZXM7Cj4+PiAtwqDC
oMKgwqDCoMKgwqAgaWYgKHNiaS0+bWF4X29wZW5fem9uZXMgPCBGMkZTX09QVElPTihzYmkpLmFj
dGl2ZV9sb2dzKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2VycihzYmksCj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ6b25lZDogbWF4IG9wZW4gem9uZXMg
JXUgaXMgdG9vIHNtYWxsLCBuZWVkIGF0IAo+Pj4gbGVhc3QgJXUgb3BlbiB6b25lcyIsCj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNiaS0+bWF4X29wZW5fem9uZXMsIEYyRlNf
T1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FSU5WQUw7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgfQo+Pj4gLcKgwqDCoCB9Cj4+PiAtCj4+
PiDCoMKgwqDCoMKgIHpvbmVfc2VjdG9ycyA9IGJkZXZfem9uZV9zZWN0b3JzKGJkZXYpOwo+Pj4g
wqDCoMKgwqDCoCBpZiAoc2JpLT5ibG9ja3NfcGVyX2Jsa3ogJiYgc2JpLT5ibG9ja3NfcGVyX2Js
a3ogIT0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0VDVE9SX1RPX0JM
T0NLKHpvbmVfc2VjdG9ycykpCj4+PiBAQCAtNDM3OCw2ICs0MzYzLDI3IEBAIHN0YXRpYyBpbnQg
aW5pdF9ibGt6X2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbyAKPj4+ICpzYmksIGludCBkZXZpKQo+
Pj4gwqDCoMKgwqDCoCBpZiAobnJfc2VjdG9ycyAmICh6b25lX3NlY3RvcnMgLSAxKSkKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBGREVWKGRldmkpLm5yX2Jsa3orKzsKPj4+ICvCoMKgwqAgbWF4X29w
ZW5fem9uZXMgPSBiZGV2X21heF9vcGVuX3pvbmVzKGJkZXYpOwo+Pj4gK8KgwqDCoCBpZiAoIW1h
eF9vcGVuX3pvbmVzKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgLyoKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgICogU1NEcyByZXF1aXJlIG1heF9vcGVuX3pvbmVzID4gMCB0byBiZSBtb3VudGFibGUuCj4+
PiArwqDCoMKgwqDCoMKgwqDCoCAqIEZvciBIRERzLCBpZiBtYXhfb3Blbl96b25lcyBpcyByZXBv
cnRlZCBhcyAwLCBpdCBkb2Vzbid0IAo+Pj4gbWF0dGVyLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAg
KiBzZXQgaXQgdG8gRkRFVihkZXZpKS5ucl9ibGt6Lgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8K
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoYmRldl9ub25yb3QoYmRldikpIHsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGYyZnNfZXJyKHNiaSwgInpvbmVkOiBTU0QgZGV2aWNlICVzIHdpdGhv
dXQgb3BlbiB6b25lcyIsIAo+Pj4gRkRFVihkZXZpKS5wYXRoKTsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+IAo+IE9oLCBzbywgZm9yIGNvbnZlbnRpb25hbCBV
RlMsIGl0IHdpbGwgZ28gaW50byB0aGlzIHBhdGggYXMgU1NEIHcvIHplcm8gCj4gb3BlbiB6b25l
Pwo+IAo+IEFueSB3YXkgdG8gZGlzdGluZ3Vpc2ggdGhhdD8KPiAKPiBUaGFua3MsCj4gCgpzYmkt
Pm1heF9vcGVuX3pvbmVzIG1pZ2h0IGJlIGNsYXNzaWZpZWQgaW50byA0IGNhc2VzOgoKMS4gRm9y
IG5vbiByb3RhdGlvbmFsIGRldmljZXMgdGhhdCBoYXZlIGJvdGggY29udmVudGlvbmFsIHpvbmVz
IGFuZApzZXF1ZW50aWFsIHpvbmVzLCB3ZSBzaG91bGQgc3RpbGwgZW5zdXJlIHRoYXQgbWF4X29w
ZW5fem9uZXMgPiAwLiBJZiB0aGUKIyBvZiBzZXF1ZW50aWFsIHpvbmVzIGV4Y2VlZHMgbWF4X29w
ZW5fem9uZXMsIHdlIHN0aWxsIG5lZWQgdG8gZ3VhcmFudGVlCnRoYXQgbWF4X29wZW5fem9uZXMg
Pj0gRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncy4KCkkgdGVzdGVkIHRoaXMgd2l0aCBudWxs
X2JsayBieSBlbXVsYXRpbmcgYSBkZXZpY2UgdGhhdCBoYXMgMTAKY29udmVudGlvbmFsIHpvbmVz
IGFuZCA0IHNlcXVlbnRpYWwgem9uZXMsIGFuZCB0aGUgZmlsZXN5c3RlbSBjYW4gYmUKZm9ybWF0
dGVkIHN1Y2Nlc3NmdWxseS4gSW4gdGhpcyBjYXNlLCB0aGUgZmlsZXN5c3RlbSBzaG91bGQgYWxz
byBiZQptb3VudGFibGUsIGFuZCBzYmktPm1heF9vcGVuX3pvbmVzIHNob3VsZCBiZSAxNC4gSG93
ZXZlciwgaWYKem9uZV9tYXhfb3BlbiBpcyBzZXQgdG8gMywgdGhlIGZpbGVzeXN0ZW0gY2Fubm90
IGJlIG1vdW50ZWQuCgojbW9kcHJvYmUgbnVsbF9ibGsgbnJfZGV2aWNlcz0xIHpvbmVkPTEgIHpv
bmVfbnJfY29udj0xMCAgem9uZV9zaXplPTEwMjQKZ2I9MTQgYnM9NDA5NiByb3RhdGlvbmFsPTAg
em9uZV9tYXhfb3Blbj00CiNta2ZzLmYyZnMgLW0gLWMgL2Rldi9udWxsYjAgL2Rldi92ZGEgLWYK
ClNvLCBzYmktPm1heF9vcGVuX3pvbmVzIG1pZ2h0IGJlICMgb2YgbWF4X29wZW5fem9uZXMgb3Ig
JyMgb2Ygc2VxdWVudGlhbAp6b25lcycgKyAnIyBvZiBjb252ZW50aW9uYWwgem9uZXMnLgoKMi4g
Rm9yIG5vbiByb3RhdGlvbmFsIGRldmljZXMgd2hpY2ggb25seSBoYXZlIGNvbnZlbnRpb25hbCB6
b25lcywgSSdtCm5vdCBzdXJlIHdoZXRoZXIgdGhlcmUgYXJlIHpvbmVkIGZsYXNoIGRldmljZXMg
dGhhdCBwcm92aWRlIG9ubHkKY29udmVudGlvbmFsIHpvbmVzLiBJZiBzdWNoIGRldmljZXMgZG8g
ZXhpc3QsIHRoZW4gcmV0dXJuaW5nIC1FSU5WQUwgaXMKaW5kZWVkIG5vdCBhcHByb3ByaWF0ZS4g
c2JpLT5tYXhfb3Blbl96b25lcyBzaG91bGQgYmUgIyBvZiBjb252ZW50aW9uYWwKem9uZXMuCgoz
LiBGb3Igbm9uIHJvdGF0aW9uYWwgZGV2aWNlcyB3aGljaCBvbmx5IGhhdmUgc2VxdWVudGlhbCB6
b25lcywgc2JpLQo+IG1heF9vcGVuX3pvbmVzIHNob3VsZCBiZSAjIG1heF9vcGVuX3pvbmVzLgoK
NC4gRm9yIHJvdGF0aW9uYWwgZGV2aWNlcywgc2JpLT5tYXhfb3Blbl96b25lcyBzaG91bGQgYmUg
IyB6b25lcyBvcgptYXhfb3Blbl96b25lcy4KCkFtIEkgbWlzc2luZyBhbnkgb3RoZXIgY2FzZXM/
CgpZb25ncGVuZywKCj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4gK8KgwqDCoMKgwqDCoMKgIG1h
eF9vcGVuX3pvbmVzID0gRkRFVihkZXZpKS5ucl9ibGt6Owo+Pj4gK8KgwqDCoCB9Cj4+PiArwqDC
oMKgIHNiaS0+bWF4X29wZW5fem9uZXMgPSBtaW5fdCh1bnNpZ25lZCBpbnQsIG1heF9vcGVuX3pv
bmVzLCBzYmktIAo+Pj4gPm1heF9vcGVuX3pvbmVzKTsKPj4+ICvCoMKgwqAgaWYgKHNiaS0+bWF4
X29wZW5fem9uZXMgPCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKSB7Cj4+PiArwqDCoMKg
wqDCoMKgwqAgZjJmc19lcnIoc2JpLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInpvbmVk
OiBtYXggb3BlbiB6b25lcyAldSBpcyB0b28gc21hbGwsIG5lZWQgYXQgbGVhc3QgJXUgCj4+PiBv
cGVuIHpvbmVzIiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNiaS0+bWF4X29wZW5fem9u
ZXMsIEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUlOVkFMOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiDCoMKgwqDCoMKgIEZERVYoZGV2
aSkuYmxrel9zZXEgPSBmMmZzX2t2emFsbG9jKHNiaSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVRTX1RPX0xPTkdTKEZERVYoZGV2aSkubnJfYmxreikK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHNpemVvZih1
bnNpZ25lZCBsb25nKSwKPj4+IC0tIAo+Pj4gMi40My4wCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

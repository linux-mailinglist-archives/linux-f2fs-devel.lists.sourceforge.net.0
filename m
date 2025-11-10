Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A3C44D9B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 04:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1BYtT+PYvscbKmTtsHPF8Ub0ODH5L4uk2CbXWS6ExE=; b=Yp3GOVPFSDPFVkX5VunQRoExib
	i3JriXdA7wnokblh3i3uD+XsI714aJdEUIDuTcQEaCPhdJnrvzSJAV1d3atAW9c1QjJnTFFb6ezIH
	ZEfpgEwkM6aucx49uPheLlrEbQcGjoUj0LJl/jDHIprzXQjrQdWcEl2pnFL9zNNgAp2U=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIImD-0000yX-HV;
	Mon, 10 Nov 2025 03:41:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vIImC-0000yQ-05
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 03:41:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/AjHpdHuaFPef54SlhZViyF+oSuNyJx9xYogmXGH8qQ=; b=BvMXxBYwca9uOxETOJyMhv4v9D
 L/gqycHESvVcWQ0b3msQPY/FLpSKzOePWRj65wp8sq/uxBZxQwlV8I+NI6F2KUFQ75g6rmVxqYYrC
 S/wHXsiRTVX4mGCiebLrU3SktUUB+whDzfpJjodJQKyUgWBTxIpqxxVqmEnlIxKmYTr8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/AjHpdHuaFPef54SlhZViyF+oSuNyJx9xYogmXGH8qQ=; b=WA43csc04cc/JglLkXDq1WZL1s
 tRN9ukuuHsAqE5ll7Jl2NGkb3AfSxVNsiwBWLzy8NYOhDYCjpvA+S/UriFrDoKqti/adCtuzHuvgM
 4zhI3usJzVCUg96G8POurIriOZJoACokXUJ8z3edsle2cY9icxzGkZTqj9j4uXE+yMmE=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vIImB-0000Sv-Fa for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 03:41:07 +0000
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-297ec50477aso7385985ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 09 Nov 2025 19:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762746062; x=1763350862; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/AjHpdHuaFPef54SlhZViyF+oSuNyJx9xYogmXGH8qQ=;
 b=QIxEBKMvm5LJKXKM+mYKBKvISyLyPRSlS72drEcrWsoDiDtQpCMGf5eUaaYwXiMaKU
 e3mmbXMv09PiBEuWTJydyLkMjS5N0n9ykxVDivxvrdlbPMFTABKe6SEN/tmfqpT/GWAt
 xJWPWk6ov9nvqYLXd8aQVDvxHhnn/eOXr5xSM5PrJQwAyT9Oy8kz8HTbW2GrYgGDj2Zj
 lBzcHmXAJvjoXW91qauCD6CU/q/iblqFZUaf3pCyuD3fpy9xf5JIWtZNNk7F87Fq7TQ0
 SqXaiTWHQMRTfTVgLiHzLZzq4LfvDZu3Pc7kKYdMerpjBJRwaXeSn3KOssVmkQrOqB0v
 95yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762746062; x=1763350862;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/AjHpdHuaFPef54SlhZViyF+oSuNyJx9xYogmXGH8qQ=;
 b=OLmhLn5ERIGkPDyG55GyphBIhxy3Ym6ftk2d9LP84Xok/9Z91PjiO3EXGK67ZKUcbu
 y0STyyOGhu9ReDjLljXBnW+Ae/bqwxpdnt+Pf+WKBkUiXLmYtkb8pvchOtxLl5Qitcw/
 fk+TWedvYU/G/JIWb8R7RBZQg87a9aGt6L9XHAIxrEv3urT7siFGzjHakn8OnJV2qUHn
 BGh8jhKj3SVdRmJpoCJuTytsBzdg6fYvkPYuyfgiBv6807AF90+a5NoY1MBdf4t4LBuS
 3gHMtZ05vlAQl0jS1aRApwk4YRVZcm5YEDiN4B88Va9cbVCl1QYHc2MYvHX+utBiLsDE
 SpAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURVzidW3cOaJiNFN5MpLzJtfnwYQmKhB+7jmH8932v3d8OrdTb3fq2IEd9P076DBjKbUiafQVaJwARI2diyW1d@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywp7L1gcbEkbD1xzvL0sApAPiSX1ThgLGOpBebdafxTwW2a97LZ
 1OY7xmnMYDxiNU6+WBSzCk8ajc+o39hHE+8ovBzYHOW1AztLbuk6cZz4
X-Gm-Gg: ASbGnctk9PpWs3i6ck2Xm81TZBYKaZCuUK8C2nRWxRsnkuvIqykj3kYKhmassWfeqjo
 OmM5BYPIXxz4vbWEdD4nm6mgM5uBNfAIpFE5GcqII9Yxf6kzxeCcsMyzk/BvA6SrY9XuvAbrlB7
 kBUZdcZ1gAmwh6qsSbSXJezQQFVCdxeT4dZYV26qXXcJ2SQruDAbRJnbv1wZpzoGnr24hFC2+Un
 2yIIczEbRBXz6ByDFWDGO+5mMhr1t5k0zGKX2D7wkl1GukZGjrlBFk0MR3AP/QDuC9tI/L9dr1U
 RhxDRxG9tW3idKnzgHFkqdjEhtXC4Y2un7K+uf+9rAK5ZYP9bouvhS+0kWqweKYVqIFrHQqEJ5e
 9Aygd2bGIDmlgZthVxh+0fSKPZqvU3lRhqEdA3XdVBOXfGfMTkm58xo5NSnAXklOb7B5rsUWZBb
 HRiAKAaoP1JLPRuE7BcNB1kWcNxLQZnYhFmQ==
X-Google-Smtp-Source: AGHT+IHHTNrOQXxsH5mS9xChwJN6kQB426G0zGpVDlg926gzWLKSMDwKD8x/m6WcERKpqP3uIoigTg==
X-Received: by 2002:a17:902:fc8f:b0:295:96bc:8698 with SMTP id
 d9443c01a7336-297e1e44db6mr75329435ad.19.1762746061629; 
 Sun, 09 Nov 2025 19:41:01 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29650c5c6b3sm126032815ad.24.2025.11.09.19.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 19:41:00 -0800 (PST)
Message-ID: <999c6f51-8fef-40ee-a73c-2ca4fc2c36a5@gmail.com>
Date: Mon, 10 Nov 2025 11:40:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251106091537.3063566-1-yangyongpeng.storage@gmail.com>
 <20251106091537.3063566-2-yangyongpeng.storage@gmail.com>
 <6bc90239-b405-4364-ae2c-d98b743b5425@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <6bc90239-b405-4364-ae2c-d98b743b5425@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/8/25 10:57, Chao Yu via Linux-f2fs-devel wrote: > On
 2025/11/6 17:15, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> When the
 block device reports max_open_zones == 0, sbi->max_open_zones > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vIImB-0000Sv-Fa
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix handling of block devices with
 max_open_zones == 0
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvOC8yNSAxMDo1NywgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPiBP
biAyMDI1LzExLzYgMTc6MTUsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEZyb206IFlvbmdwZW5n
IFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pgo+PiBXaGVuIHRoZSBibG9jayBkZXZp
Y2UgcmVwb3J0cyBtYXhfb3Blbl96b25lcyA9PSAwLCBzYmktPm1heF9vcGVuX3pvbmVzCj4+IGlz
IGluaXRpYWxpemVkIHRvIFVJTlRfTUFYLiBJbiBzdWNoIGNhc2VzLCBGMkZTIGNhbiBzdGlsbCBi
ZSBtb3VudGVkCj4+IHN1Y2Nlc3NmdWxseSAoYXMgdGVzdGVkIHVuZGVyIHFlbXUpLgo+PiBIb3dl
dmVyLCBmb3IgU1NEcywgYSBkZXZpY2UgcmVwb3J0aW5nIG1heF9vcGVuX3pvbmVzID09IDAgc2hv
dWxkIG5vdCBiZQo+PiBtb3VudGFibGUsIHdoaWxlIGZvciBTTVIgSEREcyB0aGlzIGlzIGFjY2Vw
dGFibGUuCj4+IEZpeCB0aGlzIGlzc3VlIGJ5IGhhbmRsaW5nIG1heF9vcGVuX3pvbmVzID09IDAg
cHJvcGVybHk6Cj4+IC0gRGlzYWxsb3cgbW91bnRpbmcgb24gU1NEcyB3aGVuIG1heF9vcGVuX3pv
bmVzID09IDAuCj4+IC0gRm9yIFNNUiBIRERzLCBzZXQgbWF4X29wZW5fem9uZXMgdG8gdGhlIHRv
dGFsIG51bWJlciBvZiB6b25lcy4KPj4gLSBSZW1vdmUgcmVkdW5kYW50IHpvbmVkIGRldmljZSBj
aGVja3MuCj4+IC0gQWRkIGEgc3lzZnMgZW50cnkgdG8gZXhwb3NlIG1heF9vcGVuX3pvbmVzLgo+
Pgo+PiBGaXhlczogMGY5YjEyMTQyYmUxYWYoImYyZnM6IGZpeCB6b25lZCBibG9jayBkZXZpY2Ug
aW5mb3JtYXRpb24gCj4+IGluaXRpYWxpemF0aW9uIikKPj4gU2lnbmVkLW9mZi1ieTogWW9uZ3Bl
bmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL3N1
cGVyLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPj4gwqAgZnMv
ZjJmcy9zeXNmcy5jIHzCoCAyICsrCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgMTUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMg
Yi9mcy9mMmZzL3N1cGVyLmMKPj4gaW5kZXggYzA1NTAzMjU5M2I3Li43MzQ5ZDljZDkwMWIgMTAw
NjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4g
QEAgLTQzNTMsMjEgKzQzNTMsNiBAQCBzdGF0aWMgaW50IGluaXRfYmxrel9pbmZvKHN0cnVjdCBm
MmZzX3NiX2luZm8gCj4+ICpzYmksIGludCBkZXZpKQo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGlu
dCBtYXhfb3Blbl96b25lczsKPj4gwqDCoMKgwqDCoCBpbnQgcmV0Owo+PiAtwqDCoMKgIGlmICgh
ZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+
IAo+IGluaXRfYmxrel9pbmZvKCkgc2hvdWxkIG9ubHkgYmUgY2FsbGVkIGlmIGJsa3pvbmVkIGZl
YXR1cmUgaXMgb24/Cj4gCgpZZXMsIGluaXRfYmxrel9pbmZvKCkgaXMgb25seSBjYWxsZWQgYnkg
ZjJmc19zY2FuX2RldmljZXMoKSwgYW5kIHRoZQpibGt6b25lZCBmZWF0dXJlIGhhcyBhbHJlYWR5
IGJlZW4gY2hlY2tlZCB0aGVyZS4gU28gdGhlcmXigJlzIG5vIG5lZWQgdG8KY2hlY2sgaXQgYWdh
aW4uCgo+PiAtCj4+IC3CoMKgwqAgaWYgKGJkZXZfaXNfem9uZWQoRkRFVihkZXZpKS5iZGV2KSkg
ewo+PiAtwqDCoMKgwqDCoMKgwqAgbWF4X29wZW5fem9uZXMgPSBiZGV2X21heF9vcGVuX3pvbmVz
KGJkZXYpOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKG1heF9vcGVuX3pvbmVzICYmIChtYXhfb3Bl
bl96b25lcyA8IHNiaS0+bWF4X29wZW5fem9uZXMpKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzYmktPm1heF9vcGVuX3pvbmVzID0gbWF4X29wZW5fem9uZXM7Cj4+IC3CoMKgwqDCoMKgwqDC
oCBpZiAoc2JpLT5tYXhfb3Blbl96b25lcyA8IEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3Mp
IHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19lcnIoc2JpLAo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ6b25lZDogbWF4IG9wZW4gem9uZXMgJXUgaXMgdG9vIHNt
YWxsLCBuZWVkIGF0IGxlYXN0IAo+PiAldSBvcGVuIHpvbmVzIiwKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzYmktPm1heF9vcGVuX3pvbmVzLCBGMkZTX09QVElPTihzYmkpLmFj
dGl2ZV9sb2dzKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+
IC3CoMKgwqDCoMKgwqDCoCB9Cj4+IC3CoMKgwqAgfQo+PiAtCj4+IMKgwqDCoMKgwqAgem9uZV9z
ZWN0b3JzID0gYmRldl96b25lX3NlY3RvcnMoYmRldik7Cj4+IMKgwqDCoMKgwqAgaWYgKHNiaS0+
YmxvY2tzX3Blcl9ibGt6ICYmIHNiaS0+YmxvY2tzX3Blcl9ibGt6ICE9Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0VDVE9SX1RPX0JMT0NLKHpvbmVfc2VjdG9ycykpCj4+
IEBAIC00Mzc4LDYgKzQzNjMsMjcgQEAgc3RhdGljIGludCBpbml0X2Jsa3pfaW5mbyhzdHJ1Y3Qg
ZjJmc19zYl9pbmZvIAo+PiAqc2JpLCBpbnQgZGV2aSkKPj4gwqDCoMKgwqDCoCBpZiAobnJfc2Vj
dG9ycyAmICh6b25lX3NlY3RvcnMgLSAxKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIEZERVYoZGV2
aSkubnJfYmxreisrOwo+PiArwqDCoMKgIG1heF9vcGVuX3pvbmVzID0gYmRldl9tYXhfb3Blbl96
b25lcyhiZGV2KTsKPj4gK8KgwqDCoCBpZiAoIW1heF9vcGVuX3pvbmVzKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCAvKgo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIFNTRHMgcmVxdWlyZSBtYXhfb3Blbl96
b25lcyA+IDAgdG8gYmUgbW91bnRhYmxlLgo+IAo+IERvIHlvdSBtZWFuIHdlIGVuYWJsZWQgYmxr
em9uZWQgZmVhdHVyZSBvbiBhIHpvbmVkIFNTRD8gU3VjaCBTU0QgY2FuIAo+IHJlcG9ydCB6ZXJv
ZWQgbWF4X29wZW5fem9uZXM/Cj4gSWYgc28sIGNhbiB5b3UgcGxlYXNlIGFkZCBtb3JlIGRldGFp
bHMgaW4gY29tbWl0IG1lc3NhZ2U/Cj4gCgpZZXMsIEkgdGVzdGVkIHdpdGggYSBaTlMgU1NEIGVt
dWxhdGVkIG9uIHFlbXUgYW5kIHNldCB6b25lZC5tYXhfb3BlbiB0bwowLiBmMmZzIHdpdGggem5z
IHNzZCBhbmQgY29udmVudGlvbmFsIHNzZCBjYW4gYmUgbW91bnRlZCBub3JtYWxseSwgYW5kCnNi
aS0+bWF4X29wZW5fem9uZXMgaXMgVUlOVF9NQVguIEkgd2lsbCBhZGQgbW9yZSBleHBsYW5hdGlv
bnMgaW4gdGhlIHYyCnBhdGNoLgoKCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogRm9yIEhERHMsIGlm
IG1heF9vcGVuX3pvbmVzIGlzIHJlcG9ydGVkIGFzIDAsIGl0IGRvZXNuJ3QgCj4+IG1hdHRlciwK
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBzZXQgaXQgdG8gRkRFVihkZXZpKS5ucl9ibGt6Lgo+PiAr
wqDCoMKgwqDCoMKgwqDCoCAqLwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGJkZXZfbm9ucm90KGJk
ZXYpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZXJyKHNiaSwgInpvbmVkOiBT
U0QgZGV2aWNlICVzIHdpdGhvdXQgb3BlbiB6b25lcyIsIAo+PiBGREVWKGRldmkpLnBhdGgpOwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gK8KgwqDCoMKgwqDC
oMKgIH0KPj4gK8KgwqDCoMKgwqDCoMKgIG1heF9vcGVuX3pvbmVzID0gRkRFVihkZXZpKS5ucl9i
bGt6Owo+PiArwqDCoMKgIH0KPj4gK8KgwqDCoCBzYmktPm1heF9vcGVuX3pvbmVzID0gbWluX3Qo
dW5zaWduZWQgaW50LCBtYXhfb3Blbl96b25lcywgc2JpLSAKPj4gPm1heF9vcGVuX3pvbmVzKTsK
Pj4gK8KgwqDCoCBpZiAoc2JpLT5tYXhfb3Blbl96b25lcyA8IEYyRlNfT1BUSU9OKHNiaSkuYWN0
aXZlX2xvZ3MpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGYyZnNfZXJyKHNiaSwKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgInpvbmVkOiBtYXggb3BlbiB6b25lcyAldSBpcyB0b28gc21hbGwsIG5l
ZWQgYXQgbGVhc3QgJXUgCj4+IG9wZW4gem9uZXMiLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzYmktPm1heF9vcGVuX3pvbmVzLCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKTsKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiArwqDCoMKgIH0KPj4gKwo+PiDCoMKg
wqDCoMKgIEZERVYoZGV2aSkuYmxrel9zZXEgPSBmMmZzX2t2emFsbG9jKHNiaSwKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJJVFNfVE9fTE9OR1MoRkRFVihk
ZXZpKS5ucl9ibGt6KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBzaXplb2YodW5zaWduZWQgbG9uZyksCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N5c2Zz
LmMgYi9mcy9mMmZzL3N5c2ZzLmMKPj4gaW5kZXggOThkMmNiNjBlODA2Li5kM2QyNjhjNzA3YTkg
MTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc3lzZnMuYwo+PiArKysgYi9mcy9mMmZzL3N5c2ZzLmMK
Pj4gQEAgLTEyMTAsNiArMTIxMCw3IEBAIEYyRlNfU0JJX0dFTkVSQUxfUldfQVRUUihsYXN0X2Fn
ZV93ZWlnaHQpOwo+PiDCoCBGMkZTX1NCSV9HRU5FUkFMX1JXX0FUVFIobWF4X3JlYWRfZXh0ZW50
X2NvdW50KTsKPj4gwqAgI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4+IMKgIEYyRlNfU0JJ
X0dFTkVSQUxfUk9fQVRUUih1bnVzYWJsZV9ibG9ja3NfcGVyX2Jsa3opOwo+PiArRjJGU19TQklf
R0VORVJBTF9ST19BVFRSKG1heF9vcGVuX3pvbmVzKTsKPiAKPiBOZWVkIHRvIHVwZGF0ZSBtYW51
YWwgcGFnZSBhcyB3ZWxsLCB3aGF0IGFib3V0IGFkZGluZyB0aGlzIG5ldyBzeXNmcyAKPiBlbnRy
eSBpbiBhCj4gc2VwYXJhdGVkIHBhdGNoPwo+IAo+IFRoYW5rcywKPiAKCkkgYWdyZWUsIGl0IG1h
a2VzIG1vcmUgc2Vuc2UgdG8gc3BsaXQgdGhlbS4gSeKAmWxsIHNlcGFyYXRlIHRoZSBwYXRjaCBh
bmQgCnVwZGF0ZSBtYW51YWwgcGFnZSBpbiB2Mi4KCllvbmdwZW5nLAoKPj4gwqAgRjJGU19TQklf
R0VORVJBTF9SV19BVFRSKGJsa3pvbmVfYWxsb2NfcG9saWN5KTsKPj4gwqAgI2VuZGlmCj4+IMKg
IEYyRlNfU0JJX0dFTkVSQUxfUldfQVRUUihjYXJ2ZV9vdXQpOwo+PiBAQCAtMTM4NCw2ICsxMzg1
LDcgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmYyZnNfYXR0cnNbXSA9IHsKPj4gwqAgI2Vu
ZGlmCj4+IMKgICNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+PiDCoMKgwqDCoMKgIEFUVFJf
TElTVCh1bnVzYWJsZV9ibG9ja3NfcGVyX2Jsa3opLAo+PiArwqDCoMKgIEFUVFJfTElTVChtYXhf
b3Blbl96b25lcyksCj4+IMKgwqDCoMKgwqAgQVRUUl9MSVNUKGJsa3pvbmVfYWxsb2NfcG9saWN5
KSwKPj4gwqAgI2VuZGlmCj4+IMKgICNpZmRlZiBDT05GSUdfRjJGU19GU19DT01QUkVTU0lPTgo+
IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

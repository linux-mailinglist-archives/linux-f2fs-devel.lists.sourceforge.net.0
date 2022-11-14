Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8186284BD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 17:13:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouc5N-0006qb-Q9;
	Mon, 14 Nov 2022 16:13:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1ouc5L-0006qR-Pn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YRFNvdT6JF7qDcu72Zo5uuOCp8Sjc0UsAWSJNwKBJQI=; b=MDXXM3IVauiHi60VctfpHzHany
 OJymMNUdgzJkSmaX8B5dsHLyEJ5HEK1ewff52UtuOMFr3tDIRehRDmrxuuCC929QqvCuPLVQNfEyR
 zaP40Gh+EsS+m1z1nvPb3k7sROHuXMcoL5bCeo7HLvcgskDQYgebJUxGp7U18HkF6Qms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YRFNvdT6JF7qDcu72Zo5uuOCp8Sjc0UsAWSJNwKBJQI=; b=H4qPuqEltN3Mn0GNf703YxHVa+
 7r/0B0Iz9KHs+JkWDKUvQPExgGeQ6KrSP/+gCi2dVjQFQMCIgS4xpj/Q9eOxu9QQPMdYSZSqJ6m++
 WM6cMmDF+cM0+b3/+GA4Q/w6pgFblL++aXK2dDF8tOdiH9gAFoEBSPFk5XNDYbUDlOpU=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ouc5J-0008Sy-V2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:13:23 +0000
Received: by mail-pl1-f177.google.com with SMTP id io19so10461558plb.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Nov 2022 08:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRFNvdT6JF7qDcu72Zo5uuOCp8Sjc0UsAWSJNwKBJQI=;
 b=SlW0nDP57gbIrWUJ7Dex9ol8lyx6anoIM9qrgwjefov6ZN8gmL5tLzEfG7+StvEb3Q
 J31o2fjGnDDJGZYkziNU6tm0xbZv338Y3mVPqkkEa/ElUtqdZ1HBkCCQFrJB/BRTC19K
 I/FKBy/Wnn44vEfnc/Lo3qJ6jm0lfeNqV0Gx2nJinFmbI9MFIfvctT+tXoJyQ2sJ1HQw
 vnm6GEIvNWI/VO6jYBIII5rxFHo+A1hmwToEHiFBpbojfZp+W4zSDMdPLMivuHbsreEk
 YHiZSm3MZYavQPPibHU3Mw1I8L+ubxE/cGNYyWJsFcbVGzUEum2q7M43+vNENmSHjORB
 vjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YRFNvdT6JF7qDcu72Zo5uuOCp8Sjc0UsAWSJNwKBJQI=;
 b=6Yiz0iP7mLZHbNjK2EgxY8ubuoifTImRDYbaT7/js5Xx+FGuTuzh7Eoxgg3pPTppP0
 olhmVdGUZq5vCotL5uBWe3c0jHwPCD6MMdmcQ0clJs5/xmKt6eFhTUHhlf6NeydMCrvQ
 fbGIw8/R0S3hHGYSLPCSlF39DFxxeglrffeczqrmDfUKjVD6JAsPHy8uHHJQo1Qy+w0a
 L9+0eJHOudp6zrqB5MZg/SSvno3nqqS2jgRESd+RZo65zFt2IsEJUeHxzv8dRsc5H23I
 G9ICeJkMKOBg+LbOJKivTFVRF2tgPEYUZmRBlZr9zLd/X4YsB/GhNviSeDzgBvR3YXRB
 T4cA==
X-Gm-Message-State: ANoB5pniu5HGwzGCg6raOQBPp0rVJDQ2N7xpBzkBW4lN8UxQ0IZAgPnH
 Hqzf7pIZ1Nq/KilPIEqdojM=
X-Google-Smtp-Source: AA0mqf6xIx26A00pMZkyp36B+w6OvI0rKJFClARwvLr/LQ97vfqPL6rx9bmPiS/LP4ywhvhUnFfZRQ==
X-Received: by 2002:a17:90a:558c:b0:213:b4ad:7290 with SMTP id
 c12-20020a17090a558c00b00213b4ad7290mr14564288pji.197.1668442396250; 
 Mon, 14 Nov 2022 08:13:16 -0800 (PST)
Received: from [10.114.96.3] ([129.227.152.6])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a17090341c900b0017a0668befasm5378643ple.124.2022.11.14.08.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 08:13:15 -0800 (PST)
Message-ID: <7f221206-a29c-08ee-dfae-d4875bf7205d@gmail.com>
Date: Tue, 15 Nov 2022 00:13:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20221112083250.295700-1-Yuwei.Guan@zeekrlife.com>
 <20221112083250.295700-2-Yuwei.Guan@zeekrlife.com>
 <983de611-a9e7-56d0-d375-f2b54e1f4d05@kernel.org>
From: Yuwei Guan <ssawgyw@gmail.com>
In-Reply-To: <983de611-a9e7-56d0-d375-f2b54e1f4d05@kernel.org>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/14 22:42, Chao Yu wrote: > On 2022/11/12 16:32,
 Yuwei Guan wrote: >> The commit 84b89e5d943d8 ("f2fs: add auto tuning for
 small devices") add >> tuning for small volume device, now support [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ouc5J-0008Sy-V2
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: fix to alloc_mode changed after
 remount on a small volume device
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDIwMjIvMTEvMTQgMjI6NDIsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMi8xMS8xMiAxNjoz
MiwgWXV3ZWkgR3VhbiB3cm90ZToKPj4gVGhlIGNvbW1pdCA4NGI4OWU1ZDk0M2Q4ICgiZjJmczog
YWRkIGF1dG8gdHVuaW5nIGZvciBzbWFsbCBkZXZpY2VzIikgYWRkCj4+IHR1bmluZyBmb3Igc21h
bGwgdm9sdW1lIGRldmljZSwgbm93IHN1cHBvcnQgdG8gdHVuZSBhbGxvY2VfbW9kZSB0byAKPj4g
J3JldXNlJwo+PiBpZiBpdCdzIHNtYWxsIHNpemUuIEJ1dCB0aGUgYWxsb2NfbW9kZSB3aWxsIGNo
YW5nZSB0byAnZGVmYXVsdCcgd2hlbiBkbwo+PiByZW1vdW50IG9uIHRoaXMgc21hbGwgc2l6ZSBk
aWV2Y2UuCj4+Cj4+IFRoZSBjb21taXQgNGNhYzkwZDU0OTFjOSAoImYyZnM6IHJlbG9jYXRlIHJl
YWRkaXJfcmEgY29uZmlndXJlCj4+IGluaXRpYWxpemF0aW9uIikgcmVsb2NhdGVzIHJlYWRkaXJf
cmEgdmFyaWFibGUgdG8gdHVuaW5nIHByb2Nlc3MuCj4+Cj4+IFRoaXMgcGF0Y2ggZm8gZml4IGFs
bG9jX21vZGUgY2hhbmdlZCB3aGVuIGRvIHJlbW91bnQgZm9yIGEgc21hbGwgdm9sdW1lCj4+IGRl
dmljZS4KPj4KPj4gRm9yIGEgc21hbGwgZGV2aWNlLAo+PiAtIGFsbG9jX21vZGUgd2lsbCBrZWVw
ICdyZXVzZScsIGlmIG5vIGFsbG9jX21vZGUgb3B0aW9uIGluIHJlbW91bnQKPj4gwqDCoCBjb21t
YW5kLAo+PiAtIGFsbG9jX21vZGUgd2lsbCBiZSBzZXQgYXMgcmVtb3VudCBjb21tYW5kLCBpZiBp
dCBoYXMgJ2FsbG9jX21vZGU9Jy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWXV3ZWkgR3VhbiA8WXV3
ZWkuR3VhbkB6ZWVrcmxpZmUuY29tPgo+PiAtLS0KPj4gwqAgZnMvZjJmcy9zdXBlci5jIHwgMzcg
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4gaW5kZXggMzgzNGVhZDA0NjIwLi4y
ZjM2ODI0ZmY4NGIgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+PiArKysgYi9mcy9m
MmZzL3N1cGVyLmMKPj4gQEAgLTIxOTAsNiArMjE5MCwyMyBAQCBzdGF0aWMgdm9pZCBmMmZzX2Vu
YWJsZV9jaGVja3BvaW50KHN0cnVjdCAKPj4gZjJmc19zYl9pbmZvICpzYmkpCj4+IMKgwqDCoMKg
wqAgZjJmc19mbHVzaF9ja3B0X3RocmVhZChzYmkpOwo+PiDCoCB9Cj4+IMKgICtzdGF0aWMgdm9p
ZCBmMmZzX3R1bmluZ19wYXJhbWV0ZXJzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCAK
Pj4gaXNfcmVtb3VudCkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgZjJmc19zbV9pbmZvICpzbV9p
ID0gU01fSShzYmkpOwo+PiArCj4+ICvCoMKgwqAgLyogYWRqdXN0IHBhcmFtZXRlcnMgYWNjb3Jk
aW5nIHRvIHRoZSB2b2x1bWUgc2l6ZSAqLwo+PiArwqDCoMKgIGlmIChzbV9pLT5tYWluX3NlZ21l
bnRzIDw9IFNNQUxMX1ZPTFVNRV9TRUdNRU5UUykgewo+PiArwqDCoMKgwqDCoMKgwqAgRjJGU19P
UFRJT04oc2JpKS5hbGxvY19tb2RlID0gQUxMT0NfTU9ERV9SRVVTRTsKPgo+IEhvdyBhYm91dCBt
b3ZpbmcgYWJvdmUgbG9naWMgaW50byBkZWZhdWx0X29wdGlvbnMoKT8KPgpIaSBDaGFvLAoKJ3Nt
X2ktPm1haW5fc2VnbWVudHMnIGluaXQgaW4gZnVuYyAnZjJmc19idWlsZF9zZWdtZW50X21hbmFn
ZXIoKScsCgp3aGVuIGRvIGZpbGwgc3VwZXIgcHJvY2Vzcywgc28gaXQgY2Fubm90IG1vdmUgaW50
byBkZWZhdWx0X29wdGlvbnMoKS4KCj4gVGhhbmtzLAo+Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
ZjJmc19ibG9ja191bml0X2Rpc2NhcmQoc2JpKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c21faS0+ZGNjX2luZm8tPmRpc2NhcmRfZ3JhbnVsYXJpdHkgPSAxOwo+PiArwqDCoMKgwqDCoMKg
wqAgc21faS0+aXB1X3BvbGljeSA9IDEgPDwgRjJGU19JUFVfRk9SQ0UgfAo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMSA8PCBGMkZTX0lQVV9IT05PUl9PUFVfV1JJ
VEU7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgaWYgKCFpc19yZW1vdW50KQo+PiArwqDC
oMKgwqDCoMKgwqAgc2JpLT5yZWFkZGlyX3JhID0gMTsKPj4gK30KPj4gKwo+PiDCoCBzdGF0aWMg
aW50IGYyZnNfcmVtb3VudChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgKmZsYWdzLCBjaGFy
IAo+PiAqZGF0YSkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSA9IEYyRlNfU0Ioc2IpOwo+PiBAQCAtMjI0OCw2ICsyMjY1LDggQEAgc3RhdGljIGludCBmMmZz
X3JlbW91bnQoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgCj4+IGludCAqZmxhZ3MsIGNoYXIgKmRh
dGEpCj4+IMKgIMKgwqDCoMKgwqAgZGVmYXVsdF9vcHRpb25zKHNiaSk7Cj4+IMKgICvCoMKgwqAg
ZjJmc190dW5pbmdfcGFyYW1ldGVycyhzYmksIHRydWUpOwo+PiArCj4+IMKgwqDCoMKgwqAgLyog
cGFyc2UgbW91bnQgb3B0aW9ucyAqLwo+PiDCoMKgwqDCoMKgIGVyciA9IHBhcnNlX29wdGlvbnMo
c2IsIGRhdGEsIHRydWUpOwo+PiDCoMKgwqDCoMKgIGlmIChlcnIpCj4+IEBAIC00MDU0LDIyICs0
MDczLDYgQEAgc3RhdGljIGludCBmMmZzX3NldHVwX2Nhc2Vmb2xkKHN0cnVjdCAKPj4gZjJmc19z
Yl9pbmZvICpzYmkpCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gwqAgLXN0YXRp
YyB2b2lkIGYyZnNfdHVuaW5nX3BhcmFtZXRlcnMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+
PiAtewo+PiAtwqDCoMKgIHN0cnVjdCBmMmZzX3NtX2luZm8gKnNtX2kgPSBTTV9JKHNiaSk7Cj4+
IC0KPj4gLcKgwqDCoCAvKiBhZGp1c3QgcGFyYW1ldGVycyBhY2NvcmRpbmcgdG8gdGhlIHZvbHVt
ZSBzaXplICovCj4+IC3CoMKgwqAgaWYgKHNtX2ktPm1haW5fc2VnbWVudHMgPD0gU01BTExfVk9M
VU1FX1NFR01FTlRTKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBGMkZTX09QVElPTihzYmkpLmFsbG9j
X21vZGUgPSBBTExPQ19NT0RFX1JFVVNFOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGYyZnNfYmxv
Y2tfdW5pdF9kaXNjYXJkKHNiaSkpCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNtX2ktPmRj
Y19pbmZvLT5kaXNjYXJkX2dyYW51bGFyaXR5ID0gMTsKPj4gLcKgwqDCoMKgwqDCoMKgIHNtX2kt
PmlwdV9wb2xpY3kgPSAxIDw8IEYyRlNfSVBVX0ZPUkNFIHwKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEgPDwgRjJGU19JUFVfSE9OT1JfT1BVX1dSSVRFOwo+PiAt
wqDCoMKgIH0KPj4gLQo+PiAtwqDCoMKgIHNiaS0+cmVhZGRpcl9yYSA9IDE7Cj4+IC19Cj4+IC0K
Pj4gwqAgc3RhdGljIGludCBmMmZzX2ZpbGxfc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwg
dm9pZCAqZGF0YSwgaW50IAo+PiBzaWxlbnQpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmk7Cj4+IEBAIC00NDc1LDcgKzQ0NzgsNyBAQCBzdGF0aWMgaW50IGYy
ZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgCj4+ICpzYiwgdm9pZCAqZGF0YSwgaW50
IHNpbGVudCkKPj4gwqAgwqDCoMKgwqDCoCBmMmZzX2pvaW5fc2hyaW5rZXIoc2JpKTsKPj4gwqAg
LcKgwqDCoCBmMmZzX3R1bmluZ19wYXJhbWV0ZXJzKHNiaSk7Cj4+ICvCoMKgwqAgZjJmc190dW5p
bmdfcGFyYW1ldGVycyhzYmksIGZhbHNlKTsKPj4gwqAgwqDCoMKgwqDCoCBmMmZzX25vdGljZShz
YmksICJNb3VudGVkIHdpdGggY2hlY2twb2ludCB2ZXJzaW9uID0gJWxseCIsCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGN1cl9jcF92ZXJzaW9uKEYyRlNfQ0tQVChzYmkpKSk7CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=

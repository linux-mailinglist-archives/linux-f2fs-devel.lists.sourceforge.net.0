Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A58B480BABD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 13:55:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCJLZ-0007U0-H1;
	Sun, 10 Dec 2023 12:55:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wubo.oduw@gmail.com>) id 1rCJLX-0007Tu-6d
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 12:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sZVT0tgK307bE/wFVEQKUID391OimB39JlVcTN0lCNs=; b=Yjn2KhKrjrMJLtUX9sOk4Q+jmb
 /qhr45ewlaeOpBJrHmEej7Czbb0K63q5Hnwxd1VhRU/CcsBQVeuck7zLjHu8xwDueTAYeceY5LfmS
 prOQcNH2u5E1rVimL8hGKsHYhy5ucGQV51WQNP5LS8/SjqgC5byv4lVXhbeIr+KcXwo0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sZVT0tgK307bE/wFVEQKUID391OimB39JlVcTN0lCNs=; b=k0pnj9k/oG4E2alPEaKPCgeXEx
 C67EzFd0LLvzXuLwKfOWJTfmoAVwmD8+GMNhTjo5CAbB70xe3ktlFVROkzfq3+HlCvDLucedHphTc
 Bp5FbZ2c4MjpEFRISoa72SHLfW2iSiwMoJmC6RnCX1nzQ4R3zU6jOsHaA06o1j7Fcwco=;
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rCJLV-0004Yv-3X for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 12:55:46 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-58e256505f7so1879144eaf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Dec 2023 04:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702212934; x=1702817734; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sZVT0tgK307bE/wFVEQKUID391OimB39JlVcTN0lCNs=;
 b=G0+sfXdGp/TWPk+rncSDUWVibJ01W4fsbR5k9em7I75H0h8ep7V45A+d9xT3gPcAV2
 dmwVAmGE2GdsHvoJalTwlNYKyHNQtaIChqpmCordUAZBS+mYicEdEEtLVIDrYjdol8HS
 0/6hA3IZ1O3yWv1FZnI5K8TnICiBVetmijiFIsX5bkIloesBf96sx4e2jCmGqFbEONYl
 hirzPnXAeXuz0w4aGzQW/2eMSlzaR1g0+0dCrJSVitdCqVyA45Iyv0Q0mm4tBUr0CUoV
 XtLnz7isuXVvOCoPzKGYVFLXi92IUANERp6FZhsa+DdLelAS28eQjmLsjIoCEy00U5gT
 7Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702212934; x=1702817734;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sZVT0tgK307bE/wFVEQKUID391OimB39JlVcTN0lCNs=;
 b=Nw2raSL5qwfJOhXJ1NwbdhfgzdJE8t898LLtv43N2L3Sen3zgqtljm39r5+m1fV87h
 Ilc2NZQjsi9NsrY3CDMne6O3u1o3GMVrOB5amO6Z6W9AiRZSqvFw6qfb12ytUUxebHqU
 wXxZ4Zd1Hj3jC86YLGy//1iC5pSRxM2YsFlsShhMWRGV21Q4aaGl8kgq+Up+jQUufUUK
 8VqIV+v6j1UHw/Rp9dMI6WW0hIjXfHx+CZMfi7FMhkyhcAWtdBoS4J/qG73kLdOTueo7
 tcauNqPRQB6/h+Lg0qC6jG2WjbmExPs9CjoBSn8rSgmCeldEeY0k+mRFHcpNRLTXiT7J
 1Vug==
X-Gm-Message-State: AOJu0YyKB03WQ2YSvY4e1p8M/nJRx1CXi3+e8W98kgPO1Ex0jP6dFumi
 inVnUshxNasRZO3odagmjk8=
X-Google-Smtp-Source: AGHT+IFZTHVfNPuUmXro4hv7IeY7KkZonKOLh3+tfqbvjZu4jJlKPGqQ66BvTGhrqa169hkSkZVW/g==
X-Received: by 2002:a05:6808:13c3:b0:3b9:fc7c:b57d with SMTP id
 d3-20020a05680813c300b003b9fc7cb57dmr2625229oiw.35.1702212934317; 
 Sun, 10 Dec 2023 04:55:34 -0800 (PST)
Received: from [192.168.50.127] (awork111197.netvigator.com. [203.198.94.197])
 by smtp.gmail.com with ESMTPSA id
 dj14-20020a17090ad2ce00b00286e8fe03c1sm5074151pjb.22.2023.12.10.04.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Dec 2023 04:55:33 -0800 (PST)
Message-ID: <dd72cec6-cbc9-4c00-a967-841ec614102f@gmail.com>
Date: Sun, 10 Dec 2023 20:55:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Wu Bo <bo.wu@vivo.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231030094024.263707-1-bo.wu@vivo.com>
 <c181256e-9f6e-d43e-4d02-a7d8d5286d56@kernel.org>
 <670ce4a6-f00c-dbe9-86e2-366311221cf3@gmail.com>
 <a69b7544-2312-486c-d655-8b86e370c55e@kernel.org>
 <faa90acc-c03e-2913-c19a-bd50fd93d197@gmail.com>
 <5d8726fc-e912-6954-3820-862eecff07b0@kernel.org>
 <eedad403-5754-4d5e-965d-19eff02e3d40@gmail.com>
 <09cd02dd-a8d9-4b7a-8f10-b445e2c9ea85@kernel.org>
Content-Language: en-US
From: Wu Bo <wubo.oduw@gmail.com>
In-Reply-To: <09cd02dd-a8d9-4b7a-8f10-b445e2c9ea85@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/9 17:46, Chao Yu wrote: > On 2023/11/28 20:51,
 Wu Bo wrote: >> >> On 2023/11/28 14:22, Chao Yu wrote: >>> On 2023/11/17 7:34, 
 Wu Bo wrote: >>>> On 2023/11/11 12:49, Chao Yu wrote: >>>>> On [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wubo.oduw[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.161.42 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rCJLV-0004Yv-3X
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix fallocate failed under pinned
 block situation
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

T24gMjAyMy8xMi85IDE3OjQ2LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjMvMTEvMjggMjA6NTEs
IFd1IEJvIHdyb3RlOgo+Pgo+PiBPbiAyMDIzLzExLzI4IDE0OjIyLCBDaGFvIFl1IHdyb3RlOgo+
Pj4gT24gMjAyMy8xMS8xNyA3OjM0LCBXdSBCbyB3cm90ZToKPj4+PiBPbiAyMDIzLzExLzExIDEy
OjQ5LCBDaGFvIFl1IHdyb3RlOgo+Pj4+PiBPbiAyMDIzLzExLzggMjE6NDgsIFd1IEJvIHdyb3Rl
Ogo+Pj4+Pj4gT24gMjAyMy8xMS83IDIyOjM5LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4+IE9uIDIw
MjMvMTAvMzAgMTc6NDAsIFd1IEJvIHdyb3RlOgo+Pj4+Pj4+PiBJZiBHQyB2aWN0aW0gaGFzIHBp
bm5lZCBibG9jaywgaXQgY2FuJ3QgYmUgcmVjeWNsZWQuCj4+Pj4+Pj4+IEFuZCBpZiBHQyBpcyBm
b3JlZ3JvdW5kIHJ1bm5pbmcsIGFmdGVyIG1hbnkgZmFpbHVyZSB0cnksIHRoZSAKPj4+Pj4+Pj4g
cGlubmVkIGZpbGUKPj4+Pj4+Pj4gaXMgZXhwZWN0ZWQgdG8gYmUgY2xlYXIgcGluIGZsYWcuIFRv
IGVuYWJsZSB0aGUgc2VjdGlvbiBiZSAKPj4+Pj4+Pj4gcmVjeWNsZWQuCj4+Pj4+Pj4+Cj4+Pj4+
Pj4+IEJ1dCB3aGVuIGZhbGxvY2F0ZSB0cmlnZ2VyIEZHX0dDLCBHQyBjYW4gbmV2ZXIgcmVjeWNs
ZSB0aGUgcGlubmVkCj4+Pj4+Pj4+IHNlY3Rpb24uIEJlY2F1c2UgR0Mgd2lsbCBnbyB0byBzdG9w
IGJlZm9yZSB0aGUgZmFpbHVyZSB0cnkgbWVldCAKPj4+Pj4+Pj4gdGhlCj4+Pj4+Pj4+IHRocmVz
aG9sZDoKPj4+Pj4+Pj4gwqDCoMKgwqDCoGlmIChoYXNfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIHNl
Y19mcmVlZCwgMCkpIHsKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWdjX2NvbnRyb2wt
Pm5vX2JnX2djICYmCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0b3RhbF9zZWNf
ZnJlZWQgPCBnY19jb250cm9sLT5ucl9mcmVlX3NlY3MpCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBnb3RvIGdvX2djX21vcmU7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgZ290
byBzdG9wOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgfQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTbyB3aGVuIGZh
bGxvY2F0ZSB0cmlnZ2VyIEZHX0dDLCBhdCBsZWFzdCByZWN5Y2xlIG9uZS4KPj4+Pj4+Pgo+Pj4+
Pj4+IEhtbS4uLiBpdCBtYXkgYnJlYWsgcGluZmlsZSdzIHNlbWFudGljcyBhdCBsZWFzdCBvbiBv
bmUgcGlubmVkIAo+Pj4+Pj4+IGZpbGU/Cj4+Pj4+Pj4gSW4gdGhpcyBjYXNlLCBJIHByZWZlciB0
byBmYWlsIGZhbGxvY2F0ZSgpIHJhdGhlciB0aGFuIHVucGlubmluZyAKPj4+Pj4+PiBmaWxlLAo+
Pj4+Pj4+IGluIG9yZGVyIHRvIGF2b2lkIGxlYXZpbmcgaW52YWxpZCBMQkEgcmVmZXJlbmNlcyBv
ZiB1bnBpbm5lZCAKPj4+Pj4+PiBmaWxlIGhlbGQKPj4+Pj4+PiBieSB1c2Vyc3BhY2UuCj4+Pj4+
Pgo+Pj4+Pj4gQXMgZjJmcyBkZXNpZ25lZCBub3csIEZHX0dDIGlzIGFibGUgdG8gdW5waW4gdGhl
IHBpbm5lZCBmaWxlLgo+Pj4+Pj4KPj4+Pj4+IGZhbGxvY2F0ZSgpIHRyaWdnZXJlZCBGR19HQywg
YnV0IGNhbid0IHJlY3ljbGUgc3BhY2UuIEl0IGJyZWFrcyB0aGUKPj4+Pj4+IGRlc2lnbiBsb2dp
YyBvZiBGR19HQy4KPj4+Pj4KPj4+Pj4gWWVzLCBjb250cmFkaWN0b3JpbmVzcyBleGlzdHMuCj4+
Pj4+Cj4+Pj4+IElNTywgdW5waW4gZmlsZSBieSBHQyBsb29rcyBtb3JlIGRhbmdlcm91cywgaXQg
bWF5IGNhdXNlIHBvdGVudGlhbCAKPj4+Pj4gZGF0YQo+Pj4+PiBjb3JydXB0aW9uIHcvIGJlbG93
IGNhc2U6Cj4+Pj4+IDEuIGFwcCBwaW5zIGZpbGUgJiBob2xkcyBMQkFzIG9mIGRhdGEgYmxvY2tz
Lgo+Pj4+PiAyLiBHQyB1bnBpbnMgZmlsZSBhbmQgbWlncmF0ZXMgaXRzIGRhdGEgdG8gbmV3IExC
QXMuCj4+Pj4+IDMuIG90aGVyIGZpbGUgcmV1c2VzIHByZXZpb3VzIExCQXMuCj4+Pj4+IDQuIGFw
cCByZWFkL3dyaXRlIGRhdGEgdmlhIHByZXZpb3VzIExCQXMuCj4+Pj4+Cj4+Pj4+IFNvIEkgc3Vn
Z2VzdCB0byBub3JtYWxpemUgdXNlIG9mIHBpbmZpbGUgYW5kIGRvIG5vdCBhZGQgbW9yZSB1bnBp
biAKPj4+Pj4gY2FzZXMKPj4+Pj4gaW4gZmlsZXN5c3RlbSBpbm5lciBwcm9jZXNzZXMuCj4+Pj4+
Cj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBpc3N1ZSBpcyBoYXBwZW5lZCBpbiBBbmRyb2lkIE9UQSBzY2Vu
YXJpby4gZmFsbG9jYXRlKCkgYWx3YXlzCj4+Pj4+PiByZXR1cm4gZmFpbHVyZSBjYXVzZSBPVEEg
ZmFpbC4KPj4+Pj4KPj4+Pj4gQ2FuIHlvdSBwbGVhc2UgY2hlY2sgd2h5IG90aGVyIHBpbm5lZCBm
aWxlcyB3ZXJlIHNvIGZyYWdtZW50ZWQgCj4+Pj4+IHRoYXQgZjJmc19nYygpCj4+Pj4+IGNhbiBu
b3QgcmVjeWNsZSBvbmUgZnJlZSBzZWN0aW9uPwo+Pj4+Pgo+Pj4+IE5vdCBiZWNhdXNlIHBpbm5l
ZCBmaWxlcyB3ZXJlIGZyYWdtZW50ZWQsIGJ1dCBpZiB0aGUgR0MgdmljdGltIAo+Pj4+IHNlY3Rp
b24gaGFzIG9uZSBibG9jayBpcyBwaW5uZWQgd2lsbCBjYXVzZSB0aGlzIGlzc3VlLgo+Pj4+Cj4+
Pj4gSWYgdGhlIHNlY3Rpb24gZG9uJ3QgdW5waW4gdGhlIGJsb2NrLCBpdCBjYW4ndCBiZSByZWN5
Y2xlZC4gQnV0IAo+Pj4+IHRoZXJlIGlzIGhpZ2ggY2hhbmNlIHRoYXQgdGhlIHBpbm5lZCBzZWN0
aW9uIHdpbGwgYmUgY2hvc2VuIG5leHQgCj4+Pj4gdGltZSB1bmRlciBmMmZzIGN1cnJlbnQgdmlj
dGltIHNlbGVjdGlvbiBzdHJhdGVneS4KPj4+Pgo+Pj4+IFNvIGlmIHdlIHdhbnQgdG8gYXZvaWQg
dW5waW4gZmlsZXMsIEkgdGhpbmsgY2hhbmdlIHZpY3RpbSBzZWxlY3Rpb24gCj4+Pj4gdG8gY29u
c2lkZXJpbmcgcGlubmVkIGJsb2NrcyBjYW4gZml4IHRoaXMgaXNzdWUuCj4+Pgo+Pj4gT2gsIEkg
Z2V0IGl0Lgo+Pj4KPj4+IEhvdyBhYm91dCB0aGlzPwo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+PiBpbmRleCAzMjVkYWIwMWEyOWQuLjNmYjUy
ZGVjNWRmOCAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+PiArKysgYi9mcy9mMmZz
L2ZpbGUuYwo+Pj4gQEAgLTE3MzAsNyArMTczMCwxMCBAQCBuZXh0X2FsbG9jOgo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZG93bl93cml0ZSgmc2JpLT5nY19sb2NrKTsKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0X2luY19nY19jYWxsX2NvdW50KHNiaSwgRk9SRUdS
T1VORCk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gZjJmc19nYyhzYmksICZn
Y19jb250cm9sKTsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlcnIgJiYgZXJyICE9
IC1FTk9EQVRBKQo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVyciA9PSAt
RUFHQUlOKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2JhbGFuY2Vf
ZnMoc2JpLCB0cnVlKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKGVyciAm
JiBlcnIgIT0gLUVOT0RBVEEpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIG91dF9lcnI7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gRG8geW91IG1lYW4gdG8gY2Fs
bCBmMmZzX2JhbGFuY2VfZnMoKSB0byByZWN5Y2xlIG9uZSBzZWN0aW9uPwo+PiBCdXQgaW4gdGhp
cyBzaXR1YXRpb24sIGYyZnNfYmFsYW5jZV9mcygpIHdpbGwgcmV0dXJuIGF0IAo+PiBlbm91Z2gt
ZnJlZS1zZWN0aW9uIGNoZWNrOgo+PiDCoMKgwqDCoCBpZiAoaGFzX2Vub3VnaF9mcmVlX3NlY3Mo
c2JpLCAwLCAwKSkKPj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4KPiBBcyB5b3Ugc2FpZCwg
dGhlcmUgYXJlIGxvdHMgb2YgZnJlZSBzZWdtZW50cywgc28gSSBndWVzcyBpdCdzIGZpbmUgZm9y
Cj4gbGF0dGVyIDJtLWFsaWduZWQgYWxsb2NhdGlvbiwgYW5kIGZvciB0aGUgY2FzZSBudW1iZXIg
b2YgZnJlZSBzZWN0aW9uIGlzCj4gbG93ZXIgdGhhbiBmZ2djIHRocmVzaG9sZCwgd2UgY2FuIGNh
bGwgZjJmc19iYWxhbmNlX2ZzKCkgdG8gcmVjbGFpbSAKPiBlbm91Z2gKPiBmcmVlIHNlY3Rpb25z
Lgo+Cj4gVGhhbmtzLApZZXMsIHRoaXMgbWFrZSBzZW5zZS4gSSBkaWRuJ3Qgc2VlIGFsbG9jYXRp
b24gd2lsbCBjb250aW51ZSBhZnRlciAKZjJmc19iYWxhbmNlX2ZzKCkgcmV0dXJuLgo+Cj4+Pgo+
Pj4gSG93ZXZlciwgdGhlIGNvZGUgd29uJ3QgZml4IGNvbnRyYWRpY3RvcmluZXNzIGlzc3VlLCBi
ZWNhdXNlIHRoZSAKPj4+IHJvb3QgY2F1c2UKPj4+IGlzIHdlIGxlZnQgZnJhZ21lbnRlZCBwaW5u
ZWQgZGF0YSBpbiBmaWxlc3lzdGVtLCB3aGljaCBzaG91bGQgYmUgCj4+PiBhdm9pZGVkIGluCj4+
PiBHQy1yZWxpYW5jZSBMRlMgZmlsZXN5ZXRlbSBhcyBtdWNoIGFzIHBvc3NpYmxlLgo+Pj4KPj4+
IFRoYW5rcywKPj4+Cj4+Pj4KPj4+Pj4gVGhhbmtzLAo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IMKgIMKg
QW5kIHRoaXMgY29tbWl0IGNoYW5nZWQgcHJldmlvdXMgYmVoYXZpb3Igb2YgZmFsbG9jYXRlKCk6
Cj4+Pj4+Pgo+Pj4+Pj4gQ29tbWl0IDJlNDJiN2Y4MTdhYyAoImYyZnM6IHN0b3AgYWxsb2NhdGlu
ZyBwaW5uZWQgc2VjdGlvbnMgaWYgCj4+Pj4+PiBFQUdBSU4KPj4+Pj4+IGhhcHBlbnMiKQo+Pj4+
Pj4KPj4+Pj4+IEJlZm9yZSB0aGlzIGNvbW1pdCwgaWYgZmFsbG9jYXRlKCkgbWVldCB0aGlzIHNp
dHVhdGlvbiwgaXQgd2lsbCAKPj4+Pj4+IHRyaWdnZXIKPj4+Pj4+IEZHX0dDIHRvIHJlY3ljbGUg
cGlubmVkIHNwYWNlIGZpbmFsbHkuCj4+Pj4+Pgo+Pj4+Pj4gRkdfR0MgaXMgZXhwZWN0ZWQgdG8g
cmVjeWNsZSBwaW5uZWQgc3BhY2Ugd2hlbiB0aGVyZSBpcyBubyBtb3JlIGZyZWUKPj4+Pj4+IHNw
YWNlLsKgIEFuZCB0aGlzIGlzIHRoZSByaWdodCB0aW1lIHRvIGRvIGl0IHdoZW4gZmFsbG9jYXRl
KCkgbmVlZCAKPj4+Pj4+IGZyZWUKPj4+Pj4+IHNwYWNlLgo+Pj4+Pj4KPj4+Pj4+IEl0IGlzIHdl
aXJkIHdoZW4gZjJmcyBzaG93cyBlbm91Z2ggc3BhcmUgc3BhY2UgYnV0IGNhbid0IAo+Pj4+Pj4g
ZmFsbG9jYXRlKCkuIFNvCj4+Pj4+PiBJIHRoaW5rIGl0IHNob3VsZCBiZSBmaXhlZC4KPj4+Pj4+
Cj4+Pj4+Pj4KPj4+Pj4+PiBUaG91Z2h0cz8KPj4+Pj4+Pgo+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+
Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGlzIGlzc3VlIGNhbiBiZSByZXByb2R1Y2VkIGJ5IGZpbGxp
bmcgZjJmcyBzcGFjZSBhcyBmb2xsb3dpbmcgCj4+Pj4+Pj4+IGxheW91dC4KPj4+Pj4+Pj4gRXZl
cnkgc2VnbWVudCBoYXMgb25lIGJsb2NrIGlzIHBpbm5lZDoKPj4+Pj4+Pj4gKy0rLSstKy0rLSst
Ky0tLS0tKy0rCj4+Pj4+Pj4+IHwgfCB8cHwgfCB8IHwgLi4uIHwgfCBzZWdfbgo+Pj4+Pj4+PiAr
LSstKy0rLSstKy0rLS0tLS0rLSsKPj4+Pj4+Pj4gKy0rLSstKy0rLSstKy0tLS0tKy0rCj4+Pj4+
Pj4+IHwgfCB8cHwgfCB8IHwgLi4uIHwgfCBzZWdfbisxCj4+Pj4+Pj4+ICstKy0rLSstKy0rLSst
LS0tLSstKwo+Pj4+Pj4+PiAuLi4KPj4+Pj4+Pj4gKy0rLSstKy0rLSstKy0tLS0tKy0rCj4+Pj4+
Pj4+IHwgfCB8cHwgfCB8IHwgLi4uIHwgfCBzZWdfbitrCj4+Pj4+Pj4+ICstKy0rLSstKy0rLSst
LS0tLSstKwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBbmQgZm9sbG93aW5nIGFyZSBzdGVwcyB0byByZXBy
b2R1Y2UgdGhpcyBpc3N1ZToKPj4+Pj4+Pj4gZGQgaWY9L2Rldi96ZXJvIG9mPS4vZjJmc19waW4u
aW1nIGJzPTJNIGNvdW50PTEwMjQKPj4+Pj4+Pj4gbWtmcy5mMmZzIGYyZnNfcGluLmltZwo+Pj4+
Pj4+PiBta2RpciBmMmZzCj4+Pj4+Pj4+IG1vdW50IGYyZnNfcGluLmltZyAuL2YyZnMKPj4+Pj4+
Pj4gY2QgZjJmcwo+Pj4+Pj4+PiBkZCBpZj0vZGV2L3plcm8gb2Y9Li9sYXJnZV9wYWRkaW5nIGJz
PTFNIGNvdW50PTE3NjAKPj4+Pj4+Pj4gLi9waW5fZmlsbGluZy5zaAo+Pj4+Pj4+PiBybSBwYWRk
aW5nKgo+Pj4+Pj4+PiBzeW5jCj4+Pj4+Pj4+IHRvdWNoIGZhbGxvY2F0ZV80MG0KPj4+Pj4+Pj4g
ZjJmc19pbyBwaW5maWxlIHNldCBmYWxsb2NhdGVfNDBtCj4+Pj4+Pj4+IGZhbGxvY2F0ZSAtbCA0
MTk0MzA0MCBmYWxsb2NhdGVfNDBtCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGZhbGxvY2F0ZSBhbHdheXMg
ZmFpbCB3aXRoIEVBR0FJTiBldmVuIHRoZXJlIGhhcyBlbm91Z2ggZnJlZSAKPj4+Pj4+Pj4gc3Bh
Y2UuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICdwaW5fZmlsbGluZy5zaCcgaXM6Cj4+Pj4+Pj4+IGNvdW50
PTEKPj4+Pj4+Pj4gd2hpbGUgOgo+Pj4+Pj4+PiBkbwo+Pj4+Pj4+PiDCoMKgwqDCoMKgICMgZmls
bGluZyB0aGUgc2VnIHNwYWNlCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgZm9yIGkgaW4gezEuLjUxMX06
Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgZG8KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG5hbWU9
cGFkZGluZ18kY291bnQtJGkKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVjaG8gd3JpdGUg
JG5hbWUKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRkIGlmPS9kZXYvemVybyBvZj0uLyRu
YW1lIGJzPTRLIGNvdW50PTEgPiAvZGV2L251bGwgCj4+Pj4+Pj4+IDI+JjEKPj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIFsgJD8gLW5lIDAgXTsgdGhlbgo+Pj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4aXQgMAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgZmkKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBkb25lCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgc3luYwo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiDCoMKgwqDCoMKgICMgcGluIG9uZSBibG9jayBpbiBhIHNlZ21lbnQK
Pj4+Pj4+Pj4gwqDCoMKgwqDCoCBuYW1lPXBpbl9maWxlJGNvdW50Cj4+Pj4+Pj4+IMKgwqDCoMKg
wqAgZGQgaWY9L2Rldi96ZXJvIG9mPS4vJG5hbWUgYnM9NEsgY291bnQ9MSA+IC9kZXYvbnVsbCAy
PiYxCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgc3luYwo+Pj4+Pj4+PiDCoMKgwqDCoMKgIGYyZnNfaW8g
cGluZmlsZSBzZXQgJG5hbWUKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBjb3VudD0kKCgkY291bnQgKyAx
KSkKPj4+Pj4+Pj4gZG9uZQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBXdSBCbyA8
Ym8ud3VAdml2by5jb20+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiDCoMKgIGZzL2YyZnMvZmlsZS5j
IHwgMiArLQo+Pj4+Pj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMg
Yi9mcy9mMmZzL2ZpbGUuYwo+Pj4+Pj4+PiBpbmRleCBjYTU5MDQxMjliMTYuLmU4YTEzNjE2NTQz
ZiAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPj4+Pj4+Pj4gKysrIGIvZnMv
ZjJmcy9maWxlLmMKPj4+Pj4+Pj4gQEAgLTE2OTAsNyArMTY5MCw3IEBAIHN0YXRpYyBpbnQgZjJm
c19leHBhbmRfaW5vZGVfZGF0YShzdHJ1Y3QgCj4+Pj4+Pj4+IGlub2RlCj4+Pj4+Pj4+ICppbm9k
ZSwgbG9mZl90IG9mZnNldCwKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
aW5pdF9nY190eXBlID0gRkdfR0MsCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLnNob3VsZF9taWdyYXRlX2Jsb2NrcyA9IGZhbHNlLAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5lcnJfZ2Nfc2tpcHBlZCA9IHRydWUsCj4+Pj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5ucl9mcmVlX3NlY3MgPSAwIH07Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC5ucl9mcmVlX3NlY3MgPSAxIH07Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBw
Z29mZl90IHBnX3N0YXJ0LCBwZ19lbmQ7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBsb2ZmX3QgbmV3
X3NpemU7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBsb2ZmX3Qgb2ZmX2VuZDsKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

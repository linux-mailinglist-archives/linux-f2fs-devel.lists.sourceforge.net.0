Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B37B2CDE4F3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 04:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00j2rj+aVb0heRGPUQ+uaMXIW+MeFiWgGm+tI6Ri6x8=; b=kRQPy93M+GNTnDy9Vr3AzYfISr
	cyUJta8kNG4/w/hJwZ0pkCEhOA09ODUZSpVv1J43RHQjPVY0EF+QuIqpWWcNTJXfS/JE96MpJdwWJ
	rTPQV6uxCTtpspjGfgTxpWYDKmZ96kUlEfPOMDeY8PPjHP3v/a4QxpID4LOMcUkvUUu0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYysX-0001QV-Fz;
	Fri, 26 Dec 2025 03:52:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vYysV-0001QF-H8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 03:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+xwktlok0hLfOKDsLl0HLpJhibAy2h2+gO6IoSSqREo=; b=IZqLNJ5cZI7xHc+b8exh0O0xUG
 tfqwWkd3JrzWzrpjrQKUxBSfD5FOELiNIuoKP9G4qAmyMFLebvZop3WP6SBhFnp2vpL+iQxhohhYD
 9kDj8AfOgaMLfNl+hweeapuIIFgnSCzNE8QHUR0mngrugRmefikJsBgUGtgvZMzeX6PE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+xwktlok0hLfOKDsLl0HLpJhibAy2h2+gO6IoSSqREo=; b=UotD/C56c8wD2VdeNiZk3uagV8
 wyVCFbpOOffRYk6Oe/HHJJRlhYDzOBqQRpzptbupuR1xhR64HA7ELXCZcwaUT7CptVq2KrlMDx7J2
 ZL03o8vNVwrCUiZnb+03KbCdXAmwfVB6i5ML7YTOmnMezmC93WKh+Po87xaDsUZbKujY=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vYysV-0007iv-Kx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 03:52:36 +0000
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7d26a7e5639so7855085b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Dec 2025 19:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766721150; x=1767325950; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+xwktlok0hLfOKDsLl0HLpJhibAy2h2+gO6IoSSqREo=;
 b=PdCo8SqAa9R3JzXU3YQX7P0Dgss5L6jcdXBtgYtOZXgdcTxCe74qVrrVikW3n9Y6yz
 9ASfBiH/W7xnFuHJPeuRpnKu1qO2sklRd9++2Hz31IjqpRSXySX8FyCc7Rc16rg8MGTI
 DSRON2A0zLyjLcr6yZS5wyAhKHvzJ6DDYug3bDfMZhcaIz8C8kjzJJ5h2uZJzPhZZ2np
 Yu8KcMgzNm599gd6wUWHeVG9Vaf6VX6PGZeAKPEXkZAecuBDuA34nCm5W8VZsr01UrWX
 RctiNIkOJZzgmDLyqZLq+Q/Q/qxGZB8nsq3wGfUxIREq7HithceayX80dCJVGGeoSWro
 IqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766721150; x=1767325950;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+xwktlok0hLfOKDsLl0HLpJhibAy2h2+gO6IoSSqREo=;
 b=AQMrDqtOh4Xxhv3uE5aHyHw6QuW2oWL5QvaTvDNq0WT//XKUNpYpsHb1HK2wWsMGBl
 iIEGze40iqTPWKLAasEz4Kk/q3lzimVQRMTmqhlKwvUvSJJyMUNMhixm4THQbqbqVcvu
 T0oxnDXVyibNUKUIH27NjTdgLDula7/uQdD+iet/utSAgfXEjAYkJYxoGUk93c15OeaZ
 FXGzfyUUl/XMI6xkdyoCQ+xsv8GZ/8/SxI8yIW9hfYvN60VkkX+zbaChCFZUCN7AYReY
 aW1eBy4/bqrNHKtBOjfuQbT2BBssbr76A/Wjsc+yuMpSFl/v7uzdrvj9Zh81KnfT/DQd
 N7Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQdcikpDX3G0WNpZ3bKrioN24BaWww39v9PErf2Pkdkd5Dcgl6YYUeddC1pjiJj6ZfyChtH2xFJTaRntdCcL0O@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw3FSo2OhA4PIJqrbUSZ2FQshteM0IiTiH9n/upC4YY67SCpZvi
 hiFVvR9bcX0QiMw/QpXLuMvtB1JXpMJd0Veih8004ghsEkxLVDZEoVI1
X-Gm-Gg: AY/fxX5cbuRCQ8CqAm2YjW8oYIj74aUBat56J2wrbQpOcnh/HdEA5Ol7qLZd2Vy8M4O
 3caaY9xsTDZA4iSh+VR316NWXdrc9Yg+Xn+57nkiJQGRU/tui4/ctWY8nz8JLyeUtz29J/k6zxC
 Of0RcqgBEbyDqwsWjqBaBcKYg0kV0BwyIdtInnvq+MY1BdtT92Bkh2Z1qU6zVmFHxJwvz9lSdtC
 OGFZEe4OTl5qQJMjjDNUGYCKGnDjQ4sDHyOSc3lB09/Vo//JcEMmm4n5MPuZ6Ygo6QsqU0lkWve
 4/gcu+60opa3jg6xS9ELNRdnuMI6yU+wjjiKjCIhFPWZIU0gve1DCPxVn13UWfuivRBSXlcvT+R
 86sVV4FyKlFK8F/2Ui9VLL3WWlNkmRJ9ErYJXu0sOGAReHzqwuCESLS+2WaXuSGfnlko8s4oCuD
 tUDWO1xXj9KmUavSsu7fMK405klZ7Z09hTHdZ2v0Dm
X-Google-Smtp-Source: AGHT+IEyeAbgWT9dexh/JVErKpY9w7dXk+YHnXnvG1jeBGCw4X8M00gQNEk0E4xnZGwrMM2/qK/o7g==
X-Received: by 2002:a05:6a00:6c9f:b0:7f6:37e5:48d2 with SMTP id
 d2e1a72fcca58-7ff648ee1ffmr20266851b3a.25.1766721149868; 
 Thu, 25 Dec 2025 19:52:29 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8086dd33daesm4150619b3a.1.2025.12.25.19.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Dec 2025 19:52:29 -0800 (PST)
Message-ID: <73a0bd40-385f-4112-93c6-995d98707e2c@gmail.com>
Date: Fri, 26 Dec 2025 11:52:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Yunlei He <heyunlei1988@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251107062907.384287-1-heyunlei1988@gmail.com>
 <268cf104-6f77-419c-931e-c5cd82c3a921@kernel.org>
 <047b0d23-102e-41ce-b8b8-c7cb8ac31b21@gmail.com>
 <128fd300-d2d1-4169-a86f-a0babb47101b@kernel.org>
 <d6557e0a-a433-4dd1-bf02-d74cc6998592@gmail.com>
 <67e83a0a-74d3-43cc-902a-28172cb33149@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <67e83a0a-74d3-43cc-902a-28172cb33149@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/26/25 11:07, Chao Yu via Linux-f2fs-devel wrote: > On
 12/23/2025 8:02 PM, Yongpeng Yang wrote: >> >> On 11/10/25 17:32, Chao Yu
 via Linux-f2fs-devel wrote: >>> On 11/10/25 17:20, Yongpeng Yang w [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vYysV-0007iv-Kx
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop non uptodata page during GC
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjYvMjUgMTE6MDcsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMTIvMjMvMjAyNSA4OjAyIFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pgo+PiBPbiAxMS8x
MC8yNSAxNzozMiwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+IE9uIDEx
LzEwLzI1IDE3OjIwLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+IE9uIDExLzgvMjUgMTE6MTEs
IENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Pj4+IFl1bmxlaSwKPj4+Pj4K
Pj4+Pj4gT24gMjAyNS8xMS83IDE0OjI5LCBZdW5sZWkgSGUgd3JvdGU6Cj4+Pj4+PiBGcm9tOiBZ
dW5sZWkgSGUgPGhleXVubGVpQHhpYW9taS5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gR0MgbW92ZSBmYmUg
ZGF0YSBibG9jayB3aWxsIGFkZCBzb21lIG5vbiB1cHRvZGF0ZSBwYWdlLCB3ZSdkCj4+Pj4+PiBi
ZXR0ZXIgcmVsZWFzZSBpdCBhdCB0aGUgZW5kLgo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIGp1c3QgZm9y
IHNhdmluZyBtZW1vcnksIHJpZ2h0Pwo+Pj4+Pgo+Pj4+Cj4+Pj4gWWVzLCBtb3ZlX2RhdGFfYmxv
Y2soKSBkb2VzbuKAmXQgcmVhZCBhbnkgZGF0YSB0byBmb2xpbywgYW5kIHRoZSBHQwo+Pj4+IHVz
dWFsbHkgc2VsZWN0cyBjb2xkIGRhdGEuIFRoZXJlZm9yZSwgdGhpcyBmb2xpbyBpcyB0eXBpY2Fs
bHkgbm90Cj4+Pj4gdXB0b2RhdGUsIGFuZCB0aGVyZeKAmXMgbm8gbmVlZCBmb3IgaXQgdG8gb2Nj
dXB5IHRoZSBwYWdlIGNhY2hlLgo+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWXVu
bGVpIEhlIDxoZXl1bmxlaUB4aWFvbWkuY29tPgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3Bl
bmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+IMKgwqAg
ZnMvZjJmcy9nYy5jIHwgNSArKysrKwo+Pj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2Yy
ZnMvZ2MuYwo+Pj4+Pj4gaW5kZXggOGFiZjUyMTUzMGZmLi4wOWI2NWU2ZWE4NTMgMTAwNjQ0Cj4+
Pj4+PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+Pj4+Pj4g
QEAgLTEzMTUsNiArMTMxNSw3IEBAIHN0YXRpYyBpbnQgbW92ZV9kYXRhX2Jsb2NrKHN0cnVjdCBp
bm9kZQo+Pj4+Pj4gKmlub2RlLCBibG9ja190IGJpZHgsCj4+Pj4+PiDCoMKgwqDCoMKgwqAgc3Ry
dWN0IG5vZGVfaW5mbyBuaTsKPj4+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZm9saW8gKmZvbGlv
LCAqbWZvbGlvOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgIGJsb2NrX3QgbmV3YWRkcjsKPj4+Pj4+ICvC
oMKgwqAgYm9vbCBuZWVkX2ludmFsaWRhdGUgPSB0cnVlOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgIGlu
dCBlcnIgPSAwOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgIGJvb2wgbGZzX21vZGUgPSBmMmZzX2xmc19t
b2RlKGZpby5zYmkpOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgIGludCB0eXBlID0gZmlvLnNiaS0+YW0u
YXRnY19lbmFibGVkICYmIChnY190eXBlID09IEJHX0dDKSAmJgo+Pj4+Pj4gQEAgLTE0NTAsNyAr
MTQ1MSwxMSBAQCBzdGF0aWMgaW50IG1vdmVfZGF0YV9ibG9jayhzdHJ1Y3QgaW5vZGUKPj4+Pj4+
ICppbm9kZSwgYmxvY2tfdCBiaWR4LAo+Pj4+Pj4gwqDCoCBwdXRfb3V0Ogo+Pj4+Pj4gwqDCoMKg
wqDCoMKgIGYyZnNfcHV0X2Rub2RlKCZkbik7Cj4+Pj4+PiDCoMKgIG91dDoKPj4+Pj4+ICvCoMKg
wqAgaWYgKGZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8pKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IG5lZWRfaW52YWxpZGF0ZSA9IGZhbHNlOwo+Pj4+Pgo+Pj4+PiBIb3cgYWJvdXQgZHJvcHBpbmcg
c3VjaCBmb2xpbyB1bmRlciBpdHMgbG9jaz8KPj4+Pj4KPj4+Pj4gaWYgKCFmb2xpb190ZXN0X3Vw
dG9kYXRlKCkpCj4+Pj4+IMKgwqDCoMKgwqDCoHRydW5jYXRlX2lub2RlX3BhcnRpYWxfZm9saW8o
KQo+Pj4+Pgo+Pj4+Cj4+Pj4gdHJ1bmNhdGVfaW5vZGVfcGFydGlhbF9mb2xpbygpIGlzIG1vcmUg
ZWZmaWNpZW50IHNpbmNlIGl0IGF2b2lkcwo+Pj4+IGxvb2tpbmcKPj4+PiB1cCB0aGUgZm9saW8g
YWdhaW4sIGJ1dCBpdOKAmXMgZGVjbGFyZWQgaW4gbW0vaW50ZXJuYWwuaCwgc28gaXQgY2Fubm90
IGJlCj4+Pj4gY2FsbGVkIGRpcmVjdGx5Lgo+Pj4KPj4+IFllYWgsIG9yIGdlbmVyaWNfZXJyb3Jf
cmVtb3ZlX2ZvbGlvKCksIG5vdCBzdXJlLgo+Pj4KPj4+IEkganVzdCB0YWtlIGEgbG9vayB0byBj
aGVjayB3aGV0aGVyIHRoZXJlIGlzIGEgYmV0dGVyIGFsdGVybmF0aXZlCj4+PiBzY2hlbWUuCj4+
Cj4+IEhvdyBhYm91dCB0aGUgZm9sbG93aW5nIG1vZGlmaWNhdGlvbj8gVGhlIGZvbGlvIGlzIG1h
cmtlZCB3aXRoCj4+IFBHX2Ryb3BiZWhpbmQgdXNpbmcgX19mb2xpb19zZXRfZHJvcGJlaGluZCgp
LCBhbmQgaXMgc3Vic2VxdWVudGx5Cj4+IHJlbW92ZWQgZnJvbSB0aGUgcGFnZSBjYWNoZSB0aHJv
dWdoIGZvbGlvX2VuZF9kcm9wYmVoaW5kKCkuCj4+Cj4+IFRoYW5rcywKPj4gWW9uZ3BlbmcKPj4K
Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+PiBAQCAtMTMyNiw2
ICsxMzI2LDcgQEAgc3RhdGljIGludCBtb3ZlX2RhdGFfYmxvY2soc3RydWN0IGlub2RlICppbm9k
ZSwKPj4gYmxvY2tfdCBiaWR4LAo+PiDCoMKgwqDCoMKgwqDCoMKgIGZvbGlvID0gZjJmc19ncmFi
X2NhY2hlX2ZvbGlvKG1hcHBpbmcsIGJpZHgsIGZhbHNlKTsKPj4gwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoSVNfRVJSKGZvbGlvKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIFBUUl9FUlIoZm9saW8pOwo+PiArwqDCoMKgwqDCoMKgIF9fZm9saW9fc2V0X2Ryb3BiZWhp
bmQoZm9saW8pOwo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgIGlmICghY2hlY2tfdmFsaWRfbWFwKEYy
RlNfSV9TQihpbm9kZSksIHNlZ25vLCBvZmYpKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGVyciA9IC1FTk9FTlQ7Cj4+IEBAIC0xNDUzLDcgKzE0NTQsMTAgQEAgc3RhdGlj
IGludCBtb3ZlX2RhdGFfYmxvY2soc3RydWN0IGlub2RlICppbm9kZSwKPj4gYmxvY2tfdCBiaWR4
LAo+PiDCoCBwdXRfb3V0Ogo+PiDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfcHV0X2Rub2RlKCZkbik7
Cj4+IMKgIG91dDoKPj4gLcKgwqDCoMKgwqDCoCBmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7
Cj4+ICvCoMKgwqDCoMKgwqAgZm9saW9fdW5sb2NrKGZvbGlvKTsKPj4gK8KgwqDCoMKgwqDCoCBm
b2xpb19lbmRfZHJvcGJlaGluZChmb2xpbyk7Cj4+ICvCoMKgwqDCoMKgwqAgZm9saW9fcHV0KGZv
bGlvKTsKPiAKPiBNYXliZToKPiAKPiBvdXQ6Cj4gwqDCoMKgwqBpZiAoIWZvbGlvX3Rlc3RfdXB0
b2RhdGUpCj4gwqDCoMKgwqDCoMKgwqAgZm9saW9fc2V0X2Ryb3BiZWhpbmQKPiDCoMKgwqDCoGZv
bGlvX3VubG9jawo+IMKgwqDCoMKgZm9saW9fZW5kX2Ryb3BiZWhpbmQKPiDCoMKgwqDCoGZvbGlv
X3Rlc3RfY2xlYXJfZHJvcGJlaGluZCAvLyBtYWtlIHN1cmUgdG8gY2xlYXIgdGhlIGZsYWcKCk9o
LCBJIG1pc3MgdGhpcywgZm9saW9fZW5kX2Ryb3BiZWhpbmQtPmZvbGlvX3RyeWxvY2sgbWF5IGZh
aWwuIEknbGwgZml4CnRoaXMgYW5kIHNlbmQgdjIgcGF0Y2guCgpUaGFua3MKWW9uZ3BlbmcsCgo+
IMKgwqDCoMKgZm9saW9fcHV0Cj4gCj4gVGhhbmtzLAo+IAo+PiDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBlcnI7Cj4+IMKgIH0KPj4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4+Cj4+Pj4gWW9uZ3Bl
bmcsCj4+Pj4KPj4+Pj4+IMKgwqDCoMKgwqDCoCBmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7
Cj4+Pj4+PiArwqDCoMKgIGlmIChuZWVkX2ludmFsaWRhdGUpCj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgaW52YWxpZGF0ZV9tYXBwaW5nX3BhZ2VzKG1hcHBpbmcsIGJpZHgsIGJpZHgpOwo+Pj4+Pj4g
wqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+Pj4+PiDCoMKgIH0KPj4+Pj4KPj4+Pj4KPj4+Pj4K
Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+
Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4gTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pj4+Cj4+Pgo+Pj4KPj4+Cj4+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCj4+Cj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

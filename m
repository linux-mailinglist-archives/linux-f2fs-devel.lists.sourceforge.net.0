Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E2C4598B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 10:20:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4z8xmMNYacKkrr/ARURu3Upmo2yPXhcYIalkH3keT8=; b=PuEo0+uYUzR/o/wRqCvtxFl8Zn
	HnepoMZC6dvHP7XBosSl8/Os8y63xrdJlA5ynEJO8qmfw7NVvEMq/EUIyFigUdb9rEEz3xcR1Flnx
	FqSJb+HMAAqghZxpHsD0fSZIYnRwc6Hwcsjfmole/r7aR7iY4sWn0aLc62anCsWQg88Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIO4f-0004JC-Ij;
	Mon, 10 Nov 2025 09:20:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vIO4e-0004J0-FA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2IKMwuGv5xolVikqqkKsM6CNR0kT/ebKOXMVfbHx3s=; b=kjPw8T1wqDt8YXKHvzp0osL2Qd
 DlZe0TXwYYUxx6wyrZuOjmr8FqUyg1pObzylArzNLalOO6pTMh21LZXwSA6E7klA0mljVxGbaH/iR
 X1PtSgjIoqZ7DoVAWspn+FplxAX6PAcVlrVLR9lyUghCC0b7X4pT7FFoz1WFeaq0Jn1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l2IKMwuGv5xolVikqqkKsM6CNR0kT/ebKOXMVfbHx3s=; b=kfUqMDcTFl2hjvd/a7GyA48uHC
 p+2mUYtNFqoQbVPjKz/o+q7w9wSuvJiD2vgS/JKZ37QQ909Ds/Ogn5jj5FXc6Ixmkq8QjioqQO4zF
 PmksdGHLixgoFIWY4FY6aJT2LBQo99iPWYkwiBeeK5PvHRRAcfIJ0UgvCwkVBLmEtRuA=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vIO4e-0004Lc-MT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:20:33 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-34374226699so1138419a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Nov 2025 01:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762766422; x=1763371222; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l2IKMwuGv5xolVikqqkKsM6CNR0kT/ebKOXMVfbHx3s=;
 b=fRdOEmr5CfyGbd6YXlnocFZGLRbG8mVou7fk9Fh/wg0TPzoKv3h+LmGwn0EFdD6nuM
 SCTWrTIF2q8JMeYZoTJpf+dR6c4/0/Vjs7SNo2lq+STc1WfLNs4CpHzEd7gbRIPzxc6f
 ynPtliAK7cTqtM7qFASgGNV1Hr96nnS30jTt8pilVwMOJT0mEia0QQsp2YXg7526hggf
 TjA/Nz2QjDCgFd/w4t70dLVDBesZhcEo1Lvc/+wvOOtikARFkMnMbXYS1GS9Wn0uUdbm
 XNMClQYmkM9MqxeBM5uSqH+cR55hUnuF6Tz5t/b34AktQLr/pzoEUUBPaUMd4echbdjT
 SBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762766422; x=1763371222;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l2IKMwuGv5xolVikqqkKsM6CNR0kT/ebKOXMVfbHx3s=;
 b=BLvvND57OdVsVn34h4oM70UBbUblZEyYI+xRAjW5WUGXrwMtcJrHTWTgGhORc8Qn4J
 nIZpyGgcOk/sev+akN3eDKdm/10Dg9Kv93QCislOk1sRq9REEFz98T0/8rmxoBn4aXb9
 oc+d220E6R6EF5CLr6S2e/OPV+dWYCfzajEYIZsDSchOWPf7Ca71BHqjnyjep1BnXmqJ
 LU2OUg6/TH9aq1BL5/HjAP1IsudfV7i0ykAjBsHCKeH1BL/PnnlNdez8jSkr3i/PftqL
 di/B4uDrY86WdPoJobAs+/OzDO95+HdC87DolnQwEOoeP5L+TOk4RBre79sfZ3NFi4iu
 nJgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkGOBusBBlgs93hxj2/J9xt0NAb48tZaWrg9iQYxWS2Rc5z2/9eaRtghUsxEfia4eqaYBaP5RaOWm9RtWNSLFn@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywx7y0eUzEPnjnlvPq2ViU4ik43T/mF8hbu88PCMhx4iz61E1rq
 qZdwX41ArSekLK6GzQ2mi8iz/Nn3mqaHRupkWALJWmuVE1ugsMfJ7T3a
X-Gm-Gg: ASbGncsLiDhCMwV8nvXlkPrtKbtqqE0pWazoVOBC9W1zHDtzgocGULQIHGgu6NTAGWJ
 Iaag1acCV/Yeh57QmvKRTfnB9y/DqEIvxN0W6x9wyhfTWTlaXnxh1Gc0jqdn/qBRr81rdhGpBMR
 yzUlijTt3sMu3jbaplgG586MUUNATRJqBRiXsEBFmPPh5NfVSr8fKTILPDG06+/35vjV9UnB/Xj
 A0/GSTHfpMM9P3OjSV1/MxYEBhdOXZcAnsfRXAScgYwd/RaoXRMLSrcF5WNiJunOCtXanV+VgCA
 sZOyQMSn22lZVK16A+h2bl24znNu1zZVqzqw11QhzGj6cqPWjcUJe8mdPmHfVXqmx3HQvUk9n06
 frFoKe8mGqU27doepWpKOFEAN5dAvEsXJgn6XVR38y6QxPiKmqgTj4VAO1GpW00/uAGW1vtsUYR
 MkGRSItfysJmqOIk7qZGOwfoQ=
X-Google-Smtp-Source: AGHT+IFbCD4kj8JAL/GLQylV4t2fQX7zzZOQlQzTYQe754s9DanbPNBa32ieslCRlWxGo8WdPRmjMw==
X-Received: by 2002:a17:90b:2d48:b0:341:a9e7:e5f9 with SMTP id
 98e67ed59e1d1-3436ca9b051mr9758709a91.0.1762766421913; 
 Mon, 10 Nov 2025 01:20:21 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34375e7537asm3489984a91.4.2025.11.10.01.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 01:20:21 -0800 (PST)
Message-ID: <047b0d23-102e-41ce-b8b8-c7cb8ac31b21@gmail.com>
Date: Mon, 10 Nov 2025 17:20:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yunlei He <heyunlei1988@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251107062907.384287-1-heyunlei1988@gmail.com>
 <268cf104-6f77-419c-931e-c5cd82c3a921@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <268cf104-6f77-419c-931e-c5cd82c3a921@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/8/25 11:11,
 Chao Yu via Linux-f2fs-devel wrote: > Yunlei, 
 > > On 2025/11/7 14:29, Yunlei He wrote: >> From: Yunlei He >> >> GC move
 fbe data block will add some non uptodate page, we'd >> bett [...] 
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
 [209.85.216.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vIO4e-0004Lc-MT
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvOC8yNSAxMToxMSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPiBZ
dW5sZWksCj4gCj4gT24gMjAyNS8xMS83IDE0OjI5LCBZdW5sZWkgSGUgd3JvdGU6Cj4+IEZyb206
IFl1bmxlaSBIZSA8aGV5dW5sZWlAeGlhb21pLmNvbT4KPj4KPj4gR0MgbW92ZSBmYmUgZGF0YSBi
bG9jayB3aWxsIGFkZCBzb21lIG5vbiB1cHRvZGF0ZSBwYWdlLCB3ZSdkCj4+IGJldHRlciByZWxl
YXNlIGl0IGF0IHRoZSBlbmQuCj4gCj4gVGhpcyBpcyBqdXN0IGZvciBzYXZpbmcgbWVtb3J5LCBy
aWdodD8KPiAKClllcywgbW92ZV9kYXRhX2Jsb2NrKCkgZG9lc27igJl0IHJlYWQgYW55IGRhdGEg
dG8gZm9saW8sIGFuZCB0aGUgR0MKdXN1YWxseSBzZWxlY3RzIGNvbGQgZGF0YS4gVGhlcmVmb3Jl
LCB0aGlzIGZvbGlvIGlzIHR5cGljYWxseSBub3QKdXB0b2RhdGUsIGFuZCB0aGVyZeKAmXMgbm8g
bmVlZCBmb3IgaXQgdG8gb2NjdXB5IHRoZSBwYWdlIGNhY2hlLgoKPj4KPj4gU2lnbmVkLW9mZi1i
eTogWXVubGVpIEhlIDxoZXl1bmxlaUB4aWFvbWkuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBZb25n
cGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4gLS0tCj4+IMKgIGZzL2YyZnMv
Z2MuYyB8IDUgKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4+IGluZGV4IDhhYmY1
MjE1MzBmZi4uMDliNjVlNmVhODUzIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4gKysr
IGIvZnMvZjJmcy9nYy5jCj4+IEBAIC0xMzE1LDYgKzEzMTUsNyBAQCBzdGF0aWMgaW50IG1vdmVf
ZGF0YV9ibG9jayhzdHJ1Y3QgaW5vZGUgKmlub2RlLCAKPj4gYmxvY2tfdCBiaWR4LAo+PiDCoMKg
wqDCoMKgIHN0cnVjdCBub2RlX2luZm8gbmk7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGZvbGlvICpm
b2xpbywgKm1mb2xpbzsKPj4gwqDCoMKgwqDCoCBibG9ja190IG5ld2FkZHI7Cj4+ICvCoMKgwqAg
Ym9vbCBuZWVkX2ludmFsaWRhdGUgPSB0cnVlOwo+PiDCoMKgwqDCoMKgIGludCBlcnIgPSAwOwo+
PiDCoMKgwqDCoMKgIGJvb2wgbGZzX21vZGUgPSBmMmZzX2xmc19tb2RlKGZpby5zYmkpOwo+PiDC
oMKgwqDCoMKgIGludCB0eXBlID0gZmlvLnNiaS0+YW0uYXRnY19lbmFibGVkICYmIChnY190eXBl
ID09IEJHX0dDKSAmJgo+PiBAQCAtMTQ1MCw3ICsxNDUxLDExIEBAIHN0YXRpYyBpbnQgbW92ZV9k
YXRhX2Jsb2NrKHN0cnVjdCBpbm9kZSAqaW5vZGUsIAo+PiBibG9ja190IGJpZHgsCj4+IMKgIHB1
dF9vdXQ6Cj4+IMKgwqDCoMKgwqAgZjJmc19wdXRfZG5vZGUoJmRuKTsKPj4gwqAgb3V0Ogo+PiAr
wqDCoMKgIGlmIChmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSkKPj4gK8KgwqDCoMKgwqDCoMKg
IG5lZWRfaW52YWxpZGF0ZSA9IGZhbHNlOwo+IAo+IEhvdyBhYm91dCBkcm9wcGluZyBzdWNoIGZv
bGlvIHVuZGVyIGl0cyBsb2NrPwo+IAo+IGlmICghZm9saW9fdGVzdF91cHRvZGF0ZSgpKQo+ICDC
oMKgwqDCoHRydW5jYXRlX2lub2RlX3BhcnRpYWxfZm9saW8oKQo+IAoKdHJ1bmNhdGVfaW5vZGVf
cGFydGlhbF9mb2xpbygpIGlzIG1vcmUgZWZmaWNpZW50IHNpbmNlIGl0IGF2b2lkcyBsb29raW5n
CnVwIHRoZSBmb2xpbyBhZ2FpbiwgYnV0IGl04oCZcyBkZWNsYXJlZCBpbiBtbS9pbnRlcm5hbC5o
LCBzbyBpdCBjYW5ub3QgYmUKY2FsbGVkIGRpcmVjdGx5LgoKWW9uZ3BlbmcsCgo+PiDCoMKgwqDC
oMKgIGYyZnNfZm9saW9fcHV0KGZvbGlvLCB0cnVlKTsKPj4gK8KgwqDCoCBpZiAobmVlZF9pbnZh
bGlkYXRlKQo+PiArwqDCoMKgwqDCoMKgwqAgaW52YWxpZGF0ZV9tYXBwaW5nX3BhZ2VzKG1hcHBp
bmcsIGJpZHgsIGJpZHgpOwo+PiDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+IMKgIH0KPiAKPiAK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

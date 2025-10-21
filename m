Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF1DBF482F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 05:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/cfvRBY5fhc1KLKZL4XKf3/mhKdF/n6RBK7G2DSMBc=; b=TTT6Ba7UrwXKywbAvC+ao5NwEl
	FxlwHfDKGFh5F05qEQ/tcqrNTedfh+iyPcRE3k8Zv9Ma2iHmHL7YdvxcKfjlrjCo63sxf16uknk4R
	V2urxT4mbzbqExnNwACxjy0SQy/QItsZB3SwLG3ye9v2q1N3W3c9Du6QKzG0d1N416lM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB38O-0006JA-DI;
	Tue, 21 Oct 2025 03:34:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jeuk20.kim@gmail.com>) id 1vB38N-0006J4-05
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 03:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xAA3wXm7UQ3efK1YyKsSdURqRAiMhAkMHEwnZrP82qs=; b=Klyd8vmP9gWTRp0AWU+V3f62W7
 I7buDKhY/BfIw60s7xD+3XNkjTEGaKSKtR/wiYn2UzQA9hCNypGQPUB+sqVbHdLd1Q9NEXSmiYsuI
 5FRgjaAnwH9VrS3+DFBmgbcAeKYxzIadLo9dSyPFoq1soRYHsJhxMUPzZ3XucK2j7rxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xAA3wXm7UQ3efK1YyKsSdURqRAiMhAkMHEwnZrP82qs=; b=iYQX3I+x5O+MkKctcxGiPKWMyj
 08iuhSIEXEDNhsxdvK4MNHkjo+ZD0KLIChRruLcyLD6Tigt3VPBdaPLhUNUMM+W04sWJwSZMcI0iE
 evY/909hO6PfrWatCpX7X73o0ouqmVHlxmbDwyIEvq4eYnj/BegVXCnOCoUY4PDqgRW4=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vB38M-0001oC-Gd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 03:34:02 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7930132f59aso6836085b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Oct 2025 20:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761017637; x=1761622437; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xAA3wXm7UQ3efK1YyKsSdURqRAiMhAkMHEwnZrP82qs=;
 b=TXyDpHvcQnmkTym7OiJ8XGpdDS2S1rsIwkSlfNNqQyg7xSAdO3PbQSIZEZBrWoO2eg
 bGTcLMD6Okr1P+yL/ZWHI0Oy1ssDy2IIMCo02xaOHQImTrKypydCqqqJ3fDq/h4DaZdv
 bLlg3BqF1ADOClDxppOoEtXRn1kpeimZIxIV5s9amGt6OAkExUk8MwswrXLSrtjWlvmO
 j6T79N9pI72eg2VhKUpgVYlJR6wio8U6L9Oelrkl8KlEDnljFs0vVTb194bFLZNDqqLA
 k79fM0avuBhjQt0UYA5+MRyw40quEhnwA+RKAtUfMw+I44wzg1lOj140s4+qweg3lG3X
 zWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761017637; x=1761622437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xAA3wXm7UQ3efK1YyKsSdURqRAiMhAkMHEwnZrP82qs=;
 b=VIVnKJV0z0U93aPX0NbD9vQY054qYEa+a2FkRb9O3Tr+O8XSW9WGxtcYvMGOe2jOKa
 +dwm98drBY6ttTXaBJON7OMY0YYCp+TUnBPh77XFfzhK3ieozmHNMfqMIpR+LBWtu+0z
 iqmFSmVsIEFqEepxwZshrjfePrkDtLaWNcAcyycWdC1xARLmVDA79XgFZWcuvebIq+bn
 lmhBzngaYbu5QBP7qKkktlkVwpRQN+pV1jptR2caOSBGfx8asj15wB9Ccf83dL9IKUwn
 aWNFunLd7DNhlJtIP2qmCHrZOrlVQSoD64sl8mjuIBXXZR+Skf2MLJsS1FKeIrzxbTGs
 4fIQ==
X-Gm-Message-State: AOJu0YxCTFT7+2gEKQkLdbXPetpT2j/ksXBfBBVO/6XsEApAtZefko9h
 Sprw+7ka++N/BrCefNxSh6MsLy15IZYoBOFGzmLpAxjTkCb9yg6eI1fQ
X-Gm-Gg: ASbGncuppA7jgw0qSSkAO8GBAAVlB8meCx9WnbD7qwssAqMA+0lHd7vGk0SvHSo/z1s
 +RQ4AyydRjT8f1nWt9r9L51hP+JPDhNFxpPuNeYWYzU+pA6v8FcqOj/awwxTG7qnb57bVwvfvqZ
 PPqtNyRsn/JyZHXGj91fSrqb3tr7/YHaqpyqRQP0t3hi1RpT0zRmPP6MutNmKxnH6AfRjhJUU5b
 l5XOws+ROLDsBYSjTZsON/KF+ugT+31pi6XMHtx+VOa8v/qHl4LDAXuDM/QZAGkQ7Tqcmv9fDFK
 GQy9e2AiWLYVWxk0zlJS8emAbrddnTcFdEBBEWrVOlAM6sAAREAfkg/y4duKnVjhlLSFuZZd8+y
 3wQnV1VEkqWuoPm03DOXKNikWVMfLmX/GoFDrTA/XX5wkcRYRTsI0hgevMojVl2ZJNioXp3zoNf
 JaUoEm248yjRb2UMmISg==
X-Google-Smtp-Source: AGHT+IHaFDC1v0aDUzsL/TKgVez8i+34XppKVnxYdYV5DGHdTcMHliSfGRpy1KWJsrrID/P9T+elOQ==
X-Received: by 2002:aa7:888b:0:b0:792:fa4c:2437 with SMTP id
 d2e1a72fcca58-7a220d42505mr16077652b3a.26.1761017636657; 
 Mon, 20 Oct 2025 20:33:56 -0700 (PDT)
Received: from [192.168.0.22] ([175.119.5.143])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a2300f24e9sm9881557b3a.44.2025.10.20.20.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 20:33:56 -0700 (PDT)
Message-ID: <e26ec66d-36db-429f-befb-8baad14779d9@gmail.com>
Date: Tue, 21 Oct 2025 12:33:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ko
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20251016051621.7425-1-jeuk20.kim@gmail.com>
 <5257fece-d947-4a33-8f66-4db5e8b73a28@kernel.org>
From: Jeuk Kim <jeuk20.kim@gmail.com>
In-Reply-To: <5257fece-d947-4a33-8f66-4db5e8b73a28@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/16/2025 7:12 PM, Chao Yu wrote: > On 10/16/2025 1:16
 PM, Jeuk Kim wrote: >> From: Jeuk Kim >> >> Inline encryption derives DUN
 from <inode, file offset>, >> so bios from different inodes can' [...] 
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
 [jeuk20.kim(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1vB38M-0001oC-Gd
Subject: Re: [f2fs-dev] [PATCH] f2fs: serialize writeback for inline-crypto
 inodes
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
Cc: hyenc.jeong@samsung.com, jieon.seol@samsung.com, gyusun.lee@samsung.com,
 wone.jung@samsung.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, d_hyun.kwon@samsung.com,
 jeuk20.kim@samsung.com, jaemyung.lee@samsung.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDEwLzE2LzIwMjUgNzoxMiBQTSwgQ2hhbyBZdSB3cm90ZToKPiBPbiAxMC8xNi8yMDI1IDE6
MTYgUE0sIEpldWsgS2ltIHdyb3RlOgo+PiBGcm9tOiBKZXVrIEtpbSA8amV1azIwLmtpbUBzYW1z
dW5nLmNvbT4KPj4KPj4gSW5saW5lIGVuY3J5cHRpb24gZGVyaXZlcyBEVU4gZnJvbSA8aW5vZGUs
IGZpbGUgb2Zmc2V0PiwKPj4gc28gYmlvcyBmcm9tIGRpZmZlcmVudCBpbm9kZXMgY2FuJ3QgbWVy
Z2UuIFdpdGggbXVsdGktdGhyZWFkZWQKPj4gYnVmZmVyZWQgT19TWU5DIHdyaXRlcyB3aGVyZSBl
YWNoIHRocmVhZCB3cml0ZXMgdG8gaXRzIG93biBmaWxlLAo+PiA0S2lCLXBlci1wYWdlIExCQSBh
bGxvY2F0aW9uIGludGVybGVhdmVzIGFjcm9zcyBpbm9kZXMgYW5kCj4+IGNhdXNlcyBiaW8gc3Bs
aXQuIFNlcmlhbGl6ZSB3cml0ZWJhY2sgZm9yIGZzY3J5cHQgaW5saW5lLWNyeXB0bwo+PiBpbm9k
ZXMgdmlhIF9fc2hvdWxkX3NlcmlhbGl6ZV9pbygpIHRvIGtlZXAgZm9yZWdyb3VuZCB3cml0ZWJh
Y2sKPj4gZm9jdXNlZCBvbiBvbmUgaW5vZGUgYW5kIGF2b2lkIHNwbGl0Lgo+Pgo+PiBUZXN0OiBm
aW8gLS1uYW1lPXdiX29zeW5jIC0tcnc9d3JpdGUgLS1icz0xTSBcCj4+IMKgwqDCoMKgwqDCoCAt
LXRpbWVfYmFzZWQ9MSAtLXJ1bnRpbWU9NjBzIC0tc2l6ZT0yRyBcCj4+IMKgwqDCoMKgwqDCoCAt
LWlvZW5naW5lPXBzeW5jIC0tZGlyZWN0PTAgLS1zeW5jPTEgXAo+PiDCoMKgwqDCoMKgwqAgLS1u
dW1qb2JzPTggLS10aHJlYWQ9MSAtLW5yZmlsZXM9MSBcCj4+IMKgwqDCoMKgwqDCoCAtLWZpbGVu
YW1lX2Zvcm1hdD0nd2Jfb3N5bmMuJGpvYm51bScKPj4KPj4gZGV2aWNlOiBVRlMKPj4KPj4gQmVm
b3JlIC0KPj4gwqDCoCB3cml0ZSB0aHJvdWdocHV0OiA2NzVNaUIvcwo+PiDCoMKgIGRldmljZSBJ
L08gc2l6ZSBkaXN0cmlidXRpb24gKGJ5IGNvdW50LCB0b3RhbCAxMDI3NDE0KToKPj4gwqDCoMKg
wqAgNCBLaUI6wqAgOTIzMTM5ICg4OS45JSkKPj4gwqDCoMKgwqAgOCBLaUI6wqAgODQ3OTggKDgu
MyUpCj4+IMKgwqDCoMKgIOKJpTUxMiBLaUI6IDQ1MyAoMC4wJSkKPj4KPj4gQWZ0ZXIgLQo+PiDC
oMKgIHdyaXRlIHRocm91Z2hwdXQ6IDE3NjBNaUIvcwo+PiDCoMKgIGRldmljZSBJL08gc2l6ZSBk
aXN0cmlidXRpb24gKGJ5IGNvdW50LCB0b3RhbCAyMzE3NTApOgo+PiDCoMKgwqDCoCA0IEtpQjrC
oCAxNjkwNCAoNy4zJSkKPj4gwqDCoMKgwqAgOCBLaUI6wqAgNzIxMjggKDMxLjElKQo+PiDCoMKg
wqDCoCDiiaU1MTIgS2lCOiAxMTg5MDAgKDUxLjMlKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKZXVr
IEtpbSA8amV1azIwLmtpbUBzYW1zdW5nLmNvbT4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvZGF0YS5j
IHwgMiArKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+IGluZGV4IGVmMzhlNjJj
ZGE4Zi4uYWU2ZmI0MzVkNTc2IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+PiArKysg
Yi9mcy9mMmZzL2RhdGEuYwo+PiBAQCAtMzIxNyw2ICszMjE3LDggQEAgc3RhdGljIGlubGluZSBi
b29sIF9fc2hvdWxkX3NlcmlhbGl6ZV9pbyhzdHJ1Y3QgCj4+IGlub2RlICppbm9kZSwKPj4gwqAg
wqDCoMKgwqDCoCBpZiAoZjJmc19uZWVkX2NvbXByZXNzX2RhdGEoaW5vZGUpKQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+ICvCoMKgwqAgaWYgKGZzY3J5cHRfaW5vZGVfdXNl
c19pbmxpbmVfY3J5cHRvKGlub2RlKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+
PiDCoMKgwqDCoMKgIGlmICh3YmMtPnN5bmNfbW9kZSAhPSBXQl9TWU5DX0FMTCkKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+PiDCoMKgwqDCoMKgIGlmIChnZXRfZGlydHlfcGFn
ZXMoaW5vZGUpID49IAo+PiBTTV9JKEYyRlNfSV9TQihpbm9kZSkpLT5taW5fc2VxX2Jsb2NrcykK
Pgo+IEpldWssCj4KPiBDYW4geW91IHBsZWFzZSB0cnkgdHVuaW5nIC9zeXMvZnMvZjJmcy88ZGV2
Pi9taW5fc2VxX2Jsb2NrcyB0byBzZWUgCj4gd2hldGhlciBpdAo+IGNhbiBhY2hpdmUgdGhlIGdv
YWw/Cj4KPiBUaGFua3MsCj4KSGkgQ2hhbywKClRoYW5rcyBhIGxvdCBmb3IgdGhlIHN1Z2dlc3Rp
b24uCkkgdHJpZWQgdHVuaW5nIGAvc3lzL2ZzL2YyZnMvPGRldj4vbWluX3NlcV9ibG9ja3NgIGFz
IHlvdSBtZW50aW9uZWQsIGFuZCAKaXQgYWxzbyBhY2hpZXZlZCBzaW1pbGFyIHBlcmZvcm1hbmNl
IGltcHJvdmVtZW50IG9uIG15IHNldHVwLgoKWW91ciBhcHByb2FjaCBsb29rcyBjbGVhbmVyIGFu
ZCBiZXR0ZXIgdGhhbiB0aGUgb25lIEkgcHJvcG9zZWQuCgogRnJvbSB3aGF0IEkgc2VlLCBldmVu
IGFmdGVyIHJlZHVjaW5nIHRoaXMgdmFsdWUgZnJvbSB0aGUgZGVmYXVsdCAoMk1CKSAKdG8gNTEy
IEtCIG9uIG15IGxvY2FsIHN5c3RlbSwgdGhlcmUgZG9lc27igJl0IHNlZW0gdG8gYmUgYW55IG5v
dGljZWFibGUgCnBlcmZvcm1hbmNlIGRyb3Agb3Igb3RoZXIgc2lkZSBlZmZlY3RzLgpEbyB5b3Ug
c2VlIGFueSBwb3NzaWJsZSBkb3duc2lkZXMgd2l0aCBsb3dlcmluZyB0aGlzIHZhbHVlIHRoYXQg
SSBtaWdodCAKaGF2ZSBtaXNzZWQ/CgpUaGFua3MgYWdhaW4gZm9yIHlvdXIgaGVscC4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=

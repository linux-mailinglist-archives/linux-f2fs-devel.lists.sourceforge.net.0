Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65771CDEBBD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 14:23:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9WVMZ6VkhLWWiODy9nq8B1JBfOgSaq6IrrdS7aBt2I=; b=g0xndLB7Xm0qFxOHLFaOMdXqSs
	mpsZNJx6F+p1OJv/QtKSJGN+CQh6Hq+O11oymXtaUnQMepENRqNDPgbg1rUKwMmEzDkAu/SOyx77A
	vAnuirrUOAeZemgGbeaGhFOkMOPbp1FUx4rA4fY2DeTv41uqQibN7UJoxL4CHxNFjijQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZ7mO-0002kn-Ai;
	Fri, 26 Dec 2025 13:22:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vZ7mM-0002ke-Mh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 13:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iuWacYVhcY/qiZSlTzB2NbUNv6Banbv3QC6mrqMbvR8=; b=Nso0vUBmiz8nGGam+1ah+qXd6l
 A2ZiMfhrlbK0NLF/JkA5WOs03y0bMqBnhRUBAL2Egr2y3ACYzsdLAHDoeCg4QS9w0lwgJoIKTJJVz
 YUEpR2vcLsGF+/Q9F2NhH9Ihg7qnIl2egnFwEyOY4f3AveIzER2lxbO6cVeOBTXxtktI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iuWacYVhcY/qiZSlTzB2NbUNv6Banbv3QC6mrqMbvR8=; b=GcNbW6+X5oil3k0SxAACI2N6Mo
 VFWYyKT9CzH8htMuTILLqDbeyUFHgRfnDkBP0r00aILRdJ8/pWbZPqxY6c95sCNKIa3+5pVIQ3Sme
 wFSuMK2JPdsmFi7jLAag6qb9HFj7IUn6HxoKbU3oM7+977cEHZBiVzW7QPhA4a+OgjqI=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vZ7mM-000690-1A for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 13:22:50 +0000
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a07f8dd9cdso77090965ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Dec 2025 05:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766755359; x=1767360159; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iuWacYVhcY/qiZSlTzB2NbUNv6Banbv3QC6mrqMbvR8=;
 b=VNW5aXTzDl3YdCioq/CuZMqh0bfFM/Br0KEaW5CLOXUHbKSZa/pUXZM+rEV0ctK00F
 naZvC3v3g3fFSt3dtqVtgL7+fW2mqDk4NqcHYtDztsPUa6KPjU+8J7bBSn3x9mXkZg64
 DXKm28FREiW+Oicee+4O0up4GCnKKwyQVf/zzepdDS4ZiBdpsvpfSVtEYjk/fPMO1IsP
 dxmVN3wmPoNrVBHfCrWLV3bDGKOpuxbalkSQGxrNAvrJwIfoOE+ybv42L34TBEe0A04e
 nIuAOtAMFYjM5aHUqVyG+Em+oRpxe+O+o7PbwwGkOU5AvstwWiIttScMiN2TeRbHI2Aa
 lJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766755359; x=1767360159;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iuWacYVhcY/qiZSlTzB2NbUNv6Banbv3QC6mrqMbvR8=;
 b=t6YLtfLCnB/woJaN9JUQ5L2wmOWxYakzTlZXUMH7+sfsipoqWPl3RWYIouhvWxI+Fx
 MbmGZf0ME0MRb1VsA3MDegh/I7qTZ9Ttsxr/Kk4Y0c++MgIoZAJKQykel8xt7qXlccqP
 henmT43osXr5d+2jAIPfzFxMrNje5QpbClbVJkYL+lWWLR3PsAaaKcOvFkpqaA3X5zKr
 u9520YjoUJrUkUfgxMWJm7zS2hT2KY58HKqIHqlpABCrrx1LC1KzkjrV2W9OfPLe568M
 jl7UTef9+haPTPKhpfvo/ADY4KQQAp+FfLePsBIMo6nnfZtSARNjo7p533emKR6PmGUG
 kojQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6cdSDzEtx1eadlEI3J0G/eF/IWwb+W1ez4QSLpcNPV5m0XLRGxEe3lRhX1no1OUnRHOTojhRleunBY4MpcjlK@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywan7SsdRetPqznc3LaD0Geucj9FJiVeypkIibOE77sIOP+VD4d
 MjyxEpRQKMuh9ojRk/NgXcx3rz/TZnJjXgQoQgm7Bxl/PsDfBY474ek5
X-Gm-Gg: AY/fxX5FhGo82nLE9LmYchAvEw1NVdfuJ3dQpRWWtvpoZ6vxoeVOV2SNorwuSyHGKQi
 9j/v76RoPOMuvxgxMZb7uoCNeWcFp+JttUsFOsu4BLvN+ha5kLghBlVunf8Ms55/VbwNevWpXLk
 wMb3URHNrBJcF3knhoYNzer3WHkYVc8IKBJMoMO2gjbjWY+8U7WC6G4dmluRk3CBqQ9MokQpyCe
 S9+cww6cRvS1pMseWY473mu2fTuLnNYzzY3wwcfjtI6Kr5jxKi3jE8IZK2uoKp3Fk9xJhzi+wJj
 0BomB978bI5LeVGvhO+fnH6TGei4C6AMoyymjrcWx4hnTbJ3yMzkSqUDjUXmRGm1Lcs8p2GbhNi
 y6KFJVLF6TYoM5ducCUgJQa1+XYw2CbjNImqc4xpKkc+9k/JVWxe6vAD8BlVgKp+i7Aztob/KYe
 /CSFk+hWqjpaCj66LmNfMhcyHUissG4A==
X-Google-Smtp-Source: AGHT+IECZxnDg29fdstMKlgq70TXS8Lic6i2RE4pv7ZM1hahseAZTYCgePBKNfrr0hWf22mS16dsTg==
X-Received: by 2002:a17:903:38c3:b0:269:82a5:f9e9 with SMTP id
 d9443c01a7336-2a2f2836764mr230749095ad.29.1766755359184; 
 Fri, 26 Dec 2025 05:22:39 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d4cbcfsm209632415ad.50.2025.12.26.05.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Dec 2025 05:22:38 -0800 (PST)
Message-ID: <e67cb602-dbe5-4d5c-a148-69fdc23e43ef@gmail.com>
Date: Fri, 26 Dec 2025 21:22:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251224131634.3860115-2-yangyongpeng.storage@gmail.com>
 <c34d413c-755c-4248-8aab-c891577d4b21@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <c34d413c-755c-4248-8aab-c891577d4b21@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/26/25 10:23, Chao Yu via Linux-f2fs-devel wrote: > On
 12/24/2025 9:16 PM, Yongpeng Yang wrote: >> From: Yongpeng Yang > > Nice
 catch! > >> >> During SPO tests, when mounting F2FS, an -EINVAL e [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vZ7mM-000690-1A
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix IS_CHECKPOINTED flag
 inconsistency issue caused by concurrent atomic commit and checkpoint
 writes
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
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjYvMjUgMTA6MjMsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMTIvMjQvMjAyNSA5OjE2IFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+PiBGcm9tOiBZb25n
cGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPiAKPiBOaWNlIGNhdGNoIQo+IAo+
Pgo+PiBEdXJpbmcgU1BPIHRlc3RzLCB3aGVuIG1vdW50aW5nIEYyRlMsIGFuIC1FSU5WQUwgZXJy
b3Igd2FzIHJldHVybmVkIGZyb20KPj4gZjJmc19yZWNvdmVyX2lub2RlX3BhZ2UuIFRoZSBpc3N1
ZSBvY2N1cnJlZCB1bmRlciB0aGUgZm9sbG93aW5nIHNjZW5hcmlvCj4+Cj4+IFRocmVhZCBBwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFRocmVhZCBCCj4+IGYyZnNfaW9jX2NvbW1pdF9hdG9taWNfd3JpdGUKPj4g
wqAgLSBmMmZzX2RvX3N5bmNfZmlsZSAvLyBhdG9taWMgPSB0cnVlCj4+IMKgwqAgLSBmMmZzX2Zz
eW5jX25vZGVfcGFnZXMKPj4gwqDCoMKgwqAgOiBsYXN0X2ZvbGlvID0gaW5vZGUgZm9saW8KPj4g
wqDCoMKgwqAgOiBzY2hlZHVsZSBiZWZvcmUgZm9saW9fbG9jayhsYXN0X2ZvbGlvKSBmMmZzX3dy
aXRlX2NoZWNrcG9pbnQKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBi
bG9ja19vcGVyYXRpb25zLy8KPj4gd3JpdGViYWNrIGxhc3RfZm9saW8KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBzY2hlZHVsZSBiZWZvcmUKPj4gZjJmc19mbHVzaF9u
YXRfZW50cmllcwo+PiDCoMKgwqDCoCA6IHNldF9mc3luY19tYXJrKGxhc3RfZm9saW8sIDEpCj4+
IMKgwqDCoMKgIDogc2V0X2RlbnRyeV9tYXJrKGxhc3RfZm9saW8sIDEpCj4+IMKgwqDCoMKgIDog
Zm9saW9fbWFya19kaXJ0eShsYXN0X2ZvbGlvKQo+PiDCoMKgwqDCoCA6IF9fd3JpdGVfbm9kZV9m
b2xpbyhsYXN0X2ZvbGlvKQo+IAo+IFdoYXQgZG8geW91IHRoaW5rIG9mIHJlbG9jYXRpbmcgc2V0
X2ZzeW5jX21hcmsgJiBzZXRfZGVudHJ5X21hcmsgbG9naWMKPiBpbnRvIF9fd3JpdGVfbm9kZV9m
b2xpbygpLCBzbyB0aGF0IHdlIGNhbiBjb3ZlciB0aGVtIHcvIGV4aXN0ZWQgLm5vZGVfd3JpdGUK
PiBsb2NrIGluIF9fd3JpdGVfbm9kZV9mb2xpbygpLCBpdCBjYW4gYXZvaWQgY2hlY2twb2ludCBy
YWNpbmcgYXMgd2VsbC4KClllcywgdGhpcyBtYWtlcyBtb3JlIHNlbnNlLiBJJ2xsIGZpeCB0aGlz
IGluIHYyIHBhdGNoLgoKPiAKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBmMmZzX2ZsdXNoX25hdF9lbnRyaWVzCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA6IHtzdHJ1Y3QgbmF0X2VudHJ5fS0KPj4gPmZsYWcgfD0gQklUKElTX0NIRUNL
UE9JTlRFRCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQTwo+Pgo+PiBU
aHJlYWQgQSBjYWxscyBmMmZzX25lZWRfZGVudHJ5X21hcmsoc2JpLCBpbm8pLCBhbmQgdGhlIGxh
c3RfZm9saW8gaGFzCj4+IGFscmVhZHkgYmVlbiB3cml0dGVuIG9uY2UuIEhvd2V2ZXIsIHRoZSB7
c3RydWN0IG5hdF9lbnRyeX0tPmZsYWcgZGlkIG5vdAo+PiBoYXZlIHRoZSBJU19DSEVDS1BPSU5U
RUQgc2V0LCBjYXVzaW5nIHNldF9kZW50cnlfbWFyayhsYXN0X2ZvbGlvLCAxKSBhbmQKPj4gd3Jp
dGUgbGFzdF9mb2xpbyBhZ2Fpbi4KPj4KPj4gQWZ0ZXIgU1BPIGFuZCByZWJvb3QsIGl0IHdhcyBk
ZXRlY3RlZCB0aGF0IHtzdHJ1Y3Qgbm9kZV9pbmZvfS0+YmxrX2FkZHIKPj4gd2FzIG5vdCBOVUxM
X0FERFIgYmVjYXVzZSBUaHJlYWQgQiBzdWNjZXNzZnVsbHkgd3JpdGUgdGhlIGNoZWNrcG9pbnQu
Cj4+Cj4+IFRoaXMgaXNzdWUgb25seSBvY2N1cnMgaW4gYXRvbWljIHdyaXRlIHNjZW5hcmlvcywg
YW5kIGRvZXMgbm90IGFmZmVjdAo+IAo+IElmIGF0b21pYyBpcyBmYWxzZSwgd2Ugd2lsbCBlbmNv
dW50ZXIgc3VjaCBpc3N1ZSBhcyB3ZWxsPyBvciBhbSBJIG1pc3NpbmcKPiBzb21ldGhpbmc/CgpJ
biB0aGUgY2FzZSBvZiBhdG9taWMgaXMgdHJ1ZSwgdGhlIGZvbGlvIG11c3QgYmUgbm9uLWRpcnR5
LgpGb3IgcmVndWxhciBmaWxlIGZzeW5jIG9wZXJhdGlvbnMsIHRoZSBmb2xpbyBtdXN0IGJlIGRp
cnR5LiBJZgpibG9ja19vcGVyYXRpb25zLT5mMmZzX3N5bmNfbm9kZV9wYWdlcyBzdWNjZXNzZnVs
bHkgc3VibWl0IHRoZSBmb2xpbwp3cml0ZSwgdGhpcyBwYXRoIHdpbGwgbm90IGJlIGV4ZWN1dGVk
LiBPdGhlcndpc2UsIHRoZQpmMmZzX3dyaXRlX2NoZWNrcG9pbnQgd2lsbCBuZWVkIHRvIHdhaXQg
Zm9yIHRoZSBmb2xpbyB3cml0ZSBzdWJtaXNzaW9uCnRvIGNvbXBsZXRlLCBhcyBzYmktPm5yX3Bh
Z2VzW0YyRlNfRElSVFlfTk9ERVNdID4gMC4gVGhlcmVmb3JlLCB0aGUKc2l0dWF0aW9uIHdoZXJl
IGYyZnNfbmVlZF9kZW50cnlfbWFyayBjaGVja3MgdGhhdCB0aGUge3N0cnVjdApuYXRfZW50cnl9
LT5mbGFnIGRvZXMgbm90IGhhdmUgdGhlIElTX0NIRUNLUE9JTlRFRCBmbGFnLCBidXQgdGhlIGZv
bGlvCndyaXRlIGhhcyBhbHJlYWR5IGJlZW4gc3VibWl0dGVkLCB3aWxsIG5vdCBvY2N1ci4KClRo
YW5rcwpZb25ncGVuZywKCj4gCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWF0b21pYyB8
fCBmb2xpbyA9PSBsYXN0X2ZvbGlvKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNldF9mc3luY19tYXJrKGZvbGlvLCAxKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGVyY3B1X2NvdW50ZXJfaW5jKCZzYmktPnJmX25vZGVfYmxvY2tfY291bnQpOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfSU5PREUoZm9saW8pKSB7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlu
b2RlLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEZJX0RJUlRZX0lOT0RFKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfdXBkYXRlX2lub2RlKGlub2RlLCBmb2xpbyk7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X2RlbnRyeV9tYXJrKGZv
bGlvLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJm
c19uZWVkX2RlbnRyeV9tYXJrKHNiaSwgaW5vKSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogbWF5IGJlIHdyaXR0
ZW4gYnkgb3RoZXIgdGhyZWFkICovCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
ICghZm9saW9fdGVzdF9kaXJ0eShmb2xpbykpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZm9saW9fbWFya19kaXJ0eShmb2xpbyk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4gCj4gVGhhbmtzLAo+IAo+PiByZWd1bGFyIGZpbGUgZnN5bmMgb3BlcmF0aW9ucy4g
VGhlcmVmb3JlLCBmb3IgYXRvbWljIGZpbGUgZnN5bmMsCj4+IHNiaS0+Y3BfcndzZW0gc2hvdWxk
IGJlIGFjcXVpcmVkIHRvIGVuc3VyZSB0aGF0IHRoZSBJU19DSEVDS1BPSU5URUQgZmxhZwo+PiBj
b3JyZWN0bHkgaW5kaWNhdGVzIHRoYXQgdGhlIGNoZWNrcG9pbnQgd3JpdGUgaGFzIGJlZW4gY29t
cGxldGVkLgo+Pgo+PiBGaXhlczogNjA4NTE0ZGViYTM4ICgiZjJmczogc2V0IGZzeW5jIG1hcmsg
b25seSBmb3IgdGhlIGxhc3QgZG5vZGUiKQo+PiBTaWduZWQtb2ZmLWJ5OiBTaGVuZyBZb25nIDxz
aGVuZ3lvbmcxQHhpYW9taS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlh
bmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+PiAtLS0KPj4gwqAgZnMvZjJmcy9ub2RlLmMgfCA4ICsr
KysrKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbm9kZS5jIGIvZnMvZjJmcy9ub2RlLmMKPj4g
aW5kZXggNDgyYTM2MmYyNjI1Li5lNDgyYTM4NDQ0ZjEgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMv
bm9kZS5jCj4+ICsrKyBiL2ZzL2YyZnMvbm9kZS5jCj4+IEBAIC0xODU0LDcgKzE4NTQsNyBAQCBp
bnQgZjJmc19mc3luY19ub2RlX3BhZ2VzKHN0cnVjdCBmMmZzX3NiX2luZm8KPj4gKnNiaSwgc3Ry
dWN0IGlub2RlICppbm9kZSwKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZm9saW9fYmF0Y2ggZmJhdGNo
Owo+PiDCoMKgwqDCoMKgIGludCByZXQgPSAwOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBmb2xpbyAq
bGFzdF9mb2xpbyA9IE5VTEw7Cj4+IC3CoMKgwqAgYm9vbCBtYXJrZWQgPSBmYWxzZTsKPj4gK8Kg
wqDCoCBib29sIG1hcmtlZCA9IGZhbHNlLCBsb2NrZWQgPSBmYWxzZTsKPj4gwqDCoMKgwqDCoCBu
aWRfdCBpbm8gPSBpbm9kZS0+aV9pbm87Cj4+IMKgwqDCoMKgwqAgaW50IG5yX2ZvbGlvczsKPj4g
wqDCoMKgwqDCoCBpbnQgbndyaXR0ZW4gPSAwOwo+PiBAQCAtMTg4OSw2ICsxODg5LDEwIEBAIGlu
dCBmMmZzX2ZzeW5jX25vZGVfcGFnZXMoc3RydWN0IGYyZnNfc2JfaW5mbwo+PiAqc2JpLCBzdHJ1
Y3QgaW5vZGUgKmlub2RlLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaW5vX29m
X25vZGUoZm9saW8pICE9IGlubykKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb250aW51ZTsKPj4gwqAgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGF0b21pYyAmJiBm
b2xpbyA9PSBsYXN0X2ZvbGlvKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZjJmc19sb2NrX29wKHNiaSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9j
a2VkID0gdHJ1ZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmb2xpb19sb2NrKGZvbGlvKTsKPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKHVubGlrZWx5KCFpc19ub2RlX2ZvbGlvKGZvbGlvKSkpIHsKPj4gQEAgLTE5
NTksNiArMTk2Myw4IEBAIGludCBmMmZzX2ZzeW5jX25vZGVfcGFnZXMoc3RydWN0IGYyZnNfc2Jf
aW5mbwo+PiAqc2JpLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
Z290byByZXRyeTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIG91dDoKPj4gK8KgwqDCoCBpZiAobG9j
a2VkKQo+PiArwqDCoMKgwqDCoMKgwqAgZjJmc191bmxvY2tfb3Aoc2JpKTsKPj4gwqDCoMKgwqDC
oCBpZiAobndyaXR0ZW4pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3N1Ym1pdF9tZXJnZWRf
d3JpdGVfY29uZChzYmksIE5VTEwsIE5VTEwsIGlubywgTk9ERSk7Cj4+IMKgwqDCoMKgwqAgcmV0
dXJuIHJldDsKPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

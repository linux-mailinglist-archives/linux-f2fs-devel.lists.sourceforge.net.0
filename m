Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CB196C181
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 16:58:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slrSj-0001Zb-2K;
	Wed, 04 Sep 2024 14:58:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1slrSg-0001ZV-PI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 14:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zx9HpjsA8VHIH7+I20PJmXupzB9UpsivPvmE9XAiMCU=; b=Si7Ns6F/5lKrgdf5kpgdAzC+sN
 tujWl2pLCexZWi5kRAg8VtiYb0Y58HFfqoZGUrwON+lQb23C/jDW9Q6W1etU6k7r39Ham6HsFDdpu
 mFL5SbnAEL/3/8iJTamSnRoNGbN4VyGz3wORjkMMVyw1vaGxfaZPpfJ1YThmtH0TZQM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zx9HpjsA8VHIH7+I20PJmXupzB9UpsivPvmE9XAiMCU=; b=DFkzZlF+5KkHEzgwseCyTe/Zb1
 4bAGBOifUiu/rcojBZPDHLjEVBtO5V/KZSnKiRe7d3dexCvj5GRsFsBJjgVYyF8KBgJBDql1mT9MR
 Fh7684cAeQR55WlyYESDlGo+h8/HDVduMftEJOmdztdr9rhd1iKPaZEkGGqXL+uAtTDs=;
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1slrSf-0007wk-Vf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 14:58:22 +0000
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-846bc787b3dso1400448241.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Sep 2024 07:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725461891; x=1726066691; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zx9HpjsA8VHIH7+I20PJmXupzB9UpsivPvmE9XAiMCU=;
 b=k3z3UXhI54gplOLuS7dr6QbdVpl1euWWmIQULd6ea3/GlB0QDcGVn1J5/e2nwUsi1X
 31/mQ/ohK+/zqIL1gV3NCiniYBEPjFfq2+lCCH94VSTPl2BrRKWd/26vZNJ5/oM0G40W
 ZU0isFaxnUQt/XkoaX8PZcnkyedf1de96bSIlNro0cYpIZx3Ai2JGe6+HaTOUfugMUqo
 85E5A/tP7hn/ESt9mHhHlCBEKCTMwH/pVuMKs/6n0WrpNQEK4S+mG6YWvrAf+RvJ8uBJ
 GLmQXIzC5J7C6ZACfhrsbeD8wt5ytdcKxrk406c+F+hGIwqzO1S46GcekQdPpK4zumm0
 ClJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725461891; x=1726066691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zx9HpjsA8VHIH7+I20PJmXupzB9UpsivPvmE9XAiMCU=;
 b=WwtcFPzefPZ0l7XpwBnTPHvFX+WajB17/u5S1Oqq/cxDtIs+BJcspCpIYX1FBJtZ7T
 eCCUBUh3hVHmL9WCJpOoZNVSQYaEvwXVdgFkkv1wP2PG/f+82bYh9mj6qYJ+7lZgNglI
 twBAZSHV7Zc2YqLsGqEEgFzi/ea2j618X3lvatxAknSYz3gpI3/Lb13AItQ3sZqXIQWf
 4NimbEwQpHjibB2vC9qm3XWCfyUyghGaSF2lHkCCBfYPvzIyalRMhrHbYVlvttancqSC
 YiIrzI1+PY/NagexbOkGaw/UDkWLaGPtlWBabCDwFxRkb9HFI2c9eTAzw7lTiqAXaWpM
 jA3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0V61CL+N9RUYzqjx0fD1OhzovKKzWHvjQpeLHCq0kOsllYTyazBzQLkLnHAkEf2dZ/NmGGtVxm+NL3klYJevf@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw8L0oIkR7QI8OalS1e2ncfbIHHaK53QwaLLSYxfMPjJ3FIThCP
 EU3OA+M823MAaVQXMZAln4f2nSnTpzDQgL+cKYVE20p4oX7CYgcjpNqhTw8DDFrHr/KpqcRsoaz
 bxiVgfQChAbXyDoXYnLhSGuLGH0AQyA==
X-Google-Smtp-Source: AGHT+IHCY9cCLJpt6loXb9m3NULwyXyNIhEMZPz0XzEGdrOBnXyIuuOS6OgAjHv2cyLZHFBZ2FuPGHpdFhlTF4z1XSo=
X-Received: by 2002:a05:6122:181f:b0:500:daf0:8909 with SMTP id
 71dfb90a1353d-500daf08b1dmr6809960e0c.13.1725461890949; Wed, 04 Sep 2024
 07:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240826202352.2150294-1-daeho43@gmail.com>
 <45a8a9f3-27b8-433e-a0ac-e457f4cdf1eb@kernel.org>
 <CACOAw_xMipooJy3GrZTc2CSpMoSs9FsErdxjqMWXVQ6iDiEZ0Q@mail.gmail.com>
 <d4f218ad-7a01-4b5b-a438-c0e4e14bbc96@kernel.org>
 <CACOAw_zvNyD3cmMpJsidEMyrtnZYU4kR4BmE_cygroPyYoiGvA@mail.gmail.com>
 <5c7b34d8-6efa-4716-ab89-a0b7b7583cb2@kernel.org>
 <CACOAw_w3Tn6HL9hZXFgpjpgu9ySvE_0FbTWMMBuZKgRFBYXXLA@mail.gmail.com>
In-Reply-To: <CACOAw_w3Tn6HL9hZXFgpjpgu9ySvE_0FbTWMMBuZKgRFBYXXLA@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 4 Sep 2024 07:58:00 -0700
Message-ID: <CACOAw_w2A2KpK3F58rot-QLRgstGKmPi5e5+RXzFTm1pqpF9SQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Sep 4, 2024 at 7:56 AM Daeho Jeong wrote: > > On
    Tue, Sep 3, 2024 at 8:35 PM Chao Yu wrote: > > > > On 2024/9/4 10:52, Daeho
    Jeong wrote: > > > On Tue, Sep 3, 2024 at 7:26 PM Chao Yu [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slrSf-0007wk-Vf
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent atomic file from being dirtied
 before commit
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBTZXAgNCwgMjAyNCBhdCA3OjU24oCvQU0gRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDMsIDIwMjQgYXQgODozNeKAr1BNIENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gMjAyNC85LzQgMTA6NTIsIERh
ZWhvIEplb25nIHdyb3RlOgo+ID4gPiBPbiBUdWUsIFNlcCAzLCAyMDI0IGF0IDc6MjbigK9QTSBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IE9uIDIwMjQvOS80
IDE6MDcsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gPj4+IE9uIE1vbiwgU2VwIDIsIDIwMjQgYXQg
MzowOOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Pj4+Cj4gPiA+
Pj4+IE9uIDIwMjQvOC8yNyA0OjIzLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+ID4+Pj4+IEZyb206
IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4g
S2VlcCBhdG9taWMgZmlsZSBjbGVhbiB3aGlsZSB1cGRhdGluZyBhbmQgbWFrZSBpdCBkaXJ0aWVk
IGR1cmluZyBjb21taXQKPiA+ID4+Pj4+IGluIG9yZGVyIHRvIGF2b2lkIHVubmVjZXNzYXJ5IGFu
ZCBleGNlc3NpdmUgaW5vZGUgdXBkYXRlcyBpbiB0aGUgcHJldmlvdXMKPiA+ID4+Pj4+IGZpeC4K
PiA+ID4+Pj4+Cj4gPiA+Pj4+PiBGaXhlczogNGJmNzgzMjIzNDZmICgiZjJmczogbWFyayBpbm9k
ZSBkaXJ0eSBmb3IgRklfQVRPTUlDX0NPTU1JVFRFRCBmbGFnIikKPiA+ID4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiA+Pj4+PiAtLS0K
PiA+ID4+Pj4+ICAgICBmcy9mMmZzL2YyZnMuaCAgICB8ICAzICstLQo+ID4gPj4+Pj4gICAgIGZz
L2YyZnMvaW5vZGUuYyAgIHwgMTAgKysrKysrLS0tLQo+ID4gPj4+Pj4gICAgIGZzL2YyZnMvc2Vn
bWVudC5jIHwgMTAgKysrKysrKystLQo+ID4gPj4+Pj4gICAgIDMgZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4gPj4+Pj4gaW5kZXggNDY1
YjJmZDUwYzcwLi41YTdmNmZhOGI1ODUgMTAwNjQ0Cj4gPiA+Pj4+PiAtLS0gYS9mcy9mMmZzL2Yy
ZnMuaAo+ID4gPj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiA+ID4+Pj4+IEBAIC04MDEsNyAr
ODAxLDcgQEAgZW51bSB7Cj4gPiA+Pj4+PiAgICAgICAgIEZJX0NPTVBSRVNTX1JFTEVBU0VELCAg
IC8qIGNvbXByZXNzZWQgYmxvY2tzIHdlcmUgcmVsZWFzZWQgKi8KPiA+ID4+Pj4+ICAgICAgICAg
RklfQUxJR05FRF9XUklURSwgICAgICAgLyogZW5hYmxlIGFsaWduZWQgd3JpdGUgKi8KPiA+ID4+
Pj4+ICAgICAgICAgRklfQ09XX0ZJTEUsICAgICAgICAgICAgLyogaW5kaWNhdGUgQ09XIGZpbGUg
Ki8KPiA+ID4+Pj4+IC0gICAgIEZJX0FUT01JQ19DT01NSVRURUQsICAgIC8qIGluZGljYXRlIGF0
b21pYyBjb21taXQgY29tcGxldGVkIGV4Y2VwdCBkaXNrIHN5bmMgKi8KPiA+ID4+Pj4+ICsgICAg
IEZJX0FUT01JQ19ESVJUSUVELCAgICAgIC8qIGluZGljYXRlIGF0b21pYyBmaWxlIGlzIGRpcnRp
ZWQgKi8KPiA+ID4+Pj4+ICAgICAgICAgRklfQVRPTUlDX1JFUExBQ0UsICAgICAgLyogaW5kaWNh
dGUgYXRvbWljIHJlcGxhY2UgKi8KPiA+ID4+Pj4+ICAgICAgICAgRklfT1BFTkVEX0ZJTEUsICAg
ICAgICAgLyogaW5kaWNhdGUgZmlsZSBoYXMgYmVlbiBvcGVuZWQgKi8KPiA+ID4+Pj4+ICAgICAg
ICAgRklfTUFYLCAgICAgICAgICAgICAgICAgLyogbWF4IGZsYWcsIG5ldmVyIGJlIHVzZWQgKi8K
PiA+ID4+Pj4+IEBAIC0zMDQyLDcgKzMwNDIsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19tYXJr
X2lub2RlX2RpcnR5X2ZsYWcoc3RydWN0IGlub2RlICppbm9kZSwKPiA+ID4+Pj4+ICAgICAgICAg
Y2FzZSBGSV9JTkxJTkVfRE9UUzoKPiA+ID4+Pj4+ICAgICAgICAgY2FzZSBGSV9QSU5fRklMRToK
PiA+ID4+Pj4+ICAgICAgICAgY2FzZSBGSV9DT01QUkVTU19SRUxFQVNFRDoKPiA+ID4+Pj4+IC0g
ICAgIGNhc2UgRklfQVRPTUlDX0NPTU1JVFRFRDoKPiA+ID4+Pj4+ICAgICAgICAgICAgICAgICBm
MmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4gPiA+Pj4+PiAgICAgICAg
IH0KPiA+ID4+Pj4+ICAgICB9Cj4gPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5j
IGIvZnMvZjJmcy9pbm9kZS5jCj4gPiA+Pj4+PiBpbmRleCAxZWIyNTBjNmIzOTIuLjVkZDNlNTVk
MmJlMiAxMDA2NDQKPiA+ID4+Pj4+IC0tLSBhL2ZzL2YyZnMvaW5vZGUuYwo+ID4gPj4+Pj4gKysr
IGIvZnMvZjJmcy9pbm9kZS5jCj4gPiA+Pj4+PiBAQCAtMzUsNiArMzUsMTEgQEAgdm9pZCBmMmZz
X21hcmtfaW5vZGVfZGlydHlfc3luYyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBib29sIHN5bmMpCj4g
PiA+Pj4+PiAgICAgICAgIGlmIChmMmZzX2lub2RlX2RpcnRpZWQoaW5vZGUsIHN5bmMpKQo+ID4g
Pj4+Pgo+ID4gPj4+PiBJdCB3aWxsIHJldHVybiBkaXJlY3RseSBoZXJlIGlmIGlub2RlIHdhcyBk
aXJ0aWVkLCBzbyBpdCBtYXkgbWlzc2VkIHRvIHNldAo+ID4gPj4+PiBGSV9BVE9NSUNfRElSVElF
RCBmbGFnPwo+ID4gPj4+Cj4gPiA+Pj4gSXMgaXQgcG9zc2libGUgZm9yIGl0IHRvIGJlIGFscmVh
ZHkgZGlydHksIHNpbmNlIHdlIGFscmVhZHkgbWFkZSBpdAo+ID4gPj4+IGNsZWFuIHdpdGggZjJm
c193cml0ZV9pbm9kZSgpIHdoZW4gd2Ugc3RhcnRlZCB0aGUgYXRvbWljIHdyaXRlPwo+ID4gPj4K
PiA+ID4+IFNvbWUgaW9jdGwgaW50ZXJmYWNlcyBtYXkgcmFjZSB3LyBhdG9taWMgd3JpdGU/IGUu
Zy4gc2V0X3Bpbl9maWxlIHdvbid0Cj4gPiA+PiBjaGVjayBhdG9taWNfZmlsZSBzdGF0dXMsIGFu
ZCBtYXkgZGlydHkgaW5vZGUgYWZ0ZXIgd2Ugc3RhcnRlZCBhdG9taWMKPiA+ID4+IHdyaXRlLCBz
byB3ZSdkIGJldHRlciBkZXRlY3Qgc3VjaCByYWNlIGNvbmRpdGlvbiBhbmQgYnJlYWsgaW9jdGwg
dG8KPiA+ID4+IGF2b2lkIHJ1aW4gYXRvbWljIHdyaXRlPyBhbmQgbWF5YmUgd2UgY2FuIGFkZCBm
MmZzX2J1Z19vbigpIGluCj4gPiA+PiBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYygpIHRvIGRl
dGVjdCBhbnkgb3RoZXIgbWlzc2luZyBjYXNlcz8KPiA+ID4+Cj4gPiA+Cj4gPiA+IEhvdyBhYm91
dCBleGNoYW5naW5nIHRoZSBwb3NpdGlvbnMgb2YgZjJmc193cml0ZV9pbm9kZSgpIGFuZAo+ID4g
PiBzZXRfaW5vZGVfZmxhZygpIGluIGYyZnNfaW9jX3N0YXJ0X2F0b21pY193cml0ZSgpPwo+ID4g
Pgo+ID4gPiAuLi4KPiA+ID4gICAgICAgICAgZjJmc193cml0ZV9pbm9kZShpbm9kZSwgTlVMTCk7
Cj4gPiA+Cj4gPiA+ICAgICAgICAgIHN0YXRfaW5jX2F0b21pY19pbm9kZShpbm9kZSk7Cj4gPiA+
Cj4gPiA+ICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRklMRSk7Cj4g
PiA+IC4uLgo+ID4KPiA+IE9oLCBJJ20gbm90IHN1cmUgSSd2ZSBnb3QgeW91ciBwb2ludCwgYWZ0
ZXIgZXhjaGFuZ2luZyB3ZSBzdGlsbCBtYXkgc3VmZmVyCj4gPiBiZWxvdyByYWNlIGNvbmRpdGlv
biwgcmlnaHQ/Cj4gPgo+ID4gLSBmMmZzX2lvY19zdGFydF9hdG9taWNfd3JpdGUKPiA+ICAgLSBz
ZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0ZJTEUpCj4gPiAgIC0gZjJmc193cml0ZV9p
bm9kZShpbm9kZSwgTlVMTCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtIGYyZnNfaW9jX3NldF9waW5fZmlsZQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9QSU5fRklMRSkKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gX19tYXJrX2lub2Rl
X2RpcnR5X2ZsYWcoKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA9PiBUaGlzIGF0dGVtcHQgd2lsbAo+IGJlIGJsb2NrZWQgYnkgdGhlIGJlbG93IGNv
bmRpdGlvbi4KPgo+ICsgICAgICAgaWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKSB7Cj4g
KyAgICAgICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7
Cj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgIH0KPgo+IFBseiwgcmVmZXIgdG8g
dGhlIGFib3ZlIGNvbW1lbnQuCgpCeSB0aGUgd2F5LCBJIG5lZWQgdG8gY2hhbmdlIHRoaXMgcGF0
Y2ggYSBsaXR0bGUgYml0IHRvIHByZXZlbnQgYQpkaXJlY3QgaW5vZGUgZGlydHlpbmcgY2FzZSBi
eSBWRlMgbGF5ZXIuClBseiwgd2FpdCBmb3IgdGhlIDJuZCBvbmUuCgo+Cj4gPiAtIGYyZnNfaW9j
X2NvbW1pdF9hdG9taWNfd3JpdGUKPiA+Cj4gPiBTbyB0aGF0IEkgcHJvcG9zZWQgYSBmaXggZm9y
IHRoaXM6Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQw
OTA0MDMyMDQ3LjEyNjQ3MDYtMS1jaGFvQGtlcm5lbC5vcmcKPiA+Cj4gPiBUaGFua3MsCj4gPgo+
ID4gPgo+ID4gPj4gVGhhbmtzLAo+ID4gPj4KPiA+ID4+Pgo+ID4gPj4+Pgo+ID4gPj4+PiBUaGFu
a3MsCj4gPiA+Pj4+Cj4gPiA+Pj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gPj4+Pj4K
PiA+ID4+Pj4+ICsgICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSkgewo+ID4gPj4+
Pj4gKyAgICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQp
Owo+ID4gPj4+Pj4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiA+Pj4+PiArICAgICB9Cj4gPiA+
Pj4+PiArCj4gPiA+Pj4+PiAgICAgICAgIG1hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSk7Cj4g
PiA+Pj4+PiAgICAgfQo+ID4gPj4+Pj4KPiA+ID4+Pj4+IEBAIC02NTMsMTAgKzY1OCw3IEBAIHZv
aWQgZjJmc191cGRhdGVfaW5vZGUoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IHBhZ2UgKm5v
ZGVfcGFnZSkKPiA+ID4+Pj4+ICAgICAgICAgcmktPmlfZ2lkID0gY3B1X3RvX2xlMzIoaV9naWRf
cmVhZChpbm9kZSkpOwo+ID4gPj4+Pj4gICAgICAgICByaS0+aV9saW5rcyA9IGNwdV90b19sZTMy
KGlub2RlLT5pX25saW5rKTsKPiA+ID4+Pj4+ICAgICAgICAgcmktPmlfYmxvY2tzID0gY3B1X3Rv
X2xlNjQoU0VDVE9SX1RPX0JMT0NLKGlub2RlLT5pX2Jsb2NrcykgKyAxKTsKPiA+ID4+Pj4+IC0K
PiA+ID4+Pj4+IC0gICAgIGlmICghZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkgfHwKPiA+ID4+
Pj4+IC0gICAgICAgICAgICAgICAgICAgICBpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRP
TUlDX0NPTU1JVFRFRCkpCj4gPiA+Pj4+PiAtICAgICAgICAgICAgIHJpLT5pX3NpemUgPSBjcHVf
dG9fbGU2NChpX3NpemVfcmVhZChpbm9kZSkpOwo+ID4gPj4+Pj4gKyAgICAgcmktPmlfc2l6ZSA9
IGNwdV90b19sZTY0KGlfc2l6ZV9yZWFkKGlub2RlKSk7Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gICAg
ICAgICBpZiAoZXQpIHsKPiA+ID4+Pj4+ICAgICAgICAgICAgICAgICByZWFkX2xvY2soJmV0LT5s
b2NrKTsKPiA+ID4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMv
c2VnbWVudC5jCj4gPiA+Pj4+PiBpbmRleCA3OGMzMTk4YTYzMDguLjJiNTM5MWIyMjlhOCAxMDA2
NDQKPiA+ID4+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4gPiA+Pj4+PiArKysgYi9mcy9m
MmZzL3NlZ21lbnQuYwo+ID4gPj4+Pj4gQEAgLTE5Niw5ICsxOTYsMTIgQEAgdm9pZCBmMmZzX2Fi
b3J0X2F0b21pY193cml0ZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBib29sIGNsZWFuKQo+ID4gPj4+
Pj4gICAgICAgICAgICAgICAgIHRydW5jYXRlX2lub2RlX3BhZ2VzX2ZpbmFsKGlub2RlLT5pX21h
cHBpbmcpOwo+ID4gPj4+Pj4KPiA+ID4+Pj4+ICAgICAgICAgcmVsZWFzZV9hdG9taWNfd3JpdGVf
Y250KGlub2RlKTsKPiA+ID4+Pj4+IC0gICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FU
T01JQ19DT01NSVRURUQpOwo+ID4gPj4+Pj4gICAgICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2Rl
LCBGSV9BVE9NSUNfUkVQTEFDRSk7Cj4gPiA+Pj4+PiAgICAgICAgIGNsZWFyX2lub2RlX2ZsYWco
aW5vZGUsIEZJX0FUT01JQ19GSUxFKTsKPiA+ID4+Pj4+ICsgICAgIGlmIChpc19pbm9kZV9mbGFn
X3NldChpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpKSB7Cj4gPiA+Pj4+PiArICAgICAgICAgICAg
IGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsKPiA+ID4+Pj4+ICsg
ICAgICAgICAgICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+ID4g
Pj4+Pj4gKyAgICAgfQo+ID4gPj4+Pj4gICAgICAgICBzdGF0X2RlY19hdG9taWNfaW5vZGUoaW5v
ZGUpOwo+ID4gPj4+Pj4KPiA+ID4+Pj4+ICAgICAgICAgRjJGU19JKGlub2RlKS0+YXRvbWljX3dy
aXRlX3Rhc2sgPSBOVUxMOwo+ID4gPj4+Pj4gQEAgLTM2NSw3ICszNjgsMTAgQEAgc3RhdGljIGlu
dCBfX2YyZnNfY29tbWl0X2F0b21pY193cml0ZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4gPj4+
Pj4gICAgICAgICAgICAgICAgIHNiaS0+cmV2b2tlZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21p
Y193cml0ZV9jbnQ7Cj4gPiA+Pj4+PiAgICAgICAgIH0gZWxzZSB7Cj4gPiA+Pj4+PiAgICAgICAg
ICAgICAgICAgc2JpLT5jb21taXR0ZWRfYXRvbWljX2Jsb2NrICs9IGZpLT5hdG9taWNfd3JpdGVf
Y250Owo+ID4gPj4+Pj4gLSAgICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRP
TUlDX0NPTU1JVFRFRCk7Cj4gPiA+Pj4+PiArICAgICAgICAgICAgIGlmIChpc19pbm9kZV9mbGFn
X3NldChpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpKSB7Cj4gPiA+Pj4+PiArICAgICAgICAgICAg
ICAgICAgICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+ID4g
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlu
b2RlLCB0cnVlKTsKPiA+ID4+Pj4+ICsgICAgICAgICAgICAgfQo+ID4gPj4+Pj4gICAgICAgICB9
Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gICAgICAgICBfX2NvbXBsZXRlX3Jldm9rZV9saXN0KGlub2Rl
LCAmcmV2b2tlX2xpc3QsIHJldCA/IHRydWUgOiBmYWxzZSk7Cj4gPiA+Pj4+Cj4gPiA+Pgo+ID4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==

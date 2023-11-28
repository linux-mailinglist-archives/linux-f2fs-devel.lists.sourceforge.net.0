Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 103757FBA85
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 13:52:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7xZo-0007Ih-4L;
	Tue, 28 Nov 2023 12:52:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wubo.oduw@gmail.com>) id 1r7xZk-0007Ib-7r
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 12:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n6bad8B9cC8RrYfgSYXaycNnUCy6f5+O9t/rtKgIGic=; b=DYRIhKBjQfeWc/d+g9KTf9abPs
 WraH4SWPHqbhX7ZnU1dedDOa7BZKiLJVqphfa4jRTbO9oNu/SeDcwuMIfpr2RIyLXNGN9yGBOoaL4
 3Gh4G799AX8MGkPAolT+6sI41fUtpZcs3kn43kqLytYV1+Z2xTAkTKyXnyuyW3SNwdcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n6bad8B9cC8RrYfgSYXaycNnUCy6f5+O9t/rtKgIGic=; b=S2SWDK1UbMSU1WODchTwEx8tnW
 U85hTwxKM8/8w39heA4vXB260Dk4L6Byc0U73fpJ9/Pw0qHH+BoRUjUm+Su/NP5rvVw8kuN4EuABB
 VMNZG6G501ji5KfwYs7pp+EjtSfu7ohppIViJmOe3K+9fgt37krRupoVrOIzItTFP+40=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r7xZT-0004fB-IO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 12:52:18 +0000
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6cbd24d9557so3898504b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Nov 2023 04:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701175921; x=1701780721; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n6bad8B9cC8RrYfgSYXaycNnUCy6f5+O9t/rtKgIGic=;
 b=G1hZMN3O1WFr4zy3G7fCQ1dCoQOzkj32D1qjC6SefvoqnllA8kBw2iP+i+USyL5m6x
 RdSnKzSVi4G625nqPx09pKn83fJpjC0JsOTarmjR/SdFQNVn+7pkPFQxXIO17FqgTjYw
 TFFysc2qNeYdLkQ7ymj8Gpg9f9lxBo2JKh4gI/g5dZN9tY1MEsLxghQFjA9Tj6Pkdfk0
 ue5x8ZgIsfc9mJcVuxqt7VVsPsSrNvdCD/596un+O9/WMnGcgyTjGjuA5TkD6cYZUCpP
 L695cMB7I8Jquaa8dzXl5spQm43NCpsyBOihBhVF8dQ9eBJ1p6LgFJfH4o8KGRmcqMLO
 sf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701175921; x=1701780721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n6bad8B9cC8RrYfgSYXaycNnUCy6f5+O9t/rtKgIGic=;
 b=aMwpjd6lCmk1+RIaBvh5kGqv1vD/KqBV75ulbg+l3S0DSXrWaNAX+stYyB44mlUxAU
 y9UXJFKZzIvH9AJgK5wtUIuyb7JWpa0xZerfKuio0aLuYhT+TI/d1O/8NdLWaXxpe558
 Pb9PTQz2O7blzTY88ClB2/LXTNCQv6V+MGHZ9P/kG5V4wFjFWbUUrmukva3xVGbEB/xK
 jK6vHK1KmIUBWi+V9HeXnXBJUCQC/GMu0PBJoEfhBHFwYQPK2+ZDxeZue1UxkNdhGVgx
 Sjrt8NLh4q7erGVMl8dMOs1WjgYEtOKU/9b/NC+waVB+hT3zbsBQiSUtjqrY/nfo+rNg
 FlOA==
X-Gm-Message-State: AOJu0YxPYgKQk4IT5abhRN2AWx2wIwnlENs5Ol0rjwdPQR3h1/fDnAeM
 feqqmhqMRGkTabWNf1iaFb729V+yWDN6Mud4
X-Google-Smtp-Source: AGHT+IGLkiODPCwRZXjMdtXwC1kEWYOvJD+XcGHfXzi0SYejT/y9lrwY9jYwCktE88T4f6EHr6+Gug==
X-Received: by 2002:a62:ab02:0:b0:6c3:450f:2b64 with SMTP id
 p2-20020a62ab02000000b006c3450f2b64mr24271982pff.6.1701175920751; 
 Tue, 28 Nov 2023 04:52:00 -0800 (PST)
Received: from [192.168.50.127] (awork111197.netvigator.com. [203.198.94.197])
 by smtp.gmail.com with ESMTPSA id
 fi35-20020a056a0039a300b006c2d53e0b5fsm8870942pfb.57.2023.11.28.04.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 04:52:00 -0800 (PST)
Message-ID: <eedad403-5754-4d5e-965d-19eff02e3d40@gmail.com>
Date: Tue, 28 Nov 2023 20:51:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Chao Yu <chao@kernel.org>, Wu Bo <bo.wu@vivo.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231030094024.263707-1-bo.wu@vivo.com>
 <c181256e-9f6e-d43e-4d02-a7d8d5286d56@kernel.org>
 <670ce4a6-f00c-dbe9-86e2-366311221cf3@gmail.com>
 <a69b7544-2312-486c-d655-8b86e370c55e@kernel.org>
 <faa90acc-c03e-2913-c19a-bd50fd93d197@gmail.com>
 <5d8726fc-e912-6954-3820-862eecff07b0@kernel.org>
From: Wu Bo <wubo.oduw@gmail.com>
In-Reply-To: <5d8726fc-e912-6954-3820-862eecff07b0@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/28 14:22, Chao Yu wrote: > On 2023/11/17 7:34,
 Wu Bo wrote: >> On 2023/11/11 12:49, Chao Yu wrote: >>> On 2023/11/8 21:48,
 Wu Bo wrote: >>>> On 2023/11/7 22:39, Chao Yu wrote: >>>>> On 2023 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.176 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wubo.oduw[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r7xZT-0004fB-IO
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

Ck9uIDIwMjMvMTEvMjggMTQ6MjIsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMy8xMS8xNyA3OjM0
LCBXdSBCbyB3cm90ZToKPj4gT24gMjAyMy8xMS8xMSAxMjo0OSwgQ2hhbyBZdSB3cm90ZToKPj4+
IE9uIDIwMjMvMTEvOCAyMTo0OCwgV3UgQm8gd3JvdGU6Cj4+Pj4gT24gMjAyMy8xMS83IDIyOjM5
LCBDaGFvIFl1IHdyb3RlOgo+Pj4+PiBPbiAyMDIzLzEwLzMwIDE3OjQwLCBXdSBCbyB3cm90ZToK
Pj4+Pj4+IElmIEdDIHZpY3RpbSBoYXMgcGlubmVkIGJsb2NrLCBpdCBjYW4ndCBiZSByZWN5Y2xl
ZC4KPj4+Pj4+IEFuZCBpZiBHQyBpcyBmb3JlZ3JvdW5kIHJ1bm5pbmcsIGFmdGVyIG1hbnkgZmFp
bHVyZSB0cnksIHRoZSAKPj4+Pj4+IHBpbm5lZCBmaWxlCj4+Pj4+PiBpcyBleHBlY3RlZCB0byBi
ZSBjbGVhciBwaW4gZmxhZy4gVG8gZW5hYmxlIHRoZSBzZWN0aW9uIGJlIHJlY3ljbGVkLgo+Pj4+
Pj4KPj4+Pj4+IEJ1dCB3aGVuIGZhbGxvY2F0ZSB0cmlnZ2VyIEZHX0dDLCBHQyBjYW4gbmV2ZXIg
cmVjeWNsZSB0aGUgcGlubmVkCj4+Pj4+PiBzZWN0aW9uLiBCZWNhdXNlIEdDIHdpbGwgZ28gdG8g
c3RvcCBiZWZvcmUgdGhlIGZhaWx1cmUgdHJ5IG1lZXQgdGhlCj4+Pj4+PiB0aHJlc2hvbGQ6Cj4+
Pj4+PiDCoMKgwqDCoMKgaWYgKGhhc19lbm91Z2hfZnJlZV9zZWNzKHNiaSwgc2VjX2ZyZWVkLCAw
KSkgewo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWdjX2NvbnRyb2wtPm5vX2JnX2djICYm
Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdG90YWxfc2VjX2ZyZWVkIDwgZ2NfY29u
dHJvbC0+bnJfZnJlZV9zZWNzKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
Z29fZ2NfbW9yZTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgZ290byBzdG9wOwo+Pj4+Pj4gwqDC
oMKgwqDCoH0KPj4+Pj4+Cj4+Pj4+PiBTbyB3aGVuIGZhbGxvY2F0ZSB0cmlnZ2VyIEZHX0dDLCBh
dCBsZWFzdCByZWN5Y2xlIG9uZS4KPj4+Pj4KPj4+Pj4gSG1tLi4uIGl0IG1heSBicmVhayBwaW5m
aWxlJ3Mgc2VtYW50aWNzIGF0IGxlYXN0IG9uIG9uZSBwaW5uZWQgZmlsZT8KPj4+Pj4gSW4gdGhp
cyBjYXNlLCBJIHByZWZlciB0byBmYWlsIGZhbGxvY2F0ZSgpIHJhdGhlciB0aGFuIHVucGlubmlu
ZyAKPj4+Pj4gZmlsZSwKPj4+Pj4gaW4gb3JkZXIgdG8gYXZvaWQgbGVhdmluZyBpbnZhbGlkIExC
QSByZWZlcmVuY2VzIG9mIHVucGlubmVkIGZpbGUgCj4+Pj4+IGhlbGQKPj4+Pj4gYnkgdXNlcnNw
YWNlLgo+Pj4+Cj4+Pj4gQXMgZjJmcyBkZXNpZ25lZCBub3csIEZHX0dDIGlzIGFibGUgdG8gdW5w
aW4gdGhlIHBpbm5lZCBmaWxlLgo+Pj4+Cj4+Pj4gZmFsbG9jYXRlKCkgdHJpZ2dlcmVkIEZHX0dD
LCBidXQgY2FuJ3QgcmVjeWNsZSBzcGFjZS7CoCBJdCBicmVha3MgdGhlCj4+Pj4gZGVzaWduIGxv
Z2ljIG9mIEZHX0dDLgo+Pj4KPj4+IFllcywgY29udHJhZGljdG9yaW5lc3MgZXhpc3RzLgo+Pj4K
Pj4+IElNTywgdW5waW4gZmlsZSBieSBHQyBsb29rcyBtb3JlIGRhbmdlcm91cywgaXQgbWF5IGNh
dXNlIHBvdGVudGlhbCBkYXRhCj4+PiBjb3JydXB0aW9uIHcvIGJlbG93IGNhc2U6Cj4+PiAxLiBh
cHAgcGlucyBmaWxlICYgaG9sZHMgTEJBcyBvZiBkYXRhIGJsb2Nrcy4KPj4+IDIuIEdDIHVucGlu
cyBmaWxlIGFuZCBtaWdyYXRlcyBpdHMgZGF0YSB0byBuZXcgTEJBcy4KPj4+IDMuIG90aGVyIGZp
bGUgcmV1c2VzIHByZXZpb3VzIExCQXMuCj4+PiA0LiBhcHAgcmVhZC93cml0ZSBkYXRhIHZpYSBw
cmV2aW91cyBMQkFzLgo+Pj4KPj4+IFNvIEkgc3VnZ2VzdCB0byBub3JtYWxpemUgdXNlIG9mIHBp
bmZpbGUgYW5kIGRvIG5vdCBhZGQgbW9yZSB1bnBpbiAKPj4+IGNhc2VzCj4+PiBpbiBmaWxlc3lz
dGVtIGlubmVyIHByb2Nlc3Nlcy4KPj4+Cj4+Pj4KPj4+PiBUaGlzIGlzc3VlIGlzIGhhcHBlbmVk
IGluIEFuZHJvaWQgT1RBIHNjZW5hcmlvLsKgIGZhbGxvY2F0ZSgpIGFsd2F5cwo+Pj4+IHJldHVy
biBmYWlsdXJlIGNhdXNlIE9UQSBmYWlsLgo+Pj4KPj4+IENhbiB5b3UgcGxlYXNlIGNoZWNrIHdo
eSBvdGhlciBwaW5uZWQgZmlsZXMgd2VyZSBzbyBmcmFnbWVudGVkIHRoYXQgCj4+PiBmMmZzX2dj
KCkKPj4+IGNhbiBub3QgcmVjeWNsZSBvbmUgZnJlZSBzZWN0aW9uPwo+Pj4KPj4gTm90IGJlY2F1
c2UgcGlubmVkIGZpbGVzIHdlcmUgZnJhZ21lbnRlZCwgYnV0IGlmIHRoZSBHQyB2aWN0aW0gCj4+
IHNlY3Rpb24gaGFzIG9uZSBibG9jayBpcyBwaW5uZWQgd2lsbCBjYXVzZSB0aGlzIGlzc3VlLgo+
Pgo+PiBJZiB0aGUgc2VjdGlvbiBkb24ndCB1bnBpbiB0aGUgYmxvY2ssIGl0IGNhbid0IGJlIHJl
Y3ljbGVkLiBCdXQgdGhlcmUgCj4+IGlzIGhpZ2ggY2hhbmNlIHRoYXQgdGhlIHBpbm5lZCBzZWN0
aW9uIHdpbGwgYmUgY2hvc2VuIG5leHQgdGltZSB1bmRlciAKPj4gZjJmcyBjdXJyZW50IHZpY3Rp
bSBzZWxlY3Rpb24gc3RyYXRlZ3kuCj4+Cj4+IFNvIGlmIHdlIHdhbnQgdG8gYXZvaWQgdW5waW4g
ZmlsZXMsIEkgdGhpbmsgY2hhbmdlIHZpY3RpbSBzZWxlY3Rpb24gCj4+IHRvIGNvbnNpZGVyaW5n
IHBpbm5lZCBibG9ja3MgY2FuIGZpeCB0aGlzIGlzc3VlLgo+Cj4gT2gsIEkgZ2V0IGl0Lgo+Cj4g
SG93IGFib3V0IHRoaXM/Cj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZz
L2ZpbGUuYwo+IGluZGV4IDMyNWRhYjAxYTI5ZC4uM2ZiNTJkZWM1ZGY4IDEwMDY0NAo+IC0tLSBh
L2ZzL2YyZnMvZmlsZS5jCj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiBAQCAtMTczMCw3ICsxNzMw
LDEwIEBAIG5leHRfYWxsb2M6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZG93bl93
cml0ZSgmc2JpLT5nY19sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdF9pbmNf
Z2NfY2FsbF9jb3VudChzYmksIEZPUkVHUk9VTkQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBlcnIgPSBmMmZzX2djKHNiaSwgJmdjX2NvbnRyb2wpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChlcnIgJiYgZXJyICE9IC1FTk9EQVRBKQo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoZXJyID09IC1FQUdBSU4pCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmMmZzX2JhbGFuY2VfZnMoc2JpLCB0cnVlKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
bHNlIGlmIChlcnIgJiYgZXJyICE9IC1FTk9EQVRBKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gb3V0X2VycjsKPiDCoMKgwqDCoMKgwqDCoMKgIH0KRG8geW91IG1lYW4g
dG8gY2FsbCBmMmZzX2JhbGFuY2VfZnMoKSB0byByZWN5Y2xlIG9uZSBzZWN0aW9uPwpCdXQgaW4g
dGhpcyBzaXR1YXRpb24sIGYyZnNfYmFsYW5jZV9mcygpIHdpbGwgcmV0dXJuIGF0IAplbm91Z2gt
ZnJlZS1zZWN0aW9uIGNoZWNrOgogwqDCoMKgIGlmIChoYXNfZW5vdWdoX2ZyZWVfc2VjcyhzYmks
IDAsIDApKQogwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Cj4gSG93ZXZlciwgdGhlIGNvZGUgd29u
J3QgZml4IGNvbnRyYWRpY3RvcmluZXNzIGlzc3VlLCBiZWNhdXNlIHRoZSByb290IAo+IGNhdXNl
Cj4gaXMgd2UgbGVmdCBmcmFnbWVudGVkIHBpbm5lZCBkYXRhIGluIGZpbGVzeXN0ZW0sIHdoaWNo
IHNob3VsZCBiZSAKPiBhdm9pZGVkIGluCj4gR0MtcmVsaWFuY2UgTEZTIGZpbGVzeWV0ZW0gYXMg
bXVjaCBhcyBwb3NzaWJsZS4KPgo+IFRoYW5rcywKPgo+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+Pgo+
Pj4+IMKgIMKgQW5kIHRoaXMgY29tbWl0IGNoYW5nZWQgcHJldmlvdXMgYmVoYXZpb3Igb2YgZmFs
bG9jYXRlKCk6Cj4+Pj4KPj4+PiBDb21taXQgMmU0MmI3ZjgxN2FjICgiZjJmczogc3RvcCBhbGxv
Y2F0aW5nIHBpbm5lZCBzZWN0aW9ucyBpZiBFQUdBSU4KPj4+PiBoYXBwZW5zIikKPj4+Pgo+Pj4+
IEJlZm9yZSB0aGlzIGNvbW1pdCwgaWYgZmFsbG9jYXRlKCkgbWVldCB0aGlzIHNpdHVhdGlvbiwg
aXQgd2lsbCAKPj4+PiB0cmlnZ2VyCj4+Pj4gRkdfR0MgdG8gcmVjeWNsZSBwaW5uZWQgc3BhY2Ug
ZmluYWxseS4KPj4+Pgo+Pj4+IEZHX0dDIGlzIGV4cGVjdGVkIHRvIHJlY3ljbGUgcGlubmVkIHNw
YWNlIHdoZW4gdGhlcmUgaXMgbm8gbW9yZSBmcmVlCj4+Pj4gc3BhY2UuwqAgQW5kIHRoaXMgaXMg
dGhlIHJpZ2h0IHRpbWUgdG8gZG8gaXQgd2hlbiBmYWxsb2NhdGUoKSBuZWVkIGZyZWUKPj4+PiBz
cGFjZS4KPj4+Pgo+Pj4+IEl0IGlzIHdlaXJkIHdoZW4gZjJmcyBzaG93cyBlbm91Z2ggc3BhcmUg
c3BhY2UgYnV0IGNhbid0IAo+Pj4+IGZhbGxvY2F0ZSgpLiBTbwo+Pj4+IEkgdGhpbmsgaXQgc2hv
dWxkIGJlIGZpeGVkLgo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRob3VnaHRzPwo+Pj4+Pgo+Pj4+PiBUaGFu
a3MsCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBpc3N1ZSBjYW4gYmUgcmVwcm9kdWNlZCBieSBm
aWxsaW5nIGYyZnMgc3BhY2UgYXMgZm9sbG93aW5nIAo+Pj4+Pj4gbGF5b3V0Lgo+Pj4+Pj4gRXZl
cnkgc2VnbWVudCBoYXMgb25lIGJsb2NrIGlzIHBpbm5lZDoKPj4+Pj4+ICstKy0rLSstKy0rLSst
LS0tLSstKwo+Pj4+Pj4gfCB8IHxwfCB8IHwgfCAuLi4gfCB8IHNlZ19uCj4+Pj4+PiArLSstKy0r
LSstKy0rLS0tLS0rLSsKPj4+Pj4+ICstKy0rLSstKy0rLSstLS0tLSstKwo+Pj4+Pj4gfCB8IHxw
fCB8IHwgfCAuLi4gfCB8IHNlZ19uKzEKPj4+Pj4+ICstKy0rLSstKy0rLSstLS0tLSstKwo+Pj4+
Pj4gLi4uCj4+Pj4+PiArLSstKy0rLSstKy0rLS0tLS0rLSsKPj4+Pj4+IHwgfCB8cHwgfCB8IHwg
Li4uIHwgfCBzZWdfbitrCj4+Pj4+PiArLSstKy0rLSstKy0rLS0tLS0rLSsKPj4+Pj4+Cj4+Pj4+
PiBBbmQgZm9sbG93aW5nIGFyZSBzdGVwcyB0byByZXByb2R1Y2UgdGhpcyBpc3N1ZToKPj4+Pj4+
IGRkIGlmPS9kZXYvemVybyBvZj0uL2YyZnNfcGluLmltZyBicz0yTSBjb3VudD0xMDI0Cj4+Pj4+
PiBta2ZzLmYyZnMgZjJmc19waW4uaW1nCj4+Pj4+PiBta2RpciBmMmZzCj4+Pj4+PiBtb3VudCBm
MmZzX3Bpbi5pbWcgLi9mMmZzCj4+Pj4+PiBjZCBmMmZzCj4+Pj4+PiBkZCBpZj0vZGV2L3plcm8g
b2Y9Li9sYXJnZV9wYWRkaW5nIGJzPTFNIGNvdW50PTE3NjAKPj4+Pj4+IC4vcGluX2ZpbGxpbmcu
c2gKPj4+Pj4+IHJtIHBhZGRpbmcqCj4+Pj4+PiBzeW5jCj4+Pj4+PiB0b3VjaCBmYWxsb2NhdGVf
NDBtCj4+Pj4+PiBmMmZzX2lvIHBpbmZpbGUgc2V0IGZhbGxvY2F0ZV80MG0KPj4+Pj4+IGZhbGxv
Y2F0ZSAtbCA0MTk0MzA0MCBmYWxsb2NhdGVfNDBtCj4+Pj4+Pgo+Pj4+Pj4gZmFsbG9jYXRlIGFs
d2F5cyBmYWlsIHdpdGggRUFHQUlOIGV2ZW4gdGhlcmUgaGFzIGVub3VnaCBmcmVlIHNwYWNlLgo+
Pj4+Pj4KPj4+Pj4+ICdwaW5fZmlsbGluZy5zaCcgaXM6Cj4+Pj4+PiBjb3VudD0xCj4+Pj4+PiB3
aGlsZSA6Cj4+Pj4+PiBkbwo+Pj4+Pj4gwqDCoMKgwqDCoCAjIGZpbGxpbmcgdGhlIHNlZyBzcGFj
ZQo+Pj4+Pj4gwqDCoMKgwqDCoCBmb3IgaSBpbiB7MS4uNTExfToKPj4+Pj4+IMKgwqDCoMKgwqAg
ZG8KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1lPXBhZGRpbmdfJGNvdW50LSRpCj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZWNobyB3cml0ZSAkbmFtZQo+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGRkIGlmPS9kZXYvemVybyBvZj0uLyRuYW1lIGJzPTRLIGNvdW50PTEgPiAvZGV2L251
bGwgMj4mMQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIFsgJD8gLW5lIDAgXTsgdGhlbgo+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleGl0IDAKPj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBmaQo+Pj4+Pj4gwqDCoMKgwqDCoCBkb25lCj4+Pj4+PiDCoMKgwqDC
oMKgIHN5bmMKPj4+Pj4+Cj4+Pj4+PiDCoMKgwqDCoMKgICMgcGluIG9uZSBibG9jayBpbiBhIHNl
Z21lbnQKPj4+Pj4+IMKgwqDCoMKgwqAgbmFtZT1waW5fZmlsZSRjb3VudAo+Pj4+Pj4gwqDCoMKg
wqDCoCBkZCBpZj0vZGV2L3plcm8gb2Y9Li8kbmFtZSBicz00SyBjb3VudD0xID4gL2Rldi9udWxs
IDI+JjEKPj4+Pj4+IMKgwqDCoMKgwqAgc3luYwo+Pj4+Pj4gwqDCoMKgwqDCoCBmMmZzX2lvIHBp
bmZpbGUgc2V0ICRuYW1lCj4+Pj4+PiDCoMKgwqDCoMKgIGNvdW50PSQoKCRjb3VudCArIDEpKQo+
Pj4+Pj4gZG9uZQo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFd1IEJvIDxiby53dUB2aXZv
LmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqDCoCBmcy9mMmZzL2ZpbGUuYyB8IDIgKy0KPj4+Pj4+
IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+
Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+
Pj4+IGluZGV4IGNhNTkwNDEyOWIxNi4uZThhMTM2MTY1NDNmIDEwMDY0NAo+Pj4+Pj4gLS0tIGEv
ZnMvZjJmcy9maWxlLmMKPj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+PiBAQCAtMTY5
MCw3ICsxNjkwLDcgQEAgc3RhdGljIGludCBmMmZzX2V4cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCBp
bm9kZQo+Pj4+Pj4gKmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAuaW5pdF9nY190eXBlID0gRkdfR0MsCj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5zaG91bGRfbWlncmF0ZV9ibG9ja3MgPSBmYWxzZSwKPj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmVycl9nY19za2lwcGVkID0gdHJ1ZSwKPj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5ucl9mcmVlX3NlY3MgPSAwIH07Cj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAubnJfZnJlZV9zZWNzID0gMSB9Owo+Pj4+Pj4gwqDCoMKgwqDC
oMKgIHBnb2ZmX3QgcGdfc3RhcnQsIHBnX2VuZDsKPj4+Pj4+IMKgwqDCoMKgwqDCoCBsb2ZmX3Qg
bmV3X3NpemU7Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgbG9mZl90IG9mZl9lbmQ7CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

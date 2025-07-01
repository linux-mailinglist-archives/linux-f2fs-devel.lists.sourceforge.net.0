Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 479FBAEED0B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 05:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xoJ5cuhmPHVwvHsgx9F11O1uGepVn6AkSzh/3s6l78=; b=RBP3iOmqvdSWWXEKT87qRN0qSc
	XzSk7CdYA9Hjvp/b9UlYqHMBj9S2JnHNQphgj7V4eY66+Gw0u0EyTC+zhqYUzqcVXFqwRPEhp950k
	nvrERjksreNdwBPKQ8VmngJF75M+oGQIjWyMEgNppPjBT+OBUhwrEkNqWA2jerYPsUDs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWRqH-0003DO-Pw;
	Tue, 01 Jul 2025 03:39:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uWRqG-0003DI-NW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 03:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y1vACW2YBkZPReTzlIzlM4dU/XJuLpIAlsQKxj+Nl/8=; b=XCU++78o6Pp0F1mMj5n4SQkgz3
 6fTbqqeouswdtvwq97IpQCoTut1AvJI2YZYdiDmHJuJEoNblEj2pLpsJmnwIyP/eD2I+lAqAoDaIp
 EL7nTUQwhERtXx3rvFpT+sXmMRLGSVFzuVOKMIv4wcg976NDkqygHeNoyaWHQMx1zCnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y1vACW2YBkZPReTzlIzlM4dU/XJuLpIAlsQKxj+Nl/8=; b=DMaIuLRUJalk9/22N4q1Uz/tWQ
 ek0x/4W3FUUqT1ujWzE1B0A+wfdYTodevXi3fRNV/EceeOei6NKJEpF1elIdq2M/cHUBhduWiXiMM
 RQZQGVw38qXOIVoxZSY87vdlm4YpBlK0p/DS4MTPo04Ao+XPfB4vZ6RhcfuUSRhc6Usg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWRqG-0008OW-4w for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 03:39:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C482243606;
 Tue,  1 Jul 2025 03:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A947C4CEED;
 Tue,  1 Jul 2025 03:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751341161;
 bh=MOn6WxZiOzMLvzZ6XMR6aWTrK4xGHmMPAiNJt6rzB68=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Hn19zjvcKzFacDvOGS4nKrs84bUKkc9D2B09VzPlaHYlr+E2EVjylvhuvhy/nsM2l
 K8l3EO0uh2Jux3uBg0WtzHPxKPfGAaEZ0RWoWAqIZguEM6ZwZ+Il2ZiMiF9kdHksKM
 dlX63B20NIDnc8av4JYTBqhcIKRSY4pVvWOJvBzpxxQsfXJkHKAya/3TeTLYj+6vBb
 AkCa1IpaOHO5jy3GG160znsMuhz5Q8yJVmcxtARyfW1nrIu3ZJxanXrOKgAbHPVwtk
 UcL3fT13OZBEMODMDGSN2LpesV9P6489RNwu3F8cMhzFNPCEMmCoRnXpwfHPNWqCuz
 FvGaN+7bdbQ+g==
Message-ID: <8b0c3ab6-6285-4a92-887e-770473062474@kernel.org>
Date: Tue, 1 Jul 2025 11:39:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>
References: <20250615144235.1836469-1-chullee@google.com>
 <20250615144235.1836469-3-chullee@google.com>
 <c8389c1a-16d2-4de4-bc3f-7a5e4ccdbc34@kernel.org>
 <CALBjLoB6+FgWJMqKPN1o1bpeYWB-d-7BWtGbYPo18fcFWZqEkw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CALBjLoB6+FgWJMqKPN1o1bpeYWB-d-7BWtGbYPo18fcFWZqEkw@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/1/25 06:56, Daniel Lee wrote: > On Mon, Jun 16, 2025
 at 5:50 AM Chao Yu <chao@kernel.org> wrote: >> >> On 6/15/25 22:42, Daniel
 Lee wrote: >>> Apply the `ioprio_hint` to set `F2FS_IOPRIO_WRITE` p [...]
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWRqG-0008OW-4w
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: use ioprio hint for hot and
 pinned files
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNy8xLzI1IDA2OjU2LCBEYW5pZWwgTGVlIHdyb3RlOgo+IE9uIE1vbiwgSnVuIDE2LCAyMDI1
IGF0IDU6NTDigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiA2
LzE1LzI1IDIyOjQyLCBEYW5pZWwgTGVlIHdyb3RlOgo+Pj4gQXBwbHkgdGhlIGBpb3ByaW9faGlu
dGAgdG8gc2V0IGBGMkZTX0lPUFJJT19XUklURWAgcHJpb3JpdHkKPj4+IG9uIGZpbGVzIGlkZW50
aWZpZWQgYXMgImhvdCIgYXQgY3JlYXRpb24gYW5kIG9uIGZpbGVzIHRoYXQgYXJlCj4+PiBwaW5u
ZWQgdmlhIGlvY3RsLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMZWUgPGNodWxsZWVA
Z29vZ2xlLmNvbT4KPj4+IC0tLQo+Pj4gIGZzL2YyZnMvZjJmcy5oICB8IDE5ICsrKysrKysrKysr
KysrKysrKysKPj4+ICBmcy9mMmZzL2ZpbGUuYyAgfCAgMyArKysKPj4+ICBmcy9mMmZzL25hbWVp
LmMgfCAxMSArKysrKysrLS0tLQo+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9m
cy9mMmZzL2YyZnMuaAo+Pj4gaW5kZXggM2UwMjY4N2MxYjU4Li4wYzRmNTI4OTJmZjcgMTAwNjQ0
Cj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+IEBA
IC0zNDQwLDYgKzM0NDAsMjUgQEAgc3RhdGljIGlubGluZSB2b2lkIHNldF9maWxlKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIGludCB0eXBlKQo+Pj4gICAgICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5
bmMoaW5vZGUsIHRydWUpOwo+Pj4gIH0KPj4+Cj4+PiArc3RhdGljIGlubGluZSBpbnQgZ2V0X2lv
cHJpbyhzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4gK3sKPj4+ICsgICAgIHJldHVybiBGMkZTX0ko
aW5vZGUpLT5pb3ByaW9faGludDsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGljIGlubGluZSB2b2lk
IHNldF9pb3ByaW8oc3RydWN0IGlub2RlICppbm9kZSwgaW50IGxldmVsKQo+Pj4gK3sKPj4+ICsg
ICAgIGlmIChnZXRfaW9wcmlvKGlub2RlKSA9PSBsZXZlbCkKPj4+ICsgICAgICAgICAgICAgcmV0
dXJuOwo+Pj4gKyAgICAgRjJGU19JKGlub2RlKS0+aW9wcmlvX2hpbnQgPSBsZXZlbDsKPj4+ICt9
Cj4+PiArCj4+PiArc3RhdGljIGlubGluZSB2b2lkIGNsZWFyX2lvcHJpbyhzdHJ1Y3QgaW5vZGUg
Kmlub2RlKQo+Pj4gK3sKPj4+ICsgICAgIGlmIChnZXRfaW9wcmlvKGlub2RlKSA9PSAwKQo+Pj4g
KyAgICAgICAgICAgICByZXR1cm47Cj4+PiArICAgICBGMkZTX0koaW5vZGUpLT5pb3ByaW9faGlu
dCA9IDA7Cj4+PiArfQo+Pj4gKwo+Pj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBjbGVhcl9maWxlKHN0
cnVjdCBpbm9kZSAqaW5vZGUsIGludCB0eXBlKQo+Pj4gIHsKPj4+ICAgICAgIGlmICghaXNfZmls
ZShpbm9kZSwgdHlwZSkpCj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZz
L2ZpbGUuYwo+Pj4gaW5kZXggM2ViNDBkN2JmNjAyLi5hMThmYjdmM2QwMTkgMTAwNjQ0Cj4+PiAt
LS0gYS9mcy9mMmZzL2ZpbGUuYwo+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4+IEBAIC0zNDk2
LDYgKzM0OTYsNyBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3NldF9waW5fZmlsZShzdHJ1Y3QgZmls
ZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4+Pgo+Pj4gICAgICAgaWYgKCFwaW4pIHsKPj4+
ICAgICAgICAgICAgICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfUElOX0ZJTEUpOwo+Pj4g
KyAgICAgICAgICAgICBjbGVhcl9pb3ByaW8oaW5vZGUpOwo+Pgo+PiBJIGd1ZXNzIHRoZXJlIGFy
ZSBtb3JlIHBsYWNlcyBjbGVhcmluZyBGSV9QSU5fRklMRT8gd2UgbmVlZCB0byBjb3Zlcgo+PiB0
aGVtIGFsbD8KPiAKPiBZZXMsIHlvdSdyZSByaWdodC4gRklfUElOX0ZJTEUgaXMgdG9nZ2xlZCBp
biBzZXZlcmFsIHBsYWNlcy4gSG93ZXZlciwKPiB0aGlzIGNoYW5nZSBpcyBpbnRlbmRlZCB0byBz
ZXQgdGhlIEhPVCBhbmQgSU9QUklPIG9uIHRoZSBmaWxlcyB0aGF0Cj4gdXNlcnMgZXhwbGljaXRs
eSBwaW4gdGhyb3VnaCBJT0NUTC4gVGhlIG90aGVyIGtlcm5lbCBpbnRlcm5hbAo+IG1lY2hhbmlz
bXMgKGUuZy4sIHN3YXAgb3IgZ2NfZmFpbHVyZXMpIHJlbWFpbiB0aGUgc2FtZS4gQXJlIHRoZXJl
IGFueQo+IHBvdGVudGlhbCBpc3N1ZXMgdGhhdCBJIHNob3VsZCBjb25zaWRlcj8KCkRhbmllbCwK
Ck5vdCBzdXJlLCBqdXN0IG5vdGljZSB0aGF0IGl0IHNlZW1zIEZJX1BJTl9GSUxFIGFuZCBJT1BS
SU8gYXJlIG5vdApzZXQvdW5zZXQgdG9nZXRoZXIgYWx3YXlzLgoKPiAKPiAgPgo+Pj4gICAgICAg
ICAgICAgICBmMmZzX2lfZ2NfZmFpbHVyZXNfd3JpdGUoaW5vZGUsIDApOwo+Pj4gICAgICAgICAg
ICAgICBnb3RvIGRvbmU7Cj4+PiAgICAgICB9IGVsc2UgaWYgKGYyZnNfaXNfcGlubmVkX2ZpbGUo
aW5vZGUpKSB7Cj4+PiBAQCAtMzUyOSw2ICszNTMwLDggQEAgc3RhdGljIGludCBmMmZzX2lvY19z
ZXRfcGluX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+Pj4gICAg
ICAgfQo+Pj4KPj4+ICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9QSU5fRklMRSk7Cj4+
PiArICAgICBmaWxlX3NldF9ob3QoaW5vZGUpOwo+Pgo+PiBVbm5lY2Vzc2FyeSBmaWxlX3NldF9o
b3QoKSBpbnZva2luZz8gT3IgYW0gSSBtaXNzaW5nIGFueXRoaW5nPwo+Pgo+PiBUaGFua3MsCj4g
Cj4gU2V0dGluZyBIT1QgYW5kIElPUFJJTyBieSBkZWZhdWx0IGlzIGFsc28gaW50ZW50aW9uYWwu
IFdlIHNldCBib3RoCj4gZmxhZ3MgYnkgZGVmYXVsdCBiZWNhdXNlIHRoZSBtYWluIHVzZSBjYXNl
IGZvciBwaW5uZWQgZmlsZXMgaW52b2x2ZXMKPiBmcmVxdWVudGx5IHVwZGF0ZWQgb3Igc2hvcnQt
bGl2ZWQgZGF0YSB0aGF0IG5lZWRzIGZhc3Qgd3JpdGUgc3BlZWRzLgoKV2VsbCwgaWYgaXQgaXMg
aW50ZW50aW9uYWwsIGxldCdzIGRlc2NyaWJlIGl0IGluIGNvbW1pdCBtZXNzYWdlIGV4cGxpY2l0
bHkuCgpUd28gbW9yZSBxdWVzdGlvbnM6Ci0gd2hlbiB3ZSB1bnBpbiBhIGZpbGUsIHdlIG5lZWQg
dG8gY2xlYXIgaG90IGZsYWcgYXMgd2VsbD8KLSB3aGVuIHdlIHNldCBwaW4gb24gY29sZCBmaWxl
LCBkbyB3ZSBuZWVkIHRvIGNsZWFyIHRoZSBjb2xkIGZsYWcgYW5kIHRoZW4Kc2V0IGhvdCBmbGFn
PwoKQlRXLCB0aGVyZSBpcyBubyBkb2N1bWVudCBhYm91dCB0aGlzIHBpbiBpb2N0bCwgaXRzIHNl
bWF0aWNzIGJlY29tZXMgbW9yZQpjb21wbGljYXRlZCBub3csIG5vdCBzdXJlIHdoZXRoZXIgdXNl
ciBjYW4gdXNlIHRoaXMgaW9jdGwgYXMgdGhlaXIgbmVlZHMgb3IKbm90LCBob3cgYWJvdXQgYWRk
aW5nIHNvbWUgY29tbWVudHMgYWJvdmUgdGhpcyBpb2N0bCBmdW5jdGlvbiwgbGF0ZXIsIHdlCmNh
biByZWxvY2F0ZSB0aGUgY29tbWVudHMgdG8gZjJmcy5yc3QgYXMgZG9jdW1lbnQuCgpUaGFua3Ms
Cgo+IAo+Pgo+Pj4gKyAgICAgc2V0X2lvcHJpbyhpbm9kZSwgRjJGU19JT1BSSU9fV1JJVEUpOwo+
Pj4gICAgICAgcmV0ID0gRjJGU19JKGlub2RlKS0+aV9nY19mYWlsdXJlczsKPj4+ICBkb25lOgo+
Pj4gICAgICAgZjJmc191cGRhdGVfdGltZShzYmksIFJFUV9USU1FKTsKPj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL25hbWVpLmMgYi9mcy9mMmZzL25hbWVpLmMKPj4+IGluZGV4IDA3ZTMzM2VlMjFi
Ny4uMGY5NmEwYjg2YzQwIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9uYW1laS5jCj4+PiArKysg
Yi9mcy9mMmZzL25hbWVpLmMKPj4+IEBAIC0xOTEsOSArMTkxLDEwIEBAIHN0YXRpYyB2b2lkIHNl
dF9jb21wcmVzc19uZXdfaW5vZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgaW5v
ZGUgKmRpciwKPj4+ICB9Cj4+Pgo+Pj4gIC8qCj4+PiAtICogU2V0IGZpbGUncyB0ZW1wZXJhdHVy
ZSBmb3IgaG90L2NvbGQgZGF0YSBzZXBhcmF0aW9uCj4+PiArICogU2V0IGZpbGUncyB0ZW1wZXJh
dHVyZSAoZm9yIGhvdC9jb2xkIGRhdGEgc2VwYXJhdGlvbikgYW5kCj4+PiArICogSS9PIHByaW9y
aXR5LCBiYXNlZCBvbiBmaWxlbmFtZSBleHRlbnNpb24KPj4+ICAgKi8KPj4+IC1zdGF0aWMgdm9p
ZCBzZXRfZmlsZV90ZW1wZXJhdHVyZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBp
bm9kZSAqaW5vZGUsCj4+PiArc3RhdGljIHZvaWQgc2V0X2ZpbGVfdGVtcF9wcmlvKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGlub2RlICppbm9kZSwKPj4+ICAgICAgICAgICAgICAg
Y29uc3QgdW5zaWduZWQgY2hhciAqbmFtZSkKPj4+ICB7Cj4+PiAgICAgICBfX3U4ICgqZXh0bGlz
dClbRjJGU19FWFRFTlNJT05fTEVOXSA9IHNiaS0+cmF3X3N1cGVyLT5leHRlbnNpb25fbGlzdDsK
Pj4+IEBAIC0yMTIsOCArMjEzLDEwIEBAIHN0YXRpYyB2b2lkIHNldF9maWxlX3RlbXBlcmF0dXJl
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGlub2RlICppbm9kZSwKPj4+Cj4+PiAg
ICAgICBpZiAoaSA8IGNvbGRfY291bnQpCj4+PiAgICAgICAgICAgICAgIGZpbGVfc2V0X2NvbGQo
aW5vZGUpOwo+Pj4gLSAgICAgZWxzZQo+Pj4gKyAgICAgZWxzZSB7Cj4+PiAgICAgICAgICAgICAg
IGZpbGVfc2V0X2hvdChpbm9kZSk7Cj4+PiArICAgICAgICAgICAgIHNldF9pb3ByaW8oaW5vZGUs
IEYyRlNfSU9QUklPX1dSSVRFKTsKPj4+ICsgICAgIH0KPj4+ICB9Cj4+Pgo+Pj4gIHN0YXRpYyBz
dHJ1Y3QgaW5vZGUgKmYyZnNfbmV3X2lub2RlKHN0cnVjdCBtbnRfaWRtYXAgKmlkbWFwLAo+Pj4g
QEAgLTMxNyw3ICszMjAsNyBAQCBzdGF0aWMgc3RydWN0IGlub2RlICpmMmZzX25ld19pbm9kZShz
dHJ1Y3QgbW50X2lkbWFwICppZG1hcCwKPj4+ICAgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWco
aW5vZGUsIEZJX0lOTElORV9EQVRBKTsKPj4+Cj4+PiAgICAgICBpZiAobmFtZSAmJiAhdGVzdF9v
cHQoc2JpLCBESVNBQkxFX0VYVF9JREVOVElGWSkpCj4+PiAtICAgICAgICAgICAgIHNldF9maWxl
X3RlbXBlcmF0dXJlKHNiaSwgaW5vZGUsIG5hbWUpOwo+Pj4gKyAgICAgICAgICAgICBzZXRfZmls
ZV90ZW1wX3ByaW8oc2JpLCBpbm9kZSwgbmFtZSk7Cj4+Pgo+Pj4gICAgICAgc3RhdF9pbmNfaW5s
aW5lX3hhdHRyKGlub2RlKTsKPj4+ICAgICAgIHN0YXRfaW5jX2lubGluZV9pbm9kZShpbm9kZSk7
Cj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK

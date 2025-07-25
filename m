Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 562A4B116A3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 04:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRiM2XufAHm7Yu9cFZx4R/iZgrfFJRp1wt06LLEl0mw=; b=mJb0Oa3uVEXfJOUNwBJysRRjEr
	ahIH/7MrTJLjlxNu44PbOgCLyWEEKpbGX4gh9TSH3CzdeVpaik9D/GDJpET2yVXVQuVNjtNdGtVQ6
	X858eAIFKrE6kM6IYddZqUv54qPt1ixqVB0LTSt6mi9p+a4zwZoSqYA8WD9cOH8vEa+g=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf8Rj-00033I-4O;
	Fri, 25 Jul 2025 02:46:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uf8Rh-000333-I9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 02:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pft8WNifd1aia9XAaUHh0WV8EWRfhz8CEa3pt9wFJ2w=; b=JwcwmmApjX4M1XhI4A7RbM7zt5
 qzuR4Nhil7QGJB9ALRxe/ipQHH8YdB+yJbiBeDSY6TBVQCEN36H9oLnM49dOjGUPfKBSkmHFEiEZd
 b9VxlppcoDc6jd5unS+9XXXCsG7E4f+HJ09NFSNA9jhthQYHBoB4LMEKcvcR2fRfSRy0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pft8WNifd1aia9XAaUHh0WV8EWRfhz8CEa3pt9wFJ2w=; b=U3tbABfCb2hIJqbeBGzpynhh+B
 LRPUuqEsKMWpPlvH/D/iwMFr6jsgnNTWpWBhl6m+6loAhXLRDHeGpGshHMGxITTNz3jCwPYZ+zQf0
 YOo1NAwbA1PVOcyXymSQ6cyTlB0p7L+bwkkMtYuYgE8bOGY94XXy7fU8hHE7fJYXVCs4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf8Rh-0003kW-Mk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 02:46:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0144D601ED;
 Fri, 25 Jul 2025 02:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B2FC4CEED;
 Fri, 25 Jul 2025 02:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753411554;
 bh=DVBBGJUmLMKPjfSrQOCF/zIcV9BTjZYw8tD4TJbaRd8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=CdPB5/94Ld3jgK3SVHGoHhAXIvX1u2VeZAKHTNd9Ge/FJy1VCJtncShJBMicPRKgz
 V9YLF+o1ssLRILKxTkRFwoaagEk7m9KVPQiuBGVHEsk12WEJHQbHBn5cPvaT8UbBK9
 uETBuvrIMXr6KQO1IWDOEjU8J1x1Sd4uGWMSKiEXQxK703Iw88I2psoIUIuBBgIg/S
 Ju5HsY6XfiBA5DY3UMoHfpYn2D734M09nBa4NJjoOpuccQH7kOAC6Guplti9hiU+C5
 VncmJPqY/YsabKOIoZWdPrOvdAO+vxUMVYsw02vJic2JGhFdVIyeQHH8h4TsjddvJ5
 Bvj8C+Ak3DkWg==
Message-ID: <30ce1862-87ea-40dc-ad66-34fc73efeafd@kernel.org>
Date: Fri, 25 Jul 2025 10:45:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250725005924.3909785-1-chao@kernel.org>
 <CAHJ8P3LSv5hYwc6uTAg-LYE8Bwyf8Xp-gme=EKZ0hbx4LKJv=A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3LSv5hYwc6uTAg-LYE8Bwyf8Xp-gme=EKZ0hbx4LKJv=A@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 7/25/2025 10:08 AM, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2025年7月25日周五 09:03写道：
    >> >> It provides a way to disable linear lo [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uf8Rh-0003kW-Mk
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: support -C [no]hashonly to
 control linear lookup fallback
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNy8yNS8yMDI1IDEwOjA4IEFNLCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgdmlhIExp
bnV4LWYyZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pgo+
IOS6jjIwMjXlubQ35pyIMjXml6XlkajkupQgMDk6MDPlhpnpgZPvvJoKPj4KPj4gSXQgcHJvdmlk
ZXMgYSB3YXkgdG8gZGlzYWJsZSBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIGR1cmluZyBta2ZzLgo+
Pgo+PiBCZWhhdmlvciBzdW1tYXJ5Ogo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgQW5kcm9p
ZCAgICAgICAgIERpc3Rybwo+PiBCeSBkZWZhdWx0ICAgICAgICAgICAgICBkaXNhYmxlZCAgICAg
ICAgZW5hYmxlZAo+PiBUdW5lIHcvIFtub11oYXNob25seSAgICBubyAgICAgICAgICAgICAgeWVz
Cj4+Cj4+IEFuZHJvaWQgY2FzZToKPj4KPj4gMS4xKSBEaXNhYmxlIGxpbmVhciBsb29rdXA6Cj4+
IG1rZnMuZjJmcyAtZiAtZyBhbmRyb2lkIC1PIGNhc2Vmb2xkIC1DIHV0Zjg6aGFzaG9ubHkgL2Rl
di92ZGIKPj4gZHVtcC5mMmZzIC1kMyAvZGV2L3ZkYiB8Z3JlcCBzX2VuY29kaW5nX2ZsYWdzCj4+
IHNfZW5jb2RpbmdfZmxhZ3MgICAgICAgICAgICAgICAgICAgICAgICBbMHggICAgICAgMiA6IDJd
Cj4+Cj4+IDEuMikgRW5hYmxlIGxpbmVhciBsb29rdXA6Cj4+IG1rZnMuZjJmcyAtZiAtZyBhbmRy
b2lkIC1PIGNhc2Vmb2xkIC1DIHV0Zjg6bm9oYXNob25seSAvZGV2L3ZkYgo+PiBkdW1wLmYyZnMg
LWQzIC9kZXYvdmRiIHxncmVwIHNfZW5jb2RpbmdfZmxhZ3MKPj4gc19lbmNvZGluZ19mbGFncyAg
ICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAyIDogMl0KPiBIaSBDaGFvLAo+IFNlZW1z
IGxpa2UgYSB0eXBvIGhlcmU/IHNob3VsZCBiZToKClpoaWd1bywKCk5vdCBhIHR5cG8sIGl0J3Mg
aW50ZW50aW9uYWwsIHNlZSBhYm92ZSBiZWhhdmlvciBzdW1tYXJ5LgoKQnV0IGFmdGVyIHJldGhp
bmtpbmcgYWJvdXQgdGhpcywgSSBndWVzcyBpdCB3aWxsIGJlIGdvb2QgdG8gaG9ub3IKJ25vaGFz
aG9ubHknIGZvciBBbmRyb2lkIGNhc2UgbGlrZSBEaXN0cm8gY2FzZS4KCkFueXdheSwgbGV0IG1l
IHVwZGF0ZSB0aGUgcGF0Y2guCgpUaGFua3MsCgo+IHNfZW5jb2RpbmdfZmxhZ3MgICAgICAgICAg
ICAgICAgICAgICAgICBbMHggICAgICAgMCA6IDBdID8KPiB0aGFua3MhCj4+Cj4+IDEuMykgQnkg
ZGVmYXVsdDoKPj4gbWtmcy5mMmZzIC1mIC1nIGFuZHJvaWQgLU8gY2FzZWZvbGQgLUMgdXRmOCAv
ZGV2L3ZkYgo+PiBkdW1wLmYyZnMgLWQzIC9kZXYvdmRiIHxncmVwIHNfZW5jb2RpbmdfZmxhZ3MK
Pj4gc19lbmNvZGluZ19mbGFncyAgICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAyIDog
Ml0KPj4KPj4gRGlzdHJvIGNhc2U6Cj4+Cj4+IDIuMSkgRGlzYWJsZSBsaW5lYXIgbG9va3VwOgo+
PiBta2ZzLmYyZnMgLWYgLU8gY2FzZWZvbGQgLUMgdXRmODpoYXNob25seSAvZGV2L3ZkYgo+PiBk
dW1wLmYyZnMgLWQzIC9kZXYvdmRiIHxncmVwIHNfZW5jb2RpbmdfZmxhZ3MKPj4gc19lbmNvZGlu
Z19mbGFncyAgICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAyIDogMl0KPj4KPj4gMi4y
KSBFbmFibGUgbGluZWFyIGxvb2t1cDoKPj4gbWtmcy5mMmZzIC1mIC1PIGNhc2Vmb2xkIC1DIHV0
Zjg6bm9oYXNob25seSAvZGV2L3ZkYgo+PiBkdW1wLmYyZnMgLWQzIC9kZXYvdmRiIHxncmVwIHNf
ZW5jb2RpbmdfZmxhZ3MKPj4gc19lbmNvZGluZ19mbGFncyAgICAgICAgICAgICAgICAgICAgICAg
IFsweCAgICAgICAwIDogMF0KPj4KPj4gMi4zKSBCeSBkZWZhdWx0Ogo+PiBta2ZzLmYyZnMgLWYg
LU8gY2FzZWZvbGQgLUMgdXRmOCAvZGV2L3ZkYgo+PiBkdW1wLmYyZnMgLWQzIC9kZXYvdmRiIHxn
cmVwIHNfZW5jb2RpbmdfZmxhZ3MKPj4gc19lbmNvZGluZ19mbGFncyAgICAgICAgICAgICAgICAg
ICAgICAgIFsweCAgICAgICAwIDogMF0KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPgo+PiAtLS0KPj4gdjI6Cj4+IC0gZGlzYWJsZSBsaW5lYXIgbG9va3VwIGJ5
IGRlZmF1bHQgZm9yIEFuZHJvaWQgY2FzZQo+PiAgIGluY2x1ZGUvZjJmc19mcy5oICAgICAgIHwg
IDMgKystCj4+ICAgbGliL2xpYmYyZnMuYyAgICAgICAgICAgfCAgMSArCj4+ICAgbWFuL21rZnMu
ZjJmcy44ICAgICAgICAgfCAxMCArKysrKysrKy0tCj4+ICAgbWtmcy9mMmZzX2Zvcm1hdC5jICAg
ICAgfCAgMyArKysKPj4gICBta2ZzL2YyZnNfZm9ybWF0X21haW4uYyB8ICAzICsrLQo+PiAgIDUg
ZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZjJmc19mcy5oIGIvaW5jbHVkZS9mMmZzX2ZzLmgKPj4gaW5kZXgg
ZjcyNjhkMS4uYThkYThmYSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9mMmZzX2ZzLmgKPj4gKysr
IGIvaW5jbHVkZS9mMmZzX2ZzLmgKPj4gQEAgLTE0NzgsNyArMTQ3OCw4IEBAIGVudW0gewo+Pgo+
PiAgIC8qIGZlYXR1cmUgbGlzdCBpbiBBbmRyb2lkICovCj4+ICAgZW51bSB7Cj4+IC0gICAgICAg
RjJGU19GRUFUVVJFX05BVF9CSVRTID0gMHgwMDAxLAo+PiArICAgICAgIEYyRlNfRkVBVFVSRV9O
QVRfQklUUyAgICAgICAgICAgPSAweDAwMDEsCj4+ICsgICAgICAgRjJGU19GRUFUVVJFX0xJTkVB
Ul9MT09LVVAgICAgICA9IDB4MDAwMiwKPj4gICB9Owo+Pgo+PiAgIC8qIG5vbGluZWFyIGxvb2t1
cCB0dW5lICovCj4+IGRpZmYgLS1naXQgYS9saWIvbGliZjJmcy5jIGIvbGliL2xpYmYyZnMuYwo+
PiBpbmRleCAyZjAxMmM4Li4wZTNlNjJhIDEwMDY0NAo+PiAtLS0gYS9saWIvbGliZjJmcy5jCj4+
ICsrKyBiL2xpYi9saWJmMmZzLmMKPj4gQEAgLTE0MjQsNiArMTQyNCw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZW5jX2ZsYWdzIHsKPj4gICAgICAgICAgY2hhciAqcGFyYW07Cj4+ICAgfSBlbmNv
ZGluZ19mbGFnc1tdID0gewo+PiAgICAgICAgICB7IEYyRlNfRU5DX1NUUklDVF9NT0RFX0ZMLCAi
c3RyaWN0IiB9LAo+PiArICAgICAgIHsgRjJGU19FTkNfTk9fQ09NUEFUX0ZBTExCQUNLX0ZMLCAi
aGFzaG9ubHkifQo+PiAgIH07Cj4+Cj4+ICAgLyogUmV0dXJuIGEgcG9zaXRpdmUgbnVtYmVyIDwg
MHhmZiBpbmRpY2F0aW5nIHRoZSBlbmNvZGluZyBtYWdpYyBudW1iZXIKPj4gZGlmZiAtLWdpdCBh
L21hbi9ta2ZzLmYyZnMuOCBiL21hbi9ta2ZzLmYyZnMuOAo+PiBpbmRleCA4YjNiMGNjLi44Y2I3
ZDMyIDEwMDY0NAo+PiAtLS0gYS9tYW4vbWtmcy5mMmZzLjgKPj4gKysrIGIvbWFuL21rZnMuZjJm
cy44Cj4+IEBAIC0yMzIsOSArMjMyLDE1IEBAIFVzZSBVVEYtOCBmb3IgY2FzZWZvbGRpbmcuCj4+
ICAgLkkgZmxhZ3M6Cj4+ICAgLlJTIDEuMmkKPj4gICAuVFAgMS4yaQo+PiAtLkIgc3RyaWN0Cj4+
ICsuQiBbbm9dc3RyaWN0Cj4+ICAgVGhpcyBmbGFnIHNwZWNpZmllcyB0aGF0IGludmFsaWQgc3Ry
aW5ncyBzaG91bGQgYmUgcmVqZWN0ZWQgYnkgdGhlIGZpbGVzeXN0ZW0uCj4+IC1EZWZhdWx0IGlz
IGRpc2FibGVkLgo+PiArRm9yIGFuZHJvaWQgY2FzZSwgaXQgd2lsbCBkaXNhYmxlIGxpbmVhciBs
b29rdXAgYnkgZGVmYXVsdC4KPj4gKy5SRQo+PiArLlJTIDEuMmkKPj4gKy5UUCAxLjJpCj4+ICsu
QiBbbm9daGFzaG9ubHkKPj4gK1RoaXMgZmxhZyBzcGVjaWZpZXMgdGhhdCB0aGVyZSBpcyBubyBs
aW5lYXIgbG9va3VwIGZhbGxiYWNrIGR1cmluZyBsb29rdXAuCj4+ICtCeSBkZWZhdWx0LCBsaW5l
YXIgbG9va3VwIGZhbGxiYWNrIGlzIGVuYWJsZWQuCj4+ICAgLlJFCj4+ICAgLlJFCj4+ICAgLlRQ
Cj4+IGRpZmYgLS1naXQgYS9ta2ZzL2YyZnNfZm9ybWF0LmMgYi9ta2ZzL2YyZnNfZm9ybWF0LmMK
Pj4gaW5kZXggMjY4MGJkMy4uYTQ1YmJjYiAxMDA2NDQKPj4gLS0tIGEvbWtmcy9mMmZzX2Zvcm1h
dC5jCj4+ICsrKyBiL21rZnMvZjJmc19mb3JtYXQuYwo+PiBAQCAtNjcxLDYgKzY3MSw5IEBAIHN0
YXRpYyBpbnQgZjJmc19wcmVwYXJlX3N1cGVyX2Jsb2NrKHZvaWQpCj4+ICAgICAgICAgIG1lbWNw
eShzYi0+aW5pdF92ZXJzaW9uLCBjLnZlcnNpb24sIFZFUlNJT05fTEVOKTsKPj4KPj4gICAgICAg
ICAgaWYgKGMuZmVhdHVyZSAmIEYyRlNfRkVBVFVSRV9DQVNFRk9MRCkgewo+PiArICAgICAgICAg
ICAgICAgaWYgKCEoYy5zX2VuY29kaW5nX2ZsYWdzICYgRjJGU19FTkNfTk9fQ09NUEFUX0ZBTExC
QUNLX0ZMKSAmJgo+PiArICAgICAgICAgICAgICAgICAgICAgICAoYy5kaXNhYmxlZF9mZWF0dXJl
ICYgRjJGU19GRUFUVVJFX0xJTkVBUl9MT09LVVApKQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICBjLnNfZW5jb2RpbmdfZmxhZ3MgfD0gRjJGU19FTkNfTk9fQ09NUEFUX0ZBTExCQUNLX0ZMOwo+
PiAgICAgICAgICAgICAgICAgIHNldF9zYihzX2VuY29kaW5nLCBjLnNfZW5jb2RpbmcpOwo+PiAg
ICAgICAgICAgICAgICAgIHNldF9zYihzX2VuY29kaW5nX2ZsYWdzLCBjLnNfZW5jb2RpbmdfZmxh
Z3MpOwo+PiAgICAgICAgICB9Cj4+IGRpZmYgLS1naXQgYS9ta2ZzL2YyZnNfZm9ybWF0X21haW4u
YyBiL21rZnMvZjJmc19mb3JtYXRfbWFpbi5jCj4+IGluZGV4IGYwYmVjNGYuLjhmOGU5NzUgMTAw
NjQ0Cj4+IC0tLSBhL21rZnMvZjJmc19mb3JtYXRfbWFpbi5jCj4+ICsrKyBiL21rZnMvZjJmc19m
b3JtYXRfbWFpbi5jCj4+IEBAIC0xNDMsNyArMTQzLDggQEAgc3RhdGljIHZvaWQgYWRkX2RlZmF1
bHRfb3B0aW9ucyh2b2lkKQo+PiAgICAgICAgICAgICAgICAgIGZvcmNlX292ZXJ3cml0ZSA9IDE7
Cj4+ICAgICAgICAgICAgICAgICAgYy53YW50ZWRfc2VjdG9yX3NpemUgPSBGMkZTX0JMS1NJWkU7
Cj4+ICAgICAgICAgICAgICAgICAgYy5yb290X3VpZCA9IGMucm9vdF9naWQgPSAwOwo+PiAtICAg
ICAgICAgICAgICAgYy5kaXNhYmxlZF9mZWF0dXJlIHw9IEYyRlNfRkVBVFVSRV9OQVRfQklUUzsK
Pj4gKyAgICAgICAgICAgICAgIGMuZGlzYWJsZWRfZmVhdHVyZSB8PSBGMkZTX0ZFQVRVUkVfTkFU
X0JJVFMgfAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRjJGU19G
RUFUVVJFX0xJTkVBUl9MT09LVVA7Cj4+Cj4+ICAgICAgICAgICAgICAgICAgLyogUk8gZG9lc24n
dCBuZWVkIGFueSBvdGhlciBmZWF0dXJlcyAqLwo+PiAgICAgICAgICAgICAgICAgIGlmIChjLmZl
YXR1cmUgJiBGMkZTX0ZFQVRVUkVfUk8pCj4+IC0tCj4+IDIuNDkuMAo+Pgo+Pgo+Pgo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

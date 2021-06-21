Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6FD3AF9BF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jun 2021 01:46:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lvTcQ-0007MF-Fn; Mon, 21 Jun 2021 23:46:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lvTcP-0007M1-1x
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 23:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RFVoBqZ2tUrKI38jFot8qBrlf7eY0/n02BkuD7B9aqk=; b=it/m/RX8Dn21NMpTF9W+R7gNzN
 dOoLCPppyX2mjufKfk5TP67ILrNKzoQPQkqW1r2fM1Omm1euGpSHmGyFfKXun8TgguHKxzLuORc1A
 PeykodAeALUlTBdTmtXLeIx89kWsAcqAfKbIfcCvtXKpww2cAriNvNKoPXaKeIHDI54k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RFVoBqZ2tUrKI38jFot8qBrlf7eY0/n02BkuD7B9aqk=; b=ctNQMN3vO6wQLD4xeHb8HMS1YL
 rl2ntyhU1YLhiiJ3KAZLiFESqbbGfAi7z/yUupObmGPqXtGAMkmi1Zd+R5UdVD5Cs9WUz40b+OEmA
 obtN/va9X2xRBwSj8AxazhmgIrAgWBj5DibvBrKYPQ+6HbBpBrZhn7A8jIuwhrfNlH84=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lvTcD-006Eqz-Fb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 23:46:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3768E60FF2;
 Mon, 21 Jun 2021 23:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624319155;
 bh=NWDeh7pY/U0zvk/8wDZIg42NMrKFlNro668xPIhigoc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=a3P2lxz/YATvRGOMBKqwv8G7JxjpL6H8dgYLSchJVMZaoXefNyeYbSBU4JCbL7L26
 YdmvBeWt8ZEoCdzq0GHtEyv/TSRF81YYm/Mrg+t0ifsNhDi8SghE7/ChdId3ckY2aD
 sUEiIs4wpCU1bK6iYnaqQVJJxYwhqqQu/gsVImwfirKnun7hxdJqEvQoFCswDr5GLp
 xHVygyXjSKuqPbS8TE5bR2FubysFjhv3HSaIgSDCuwvJHPchBMz4/5LL5QD+EhQhTV
 dySAyJxxyH8aeJ0ZLj2Lo+f9T3fE7pFgvHHZKFnMKDq0pCKZ51xN+RkRAAS9WSB4ey
 ePF6jqM/6sXpA==
To: Fengnan Chang <changfengnan@vivo.com>
References: <20210610032845.84744-1-changfengnan@vivo.com>
 <47d96770-1b86-9af4-89e3-387f67037bb0@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <94a9e61d-12b6-ffa0-e18b-2e35392e1aac@kernel.org>
Date: Tue, 22 Jun 2021 07:45:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <47d96770-1b86-9af4-89e3-387f67037bb0@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lvTcD-006Eqz-Fb
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: remove unneeded read when
 rewrite whole cluster
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS82LzIxIDE0OjQ5LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+IEhpIGNoYW8gJiBqYWVn
ZXVrOgo+ICDCoCBBbnkgY29tbWVudHMgYWJvdXQgdGhpcz8KPiAKPiBUaGFua3MuCj4gCj4gT24g
MjAyMS82LzEwIDExOjI4LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+PiBGb3Igbm93LCB3aGVuIG92
ZXJ3cml0ZSBjb21wcmVzc2VkIGZpbGUsIHdlIG5lZWQgcmVhZCBvbGQgZGF0YSB0byBwYWdlCj4+
IGNhY2hlIGZpcnN0IGFuZCB1cGRhdGUgcGFnZXMuCj4+IEJ1dCB3aGVuIHdlIG5lZWQgb3Zlcndy
aXRlIHdob2xlIGNsdXN0ZXIsIHdlIGRvbid0IG5lZWQgb2xkIGRhdGEKPj4gYW55bW9yZS4KCkNv
bW1pdCBtZXNzYWdlIG5lZWRzIHRvIGJlIHVwZGF0ZWQgYXM6Cgp3aGVuIHdlIG92ZXJ3cml0ZSB0
aGUgd2hvbGUgcGFnZSBpbiBjbHVzdGVyLCB3ZSBkb24ndCBuZWVkIHJlYWQgb3JpZ2luYWwKZGF0
YSBiZWZvcmUgd3JpdGUsIGJlY2F1c2UgYWZ0ZXIgd3JpdGVfZW5kKCksIHdyaXRlcGFnZXMoKSBj
YW4gaGVscCB0bwpsb2FkIGxlZnQgZGF0YSBpbiB0aGF0IGNsdXN0ZXIuCgpBY2tlZC1ieTogQ2hh
byBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgoKVGhhbmtzLAoKPj4gU28sIHJlbW92ZSByZWFkIGRh
dGEgcHJvY2VzcyBpbiB0aGlzIGNhc2UsIEkgaGF2ZSBtYWRlCj4+IHNvbWUgc2ltcGxlIGNoYW5n
ZXMgdG8gdGVzdCwgdGVzdHMgaGF2ZSBzaG93biB0aGF0IHRoaXMgY2FuIGxlYWQgdG8KPj4gc2ln
bmlmaWNhbnQgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnRzLCB0aGUgc3BlZWQgb2Ygc2VxdWVudGlh
bCB3cml0ZQo+PiB1cCB0byAyeC4KPj4KPj4gVGhpcyBtb2RpZmljeSBqdXN0IGNoZWNrIHdoZWF0
aGVyIHRoZSB3aG9sZSBwYWdlIHdhcyBkaXJ0eSwgYmVjYXVzZQo+PiB3aGVuIHdyaXRlYmFjayBj
YWNoZSBmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlIHdpbGwgYmUgY2FsbGVkIGFnYWlu
Lgo+PiB3aGVuIHVwZGF0ZSB3aG9sZSBjbHVzdGVyLCBjYyBpbiBwcmVwYXJlX2NvbXByZXNzX292
ZXJ3cml0ZSB3aWxsIGJlCj4+IGVtcHR5LCBzbyB3aWxsIG5vdCByZWFkIG9sZCBkYXRhLgo+PiB3
aGVuIG9ubHkgdXBkYXRlIG9uZSBwYWdlIGluIGNsdXN0ZXIswqAgY2MgaW4gcHJlcGFlX2NvbXBy
ZXNzX292ZXJ3cml0ZQo+PiB3aWxsIG5vdCBiZSBlbXB0eSwgc28gd2lsbCByZWFkIG9sZCBkYXRh
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4KPj4gLS0t
Cj4+IMKgIGZzL2YyZnMvZGF0YS5jIHwgMyArKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2Rh
dGEuYwo+PiBpbmRleCBkNDc5NWVkYTEyZmEuLjkzNzZjNjJlMGVjYyAxMDA2NDQKPj4gLS0tIGEv
ZnMvZjJmcy9kYXRhLmMKPj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4gQEAgLTMzMDcsNiArMzMw
Nyw5IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwgc3Ry
dWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqZnNk
YXRhID0gTlVMTDsKPj4KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChsZW4gPT0gUEFHRV9TSVpFKQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHJlcGVhdDsKPj4gKwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0ID0gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZShpbm9kZSwgcGFn
ZXAsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW5kZXgsIGZzZGF0YSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0IDwg
MCkgewo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK

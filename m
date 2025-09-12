Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7302B54119
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Sep 2025 05:41:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqD0hNG1kFBX7U7Oivlhp9e+XY9jW1ImpmZPr6gc/r8=; b=bK+mxYEV2Tcdq4ikk6VCVJ3HlF
	IKcxrAXLjjmY8fiXbkBuRMQ4P8O2IBHe7gf5xq+EUCUlr+cAdjXDrolT0Hep96ipkQgIMkKE59vrf
	l2s7WWiKSrz4o7ZqkTn8YRLrh8FJKWwYhqSkn4Z1+ggXGrdBdB8GFty6VJzp/KNmaN9M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwuf9-0003Ip-DP;
	Fri, 12 Sep 2025 03:41:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uwuf7-0003Ii-Dj
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 03:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7W028qr31TcrDIG9bbg0IvFcQs//QdCvvv6speZtA4s=; b=mGKIZnXE+ZsqzFHMJJVbzNNhOj
 XJ82UdtFs99WWFuaHjvKXbc12c1HmEuxhJw43lpALDLd4p7tk+oVPmOIaQ3htwMHA0C/1fZ+qnGva
 iBjr9Pid77+XE2Q+dwuW9sKNETHGdBgXuyqUCqFtxkKUg1oAURB4kab/9dneJzTLd3Qk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7W028qr31TcrDIG9bbg0IvFcQs//QdCvvv6speZtA4s=; b=de1ObshCsYyprVd+II3iDqZqfL
 eLd88Fz1yCvNSqaB6QHHUzlhJOiw+uxY/XplUoBLQP0WtcN0GUL+GYgCKcz26QNz/EhzFWUoQXBXp
 v9ih2O4wbZ9L57wPbB1t+5DNR7S4eDH5r4YABPxDF4gTq36VSEHOXLanculLHzg0MHEg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uwuf6-0000KQ-PI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 03:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D5AD418D6;
 Fri, 12 Sep 2025 03:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CCCC4CEF4;
 Fri, 12 Sep 2025 03:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757648479;
 bh=XDwDklRFyhTQ7jpEFuln8g3jtb2GyRw7CB0tY3hlXIE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=sCNXCSxisFb6QSyP/WoUcT62/cIWYvK/VB/grwR38wDI1Sc/zVAJwMao5k7iLDyCK
 o1mYGgOSrEZLBsiWQTejzn1KDItxoTx8YcZx6+91tlXzmz5LySQrWydAl8OoahZyKu
 7xGsLY7GlBiHAdXzpfZ0WgYM9rjT7KWmOKZv+3C+BuOxIIG5eN68ulQcV5WpNzhdJe
 yFyGJEqWFfknz3ChDzIoLvivUztP9hiubrZM4nZaC3GW17vmd0yqVhUZIjNstqorS8
 Z/MO/ldNHKNJukHUqo0ApITHY/ghRsevMaAfVhrWKnDNL8vLZNINON+CQzXyOotnV7
 FDDbAc2SkU++w==
Message-ID: <2ecb4f74-cc60-4dd4-8dc3-d4f3ff848e87@kernel.org>
Date: Fri, 12 Sep 2025 11:41:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>
References: <c83ac24b-9997-4f2e-9e51-00c29909ad85@kernel.org>
 <20250912033609.3033352-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250912033609.3033352-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/12/2025 11:36 AM, wangzijie wrote: >> On 9/11/2025 5:07
 PM, wangzijie wrote: >>>> On 9/10/25 21:58, wangzijie wrote: >>>>> When the
 data layout is like this: >>>>> dnode1: dnode2: >>>>> [0] A [0] [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uwuf6-0000KQ-PI
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix wrong extent_info data for
 precache extents
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOS8xMi8yMDI1IDExOjM2IEFNLCB3YW5nemlqaWUgd3JvdGU6Cj4+IE9uIDkvMTEvMjAyNSA1
OjA3IFBNLCB3YW5nemlqaWUgd3JvdGU6Cj4+Pj4gT24gOS8xMC8yNSAyMTo1OCwgd2FuZ3ppamll
IHdyb3RlOgo+Pj4+PiBXaGVuIHRoZSBkYXRhIGxheW91dCBpcyBsaWtlIHRoaXM6Cj4+Pj4+IGRu
b2RlMTogICAgICAgICAgICAgICAgICAgICBkbm9kZTI6Cj4+Pj4+IFswXSAgICAgIEEgICAgICAg
ICAgICAgICAgICBbMF0gICAgTkVXX0FERFIKPj4+Pj4gWzFdICAgICAgQSsxICAgICAgICAgICAg
ICAgIFsxXSAgICAweDAKPj4+Pj4gLi4uICAgICAgICAgICAgICAgICAgICAgICAgIC4uLi4KPj4+
Pj4gWzEwMTZdICAgQSsxMDE2Cj4+Pj4+IFsxMDE3XSAgIEIgKEIhPUErMTAxNykgICAgICBbMTAx
N10gMHgwCj4+Pj4+Cj4+Pj4+IFdlIGNhbiBidWlsZCB0aGlzIGtpbmQgb2YgbGF5b3V0IGJ5IGZv
bGxvd2luZyBzdGVwcyh3aXRoIGlfZXh0cmFfaXNpemU6MzYpOgo+Pj4+PiAuL2YyZnNfaW8gd3Jp
dGUgMSAwIDE4ODEgcmFuZCBkc3luYyB0ZXN0ZmlsZQo+Pj4+PiAuL2YyZnNfaW8gd3JpdGUgMSAx
ODgxIDEgcmFuZCBidWZmZXJlZCB0ZXN0ZmlsZQo+Pj4+PiAuL2YyZnNfaW8gZmFsbG9jYXRlIDAg
NzcwODY3MiA0MDk2IHRlc3RmaWxlCj4+Pj4+Cj4+Pj4+IEFuZCB3aGVuIHdlIG1hcCBmaXJzdCBk
YXRhIGJsb2NrIGluIGRub2RlMiwgd2Ugd2lsbCBnZXQgd3JvbmcgZXh0ZW50X2luZm8gZGF0YToK
Pj4+Pj4gbWFwLT5tX2xlbiA9IDEKPj4+Pj4gb2ZzID0gc3RhcnRfcGdvZnMgLSBtYXAtPm1fbGJs
ayA9IDE4ODIgLSAxODgxID0gMQo+Pj4+Pgo+Pj4+PiBlaS5mb2ZzID0gc3RhcnRfcGdvZnMgPSAx
ODgyCj4+Pj4+IGVpLmxlbiA9IG1hcC0+bV9sZW4gLSBvZnMgPSAxIC0gMSA9IDAKPj4+Pj4KPj4+
Pj4gRml4IGl0IGJ5IHNraXBwaW5nIHVwZGF0aW5nIHRoaXMga2luZCBvZiBleHRlbnQgaW5mby4K
Pj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogd2FuZ3ppamllIDx3YW5nemlqaWUxQGhvbm9yLmNv
bT4KPj4+Pj4gLS0tCj4+Pj4+ICAgIGZzL2YyZnMvZGF0YS5jIHwgMyArKysKPj4+Pj4gICAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+PiBpbmRleCA3OTYxZTBkZGYuLmI4YmI3
MTg1MiAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gKysrIGIvZnMvZjJm
cy9kYXRhLmMKPj4+Pj4gQEAgLTE2NDksNiArMTY0OSw5IEBAIGludCBmMmZzX21hcF9ibG9ja3Mo
c3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxh
ZykKPj4+Pj4gICAgCj4+Pj4+ICAgIAkJc3dpdGNoIChmbGFnKSB7Cj4+Pj4+ICAgIAkJY2FzZSBG
MkZTX0dFVF9CTE9DS19QUkVDQUNIRToKPj4+Pj4gKwkJCWlmIChfX2lzX3ZhbGlkX2RhdGFfYmxr
YWRkcihtYXAtPm1fcGJsaykgJiYKPj4+Pj4gKwkJCQlzdGFydF9wZ29mcyAtIG1hcC0+bV9sYmxr
ID09IG1hcC0+bV9sZW4pCj4+Pj4+ICsJCQkJbWFwLT5tX2ZsYWdzICY9IH5GMkZTX01BUF9NQVBQ
RUQ7Cj4+Pj4KPj4+PiBJdCBsb29rcyB3ZSBtaXNzZWQgdG8gcmVzZXQgdmFsdWUgZm9yIG1hcCB2
YXJpYWJsZSBpbiBmMmZzX3ByZWNhY2hlX2V4dGVudHMoKSwKPj4+PiB3aGF0IGRvIHlvdSB0aGlu
ayBvZiB0aGlzPwo+Pj4+Cj4+Pj4gLS0tCj4+Pj4gICAgZnMvZjJmcy9maWxlLmMgfCA0ICsrKy0K
Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+
IGluZGV4IDFhYWU0MzYxZDBhOC4uMmIxNDE1MWQ0MTMwIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2Yy
ZnMvZmlsZS5jCj4+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4+PiBAQCAtMzU5OSw3ICszNTk5
LDcgQEAgc3RhdGljIGludCBmMmZzX2lvY19pb19wcmlvKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNp
Z25lZCBsb25nIGFyZykKPj4+PiAgICBpbnQgZjJmc19wcmVjYWNoZV9leHRlbnRzKHN0cnVjdCBp
bm9kZSAqaW5vZGUpCj4+Pj4gICAgewo+Pj4+ICAgIAlzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvICpm
aSA9IEYyRlNfSShpbm9kZSk7Cj4+Pj4gLQlzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzIG1hcDsKPj4+
PiArCXN0cnVjdCBmMmZzX21hcF9ibG9ja3MgbWFwID0geyAwIH07Cj4+Pj4gICAgCXBnb2ZmX3Qg
bV9uZXh0X2V4dGVudDsKPj4+PiAgICAJbG9mZl90IGVuZDsKPj4+PiAgICAJaW50IGVycjsKPj4+
PiBAQCAtMzYxNyw2ICszNjE3LDggQEAgaW50IGYyZnNfcHJlY2FjaGVfZXh0ZW50cyhzdHJ1Y3Qg
aW5vZGUgKmlub2RlKQo+Pj4+Cj4+Pj4gICAgCXdoaWxlIChtYXAubV9sYmxrIDwgZW5kKSB7Cj4+
Pj4gICAgCQltYXAubV9sZW4gPSBlbmQgLSBtYXAubV9sYmxrOwo+Pj4+ICsJCW1hcC5tX3BibGsg
PSAwOwo+Pj4+ICsJCW1hcC5tX2ZsYWdzID0gMDsKPj4+Pgo+Pj4+ICAgIAkJZjJmc19kb3duX3dy
aXRlKCZmaS0+aV9nY19yd3NlbVtXUklURV0pOwo+Pj4+ICAgIAkJZXJyID0gZjJmc19tYXBfYmxv
Y2tzKGlub2RlLCAmbWFwLCBGMkZTX0dFVF9CTE9DS19QUkVDQUNIRSk7Cj4+Pj4gLS0gCj4+Pj4g
Mi40OS4wCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4gICAgCQkJZ290byBzeW5jX291dDsK
Pj4+Pj4gICAgCQljYXNlIEYyRlNfR0VUX0JMT0NLX0JNQVA6Cj4+Pj4+ICAgIAkJCW1hcC0+bV9w
YmxrID0gMDsKPj4+Cj4+Pgo+Pj4gV2UgaGF2ZSBhbHJlYWR5IHJlc2V0IG1fZmxhZ3MgKG1hcC0+
bV9mbGFncyA9IDApIGluIGYyZnNfbWFwX2Jsb2NrcygpLgo+Pgo+PiBaaWppZToKPj4KPj4gT29w
cywgdGhhdCdzIHJpZ2h0LCB0aGFua3MgZm9yIGNvcnJlY3RpbmcgbWUuCj4+Cj4+Pgo+Pj4gSSB0
aGluayB0aGF0IHRoaXMgYnVnIGlzIGNhdXNlZCBieSB3ZSBtaXNzZWQgdG8gcmVzZXQgbV9mbGFn
cyB3aGVuIHdlCj4+PiBnb3RvIG5leHRfZG5vZGUgaW4gYmVsb3cgY2FzZe+8mgo+Pj4KPj4+IERh
dGEgbGF5b3V0IGlzIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+PiBkbm9kZTE6ICAgICAgICAgICAg
ICAgICAgICAgZG5vZGUyOgo+Pj4gWzBdICAgICAgQSAgICAgICAgICAgICAgICAgIFswXSAgICBO
RVdfQUREUgo+Pj4gWzFdICAgICAgQSsxICAgICAgICAgICAgICAgIFsxXSAgICAweDAKPj4+IC4u
Lgo+Pj4gWzEwMTZdICAgQSsxMDE2Cj4+PiBbMTAxN10gICBCIChCIT1BKzEwMTcpICAgICAgWzEw
MTddIDB4MAo+Pj4KPj4+IHdlIG1hcCB0aGUgbGFzdCBibG9jayh2YWxpZCBibGthZGRyKSBpbiBk
bm9kZTE6Cj4+PiBtYXAtPm1fZmxhZ3MgfD0gRjJGU19NQVBfTUFQUEVEOwo+Pj4gbWFwLT5tX3Bi
bGsgPSBibGthZGRyKHZhbGlkIGJsa2FkZHIpOwo+Pj4gbWFwLT5tX2xlbiA9IDE7Cj4+PiB0aGVu
IHdlIGdvdG8gbmV4dF9kbm9kZSwgbWVldCB0aGUgZmlyc3QgYmxvY2sgaW4gZG5vZGUyKGhvbGUp
LCBnb3RvIHN5bmNfb3V0Ogo+Pj4gbWFwLT5tX2ZsYWdzICYgRjJGU19NQVBfTUFQUEVEID09IHRy
dWUsIGFuZCB3ZSBtYWtlIHdyb25nIGJsa2FkZHIvbGVuIGZvciBleHRlbnRfaW5mby4KPj4KPj4g
U28sIGNhbiB5b3UgcGxlYXNlIGFkZCBhYm92ZSBleHBsYW5hdGlvbiBpbnRvIGNvbW1pdCBtZXNz
YWdlPyB0aGF0Cj4+IHNob3VsZCBiZSBoZWxwZnVsIGZvciB1bmRlcnN0YW5kaW5nIHRoZSBwcm9i
bGVtIG1vcmUgY2xlYXJseS4KPj4KPj4gUGxlYXNlIHRha2UgYSBsb29rIGF0IHRoaXMgY2FzZSB3
LyB5b3VyIHBhdGNoOgo+Pgo+PiBta2ZzLmYyZnMgLU8gZXh0cmFfYXR0cixjb21wcmVzc2lvbiAv
ZGV2L3ZkYiAtZgo+PiBtb3VudCAvZGV2L3ZkYiAvbW50L2YyZnMgLW8gbW9kZT1sZnMKPj4gY2Qg
L21udC9mMmZzCj4+IGYyZnNfaW8gd3JpdGUgMSAwIDE4ODMgcmFuZCBkc3luYyB0ZXN0ZmlsZQo+
PiBmMmZzX2lvIGZhbGxvY2F0ZSAwIDc3MTI3NjggNDA5NiB0ZXN0ZmlsZQo+PiBmMmZzX2lvIHdy
aXRlIDEgMTg4MSAxIHJhbmQgYnVmZmVyZWQgdGVzdGZpbGUKPj4geGZzX2lvIHRlc3RmaWxlIC1j
ICJmc3luYyIKPj4gY2QgLwo+PiB1bW91bnQgL21udC9mMmZzCj4+IG1vdW50IC9kZXYvdmRiIC9t
bnQvZjJmcwo+PiBmMmZzX2lvIHByZWNhY2hlX2V4dGVudHMgL21udC9mMmZzL3Rlc3RmaWxlCj4+
IHVtb3VudCAvbW50L2YyZnMKPj4KPj4gICAgICAgICAgIGYyZnNfaW8tNzMzICAgICBbMDEwXSAu
Li4uLiAgICA3OC4xMzQxMzY6IGYyZnNfdXBkYXRlX3JlYWRfZXh0ZW50X3RyZWVfcmFuZ2U6IGRl
diA9ICgyNTMsMTYpLCBpbm8gPSA0LCBwZ29mcyA9IDE4ODIsIGxlbiA9IDAsIGJsa2FkZHIgPSAx
NzQxMCwgY19sZW4gPSAwCj4+Cj4+IEkgc3VzcGVjdCB3ZSBuZWVkIHRoaXM/Cj4+Cj4+IEBAIC0x
Nzg0LDcgKzE3ODEsOCBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpCj4+ICAgICAgICAgIH0KPj4K
Pj4gICAgICAgICAgaWYgKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfUFJFQ0FDSEUpIHsKPj4gLSAg
ICAgICAgICAgICAgIGlmIChtYXAtPm1fZmxhZ3MgJiBGMkZTX01BUF9NQVBQRUQpIHsKPj4gKyAg
ICAgICAgICAgICAgIGlmICgobWFwLT5tX2ZsYWdzICYgRjJGU19NQVBfTUFQUEVEKSAmJgo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAobWFwLT5tX2xlbiAtIG9mcykpIHsKPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvZnMgPSBzdGFydF9wZ29mcyAtIG1hcC0+bV9s
YmxrOwo+Pgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc191cGRhdGVfcmVhZF9leHRl
bnRfY2FjaGVfcmFuZ2UoJmRuLAo+IAo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoaXMuIExl
dCBtZSBmaW5kIGEgd2F5IHRvIGNvdmVyIHRoZXNlIGNhc2VzIGFuZCBkbyBtb3JlIHRlc3QuCj4g
Cj4+IEJUVywgSSBmaW5kIGFub3RoZXIgYnVnLCBpZiBvbmUgYmxrYWRkciBpcyBhZGpjZW50IHRv
IHByZXZpb3VzIGV4dGVudCwKPj4gYnV0IGFuZCBpdCBpcyB2YWxpZCwgd2UgbmVlZCB0byBzZXQg
bV9uZXh0X2V4dGVudCB0byBwZ29mcyByYXRoZXIgdGhhbgo+PiBwZ29mcyArIDEuCj4+Cj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+IGluZGV4IGNiZjg4
NDE2NDJjNy4uYWM4OGVkNjgwNTljIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+PiAr
KysgYi9mcy9mMmZzL2RhdGEuYwo+PiBAQCAtMTc4OSw4ICsxNzg5LDExIEBAIGludCBmMmZzX21h
cF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFw
LCBpbnQgZmxhZykKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnRfcGdv
ZnMsIG1hcC0+bV9wYmxrICsgb2ZzLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtYXAtPm1fbGVuIC0gb2ZzKTsKPj4gICAgICAgICAgICAgICAgICB9Cj4+IC0gICAgICAgICAg
ICAgICBpZiAobWFwLT5tX25leHRfZXh0ZW50KQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAq
bWFwLT5tX25leHRfZXh0ZW50ID0gcGdvZnMgKyAxOwo+PiArICAgICAgICAgICAgICAgaWYgKG1h
cC0+bV9uZXh0X2V4dGVudCkgewo+PiArICAgICAgICAgICAgICAgICAgICAgICAqbWFwLT5tX25l
eHRfZXh0ZW50ID0gcGdvZnM7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghX19pc192
YWxpZF9kYXRhX2Jsa2FkZHIoYmxrYWRkcikpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKm1hcC0+bV9uZXh0X2V4dGVudCArPSAxOwo+PiArICAgICAgICAgICAgICAgfQo+PiAg
ICAgICAgICB9Cj4+ICAgICAgICAgIGYyZnNfcHV0X2Rub2RlKCZkbik7Cj4gCj4gTWF5YmUgaXQg
Y2FuIGJlIHRoaXM/Cj4gaWYgKG1hcC0+bV9uZXh0X2V4dGVudCkKPiAJKm1hcC0+bV9uZXh0X2V4
dGVudCA9IGlzX2hvbGUgPyBwZ29mcyArIDEgOiBwZ29mczsKCkl0J3MgYmV0dGVyLCB3aWxsIHVw
ZGF0ZSwgdGhhbmsgeW91LiA6KQoKVGhhbmtzLAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

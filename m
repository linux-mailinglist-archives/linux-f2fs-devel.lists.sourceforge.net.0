Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F9B52CA9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Sep 2025 11:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olWpQK/NnP3J3BpIgAl7BWIZaQKGOpf+wwn8RUst2IE=; b=RhSKy4D1ELXWn8yQz4b1pKh7Er
	oojlh8MqMHSWFN/rgfGuvWYUzr0dXT7/pwK1Kf5Lko3/QiH+YTT9oog7RQg0Jevx5nYE6J1ljXbGY
	fOfH04DODBT3Ejgwo8PBhXwPUmusIXbCENuomh/xFfCktNkJpOjuoKy3xciumEhXye84=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwdHa-0004YH-Nv;
	Thu, 11 Sep 2025 09:07:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uwdHV-0004Y4-Ha
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Sep 2025 09:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7EcCaoxvgQiNJE90nENhNm5KzQzr4qw1Ttp3MVkzoWM=; b=NvqgeFu3vEnxXGaHMrtajzD8MT
 oHjvnw0WwG1mS4rLr79gf26uwYn1DfCV1d2qUEvm1PJbdBdHOGCe/AYZ1sqarIlbZmWi8/HtT1aTf
 Zv/5xXiQCU7A2ADNZuFM+/p3uIQQvSzJWqiwwFGyYkleVnz9z53rLfMnjiyLSWPAs+PE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7EcCaoxvgQiNJE90nENhNm5KzQzr4qw1Ttp3MVkzoWM=; b=SxuMu5CKYdHNdJwBkzsDpEHipX
 7oNvla4FijqummM9lefbJ2LS2It87AVYhRtMdAs1kXC2dr2zmPvQxUDVHBlK/BQoFbL6gQy/vC9fl
 LtujaU0TQmR3snHrGuGgVGzJ8ob+Qh+Csa8qn3R2XfQApX5vC6pO0yn/02w8xLjvXvwo=;
Received: from mta20.honor.com ([81.70.206.69] helo=mta20.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uwdHV-0006b5-JN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Sep 2025 09:07:54 +0000
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4cMsBv2bWFzYlNNL;
 Thu, 11 Sep 2025 17:07:19 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Sep
 2025 17:07:46 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Sep
 2025 17:07:45 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 11 Sep 2025 17:07:45 +0800
Message-ID: <20250911090745.2940557-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <228203f5-d3bf-46fb-b990-3de2eb2ff3e8@kernel.org>
References: <228203f5-d3bf-46fb-b990-3de2eb2ff3e8@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w003.hihonor.com (10.68.17.88) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 9/10/25 21:58, wangzijie wrote: > > When the data layout
 is like this: > > dnode1: dnode2: > > [0] A [0] NEW_ADDR > > [1] A+1 [1]
 0x0 > > ... .... > > [1016] A+1016 > > [1017] B (B!=A+1017) [1017 [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.206.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uwdHV-0006b5-JN
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
Cc: jaegeuk@kernel.org, wangzijie1@honor.com, linux-kernel@vger.kernel.org,
 feng.han@honor.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBPbiA5LzEwLzI1IDIxOjU4LCB3YW5nemlqaWUgd3JvdGU6Cj4gPiBXaGVuIHRoZSBkYXRhIGxh
eW91dCBpcyBsaWtlIHRoaXM6Cj4gPiBkbm9kZTE6ICAgICAgICAgICAgICAgICAgICAgZG5vZGUy
Ogo+ID4gWzBdICAgICAgQSAgICAgICAgICAgICAgICAgIFswXSAgICBORVdfQUREUgo+ID4gWzFd
ICAgICAgQSsxICAgICAgICAgICAgICAgIFsxXSAgICAweDAKPiA+IC4uLiAgICAgICAgICAgICAg
ICAgICAgICAgICAuLi4uCj4gPiBbMTAxNl0gICBBKzEwMTYKPiA+IFsxMDE3XSAgIEIgKEIhPUEr
MTAxNykgICAgICBbMTAxN10gMHgwCj4gPiAKPiA+IFdlIGNhbiBidWlsZCB0aGlzIGtpbmQgb2Yg
bGF5b3V0IGJ5IGZvbGxvd2luZyBzdGVwcyh3aXRoIGlfZXh0cmFfaXNpemU6MzYpOgo+ID4gLi9m
MmZzX2lvIHdyaXRlIDEgMCAxODgxIHJhbmQgZHN5bmMgdGVzdGZpbGUKPiA+IC4vZjJmc19pbyB3
cml0ZSAxIDE4ODEgMSByYW5kIGJ1ZmZlcmVkIHRlc3RmaWxlCj4gPiAuL2YyZnNfaW8gZmFsbG9j
YXRlIDAgNzcwODY3MiA0MDk2IHRlc3RmaWxlCj4gPiAKPiA+IEFuZCB3aGVuIHdlIG1hcCBmaXJz
dCBkYXRhIGJsb2NrIGluIGRub2RlMiwgd2Ugd2lsbCBnZXQgd3JvbmcgZXh0ZW50X2luZm8gZGF0
YToKPiA+IG1hcC0+bV9sZW4gPSAxCj4gPiBvZnMgPSBzdGFydF9wZ29mcyAtIG1hcC0+bV9sYmxr
ID0gMTg4MiAtIDE4ODEgPSAxCj4gPiAKPiA+IGVpLmZvZnMgPSBzdGFydF9wZ29mcyA9IDE4ODIK
PiA+IGVpLmxlbiA9IG1hcC0+bV9sZW4gLSBvZnMgPSAxIC0gMSA9IDAKPiA+IAo+ID4gRml4IGl0
IGJ5IHNraXBwaW5nIHVwZGF0aW5nIHRoaXMga2luZCBvZiBleHRlbnQgaW5mby4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogd2FuZ3ppamllIDx3YW5nemlqaWUxQGhvbm9yLmNvbT4KPiA+IC0tLQo+
ID4gIGZzL2YyZnMvZGF0YS5jIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0
YS5jCj4gPiBpbmRleCA3OTYxZTBkZGYuLmI4YmI3MTg1MiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2Yy
ZnMvZGF0YS5jCj4gPiArKysgYi9mcy9mMmZzL2RhdGEuYwo+ID4gQEAgLTE2NDksNiArMTY0OSw5
IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNf
bWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKPiA+ICAKPiA+ICAJCXN3aXRjaCAoZmxhZykgewo+
ID4gIAkJY2FzZSBGMkZTX0dFVF9CTE9DS19QUkVDQUNIRToKPiA+ICsJCQlpZiAoX19pc192YWxp
ZF9kYXRhX2Jsa2FkZHIobWFwLT5tX3BibGspICYmCj4gPiArCQkJCXN0YXJ0X3Bnb2ZzIC0gbWFw
LT5tX2xibGsgPT0gbWFwLT5tX2xlbikKPiA+ICsJCQkJbWFwLT5tX2ZsYWdzICY9IH5GMkZTX01B
UF9NQVBQRUQ7Cj4gCj4gSXQgbG9va3Mgd2UgbWlzc2VkIHRvIHJlc2V0IHZhbHVlIGZvciBtYXAg
dmFyaWFibGUgaW4gZjJmc19wcmVjYWNoZV9leHRlbnRzKCksCj4gd2hhdCBkbyB5b3UgdGhpbmsg
b2YgdGhpcz8KPiAKPiAtLS0KPiAgZnMvZjJmcy9maWxlLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gaW5kZXggMWFhZTQzNjFkMGE4Li4yYjE0
MTUxZDQxMzAgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiArKysgYi9mcy9mMmZzL2Zp
bGUuYwo+IEBAIC0zNTk5LDcgKzM1OTksNyBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX2lvX3ByaW8o
c3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ICBpbnQgZjJmc19wcmVjYWNo
ZV9leHRlbnRzKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gIHsKPiAgCXN0cnVjdCBmMmZzX2lub2Rl
X2luZm8gKmZpID0gRjJGU19JKGlub2RlKTsKPiAtCXN0cnVjdCBmMmZzX21hcF9ibG9ja3MgbWFw
Owo+ICsJc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyBtYXAgPSB7IDAgfTsKPiAgCXBnb2ZmX3QgbV9u
ZXh0X2V4dGVudDsKPiAgCWxvZmZfdCBlbmQ7Cj4gIAlpbnQgZXJyOwo+IEBAIC0zNjE3LDYgKzM2
MTcsOCBAQCBpbnQgZjJmc19wcmVjYWNoZV9leHRlbnRzKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4g
Cj4gIAl3aGlsZSAobWFwLm1fbGJsayA8IGVuZCkgewo+ICAJCW1hcC5tX2xlbiA9IGVuZCAtIG1h
cC5tX2xibGs7Cj4gKwkJbWFwLm1fcGJsayA9IDA7Cj4gKwkJbWFwLm1fZmxhZ3MgPSAwOwo+IAo+
ICAJCWYyZnNfZG93bl93cml0ZSgmZmktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPiAgCQllcnIgPSBm
MmZzX21hcF9ibG9ja3MoaW5vZGUsICZtYXAsIEYyRlNfR0VUX0JMT0NLX1BSRUNBQ0hFKTsKPiAt
LSAKPiAyLjQ5LjAKPiAKPiBUaGFua3MsCj4gCj4gPiAgCQkJZ290byBzeW5jX291dDsKPiA+ICAJ
CWNhc2UgRjJGU19HRVRfQkxPQ0tfQk1BUDoKPiA+ICAJCQltYXAtPm1fcGJsayA9IDA7CgoKV2Ug
aGF2ZSBhbHJlYWR5IHJlc2V0IG1fZmxhZ3MgKG1hcC0+bV9mbGFncyA9IDApIGluIGYyZnNfbWFw
X2Jsb2NrcygpLgoKSSB0aGluayB0aGF0IHRoaXMgYnVnIGlzIGNhdXNlZCBieSB3ZSBtaXNzZWQg
dG8gcmVzZXQgbV9mbGFncyB3aGVuIHdlCmdvdG8gbmV4dF9kbm9kZSBpbiBiZWxvdyBjYXNl77ya
CgpEYXRhIGxheW91dCBpcyBzb21ldGhpbmcgbGlrZSB0aGlzOgpkbm9kZTE6ICAgICAgICAgICAg
ICAgICAgICAgZG5vZGUyOgpbMF0gICAgICBBICAgICAgICAgICAgICAgICAgWzBdICAgIE5FV19B
RERSClsxXSAgICAgIEErMSAgICAgICAgICAgICAgICBbMV0gICAgMHgwCi4uLgpbMTAxNl0gICBB
KzEwMTYKWzEwMTddICAgQiAoQiE9QSsxMDE3KSAgICAgIFsxMDE3XSAweDAKCndlIG1hcCB0aGUg
bGFzdCBibG9jayh2YWxpZCBibGthZGRyKSBpbiBkbm9kZTE6Cm1hcC0+bV9mbGFncyB8PSBGMkZT
X01BUF9NQVBQRUQ7Cm1hcC0+bV9wYmxrID0gYmxrYWRkcih2YWxpZCBibGthZGRyKTsKbWFwLT5t
X2xlbiA9IDE7CnRoZW4gd2UgZ290byBuZXh0X2Rub2RlLCBtZWV0IHRoZSBmaXJzdCBibG9jayBp
biBkbm9kZTIoaG9sZSksIGdvdG8gc3luY19vdXQ6Cm1hcC0+bV9mbGFncyAmIEYyRlNfTUFQX01B
UFBFRCA9PSB0cnVlLCBhbmQgd2UgbWFrZSB3cm9uZyBibGthZGRyL2xlbiBmb3IgZXh0ZW50X2lu
Zm8uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=

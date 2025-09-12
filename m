Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC716B54A4B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Sep 2025 12:48:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHAJnEBksDYiHkULphFqOXE/cr3JQxBNM08zq9wlFDw=; b=XihSd1veS2Z7lYgxu5NPIrM3/N
	E47wsfzu6sPDhe4wVwX+oMJfveO/5znjD7qHG7asQ8Y9Yx8kCOk6Mh1z83uMf7uw0JgRBFoVijS5H
	Nf07Un+W7lquLz4BCLCipNiEwSB4JTz8ojFPiRzQ02DZKlGCJPg4h2dNRO+t7EkQqu60=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ux1Kg-0006WM-6r;
	Fri, 12 Sep 2025 10:48:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1ux1Ke-0006WG-De
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 10:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=53XgWrRqpR6Zp6/cbOR0b4hq6pd4no0PQaS8YOMYL+k=; b=KoqVkiGx/eMwkY5C/M93aZzaD4
 Ad7EpyhhuwEtL5e1bpWCi2DrmZlR5SpWeFiiH/hcCG2SoQocE3asxwVX3pfG7Gjk4QtL+FpF7Y6Q8
 yrbqxjV5pQ189t/E8AuCk1YDOvnYyzmmvTBzybT92d4MqXPEJjac4t0rtEX53DZ/k4vo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=53XgWrRqpR6Zp6/cbOR0b4hq6pd4no0PQaS8YOMYL+k=; b=Q6u2YOcDWqyf/Q6GZOl2vt2fAo
 i2u7mbfLqoeh78RFZ7GhE9vMYp29YqJVTFnbfenBk2gnInmMIOSYZpGf+5nbJLpDIVv3MAs/1U5bO
 d7sM4gGfDSTc0RiJ61CZyGKEHtoun1ZWKdcuxsTuY/EmWCb6WjOKdRm5JnM8kMEgmAKo=;
Received: from mta21.hihonor.com ([81.70.160.142])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ux1Kc-0000wR-Ml for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 10:48:44 +0000
Received: from w011.hihonor.com (unknown [10.68.20.122])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4cNWNf1hnyzYlKXl;
 Fri, 12 Sep 2025 18:48:02 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 12 Sep
 2025 18:48:30 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 12 Sep
 2025 18:48:30 +0800
From: wangzijie <wangzijie1@honor.com>
To: <chao@kernel.org>
Date: Fri, 12 Sep 2025 18:48:30 +0800
Message-ID: <20250912104830.3598270-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6464ded0-b25e-4ce8-a05b-6caa394fbe63@kernel.org>
References: <6464ded0-b25e-4ce8-a05b-6caa394fbe63@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w003.hihonor.com (10.68.17.88) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 9/12/2025 6:06 PM,
 wangzijie wrote: >>> On 9/12/2025 11:36
 AM, wangzijie wrote: >>>>> On 9/11/2025 5:07 PM, wangzijie wrote: >>>>>>>
 On 9/10/25 21:58, wangzijie wrote: >>>>>>>> When the data layou [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.160.142 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ux1Kc-0000wR-Ml
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
 feng.han@honor.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Pk9uIDkvMTIvMjAyNSA2OjA2IFBNLCB3YW5nemlqaWUgd3JvdGU6Cj4+PiBPbiA5LzEyLzIwMjUg
MTE6MzYgQU0sIHdhbmd6aWppZSB3cm90ZToKPj4+Pj4gT24gOS8xMS8yMDI1IDU6MDcgUE0sIHdh
bmd6aWppZSB3cm90ZToKPj4+Pj4+PiBPbiA5LzEwLzI1IDIxOjU4LCB3YW5nemlqaWUgd3JvdGU6
Cj4+Pj4+Pj4+IFdoZW4gdGhlIGRhdGEgbGF5b3V0IGlzIGxpa2UgdGhpczoKPj4+Pj4+Pj4gZG5v
ZGUxOiAgICAgICAgICAgICAgICAgICAgIGRub2RlMjoKPj4+Pj4+Pj4gWzBdICAgICAgQSAgICAg
ICAgICAgICAgICAgIFswXSAgICBORVdfQUREUgo+Pj4+Pj4+PiBbMV0gICAgICBBKzEgICAgICAg
ICAgICAgICAgWzFdICAgIDB4MAo+Pj4+Pj4+PiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAg
Li4uLgo+Pj4+Pj4+PiBbMTAxNl0gICBBKzEwMTYKPj4+Pj4+Pj4gWzEwMTddICAgQiAoQiE9QSsx
MDE3KSAgICAgIFsxMDE3XSAweDAKPj4+Pj4+Pj4KPj4+Pj4+Pj4gV2UgY2FuIGJ1aWxkIHRoaXMg
a2luZCBvZiBsYXlvdXQgYnkgZm9sbG93aW5nIHN0ZXBzKHdpdGggaV9leHRyYV9pc2l6ZTozNik6
Cj4+Pj4+Pj4+IC4vZjJmc19pbyB3cml0ZSAxIDAgMTg4MSByYW5kIGRzeW5jIHRlc3RmaWxlCj4+
Pj4+Pj4+IC4vZjJmc19pbyB3cml0ZSAxIDE4ODEgMSByYW5kIGJ1ZmZlcmVkIHRlc3RmaWxlCj4+
Pj4+Pj4+IC4vZjJmc19pbyBmYWxsb2NhdGUgMCA3NzA4NjcyIDQwOTYgdGVzdGZpbGUKPj4+Pj4+
Pj4KPj4+Pj4+Pj4gQW5kIHdoZW4gd2UgbWFwIGZpcnN0IGRhdGEgYmxvY2sgaW4gZG5vZGUyLCB3
ZSB3aWxsIGdldCB3cm9uZyBleHRlbnRfaW5mbyBkYXRhOgo+Pj4+Pj4+PiBtYXAtPm1fbGVuID0g
MQo+Pj4+Pj4+PiBvZnMgPSBzdGFydF9wZ29mcyAtIG1hcC0+bV9sYmxrID0gMTg4MiAtIDE4ODEg
PSAxCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGVpLmZvZnMgPSBzdGFydF9wZ29mcyA9IDE4ODIKPj4+Pj4+
Pj4gZWkubGVuID0gbWFwLT5tX2xlbiAtIG9mcyA9IDEgLSAxID0gMAo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBGaXggaXQgYnkgc2tpcHBpbmcgdXBkYXRpbmcgdGhpcyBraW5kIG9mIGV4dGVudCBpbmZvLgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiB3YW5nemlqaWUgPHdhbmd6aWppZTFAaG9u
b3IuY29tPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gICAgIGZzL2YyZnMvZGF0YS5jIHwgMyArKysK
Pj4+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4+Pj4+Pj4KPj4+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+
Pj4gaW5kZXggNzk2MWUwZGRmLi5iOGJiNzE4NTIgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2ZzL2Yy
ZnMvZGF0YS5jCj4+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4+IEBAIC0xNjQ5
LDYgKzE2NDksOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0
cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpCj4+Pj4+Pj4+ICAgICAKPj4+Pj4+
Pj4gICAgIAkJc3dpdGNoIChmbGFnKSB7Cj4+Pj4+Pj4+ICAgICAJCWNhc2UgRjJGU19HRVRfQkxP
Q0tfUFJFQ0FDSEU6Cj4+Pj4+Pj4+ICsJCQlpZiAoX19pc192YWxpZF9kYXRhX2Jsa2FkZHIobWFw
LT5tX3BibGspICYmCj4+Pj4+Pj4+ICsJCQkJc3RhcnRfcGdvZnMgLSBtYXAtPm1fbGJsayA9PSBt
YXAtPm1fbGVuKQo+Pj4+Pj4+PiArCQkJCW1hcC0+bV9mbGFncyAmPSB+RjJGU19NQVBfTUFQUEVE
Owo+Pj4+Pj4+Cj4+Pj4+Pj4gSXQgbG9va3Mgd2UgbWlzc2VkIHRvIHJlc2V0IHZhbHVlIGZvciBt
YXAgdmFyaWFibGUgaW4gZjJmc19wcmVjYWNoZV9leHRlbnRzKCksCj4+Pj4+Pj4gd2hhdCBkbyB5
b3UgdGhpbmsgb2YgdGhpcz8KPj4+Pj4+Pgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+ICAgICBmcy9mMmZz
L2ZpbGUuYyB8IDQgKysrLQo+Pj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9m
aWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+Pj4+IGluZGV4IDFhYWU0MzYxZDBhOC4uMmIxNDE1
MWQ0MTMwIDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+Pj4gKysrIGIv
ZnMvZjJmcy9maWxlLmMKPj4+Pj4+PiBAQCAtMzU5OSw3ICszNTk5LDcgQEAgc3RhdGljIGludCBm
MmZzX2lvY19pb19wcmlvKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPj4+
Pj4+PiAgICAgaW50IGYyZnNfcHJlY2FjaGVfZXh0ZW50cyhzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+
Pj4+Pj4+ICAgICB7Cj4+Pj4+Pj4gICAgIAlzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvICpmaSA9IEYy
RlNfSShpbm9kZSk7Cj4+Pj4+Pj4gLQlzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzIG1hcDsKPj4+Pj4+
PiArCXN0cnVjdCBmMmZzX21hcF9ibG9ja3MgbWFwID0geyAwIH07Cj4+Pj4+Pj4gICAgIAlwZ29m
Zl90IG1fbmV4dF9leHRlbnQ7Cj4+Pj4+Pj4gICAgIAlsb2ZmX3QgZW5kOwo+Pj4+Pj4+ICAgICAJ
aW50IGVycjsKPj4+Pj4+PiBAQCAtMzYxNyw2ICszNjE3LDggQEAgaW50IGYyZnNfcHJlY2FjaGVf
ZXh0ZW50cyhzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgIAl3aGlsZSAo
bWFwLm1fbGJsayA8IGVuZCkgewo+Pj4+Pj4+ICAgICAJCW1hcC5tX2xlbiA9IGVuZCAtIG1hcC5t
X2xibGs7Cj4+Pj4+Pj4gKwkJbWFwLm1fcGJsayA9IDA7Cj4+Pj4+Pj4gKwkJbWFwLm1fZmxhZ3Mg
PSAwOwo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgIAkJZjJmc19kb3duX3dyaXRlKCZmaS0+aV9nY19yd3Nl
bVtXUklURV0pOwo+Pj4+Pj4+ICAgICAJCWVyciA9IGYyZnNfbWFwX2Jsb2Nrcyhpbm9kZSwgJm1h
cCwgRjJGU19HRVRfQkxPQ0tfUFJFQ0FDSEUpOwo+Pj4+Pj4+IC0tIAo+Pj4+Pj4+IDIuNDkuMAo+
Pj4+Pj4+Cj4+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgICAJCQlnb3RvIHN5bmNf
b3V0Owo+Pj4+Pj4+PiAgICAgCQljYXNlIEYyRlNfR0VUX0JMT0NLX0JNQVA6Cj4+Pj4+Pj4+ICAg
ICAJCQltYXAtPm1fcGJsayA9IDA7Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFdlIGhhdmUgYWxyZWFk
eSByZXNldCBtX2ZsYWdzIChtYXAtPm1fZmxhZ3MgPSAwKSBpbiBmMmZzX21hcF9ibG9ja3MoKS4K
Pj4+Pj4KPj4+Pj4gWmlqaWU6Cj4+Pj4+Cj4+Pj4+IE9vcHMsIHRoYXQncyByaWdodCwgdGhhbmtz
IGZvciBjb3JyZWN0aW5nIG1lLgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEkgdGhpbmsgdGhhdCB0aGlz
IGJ1ZyBpcyBjYXVzZWQgYnkgd2UgbWlzc2VkIHRvIHJlc2V0IG1fZmxhZ3Mgd2hlbiB3ZQo+Pj4+
Pj4gZ290byBuZXh0X2Rub2RlIGluIGJlbG93IGNhc2XvvJoKPj4+Pj4+Cj4+Pj4+PiBEYXRhIGxh
eW91dCBpcyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+Pj4+Pj4gZG5vZGUxOiAgICAgICAgICAgICAg
ICAgICAgIGRub2RlMjoKPj4+Pj4+IFswXSAgICAgIEEgICAgICAgICAgICAgICAgICBbMF0gICAg
TkVXX0FERFIKPj4+Pj4+IFsxXSAgICAgIEErMSAgICAgICAgICAgICAgICBbMV0gICAgMHgwCj4+
Pj4+PiAuLi4KPj4+Pj4+IFsxMDE2XSAgIEErMTAxNgo+Pj4+Pj4gWzEwMTddICAgQiAoQiE9QSsx
MDE3KSAgICAgIFsxMDE3XSAweDAKPj4+Pj4+Cj4+Pj4+PiB3ZSBtYXAgdGhlIGxhc3QgYmxvY2so
dmFsaWQgYmxrYWRkcikgaW4gZG5vZGUxOgo+Pj4+Pj4gbWFwLT5tX2ZsYWdzIHw9IEYyRlNfTUFQ
X01BUFBFRDsKPj4+Pj4+IG1hcC0+bV9wYmxrID0gYmxrYWRkcih2YWxpZCBibGthZGRyKTsKPj4+
Pj4+IG1hcC0+bV9sZW4gPSAxOwo+Pj4+Pj4gdGhlbiB3ZSBnb3RvIG5leHRfZG5vZGUsIG1lZXQg
dGhlIGZpcnN0IGJsb2NrIGluIGRub2RlMihob2xlKSwgZ290byBzeW5jX291dDoKPj4+Pj4+IG1h
cC0+bV9mbGFncyAmIEYyRlNfTUFQX01BUFBFRCA9PSB0cnVlLCBhbmQgd2UgbWFrZSB3cm9uZyBi
bGthZGRyL2xlbiBmb3IgZXh0ZW50X2luZm8uCj4+Pj4+Cj4+Pj4+IFNvLCBjYW4geW91IHBsZWFz
ZSBhZGQgYWJvdmUgZXhwbGFuYXRpb24gaW50byBjb21taXQgbWVzc2FnZT8gdGhhdAo+Pj4+PiBz
aG91bGQgYmUgaGVscGZ1bCBmb3IgdW5kZXJzdGFuZGluZyB0aGUgcHJvYmxlbSBtb3JlIGNsZWFy
bHkuCj4+Pj4+Cj4+Pj4+IFBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzIGNhc2Ugdy8geW91ciBw
YXRjaDoKPj4+Pj4KPj4+Pj4gbWtmcy5mMmZzIC1PIGV4dHJhX2F0dHIsY29tcHJlc3Npb24gL2Rl
di92ZGIgLWYKPj4+Pj4gbW91bnQgL2Rldi92ZGIgL21udC9mMmZzIC1vIG1vZGU9bGZzCj4+Pj4+
IGNkIC9tbnQvZjJmcwo+Pj4+PiBmMmZzX2lvIHdyaXRlIDEgMCAxODgzIHJhbmQgZHN5bmMgdGVz
dGZpbGUKPj4+Pj4gZjJmc19pbyBmYWxsb2NhdGUgMCA3NzEyNzY4IDQwOTYgdGVzdGZpbGUKPj4+
Pj4gZjJmc19pbyB3cml0ZSAxIDE4ODEgMSByYW5kIGJ1ZmZlcmVkIHRlc3RmaWxlCj4+Pj4+IHhm
c19pbyB0ZXN0ZmlsZSAtYyAiZnN5bmMiCj4+Pj4+IGNkIC8KPj4+Pj4gdW1vdW50IC9tbnQvZjJm
cwo+Pj4+PiBtb3VudCAvZGV2L3ZkYiAvbW50L2YyZnMKPj4+Pj4gZjJmc19pbyBwcmVjYWNoZV9l
eHRlbnRzIC9tbnQvZjJmcy90ZXN0ZmlsZQo+Pj4+PiB1bW91bnQgL21udC9mMmZzCj4+Pj4+Cj4+
Pj4+ICAgICAgICAgICAgZjJmc19pby03MzMgICAgIFswMTBdIC4uLi4uICAgIDc4LjEzNDEzNjog
ZjJmc191cGRhdGVfcmVhZF9leHRlbnRfdHJlZV9yYW5nZTogZGV2ID0gKDI1MywxNiksIGlubyA9
IDQsIHBnb2ZzID0gMTg4MiwgbGVuID0gMCwgYmxrYWRkciA9IDE3NDEwLCBjX2xlbiA9IDAKPj4+
Pj4KPj4+Pj4gSSBzdXNwZWN0IHdlIG5lZWQgdGhpcz8KPj4+Pj4KPj4+Pj4gQEAgLTE3ODQsNyAr
MTc4MSw4IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0
IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKPj4+Pj4gICAgICAgICAgIH0KPj4+Pj4K
Pj4+Pj4gICAgICAgICAgIGlmIChmbGFnID09IEYyRlNfR0VUX0JMT0NLX1BSRUNBQ0hFKSB7Cj4+
Pj4+IC0gICAgICAgICAgICAgICBpZiAobWFwLT5tX2ZsYWdzICYgRjJGU19NQVBfTUFQUEVEKSB7
Cj4+Pj4+ICsgICAgICAgICAgICAgICBpZiAoKG1hcC0+bV9mbGFncyAmIEYyRlNfTUFQX01BUFBF
RCkgJiYKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgKG1hcC0+bV9sZW4gLSBvZnMpKSB7
Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9mcyA9IHN0YXJ0
X3Bnb2ZzIC0gbWFwLT5tX2xibGs7Cj4+Pj4+Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZjJmc191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVfcmFuZ2UoJmRuLAo+Pj4+Cj4+Pj4gVGhh
bmtzIGZvciBwb2ludGluZyBvdXQgdGhpcy4gTGV0IG1lIGZpbmQgYSB3YXkgdG8gY292ZXIgdGhl
c2UgY2FzZXMgYW5kIGRvIG1vcmUgdGVzdC4KPj4+Pgo+Pj4+PiBCVFcsIEkgZmluZCBhbm90aGVy
IGJ1ZywgaWYgb25lIGJsa2FkZHIgaXMgYWRqY2VudCB0byBwcmV2aW91cyBleHRlbnQsCj4+Pj4+
IGJ1dCBhbmQgaXQgaXMgdmFsaWQsIHdlIG5lZWQgdG8gc2V0IG1fbmV4dF9leHRlbnQgdG8gcGdv
ZnMgcmF0aGVyIHRoYW4KPj4+Pj4gcGdvZnMgKyAxLgo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+PiBpbmRleCBjYmY4ODQxNjQyYzcu
LmFjODhlZDY4MDU5YyAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gKysr
IGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gQEAgLTE3ODksOCArMTc4OSwxMSBAQCBpbnQgZjJmc19t
YXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1h
cCwgaW50IGZsYWcpCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFy
dF9wZ29mcywgbWFwLT5tX3BibGsgKyBvZnMsCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtYXAtPm1fbGVuIC0gb2ZzKTsKPj4+Pj4gICAgICAgICAgICAgICAgICAgfQo+
Pj4+PiAtICAgICAgICAgICAgICAgaWYgKG1hcC0+bV9uZXh0X2V4dGVudCkKPj4+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgKm1hcC0+bV9uZXh0X2V4dGVudCA9IHBnb2ZzICsgMTsKPj4+Pj4g
KyAgICAgICAgICAgICAgIGlmIChtYXAtPm1fbmV4dF9leHRlbnQpIHsKPj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgKm1hcC0+bV9uZXh0X2V4dGVudCA9IHBnb2ZzOwo+Pj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoIV9faXNfdmFsaWRfZGF0YV9ibGthZGRyKGJsa2FkZHIpKQo+
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICptYXAtPm1fbmV4dF9leHRlbnQg
Kz0gMTsKPj4+Pj4gKyAgICAgICAgICAgICAgIH0KPj4+Pj4gICAgICAgICAgIH0KPj4+Pj4gICAg
ICAgICAgIGYyZnNfcHV0X2Rub2RlKCZkbik7Cj4+Pj4KPj4+PiBNYXliZSBpdCBjYW4gYmUgdGhp
cz8KPj4+PiBpZiAobWFwLT5tX25leHRfZXh0ZW50KQo+Pj4+IAkqbWFwLT5tX25leHRfZXh0ZW50
ID0gaXNfaG9sZSA/IHBnb2ZzICsgMSA6IHBnb2ZzOwo+Pj4KPj4+IEl0J3MgYmV0dGVyLCB3aWxs
IHVwZGF0ZSwgdGhhbmsgeW91LiA6KQo+Pj4KPj4+IFRoYW5rcywKPj4gCj4+IEhpIENoYW8sCj4+
IEkgdGVzdCBzb21lIGNhc2VzIHdpdGggdGhpcyBjaGFuZ2U6Cj4+IAo+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+PiBpbmRleCA3OTYxZTBkZGYuLjcwOTNm
ZGM5NSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4gKysrIGIvZnMvZjJmcy9kYXRh
LmMKPj4gQEAgLTE3NzcsMTMgKzE3NzcsMTMgQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3Qg
aW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnKQo+PiAg
ICAgICAgICBpZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19QUkVDQUNIRSkgewo+PiAgICAgICAg
ICAgICAgICAgIGlmIChtYXAtPm1fZmxhZ3MgJiBGMkZTX01BUF9NQVBQRUQpIHsKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvZnMgPSBzdGFydF9wZ29mcyAtIG1hcC0+
bV9sYmxrOwo+PiAtCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdXBkYXRlX3JlYWRf
ZXh0ZW50X2NhY2hlX3JhbmdlKCZkbiwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdGFydF9wZ29mcywgbWFwLT5tX3BibGsgKyBvZnMsCj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbWFwLT5tX2xlbiAtIG9mcyk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IGlmIChtYXAtPm1fbGVuIC0gb2ZzID4gMCkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmMmZzX3VwZGF0ZV9yZWFkX2V4dGVudF9jYWNoZV9yYW5nZSgmZG4sCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFydF9wZ29mcywgbWFwLT5tX3BibGsg
KyBvZnMsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXAtPm1f
bGVuIC0gb2ZzKTsKPj4gICAgICAgICAgICAgICAgICB9Cj4+ICAgICAgICAgICAgICAgICAgaWYg
KG1hcC0+bV9uZXh0X2V4dGVudCkKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgKm1hcC0+bV9u
ZXh0X2V4dGVudCA9IHBnb2ZzICsgMTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgKm1hcC0+
bV9uZXh0X2V4dGVudCA9IGlzX2hvbGUgPyBwZ29mcyArIDEgOiBwZ29mczsKPj4gICAgICAgICAg
fQo+PiAgICAgICAgICBmMmZzX3B1dF9kbm9kZSgmZG4pOwo+PiAgIHVubG9ja19vdXQ6Cj4+IAo+
PiAKPj4gdGVzdCBjYXNlczoKPj4gCj4+IGNhc2UxOgo+PiBkbm9kZTE6ICAgICAgICAgICAgICAg
ICAgICAgZG5vZGUyOgo+PiBbMF0gICAgICBBICAgICAgICAgICAgICAgICAgWzBdICAgIE5FV19B
RERSCj4+IFsxXSAgICAgIEErMSAgICAgICAgICAgICAgICBbMV0gICAgMHgwCj4+IC4uLiAgICAg
ICAgICAgICAgICAgICAgICAgICAuLi4uCj4+IFsxMDE2XSAgIEErMTAxNgo+PiBbMTAxN10gICBC
IChCIT1BKzEwMTcpICAgICAgWzEwMTddIDB4MAo+PiAKPj4gY2FzZTI6Cj4+IGRub2RlMTogICAg
ICAgICAgICAgICAgICAgICBkbm9kZTI6Cj4+IFswXSAgICAgIEEgICAgICAgICAgICAgICAgICBb
MF0gICAgQyAoQyE9QisxKQo+PiBbMV0gICAgICBBKzEgICAgICAgICAgICAgICAgWzFdICAgIEMr
MQo+PiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+PiBbMTAxNl0gICBBKzEwMTYK
Pj4gWzEwMTddICAgQiAoQiE9QSsxMDE3KSAgICAgIFsxMDE3XSAweDAKPj4gCj4+IGNhc2UzOgo+
PiBkbm9kZTE6ICAgICAgICAgICAgICAgICAgICAgZG5vZGUyOgo+PiBbMF0gICAgICBBICAgICAg
ICAgICAgICAgICAgWzBdICAgIEMgKEMhPUIrMikKPj4gWzFdICAgICAgQSsxICAgICAgICAgICAg
ICAgIFsxXSAgICBDKzEKPj4gLi4uICAgICAgICAgICAgICAgICAgICAgICAgIC4uLi4KPj4gWzEw
MTVdICAgQSsxMDE1Cj4+IFsxMDE2XSAgIEIgKEIhPUErMTAxNikKPj4gWzEwMTddICAgQisxICAg
ICAgICAgICAgICAgIFsxMDE3XSAweDAKPj4gCj4+IGNhc2U0Ogo+PiBvbmUgYmxrYWRkciBpcyBh
ZGpjZW50IHRvIHByZXZpb3VzIGV4dGVudCwgYW5kIGl0IGlzIHZhbGlkLgo+ID4gPiBBbmQgZnJv
bSB0aGUgcmVzdWx0LCBpdCBzZWVtcyB0aGlzIGNoYW5nZSBjYW4gY292ZXIgdGhlc2UKPj4gc2l0
dWF0aW9ucyBjb3JyZWN0bHkuCj4+IERvIHdlIG5lZWQgYSBwYXRjaCB3aXRoIHRoaXMgY2hhbmdl
Pwo+Cj5aaWppZSwgdGhhbmtzIGZvciB0aGUgdGVzdC4KPgo+SU1PLCB3ZSdkIGJldHRlciB1c2Ug
dGhlc2UgY2hhbmdlczoKPgo+LQo+LSAgICAgICAgICAgICAgICAgICAgICAgZjJmc191cGRhdGVf
cmVhZF9leHRlbnRfY2FjaGVfcmFuZ2UoJmRuLAo+LSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdGFydF9wZ29mcywgbWFwLT5tX3BibGsgKyBvZnMsCj4tICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG1hcC0+bV9sZW4gLSBvZnMpOwo+KyAgICAgICAgICAgICAgICAgICAgICAg
aWYgKG1hcC0+bV9sZW4gLSBvZnMgPiAwKQo+KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmMmZzX3VwZGF0ZV9yZWFkX2V4dGVudF9jYWNoZV9yYW5nZSgmZG4sCj4rICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnRfcGdvZnMsIG1hcC0+bV9wYmxrICsgb2Zz
LAo+KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcC0+bV9sZW4gLSBv
ZnMpOwo+Cj5pbnN0ZWFkIG9mCj4KPiAgICAJCXN3aXRjaCAoZmxhZykgewo+ICAgIAkJY2FzZSBG
MkZTX0dFVF9CTE9DS19QUkVDQUNIRToKPisJCQlpZiAoX19pc192YWxpZF9kYXRhX2Jsa2FkZHIo
bWFwLT5tX3BibGspICYmCj4rCQkJCXN0YXJ0X3Bnb2ZzIC0gbWFwLT5tX2xibGsgPT0gbWFwLT5t
X2xlbikKPisJCQkJbWFwLT5tX2ZsYWdzICY9IH5GMkZTX01BUF9NQVBQRUQ7Cj4KPkNhbiB5b3Ug
cGxlYXNlIHJlYmFzZSB5b3VyIHBhdGNoc2V0IG9uIG1pbmUgYW5kIHNlbmQgdjI/Cj4KPmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNTA5MTIwODEyNTAuNDQzODMt
MS1jaGFvQGtlcm5lbC5vcmcKPgo+QlRXLCBwbGVhc2UgYWRkIGZpeGVzIGxpbmUgaW4geW91ciBw
YXRjaC4KPgo+VGhhbmtzLAoKT0ssIEkgd2lsbCBjb3JyZWN0IHRoaXMgcGFydCBhbmQgZm9sbG93
IHlvdXIgc3VnZ2VzdGlvbi4gVGhhbmsgeW91LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

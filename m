Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63694B54108
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Sep 2025 05:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OilqcBY+itINtLZnwrtggATkwfsApYzKSs0J1hse8s=; b=PQ6yB2JKhupoi/JVB3xkb4PN2S
	wmEg9TzzsbGxBQ7Ct8kGAjKjQonxOGKas5oroG0VUP69kgNGMt9GlLorGoeKOhZf2g2qIu1A6uZRF
	ENJM9M3mg7OJZlziMr5ITpdIGpIGe3CRk30azH/KRE6EJiugKZeft50lyBbQYJYAznVU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwuaG-00056z-MU;
	Fri, 12 Sep 2025 03:36:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uwuaF-00056t-L3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 03:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bjVuyG1y4lyG/hI1kgPadanQZ3MPFUBRApzFhKiOwOc=; b=mHseP3hPD2jsGarAWcatR8OeJl
 NP4QlXH9MNAbviZrmAc3JydD4HUv4JunL5OquQygWJ/h3n8SW1g9IFGforw7pR7fBiHD8cEoJ5mTU
 /6uP6ctSlHA/AIs2pIX/HJX+FEPvr9KDIjylUKxVadwQdNbtgB6YiECvjy1R8Zfxk300=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bjVuyG1y4lyG/hI1kgPadanQZ3MPFUBRApzFhKiOwOc=; b=Mqe+Z1CcNv3VVTlF/hALP8Q5du
 xvs3FveHhlvwE7yqjDKsSQxHi2j4Ghm7pmkP/eWAs3hCxO7HXSVz5JY3SKIH7HyFO6DsSFIiKH+Q4
 S4+JAjwKYPkwNeju4DTYRO924jWIwHYztNo1R0KsB5PK7p7qeXdOWU4jRfVQpSBQxS7s=;
Received: from mta20.hihonor.com ([81.70.206.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uwuaE-0008TL-B1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 03:36:23 +0000
Received: from w011.hihonor.com (unknown [10.68.20.122])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4cNKnp3vwYzYlFNy;
 Fri, 12 Sep 2025 11:35:42 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 12 Sep
 2025 11:36:09 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 12 Sep
 2025 11:36:09 +0800
From: wangzijie <wangzijie1@honor.com>
To: <chao@kernel.org>
Date: Fri, 12 Sep 2025 11:36:09 +0800
Message-ID: <20250912033609.3033352-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c83ac24b-9997-4f2e-9e51-00c29909ad85@kernel.org>
References: <c83ac24b-9997-4f2e-9e51-00c29909ad85@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 9/11/2025 5:07 PM, wangzijie wrote: >>> On 9/10/25 21:58,
 wangzijie wrote: >>>> When the data layout is like this: >>>> dnode1: dnode2:
 >>>> [0] A [0] NEW_ADDR >>>> [1] A+1 [1] 0x0 >>>> ... .... > [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.206.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uwuaE-0008TL-B1
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

Pk9uIDkvMTEvMjAyNSA1OjA3IFBNLCB3YW5nemlqaWUgd3JvdGU6Cj4+PiBPbiA5LzEwLzI1IDIx
OjU4LCB3YW5nemlqaWUgd3JvdGU6Cj4+Pj4gV2hlbiB0aGUgZGF0YSBsYXlvdXQgaXMgbGlrZSB0
aGlzOgo+Pj4+IGRub2RlMTogICAgICAgICAgICAgICAgICAgICBkbm9kZTI6Cj4+Pj4gWzBdICAg
ICAgQSAgICAgICAgICAgICAgICAgIFswXSAgICBORVdfQUREUgo+Pj4+IFsxXSAgICAgIEErMSAg
ICAgICAgICAgICAgICBbMV0gICAgMHgwCj4+Pj4gLi4uICAgICAgICAgICAgICAgICAgICAgICAg
IC4uLi4KPj4+PiBbMTAxNl0gICBBKzEwMTYKPj4+PiBbMTAxN10gICBCIChCIT1BKzEwMTcpICAg
ICAgWzEwMTddIDB4MAo+Pj4+Cj4+Pj4gV2UgY2FuIGJ1aWxkIHRoaXMga2luZCBvZiBsYXlvdXQg
YnkgZm9sbG93aW5nIHN0ZXBzKHdpdGggaV9leHRyYV9pc2l6ZTozNik6Cj4+Pj4gLi9mMmZzX2lv
IHdyaXRlIDEgMCAxODgxIHJhbmQgZHN5bmMgdGVzdGZpbGUKPj4+PiAuL2YyZnNfaW8gd3JpdGUg
MSAxODgxIDEgcmFuZCBidWZmZXJlZCB0ZXN0ZmlsZQo+Pj4+IC4vZjJmc19pbyBmYWxsb2NhdGUg
MCA3NzA4NjcyIDQwOTYgdGVzdGZpbGUKPj4+Pgo+Pj4+IEFuZCB3aGVuIHdlIG1hcCBmaXJzdCBk
YXRhIGJsb2NrIGluIGRub2RlMiwgd2Ugd2lsbCBnZXQgd3JvbmcgZXh0ZW50X2luZm8gZGF0YToK
Pj4+PiBtYXAtPm1fbGVuID0gMQo+Pj4+IG9mcyA9IHN0YXJ0X3Bnb2ZzIC0gbWFwLT5tX2xibGsg
PSAxODgyIC0gMTg4MSA9IDEKPj4+Pgo+Pj4+IGVpLmZvZnMgPSBzdGFydF9wZ29mcyA9IDE4ODIK
Pj4+PiBlaS5sZW4gPSBtYXAtPm1fbGVuIC0gb2ZzID0gMSAtIDEgPSAwCj4+Pj4KPj4+PiBGaXgg
aXQgYnkgc2tpcHBpbmcgdXBkYXRpbmcgdGhpcyBraW5kIG9mIGV4dGVudCBpbmZvLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogd2FuZ3ppamllIDx3YW5nemlqaWUxQGhvbm9yLmNvbT4KPj4+PiAt
LS0KPj4+PiAgIGZzL2YyZnMvZGF0YS5jIHwgMyArKysKPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2Zz
L2YyZnMvZGF0YS5jCj4+Pj4gaW5kZXggNzk2MWUwZGRmLi5iOGJiNzE4NTIgMTAwNjQ0Cj4+Pj4g
LS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+IEBAIC0x
NjQ5LDYgKzE2NDksOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpCj4+Pj4gICAKPj4+PiAgIAkJ
c3dpdGNoIChmbGFnKSB7Cj4+Pj4gICAJCWNhc2UgRjJGU19HRVRfQkxPQ0tfUFJFQ0FDSEU6Cj4+
Pj4gKwkJCWlmIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihtYXAtPm1fcGJsaykgJiYKPj4+PiAr
CQkJCXN0YXJ0X3Bnb2ZzIC0gbWFwLT5tX2xibGsgPT0gbWFwLT5tX2xlbikKPj4+PiArCQkJCW1h
cC0+bV9mbGFncyAmPSB+RjJGU19NQVBfTUFQUEVEOwo+Pj4KPj4+IEl0IGxvb2tzIHdlIG1pc3Nl
ZCB0byByZXNldCB2YWx1ZSBmb3IgbWFwIHZhcmlhYmxlIGluIGYyZnNfcHJlY2FjaGVfZXh0ZW50
cygpLAo+Pj4gd2hhdCBkbyB5b3UgdGhpbmsgb2YgdGhpcz8KPj4+Cj4+PiAtLS0KPj4+ICAgZnMv
ZjJmcy9maWxlLmMgfCA0ICsrKy0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2Zz
L2YyZnMvZmlsZS5jCj4+PiBpbmRleCAxYWFlNDM2MWQwYTguLjJiMTQxNTFkNDEzMCAxMDA2NDQK
Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4gQEAg
LTM1OTksNyArMzU5OSw3IEBAIHN0YXRpYyBpbnQgZjJmc19pb2NfaW9fcHJpbyhzdHJ1Y3QgZmls
ZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4+PiAgIGludCBmMmZzX3ByZWNhY2hlX2V4dGVu
dHMoc3RydWN0IGlub2RlICppbm9kZSkKPj4+ICAgewo+Pj4gICAJc3RydWN0IGYyZnNfaW5vZGVf
aW5mbyAqZmkgPSBGMkZTX0koaW5vZGUpOwo+Pj4gLQlzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzIG1h
cDsKPj4+ICsJc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyBtYXAgPSB7IDAgfTsKPj4+ICAgCXBnb2Zm
X3QgbV9uZXh0X2V4dGVudDsKPj4+ICAgCWxvZmZfdCBlbmQ7Cj4+PiAgIAlpbnQgZXJyOwo+Pj4g
QEAgLTM2MTcsNiArMzYxNyw4IEBAIGludCBmMmZzX3ByZWNhY2hlX2V4dGVudHMoc3RydWN0IGlu
b2RlICppbm9kZSkKPj4+Cj4+PiAgIAl3aGlsZSAobWFwLm1fbGJsayA8IGVuZCkgewo+Pj4gICAJ
CW1hcC5tX2xlbiA9IGVuZCAtIG1hcC5tX2xibGs7Cj4+PiArCQltYXAubV9wYmxrID0gMDsKPj4+
ICsJCW1hcC5tX2ZsYWdzID0gMDsKPj4+Cj4+PiAgIAkJZjJmc19kb3duX3dyaXRlKCZmaS0+aV9n
Y19yd3NlbVtXUklURV0pOwo+Pj4gICAJCWVyciA9IGYyZnNfbWFwX2Jsb2Nrcyhpbm9kZSwgJm1h
cCwgRjJGU19HRVRfQkxPQ0tfUFJFQ0FDSEUpOwo+Pj4gLS0gCj4+PiAyLjQ5LjAKPj4+Cj4+PiBU
aGFua3MsCj4+Pgo+Pj4+ICAgCQkJZ290byBzeW5jX291dDsKPj4+PiAgIAkJY2FzZSBGMkZTX0dF
VF9CTE9DS19CTUFQOgo+Pj4+ICAgCQkJbWFwLT5tX3BibGsgPSAwOwo+PiAKPj4gCj4+IFdlIGhh
dmUgYWxyZWFkeSByZXNldCBtX2ZsYWdzIChtYXAtPm1fZmxhZ3MgPSAwKSBpbiBmMmZzX21hcF9i
bG9ja3MoKS4KPgo+WmlqaWU6Cj4KPk9vcHMsIHRoYXQncyByaWdodCwgdGhhbmtzIGZvciBjb3Jy
ZWN0aW5nIG1lLgo+Cj4+IAo+PiBJIHRoaW5rIHRoYXQgdGhpcyBidWcgaXMgY2F1c2VkIGJ5IHdl
IG1pc3NlZCB0byByZXNldCBtX2ZsYWdzIHdoZW4gd2UKPj4gZ290byBuZXh0X2Rub2RlIGluIGJl
bG93IGNhc2XvvJoKPj4gCj4+IERhdGEgbGF5b3V0IGlzIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+
IGRub2RlMTogICAgICAgICAgICAgICAgICAgICBkbm9kZTI6Cj4+IFswXSAgICAgIEEgICAgICAg
ICAgICAgICAgICBbMF0gICAgTkVXX0FERFIKPj4gWzFdICAgICAgQSsxICAgICAgICAgICAgICAg
IFsxXSAgICAweDAKPj4gLi4uCj4+IFsxMDE2XSAgIEErMTAxNgo+PiBbMTAxN10gICBCIChCIT1B
KzEwMTcpICAgICAgWzEwMTddIDB4MAo+PiAKPj4gd2UgbWFwIHRoZSBsYXN0IGJsb2NrKHZhbGlk
IGJsa2FkZHIpIGluIGRub2RlMToKPj4gbWFwLT5tX2ZsYWdzIHw9IEYyRlNfTUFQX01BUFBFRDsK
Pj4gbWFwLT5tX3BibGsgPSBibGthZGRyKHZhbGlkIGJsa2FkZHIpOwo+PiBtYXAtPm1fbGVuID0g
MTsKPj4gdGhlbiB3ZSBnb3RvIG5leHRfZG5vZGUsIG1lZXQgdGhlIGZpcnN0IGJsb2NrIGluIGRu
b2RlMihob2xlKSwgZ290byBzeW5jX291dDoKPj4gbWFwLT5tX2ZsYWdzICYgRjJGU19NQVBfTUFQ
UEVEID09IHRydWUsIGFuZCB3ZSBtYWtlIHdyb25nIGJsa2FkZHIvbGVuIGZvciBleHRlbnRfaW5m
by4KPgo+U28sIGNhbiB5b3UgcGxlYXNlIGFkZCBhYm92ZSBleHBsYW5hdGlvbiBpbnRvIGNvbW1p
dCBtZXNzYWdlPyB0aGF0Cj5zaG91bGQgYmUgaGVscGZ1bCBmb3IgdW5kZXJzdGFuZGluZyB0aGUg
cHJvYmxlbSBtb3JlIGNsZWFybHkuCj4KPlBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzIGNhc2Ug
dy8geW91ciBwYXRjaDoKPgo+bWtmcy5mMmZzIC1PIGV4dHJhX2F0dHIsY29tcHJlc3Npb24gL2Rl
di92ZGIgLWYKPm1vdW50IC9kZXYvdmRiIC9tbnQvZjJmcyAtbyBtb2RlPWxmcwo+Y2QgL21udC9m
MmZzCj5mMmZzX2lvIHdyaXRlIDEgMCAxODgzIHJhbmQgZHN5bmMgdGVzdGZpbGUKPmYyZnNfaW8g
ZmFsbG9jYXRlIDAgNzcxMjc2OCA0MDk2IHRlc3RmaWxlCj5mMmZzX2lvIHdyaXRlIDEgMTg4MSAx
IHJhbmQgYnVmZmVyZWQgdGVzdGZpbGUKPnhmc19pbyB0ZXN0ZmlsZSAtYyAiZnN5bmMiCj5jZCAv
Cj51bW91bnQgL21udC9mMmZzCj5tb3VudCAvZGV2L3ZkYiAvbW50L2YyZnMKPmYyZnNfaW8gcHJl
Y2FjaGVfZXh0ZW50cyAvbW50L2YyZnMvdGVzdGZpbGUKPnVtb3VudCAvbW50L2YyZnMKPgo+ICAg
ICAgICAgIGYyZnNfaW8tNzMzICAgICBbMDEwXSAuLi4uLiAgICA3OC4xMzQxMzY6IGYyZnNfdXBk
YXRlX3JlYWRfZXh0ZW50X3RyZWVfcmFuZ2U6IGRldiA9ICgyNTMsMTYpLCBpbm8gPSA0LCBwZ29m
cyA9IDE4ODIsIGxlbiA9IDAsIGJsa2FkZHIgPSAxNzQxMCwgY19sZW4gPSAwCj4KPkkgc3VzcGVj
dCB3ZSBuZWVkIHRoaXM/Cj4KPkBAIC0xNzg0LDcgKzE3ODEsOCBAQCBpbnQgZjJmc19tYXBfYmxv
Y2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50
IGZsYWcpCj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmIChmbGFnID09IEYyRlNfR0VUX0JMT0NL
X1BSRUNBQ0hFKSB7Cj4tICAgICAgICAgICAgICAgaWYgKG1hcC0+bV9mbGFncyAmIEYyRlNfTUFQ
X01BUFBFRCkgewo+KyAgICAgICAgICAgICAgIGlmICgobWFwLT5tX2ZsYWdzICYgRjJGU19NQVBf
TUFQUEVEKSAmJgo+KyAgICAgICAgICAgICAgICAgICAgICAgKG1hcC0+bV9sZW4gLSBvZnMpKSB7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9mcyA9IHN0YXJ0X3Bnb2Zz
IC0gbWFwLT5tX2xibGs7Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3VwZGF0ZV9y
ZWFkX2V4dGVudF9jYWNoZV9yYW5nZSgmZG4sCgpUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGlz
LiBMZXQgbWUgZmluZCBhIHdheSB0byBjb3ZlciB0aGVzZSBjYXNlcyBhbmQgZG8gbW9yZSB0ZXN0
LgoKPkJUVywgSSBmaW5kIGFub3RoZXIgYnVnLCBpZiBvbmUgYmxrYWRkciBpcyBhZGpjZW50IHRv
IHByZXZpb3VzIGV4dGVudCwKPmJ1dCBhbmQgaXQgaXMgdmFsaWQsIHdlIG5lZWQgdG8gc2V0IG1f
bmV4dF9leHRlbnQgdG8gcGdvZnMgcmF0aGVyIHRoYW4KPnBnb2ZzICsgMS4KPgo+ZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPmluZGV4IGNiZjg4NDE2NDJjNy4u
YWM4OGVkNjgwNTljIDEwMDY0NAo+LS0tIGEvZnMvZjJmcy9kYXRhLmMKPisrKyBiL2ZzL2YyZnMv
ZGF0YS5jCj5AQCAtMTc4OSw4ICsxNzg5LDExIEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0
IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ0X3Bnb2ZzLCBtYXAtPm1fcGJsayAr
IG9mcywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcC0+bV9sZW4gLSBvZnMp
Owo+ICAgICAgICAgICAgICAgICB9Cj4tICAgICAgICAgICAgICAgaWYgKG1hcC0+bV9uZXh0X2V4
dGVudCkKPi0gICAgICAgICAgICAgICAgICAgICAgICptYXAtPm1fbmV4dF9leHRlbnQgPSBwZ29m
cyArIDE7Cj4rICAgICAgICAgICAgICAgaWYgKG1hcC0+bV9uZXh0X2V4dGVudCkgewo+KyAgICAg
ICAgICAgICAgICAgICAgICAgKm1hcC0+bV9uZXh0X2V4dGVudCA9IHBnb2ZzOwo+KyAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKCFfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGthZGRyKSkKPisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKm1hcC0+bV9uZXh0X2V4dGVudCArPSAxOwo+
KyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPiAgICAgICAgIGYyZnNfcHV0X2Rub2RlKCZk
bik7CgpNYXliZSBpdCBjYW4gYmUgdGhpcz8KaWYgKG1hcC0+bV9uZXh0X2V4dGVudCkKCSptYXAt
Pm1fbmV4dF9leHRlbnQgPSBpc19ob2xlID8gcGdvZnMgKyAxIDogcGdvZnM7CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

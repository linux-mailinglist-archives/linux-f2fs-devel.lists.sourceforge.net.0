Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44916B54A0B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Sep 2025 12:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7xM22ptkRavjPTElGdnFkLsFrefqMmA6e3EqsCInA8=; b=PMRo5zKl0nCIVijCfV5qqHJlNU
	fvKcLHoUh6zm3YfANQGnjG4f3hsjt/WjPoP991ZofpJHFN5TQuggM70I1Tl9uXMnAgTJb1hdoOqgm
	1uqWB7s/RveiEBWcOIeyaRyFD7mRrPYDvzhgAfZCwWWJy8PfEWSBAiPa/m8JrVbUY66Q=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ux1Bj-0008I3-8n;
	Fri, 12 Sep 2025 10:39:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1ux1Bh-0008Hp-PN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 10:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QxE80fu3sV1FuCud/CS0AGsCCgPvpOm5hpffCebHsD4=; b=lKgW7AADneb9lXzMWHpD+vGeRt
 UU6UOvHLFtzLpnS/ho6RAGGQR2trwDkzooSYos4JP7Yg9LjcP1iNnBNkmyx0WvY+BSQF0FOId+k7s
 Hx4muCua7aAJcbBz++0MMRvXcEEWCl8wDZRlowxqFnWGyPUiYqfVcuWE/nlXIYqCQKjI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QxE80fu3sV1FuCud/CS0AGsCCgPvpOm5hpffCebHsD4=; b=HxthbvXoduZ45zIvFoYhFWJTOF
 NbgYU/cUSI6MI+WeHrDwMbtFPplUaFuKPOh3/+5+JnTpGmmwO24PKShILjeZHV90TumN0cFsCtidA
 W0zeN2rQPlS8MoJdSwpJxH+d4WrMCnQffEedEKk9iF7MsUZekXih+Gb40rd02BUzUFHs=;
Received: from mta20.honor.com ([81.70.206.69] helo=mta20.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ux1Bh-0000F8-2y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 10:39:30 +0000
Received: from w013.hihonor.com (unknown [10.68.26.19])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4cNWB05m6TzYl0Js;
 Fri, 12 Sep 2025 18:38:48 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 12 Sep
 2025 18:39:16 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 12 Sep
 2025 18:39:15 +0800
From: wangzijie <wangzijie1@honor.com>
To: <wangzijie1@honor.com>
Date: Fri, 12 Sep 2025 18:39:15 +0800
Message-ID: <20250912103915.3597413-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250912100650.3594565-1-wangzijie1@honor.com>
References: <20250912100650.3594565-1-wangzijie1@honor.com>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >>On 9/12/2025 11:36 AM, wangzijie wrote: >>>> On 9/11/2025
 5:07 PM, wangzijie wrote: >>>>>> On 9/10/25 21:58, wangzijie wrote: >>>>>>>
 When the data layout is like this: >>>>>>> dnode1: dnode2: >>>>> [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.206.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1ux1Bh-0000F8-2y
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Pj5PbiA5LzEyLzIwMjUgMTE6MzYgQU0sIHdhbmd6aWppZSB3cm90ZToKPj4+PiBPbiA5LzExLzIw
MjUgNTowNyBQTSwgd2FuZ3ppamllIHdyb3RlOgo+Pj4+Pj4gT24gOS8xMC8yNSAyMTo1OCwgd2Fu
Z3ppamllIHdyb3RlOgo+Pj4+Pj4+IFdoZW4gdGhlIGRhdGEgbGF5b3V0IGlzIGxpa2UgdGhpczoK
Pj4+Pj4+PiBkbm9kZTE6ICAgICAgICAgICAgICAgICAgICAgZG5vZGUyOgo+Pj4+Pj4+IFswXSAg
ICAgIEEgICAgICAgICAgICAgICAgICBbMF0gICAgTkVXX0FERFIKPj4+Pj4+PiBbMV0gICAgICBB
KzEgICAgICAgICAgICAgICAgWzFdICAgIDB4MAo+Pj4+Pj4+IC4uLiAgICAgICAgICAgICAgICAg
ICAgICAgICAuLi4uCj4+Pj4+Pj4gWzEwMTZdICAgQSsxMDE2Cj4+Pj4+Pj4gWzEwMTddICAgQiAo
QiE9QSsxMDE3KSAgICAgIFsxMDE3XSAweDAKPj4+Pj4+Pgo+Pj4+Pj4+IFdlIGNhbiBidWlsZCB0
aGlzIGtpbmQgb2YgbGF5b3V0IGJ5IGZvbGxvd2luZyBzdGVwcyh3aXRoIGlfZXh0cmFfaXNpemU6
MzYpOgo+Pj4+Pj4+IC4vZjJmc19pbyB3cml0ZSAxIDAgMTg4MSByYW5kIGRzeW5jIHRlc3RmaWxl
Cj4+Pj4+Pj4gLi9mMmZzX2lvIHdyaXRlIDEgMTg4MSAxIHJhbmQgYnVmZmVyZWQgdGVzdGZpbGUK
Pj4+Pj4+PiAuL2YyZnNfaW8gZmFsbG9jYXRlIDAgNzcwODY3MiA0MDk2IHRlc3RmaWxlCj4+Pj4+
Pj4KPj4+Pj4+PiBBbmQgd2hlbiB3ZSBtYXAgZmlyc3QgZGF0YSBibG9jayBpbiBkbm9kZTIsIHdl
IHdpbGwgZ2V0IHdyb25nIGV4dGVudF9pbmZvIGRhdGE6Cj4+Pj4+Pj4gbWFwLT5tX2xlbiA9IDEK
Pj4+Pj4+PiBvZnMgPSBzdGFydF9wZ29mcyAtIG1hcC0+bV9sYmxrID0gMTg4MiAtIDE4ODEgPSAx
Cj4+Pj4+Pj4KPj4+Pj4+PiBlaS5mb2ZzID0gc3RhcnRfcGdvZnMgPSAxODgyCj4+Pj4+Pj4gZWku
bGVuID0gbWFwLT5tX2xlbiAtIG9mcyA9IDEgLSAxID0gMAo+Pj4+Pj4+Cj4+Pj4+Pj4gRml4IGl0
IGJ5IHNraXBwaW5nIHVwZGF0aW5nIHRoaXMga2luZCBvZiBleHRlbnQgaW5mby4KPj4+Pj4+Pgo+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IHdhbmd6aWppZSA8d2FuZ3ppamllMUBob25vci5jb20+Cj4+
Pj4+Pj4gLS0tCj4+Pj4+Pj4gICAgZnMvZjJmcy9kYXRhLmMgfCAzICsrKwo+Pj4+Pj4+ICAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4gaW5kZXggNzk2MWUwZGRm
Li5iOGJiNzE4NTIgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+PiAr
KysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4+IEBAIC0xNjQ5LDYgKzE2NDksOSBAQCBpbnQgZjJm
c19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9ibG9ja3Mg
Km1hcCwgaW50IGZsYWcpCj4+Pj4+Pj4gICAgCj4+Pj4+Pj4gICAgCQlzd2l0Y2ggKGZsYWcpIHsK
Pj4+Pj4+PiAgICAJCWNhc2UgRjJGU19HRVRfQkxPQ0tfUFJFQ0FDSEU6Cj4+Pj4+Pj4gKwkJCWlm
IChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihtYXAtPm1fcGJsaykgJiYKPj4+Pj4+PiArCQkJCXN0
YXJ0X3Bnb2ZzIC0gbWFwLT5tX2xibGsgPT0gbWFwLT5tX2xlbikKPj4+Pj4+PiArCQkJCW1hcC0+
bV9mbGFncyAmPSB+RjJGU19NQVBfTUFQUEVEOwo+Pj4+Pj4KPj4+Pj4+IEl0IGxvb2tzIHdlIG1p
c3NlZCB0byByZXNldCB2YWx1ZSBmb3IgbWFwIHZhcmlhYmxlIGluIGYyZnNfcHJlY2FjaGVfZXh0
ZW50cygpLAo+Pj4+Pj4gd2hhdCBkbyB5b3UgdGhpbmsgb2YgdGhpcz8KPj4+Pj4+Cj4+Pj4+PiAt
LS0KPj4+Pj4+ICAgIGZzL2YyZnMvZmlsZS5jIHwgNCArKystCj4+Pj4+PiAgICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4+IGluZGV4IDFhYWU0
MzYxZDBhOC4uMmIxNDE1MWQ0MTMwIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMK
Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+PiBAQCAtMzU5OSw3ICszNTk5LDcgQEAg
c3RhdGljIGludCBmMmZzX2lvY19pb19wcmlvKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBs
b25nIGFyZykKPj4+Pj4+ICAgIGludCBmMmZzX3ByZWNhY2hlX2V4dGVudHMoc3RydWN0IGlub2Rl
ICppbm9kZSkKPj4+Pj4+ICAgIHsKPj4+Pj4+ICAgIAlzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvICpm
aSA9IEYyRlNfSShpbm9kZSk7Cj4+Pj4+PiAtCXN0cnVjdCBmMmZzX21hcF9ibG9ja3MgbWFwOwo+
Pj4+Pj4gKwlzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzIG1hcCA9IHsgMCB9Owo+Pj4+Pj4gICAgCXBn
b2ZmX3QgbV9uZXh0X2V4dGVudDsKPj4+Pj4+ICAgIAlsb2ZmX3QgZW5kOwo+Pj4+Pj4gICAgCWlu
dCBlcnI7Cj4+Pj4+PiBAQCAtMzYxNyw2ICszNjE3LDggQEAgaW50IGYyZnNfcHJlY2FjaGVfZXh0
ZW50cyhzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4+Pj4KPj4+Pj4+ICAgIAl3aGlsZSAobWFwLm1f
bGJsayA8IGVuZCkgewo+Pj4+Pj4gICAgCQltYXAubV9sZW4gPSBlbmQgLSBtYXAubV9sYmxrOwo+
Pj4+Pj4gKwkJbWFwLm1fcGJsayA9IDA7Cj4+Pj4+PiArCQltYXAubV9mbGFncyA9IDA7Cj4+Pj4+
Pgo+Pj4+Pj4gICAgCQlmMmZzX2Rvd25fd3JpdGUoJmZpLT5pX2djX3J3c2VtW1dSSVRFXSk7Cj4+
Pj4+PiAgICAJCWVyciA9IGYyZnNfbWFwX2Jsb2Nrcyhpbm9kZSwgJm1hcCwgRjJGU19HRVRfQkxP
Q0tfUFJFQ0FDSEUpOwo+Pj4+Pj4gLS0gCj4+Pj4+PiAyLjQ5LjAKPj4+Pj4+Cj4+Pj4+PiBUaGFu
a3MsCj4+Pj4+Pgo+Pj4+Pj4+ICAgIAkJCWdvdG8gc3luY19vdXQ7Cj4+Pj4+Pj4gICAgCQljYXNl
IEYyRlNfR0VUX0JMT0NLX0JNQVA6Cj4+Pj4+Pj4gICAgCQkJbWFwLT5tX3BibGsgPSAwOwo+Pj4+
Pgo+Pj4+Pgo+Pj4+PiBXZSBoYXZlIGFscmVhZHkgcmVzZXQgbV9mbGFncyAobWFwLT5tX2ZsYWdz
ID0gMCkgaW4gZjJmc19tYXBfYmxvY2tzKCkuCj4+Pj4KPj4+PiBaaWppZToKPj4+Pgo+Pj4+IE9v
cHMsIHRoYXQncyByaWdodCwgdGhhbmtzIGZvciBjb3JyZWN0aW5nIG1lLgo+Pj4+Cj4+Pj4+Cj4+
Pj4+IEkgdGhpbmsgdGhhdCB0aGlzIGJ1ZyBpcyBjYXVzZWQgYnkgd2UgbWlzc2VkIHRvIHJlc2V0
IG1fZmxhZ3Mgd2hlbiB3ZQo+Pj4+PiBnb3RvIG5leHRfZG5vZGUgaW4gYmVsb3cgY2FzZe+8mgo+
Pj4+Pgo+Pj4+PiBEYXRhIGxheW91dCBpcyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+Pj4+PiBkbm9k
ZTE6ICAgICAgICAgICAgICAgICAgICAgZG5vZGUyOgo+Pj4+PiBbMF0gICAgICBBICAgICAgICAg
ICAgICAgICAgWzBdICAgIE5FV19BRERSCj4+Pj4+IFsxXSAgICAgIEErMSAgICAgICAgICAgICAg
ICBbMV0gICAgMHgwCj4+Pj4+IC4uLgo+Pj4+PiBbMTAxNl0gICBBKzEwMTYKPj4+Pj4gWzEwMTdd
ICAgQiAoQiE9QSsxMDE3KSAgICAgIFsxMDE3XSAweDAKPj4+Pj4KPj4+Pj4gd2UgbWFwIHRoZSBs
YXN0IGJsb2NrKHZhbGlkIGJsa2FkZHIpIGluIGRub2RlMToKPj4+Pj4gbWFwLT5tX2ZsYWdzIHw9
IEYyRlNfTUFQX01BUFBFRDsKPj4+Pj4gbWFwLT5tX3BibGsgPSBibGthZGRyKHZhbGlkIGJsa2Fk
ZHIpOwo+Pj4+PiBtYXAtPm1fbGVuID0gMTsKPj4+Pj4gdGhlbiB3ZSBnb3RvIG5leHRfZG5vZGUs
IG1lZXQgdGhlIGZpcnN0IGJsb2NrIGluIGRub2RlMihob2xlKSwgZ290byBzeW5jX291dDoKPj4+
Pj4gbWFwLT5tX2ZsYWdzICYgRjJGU19NQVBfTUFQUEVEID09IHRydWUsIGFuZCB3ZSBtYWtlIHdy
b25nIGJsa2FkZHIvbGVuIGZvciBleHRlbnRfaW5mby4KPj4+Pgo+Pj4+IFNvLCBjYW4geW91IHBs
ZWFzZSBhZGQgYWJvdmUgZXhwbGFuYXRpb24gaW50byBjb21taXQgbWVzc2FnZT8gdGhhdAo+Pj4+
IHNob3VsZCBiZSBoZWxwZnVsIGZvciB1bmRlcnN0YW5kaW5nIHRoZSBwcm9ibGVtIG1vcmUgY2xl
YXJseS4KPj4+Pgo+Pj4+IFBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzIGNhc2Ugdy8geW91ciBw
YXRjaDoKPj4+Pgo+Pj4+IG1rZnMuZjJmcyAtTyBleHRyYV9hdHRyLGNvbXByZXNzaW9uIC9kZXYv
dmRiIC1mCj4+Pj4gbW91bnQgL2Rldi92ZGIgL21udC9mMmZzIC1vIG1vZGU9bGZzCj4+Pj4gY2Qg
L21udC9mMmZzCj4+Pj4gZjJmc19pbyB3cml0ZSAxIDAgMTg4MyByYW5kIGRzeW5jIHRlc3RmaWxl
Cj4+Pj4gZjJmc19pbyBmYWxsb2NhdGUgMCA3NzEyNzY4IDQwOTYgdGVzdGZpbGUKPj4+PiBmMmZz
X2lvIHdyaXRlIDEgMTg4MSAxIHJhbmQgYnVmZmVyZWQgdGVzdGZpbGUKPj4+PiB4ZnNfaW8gdGVz
dGZpbGUgLWMgImZzeW5jIgo+Pj4+IGNkIC8KPj4+PiB1bW91bnQgL21udC9mMmZzCj4+Pj4gbW91
bnQgL2Rldi92ZGIgL21udC9mMmZzCj4+Pj4gZjJmc19pbyBwcmVjYWNoZV9leHRlbnRzIC9tbnQv
ZjJmcy90ZXN0ZmlsZQo+Pj4+IHVtb3VudCAvbW50L2YyZnMKPj4+Pgo+Pj4+ICAgICAgICAgICBm
MmZzX2lvLTczMyAgICAgWzAxMF0gLi4uLi4gICAgNzguMTM0MTM2OiBmMmZzX3VwZGF0ZV9yZWFk
X2V4dGVudF90cmVlX3JhbmdlOiBkZXYgPSAoMjUzLDE2KSwgaW5vID0gNCwgcGdvZnMgPSAxODgy
LCBsZW4gPSAwLCBibGthZGRyID0gMTc0MTAsIGNfbGVuID0gMAo+Pj4+Cj4+Pj4gSSBzdXNwZWN0
IHdlIG5lZWQgdGhpcz8KPj4+Pgo+Pj4+IEBAIC0xNzg0LDcgKzE3ODEsOCBAQCBpbnQgZjJmc19t
YXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1h
cCwgaW50IGZsYWcpCj4+Pj4gICAgICAgICAgfQo+Pj4+Cj4+Pj4gICAgICAgICAgaWYgKGZsYWcg
PT0gRjJGU19HRVRfQkxPQ0tfUFJFQ0FDSEUpIHsKPj4+PiAtICAgICAgICAgICAgICAgaWYgKG1h
cC0+bV9mbGFncyAmIEYyRlNfTUFQX01BUFBFRCkgewo+Pj4+ICsgICAgICAgICAgICAgICBpZiAo
KG1hcC0+bV9mbGFncyAmIEYyRlNfTUFQX01BUFBFRCkgJiYKPj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAobWFwLT5tX2xlbiAtIG9mcykpIHsKPj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IG9mcyA9IHN0YXJ0X3Bnb2ZzIC0gbWFwLT5tX2xibGs7Cj4+Pj4KPj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVf
cmFuZ2UoJmRuLAo+Pj4gCj4+PiBUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGlzLiBMZXQgbWUg
ZmluZCBhIHdheSB0byBjb3ZlciB0aGVzZSBjYXNlcyBhbmQgZG8gbW9yZSB0ZXN0Lgo+Pj4gCj4+
Pj4gQlRXLCBJIGZpbmQgYW5vdGhlciBidWcsIGlmIG9uZSBibGthZGRyIGlzIGFkamNlbnQgdG8g
cHJldmlvdXMgZXh0ZW50LAo+Pj4+IGJ1dCBhbmQgaXQgaXMgdmFsaWQsIHdlIG5lZWQgdG8gc2V0
IG1fbmV4dF9leHRlbnQgdG8gcGdvZnMgcmF0aGVyIHRoYW4KPj4+PiBwZ29mcyArIDEuCj4+Pj4K
Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+IGlu
ZGV4IGNiZjg4NDE2NDJjNy4uYWM4OGVkNjgwNTljIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMv
ZGF0YS5jCj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+PiBAQCAtMTc4OSw4ICsxNzg5LDEx
IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNf
bWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdGFydF9wZ29mcywgbWFwLT5tX3BibGsgKyBvZnMsCj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbWFwLT5tX2xlbiAtIG9mcyk7Cj4+Pj4gICAgICAgICAgICAg
ICAgICB9Cj4+Pj4gLSAgICAgICAgICAgICAgIGlmIChtYXAtPm1fbmV4dF9leHRlbnQpCj4+Pj4g
LSAgICAgICAgICAgICAgICAgICAgICAgKm1hcC0+bV9uZXh0X2V4dGVudCA9IHBnb2ZzICsgMTsK
Pj4+PiArICAgICAgICAgICAgICAgaWYgKG1hcC0+bV9uZXh0X2V4dGVudCkgewo+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICptYXAtPm1fbmV4dF9leHRlbnQgPSBwZ29mczsKPj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoIV9faXNfdmFsaWRfZGF0YV9ibGthZGRyKGJsa2FkZHIp
KQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKm1hcC0+bV9uZXh0X2V4dGVu
dCArPSAxOwo+Pj4+ICsgICAgICAgICAgICAgICB9Cj4+Pj4gICAgICAgICAgfQo+Pj4+ICAgICAg
ICAgIGYyZnNfcHV0X2Rub2RlKCZkbik7Cj4+PiAKPj4+IE1heWJlIGl0IGNhbiBiZSB0aGlzPwo+
Pj4gaWYgKG1hcC0+bV9uZXh0X2V4dGVudCkKPj4+IAkqbWFwLT5tX25leHRfZXh0ZW50ID0gaXNf
aG9sZSA/IHBnb2ZzICsgMSA6IHBnb2ZzOwo+Pgo+Pkl0J3MgYmV0dGVyLCB3aWxsIHVwZGF0ZSwg
dGhhbmsgeW91LiA6KQo+Pgo+PlRoYW5rcywKPgo+SGkgQ2hhbywKPkkgdGVzdCBzb21lIGNhc2Vz
IHdpdGggdGhpcyBjaGFuZ2U6Cj4KPmRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2Yy
ZnMvZGF0YS5jCj5pbmRleCA3OTYxZTBkZGYuLjcwOTNmZGM5NSAxMDA2NDQKPi0tLSBhL2ZzL2Yy
ZnMvZGF0YS5jCj4rKysgYi9mcy9mMmZzL2RhdGEuYwo+QEAgLTE3NzcsMTMgKzE3NzcsMTMgQEAg
aW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBf
YmxvY2tzICptYXAsIGludCBmbGFnKQo+ICAgICAgICBpZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9D
S19QUkVDQUNIRSkgewo+ICAgICAgICAgICAgICAgIGlmIChtYXAtPm1fZmxhZ3MgJiBGMkZTX01B
UF9NQVBQRUQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvZnMgPSBz
dGFydF9wZ29mcyAtIG1hcC0+bV9sYmxrOwo+LQo+LSAgICAgICAgICAgICAgICAgICAgICAgZjJm
c191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVfcmFuZ2UoJmRuLAo+LSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdGFydF9wZ29mcywgbWFwLT5tX3BibGsgKyBvZnMsCj4tICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG1hcC0+bV9sZW4gLSBvZnMpOwo+KyAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKG1hcC0+bV9sZW4gLSBvZnMgPiAwKQo+KyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmMmZzX3VwZGF0ZV9yZWFkX2V4dGVudF9jYWNoZV9yYW5nZSgmZG4sCj4rICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnRfcGdvZnMsIG1hcC0+bV9w
YmxrICsgb2ZzLAo+KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcC0+
bV9sZW4gLSBvZnMpOwo+ICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICBpZiAobWFw
LT5tX25leHRfZXh0ZW50KQo+LSAgICAgICAgICAgICAgICAgICAgICAgKm1hcC0+bV9uZXh0X2V4
dGVudCA9IHBnb2ZzICsgMTsKPisgICAgICAgICAgICAgICAgICAgICAgICptYXAtPm1fbmV4dF9l
eHRlbnQgPSBpc19ob2xlID8gcGdvZnMgKyAxIDogcGdvZnM7Cj4gICAgICAgIH0KPiAgICAgICAg
ZjJmc19wdXRfZG5vZGUoJmRuKTsKPiB1bmxvY2tfb3V0Ogo+Cj4KPnRlc3QgY2FzZXM6Cj4KPmNh
c2UxOgo+ZG5vZGUxOiAgICAgICAgICAgICAgICAgICAgIGRub2RlMjoKPlswXSAgICAgIEEgICAg
ICAgICAgICAgICAgICBbMF0gICAgTkVXX0FERFIKPlsxXSAgICAgIEErMSAgICAgICAgICAgICAg
ICBbMV0gICAgMHgwCj4uLi4gICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+WzEwMTZdICAg
QSsxMDE2Cj5bMTAxN10gICBCIChCIT1BKzEwMTcpICAgICAgWzEwMTddIDB4MAo+Cj5jYXNlMjoK
PmRub2RlMTogICAgICAgICAgICAgICAgICAgICBkbm9kZTI6Cj5bMF0gICAgICBBICAgICAgICAg
ICAgICAgICAgWzBdICAgIEMgKEMhPUIrMSkKPlsxXSAgICAgIEErMSAgICAgICAgICAgICAgICBb
MV0gICAgQysxCj4uLi4gICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+WzEwMTZdICAgQSsx
MDE2Cj5bMTAxN10gICBCIChCIT1BKzEwMTcpICAgICAgWzEwMTddIDB4MAo+Cj5jYXNlMzoKPmRu
b2RlMTogICAgICAgICAgICAgICAgICAgICBkbm9kZTI6Cj5bMF0gICAgICBBICAgICAgICAgICAg
ICAgICAgWzBdICAgIEMgKEMhPUIrMikKPlsxXSAgICAgIEErMSAgICAgICAgICAgICAgICBbMV0g
ICAgQysxCj4uLi4gICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+WzEwMTVdICAgQSsxMDE1
Cj5bMTAxNl0gICBCIChCIT1BKzEwMTYpCj5bMTAxN10gICBCKzEgICAgICAgICAgICAgICAgWzEw
MTddIDB4MAo+Cj5jYXNlNDoKPm9uZSBibGthZGRyIGlzIGFkamNlbnQgdG8gcHJldmlvdXMgZXh0
ZW50LCBhbmQgaXQgaXMgdmFsaWQuCj4KPkFuZCBmcm9tIHRoZSByZXN1bHQsIGl0IHNlZW1zIHRo
aXMgY2hhbmdlIGNhbiBjb3ZlciB0aGVzZQo+c2l0dWF0aW9ucyBjb3JyZWN0bHkuCj5EbyB3ZSBu
ZWVkIGEgcGF0Y2ggd2l0aCB0aGlzIGNoYW5nZT8KClNvcnJ5LCB3aXRoIHRoaXMgY2hhbmdlLCBm
b3IgY2FzZTE6ClRoZSBmaXJzdCBibG9jayBvZiBkbm9kZTIgKFswXTpORVdfQUREUikgd2lsbCBi
ZSBza2lwcGVkLgpMZXQgbWUgZmluZCBhIGJldHRlciB3YXkuLi4uCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

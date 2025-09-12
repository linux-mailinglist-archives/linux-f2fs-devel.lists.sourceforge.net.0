Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B674B548B8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Sep 2025 12:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsgoGsnPDB7sIGeC6Tg240GXrdlu8rcZklSn2Cqd8R8=; b=OhBQQolc2OUGdIITD7ThXeTJX/
	+GgMFB4d/BhTMnOOc6fqG7Mga9q13HsACrgql5W5VK8n5qF2Fm20PXztrDVNkKU0ilW+bHNemz015
	WzAbuT101YZ1WWyWQlfXE11gdYvI1WaI3/nXKVK5AIKVbjgXHUJoV8TdnH1ExK7MjnJE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ux0gS-0005eA-Br;
	Fri, 12 Sep 2025 10:07:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1ux0gQ-0005dp-46
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 10:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z7HDuJG5XdJaAF/oVQexn+zjO6vWfEKp0xBp2SfIlDA=; b=OG+BRHMM1NcRWO2QXz4lCJ/AFx
 1ahh1BD/BaqTOTnF2mNLPijoRoctESMi+q8T9JcIleUSTrAsCroQFIjrleA1YIRnDCwO4J5xPtiVL
 9TV/d6z9my556dMdHQSjB9Xd5iy8tNckiSdKj6nNVE3Wh9iWF7gdrSrTE3uX8FbEr2K4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z7HDuJG5XdJaAF/oVQexn+zjO6vWfEKp0xBp2SfIlDA=; b=XkjsHZcWB9mfTGF0P7LYJitPZw
 4/IvnHGneivqL9hg19+ViQsjU1hiZHGmhSoh82CT8bEE/U5rWxKPvzAT+yNx+S3eHK+kHU1COV0Zt
 zsGdNamEsOgJlUvdRijEJ76aw634ZXTUPBCIJrpYWqSYJjH4kvv+YOAC/ydlc1WD2sbA=;
Received: from mta22.hihonor.com ([81.70.192.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ux0gP-00070H-Ht for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 10:07:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=To:From;
 bh=z7HDuJG5XdJaAF/oVQexn+zjO6vWfEKp0xBp2SfIlDA=;
 b=IoUTSsmuALT3Nibp4CCFN2+H5yrrSZCQg+ibvpEm+59FqsxZaqH1UFnIifrPXueb14IBjbIzI
 ISixCbluVs6sUg7O4WakHcUiXF4n/mtyiHWMC/olJaklQVcbEHygK/Enzvgfr4Qaydh3jRGJymc
 Eh3pahhqcIq9Y7a2rCevVKU=
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4cNVSn3QZTzYlj91;
 Fri, 12 Sep 2025 18:06:33 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 12 Sep
 2025 18:06:51 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 12 Sep
 2025 18:06:51 +0800
From: wangzijie <wangzijie1@honor.com>
To: <chao@kernel.org>
Date: Fri, 12 Sep 2025 18:06:50 +0800
Message-ID: <20250912100650.3594565-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2ecb4f74-cc60-4dd4-8dc3-d4f3ff848e87@kernel.org>
References: <2ecb4f74-cc60-4dd4-8dc3-d4f3ff848e87@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w003.hihonor.com (10.68.17.88) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 9/12/2025 11:36 AM, wangzijie wrote: >>> On 9/11/2025
 5:07 PM, wangzijie wrote: >>>>> On 9/10/25 21:58, wangzijie wrote: >>>>>>
 When the data layout is like this: >>>>>> dnode1: dnode2: >>>>>> [0] [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.192.198 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ux0gP-00070H-Ht
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

Pk9uIDkvMTIvMjAyNSAxMTozNiBBTSwgd2FuZ3ppamllIHdyb3RlOgo+Pj4gT24gOS8xMS8yMDI1
IDU6MDcgUE0sIHdhbmd6aWppZSB3cm90ZToKPj4+Pj4gT24gOS8xMC8yNSAyMTo1OCwgd2FuZ3pp
amllIHdyb3RlOgo+Pj4+Pj4gV2hlbiB0aGUgZGF0YSBsYXlvdXQgaXMgbGlrZSB0aGlzOgo+Pj4+
Pj4gZG5vZGUxOiAgICAgICAgICAgICAgICAgICAgIGRub2RlMjoKPj4+Pj4+IFswXSAgICAgIEEg
ICAgICAgICAgICAgICAgICBbMF0gICAgTkVXX0FERFIKPj4+Pj4+IFsxXSAgICAgIEErMSAgICAg
ICAgICAgICAgICBbMV0gICAgMHgwCj4+Pj4+PiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAg
Li4uLgo+Pj4+Pj4gWzEwMTZdICAgQSsxMDE2Cj4+Pj4+PiBbMTAxN10gICBCIChCIT1BKzEwMTcp
ICAgICAgWzEwMTddIDB4MAo+Pj4+Pj4KPj4+Pj4+IFdlIGNhbiBidWlsZCB0aGlzIGtpbmQgb2Yg
bGF5b3V0IGJ5IGZvbGxvd2luZyBzdGVwcyh3aXRoIGlfZXh0cmFfaXNpemU6MzYpOgo+Pj4+Pj4g
Li9mMmZzX2lvIHdyaXRlIDEgMCAxODgxIHJhbmQgZHN5bmMgdGVzdGZpbGUKPj4+Pj4+IC4vZjJm
c19pbyB3cml0ZSAxIDE4ODEgMSByYW5kIGJ1ZmZlcmVkIHRlc3RmaWxlCj4+Pj4+PiAuL2YyZnNf
aW8gZmFsbG9jYXRlIDAgNzcwODY3MiA0MDk2IHRlc3RmaWxlCj4+Pj4+Pgo+Pj4+Pj4gQW5kIHdo
ZW4gd2UgbWFwIGZpcnN0IGRhdGEgYmxvY2sgaW4gZG5vZGUyLCB3ZSB3aWxsIGdldCB3cm9uZyBl
eHRlbnRfaW5mbyBkYXRhOgo+Pj4+Pj4gbWFwLT5tX2xlbiA9IDEKPj4+Pj4+IG9mcyA9IHN0YXJ0
X3Bnb2ZzIC0gbWFwLT5tX2xibGsgPSAxODgyIC0gMTg4MSA9IDEKPj4+Pj4+Cj4+Pj4+PiBlaS5m
b2ZzID0gc3RhcnRfcGdvZnMgPSAxODgyCj4+Pj4+PiBlaS5sZW4gPSBtYXAtPm1fbGVuIC0gb2Zz
ID0gMSAtIDEgPSAwCj4+Pj4+Pgo+Pj4+Pj4gRml4IGl0IGJ5IHNraXBwaW5nIHVwZGF0aW5nIHRo
aXMga2luZCBvZiBleHRlbnQgaW5mby4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiB3YW5n
emlqaWUgPHdhbmd6aWppZTFAaG9ub3IuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgICBmcy9mMmZz
L2RhdGEuYyB8IDMgKysrCj4+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
Cj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRh
LmMKPj4+Pj4+IGluZGV4IDc5NjFlMGRkZi4uYjhiYjcxODUyIDEwMDY0NAo+Pj4+Pj4gLS0tIGEv
ZnMvZjJmcy9kYXRhLmMKPj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+PiBAQCAtMTY0
OSw2ICsxNjQ5LDkgQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBz
dHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnKQo+Pj4+Pj4gICAgCj4+Pj4+PiAg
ICAJCXN3aXRjaCAoZmxhZykgewo+Pj4+Pj4gICAgCQljYXNlIEYyRlNfR0VUX0JMT0NLX1BSRUNB
Q0hFOgo+Pj4+Pj4gKwkJCWlmIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihtYXAtPm1fcGJsaykg
JiYKPj4+Pj4+ICsJCQkJc3RhcnRfcGdvZnMgLSBtYXAtPm1fbGJsayA9PSBtYXAtPm1fbGVuKQo+
Pj4+Pj4gKwkJCQltYXAtPm1fZmxhZ3MgJj0gfkYyRlNfTUFQX01BUFBFRDsKPj4+Pj4KPj4+Pj4g
SXQgbG9va3Mgd2UgbWlzc2VkIHRvIHJlc2V0IHZhbHVlIGZvciBtYXAgdmFyaWFibGUgaW4gZjJm
c19wcmVjYWNoZV9leHRlbnRzKCksCj4+Pj4+IHdoYXQgZG8geW91IHRoaW5rIG9mIHRoaXM/Cj4+
Pj4+Cj4+Pj4+IC0tLQo+Pj4+PiAgICBmcy9mMmZzL2ZpbGUuYyB8IDQgKysrLQo+Pj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Cj4+Pj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+IGluZGV4
IDFhYWU0MzYxZDBhOC4uMmIxNDE1MWQ0MTMwIDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2Zp
bGUuYwo+Pj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+PiBAQCAtMzU5OSw3ICszNTk5LDcg
QEAgc3RhdGljIGludCBmMmZzX2lvY19pb19wcmlvKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25l
ZCBsb25nIGFyZykKPj4+Pj4gICAgaW50IGYyZnNfcHJlY2FjaGVfZXh0ZW50cyhzdHJ1Y3QgaW5v
ZGUgKmlub2RlKQo+Pj4+PiAgICB7Cj4+Pj4+ICAgIAlzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvICpm
aSA9IEYyRlNfSShpbm9kZSk7Cj4+Pj4+IC0Jc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyBtYXA7Cj4+
Pj4+ICsJc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyBtYXAgPSB7IDAgfTsKPj4+Pj4gICAgCXBnb2Zm
X3QgbV9uZXh0X2V4dGVudDsKPj4+Pj4gICAgCWxvZmZfdCBlbmQ7Cj4+Pj4+ICAgIAlpbnQgZXJy
Owo+Pj4+PiBAQCAtMzYxNyw2ICszNjE3LDggQEAgaW50IGYyZnNfcHJlY2FjaGVfZXh0ZW50cyhz
dHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4+Pgo+Pj4+PiAgICAJd2hpbGUgKG1hcC5tX2xibGsgPCBl
bmQpIHsKPj4+Pj4gICAgCQltYXAubV9sZW4gPSBlbmQgLSBtYXAubV9sYmxrOwo+Pj4+PiArCQlt
YXAubV9wYmxrID0gMDsKPj4+Pj4gKwkJbWFwLm1fZmxhZ3MgPSAwOwo+Pj4+Pgo+Pj4+PiAgICAJ
CWYyZnNfZG93bl93cml0ZSgmZmktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPj4+Pj4gICAgCQllcnIg
PSBmMmZzX21hcF9ibG9ja3MoaW5vZGUsICZtYXAsIEYyRlNfR0VUX0JMT0NLX1BSRUNBQ0hFKTsK
Pj4+Pj4gLS0gCj4+Pj4+IDIuNDkuMAo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+PiAg
ICAJCQlnb3RvIHN5bmNfb3V0Owo+Pj4+Pj4gICAgCQljYXNlIEYyRlNfR0VUX0JMT0NLX0JNQVA6
Cj4+Pj4+PiAgICAJCQltYXAtPm1fcGJsayA9IDA7Cj4+Pj4KPj4+Pgo+Pj4+IFdlIGhhdmUgYWxy
ZWFkeSByZXNldCBtX2ZsYWdzIChtYXAtPm1fZmxhZ3MgPSAwKSBpbiBmMmZzX21hcF9ibG9ja3Mo
KS4KPj4+Cj4+PiBaaWppZToKPj4+Cj4+PiBPb3BzLCB0aGF0J3MgcmlnaHQsIHRoYW5rcyBmb3Ig
Y29ycmVjdGluZyBtZS4KPj4+Cj4+Pj4KPj4+PiBJIHRoaW5rIHRoYXQgdGhpcyBidWcgaXMgY2F1
c2VkIGJ5IHdlIG1pc3NlZCB0byByZXNldCBtX2ZsYWdzIHdoZW4gd2UKPj4+PiBnb3RvIG5leHRf
ZG5vZGUgaW4gYmVsb3cgY2FzZe+8mgo+Pj4+Cj4+Pj4gRGF0YSBsYXlvdXQgaXMgc29tZXRoaW5n
IGxpa2UgdGhpczoKPj4+PiBkbm9kZTE6ICAgICAgICAgICAgICAgICAgICAgZG5vZGUyOgo+Pj4+
IFswXSAgICAgIEEgICAgICAgICAgICAgICAgICBbMF0gICAgTkVXX0FERFIKPj4+PiBbMV0gICAg
ICBBKzEgICAgICAgICAgICAgICAgWzFdICAgIDB4MAo+Pj4+IC4uLgo+Pj4+IFsxMDE2XSAgIEEr
MTAxNgo+Pj4+IFsxMDE3XSAgIEIgKEIhPUErMTAxNykgICAgICBbMTAxN10gMHgwCj4+Pj4KPj4+
PiB3ZSBtYXAgdGhlIGxhc3QgYmxvY2sodmFsaWQgYmxrYWRkcikgaW4gZG5vZGUxOgo+Pj4+IG1h
cC0+bV9mbGFncyB8PSBGMkZTX01BUF9NQVBQRUQ7Cj4+Pj4gbWFwLT5tX3BibGsgPSBibGthZGRy
KHZhbGlkIGJsa2FkZHIpOwo+Pj4+IG1hcC0+bV9sZW4gPSAxOwo+Pj4+IHRoZW4gd2UgZ290byBu
ZXh0X2Rub2RlLCBtZWV0IHRoZSBmaXJzdCBibG9jayBpbiBkbm9kZTIoaG9sZSksIGdvdG8gc3lu
Y19vdXQ6Cj4+Pj4gbWFwLT5tX2ZsYWdzICYgRjJGU19NQVBfTUFQUEVEID09IHRydWUsIGFuZCB3
ZSBtYWtlIHdyb25nIGJsa2FkZHIvbGVuIGZvciBleHRlbnRfaW5mby4KPj4+Cj4+PiBTbywgY2Fu
IHlvdSBwbGVhc2UgYWRkIGFib3ZlIGV4cGxhbmF0aW9uIGludG8gY29tbWl0IG1lc3NhZ2U/IHRo
YXQKPj4+IHNob3VsZCBiZSBoZWxwZnVsIGZvciB1bmRlcnN0YW5kaW5nIHRoZSBwcm9ibGVtIG1v
cmUgY2xlYXJseS4KPj4+Cj4+PiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQgdGhpcyBjYXNlIHcvIHlv
dXIgcGF0Y2g6Cj4+Pgo+Pj4gbWtmcy5mMmZzIC1PIGV4dHJhX2F0dHIsY29tcHJlc3Npb24gL2Rl
di92ZGIgLWYKPj4+IG1vdW50IC9kZXYvdmRiIC9tbnQvZjJmcyAtbyBtb2RlPWxmcwo+Pj4gY2Qg
L21udC9mMmZzCj4+PiBmMmZzX2lvIHdyaXRlIDEgMCAxODgzIHJhbmQgZHN5bmMgdGVzdGZpbGUK
Pj4+IGYyZnNfaW8gZmFsbG9jYXRlIDAgNzcxMjc2OCA0MDk2IHRlc3RmaWxlCj4+PiBmMmZzX2lv
IHdyaXRlIDEgMTg4MSAxIHJhbmQgYnVmZmVyZWQgdGVzdGZpbGUKPj4+IHhmc19pbyB0ZXN0Zmls
ZSAtYyAiZnN5bmMiCj4+PiBjZCAvCj4+PiB1bW91bnQgL21udC9mMmZzCj4+PiBtb3VudCAvZGV2
L3ZkYiAvbW50L2YyZnMKPj4+IGYyZnNfaW8gcHJlY2FjaGVfZXh0ZW50cyAvbW50L2YyZnMvdGVz
dGZpbGUKPj4+IHVtb3VudCAvbW50L2YyZnMKPj4+Cj4+PiAgICAgICAgICAgZjJmc19pby03MzMg
ICAgIFswMTBdIC4uLi4uICAgIDc4LjEzNDEzNjogZjJmc191cGRhdGVfcmVhZF9leHRlbnRfdHJl
ZV9yYW5nZTogZGV2ID0gKDI1MywxNiksIGlubyA9IDQsIHBnb2ZzID0gMTg4MiwgbGVuID0gMCwg
YmxrYWRkciA9IDE3NDEwLCBjX2xlbiA9IDAKPj4+Cj4+PiBJIHN1c3BlY3Qgd2UgbmVlZCB0aGlz
Pwo+Pj4KPj4+IEBAIC0xNzg0LDcgKzE3ODEsOCBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpCj4+
PiAgICAgICAgICB9Cj4+Pgo+Pj4gICAgICAgICAgaWYgKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tf
UFJFQ0FDSEUpIHsKPj4+IC0gICAgICAgICAgICAgICBpZiAobWFwLT5tX2ZsYWdzICYgRjJGU19N
QVBfTUFQUEVEKSB7Cj4+PiArICAgICAgICAgICAgICAgaWYgKChtYXAtPm1fZmxhZ3MgJiBGMkZT
X01BUF9NQVBQRUQpICYmCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAobWFwLT5tX2xlbiAt
IG9mcykpIHsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb2ZzID0g
c3RhcnRfcGdvZnMgLSBtYXAtPm1fbGJsazsKPj4+Cj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgZjJmc191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVfcmFuZ2UoJmRuLAo+PiAKPj4gVGhhbmtz
IGZvciBwb2ludGluZyBvdXQgdGhpcy4gTGV0IG1lIGZpbmQgYSB3YXkgdG8gY292ZXIgdGhlc2Ug
Y2FzZXMgYW5kIGRvIG1vcmUgdGVzdC4KPj4gCj4+PiBCVFcsIEkgZmluZCBhbm90aGVyIGJ1Zywg
aWYgb25lIGJsa2FkZHIgaXMgYWRqY2VudCB0byBwcmV2aW91cyBleHRlbnQsCj4+PiBidXQgYW5k
IGl0IGlzIHZhbGlkLCB3ZSBuZWVkIHRvIHNldCBtX25leHRfZXh0ZW50IHRvIHBnb2ZzIHJhdGhl
ciB0aGFuCj4+PiBwZ29mcyArIDEuCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5j
IGIvZnMvZjJmcy9kYXRhLmMKPj4+IGluZGV4IGNiZjg4NDE2NDJjNy4uYWM4OGVkNjgwNTljIDEw
MDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+
PiBAQCAtMTc4OSw4ICsxNzg5LDExIEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ0X3Bnb2ZzLCBtYXAtPm1fcGJsayArIG9m
cywKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcC0+bV9sZW4gLSBvZnMp
Owo+Pj4gICAgICAgICAgICAgICAgICB9Cj4+PiAtICAgICAgICAgICAgICAgaWYgKG1hcC0+bV9u
ZXh0X2V4dGVudCkKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICptYXAtPm1fbmV4dF9leHRl
bnQgPSBwZ29mcyArIDE7Cj4+PiArICAgICAgICAgICAgICAgaWYgKG1hcC0+bV9uZXh0X2V4dGVu
dCkgewo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgKm1hcC0+bV9uZXh0X2V4dGVudCA9IHBn
b2ZzOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFfX2lzX3ZhbGlkX2RhdGFfYmxr
YWRkcihibGthZGRyKSkKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKm1hcC0+
bV9uZXh0X2V4dGVudCArPSAxOwo+Pj4gKyAgICAgICAgICAgICAgIH0KPj4+ICAgICAgICAgIH0K
Pj4+ICAgICAgICAgIGYyZnNfcHV0X2Rub2RlKCZkbik7Cj4+IAo+PiBNYXliZSBpdCBjYW4gYmUg
dGhpcz8KPj4gaWYgKG1hcC0+bV9uZXh0X2V4dGVudCkKPj4gCSptYXAtPm1fbmV4dF9leHRlbnQg
PSBpc19ob2xlID8gcGdvZnMgKyAxIDogcGdvZnM7Cj4KPkl0J3MgYmV0dGVyLCB3aWxsIHVwZGF0
ZSwgdGhhbmsgeW91LiA6KQo+Cj5UaGFua3MsCgpIaSBDaGFvLApJIHRlc3Qgc29tZSBjYXNlcyB3
aXRoIHRoaXMgY2hhbmdlOgoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9k
YXRhLmMKaW5kZXggNzk2MWUwZGRmLi43MDkzZmRjOTUgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZGF0
YS5jCisrKyBiL2ZzL2YyZnMvZGF0YS5jCkBAIC0xNzc3LDEzICsxNzc3LDEzIEBAIGludCBmMmZz
X21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAq
bWFwLCBpbnQgZmxhZykKICAgICAgICBpZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19QUkVDQUNI
RSkgewogICAgICAgICAgICAgICAgaWYgKG1hcC0+bV9mbGFncyAmIEYyRlNfTUFQX01BUFBFRCkg
ewogICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb2ZzID0gc3RhcnRfcGdvZnMg
LSBtYXAtPm1fbGJsazsKLQotICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3VwZGF0ZV9yZWFk
X2V4dGVudF9jYWNoZV9yYW5nZSgmZG4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RhcnRfcGdvZnMsIG1hcC0+bV9wYmxrICsgb2ZzLAotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG1hcC0+bV9sZW4gLSBvZnMpOworICAgICAgICAgICAgICAgICAgICAgICBpZiAobWFw
LT5tX2xlbiAtIG9mcyA+IDApCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc191
cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVfcmFuZ2UoJmRuLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RhcnRfcGdvZnMsIG1hcC0+bV9wYmxrICsgb2ZzLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFwLT5tX2xlbiAtIG9mcyk7CiAgICAg
ICAgICAgICAgICB9CiAgICAgICAgICAgICAgICBpZiAobWFwLT5tX25leHRfZXh0ZW50KQotICAg
ICAgICAgICAgICAgICAgICAgICAqbWFwLT5tX25leHRfZXh0ZW50ID0gcGdvZnMgKyAxOworICAg
ICAgICAgICAgICAgICAgICAgICAqbWFwLT5tX25leHRfZXh0ZW50ID0gaXNfaG9sZSA/IHBnb2Zz
ICsgMSA6IHBnb2ZzOwogICAgICAgIH0KICAgICAgICBmMmZzX3B1dF9kbm9kZSgmZG4pOwogdW5s
b2NrX291dDoKCgp0ZXN0IGNhc2VzOgoKY2FzZTE6CmRub2RlMTogICAgICAgICAgICAgICAgICAg
ICBkbm9kZTI6ClswXSAgICAgIEEgICAgICAgICAgICAgICAgICBbMF0gICAgTkVXX0FERFIKWzFd
ICAgICAgQSsxICAgICAgICAgICAgICAgIFsxXSAgICAweDAKLi4uICAgICAgICAgICAgICAgICAg
ICAgICAgIC4uLi4KWzEwMTZdICAgQSsxMDE2ClsxMDE3XSAgIEIgKEIhPUErMTAxNykgICAgICBb
MTAxN10gMHgwCgpjYXNlMjoKZG5vZGUxOiAgICAgICAgICAgICAgICAgICAgIGRub2RlMjoKWzBd
ICAgICAgQSAgICAgICAgICAgICAgICAgIFswXSAgICBDIChDIT1CKzEpClsxXSAgICAgIEErMSAg
ICAgICAgICAgICAgICBbMV0gICAgQysxCi4uLiAgICAgICAgICAgICAgICAgICAgICAgICAuLi4u
ClsxMDE2XSAgIEErMTAxNgpbMTAxN10gICBCIChCIT1BKzEwMTcpICAgICAgWzEwMTddIDB4MAoK
Y2FzZTM6CmRub2RlMTogICAgICAgICAgICAgICAgICAgICBkbm9kZTI6ClswXSAgICAgIEEgICAg
ICAgICAgICAgICAgICBbMF0gICAgQyAoQyE9QisyKQpbMV0gICAgICBBKzEgICAgICAgICAgICAg
ICAgWzFdICAgIEMrMQouLi4gICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgpbMTAxNV0gICBB
KzEwMTUKWzEwMTZdICAgQiAoQiE9QSsxMDE2KQpbMTAxN10gICBCKzEgICAgICAgICAgICAgICAg
WzEwMTddIDB4MAoKY2FzZTQ6Cm9uZSBibGthZGRyIGlzIGFkamNlbnQgdG8gcHJldmlvdXMgZXh0
ZW50LCBhbmQgaXQgaXMgdmFsaWQuCgpBbmQgZnJvbSB0aGUgcmVzdWx0LCBpdCBzZWVtcyB0aGlz
IGNoYW5nZSBjYW4gY292ZXIgdGhlc2UKc2l0dWF0aW9ucyBjb3JyZWN0bHkuCkRvIHdlIG5lZWQg
YSBwYXRjaCB3aXRoIHRoaXMgY2hhbmdlPwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

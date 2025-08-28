Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D49B39132
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Aug 2025 03:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zycJWbiB8Y9LZkcJhHPf0U/mxkyfk97xblZwLr8lPo=; b=BB0nW7skamuDnjfBXynPDVmdG3
	Ve85b82P21BCKKFZHSwY6m9DM+ZUL+UdxbHXwx4Pu36zMjiacvbjaXDK0Uxp7gYzbw5IKH6PyHYe/
	P4lKC1xFMhtwK5a+FKUJH1jtjEvcN0wRHeQyNUsXKk7VUABd+lxHJB9EC8RAuMMZmBT4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urRgg-0002tx-Lx;
	Thu, 28 Aug 2025 01:44:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1urRgf-0002tp-Ak
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 01:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UcO3MG2REtj4zx4QNqADkGNzwNOpnBJoV9wkDs8D5u8=; b=CfuzMCfXDec6Kf3rnlDg5NFzh1
 EsqgiiNrjD5TuhPpF6cWyNY9xVs8yuA6rpD0lFUVutrr2cU2xQzYKyRUp9o1g9GqO9guIBoys4aoy
 YzqKmYC+jat84qP0jnYypGE1LumBRUufOGdzwCKfXzhCZjNPvSKoV6Sbyie47F7cA6yw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UcO3MG2REtj4zx4QNqADkGNzwNOpnBJoV9wkDs8D5u8=; b=QrALsHnXAx7DfNiFIvZa9kQLlk
 K0R80ZVc2UU/bFjLdUiYKi/WrhnKFQvrkt/l8p06hb6jpR6UWq/wluLQ3K3Ah24LTb5AhImQ7sQVU
 356Ge7e+UpweWmUzAu7oQUS4GhIhwtizzwhUWBOkEIDbwnR5mxDF/G5/zQh3ET/RjTf4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urRge-0006Sp-Ln for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 01:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 503F243924;
 Thu, 28 Aug 2025 01:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADEAC4CEEB;
 Thu, 28 Aug 2025 01:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756345454;
 bh=gs2oMu8qJ3MMVZ6FArfeWdyzLtenZzWXZNadoP3xh2g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jE6cGzISIJvMuiyc4G4sRdt90vTsxVdOiQkMJLU4Nw8hS6ZYCDuAMwAp+aBabrDhm
 eBt0FdLB6xKpXqyRQM6dIi1IsheSTXOR9eQ0XO/xZvPBI7xcgaXBJhIGc8c10KsB3P
 Fm6dVso8d0i2t+5IDkWHvTEQmDc8lyajuCqRHKig+Xm7OPV9BDhLHRdf8lVuHIm4Il
 +zH8wQVHcxvS0z6SlLgBH2vT+5xANKTZ0sBnFsST19X0EYsVAObVfJ6sR3FgjH0RhC
 ozGiOT0TfMtS4a/47+Ls4vm0y3hakn6ppBMCOikZx0O4g+7SrzIEROQOftaogeEK9V
 roV1C3IMNiClg==
Message-ID: <066cd125-7db8-4b97-b6e3-20e10023a14f@kernel.org>
Date: Thu, 28 Aug 2025 09:44:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?546L5pmT54+6?= <wangxiaojun@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20250820075444.378907-1-wangxiaojun@vivo.com>
 <d0a1e0a3-bde1-485c-bee0-70c04ab3846d@kernel.org>
 <234d4f23-5ce4-426e-9b3c-5f2b28d86a3f@vivo.com>
Content-Language: en-US
In-Reply-To: <234d4f23-5ce4-426e-9b3c-5f2b28d86a3f@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 8/26/25 09:48, 王晓珺 wrote: > 在 8/25/2025 10:08 AM,
    Chao Yu 写道: >> On 8/20/25 15:54, Wang Xiaojun wrote: >>> This patch fixes
    missing space reclamation during the recovery process. >>> >> [...] 
 
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
X-Headers-End: 1urRge-0006Sp-Ln
Subject: Re: [f2fs-dev] [PATCH v4] f2fs:fix missing space reclamation during
 the recovery process
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOC8yNi8yNSAwOTo0OCwg546L5pmT54+6IHdyb3RlOgo+IOWcqCA4LzI1LzIwMjUgMTA6MDgg
QU0sIENoYW8gWXUg5YaZ6YGTOgo+PiBPbiA4LzIwLzI1IDE1OjU0LCBXYW5nIFhpYW9qdW4gd3Jv
dGU6Cj4+PiBUaGlzIHBhdGNoIGZpeGVzIG1pc3Npbmcgc3BhY2UgcmVjbGFtYXRpb24gZHVyaW5n
IHRoZSByZWNvdmVyeSBwcm9jZXNzLgo+Pj4KPj4+IEluIHRoZSBmb2xsb3dpbmcgc2NlbmFyaW9z
LCBGMkZTIGNhbm5vdCByZWNsYWltIHRydW5jYXRlZCBzcGFjZS4KPj4+IGNhc2UgMToKPj4+IHdy
aXRlIGZpbGUgQSwgc2l6ZSBpcyAxRyB8IENQIHwgdHJ1bmNhdGUgQSB0byAxTSB8IGZzeW5jIEEg
fCBTUE8KPj4+Cj4+PiBjYXNlIDI6Cj4+PiBDUCB8IHdyaXRlIGZpbGUgQSwgc2l6ZSBpcyAxRyB8
IGZzeW5jIEEgfCB0cnVuY2F0ZSBBIHRvIDFNIHwgZnN5bmMgQSB8U1BPCj4+Pgo+Pj4gRHVyaW5n
IHRoZSByZWNvdmVyeSBwcm9jZXNzLCBGMkZTIHdpbGwgcmVjb3ZlciBmaWxlIEEsCj4+PiBidXQg
dGhlIDFNLTFHIHNwYWNlIGNhbm5vdCBiZSByZWNsYWltZWQuCj4+Pgo+Pj4gQnV0IHRoZSBjb21i
aW5hdGlvbiBvZiB0cnVuY2F0ZSBhbmQgZmFsbG9jIGNvbXBsaWNhdGVzIHRoZSByZWNvdmVyeQo+
Pj4gcHJvY2Vzcy4KPj4+IEZvciBleGFtcGxlLCBpbiB0aGUgZm9sbG93aW5nIHNjZW5hcmlvOgo+
Pj4gd3JpdGUgZmlsZUEgMk0gfCBmc3luYyB8IHRydW5jYXRlIDI1NksgfCBmYWxsb2MgLWsgMjU2
SyAxTSB8IGZzeW5jIEEgfCBTUE8KPj4+IFRoZSBmYWxsb2MgKDI1NkssIDFNKSBuZWVkIHRvIGJl
IHJlY292ZXJlZCBhcyBwcmUtYWxsb2NhdGVkIHNwYWNlLgo+Pj4KPj4+IEhvd2V2ZXIgaW4gdGhl
IGZvbGxvd2luZyBzY2VuYXJpb3MsIHRoZSBzaXR1YXRpb24gaXMgdGhlIG9wcG9zaXRlLgo+Pj4g
d3JpdGUgZmlsZUEgMk0gfCBmc3luYyB8IGZhbGxvYyAtayAyTSAxME0gfCBmc3luYyBBIHwgdHJ1
bmNhdGUgMjU2SyB8Cj4+PiBmc3luYyBBIHwgU1BPCj4+PiBJbiB0aGlzIHNjZW5hcmlvLCB0aGUg
c3BhY2UgYWxsb2NhdGVkIGJ5IGZhbGxvYyBuZWVkcyB0byBiZSB0cnVuY2F0ZWQuCj4+Pgo+Pj4g
RHVyaW5nIHRoZSByZWNvdmVyeSBwcm9jZXNzLCBpdCBpcyBkaWZmaWN1bHQgdG8gZGlzdGluZ3Vp
c2gKPj4+IGJldHdlZW4gdGhlIGFib3ZlIHR3byB0eXBlcyBvZiBmYWxsb2MuCj4+Pgo+Pj4gU28g
aW4gdGhpcyBjYXNlIG9mIGZhbGxvYyAtayB3ZSBuZWVkIHRvIHRyaWdnZXIgYSBjaGVja3BvaW50
IGZvciBmc3luYy4KPj4+Cj4+PiBGaXhlczogZDYyNGM5NmZiMzI0OSAoImYyZnM6IGFkZCByZWNv
dmVyeSByb3V0aW5lcyBmb3Igcm9sbC1mb3J3YXJkIikKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBX
YW5nIFhpYW9qdW4gPHdhbmd4aWFvanVuQHZpdm8uY29tPgo+Pj4gLS0tCj4+PiB2NDogVHJpZ2dl
ciBjaGVja3BvaW50IGZvciBmc3luYyBhZnRlciBmYWxsb2MgLWsKPj4+IHYzOiBBZGQgYSBGaXhl
cyBsaW5lLgo+Pj4gdjI6IEFwcGx5IENoYW8ncyBzdWdnZXN0aW9uIGZyb20gdjEuIE5vIGxvZ2lj
YWwgY2hhbmdlcy4KPj4+IHYxOiBGaXggbWlzc2luZyBzcGFjZSByZWNsYW1hdGlvbiBkdXJpbmcg
dGhlIHJlY292ZXJ5IHByb2Nlc3MuCj4+PiAtLS0KPj4+ICAgZnMvZjJmcy9jaGVja3BvaW50LmMg
fCAgMyArKysKPj4+ICAgZnMvZjJmcy9mMmZzLmggICAgICAgfCAgMyArKysKPj4+ICAgZnMvZjJm
cy9maWxlLmMgICAgICAgfCAgOCArKysrKystLQo+Pj4gICBmcy9mMmZzL3JlY292ZXJ5LmMgICB8
IDE4ICsrKysrKysrKysrKysrKysrLQo+Pj4gICA0IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY2hlY2tw
b2ludC5jIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPj4+IGluZGV4IGRiMzgzMWY3ZjJmNS4uNzc1
ZTMzMzMwOTdlIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9jaGVja3BvaW50LmMKPj4+ICsrKyBi
L2ZzL2YyZnMvY2hlY2twb2ludC5jCj4+PiBAQCAtMTE1MSw2ICsxMTUxLDkgQEAgc3RhdGljIGlu
dCBmMmZzX3N5bmNfaW5vZGVfbWV0YShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+PiAgIAkJ
aWYgKGlub2RlKSB7Cj4+PiAgIAkJCXN5bmNfaW5vZGVfbWV0YWRhdGEoaW5vZGUsIDApOwo+Pj4g
ICAKPj4+ICsJCQlpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0ZBTExPQ19LRUVQX1NJ
WkUpKQo+Pj4gKwkJCQljbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9GQUxMT0NfS0VFUF9TSVpF
KTsKPj4+ICsKPj4+ICAgCQkJLyogaXQncyBvbiBldmljdGlvbiAqLwo+Pj4gICAJCQlpZiAoaXNf
aW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0RJUlRZX0lOT0RFKSkKPj4+ICAgCQkJCWYyZnNfdXBk
YXRlX2lub2RlX3BhZ2UoaW5vZGUpOwo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIv
ZnMvZjJmcy9mMmZzLmgKPj4+IGluZGV4IDQ2YmU3NTYwNTQ4Yy4uZjVhNTRiYzg0OGQ1IDEwMDY0
NAo+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+PiBA
QCAtNDU5LDYgKzQ1OSw3IEBAIHN0cnVjdCBmc3luY19pbm9kZV9lbnRyeSB7Cj4+PiAgIAlzdHJ1
Y3QgaW5vZGUgKmlub2RlOwkvKiB2ZnMgaW5vZGUgcG9pbnRlciAqLwo+Pj4gICAJYmxvY2tfdCBi
bGthZGRyOwkvKiBibG9jayBhZGRyZXNzIGxvY2F0aW5nIHRoZSBsYXN0IGZzeW5jICovCj4+PiAg
IAlibG9ja190IGxhc3RfZGVudHJ5OwkvKiBibG9jayBhZGRyZXNzIGxvY2F0aW5nIHRoZSBsYXN0
IGRlbnRyeSAqLwo+Pj4gKwlsb2ZmX3QgbWF4X2lfc2l6ZTsJLyogcHJldmlvdXMgbWF4IGZpbGUg
c2l6ZSBmb3IgdHJ1bmNhdGUgKi8KPj4+ICAgfTsKPj4+ICAgCj4+PiAgICNkZWZpbmUgbmF0c19p
bl9jdXJzdW0oam5sKQkJKGxlMTZfdG9fY3B1KChqbmwpLT5uX25hdHMpKQo+Pj4gQEAgLTgzNSw2
ICs4MzYsNyBAQCBlbnVtIHsKPj4+ICAgCUZJX0FUT01JQ19SRVBMQUNFLAkvKiBpbmRpY2F0ZSBh
dG9taWMgcmVwbGFjZSAqLwo+Pj4gICAJRklfT1BFTkVEX0ZJTEUsCQkvKiBpbmRpY2F0ZSBmaWxl
IGhhcyBiZWVuIG9wZW5lZCAqLwo+Pj4gICAJRklfRE9OQVRFX0ZJTklTSEVELAkvKiBpbmRpY2F0
ZSBwYWdlIGRvbmF0aW9uIG9mIGZpbGUgaGFzIGJlZW4gZmluaXNoZWQgKi8KPj4+ICsJRklfRkFM
TE9DX0tFRVBfU0laRSwJLyogZmlsZSBhbGxvY2F0ZSByZXNlcnZlZCBzcGFjZSBhbmQga2VlcCBz
aXplICovCj4+PiAgIAlGSV9NQVgsCQkJLyogbWF4IGZsYWcsIG5ldmVyIGJlIHVzZWQgKi8KPj4+
ICAgfTsKPj4+ICAgCj4+PiBAQCAtMTE5Myw2ICsxMTk1LDcgQEAgZW51bSBjcF9yZWFzb25fdHlw
ZSB7Cj4+PiAgIAlDUF9TUEVDX0xPR19OVU0sCj4+PiAgIAlDUF9SRUNPVkVSX0RJUiwKPj4+ICAg
CUNQX1hBVFRSX0RJUiwKPj4+ICsJQ1BfRkFMTE9DX0ZJTEUsCj4+PiAgIH07Cj4+PiAgIAo+Pj4g
ICBlbnVtIGlvc3RhdF90eXBlIHsKPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2Zz
L2YyZnMvZmlsZS5jCj4+PiBpbmRleCA0MmZhYWVkNmEwMmQuLmYwODIwZjgxNzgyNCAxMDA2NDQK
Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4gQEAg
LTIzNiw2ICsyMzYsOCBAQCBzdGF0aWMgaW5saW5lIGVudW0gY3BfcmVhc29uX3R5cGUgbmVlZF9k
b19jaGVja3BvaW50KHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+PiAgIAllbHNlIGlmIChmMmZzX2V4
aXN0X3dyaXR0ZW5fZGF0YShzYmksIEYyRlNfSShpbm9kZSktPmlfcGlubywKPj4+ICAgCQkJCQkJ
CVhBVFRSX0RJUl9JTk8pKQo+Pj4gICAJCWNwX3JlYXNvbiA9IENQX1hBVFRSX0RJUjsKPj4+ICsJ
ZWxzZSBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0ZBTExPQ19LRUVQX1NJWkUpKQo+
Pj4gKwkJY3BfcmVhc29uID0gQ1BfRkFMTE9DX0ZJTEU7Cj4+PiAgIAo+Pj4gICAJcmV0dXJuIGNw
X3JlYXNvbjsKPj4+ICAgfQo+Pj4gQEAgLTE5NTMsMTAgKzE5NTUsMTIgQEAgc3RhdGljIGludCBm
MmZzX2V4cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQs
Cj4+PiAgIAl9Cj4+PiAgIAo+Pj4gICAJaWYgKG5ld19zaXplID4gaV9zaXplX3JlYWQoaW5vZGUp
KSB7Cj4+PiAtCQlpZiAobW9kZSAmIEZBTExPQ19GTF9LRUVQX1NJWkUpCj4+PiArCQlpZiAobW9k
ZSAmIEZBTExPQ19GTF9LRUVQX1NJWkUpIHsKPj4+ICsJCQlzZXRfaW5vZGVfZmxhZyhpbm9kZSwg
RklfRkFMTE9DX0tFRVBfU0laRSk7Cj4+IFhpYW9qdW4sCj4+Cj4+IFdlbGwsIHdoYXQgYWJvdXQg
dGhpcyBjYXNlPwo+Pgo+PiBmYWxsb2MgLWsgb2ZzIHNpemUgZmlsZQo+PiBmbHVzaCBhbGwgZGF0
YSBhbmQgbWV0YWRhdGEgb2YgZmlsZQo+IAo+IEhpIENoYW8sCj4gRmx1c2ggYWxsIGRhdGEgYW5k
IG1ldGFkYXRhIG9mIGZpbGUsIGJ1dCB3aXRob3V0IHVzaW5nIGZzeW5jIG9yIENQPwoKWGlhb2p1
biwKCkkgdGhpbmsgc28sIG9yIGFtIEkgbWlzc2luZyBzb21ldGluZz8KClRoYW5rcywKCj4gCj4g
VGhhbmtzLAo+IAo+PiBldmljdCBpbm9kZQo+PiB3cml0ZSBmaWxlICYgZnN5bmMgZmlsZSB3b24n
dCB0cmlnZ2VyIGEgY2hlY2twb2ludD8KPj4KPj4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8K
Pj4KPj4gVGhhbmtzLAo+Pgo+Pj4gICAJCQlmaWxlX3NldF9rZWVwX2lzaXplKGlub2RlKTsKPj4+
IC0JCWVsc2UKPj4+ICsJCX0gZWxzZSB7Cj4+PiAgIAkJCWYyZnNfaV9zaXplX3dyaXRlKGlub2Rl
LCBuZXdfc2l6ZSk7Cj4+PiArCQl9Cj4+PiAgIAl9Cj4+PiAgIAo+Pj4gICAJcmV0dXJuIGVycjsK
Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3JlY292ZXJ5LmMgYi9mcy9mMmZzL3JlY292ZXJ5LmMK
Pj4+IGluZGV4IDRjYjNhOTE4MDFiNC4uNjhiNjJjOGE3NGQzIDEwMDY0NAo+Pj4gLS0tIGEvZnMv
ZjJmcy9yZWNvdmVyeS5jCj4+PiArKysgYi9mcy9mMmZzL3JlY292ZXJ5LmMKPj4+IEBAIC05NSw2
ICs5NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgKmFkZF9mc3luY19pbm9k
ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+PiAgIAllbnRyeSA9IGYyZnNfa21lbV9jYWNo
ZV9hbGxvYyhmc3luY19lbnRyeV9zbGFiLAo+Pj4gICAJCQkJCUdGUF9GMkZTX1pFUk8sIHRydWUs
IE5VTEwpOwo+Pj4gICAJZW50cnktPmlub2RlID0gaW5vZGU7Cj4+PiArCWVudHJ5LT5tYXhfaV9z
aXplID0gaV9zaXplX3JlYWQoaW5vZGUpOwo+Pj4gICAJbGlzdF9hZGRfdGFpbCgmZW50cnktPmxp
c3QsIGhlYWQpOwo+Pj4gICAKPj4+ICAgCXJldHVybiBlbnRyeTsKPj4+IEBAIC03OTYsNiArNzk3
LDcgQEAgc3RhdGljIGludCByZWNvdmVyX2RhdGEoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBz
dHJ1Y3QgbGlzdF9oZWFkICppbm9kZV9saXN0LAo+Pj4gICAJd2hpbGUgKDEpIHsKPj4+ICAgCQlz
dHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgKmVudHJ5Owo+Pj4gICAJCXN0cnVjdCBmb2xpbyAqZm9s
aW87Cj4+PiArCQlsb2ZmX3QgaV9zaXplOwo+Pj4gICAKPj4+ICAgCQlpZiAoIWYyZnNfaXNfdmFs
aWRfYmxrYWRkcihzYmksIGJsa2FkZHIsIE1FVEFfUE9SKSkKPj4+ICAgCQkJYnJlYWs7Cj4+PiBA
QCAtODI4LDYgKzgzMCw5IEBAIHN0YXRpYyBpbnQgcmVjb3Zlcl9kYXRhKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgc3RydWN0IGxpc3RfaGVhZCAqaW5vZGVfbGlzdCwKPj4+ICAgCQkJCWJyZWFr
Owo+Pj4gICAJCQl9Cj4+PiAgIAkJCXJlY292ZXJlZF9pbm9kZSsrOwo+Pj4gKwkJCWlfc2l6ZSA9
IGlfc2l6ZV9yZWFkKGVudHJ5LT5pbm9kZSk7Cj4+PiArCQkJaWYgKGVudHJ5LT5tYXhfaV9zaXpl
IDwgaV9zaXplKQo+Pj4gKwkJCQllbnRyeS0+bWF4X2lfc2l6ZSA9IGlfc2l6ZTsKPj4+ICAgCQl9
Cj4+PiAgIAkJaWYgKGVudHJ5LT5sYXN0X2RlbnRyeSA9PSBibGthZGRyKSB7Cj4+PiAgIAkJCWVy
ciA9IHJlY292ZXJfZGVudHJ5KGVudHJ5LT5pbm9kZSwgZm9saW8sIGRpcl9saXN0KTsKPj4+IEBA
IC04NDQsOCArODQ5LDE5IEBAIHN0YXRpYyBpbnQgcmVjb3Zlcl9kYXRhKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgc3RydWN0IGxpc3RfaGVhZCAqaW5vZGVfbGlzdCwKPj4+ICAgCQl9Cj4+PiAg
IAkJcmVjb3ZlcmVkX2Rub2RlKys7Cj4+PiAgIAo+Pj4gLQkJaWYgKGVudHJ5LT5ibGthZGRyID09
IGJsa2FkZHIpCj4+PiArCQlpZiAoZW50cnktPmJsa2FkZHIgPT0gYmxrYWRkcikgewo+Pj4gKwkJ
CWlfc2l6ZSA9IGlfc2l6ZV9yZWFkKGVudHJ5LT5pbm9kZSk7Cj4+PiArCQkJaWYgKGVudHJ5LT5t
YXhfaV9zaXplID4gaV9zaXplKSB7Cj4+PiArCQkJCWVyciA9IGYyZnNfdHJ1bmNhdGVfYmxvY2tz
KGVudHJ5LT5pbm9kZSwKPj4+ICsJCQkJCQkJaV9zaXplLCBmYWxzZSk7Cj4+PiArCQkJCWlmIChl
cnIpIHsKPj4+ICsJCQkJCWYyZnNfZm9saW9fcHV0KGZvbGlvLCB0cnVlKTsKPj4+ICsJCQkJCWJy
ZWFrOwo+Pj4gKwkJCQl9Cj4+PiArCQkJCWYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGVudHJ5
LT5pbm9kZSwgdHJ1ZSk7Cj4+PiArCQkJfQo+Pj4gICAJCQlsaXN0X21vdmVfdGFpbCgmZW50cnkt
Pmxpc3QsIHRtcF9pbm9kZV9saXN0KTsKPj4+ICsJCX0KPj4+ICAgbmV4dDoKPj4+ICAgCQlyYV9i
bG9ja3MgPSBhZGp1c3RfcG9yX3JhX2Jsb2NrcyhzYmksIHJhX2Jsb2NrcywgYmxrYWRkciwKPj4+
ICAgCQkJCQluZXh0X2Jsa2FkZHJfb2Zfbm9kZShmb2xpbykpOwo+IAo+IAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

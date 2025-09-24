Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F227B986D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 08:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVGl6znhiJ3tSVaSRnCWIrj5hNxdhJk97UWny3YPU2g=; b=M6ZiVfwkQIv8G0QJzAAjXB4VbU
	AfEMNSnWOUF4NuxxYZJ5m66wpl3pPIynqXhyKND1ksLasi/D5S66x4veKoScQqZTuJK3Nvx59UGmL
	y5mXU+AtLHC3H0WLXtoBiMSajoS2yvAgEJayb0eSdRl2PQWv8+VOAkZlsmh3w0g/OMuk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1JEH-0005p7-8B;
	Wed, 24 Sep 2025 06:43:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v1JEF-0005p1-KJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 06:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dNHfSoIVpFwuM1Rn3NBdwCp/yR1js3GjKKhzYVZ/jyk=; b=AA0e3mXFPL2J6WT9XvcMDvHwQ2
 OXXNtOwDUA+IirAgoQK4wdj+ROZDsPQZzYDGsf/fVLl5kq84vNPl8YgyW5QJTqT6JMHmCRsEWO+9A
 1VJ9F4Opu/q+Y0tYMvt9pZkIRlz5q0tlrvFWanzMj67rhG05X1cr7ElB7oactt8WcSbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dNHfSoIVpFwuM1Rn3NBdwCp/yR1js3GjKKhzYVZ/jyk=; b=B05A2YKK+l8tfBWDKv55k/yiak
 zjhPiLW6iM7RsE4X4NXuoJvTuwMQKbefaCDyXbZ8dP9G5V04J8D7E2Oobr5m8nqieCCtaiNfDBc94
 W5FTRw7HI35a4BqSPKuGohQx0zJ6ogfOCFSNShV2hJ3a+J+p1Mq4Zyy0oqTjIKrtch7U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1JEE-00012y-JZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 06:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EA68D60051;
 Wed, 24 Sep 2025 06:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD93C4CEE7;
 Wed, 24 Sep 2025 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758696219;
 bh=8DK3jW+UQGE9APyR7Iu45j5l71ebl6KdPy8ALRX1Ows=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rGD6gfpEQH97FilLSBIZqOpG2kbsAW2mhWqfj/K/dWqLip4nIn5CDRS67u3DjbRkc
 8m4FS9Ag012jcUlpDJ2H895+D4Va5p0ATjMwZNa3fW127EPlpVBND1leEtl1iGzBdt
 LrEhrsSUJMnRmH2E2SE+qea6zDKDNkTHsp6oUhvlH4lkEfwtiRqh8GB39wd8cm89Ey
 gXECtox/g3TYK/UVP5be7Fe/BhvCVzxc9XMIkyFkD/eBEz64ZUpRvqKETf9MStoBKM
 CCXwQCB6VJZBMddrSdI6qdmwgSRgDf1UhnQ1iR+bgpcBBCHsa8g5VkDQQ/MoyYKRcp
 oTDSphdaIjHJQ==
Message-ID: <84d65c75-7ab7-4c0c-9085-9423effb8632@kernel.org>
Date: Wed, 24 Sep 2025 14:43:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yunji Kang <yunji0.kang@samsung.com>, jaegeuk@kernel.org
References: <CGME20250918082037epcas1p1eb201d3b6d5780c0bff3ba32740ccdcf@epcas1p1.samsung.com>
 <20250918082023.57381-1-yunji0.kang@samsung.com>
 <89f237cd-3f86-405a-8f8f-d9cad250ef00@kernel.org>
 <00d401dc2d0a$18100c20$48302460$@samsung.com>
Content-Language: en-US
In-Reply-To: <00d401dc2d0a$18100c20$48302460$@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/24/25 12:17,
 Yunji Kang wrote: >>> In f2fs_precache_extents(), 
 For large files, It requires reading many >>> node blocks. Instead of reading
 each node block with synchronous I/O, >>> this patch a [...] 
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
X-Headers-End: 1v1JEE-00012y-JZ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: readahead node blocks in
 F2FS_GET_BLOCK_PRECACHE mode
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
Cc: linux-kernel@vger.kernel.org, 'Sungjong Seo' <sj1557.seo@samsung.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOS8yNC8yNSAxMjoxNywgWXVuamkgS2FuZyB3cm90ZToKPj4+IEluIGYyZnNfcHJlY2FjaGVf
ZXh0ZW50cygpLCBGb3IgbGFyZ2UgZmlsZXMsIEl0IHJlcXVpcmVzIHJlYWRpbmcgbWFueQo+Pj4g
bm9kZSBibG9ja3MuIEluc3RlYWQgb2YgcmVhZGluZyBlYWNoIG5vZGUgYmxvY2sgd2l0aCBzeW5j
aHJvbm91cyBJL08sCj4+PiB0aGlzIHBhdGNoIGFwcGxpZXMgcmVhZGFoZWFkIHNvIHRoYXQgbm9k
ZSBibG9ja3MgY2FuIGJlIGZldGNoZWQgaW4KPj4+IGFkdmFuY2UuCj4+Pgo+Pj4gSXQgcmVkdWNl
cyB0aGUgb3ZlcmhlYWQgb2YgcmVwZWF0ZWQgc3luYyByZWFkcyBhbmQgaW1wcm92ZXMgZWZmaWNp
ZW5jeQo+Pj4gd2hlbiBwcmVjYWNoaW5nIGV4dGVudHMgb2YgbGFyZ2UgZmlsZXMuCj4+Pgo+Pj4g
SSBjcmVhdGVkIGEgZmlsZSB3aXRoIHRoZSBzYW1lIGxhcmdlc3QgZXh0ZW50IGFuZCBleGVjdXRl
ZCB0aGUgdGVzdC4KPj4+IEZvciB0aGlzIGV4cGVyaW1lbnQsIEkgc2V0IHRoZSBmaWxlJ3MgbGFy
Z2VzdCBleHRlbnQgd2l0aCBhbiBvZmZzZXQgb2YKPj4+IDAgYW5kIGEgc2l6ZSBvZiAxR0IuIEkg
Y29uZmlndXJlZCB0aGUgcmVtYWluaW5nIGFyZWEgd2l0aCAxMDBNQiBleHRlbnRzLgo+Pj4KPj4+
IDVHQiB0ZXN0IGZpbGU6Cj4+PiBkZCBpZj0vZGV2L3VyYW5kb20gb2Y9dGVzdDEgYnM9MW0gY291
bnQ9NTEyMCBjcCB0ZXN0MSB0ZXN0MiBmc3luYwo+Pj4gdGVzdDEgZGQgaWY9dGVzdDEgb2Y9dGVz
dDIgYnM9MW0gc2tpcD0xMDI0IHNlZWs9MTAyNCBjb3VudD0xMDAKPj4+IGNvbnY9bm90cnVuYyBk
ZCBpZj10ZXN0MSBvZj10ZXN0MiBicz0xbSBza2lwPTEyMjQgc2Vlaz0xMjI0IGNvdW50PTEwMAo+
Pj4gY29udj1ub3RydW5jIC4uLgo+Pj4gZGQgaWY9dGVzdDEgb2Y9dGVzdDIgYnM9MW0gc2tpcD01
MDI0IHNlZWs9NTAyNCBjb3VudD0xMDAgY29udj1ub3RydW5jCj4+PiByZWJvb3QKPj4+Cj4+PiBJ
IGFsc28gY3JlYXRlZCAxMEdCIGFuZCAyMEdCIGZpbGVzIHdpdGggbGFyZ2UgZXh0ZW50cyB1c2lu
ZyB0aGUgc2FtZQo+Pj4gbWV0aG9kLgo+Pj4KPj4+IGlvY3RsKEYyRlNfSU9DX1BSRUNBQ0hFX0VY
VEVOVFMpIHRlc3QgcmVzdWx0cyBhcmUgYXMgZm9sbG93czoKPj4+ICAgKy0tLS0tLS0tLS0tKy0t
LS0tLS0tLSstLS0tLS0tLS0rLS0tLS0tLS0tLS0rCj4+PiAgIHwgRmlsZSBzaXplIHwgQmVmb3Jl
ICB8IEFmdGVyICAgfCBSZWR1Y3Rpb24gfAo+Pj4gICArLS0tLS0tLS0tLS0rLS0tLS0tLS0tKy0t
LS0tLS0tLSstLS0tLS0tLS0tLSsKPj4+ICAgfCA1R0IgICAgICAgfCAxMDEuOG1zIHwgNzIuMW1z
ICB8IDI5LjIlICAgICB8Cj4+PiAgIHwgMTBHQiAgICAgIHwgMjIyLjltcyB8IDE0OS41bXMgfCAz
Mi45JSAgICAgfAo+Pj4gICB8IDIwR0IgICAgICB8IDQ0Ni4ybXMgfCAyNzYuM21zIHwgMzguMSUg
ICAgIHwKPj4+ICAgKy0tLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0rLS0tLS0tLS0tLS0r
Cj4+Cj4+IFl1bmppLAo+Pgo+PiBXaWxsIHdlIGdhaW4gYmV0dGVyIHBlcmZvcm1hbmNlIGlmIHdl
IHJlYWRhaGVhZCBtb3JlIG5vZGUgcGFnZXMgdy8KPj4gc3ljaHJvbm91cyByZXF1ZXN0IGZvciBw
cmVjYWNoZSBleHRlbnQgY2FzZT8gSGF2ZSB5b3UgdHJpZWQgdGhhdD8KPj4KPj4gVGhhbmtzLAo+
Pgo+IAo+IERvZXMg4oCccmVhZGFoZWFkIG1vcmUgbm9kZSBwYWdlc+KAnSBtZWFuIHJlbW92aW5n
IHRoaXMgY29uZGl0aW9uPwo+ICIgb2Zmc2V0W2kgLSAxXSAlIE1BWF9SQV9OT0RFID09IDAgIgoK
QWN0dWFsbHksIEkgbWVhbnQgYSkgcmVtb3ZlICJvZmZzZXRbaSAtIDFdICUgTUFYX1JBX05PREUg
PT0gMCIgb3IgYikKaW5jcmVhc2UgTUFYX1JBX05PREUuCgpBbHNvLCBtYXliZSB3ZSBjYW4gdHJ5
IGFzIGJlbG93IHRvIHRyaWdnZXIgc3luY2hyb25vdXMgSU8gZm9yIHN1Y2ggaGlnaApkZXRlcm1p
bmFjeSByZWFkLgoKdm9pZCBkZjJmc19yYV9ub2RlX3BhZ2UoKQp7Ci4uLgoJZXJyID0gcmVhZF9u
b2RlX2ZvbGlvKGFmb2xpbywgMCk7Ci4uLgp9Cgo+IAo+IEkgb3JpZ2luYWxseSBhZGRlZCB0aGUg
Y29uZGl0aW9uIHRvIHByZXZlbnQgdW5uZWNlc3NhcnkgcmVhZGFoZWFkIHJlcXVlc3RzLCAKPiBi
dXQgaXQgc2VlbXMgdGhpcyBjb25kaXRpb24gd2FzIGFjdHVhbGx5IGJsb2NraW5nIHZhbGlkIHJl
YWRhaGVhZCBhcyB3ZWxsLgo+IAo+IEFmdGVyIHJlbW92aW5nIHRoZSBjb25kaXRpb24gYW5kIHJ1
bm5pbmcgdGVzdHMsIAo+IEkgY29uZmlybWVkIHRoYXQgbW9yZSByZWFkYWhlYWQgbm9kZSBwYWdl
cyBhcmUgYmVpbmcgaXNzdWVkLgo+IAo+IEnigJlsbCBzaGFyZSB0aGUgdGVzdCByZXN1bHRzIGFs
b25nIHdpdGggdGhlIGltcHJvdmVkIHBhdGNoLgoKSXQgbWFrZXMgc2Vuc2UsIHRoYW5rcyBmb3Ig
Y2hlY2tpbmcgdGhpcyBhbmQgc2hhcmluZyB0aGUgcmVzdWx0LgoKVGhhbmtzLAoKPiAKPiBUaGFu
a3MsCj4gCj4+PiBUZXN0ZWQgb24gYSAyNTZHQiBtb2JpbGUgZGV2aWNlIHdpdGggYW4gU004NzUw
IGNoaXBzZXQuCj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IFN1bmdqb25nIFNlbyA8c2oxNTU3LnNlb0Bz
YW1zdW5nLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBTdW5taW4gSmVvbmcgPHNfbWluLmplb25nQHNh
bXN1bmcuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogWXVuamkgS2FuZyA8eXVuamkwLmthbmdAc2Ft
c3VuZy5jb20+Cj4+PiAtLS0KPj4+IHYyOgo+Pj4gIC0gTW9kaWZ5IHRoZSByZWFkYWhlYWQgY29u
ZGl0aW9uIGNoZWNrIHJvdXRpbmUgZm9yIGJldHRlciBjb2RlCj4+PiByZWFkYWJpbGl0eS4KPj4+
ICAtIFVwZGF0ZSB0aGUgdGl0bGUgZnJvbSAnbm9kZSBibG9jaycgdG8gJ25vZGUgYmxvY2tzJy4K
Pj4+Cj4+PiAgZnMvZjJmcy9kYXRhLmMgfCAzICsrKwo+Pj4gIGZzL2YyZnMvZjJmcy5oIHwgMSAr
Cj4+PiAgZnMvZjJmcy9ub2RlLmMgfCA1ICsrKystCj4+PiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9k
YXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBpbmRleAo+Pj4gNzk2MWUwZGRmY2EzLi5hYjMxMTdlM2Iy
NGEgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4gKysrIGIvZnMvZjJmcy9kYXRh
LmMKPj4+IEBAIC0xNTcyLDYgKzE1NzIsOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIHN0cnVjdAo+PiBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpCj4+
PiAgCXBnb2ZzID0JKHBnb2ZmX3QpbWFwLT5tX2xibGs7Cj4+PiAgCWVuZCA9IHBnb2ZzICsgbWF4
YmxvY2tzOwo+Pj4KPj4+ICsJaWYgKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfUFJFQ0FDSEUpCj4+
PiArCQltb2RlID0gTE9PS1VQX05PREVfUFJFQ0FDSEU7Cj4+PiArCj4+PiAgbmV4dF9kbm9kZToK
Pj4+ICAJaWYgKG1hcC0+bV9tYXlfY3JlYXRlKSB7Cj4+PiAgCQlpZiAoZjJmc19sZnNfbW9kZShz
YmkpKQo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5k
ZXgKPj4+IDlkM2JjOTYzM2MxZC4uM2NlNDE1MjhkNDhlIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJm
cy9mMmZzLmgKPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+PiBAQCAtNjUxLDYgKzY1MSw3IEBA
IGVudW0gewo+Pj4gIAkJCQkJICogbG9vayB1cCBhIG5vZGUgd2l0aCByZWFkYWhlYWQgY2FsbGVk
Cj4+PiAgCQkJCQkgKiBieSBnZXRfZGF0YV9ibG9jay4KPj4+ICAJCQkJCSAqLwo+Pj4gKwlMT09L
VVBfTk9ERV9QUkVDQUNIRSwJCS8qIGxvb2sgdXAgYSBub2RlIGZvcgo+PiBGMkZTX0dFVF9CTE9D
S19QUkVDQUNIRSAqLwo+Pj4gIH07Cj4+Pgo+Pj4gICNkZWZpbmUgREVGQVVMVF9SRVRSWV9JT19D
T1VOVAk4CS8qIG1heGltdW0gcmV0cnkgcmVhZCBJTyBvciBmbHVzaAo+PiBjb3VudCAqLwo+Pj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbm9kZS5jIGIvZnMvZjJmcy9ub2RlLmMgaW5kZXgKPj4+IDQy
NTRkYjQ1M2IyZC4uZDRiZjNjZTcxNWM1IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMK
Pj4+ICsrKyBiL2ZzL2YyZnMvbm9kZS5jCj4+PiBAQCAtODYwLDcgKzg2MCwxMCBAQCBpbnQgZjJm
c19nZXRfZG5vZGVfb2ZfZGF0YShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sCj4+IHBnb2ZmX3Qg
aW5kZXgsIGludCBtb2RlKQo+Pj4gIAkJCXNldF9uaWQocGFyZW50LCBvZmZzZXRbaSAtIDFdLCBu
aWRzW2ldLCBpID09IDEpOwo+Pj4gIAkJCWYyZnNfYWxsb2NfbmlkX2RvbmUoc2JpLCBuaWRzW2ld
KTsKPj4+ICAJCQlkb25lID0gdHJ1ZTsKPj4+IC0JCX0gZWxzZSBpZiAobW9kZSA9PSBMT09LVVBf
Tk9ERV9SQSAmJiBpID09IGxldmVsICYmIGxldmVsID4gMSkKPj4gewo+Pj4gKwkJfSBlbHNlIGlm
ICgoaSA9PSBsZXZlbCAmJiBsZXZlbCA+IDEpICYmCj4+PiArCQkJCShtb2RlID09IExPT0tVUF9O
T0RFX1JBIHx8Cj4+PiArCQkJCShtb2RlID09IExPT0tVUF9OT0RFX1BSRUNBQ0hFICYmCj4+PiAr
CQkJCW9mZnNldFtpIC0gMV0gJSBNQVhfUkFfTk9ERSA9PSAwKSkpIHsKPj4+ICAJCQluZm9saW9b
aV0gPSBmMmZzX2dldF9ub2RlX2ZvbGlvX3JhKHBhcmVudCwgb2Zmc2V0W2kgLQo+PiAxXSk7Cj4+
PiAgCQkJaWYgKElTX0VSUihuZm9saW9baV0pKSB7Cj4+PiAgCQkJCWVyciA9IFBUUl9FUlIobmZv
bGlvW2ldKTsKPiAKPiAKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

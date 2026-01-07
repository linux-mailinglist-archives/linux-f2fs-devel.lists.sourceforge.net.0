Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D3CFBACB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 03:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIF0TtG1ZVwmofyXjAa2EQuoI/37pyGATDgY7ZalBpQ=; b=kT13FzXpfYwU6LiuTT/uGwl045
	x9GWOsZoSusovLDJLDnmdwaF5eVext5kbJ0nJJRtomkN14iCASesyXlsLsAOJBXEhtkCe3IsRu4/E
	XP5giqTjzvnGzY/MABLeYgWk6WFfS+jouG1GP+Xpb1VOBmWkfQXUofF7fQK3DQk5Rkpc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdJ2w-00058Q-6e;
	Wed, 07 Jan 2026 02:13:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vdJ2r-00058J-T0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 02:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WZHHh5V5Qp+YJvhH0ZkdPdfEEkDBvvJcDjL1kTv9Q3g=; b=QaCOiXIHbUqpNxSZ2HbSOm7Pi1
 qenaB708IGvOGGUxRiqcGP1EYqMXEr8nk1TIhPkYf7CgxXKfGyf2NWBmAHzZ2RCw59LO6zwy+BhWa
 n46LPwS0iyam8iEBVWWmZ6QAfhlPRP5loxls75CTf2hcEyTpCheUwu1xA+7atAKrx3bw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WZHHh5V5Qp+YJvhH0ZkdPdfEEkDBvvJcDjL1kTv9Q3g=; b=lxM+XDY7eUHa6WGMVI70VmHvrC
 yQwVZ4CeDMaIlCF6i4//Rh3OUjaoRkQtHidVxzIcm5WnEaPZyrA3UA8GnVdaHizC2TpZGrjPsAlqp
 kdTa4f4KLv6MEn5ClfQ4KV2mYxBFXRxyTBXzv7WUCq5HMg5gDv8+JeBPEl+GMNt6K4nI=;
Received: from smtp153-141.sina.com.cn ([61.135.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdJ2q-0001v4-AG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 02:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1767751988; bh=WZHHh5V5Qp+YJvhH0ZkdPdfEEkDBvvJcDjL1kTv9Q3g=;
 h=Message-ID:Date:Subject:From;
 b=P8QffGc1mpyvs/1QuHVO7LE+6R0zylSipkKtKk25LMEl7duBFzL36B8ullhnZ29df
 MIgITi//ynBLPeUqTSUFX0bx2lPHVp4723VrzX93btLLK8tZqbcSA4SfllhrkzZHCT
 pXW8ZvSevmPdkqUnQJyJ4VfXYyP7KpGwd9O6jtyc=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.31) with ESMTP
 id 695DC129000031EC; Wed, 7 Jan 2026 10:12:59 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 6627056816478
X-SMAIL-UIID: B6F009BC39B0463D8021474544295701-20260107-101259-1
Message-ID: <c5cac459-afa4-47a9-8e4d-636c52329b5a@sina.com>
Date: Wed, 7 Jan 2026 10:12:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260106115644.2368389-3-monty_pavel@sina.com>
 <aabdfeec-a794-440b-a212-81ea02868506@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <aabdfeec-a794-440b-a212-81ea02868506@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/7/26 08:57, Chao Yu via Linux-f2fs-devel wrote: > On
 1/6/2026 7:56 PM, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> Some f2fs
 sysfs attributes suffer from out-of-bounds memory access and > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vdJ2q-0001v4-AG
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix out-of-bounds access in
 sysfs attribute read/write
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>, stable@kernel.org,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMS83LzI2IDA4OjU3LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+IE9u
IDEvNi8yMDI2IDc6NTYgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEZyb206IFlvbmdwZW5n
IFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pgo+PiBTb21lIGYyZnMgc3lzZnMgYXR0
cmlidXRlcyBzdWZmZXIgZnJvbSBvdXQtb2YtYm91bmRzIG1lbW9yeSBhY2Nlc3MgYW5kCj4+IGlu
Y29ycmVjdCBoYW5kbGluZyBvZiBpbnRlZ2VyIHZhbHVlcyB3aG9zZSBzaXplIGlzIG5vdCA0IGJ5
dGVzLgo+Pgo+PiBGb3IgZXhhbXBsZToKPj4gdm06fiMgZWNobyA2NTUzNyA+IC9zeXMvZnMvZjJm
cy92ZGUvY2FydmVfb3V0Cj4+IHZtOn4jIGNhdCAvc3lzL2ZzL2YyZnMvdmRlL2NhcnZlX291dAo+
PiA2NTUzNwo+PiB2bTp+IyBlY2hvIDQyOTQ5NjcyOTcgPiAvc3lzL2ZzL2YyZnMvdmRlL2F0Z2Nf
YWdlX3RocmVzaG9sZAo+PiB2bTp+IyBjYXQgL3N5cy9mcy9mMmZzL3ZkZS9hdGdjX2FnZV90aHJl
c2hvbGQKPj4gMQo+Pgo+PiBjYXJ2ZV9vdXQgbWFwcyB0byB7c3RydWN0IGYyZnNfc2JfaW5mb30t
PmNhcnZlX291dCwgd2hpY2ggaXMgYSA4LWJpdAo+PiBpbnRlZ2VyLiBIb3dldmVyLCB0aGUgc3lz
ZnMgaW50ZXJmYWNlIGFsbG93cyBzZXR0aW5nIGl0IHRvIGEgdmFsdWUKPj4gbGFyZ2VyIHRoYW4g
MjU1LCByZXN1bHRpbmcgaW4gYW4gb3V0LW9mLXJhbmdlIHVwZGF0ZS4KPj4KPj4gYXRnY19hZ2Vf
dGhyZXNob2xkIG1hcHMgdG8ge3N0cnVjdCBhdGdjX21hbmFnZW1lbnR9LT5hZ2VfdGhyZXNob2xk
LAo+PiB3aGljaCBpcyBhIDY0LWJpdCBpbnRlZ2VyLCBidXQgaXRzIHN5c2ZzIGludGVyZmFjZSBj
YW5ub3QgY29ycmVjdGx5IHNldAo+PiB2YWx1ZXMgbGFyZ2VyIHRoYW4gVUlOVF9NQVguCj4+Cj4+
IFRoZSByb290IGNhdXNlcyBhcmU6Cj4+IDEuIF9fc2JpX3N0b3JlKCkgdHJlYXRzIGFsbCBkZWZh
dWx0IHZhbHVlcyBhcyB1bnNpZ25lZCBpbnQsIHdoaWNoCj4+IHByZXZlbnRzIHVwZGF0aW5nIGlu
dGVnZXJzIGxhcmdlciB0aGFuIDQgYnl0ZXMgYW5kIGNhdXNlcyBvdXQtb2YtYm91bmRzCj4+IHdy
aXRlcyBmb3IgaW50ZWdlcnMgc21hbGxlciB0aGFuIDQgYnl0ZXMuCj4+Cj4+IDIuIGYyZnNfc2Jp
X3Nob3coKSBhbHNvIGFzc3VtZXMgYWxsIGRlZmF1bHQgdmFsdWVzIGFyZSB1bnNpZ25lZCBpbnQs
Cj4+IGxlYWRpbmcgdG8gb3V0LW9mLWJvdW5kcyByZWFkcyBhbmQgaW5jb3JyZWN0IGFjY2VzcyB0
byBpbnRlZ2VycyBsYXJnZXIKPj4gdGhhbiA0IGJ5dGVzLgo+Pgo+PiBUaGlzIHBhdGNoIGludHJv
ZHVjZXMge3N0cnVjdCBmMmZzX2F0dHJ9LT5zaXplIHRvIHJlY29yZCB0aGUgYWN0dWFsIHNpemUK
Pj4gb2YgdGhlIGludGVnZXIgYXNzb2NpYXRlZCB3aXRoIGVhY2ggc3lzZnMgYXR0cmlidXRlLiBX
aXRoIHRoaXMKPj4gaW5mb3JtYXRpb24sIHN5c2ZzIHJlYWQgYW5kIHdyaXRlIG9wZXJhdGlvbnMg
Y2FuIGNvcnJlY3RseSBhY2Nlc3MgYW5kCj4+IHVwZGF0ZSB2YWx1ZXMgYWNjb3JkaW5nIHRvIHRo
ZWlyIHJlYWwgZGF0YSBzaXplLCBhdm9pZGluZyBtZW1vcnkKPj4gY29ycnVwdGlvbiBhbmQgdHJ1
bmNhdGlvbi4KPj4KPj4gRml4ZXM6IGI1OWQwYmFlNmNhMygiZjJmczogYWRkIHN5c2ZzIHN1cHBv
cnQgZm9yIGNvbnRyb2xsaW5nIHRoZQo+PiBnY190aHJlYWQiKQo+IAo+IC4vc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIHRyaWdnZXJzIHdhcm5pbmcgYXMgYmVsb3c6Cj4gCj4gV0FSTklORzogUGxlYXNl
IHVzZSBjb3JyZWN0IEZpeGVzOiBzdHlsZSAnRml4ZXM6IDwxMisgY2hhcnMgb2Ygc2hhMT4KPiAo
Ijx0aXRsZSBsaW5lPiIpJyAtIGllOiAnRml4ZXM6IGI1OWQwYmFlNmNhMyAoImYyZnM6IGFkZCBz
eXNmcyBzdXBwb3J0Cj4gZm9yIGNvbnRyb2xsaW5nIHRoZSBnY190aHJlYWQiKScKPiAjNDA6Cj4g
Rml4ZXM6IGI1OWQwYmFlNmNhMygiZjJmczogYWRkIHN5c2ZzIHN1cHBvcnQgZm9yIGNvbnRyb2xs
aW5nIHRoZQo+IGdjX3RocmVhZCIpCgpTb3JyeSwgbXkgbWlzdGFrZS4gSSdsbCBmaXggdGhpcyBp
biB2MyBwYXRjaC4KClRoYW5rcwpZb25ncGVuZywKCj4gCj4gT3RoZXJ3aXNlLCB0aGUgcGF0Y2gg
bG9va3MgZ29vZCB0byBtZS4KPiAKPiBUaGFua3MsCj4gCj4+IENjOiBzdGFibGVAa2VybmVsLm9y
Zwo+PiBTaWduZWQtb2ZmLWJ5OiBKaW5iYW8gTGl1IDxsaXVqaW5iYW8xQHhpYW9taS5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+
PiAtLS0KPj4gdjI6Cj4+IC0gUmVwbGFjZSBnY19waW5fZmlsZV90aHJlc2ggZXhhbXBsZSB3aXRo
IGNhcnZlX291dCBpbiB0aGUgY29tbWl0Cj4+IG1lc3NhZ2UuCj4+IC0tLQo+PiDCoCBmcy9mMmZz
L3N5c2ZzLmMgfCA2MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5j
Cj4+IGluZGV4IGM0MmY0Zjk3OWQxMy4uZTZhOThkZGQ3M2IzIDEwMDY0NAo+PiAtLS0gYS9mcy9m
MmZzL3N5c2ZzLmMKPj4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4+IEBAIC01OCw2ICs1OCw3IEBA
IHN0cnVjdCBmMmZzX2F0dHIgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0
IGNoYXIgKmJ1Ziwgc2l6ZV90IGxlbik7Cj4+IMKgwqDCoMKgwqAgaW50IHN0cnVjdF90eXBlOwo+
PiDCoMKgwqDCoMKgIGludCBvZmZzZXQ7Cj4+ICvCoMKgwqAgaW50IHNpemU7Cj4+IMKgwqDCoMKg
wqAgaW50IGlkOwo+PiDCoCB9Owo+PiDCoCBAQCAtMzQ0LDExICszNDUsMzAgQEAgc3RhdGljIHNz
aXplX3QgbWFpbl9ibGthZGRyX3Nob3coc3RydWN0Cj4+IGYyZnNfYXR0ciAqYSwKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKHVuc2lnbmVkIGxvbmcgbG9uZylNQUlOX0JMS0FERFIoc2Jp
KSk7Cj4+IMKgIH0KPj4gwqAgK3N0YXRpYyBzc2l6ZV90IF9fc2JpX3Nob3dfdmFsdWUoc3RydWN0
IGYyZnNfYXR0ciAqYSwKPj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwgY2hhciAqYnVmLAo+PiArwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgY2hhciAqdmFsdWUpCj4+
ICt7Cj4+ICvCoMKgwqAgc3dpdGNoIChhLT5zaXplKSB7Cj4+ICvCoMKgwqAgY2FzZSAxOgo+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXVcbiIsICoodTggKil2YWx1
ZSk7Cj4+ICvCoMKgwqAgY2FzZSAyOgo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHN5c2ZzX2Vt
aXQoYnVmLCAiJXVcbiIsICoodTE2ICopdmFsdWUpOwo+PiArwqDCoMKgIGNhc2UgNDoKPj4gK8Kg
wqDCoMKgwqDCoMKgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiV1XG4iLCAqKHUzMiAqKXZhbHVl
KTsKPj4gK8KgwqDCoCBjYXNlIDg6Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gc3lzZnNfZW1p
dChidWYsICIlbGx1XG4iLCAqKHU2NCAqKXZhbHVlKTsKPj4gK8KgwqDCoCBkZWZhdWx0Ogo+PiAr
wqDCoMKgwqDCoMKgwqAgZjJmc19idWdfb24oc2JpLCAxKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiBzeXNmc19lbWl0KGJ1ZiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAi
c2hvdyBzeXNmcyBub2RlIHZhbHVlIHdpdGggd3JvbmcgdHlwZVxuIik7Cj4+ICvCoMKgwqAgfQo+
PiArfQo+PiArCj4+IMKgIHN0YXRpYyBzc2l6ZV90IGYyZnNfc2JpX3Nob3coc3RydWN0IGYyZnNf
YXR0ciAqYSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBjaGFyICpidWYpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBjaGFyICpw
dHIgPSBOVUxMOwo+PiAtwqDCoMKgIHVuc2lnbmVkIGludCAqdWk7Cj4+IMKgIMKgwqDCoMKgwqAg
cHRyID0gX19zdHJ1Y3RfcHRyKHNiaSwgYS0+c3RydWN0X3R5cGUpOwo+PiDCoMKgwqDCoMKgIGlm
ICghcHRyKQo+PiBAQCAtNDI4LDkgKzQ0OCwzMCBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3NiaV9z
aG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYXRvbWljX3JlYWQoJnNiaS0+Y3BfY2FsbF9jb3VudFtCQUNLR1JPVU5EXSkpOwo+PiDC
oCAjZW5kaWYKPj4gwqAgLcKgwqDCoCB1aSA9ICh1bnNpZ25lZCBpbnQgKikocHRyICsgYS0+b2Zm
c2V0KTsKPj4gK8KgwqDCoCByZXR1cm4gX19zYmlfc2hvd192YWx1ZShhLCBzYmksIGJ1ZiwgcHRy
ICsgYS0+b2Zmc2V0KTsKPj4gK30KPj4gwqAgLcKgwqDCoCByZXR1cm4gc3lzZnNfZW1pdChidWYs
ICIldVxuIiwgKnVpKTsKPj4gK3N0YXRpYyB2b2lkIF9fc2JpX3N0b3JlX3ZhbHVlKHN0cnVjdCBm
MmZzX2F0dHIgKmEsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgY2hhciAqdWksIHVu
c2lnbmVkIGxvbmcgdmFsdWUpCj4+ICt7Cj4+ICvCoMKgwqAgc3dpdGNoIChhLT5zaXplKSB7Cj4+
ICvCoMKgwqAgY2FzZSAxOgo+PiArwqDCoMKgwqDCoMKgwqAgKih1OCAqKXVpID0gdmFsdWU7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoCBjYXNlIDI6Cj4+ICvCoMKgwqDCoMKg
wqDCoCAqKHUxNiAqKXVpID0gdmFsdWU7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8Kg
wqDCoCBjYXNlIDQ6Cj4+ICvCoMKgwqDCoMKgwqDCoCAqKHUzMiAqKXVpID0gdmFsdWU7Cj4+ICvC
oMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoCBjYXNlIDg6Cj4+ICvCoMKgwqDCoMKgwqDC
oCAqKHU2NCAqKXVpID0gdmFsdWU7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDC
oCBkZWZhdWx0Ogo+PiArwqDCoMKgwqDCoMKgwqAgZjJmc19idWdfb24oc2JpLCAxKTsKPj4gK8Kg
wqDCoMKgwqDCoMKgIGYyZnNfZXJyKHNiaSwgInN0b3JlIHN5c2ZzIG5vZGUgdmFsdWUgd2l0aCB3
cm9uZyB0eXBlIik7Cj4+ICvCoMKgwqAgfQo+PiDCoCB9Cj4+IMKgIMKgIHN0YXRpYyBzc2l6ZV90
IF9fc2JpX3N0b3JlKHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+IEBAIC05MDYsNyArOTQ3LDcgQEAg
c3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNfYXR0ciAqYSwKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBjb3VudDsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIC3CoMKgwqAg
KnVpID0gKHVuc2lnbmVkIGludCl0Owo+PiArwqDCoMKgIF9fc2JpX3N0b3JlX3ZhbHVlKGEsIHNi
aSwgcHRyICsgYS0+b2Zmc2V0LCB0KTsKPj4gwqAgwqDCoMKgwqDCoCByZXR1cm4gY291bnQ7Cj4+
IMKgIH0KPj4gQEAgLTEwNTMsMjQgKzEwOTQsMjcgQEAgc3RhdGljIHN0cnVjdCBmMmZzX2F0dHIg
ZjJmc19hdHRyX3NiXyMjX25hbWUgPQo+PiB7wqDCoMKgwqDCoMKgwqAgXAo+PiDCoMKgwqDCoMKg
IC5pZMKgwqDCoCA9IEYyRlNfRkVBVFVSRV8jI19mZWF0LMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcCj4+IMKgIH0KPj4gwqAgLSNkZWZpbmUgRjJGU19BVFRSX09GRlNFVChfc3RydWN0
X3R5cGUsIF9uYW1lLCBfbW9kZSwgX3Nob3csIF9zdG9yZSwKPj4gX29mZnNldCkgXAo+PiArI2Rl
ZmluZSBGMkZTX0FUVFJfT0ZGU0VUKF9zdHJ1Y3RfdHlwZSwgX25hbWUsIF9tb2RlLCBfc2hvdywg
X3N0b3JlLAo+PiBfb2Zmc2V0LCBfc2l6ZSkgXAo+PiDCoCBzdGF0aWMgc3RydWN0IGYyZnNfYXR0
ciBmMmZzX2F0dHJfIyNfbmFtZSA9IHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gwqDCoMKg
wqDCoCAuYXR0ciA9IHsubmFtZSA9IF9fc3RyaW5naWZ5KF9uYW1lKSwgLm1vZGUgPSBfbW9kZSB9
LMKgwqDCoCBcCj4+IMKgwqDCoMKgwqAgLnNob3fCoMKgwqAgPSBfc2hvdyzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKgwqAgLnN0b3JlwqDCoMKgID0g
X3N0b3JlLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gwqDCoMKg
wqDCoCAuc3RydWN0X3R5cGUgPSBfc3RydWN0X3R5cGUswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPj4gLcKgwqDCoCAub2Zmc2V0ID0gX29mZnNldMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoCAub2Zmc2V0ID0gX29mZnNldCzCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgLnNpemUgPSBfc2l6
ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDCoCB9
Cj4+IMKgIMKgICNkZWZpbmUgRjJGU19ST19BVFRSKHN0cnVjdF90eXBlLCBzdHJ1Y3RfbmFtZSwg
bmFtZSwgZWxuYW1lKcKgwqDCoCBcCj4+IMKgwqDCoMKgwqAgRjJGU19BVFRSX09GRlNFVChzdHJ1
Y3RfdHlwZSwgbmFtZSwgMDQ0NCzCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBmMmZzX3NiaV9zaG93LCBOVUxMLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+
IC3CoMKgwqDCoMKgwqDCoCBvZmZzZXRvZihzdHJ1Y3Qgc3RydWN0X25hbWUsIGVsbmFtZSkpCj4+
ICvCoMKgwqDCoMKgwqDCoCBvZmZzZXRvZihzdHJ1Y3Qgc3RydWN0X25hbWUsIGVsbmFtZSkswqDC
oMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKgwqAgc2l6ZW9mX2ZpZWxkKHN0cnVjdCBzdHJ1
Y3RfbmFtZSwgZWxuYW1lKSkKPj4gwqAgwqAgI2RlZmluZSBGMkZTX1JXX0FUVFIoc3RydWN0X3R5
cGUsIHN0cnVjdF9uYW1lLCBuYW1lLCBlbG5hbWUpwqDCoMKgIFwKPj4gwqDCoMKgwqDCoCBGMkZT
X0FUVFJfT0ZGU0VUKHN0cnVjdF90eXBlLCBuYW1lLCAwNjQ0LMKgwqDCoMKgwqDCoMKgIFwKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfc2JpX3Nob3csIGYyZnNfc2JpX3N0b3JlLMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXAo+PiAtwqDCoMKgwqDCoMKgwqAgb2Zmc2V0b2Yoc3RydWN0IHN0cnVj
dF9uYW1lLCBlbG5hbWUpKQo+PiArwqDCoMKgwqDCoMKgwqAgb2Zmc2V0b2Yoc3RydWN0IHN0cnVj
dF9uYW1lLCBlbG5hbWUpLMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgIHNpemVv
Zl9maWVsZChzdHJ1Y3Qgc3RydWN0X25hbWUsIGVsbmFtZSkpCj4+IMKgIMKgICNkZWZpbmUgRjJG
U19HRU5FUkFMX1JPX0FUVFIobmFtZSkgXAo+PiDCoCBzdGF0aWMgc3RydWN0IGYyZnNfYXR0ciBm
MmZzX2F0dHJfIyNuYW1lID0gX19BVFRSKG5hbWUsIDA0NDQsCj4+IG5hbWUjI19zaG93LCBOVUxM
KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C9FCF814E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 12:36:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTMJndTc3YN0L3IIh0A0zf7TaWVYATBKO7nIuWmdByg=; b=OF+dQO4+ECmnSmjnJJ1oBucNJO
	ZmPOGf7NPEcV4Fka6dpMCu3jto9UIJouUc+r0YZV/KREmGX88BopCzUCgvJdASpm9gtP1p67KYQSX
	T/7g779I3AkO43XnjVjEsN2/jbtn4a/dcMJkbSYv5iWuNN79ObAlxvTeF/eYZyrZSSLM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd5ME-0008FX-Q5;
	Tue, 06 Jan 2026 11:36:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vd5MC-0008FQ-U9
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 11:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SWtV4Z89DKYlH4CefnnRRZTNr5WEjf+4a2uWlTgKY6s=; b=Ko8/yTSIitNAQJ2c4dTxTK8oNK
 gdMm4PlhMAV/p/XB3OvRUeLwJYgD+xR7esHBZHun7HdwP4GyvpCKhENZwXKniELafZP8XlqoeuaKH
 YOh1w1o6DFyaL/tQMj+spaL50ge9iYsE7yDdbTJzB54CMDQaZ6lCoQ/Lb2XZoKciod0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SWtV4Z89DKYlH4CefnnRRZTNr5WEjf+4a2uWlTgKY6s=; b=mvdy3M1bCi4ANImAR0CHft/drD
 4riHXWv/hOQ5k61vsXH8SKFgT1GAsJkUYGo0FASonE0yGMqQCP2ADwx1V1JUYBjoROyc3uZcPfavh
 uLNGj5GOeqmYpHLIqbyNYg6ASNjYLfDqwZQwSuL+AEBy+yWoXnWBHl4pi5nZ0WgGHWeM=;
Received: from smtp153-170.sina.com.cn ([61.135.153.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd5MB-00035N-HU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 11:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1767699371; bh=SWtV4Z89DKYlH4CefnnRRZTNr5WEjf+4a2uWlTgKY6s=;
 h=Message-ID:Date:Subject:From;
 b=O7syeYh4Kx+vz1EGNS8Q/jkRow6CcLDmBVVGMO8DvpIH+hwG2kIv/eZyFmd+Ec45q
 g1xFMjsG9xXKnHouCgsvdL87K5JVVhi8pFht3cMWi71+0D3Y8eTo9ROrSwNdkPMRSu
 ggEeMP9LqrCr7vLe4hcKMl3RAMD+ziFGDBt/cH4U=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 695CF37500006C66; Tue, 6 Jan 2026 19:35:19 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9863676291797
X-SMAIL-UIID: 8F75E81411C749409CB72682F95E9196-20260106-193519-1
Message-ID: <58a1916a-c850-4120-8e41-a86f4f401c92@sina.com>
Date: Tue, 6 Jan 2026 19:35:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang <monty.pavel.devel@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251231135433.1069590-2-monty.pavel.devel@gmail.com>
 <5a541cbd-f09c-4416-bf42-6ae29b188947@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <5a541cbd-f09c-4416-bf42-6ae29b188947@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/6/26 16:53, Chao Yu via Linux-f2fs-devel wrote: > On
 12/31/2025 9:54 PM, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> Some
 f2fs sysfs attributes suffer from out-of-bounds memory access and [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vd5MB-00035N-HU
Subject: Re: [f2fs-dev] [PATCH RESEND 1/2] f2fs: fix out-of-bounds access in
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMS82LzI2IDE2OjUzLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+IE9u
IDEyLzMxLzIwMjUgOTo1NCBQTSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4gRnJvbTogWW9uZ3Bl
bmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Cj4+IFNvbWUgZjJmcyBzeXNmcyBh
dHRyaWJ1dGVzIHN1ZmZlciBmcm9tIG91dC1vZi1ib3VuZHMgbWVtb3J5IGFjY2VzcyBhbmQKPj4g
aW5jb3JyZWN0IGhhbmRsaW5nIG9mIGludGVnZXIgdmFsdWVzIHdob3NlIHNpemUgaXMgbm90IDQg
Ynl0ZXMuCj4+Cj4+IEZvciBleGFtcGxlOgo+PiB2bTp+IyBlY2hvIDY1NTM3ID4gL3N5cy9mcy9m
MmZzL3ZkZS9nY19waW5fZmlsZV90aHJlc2gKPj4gdm06fiMgY2F0IC9zeXMvZnMvZjJmcy92ZGUv
Z2NfcGluX2ZpbGVfdGhyZXNoCj4gCj4gSXQgc2VlbXMgdGhlIHJvb3QgY2F1c2UgaGVyZSBpcyB3
ZSBjaGVjayB3LyB3cm9uZyBzeXNmcyBmaWxlbmFtZS4KClllcywgbXkgbWlzdGFrZS4gSSdsbCBt
b2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlIGluIHYyIHBhdGNoLgoKPiAKPiBJIGZpeGVkIHRoaXMg
aW4gYSBzZXBhcmF0ZWQgcGF0Y2ggYmVsb3c6Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtZjJmcy1kZXZlbC8yMDI2MDEwNjA2MzExNy4yOTk3NS0xLQo+IGNoYW9Aa2VybmVsLm9y
ZwoKVGhpcyBwYXRjaCBsb29rcyBnb29kIHRvIG1lLgoKPiAKPj4gNjU1MzcKPj4gdm06fiMgZWNo
byA0Mjk0OTY3Mjk3ID4gL3N5cy9mcy9mMmZzL3ZkZS9hdGdjX2FnZV90aHJlc2hvbGQKPj4gdm06
fiMgY2F0IC9zeXMvZnMvZjJmcy92ZGUvYXRnY19hZ2VfdGhyZXNob2xkCj4+IDEKPj4KPj4gZ2Nf
cGluX2ZpbGVfdGhyZXNoIG1hcHMgdG8ge3N0cnVjdCBmMmZzX3NiX2luZm99LT5nY19waW5fZmls
ZV90aHJlc2hvbGQsCj4+IHdoaWNoIGlzIGEgMTYtYml0IGludGVnZXIuIEhvd2V2ZXIsIHRoZSBz
eXNmcyBpbnRlcmZhY2UgYWxsb3dzIHNldHRpbmcKPj4gaXQgdG8gYSB2YWx1ZSBsYXJnZXIgdGhh
biBTSFJUX01BWCwgcmVzdWx0aW5nIGluIGFuIG91dC1vZi1yYW5nZSB1cGRhdGUuCj4+Cj4+IGF0
Z2NfYWdlX3RocmVzaG9sZCBtYXBzIHRvIHtzdHJ1Y3QgYXRnY19tYW5hZ2VtZW50fS0+YWdlX3Ro
cmVzaG9sZCwKPj4gd2hpY2ggaXMgYSA2NC1iaXQgaW50ZWdlciwgYnV0IGl0cyBzeXNmcyBpbnRl
cmZhY2UgY2Fubm90IGNvcnJlY3RseSBzZXQKPj4gdmFsdWVzIGxhcmdlciB0aGFuIFVJTlRfTUFY
Lgo+Pgo+PiBUaGUgcm9vdCBjYXVzZXMgYXJlOgo+PiAxLiBfX3NiaV9zdG9yZSgpIHRyZWF0cyBh
bGwgZGVmYXVsdCB2YWx1ZXMgYXMgdW5zaWduZWQgaW50LCB3aGljaAo+PiBwcmV2ZW50cyB1cGRh
dGluZyBpbnRlZ2VycyBsYXJnZXIgdGhhbiA0IGJ5dGVzIGFuZCBjYXVzZXMgb3V0LW9mLWJvdW5k
cwo+PiB3cml0ZXMgZm9yIGludGVnZXJzIHNtYWxsZXIgdGhhbiA0IGJ5dGVzLgo+Pgo+PiAyLiBm
MmZzX3NiaV9zaG93KCkgYWxzbyBhc3N1bWVzIGFsbCBkZWZhdWx0IHZhbHVlcyBhcmUgdW5zaWdu
ZWQgaW50LAo+PiBsZWFkaW5nIHRvIG91dC1vZi1ib3VuZHMgcmVhZHMgYW5kIGluY29ycmVjdCBh
Y2Nlc3MgdG8gaW50ZWdlcnMgbGFyZ2VyCj4+IHRoYW4gNCBieXRlcy4KPj4KPj4gVGhpcyBwYXRj
aCBpbnRyb2R1Y2VzIHtzdHJ1Y3QgZjJmc19hdHRyfS0+c2l6ZSB0byByZWNvcmQgdGhlIGFjdHVh
bCBzaXplCj4+IG9mIHRoZSBpbnRlZ2VyIGFzc29jaWF0ZWQgd2l0aCBlYWNoIHN5c2ZzIGF0dHJp
YnV0ZS4gV2l0aCB0aGlzCj4+IGluZm9ybWF0aW9uLCBzeXNmcyByZWFkIGFuZCB3cml0ZSBvcGVy
YXRpb25zIGNhbiBjb3JyZWN0bHkgYWNjZXNzIGFuZAo+PiB1cGRhdGUgdmFsdWVzIGFjY29yZGlu
ZyB0byB0aGVpciByZWFsIGRhdGEgc2l6ZSwgYXZvaWRpbmcgbWVtb3J5Cj4+IGNvcnJ1cHRpb24g
YW5kIHRydW5jYXRpb24uCj4+Cj4gCj4gTmVlZCB0byBhZGQgQ2MgYW5kIEZpeGVzIHRhZz8KCk9L
LCBJIHdpbGwgYWRkIEZpeGVzIHRhZyBpbiB2MiBwYXRjaC4KClRoYW5rcwpZb25ncGVuZywKCj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IEppbmJhbyBMaXUgPGxpdWppbmJhbzFAeGlhb21pLmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+
IC0tLQo+PiDCoCBmcy9mMmZzL3N5c2ZzLmMgfCA2MCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1MiBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5j
IGIvZnMvZjJmcy9zeXNmcy5jCj4+IGluZGV4IGM0MmY0Zjk3OWQxMy4uZTZhOThkZGQ3M2IzIDEw
MDY0NAo+PiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPj4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4+
IEBAIC01OCw2ICs1OCw3IEBAIHN0cnVjdCBmMmZzX2F0dHIgewo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90IGxlbik7Cj4+IMKgwqDCoMKgwqAg
aW50IHN0cnVjdF90eXBlOwo+PiDCoMKgwqDCoMKgIGludCBvZmZzZXQ7Cj4+ICvCoMKgwqAgaW50
IHNpemU7Cj4+IMKgwqDCoMKgwqAgaW50IGlkOwo+PiDCoCB9Owo+PiDCoCBAQCAtMzQ0LDExICsz
NDUsMzAgQEAgc3RhdGljIHNzaXplX3QgbWFpbl9ibGthZGRyX3Nob3coc3RydWN0Cj4+IGYyZnNf
YXR0ciAqYSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHVuc2lnbmVkIGxvbmcgbG9u
ZylNQUlOX0JMS0FERFIoc2JpKSk7Cj4+IMKgIH0KPj4gwqAgK3N0YXRpYyBzc2l6ZV90IF9fc2Jp
X3Nob3dfdmFsdWUoc3RydWN0IGYyZnNfYXR0ciAqYSwKPj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwgY2hhciAqYnVmLAo+PiArwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgY2hhciAqdmFsdWUpCj4+ICt7Cj4+ICvCoMKgwqAgc3dpdGNoIChhLT5zaXplKSB7Cj4+ICvC
oMKgwqAgY2FzZSAxOgo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAi
JXVcbiIsICoodTggKil2YWx1ZSk7Cj4+ICvCoMKgwqAgY2FzZSAyOgo+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXVcbiIsICoodTE2ICopdmFsdWUpOwo+PiArwqDC
oMKgIGNhc2UgNDoKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiV1
XG4iLCAqKHUzMiAqKXZhbHVlKTsKPj4gK8KgwqDCoCBjYXNlIDg6Cj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gc3lzZnNfZW1pdChidWYsICIlbGx1XG4iLCAqKHU2NCAqKXZhbHVlKTsKPj4gK8Kg
wqDCoCBkZWZhdWx0Ogo+PiArwqDCoMKgwqDCoMKgwqAgZjJmc19idWdfb24oc2JpLCAxKTsKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAic2hvdyBzeXNmcyBub2RlIHZhbHVlIHdpdGggd3JvbmcgdHlwZVxu
Iik7Cj4+ICvCoMKgwqAgfQo+PiArfQo+PiArCj4+IMKgIHN0YXRpYyBzc2l6ZV90IGYyZnNfc2Jp
X3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYpCj4+IMKgIHsKPj4gwqDCoMKgwqDC
oCB1bnNpZ25lZCBjaGFyICpwdHIgPSBOVUxMOwo+PiAtwqDCoMKgIHVuc2lnbmVkIGludCAqdWk7
Cj4+IMKgIMKgwqDCoMKgwqAgcHRyID0gX19zdHJ1Y3RfcHRyKHNiaSwgYS0+c3RydWN0X3R5cGUp
Owo+PiDCoMKgwqDCoMKgIGlmICghcHRyKQo+PiBAQCAtNDI4LDkgKzQ0OCwzMCBAQCBzdGF0aWMg
c3NpemVfdCBmMmZzX3NiaV9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRvbWljX3JlYWQoJnNiaS0+Y3BfY2FsbF9jb3VudFtC
QUNLR1JPVU5EXSkpOwo+PiDCoCAjZW5kaWYKPj4gwqAgLcKgwqDCoCB1aSA9ICh1bnNpZ25lZCBp
bnQgKikocHRyICsgYS0+b2Zmc2V0KTsKPj4gK8KgwqDCoCByZXR1cm4gX19zYmlfc2hvd192YWx1
ZShhLCBzYmksIGJ1ZiwgcHRyICsgYS0+b2Zmc2V0KTsKPj4gK30KPj4gwqAgLcKgwqDCoCByZXR1
cm4gc3lzZnNfZW1pdChidWYsICIldVxuIiwgKnVpKTsKPj4gK3N0YXRpYyB2b2lkIF9fc2JpX3N0
b3JlX3ZhbHVlKHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5z
aWduZWQgY2hhciAqdWksIHVuc2lnbmVkIGxvbmcgdmFsdWUpCj4+ICt7Cj4+ICvCoMKgwqAgc3dp
dGNoIChhLT5zaXplKSB7Cj4+ICvCoMKgwqAgY2FzZSAxOgo+PiArwqDCoMKgwqDCoMKgwqAgKih1
OCAqKXVpID0gdmFsdWU7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoCBjYXNl
IDI6Cj4+ICvCoMKgwqDCoMKgwqDCoCAqKHUxNiAqKXVpID0gdmFsdWU7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBicmVhazsKPj4gK8KgwqDCoCBjYXNlIDQ6Cj4+ICvCoMKgwqDCoMKgwqDCoCAqKHUzMiAq
KXVpID0gdmFsdWU7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoCBjYXNlIDg6
Cj4+ICvCoMKgwqDCoMKgwqDCoCAqKHU2NCAqKXVpID0gdmFsdWU7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBicmVhazsKPj4gK8KgwqDCoCBkZWZhdWx0Ogo+PiArwqDCoMKgwqDCoMKgwqAgZjJmc19idWdf
b24oc2JpLCAxKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGYyZnNfZXJyKHNiaSwgInN0b3JlIHN5c2Zz
IG5vZGUgdmFsdWUgd2l0aCB3cm9uZyB0eXBlIik7Cj4+ICvCoMKgwqAgfQo+PiDCoCB9Cj4+IMKg
IMKgIHN0YXRpYyBzc2l6ZV90IF9fc2JpX3N0b3JlKHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+IEBA
IC05MDYsNyArOTQ3LDcgQEAgc3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNf
YXR0ciAqYSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBjb3VudDsKPj4gwqDCoMKgwqDC
oCB9Cj4+IMKgIC3CoMKgwqAgKnVpID0gKHVuc2lnbmVkIGludCl0Owo+PiArwqDCoMKgIF9fc2Jp
X3N0b3JlX3ZhbHVlKGEsIHNiaSwgcHRyICsgYS0+b2Zmc2V0LCB0KTsKPj4gwqAgwqDCoMKgwqDC
oCByZXR1cm4gY291bnQ7Cj4+IMKgIH0KPj4gQEAgLTEwNTMsMjQgKzEwOTQsMjcgQEAgc3RhdGlj
IHN0cnVjdCBmMmZzX2F0dHIgZjJmc19hdHRyX3NiXyMjX25hbWUgPQo+PiB7wqDCoMKgwqDCoMKg
wqAgXAo+PiDCoMKgwqDCoMKgIC5pZMKgwqDCoCA9IEYyRlNfRkVBVFVSRV8jI19mZWF0LMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgIH0KPj4gwqAgLSNkZWZpbmUgRjJGU19B
VFRSX09GRlNFVChfc3RydWN0X3R5cGUsIF9uYW1lLCBfbW9kZSwgX3Nob3csIF9zdG9yZSwKPj4g
X29mZnNldCkgXAo+PiArI2RlZmluZSBGMkZTX0FUVFJfT0ZGU0VUKF9zdHJ1Y3RfdHlwZSwgX25h
bWUsIF9tb2RlLCBfc2hvdywgX3N0b3JlLAo+PiBfb2Zmc2V0LCBfc2l6ZSkgXAo+PiDCoCBzdGF0
aWMgc3RydWN0IGYyZnNfYXR0ciBmMmZzX2F0dHJfIyNfbmFtZSA9IHvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPj4gwqDCoMKgwqDCoCAuYXR0ciA9IHsubmFtZSA9IF9fc3RyaW5naWZ5KF9uYW1l
KSwgLm1vZGUgPSBfbW9kZSB9LMKgwqDCoCBcCj4+IMKgwqDCoMKgwqAgLnNob3fCoMKgwqAgPSBf
c2hvdyzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKg
wqAgLnN0b3JlwqDCoMKgID0gX3N0b3JlLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPj4gwqDCoMKgwqDCoCAuc3RydWN0X3R5cGUgPSBfc3RydWN0X3R5cGUswqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gLcKgwqDCoCAub2Zmc2V0ID0gX29mZnNldMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoCAub2Zmc2V0
ID0gX29mZnNldCzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvC
oMKgwqAgLnNpemUgPSBfc2l6ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+PiDCoCB9Cj4+IMKgIMKgICNkZWZpbmUgRjJGU19ST19BVFRSKHN0cnVjdF90
eXBlLCBzdHJ1Y3RfbmFtZSwgbmFtZSwgZWxuYW1lKcKgwqDCoCBcCj4+IMKgwqDCoMKgwqAgRjJG
U19BVFRSX09GRlNFVChzdHJ1Y3RfdHlwZSwgbmFtZSwgMDQ0NCzCoMKgwqDCoMKgwqDCoCBcCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3NiaV9zaG93LCBOVUxMLMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcCj4+IC3CoMKgwqDCoMKgwqDCoCBvZmZzZXRvZihzdHJ1Y3Qgc3RydWN0
X25hbWUsIGVsbmFtZSkpCj4+ICvCoMKgwqDCoMKgwqDCoCBvZmZzZXRvZihzdHJ1Y3Qgc3RydWN0
X25hbWUsIGVsbmFtZSkswqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKgwqAgc2l6ZW9m
X2ZpZWxkKHN0cnVjdCBzdHJ1Y3RfbmFtZSwgZWxuYW1lKSkKPj4gwqAgwqAgI2RlZmluZSBGMkZT
X1JXX0FUVFIoc3RydWN0X3R5cGUsIHN0cnVjdF9uYW1lLCBuYW1lLCBlbG5hbWUpwqDCoMKgIFwK
Pj4gwqDCoMKgwqDCoCBGMkZTX0FUVFJfT0ZGU0VUKHN0cnVjdF90eXBlLCBuYW1lLCAwNjQ0LMKg
wqDCoMKgwqDCoMKgIFwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfc2JpX3Nob3csIGYyZnNf
c2JpX3N0b3JlLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiAtwqDCoMKgwqDCoMKgwqAgb2Zm
c2V0b2Yoc3RydWN0IHN0cnVjdF9uYW1lLCBlbG5hbWUpKQo+PiArwqDCoMKgwqDCoMKgwqAgb2Zm
c2V0b2Yoc3RydWN0IHN0cnVjdF9uYW1lLCBlbG5hbWUpLMKgwqDCoMKgwqDCoMKgIFwKPj4gK8Kg
wqDCoMKgwqDCoMKgIHNpemVvZl9maWVsZChzdHJ1Y3Qgc3RydWN0X25hbWUsIGVsbmFtZSkpCj4+
IMKgIMKgICNkZWZpbmUgRjJGU19HRU5FUkFMX1JPX0FUVFIobmFtZSkgXAo+PiDCoCBzdGF0aWMg
c3RydWN0IGYyZnNfYXR0ciBmMmZzX2F0dHJfIyNuYW1lID0gX19BVFRSKG5hbWUsIDA0NDQsCj4+
IG5hbWUjI19zaG93LCBOVUxMKQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

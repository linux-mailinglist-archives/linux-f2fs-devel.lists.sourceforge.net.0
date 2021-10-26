Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAAD43AA12
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Oct 2021 04:02:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfBms-00013M-Kk; Tue, 26 Oct 2021 02:02:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1mfBmm-00012H-KV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 02:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X7P/iaAI4VGNr3bUOsJZaRSMhlKTMXDWKd1oATlxNOk=; b=NEFNblc0QxQyVU8bR9zYGCXAa2
 5clDmSR0cq4t0sqbANo4BdjPMC4LFm9fBx/+GwjPbcyyc/pXZBBA8b2P+tH0okNVSxEUGUb4RcfK3
 pLf7HefaBCz72jKvvfQ5n48yoTxTDGzRjBSjJC8zhl+UXKbI46okCgxDaM2bACYou5Ww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X7P/iaAI4VGNr3bUOsJZaRSMhlKTMXDWKd1oATlxNOk=; b=POg/eK9hQkIbDNCwGdQGHmIMku
 syW6cwdjtLHvwYgZr598gwt2Cca7PMeFH2V/Nl/bJiHSbANpmdc4Kt8TUaacSYQYufLmY+dy8/x5g
 nVJ+PV5tGL2KrL5jgo9ihgmw18yhb+s1M59KCunM0g5yBG6HCmRHMb/IQ8lPGorxDOas=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfBmS-0000a2-5V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 02:01:56 +0000
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HdZlW300gz8tt1;
 Tue, 26 Oct 2021 10:00:07 +0800 (CST)
Received: from [10.174.177.8] (10.174.177.8) by dggeml756-chm.china.huawei.com
 (10.1.199.158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Tue, 26
 Oct 2021 10:01:27 +0800
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20211025120931.1409835-1-wangxiaojun11@huawei.com>
 <1a8748f4-c15d-361a-f57a-bdacc037314f@kernel.org>
 <5a3e82d0-0f89-36a1-7f0b-b072b97278a5@huawei.com>
 <8ec2b28b-da85-47df-25c5-e57fe67fa33c@kernel.org>
From: Wang Xiaojun <wangxiaojun11@huawei.com>
Message-ID: <d03355ab-2ed1-9de6-4c5e-c83f802572bd@huawei.com>
Date: Tue, 26 Oct 2021 10:01:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8ec2b28b-da85-47df-25c5-e57fe67fa33c@kernel.org>
X-Originating-IP: [10.174.177.8]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggeml756-chm.china.huawei.com (10.1.199.158)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2021/10/26 9:47, Chao Yu 写道: > On 2021/10/26 9:38,
    Wang Xiaojun wrote: >> >> 在 2021/10/26 8:29, Chao Yu 写道: >>> On 2021/10/25
    20:09, Wang Xiaojun wrote: >>>> If sbi->cur_cp is 2 and the [...] 
 
 Content analysis details:   (-4.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [45.249.212.189 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [45.249.212.189 listed in wl.mailspike.net]
  0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mfBmS-0000a2-5V
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix the wrong sbi->cur_cp setting
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CuWcqCAyMDIxLzEwLzI2IDk6NDcsIENoYW8gWXUg5YaZ6YGTOgo+IE9uIDIwMjEvMTAvMjYgOToz
OCwgV2FuZyBYaWFvanVuIHdyb3RlOgo+Pgo+PiDlnKggMjAyMS8xMC8yNiA4OjI5LCBDaGFvIFl1
IOWGmemBkzoKPj4+IE9uIDIwMjEvMTAvMjUgMjA6MDksIFdhbmcgWGlhb2p1biB3cm90ZToKPj4+
PiBJZiBzYmktPmN1cl9jcCBpcyAyIGFuZCB0aGUgZHVwbGljYXRlX2NoZWNrcG9pbnQgZnVuY3Rp
b24gcmV0dXJucwo+Pj4+IGluIGFkdmFuY2UgYmVjYXVzZSBzYmktPmNwX2JhY2t1cGVkIGlzIHNl
dCB0byB0cnVlLCB3ZSBjYW5ub3Qgc2V0Cj4+Pj4gc2JpLT5jdXJfY3AgdG8gMS4KPj4+Cj4+PiBI
bW1tLCBpbiBwcmV2aW91cyBpbXBsZW1lbnRhdGlvbiwgd2hhdCBwcm9ibGVtIHdlIHdpbGwgZW5j
b3VudGVyLCBhbmQKPj4+IHdoYXQncyB0aGUgcm9vdCBjYXVzZT8KPj4+Cj4+PiBUaGFua3MsCj4+
Cj4+IEluIGZhY3QsIGl0J3Mgbm90IGNhdXNpbmcgcHJvYmxlbXMgYXQgdGhpcyB0aW1lLgo+Pgo+
PiBEdXJpbmcgdGhlIGNvZGUgcmV2aWV3LCBJIGZvdW5kIHRoYXQgdGhpcyB3YXMgbm90IGxvZ2lj
YWxseSByZWFzb25hYmxlLgo+Pgo+PiBUaGlzIHBhcmFtZXRlcihzYmktPmN1cl9jcCkgY2FuIGJl
IHNldCB0byAxIG9ubHkgYWZ0ZXIgc3VjY2Vzc2Z1bCAKPj4gcmVwbGljYXRpb24uCj4KPiBJSVJD
LCBhZnRlciBtaXJyb3JpbmcgY2hlY2twb2ludCAoY3BfYmFja3VwZWQgPT0gMSksIHdlIGNob29z
ZSB0byAKPiBhbHdheXMgdXBkYXRlCj4gQ1AgIzAgYXJlYSwgc28gb25jZSBTUE8gb2NjdXJzLCBh
dCBsZWFzdCB0aGVyZSBpcyBvbmUgdmFsaWQgY2hlY2twb2ludCAKPiBjYW4gYmUga2VwdAo+IGlu
IENQICMxIGFyZWEuIFsxXQo+Cj4gWzFdIDgxYmFkOWQxMWVhNSAoImZzY2suZjJmczogd3JpdGUg
Y2hlY2twb2ludCB3aXRoIE9QVSBtb2RlIikKPgo+IFRoYW5rcywKCkdvdCBpdC4gdGhhbmtzCgo+
Cj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFhpYW9q
dW4gPHdhbmd4aWFvanVuMTFAaHVhd2VpLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCBmc2NrL2ZzY2su
Y8KgIHwgMyAtLS0KPj4+PiDCoCBmc2NrL21vdW50LmMgfCA1ICsrLS0tCj4+Pj4gwqAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEvZnNjay9mc2NrLmMgYi9mc2NrL2ZzY2suYwo+Pj4+IGluZGV4IDExMGMxZWMuLmFh
NzdhMzQgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnNjay9mc2NrLmMKPj4+PiArKysgYi9mc2NrL2ZzY2su
Ywo+Pj4+IEBAIC0yMzgzLDkgKzIzODMsNiBAQCBzdGF0aWMgdm9pZCBmaXhfY2hlY2twb2ludHMo
c3RydWN0IAo+Pj4+IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+IMKgIHsKPj4+PiDCoMKgwqDCoMKg
IC8qIGNvcHkgdmFsaWQgY2hlY2twb2ludCB0byBpdHMgbWlycm9yIHBvc2l0aW9uICovCj4+Pj4g
wqDCoMKgwqDCoCBkdXBsaWNhdGVfY2hlY2twb2ludChzYmkpOwo+Pj4+IC0KPj4+PiAtwqDCoMKg
IC8qIHJlcGFpciBjaGVja3BvaW50IGF0IENQICMwIHBvc2l0aW9uICovCj4+Pj4gLcKgwqDCoCBz
YmktPmN1cl9jcCA9IDE7Cj4+Pj4gwqDCoMKgwqDCoCBmaXhfY2hlY2twb2ludChzYmkpOwo+Pj4+
IMKgIH0KPj4+PiDCoCBkaWZmIC0tZ2l0IGEvZnNjay9tb3VudC5jIGIvZnNjay9tb3VudC5jCj4+
Pj4gaW5kZXggYzkyOGExNS4uMjk1MTcwZSAxMDA2NDQKPj4+PiAtLS0gYS9mc2NrL21vdW50LmMK
Pj4+PiArKysgYi9mc2NrL21vdW50LmMKPj4+PiBAQCAtMjk5OCw2ICsyOTk4LDggQEAgdm9pZCBk
dXBsaWNhdGVfY2hlY2twb2ludChzdHJ1Y3QgZjJmc19zYl9pbmZvIAo+Pj4+ICpzYmkpCj4+Pj4g
wqDCoMKgwqDCoCBBU1NFUlQocmV0ID49IDApOwo+Pj4+IMKgIMKgwqDCoMKgwqAgc2JpLT5jcF9i
YWNrdXBlZCA9IDE7Cj4+Pj4gK8KgwqDCoCAvKiByZXBhaXIgY2hlY2twb2ludCBhdCBDUCAjMCBw
b3NpdGlvbiAqLwo+Pj4+ICvCoMKgwqAgc2JpLT5jdXJfY3AgPSAxOwo+Pj4+IMKgIMKgwqDCoMKg
wqAgTVNHKDAsICJJbmZvOiBEdXBsaWNhdGUgdmFsaWQgY2hlY2twb2ludCB0byBtaXJyb3IgcG9z
aXRpb24gIgo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAiJWxsdSAtPiAlbGx1XG4iLCBzcmMsIGRz
dCk7Cj4+Pj4gQEAgLTMwOTgsOSArMzEwMCw2IEBAIHZvaWQgd3JpdGVfY2hlY2twb2ludHMoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+IMKgIHsKPj4+PiDCoMKgwqDCoMKgIC8qIGNvcHkg
dmFsaWQgY2hlY2twb2ludCB0byBpdHMgbWlycm9yIHBvc2l0aW9uICovCj4+Pj4gwqDCoMKgwqDC
oCBkdXBsaWNhdGVfY2hlY2twb2ludChzYmkpOwo+Pj4+IC0KPj4+PiAtwqDCoMKgIC8qIHJlcGFp
ciBjaGVja3BvaW50IGF0IENQICMwIHBvc2l0aW9uICovCj4+Pj4gLcKgwqDCoCBzYmktPmN1cl9j
cCA9IDE7Cj4+Pj4gwqDCoMKgwqDCoCB3cml0ZV9jaGVja3BvaW50KHNiaSk7Cj4+Pj4gwqAgfQo+
Pj4+Cj4+PiAuCj4gLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

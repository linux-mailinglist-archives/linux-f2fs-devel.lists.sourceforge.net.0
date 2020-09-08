Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F120260817
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Sep 2020 03:42:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFSeg-0002He-B9; Tue, 08 Sep 2020 01:42:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kFSee-0002HR-W0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 01:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nORnDv+k3qwDXqZyMz2HH3ylH6YDMjniNEtiqTbTV4U=; b=gvHfB4FZ0+k4JNPX/jAnK5Q4UU
 s/qeih3ga/rHynP4VwY+x1z1nOXL8wmdqYvg3FArQk++WHLm58PZBMb9wNM221v/leZrOWNKIlLfO
 krri1ErVRGbVeFRJB49Us0lMuEia4NAUMC2/KkP93ASaW6rgcEkJsOqxvXlKjH+CY/0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nORnDv+k3qwDXqZyMz2HH3ylH6YDMjniNEtiqTbTV4U=; b=f4rzhGM2GS1CwPQMEDczExf5vm
 stDtIKnM1GCBzNWnPxvD21wIpFIEMsI6K+lntUZNirBBDWvcgIpBJ9o7bujkKgGP2xiPgR9x00Etk
 7CW1szc04GV49zFtbik/YHNOKOGOEYDCJ+aJf2Mlm8Ibj17BOhmEFisUkY3IqzH3flaE=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kFSeO-00G8cX-Pi
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 01:42:40 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F25FBFAD01793652936C;
 Tue,  8 Sep 2020 09:42:09 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 8 Sep 2020
 09:42:05 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200903024442.296703-1-daeho43@gmail.com>
 <4c5dcf19-4495-5181-1695-fddf05c3bf24@huawei.com>
 <CACOAw_xAjUEyVo0Jm4yPvg7KB4G=Mz=tSEQ_wz6OH-P+e_cP8Q@mail.gmail.com>
 <CACOAw_yXkCkZrDELqereZcyJpXHAmWOwS2Q2HiNGs3_63sYfQA@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c695e23d-2d54-6912-f139-8c2cde1366b2@huawei.com>
Date: Tue, 8 Sep 2020 09:42:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_yXkCkZrDELqereZcyJpXHAmWOwS2Q2HiNGs3_63sYfQA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.8 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kFSeO-00G8cX-Pi
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: change fibmap to fiemap
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC85LzggODo1MiwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gSSd2ZSB0aG91Z2h0IGFib3V0
IHRoaXMuCj4gV2UgbmVlZCB0byBzdXBwb3J0IHRoaXMgdG9vbCBmb3IgZGlmZmVyZW50IE9TLCBu
b3Qgb25seSBmb3IgTGludXguCj4gU28sIGlzIGl0IG9rIHRvIGluY2x1ZGUgbGludXgvZmllbWFw
LmggZm9yIHRoaXM/Cj4gQWN0dWFsbHksIHNpbmNlIEZJRU1BUCBhbmQgb3RoZXIgc3R1ZmYgd2Vy
ZSBkZWZpbmVkIGluIGYyZnNfaW8uYwo+IGRpcmVjdGx5IGJlZm9yZSwgSSB0aG91Z2h0IHRoYXQg
dGhlcmUgd2FzIHNvbWUgcmVhc29uIGZvciBkb2luZyB0aGF0Cj4gYW5kIEkgZm9sbG93ZWQgdGhl
IGNvbnZlbnRpb24uCj4gCj4gV2hhdCBkbyB5b3UgdGhpbms/CgpZZXMsIHRoYXQncyBnb29kIHBv
aW50LgoKSSBub3RpY2VkIHRoYXQgZjJmc19pby5oIGhhcyBzaW1pbGFyIGNvbmNlcm46CgojaWZk
ZWYgSEFWRV9MSU5VWF9UWVBFU19ICiNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgojZW5kaWYKCi4u
LgoKI2lmbmRlZiBIQVZFX0xJTlVYX1RZUEVTX0gKdHlwZWRlZiB1OAlfX3U4Owp0eXBlZGVmIHUx
NglfX3UxNjsKdHlwZWRlZiB1MzIJX191MzI7CnR5cGVkZWYgdTE2CV9fbGUxNjsKdHlwZWRlZiB1
MzIJX19sZTMyOwp0eXBlZGVmIHUxNglfX2JlMTY7CnR5cGVkZWYgdTMyCV9fYmUzMjsKI2VuZGlm
CgpTbyBob3cgYWJvdXQgaW1wbGVtZW50aW5nIGFzIGFib3ZlPwoKVGhhbmtzLAoKPiAKPiAyMDIw
64WEIDnsm5QgNOydvCAo6riIKSDsmKTtm4QgMTI6MzksIERhZWhvIEplb25nIDxkYWVobzQzQGdt
YWlsLmNvbT7ri5jsnbQg7J6R7ISxOgo+Pgo+PiBJdCdzIHdheSBiZXR0ZXJ+IDopCj4+Cj4+IDIw
MjDrhYQgOeyblCA07J28ICjquIgpIOyYpO2bhCAxMjoxMSwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3
ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4+Pgo+Pj4KPj4+Cj4+PiBPbiAyMDIwLzkvMyAxMDo0NCwg
RGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29v
Z2xlLmNvbT4KPj4+Pgo+Pj4+IEN1cnJlbnRseSB3ZSBzdXBwb3J0IGZpZW1hcCBjb21tYW5kIHVz
aW5nIGZpYm1hcC4gSXQncyBzaW1wbGUgYW5kCj4+Pj4gZWFzeSB0byB1c2UsIGJ1dCB3ZSBjYW5u
b3QgdXNlIHRoaXMgZm9yIGNvbXByZXNzZWQgZmlsZS4gVG8gc3VwcG9ydAo+Pj4+IG1vcmUgZGlm
ZmVyZW50IHR5cGVzIG9mIGZpbGVzLCB3ZSBuZWVkIHRvIGNoYW5nZSB0aGlzIHRvIHVzZSBmaWVt
YXAuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29n
bGUuY29tPgo+Pj4+IC0tLQo+Pj4+IENoYW5nZXMgaW4gdjI6Cj4+Pj4gICAgLSBNb3ZlIGRlY2xh
cmF0aW9uIHRvIGhlYWRlciBmaWxlCj4+Pj4gLS0tCj4+Pj4gICAgdG9vbHMvZjJmc19pby9mMmZz
X2lvLmMgfCAzNyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4gICAg
dG9vbHMvZjJmc19pby9mMmZzX2lvLmggfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+
Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0p
Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMgYi90b29scy9m
MmZzX2lvL2YyZnNfaW8uYwo+Pj4+IGluZGV4IGFiYjY1NWEuLjlhNjUxYzAgMTAwNjQ0Cj4+Pj4g
LS0tIGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPj4+PiArKysgYi90b29scy9mMmZzX2lvL2Yy
ZnNfaW8uYwo+Pj4+IEBAIC02MzEsMjcgKzYzMSwxNyBAQCBzdGF0aWMgdm9pZCBkb19yYW5kcmVh
ZChpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+Pj4+
ICAgICAgICBleGl0KDApOwo+Pj4+ICAgIH0KPj4+Pgo+Pj4+IC1zdHJ1Y3QgZmlsZV9leHQgewo+
Pj4+IC0gICAgIF9fdTMyIGZfcG9zOwo+Pj4+IC0gICAgIF9fdTMyIHN0YXJ0X2JsazsKPj4+PiAt
ICAgICBfX3UzMiBlbmRfYmxrOwo+Pj4+IC0gICAgIF9fdTMyIGJsa19jb3VudDsKPj4+PiAtfTsK
Pj4+PiAtCj4+Pj4gLSNpZm5kZWYgRklCTUFQCj4+Pj4gLSNkZWZpbmUgRklCTUFQICAgICAgICAg
IF9JTygweDAwLCAxKSAgICAvKiBibWFwIGFjY2VzcyAqLwo+Pj4+IC0jZW5kaWYKPj4+PiAtCj4+
Pj4gICAgI2RlZmluZSBmaWVtYXBfZGVzYyAiZ2V0IGJsb2NrIGFkZHJlc3MgaW4gZmlsZSIKPj4+
PiAgICAjZGVmaW5lIGZpZW1hcF9oZWxwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+Pj4+ICAgICJmMmZzX2lvIGZpZW1hcCBbb2Zmc2V0IGluIDRrYl0gW2NvdW50XSBbZmlsZV9w
YXRoXVxuXG4iXAo+Pj4+Cj4+Pj4gICAgc3RhdGljIHZvaWQgZG9fZmllbWFwKGludCBhcmdjLCBj
aGFyICoqYXJndiwgY29uc3Qgc3RydWN0IGNtZF9kZXNjICpjbWQpCj4+Pj4gICAgewo+Pj4+IC0g
ICAgIHU2NCBvZmZzZXQ7Cj4+Pj4gLSAgICAgdTMyIGJsa251bTsKPj4+PiAgICAgICAgdW5zaWdu
ZWQgY291bnQsIGk7Cj4+Pj4gICAgICAgIGludCBmZDsKPj4+PiArICAgICBfX3U2NCBwaHlfYWRk
cjsKPj4+PiArICAgICBzdHJ1Y3QgZmllbWFwICpmbSA9IHhtYWxsb2Moc2l6ZW9mKHN0cnVjdCBm
aWVtYXApICsKPj4+PiArICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBmaWVtYXBf
ZXh0ZW50KSk7Cj4+Pj4KPj4+PiAgICAgICAgaWYgKGFyZ2MgIT0gNCkgewo+Pj4+ICAgICAgICAg
ICAgICAgIGZwdXRzKCJFeGNlc3MgYXJndW1lbnRzXG5cbiIsIHN0ZGVycik7Cj4+Pj4gQEAgLTY1
OSwyMSArNjQ5LDI4IEBAIHN0YXRpYyB2b2lkIGRvX2ZpZW1hcChpbnQgYXJnYywgY2hhciAqKmFy
Z3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+Pj4+ICAgICAgICAgICAgICAgIGV4aXQo
MSk7Cj4+Pj4gICAgICAgIH0KPj4+Pgo+Pj4+IC0gICAgIG9mZnNldCA9IGF0b2koYXJndlsxXSk7
Cj4+Pj4gKyAgICAgZm0tPmZtX3N0YXJ0ID0gYXRvaShhcmd2WzFdKSAqIEYyRlNfQkxLU0laRTsK
Pj4+PiArICAgICBmbS0+Zm1fbGVuZ3RoID0gRjJGU19CTEtTSVpFOwo+Pj4+ICsgICAgIGZtLT5m
bV9leHRlbnRfY291bnQgPSAxOwo+Pj4+ICAgICAgICBjb3VudCA9IGF0b2koYXJndlsyXSk7Cj4+
Pj4KPj4+PiAgICAgICAgZmQgPSB4b3Blbihhcmd2WzNdLCBPX1JET05MWSB8IE9fTEFSR0VGSUxF
LCAwKTsKPj4+Pgo+Pj4+IC0gICAgIHByaW50ZigiRmllbWFwOiBvZmZzZXQgPSAlMDgiUFJJeDY0
IiBsZW4gPSAlZFxuIiwgb2Zmc2V0LCBjb3VudCk7Cj4+Pj4gKyAgICAgcHJpbnRmKCJGaWVtYXA6
IG9mZnNldCA9ICUwOCJQUkl4NjQiIGxlbiA9ICVkXG4iLAo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZm0tPmZtX3N0YXJ0IC8gRjJGU19CTEtTSVpFLCBjb3VudCk7
Cj4+Pj4gICAgICAgIGZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7Cj4+Pj4gLSAgICAgICAg
ICAgICBibGtudW0gPSBvZmZzZXQgKyBpOwo+Pj4+IC0KPj4+PiAtICAgICAgICAgICAgIGlmIChp
b2N0bChmZCwgRklCTUFQLCAmYmxrbnVtKSA8IDApCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAg
IGRpZV9lcnJubygiRklCTUFQIGZhaWxlZCIpOwo+Pj4+ICsgICAgICAgICAgICAgaWYgKGlvY3Rs
KGZkLCBGSUVNQVAsIGZtKSA8IDApCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGRpZV9lcnJu
bygiRklFTUFQIGZhaWxlZCIpOwo+Pj4+Cj4+Pj4gLSAgICAgICAgICAgICBwcmludGYoIiV1ICIs
IGJsa251bSk7Cj4+Pj4gKyAgICAgICAgICAgICBwaHlfYWRkciA9IGZtLT5mbV9leHRlbnRbMF0u
ZmVfcGh5c2ljYWwgLyBGMkZTX0JMS1NJWkU7Cj4+Pj4gKyAgICAgICAgICAgICBpZiAocGh5X2Fk
ZHIgPT0gTkVXX0FERFIpCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHByaW50ZigiTkVXX0FE
RFIgIik7Cj4+Pj4gKyAgICAgICAgICAgICBlbHNlCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
IHByaW50ZigiJWxsdSAiLCBwaHlfYWRkcik7Cj4+Pj4gKyAgICAgICAgICAgICBmbS0+Zm1fc3Rh
cnQgKz0gRjJGU19CTEtTSVpFOwo+Pj4+ICAgICAgICB9Cj4+Pj4gICAgICAgIHByaW50ZigiXG4i
KTsKPj4+PiArICAgICBmcmVlKGZtKTsKPj4+PiAgICAgICAgZXhpdCgwKTsKPj4+PiAgICB9Cj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmggYi90b29scy9mMmZz
X2lvL2YyZnNfaW8uaAo+Pj4+IGluZGV4IGJkMTlmZjkuLjYyZDZlN2IgMTAwNjQ0Cj4+Pj4gLS0t
IGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmgKPj4+PiArKysgYi90b29scy9mMmZzX2lvL2YyZnNf
aW8uaAo+Pj4+IEBAIC0zOCw2ICszOCw5IEBAIHR5cGVkZWYgdTE2IF9fYmUxNjsKPj4+PiAgICB0
eXBlZGVmIHUzMiBfX2JlMzI7Cj4+Pj4gICAgI2VuZGlmCj4+Pj4KPj4+PiArI2RlZmluZSBGMkZT
X0JMS1NJWkUgNDA5Ngo+Pj4+ICsjZGVmaW5lIE5FV19BRERSICAgICAweEZGRkZGRkZGCj4+Pj4g
Kwo+Pj4+ICAgICNpZm5kZWYgRlNfSU9DX0dFVEZMQUdTCj4+Pj4gICAgI2RlZmluZSBGU19JT0Nf
R0VURkxBR1MgICAgICAgICAgICAgICAgICAgICBfSU9SKCdmJywgMSwgbG9uZykKPj4+PiAgICAj
ZW5kaWYKPj4+PiBAQCAtMTMyLDYgKzEzNSwyOSBAQCB0eXBlZGVmIHUzMiAgICAgIF9fYmUzMjsK
Pj4+PiAgICAjZGVmaW5lIEZTX0NBU0VGT0xEX0ZMICAgICAgICAgICAgICAgICAgICAgIDB4NDAw
MDAwMDAgLyogRm9sZGVyIGlzIGNhc2UgaW5zZW5zaXRpdmUgKi8KPj4+PiAgICAjZW5kaWYKPj4+
Pgo+Pj4+ICtzdHJ1Y3QgZmllbWFwX2V4dGVudCB7Cj4+Pj4gKyAgICAgdTY0IGZlX2xvZ2ljYWw7
Cj4+Pj4gKyAgICAgdTY0IGZlX3BoeXNpY2FsOwo+Pj4+ICsgICAgIHU2NCBmZV9sZW5ndGg7Cj4+
Pj4gKyAgICAgdTY0IGZlX3Jlc2VydmVkNjRbMl07Cj4+Pj4gKyAgICAgdTMyIGZlX2ZsYWdzOwo+
Pj4+ICsgICAgIHUzMiBmZV9yZXNlcnZlZFszXTsKPj4+PiArfTsKPj4+PiArCj4+Pj4gK3N0cnVj
dCBmaWVtYXAgewo+Pj4+ICsgICAgIHU2NCBmbV9zdGFydDsKPj4+PiArICAgICB1NjQgZm1fbGVu
Z3RoOwo+Pj4+ICsgICAgIHUzMiBmbV9mbGFnczsKPj4+PiArICAgICB1MzIgZm1fbWFwcGVkX2V4
dGVudHM7Cj4+Pj4gKyAgICAgdTMyIGZtX2V4dGVudF9jb3VudDsKPj4+PiArICAgICB1MzIgZm1f
cmVzZXJ2ZWQ7Cj4+Pj4gKyAgICAgc3RydWN0IGZpZW1hcF9leHRlbnQgZm1fZXh0ZW50WzBdOwo+
Pj4+ICt9Owo+Pj4KPj4+IFdlIGRvbid0IG5lZWQgdG8gY29weSAmIHBhc3RlIGZpZW1hcCByZWxh
dGVkIHN0cnVjdHVyZSBoZXJlLgo+Pj4KPj4+IExldCdzIGp1c3QgaW5jbHVkZSA8bGludXgvZmll
bWFwLmg+IGluIGYyZnNfaW8uaAo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4gKwo+Pj4+ICsjaWZu
ZGVmIEZJRU1BUAo+Pj4+ICsjZGVmaW5lIEZJRU1BUCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBfSU9XUignZicsIDExLCBzdHJ1Y3QgZmllbWFwKQo+Pj4+ICsjZW5kaWYKPj4+PiArCj4+
Pj4gICAgc3RydWN0IGYyZnNfZ2NfcmFuZ2Ugewo+Pj4+ICAgICAgICB1MzIgc3luYzsKPj4+PiAg
ICAgICAgdTY0IHN0YXJ0Owo+Pj4+Cj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

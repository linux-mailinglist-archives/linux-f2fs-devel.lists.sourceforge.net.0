Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D4D327662
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Mar 2021 04:17:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGZ42-00058B-Sl; Mon, 01 Mar 2021 03:17:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lGZ40-000580-Kz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 03:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DnQB/4KgOT6Xj/Y7bAUOTzjJLVuyrMRtFTK+P8YVoZA=; b=MQaJWwQDaCgpR5z6UnxAwxOX9T
 gWbTghMX4GsbHCmc/np6UQK/Yn7cMiZWJPVZuym9xVVdxxLe/1lxCIbDuiZhVut4TB4DkNR3cyEkd
 eHP1+aQTLTSMqmYYYxOM3FCqarw22LJOukCSpmPDokSHI5r37IOqJb3WLZXLmCMBFFBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DnQB/4KgOT6Xj/Y7bAUOTzjJLVuyrMRtFTK+P8YVoZA=; b=RyHYvjcrZcFNiFprE95r8PQh4D
 gx+xGRTj8QOECAvrW7FilTaDjbOt+EZCrTerodZqs880DFku5QaRoZPRHdxsR96uPCeUSz6zglopx
 gS74sk/HmooZovdv/FVsGUVcCvtSi1gobmWHDyqN/JM+MDrjzVAHC3AEwNTbCA7h0ZUQ=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lGZ3k-009Lmg-6Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 03:17:40 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DplkJ3SWWzMgGy;
 Mon,  1 Mar 2021 11:15:04 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 1 Mar 2021
 11:17:07 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210224190313.GA144040@embeddedor>
 <bee16b72-f2e2-b113-9785-7f760be867df@huawei.com>
 <YDsjg1LqnkYIvvtB@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c8f5daa3-ec01-c6ba-7823-04c3650b689a@huawei.com>
Date: Mon, 1 Mar 2021 11:17:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YDsjg1LqnkYIvvtB@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lGZ3k-009Lmg-6Z
Subject: Re: [f2fs-dev] [PATCH][next] f2fs: Replace one-element array with
 flexible-array member
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8yLzI4IDEzOjAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPiBPbiAwMi8yNSwgQ2hhbyBZ
dSB3cm90ZToKPj4gSGVsbG8sIEd1c3Rhdm8sCj4+Cj4+IE9uIDIwMjEvMi8yNSAzOjAzLCBHdXN0
YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+Pj4gVGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhl
IGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRvIGRlY2xhcmUgaGF2aW5nCj4+PiBhIGR5bmFtaWNh
bGx5IHNpemVkIHNldCBvZiB0cmFpbGluZyBlbGVtZW50cyBpbiBhIHN0cnVjdHVyZS4gS2VybmVs
IGNvZGUKPj4+IHNob3VsZCBhbHdheXMgdXNlIOKAnGZsZXhpYmxlIGFycmF5IG1lbWJlcnPigJ1b
MV0gZm9yIHRoZXNlIGNhc2VzLiBUaGUgb2xkZXIKPj4+IHN0eWxlIG9mIG9uZS1lbGVtZW50IG9y
IHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJlIHVzZWRbMl0uCj4+Cj4+IEkg
cHJvcG9zYWwgdG8gZG8gdGhlIHNpbWlsYXIgY2xlYW51cCwgYW5kIEkndmUgbm8gb2JqZWN0aW9u
IG9uIGRvaW5nIHRoaXMuCj4+Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9w
YXRjaC84Njk0NDAvCj4+Cj4+IExldCdzIGFzayBmb3IgSmFlZ2V1aycgb3Bpbmlvbi4KPiAKPiBN
ZXJnZWQsIHRoYW5rcy4KPiBUaGlzIGxvb2tzIGJldHRlciByZWFzb24gdGhhbiBjb2RlIHJlYWRh
YmlsaXR5LiA6KQoKQWdyZWVkLgoKUmV2aWV3ZWQtYnk6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2Vp
LmNvbT4KClRoYW5rcywKCj4gCj4+Cj4+Pgo+Pj4gUmVmYWN0b3IgdGhlIGNvZGUgYWNjb3JkaW5n
IHRvIHRoZSB1c2Ugb2YgYSBmbGV4aWJsZS1hcnJheSBtZW1iZXIgaW4KPj4+IHN0cnVjdCBmMmZz
X2NoZWNrcG9pbnQsIGluc3RlYWQgb2YgYSBvbmUtZWxlbWVudCBhcnJheXMuCj4+Pgo+Pj4gTm90
aWNlIHRoYXQgYSB0ZW1wb3JhcnkgcG9pbnRlciB0byB2b2lkICcqdG1wX3B0cicgd2FzIHVzZWQg
aW4gb3JkZXIgdG8KPj4+IGZpeCB0aGUgZm9sbG93aW5nIGVycm9ycyB3aGVuIHVzaW5nIGEgZmxl
eGlibGUgYXJyYXkgaW5zdGVhZCBvZiBhIG9uZQo+Pj4gZWxlbWVudCBhcnJheSBpbiBzdHJ1Y3Qg
ZjJmc19jaGVja3BvaW50Ogo+Pj4KPj4+ICAgICBDQyBbTV0gIGZzL2YyZnMvZGlyLm8KPj4+IElu
IGZpbGUgaW5jbHVkZWQgZnJvbSBmcy9mMmZzL2Rpci5jOjEzOgo+Pj4gZnMvZjJmcy9mMmZzLmg6
IEluIGZ1bmN0aW9uIOKAmF9fYml0bWFwX3B0cuKAmToKPj4+IGZzL2YyZnMvZjJmcy5oOjIyMjc6
NDA6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiBmbGV4aWJsZSBhcnJheSBtZW1iZXIKPj4+ICAgIDIy
MjcgfCAgIHJldHVybiAmY2twdC0+c2l0X25hdF92ZXJzaW9uX2JpdG1hcCArIG9mZnNldCArIHNp
emVvZihfX2xlMzIpOwo+Pj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF4KPj4+IGZzL2YyZnMvZjJmcy5oOjIyMjc6NDk6IGVycm9yOiBpbnZhbGlkIHVz
ZSBvZiBmbGV4aWJsZSBhcnJheSBtZW1iZXIKPj4+ICAgIDIyMjcgfCAgIHJldHVybiAmY2twdC0+
c2l0X25hdF92ZXJzaW9uX2JpdG1hcCArIG9mZnNldCArIHNpemVvZihfX2xlMzIpOwo+Pj4gICAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
Pj4+IGZzL2YyZnMvZjJmcy5oOjIyMzg6NDA6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiBmbGV4aWJs
ZSBhcnJheSBtZW1iZXIKPj4+ICAgIDIyMzggfCAgIHJldHVybiAmY2twdC0+c2l0X25hdF92ZXJz
aW9uX2JpdG1hcCArIG9mZnNldDsKPj4+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeCj4+PiBtYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVp
bGQ6Mjg3OiBmcy9mMmZzL2Rpci5vXSBFcnJvciAxCj4+PiBtYWtlWzFdOiAqKiogW3NjcmlwdHMv
TWFrZWZpbGUuYnVpbGQ6NTMwOiBmcy9mMmZzXSBFcnJvciAyCj4+PiBtYWtlOiAqKiogW01ha2Vm
aWxlOjE4MTk6IGZzXSBFcnJvciAyCj4+Pgo+Pj4gWzFdIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9y
Zy93aWtpL0ZsZXhpYmxlX2FycmF5X21lbWJlcgo+Pj4gWzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvdjUuOS9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJvLWxlbmd0aC1hbmQt
b25lLWVsZW1lbnQtYXJyYXlzCj4+Pgo+Pj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0tTUFAv
bGludXgvaXNzdWVzLzc5Cj4+PiBCdWlsZC10ZXN0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxs
a3BAaW50ZWwuY29tPgo+Pj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC82MDM2
NDdlNC5EZUVGYmw0ZXFsanV3QVVlJTI1bGtwQGludGVsLmNvbS8KPj4+IFNpZ25lZC1vZmYtYnk6
IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4g
ICAgZnMvZjJmcy9mMmZzLmggICAgICAgICAgfCA1ICsrKy0tCj4+PiAgICBpbmNsdWRlL2xpbnV4
L2YyZnNfZnMuaCB8IDIgKy0KPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2Zz
L2YyZnMvZjJmcy5oCj4+PiBpbmRleCBlMmQzMDJhZTNhNDYuLjNmNWNiMDk3YzMwZiAxMDA2NDQK
Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4gQEAg
LTIyMTUsNiArMjIxNSw3IEBAIHN0YXRpYyBpbmxpbmUgYmxvY2tfdCBfX2NwX3BheWxvYWQoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4gICAgc3RhdGljIGlubGluZSB2b2lkICpfX2JpdG1h
cF9wdHIoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZmxhZykKPj4+ICAgIHsKPj4+ICAg
IAlzdHJ1Y3QgZjJmc19jaGVja3BvaW50ICpja3B0ID0gRjJGU19DS1BUKHNiaSk7Cj4+PiArCXZv
aWQgKnRtcF9wdHIgPSAmY2twdC0+c2l0X25hdF92ZXJzaW9uX2JpdG1hcDsKPj4+ICAgIAlpbnQg
b2Zmc2V0Owo+Pj4gICAgCWlmIChpc19zZXRfY2twdF9mbGFncyhzYmksIENQX0xBUkdFX05BVF9C
SVRNQVBfRkxBRykpIHsKPj4+IEBAIC0yMjI0LDcgKzIyMjUsNyBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgKl9fYml0bWFwX3B0cihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBmbGFnKQo+Pj4g
ICAgCQkgKiBpZiBsYXJnZV9uYXRfYml0bWFwIGZlYXR1cmUgaXMgZW5hYmxlZCwgbGVhdmUgY2hl
Y2tzdW0KPj4+ICAgIAkJICogcHJvdGVjdGlvbiBmb3IgYWxsIG5hdC9zaXQgYml0bWFwcy4KPj4+
ICAgIAkJICovCj4+PiAtCQlyZXR1cm4gJmNrcHQtPnNpdF9uYXRfdmVyc2lvbl9iaXRtYXAgKyBv
ZmZzZXQgKyBzaXplb2YoX19sZTMyKTsKPj4+ICsJCXJldHVybiB0bXBfcHRyICsgb2Zmc2V0ICsg
c2l6ZW9mKF9fbGUzMik7Cj4+PiAgICAJfQo+Pj4gICAgCWlmIChfX2NwX3BheWxvYWQoc2JpKSA+
IDApIHsKPj4+IEBAIC0yMjM1LDcgKzIyMzYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKl9fYml0
bWFwX3B0cihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBmbGFnKQo+Pj4gICAgCX0gZWxz
ZSB7Cj4+PiAgICAJCW9mZnNldCA9IChmbGFnID09IE5BVF9CSVRNQVApID8KPj4+ICAgIAkJCWxl
MzJfdG9fY3B1KGNrcHQtPnNpdF92ZXJfYml0bWFwX2J5dGVzaXplKSA6IDA7Cj4+PiAtCQlyZXR1
cm4gJmNrcHQtPnNpdF9uYXRfdmVyc2lvbl9iaXRtYXAgKyBvZmZzZXQ7Cj4+PiArCQlyZXR1cm4g
dG1wX3B0ciArIG9mZnNldDsKPj4+ICAgIAl9Cj4+PiAgICB9Cj4+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9mMmZzX2ZzLmggYi9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+Pj4gaW5kZXgg
YzZjYzBhNTY2ZWY1Li41NDg3YTgwNjE3YTMgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2YyZnNfZnMuaAo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKPj4+IEBAIC0xNjgs
NyArMTY4LDcgQEAgc3RydWN0IGYyZnNfY2hlY2twb2ludCB7Cj4+PiAgICAJdW5zaWduZWQgY2hh
ciBhbGxvY190eXBlW01BWF9BQ1RJVkVfTE9HU107Cj4+PiAgICAJLyogU0lUIGFuZCBOQVQgdmVy
c2lvbiBiaXRtYXAgKi8KPj4+IC0JdW5zaWduZWQgY2hhciBzaXRfbmF0X3ZlcnNpb25fYml0bWFw
WzFdOwo+Pj4gKwl1bnNpZ25lZCBjaGFyIHNpdF9uYXRfdmVyc2lvbl9iaXRtYXBbXTsKPj4+ICAg
IH0gX19wYWNrZWQ7Cj4+PiAgICAjZGVmaW5lIENQX0NIS1NVTV9PRkZTRVQJNDA5MgkvKiBkZWZh
dWx0IGNoa3N1bSBvZmZzZXQgaW4gY2hlY2twb2ludCAqLwo+Pj4KPiAuCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

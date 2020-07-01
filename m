Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9E2104C6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 09:15:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqWy3-0005PG-Cq; Wed, 01 Jul 2020 07:15:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jqWy1-0005Op-Lk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 07:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OtDncL7Pnc2bb95NrShvvPUz8EsGjmECZsV5x1roPas=; b=m/LbNq7EDYgJSMEX/ALVmPgPP+
 QiIiB5/pNKxr5aOtixC5gxEPmaq7YHN4Zm3F4uUAv506INPzNO8YWcesijXOlFR473wnmBQcr5C15
 bn1cQ8ZY4lbBqLLVpsVIqxSuhbxHtEnXssCyg5dy7Wo/hBqvfsZS5tkT9m+w9RKzQhsI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OtDncL7Pnc2bb95NrShvvPUz8EsGjmECZsV5x1roPas=; b=jhApCmvUs3u/zIj+QISH13WtDD
 YxhUl3KkBmZGLZglhoXV5raInL9kLq5MWZQJOdIH7kSK23XMPsJz13E5EfqtPVIj6wGMZXIm+2qfJ
 smMR7rEpolRUC63UINMrJ83N17zXaRKotIcDxVdiiZoJTk0WQG2ic2+jP5Nhz77yayKM=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqWxy-008MoB-Dx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 07:15:36 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1F30BD60DE3960F6D055;
 Wed,  1 Jul 2020 15:15:26 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Jul 2020
 15:15:20 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200630005625.2405062-1-daeho43@gmail.com>
 <961072bb-4c8f-b01e-666d-1f5e35a8b76d@huawei.com>
 <CACOAw_wQx5wjdWDX_WFebNS42t=wBuSh_k7oQ4v7abBv80SZXw@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9d1afacc-6033-2bae-d55d-909d50f1904b@huawei.com>
Date: Wed, 1 Jul 2020 15:15:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_wQx5wjdWDX_WFebNS42t=wBuSh_k7oQ4v7abBv80SZXw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqWxy-008MoB-Dx
Subject: Re: [f2fs-dev] [PATCH] f2fs: add symbolic link to kobject in sysfs
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC83LzEgMTU6MDQsIERhZWhvIEplb25nIHdyb3RlOgo+IEFjdHVhbGx5LCBJIHdhbnQg
dG8ga2VlcCB0aGUgbW91bnQgbnVtYmVyIHJlbWFpbmluZyB0byB0aGUgc2FtZQo+IG51bWJlciwg
ZXZlbiBpZiBpdCdzIHJlLW1vdW50ZWQuCgpUaGVuIG9uY2UgdGhlcmUgaXMgZjJmcyB1bW91bnRl
ciwgdGhlIG9yZGVyIHdpbGwgYmUgaW5jb3JyZWN0Li4uCgo+IE9yIHdlIG5lZWQgdG8ga2VlcCB0
cmFjayBvZiB0aGUgbnVtYmVyIGJlaW5nIGluY3JlYXNlZCB3aGVuZXZlciBpdCdzCj4gcmVtb3Vu
dGVkLiA6KAoKSU1PLCBpdCBuZWVkcyB0byBhbHdheXMga2VlcCB0aGUgbnVtYmVyIGJlaW5nIGlu
Y3JlYXNlZC4KClRoYW5rcywKCj4gCj4gMjAyMOuFhCA37JuUIDHsnbwgKOyImCkg7Jik7ZuEIDM6
MzYsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISxOgo+Pgo+PiBIaSBE
YWVobywKPj4KPj4gT24gMjAyMC82LzMwIDg6NTYsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4gRnJv
bTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Cj4+PiBBZGRlZCBhIHN5
bWJvbGljIGxpbmsgdG8gZGlyZWN0b3J5IG9mIHN5c2ZzLiBJdCB3aWxsCj4+PiBjcmVhdGUgYSBz
eW1ib2xpYyBsaW5rIHN1Y2ggYXMgIm1vdW50XzAiIGFuZCAibW91bnRfMSIgdG8KPj4+IGVhY2gg
ZjJmcyBtb3VudCBpbiB0aGUgb3JkZXIgb2YgbW91bnRpbmcgZmlsZXN5c3RlbS4gSXQgd2lsbAo+
Pj4gcHJvdmlkZSBlYXN5IGFjY2VzcyB0byBzeXNmcyBub2RlIGV2ZW4gaWYgbm90IGtub3dpbmcg
dGhlCj4+PiBzcGVjaWZpYyBkZXZpY2Ugbm9kZSBuYW1lIGxpa2Ugc2RhMTkgYW5kIGRtLTMuCj4+
Cj4+IEp1c3Qgb3V0IG9mIGN1cmlvc2l0eSwgaWYgd2UgbW91bnQvdW1vdW50IGFzIGJlbG93Ogo+
Pgo+PiBtb3VudCAvZGV2L3pyYW0wIC9tbnQvZjJmczAKPj4gbW91bnQgL2Rldi96cmFtMSAvbW50
L2YyZnMxCj4+IHVtb3VudCAvbW50L2YyZnMwCj4+IG1vdW50IC9kZXYvenJhbTAgL21udC9mMmZz
MAo+Pgo+PiBTaG91bGRuJ3Qgc3lzZnMgc3RydWN0dXJlIGJlOgo+PiBtb3VudF8yIC0+IHpyYW0w
Cj4+IG1vdW50XzEgLT4genJhbTEKPj4genJhbTAKPj4genJhbTEKPj4KPj4gVGhlbiB3ZSBjYW4g
a25vdyB6cmFtMCBpcyBtb3VudGVkIGFmdGVyIHpyYW0xPwo+Pgo+PiBIb3dldmVyIHRoZSByZXN1
bHQgc2hvd3M6Cj4+IG1vdW50XzAgLT4genJhbTAKPj4gbW91bnRfMSAtPiB6cmFtMQo+PiB6cmFt
MAo+PiB6cmFtMQo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8g
SmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+IC0tLQo+Pj4gIGZzL2YyZnMvZjJmcy5o
ICB8ICA0ICsrKysKPj4+ICBmcy9mMmZzL3N5c2ZzLmMgfCAzMSArKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tCj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMv
ZjJmcy5oCj4+PiBpbmRleCA0YjI4ZmQ0MmZkYmMuLjdkNmM1ZjhjZTE2YiAxMDA2NDQKPj4+IC0t
LSBhL2ZzL2YyZnMvZjJmcy5oCj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4gQEAgLTE0MTks
NiArMTQxOSw4IEBAIHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCB7Cj4+PiAgI2RlZmluZSBNQVhf
Q09NUFJFU1NfTE9HX1NJWkUgICAgICAgICAgICAgICAgOAo+Pj4gICNkZWZpbmUgTUFYX0NPTVBS
RVNTX1dJTkRPV19TSVpFICAgICAoKFBBR0VfU0laRSkgPDwgTUFYX0NPTVBSRVNTX0xPR19TSVpF
KQo+Pj4KPj4+ICsjZGVmaW5lIE1PVU5UX05BTUVfU0laRSAgICAgICAgICAgICAgICAgICAgICAy
MAo+Pj4gKwo+Pj4gIHN0cnVjdCBmMmZzX3NiX2luZm8gewo+Pj4gICAgICAgc3RydWN0IHN1cGVy
X2Jsb2NrICpzYjsgICAgICAgICAgICAgICAgIC8qIHBvaW50ZXIgdG8gVkZTIHN1cGVyIGJsb2Nr
ICovCj4+PiAgICAgICBzdHJ1Y3QgcHJvY19kaXJfZW50cnkgKnNfcHJvYzsgICAgICAgICAgLyog
cHJvYyBlbnRyeSAqLwo+Pj4gQEAgLTE1OTksNiArMTYwMSw4IEBAIHN0cnVjdCBmMmZzX3NiX2lu
Zm8gewo+Pj4gICAgICAgLyogRm9yIHN5c2ZzIHN1cHBwb3J0ICovCj4+PiAgICAgICBzdHJ1Y3Qg
a29iamVjdCBzX2tvYmo7Cj4+PiAgICAgICBzdHJ1Y3QgY29tcGxldGlvbiBzX2tvYmpfdW5yZWdp
c3RlcjsKPj4+ICsgICAgIGludCBzX21vdW50X2lkOwo+Pj4gKyAgICAgY2hhciBzX21vdW50X25h
bWVbTU9VTlRfTkFNRV9TSVpFXTsKPj4+Cj4+PiAgICAgICAvKiBGb3Igc2hyaW5rZXIgc3VwcG9y
dCAqLwo+Pj4gICAgICAgc3RydWN0IGxpc3RfaGVhZCBzX2xpc3Q7Cj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4+PiBpbmRleCBhYjQwZTFmODlmMjMu
LjY0YmJlMGIzYjgzMCAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvc3lzZnMuYwo+Pj4gKysrIGIv
ZnMvZjJmcy9zeXNmcy5jCj4+PiBAQCAtMTgsNiArMTgsNyBAQAo+Pj4gICNpbmNsdWRlIDx0cmFj
ZS9ldmVudHMvZjJmcy5oPgo+Pj4KPj4+ICBzdGF0aWMgc3RydWN0IHByb2NfZGlyX2VudHJ5ICpm
MmZzX3Byb2Nfcm9vdDsKPj4+ICtzdGF0aWMgc3RydWN0IGlkYSBmMmZzX21vdW50X2lkYTsKPj4+
Cj4+PiAgLyogU3lzZnMgc3VwcG9ydCBmb3IgZjJmcyAqLwo+Pj4gIGVudW0gewo+Pj4gQEAgLTkw
Niw2ICs5MDcsOSBAQCBpbnQgX19pbml0IGYyZnNfaW5pdF9zeXNmcyh2b2lkKQo+Pj4gICAgICAg
fSBlbHNlIHsKPj4+ICAgICAgICAgICAgICAgZjJmc19wcm9jX3Jvb3QgPSBwcm9jX21rZGlyKCJm
cy9mMmZzIiwgTlVMTCk7Cj4+PiAgICAgICB9Cj4+PiArCj4+PiArICAgICBpZGFfaW5pdCgmZjJm
c19tb3VudF9pZGEpOwo+Pj4gKwo+Pj4gICAgICAgcmV0dXJuIHJldDsKPj4+ICB9Cj4+Pgo+Pj4g
QEAgLTkxNSw2ICs5MTksNyBAQCB2b2lkIGYyZnNfZXhpdF9zeXNmcyh2b2lkKQo+Pj4gICAgICAg
a3NldF91bnJlZ2lzdGVyKCZmMmZzX2tzZXQpOwo+Pj4gICAgICAgcmVtb3ZlX3Byb2NfZW50cnko
ImZzL2YyZnMiLCBOVUxMKTsKPj4+ICAgICAgIGYyZnNfcHJvY19yb290ID0gTlVMTDsKPj4+ICsg
ICAgIGlkYV9kZXN0cm95KCZmMmZzX21vdW50X2lkYSk7Cj4+PiAgfQo+Pj4KPj4+ICBpbnQgZjJm
c19yZWdpc3Rlcl9zeXNmcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+PiBAQCAtOTI2LDEy
ICs5MzEsMjIgQEAgaW50IGYyZnNfcmVnaXN0ZXJfc3lzZnMoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpKQo+Pj4gICAgICAgaW5pdF9jb21wbGV0aW9uKCZzYmktPnNfa29ial91bnJlZ2lzdGVyKTsK
Pj4+ICAgICAgIGVyciA9IGtvYmplY3RfaW5pdF9hbmRfYWRkKCZzYmktPnNfa29iaiwgJmYyZnNf
c2Jfa3R5cGUsIE5VTEwsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJXMiLCBz
Yi0+c19pZCk7Cj4+PiAtICAgICBpZiAoZXJyKSB7Cj4+PiAtICAgICAgICAgICAgIGtvYmplY3Rf
cHV0KCZzYmktPnNfa29iaik7Cj4+PiAtICAgICAgICAgICAgIHdhaXRfZm9yX2NvbXBsZXRpb24o
JnNiaS0+c19rb2JqX3VucmVnaXN0ZXIpOwo+Pj4gLSAgICAgICAgICAgICByZXR1cm4gZXJyOwo+
Pj4gKyAgICAgaWYgKGVycikKPj4+ICsgICAgICAgICAgICAgZ290byBlcnIxOwo+Pj4gKwo+Pj4g
KyAgICAgc2JpLT5zX21vdW50X2lkID0gaWRhX3NpbXBsZV9nZXQoJmYyZnNfbW91bnRfaWRhLCAw
LCAwLCBHRlBfS0VSTkVMKTsKPj4+ICsgICAgIGlmIChzYmktPnNfbW91bnRfaWQgPCAwKSB7Cj4+
PiArICAgICAgICAgICAgIGVyciA9IHNiaS0+c19tb3VudF9pZDsKPj4+ICsgICAgICAgICAgICAg
Z290byBlcnIxOwo+Pj4gICAgICAgfQo+Pj4KPj4+ICsgICAgIHNucHJpbnRmKHNiaS0+c19tb3Vu
dF9uYW1lLCBNT1VOVF9OQU1FX1NJWkUsICJtb3VudF8lZCIsCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgc2JpLT5zX21vdW50X2lkKTsKPj4+ICsgICAgIGVyciA9IHN5c2ZzX2NyZWF0ZV9saW5r
KCZmMmZzX2tzZXQua29iaiwgJnNiaS0+c19rb2JqLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
IHNiaS0+c19tb3VudF9uYW1lKTsKPj4+ICsgICAgIGlmIChlcnIpCj4+PiArICAgICAgICAgICAg
IGdvdG8gZXJyMjsKPj4+ICsKPj4+ICAgICAgIGlmIChmMmZzX3Byb2Nfcm9vdCkKPj4+ICAgICAg
ICAgICAgICAgc2JpLT5zX3Byb2MgPSBwcm9jX21rZGlyKHNiLT5zX2lkLCBmMmZzX3Byb2Nfcm9v
dCk7Cj4+Pgo+Pj4gQEAgLTk0Niw2ICs5NjEsMTIgQEAgaW50IGYyZnNfcmVnaXN0ZXJfc3lzZnMo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdmljdGltX2JpdHNfc2VxX3Nob3csIHNiKTsKPj4+ICAgICAgIH0KPj4+ICAgICAgIHJldHVy
biAwOwo+Pj4gK2VycjI6Cj4+PiArICAgICBpZGFfc2ltcGxlX3JlbW92ZSgmZjJmc19tb3VudF9p
ZGEsIHNiaS0+c19tb3VudF9pZCk7Cj4+PiArZXJyMToKPj4+ICsgICAgIGtvYmplY3RfcHV0KCZz
YmktPnNfa29iaik7Cj4+PiArICAgICB3YWl0X2Zvcl9jb21wbGV0aW9uKCZzYmktPnNfa29ial91
bnJlZ2lzdGVyKTsKPj4+ICsgICAgIHJldHVybiBlcnI7Cj4+PiAgfQo+Pj4KPj4+ICB2b2lkIGYy
ZnNfdW5yZWdpc3Rlcl9zeXNmcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+PiBAQCAtOTU3
LDYgKzk3OCw4IEBAIHZvaWQgZjJmc191bnJlZ2lzdGVyX3N5c2ZzKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSkKPj4+ICAgICAgICAgICAgICAgcmVtb3ZlX3Byb2NfZW50cnkoInZpY3RpbV9iaXRz
Iiwgc2JpLT5zX3Byb2MpOwo+Pj4gICAgICAgICAgICAgICByZW1vdmVfcHJvY19lbnRyeShzYmkt
PnNiLT5zX2lkLCBmMmZzX3Byb2Nfcm9vdCk7Cj4+PiAgICAgICB9Cj4+PiArICAgICBzeXNmc19y
ZW1vdmVfbGluaygmZjJmc19rc2V0LmtvYmosIHNiaS0+c19tb3VudF9uYW1lKTsKPj4+ICsgICAg
IGlkYV9zaW1wbGVfcmVtb3ZlKCZmMmZzX21vdW50X2lkYSwgc2JpLT5zX21vdW50X2lkKTsKPj4+
ICAgICAgIGtvYmplY3RfZGVsKCZzYmktPnNfa29iaik7Cj4+PiAgICAgICBrb2JqZWN0X3B1dCgm
c2JpLT5zX2tvYmopOwo+Pj4gIH0KPj4+Cj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

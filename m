Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ADB20C736
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 11:24:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpTYD-0002tM-QM; Sun, 28 Jun 2020 09:24:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jpTYC-0002tD-Bc
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 09:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xgbz06dQ1v9EJOJLtvP1ChGtr5AFScAk+AK43LocoOs=; b=XPMiDVqa5Q+2MK5WB+45x9y2t5
 FoiGGuYDzvHtP237Qm59ODVfkFBer9iFxd2DVpyxKwcGmtiAzw/HAu/BDLuYYDNh7J00jHpnRCMBd
 22Y1aui/p9VRfJfX9PSSWw+K7o4nh4mv6OVHlcSR48db/Rg0tij+Cc2+c7EMEkZu3H5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xgbz06dQ1v9EJOJLtvP1ChGtr5AFScAk+AK43LocoOs=; b=DaHUPUpKXsY5+ZyQw45sW7yTvG
 SLsqSids2VGcCDXQcw2oqc6/jldXdNAHAIgjBOIzYVxHavNwI2JwS+EZjLHEYW0NVej4A7DLEJVI6
 lrR0JNnRlNK6MkokeaV6qWKv9D5P4jX+DJW+6OCbmSOPOcan8uE/EQnojsPFN28d3Y3Q=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpTY9-003WW8-Vn
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 09:24:36 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3A7FBB1E41C3CA03F7AC;
 Sun, 28 Jun 2020 17:24:27 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 28 Jun
 2020 17:24:20 +0800
To: "yuchangchun (C)" <yuchangchun1@huawei.com>, Qilong Zhang
 <zhangqilong3@huawei.com>, <jaegeuk@kernel.org>
References: <20200628063927.125546-1-zhangqilong3@huawei.com>
 <7c68a31c-7388-cffa-97db-91154b572456@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a645df9e-5ad7-27e0-08a6-d5064f857c8f@huawei.com>
Date: Sun, 28 Jun 2020 17:24:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7c68a31c-7388-cffa-97db-91154b572456@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpTY9-003WW8-Vn
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add f2fs_gc exception handle in
 f2fs_ioc_gc_range
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC82LzI4IDE2OjA2LCB5dWNoYW5nY2h1biAoQykgd3JvdGU6Cj4g5ZyoIDIwMjAvNi8y
OCAxNDozOSwgUWlsb25nIFpoYW5nIOWGmemBkzoKPj4gV2hlbiBmMmZzX2lvY19nY19yYW5nZSBw
ZXJmb3JtcyBtdWx0aXBsZSBzZWdtZW50cyBnYyBvcHMsIHRoZSByZXR1cm4KPj4gdmFsdWUgb2Yg
ZjJmc19pb2NfZ2NfcmFuZ2UgaXMgZGV0ZXJtaW5lZCBieSB0aGUgbGFzdCBzZWdtZW50IGdjIG9w
cy4KPj4gSWYgaXRzIG9wcyBmYWlsZWQsIHRoZSBmMmZzX2lvY19nY19yYW5nZSB3aWxsIGJlIGNv
bnNpZGVyZWQgdG8gYmUgZmFpbGVkCj4+IGRlc3BpdGUgc29tZSBvZiBwcmV2aW91cyBzZWdtZW50
cyBnYyBvcHMgc3VjY2VlZGVkLiBUaGVyZWZvcmUsIHNvIHdlCj4+IGZpeDogUmVkZWZpbmUgdGhl
IHJldHVybiB2YWx1ZSBvZiBnZXR0aW5nIHZpY3RpbSBvcHMgYW5kIGFkZCBleGNlcHRpb24KPj4g
aGFuZGxlIGZvciBmMmZzX2djLiBJbiBwYXJ0aWN1bGFyLCAxKS5pZiB0YXJnZXQgaGFzIG5vIHZh
bGlkIGJsb2NrLCBpdAo+PiB3aWxsIGdvIG9uLiAyKS5pZiB0YXJnZXQgc2VjdG9pb24gaGFzIHZh
bGlkIGJsb2NrKHMpLCBidXQgaXQgaXMgY3VycmVudAo+PiBzZWN0aW9uLCB3ZSB3aWxsIHJlbWlu
ZGVyIHRoZSBjYWxsZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFFpbG9uZyBaaGFuZyA8emhhbmdx
aWxvbmczQGh1YXdlaS5jb20+Cj4+IFJldmlld2VkLWJ5OiBDaGFvIFl1IDx5dWNoYW8wQGh1YXdl
aS5jb20+Cj4+IC0tLQo+PiAgIGZzL2YyZnMvZmlsZS5jICAgIHwgIDUgKysrKysKPj4gICBmcy9m
MmZzL2djLmMgICAgICB8IDE5ICsrKysrKysrKysrKystLS0tLS0KPj4gICBmcy9mMmZzL3NlZ21l
bnQuYyB8ICA0ICsrLS0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMv
ZmlsZS5jCj4+IGluZGV4IDMyNjhmOGRkNTliYi4uZmUwMDY0NzdhNGU0IDEwMDY0NAo+PiAtLS0g
YS9mcy9mMmZzL2ZpbGUuYwo+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+PiBAQCAtMjUyNyw2ICsy
NTI3LDExIEBAIHN0YXRpYyBpbnQgZjJmc19pb2NfZ2NfcmFuZ2Uoc3RydWN0IGZpbGUgKmZpbHAs
IHVuc2lnbmVkIGxvbmcgYXJnKQo+PiAgIAl9Cj4+ICAgCj4+ICAgCXJldCA9IGYyZnNfZ2Moc2Jp
LCByYW5nZS5zeW5jLCB0cnVlLCBHRVRfU0VHTk8oc2JpLCByYW5nZS5zdGFydCkpOwo+PiArCWlm
IChyZXQpIHsKPj4gKwkJaWYgKHJldCA9PSAtRUJVU1kpCj4+ICsJCQlyZXQgPSAtRUFHQUlOOwo+
PiArCQlnb3RvIG91dDsKPj4gKwl9Cj4+ICAgCXJhbmdlLnN0YXJ0ICs9IEJMS1NfUEVSX1NFQyhz
YmkpOwo+PiAgIAlpZiAocmFuZ2Uuc3RhcnQgPD0gZW5kKQo+PiAgIAkJZ290byBkb19tb3JlOwo+
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4+IGluZGV4IDViOTVk
NWExNDZlYi4uNzFjYjRhMDJhZWVlIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4gKysr
IGIvZnMvZjJmcy9nYy5jCj4+IEBAIC0zMjEsNiArMzIxLDcgQEAgc3RhdGljIGludCBnZXRfdmlj
dGltX2J5X2RlZmF1bHQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiAgIAl1bnNpZ25lZCBp
bnQgc2Vjbm8sIGxhc3RfdmljdGltOwo+PiAgIAl1bnNpZ25lZCBpbnQgbGFzdF9zZWdtZW50Owo+
PiAgIAl1bnNpZ25lZCBpbnQgbnNlYXJjaGVkID0gMDsKPj4gKwlpbnQgcmV0Owo+PiAgIAo+PiAg
IAltdXRleF9sb2NrKCZkaXJ0eV9pLT5zZWdsaXN0X2xvY2spOwo+PiAgIAlsYXN0X3NlZ21lbnQg
PSBNQUlOX1NFQ1Moc2JpKSAqIHNiaS0+c2Vnc19wZXJfc2VjOwo+PiBAQCAtMzMyLDEyICszMzMs
MTggQEAgc3RhdGljIGludCBnZXRfdmljdGltX2J5X2RlZmF1bHQoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLAo+PiAgIAlwLm1pbl9jb3N0ID0gZ2V0X21heF9jb3N0KHNiaSwgJnApOwo+PiAgIAo+
PiAgIAlpZiAoKnJlc3VsdCAhPSBOVUxMX1NFR05PKSB7Cj4+IC0JCWlmIChnZXRfdmFsaWRfYmxv
Y2tzKHNiaSwgKnJlc3VsdCwgZmFsc2UpICYmCj4+IC0JCQkhc2VjX3VzYWdlX2NoZWNrKHNiaSwg
R0VUX1NFQ19GUk9NX1NFRyhzYmksICpyZXN1bHQpKSkKPj4gKwkJcmV0ID0gMDsKPj4gKwkJaWYg
KCFnZXRfdmFsaWRfYmxvY2tzKHNiaSwgKnJlc3VsdCwgZmFsc2UpKQo+PiArCQkJZ290byBvdXQ7
Cj4gU2hvdWxkIGl0IHJldHVybiBzcGVjaWZpYyBlcnJubyB0byBzdG9wIEdDIGlmIHRoaXMgdmlj
dGltIHNlZ21lbnQgaGFzIG5vIAo+IHZhbGlkIGJsb2Nrc8KgIGluIGFjY29yZGFuY2Ugd2l0aCBv
cmlnaW5hbCBjb2RlLgoKQWdyZWVkLCBjb3VsZCBiZToKCmlmICghZ2V0X3ZhbGlkX2Jsb2Nrcyhz
YmksICpyZXN1bHQsIGZhbHNlKSkgewoJcmV0ID0gLUVOT0RBVEE7Cglnb3RvIG91dDsKfQoKVGhh
bmtzLAoKPiAKPiBUaGFua3MsCj4gCj4+ICsKPj4gKwkJaWYgKHNlY191c2FnZV9jaGVjayhzYmks
IEdFVF9TRUNfRlJPTV9TRUcoc2JpLCAqcmVzdWx0KSkpCj4+ICsJCQlyZXQgPSAtRUJVU1k7Cj4+
ICsJCWVsc2UKPj4gICAJCQlwLm1pbl9zZWdubyA9ICpyZXN1bHQ7Cj4+ICAgCQlnb3RvIG91dDsK
Pj4gICAJfQo+PiAgIAo+PiArCXJldCA9IC1FTk9EQVRBOwo+PiAgIAlpZiAocC5tYXhfc2VhcmNo
ID09IDApCj4+ICAgCQlnb3RvIG91dDsKPj4gICAKPj4gQEAgLTQ0MCw2ICs0NDcsNyBAQCBzdGF0
aWMgaW50IGdldF92aWN0aW1fYnlfZGVmYXVsdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+
ICAgCQkJZWxzZQo+PiAgIAkJCQlzZXRfYml0KHNlY25vLCBkaXJ0eV9pLT52aWN0aW1fc2VjbWFw
KTsKPj4gICAJCX0KPj4gKwkJcmV0ID0gMDsKPj4gICAKPj4gICAJfQo+PiAgIG91dDoKPj4gQEAg
LTQ0OSw3ICs0NTcsNyBAQCBzdGF0aWMgaW50IGdldF92aWN0aW1fYnlfZGVmYXVsdChzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksCj4+ICAgCQkJCXByZWZyZWVfc2VnbWVudHMoc2JpKSwgZnJlZV9z
ZWdtZW50cyhzYmkpKTsKPj4gICAJbXV0ZXhfdW5sb2NrKCZkaXJ0eV9pLT5zZWdsaXN0X2xvY2sp
Owo+PiAgIAo+PiAtCXJldHVybiAocC5taW5fc2Vnbm8gPT0gTlVMTF9TRUdOTykgPyAwIDogMTsK
Pj4gKwlyZXR1cm4gcmV0Owo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHZp
Y3RpbV9zZWxlY3Rpb24gZGVmYXVsdF92X29wcyA9IHsKPj4gQEAgLTEzMzMsMTAgKzEzNDEsOSBA
QCBpbnQgZjJmc19nYyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgc3luYywKPj4gICAJ
CXJldCA9IC1FSU5WQUw7Cj4+ICAgCQlnb3RvIHN0b3A7Cj4+ICAgCX0KPj4gLQlpZiAoIV9fZ2V0
X3ZpY3RpbShzYmksICZzZWdubywgZ2NfdHlwZSkpIHsKPj4gLQkJcmV0ID0gLUVOT0RBVEE7Cj4+
ICsJcmV0ID0gX19nZXRfdmljdGltKHNiaSwgJnNlZ25vLCBnY190eXBlKTsKPj4gKwlpZiAocmV0
KQo+PiAgIAkJZ290byBzdG9wOwo+PiAtCX0KPj4gICAKPj4gICAJc2VnX2ZyZWVkID0gZG9fZ2Fy
YmFnZV9jb2xsZWN0KHNiaSwgc2Vnbm8sICZnY19saXN0LCBnY190eXBlKTsKPj4gICAJaWYgKGdj
X3R5cGUgPT0gRkdfR0MgJiYgc2VnX2ZyZWVkID09IHNiaS0+c2Vnc19wZXJfc2VjKQo+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+PiBpbmRleCAx
OTZmMzE1MDM1MTEuLmI5ZmQ5Mzc2MWIwYSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50
LmMKPj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4gQEAgLTI2MDUsNyArMjYwNSw3IEBAIHN0
YXRpYyBpbnQgZ2V0X3Nzcl9zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5
cGUpCj4+ICAgCWJvb2wgcmV2ZXJzZWQgPSBmYWxzZTsKPj4gICAKPj4gICAJLyogZjJmc19uZWVk
X1NTUigpIGFscmVhZHkgZm9yY2VzIHRvIGRvIHRoaXMgKi8KPj4gLQlpZiAodl9vcHMtPmdldF92
aWN0aW0oc2JpLCAmc2Vnbm8sIEJHX0dDLCB0eXBlLCBTU1IpKSB7Cj4+ICsJaWYgKCF2X29wcy0+
Z2V0X3ZpY3RpbShzYmksICZzZWdubywgQkdfR0MsIHR5cGUsIFNTUikpIHsKPj4gICAJCWN1cnNl
Zy0+bmV4dF9zZWdubyA9IHNlZ25vOwo+PiAgIAkJcmV0dXJuIDE7Cj4+ICAgCX0KPj4gQEAgLTI2
MzIsNyArMjYzMiw3IEBAIHN0YXRpYyBpbnQgZ2V0X3Nzcl9zZWdtZW50KHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgaW50IHR5cGUpCj4+ICAgCWZvciAoOyBjbnQtLSA+IDA7IHJldmVyc2VkID8g
aS0tIDogaSsrKSB7Cj4+ICAgCQlpZiAoaSA9PSB0eXBlKQo+PiAgIAkJCWNvbnRpbnVlOwo+PiAt
CQlpZiAodl9vcHMtPmdldF92aWN0aW0oc2JpLCAmc2Vnbm8sIEJHX0dDLCBpLCBTU1IpKSB7Cj4+
ICsJCWlmICghdl9vcHMtPmdldF92aWN0aW0oc2JpLCAmc2Vnbm8sIEJHX0dDLCBpLCBTU1IpKSB7
Cj4+ICAgCQkJY3Vyc2VnLT5uZXh0X3NlZ25vID0gc2Vnbm87Cj4+ICAgCQkJcmV0dXJuIDE7Cj4+
ICAgCQl9Cj4gCj4gCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800F20C6EA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 10:06:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpSKs-0001hV-5Y; Sun, 28 Jun 2020 08:06:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchangchun1@huawei.com>) id 1jpSKq-0001hN-Uy
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 08:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MCzcnyhNinZQ0x/WyZUnOwM4YF115+hEwN3UHu7TS1U=; b=c1H9drKj7kmnZYCcm9K9LJawKY
 ERJiFFrqHxFJUwEXvsIvABBhb+n7/5jcMKlTENSIe16QEfFPdW1AR8PWiiPEOs1zHIBi5SBQkwuD3
 V09qvaf+fjo9gOojsOszTqtrw8WiuWKmzdLi4PXNOwQYVF3/dqPHscMhEB0ymqaRsLww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MCzcnyhNinZQ0x/WyZUnOwM4YF115+hEwN3UHu7TS1U=; b=mNnz9RcSOC3guiplYqVDnYOZrl
 iv0qV5TUNmrAYLDIl+yM3SBEuAF0I4XzRR+WOB6A6YrmCLWiNtCMou0tGIN7fuwkMMXOjOBV4/nnD
 luXN/cad9Llb3yyZMN/ciqwbZMen5GgqVZh1/ER4IpIt4t3Wg/nqrWdr+snFfL6fWYIE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpSKm-003Prz-RF
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 08:06:44 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4952F8D1FB0ADA54AFCD;
 Sun, 28 Jun 2020 16:06:23 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.64) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Sun, 28 Jun 2020
 16:06:13 +0800
To: Qilong Zhang <zhangqilong3@huawei.com>, <yuchao0@huawei.com>,
 <jaegeuk@kernel.org>
References: <20200628063927.125546-1-zhangqilong3@huawei.com>
From: "yuchangchun (C)" <yuchangchun1@huawei.com>
Message-ID: <7c68a31c-7388-cffa-97db-91154b572456@huawei.com>
Date: Sun, 28 Jun 2020 16:06:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200628063927.125546-1-zhangqilong3@huawei.com>
X-Originating-IP: [10.174.178.64]
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
X-Headers-End: 1jpSKm-003Prz-RF
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDIwMjAvNi8yOCAxNDozOSwgUWlsb25nIFpoYW5nIOWGmemBkzoKPiBXaGVuIGYyZnNfaW9j
X2djX3JhbmdlIHBlcmZvcm1zIG11bHRpcGxlIHNlZ21lbnRzIGdjIG9wcywgdGhlIHJldHVybgo+
IHZhbHVlIG9mIGYyZnNfaW9jX2djX3JhbmdlIGlzIGRldGVybWluZWQgYnkgdGhlIGxhc3Qgc2Vn
bWVudCBnYyBvcHMuCj4gSWYgaXRzIG9wcyBmYWlsZWQsIHRoZSBmMmZzX2lvY19nY19yYW5nZSB3
aWxsIGJlIGNvbnNpZGVyZWQgdG8gYmUgZmFpbGVkCj4gZGVzcGl0ZSBzb21lIG9mIHByZXZpb3Vz
IHNlZ21lbnRzIGdjIG9wcyBzdWNjZWVkZWQuIFRoZXJlZm9yZSwgc28gd2UKPiBmaXg6IFJlZGVm
aW5lIHRoZSByZXR1cm4gdmFsdWUgb2YgZ2V0dGluZyB2aWN0aW0gb3BzIGFuZCBhZGQgZXhjZXB0
aW9uCj4gaGFuZGxlIGZvciBmMmZzX2djLiBJbiBwYXJ0aWN1bGFyLCAxKS5pZiB0YXJnZXQgaGFz
IG5vIHZhbGlkIGJsb2NrLCBpdAo+IHdpbGwgZ28gb24uIDIpLmlmIHRhcmdldCBzZWN0b2lvbiBo
YXMgdmFsaWQgYmxvY2socyksIGJ1dCBpdCBpcyBjdXJyZW50Cj4gc2VjdGlvbiwgd2Ugd2lsbCBy
ZW1pbmRlciB0aGUgY2FsbGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogUWlsb25nIFpoYW5nIDx6aGFu
Z3FpbG9uZzNAaHVhd2VpLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3
ZWkuY29tPgo+IC0tLQo+ICAgZnMvZjJmcy9maWxlLmMgICAgfCAgNSArKysrKwo+ICAgZnMvZjJm
cy9nYy5jICAgICAgfCAxOSArKysrKysrKysrKysrLS0tLS0tCj4gICBmcy9mMmZzL3NlZ21lbnQu
YyB8ICA0ICsrLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5j
Cj4gaW5kZXggMzI2OGY4ZGQ1OWJiLi5mZTAwNjQ3N2E0ZTQgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJm
cy9maWxlLmMKPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+IEBAIC0yNTI3LDYgKzI1MjcsMTEgQEAg
c3RhdGljIGludCBmMmZzX2lvY19nY19yYW5nZShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQg
bG9uZyBhcmcpCj4gICAJfQo+ICAgCj4gICAJcmV0ID0gZjJmc19nYyhzYmksIHJhbmdlLnN5bmMs
IHRydWUsIEdFVF9TRUdOTyhzYmksIHJhbmdlLnN0YXJ0KSk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJ
aWYgKHJldCA9PSAtRUJVU1kpCj4gKwkJCXJldCA9IC1FQUdBSU47Cj4gKwkJZ290byBvdXQ7Cj4g
Kwl9Cj4gICAJcmFuZ2Uuc3RhcnQgKz0gQkxLU19QRVJfU0VDKHNiaSk7Cj4gICAJaWYgKHJhbmdl
LnN0YXJ0IDw9IGVuZCkKPiAgIAkJZ290byBkb19tb3JlOwo+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2djLmMgYi9mcy9mMmZzL2djLmMKPiBpbmRleCA1Yjk1ZDVhMTQ2ZWIuLjcxY2I0YTAyYWVlZSAx
MDA2NDQKPiAtLS0gYS9mcy9mMmZzL2djLmMKPiArKysgYi9mcy9mMmZzL2djLmMKPiBAQCAtMzIx
LDYgKzMyMSw3IEBAIHN0YXRpYyBpbnQgZ2V0X3ZpY3RpbV9ieV9kZWZhdWx0KHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwKPiAgIAl1bnNpZ25lZCBpbnQgc2Vjbm8sIGxhc3RfdmljdGltOwo+ICAg
CXVuc2lnbmVkIGludCBsYXN0X3NlZ21lbnQ7Cj4gICAJdW5zaWduZWQgaW50IG5zZWFyY2hlZCA9
IDA7Cj4gKwlpbnQgcmV0Owo+ICAgCj4gICAJbXV0ZXhfbG9jaygmZGlydHlfaS0+c2VnbGlzdF9s
b2NrKTsKPiAgIAlsYXN0X3NlZ21lbnQgPSBNQUlOX1NFQ1Moc2JpKSAqIHNiaS0+c2Vnc19wZXJf
c2VjOwo+IEBAIC0zMzIsMTIgKzMzMywxOCBAQCBzdGF0aWMgaW50IGdldF92aWN0aW1fYnlfZGVm
YXVsdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gICAJcC5taW5fY29zdCA9IGdldF9tYXhf
Y29zdChzYmksICZwKTsKPiAgIAo+ICAgCWlmICgqcmVzdWx0ICE9IE5VTExfU0VHTk8pIHsKPiAt
CQlpZiAoZ2V0X3ZhbGlkX2Jsb2NrcyhzYmksICpyZXN1bHQsIGZhbHNlKSAmJgo+IC0JCQkhc2Vj
X3VzYWdlX2NoZWNrKHNiaSwgR0VUX1NFQ19GUk9NX1NFRyhzYmksICpyZXN1bHQpKSkKPiArCQly
ZXQgPSAwOwo+ICsJCWlmICghZ2V0X3ZhbGlkX2Jsb2NrcyhzYmksICpyZXN1bHQsIGZhbHNlKSkK
PiArCQkJZ290byBvdXQ7ClNob3VsZCBpdCByZXR1cm4gc3BlY2lmaWMgZXJybm8gdG8gc3RvcCBH
QyBpZiB0aGlzIHZpY3RpbSBzZWdtZW50IGhhcyBubyAKdmFsaWQgYmxvY2tzwqAgaW4gYWNjb3Jk
YW5jZSB3aXRoIG9yaWdpbmFsIGNvZGUuCgpUaGFua3MsCgo+ICsKPiArCQlpZiAoc2VjX3VzYWdl
X2NoZWNrKHNiaSwgR0VUX1NFQ19GUk9NX1NFRyhzYmksICpyZXN1bHQpKSkKPiArCQkJcmV0ID0g
LUVCVVNZOwo+ICsJCWVsc2UKPiAgIAkJCXAubWluX3NlZ25vID0gKnJlc3VsdDsKPiAgIAkJZ290
byBvdXQ7Cj4gICAJfQo+ICAgCj4gKwlyZXQgPSAtRU5PREFUQTsKPiAgIAlpZiAocC5tYXhfc2Vh
cmNoID09IDApCj4gICAJCWdvdG8gb3V0Owo+ICAgCj4gQEAgLTQ0MCw2ICs0NDcsNyBAQCBzdGF0
aWMgaW50IGdldF92aWN0aW1fYnlfZGVmYXVsdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4g
ICAJCQllbHNlCj4gICAJCQkJc2V0X2JpdChzZWNubywgZGlydHlfaS0+dmljdGltX3NlY21hcCk7
Cj4gICAJCX0KPiArCQlyZXQgPSAwOwo+ICAgCj4gICAJfQo+ICAgb3V0Ogo+IEBAIC00NDksNyAr
NDU3LDcgQEAgc3RhdGljIGludCBnZXRfdmljdGltX2J5X2RlZmF1bHQoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLAo+ICAgCQkJCXByZWZyZWVfc2VnbWVudHMoc2JpKSwgZnJlZV9zZWdtZW50cyhz
YmkpKTsKPiAgIAltdXRleF91bmxvY2soJmRpcnR5X2ktPnNlZ2xpc3RfbG9jayk7Cj4gICAKPiAt
CXJldHVybiAocC5taW5fc2Vnbm8gPT0gTlVMTF9TRUdOTykgPyAwIDogMTsKPiArCXJldHVybiBy
ZXQ7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmljdGltX3NlbGVjdGlvbiBk
ZWZhdWx0X3Zfb3BzID0gewo+IEBAIC0xMzMzLDEwICsxMzQxLDkgQEAgaW50IGYyZnNfZ2Moc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBib29sIHN5bmMsCj4gICAJCXJldCA9IC1FSU5WQUw7Cj4g
ICAJCWdvdG8gc3RvcDsKPiAgIAl9Cj4gLQlpZiAoIV9fZ2V0X3ZpY3RpbShzYmksICZzZWdubywg
Z2NfdHlwZSkpIHsKPiAtCQlyZXQgPSAtRU5PREFUQTsKPiArCXJldCA9IF9fZ2V0X3ZpY3RpbShz
YmksICZzZWdubywgZ2NfdHlwZSk7Cj4gKwlpZiAocmV0KQo+ICAgCQlnb3RvIHN0b3A7Cj4gLQl9
Cj4gICAKPiAgIAlzZWdfZnJlZWQgPSBkb19nYXJiYWdlX2NvbGxlY3Qoc2JpLCBzZWdubywgJmdj
X2xpc3QsIGdjX3R5cGUpOwo+ICAgCWlmIChnY190eXBlID09IEZHX0dDICYmIHNlZ19mcmVlZCA9
PSBzYmktPnNlZ3NfcGVyX3NlYykKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9m
cy9mMmZzL3NlZ21lbnQuYwo+IGluZGV4IDE5NmYzMTUwMzUxMS4uYjlmZDkzNzYxYjBhIDEwMDY0
NAo+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBA
QCAtMjYwNSw3ICsyNjA1LDcgQEAgc3RhdGljIGludCBnZXRfc3NyX3NlZ21lbnQoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSkKPiAgIAlib29sIHJldmVyc2VkID0gZmFsc2U7Cj4g
ICAKPiAgIAkvKiBmMmZzX25lZWRfU1NSKCkgYWxyZWFkeSBmb3JjZXMgdG8gZG8gdGhpcyAqLwo+
IC0JaWYgKHZfb3BzLT5nZXRfdmljdGltKHNiaSwgJnNlZ25vLCBCR19HQywgdHlwZSwgU1NSKSkg
ewo+ICsJaWYgKCF2X29wcy0+Z2V0X3ZpY3RpbShzYmksICZzZWdubywgQkdfR0MsIHR5cGUsIFNT
UikpIHsKPiAgIAkJY3Vyc2VnLT5uZXh0X3NlZ25vID0gc2Vnbm87Cj4gICAJCXJldHVybiAxOwo+
ICAgCX0KPiBAQCAtMjYzMiw3ICsyNjMyLDcgQEAgc3RhdGljIGludCBnZXRfc3NyX3NlZ21lbnQo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSkKPiAgIAlmb3IgKDsgY250LS0gPiAw
OyByZXZlcnNlZCA/IGktLSA6IGkrKykgewo+ICAgCQlpZiAoaSA9PSB0eXBlKQo+ICAgCQkJY29u
dGludWU7Cj4gLQkJaWYgKHZfb3BzLT5nZXRfdmljdGltKHNiaSwgJnNlZ25vLCBCR19HQywgaSwg
U1NSKSkgewo+ICsJCWlmICghdl9vcHMtPmdldF92aWN0aW0oc2JpLCAmc2Vnbm8sIEJHX0dDLCBp
LCBTU1IpKSB7Cj4gICAJCQljdXJzZWctPm5leHRfc2Vnbm8gPSBzZWdubzsKPiAgIAkJCXJldHVy
biAxOwo+ICAgCQl9CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

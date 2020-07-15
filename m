Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AAE2204DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 08:17:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvajH-00055v-OG; Wed, 15 Jul 2020 06:17:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jvajG-00055m-3C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 06:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+n9eE/3C5NzRJMCL6a+1ip1zGWoxWYKNJ+LTzIxA9rs=; b=i1o84grMcTQTIiw1RpSBUVepE3
 nezbpj2BTCtqeNbsBs/FI/QZVXuOvvljp6R7F3yvdpTMcRzpZciApzCRfP89OJJ2vzVxs1rNB2AJO
 Q8VUHvF4u5hbCNlz+iM+uyEY/XqPu1CaTVabk63uNhEhopJJTdDQTPStAYid4St3Lkpk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+n9eE/3C5NzRJMCL6a+1ip1zGWoxWYKNJ+LTzIxA9rs=; b=bERhQzqjs8dIBRdmPRjbgCs4bj
 quMvMg2rpboIuZEmf/rFWdvSZ9mv2dKqlzO+BINVnz5tDnOOJKeBZxx3+Hjf9Zghx2hVeiVmK2ZGG
 fz1omsTXB9btH9S3NMpA3cFP3h7dJIpHQPMHi8UTAqh77GIxfOdWAMSkgFMXV9laC3jo=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvajD-008JLk-Ou
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 06:17:18 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D38F29671EBDBCF0AA7B;
 Wed, 15 Jul 2020 14:16:58 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 15 Jul
 2020 14:16:57 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200713031252.3873546-1-daeho43@gmail.com>
 <20200713181152.GC2910046@google.com>
 <3b02263d-a5e1-136c-40ed-514d34e4c895@huawei.com>
 <CACOAw_wBD_ourGJSdRTDM-wzeH97aGE966QDB6bpjiyXRrh47A@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f4a594a1-464f-3a74-90cb-fd536bed9962@huawei.com>
Date: Wed, 15 Jul 2020 14:16:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_wBD_ourGJSdRTDM-wzeH97aGE966QDB6bpjiyXRrh47A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvajD-008JLk-Ou
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change the way of handling
 range.len in F2FS_IOC_SEC_TRIM_FILE
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC83LzE1IDEyOjA2LCBEYWVobyBKZW9uZyB3cm90ZToKPiBXZSBjb3VsZCB1c2UgZnNj
cnlwdF96ZXJvb3V0X3JhbmdlKCkgZm9yIGFuIGVuY3J5cHRlZCBmaWxlLgo+IEJ1dCwgb25lIHBy
b2JsZW0gaXMgZnNjcnlwdF96ZXJvb3V0X3JhbmdlKCkgYXNzdW1lcyB0aGF0IGZpbGVzeXN0ZW1z
Cj4gb25seSB1c2UgYSBzaW5nbGUgYmxvY2sgZGV2aWNlLgo+IEl0IG1lYW5zIGl0IGRvZXNuJ3Qg
cmVjZWl2ZSBiZGV2IGFzIGEgcGFyYW1ldGVyLgo+IEhvdyBhYm91dCBjaGFuZ2luZyB0aGUgaW50
ZXJmYWNlIG9mIGZzY3J5cHRfemVyb291dF9yYW5nZSgpIGZpcnN0IGFuZCB1c2luZyBpdD8KClll
cywgcGxlYXNlIGxpbWl0ZWQgdG8gdXNlIGZzY3J5cHRfemVyb291dF9yYW5nZSgpIG9uIG5vbi1t
dWx0aWRldmljZSBmMmZzIGltYWdlCmZpcnN0LCB3ZSBjYW4gYWRkIGEgY29uZGl0aW9uIHRvIGNo
ZWNrIHRoYXQgaW4gdGhlIGJlZ2lubmluZyBvZiBpb2N0bCBpbnRlcmZhY2UsCm9uY2UgZnNjcnlw
dF96ZXJvb3V0X3JhbmdlKCkgYWNjZXB0cyBiZGV2IGFzIHBhcmFtZXRlciwgd2UgY2FuIHJlbW92
ZSB0aGF0IGxpbWl0YXRpb24uCgpUaGFua3MsCgo+IAo+IDIwMjDrhYQgN+yblCAxNOydvCAo7ZmU
KSDsmKTtm4QgOTozNiwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6
Cj4+Cj4+IE9uIDIwMjAvNy8xNCAyOjExLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+IEhpIERhZWhv
LAo+Pj4KPj4+IFBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzLgo+Pj4KPj4+IGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy5naXQvY29t
bWl0Lz9oPWRldiZpZD0zNTI0NTE4MDQ1OWFlYmY2ZDcwZmRlODhhNTM4ZjA0MDBhNzk0YWE2Cj4+
Cj4+IEknbSBjdXJpb3VzIGFib3V0IHdoYXQgd2lsbCBoYXBwZW4gaWYgd2UgY2FsbAo+PiBzZWNf
dHJpbV9maWxlKEYyRlNfVFJJTV9GSUxFX1pFUk9PVVQpIG9uIGFuIGVuY3J5cHRlZCBmaWxlLCB3
aWxsCj4+IGl0IHVzZSB6ZXJvIGJpdHMgY292ZXJpbmcgZW5jcnlwdGVkIGRhdGEgb24gZGlzaz8K
Pj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+PiBPbiAwNy8xMywgRGFlaG8g
SmVvbmcgd3JvdGU6Cj4+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNv
bT4KPj4+Pgo+Pj4+IENoYW5nZWQgdGhlIHdheSBvZiBoYW5kbGluZyByYW5nZS5sZW4gb2YgRjJG
U19JT0NfU0VDX1RSSU1fRklMRS4KPj4+PiAgMS4gQWRkZWQgLTEgdmFsdWUgc3VwcG9ydCBmb3Ig
cmFuZ2UubGVuIHRvIHNlY3VyZSB0cmltIHRoZSB3aG9sZSBibG9ja3MKPj4+PiAgICAgc3RhcnRp
bmcgZnJvbSByYW5nZS5zdGFydCByZWdhcmRsZXNzIG9mIGlfc2l6ZS4KPj4+PiAgMi4gSWYgdGhl
IGVuZCBvZiB0aGUgcmFuZ2UgcGFzc2VzIG92ZXIgdGhlIGVuZCBvZiBmaWxlLCBpdCBtZWFucyB1
bnRpbAo+Pj4+ICAgICB0aGUgZW5kIG9mIGZpbGUgKGlfc2l6ZSkuCj4+Pj4gIDMuIGlnbm9yZWQg
dGhlIGNhc2Ugb2YgdGhhdCByYW5nZS5sZW4gaXMgemVybyB0byBwcmV2ZW50IHRoZSBmdW5jdGlv
bgo+Pj4+ICAgICBmcm9tIG1ha2luZyBlbmRfYWRkciB6ZXJvIGFuZCB0cmlnZ2VyaW5nIGRpZmZl
cmVudCBiZWhhdmlvdXIgb2YKPj4+PiAgICAgdGhlIGZ1bmN0aW9uLgo+Pj4+Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+PiAtLS0KPj4+
PiBDaGFuZ2VzIGluIHYyOgo+Pj4+ICAtIENoYW5nZWQgLTEgcmFuZ2UubGVuIG9wdGlvbiB0byBt
ZWFuIHRoZSB3aG9sZSBibG9ja3Mgc3RhcnRpbmcgZnJvbQo+Pj4+ICAgIHJhbmdlLnN0YXJ0IHJl
Z2FyZGxlc3Mgb2YgaV9zaXplCj4+Pj4gLS0tCj4+Pj4gIGZzL2YyZnMvZmlsZS5jIHwgMjMgKysr
KysrKysrKysrLS0tLS0tLS0tLS0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5j
IGIvZnMvZjJmcy9maWxlLmMKPj4+PiBpbmRleCAzNjhjODBmOGUyYTEuLjI0ODU4NDFlM2IyZCAx
MDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5j
Cj4+Pj4gQEAgLTM3OTIsNyArMzc5Miw3IEBAIHN0YXRpYyBpbnQgZjJmc19zZWNfdHJpbV9maWxl
KHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPj4+PiAgICAgIHBnb2ZmX3Qg
aW5kZXgsIHBnX2VuZDsKPj4+PiAgICAgIGJsb2NrX3QgcHJldl9ibG9jayA9IDAsIGxlbiA9IDA7
Cj4+Pj4gICAgICBsb2ZmX3QgZW5kX2FkZHI7Cj4+Pj4gLSAgICBib29sIHRvX2VuZDsKPj4+PiAr
ICAgIGJvb2wgdG9fZW5kID0gZmFsc2U7Cj4+Pj4gICAgICBpbnQgcmV0ID0gMDsKPj4+Pgo+Pj4+
ICAgICAgaWYgKCEoZmlscC0+Zl9tb2RlICYgRk1PREVfV1JJVEUpKQo+Pj4+IEBAIC0zODEzLDIz
ICszODEzLDIzIEBAIHN0YXRpYyBpbnQgZjJmc19zZWNfdHJpbV9maWxlKHN0cnVjdCBmaWxlICpm
aWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPj4+PiAgICAgIGZpbGVfc3RhcnRfd3JpdGUoZmlscCk7
Cj4+Pj4gICAgICBpbm9kZV9sb2NrKGlub2RlKTsKPj4+Pgo+Pj4+IC0gICAgaWYgKGYyZnNfaXNf
YXRvbWljX2ZpbGUoaW5vZGUpIHx8IGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkgewo+Pj4+
ICsgICAgaWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpIHx8IGYyZnNfY29tcHJlc3NlZF9m
aWxlKGlub2RlKSB8fAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgIHJhbmdlLnN0YXJ0ID49IGlu
b2RlLT5pX3NpemUpIHsKPj4+PiAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPj4+PiAgICAg
ICAgICAgICAgZ290byBlcnI7Cj4+Pj4gICAgICB9Cj4+Pj4KPj4+PiAtICAgIGlmIChyYW5nZS5z
dGFydCA+PSBpbm9kZS0+aV9zaXplKSB7Cj4+Pj4gLSAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7
Cj4+Pj4gKyAgICBpZiAocmFuZ2UubGVuID09IDApCj4+Pj4gICAgICAgICAgICAgIGdvdG8gZXJy
Owo+Pj4+IC0gICAgfQo+Pj4+Cj4+Pj4gLSAgICBpZiAoaW5vZGUtPmlfc2l6ZSAtIHJhbmdlLnN0
YXJ0IDwgcmFuZ2UubGVuKSB7Cj4+Pj4gLSAgICAgICAgICAgIHJldCA9IC1FMkJJRzsKPj4+PiAt
ICAgICAgICAgICAgZ290byBlcnI7Cj4+Pj4gKyAgICBpZiAoaW5vZGUtPmlfc2l6ZSAtIHJhbmdl
LnN0YXJ0ID4gcmFuZ2UubGVuKSB7Cj4+Pj4gKyAgICAgICAgICAgIGVuZF9hZGRyID0gcmFuZ2Uu
c3RhcnQgKyByYW5nZS5sZW47Cj4+Pj4gKyAgICB9IGVsc2Ugewo+Pj4+ICsgICAgICAgICAgICBl
bmRfYWRkciA9IHJhbmdlLmxlbiA9PSAodTY0KS0xID8KPj4+PiArICAgICAgICAgICAgICAgICAg
ICBzYmktPnNiLT5zX21heGJ5dGVzIDogaW5vZGUtPmlfc2l6ZTsKPj4+PiArICAgICAgICAgICAg
dG9fZW5kID0gdHJ1ZTsKPj4+PiAgICAgIH0KPj4+PiAtICAgIGVuZF9hZGRyID0gcmFuZ2Uuc3Rh
cnQgKyByYW5nZS5sZW47Cj4+Pj4KPj4+PiAtICAgIHRvX2VuZCA9IChlbmRfYWRkciA9PSBpbm9k
ZS0+aV9zaXplKTsKPj4+PiAgICAgIGlmICghSVNfQUxJR05FRChyYW5nZS5zdGFydCwgRjJGU19C
TEtTSVpFKSB8fAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICghdG9fZW5kICYmICFJU19BTElH
TkVEKGVuZF9hZGRyLCBGMkZTX0JMS1NJWkUpKSkgewo+Pj4+ICAgICAgICAgICAgICByZXQgPSAt
RUlOVkFMOwo+Pj4+IEBAIC0zODQ2LDcgKzM4NDYsOCBAQCBzdGF0aWMgaW50IGYyZnNfc2VjX3Ry
aW1fZmlsZShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4+Pj4gICAgICBk
b3duX3dyaXRlKCZGMkZTX0koaW5vZGUpLT5pX2djX3J3c2VtW1dSSVRFXSk7Cj4+Pj4gICAgICBk
b3duX3dyaXRlKCZGMkZTX0koaW5vZGUpLT5pX21tYXBfc2VtKTsKPj4+Pgo+Pj4+IC0gICAgcmV0
ID0gZmlsZW1hcF93cml0ZV9hbmRfd2FpdF9yYW5nZShtYXBwaW5nLCByYW5nZS5zdGFydCwgZW5k
X2FkZHIgLSAxKTsKPj4+PiArICAgIHJldCA9IGZpbGVtYXBfd3JpdGVfYW5kX3dhaXRfcmFuZ2Uo
bWFwcGluZywgcmFuZ2Uuc3RhcnQsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgdG9fZW5kID8g
TExPTkdfTUFYIDogZW5kX2FkZHIgLSAxKTsKPj4+PiAgICAgIGlmIChyZXQpCj4+Pj4gICAgICAg
ICAgICAgIGdvdG8gb3V0Owo+Pj4+Cj4+Pj4gLS0KPj4+PiAyLjI3LjAuMzgzLmcwNTAzMTljMmFl
LWdvb2cKPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pj4gLgo+Pj4KPiAuCj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=

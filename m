Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1AE50821C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 09:27:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nh4kg-00037g-Bg; Wed, 20 Apr 2022 07:27:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1nh4ke-00037a-TG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 07:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 CC:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9G9MuDuspYt6oVMAbKP8SYuBDIIaJ9TZBh0WZLuVnps=; b=E1C+dS2GnIrsZaSOMm9+l/1QTn
 +2isHdwcTHu8AThVt38PBc5Ikgz0WPQyFWBlGDLV9ARIc2rM7auB+RweCZm76qwIJ6U+nwCX3nL4q
 G1gavzhjh9l5Hw79wrKuMXSvB6IV04eM+6PY8jPXhd4Cbv6o3kCrM9Dze7ckZ+dZ23Cc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:CC:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9G9MuDuspYt6oVMAbKP8SYuBDIIaJ9TZBh0WZLuVnps=; b=JWUklOkkpZLWF6wcGmy/upZoBA
 DmQXBFzJHQeOShwLg5XcZMr3IdXpXbgiQ6bfKXiLp3iym1PQBK7P+M3Q3b3W8vCcrnvm6qmym8LpM
 t5HcSx/SIphpijL5sNeq2xXz7b9u9YlAtHSnkiejtqQhwVOescVnvhyxJihAeHn0VmQQ=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nh4kd-0008Nw-C5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 07:27:49 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KjsgB4W2Lz1J9pj;
 Wed, 20 Apr 2022 15:26:46 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 15:27:31 +0800
Received: from [10.174.177.235] (10.174.177.235) by
 dggpeml500009.china.huawei.com (7.185.36.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 15:27:30 +0800
Message-ID: <ae3e6ed3-e153-de5c-03e8-c5f0924eb525@huawei.com>
Date: Wed, 20 Apr 2022 15:27:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Chao Yu <chao@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20220418024327.1628327-1-yuyufen@huawei.com>
 <cddfa7a5-8e8d-6c15-707c-8721ab6c0be8@kernel.org>
In-Reply-To: <cddfa7a5-8e8d-6c15-707c-8721ab6c0be8@kernel.org>
X-Originating-IP: [10.174.177.235]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500009.china.huawei.com (7.185.36.209)
X-CFilter-Loop: Reflected
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2022/4/19 10:10, Chao Yu wrote: > On 2022/4/18 10:43, Yufen
    Yu via Linux-f2fs-devel wrote: >> Usage: >>     dump.f2fs -I [inode nid]
    /dev/sda >> >> This feature can be useful for some bugs caus [...] 
 
 Content analysis details:   (-6.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [45.249.212.255 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
                             [45.249.212.255 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -4.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nh4kd-0008Nw-C5
Subject: Re: [f2fs-dev] [PATCH v2] dump.f2fs: add -I nid to dump inode by
 scan full disk
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
From: Yufen Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yufen Yu <yuyufen@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDIyLzQvMTkgMTA6MTAsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMi80LzE4IDEwOjQz
LCBZdWZlbiBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gVXNhZ2U6Cj4+IMKgwqDC
oMKgZHVtcC5mMmZzIC1JIFtpbm9kZSBuaWRdIC9kZXYvc2RhCj4+Cj4+IFRoaXMgZmVhdHVyZSBj
YW4gYmUgdXNlZnVsIGZvciBzb21lIGJ1Z3MgY2F1c2VkIGJ5IHN5c3RlbSBjcmFzaC4KPj4gV2Ug
bm90IG9ubHkgbmVlZCBkdW1wIGN1cnJlbnQgdmFsaWQgbm9kZSBwYWdlLCBidXQgYWxzZSB0aGUg
aGlzdG9yeQo+PiBkYXRhIGluIGRpc2ssIHdoaWNoIGNhbiBnaXZlIHNvbWUgY2x1ZXMgZm9yIHN0
YXR1cyBjaGFuZ2Ugb2YgdGhlIGlub2RlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZdWZlbiBZdSA8
eXV5dWZlbkBodWF3ZWkuY29tPgo+PiAtLS0KPj4gwqAgZnNjay9kdW1wLmPCoMKgwqDCoCB8IDI5
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIGZzY2svZnNjay5owqDCoMKgwqAg
fMKgIDEgKwo+PiDCoCBmc2NrL21haW4uY8KgwqDCoMKgIHwgMTQgKysrKysrKysrKysrKy0KPj4g
wqAgbWFuL2R1bXAuZjJmcy44IHzCoCA3ICsrKysrKysKPj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCA1
MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mc2NrL2R1
bXAuYyBiL2ZzY2svZHVtcC5jCj4+IGluZGV4IGZjZTg2YzkuLjdmZjBiMjggMTAwNjQ0Cj4+IC0t
LSBhL2ZzY2svZHVtcC5jCj4+ICsrKyBiL2ZzY2svZHVtcC5jCj4+IEBAIC01MzksNiArNTM5LDM1
IEBAIHN0YXRpYyBib29sIGlzX3NpdF9iaXRtYXBfc2V0KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwgdTMyIGJsa19hZGRyKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoY29uc3QgY2hh
ciAqKXNlLT5jdXJfdmFsaWRfbWFwKSAhPSAwOwo+PiDCoCB9Cj4+ICt2b2lkIGR1bXBfbm9kZV9z
Y2FuX2Rpc2soc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBuaWRfdCBuaWQpCj4+ICt7Cj4+ICvC
oMKgwqAgc3RydWN0IGYyZnNfbm9kZSAqbm9kZV9ibGs7Cj4+ICvCoMKgwqAgcGdvZmZfdCBibGth
ZGRyOwo+PiArwqDCoMKgIGludCByZXQ7Cj4+ICvCoMKgwqAgcGdvZmZfdCBzdGFydF9ibGthZGRy
ID0gU01fSShzYmkpLT5tYWluX2Jsa2FkZHI7Cj4+ICvCoMKgwqAgcGdvZmZfdCBlbmRfYmxrYWRk
ciA9IHN0YXJ0X2Jsa2FkZHIgKwo+PiArwqDCoMKgwqDCoMKgwqAgKFNNX0koc2JpKS0+bWFpbl9z
ZWdtZW50cyA8PCBzYmktPmxvZ19ibG9ja3NfcGVyX3NlZyk7Cj4+ICsKPj4gK8KgwqDCoCBub2Rl
X2JsayA9IGNhbGxvYyhCTE9DS19TWiwgMSk7Cj4+ICvCoMKgwqAgQVNTRVJUKG5vZGVfYmxrKTsK
Pj4gK8KgwqDCoCBNU0coMCwgIkluZm86IHNjYW4gYWxsIG5pZDogJXUgZnJvbSBibG9ja19hZGRy
IFslbHU6ICVsdV1cbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5pZCwgc3RhcnRfYmxr
YWRkciwgZW5kX2Jsa2FkZHIpOwo+PiArCj4+ICvCoMKgwqAgZm9yIChibGthZGRyID0gc3RhcnRf
YmxrYWRkcjsgYmxrYWRkciA8IGVuZF9ibGthZGRyOyBibGthZGRyKyspIHsKPiAKPiBTaG91bGRu
J3Qgd2Ugc2tpcCBkYXRhIHNlZ21lbnQ/IG90aGVyd2lzZSBpdCdzIHBvc3NpYmxlIHRvIGVuY291
bnRlciBkYXRhCj4gY29sbGlzaW9uIGluIHRyYXZlcnNlZCBkYXRhIGJsb2NrLgo+IAoKWWVhaCwg
c2tpcHBpbmcgZGF0YSBzZWdtZW50IGNhbiBiZSBtb3JlIHN0cmljdC4gQnV0LCBJIGFtIG5vdCBz
dXJlIHNlZ21lbnQgdHlwZQppcyBjb3JyZWN0IGZvciBzb21lIGludmFsaWQgc2VnbWVudHMuIFRv
IG1ha2UgdGhpbmdzIG1vcmUgZWFzeSwgSSBqdXN0IHRyYXZlcnNlIGFsbAptYWluIGJsb2NrcyBh
bmQgaWRlbnRpZnkgdGhlIHRhcmdldCBpbm9kZSBieSBjaGVja2luZyBmb290ZXIuaW5vIGFuZCBm
b290ZXIubmlkLgoKVGhhbmtzLAoKCj4gVGhhbmtzLAo+IAo+PiArwqDCoMKgwqDCoMKgwqAgcmV0
ID0gZGV2X3JlYWRfYmxvY2sobm9kZV9ibGssIGJsa2FkZHIpOwo+PiArwqDCoMKgwqDCoMKgwqAg
QVNTRVJUKHJldCA+PSAwKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChsZTMyX3RvX2NwdShub2Rl
X2Jsay0+Zm9vdGVyLmlubykgIT0gbmlkIHx8Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbGUzMl90b19jcHUobm9kZV9ibGstPmZvb3Rlci5uaWQpICE9IG5pZCkKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+ICvCoMKgwqDCoMKgwqDCoCBNU0coMCwgIklu
Zm86IG5pZDogJXUsIGJsa2FkZHI6ICVsdVxuIiwgbmlkLCBibGthZGRyKTsKPj4gK8KgwqDCoMKg
wqDCoMKgIE1TRygwLCAibm9kZV9ibGsuZm9vdGVyLmZsYWcgWzB4JXhdXG4iLCBsZTMyX3RvX2Nw
dShub2RlX2Jsay0+Zm9vdGVyLmZsYWcpKTsKPj4gK8KgwqDCoMKgwqDCoMKgIE1TRygwLCAibm9k
ZV9ibGsuZm9vdGVyLmNwX3ZlciBbJXhdXG4iLCAodTMyKShjcHZlcl9vZl9ub2RlKG5vZGVfYmxr
KSkpOwo+PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRfaW5vZGVfaW5mbyhzYmksIG5vZGVfYmxrLCAw
KTsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBmcmVlKG5vZGVfYmxrKTsKPj4gK30KPj4g
Kwo+PiDCoCBpbnQgZHVtcF9ub2RlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgbmlkX3Qgbmlk
LCBpbnQgZm9yY2UpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgbm9kZV9pbmZvIG5pOwo+
PiBkaWZmIC0tZ2l0IGEvZnNjay9mc2NrLmggYi9mc2NrL2ZzY2suaAo+PiBpbmRleCBjZTVmZmZl
Li4wYzgxOWYwIDEwMDY0NAo+PiAtLS0gYS9mc2NrL2ZzY2suaAo+PiArKysgYi9mc2NrL2ZzY2su
aAo+PiBAQCAtMjYyLDYgKzI2Miw3IEBAIHN0cnVjdCBkdW1wX29wdGlvbiB7Cj4+IMKgwqDCoMKg
wqAgaW50IHN0YXJ0X3NzYTsKPj4gwqDCoMKgwqDCoCBpbnQgZW5kX3NzYTsKPj4gwqDCoMKgwqDC
oCBpbnQzMl90IGJsa19hZGRyOwo+PiArwqDCoMKgIG5pZF90IHNjYW5fbmlkOwo+PiDCoCB9Owo+
PiDCoCBleHRlcm4gdm9pZCBuYXRfZHVtcChzdHJ1Y3QgZjJmc19zYl9pbmZvICosIG5pZF90LCBu
aWRfdCk7Cj4+IGRpZmYgLS1naXQgYS9mc2NrL21haW4uYyBiL2ZzY2svbWFpbi5jCj4+IGluZGV4
IGU0Y2ZkZjQuLmM3YWQ1YWQgMTAwNjQ0Cj4+IC0tLSBhL2ZzY2svbWFpbi5jCj4+ICsrKyBiL2Zz
Y2svbWFpbi5jCj4+IEBAIC05Myw2ICs5Myw3IEBAIHZvaWQgZHVtcF91c2FnZSgpCj4+IMKgwqDC
oMKgwqAgTVNHKDAsICJbb3B0aW9uc106XG4iKTsKPj4gwqDCoMKgwqDCoCBNU0coMCwgIsKgIC1k
IGRlYnVnIGxldmVsIFtkZWZhdWx0OjBdXG4iKTsKPj4gwqDCoMKgwqDCoCBNU0coMCwgIsKgIC1p
IGlub2RlIG5vIChoZXgpXG4iKTsKPj4gK8KgwqDCoCBNU0coMCwgIsKgIC1JIGlub2RlIG5vICho
ZXgpIHNjYW4gZnVsbCBkaXNrXG4iKTsKPj4gwqDCoMKgwqDCoCBNU0coMCwgIsKgIC1uIFtOQVQg
ZHVtcCBuaWQgZnJvbSAjMX4jMiAoZGVjaW1hbCksIGZvciBhbGwgMH4tMV1cbiIpOwo+PiDCoMKg
wqDCoMKgIE1TRygwLCAiwqAgLU0gc2hvdyBhIGJsb2NrIG1hcFxuIik7Cj4+IMKgwqDCoMKgwqAg
TVNHKDAsICLCoCAtcyBbU0lUIGR1bXAgc2Vnbm8gZnJvbSAjMX4jMiAoZGVjaW1hbCksIGZvciBh
bGwgMH4tMV1cbiIpOwo+PiBAQCAtMzgyLDcgKzM4Myw3IEBAIHZvaWQgZjJmc19wYXJzZV9vcHRp
b25zKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKg
wqDCoMKgwqAgfSBlbHNlIGlmICghc3RyY21wKCJkdW1wLmYyZnMiLCBwcm9nKSkgewo+PiDCoCAj
aWZkZWYgV0lUSF9EVU1QCj4+IC3CoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICpvcHRpb25fc3Ry
aW5nID0gImQ6aTpuOk1zOlNhOmI6ViI7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICpv
cHRpb25fc3RyaW5nID0gImQ6aTpJOm46TXM6U2E6YjpWIjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHN0YXRpYyBzdHJ1Y3QgZHVtcF9vcHRpb24gZHVtcF9vcHQgPSB7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC5uaWQgPSAwLMKgwqDCoCAvKiBkZWZhdWx0IHJvb3QgaW5vICovCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zdGFydF9uYXQgPSAtMSwKPj4gQEAgLTM5Miw2ICsz
OTMsNyBAQCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltdKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc3RhcnRfc3NhID0gLTEsCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5lbmRfc3NhID0gLTEsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC5ibGtfYWRkciA9IC0xLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2Nhbl9u
aWQgPSAwLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGMu
ZnVuYyA9IERVTVA7Cj4+IEBAIC00MjQsNiArNDI2LDE0IEBAIHZvaWQgZjJmc19wYXJzZV9vcHRp
b25zKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXQgPSBzc2NhbmYob3B0YXJnLCAiJXgiLAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZkdW1wX29w
dC5uaWQpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlICdJJzoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoc3RybmNtcChvcHRhcmcsICIweCIsIDIpKQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gc3NjYW5mKG9wdGFyZywgIiVkIiwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAm
ZHVtcF9vcHQuc2Nhbl9uaWQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVs
c2UKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHNzY2Fu
ZihvcHRhcmcsICIleCIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJmR1bXBfb3B0LnNjYW5fbmlkKTsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2Fz
ZSAnbic6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gc3NjYW5m
KG9wdGFyZywgIiVkfiVkIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmZHVtcF9vcHQuc3RhcnRfbmF0LAo+PiBAQCAtOTE2LDYg
KzkyNiw4IEBAIHN0YXRpYyB2b2lkIGRvX2R1bXAoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZHVtcF9pbmZvX2Zyb21fYmxrYWRkcihzYmksIG9wdC0+Ymxr
X2FkZHIpOwo+PiDCoMKgwqDCoMKgIGlmIChvcHQtPm5pZCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGR1bXBfbm9kZShzYmksIG9wdC0+bmlkLCAwKTsKPj4gK8KgwqDCoCBpZiAob3B0LT5zY2FuX25p
ZCkKPj4gK8KgwqDCoMKgwqDCoMKgIGR1bXBfbm9kZV9zY2FuX2Rpc2soc2JpLCBvcHQtPnNjYW5f
bmlkKTsKPj4gwqDCoMKgwqDCoCBwcmludF9jcF9zdGF0ZShmbGFnKTsKPj4gZGlmZiAtLWdpdCBh
L21hbi9kdW1wLmYyZnMuOCBiL21hbi9kdW1wLmYyZnMuOAo+PiBpbmRleCAxZGRiN2ZjLi45NGJm
NWYzIDEwMDY0NAo+PiAtLS0gYS9tYW4vZHVtcC5mMmZzLjgKPj4gKysrIGIvbWFuL2R1bXAuZjJm
cy44Cj4+IEBAIC0xMCw2ICsxMCwxMCBAQCBkdW1wLmYyZnMgXC0gcmV0cmlldmUgZGlyZWN0b3J5
IGFuZCBmaWxlIGVudHJpZXMgZnJvbSBhbiBGMkZTLWZvcm1hdGVkIGltYWdlCj4+IMKgIC5JIGlu
b2RlIG51bWJlcgo+PiDCoCBdCj4+IMKgIFsKPj4gKy5CIFwtSQo+PiArLkkgaW5vZGUgbnVtYmVy
Cj4+ICtdCj4+ICtbCj4+IMKgIC5CIFwtbgo+PiDCoCAuSSBOQVQgcmFuZ2UKPj4gwqAgXQo+PiBA
QCAtNTIsNiArNTYsOSBAQCBpcyAwIG9uIHN1Y2Nlc3MgYW5kIC0xIG9uIGZhaWx1cmUuCj4+IMKg
IC5CSSBcLWkgIiBpbm9kZSBudW1iZXIiCj4+IMKgIFNwZWNpZnkgYW4gaW5vZGUgbnVtYmVyIHRv
IGR1bXAgb3V0Lgo+PiDCoCAuVFAKPj4gKy5CSSBcLUkgIiBpbm9kZSBudW1iZXIiCj4+ICtTcGVj
aWZ5IGFuIGlub2RlIG51bWJlciBhbmQgc2NhbiBmdWxsIGRpc2sgdG8gZHVtcCBvdXQsIGluY2x1
ZGUgaGlzdG9yeSBpbm9kZSBibG9jawo+PiArLlRQCj4+IMKgIC5CSSBcLW4gIiBOQVQgcmFuZ2Ui
Cj4+IMKgIFNwZWNpZnkgYSByYW5nZSBwcmVzZW50ZWQgYnkgbmlkcyB0byBkdW1wIE5BVCBlbnRy
aWVzLgo+PiDCoCAuVFAKPiAuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

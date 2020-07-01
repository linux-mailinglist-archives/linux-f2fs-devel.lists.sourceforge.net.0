Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF1921054C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 09:48:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqXTj-0004g6-8h; Wed, 01 Jul 2020 07:48:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jqXTh-0004fz-Ve
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 07:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1/qHIZLbEIiAxHRdDfQAjsONUaAq3qM4ycjTeWgqibA=; b=WPfn/akzHjFC/JF2IWxAC5imoK
 nd96yFvHeVaC1HfBPht9v9aTiTroU58c168oGZ+qrdAyW0yHo4v746UsUmM20UZHiFugvxB1xrXOC
 dwHjEDIx0ix2XvWzHmg6uzPbs5Z0u49oQpOr7Ekzbtr4m2umDB1NAw73kzUW6tvnmjgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1/qHIZLbEIiAxHRdDfQAjsONUaAq3qM4ycjTeWgqibA=; b=bc2XX1vMFeDdd4l4sx/3kXd6pZ
 pvbTHB1QD2pGXR8A7TMr/M5Eo7pBEoTwQiqk54MxcMK97lBF5X6D7FV8GSRbczodsyk24tvyh5nsl
 VYLgjRhaWvnhk/qvGgA98EkJjg9nxBzUegv6YAJ4vlG+b/dXUDemWztUHxEvpjjaHEDw=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqXTf-006ndv-P3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 07:48:21 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CD71E9B8C42A25890AA8;
 Wed,  1 Jul 2020 15:48:04 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Jul 2020
 15:48:00 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Nathan Chancellor
 <natechancellor@gmail.com>
References: <20200624012148.180050-1-jaegeuk@kernel.org>
 <20200629150323.GA3293033@google.com> <20200629202720.GA230664@google.com>
 <20200630204348.GA2504307@ubuntu-s3-xlarge-x86>
 <20200630205635.GB1396584@google.com>
 <285a4e16-2cbc-d1e9-8464-8a06bacbaaa0@huawei.com>
Message-ID: <d496f4b9-e4fa-1366-61a9-38ee59c20e15@huawei.com>
Date: Wed, 1 Jul 2020 15:47:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <285a4e16-2cbc-d1e9-8464-8a06bacbaaa0@huawei.com>
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
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqXTf-006ndv-P3
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid readahead race condition
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC83LzEgOTo1OSwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIwLzcvMSA0OjU2LCBKYWVn
ZXVrIEtpbSB3cm90ZToKPj4gT24gMDYvMzAsIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+Pj4g
T24gTW9uLCBKdW4gMjksIDIwMjAgYXQgMDE6Mjc6MjBQTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4+Pj4gSWYgdHdvIHJlYWRhaGVhZCB0aHJlYWRzIGhhdmluZyBzYW1lIG9mZnNldCBlbnRl
ciBpbiByZWFkcGFnZXMsIGV2ZXJ5IHJlYWQKPj4+PiBJT3MgYXJlIHNwbGl0IGFuZCBpc3N1ZWQg
dG8gdGhlIGRpc2sgd2hpY2ggZ2l2aW5nIGxvd2VyIGJhbmR3aWR0aC4KPj4+Pgo+Pj4+IFRoaXMg
cGF0Y2ggdHJpZXMgdG8gYXZvaWQgcmVkdW5kYW50IHJlYWRhaGVhZCBjYWxscy4KPj4+Pgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4+Pj4gLS0t
Cj4+Pj4gdjM6Cj4+Pj4gIC0gdXNlIFJFQUR8V1JJVEVfT05DRQo+Pj4+IHYyOgo+Pj4+ICAgLSBh
ZGQgbWlzc2luZyBjb2RlIHRvIGJ5cGFzcyByZWFkCj4+Pj4gIAo+Pj4+ICBmcy9mMmZzL2RhdGEu
YyAgfCAxOCArKysrKysrKysrKysrKysrKysKPj4+PiAgZnMvZjJmcy9mMmZzLmggIHwgIDEgKwo+
Pj4+ICBmcy9mMmZzL3N1cGVyLmMgfCAgMiArKwo+Pj4+ICAzIGZpbGVzIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2Yy
ZnMvZGF0YS5jCj4+Pj4gaW5kZXggOTk1Y2Y3OGIyM2M1ZS4uMzYwYjRjOTA4MGQ5NyAxMDA2NDQK
Pj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4g
QEAgLTIyOTYsNiArMjI5Niw3IEBAIHN0YXRpYyBpbnQgZjJmc19tcGFnZV9yZWFkcGFnZXMoc3Ry
dWN0IGlub2RlICppbm9kZSwKPj4+PiAgCXVuc2lnbmVkIG5yX3BhZ2VzID0gcmFjID8gcmVhZGFo
ZWFkX2NvdW50KHJhYykgOiAxOwo+Pj4+ICAJdW5zaWduZWQgbWF4X25yX3BhZ2VzID0gbnJfcGFn
ZXM7Cj4+Pj4gIAlpbnQgcmV0ID0gMDsKPj4+PiArCWJvb2wgZHJvcF9yYSA9IGZhbHNlOwo+Pj4+
ICAKPj4+PiAgCW1hcC5tX3BibGsgPSAwOwo+Pj4+ICAJbWFwLm1fbGJsayA9IDA7Cj4+Pj4gQEAg
LTIzMDYsMTAgKzIzMDcsMjQgQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1
Y3QgaW5vZGUgKmlub2RlLAo+Pj4+ICAJbWFwLm1fc2VnX3R5cGUgPSBOT19DSEVDS19UWVBFOwo+
Pj4+ICAJbWFwLm1fbWF5X2NyZWF0ZSA9IGZhbHNlOwo+Pj4+ICAKPj4+PiArCS8qCj4+Pj4gKwkg
KiBUd28gcmVhZGFoZWFkIHRocmVhZHMgZm9yIHNhbWUgYWRkcmVzcyByYW5nZSBjYW4gY2F1c2Ug
cmFjZSBjb25kaXRpb24KPj4+PiArCSAqIHdoaWNoIGZyYWdtZW50cyBzZXF1ZW50aWFsIHJlYWQg
SU9zLiBTbyBsZXQncyBhdm9pZCBlYWNoIG90aGVyLgo+Pj4+ICsJICovCj4+Pj4gKwlpZiAocmFj
ICYmIHJlYWRhaGVhZF9jb3VudChyYWMpKSB7Cj4+Pj4gKwkJaWYgKFJFQURfT05DRShGMkZTX0ko
aW5vZGUpLT5yYV9vZmZzZXQpID09IHJlYWRhaGVhZF9pbmRleChyYWMpKQo+Pj4+ICsJCQlkcm9w
X3JhID0gdHJ1ZTsKPj4+PiArCQllbHNlCj4+Pj4gKwkJCVdSSVRFX09OQ0UoRjJGU19JKGlub2Rl
KS0+cmFfb2Zmc2V0LAo+Pj4+ICsJCQkJCQlyZWFkYWhlYWRfaW5kZXgocmFjKSk7Cj4+Pj4gKwl9
Cj4+Pj4gKwo+Pj4+ICAJZm9yICg7IG5yX3BhZ2VzOyBucl9wYWdlcy0tKSB7Cj4+Pj4gIAkJaWYg
KHJhYykgewo+Pj4+ICAJCQlwYWdlID0gcmVhZGFoZWFkX3BhZ2UocmFjKTsKPj4+PiAgCQkJcHJl
ZmV0Y2h3KCZwYWdlLT5mbGFncyk7Cj4+Pj4gKwkJCWlmIChkcm9wX3JhKQo+Pj4+ICsJCQkJZ290
byBuZXh0X3BhZ2U7Cj4+Pgo+Pj4gV2hlbiBDT05GSUdfRjJGU19GU19DT01QUkVTU0lPTiBpcyBu
b3Qgc2V0IChpLmUuIHg4Nl82NCBkZWZjb25maWcgKwo+Pj4gQ09ORklHX0YyRlNfRlM9eSk6Cj4+
Pgo+Pj4gJCBtYWtlIC1za2oiJChucHJvYykiIE89b3V0IGRpc3RjbGVhbiBkZWZjb25maWcgZnMv
ZjJmcy9kYXRhLm8KPj4+IC4uL2ZzL2YyZnMvZGF0YS5jOiBJbiBmdW5jdGlvbiDigJhmMmZzX21w
YWdlX3JlYWRwYWdlc+KAmToKPj4+IC4uL2ZzL2YyZnMvZGF0YS5jOjIzMjc6NTogZXJyb3I6IGxh
YmVsIOKAmG5leHRfcGFnZeKAmSB1c2VkIGJ1dCBub3QgZGVmaW5lZAo+Pj4gIDIzMjcgfCAgICAg
Z290byBuZXh0X3BhZ2U7Cj4+PiAgICAgICB8ICAgICBefn5+Cj4+PiAuLi4KPj4KPj4gVGhhbmtz
LiBJIHB1c2hlZCB0aGUgZml4IGZvciAtbmV4dC4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtZjJmcy1kZXZlbC8xYmUxODM5Ny03ZmM2LTcwM2UtMTIxYi1lMjEwZTEwMTM1N2ZAaW5m
cmFkZWFkLm9yZy9ULyN0CgpJdCB3aWxsIGhhbmcgdGhlIGtlcm5lbCBiZWNhdXNlIHdlIG1pc3Nl
ZCB0byB1bmxvY2sgdGhvc2UgY2FjaGVkIHBhZ2VzLApJIGNoYW5nZWQgdG8gJ2dvdG8gc2V0X2Vy
cm9yX3BhZ2UnLCB0aGUgaXNzdWUgd2FzIGdvbmUuCgpUaGFua3MsCgo+IAo+IFJldmlld2VkLWJ5
OiBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+Cj4gCj4gVGhhbmtzLAo+IAo+Pgo+PiBUaGFu
a3MsCj4+Cj4+Pgo+Pj4gQ2hlZXJzLAo+Pj4gTmF0aGFuCj4+Pgo+Pj4KPj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdAo+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pgo+IAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==

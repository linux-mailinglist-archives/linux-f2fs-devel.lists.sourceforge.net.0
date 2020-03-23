Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B606C18ED97
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 02:15:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGBh4-0001hp-0X; Mon, 23 Mar 2020 01:15:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGBh1-0001hc-RC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 01:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rR5apMUQEGlPoG7yU/zbq+LO60gsXTjpffYwxxSbhms=; b=k1j3djigd/6RGrVz7SpBgYFAgx
 eDx5An1gdXiBYOKJQw/3Qdp4vuyT6IfWZ6NHdUDCZF2KUPrZYOJMdSODN37Obwj4mcX4uo4h95pAB
 YeZ1GDCX1zkEkaQqnxwQQfoFwwYe+3in7tHmYU7GY9Ctk63/9SyYOGVlv5CH3JSwpMUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rR5apMUQEGlPoG7yU/zbq+LO60gsXTjpffYwxxSbhms=; b=iFOdqCHAB1uv5X26zJNPxn7vGe
 6YAbI/Wsv+o3ftPo0lJYc1K8Cy+O3d0xl3vfecvTi7hsLAv2DwJe/kiY6GtlwDhFCX3m03kEP+2Lp
 XDxF/mZ3PK/a7//QRrUva3zjL2KBDxj2k95nq/bcJM0KUHYDOlMKagfIROAzmrYJlf5g=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGBgy-000MeT-2O
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 01:15:51 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0FC0C8D054AAEDF270BF;
 Mon, 23 Mar 2020 09:15:41 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 23 Mar
 2020 09:15:40 +0800
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>, Chao Yu <chao@kernel.org>,
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-kernel@vger.kernel.org>
References: <20200322101327.5979-1-chao@kernel.org>
 <20200322121434.i2jea6o5tzanip7z@core.my.home>
 <47c71fe9-e168-8080-d0ed-2cfaa9a77e5e@kernel.org>
 <20200322153014.czpca7ozhfy4ctdh@core.my.home>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <70f992f5-54f7-bd09-2b27-f418da51341e@huawei.com>
Date: Mon, 23 Mar 2020 09:15:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200322153014.czpca7ozhfy4ctdh@core.my.home>
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
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jGBgy-000MeT-2O
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix potential .flags overflow on 32bit
 architecture
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC8zLzIyIDIzOjMwLCBPbmTFmWVqIEppcm1hbiB3cm90ZToKPiBPbiBTdW4sIE1hciAy
MiwgMjAyMCBhdCAwOToxODo1NlBNICswODAwLCBDaGFvIFl1IHdyb3RlOgo+PiBIaSwKPj4KPj4g
T24gMjAyMC0zLTIyIDIwOjE0LCBPbmTFmWVqIEppcm1hbiB3cm90ZToKPj4+IEhlbGxvLAo+Pj4K
Pj4+IE9uIFN1biwgTWFyIDIyLCAyMDIwIGF0IDA2OjEzOjI3UE0gKzA4MDAsIENoYW8gWXUgd3Jv
dGU6Cj4+Pj4gRnJvbTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgo+Pj4+Cj4+Pj4gZjJm
c19pbm9kZV9pbmZvLmZsYWdzIGlzIHVuc2lnbmVkIGxvbmcgdmFyaWFibGUsIGl0IGhhcyAzMiBi
aXRzCj4+Pj4gaW4gMzJiaXQgYXJjaGl0ZWN0dXJlLCBzaW5jZSB3ZSBpbnRyb2R1Y2VkIEZJX01N
QVBfRklMRSBmbGFnCj4+Pj4gd2hlbiB3ZSBzdXBwb3J0IGRhdGEgY29tcHJlc3Npb24sIHdlIG1h
eSBhY2Nlc3MgbWVtb3J5IGNyb3NzCj4+Pj4gdGhlIGJvcmRlciBvZiAuZmxhZ3MgZmllbGQsIGNv
cnJ1cHRpbmcgLmlfc2VtIGZpZWxkLCByZXN1bHQgaW4KPj4+PiBiZWxvdyBkZWFkbG9jay4KPj4+
Pgo+Pj4+IFRvIGZpeCB0aGlzIGlzc3VlLCBsZXQncyBpbnRyb2R1Y2UgLmV4dHJhX2ZsYWdzIHRv
IGdyYWIgZXh0cmEKPj4+PiBzcGFjZSB0byBzdG9yZSB0aG9zZSBuZXcgZmxhZ3MuCj4+Pj4KPj4+
PiBDYWxsIFRyYWNlOgo+Pj4+ICBfX3NjaGVkdWxlKzB4OGQwLzB4MTNmYwo+Pj4+ICA/IG1hcmtf
aGVsZF9sb2NrcysweGFjLzB4MTAwCj4+Pj4gIHNjaGVkdWxlKzB4Y2MvMHgyNjAKPj4+PiAgcndz
ZW1fZG93bl93cml0ZV9zbG93cGF0aCsweDNhYi8weDY1ZAo+Pj4+ICBkb3duX3dyaXRlKzB4Yzcv
MHhlMAo+Pj4+ICBmMmZzX2Ryb3BfbmxpbmsrMHgzZC8weDYwMCBbZjJmc10KPj4+PiAgZjJmc19k
ZWxldGVfaW5saW5lX2VudHJ5KzB4MzAwLzB4NDQwIFtmMmZzXQo+Pj4+ICBmMmZzX2RlbGV0ZV9l
bnRyeSsweDNhMS8weDdmMCBbZjJmc10KPj4+PiAgZjJmc191bmxpbmsrMHg1MDAvMHg3OTAgW2Yy
ZnNdCj4+Pj4gIHZmc191bmxpbmsrMHgyMTEvMHg0OTAKPj4+PiAgZG9fdW5saW5rYXQrMHg0ODMv
MHg1MjAKPj4+PiAgc3lzX3VubGluaysweDRhLzB4NzAKPj4+PiAgZG9fZmFzdF9zeXNjYWxsXzMy
KzB4MTJiLzB4NjgzCj4+Pj4gIGVudHJ5X1NZU0VOVEVSXzMyKzB4YWEvMHgxMDIKPj4+Pgo+Pj4+
IEZpeGVzOiA0YzhmZjcwOTViZWYgKCJmMmZzOiBzdXBwb3J0IGRhdGEgY29tcHJlc3Npb24iKQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4KPj4+PiAtLS0K
Pj4+PiAgZnMvZjJmcy9mMmZzLmggIHwgMjYgKysrKysrKysrKysrKysrKysrKystLS0tLS0KPj4+
PiAgZnMvZjJmcy9pbm9kZS5jIHwgIDEgKwo+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9m
MmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4+IGluZGV4IGZjYWZhNjgyMTJlYi4uZmNkMjJkZjJl
OWNhIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+Pj4gKysrIGIvZnMvZjJmcy9m
MmZzLmgKPj4+PiBAQCAtNjk1LDYgKzY5NSw3IEBAIHN0cnVjdCBmMmZzX2lub2RlX2luZm8gewo+
Pj4+Cj4+Pj4gIAkvKiBVc2UgYmVsb3cgaW50ZXJuYWxseSBpbiBmMmZzKi8KPj4+PiAgCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7CQkvKiB1c2UgdG8gcGFzcyBwZXItZmlsZSBmbGFncyAqLwo+Pj4+ICsJ
dW5zaWduZWQgbG9uZyBleHRyYV9mbGFnczsJLyogZXh0cmEgZmxhZ3MgKi8KPj4+PiAgCXN0cnVj
dCByd19zZW1hcGhvcmUgaV9zZW07CS8qIHByb3RlY3QgZmkgaW5mbyAqLwo+Pj4+ICAJYXRvbWlj
X3QgZGlydHlfcGFnZXM7CQkvKiAjIG9mIGRpcnR5IHBhZ2VzICovCj4+Pj4gIAlmMmZzX2hhc2hf
dCBjaGFzaDsJCS8qIGhhc2ggdmFsdWUgb2YgZ2l2ZW4gZmlsZSBuYW1lICovCj4+Pj4gQEAgLTI1
NjksNyArMjU3MCw3IEBAIGVudW0gewo+Pj4+ICB9Owo+Pj4+Cj4+Pj4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBfX21hcmtfaW5vZGVfZGlydHlfZmxhZyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4+IC0J
CQkJCQlpbnQgZmxhZywgYm9vbCBzZXQpCj4+Pj4gKwkJCQkJdW5zaWduZWQgbG9uZyBsb25nIGZs
YWcsIGJvb2wgc2V0KQo+Pj4+ICB7Cj4+Pj4gIAlzd2l0Y2ggKGZsYWcpIHsKPj4+PiAgCWNhc2Ug
RklfSU5MSU5FX1hBVFRSOgo+Pj4+IEBAIC0yNTg4LDIwICsyNTg5LDMzIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBfX21hcmtfaW5vZGVfZGlydHlfZmxhZyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4+
Cj4+Pj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfaW5vZGVfZmxhZyhzdHJ1Y3QgaW5vZGUgKmlu
b2RlLCBpbnQgZmxhZykKPj4+PiAgewo+Pj4+IC0JaWYgKCF0ZXN0X2JpdChmbGFnLCAmRjJGU19J
KGlub2RlKS0+ZmxhZ3MpKQo+Pj4+IC0JCXNldF9iaXQoZmxhZywgJkYyRlNfSShpbm9kZSktPmZs
YWdzKTsKPj4+PiArCWlmICgoMSA8PCBmbGFnKSA8PSBzaXplb2YodW5zaWduZWQgbG9uZykpIHsK
Pj4+Cj4+PiBeIHRoaXMgaXMgd3JvbmcuIE1heWJlIHlvdSBtZWFudCBmbGFnIDw9IEJJVFNfUEVS
X0xPTkcKPj4KPj4gT2gsIG15IGJhZCwgSSBtZWFudCB0aGF0LCB0aGFua3MgZm9yIHBvaW50aW5n
IG91dCB0aGlzLiA6KQo+Pgo+Pj4KPj4+IEFuZCBkaXR0byBmb3IgdGhlIHNhbWUgY2hlY2tzIGJl
bG93LiBNYXliZSB5b3UgY2FuIG1ha2UgZmxhZ3MgYW4gYXJyYXkgb2YKPj4+IEJJVF9XT1JEKG1h
eF9mbGFnX3ZhbHVlKSArIDEgYW5kIHNraXAgdGhlIGJyYW5jaGVzIGFsdG9nZXRoZXI/Cj4gCj4g
SSd2ZSBmb3VuZCBtYXliZSBhIGNsZWFyZXIgbWFjcm8gZm9yIHRoaXM6IAo+IAo+ICAgaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9pbmNsdWRlL2xpbnV4L2Jp
dG9wcy5oI0wxNQo+IAo+ICAgQklUU19UT19MT05HUyhucikKCk1vcmUgY2xlYW4sIHRoYW5rcywg
d2lsbCBzZW5kIHYzIHNvb24uCgpUaGFua3MsCgo+IAo+IEJ1dCBpdCB0YWtlcyB0aGUgbnVtYmVy
IG9mIGJpdHMgaW4gdGhlIGJpdG1hcCwgd2hpY2ggd291bGQgYmUgCj4gIm1heF9mbGFnX3ZhbHVl
ICsgMSIuCj4gCj4gcmVnYXJkcywKPiAJby4KPiAKPj4gVGhhdCB3aWxsIGJlIGJldHRlciwgbGV0
IG1lIHJldmlzZSB0aGlzIHBhdGNoLgo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gdGhhbmsgeW91
IGFuZCByZWdhcmRzLAo+Pj4gCW8uCj4+Pgo+Pj4+ICsJCWlmICghdGVzdF9iaXQoZmxhZywgJkYy
RlNfSShpbm9kZSktPmZsYWdzKSkKPj4+PiArCQkJc2V0X2JpdChmbGFnLCAmRjJGU19JKGlub2Rl
KS0+ZmxhZ3MpOwo+Pj4+ICsJfSBlbHNlIHsKPj4+PiArCQlpZiAoIXRlc3RfYml0KGZsYWcgLSAz
MiwgJkYyRlNfSShpbm9kZSktPmV4dHJhX2ZsYWdzKSkKPj4+PiArCQkJc2V0X2JpdChmbGFnIC0g
MzIsICZGMkZTX0koaW5vZGUpLT5leHRyYV9mbGFncyk7Cj4+Pj4gKwl9Cj4+Pj4gIAlfX21hcmtf
aW5vZGVfZGlydHlfZmxhZyhpbm9kZSwgZmxhZywgdHJ1ZSk7Cj4+Pj4gIH0KPj4+Pgo+Pj4+ICBz
dGF0aWMgaW5saW5lIGludCBpc19pbm9kZV9mbGFnX3NldChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBp
bnQgZmxhZykKPj4+PiAgewo+Pj4+IC0JcmV0dXJuIHRlc3RfYml0KGZsYWcsICZGMkZTX0koaW5v
ZGUpLT5mbGFncyk7Cj4+Pj4gKwlpZiAoKDEgPDwgZmxhZykgPD0gc2l6ZW9mKHVuc2lnbmVkIGxv
bmcpKQo+Pj4+ICsJCXJldHVybiB0ZXN0X2JpdChmbGFnLCAmRjJGU19JKGlub2RlKS0+ZmxhZ3Mp
Owo+Pj4+ICsJZWxzZQo+Pj4+ICsJCXJldHVybiB0ZXN0X2JpdChmbGFnIC0gMzIsICZGMkZTX0ko
aW5vZGUpLT5leHRyYV9mbGFncyk7Cj4+Pj4gIH0KPj4+Pgo+Pj4+ICBzdGF0aWMgaW5saW5lIHZv
aWQgY2xlYXJfaW5vZGVfZmxhZyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBpbnQgZmxhZykKPj4+PiAg
ewo+Pj4+IC0JaWYgKHRlc3RfYml0KGZsYWcsICZGMkZTX0koaW5vZGUpLT5mbGFncykpCj4+Pj4g
LQkJY2xlYXJfYml0KGZsYWcsICZGMkZTX0koaW5vZGUpLT5mbGFncyk7Cj4+Pj4gKwlpZiAoKDEg
PDwgZmxhZykgPD0gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKSB7Cj4+Pj4gKwkJaWYgKHRlc3RfYml0
KGZsYWcsICZGMkZTX0koaW5vZGUpLT5mbGFncykpCj4+Pj4gKwkJCWNsZWFyX2JpdChmbGFnLCAm
RjJGU19JKGlub2RlKS0+ZmxhZ3MpOwo+Pj4+ICsJfSBlbHNlIHsKPj4+PiArCQlpZiAodGVzdF9i
aXQoZmxhZyAtIDMyLCAmRjJGU19JKGlub2RlKS0+ZXh0cmFfZmxhZ3MpKQo+Pj4+ICsJCQljbGVh
cl9iaXQoZmxhZyAtIDMyLCAmRjJGU19JKGlub2RlKS0+ZXh0cmFfZmxhZ3MpOwo+Pj4+ICsJfQo+
Pj4+ICAJX19tYXJrX2lub2RlX2RpcnR5X2ZsYWcoaW5vZGUsIGZsYWcsIGZhbHNlKTsKPj4+PiAg
fQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBiL2ZzL2YyZnMvaW5vZGUu
Ywo+Pj4+IGluZGV4IDQ0ZTA4YmYyZTJiNC4uY2E5MjRkN2UwZTMwIDEwMDY0NAo+Pj4+IC0tLSBh
L2ZzL2YyZnMvaW5vZGUuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvaW5vZGUuYwo+Pj4+IEBAIC0zNjMs
NiArMzYzLDcgQEAgc3RhdGljIGludCBkb19yZWFkX2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUp
Cj4+Pj4gIAlpZiAoU19JU1JFRyhpbm9kZS0+aV9tb2RlKSkKPj4+PiAgCQlmaS0+aV9mbGFncyAm
PSB+RjJGU19QUk9KSU5IRVJJVF9GTDsKPj4+PiAgCWZpLT5mbGFncyA9IDA7Cj4+Pj4gKwlmaS0+
ZXh0cmFfZmxhZ3MgPSAwOwo+Pj4+ICAJZmktPmlfYWR2aXNlID0gcmktPmlfYWR2aXNlOwo+Pj4+
ICAJZmktPmlfcGlubyA9IGxlMzJfdG9fY3B1KHJpLT5pX3Bpbm8pOwo+Pj4+ICAJZmktPmlfZGly
X2xldmVsID0gcmktPmlfZGlyX2xldmVsOwo+Pj4+IC0tCj4+Pj4gMi4yMi4wCj4+Pj4KPiAuCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=

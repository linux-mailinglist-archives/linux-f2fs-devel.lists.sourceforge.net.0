Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC2220607
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 09:18:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvbgB-0000QQ-JX; Wed, 15 Jul 2020 07:18:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jvbg9-0000QJ-VQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 07:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CxyBXV9tx9AopFVWdN1zZwcBLTItJwrj1AowyYDircM=; b=bQ2VIQYrClN9elvFHf7wi/yp9m
 jZTwBNtzkcIrYIU/TxLuDFYS1XQImOfZk8GcLDTrX35d/sAqpGyjftwi7doLUj4rGy6znXtmvXf47
 iSz9E0EfuSTlgQXtKhS8IQ1qppO5Gj1NH4gQOe+CwujQJRYB5c+cShM9OpgFq41scD+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CxyBXV9tx9AopFVWdN1zZwcBLTItJwrj1AowyYDircM=; b=cllZvEhhr96dr11vmDlf3Xn8Cl
 US/85MmWJlo1yUbAWhAc7ihThwBX3d+cEjNJViZ5RmOawQd9fQnDtd9mMA20NcBeBE6Z6qQ6c6C+U
 skiAoCTWgQ8IbSpgLxIf9pymE+Q93XKkSlVpuNaSh9EOASyuPTE2B6+cdCZULd/t8xtA=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvbg6-001AIw-5C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 07:18:09 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 84F2680F8F7CE1B10C0B;
 Wed, 15 Jul 2020 15:17:56 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 15 Jul
 2020 15:17:55 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200713031252.3873546-1-daeho43@gmail.com>
 <20200713181152.GC2910046@google.com>
 <3b02263d-a5e1-136c-40ed-514d34e4c895@huawei.com>
 <CACOAw_wBD_ourGJSdRTDM-wzeH97aGE966QDB6bpjiyXRrh47A@mail.gmail.com>
 <f4a594a1-464f-3a74-90cb-fd536bed9962@huawei.com>
 <CACOAw_w3OWDVXSYHuTEEVv1HaBZir1CWcRAmxOt00MB4vXBKVg@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1d84bc01-fece-df55-6e33-07a705cfb432@huawei.com>
Date: Wed, 15 Jul 2020 15:17:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_w3OWDVXSYHuTEEVv1HaBZir1CWcRAmxOt00MB4vXBKVg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
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
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvbg6-001AIw-5C
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

T24gMjAyMC83LzE1IDE0OjU0LCBEYWVobyBKZW9uZyB3cm90ZToKPiBZb3UgbWVhbiB3ZSBjYW4g
c3VwcG9ydCBaRVJPT1VUIG9wdGlvbiBvbmx5IGZvciBlbmNyeXB0ZWQgZmlsZXMgb2YKPiBub24t
bXVsdGlkZXZpY2UgZjJmcywKPiBhbmQgcmV0dXJuIC1FT1BOT1RTVVBQIGluIHRoZSBtdWx0aWRl
dmljZSBjYXNlLCByaWdodCBub3c/CgpZZXMsIHNvbWV0aGluZyBsaWtlOgoKZjJmc19zZWNfdHJp
bV9maWxlKCkKCmlmICgocmFuZ2UuZmxhZ3MgJiBGMkZTX1RSSU1fRklMRV9aRVJPT1VUKSAmJgoJ
ZjJmc19lbmNyeXB0ZWRfZmlsZSgpICYmIGYyZnNfaXNfbXVsdGlfZGV2aWNlKCkpCglyZXR1cm4g
LUVPUE5PVFNVUFA7CgoKZjJmc19zZWN1cmVfZXJhc2UoKQoKaWYgKCFyZXQgJiYgKGZsYWdzICYg
RjJGU19UUklNX0ZJTEVfWkVST09VVCkpIHsKCWlmIChmMmZzX2VuY3J5cHRlZF9maWxlKCkpIHsK
CQlpZiAoZnNjcnlwdF9pbm9kZV91c2VzX2ZzX2xheWVyX2NyeXB0bykKCQkJcmV0ID0gZnNjcnlw
dF96ZXJvb3V0X3JhbmdlKCk7CgkJZWxzZQoJCQlyZXQgPSBmc2NyeXB0X3plcm9vdXRfcmFuZ2Vf
aW5saW5lX2NyeXB0KCk7Cgl9IGVsc2UgewoJCXJldCA9IGJsa2Rldl9pc3N1ZV96ZXJvb3V0KCk7
Cgl9Cn0KClRoYW5rcywKCj4gCj4gMjAyMOuFhCA37JuUIDE17J28ICjsiJgpIOyYpO2bhCAzOjE3
LCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyEsToKPj4KPj4gT24gMjAy
MC83LzE1IDEyOjA2LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+IFdlIGNvdWxkIHVzZSBmc2NyeXB0
X3plcm9vdXRfcmFuZ2UoKSBmb3IgYW4gZW5jcnlwdGVkIGZpbGUuCj4+PiBCdXQsIG9uZSBwcm9i
bGVtIGlzIGZzY3J5cHRfemVyb291dF9yYW5nZSgpIGFzc3VtZXMgdGhhdCBmaWxlc3lzdGVtcwo+
Pj4gb25seSB1c2UgYSBzaW5nbGUgYmxvY2sgZGV2aWNlLgo+Pj4gSXQgbWVhbnMgaXQgZG9lc24n
dCByZWNlaXZlIGJkZXYgYXMgYSBwYXJhbWV0ZXIuCj4+PiBIb3cgYWJvdXQgY2hhbmdpbmcgdGhl
IGludGVyZmFjZSBvZiBmc2NyeXB0X3plcm9vdXRfcmFuZ2UoKSBmaXJzdCBhbmQgdXNpbmcgaXQ/
Cj4+Cj4+IFllcywgcGxlYXNlIGxpbWl0ZWQgdG8gdXNlIGZzY3J5cHRfemVyb291dF9yYW5nZSgp
IG9uIG5vbi1tdWx0aWRldmljZSBmMmZzIGltYWdlCj4+IGZpcnN0LCB3ZSBjYW4gYWRkIGEgY29u
ZGl0aW9uIHRvIGNoZWNrIHRoYXQgaW4gdGhlIGJlZ2lubmluZyBvZiBpb2N0bCBpbnRlcmZhY2Us
Cj4+IG9uY2UgZnNjcnlwdF96ZXJvb3V0X3JhbmdlKCkgYWNjZXB0cyBiZGV2IGFzIHBhcmFtZXRl
ciwgd2UgY2FuIHJlbW92ZSB0aGF0IGxpbWl0YXRpb24uCj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+
PiAyMDIw64WEIDfsm5QgMTTsnbwgKO2ZlCkg7Jik7ZuEIDk6MzYsIENoYW8gWXUgPHl1Y2hhbzBA
aHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISxOgo+Pj4+Cj4+Pj4gT24gMjAyMC83LzE0IDI6MTEsIEph
ZWdldWsgS2ltIHdyb3RlOgo+Pj4+PiBIaSBEYWVobywKPj4+Pj4KPj4+Pj4gUGxlYXNlIHRha2Ug
YSBsb29rIGF0IHRoaXMuCj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy5naXQvY29tbWl0Lz9oPWRldiZpZD0zNTI0
NTE4MDQ1OWFlYmY2ZDcwZmRlODhhNTM4ZjA0MDBhNzk0YWE2Cj4+Pj4KPj4+PiBJJ20gY3VyaW91
cyBhYm91dCB3aGF0IHdpbGwgaGFwcGVuIGlmIHdlIGNhbGwKPj4+PiBzZWNfdHJpbV9maWxlKEYy
RlNfVFJJTV9GSUxFX1pFUk9PVVQpIG9uIGFuIGVuY3J5cHRlZCBmaWxlLCB3aWxsCj4+Pj4gaXQg
dXNlIHplcm8gYml0cyBjb3ZlcmluZyBlbmNyeXB0ZWQgZGF0YSBvbiBkaXNrPwo+Pj4+Cj4+Pj4g
VGhhbmtzLAo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywKPj4+Pj4KPj4+Pj4gT24gMDcvMTMsIERh
ZWhvIEplb25nIHdyb3RlOgo+Pj4+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29v
Z2xlLmNvbT4KPj4+Pj4+Cj4+Pj4+PiBDaGFuZ2VkIHRoZSB3YXkgb2YgaGFuZGxpbmcgcmFuZ2Uu
bGVuIG9mIEYyRlNfSU9DX1NFQ19UUklNX0ZJTEUuCj4+Pj4+PiAgMS4gQWRkZWQgLTEgdmFsdWUg
c3VwcG9ydCBmb3IgcmFuZ2UubGVuIHRvIHNlY3VyZSB0cmltIHRoZSB3aG9sZSBibG9ja3MKPj4+
Pj4+ICAgICBzdGFydGluZyBmcm9tIHJhbmdlLnN0YXJ0IHJlZ2FyZGxlc3Mgb2YgaV9zaXplLgo+
Pj4+Pj4gIDIuIElmIHRoZSBlbmQgb2YgdGhlIHJhbmdlIHBhc3NlcyBvdmVyIHRoZSBlbmQgb2Yg
ZmlsZSwgaXQgbWVhbnMgdW50aWwKPj4+Pj4+ICAgICB0aGUgZW5kIG9mIGZpbGUgKGlfc2l6ZSku
Cj4+Pj4+PiAgMy4gaWdub3JlZCB0aGUgY2FzZSBvZiB0aGF0IHJhbmdlLmxlbiBpcyB6ZXJvIHRv
IHByZXZlbnQgdGhlIGZ1bmN0aW9uCj4+Pj4+PiAgICAgZnJvbSBtYWtpbmcgZW5kX2FkZHIgemVy
byBhbmQgdHJpZ2dlcmluZyBkaWZmZXJlbnQgYmVoYXZpb3VyIG9mCj4+Pj4+PiAgICAgdGhlIGZ1
bmN0aW9uLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2pl
b25nQGdvb2dsZS5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+IENoYW5nZXMgaW4gdjI6Cj4+Pj4+PiAg
LSBDaGFuZ2VkIC0xIHJhbmdlLmxlbiBvcHRpb24gdG8gbWVhbiB0aGUgd2hvbGUgYmxvY2tzIHN0
YXJ0aW5nIGZyb20KPj4+Pj4+ICAgIHJhbmdlLnN0YXJ0IHJlZ2FyZGxlc3Mgb2YgaV9zaXplCj4+
Pj4+PiAtLS0KPj4+Pj4+ICBmcy9mMmZzL2ZpbGUuYyB8IDIzICsrKysrKysrKysrKy0tLS0tLS0t
LS0tCj4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMv
ZmlsZS5jCj4+Pj4+PiBpbmRleCAzNjhjODBmOGUyYTEuLjI0ODU4NDFlM2IyZCAxMDA2NDQKPj4+
Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+
Pj4gQEAgLTM3OTIsNyArMzc5Miw3IEBAIHN0YXRpYyBpbnQgZjJmc19zZWNfdHJpbV9maWxlKHN0
cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPj4+Pj4+ICAgICAgcGdvZmZfdCBp
bmRleCwgcGdfZW5kOwo+Pj4+Pj4gICAgICBibG9ja190IHByZXZfYmxvY2sgPSAwLCBsZW4gPSAw
Owo+Pj4+Pj4gICAgICBsb2ZmX3QgZW5kX2FkZHI7Cj4+Pj4+PiAtICAgIGJvb2wgdG9fZW5kOwo+
Pj4+Pj4gKyAgICBib29sIHRvX2VuZCA9IGZhbHNlOwo+Pj4+Pj4gICAgICBpbnQgcmV0ID0gMDsK
Pj4+Pj4+Cj4+Pj4+PiAgICAgIGlmICghKGZpbHAtPmZfbW9kZSAmIEZNT0RFX1dSSVRFKSkKPj4+
Pj4+IEBAIC0zODEzLDIzICszODEzLDIzIEBAIHN0YXRpYyBpbnQgZjJmc19zZWNfdHJpbV9maWxl
KHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPj4+Pj4+ICAgICAgZmlsZV9z
dGFydF93cml0ZShmaWxwKTsKPj4+Pj4+ICAgICAgaW5vZGVfbG9jayhpbm9kZSk7Cj4+Pj4+Pgo+
Pj4+Pj4gLSAgICBpZiAoZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkgfHwgZjJmc19jb21wcmVz
c2VkX2ZpbGUoaW5vZGUpKSB7Cj4+Pj4+PiArICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlu
b2RlKSB8fCBmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkgfHwKPj4+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgIHJhbmdlLnN0YXJ0ID49IGlub2RlLT5pX3NpemUpIHsKPj4+Pj4+ICAgICAgICAg
ICAgICByZXQgPSAtRUlOVkFMOwo+Pj4+Pj4gICAgICAgICAgICAgIGdvdG8gZXJyOwo+Pj4+Pj4g
ICAgICB9Cj4+Pj4+Pgo+Pj4+Pj4gLSAgICBpZiAocmFuZ2Uuc3RhcnQgPj0gaW5vZGUtPmlfc2l6
ZSkgewo+Pj4+Pj4gLSAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4+Pj4+PiArICAgIGlmIChy
YW5nZS5sZW4gPT0gMCkKPj4+Pj4+ICAgICAgICAgICAgICBnb3RvIGVycjsKPj4+Pj4+IC0gICAg
fQo+Pj4+Pj4KPj4+Pj4+IC0gICAgaWYgKGlub2RlLT5pX3NpemUgLSByYW5nZS5zdGFydCA8IHJh
bmdlLmxlbikgewo+Pj4+Pj4gLSAgICAgICAgICAgIHJldCA9IC1FMkJJRzsKPj4+Pj4+IC0gICAg
ICAgICAgICBnb3RvIGVycjsKPj4+Pj4+ICsgICAgaWYgKGlub2RlLT5pX3NpemUgLSByYW5nZS5z
dGFydCA+IHJhbmdlLmxlbikgewo+Pj4+Pj4gKyAgICAgICAgICAgIGVuZF9hZGRyID0gcmFuZ2Uu
c3RhcnQgKyByYW5nZS5sZW47Cj4+Pj4+PiArICAgIH0gZWxzZSB7Cj4+Pj4+PiArICAgICAgICAg
ICAgZW5kX2FkZHIgPSByYW5nZS5sZW4gPT0gKHU2NCktMSA/Cj4+Pj4+PiArICAgICAgICAgICAg
ICAgICAgICBzYmktPnNiLT5zX21heGJ5dGVzIDogaW5vZGUtPmlfc2l6ZTsKPj4+Pj4+ICsgICAg
ICAgICAgICB0b19lbmQgPSB0cnVlOwo+Pj4+Pj4gICAgICB9Cj4+Pj4+PiAtICAgIGVuZF9hZGRy
ID0gcmFuZ2Uuc3RhcnQgKyByYW5nZS5sZW47Cj4+Pj4+Pgo+Pj4+Pj4gLSAgICB0b19lbmQgPSAo
ZW5kX2FkZHIgPT0gaW5vZGUtPmlfc2l6ZSk7Cj4+Pj4+PiAgICAgIGlmICghSVNfQUxJR05FRChy
YW5nZS5zdGFydCwgRjJGU19CTEtTSVpFKSB8fAo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
KCF0b19lbmQgJiYgIUlTX0FMSUdORUQoZW5kX2FkZHIsIEYyRlNfQkxLU0laRSkpKSB7Cj4+Pj4+
PiAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPj4+Pj4+IEBAIC0zODQ2LDcgKzM4NDYsOCBA
QCBzdGF0aWMgaW50IGYyZnNfc2VjX3RyaW1fZmlsZShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWdu
ZWQgbG9uZyBhcmcpCj4+Pj4+PiAgICAgIGRvd25fd3JpdGUoJkYyRlNfSShpbm9kZSktPmlfZ2Nf
cndzZW1bV1JJVEVdKTsKPj4+Pj4+ICAgICAgZG93bl93cml0ZSgmRjJGU19JKGlub2RlKS0+aV9t
bWFwX3NlbSk7Cj4+Pj4+Pgo+Pj4+Pj4gLSAgICByZXQgPSBmaWxlbWFwX3dyaXRlX2FuZF93YWl0
X3JhbmdlKG1hcHBpbmcsIHJhbmdlLnN0YXJ0LCBlbmRfYWRkciAtIDEpOwo+Pj4+Pj4gKyAgICBy
ZXQgPSBmaWxlbWFwX3dyaXRlX2FuZF93YWl0X3JhbmdlKG1hcHBpbmcsIHJhbmdlLnN0YXJ0LAo+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgdG9fZW5kID8gTExPTkdfTUFYIDogZW5kX2FkZHIg
LSAxKTsKPj4+Pj4+ICAgICAgaWYgKHJldCkKPj4+Pj4+ICAgICAgICAgICAgICBnb3RvIG91dDsK
Pj4+Pj4+Cj4+Pj4+PiAtLQo+Pj4+Pj4gMi4yNy4wLjM4My5nMDUwMzE5YzJhZS1nb29nCj4+Pj4+
Cj4+Pj4+Cj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+IExpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4+Pj4gLgo+Pj4+Pgo+Pj4g
Lgo+Pj4KPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=

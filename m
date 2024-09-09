Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D551970B2D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2024 03:25:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snT97-0005TK-DP;
	Mon, 09 Sep 2024 01:24:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1snT95-0005TD-BP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 01:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1TZlj59FHOExmJRJBEZgUSyVaQfW6Wn85eGM71X6+Hg=; b=APOHZVaI+w/z2i3OzOsU/Tl3FF
 0EhMDdn8w/WfgtYFnMhIOSYQBaOU5253Z6gBeyd988HWSChA86J981Yx1IdKsrtNSN8afVawUowqs
 Uo3PqzD7FNKcHGpdS/ux5p0yix7/v5TkquwcVu2v9HE87xmRuMkt3eR6CYYLHvJVVWAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1TZlj59FHOExmJRJBEZgUSyVaQfW6Wn85eGM71X6+Hg=; b=klLfpJyk6xQqvBb1MQcfq37kAX
 aks5z6r8EeuA5JmQaz6766SJKWuTbkmHk2p6vU4fJnaHJ98dtbN1HEF4HzK6RzivIXNmooSL7KeQn
 B7SjAbg6VLQR6Of6tZODuhr61RtklWLbh5MJDGzozwuhwum2mUIY785+ajeSCk9amE1M=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1snT95-0000Mt-3r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 01:24:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D59F0A40532;
 Mon,  9 Sep 2024 01:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B472FC4CEC3;
 Mon,  9 Sep 2024 01:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725845076;
 bh=YKZhEHCGlF9dx65kfivouqFr+WTDDU0a6y9vWlyBKak=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ElRQWZXuugvLvlzhgE0HKVu6mTvfRPdkx94zxo6fzReUhgW8M0eRUoMNvQPVy4glc
 vUjQrjjjQY/C2hOKv/CmUSHcqlVRABGdp8gPjuVhWwsWDTbDm+C9tkzjMJvXruOA87
 BODIYnI3vIi+uxat7XSLwniX7xZR09DXHl2i2V0kSB+6sVCRh/cL28tePwYElqHS+Y
 l923Xx8oAiDPyR+d0bquLuCelXzYXve5O9khA+4J17UfdJSOPt37G30FnZ/R8/Dbso
 3et3KFXejdQnKui+nL89rGKs13z0cXMRETdiGDbfm519BrFgQKqRv79kHq4OUynrkC
 HSVN87Db0vnKA==
Message-ID: <55f6fdba-f505-4557-8074-6bfa942c275d@kernel.org>
Date: Mon, 9 Sep 2024 09:24:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>
References: <973e075b-7044-4448-9cd0-45b5a1ad1382@kernel.org>
 <20240908041202.2272053-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20240908041202.2272053-1-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/8 12:12, wangzijie wrote: >>> From: Chao Yu via
 Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net> >>> >>>> On
 2024/8/27
 14:22, wangzijie wrote: >>>>> Thread A >>>>> -dquot_initialize [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1snT95-0000Mt-3r
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: don't set SBI_QUOTA_NEED_REPAIR
 flag if receive SIGKILL
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzggMTI6MTIsIHdhbmd6aWppZSB3cm90ZToKPj4+IEZyb206IENoYW8gWXUgdmlh
IExpbnV4LWYyZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Pgo+Pj4KPj4+PiBPbiAyMDI0LzgvMjcgMTQ6MjIsIHdhbmd6aWppZSB3cm90ZToKPj4+Pj4gVGhy
ZWFkIEEKPj4+Pj4gLWRxdW90X2luaXRpYWxpemUKPj4+Pj4gIMKgIC1kcWdldAo+Pj4+PiAgwqDC
oCAtZjJmc19kcXVvdF9hY3F1aXJlCj4+Pj4+ICDCoMKgwqAgLXYyX3JlYWRfZHF1b3QKPj4+Pj4g
IMKgwqDCoMKgIC1xdHJlZV9yZWFkX2RxdW90Cj4+Pj4+ICDCoMKgwqDCoMKgIC1maW5kX3RyZWVf
ZHFlbnRyeQo+Pj4+PiAgwqDCoMKgwqDCoMKgIC1mMmZzX3F1b3RhX3JlYWQKPj4+Pj4gIMKgwqDC
oMKgwqDCoMKgIC1yZWFkX2NhY2hlX3BhZ2VfZ2ZwCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIC1k
b19yZWFkX2NhY2hlX2ZvbGlvCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgLWZpZW1hcF9yZWFk
X2ZvbGlvCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtZm9saW9fd2FpdF9sb2NrZWRfa2ls
bGFibGUKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLXJlY2VpdmUgU0lHS0lMTCA6IHJl
dHVybiAtRUlOVFIKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgIC1zZXQgU0JJX1FVT1RBX05FRURfUkVQ
QUlSCj4+Pj4+ICDCoMKgwqAgLXNldCBTQklfUVVPVEFfTkVFRF9SRVBBSVIKPj4+Pj4KPj4+Pj4g
V2hlbiBjYWxsaW5nIHJlYWRfY2FjaGVfcGFnZV9nZnAgaW4gcXVvdGEgcmVhZCwgdGhyZWFkIG1h
eSByZWNlaXZlIFNJR0tJTEwgYW5kCj4+Pj4+IHNldCBTQklfUVVPVEFfTkVFRF9SRVBBSVIsIHNo
b3VsZCB3ZSBzZXQgU0JJX1FVT1RBX05FRURfUkVQQUlSIGluIHRoaXMgZXJyb3IgcGF0aD8KPj4+
Pgo+Pj4+IGYyZnNfcXVvdGFfcmVhZCgpIGNhbiBiZSBjYWxsZWQgaW4gYSBsb3Qgb2YgY29udGV4
dHMsIGNhbiB3ZSBqdXN0IGlnbm9yZSAtRUlOVFIKPj4+PiBmb3IgZjJmc19kcXVvdF9pbml0aWFs
aXplKCkgY2FzZT8KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Cj4+PiBZZXMsIGluIG1hbnkgY29udGV4
dHMgZjJmc19xdW90YV9yZWFkKCkgY2FuIGJlIGNhbGxlZCBhbmQgbWF5IHJldHVybiAtRUlOVFIs
IHdlIG5lZWQgdG8gaWdub3JlIHRoaXMgZXJybm8gZm9yIG1vcmUgY2FzZXMuIElmIHdlIG5lZWQg
dG8gZG8gc28sIEkgd2lsbCBjaGVjayBpdCBhbmQgcmVzZW5kIHBhdGNoLgo+Pj4gT3IgZG8geW91
IGhhdmUgb3RoZXIgc3VnZ2VzdGlvbnMgdG8gYXZvaWQgdW5uZWNlc3NhcnkgU0JJX1FVT1RBX05F
RURfUkVQQUlSIGZsYWcgc2V0Pwo+Pgo+PiBIb3cgYWJvdXQgdGhpcz8KPj4KPj4gLS0tCj4+ICAg
ZnMvZjJmcy9mMmZzLmggIHwgIDEgKwo+PiAgIGZzL2YyZnMvaW5vZGUuYyB8ICAzICstLQo+PiAg
IGZzL2YyZnMvc3VwZXIuYyB8IDE3ICsrKysrKysrKysrKystLS0tCj4+ICAgMyBmaWxlcyBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+PiBpbmRleCBkZmVkMTk3NGVkYTUuLmEx
NzA0YTE5ZGZlOSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4gKysrIGIvZnMvZjJm
cy9mMmZzLmgKPj4gQEAgLTgxMCw2ICs4MTAsNyBAQCBlbnVtIHsKPj4gICAJRklfQVRPTUlDX0RJ
UlRJRUQsCS8qIGluZGljYXRlIGF0b21pYyBmaWxlIGlzIGRpcnRpZWQgKi8KPj4gICAJRklfQVRP
TUlDX1JFUExBQ0UsCS8qIGluZGljYXRlIGF0b21pYyByZXBsYWNlICovCj4+ICAgCUZJX09QRU5F
RF9GSUxFLAkJLyogaW5kaWNhdGUgZmlsZSBoYXMgYmVlbiBvcGVuZWQgKi8KPj4gKwlGSV9JTklU
X0RRVU9ULAkJLyogaW5kaWNhdGUgaXQncyBpbml0aWFsaXppbmcgZHF1b3QgKi8KPj4gICAJRklf
TUFYLAkJCS8qIG1heCBmbGFnLCBuZXZlciBiZSB1c2VkICovCj4+ICAgfTsKPj4KPj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBiL2ZzL2YyZnMvaW5vZGUuYwo+PiBpbmRleCAwMDhmMDEz
NDhhZmEuLmIxZGJhZWRhMzA2ZiAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4+ICsr
KyBiL2ZzL2YyZnMvaW5vZGUuYwo+PiBAQCAtODI3LDggKzgyNyw3IEBAIHZvaWQgZjJmc19ldmlj
dF9pbm9kZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pgo+PiAgIAllcnIgPSBmMmZzX2RxdW90X2lu
aXRpYWxpemUoaW5vZGUpOwo+PiAgIAlpZiAoZXJyKSB7Cj4+IC0JCWlmIChlcnIgIT0gLUVJTlRS
KQo+PiAtCQkJc2V0X3NiaV9mbGFnKHNiaSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPj4gKwkJ
c2V0X3NiaV9mbGFnKHNiaSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPj4gICAJCWVyciA9IDA7
Cj4+ICAgCX0KPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3Vw
ZXIuYwo+PiBpbmRleCA4ZTI5YWJhNGI3YTQuLmU3NzRiZGY4NzViMiAxMDA2NDQKPj4gLS0tIGEv
ZnMvZjJmcy9zdXBlci5jCj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+PiBAQCAtMjY0NCw4ICsy
NjQ0LDExIEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfcXVvdGFfcmVhZChzdHJ1Y3Qgc3VwZXJfYmxv
Y2sgKnNiLCBpbnQgdHlwZSwgY2hhciAqZGF0YSwKPj4gICAJCQlpZiAoUFRSX0VSUihwYWdlKSA9
PSAtRU5PTUVNKSB7Cj4+ICAgCQkJCW1lbWFsbG9jX3JldHJ5X3dhaXQoR0ZQX05PRlMpOwo+PiAg
IAkJCQlnb3RvIHJlcGVhdDsKPj4gLQkJCX0gZWxzZSBpZiAoUFRSX0VSUihwYWdlKSAhPSAtRUlO
VFIpCj4+IC0JCQkJc2V0X3NiaV9mbGFnKEYyRlNfU0Ioc2IpLCBTQklfUVVPVEFfTkVFRF9SRVBB
SVIpOwo+PiArCQkJfSBlbHNlIGlmIChQVFJfRVJSKHBhZ2UpID09IC1FSU5UUiAmJgo+PiArCQkJ
CWlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9JTklUX0RRVU9UKSkgewo+PiArCQkJCXJldHVy
biBQVFJfRVJSKHBhZ2UpOwo+PiArCQkJfQo+PiArCQkJc2V0X3NiaV9mbGFnKEYyRlNfU0Ioc2Ip
LCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+PiAgIAkJCXJldHVybiBQVFJfRVJSKHBhZ2UpOwo+
PiAgIAkJfQo+Pgo+PiBAQCAtMjcyMSwxMCArMjcyNCwxNiBAQCBzdGF0aWMgc3NpemVfdCBmMmZz
X3F1b3RhX3dyaXRlKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCB0eXBlLAo+Pgo+PiAgIGlu
dCBmMmZzX2RxdW90X2luaXRpYWxpemUoc3RydWN0IGlub2RlICppbm9kZSkKPj4gICB7Cj4+ICsJ
aW50IHJldDsKPj4gKwo+PiAgIAlpZiAodGltZV90b19pbmplY3QoRjJGU19JX1NCKGlub2RlKSwg
RkFVTFRfRFFVT1RfSU5JVCkpCj4+ICAgCQlyZXR1cm4gLUVTUkNIOwo+Pgo+PiAtCXJldHVybiBk
cXVvdF9pbml0aWFsaXplKGlub2RlKTsKPj4gKwlzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfSU5J
VF9EUVVPVCk7Cj4+ICsJcmV0ID0gZHF1b3RfaW5pdGlhbGl6ZShpbm9kZSk7Cj4+ICsJY2xlYXJf
aW5vZGVfZmxhZyhpbm9kZSwgRklfSU5JVF9EUVVPVCk7Cj4+ICsKPj4gKwlyZXR1cm4gcmV0Owo+
PiAgIH0KPj4KPj4gICBzdGF0aWMgc3RydWN0IGRxdW90IF9fcmN1ICoqZjJmc19nZXRfZHF1b3Rz
KHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+IEBAIC0zMDY0LDcgKzMwNzMsNyBAQCBzdGF0aWMgaW50
IGYyZnNfZHF1b3RfYWNxdWlyZShzdHJ1Y3QgZHF1b3QgKmRxdW90KQo+Pgo+PiAgIAlmMmZzX2Rv
d25fcmVhZCgmc2JpLT5xdW90YV9zZW0pOwo+PiAgIAlyZXQgPSBkcXVvdF9hY3F1aXJlKGRxdW90
KTsKPj4gLQlpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVJTlRSKQo+PiArCWlmIChyZXQgPCAwKQo+
PiAgIAkJc2V0X3NiaV9mbGFnKHNiaSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPj4gICAJZjJm
c191cF9yZWFkKCZzYmktPnF1b3RhX3NlbSk7Cj4+ICAgCXJldHVybiByZXQ7Cj4+IC0tIAo+PiAy
LjQwLjEKPiAKPiBIaSwgQ2hhbwo+IElmIHdlIGRvbnQndCBpZ25vcmUgLUVJTlRSIGluIGYyZnNf
ZHF1b3RfYWNxdWlyZSgpLCB3ZSB3aWxsIHN0aWxsIHNldCBTQklfUVVPVEFfTkVFRF9SRVBBSVIg
ZmxhZwo+IGluIGYyZnNfZHF1b3RfYWNxdWlyZSgpIGlmIGYyZnNfcXVvdGFfcmVhZCByZXR1cm4g
LUVJTlRSLiBJIHRoaW5rIHdlIG5lZWQgbW9yZSBjYXNlcyBpbiBhZGRpdGlvbiB0bwo+IGRxdW90
IGluaXRpYWxpemluZyBhbmQgSSB3aWxsIGNoZWNrIGl0IGFnYWluLgoKTWF5YmUgd2UgY2FuIGNv
dmVyIHRoaXMgY2FzZSB3LyBiZWxvdyBkaWZmPwoKLS0tCiAgZnMvZjJmcy9zdXBlci5jIHwgMyAr
Ky0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCmluZGV4IGU3NzRiZGY4
NzViMi4uN2ZjOTcwMTIxYTNmIDEwMDY0NAotLS0gYS9mcy9mMmZzL3N1cGVyLmMKKysrIGIvZnMv
ZjJmcy9zdXBlci5jCkBAIC0zMDczLDcgKzMwNzMsOCBAQCBzdGF0aWMgaW50IGYyZnNfZHF1b3Rf
YWNxdWlyZShzdHJ1Y3QgZHF1b3QgKmRxdW90KQoKICAJZjJmc19kb3duX3JlYWQoJnNiaS0+cXVv
dGFfc2VtKTsKICAJcmV0ID0gZHF1b3RfYWNxdWlyZShkcXVvdCk7Ci0JaWYgKHJldCA8IDApCisJ
aWYgKHJldCA8IDAgJiYKKwkJKHJldCAhPSAtRUlOVFIgfHwgIWlzX2lub2RlX2ZsYWdfc2V0KGlu
b2RlLCBGSV9JTklUX0RRVU9UKSkpCiAgCQlzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVF
RF9SRVBBSVIpOwogIAlmMmZzX3VwX3JlYWQoJnNiaS0+cXVvdGFfc2VtKTsKICAJcmV0dXJuIHJl
dDsKLS0gCjIuNDAuMQoKVGhhbmtzLAoKPiBUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbiEK
PiAKPj4+Cj4+PiBUaGFuayB5b3UgZm9yIHJldmlldy4KPj4+Cj4+Pj4+Cj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IHdhbmd6aWppZSA8d2FuZ3ppamllMUBob25vci5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAg
wqAgZnMvZjJmcy9pbm9kZS5jIHwgMyArKy0KPj4+Pj4gIMKgIGZzL2YyZnMvc3VwZXIuYyB8IDYg
KysrLS0tCj4+Pj4+ICDCoCAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBiL2ZzL2Yy
ZnMvaW5vZGUuYwo+Pj4+PiBpbmRleCBlZDYyOWRhYmIuLjJhZjk4ZTJiNyAxMDA2NDQKPj4+Pj4g
LS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvaW5vZGUuYwo+Pj4+PiBA
QCAtODM3LDggKzgzNyw5IEBAIHZvaWQgZjJmc19ldmljdF9pbm9kZShzdHJ1Y3QgaW5vZGUgKmlu
b2RlKQo+Pj4+PiAgwqDCoMKgwqDCoCBlcnIgPSBmMmZzX2RxdW90X2luaXRpYWxpemUoaW5vZGUp
Owo+Pj4+PiAgwqDCoMKgwqDCoCBpZiAoZXJyKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
ZXJyICE9IC1FSU5UUikKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X3NiaV9mbGFn
KHNiaSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBl
cnIgPSAwOwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX1FVT1RB
X05FRURfUkVQQUlSKTsKPj4+Pj4gIMKgwqDCoMKgwqAgfQo+Pj4+PiAgwqDCoMKgwqDCoCBmMmZz
X3JlbW92ZV9pbm9fZW50cnkoc2JpLCBpbm9kZS0+aV9pbm8sIEFQUEVORF9JTk8pOwo+Pj4+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4+IGluZGV4
IDFmMWIzNjQ3YS4uZjk5YTM2ZmYzIDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMK
Pj4+Pj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4+IEBAIC0yNjUwLDggKzI2NTAsOCBAQCBz
dGF0aWMgc3NpemVfdCBmMmZzX3F1b3RhX3JlYWQoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50
IHR5cGUsIGNoYXIgKmRhdGEsCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
UFRSX0VSUihwYWdlKSA9PSAtRU5PTUVNKSB7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1lbWFsbG9jX3JldHJ5X3dhaXQoR0ZQX05PRlMpOwo+Pj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHJlcGVhdDsKPj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfc2JpX2Zs
YWcoRjJGU19TQihzYiksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0gZWxzZSBpZiAoUFRSX0VSUihwYWdlKSAhPSAtRUlOVFIpCj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X3NiaV9mbGFnKEYyRlNfU0Ioc2IpLCBT
QklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIFBUUl9FUlIocGFnZSk7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+PiBA
QCAtMzA3MCw3ICszMDcwLDcgQEAgc3RhdGljIGludCBmMmZzX2RxdW90X2FjcXVpcmUoc3RydWN0
IGRxdW90ICpkcXVvdCkKPj4+Pj4gIMKgwqDCoMKgwqAgZjJmc19kb3duX3JlYWQoJnNiaS0+cXVv
dGFfc2VtKTsKPj4+Pj4gIMKgwqDCoMKgwqAgcmV0ID0gZHF1b3RfYWNxdWlyZShkcXVvdCk7Cj4+
Pj4+IC3CoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4+ICvCoMKgwqAgaWYgKHJldCA8IDAgJiYgcmV0
ICE9IC1FSU5UUikKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfc2JpX2ZsYWcoc2JpLCBT
QklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+Pj4+PiAgwqDCoMKgwqDCoCBmMmZzX3VwX3JlYWQoJnNi
aS0+cXVvdGFfc2VtKTsKPj4+Pj4gIMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+Cj4+Pgo+IAo+
IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==

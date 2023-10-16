Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A52317CA3E0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Oct 2023 11:17:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qsJiw-0005vM-24;
	Mon, 16 Oct 2023 09:17:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qsJiu-0005vE-3w
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 09:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kkItPVxnhZKra34ceQSkAdQiAk+TzkCVEOqQRik4zQA=; b=gbV+bldZeb8uaK9KGv2RZcmULU
 L3iOxUOHPcRNoXKfiYGXFwfFxcaatYPWaxCHxPgwaaS6xRz6AHMDyUD4UkT33VmAIkpx8lPMxaP8q
 V0hqWKUvj3qUZBlN5l/XP6cIknJ7JT2tcnbWg/qorFCgD7GM9WiAeCssp1tYBThtaa3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kkItPVxnhZKra34ceQSkAdQiAk+TzkCVEOqQRik4zQA=; b=XQZbQ1aKGsJEJiSnL7q2hn7xyt
 wdxxgJUuPCiCt+ijMwa+dW94SivuXVONvrpntcEkOAyrZ0udRWWhIgHH+pmCyIxujEkzJrx2FXMXl
 EYkZicqeUAYNW4ZoUMMuwB5zqyv8B3TtoAwa5WU/WBWSDxVyNAJamEnwzPOhiagNXvfU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qsJit-00GEvL-Cj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 09:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F41D960DC0;
 Mon, 16 Oct 2023 09:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E937C433C8;
 Mon, 16 Oct 2023 09:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697447829;
 bh=UOe8CwtERDeO0KaVBPJbJ3x7xv7tcYtY0l3Tm0cGB6Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SkumRl1CRrp8Oq8EMlmjC+Ly4ynxJbUU8dlNsOpAeOr05Q59jVdRitza0ab6g2X4Z
 rhTciS9QHXyv/PF4Q3ykkVkx+fcwBkJVOLpIEmtaKyBkhmXvwWCxYuIYzXS+qCcZf/
 FWL+y67Xkr6OXhTiAt3vdzvkSaG0YmmB3YgLM2DVD/L5P9lAyBh/WNbVMeQFPtBi5q
 u8aNRfDQKWfgdA5/FSYr8RfsgZF3+DtGq5WDYSvd9v88d7TuSKPXCNKbwqTUt+zrsB
 3sDlr8ikg72Y/E4UoXIBEk01j2iTWFmWAOvXWA6hvNDwTRXlKxzUFC9rbE1XdPaTbW
 /MZOyqNoT/U3Q==
Message-ID: <2a777530-b90e-a70d-99bd-81d36b1323fc@kernel.org>
Date: Mon, 16 Oct 2023 17:17:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1697194703-21371-1-git-send-email-zhiguo.niu@unisoc.com>
 <1880a7c4-9ab9-8e6d-f1d4-c2172a99685c@kernel.org>
 <CAHJ8P3J+Rnx4dUDGesdrtajDdP_SxDaM6yyYbHRt4ij_wVGhsg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3J+Rnx4dUDGesdrtajDdP_SxDaM6yyYbHRt4ij_wVGhsg@mail.gmail.com>
X-Spam-Score: -8.5 (--------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/10/16 17:02, Zhiguo Niu wrote: > Dear Chao, > > On
    Mon, Oct 16, 2023 at 3:37 PM Chao Yu <chao@kernel.org> wrote: >> >> On
   2023/10/13 18:58, Zhiguo Niu wrote: >>> SBI_NEED_FSCK should be set [...] 
 
 Content analysis details:   (-8.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -3.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qsJit-00GEvL-Cj
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix error path of
 __f2fs_build_free_nids
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
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy8xMC8xNiAxNzowMiwgWmhpZ3VvIE5pdSB3cm90ZToKPiBEZWFyIENoYW8sCj4gCj4g
T24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgMzozN+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4+Cj4+IE9uIDIwMjMvMTAvMTMgMTg6NTgsIFpoaWd1byBOaXUgd3JvdGU6Cj4+
PiBTQklfTkVFRF9GU0NLIHNob3VsZCBiZSBzZXQgZm9yIGZzY2sgaGFzIGEgY2hhbmNlIHRvCj4+
PiByZXBhaXIgaW4gY2FzZSBvZiBzY2FuX25hdF9wYWdlIGZhaWwgaW4gcnVuIHRpbWUuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+Pgo+
PiBIaSBaaGlndW8sCj4+Cj4+IENhbiB5b3UgcGxlYXNlIGNoZWNrIGJlbG93IHVwZGF0ZT8KPj4K
Pj4gICBGcm9tIDlhMzQ1OWQyZDYyYTEyZjg3MDhkNzJhYTc4MDhhMWRlZjlmOWQ5MmYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCj4+IEZyb206IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29j
LmNvbT4KPj4gRGF0ZTogRnJpLCAxMyBPY3QgMjAyMyAxODo1ODoyMyArMDgwMAo+PiBTdWJqZWN0
OiBbUEFUQ0hdIGYyZnM6IGZpeCBlcnJvciBwYXRoIG9mIF9fZjJmc19idWlsZF9mcmVlX25pZHMK
Pj4KPj4gSWYgTkFUIGlzIGNvcnJ1cHRlZCwgbGV0IHNjYW5fbmF0X3BhZ2UoKSByZXR1cm4gRUZT
Q09SUlVQVEVELCBzbyB0aGF0LAo+PiBjYWxsZXIgY2FuIHNldCBTQklfTkVFRF9GU0NLIGZsYWcg
aW50byBjaGVja3BvaW50IGZvciBsYXRlciByZXBhaXIgYnkKPj4gZnNjay4KPj4KPj4gQWxzbywg
dGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IGZzY29ycnVwdGVkIGVycm9yIGZsYWcsIGFuZCBp
biBhYm92ZQo+PiBzY2VuYXJpbywgaXQgd2lsbCBwZXJzaXN0IHRoZSBlcnJvciBmbGFnIGludG8g
c3VwZXJibG9jayBzeW5jaHJvbm91c2x5Cj4+IHRvIGF2b2lkIGl0IGhhcyBubyBsdWNrIHRvIHRy
aWdnZXIgYSBjaGVja3BvaW50IHRvIHJlY29yZCBTQklfTkVFRF9GU0NLLgoKWmhpZ3VvLAoKSWYg
eW91IGhhdmUgbm8gbW9yZSBjb21tZW50cywgSSBndWVzcyB5b3UgY2FuIHJlc2VuZCB0aGlzIG9u
ZSBhcyB2Mi4KClRoYW5rcywKCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1
by5uaXVAdW5pc29jLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPgo+PiAtLS0KPj4gICAgZnMvZjJmcy9ub2RlLmMgICAgICAgICAgfCAxMSArKysrKysrKyst
LQo+PiAgICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8ICAxICsKPj4gICAgMiBmaWxlcyBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+PiBpbmRleCBhMmIyYzZjN2Y2NmQuLjU3
ZDlkZDNhNDNiYyAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPj4gKysrIGIvZnMvZjJm
cy9ub2RlLmMKPj4gQEAgLTIzODksNyArMjM4OSw3IEBAIHN0YXRpYyBpbnQgc2Nhbl9uYXRfcGFn
ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+ICAgICAgICAgICAgICAgICAgYmxrX2FkZHIg
PSBsZTMyX3RvX2NwdShuYXRfYmxrLT5lbnRyaWVzW2ldLmJsb2NrX2FkZHIpOwo+Pgo+PiAgICAg
ICAgICAgICAgICAgIGlmIChibGtfYWRkciA9PSBORVdfQUREUikKPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biAtRUZTQ09SUlVQVEVEOwo+Pgo+PiAgICAgICAgICAgICAgICAgIGlmIChibGtfYWRkciA9PSBO
VUxMX0FERFIpIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGFkZF9mcmVlX25pZChzYmks
IHN0YXJ0X25pZCwgdHJ1ZSwgdHJ1ZSk7Cj4+IEBAIC0yNTA0LDcgKzI1MDQsMTQgQEAgc3RhdGlj
IGludCBfX2YyZnNfYnVpbGRfZnJlZV9uaWRzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZjJmc191cF9yZWFkKCZubV9pLT5uYXRfdHJlZV9sb2NrKTsKPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2VycihzYmksICJOQVQgaXMgY29y
cnVwdCwgcnVuIGZzY2sgdG8gZml4IGl0Iik7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAocmV0ID09IC1FRlNDT1JSVVBURUQpIHsKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfZXJyKHNiaSwgIk5BVCBpcyBjb3JydXB0LCBy
dW4gZnNjayB0byBmaXggaXQiKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0ZTQ0spOwo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVSUk9S
X0lOQ09OU0lTVEVOVF9OQVQpOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0K
Pj4gKwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgfQo+PiAgICAgICAgICAgICAgICAgIH0KPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvZjJmc19mcy5oIGIvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgK
Pj4gaW5kZXggMDdlZDY5YzI4NDBkLi4wMzlmZTBjZThkODMgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1
ZGUvbGludXgvZjJmc19mcy5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCj4+IEBA
IC0xMDQsNiArMTA0LDcgQEAgZW51bSBmMmZzX2Vycm9yIHsKPj4gICAgICAgICAgRVJST1JfQ09S
UlVQVEVEX1ZFUklUWV9YQVRUUiwKPj4gICAgICAgICAgRVJST1JfQ09SUlVQVEVEX1hBVFRSLAo+
PiAgICAgICAgICBFUlJPUl9JTlZBTElEX05PREVfUkVGRVJFTkNFLAo+PiArICAgICAgIEVSUk9S
X0lOQ09OU0lTVEVOVF9OQVQsCj4+ICAgICAgICAgIEVSUk9SX01BWCwKPj4gICAgfTsKPj4KPj4g
LS0KPj4gMi40MC4xCj4gCj4gVGhhbmsgeW91IGZvciB5b3VyIHVwZGF0ZXMgYW5kIHRoZXNlIHVw
ZGF0ZXMgYXJlIG1vcmUgcmVhc29uYWJsZSBiYXNlZAo+IG9uIHRoZSBsYXRlc3QgY29kZS4KPiBJ
biBhZGRpdGlvbiwgIEkgYWxzbyBtb2RpZmllZCB0aGUgZm9sbG93aW5nIGNvZGUgYWZ0ZXIgSSBj
aGVja2VkIHRoZQo+IHJlbGF0ZWQgZmxvdyBvZiBmMmZzX2hhbmRsZV9lcnJvci4KPiBFUlJPUl9J
TkNPTlNJU1RFTlRfRk9PVEVSIGlzIHJldXNlZCBoZXJlLCAgIGFueSBzdWdnZXN0aW9ucyBmb3Ig
dGhpcz8KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+IGlu
ZGV4IGQ5ZTYwODcuLjk0ZjVjN2YgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPiArKysg
Yi9mcy9mMmZzL25vZGUuYwo+IEBAIC0xNDY3LDYgKzE0NjcsNyBAQCBzdGF0aWMgc3RydWN0IHBh
Z2UgKl9fZ2V0X25vZGVfcGFnZShzdHJ1Y3QKPiBmMmZzX3NiX2luZm8gKnNiaSwgcGdvZmZfdCBu
aWQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgb2ZzX29mX25vZGUocGFnZSksIGNwdmVy
X29mX25vZGUocGFnZSksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV4dF9ibGthZGRy
X29mX25vZGUocGFnZSkpOwo+ICAgICAgICAgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0ZT
Q0spOwo+ICsgICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTkNPTlNJU1RFTlRf
Rk9PVEVSKTsKPiAgICAgICAgICBlcnIgPSAtRUlOVkFMOwo+ICAgb3V0X2VycjoKPiAgICAgICAg
ICBDbGVhclBhZ2VVcHRvZGF0ZShwYWdlKTsKPiAKPiBJZiB5b3UgaGF2ZSBubyBvdGhlciBzdWdn
ZXN0aW9ucywgSSB3aWxsIHVwZGF0ZSB0aGUgIlBBVENIIFYyIgo+IFRoYW5rcyEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==

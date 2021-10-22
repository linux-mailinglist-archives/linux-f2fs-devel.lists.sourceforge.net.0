Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E21437A37
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Oct 2021 17:42:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mdwgN-0008P5-BX; Fri, 22 Oct 2021 15:42:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mdwgM-0008ON-45
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Oct 2021 15:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tIfDput8DIp25sRQNGTQ6TLWeOUuRxMSRJGVU04P4Mk=; b=XolY0PUCIysDNf73Mmph5fHJS6
 1Znq+a7KS0N0no0IoQniTIHDeIQSP48gd2Rcao5O0aVWz35YuGH0Nh3F7DHQNooQBhMF3MV2GX7Hk
 v1EnsAIOAB8AqtLEkOY6RmDCZ0CTPvbQX/tyu42I/SVB0us1CphJvbiRn4yoNy/VSUUo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tIfDput8DIp25sRQNGTQ6TLWeOUuRxMSRJGVU04P4Mk=; b=TozmEjmXx8kNnQzQPOvK/lEiC9
 jkglAdxPdqK30q0w09+QwRCNNeuMWVGaFFYvzYyFllxnBCuKWe3Ntyt2b45ibEr4LH7nSkkyqkJxT
 OWQkzNvjhckO34b5TsGRlbjZqDpo4GMbNfY7zt96nZDVvQzgoBZYXG8qM7HdzdvJNi8Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mdwgL-00C1fO-Bs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Oct 2021 15:42:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB014610A4;
 Fri, 22 Oct 2021 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634916904;
 bh=VhootsDw5oDeMWa94ueX+nLxEjARX9+R+S8ZDta4lCs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mv29/dSeyx/yCwEziXNhxJRFv8OMQjQD3yhjdQ8Z9OoTLy7rvpIKUKAAoJ7J/yT0j
 YYgnwPobIdArR/InFZof9LUqwEMMbW+mS7zN+dL0Pl8W735VeZtk56A4NsarZzmauB
 DF1fDVFx/sIHNglFV7kHXkmNwGlKifPdjbjbBThrnANJoqOtsC3Aam1KWbUGtbvXAg
 6H4bcnDmql5mdzTcE8xEHb1zjrW4fn0T5D7aLuKOoKxvhjFf/A0ML294/TZWU/3pYB
 rMfGQ1MiNaFG05FbftfuApOEaGIjpQHCy/s7EkpooS/crdLbgrN1HyarvB2rYXAFEC
 1a2ZRk/NoZYJw==
Message-ID: <123cf4e1-f095-641b-825f-7ef137029dcf@kernel.org>
Date: Fri, 22 Oct 2021 23:35:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20211014131243.148009-1-changfengnan@vivo.com>
 <ALgAyADvEmTgm6EcRRwmGaoi.9.1634826831858.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB400315B2DF6D387710992297BB809@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <KL1PR0601MB400315B2DF6D387710992297BB809@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/10/22 11:53, 常凤楠 wrote: > > >> 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mdwgL-00C1fO-Bs
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix overwrite may reduce
 compress ratio unproperly
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xMC8yMiAxMTo1Mywg5bi45Yek5qWgIHdyb3RlOgo+IAo+IAo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBjaGFuZ2ZlbmduYW5Adml2by5jb20gPGNoYW5nZmVu
Z25hbkB2aXZvLmNvbT4gT24gQmVoYWxmIE9mCj4+IENoYW8gWXUKPj4gU2VudDogVGh1cnNkYXks
IE9jdG9iZXIgMjEsIDIwMjEgMTA6MzQgUE0KPj4gVG86IOW4uOWHpOaloCA8Y2hhbmdmZW5nbmFu
QHZpdm8uY29tPjsgamFlZ2V1a0BrZXJuZWwub3JnCj4+IENjOiBsaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBmMmZzOiBjb21w
cmVzczogZml4IG92ZXJ3cml0ZSBtYXkgcmVkdWNlIGNvbXByZXNzCj4+IHJhdGlvIHVucHJvcGVy
bHkKPj4KPj4gT24gMjAyMS8xMC8xNCAyMToxMiwgRmVuZ25hbiBDaGFuZyB3cm90ZToKPj4+IHdo
ZW4gb3ZlcndyaXRlIG9ubHkgZmlyc3QgYmxvY2sgb2YgY2x1c3Rlciwgc2luY2UgY2x1c3RlciBp
cyBub3QgZnVsbCwKPj4+IGl0IHdpbGwgY2FsbCBmMmZzX3dyaXRlX3Jhd19wYWdlcyB3aGVuIGYy
ZnNfd3JpdGVfbXVsdGlfcGFnZXMsIGFuZAo+Pj4gY2F1c2UgdGhlIHdob2xlIGNsdXN0ZXIgYmVj
b21lIHVuY29tcHJlc3NlZCBldmVudGhvdWdoIGRhdGEgY2FuIGJlCj4+IGNvbXByZXNzZWQuCj4+
PiB0aGlzIG1heSB3aWxsIG1ha2UgcmFuZG9tIHdyaXRlIGJlbmNoIHNjb3JlIHJlZHVjZSBhIGxv
dC4KPj4+Cj4+PiByb290IyBkZCBpZj0vZGV2L3plcm8gb2Y9Li9maW8tdGVzdCBicz0xTSBjb3Vu
dD0xCj4+Pgo+Pj4gcm9vdCMgc3luYwo+Pj4KPj4+IHJvb3QjIGVjaG8gMyA+IC9wcm9jL3N5cy92
bS9kcm9wX2NhY2hlcwo+Pj4KPj4+IHJvb3QjIGYyZnNfaW8gZ2V0X2NibG9ja3MgLi9maW8tdGVz
dAo+Pj4KPj4+IHJvb3QjIGRkIGlmPS9kZXYvemVybyBvZj0uL2Zpby10ZXN0IGJzPTRLIGNvdW50
PTEgb2ZsYWc9ZGlyZWN0Cj4+PiBjb252PW5vdHJ1bmMKPj4+Cj4+PiB3L28gcGF0Y2g6Cj4+PiBy
b290IyBmMmZzX2lvIGdldF9jYmxvY2tzIC4vZmlvLXRlc3QKPj4+IDE4OQo+Pj4KPj4+IHcvIHBh
dGNoOgo+Pj4gcm9vdCMgZjJmc19pbyBnZXRfY2Jsb2NrcyAuL2Zpby10ZXN0Cj4+PiAxOTIKPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+
Cj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvY29tcHJlc3MuYyB8IDEyICsrKysrKysrKysrKwo+Pj4g
ICAgZnMvZjJmcy9kYXRhLmMgICAgIHwgIDcgKysrKysrKwo+Pj4gICAgZnMvZjJmcy9mMmZzLmgg
ICAgIHwgIDEgKwo+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYyBp
bmRleAo+Pj4gYzFiZjlhZDRjMjIwLi5jNGYzNmVhZDZmMTcgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9m
MmZzL2NvbXByZXNzLmMKPj4+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+Pj4gQEAgLTg1Nyw2
ICs4NTcsMTggQEAgdm9pZCBmMmZzX2VuZF9yZWFkX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgcGFn
ZQo+PiAqcGFnZSwgYm9vbCBmYWlsZWQsCj4+PiAgICAJCWYyZnNfZGVjb21wcmVzc19jbHVzdGVy
KGRpYyk7Cj4+PiAgICB9Cj4+Pgo+Pj4gK2Jvb2wgaXNfcGFnZV9zYW1lX2NsdXN0ZXIoc3RydWN0
IGNvbXByZXNzX2N0eCAqY2MsIHN0cnVjdCBwYWdldmVjCj4+PiArKnB2ZWMsIGludCBpbmRleCkK
Pj4KPj4gRmVuZ25hbiwKPj4KPj4gSXQgbmVlZHMgYWRkIGYyZnMgcHJlZml4IGZvciBub24tc3Rh
dGljIHN5bWJvbCB0byBhdm9pZCBnbG9iYWwgbmFtZXNwYWNlCj4+IHBvbGx1dGlvbi4KPj4KPj4g
QW55d2F5LCBob3cgYWJvdXQgdGhpcz8KPiAKPiBJdCBsb29rcyBnb29kIGZvciBtZSwgeW91IGNh
biBtYWtlIHRoaXMgYXMgVjMuCgpXZWxsLCBjb3VsZCB5b3UgcGxlYXNlIHNlbmQgdjMgd2l0aCBi
ZWxvdyB1cGRhdGVzPwoKVGhhbmtzLAoKPj4KPj4gLS0tCj4+ICAgIGZzL2YyZnMvY29tcHJlc3Mu
YyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPj4gICAgZnMvZjJmcy9kYXRhLmMgICAgIHwgIDcg
KysrKy0tLQo+PiAgICBmcy9mMmZzL2YyZnMuaCAgICAgfCAgMiArKwo+PiAgICAzIGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMgaW5kZXgKPj4gYzFiZjlh
ZDRjMjIwLi4xNWQ5Yjg5ZDRkZjAgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+
PiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMKPj4gQEAgLTg4MSw2ICs4ODEsMjUgQEAgYm9vbCBm
MmZzX2NsdXN0ZXJfY2FuX21lcmdlX3BhZ2Uoc3RydWN0Cj4+IGNvbXByZXNzX2N0eCAqY2MsIHBn
b2ZmX3QgaW5kZXgpCj4+ICAgIAlyZXR1cm4gaXNfcGFnZV9pbl9jbHVzdGVyKGNjLCBpbmRleCk7
Cj4+ICAgIH0KPj4KPj4gK2Jvb2wgZjJmc19hbGxfY2x1c3Rlcl9wYWdlX2xvYWRlZChzdHJ1Y3Qg
Y29tcHJlc3NfY3R4ICpjYywgc3RydWN0IHBhZ2V2ZWMKPj4gKnB2ZWMsCj4+ICsJCQkJCQlpbnQg
aW5kZXgsIGludCBucl9wYWdlcykKPj4gK3sKPj4gKwl1bnNpZ25lZCBsb25nIHBnaWR4Owo+PiAr
CWludCBpOwo+PiArCj4+ICsJaWYgKG5yX3BhZ2VzIC0gaW5kZXggPCBjYy0+Y2x1c3Rlcl9zaXpl
KQo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKwlwZ2lkeCA9IHB2ZWMtPnBhZ2VzW2luZGV4
XS0+aW5kZXg7Cj4+ICsKPj4gKwlmb3IgKGkgPSAxOyBpIDwgY2MtPmNsdXN0ZXJfc2l6ZTsgaSsr
KSB7Cj4+ICsJCWlmIChwdmVjLT5wYWdlc1tpbmRleCArIGldLT5pbmRleCAhPSBwZ2lkeCArIGkp
Cj4+ICsJCQlyZXR1cm4gZmFsc2U7Cj4+ICsJfQo+PiArCj4+ICsJcmV0dXJuIHRydWU7Cj4+ICt9
Cj4+ICsKPj4gICAgc3RhdGljIGJvb2wgY2x1c3Rlcl9oYXNfaW52YWxpZF9kYXRhKHN0cnVjdCBj
b21wcmVzc19jdHggKmNjKQo+PiAgICB7Cj4+ICAgIAlsb2ZmX3QgaV9zaXplID0gaV9zaXplX3Jl
YWQoY2MtPmlub2RlKTsgZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jCj4+IGIvZnMvZjJmcy9k
YXRhLmMgaW5kZXggMTRmZTVjNjIxNmNjLi5iMDY2NWY2OWMwOTMgMTAwNjQ0Cj4+IC0tLSBhL2Zz
L2YyZnMvZGF0YS5jCj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+IEBAIC0zMDc1LDkgKzMwNzUs
MTAgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKHN0cnVjdAo+PiBhZGRyZXNz
X3NwYWNlICptYXBwaW5nLAo+PiAgICAJCQkJCQlkb25lID0gMTsKPj4gICAgCQkJCQkJYnJlYWs7
Cj4+ICAgIAkJCQkJfSBlbHNlIGlmIChyZXQyICYmCj4+IC0JCQkJCQkhZjJmc19jb21wcmVzc193
cml0ZV9lbmQoaW5vZGUsCj4+IC0JCQkJCQkJCWZzZGF0YSwgcGFnZS0+aW5kZXgsCj4+IC0JCQkJ
CQkJCTEpKSB7Cj4+ICsJCQkJCQkoIWYyZnNfY29tcHJlc3Nfd3JpdGVfZW5kKGlub2RlLAo+PiAr
CQkJCQkJCWZzZGF0YSwgcGFnZS0+aW5kZXgsIDEpIHx8Cj4+ICsJCQkJCQkhZjJmc19hbGxfY2x1
c3Rlcl9wYWdlX2xvYWRlZCgmY2MsCj4+ICsJCQkJCQkJJnB2ZWMsIGksIG5yX3BhZ2VzKSkpIHsK
Pj4gICAgCQkJCQkJcmV0cnkgPSAxOwo+PiAgICAJCQkJCQlicmVhazsKPj4gICAgCQkJCQl9Cj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oIGluZGV4IDdhMzJj
MjEyNzk0NS4uYjhkYTM0MTk4Y2UwCj4+IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+
PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+PiBAQCAtNDA0Nyw2ICs0MDQ3LDggQEAgdm9pZCBmMmZz
X2VuZF9yZWFkX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgcGFnZQo+PiAqcGFnZSwgYm9vbCBmYWls
ZWQsCj4+ICAgIAkJCQkJCQlibG9ja190IGJsa2FkZHIpOwo+PiAgICBib29sIGYyZnNfY2x1c3Rl
cl9pc19lbXB0eShzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYyk7Cj4+ICAgIGJvb2wgZjJmc19jbHVz
dGVyX2Nhbl9tZXJnZV9wYWdlKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLCBwZ29mZl90IGluZGV4
KTsKPj4gK2Jvb2wgZjJmc19hbGxfY2x1c3Rlcl9wYWdlX2xvYWRlZChzdHJ1Y3QgY29tcHJlc3Nf
Y3R4ICpjYywgc3RydWN0IHBhZ2V2ZWMKPj4gKnB2ZWMsCj4+ICsJCQkJCQlpbnQgaW5kZXgsIGlu
dCBucl9wYWdlcyk7Cj4+ICAgIGJvb2wgZjJmc19zYW5pdHlfY2hlY2tfY2x1c3RlcihzdHJ1Y3Qg
ZG5vZGVfb2ZfZGF0YSAqZG4pOwo+PiAgICB2b2lkIGYyZnNfY29tcHJlc3NfY3R4X2FkZF9wYWdl
KHN0cnVjdCBjb21wcmVzc19jdHggKmNjLCBzdHJ1Y3QgcGFnZQo+PiAqcGFnZSk7Cj4+ICAgIGlu
dCBmMmZzX3dyaXRlX211bHRpX3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLAo+PiAtLQo+
PiAyLjMyLjAKPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF4E43C59E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Oct 2021 10:53:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfegP-0001Xk-Un; Wed, 27 Oct 2021 08:53:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mfegO-0001Xe-AE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 08:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bcJZ26VXG/gu6ikmOI2/RQbHSOjDVYeK23yQepNHrJY=; b=bwtadTEOYk7BrooLIxru0xjokl
 EBrFm3TnWaFlIHBlK8TO85l8j0+jeiKCjUUI6BxVV1IOAvyNdYqbUYnyCyIkGgO8Ww3UWiqqrOrO/
 Ykdph6Gnxz1tmXX1mKifa6lvu+6c5BnZtQxQWa1s99mFVTPecNsgVSX/eOGSiuKJsavU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bcJZ26VXG/gu6ikmOI2/RQbHSOjDVYeK23yQepNHrJY=; b=As57lotn4+3yujO35p5zRMfbrV
 iz4XmVCqXxGYxN3BTFAtP8F5tYCHf+lUJqDZEix8tEl4mvJOiJr5juDGjZy4sfya/m3DCw7niXZ25
 zjcd5mA9+9g94Cg2RtN8dBmzo1JXfBoe4h6oeGskKn4DYwmXbD6aEoMElmqxR/23LYtU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mfegH-00145b-Nd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 08:53:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B90461040;
 Wed, 27 Oct 2021 03:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635305440;
 bh=M25rnGJin3VrfE9vOdyDuX7PA6I/ojuVYJkfHZIsWDk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kd6A/2GCNYbXl505bw5MIPIg1EDywd2ENj+v3D3JE22nnw6uytbWNBO5FoIqF1wG9
 sOuH4ugUQJdd9FVPREM7nqFlsXi5IALAui/0ZBGcvB+QvtUHdTEsFWIt146Wt7yXmG
 h3s3GZ4UJY6uLto92cDwDdAE/uBeUEYsy5EsXhxr1e3S05xSvuNCTvYhHrCmFDU5yI
 6Dy/WYdjnHWBmWEZK4yBEjVp8nu3eHyiXLhyO9yABwrcGRm1c02+x9tes9uZe+WNkP
 bNpNimOG3h5lPz59krjW6Melrod0rBFo4zX5iJArJ+hjsI4C6DioQLUCampFDir5Sb
 u+sxO4VNntRfg==
Message-ID: <6f503a58-0682-143b-b7c2-24390eaaae9f@kernel.org>
Date: Wed, 27 Oct 2021 11:30:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: fengnan chang <fengnanchang@gmail.com>
References: <20211009112744.33698-1-changfengnan@vivo.com>
 <20211009112744.33698-2-changfengnan@vivo.com>
 <66a243ca-53ed-cb8b-064b-5f0d3c954579@kernel.org>
 <CALWNXx-cHN3TduduXP2cNmVPR0V5J0Ea8RQ5fcw91Q3pmFvUxg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CALWNXx-cHN3TduduXP2cNmVPR0V5J0Ea8RQ5fcw91Q3pmFvUxg@mail.gmail.com>
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/10/16 16:01, fengnan chang wrote: > Chao Yu <chao@kernel.org>
    于2021年10月13日周三 下午11:19写道： >> >> On 2021/10/9 19:27,
    Fengnan Chang wrote: >>> For now, overwrite file with di [...] 
 
 Content analysis details:   (-8.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -2.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mfegH-00145b-Nd
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xMC8xNiAxNjowMSwgZmVuZ25hbiBjaGFuZyB3cm90ZToKPiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+IOS6jjIwMjHlubQxMOaciDEz5pel5ZGo5LiJIOS4i+WNiDExOjE55YaZ6YGT
77yaCj4+Cj4+IE9uIDIwMjEvMTAvOSAxOToyNywgRmVuZ25hbiBDaGFuZyB3cm90ZToKPj4+IEZv
ciBub3csIG92ZXJ3cml0ZSBmaWxlIHdpdGggZGlyZWN0IGlvIHVzZSBpbnBsYWNlIHBvbGljeSwg
YnV0Cj4+PiBub3QgY291bnRlZCwgZml4IGl0LiBBbmQgdXNlIHN0YXRfYWRkX2lucGxhY2VfYmxv
Y2tzKHNiaSwgMSwgKQo+Pj4gaW5zdGVhZCBvZiBzdGF0X2luY19pbnBsYWNlX2Jsb2NrcyhzYiwg
KS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2
by5jb20+Cj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvZGF0YS5jICAgIHwgNCArKystCj4+PiAgICBm
cy9mMmZzL2YyZnMuaCAgICB8IDggKysrKy0tLS0KPj4+ICAgIGZzL2YyZnMvc2VnbWVudC5jIHwg
MiArLQo+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMK
Pj4+IGluZGV4IGMxNDkwYjlhMTM0NS4uNzc5OGY3MjM2Mzc2IDEwMDY0NAo+Pj4gLS0tIGEvZnMv
ZjJmcy9kYXRhLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+PiBAQCAtMTU1Myw3ICsxNTUz
LDkgQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJm
c19tYXBfYmxvY2tzICptYXAsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290
byBzeW5jX291dDsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgYmxrYWRkciA9IGRuLmRhdGFf
YmxrYWRkcjsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUs
IEZJX0FQUEVORF9XUklURSk7Cj4+PiAtICAgICAgICAgICAgIH0KPj4+ICsgICAgICAgICAgICAg
fSBlbHNlIGlmICghZjJmc19sZnNfbW9kZShzYmkpICYmIGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tf
UFJFX0RJTyAmJgo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFwLT5tX21heV9j
cmVhdGUgJiYgY3JlYXRlKQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHN0YXRfYWRkX2lucGxh
Y2VfYmxvY2tzKHNiaSwgMSwgdHJ1ZSk7Cj4+Cj4+IFdoYXQgYWJvdXQgdGhpcyBjYXNlPwo+Pgo+
PiAtIGYyZnNfcHJlYWxsb2NhdGVfYmxvY2tzCj4+ICAgIC0gZjJmc19tYXBfYmxvY2tzCj4+ICAg
ICAtIHN0YXRfYWRkX2lucGxhY2VfYmxvY2tzCj4+ICAgICBtYXAubV9sZW4gPiAwICYmIGVyciA9
PSAtRU5PU1BDCj4+ICAgICBlcnIgPSAwOwo+PiAtIF9fZ2VuZXJpY19maWxlX3dyaXRlX2l0ZXIK
Pj4gICAgLSBnZW5lcmljX2ZpbGVfZGlyZWN0X3dyaXRlCj4+ICAgICAtIGYyZnNfZGlyZWN0X0lP
Cj4+ICAgICAgLSBnZXRfZGF0YV9ibG9ja19kaW9fd3JpdGUKPj4gICAgICAgLSBfX2FsbG9jYXRl
X2RhdGFfYmxvY2sKPj4gICAgICAgIC0gc3RhdF9pbmNfYmxvY2tfY291bnQKPj4KPj4gRElPIGJs
b2NrcyB3aWxsIGJlIGFjY291bnRlZCBpbnRvIGRpZmZlcmVudCB0eXBlPyBJSVVDLgo+IFllcywg
aXQgd2lsbCBiZSBhY2NvdW50ZWQgaW50byBkaWZmZXJlbnQgdHlwZSwgIElQVSBhbmQgTEZTLCBi
dXQgaXQKPiB3aWxsIG5vdCBhY2NvdW50ZWQgaW50byBib3RoIGluIHNhbWUgdGltZSBmb3Igb25l
IGJsb2NrLgoKTm90IHN1cmUgdGhpcyBpcyByaWdodCwgc2luY2UgYWxsIHdyaXRlcyBzaG91bGQg
YmUgYWNjb3VudGVkIGludG8gTEZTLgoKPiAKPiByb290QGt2bS14ZnN0ZXN0czovbW50IyBjYXQg
L3N5cy9rZXJuZWwvZGVidWcvZjJmcy9zdGF0dXMgfGdyZXAgU1NSIC1DIDIKPiAgICAgICAgICAg
ICBidWZmZXIgICAgIGRpcmVjdCAgIHNlZ21lbnRzCj4gSVBVOiAgICAgICAgICAgMTYgICAgICAg
ICAzMiAgICAgICAgTi9BCj4gU1NSOiAgICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAw
Cj4gTEZTOiAgICAgICAgICAgMzggICAgICAgICA0OCAgICAgICAgICAwCj4gcm9vdEBrdm0teGZz
dGVzdHM6L21udCMgZGQgaWY9L2Rldi96ZXJvIG9mPS4vMSBicz0zMksgY291bnQ9MSBvZmxhZz1k
aXJlY3QKPiByb290QGt2bS14ZnN0ZXN0czovbW50IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZjJm
cy9zdGF0dXMgfGdyZXAgU1NSIC1DIDIKPiAgICAgICAgICAgICBidWZmZXIgICAgIGRpcmVjdCAg
IHNlZ21lbnRzCj4gSVBVOiAgICAgICAgICAgMTYgICAgICAgICAzMiAgICAgICAgTi9BCj4gU1NS
OiAgICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwCj4gTEZTOiAgICAgICAgICAgMzgg
ICAgICAgICA1NiAgICAgICAgICAwCj4gCj4gcm9vdEBrdm0teGZzdGVzdHM6L21udCMgZGQgaWY9
L2Rldi96ZXJvIG9mPS4vMSBicz0zMksgY291bnQ9MQo+IG9mbGFnPWRpcmVjdCBjb252PW5vdHJ1
bmMKPiByb290QGt2bS14ZnN0ZXN0czovbW50IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZjJmcy9z
dGF0dXMgfGdyZXAgU1NSIC1DIDIKPiAgICAgICAgICAgICBidWZmZXIgICAgIGRpcmVjdCAgIHNl
Z21lbnRzCj4gSVBVOiAgICAgICAgICAgMTYgICAgICAgICA0MCAgICAgICAgTi9BCj4gU1NSOiAg
ICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwCj4gTEZTOiAgICAgICAgICAgMzggICAg
ICAgICA1NiAgICAgICAgICAwCj4gCj4gcm9vdEBrdm0teGZzdGVzdHM6L21udCMgZGQgaWY9L2Rl
di96ZXJvIG9mPS4vMSBicz0zMksgY291bnQ9Mgo+IG9mbGFnPWRpcmVjdCBjb252PW5vdHJ1bmMK
PiByb290QGt2bS14ZnN0ZXN0czovbW50IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZjJmcy9zdGF0
dXMgfGdyZXAgU1NSIC1DIDIKPiAgICAgICAgICAgICBidWZmZXIgICAgIGRpcmVjdCAgIHNlZ21l
bnRzCj4gSVBVOiAgICAgICAgICAgMTYgICAgICAgICA0OCAgICAgICAgTi9BCj4gU1NSOiAgICAg
ICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwCj4gTEZTOiAgICAgICAgICAgNDEgICAgICAg
ICA2NCAgICAgICAgICAwCj4gCj4gCj4+Cj4+PiAgICAgICAgfSBlbHNlIHsKPj4+ICAgICAgICAg
ICAgICAgIGlmIChjcmVhdGUpIHsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHVubGlr
ZWx5KGYyZnNfY3BfZXJyb3Ioc2JpKSkpIHsKPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMu
aCBiL2ZzL2YyZnMvZjJmcy5oCj4+PiBpbmRleCBiZjJlNzNlNDYzMDQuLmE3ZGE4MzZjYTY0ZiAx
MDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+
Pj4gQEAgLTM3ODUsMTIgKzM3ODUsMTIgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZjJmc19zdGF0
X2luZm8gKkYyRlNfU1RBVChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+PiAgICAgICAgICAg
ICAgICBlbHNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAoKHNiaSktPmJsb2NrX2Nv
dW50WzFdWyhjdXJzZWcpLT5hbGxvY190eXBlXSsrKTsgICAgICAgIFwKPj4+ICAgICAgICB9IHdo
aWxlICgwKQo+Pj4gLSNkZWZpbmUgc3RhdF9pbmNfaW5wbGFjZV9ibG9ja3Moc2JpLCBkaXJlY3Rf
aW8pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+PiArI2RlZmluZSBz
dGF0X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIGNvdW50LCBkaXJlY3RfaW8pICAgICAgICAgICAg
ICAgICAgICAgICBcCj4+PiAgICAgICAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+ICAgICAgICAgICAgICAgIGlmIChk
aXJlY3RfaW8pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4g
LSAgICAgICAgICAgICAgICAgICAgIChhdG9taWNfaW5jKCYoc2JpKS0+aW5wbGFjZV9jb3VudFsw
XSkpOyAgICAgICAgIFwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAoYXRvbWljX2FkZChjb3Vu
dCwgJihzYmkpLT5pbnBsYWNlX2NvdW50WzBdKSk7ICBcCj4+PiAgICAgICAgICAgICAgICBlbHNl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgIChhdG9taWNfaW5jKCYoc2JpKS0+aW5wbGFj
ZV9jb3VudFsxXSkpOyAgICAgICAgIFwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAoYXRvbWlj
X2FkZChjb3VudCwgJihzYmkpLT5pbnBsYWNlX2NvdW50WzFdKSk7ICBcCj4+Cj4+IElmIGNvdW50
IGFsd2F5cyBiZSBvbmUsIHdlIGNhbiBqdXN0IGtlZXAgdG8gdXNlIGF0b21pY19pbmMoKSBoZXJl
Pwo+Pgo+IEkgc3VnZ2VzdCBub3QsIHdlIG1heSB1c2UgdGhpcyBpbiBsYXRlciBwYXRjaCwgbm90
IHJlYWR5IGZvciBub3cuCgpJIGRvbid0IHRoaW5rcyB0aGlzIGlzIHRoZSByaWdodCB3YXksIHdo
eSBub3QgaW5jbHVkaW5nIGFib3ZlIGNoYW5nZSBpbiB5b3VyIGxhdGVyIHBhdGNoPwoKVGhhbmtz
LAoKPiAKPj4gVGhhbmtzLAo+Pgo+Pj4gICAgICAgIH0gd2hpbGUgKDApCj4+PiAgICAjZGVmaW5l
IHN0YXRfdXBkYXRlX21heF9hdG9taWNfd3JpdGUoaW5vZGUpICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPj4+ICAgICAgICBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4gQEAgLTM4NzcsNyArMzg3Nyw3IEBAIHZvaWQg
ZjJmc191cGRhdGVfc2l0X2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPj4+ICAgICNk
ZWZpbmUgc3RhdF9pbmNfbWV0YV9jb3VudChzYmksIGJsa2FkZHIpICAgICAgICAgICBkbyB7IH0g
d2hpbGUgKDApCj4+PiAgICAjZGVmaW5lIHN0YXRfaW5jX3NlZ190eXBlKHNiaSwgY3Vyc2VnKSAg
ICAgICAgICAgICAgICAgICAgICBkbyB7IH0gd2hpbGUgKDApCj4+PiAgICAjZGVmaW5lIHN0YXRf
aW5jX2Jsb2NrX2NvdW50KHNiaSwgY3Vyc2VnLCBkaXJlY3RfaW8pICAgICAgICBkbyB7IH0gd2hp
bGUgKDApCj4+PiAtI2RlZmluZSBzdGF0X2luY19pbnBsYWNlX2Jsb2NrcyhzYmksIGRpcmVjdF9p
bykgICAgICAgICAgICAgIGRvIHsgfSB3aGlsZSAoMCkKPj4+ICsjZGVmaW5lIHN0YXRfYWRkX2lu
cGxhY2VfYmxvY2tzKHNiaSwgY291bnQsIGRpcmVjdF9pbykgICAgICAgZG8geyB9IHdoaWxlICgw
KQo+Pj4gICAgI2RlZmluZSBzdGF0X2luY19zZWdfY291bnQoc2JpLCB0eXBlLCBnY190eXBlKSAg
ICAgICAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+Pj4gICAgI2RlZmluZSBzdGF0X2luY190b3Rf
YmxrX2NvdW50KHNpLCBibGtzKSAgICAgICAgICAgIGRvIHsgfSB3aGlsZSAoMCkKPj4+ICAgICNk
ZWZpbmUgc3RhdF9pbmNfZGF0YV9ibGtfY291bnQoc2JpLCBibGtzLCBnY190eXBlKSBkbyB7IH0g
d2hpbGUgKDApCj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3Nl
Z21lbnQuYwo+Pj4gaW5kZXggZGVkNzQ0ZTg4MGQwLi5jNTQyYzRiNjg3Y2EgMTAwNjQ0Cj4+PiAt
LS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+IEBA
IC0zNjExLDcgKzM2MTEsNyBAQCBpbnQgZjJmc19pbnBsYWNlX3dyaXRlX2RhdGEoc3RydWN0IGYy
ZnNfaW9faW5mbyAqZmlvKQo+Pj4gICAgICAgICAgICAgICAgZ290byBkcm9wX2JpbzsKPj4+ICAg
ICAgICB9Cj4+Pgo+Pj4gLSAgICAgc3RhdF9pbmNfaW5wbGFjZV9ibG9ja3MoZmlvLT5zYmksIGZh
bHNlKTsKPj4+ICsgICAgIHN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgMSwgZmFsc2UpOwo+
Pj4KPj4+ICAgICAgICBpZiAoZmlvLT5iaW8gJiYgIShTTV9JKHNiaSktPmlwdV9wb2xpY3kgJiAo
MSA8PCBGMkZTX0lQVV9OT0NBQ0hFKSkpCj4+PiAgICAgICAgICAgICAgICBlcnIgPSBmMmZzX21l
cmdlX3BhZ2VfYmlvKGZpbyk7Cj4+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=

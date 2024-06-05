Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD318FC366
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jun 2024 08:27:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEk6q-0006qK-OQ;
	Wed, 05 Jun 2024 06:26:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sEk6p-0006q9-Br
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 06:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P5gqN15TfGvikC7PR4awhLmfAVw1tNaLll7mY69w77I=; b=gLiEZtukD8M0q6Nr/Anwqqk6q+
 oyfaVoOH/LTJQkhA/SwgqFOAkpHgWfkkIRV9h/ArLQZ1zBvTBZh9CspymXKxSSHHT+JL13hu6kZzm
 P0rX7WWddmr4Xaz1uzSK3hzmzqqfx0ccDV5fX4QbfOfVnn3PLefL8/HSTL0DMxTDF5BE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P5gqN15TfGvikC7PR4awhLmfAVw1tNaLll7mY69w77I=; b=Irl2o55wAfzrtfRkGKf8Vxf1UL
 R+ty4riZqgDyB9Q5fi4urrlWTmlBJjx42BXq8li9jYNZ6Mr7GB38OwuCoL8nL+ObN8ozWDDjgVwQV
 OzAnpdMt+rHW4JF+xlMTLycXFja1j3sD+46n0LlSjkjJIP4GFYDSKvcKBOa+o4eVwMlc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sEk6p-0004hs-7k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 06:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BE89BCE131C;
 Wed,  5 Jun 2024 06:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616A9C3277B;
 Wed,  5 Jun 2024 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717568807;
 bh=IXMKdluWSokuKmfry9bRDdN4VIUiQ62g4lszzj1OC84=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FNTuVMXPj/QrpiP00WtcgI3kCnE9wRqB+6SLPlyz2tITBYs2WcFbOUwYvS0JrftWY
 l4VJEO4/dXT5oczM7C3+AaiNxqplAZIUn9ED5pIIJXGs9WvDr0ulAoPUNhljOiM8Ar
 qlOWJ+xDzoQUMghiYQJ8kS4Hy9iSp4cUV+GjuByaQ2geSfBtN4Bxp69CkWIYucMLgr
 0dcj9nPWdrfyLFzOxuqV8hjjb8MRZjfsChdQldYsKKBvIwgi9JEgGNBMjLizAd4GUV
 ETiF4tQTYMwPBCc6KXdPv91T50Ig39EbT0omVv2Dyl2Fy/q/gaoJCopUc5wmQiEaxi
 FT0sZpnBm238g==
Message-ID: <0c52e657-9872-4dfa-9c4d-83d74f0c9b07@kernel.org>
Date: Wed, 5 Jun 2024 14:26:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
 <446c7e4a-2a1e-402d-8238-2eee7cdfd5c2@kernel.org>
 <CAHJ8P3J2NkSfVTEcpxR+n3CjtywMxxEDMg4cLSL=8UOX8KcM+Q@mail.gmail.com>
 <8b841ec1-cb43-462a-9e87-aecdb0755318@kernel.org>
 <CAHJ8P3K_u=ZmXaMF5jUu_MPSJPAhKmEx4hyaTinMQ=nnLQ9aRA@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3K_u=ZmXaMF5jUu_MPSJPAhKmEx4hyaTinMQ=nnLQ9aRA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/6/5 13:59, Zhiguo Niu wrote: > On Wed, Jun 5, 2024
    at 11:48 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/6/3 17:05, Zhiguo
    Niu wrote: >>> On Mon, Jun 3, 2024 at 3:41 PM Chao Yu <chao@ [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [145.40.73.55 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sEk6p-0004hs-7k
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable atgc if atgc_age_threshold from
 user is less than elapsed_time
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC82LzUgMTM6NTksIFpoaWd1byBOaXUgd3JvdGU6Cj4gT24gV2VkLCBKdW4gNSwgMjAy
NCBhdCAxMTo0OOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9u
IDIwMjQvNi8zIDE3OjA1LCBaaGlndW8gTml1IHdyb3RlOgo+Pj4gT24gTW9uLCBKdW4gMywgMjAy
NCBhdCAzOjQx4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+Pj4+
IE9uIDIwMjQvNS8yMCAxOTozNiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+Pj4gTm93IGF0Z2MgY2Fu
IGJlIGVuYWJsZWQgYmFzZWQgb24gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgo+Pj4+PiAtQVRH
QyBtb3VudCBvcHRpb24gaXMgc2V0Cj4+Pj4+IC1lbGFwc2VkX3RpbWUgaXMgbW9yZSB0aGFuIGF0
Z2NfYWdlX3RocmVzaG9sZCBhbHJlYWR5Cj4+Pj4+IGJ1dCB0aGVzZSBjb25kaXRpb25zIGFyZSBj
aGVjayB3aGVuIHVtb3VudGVkLT5tb3VudGVkIGRldmljZSBhZ2Fpbi4KPj4+Pj4gSWYgdGhlIGRl
dmljZSBoYXMgbm90IGJlIHVtb3VudGVkLT5tb3VudGVkIGZvciBhIGxvbmcgdGltZSwgYXRnYyBj
YW4KPj4+Pj4gbm90IHdvcmsgZXZlbiB0aGUgYWJvdmUgY29uZGl0aW9ucyBtZXQuCj4+Pj4+Cj4+
Pj4+IEl0IGlzIGJldHRlciB0byBlbmFibGUgYXRnYyBkeW5hbWljbGx5IHdoZW4gdXNlciBjaGFu
Z2UgYXRnY19hZ2VfdGhyZXNob2xkCj4+Pj4+IG1lYW53aGlsZSB0aGlzIHZhbGUgaXMgbGVzcyB0
aGFuIGVsYXBzZWRfdGltZSBhbmQgQVRHQyBtb3VudCBvcHRpb24gaXMgb24uCj4+Pj4+Cj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPj4+Pj4g
LS0tCj4+Pj4+ICAgICBmcy9mMmZzL2YyZnMuaCAgICB8ICAxICsKPj4+Pj4gICAgIGZzL2YyZnMv
c2VnbWVudC5jIHwgIDkgKysrKy0tLS0tCj4+Pj4+ICAgICBmcy9mMmZzL3N5c2ZzLmMgICB8IDE2
ICsrKysrKysrKysrKysrKysKPj4+Pj4gICAgIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJm
cy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gaW5kZXggMTk3NGI2YS4uZTQ0MWQyZCAxMDA2NDQK
Pj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+
Pj4gQEAgLTM2OTQsNiArMzY5NCw3IEBAIHZvaWQgZjJmc19jbGVhcl9wcmVmcmVlX3NlZ21lbnRz
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4gICAgIGludCBmMmZzX2luaXRfaW5tZW1f
Y3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4+Pj4+ICAgICB2b2lkIGYyZnNfc2F2
ZV9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPj4+Pj4gICAgIHZvaWQg
ZjJmc19yZXN0b3JlX2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+Pj4+
PiAraW50IGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+
Pj4+PiAgICAgaW50IGYyZnNfYWxsb2NhdGVfc2VnbWVudF9mb3JfcmVzaXplKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwgaW50IHR5cGUsCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc3RhcnQsIHVuc2lnbmVkIGludCBlbmQpOwo+Pj4+
PiAgICAgaW50IGYyZnNfYWxsb2NhdGVfbmV3X3NlY3Rpb24oc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLCBpbnQgdHlwZSwgYm9vbCBmb3JjZSk7Cj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3Nl
Z21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+Pj4+IGluZGV4IDcxZGM4MDQyLi40NDkyM2Q0
IDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+PiArKysgYi9mcy9mMmZz
L3NlZ21lbnQuYwo+Pj4+PiBAQCAtMjkzMSwxNCArMjkzMSwxMSBAQCBzdGF0aWMgaW50IGdldF9h
dHNzcl9zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUsCj4+Pj4+ICAg
ICAgICAgcmV0dXJuIHJldDsKPj4+Pj4gICAgIH0KPj4+Pj4KPj4+Pj4gLXN0YXRpYyBpbnQgX19m
MmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+PiAraW50
IGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+Pj4+ICAg
ICB7Cj4+Pj4+ICAgICAgICAgc3RydWN0IGN1cnNlZ19pbmZvICpjdXJzZWcgPSBDVVJTRUdfSShz
YmksIENVUlNFR19BTExfREFUQV9BVEdDKTsKPj4+Pj4gICAgICAgICBpbnQgcmV0ID0gMDsKPj4+
Pj4KPj4+Pj4gLSAgICAgaWYgKCFzYmktPmFtLmF0Z2NfZW5hYmxlZCkKPj4+Pj4gLSAgICAgICAg
ICAgICByZXR1cm4gMDsKPj4+Pj4gLQo+Pj4+PiAgICAgICAgIGYyZnNfZG93bl9yZWFkKCZTTV9J
KHNiaSktPmN1cnNlZ19sb2NrKTsKPj4+Pj4KPj4+Pj4gICAgICAgICBtdXRleF9sb2NrKCZjdXJz
ZWctPmN1cnNlZ19tdXRleCk7Cj4+Pj4+IEBAIC0yOTU1LDcgKzI5NTIsOSBAQCBzdGF0aWMgaW50
IF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4+Pj4g
ICAgIH0KPj4+Pj4gICAgIGludCBmMmZzX2luaXRfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSkKPj4+Pj4gICAgIHsKPj4+Pj4gLSAgICAgcmV0dXJuIF9fZjJmc19pbml0X2F0
Z2NfY3Vyc2VnKHNiaSk7Cj4+Pj4+ICsgICAgIGlmICghc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4+
Pj4+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4+Pj4+ICsgICAgIHJldHVybiBmMmZzX2luaXRf
YXRnY19jdXJzZWcoc2JpKTsKPj4+Pj4gICAgIH0KPj4+Pj4KPj4+Pj4gICAgIHN0YXRpYyB2b2lk
IF9fZjJmc19zYXZlX2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0
eXBlKQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5j
Cj4+Pj4+IGluZGV4IDA5ZDNlY2YuLjcyNjc2YzUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMv
c3lzZnMuYwo+Pj4+PiArKysgYi9mcy9mMmZzL3N5c2ZzLmMKPj4+Pj4gQEAgLTY3Myw2ICs2NzMs
MjIgQEAgc3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNfYXR0ciAqYSwKPj4+
Pj4gICAgICAgICAgICAgICAgIHJldHVybiBjb3VudDsKPj4+Pj4gICAgICAgICB9Cj4+Pj4+Cj4+
Pj4+ICsgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImF0Z2NfYWdlX3RocmVzaG9sZCIp
KSB7Cj4+Pj4+ICsgICAgICAgICAgICAgaWYgKHQgPCAwKQo+Pj4+PiArICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+ICsgICAgICAgICAgICAgc2JpLT5hbS5hZ2VfdGhy
ZXNob2xkID0gdDsKPj4+Pj4gKyAgICAgICAgICAgICBpZiAoc2JpLT5hbS5hdGdjX2VuYWJsZWQp
Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4+Pj4+ICsKPj4+Pj4g
KyAgICAgICAgICAgICBpZiAodGVzdF9vcHQoc2JpLCBBVEdDKSAmJgo+Pj4+PiArICAgICAgICAg
ICAgICAgICAgICAgbGU2NF90b19jcHUoc2JpLT5ja3B0LT5lbGFwc2VkX3RpbWUpID49IHQpIHsK
Pj4+Pgo+Pj4gSGkgQ2hhbywKPj4+PiBPaCwgSSBndWVzcyB5b3Ugd2FudCB0byBmaXggdGhpczoK
Pj4+IFllcywgIFNvcnJ5IGZvciBub3QgbWFraW5nIGl0IGNsZWFyIGJlZm9yZS4KPj4+Pgo+Pj4+
IHN0YXRpYyB2b2lkIGluaXRfYXRnY19tYW5hZ2VtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSkKPj4+PiB7Cj4+Pj4gLi4uCj4+Pj4gICAgICAgICAgIGlmICh0ZXN0X29wdChzYmksIEFUR0Mp
ICYmCj4+Pj4gICAgICAgICAgICAgICAgICAgU0lUX0koc2JpKS0+ZWxhcHNlZF90aW1lID49IERF
Rl9HQ19USFJFQURfQUdFX1RIUkVTSE9MRCkKPj4+PiAgICAgICAgICAgICAgICAgICBhbS0+YXRn
Y19lbmFibGVkID0gdHJ1ZTsKPj4+Pgo+Pj4+IFdoYXQgYWJvdXQgZW5hYmxpbmcgYXRnY19lbmFi
bGVkIGR1cmluZyBjaGVja3BvaW50IG9uY2UgZWxhcHNlZCB0aW1lIGlzCj4+Pj4gc2F0aXNmZWQg
dy8gdGhlIGNvbmRpdGlvbj8gSSBndWVzcyB0aGlzIGNhbiBnaXZlIGFub3RoZXIgY2hhbmNlIHdo
ZW5ldmVyCj4+Pj4gQ1AgaXMgYmVlbiB0cmlnZ2VyZWQsIGFuZCBpdCBjYW4gYXZvaWQgdGhlIHJh
Y2luZyBjb25kaXRpb24gYXMgd2VsbC4KPj4+IDEuIEknbSBub3Qgc3VyZSBpZiB0aGlzIHdpbGwg
aW5jcmVhc2UgY2hlY2twb2ludCB0aW1lIGNvbnN1bXB0aW9uPwo+Pgo+PiBTaW5jZSBpdCB3b24n
dCBpbmNyZWFzZSBhbnkgSU8gdGltZSwgSSBndWVzcyBpdCdzIGZpbmUgdG9sZXJhdGUgdGltZSBj
b25zdW1lZAo+PiBieSBpbml0aWFsaXphdGlvbiBvZiBhdGdjIGN1cnNlZy4KPj4KPj4+IDIuIGR5
bmFtaWNhbGx5IGVuYWJsaW5nIGF0Z2MgbWF5IGhhdmUgb3RoZXIgcHJvYmxlbXMuIElzIHRoaXMg
Y29uZmlybWVkPwo+Pgo+PiBJIHRoaW5rIHNvLCBjaGVja3BvaW50IGhhcyBhdm9pZGVkIG1vc3Qg
cmFjZSBjYXNlcy4KPj4KPj4gU28sIGhvdyBkbyB5b3UgdGhpbmsgb2YgYmVsb3cgZGlmZjoKPiBI
aSBDaGFvLAo+ICAgSSB0aGluayBmbG93IGlzIG9rLCAgc29tZSBkZXRhaWxzIG5lZWQgdG8gYmUg
ZGlzY3Vzc2VkLgo+Pgo+PiAtLS0KPj4gICAgZnMvZjJmcy9jaGVja3BvaW50LmMgfCAgMiArKwo+
PiAgICBmcy9mMmZzL2YyZnMuaCAgICAgICB8ICAxICsKPj4gICAgZnMvZjJmcy9zZWdtZW50LmMg
ICAgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKy0tLQo+PiAgICAzIGZpbGVzIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2NoZWNrcG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4+IGluZGV4IDU1ZDQ0NGJl
YzVjMC4uNGE3M2JkNDgxYTI1IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+
PiArKysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+PiBAQCAtMTcxOCw2ICsxNzE4LDggQEAgaW50
IGYyZnNfd3JpdGVfY2hlY2twb2ludChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBj
cF9jb250cm9sICpjcGMpCj4+ICAgICAgICAgIH0KPj4KPj4gICAgICAgICAgZjJmc19yZXN0b3Jl
X2lubWVtX2N1cnNlZyhzYmkpOwo+PiArICAgICAgIGYyZnNfcmVpbml0X2F0Z2NfY3Vyc2VnKHNi
aSk7Cj4+ICsKPj4gICAgICAgICAgc3RhdF9pbmNfY3BfY291bnQoc2JpKTsKPj4gICAgc3RvcDoK
Pj4gICAgICAgICAgdW5ibG9ja19vcGVyYXRpb25zKHNiaSk7Cj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+IGluZGV4IDk2ODhkZjMzMjE0Ny4uOGQzODVh
MWM3NWFkIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+PiArKysgYi9mcy9mMmZzL2Yy
ZnMuaAo+PiBAQCAtMzY5Myw2ICszNjkzLDcgQEAgdm9pZCBmMmZzX3JlbGVhc2VfZGlzY2FyZF9h
ZGRycyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+PiAgICBpbnQgZjJmc19ucGFnZXNfZm9y
X3N1bW1hcnlfZmx1c2goc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBib29sIGZvcl9yYSk7Cj4+
ICAgIGJvb2wgZjJmc19zZWdtZW50X2hhc19mcmVlX3Nsb3Qoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLCBpbnQgc2Vnbm8pOwo+PiAgICBpbnQgZjJmc19pbml0X2lubWVtX2N1cnNlZyhzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkpOwo+PiAraW50IGYyZnNfcmVpbml0X2F0Z2NfY3Vyc2VnKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4+ICAgIHZvaWQgZjJmc19zYXZlX2lubWVtX2N1cnNlZyhz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+PiAgICB2b2lkIGYyZnNfcmVzdG9yZV9pbm1lbV9j
dXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPj4gICAgaW50IGYyZnNfYWxsb2NhdGVf
c2VnbWVudF9mb3JfcmVzaXplKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUsCj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+IGlu
ZGV4IGJkYzIyNDczODdlOC4uNmQ0MjczZmFmMDYxIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL3Nl
Z21lbnQuYwo+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+PiBAQCAtMjk0OSwxMiArMjk0OSwx
MiBAQCBzdGF0aWMgaW50IGdldF9hdHNzcl9zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwgaW50IHR5cGUsCj4+ICAgICAgICAgIHJldHVybiByZXQ7Cj4+ICAgIH0KPj4KPj4gLXN0YXRp
YyBpbnQgX19mMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+
PiArc3RhdGljIGludCBfX2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIGJvb2wgZm9yY2UpCj4+ICAgIHsKPj4gICAgICAgICAgc3RydWN0IGN1cnNlZ19pbmZv
ICpjdXJzZWcgPSBDVVJTRUdfSShzYmksIENVUlNFR19BTExfREFUQV9BVEdDKTsKPj4gICAgICAg
ICAgaW50IHJldCA9IDA7Cj4+Cj4+IC0gICAgICAgaWYgKCFzYmktPmFtLmF0Z2NfZW5hYmxlZCkK
Pj4gKyAgICAgICBpZiAoIXNiaS0+YW0uYXRnY19lbmFibGVkICYmICFmb3JjZSkKPiBJcyB0aGlz
IHBhcmFtZXRlciAgImZvcmNlIiB1bm5lY2Vzc2FyeT8KPiBpbiBtb3VudCBmbG93LCBldmVuIGF0
Z2MgZW5hYmxlIGNvbmRpdGlvbnMgYXJlIGFsbCBtZXQsIGl0IGlzIG5vdAo+IGVuYWJsZWQgYmVj
YXVzZSBvZiBmb3JjZT1mYWxzZS4KPiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+PiAgICAg
ICAgICAgICAgICAgIHJldHVybiAwOwo+Pgo+PiAgICAgICAgICBmMmZzX2Rvd25fcmVhZCgmU01f
SShzYmkpLT5jdXJzZWdfbG9jayk7Cj4+IEBAIC0yOTcxLDkgKzI5NzEsMjkgQEAgc3RhdGljIGlu
dCBfX2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+ICAg
ICAgICAgIGYyZnNfdXBfcmVhZCgmU01fSShzYmkpLT5jdXJzZWdfbG9jayk7Cj4+ICAgICAgICAg
IHJldHVybiByZXQ7Cj4+ICAgIH0KPj4gKwo+PiAgICBpbnQgZjJmc19pbml0X2lubWVtX2N1cnNl
ZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+ICAgIHsKPj4gLSAgICAgICByZXR1cm4gX19m
MmZzX2luaXRfYXRnY19jdXJzZWcoc2JpKTsKPj4gKyAgICAgICByZXR1cm4gX19mMmZzX2luaXRf
YXRnY19jdXJzZWcoc2JpLCBmYWxzZSk7Cj4+ICt9Cj4+ICsKPj4gK2ludCBmMmZzX3JlaW5pdF9h
dGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+ICt7Cj4+ICsgICAgICAgaW50
IHJldDsKPj4gKwo+PiArICAgICAgIGlmICghdGVzdF9vcHQoc2JpLCBBVEdDKSkKPj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+PiArICAgICAgIGlmIChzYmktPmFtLmF0Z2NfZW5hYmxlZCkK
Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+PiArICAgICAgIGlmIChTSVRfSShzYmkpLT5l
bGFwc2VkX3RpbWUgPCBzYmktPmFtLmFnZV90aHJlc2hvbGQpCj4gU0lUKHNiaSktPmVsYXBzZWRf
dGltZSBpcyBqdXN0IHVwZGF0ZWQgaW4gbW91bnQgZmxvdywgc28KPiBja3B0LT5lbGFwc2VkX3Rp
bWUgaXMgIG1vcmUgc3VpdGFibGUgaGVyZT8KCkFncmVlZCwgaXQgbmVlZHMgdG8gYmUgZml4ZWQu
CgpDYW4geW91IHBsZWFzZSB1cGRhdGUgdGhvc2UgY2hhbmdlcyBpbnRvIHYyPwoKVGhhbmtzLAoK
PiB0aGFua3MhCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4gKwo+PiArICAgICAgIHJl
dCA9IF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSwgdHJ1ZSk7Cj4+ICsgICAgICAgaWYgKCFy
ZXQpIHsKPj4gKyAgICAgICAgICAgICAgIHNiaS0+YW0uYXRnY19lbmFibGVkID0gdHJ1ZTsKPj4g
KyAgICAgICAgICAgICAgIGYyZnNfaW5mbyhzYmksICJyZWVuYWJsZWQgYWdlIHRocmVzaG9sZCBH
QyIpOwo+PiArICAgICAgIH0KPj4gKyAgICAgICByZXR1cm4gcmV0Owo+PiAgICB9Cj4+Cj4+ICAg
IHN0YXRpYyB2b2lkIF9fZjJmc19zYXZlX2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIGludCB0eXBlKQo+PiAtLQo+PiAyLjQwLjEKPj4KPj4+IHRoYW5rc++8gQo+Pj4+Cj4+
Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoZjJmc19pbml0
X2F0Z2NfY3Vyc2VnKHNiaSkpCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgc2JpLT5hbS5hdGdjX2Vu
YWJsZWQgPSB0cnVlOwo+Pj4+PiArICAgICAgICAgICAgIH0KPj4+Pj4gKyAgICAgICAgICAgICBy
ZXR1cm4gY291bnQ7Cj4+Pj4+ICsgICAgIH0KPj4+Pj4gKwo+Pj4+PiAgICAgICAgIGlmICghc3Ry
Y21wKGEtPmF0dHIubmFtZSwgImdjX3NlZ21lbnRfbW9kZSIpKSB7Cj4+Pj4+ICAgICAgICAgICAg
ICAgICBpZiAodCA8IE1BWF9HQ19NT0RFKQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBz
YmktPmdjX3NlZ21lbnRfbW9kZSA9IHQ7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

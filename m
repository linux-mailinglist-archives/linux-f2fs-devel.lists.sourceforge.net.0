Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C3697C31B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Sep 2024 05:24:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sr7m1-0004HO-L7;
	Thu, 19 Sep 2024 03:24:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sr7m0-0004HC-JZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Sep 2024 03:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ct+6lCkgSfhI6TBYQQMWHBIBgzBFGo0AHVl1ktp6xq0=; b=APzrmN6cR9F29ovhAakzeIBPFJ
 JSHM31UtMBMEd6oaR3pBCX5LFLgBr+o6AZo/eMG0ScHsZRBCvzSyiICs1K1wzKT5Sbv3RhiNX/eV0
 U8KHRFqjSow5mMnmhsyJBc8nrKHluBcpJeVXpNirVFgQ/zt/AyZeGafz1vcKNZpVM7/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ct+6lCkgSfhI6TBYQQMWHBIBgzBFGo0AHVl1ktp6xq0=; b=gXTS4XQdbJ8yJKx+M+RyKh7wRH
 gtchLaUcABXEpMEojmFdRr1+GRPVu87z+H8IBJz8AgUZcsyO1Hh3GgqsqrYb7OXXoxgOo73Tmo/gW
 tq5zd9uCXTFOGraus8ELenZVizGMbA9i7RfjUIDo3Z8K41UB/pS/HyjQnji76fgSSi+k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sr7m0-0003fR-Bw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Sep 2024 03:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 364AC5C025F;
 Thu, 19 Sep 2024 03:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA6FC4CEC4;
 Thu, 19 Sep 2024 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726716238;
 bh=gnn1ELW9CxKmPfvgVTE6Z1ouhHxmjc7arPy/y1gMlNQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jHwKijcax0ssTYdlIlCkS/ztXDbVg5NrRk8dbMHY4yWYefBEQBvg0v93Xzi77XTSw
 tOYJOgzOHJMBGA+ztjLuHkxrZoPJxNHUBLhPjp7vYOfFEgWoNRKotyGj3X84dDG/+s
 paU2gKEIQp/QsFjlLTKq5u9QvqZml0si/myWfOQeJUbaeZtDEJqXPZtzUK8BTzfLKI
 0STPtxY7zfOnWWQM4r9LJL33mlb+imBXAR4jFVbT6TfHb98dFxC5VWMtyed7goTtnF
 BytCPiVkR/oIgbot1Kq6cAuC42+EmAnczTRnVhjeh17rU9eLhJ2hjrIPugZbRwtbRL
 mw0o2Ka6LZCIw==
Message-ID: <1447a1bb-7c8e-4c9f-bf4d-cd61cd3652e7@kernel.org>
Date: Thu, 19 Sep 2024 11:23:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>, Chao Yu <chao@kernel.org>
References: <1726123214-208356-1-git-send-email-liuderong@oppo.com>
 <1726123214-208356-3-git-send-email-liuderong@oppo.com>
 <17ceed17-b17f-42d9-8c82-79f1f4814c1a@kernel.org>
 <CAHJ8P3LNpZamiva_Ktck+tRKXvyAAYK0dg_z2Mwjiq41aeMF0Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3LNpZamiva_Ktck+tRKXvyAAYK0dg_z2Mwjiq41aeMF0Q@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/9/19 10:23, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2024年9月18日周三 14:45写道：
    >> >> On 2024/9/12 14:40, liuderong@oppo.com wr [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sr7m0-0003fR-Bw
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce get_section_mtime
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

T24gMjAyNC85LzE5IDEwOjIzLCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgdmlhIExpbnV4
LWYyZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pgo+IOS6
jjIwMjTlubQ55pyIMTjml6XlkajkuIkgMTQ6NDXlhpnpgZPvvJoKPj4KPj4gT24gMjAyNC85LzEy
IDE0OjQwLCBsaXVkZXJvbmdAb3Bwby5jb20gd3JvdGU6Cj4+PiBGcm9tOiBsaXVkZXJvbmcgPGxp
dWRlcm9uZ0BvcHBvLmNvbT4KPj4+Cj4+PiBXaGVuIHNlZ3NfcGVyX3NlYyBpcyBsYXJnZXIgdGhh
biAxLCBzZWN0aW9uIG1heSBjb250YWluIGZyZWUgc2VnbWVudHMsCj4+PiBtdGltZSBzaG91bGQg
YmUgdGhlIG1lYW4gdmFsdWUgb2YgZWFjaCB2YWxpZCBzZWdtZW50cywKPj4+IHNvIGludHJvZHVj
ZSBnZXRfc2VjdGlvbl9tdGltZSB0byBleGNsdWRlIGZyZWUgc2VnbWVudHMgaW4gYSBzZWN0aW9u
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IGxpdWRlcm9uZyA8bGl1ZGVyb25nQG9wcG8uY29tPgo+
Pj4gLS0tCj4+PiAgICBmcy9mMmZzL2YyZnMuaCAgICB8ICAyICsrCj4+PiAgICBmcy9mMmZzL2dj
LmMgICAgICB8IDE1ICsrLS0tLS0tLS0tLS0tLQo+Pj4gICAgZnMvZjJmcy9zZWdtZW50LmMgfCA0
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+Pj4gICAgMyBmaWxl
cyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4gaW5kZXggNGRjZGNk
ZC4uZDZhZGYwZiAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+PiArKysgYi9mcy9m
MmZzL2YyZnMuaAo+Pj4gQEAgLTM3NjIsNiArMzc2Miw4IEBAIGVudW0gcndfaGludCBmMmZzX2lv
X3R5cGVfdG9fcndfaGludChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+PiAgICB1bnNpZ25l
ZCBpbnQgZjJmc191c2FibGVfc2Vnc19pbl9zZWMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsK
Pj4+ICAgIHVuc2lnbmVkIGludCBmMmZzX3VzYWJsZV9ibGtzX2luX3NlZyhzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksCj4+PiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzZWdu
byk7Cj4+PiArdW5zaWduZWQgbG9uZyBsb25nIGdldF9zZWN0aW9uX210aW1lKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc2Vn
bm8pOwo+Pgo+PiBIaSBEZXJvbmcsCj4+Cj4+IEl0IG5lZWRzIHRvIGFkZCAiZjJmc18iIHByZWZp
eCBmb3IgZ2V0X3NlY3Rpb25fbXRpbWUoKSB0byBhdm9pZCBnbG9iYWwKPj4gbmFtZXNwYWNlIHBv
bGx1dGlvbi4KPj4KPj4+Cj4+PiAgICAjZGVmaW5lIERFRl9GUkFHTUVOVF9TSVpFICAgNAo+Pj4g
ICAgI2RlZmluZSBNSU5fRlJBR01FTlRfU0laRSAgIDEKPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2djLmMgYi9mcy9mMmZzL2djLmMKPj4+IGluZGV4IDYyOTk2MzkuLjAzYzYxMTcgMTAwNjQ0Cj4+
PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+Pj4gQEAgLTMzMiwy
MCArMzMyLDE0IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgY2hlY2tfYmdfdmljdGltcyhzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkpCj4+PiAgICBzdGF0aWMgdW5zaWduZWQgaW50IGdldF9jYl9jb3N0
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQgaW50IHNlZ25vKQo+Pj4gICAgewo+
Pj4gICAgICAgIHN0cnVjdCBzaXRfaW5mbyAqc2l0X2kgPSBTSVRfSShzYmkpOwo+Pj4gLSAgICAg
dW5zaWduZWQgaW50IHNlY25vID0gR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25vKTsKPj4+IC0g
ICAgIHVuc2lnbmVkIGludCBzdGFydCA9IEdFVF9TRUdfRlJPTV9TRUMoc2JpLCBzZWNubyk7Cj4+
PiAgICAgICAgdW5zaWduZWQgbG9uZyBsb25nIG10aW1lID0gMDsKPj4+ICAgICAgICB1bnNpZ25l
ZCBpbnQgdmJsb2NrczsKPj4+ICAgICAgICB1bnNpZ25lZCBjaGFyIGFnZSA9IDA7Cj4+PiAgICAg
ICAgdW5zaWduZWQgY2hhciB1Owo+Pj4gLSAgICAgdW5zaWduZWQgaW50IGk7Cj4+PiAgICAgICAg
dW5zaWduZWQgaW50IHVzYWJsZV9zZWdzX3Blcl9zZWMgPSBmMmZzX3VzYWJsZV9zZWdzX2luX3Nl
YyhzYmkpOwo+Pj4KPj4+IC0gICAgIGZvciAoaSA9IDA7IGkgPCB1c2FibGVfc2Vnc19wZXJfc2Vj
OyBpKyspCj4+PiAtICAgICAgICAgICAgIG10aW1lICs9IGdldF9zZWdfZW50cnkoc2JpLCBzdGFy
dCArIGkpLT5tdGltZTsKPj4+ICsgICAgIG10aW1lID0gZ2V0X3NlY3Rpb25fbXRpbWUoc2JpLCBz
ZWdubyk7Cj4+PiAgICAgICAgdmJsb2NrcyA9IGdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywg
dHJ1ZSk7Cj4+PiAtCj4+PiAtICAgICBtdGltZSA9IGRpdl91NjQobXRpbWUsIHVzYWJsZV9zZWdz
X3Blcl9zZWMpOwo+Pj4gICAgICAgIHZibG9ja3MgPSBkaXZfdTY0KHZibG9ja3MsIHVzYWJsZV9z
ZWdzX3Blcl9zZWMpOwo+Pj4KPj4+ICAgICAgICB1ID0gQkxLU19UT19TRUdTKHNiaSwgdmJsb2Nr
cyAqIDEwMCk7Cj4+PiBAQCAtNDg1LDEwICs0NzksNyBAQCBzdGF0aWMgdm9pZCBhZGRfdmljdGlt
X2VudHJ5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgdmljdGltX3NlbF9wb2xpY3kgKnAsIHVuc2lnbmVkIGludCBzZWdu
bykKPj4+ICAgIHsKPj4+ICAgICAgICBzdHJ1Y3Qgc2l0X2luZm8gKnNpdF9pID0gU0lUX0koc2Jp
KTsKPj4+IC0gICAgIHVuc2lnbmVkIGludCBzZWNubyA9IEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBz
ZWdubyk7Cj4+PiAtICAgICB1bnNpZ25lZCBpbnQgc3RhcnQgPSBHRVRfU0VHX0ZST01fU0VDKHNi
aSwgc2Vjbm8pOwo+Pj4gICAgICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBtdGltZSA9IDA7Cj4+PiAt
ICAgICB1bnNpZ25lZCBpbnQgaTsKPj4+Cj4+PiAgICAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9m
bGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKSB7Cj4+PiAgICAgICAgICAgICAgICBpZiAo
cC0+Z2NfbW9kZSA9PSBHQ19BVCAmJgo+Pj4gQEAgLTQ5Niw5ICs0ODcsNyBAQCBzdGF0aWMgdm9p
ZCBhZGRfdmljdGltX2VudHJ5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuOwo+Pj4gICAgICAgIH0KPj4+Cj4+PiAtICAgICBmb3IgKGkg
PSAwOyBpIDwgU0VHU19QRVJfU0VDKHNiaSk7IGkrKykKPj4+IC0gICAgICAgICAgICAgbXRpbWUg
Kz0gZ2V0X3NlZ19lbnRyeShzYmksIHN0YXJ0ICsgaSktPm10aW1lOwo+Pj4gLSAgICAgbXRpbWUg
PSBkaXZfdTY0KG10aW1lLCBTRUdTX1BFUl9TRUMoc2JpKSk7Cj4+PiArICAgICBtdGltZSA9IGdl
dF9zZWN0aW9uX210aW1lKHNiaSwgc2Vnbm8pOwo+Pj4KPj4+ICAgICAgICAvKiBIYW5kbGUgaWYg
dGhlIHN5c3RlbSB0aW1lIGhhcyBjaGFuZ2VkIGJ5IHRoZSB1c2VyICovCj4+PiAgICAgICAgaWYg
KG10aW1lIDwgc2l0X2ktPm1pbl9tdGltZSkKPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21l
bnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+PiBpbmRleCA2NjI3Mzk0Li5lNjJlNzIyIDEwMDY0
NAo+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5j
Cj4+PiBAQCAtNTM4OSw2ICs1Mzg5LDQxIEBAIHVuc2lnbmVkIGludCBmMmZzX3VzYWJsZV9zZWdz
X2luX3NlYyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+PiAgICAgICAgcmV0dXJuIFNFR1Nf
UEVSX1NFQyhzYmkpOwo+Pj4gICAgfQo+Pj4KPj4+ICt1bnNpZ25lZCBsb25nIGxvbmcgZ2V0X3Nl
Y3Rpb25fbXRpbWUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gKyAgICAgdW5zaWduZWQg
aW50IHNlZ25vKQo+Pj4gK3sKPj4+ICsgICAgIHVuc2lnbmVkIGludCB1c2FibGVfc2Vnc19wZXJf
c2VjID0gZjJmc191c2FibGVfc2Vnc19pbl9zZWMoc2JpKTsKPj4+ICsgICAgIHVuc2lnbmVkIGlu
dCBzZWNubyA9IDAsIHN0YXJ0ID0gMDsKPj4+ICsgICAgIHN0cnVjdCBmcmVlX3NlZ21hcF9pbmZv
ICpmcmVlX2kgPSBGUkVFX0koc2JpKTsKPj4+ICsgICAgIHVuc2lnbmVkIGludCB2YWxpZF9zZWdf
Y291bnQgPSAwOwo+Pj4gKyAgICAgdW5zaWduZWQgbG9uZyBsb25nIG10aW1lID0gMDsKPj4+ICsg
ICAgIHVuc2lnbmVkIGludCBpID0gMDsKPj4+ICsKPj4+ICsgICAgIGlmIChzZWdubyA9PSBOVUxM
X1NFR05PKQo+Pj4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPj4KPj4gTm8gbmVlZGVkLgo+Pgo+
Pj4gKwo+Pj4gKyAgICAgc2Vjbm8gPSBHRVRfU0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8pOwo+Pj4g
KyAgICAgc3RhcnQgPSBHRVRfU0VHX0ZST01fU0VDKHNiaSwgc2Vjbm8pOwo+Pj4gKwo+Pj4gKyAg
ICAgaWYgKCFfX2lzX2xhcmdlX3NlY3Rpb24oc2JpKSkKPj4+ICsgICAgICAgICAgICAgcmV0dXJu
IGdldF9zZWdfZW50cnkoc2JpLCBzdGFydCArIGkpLT5tdGltZTsKPj4+ICsKPj4+ICsgICAgIGZv
ciAoaSA9IDA7IGkgPCB1c2FibGVfc2Vnc19wZXJfc2VjOyBpKyspIHsKPj4+ICsgICAgICAgICAg
ICAgLyogZm9yIGxhcmdlIHNlY3Rpb24sIG9ubHkgY2hlY2sgdGhlIG10aW1lIG9mIHZhbGlkIHNl
Z21lbnRzICovCj4+PiArICAgICAgICAgICAgIHNwaW5fbG9jaygmZnJlZV9pLT5zZWdtYXBfbG9j
ayk7Cj4+PiArICAgICAgICAgICAgIGlmICh0ZXN0X2JpdChzdGFydCArIGksIGZyZWVfaS0+ZnJl
ZV9zZWdtYXApKSB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgbXRpbWUgKz0gZ2V0X3NlZ19l
bnRyeShzYmksIHN0YXJ0ICsgaSktPm10aW1lOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHZh
bGlkX3NlZ19jb3VudCsrOwo+Pj4gKyAgICAgICAgICAgICB9Cj4+PiArICAgICAgICAgICAgIHNw
aW5fdW5sb2NrKCZmcmVlX2ktPnNlZ21hcF9sb2NrKTsKPj4+ICsgICAgIH0KPj4KPj4gQWZ0ZXIg
Y29tbWl0IDZmM2EwMWFlOWI3MiAoImYyZnM6IHJlY29yZCBhdmVyYWdlIHVwZGF0ZSB0aW1lIG9m
IHNlZ21lbnQiKSwKPj4gbXRpbWUgb2Ygc2VnbWVudCBzdGFydHMgdG8gaW5kaWNhdGUgYXZlcmFn
ZSB1cGRhdGUgdGltZSBvZiBzZWdtZW50Lgo+Pgo+PiBTbyBpdCBuZWVkcyB0byBjaGFuZ2UgbGlr
ZSB0aGlzPwo+Pgo+PiBmb3IgKGkgPSAwOyBpIDwgdXNhYmxlX3NlZ3NfcGVyX3NlYzsgaSsrKSB7
Cj4+ICAgICAgICAgIHN0cnVjdCBzZWdfZW50cnkgKnNlID0gZ2V0X3NlZ19lbnRyeShzYmksIHN0
YXJ0ICsgaSk7Cj4+Cj4+ICAgICAgICAgIG10aW1lICs9IHNlLT5tdGltZSAqIHNlLT52YWxpZF9i
bG9ja3M7Cj4+ICAgICAgICAgIHRvdGFsX3ZhbGlkX2Jsb2NrcyArPSBzZS0+dmFsaWRfYmxvY2tz
Owo+PiB9Cj4gaGkgQ2hhbywKPiBhZnRlciBJIHJlYWQgdGhpcyBwYXRjaCBmcm9tIERlcm9uZyBh
bmQgYmFzZSBvbiB5b3VyIHRoaXMgY29tbWVudCwKPiBJIGhhdmUgc29tZSBkb3VidHPvvJoKPiBt
dGltZSBpcyB1cGRhdGUgaW4gdXBkYXRlX3NlZ21lbnRfbXRpbWUsIGFuZCB0aGlzIEFQSSBpcyBj
YWxsZWQgYnkKPiBtb3JlIHRoYW4gb25lIHBhdGjvvIwgc3VjaCBhcyBmMmZzX2ludmFsaWRhdGVf
YmxvY2tzIGFuZCBmMmZzX2FsbG9jYXRlX2RhdGFfYmxvY2ssCj4gYW5kIHNlLT5tdGltZSBpcyBj
YWxjdWxhdGVkIGJ5IHRoZSBmb2xsb3dpbmcgIGZsb3cgaWYgc2UtPm10aW1lIGlzIG5vdCBudWxs
Lgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gc2UtPm10aW1lID0gZGl2X3U2
NChzZS0+bXRpbWUgKiBzZS0+dmFsaWRfYmxvY2tzICsgbXRpbWUsCj4gc2UtPnZhbGlkX2Jsb2Nr
cyArIDEpOwo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gaWYgdGhpcyBpcyBj
YWxsZWQgZnJvbSBmMmZzX2ludmFsaWRhdGVfYmxvY2tzLCBzZS0+bXRpbWUgaXMgc3RpbGwgY2Fs
Y3VsYXRlZCBieQo+IG10aW1lIC8gc2UtPnZhbGlkX2Jsb2NrcyArIDEsIGJ1dCB0aGUgcmVhbCB2
YWx1ZSBvZiBzZS0+dmFsaWRfYmxvY2tzIHdpbGwKPiB3aWxsIGJlIHJlZHVjZWQgIDHvvIxTbyBp
c27igJl0IGl0IGEgYml0IGluYWNjdXJhdGUganVzdCBjYWxjdWxhdGluZyB2YWxpZAo+IGJsb2Nr
cyBpbiB0aGlzIHBhdGNoPwoKV2hlbiB0YXJnZXQgYmxvY2sgd2FzIGludmFsaWRhdGVkLCBJIHdh
bnQgdG8gc3VwZXJwb3NlIGl0cyBtdGltZSBpbnRvCmF2ZXJhZ2UgbXRpbWUgb2Ygc2VnbWVudCwg
c28gdGhhdCBzZWdtZW50IG10aW1lIGNhbiBpbmRpY2F0ZSB0aGVyZSBhcmUKc3RpbGwgdXBkYXRl
cyBvbiB0aGlzIHNlZ21lbnQsIGFuZCB0aGUgc2VnbWVudCB3aWxsIG5vdCBiZWNvbWUgdG9vIGVs
ZGVyCnRvIGJlIHNlbGVjdGVkIGJ5IEJHR0MsIHNvLCBJIHVzZWQgdGhhdCBjYWxjdWxhdGlvbiBt
ZXRob2QuCgpUaGFua3MsCgo+IHRoYW5rcyEKPj4KPj4gaWYgKHRvdGFsX3ZhbGlkX2Jsb2NrcyA9
PSAwKQo+PiAgICAgICAgICByZXR1cm4gMDsKPj4KPj4gcmV0dXJuIGRpdl91NjQobXRpbWUsIHRv
dGFsX3ZhbGlkX2Jsb2Nrcyk7Cj4+Cj4+IFRoYW5rcywKPj4KPj4+ICsKPj4+ICsgICAgIGlmICh2
YWxpZF9zZWdfY291bnQgPT0gMCkKPj4+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4+PiArCj4+
PiArICAgICByZXR1cm4gZGl2X3U2NChtdGltZSwgdmFsaWRfc2VnX2NvdW50KTsKPj4+ICt9Cj4+
PiArCj4+PiAgICAvKgo+Pj4gICAgICogVXBkYXRlIG1pbiwgbWF4IG1vZGlmaWVkIHRpbWUgZm9y
IGNvc3QtYmVuZWZpdCBHQyBhbGdvcml0aG0KPj4+ICAgICAqLwo+Pj4gQEAgLTU0MDIsMTMgKzU0
MzcsOSBAQCBzdGF0aWMgdm9pZCBpbml0X21pbl9tYXhfbXRpbWUoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKQo+Pj4gICAgICAgIHNpdF9pLT5taW5fbXRpbWUgPSBVTExPTkdfTUFYOwo+Pj4KPj4+
ICAgICAgICBmb3IgKHNlZ25vID0gMDsgc2Vnbm8gPCBNQUlOX1NFR1Moc2JpKTsgc2Vnbm8gKz0g
U0VHU19QRVJfU0VDKHNiaSkpIHsKPj4+IC0gICAgICAgICAgICAgdW5zaWduZWQgaW50IGk7Cj4+
PiAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGxvbmcgbXRpbWUgPSAwOwo+Pj4KPj4+IC0g
ICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IFNFR1NfUEVSX1NFQyhzYmkpOyBpKyspCj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgbXRpbWUgKz0gZ2V0X3NlZ19lbnRyeShzYmksIHNlZ25vICsg
aSktPm10aW1lOwo+Pj4gLQo+Pj4gLSAgICAgICAgICAgICBtdGltZSA9IGRpdl91NjQobXRpbWUs
IFNFR1NfUEVSX1NFQyhzYmkpKTsKPj4+ICsgICAgICAgICAgICAgbXRpbWUgPSBnZXRfc2VjdGlv
bl9tdGltZShzYmksIHNlZ25vKTsKPj4+Cj4+PiAgICAgICAgICAgICAgICBpZiAoc2l0X2ktPm1p
bl9tdGltZSA+IG10aW1lKQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBzaXRfaS0+bWluX210
aW1lID0gbXRpbWU7Cj4+Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549390C4B8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2024 10:09:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJTtk-0001tS-TB;
	Tue, 18 Jun 2024 08:09:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sJTtj-0001sl-Cr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 08:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0rEdmoMv8b9n8ay+OyQfJSCOVyYkXPy8KFB2MKDRsmQ=; b=kFWbHTIzRkBz006vVwTERd9rD3
 mo/XnOmr3nGPxhxwu1faB5VsJLjgx70GYXonLOLnGbunR2ZLMm4k//Vj4/V9U/2EyXzgU4A+AZ4en
 2FZbkBUfUtenrytx0FtIJ4N+WTX94zc723RC9lS9PU77BgTLrWB4D4/ZI++bZTPAn/Z0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0rEdmoMv8b9n8ay+OyQfJSCOVyYkXPy8KFB2MKDRsmQ=; b=VzfZp9WXBvIQ68IpSRSjmKkc+Z
 S2YG3T/Zxltma8nTkJHYtIwypFyFuaw+CqtrqEOzQJ0VYcTkq8/V3T15WT9XlwFRJQ+PlShSP+sob
 Di9e426Mr3UFyaMCUxI6mJabj221zlubk/p+2GmZmFqcDHC+rZxNhDw9wQE/D8EaF5RM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJTtk-0006jh-EZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 08:09:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 54AA960BC0;
 Tue, 18 Jun 2024 08:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC87FC3277B;
 Tue, 18 Jun 2024 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718698129;
 bh=IA25PUjhhbNndj00EGYem/FCIIrIH//UWKcRPQbSt/Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dOojlXcEUDCTnA/p7nYDyAoQZDwBscfDTe8WAb6kNADvHJqHkOhCBjYBRhE7C6McF
 sZWJjpVv63jb0EO9Vanyp6aHXI769yPlWUjogOfoyXonYlGPzNg2MOeJVmdoU1Tp/R
 3zKg8ZBATxBrG2zm+vRjszG6FBfsfoOQdmKmXOUc0Nl+6+wXuKj5z0UGo6MDuZfvFp
 O6m7HVfrcmIfSZrnhjOvuJ5WfhoNzg47wm87LGfS1545KpmUm2IO/NizU3jT502hnp
 zV53WXR9rePUCnrIuc6Xgj2ZPMHvUribCW4BwsdIpsJa7KTyIU/9LmJOtL0h9WjQjf
 I1wGyY9krV2vQ==
Message-ID: <5516ecdc-7966-4be3-880c-836e51e2557d@kernel.org>
Date: Tue, 18 Jun 2024 16:08:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiuhong Wang <xiuhong.wang.cn@gmail.com>
References: <20240617071114.150721-1-xiuhong.wang@unisoc.com>
 <04825e07-04d4-4eef-8b06-1e2329880612@kernel.org>
 <CAOsHCa0bUg3Kam_4G=aiWzQpisn7rAS3nQWMQEPWB04==Sftbw@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAOsHCa0bUg3Kam_4G=aiWzQpisn7rAS3nQWMQEPWB04==Sftbw@mail.gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/6/18 13:35, Xiuhong Wang wrote: > Chao Yu <chao@kernel.org>
    于2024年6月18日周二 11:04写道： > >> >> On 2024/6/17 15:11, Xiuhong
    Wang wrote: >>> When using the f2fs_io tool to set_veri [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [139.178.84.217 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [139.178.84.217 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJTtk-0006jh-EZ
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix do_set_verity ioctl fail
 issue
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
Cc: Xiuhong Wang <xiuhong.wang@unisoc.com>, ke.wang@unisoc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org, hao_hao.wang@unisoc.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC82LzE4IDEzOjM1LCBYaXVob25nIFdhbmcgd3JvdGU6Cj4gQ2hhbyBZdSA8Y2hhb0Br
ZXJuZWwub3JnPiDkuo4yMDI05bm0NuaciDE45pel5ZGo5LqMIDExOjA05YaZ6YGT77yaCj4gCj4+
Cj4+IE9uIDIwMjQvNi8xNyAxNToxMSwgWGl1aG9uZyBXYW5nIHdyb3RlOgo+Pj4gV2hlbiB1c2lu
ZyB0aGUgZjJmc19pbyB0b29sIHRvIHNldF92ZXJpdHksIGl0IHdpbGwgZmFpbCBhcyBmb2xsb3dz
Ogo+Pj4gdW5pc2M6L2RhdGEgIyAuL2YyZnNfaW8gc2V0X3Zlcml0eSBmaWxlCj4+PiBGU19JT0Nf
RU5BQkxFX1ZFUklUWTogSW5hcHByb3ByaWF0ZSBpb2N0bCBmb3IgZGV2aWNlCj4+PiB0aGlzIGlz
IGJlY2F1c2UgY29tbWl0OiA5NWFlMjUxZmU4MjggKCJmMmZzOiBhZGQgZnMtdmVyaXR5IHN1cHBv
cnQiKSwKPj4+IHRoZSBwYXNzZWQgcGFyYW1ldGVycyBkbyBub3QgbWF0Y2ggdGhlIGxhdGVzdCBr
ZXJuZWwgdmVyc2lvbi4KPj4+Cj4+PiBBZnRlciBwYXRjaDoKPj4+IHVuaXNvYzovZGF0YSAjIC4v
ZjJmc19pbyBzZXRfdmVyaXR5IGZpbGUKPj4+IFNldCBmc3Zlcml0eSBiaXQgdG8gZmlsZQo+Pj4g
dW5pc29jOi9kYXRhICMgLi9mMmZzX2lvIGdldGZsYWdzIGZpbGUKPj4+IGdldCBhIGZsYWcgb24g
ZmlsZSByZXQ9MCwgZmxhZ3M9dmVyaXR5Cj4+Pgo+Pj4gRml4ZXM6IDk1YWUyNTFmZTgyOCAoImYy
ZnM6IGFkZCBmcy12ZXJpdHkgc3VwcG9ydCIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBYaXVob25nIFdh
bmcgPHhpdWhvbmcud2FuZ0B1bmlzb2MuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5p
dSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+Pj4gLS0tCj4+PiAgICBpbmNsdWRlL2FuZHJvaWRf
Y29uZmlnLmggfCAgMSArCj4+PiAgICB0b29scy9mMmZzX2lvL2YyZnNfaW8uYyAgfCAgOSArKysr
KystLS0KPj4+ICAgIHRvb2xzL2YyZnNfaW8vZjJmc19pby5oICB8IDIwICsrKysrKysrKysrKysr
KysrKy0tCj4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYW5kcm9pZF9jb25maWcuaCBiL2lu
Y2x1ZGUvYW5kcm9pZF9jb25maWcuaAo+Pj4gaW5kZXggMDViNjg2ZS4uOWM4YjE2MyAxMDA2NDQK
Pj4+IC0tLSBhL2luY2x1ZGUvYW5kcm9pZF9jb25maWcuaAo+Pj4gKysrIGIvaW5jbHVkZS9hbmRy
b2lkX2NvbmZpZy5oCj4+PiBAQCAtMTMsNiArMTMsNyBAQAo+Pj4gICAgI2RlZmluZSBIQVZFX0xJ
TlVYX1hBVFRSX0ggMQo+Pj4gICAgI2RlZmluZSBIQVZFX0xJTlVYX0ZTX0ggMQo+Pj4gICAgI2Rl
ZmluZSBIQVZFX0xJTlVYX0ZJRU1BUF9IIDEKPj4+ICsjZGVmaW5lIEhBVkVfTElOVVhfVkVSSVRZ
X0ggMQo+Pj4gICAgI2RlZmluZSBIQVZFX01OVEVOVF9IIDEKPj4+ICAgICNkZWZpbmUgSEFWRV9T
VERMSUJfSCAxCj4+PiAgICAjZGVmaW5lIEhBVkVfU1RSSU5HX0ggMQo+Pj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPj4+IGlu
ZGV4IGE3YjU5M2EuLjI0NDc0OTAgMTAwNjQ0Cj4+PiAtLS0gYS90b29scy9mMmZzX2lvL2YyZnNf
aW8uYwo+Pj4gKysrIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPj4+IEBAIC0xODIsMTYgKzE4
MiwxOSBAQCBzdGF0aWMgdm9pZCBkb19mc3luYyhpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0
IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+Pj4gICAgc3RhdGljIHZvaWQgZG9fc2V0X3Zlcml0eShp
bnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+Pj4gICAg
ewo+Pj4gICAgICAgIGludCByZXQsIGZkOwo+Pj4gKyAgICAgc3RydWN0IGZzdmVyaXR5X2VuYWJs
ZV9hcmcgYXJncyA9IHsudmVyc2lvbiA9IDF9Owo+Pj4gKwo+Pj4gKyAgICAgYXJncy5oYXNoX2Fs
Z29yaXRobSA9IEZTX1ZFUklUWV9IQVNIX0FMR19TSEEyNTY7Cj4+PiArICAgICBhcmdzLmJsb2Nr
X3NpemUgPSA0MDk2Owo+Pj4KPj4+ICAgICAgICBpZiAoYXJnYyAhPSAyKSB7Cj4+PiAgICAgICAg
ICAgICAgICBmcHV0cygiRXhjZXNzIGFyZ3VtZW50c1xuXG4iLCBzdGRlcnIpOwo+Pj4gICAgICAg
ICAgICAgICAgZnB1dHMoY21kLT5jbWRfaGVscCwgc3RkZXJyKTsKPj4+ICAgICAgICAgICAgICAg
IGV4aXQoMSk7Cj4+PiAgICAgICAgfQo+Pj4gKyAgICAgZmQgPSBvcGVuKGFyZ3ZbMV0sIE9fUkRP
TkxZKTsKPj4+Cj4+PiAtICAgICBmZCA9IG9wZW4oYXJndlsxXSwgT19SRFdSKTsKPj4KPj4gSXQg
bmVlZHMgd3JpdGUgcGVybWlzc2lvbj8KPj4KPj4gVGhhbmtzLAo+Pgo+IElmIHlvdSBvcGVuIHRo
ZSBmaWxlIHdpdGggT19SRFdSLCB0aGUgZm9sbG93aW5nIGVycm9yIHdpbGwgYmUgcmV0dXJuZWQ6
Cj4gdW5pc29jOi9kYXRhICMgLi9mMmZzX2lvIHNldF92ZXJpdHkgZmlsZQo+IEZTX0lPQ19FTkFC
TEVfVkVSSVRZOiBUZXh0IGZpbGUgYnVzeQo+IAo+IC9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1z
L2ZzdmVyaXR5LnJzdCBoYXMgdGhlIGZvbGxvd2luZyBkZXNjcmlwdGlvbjoKPiBGU19JT0NfRU5B
QkxFX1ZFUklUWSBjaGVja3MgZm9yIHdyaXRlIGFjY2VzcyB0byB0aGUgaW5vZGUuIEhvd2V2ZXIs
IGl0Cj4gbXVzdCBiZSBleGVjdXRlZCBvbiBhbiBPX1JET05MWSBmaWxlIGRlc2NyaXB0b3IgYW5k
IG5vIHByb2Nlc3NlcyBjYW4KPiBoYXZlIHRoZSBmaWxlIG9wZW4gZm9yIHdyaXRpbmcuIEF0dGVt
cHRzIHRvIG9wZW4gdGhlIGZpbGUgZm9yIHdyaXRpbmcKPiB3aGlsZSB0aGlzIGlvY3RsIGlzIGV4
ZWN1dGluZyB3aWxsIGZhaWwgd2l0aCBFVFhUQlNZLiAoVGhpcyBpcwo+IG5lY2Vzc2FyeSB0byBn
dWFyYW50ZWUgdGhhdCBubyB3cml0YWJsZSBmaWxlIGRlc2NyaXB0b3JzIHdpbGwgZXhpc3QKPiBh
ZnRlciB2ZXJpdHkgaXMgZW5hYmxlZCwgYW5kIHRvIGd1YXJhbnRlZSB0aGF0IHRoZSBmaWxlJ3Mg
Y29udGVudHMgYXJlCj4gc3RhYmxlIHdoaWxlIHRoZSBNZXJrbGUgdHJlZSBpcyBiZWluZyBidWls
dCBvdmVyIGl0LikKCkdvdCBpdCwgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uIDopCgpUaGFu
a3MsCgo+IAo+Pj4gLQo+Pj4gLSAgICAgcmV0ID0gaW9jdGwoZmQsIEZTX0lPQ19FTkFCTEVfVkVS
SVRZKTsKPj4+ICsgICAgIHJldCA9IGlvY3RsKGZkLCBGU19JT0NfRU5BQkxFX1ZFUklUWSwgJmFy
Z3MpOwo+Pj4gICAgICAgIGlmIChyZXQgPCAwKSB7Cj4+PiAgICAgICAgICAgICAgICBwZXJyb3Io
IkZTX0lPQ19FTkFCTEVfVkVSSVRZIik7Cj4+PiAgICAgICAgICAgICAgICBleGl0KDEpOwo+Pj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5oIGIvdG9vbHMvZjJmc19pby9mMmZz
X2lvLmgKPj4+IGluZGV4IGI1YzgyZjUuLmU1NWRiNWYgMTAwNjQ0Cj4+PiAtLS0gYS90b29scy9m
MmZzX2lvL2YyZnNfaW8uaAo+Pj4gKysrIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmgKPj4+IEBA
IC0xNiw2ICsxNiw5IEBACj4+PiAgICAjaWZkZWYgSEFWRV9MSU5VWF9GU19ICj4+PiAgICAjaW5j
bHVkZSA8bGludXgvZnMuaD4KPj4+ICAgICNlbmRpZgo+Pj4gKyNpZmRlZiBIQVZFX0xJTlVYX1ZF
UklUWV9ICj4+PiArI2luY2x1ZGUgPGxpbnV4L2ZzdmVyaXR5Lmg+Cj4+PiArI2VuZGlmCj4+Pgo+
Pj4gICAgI2luY2x1ZGUgPHN5cy90eXBlcy5oPgo+Pj4KPj4+IEBAIC0xMzYsOCArMTM5LDIxIEBA
IHN0cnVjdCBmc2NyeXB0X2dldF9wb2xpY3lfZXhfYXJnIHsKPj4+ICAgICNkZWZpbmUgRjJGU19J
T0NfR0VUX0VOQ1JZUFRJT05fUE9MSUNZICAgICAgRlNfSU9DX0dFVF9FTkNSWVBUSU9OX1BPTElD
WQo+Pj4gICAgI2RlZmluZSBGMkZTX0lPQ19HRVRfRU5DUllQVElPTl9QV1NBTFQgICAgICBGU19J
T0NfR0VUX0VOQ1JZUFRJT05fUFdTQUxUCj4+Pgo+Pj4gLSNkZWZpbmUgRlNfSU9DX0VOQUJMRV9W
RVJJVFkgICAgICAgICBfSU8oJ2YnLCAxMzMpCj4+PiAtCj4+PiArI2lmbmRlZiBGU19JT0NfRU5B
QkxFX1ZFUklUWQo+Pj4gKyNkZWZpbmUgRlNfSU9DX0VOQUJMRV9WRVJJVFkgICAgX0lPVygnZics
IDEzMywgc3RydWN0IGZzdmVyaXR5X2VuYWJsZV9hcmcpCj4+PiArI2RlZmluZSBGU19WRVJJVFlf
SEFTSF9BTEdfU0hBMjU2ICAgICAgIDEKPj4+ICtzdHJ1Y3QgZnN2ZXJpdHlfZW5hYmxlX2FyZyB7
Cj4+PiArICAgICBfX3UzMiB2ZXJzaW9uOwo+Pj4gKyAgICAgX191MzIgaGFzaF9hbGdvcml0aG07
Cj4+PiArICAgICBfX3UzMiBibG9ja19zaXplOwo+Pj4gKyAgICAgX191MzIgc2FsdF9zaXplOwo+
Pj4gKyAgICAgX191NjQgc2FsdF9wdHI7Cj4+PiArICAgICBfX3UzMiBzaWdfc2l6ZTsKPj4+ICsg
ICAgIF9fdTMyIF9fcmVzZXJ2ZWQxOwo+Pj4gKyAgICAgX191NjQgc2lnX3B0cjsKPj4+ICsgICAg
IF9fdTY0IF9fcmVzZXJ2ZWQyWzExXTsKPj4+ICt9Owo+Pj4gKyNlbmRpZgo+Pj4gICAgLyoKPj4+
ICAgICAqIElub2RlIGZsYWdzCj4+PiAgICAgKi8KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

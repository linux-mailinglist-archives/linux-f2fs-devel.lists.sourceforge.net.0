Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19574B132DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 04:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmBDisjQaNilmhlM2+GiyZc5wv9IwKF4aeN5dg4bhMg=; b=Hi/YCM3aGfK0JerLoQxcq+ojBd
	Bhxw9bbdBlRj+5xiMShTGDBoHN/vJQ2r5qfEQItqe7LjkSdCnSr/dRujIjsEe8/hhu7YEdIGO1yD4
	kSngBFXcdOKIBZaQxfwpRrhwkGSAXjVbBQwwyM/hp0E4EpFOracCFJevl5KyBm4OkV0E=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugDCo-0006Fi-8w;
	Mon, 28 Jul 2025 02:03:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ugDCm-0006Fc-90
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 02:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q0XMay7yVDvoOUg0l++LmKCvxpymHt2Ej624UB5hBO4=; b=GLK51eusPY+3h3vnUARXxzxrAW
 T2I/aqaVANOB3Xskc6q58PoDvn4Lr6bAvi8pGJOcaVD0bslAYJ5LQ1va1tDqjQsImdQ5ksHQ877m2
 OnSzEJrnkC2O2CXyFOvtgqNMf3chEEZBi6dNhShuIhGUSl431EA6rkH6TB2l2RtBcG20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q0XMay7yVDvoOUg0l++LmKCvxpymHt2Ej624UB5hBO4=; b=bALagJgaulr0LGpMhImbvtG1HT
 sJCESBmm7fvfwsn3vDJksCuEg8HXWfuuexSVYDKsvS2UZcd3ZkysfDsIBnhiABLMr544UaVRWtkdf
 1px0kA6E/sT50FarT/HUMfJVBd9AGZ/ssRB6iGXPX/dNjQko6nTfZqucDX1lSA7QnF8o=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugDCl-00085H-IV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 02:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DB508A5470B;
 Mon, 28 Jul 2025 02:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A78C4CEEB;
 Mon, 28 Jul 2025 02:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753668176;
 bh=eUFaymsaMCqWC8SITEP0Zp2oqMjJbMviU+6OgCblgic=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ukCT9c4mz/NIVKBEFZqHonl2Y+HRxSsmhbQ2vVXNbM9NPr/fR9lA7Lse3/mE1DOvA
 HK31oBt2A6MtAbXVvmDjvO9lIyZxGW+045lRGHoWjBtJALxJjlkRhEmcCXSASQTe4l
 dJg+k+mLCL/+rwQVRSNQl7gDY4Z3bS+Cygreog9vNCV3urKBg24esDZRyp9QfTYq7N
 vU2gGkwYDz7or+ikcmrqcdLvlQLEtKjJsNpQA04A8X1rmyD/+EL3FWnYIZxkJpx1iq
 L7UwCefLzlV+W+/SjkgOtUFbW7uzqzAzkv5FnPnVPltcxPJPBBX222CXBUea6Y406H
 R1rg8Sicuuisg==
Message-ID: <a69c3687-fa00-41b6-861c-557ad1d83588@kernel.org>
Date: Mon, 28 Jul 2025 10:02:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250725054922.3972265-1-chao@kernel.org>
 <CAHJ8P3LBH7oxV8nOiwU3yfQSr+LmK58EvFtyF8YLPQ=usZpqFA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3LBH7oxV8nOiwU3yfQSr+LmK58EvFtyF8YLPQ=usZpqFA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 7/28/25 09:05, Zhiguo Niu wrote: > Hi Chao > > Chao Yu
   via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net> > 于2025年7月25日周五
    13:51写道： >> >> It provides a way to disable li [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ugDCl-00085H-IV
Subject: Re: [f2fs-dev] [PATCH v3] mkfs.f2fs: support -C [no]hashonly to
 control linear lookup fallback
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNy8yOC8yNSAwOTowNSwgWmhpZ3VvIE5pdSB3cm90ZToKPiBIaSBDaGFvCj4gCj4gQ2hhbyBZ
dSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQ+Cj4g5LqOMjAyNeW5tDfmnIgyNeaXpeWRqOS6lCAxMzo1MeWGmemBk++8mgo+Pgo+PiBJ
dCBwcm92aWRlcyBhIHdheSB0byBkaXNhYmxlIGxpbmVhciBsb29rdXAgZmFsbGJhY2sgZHVyaW5n
IG1rZnMuCj4+Cj4+IEJlaGF2aW9yIHN1bW1hcnk6Cj4+ICAgICAgICAgICAgICAgICAgICAgICAg
IEFuZHJvaWQgICAgICAgICBEaXN0cm8KPj4gQnkgZGVmYXVsdCAgICAgICAgICAgICAgZGlzYWJs
ZWQgICAgICAgIGVuYWJsZWQKPj4KPj4gQW5kcm9pZCBjYXNlOgo+Pgo+PiAxLjEpIERpc2FibGUg
bGluZWFyIGxvb2t1cDoKPj4gLSBta2ZzLmYyZnMgLWYgLWcgYW5kcm9pZCAtTyBjYXNlZm9sZCAt
QyB1dGY4Omhhc2hvbmx5IC9kZXYvdmRiCj4+IC0gZHVtcC5mMmZzIC1kMyAvZGV2L3ZkYiB8Z3Jl
cCBzX2VuY29kaW5nX2ZsYWdzCj4+IHNfZW5jb2RpbmdfZmxhZ3MgICAgICAgICAgICAgICAgICAg
ICAgICBbMHggICAgICAgMiA6IDJdCj4+Cj4+IDEuMikgRW5hYmxlIGxpbmVhciBsb29rdXA6Cj4+
IC0gbWtmcy5mMmZzIC1mIC1nIGFuZHJvaWQgLU8gY2FzZWZvbGQgLUMgdXRmODpub2hhc2hvbmx5
IC9kZXYvdmRiCj4+IC0gZHVtcC5mMmZzIC1kMyAvZGV2L3ZkYiB8Z3JlcCBzX2VuY29kaW5nX2Zs
YWdzCj4+IHNfZW5jb2RpbmdfZmxhZ3MgICAgICAgICAgICAgICAgICAgICAgICBbMHggICAgICAg
MCA6IDBdCj4+Cj4+IDEuMykgQnkgZGVmYXVsdDoKPj4gLSBta2ZzLmYyZnMgLWYgLWcgYW5kcm9p
ZCAtTyBjYXNlZm9sZCAtQyB1dGY4IC9kZXYvdmRiCj4+IEluZm86IHNldCBkZWZhdWx0IGxpbmVh
cl9sb29rdXAgb3B0aW9uOiBkaXNhYmxlCj4+IC0gZHVtcC5mMmZzIC1kMyAvZGV2L3ZkYiB8Z3Jl
cCBzX2VuY29kaW5nX2ZsYWdzCj4+IHNfZW5jb2RpbmdfZmxhZ3MgICAgICAgICAgICAgICAgICAg
ICAgICBbMHggICAgICAgMiA6IDJdCj4+Cj4+IERpc3RybyBjYXNlOgo+Pgo+PiAyLjEpIERpc2Fi
bGUgbGluZWFyIGxvb2t1cDoKPj4gLSBta2ZzLmYyZnMgLWYgLU8gY2FzZWZvbGQgLUMgdXRmODpo
YXNob25seSAvZGV2L3ZkYgo+PiAtIGR1bXAuZjJmcyAtZDMgL2Rldi92ZGIgfGdyZXAgc19lbmNv
ZGluZ19mbGFncwo+PiBzX2VuY29kaW5nX2ZsYWdzICAgICAgICAgICAgICAgICAgICAgICAgWzB4
ICAgICAgIDIgOiAyXQo+Pgo+PiAyLjIpIEVuYWJsZSBsaW5lYXIgbG9va3VwOgo+PiAtIG1rZnMu
ZjJmcyAtZiAtTyBjYXNlZm9sZCAtQyB1dGY4Om5vaGFzaG9ubHkgL2Rldi92ZGIKPj4gLSBkdW1w
LmYyZnMgLWQzIC9kZXYvdmRiIHxncmVwIHNfZW5jb2RpbmdfZmxhZ3MKPj4gc19lbmNvZGluZ19m
bGFncyAgICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAwIDogMF0KPj4KPj4gMi4zKSBC
eSBkZWZhdWx0Ogo+PiAtIG1rZnMuZjJmcyAtZiAtTyBjYXNlZm9sZCAtQyB1dGY4IC9kZXYvdmRi
Cj4+IC0gZHVtcC5mMmZzIC1kMyAvZGV2L3ZkYiB8Z3JlcCBzX2VuY29kaW5nX2ZsYWdzCj4+IHNf
ZW5jb2RpbmdfZmxhZ3MgICAgICAgICAgICAgICAgICAgICAgICBbMHggICAgICAgMCA6IDBdCj4+
Cj4gSXQgaXMgdmVyeSBjbGVhciBhbmQgZWFzeSB0byB1bmRlcnN0YW5kLgo+PiBTaWduZWQtb2Zm
LWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiB2MzoKPj4gLSBob25vciBb
bm9daGFzaG9ubHkgZmxhZyBmb3IgQW5kcm9pZCBjYXNlCj4+IC0gdXBkYXRlIHRlc3RjYXNlIGFu
ZCBvdXRwdXQKPj4gIGluY2x1ZGUvZjJmc19mcy5oICAgICAgIHwgIDMgKystCj4+ICBsaWIvbGli
ZjJmcy5jICAgICAgICAgICB8ICA2ICsrKysrKwo+PiAgbWFuL21rZnMuZjJmcy44ICAgICAgICAg
fCAgOSArKysrKysrKy0KPj4gIG1rZnMvZjJmc19mb3JtYXQuYyAgICAgIHwgMTEgKysrKysrKysr
KysKPj4gIG1rZnMvZjJmc19mb3JtYXRfbWFpbi5jIHwgIDMgKystCj4+ICA1IGZpbGVzIGNoYW5n
ZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2YyZnNfZnMuaCBiL2luY2x1ZGUvZjJmc19mcy5oCj4+IGluZGV4IGY3MjY4ZDEuLmE4
ZGE4ZmEgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZjJmc19mcy5oCj4+ICsrKyBiL2luY2x1ZGUv
ZjJmc19mcy5oCj4+IEBAIC0xNDc4LDcgKzE0NzgsOCBAQCBlbnVtIHsKPj4KPj4gIC8qIGZlYXR1
cmUgbGlzdCBpbiBBbmRyb2lkICovCj4+ICBlbnVtIHsKPj4gLSAgICAgICBGMkZTX0ZFQVRVUkVf
TkFUX0JJVFMgPSAweDAwMDEsCj4+ICsgICAgICAgRjJGU19GRUFUVVJFX05BVF9CSVRTICAgICAg
ICAgICA9IDB4MDAwMSwKPj4gKyAgICAgICBGMkZTX0ZFQVRVUkVfTElORUFSX0xPT0tVUCAgICAg
ID0gMHgwMDAyLAo+PiAgfTsKPj4KPj4gIC8qIG5vbGluZWFyIGxvb2t1cCB0dW5lICovCj4+IGRp
ZmYgLS1naXQgYS9saWIvbGliZjJmcy5jIGIvbGliL2xpYmYyZnMuYwo+PiBpbmRleCAyZjAxMmM4
Li4xYTQ5NmI3IDEwMDY0NAo+PiAtLS0gYS9saWIvbGliZjJmcy5jCj4+ICsrKyBiL2xpYi9saWJm
MmZzLmMKPj4gQEAgLTE0MjQsNiArMTQyNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZW5jX2Zs
YWdzIHsKPj4gICAgICAgICBjaGFyICpwYXJhbTsKPj4gIH0gZW5jb2RpbmdfZmxhZ3NbXSA9IHsK
Pj4gICAgICAgICB7IEYyRlNfRU5DX1NUUklDVF9NT0RFX0ZMLCAic3RyaWN0IiB9LAo+PiArICAg
ICAgIHsgRjJGU19FTkNfTk9fQ09NUEFUX0ZBTExCQUNLX0ZMLCAiaGFzaG9ubHkifQo+PiAgfTsK
Pj4KPj4gIC8qIFJldHVybiBhIHBvc2l0aXZlIG51bWJlciA8IDB4ZmYgaW5kaWNhdGluZyB0aGUg
ZW5jb2RpbmcgbWFnaWMgbnVtYmVyCj4+IEBAIC0xNDg1LDYgKzE0ODYsMTEgQEAgaW50IGYyZnNf
c3RyMmVuY29kaW5nX2ZsYWdzKGNoYXIgKipwYXJhbSwgX191MTYgKmZsYWdzKQo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKmZsYWdzIHw9IGZsLT5mbGFnOwo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPj4KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoZmwtPmZsYWcgPT0gRjJGU19FTkNfTk9fQ09NUEFUX0ZBTExCQUNL
X0ZMKQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5ub2xpbmVh
cl9sb29rdXAgPSBuZWcgPwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBMSU5FQVJfTE9PS1VQX0VOQUJMRSA6Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIExJTkVBUl9MT09LVVBfRElTQUJMRTsKPj4gKwo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dF9mbGFnOwo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICB9Cj4+ICAgICAgICAgICAgICAgICB9Cj4+IGRpZmYgLS1naXQg
YS9tYW4vbWtmcy5mMmZzLjggYi9tYW4vbWtmcy5mMmZzLjgKPj4gaW5kZXggOGIzYjBjYy4uZmNi
MjI3YyAxMDA2NDQKPj4gLS0tIGEvbWFuL21rZnMuZjJmcy44Cj4+ICsrKyBiL21hbi9ta2ZzLmYy
ZnMuOAo+PiBAQCAtMjMyLDEwICsyMzIsMTcgQEAgVXNlIFVURi04IGZvciBjYXNlZm9sZGluZy4K
Pj4gIC5JIGZsYWdzOgo+PiAgLlJTIDEuMmkKPj4gIC5UUCAxLjJpCj4+IC0uQiBzdHJpY3QKPj4g
Ky5CIFtub11zdHJpY3QKPj4gIFRoaXMgZmxhZyBzcGVjaWZpZXMgdGhhdCBpbnZhbGlkIHN0cmlu
Z3Mgc2hvdWxkIGJlIHJlamVjdGVkIGJ5IHRoZSBmaWxlc3lzdGVtLgo+PiAgRGVmYXVsdCBpcyBk
aXNhYmxlZC4KPj4gIC5SRQo+PiArLlJTIDEuMmkKPj4gKy5UUCAxLjJpCj4+ICsuQiBbbm9daGFz
aG9ubHkKPj4gK1RoaXMgZmxhZyBzcGVjaWZpZXMgdGhhdCBsaW5lYXIgbG9va3VwIGZhbGxiYWNr
IGlzIG9mZiBkdXJpbmcgbG9va3VwLCB0byB0dXJuCj4+ICtvZmYgbGluZWFyIGxvb2t1cCBmYWxs
YmFjaywgdXNlIG5vaGFzaG9ubHkgZmxhZy4KPiBoZXJlIHNob3VsZCAidG8gdHVybiBvZmYgbGlu
ZWFyIGxvb2t1cCBmYWxsYmFjaywgdXNlIGhhc2hvbmx5IGZsYWciPwo+IG9yICJ0byB0dXJuIG9u
IGxpbmVhciBsb29rdXAgZmFsbGJhY2ssIHVzZSBub2hhc2hvbmx5IGZsYWciCgpaaGlndW8sCgpZ
ZXMsIGl0J3MgdHlwbywgbGV0IG1lIGZpeCBpdCwgdGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKVGhh
bmtzLAoKPiAxLjEpIERpc2FibGUgbGluZWFyIGxvb2t1cDoKPiAtIG1rZnMuZjJmcyAtZiAtZyBh
bmRyb2lkIC1PIGNhc2Vmb2xkIC1DIHV0Zjg6aGFzaG9ubHkgL2Rldi92ZGIKPiAKPj4gK0ZvciBh
bmRyb2lkIGNhc2UsIGl0IHdpbGwgZGlzYWJsZSBsaW5lYXIgbG9va3VwIGJ5IGRlZmF1bHQuCj4+
ICsuUkUKPj4gIC5SRQo+PiAgLlRQCj4+ICAuQkkgXC1xCj4+IGRpZmYgLS1naXQgYS9ta2ZzL2Yy
ZnNfZm9ybWF0LmMgYi9ta2ZzL2YyZnNfZm9ybWF0LmMKPj4gaW5kZXggMjY4MGJkMy4uMDRkZmMy
MCAxMDA2NDQKPj4gLS0tIGEvbWtmcy9mMmZzX2Zvcm1hdC5jCj4+ICsrKyBiL21rZnMvZjJmc19m
b3JtYXQuYwo+PiBAQCAtNjcxLDYgKzY3MSwxNyBAQCBzdGF0aWMgaW50IGYyZnNfcHJlcGFyZV9z
dXBlcl9ibG9jayh2b2lkKQo+PiAgICAgICAgIG1lbWNweShzYi0+aW5pdF92ZXJzaW9uLCBjLnZl
cnNpb24sIFZFUlNJT05fTEVOKTsKPj4KPj4gICAgICAgICBpZiAoYy5mZWF0dXJlICYgRjJGU19G
RUFUVVJFX0NBU0VGT0xEKSB7Cj4+ICsgICAgICAgICAgICAgICAvKgo+PiArICAgICAgICAgICAg
ICAgICogaWYgW25vXWhhc2hvbmx5IG9wdGlvbiBpcyBub3QgYXNzaWduZWQsIGxldCdzIGRpc2Fi
bGUKPj4gKyAgICAgICAgICAgICAgICAqIGxpbmVhciBsb29rdXAgZmFsbGJhY2sgYnkgZGVmYXVs
dCBmb3IgQW5kcm9pZCBjYXNlLgo+PiArICAgICAgICAgICAgICAgICovCj4+ICsgICAgICAgICAg
ICAgICBpZiAoKGMubm9saW5lYXJfbG9va3VwID09IExJTkVBUl9MT09LVVBfREVGQVVMVCkgJiYK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgKGMuZGlzYWJsZWRfZmVhdHVyZSAmIEYyRlNfRkVB
VFVSRV9MSU5FQVJfTE9PS1VQKSkgewo+PiArICAgICAgICAgICAgICAgICAgICAgICBjLnNfZW5j
b2RpbmdfZmxhZ3MgfD0gRjJGU19FTkNfTk9fQ09NUEFUX0ZBTExCQUNLX0ZMOwo+PiArICAgICAg
ICAgICAgICAgICAgICAgICBNU0coMCwgIkluZm86IHNldCBkZWZhdWx0IGxpbmVhcl9sb29rdXAg
b3B0aW9uOiAlc1xuIiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjLnNfZW5j
b2RpbmdfZmxhZ3MgJiBGMkZTX0VOQ19OT19DT01QQVRfRkFMTEJBQ0tfRkwgPwo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJkaXNhYmxlIiA6ICJlbmFibGUiKTsKPj4gKyAgICAg
ICAgICAgICAgIH0KPj4gICAgICAgICAgICAgICAgIHNldF9zYihzX2VuY29kaW5nLCBjLnNfZW5j
b2RpbmcpOwo+PiAgICAgICAgICAgICAgICAgc2V0X3NiKHNfZW5jb2RpbmdfZmxhZ3MsIGMuc19l
bmNvZGluZ19mbGFncyk7Cj4+ICAgICAgICAgfQo+PiBkaWZmIC0tZ2l0IGEvbWtmcy9mMmZzX2Zv
cm1hdF9tYWluLmMgYi9ta2ZzL2YyZnNfZm9ybWF0X21haW4uYwo+PiBpbmRleCBmMGJlYzRmLi44
ZjhlOTc1IDEwMDY0NAo+PiAtLS0gYS9ta2ZzL2YyZnNfZm9ybWF0X21haW4uYwo+PiArKysgYi9t
a2ZzL2YyZnNfZm9ybWF0X21haW4uYwo+PiBAQCAtMTQzLDcgKzE0Myw4IEBAIHN0YXRpYyB2b2lk
IGFkZF9kZWZhdWx0X29wdGlvbnModm9pZCkKPj4gICAgICAgICAgICAgICAgIGZvcmNlX292ZXJ3
cml0ZSA9IDE7Cj4+ICAgICAgICAgICAgICAgICBjLndhbnRlZF9zZWN0b3Jfc2l6ZSA9IEYyRlNf
QkxLU0laRTsKPj4gICAgICAgICAgICAgICAgIGMucm9vdF91aWQgPSBjLnJvb3RfZ2lkID0gMDsK
Pj4gLSAgICAgICAgICAgICAgIGMuZGlzYWJsZWRfZmVhdHVyZSB8PSBGMkZTX0ZFQVRVUkVfTkFU
X0JJVFM7Cj4+ICsgICAgICAgICAgICAgICBjLmRpc2FibGVkX2ZlYXR1cmUgfD0gRjJGU19GRUFU
VVJFX05BVF9CSVRTIHwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEYyRlNfRkVBVFVSRV9MSU5FQVJfTE9PS1VQOwo+Pgo+PiAgICAgICAgICAgICAgICAgLyogUk8g
ZG9lc24ndCBuZWVkIGFueSBvdGhlciBmZWF0dXJlcyAqLwo+PiAgICAgICAgICAgICAgICAgaWYg
KGMuZmVhdHVyZSAmIEYyRlNfRkVBVFVSRV9STykKPiBvdGhlcnMgbG9vayBPSyB0byBtZSxzbwo+
IFJldmlld2VkLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4+IC0tCj4+
IDIuNDkuMAo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

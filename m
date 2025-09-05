Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C20E4B450E6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Sep 2025 10:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stznFEj45sKLdo4Zjc+dXwU9FewYcrEOM6LyExWzdRk=; b=QPlglSUcrmxcQf/ft8KkcyTO1u
	XGIcM5rKf0xj7bTvYKbr1iJTfWU8+c96anKwX20xVQQ1WiWkEgZ+lSMCFQZVx2xPTh7UERH6Tq4HC
	aTEeSjURZkyNWSJfOz3tVikGhaOc0RT31s8VikjFBuQLnGYJA0sww04c3q23nak4QEh8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uuRU0-0003E1-9n;
	Fri, 05 Sep 2025 08:07:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uuRTz-0003Dt-7U
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Sep 2025 08:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ag56bFN+JpJOTKkUhpIErE8HDDXOhkqySwZ/Nbb1Bo=; b=Mo/oIpnsSFqVbzjHfuZRuSycHP
 w+NI+NuICFHuSwtpkC3FiaTI/hRkWPJnMAN+hZcUM2ohQQCis1Kc147DJqDDK5yT3Jzsroku91BJF
 DuEJgy/9s/hHAvGHl6wkB7Uk6Q6hC4FvjyzIZMLp35HRXJZ7+iXbW9eB/tXeYNkHISUM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5ag56bFN+JpJOTKkUhpIErE8HDDXOhkqySwZ/Nbb1Bo=; b=Kc5kkCwEwJq1PfchjO6rW1uTjT
 jRfdZ1hAjk4D7LHat+qfAm1fiPz8hZ/pT+F9ltvEgBNBGwiwG6b5av46bkmMbX1nGcG8SCmzVY9+x
 VlVU/6MQT+AMHkbN9uWhQFhQRL712ePL+66iwSf/NVywR1id4Vpl+1sr74Px+EHlnbH4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uuRTw-0000xm-LC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Sep 2025 08:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A523446B1;
 Fri,  5 Sep 2025 08:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C24C4CEF1;
 Fri,  5 Sep 2025 08:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757059655;
 bh=G1c34E9UljP/2RWoeRbmSKD/hiWTVWEqc8Eq8hhF5DI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jzExz+xLkPMQBwIY6YeZiWJk4C83z9rssBIqqLlwGeNSfoWDa9wWiFX8MRnyRgJ18
 hy8BJP3WNEUmigvGs5qg3Zkor8/jOWN6RW+6vrp/zUBcyPIrBLGHI6iXopBUThjQgj
 njqBcICs6DB1mvC0nYOTXiN2Lw9zyX0GGGalHf4eJetScDtP3TWFn470srg3+gM9MN
 FEkCw2fYeFfW7neeNblihxcqgD/Crr3c1EubpE63Da6Las2MFiwDqExUZPN1rws4vx
 rX6LlW+6lVZG+70+6yphuwVMJeWIQm8a3feiMCsxREVAaTSaCAF53cTrKZ5LYX7L3j
 tKxCrHMRZfbdQ==
Message-ID: <87c42690-be6d-4691-a348-3fcde2def3e1@kernel.org>
Date: Fri, 5 Sep 2025 16:07:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wang Xiaojun <wangxiaojun@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20250820075444.378907-1-wangxiaojun@vivo.com>
 <d0a1e0a3-bde1-485c-bee0-70c04ab3846d@kernel.org>
 <234d4f23-5ce4-426e-9b3c-5f2b28d86a3f@vivo.com>
 <066cd125-7db8-4b97-b6e3-20e10023a14f@kernel.org>
 <b38f1597-c32e-4651-b5aa-596ed4e61ef7@vivo.com>
 <cf992923-d6c3-4ee5-8cc9-44b4e11c2526@vivo.com>
Content-Language: en-US
In-Reply-To: <cf992923-d6c3-4ee5-8cc9-44b4e11c2526@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/4/2025 5:35 PM, Wang Xiaojun wrote: > Hi Chao, > > We
 previously thought that "triggering checkpoint for fsync after falloc > -k"
 could solve this problem. > > But I found that the above method c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uuRTw-0000xm-LC
Subject: Re: [f2fs-dev] [PATCH v4] f2fs:fix missing space reclamation during
 the recovery process
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOS80LzIwMjUgNTozNSBQTSwgV2FuZyBYaWFvanVuIHdyb3RlOgo+IEhpIENoYW8sCj4gCj4g
V2UgcHJldmlvdXNseSB0aG91Z2h0IHRoYXQgInRyaWdnZXJpbmcgY2hlY2twb2ludCBmb3IgZnN5
bmMgYWZ0ZXIgZmFsbG9jCj4gLWsiIGNvdWxkIHNvbHZlIHRoaXMgcHJvYmxlbS4KPiAKPiBCdXQg
SSBmb3VuZCB0aGF0IHRoZSBhYm92ZSBtZXRob2QgY2FuIGJlIGludmFsaWQgaW4gdGhlIGZvbGxv
d2luZyBzY2VuYXJpb3MuCj4gCj4gY2FzZSAxOgo+IHdyaXRlIGZpbGVBIDJNIHzCoCBmYWxsb2Mg
LWsgMk0gMTAwTSB8IHRydW5jYXRlIDEwTQo+IEF0IHRoaXMgcG9pbnQsIHRoZSBmaWxlIHNpemUg
aXMgMTBNQiwgd2hpbGUgdGhlIGRpc2sgc3BhY2UgY29uc3VtZWQgaXMKPiAxMDBNQi4KPiAKPiBj
YXNlIDLvvJoKPiB3cml0ZSBmaWxlQSAyTSB8wqAgZmFsbG9jIC1rIDJNIDEwME0gfCB0cnVuY2F0
ZSAxTQo+IEF0IHRoaXMgcG9pbnQsIHRoZSBmaWxlIHNpemUgaXMgMU1CLCB3aGlsZSB0aGUgZGlz
ayBzcGFjZSBjb25zdW1lZCBpcyAxTUIuCj4gCj4gRXZlbiBpZiB3ZSBwZXJmb3JtIGEgY2hlY2tw
b2ludCBhZnRlciBmYWxsb2MsCj4gCj4gY2FzZSAxOgo+IHdyaXRlIGZpbGVBIDJNIHzCoCBmYWxs
b2MgLWsgMk0gMTAwTSB8IGNoZWNrcG9pbnQgfCB0cnVuY2F0ZSAxME0gfCBTUE8KPiAKPiBjYXNl
IDLvvJoKPiB3cml0ZSBmaWxlQSAyTSB8wqAgZmFsbG9jIC1rIDJNIDEwME0gfCBjaGVja3BvaW50
IHwgdHJ1bmNhdGUgMU0gfCBTUE8KPiAKPiBCdXQgZHVyaW5nIHRoZSByZWNvdmVyeSBwcm9jZXNz
LAo+IAo+IHdlIGNhbm5vdCBkZXRlcm1pbmUgd2hldGhlciB0aGUgMTAwTUIgc3BhY2UgcHJlLWFs
bG9jYXRlZCBieSBmYWxsb2MKPiBuZWVkcyB0byBiZSByZXRhaW5lZC4KClhpYW9qdW4sIHRoYW5r
cyBmb3IgbWVudGlvbmluZyB0aGlzIGlzc3VlLgoKU28gd2UgbmVlZCBhbiBvbi1kaXNrIGZsYWcg
dG8gaW5kaWNhdGUgd2hldGhlciB0aGVyZSBpcyBmYWxsb2NhdGVkIGJsa2FkZHJzCmFmdGVyIGlf
c2l6ZSwgcmlnaHQ/CgpGb3IgYWJvdmUgY2FzZToKZmFsbG9jIC1rIDJNIDEwME0gLT4gc2V0IHRo
ZSBmbGFnCmNoZWNrcG9pbnQKdHJ1bmNhdGUgMU0gLT4gY2xlYXIgdGhlIGZsYWcKcmVjb3Zlcnk6
IHRydW5jYXRlIGJsa2FkZHJzIGFmdGVyIGlfc2l6ZSBhcyB0aGUgZmxhZyBpcyBub3Qgc2V0PwoK
VGhvdWdodHM/CgpUaGFua3MsCgo+IAo+IFBlcmhhcHMgd2UgbmVlZCB0byByZXNlYXJjaCBhIG5l
dyBtZWNoYW5pc20gdG8gc29sdmUgdGhpcyBwcm9ibGVtLgo+IAo+IAo+IFRoYW5rcywKPiAKPiDl
nKggOC8yOC8yMDI1IDEyOjQ5IFBNLCDnjovmmZPnj7og5YaZ6YGTOgo+PiDlnKggOC8yOC8yMDI1
IDk6NDQgQU0sIENoYW8gWXUg5YaZ6YGTOgo+Pj4gT24gOC8yNi8yNSAwOTo0OCwg546L5pmT54+6
IHdyb3RlOgo+Pj4+IOWcqCA4LzI1LzIwMjUgMTA6MDggQU0sIENoYW8gWXUg5YaZ6YGTOgo+Pj4+
PiBPbiA4LzIwLzI1IDE1OjU0LCBXYW5nIFhpYW9qdW4gd3JvdGU6Cj4+Pj4+PiBUaGlzIHBhdGNo
IGZpeGVzIG1pc3Npbmcgc3BhY2UgcmVjbGFtYXRpb24gZHVyaW5nIHRoZSByZWNvdmVyeSBwcm9j
ZXNzLgo+Pj4+Pj4KPj4+Pj4+IEluIHRoZSBmb2xsb3dpbmcgc2NlbmFyaW9zLCBGMkZTIGNhbm5v
dCByZWNsYWltIHRydW5jYXRlZCBzcGFjZS4KPj4+Pj4+IGNhc2UgMToKPj4+Pj4+IHdyaXRlIGZp
bGUgQSwgc2l6ZSBpcyAxRyB8IENQIHwgdHJ1bmNhdGUgQSB0byAxTSB8IGZzeW5jIEEgfCBTUE8K
Pj4+Pj4+Cj4+Pj4+PiBjYXNlIDI6Cj4+Pj4+PiBDUCB8IHdyaXRlIGZpbGUgQSwgc2l6ZSBpcyAx
RyB8IGZzeW5jIEEgfCB0cnVuY2F0ZSBBIHRvIDFNIHwgZnN5bmMgQSB8U1BPCj4+Pj4+Pgo+Pj4+
Pj4gRHVyaW5nIHRoZSByZWNvdmVyeSBwcm9jZXNzLCBGMkZTIHdpbGwgcmVjb3ZlciBmaWxlIEEs
Cj4+Pj4+PiBidXQgdGhlIDFNLTFHIHNwYWNlIGNhbm5vdCBiZSByZWNsYWltZWQuCj4+Pj4+Pgo+
Pj4+Pj4gQnV0IHRoZSBjb21iaW5hdGlvbiBvZiB0cnVuY2F0ZSBhbmQgZmFsbG9jIGNvbXBsaWNh
dGVzIHRoZSByZWNvdmVyeQo+Pj4+Pj4gcHJvY2Vzcy4KPj4+Pj4+IEZvciBleGFtcGxlLCBpbiB0
aGUgZm9sbG93aW5nIHNjZW5hcmlvOgo+Pj4+Pj4gd3JpdGUgZmlsZUEgMk0gfCBmc3luYyB8IHRy
dW5jYXRlIDI1NksgfCBmYWxsb2MgLWsgMjU2SyAxTSB8IGZzeW5jIEEgfCBTUE8KPj4+Pj4+IFRo
ZSBmYWxsb2MgKDI1NkssIDFNKSBuZWVkIHRvIGJlIHJlY292ZXJlZCBhcyBwcmUtYWxsb2NhdGVk
IHNwYWNlLgo+Pj4+Pj4KPj4+Pj4+IEhvd2V2ZXIgaW4gdGhlIGZvbGxvd2luZyBzY2VuYXJpb3Ms
IHRoZSBzaXR1YXRpb24gaXMgdGhlIG9wcG9zaXRlLgo+Pj4+Pj4gd3JpdGUgZmlsZUEgMk0gfCBm
c3luYyB8IGZhbGxvYyAtayAyTSAxME0gfCBmc3luYyBBIHwgdHJ1bmNhdGUgMjU2SyB8Cj4+Pj4+
PiBmc3luYyBBIHwgU1BPCj4+Pj4+PiBJbiB0aGlzIHNjZW5hcmlvLCB0aGUgc3BhY2UgYWxsb2Nh
dGVkIGJ5IGZhbGxvYyBuZWVkcyB0byBiZSB0cnVuY2F0ZWQuCj4+Pj4+Pgo+Pj4+Pj4gRHVyaW5n
IHRoZSByZWNvdmVyeSBwcm9jZXNzLCBpdCBpcyBkaWZmaWN1bHQgdG8gZGlzdGluZ3Vpc2gKPj4+
Pj4+IGJldHdlZW4gdGhlIGFib3ZlIHR3byB0eXBlcyBvZiBmYWxsb2MuCj4+Pj4+Pgo+Pj4+Pj4g
U28gaW4gdGhpcyBjYXNlIG9mIGZhbGxvYyAtayB3ZSBuZWVkIHRvIHRyaWdnZXIgYSBjaGVja3Bv
aW50IGZvciBmc3luYy4KPj4+Pj4+Cj4+Pj4+PiBGaXhlczogZDYyNGM5NmZiMzI0OSAoImYyZnM6
IGFkZCByZWNvdmVyeSByb3V0aW5lcyBmb3Igcm9sbC1mb3J3YXJkIikKPj4+Pj4+Cj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBXYW5nIFhpYW9qdW4gPHdhbmd4aWFvanVuQHZpdm8uY29tPgo+Pj4+Pj4g
LS0tCj4+Pj4+PiB2NDogVHJpZ2dlciBjaGVja3BvaW50IGZvciBmc3luYyBhZnRlciBmYWxsb2Mg
LWsKPj4+Pj4+IHYzOiBBZGQgYSBGaXhlcyBsaW5lLgo+Pj4+Pj4gdjI6IEFwcGx5IENoYW8ncyBz
dWdnZXN0aW9uIGZyb20gdjEuIE5vIGxvZ2ljYWwgY2hhbmdlcy4KPj4+Pj4+IHYxOiBGaXggbWlz
c2luZyBzcGFjZSByZWNsYW1hdGlvbiBkdXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MuCj4+Pj4+
PiAtLS0KPj4+Pj4+ICAgICAgZnMvZjJmcy9jaGVja3BvaW50LmMgfCAgMyArKysKPj4+Pj4+ICAg
ICAgZnMvZjJmcy9mMmZzLmggICAgICAgfCAgMyArKysKPj4+Pj4+ICAgICAgZnMvZjJmcy9maWxl
LmMgICAgICAgfCAgOCArKysrKystLQo+Pj4+Pj4gICAgICBmcy9mMmZzL3JlY292ZXJ5LmMgICB8
IDE4ICsrKysrKysrKysrKysrKysrLQo+Pj4+Pj4gICAgICA0IGZpbGVzIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvY2hlY2twb2ludC5jIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPj4+Pj4+IGluZGV4IGRi
MzgzMWY3ZjJmNS4uNzc1ZTMzMzMwOTdlIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9jaGVj
a3BvaW50LmMKPj4+Pj4+ICsrKyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4+Pj4+PiBAQCAtMTE1
MSw2ICsxMTUxLDkgQEAgc3RhdGljIGludCBmMmZzX3N5bmNfaW5vZGVfbWV0YShzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmkpCj4+Pj4+PiAgICAgIAkJaWYgKGlub2RlKSB7Cj4+Pj4+PiAgICAgIAkJ
CXN5bmNfaW5vZGVfbWV0YWRhdGEoaW5vZGUsIDApOwo+Pj4+Pj4gICAgICAKPj4+Pj4+ICsJCQlp
ZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0ZBTExPQ19LRUVQX1NJWkUpKQo+Pj4+Pj4g
KwkJCQljbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9GQUxMT0NfS0VFUF9TSVpFKTsKPj4+Pj4+
ICsKPj4+Pj4+ICAgICAgCQkJLyogaXQncyBvbiBldmljdGlvbiAqLwo+Pj4+Pj4gICAgICAJCQlp
ZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0RJUlRZX0lOT0RFKSkKPj4+Pj4+ICAgICAg
CQkJCWYyZnNfdXBkYXRlX2lub2RlX3BhZ2UoaW5vZGUpOwo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4+IGluZGV4IDQ2YmU3NTYwNTQ4Yy4u
ZjVhNTRiYzg0OGQ1IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4+ICsr
KyBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+PiBAQCAtNDU5LDYgKzQ1OSw3IEBAIHN0cnVjdCBmc3lu
Y19pbm9kZV9lbnRyeSB7Cj4+Pj4+PiAgICAgIAlzdHJ1Y3QgaW5vZGUgKmlub2RlOwkvKiB2ZnMg
aW5vZGUgcG9pbnRlciAqLwo+Pj4+Pj4gICAgICAJYmxvY2tfdCBibGthZGRyOwkvKiBibG9jayBh
ZGRyZXNzIGxvY2F0aW5nIHRoZSBsYXN0IGZzeW5jICovCj4+Pj4+PiAgICAgIAlibG9ja190IGxh
c3RfZGVudHJ5OwkvKiBibG9jayBhZGRyZXNzIGxvY2F0aW5nIHRoZSBsYXN0IGRlbnRyeSAqLwo+
Pj4+Pj4gKwlsb2ZmX3QgbWF4X2lfc2l6ZTsJLyogcHJldmlvdXMgbWF4IGZpbGUgc2l6ZSBmb3Ig
dHJ1bmNhdGUgKi8KPj4+Pj4+ICAgICAgfTsKPj4+Pj4+ICAgICAgCj4+Pj4+PiAgICAgICNkZWZp
bmUgbmF0c19pbl9jdXJzdW0oam5sKQkJKGxlMTZfdG9fY3B1KChqbmwpLT5uX25hdHMpKQo+Pj4+
Pj4gQEAgLTgzNSw2ICs4MzYsNyBAQCBlbnVtIHsKPj4+Pj4+ICAgICAgCUZJX0FUT01JQ19SRVBM
QUNFLAkvKiBpbmRpY2F0ZSBhdG9taWMgcmVwbGFjZSAqLwo+Pj4+Pj4gICAgICAJRklfT1BFTkVE
X0ZJTEUsCQkvKiBpbmRpY2F0ZSBmaWxlIGhhcyBiZWVuIG9wZW5lZCAqLwo+Pj4+Pj4gICAgICAJ
RklfRE9OQVRFX0ZJTklTSEVELAkvKiBpbmRpY2F0ZSBwYWdlIGRvbmF0aW9uIG9mIGZpbGUgaGFz
IGJlZW4gZmluaXNoZWQgKi8KPj4+Pj4+ICsJRklfRkFMTE9DX0tFRVBfU0laRSwJLyogZmlsZSBh
bGxvY2F0ZSByZXNlcnZlZCBzcGFjZSBhbmQga2VlcCBzaXplICovCj4+Pj4+PiAgICAgIAlGSV9N
QVgsCQkJLyogbWF4IGZsYWcsIG5ldmVyIGJlIHVzZWQgKi8KPj4+Pj4+ICAgICAgfTsKPj4+Pj4+
ICAgICAgCj4+Pj4+PiBAQCAtMTE5Myw2ICsxMTk1LDcgQEAgZW51bSBjcF9yZWFzb25fdHlwZSB7
Cj4+Pj4+PiAgICAgIAlDUF9TUEVDX0xPR19OVU0sCj4+Pj4+PiAgICAgIAlDUF9SRUNPVkVSX0RJ
UiwKPj4+Pj4+ICAgICAgCUNQX1hBVFRSX0RJUiwKPj4+Pj4+ICsJQ1BfRkFMTE9DX0ZJTEUsCj4+
Pj4+PiAgICAgIH07Cj4+Pj4+PiAgICAgIAo+Pj4+Pj4gICAgICBlbnVtIGlvc3RhdF90eXBlIHsK
Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+
PiBpbmRleCA0MmZhYWVkNmEwMmQuLmYwODIwZjgxNzgyNCAxMDA2NDQKPj4+Pj4+IC0tLSBhL2Zz
L2YyZnMvZmlsZS5jCj4+Pj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+Pj4gQEAgLTIzNiw2
ICsyMzYsOCBAQCBzdGF0aWMgaW5saW5lIGVudW0gY3BfcmVhc29uX3R5cGUgbmVlZF9kb19jaGVj
a3BvaW50KHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+Pj4+PiAgICAgIAllbHNlIGlmIChmMmZzX2V4
aXN0X3dyaXR0ZW5fZGF0YShzYmksIEYyRlNfSShpbm9kZSktPmlfcGlubywKPj4+Pj4+ICAgICAg
CQkJCQkJCVhBVFRSX0RJUl9JTk8pKQo+Pj4+Pj4gICAgICAJCWNwX3JlYXNvbiA9IENQX1hBVFRS
X0RJUjsKPj4+Pj4+ICsJZWxzZSBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0ZBTExP
Q19LRUVQX1NJWkUpKQo+Pj4+Pj4gKwkJY3BfcmVhc29uID0gQ1BfRkFMTE9DX0ZJTEU7Cj4+Pj4+
PiAgICAgIAo+Pj4+Pj4gICAgICAJcmV0dXJuIGNwX3JlYXNvbjsKPj4+Pj4+ICAgICAgfQo+Pj4+
Pj4gQEAgLTE5NTMsMTAgKzE5NTUsMTIgQEAgc3RhdGljIGludCBmMmZzX2V4cGFuZF9pbm9kZV9k
YXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsCj4+Pj4+PiAgICAgIAl9Cj4+
Pj4+PiAgICAgIAo+Pj4+Pj4gICAgICAJaWYgKG5ld19zaXplID4gaV9zaXplX3JlYWQoaW5vZGUp
KSB7Cj4+Pj4+PiAtCQlpZiAobW9kZSAmIEZBTExPQ19GTF9LRUVQX1NJWkUpCj4+Pj4+PiArCQlp
ZiAobW9kZSAmIEZBTExPQ19GTF9LRUVQX1NJWkUpIHsKPj4+Pj4+ICsJCQlzZXRfaW5vZGVfZmxh
Zyhpbm9kZSwgRklfRkFMTE9DX0tFRVBfU0laRSk7Cj4+Pj4+IFhpYW9qdW4sCj4+Pj4+Cj4+Pj4+
IFdlbGwsIHdoYXQgYWJvdXQgdGhpcyBjYXNlPwo+Pj4+Pgo+Pj4+PiBmYWxsb2MgLWsgb2ZzIHNp
emUgZmlsZQo+Pj4+PiBmbHVzaCBhbGwgZGF0YSBhbmQgbWV0YWRhdGEgb2YgZmlsZQo+Pj4+IEhp
IENoYW8sCj4+Pj4gRmx1c2ggYWxsIGRhdGEgYW5kIG1ldGFkYXRhIG9mIGZpbGUsIGJ1dCB3aXRo
b3V0IHVzaW5nIGZzeW5jIG9yIENQPwo+Pj4gWGlhb2p1biwKPj4+Cj4+PiBJIHRoaW5rIHNvLCBv
ciBhbSBJIG1pc3Npbmcgc29tZXRpbmc/Cj4+Pgo+Pj4gVGhhbmtzLAo+PiBIaSBDaGFvLAo+PiBJ
IHRoaW5rIHRoaXMgY2FzZSBpcyBwb3NzaWJsZS4gVGhhbmsgeW91IGZvciBwb2ludGluZyBvdXQg
dGhpcyBpc3N1ZS4KPj4gSSB3aWxsIGZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Pgo+PiBU
aGFua3MsCj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+IGV2aWN0IGlub2RlCj4+Pj4+IHdyaXRl
IGZpbGUgJiBmc3luYyBmaWxlIHdvbid0IHRyaWdnZXIgYSBjaGVja3BvaW50Pwo+Pj4+Pgo+Pj4+
PiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+
Pj4+PiAgICAgIAkJCWZpbGVfc2V0X2tlZXBfaXNpemUoaW5vZGUpOwo+Pj4+Pj4gLQkJZWxzZQo+
Pj4+Pj4gKwkJfSBlbHNlIHsKPj4+Pj4+ICAgICAgCQkJZjJmc19pX3NpemVfd3JpdGUoaW5vZGUs
IG5ld19zaXplKTsKPj4+Pj4+ICsJCX0KPj4+Pj4+ICAgICAgCX0KPj4+Pj4+ICAgICAgCj4+Pj4+
PiAgICAgIAlyZXR1cm4gZXJyOwo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvcmVjb3Zlcnku
YyBiL2ZzL2YyZnMvcmVjb3ZlcnkuYwo+Pj4+Pj4gaW5kZXggNGNiM2E5MTgwMWI0Li42OGI2MmM4
YTc0ZDMgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9mcy9mMmZzL3JlY292ZXJ5LmMKPj4+Pj4+ICsrKyBi
L2ZzL2YyZnMvcmVjb3ZlcnkuYwo+Pj4+Pj4gQEAgLTk1LDYgKzk1LDcgQEAgc3RhdGljIHN0cnVj
dCBmc3luY19pbm9kZV9lbnRyeSAqYWRkX2ZzeW5jX2lub2RlKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwKPj4+Pj4+ICAgICAgCWVudHJ5ID0gZjJmc19rbWVtX2NhY2hlX2FsbG9jKGZzeW5jX2Vu
dHJ5X3NsYWIsCj4+Pj4+PiAgICAgIAkJCQkJR0ZQX0YyRlNfWkVSTywgdHJ1ZSwgTlVMTCk7Cj4+
Pj4+PiAgICAgIAllbnRyeS0+aW5vZGUgPSBpbm9kZTsKPj4+Pj4+ICsJZW50cnktPm1heF9pX3Np
emUgPSBpX3NpemVfcmVhZChpbm9kZSk7Cj4+Pj4+PiAgICAgIAlsaXN0X2FkZF90YWlsKCZlbnRy
eS0+bGlzdCwgaGVhZCk7Cj4+Pj4+PiAgICAgIAo+Pj4+Pj4gICAgICAJcmV0dXJuIGVudHJ5Owo+
Pj4+Pj4gQEAgLTc5Niw2ICs3OTcsNyBAQCBzdGF0aWMgaW50IHJlY292ZXJfZGF0YShzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBsaXN0X2hlYWQgKmlub2RlX2xpc3QsCj4+Pj4+PiAg
ICAgIAl3aGlsZSAoMSkgewo+Pj4+Pj4gICAgICAJCXN0cnVjdCBmc3luY19pbm9kZV9lbnRyeSAq
ZW50cnk7Cj4+Pj4+PiAgICAgIAkJc3RydWN0IGZvbGlvICpmb2xpbzsKPj4+Pj4+ICsJCWxvZmZf
dCBpX3NpemU7Cj4+Pj4+PiAgICAgIAo+Pj4+Pj4gICAgICAJCWlmICghZjJmc19pc192YWxpZF9i
bGthZGRyKHNiaSwgYmxrYWRkciwgTUVUQV9QT1IpKQo+Pj4+Pj4gICAgICAJCQlicmVhazsKPj4+
Pj4+IEBAIC04MjgsNiArODMwLDkgQEAgc3RhdGljIGludCByZWNvdmVyX2RhdGEoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICppbm9kZV9saXN0LAo+Pj4+Pj4gICAg
ICAJCQkJYnJlYWs7Cj4+Pj4+PiAgICAgIAkJCX0KPj4+Pj4+ICAgICAgCQkJcmVjb3ZlcmVkX2lu
b2RlKys7Cj4+Pj4+PiArCQkJaV9zaXplID0gaV9zaXplX3JlYWQoZW50cnktPmlub2RlKTsKPj4+
Pj4+ICsJCQlpZiAoZW50cnktPm1heF9pX3NpemUgPCBpX3NpemUpCj4+Pj4+PiArCQkJCWVudHJ5
LT5tYXhfaV9zaXplID0gaV9zaXplOwo+Pj4+Pj4gICAgICAJCX0KPj4+Pj4+ICAgICAgCQlpZiAo
ZW50cnktPmxhc3RfZGVudHJ5ID09IGJsa2FkZHIpIHsKPj4+Pj4+ICAgICAgCQkJZXJyID0gcmVj
b3Zlcl9kZW50cnkoZW50cnktPmlub2RlLCBmb2xpbywgZGlyX2xpc3QpOwo+Pj4+Pj4gQEAgLTg0
NCw4ICs4NDksMTkgQEAgc3RhdGljIGludCByZWNvdmVyX2RhdGEoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICppbm9kZV9saXN0LAo+Pj4+Pj4gICAgICAJCX0KPj4+
Pj4+ICAgICAgCQlyZWNvdmVyZWRfZG5vZGUrKzsKPj4+Pj4+ICAgICAgCj4+Pj4+PiAtCQlpZiAo
ZW50cnktPmJsa2FkZHIgPT0gYmxrYWRkcikKPj4+Pj4+ICsJCWlmIChlbnRyeS0+YmxrYWRkciA9
PSBibGthZGRyKSB7Cj4+Pj4+PiArCQkJaV9zaXplID0gaV9zaXplX3JlYWQoZW50cnktPmlub2Rl
KTsKPj4+Pj4+ICsJCQlpZiAoZW50cnktPm1heF9pX3NpemUgPiBpX3NpemUpIHsKPj4+Pj4+ICsJ
CQkJZXJyID0gZjJmc190cnVuY2F0ZV9ibG9ja3MoZW50cnktPmlub2RlLAo+Pj4+Pj4gKwkJCQkJ
CQlpX3NpemUsIGZhbHNlKTsKPj4+Pj4+ICsJCQkJaWYgKGVycikgewo+Pj4+Pj4gKwkJCQkJZjJm
c19mb2xpb19wdXQoZm9saW8sIHRydWUpOwo+Pj4+Pj4gKwkJCQkJYnJlYWs7Cj4+Pj4+PiArCQkJ
CX0KPj4+Pj4+ICsJCQkJZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoZW50cnktPmlub2RlLCB0
cnVlKTsKPj4+Pj4+ICsJCQl9Cj4+Pj4+PiAgICAgIAkJCWxpc3RfbW92ZV90YWlsKCZlbnRyeS0+
bGlzdCwgdG1wX2lub2RlX2xpc3QpOwo+Pj4+Pj4gKwkJfQo+Pj4+Pj4gICAgICBuZXh0Ogo+Pj4+
Pj4gICAgICAJCXJhX2Jsb2NrcyA9IGFkanVzdF9wb3JfcmFfYmxvY2tzKHNiaSwgcmFfYmxvY2tz
LCBibGthZGRyLAo+Pj4+Pj4gICAgICAJCQkJCW5leHRfYmxrYWRkcl9vZl9ub2RlKGZvbGlvKSk7
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK

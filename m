Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 206EAA838AF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 07:53:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2kqo-0006T2-2e;
	Thu, 10 Apr 2025 05:53:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u2kqm-0006Sw-83
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 05:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cNsqAIfmjUmhaOcvQSc+KusnFJ3dZtBG0ckZDUxIRVo=; b=Xz1mT3firT7Rmk5A9igf8nLuaJ
 5ifedh8EamwsqCxnVOYG0Z8NtUib1eW4Z9xFkOif6lIaiG+6YBYo7OATEQtbYwQUCGusRs3tTCAKR
 F9VbN9xH4cyIqx7BL898NCx19SgN6pAeqyFKK0W7OkzEHd4J+WvHYWNTYnoORKA42c2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cNsqAIfmjUmhaOcvQSc+KusnFJ3dZtBG0ckZDUxIRVo=; b=MGVw15i6ZWAMV6xbu2oReOWXqe
 tenHyqOSHz2RCHCQsI5YeYyiiL3n6D+mI9D0FJ9/7cfx7+fJbN8tUa0gEj/RLjQmwXbYa8wcurlE+
 b7BgRFm5S/u7Vrfq9VQgxXi7thY3whcCaEcCmM3h//Ct43Ks75q3GsHu9l6FRGr6ANz4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u2kqW-0000LN-GU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 05:53:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5071C49C99;
 Thu, 10 Apr 2025 05:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE67C4CEDD;
 Thu, 10 Apr 2025 05:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744264379;
 bh=jh0k5uJ/efazxQmRmzNYg/ZAubSCIEpYa3srEp2MN5A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jjyyX2jV37FAKmWgTHSFDdm5We3WTMMpbfHi+LmGhzWEKK5cnvqxt0WEcg6McI9Xq
 YOR2IHj0egjc65SV0oHAExCC/VI3bldyY0UzZ4Ke1psPhEEI64GKujPFx6hFc8kptR
 jdHIfggwHuBGvMtpakgyrHbS76SEbYE4btuNTLiWsyp6PKXiTR2BjxpjTiG3Qk66ut
 DTK/rPgrKHoJX2YSy0jfN7JMK8wNTYOqnrDxTpjDtuIDpRuhfNGG88XxNlX8G4E2Bt
 swRX6yfx/oojsRgLhgyiCjUS1UPN5eLoz8WRYvczNSJiNhtfa7hlBYXWbxaBaNob8a
 SZPY/bpqoa8QQ==
Message-ID: <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
Date: Thu, 10 Apr 2025 13:52:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <CAD14+f1CYZ-OyKg36b_=VPmbBK0LSiieq1pgtXUy4OV2+KrR_g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f1CYZ-OyKg36b_=VPmbBK0LSiieq1pgtXUy4OV2+KrR_g@mail.gmail.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/6/25 16:30, Juhyung Park wrote: > Hi all, > > I also
 encountered something similar a while back with resizing but > didn't report
 it and just manually migrated the files. Hi Juhyung,
 Did you develop an individual
 tool to migrate specified inode to target block address? 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arter97.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u2kqW-0000LN-GU
Subject: Re: [f2fs-dev] Resize metadata corruption
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
Cc: uplinkr@airmail.cc, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC82LzI1IDE2OjMwLCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4gSGkgYWxsLAo+IAo+IEkgYWxz
byBlbmNvdW50ZXJlZCBzb21ldGhpbmcgc2ltaWxhciBhIHdoaWxlIGJhY2sgd2l0aCByZXNpemlu
ZyBidXQKPiBkaWRuJ3QgcmVwb3J0IGl0IGFuZCBqdXN0IG1hbnVhbGx5IG1pZ3JhdGVkIHRoZSBm
aWxlcy4KCkhpIEp1aHl1bmcsCgpEaWQgeW91IGRldmVsb3AgYW4gaW5kaXZpZHVhbCB0b29sIHRv
IG1pZ3JhdGUgc3BlY2lmaWVkIGlub2RlIHRvIHRhcmdldApibG9jayBhZGRyZXNzPwoKPiBJIGFz
c2lzdGVkIGhpbSB0byBlbnN1cmUgdXNpbmcgdGhlIGxhdGVzdCBrZXJuZWwvZjJmcy10b29scywg
YnV0IGhpcwo+IG1ldGFkYXRhIHNlZW1zIHByZXR0eSBiYWQgcmlnaHQgbm93IGFuZCBJIHN1Z2dl
c3RlZCBoaW0gdG8gYXNrIHRoZQo+IG1haWxpbmcgbGlzdCBkaXJlY3RseS4KCkkgY2hlY2tlZCB0
aGUgbG9nLCBJIGd1ZXNzIGl0IGFjdHVhbGx5IHNlZW1zIHByZXR0eSBiYWQuLi4gSSBndWVzcyB3
ZQpuZWVkIHRvIGZpbmQgb3V0IHRob3NlIGZpbGUgd2hpY2ggaGFzIG5vdCBiZWVuIG1pZ3JhdGVk
IGNvcnJlY3RseSwgYW5kCnRyeSB0byBjb3JyZWN0IHRoZW0sIG1heSBiZSB3LyBhIG5ldyB0b29s
LgoKVG8gSmFlZ2V1aywgYW55IHRob3VnaHRzIGFib3V0IHRoaXMgcHJvYmxlbT8KCj4gCj4gVGhl
IFVSTCB0aGVyZSBzaG91bGQgYmUgaHR0cHM6Ly9hcnRlcjk3LmNvbS8uZjJmcy0yMDI1MDQwNi9m
c2NrLmxvZyAsCj4gYSBsaXR0bGUgdHlwbyB0aGVyZS4KClRoYW5rcywgSSBkaWRuJ3Qgbm90aWNl
IHRoaXMgcHJldmlvdXNseS4KCj4gCj4gQ2FuIHdlIGhhdmUgc29tZSBzb3J0IG9mIENJL2F1dG9t
YXRlZCB0ZXN0aW5nIGZvciB0aGUgcmVzaXppbmcgYXMgd2VsbD8KCkFncmVlZCwgd2lsbCB3b3Jr
IG9uIHNvbWUgdGVzdGNhc2VzIGZvciByZXNpemUuZjJmcyB3aGVuIEkgZ2V0IHNvbWUgZnJlZQpz
bG90cy4KClRoYW5rcywKCj4gCj4gVGhhbmtzLgo+IAo+IE9uIFN1biwgQXByIDYsIDIwMjUgYXQg
MToyNuKAr0FNIHVwbGlua3ItLS0gdmlhIExpbnV4LWYyZnMtZGV2ZWwKPiA8bGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IHdyb3RlOgo+Pgo+PiBIZWxsbyBldmVyeW9uZSwK
Pj4KPj4gSSBhbSBoYXZpbmcgdHJvdWJsZSB3aXRoIEYyRlMuIFNwZWNpZmljYWxseSwgSSBiZWxp
ZXZlIG1ldGFkYXRhIGdvdAo+PiBjb3JydXB0ZWQgd2hlbiBJIHJlc2l6ZWQgaXQuIEkgaGF2ZSBh
IDUxMiBHQiBkcml2ZS4gTXkgRjJGUyBwYXJ0aXRpb24KPj4gd2FzIGFwcHJveGltYXRlbHkgbG9j
YXRlZCBvbiAzNjktNDk3IEdCICgxMjggR0Igc2l6ZSkuIFVzaW5nIEdQYXJ0ZWQsIEkKPj4gcmVz
aXplZCBpdCB0byAwLjUtNDk3IEdCLiBXaGlsZSB0aGUgcGFydGl0aW9uIHJlc2l6aW5nIHdlbnQg
dGhyb3VnaAo+PiBzdWNjZXNzZnVsbHksIGZpbGVzeXN0ZW0gcmVzaXppbmcgaW5pdGlhbGx5IGZh
aWxlZCB3aXRoICJNb3VudCB1bmNsZWFuCj4+IGltYWdlIHRvIHJlcGxheSBsb2ciLiBJIGhhdmUg
ZG9uZSB0aGF0IGFuZCByZXRyaWVkIHJlc2l6aW5nLgo+Pgo+PiBBZnRlcndhcmRzLCBob3dldmVy
LCBmc2NrIHN0YXJ0ZWQgZ2l2aW5nIG91dCBhIGxvdCBvZiBlcnJvcnMsIGF0IG9uZQo+PiBwb2lu
dCBpdCBhc2tlZCBpZiBJIHdpc2hlZCB0byByZXN0b3JlIGxvc3QgZGF0YSwgd2hpY2ggSSBhZ3Jl
ZWQgdG8uIExvZ3MKPj4gc3BlY2lmaWVkIGEgbG90IG9mIG15IGZpbGVzICh3aGljaCBJIGNvdWxk
IHRlbGwgYnkgZmlsZW5hbWVzKSBhbmQKPj4gbWlkLXdheSB0aHJvdWdoIHRoZSBwcm9jZXNzLCBp
dCBzZWdmYXVsdGVkLiBOb3csIHdoZW4gSSBydW4gZnNjaywgbm8KPj4gZmlsZXMgYXJlIGFza2Vk
IHRvIGJlIHJlc3RvcmVkLCBhbmQgaXQgY29tcGxldGVzIHN1Y2Nlc3NmdWxseS4gSG93ZXZlciwK
Pj4gd2hlbiBJIGF0dGVtcHQgdG8gbW91bnQgaXQsIEkgZ2V0IGFuIGVycm9yIHNheWluZyAiU3Ry
dWN0dXJlIG5lZWRzCj4+IGNsZWFuaW5nIi4KPj4KPj4gQ291bGQgc29tZW9uZSBoZWxwIG1lIHJl
c3RvcmUgbXkgbWV0YWRhdGEgKGF0IGxlYXN0LCBsb25nIGVub3VnaCB0bwo+PiBleHRyYWN0IG15
IGZpbGVzKT8gVGhhbmtzLgo+Pgo+PiBkbWVzZyBsb2dzOgo+Pgo+PiBbICAgOTYuMTg0MTI3XSBG
MkZTLWZzIChudm1lMG4xcDUpOiBNaXNtYXRjaCB2YWxpZCBibG9ja3MgNzY5IHZzLiA2OAo+PiBb
ICAgOTYuMTg4MDUwXSBGMkZTLWZzIChudm1lMG4xcDUpOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSBG
MkZTIHNlZ21lbnQKPj4gbWFuYWdlciAoLTExNykKPj4KPj4gZnNjay5mMmZzIC0tZHJ5LXJ1biAt
ZCAzIGxvZ3M6IGh0dHBzOi8vYXJ0ZXIuY29tLy5mMmZzLTIwMjUwNDA2L2ZzY2subG9nCj4+Cj4+
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

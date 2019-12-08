Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F71161B6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Dec 2019 14:42:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1idwpL-0001zB-Qq; Sun, 08 Dec 2019 13:42:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1idwpK-0001yz-1V
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Dec 2019 13:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vtUwSgyAUIkWPuj6CcgHpjRfAiUH5eXnEueaRUsIHcY=; b=ahBTCjMBzktJcvV7J25ngVWgKd
 38e44XSlan57EyJ0jrWO9jUnQA3nK/f6mMo95Nnau9Vi843s78wmEMhsSxYaKXM5zwgP07e+zCHo2
 NHFHc7I3Wx2TLTPXJtujmcLpoH38yJSY1vCjFmNIRxT72JI295c1ehEfqgn8iG27aWgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vtUwSgyAUIkWPuj6CcgHpjRfAiUH5eXnEueaRUsIHcY=; b=fw+2Pl8Z0j0eI5b5vWJ8xvfcrY
 wrAkWzr8ZYD4m9MN6qP6qlEfFJKUUx32A/i15bYeddlZRq1KpNM/7DRxpFEIYtoaZ8+mM+OVXoerT
 5A/SNFI2ISDIBkJPDZxy91E51Gm4+pf82iKkOJOhlANYi8K5GwWoX8MqhyxLHYh9DxIE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1idwpD-00EGXU-0C
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Dec 2019 13:42:21 +0000
Received: from [192.168.0.113] (unknown [58.212.132.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A78420692;
 Sun,  8 Dec 2019 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575812529;
 bh=QS0JF75AAooVz5Dn/cmphUzbNQSTgJHgQf6r95cB4GI=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=zrTlyk3tbERg2Cc0OZXwu6F0umJmfpbEng61TxC/7geMgpr+WCSbANvvrfdBgaFrU
 +kHX/9f4FBo3ygurBaBBWFG/Q05Qnd4u3Fr98dT2arMhzz3e+6wmcb9OF1wgdhfCPU
 HjTyCtpKHXCgz4yFPb4UPTrVd8qxqVTgeCsxlbe8=
To: Hongwei Qin <glqinhongwei@gmail.com>
References: <tencent_0B38BD6C2739091DE8A052D6D772D1DEAA06@qq.com>
 <4ef45a4b-47fa-4d7e-a060-4cad56ca372a@kernel.org>
 <CAKvRR0QoH2RAEzb9ki8GVUX22omST-Z2kq287i0fXmYXC7XCLw@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <c44322e5-016c-392b-475f-b832e1cc4fd9@kernel.org>
Date: Sun, 8 Dec 2019 21:41:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAKvRR0QoH2RAEzb9ki8GVUX22omST-Z2kq287i0fXmYXC7XCLw@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: usenix.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1idwpD-00EGXU-0C
Subject: Re: [f2fs-dev] Potential data corruption?
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
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgpPbiAyMDE5LTEyLTggMjE6MTUsIEhvbmd3ZWkgUWluIHdyb3RlOgo+IEhpLAo+Cj4gT24g
U3VuLCBEZWMgOCwgMjAxOSBhdCAxMjowMSBQTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Pgo+PiBIZWxsbywKPj4KPj4gT24gMjAxOS0xMi03IDE4OjEwLCDnuqLng6fnmoTlqIHl
jJbppbwgd3JvdGU6Cj4+PiBIaSBGMkZTIGV4cGVydHMsCj4+PiBUaGUgZm9sbG93aW5nIGNvbmZ1
c2VzIG1lOgo+Pj4KPj4+IEEgdHlwaWNhbCBmc3luYygpIGdvZXMgbGlrZSB0aGlzOgo+Pj4gMSkg
SXNzdWUgZGF0YSBibG9jayBJT3MKPj4+IDIpIFdhaXQgZm9yIGNvbXBsZXRpb24KPj4+IDMpIElz
c3VlIGNoYWluZWQgbm9kZSBibG9jayBJT3MKPj4+IDQpIFdhaXQgZm9yIGNvbXBsZXRpb24KPj4+
IDUpIElzc3VlIGZsdXNoIGNvbW1hbmQKPj4+Cj4+PiBJbiBvcmRlciB0byBwcmVzZXJ2ZSBkYXRh
IGNvbnNpc3RlbmN5IHVuZGVyIHN1ZGRlbiBwb3dlciBmYWlsdXJlLCBpdCByZXF1aXJlcyB0aGF0
IHRoZSBzdG9yYWdlIGRldmljZSBwZXJzaXN0cyBkYXRhIGJsb2NrcyBwcmlvciB0byBub2RlIGJs
b2Nrcy4KPj4+IE90aGVyd2lzZSwgdW5kZXIgc3VkZGVuIHBvd2VyIGZhaWx1cmUsIGl0J3MgcG9z
c2libGUgdGhhdCB0aGUgcGVyc2lzdGVkIG5vZGUgYmxvY2sgcG9pbnRzIHRvIE5VTEwgZGF0YSBi
bG9ja3MuCj4+Cj4+IEZpcnN0bHkgaXQgZG9lc24ndCBicmVhayBQT1NJWCBzZW1hbnRpY3MsIHJp
Z2h0PyBzaW5jZSBmc3luYygpIGRpZG4ndCByZXR1cm4KPj4gc3VjY2Vzc2Z1bGx5IGJlZm9yZSBz
dWRkZW4gcG93ZXItY3V0LCBzbyB3ZSBjYW4gbm90IGd1YXJhbnRlZSB0aGF0IGRhdGEgaXMgZnVs
bHkKPj4gcGVyc2lzdGVkIGluIHN1Y2ggY29uZGl0aW9uLgo+Pgo+PiBIb3dldmVyLCB3aGF0IHlv
dSB3YW50IGxvb2tzIGxpa2UgYXRvbWljIHdyaXRlIHNlbWFudGljcywgd2hpY2ggbW9zdGx5IGRh
dGFiYXNlCj4+IHdhbnQgdG8gZ3VhcmFudGVlIGR1cmluZyBkYiBmaWxlIHVwZGF0ZS4KPj4KPj4g
RjJGUyBoYXMgc3VwcG9ydCBhdG9taWNfd3JpdGUgdmlhIGlvY3RsLCB3aGljaCBpcyB1c2VkIGJ5
IFNRTGl0ZSBvZmZpY2lhbGx5LCBJCj4+IGd1ZXNzIHlvdSBjYW4gY2hlY2sgaXRzIGltcGxlbWVu
dGF0aW9uIGRldGFpbC4KPj4KPj4gVGhhbmtzLAo+Pgo+Cj4gVGhhbmtzIGZvciB5b3VyIGtpbmQg
cmVwbHkuCj4gSXQncyB0cnVlIHRoYXQgaWYgd2UgbWVldCBwb3dlciBmYWlsdXJlIGJlZm9yZSBm
c3luYygpIGNvbXBsZXRlcywKPiBQT1NJWCBkb2VuJ3QgcmVxdWlyZSBGUyB0byByZWNvdmVyIHRo
ZSBmaWxlLiBIb3dldmVyLCBjb25zaWRlciB0aGUKPiBmb2xsb3dpbmcgc2l0dWF0aW9uOgo+Cj4g
MSkgRGF0YSBibG9jayBJT3MgKE5vdCBwZXJzaXN0ZWQpCj4gMikgTm9kZSBibG9jayBJT3MgKEFs
bCBQZXJzaXN0ZWQpCj4gMykgUG93ZXIgZmFpbHVyZQo+Cj4gU2luY2UgdGhlIG5vZGUgYmxvY2tz
IGFyZSBhbGwgcGVyc2lzdGVkIGJlZm9yZSBwb3dlciBmYWlsdXJlLCB0aGUgbm9kZQo+IGNoYWlu
IGlzbid0IGJyb2tlbi4gTm90ZSB0aGF0IHRoaXMgZmlsZSdzIG5ldyBkYXRhIGlzIG5vdCBwcm9w
ZXJseQo+IHBlcnNpc3RlZCBiZWZvcmUgY3Jhc2guIFNvIHRoZSByZWNvdmVyeSBwcm9jZXNzIHNo
b3VsZCBiZSBhYmxlIHRvCj4gcmVjb2duaXplIHRoaXMgc2l0dWF0aW9uIGFuZCBhdm9pZCByZWNv
dmVyIHRoaXMgZmlsZS4gSG93ZXZlciwgc2luY2UKPiB0aGUgbm9kZSBjaGFpbiBpcyBub3QgYnJv
a2VuLCBwZXJoYXBzIHRoZSByZWNvdmVyeSBwcm9jZXNzIHdpbGwgcmVnYXJkCj4gdGhpcyBmaWxl
IGFzIHJlY292ZXJhYmxlPwoKU28gdGhpcyBpcyB3aHkgYXRvbWljIHdyaXRlIHN1Ym1pc3Npb24g
d2lsbCB0YWcgUFJFRkxVU0ggJiBGVUEgaW4gbGFzdCBub2RlIGJpbyAKdG8ga2VlcCBhbGwgZGF0
YSBJTyBiZWluZyBwZXJzaXN0ZWQgYmVmb3JlIG5vZGUgSU8sIGFuZCByZWNvdmVyeSBmbGFnIGlz
IG9ubHkgCnRhZ2dlZCBpbiBsYXN0IG5vZGUgYmxvY2sgb2Ygbm9kZSBjaGFpbiwgaWYgdGhlIGxh
c3Qgbm9kZSBibG9jayBpcyBub3QgYmUgCnBlcnNpc3RlZCwgYWxsIGF0b21pYyB3cml0ZSBkYXRh
IHdpbGwgbm90IGJlIHJlY292ZXJlZC4gV2l0aCB0aGlzIG1lY2hhbmlzbSwgd2UgCmNhbiBndWFy
YW50ZWUgYXRvbWljIHdyaXRlIHNlbWFudGljcy4KCl9fd3JpdGVfbm9kZV9wYWdlKCkKewouLi4K
CWlmIChhdG9taWMgJiYgIXRlc3Rfb3B0KHNiaSwgTk9CQVJSSUVSKSkKCQlmaW8ub3BfZmxhZ3Mg
fD0gUkVRX1BSRUZMVVNIIHwgUkVRX0ZVQTsKLi4uCn0KCmYyZnNfZnN5bmNfbm9kZV9wYWdlKCkK
ewouLi4KCQkJaWYgKCFhdG9taWMgfHwgcGFnZSA9PSBsYXN0X3BhZ2UpIHsKCQkJCXNldF9mc3lu
Y19tYXJrKHBhZ2UsIDEpOwoJCQkJaWYgKElTX0lOT0RFKHBhZ2UpKSB7CgkJCQkJaWYgKGlzX2lu
b2RlX2ZsYWdfc2V0KGlub2RlLAoJCQkJCQkJCUZJX0RJUlRZX0lOT0RFKSkKCQkJCQkJZjJmc191
cGRhdGVfaW5vZGUoaW5vZGUsIHBhZ2UpOwoJCQkJCXNldF9kZW50cnlfbWFyayhwYWdlLAoJCQkJ
CQlmMmZzX25lZWRfZGVudHJ5X21hcmsoc2JpLCBpbm8pKTsKCQkJCX0KCQkJCS8qICBtYXkgYmUg
d3JpdHRlbiBieSBvdGhlciB0aHJlYWQgKi8KCQkJCWlmICghUGFnZURpcnR5KHBhZ2UpKQoJCQkJ
CXNldF9wYWdlX2RpcnR5KHBhZ2UpOwoJCQl9Ci4uLgp9Cgo+Cj4gVGhhbmtzIQo+Cj4+Pgo+Pj4g
SG93ZXZlciwgYWNjb3JkaW5nIHRvIHRoaXMgc3R1ZHkgKGh0dHBzOi8vd3d3LnVzZW5peC5vcmcv
Y29uZmVyZW5jZS9mYXN0MTgvcHJlc2VudGF0aW9uL3dvbiksIHRoZSBwZXJzaXN0ZW50IG9yZGVy
IG9mIHJlcXVlc3RzIGRvZXNuJ3QgbmVjZXNzYXJpbHkgZXF1YWxzIHRvIHRoZSByZXF1ZXN0IGZp
bmlzaCBvcmRlciAoZHVlIHRvIGRldmljZSB2b2xhdGlsZSBjYWNoZXMpLiBUaGlzIG1lYW5zIHRo
YXQgaXRzIHBvc3NpYmxlIHRoYXQgdGhlIG5vZGUgYmxvY2tzIGdldCBwZXJzaXN0ZWQgcHJpb3Ig
dG8gZGF0YSBibG9ja3MuCj4+Pgo+Pj4gRG9lcyBGMkZTIGhhdmUgb3RoZXIgbWVjaGFuaXNtcyB0
byBwcmV2ZW50IHN1Y2ggaW5jb25zaXN0ZW5jeT8gT3IgZG9lcyBpdCByZXF1aXJlIHRoZSBkZXZp
Y2UgdG8gcGVyc2lzdCBkYXRhIHdpdGhvdXQgcmVvcmRlcmluZz8KPj4+Cj4+PiBUaGFua3MhCj4+
Pgo+Pj4gSG9uZ3dlaQo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pj4KPj4KPj4KPj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK

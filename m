Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDD14E21A2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Mar 2022 08:59:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWCp7-0007tl-Mt; Mon, 21 Mar 2022 07:59:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mudrunka@spoje.net>) id 1nWCp5-0007te-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 07:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GMdPEmDhlMVVIFqHYJkkN0Yel0lsVrBVDl3AOcYub+Q=; b=O/e6pXmQcObB/UfwSbYUg5y1SI
 WM2zEKrMeBt+1tC6ph0l6aCkkGRAGIoUr5vB6FNFQ7IZheyGEMFNwXtKOdBVuQQiptFEEjYeeO+0r
 olLxmworEjOtWUbsXbjf+xBDnMJM3MljZPjaDxs8kwzYTIrXCb3F1Bq1dFO+lrYJLrD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:References:In-Reply-To:From:Date:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GMdPEmDhlMVVIFqHYJkkN0Yel0lsVrBVDl3AOcYub+Q=; b=WPFM50v5b0R7mrxQvXg/rhmd1E
 goHsz0BX1THpXjh9nN1O/baWEJz8J84FNjxKxa9dFRBBFT4uIcNBCiTmFyGk3QYYj/lBWqSP0b9pG
 qosVpg4qkmlEwU1ZMuBPBcTfGY3MP6hkP7dOksqIzWw+AdEc4qspNGrLAWFz5aGQDj2w=;
Received: from mail.spoje.net ([82.100.58.2])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nWCwx-005lNN-OX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 07:59:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.spoje.net (Postfix) with ESMTP id 1B55A880DA3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Mar 2022 08:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
 s=spojemail; t=1647849562;
 bh=9FpzhVha080j1PsZKUvO/RWZ7yaeVAqPDdYjN0ukm1Q=;
 h=To:Subject:Date:From:In-Reply-To:References:From;
 b=TE6VCEnfbAh0lwqVrJyqma7qLbWLwgx1XHO1fmKQWMpPZvF6McJJcuoSN5v5IPdhO
 gYnz4ST+2jCIAowBKcED7A8CPCISaGwy5gq4bwau2lJk31ZrMahUw1JyaIbIXtDHYN
 1AwYKuJXUpVA1CWKfraDkPVIUxVlq4nkKMCKbRxo=
X-Virus-Scanned: Debian amavisd-new at mail.spoje.net
Authentication-Results: mail.spoje.net (amavisd-new); dkim=pass (1024-bit key)
 header.d=spoje.net
Received: from mail.spoje.net ([127.0.0.1])
 by localhost (mail.spoje.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPK55ihFUqqO
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Mar 2022 08:59:19 +0100 (CET)
Received: by mail.spoje.net (Postfix, from userid 33)
 id 9CF9F880C2B; Mon, 21 Mar 2022 08:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
 s=spojemail; t=1647849559;
 bh=9FpzhVha080j1PsZKUvO/RWZ7yaeVAqPDdYjN0ukm1Q=;
 h=To:Subject:Date:From:In-Reply-To:References:From;
 b=I0TDLuihzLdrd/nqOWwLbnvgv9p8AmMM92NJNtpQPUMhmcsrazMjecunkdNv0DzUz
 Bd2s/mKntRNwbq/BxxB1U6tMmdpqHGZoKSVMSzpq+KmpnF1E1p8rRPpsTfIQp3u1/B
 j/cdsxPaPPPDLLm85ZCZCe1ma6BN7X1/B+j38EPE=
To: linux-f2fs-devel@lists.sourceforge.net
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Date: Mon, 21 Mar 2022 08:59:19 +0100
From: Tomas Mudrunka <mudrunka@spoje.net>
Organization: SPOJE.NET s.r.o.
In-Reply-To: <b491875c-c6a8-1243-35cf-649be3250b5d@kernel.org>
References: <f4e22b0dff793f75b5c37a170acba03c@spoje.net>
 <b491875c-c6a8-1243-35cf-649be3250b5d@kernel.org>
Message-ID: <e0a87795a74782ae10500e2f4069a072@spoje.net>
X-Sender: mudrunka@spoje.net
User-Agent: Roundcube Webmail/1.2.3
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dne 2022-03-21 07:03, Chao Yu napsal: > On 2022/3/19 20:55, 
 Tomas Mudrunka wrote: >> Hello, >> i've noticed that mkfs.f2fs does not allow
 files to be copied to >> filesystem during formating by mkfs.f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nWCwx-005lNN-OX
Subject: Re: [f2fs-dev] Populate f2fs with files during mkfs.f2fs
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG5lIDIwMjItMDMtMjEgMDc6MDMsIENoYW8gWXUgbmFwc2FsOgo+IE9uIDIwMjIvMy8xOSAyMDo1
NSwgVG9tYXMgTXVkcnVua2Egd3JvdGU6Cj4+IEhlbGxvLAo+PiBpJ3ZlIG5vdGljZWQgdGhhdCBt
a2ZzLmYyZnMgZG9lcyBub3QgYWxsb3cgZmlsZXMgdG8gYmUgY29waWVkIHRvCj4+IGZpbGVzeXN0
ZW0gZHVyaW5nIGZvcm1hdGluZyBieSBta2ZzLmYyZnMuCj4+IERvIHlvdSB0aGluayBpdCB3b3Vs
ZCBiZSBoYXJkIHRvIGFkZCBzdWNoIGZlYXR1cmU/Cj4+IAo+PiBJIHVuZGVyc3RhbmQgdGhhdCB0
aGlzIG1pZ2h0IGJlIGEgd2VpcmQgcmVxdWVzdCB3aGljaCBpbiBzb21lIHNlbnNlCj4+IGRlZmll
cyB0aGUgZGVmaW5pdGlvbiBvZiBmaWxlc3lzdGVtIGZvcm1hdGluZyBwcm9jZXNzLiBCdXQgdGhl
cmUgYXJlCj4+IGFsc28gc29tZSBhcmd1bWVudHMgZm9yIHRoaXMgY2FzZS4KPj4gCj4+IEluIHRo
ZSB3b3JsZCBvZiBlbWJlZGRlZCBkZXZlbG9wbWVudCB3ZSBvZnRlbiBuZWVkIHRvIGJ1aWxkIGZp
cm13YXJlCj4+IGltYWdlcyB0byBiZSBmbGFzaGVkIGludG8gdGhlIGRldmljZS4gQW5kIEYyRlMg
aXMgb25lIG9mIHRoZSBiZXN0IAo+PiBzdWl0ZWQKPj4gZmlsZXN5c3RlbXMgZm9yIGVtYmVkZGVk
IGFuZCBwZXJoYXBzIHRoZSBvbmUgYmVzdCBmb3IgbWFuYWdlZCBmbGFzaC4gCj4+IFNvCj4+IHdl
IG5hdHVyYWx5IHdhbnQgdG8gdXNlIGl0IGFuZCBidWlsZCBpbnRvIG91ciBmdyBpbWFnZXMuIEhv
d2V2ZXIgdG8KPj4gYnVpbGQgc3VjaCBpbWFnZSBpIG5lZWQgdG8gY3JlYXRlIGYyZnMgaW1hZ2Us
IGZvcm1hdCBpdCBhbmQgdGhlbiBtb3VudAo+PiBpdCB1c2luZyBsb29wYmFjaywgY29weSBkYXRh
IHRvIGl0LCB1bm1vdW50LCBzeW5jLCBoYW5kbGUgZXJyb3JzLCAKPj4gZXRjLi4uCj4+IEFuZCB3
ZSBoYXZlIGh1Z2UgbWFrZWZpbGVzIG9yIHN0dWZmIGxpa2UgZ2VuaW1hZ2UsIHRvIHB1dCBhbGwg
dGhlIAo+PiBpbWFnZQo+PiBwYXJ0aXRpb25zIGFuZCBib290bG9hZGVycyBhbmQgZXZlcnl0aGlu
ZyB0b2dldGhlci4gSXQganVzdCBhZGRzIHF1aXRlCj4+IGNvbXBsZXhpdHkgdG8gdGhlIGVtYmVk
ZGVkIGJ1aWxkIHN5c3RlbXMuCj4+IAo+PiBUdXJucyBvdXQgdGhhdCBxdWl0ZSBmZXcgZmlsZXN5
c3RlbXMgYWxyZWFkeSBoYXZlIHRoaXMgZmVhdHVyZSB0bwo+PiBzaW1wbGlmeSBjcmVhdGluZyBm
aWxlc3lzdGVtIGltYWdlcyB3aXRob3V0IG5lZWQgZm9yIG1vdW50aW5nIG9yIHJvb3QKPj4gcGVy
bWlzc2lvbnM6Cj4+IAo+PiBta2ZzLmV4dDQgLWQgLi9pbnB1dF9kaXJlY3RvcnkKPj4gbWtmcy51
YmlmcyAtZCAuL2lucHV0X2RpcmVjdG9yeQo+PiBta2ZzLmpmZnMyIC1kIC4vaW5wdXRfZGlyZWN0
b3J5Cj4+IG1rY3JhbWZzIChvYnZpb3VzbHkpCj4+IG1rc3F1YXNoZnMgKG9idmlvdXNseSkKPj4g
Cj4+IHdvdWxkIHlvdSBwbGVhc2UgY29uc2lkZXIgYWRkaW5nIHN1Y2ggZmVhdHVyZSBhcyB3ZWxs
Pwo+IAo+IEhpIFRvbWFzLAo+IAo+IENhbiBzbG9hZC5mMmZzIHNhdGlzZnkgdGhpcyByZXF1aXJl
bWVudD8KClllcywgdGhhdCBpcyBleGFjdGx5IHdoYXQgaSBuZWVkZWQuCkkgZGlkbid0IHJlYWxp
emVkIGkgY2FuIGZpbmQgaXQgaW4gc2VwYXJhdGUgdG9vbC4KClRoYW5rIHlvdS4KCi0tIApTIHBv
emRyYXZlbQpCZXN0IHJlZ2FyZHMKICAgICAgVG9tw6HFoSBNdWRydcWIa2EgLSBTUE9KRS5ORVQg
cy5yLm8uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=

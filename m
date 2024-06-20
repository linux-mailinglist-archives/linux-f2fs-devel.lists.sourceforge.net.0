Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D0E90FE26
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2024 10:01:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sKCjR-0007Qd-RC;
	Thu, 20 Jun 2024 08:01:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sKCjQ-0007Q3-IO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 08:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obnPCGM8IpZIGfthMp9BuEXa9bzfXOer2mTTy2hTaQI=; b=Qpksegl8j+Lq52my6KJIHwD+Jz
 wc7YsqQxtFzNrKRpW4Saw0ojOMjWyQWzdyiRr99r+zSo2B2CusqAnjEjosslDz7dUQC3Wguse5qCX
 E8hRSkc30Uq3KEBxdzgIaeSC+aNXg4Vg+BTHuQOm3NZyymvTWOh9EUp7lcc7nJ52PHLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=obnPCGM8IpZIGfthMp9BuEXa9bzfXOer2mTTy2hTaQI=; b=eXj8Tb1LaatDUElY8h/IPNbaYq
 nRahciV5hQuRbSd5W2ucYTQhNRz4dsVaOY3CeIH73mPGBrd+fdWBjdVQysC+FWumEqiOwKu0IqLqy
 ibmaQurV8YorZbcGZIHEDHGkMmRZ87htJWyEyKR9BkjSVia+NErXmSqsQymE9negm6Fc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sKCjR-0001Dt-6X for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 08:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1773F61DF6;
 Thu, 20 Jun 2024 08:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB17C2BD10;
 Thu, 20 Jun 2024 08:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718870469;
 bh=Y3La64nEZFTJ5KhlL/R90AhCl3EJVfrwS8pZpoItdNs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rLJCB/E+oza6ve0WtASPkLy9Z16lpaqCTtre4fZc+LU0B8XmV0PFiVznxQwk2DIAi
 RR0CLqzK+gukCA1QRaTcNjyphSFabRCrqUXLpRAne2oACzfZ8Oqx75WBgwDf4OI4UY
 56gSm9TQxy1SZ4wNVOhC3J5vf84l8EHB2CzICh1nCY2+Ibcrskjd8Jg8h1sPE7ndFr
 r8Dtv5zL6hLezaL2HutDGVHoWqgEB6RPDdhReW53FaWEPnmv2xvvhT+RSIRDt17MAK
 JkZkHnxo225ErCf1kC62Ll5jHoHFcjeZ6JLhTKxcnb2dM1VbWqwlSajumNQA/6cVqT
 BMzwHX4fgD3kw==
Message-ID: <04e52097-def3-4baa-a566-8519c8a2b26d@kernel.org>
Date: Thu, 20 Jun 2024 16:01:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 Wenjie Cheng <cwjhust@gmail.com>
References: <e0d89f10-19b0-45db-948d-4c140c2dffa7@kernel.org>
 <e2371e59-7be5-40dc-9a2a-aef90ac93b18@kernel.org>
 <2842767c-db80-407b-a5e5-2b9fa74b0d79@kernel.org>
 <20240614004841.103114-1-cwjhust@gmail.com>
 <20240620055648epcms2p11b9914d40f560fb02fa241a7d2599298@epcms2p1>
 <20240620072218epcms2p11597e482b28804dd5f66b9d42a21b22f@epcms2p1>
 <CGME20240620032223epcas2p4d6b770a8e256d140e5296df8a386418e@epcms2p3>
 <20240620075634epcms2p35d3bafffb5f60902b1df25bf3269a686@epcms2p3>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240620075634epcms2p35d3bafffb5f60902b1df25bf3269a686@epcms2p3>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/20 15:56, Daejun Park wrote: >> On 2024/6/20 15:22,
 Daejun Park wrote: >>>> On 2024/6/20 13:56, Daejun Park wrote: >>>>> Hi Chao, 
 >>>>> >>>>>> Jaegeuk, >>>>>> >>>>>> Quoted commit message fr [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sKCjR-0001Dt-6X
Subject: Re: [f2fs-dev] (2) (2) (2) [PATCH] Revert "f2fs: use flush command
 instead of FUA for zoned device"
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
Cc: "qwjhust@gmail.com" <qwjhust@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC82LzIwIDE1OjU2LCBEYWVqdW4gUGFyayB3cm90ZToKPj4gT24gMjAyNC82LzIwIDE1
OjIyLCBEYWVqdW4gUGFyayB3cm90ZToKPj4+PiBPbiAyMDI0LzYvMjAgMTM6NTYsIERhZWp1biBQ
YXJrIHdyb3RlOgo+Pj4+PiBIaSBDaGFvLAo+Pj4+Pgo+Pj4+Pj4gSmFlZ2V1aywKPj4+Pj4+Cj4+
Pj4+PiBRdW90ZWQgY29tbWl0IG1lc3NhZ2UgZnJvbSBjb21taXQgYzU1MGUyNWJjYTY2ICgiZjJm
czogdXNlIGZsdXNoIGNvbW1hbmQKPj4+Pj4+IGluc3RlYWQgb2YgRlVBIGZvciB6b25lZCBkZXZp
Y2UiKQo+Pj4+Pj4gIgo+Pj4+Pj4gVGhlIGJsb2NrIGxheWVyIGZvciB6b25lZCBkaXNrIGNhbiBy
ZW9yZGVyIHRoZSBGVUEnZWQgSU9zLiBMZXQncyB1c2UgZmx1c2gKPj4+Pj4+IGNvbW1hbmQgdG8g
a2VlcCB0aGUgd3JpdGUgb3JkZXIuCj4+Pj4+PiAiCj4+Pj4+Pgo+Pj4+Pj4gSXQgc2VlbXMgbXEt
ZGVhZGxpbmUgdXNlIGZpZm8gcXVldWUgYW5kIG1ha2UgcXVldWUgZGVwdGggb2Ygem9uZSBkZXZp
Y2UKPj4+Pj4+IGFzIDEgdG8gSU8gb3JkZXIsIHNvIHdoeSBGVUEnZWQgd3JpdGUgbm9kZSBJT3Mg
Y2FuIGJlIHJlb3JkZXJlZCBieSBibG9jawo+Pj4+Pj4gbGF5ZXI/Cj4+Pj4+Cj4+Pj4+IFdoaWxl
IG90aGVyIHdyaXRlcyBhcmUgYWxpZ25lZCBieSB0aGUgbXEtZGVhZGxpbmUsIHdyaXRlIHdpdGgg
RlVBIGlzIG5vdCBwYXNzZWQKPj4+Pj4gdG8gdGhlIHNjaGVkdWxlciBidXQgaGFuZGxlZCBhdCB0
aGUgYmxvY2sgbGF5ZXIuCj4+Pj4KPj4+PiBIaSBEYWVqdW4sCj4+Pj4KPj4+PiBJSVVDLCBkbyB5
b3UgbWVhbiB3cml0ZSB3LyBGVUEgbWF5IGJlIGhhbmRsZWQgZGlyZWN0bHkgaW4gYmVsb3cgcGF0
aD8KPj4+Pgo+Pj4+IC0gYmxrX21xX3N1Ym1pdF9iaW8KPj4+PiAgwqAgwqAgLSBvcF9pc19mbHVz
aCAmJiBibGtfaW5zZXJ0X2ZsdXNoCj4+Pgo+Pj4gSGkgQ2hhbywKPj4+Cj4+PiBZZXMsIEkgdGhp
bmsgdGhlIHBhdGggY2F1c2VkIGFuIHVuYWxpZ25lZCB3cml0ZSB3aGVuIHRoZSB6b25lIGxvY2sg
d2FzCj4+PiBiZWluZyBhcHBsaWVkIGJ5IG1xLWRlYWRsaW5lLgo+Pgo+PiBCdXQsIGJsa19pbnNl
cnRfZmx1c2goKSBtYXkgcmV0dXJuIGZhbHNlIGR1ZSB0byBwb2xpY3kgc2hvdWxkIGJlCj4+IFJF
UV9GU0VRX0RBVEEgb3IgUkVRX0ZTRVFfREFUQSBSRVFfRlNFUV9QT1NURkxVU0gsIHRoZW4KPj4g
YmxrX21xX2luc2VydF9yZXF1ZXN0KCkgYWZ0ZXIgYmxrX2luc2VydF9mbHVzaCgpIHdpbGwgYmUg
Y2FsbGVkPwo+Pgo+IAo+IEkgd2FzIGp1c3QgZGlzY3Vzc2luZyB0aGUgaGFuZGxpbmcgb2YgRlVB
cyBpbiBjb21taXQgYzU1MGUyNWJjYTY2LAo+IHdoaWNoIGlzIG5vdCBhbiBpc3N1ZSBpbiB0aGUg
Y3VycmVudCBjb2RlIGFzIEZVQXMgYXJlIGhhbmRsZWQgY29ycmVjdGx5LgoKWXVwLCBJIHRoaW5r
IGl0IG5lZWRzIHRvIGJlIHJldmVydGVkLiA6KQoKVGhhbmtzLAoKPiAKPiBUaGFua3MsCj4gCj4g
Cj4+IFRoYW5rcywKPj4KPj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4gVGhh
bmtzLAo+Pj4+PiBEYWVqdW4KPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pgo+Pj4+
Pj4gT24gMjAyNC82LzE0IDg6NDgsIFdlbmppZSBDaGVuZyB3cm90ZToKPj4+Pj4+PiBUaGlzIHJl
dmVydHMgY29tbWl0IGM1NTBlMjViY2E2NjBlZDI1NTRjYmI0OGQzMmI4MmQwYmI5OGU0YjEuCj4+
Pj4+Pj4KPj4+Pj4+PiBDb21taXQgYzU1MGUyNWJjYTY2MGVkMjU1NGNiYjQ4ZDMyYjgyZDBiYjk4
ZTRiMSAoImYyZnM6IHVzZSBmbHVzaAo+Pj4+Pj4+IGNvbW1hbmQgaW5zdGVhZCBvZiBGVUEgZm9y
IHpvbmVkIGRldmljZSIpIHVzZWQgYWRkaXRpb25hbCBmbHVzaAo+Pj4+Pj4+IGNvbW1hbmQgdG8g
a2VlcCB3cml0ZSBvcmRlci4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpbmNlIENvbW1pdCBkZDI5MWQ3N2Nj
OTBlYjZhODZlOTg2MGJhOGU2ZTM4ZWViZDU3ZDEyICgiYmxvY2s6Cj4+Pj4+Pj4gSW50cm9kdWNl
IHpvbmUgd3JpdGUgcGx1Z2dpbmciKSBoYXMgZW5hYmxlZCB0aGUgYmxvY2sgbGF5ZXIgdG8KPj4+
Pj4+PiBoYW5kbGUgdGhpcyBvcmRlciBpc3N1ZSwgdGhlcmUgaXMgbm8gbmVlZCB0byB1c2UgZmx1
c2ggY29tbWFuZC4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlbmppZSBDaGVuZyA8
Y3dqaHVzdEBnbWFpbC5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gIMKgIMKgIMKgIGZzL2YyZnMv
ZmlsZS5jIDMgKy0tCj4+Pj4+Pj4gIMKgIMKgIMKgIGZzL2YyZnMvbm9kZS5jIDIgKy0KPj4+Pj4+
PiAgwqAgwqAgwqAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZz
L2ZpbGUuYwo+Pj4+Pj4+IGluZGV4IGVhZTJlNzkwODA3Mi4uZjA4ZTYyMDhlMTgzIDEwMDY0NAo+
Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMK
Pj4+Pj4+PiBAQCAtMzcyLDggKzM3Miw3IEBAIHN0YXRpYyBpbnQgZjJmc19kb19zeW5jX2ZpbGUo
c3RydWN0IGZpbGUgKmZpbGUsIGxvZmZfdCBzdGFydCwgbG9mZl90IGVuZCwKPj4+Pj4+PiAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBmMmZzX3JlbW92ZV9pbm9fZW50cnkoc2JpLCBpbm8sIEFQUEVO
RF9JTk8pOwo+Pj4+Pj4+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsZWFyX2lub2RlX2ZsYWco
aW5vZGUsIEZJX0FQUEVORF9XUklURSk7Cj4+Pj4+Pj4gIMKgIMKgIMKgIGZsdXNoX291dDoKPj4+
Pj4+PiAtIMKgIMKgIMKgIMKgaWYgKCghYXRvbWljICYmIEYyRlNfT1BUSU9OKHNiaSkuZnN5bmNf
bW9kZSAhPSBGU1lOQ19NT0RFX05PQkFSUklFUikKPj4+Pj4+PiAtIMKgIMKgIMKgIMKgwqAgwqAg
KGF0b21pYyAmJiAhdGVzdF9vcHQoc2JpLCBOT0JBUlJJRVIpICYmIGYyZnNfc2JfaGFzX2Jsa3pv
bmVkKHNiaSkpKQo+Pj4+Pj4+ICsgwqAgwqAgwqAgwqBpZiAoIWF0b21pYyAmJiBGMkZTX09QVElP
TihzYmkpLmZzeW5jX21vZGUgIT0gRlNZTkNfTU9ERV9OT0JBUlJJRVIpCj4+Pj4+Pj4gIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gZjJmc19pc3N1ZV9mbHVzaChzYmks
IGlub2RlLT5pX2lubyk7Cj4+Pj4+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFyZXQp
IHsKPj4+Pj4+PiAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmMmZzX3JlbW92
ZV9pbm9fZW50cnkoc2JpLCBpbm8sIFVQREFURV9JTk8pOwo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCj4+Pj4+Pj4gaW5kZXggMTQ0ZjlmOTY2Njkw
Li5jNDVkMzQxZGNmNmUgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPj4+Pj4+
PiArKysgYi9mcy9mMmZzL25vZGUuYwo+Pj4+Pj4+IEBAIC0xNjMxLDcgKzE2MzEsNyBAQCBzdGF0
aWMgaW50IF9fd3JpdGVfbm9kZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdlLCBib29sIGF0b21pYywg
Ym9vbCAqc3VibWl0dGVkLAo+Pj4+Pj4+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdvdG8gcmVkaXJ0eV9vdXQ7Cj4+Pj4+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfQo+
Pj4+Pj4+ICAgCj4+Pj4+Pj4gLSDCoCDCoCDCoCDCoGlmIChhdG9taWMgJiYgIXRlc3Rfb3B0KHNi
aSwgTk9CQVJSSUVSKSAmJiAhZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPj4+Pj4+PiArIMKg
IMKgIMKgIMKgaWYgKGF0b21pYyAmJiAhdGVzdF9vcHQoc2JpLCBOT0JBUlJJRVIpKQo+Pj4+Pj4+
ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZpby5vcF9mbGFncyA9IFJFUV9Q
UkVGTFVTSCBSRVFfRlVBOwo+Pj4+Pj4+ICAgCj4+Pj4+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgLyogc2hvdWxkIGFkZCB0byBnbG9iYWwgbGlzdCBiZWZvcmUgY2xlYXJpbmcgUEFHRUNBQ0hF
IHN0YXR1cyAqLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK

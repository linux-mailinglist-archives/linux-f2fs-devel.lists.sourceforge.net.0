Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F948FE450
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2024 12:31:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFAP6-0003HI-CY;
	Thu, 06 Jun 2024 10:31:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sFAP4-0003H8-JJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 10:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=saa0h8VE2D/FSqkettZLPM/p0rWRBR1l8C60zF57EwM=; b=Wirnnwy/Qt+4nNiJpcKe464L6a
 c9U5gCIbMWFf24eGaK5T3kxOWY3RqEfyFfMFjKGf/4q0HZsmlcI36lQvl0dwllMk85Vdu0W/pO6TD
 AUwlX+l8BdgO6Pj3i76wPL5z7ufUNZYvfMu2h4PTWjKC3rmsylB5YtnICupybStQwcHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=saa0h8VE2D/FSqkettZLPM/p0rWRBR1l8C60zF57EwM=; b=hgaCpH6zYp4qN0AOT+vUVPH6Os
 JLapR5gzlXuzJ8a/JOwsYBe9/lon7rH94U2yEBcuXY/Vd9Nxj4ZGzbdV5bffuIMaYyqMPbkPm4VrW
 Kj+e8zsgSc7YxObFeE0LIum/wok9pAjiPuvurUX82iJaO5sd0Bv8XTee82qXihtQcd1g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFAP5-0007bJ-Hb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 10:31:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 688AC61D0C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Jun 2024 10:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF89C4AF0D;
 Thu,  6 Jun 2024 10:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717669885;
 bh=GYdrlfDE3VBqGRrQYoVOCv+j+7jIOcaApwD/kEhgQ8k=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=mJaitnj1dJzmCbP8CRWNLe0a5BbDsL1yNy9y/B0XEpO00si0z5fpIs7E2PEuI2+nW
 azhjXmxl+pwfjhs3tsvHg4gAtjqIhz5RkaRhiUQLAuy6Dn23+Cm+3beHEB3B6qn/j5
 pb6QDwZpezaugwf5PMnDR7b+oIzKIn8bbwFWuhIhgHUvISHzweGzVp8JqItS6l4xYx
 F6U8Gu7jvj35MX2yy3Pwc3Dl6P89ueNK/pZayCBaLhjrlHb/56ZioqyfJXQLXuXS1Y
 2owRg4/+mMe6dQD1JzbDof+eMTtO72FiyhSZAE7KI561GO2fmNAzLOlSuBWVrEY8QB
 C0Ilnv+Cy2nJQ==
Message-ID: <4ac4f5cf-7748-4ee4-8d68-8842d8bf1753@kernel.org>
Date: Thu, 6 Jun 2024 18:31:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240510023906.281700-1-chao@kernel.org>
 <ZkOMwKAcKmEPQ4Xz@google.com>
 <fc0d8b1f-0c54-4447-8ceb-3722645f71c2@kernel.org>
 <ZkQ9Uo5713Xpr2n7@google.com>
 <efae597c-d334-498b-9050-1a21bf40e21d@kernel.org>
Content-Language: en-US
In-Reply-To: <efae597c-d334-498b-9050-1a21bf40e21d@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/15 14:38, Chao Yu wrote: > On 2024/5/15 12:42,
 Jaegeuk
 Kim wrote: >> On 05/15, Chao Yu wrote: >>> On 2024/5/15 0:09, Jaegeuk Kim
 wrote: >>>> On 05/10, Chao Yu wrote: >>>>> If lfs mode is on, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sFAP5-0007bJ-Hb
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid racing in between read
 and OPU dio write
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC81LzE1IDE0OjM4LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjQvNS8xNSAxMjo0Miwg
SmFlZ2V1ayBLaW0gd3JvdGU6Cj4+IE9uIDA1LzE1LCBDaGFvIFl1IHdyb3RlOgo+Pj4gT24gMjAy
NC81LzE1IDA6MDksIEphZWdldWsgS2ltIHdyb3RlOgo+Pj4+IE9uIDA1LzEwLCBDaGFvIFl1IHdy
b3RlOgo+Pj4+PiBJZiBsZnMgbW9kZSBpcyBvbiwgYnVmZmVyZWQgcmVhZCBtYXkgcmFjZSB3LyBP
UFUgZGlvIHdyaXRlIGFzIGJlbG93LAo+Pj4+PiBpdCBtYXkgY2F1c2UgYnVmZmVyZWQgcmVhZCBo
aXRzIHVud3JpdHRlbiBkYXRhIHVuZXhwZWN0bHksIGFuZCBmb3IKPj4+Pj4gZGlvIHJlYWQsIHRo
ZSByYWNlIGNvbmRpdGlvbiBleGlzdHMgYXMgd2VsbC4KPj4+Pj4KPj4+Pj4gVGhyZWFkIEHCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVGhyZWFkIEIKPj4+Pj4gLSBm
MmZzX2ZpbGVfd3JpdGVfaXRlcgo+Pj4+PiDCoMKgIC0gZjJmc19kaW9fd3JpdGVfaXRlcgo+Pj4+
PiDCoMKgwqAgLSBfX2lvbWFwX2Rpb19ydwo+Pj4+PiDCoMKgwqDCoCAtIGYyZnNfaW9tYXBfYmVn
aW4KPj4+Pj4gwqDCoMKgwqDCoCAtIGYyZnNfbWFwX2Jsb2Nrcwo+Pj4+PiDCoMKgwqDCoMKgwqAg
LSBfX2FsbG9jYXRlX2RhdGFfYmxvY2sKPj4+Pj4gwqDCoMKgwqDCoMKgwqAgLSBhbGxvY2F0ZWQg
YmxrYWRkciAjeAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIC0gaW9tYXBfZGlvX3N1Ym1pdF9iaW8K
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBmMmZzX2ZpbGVfcmVhZF9pdGVyCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmaWxlbWFw
X3JlYWQKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc19yZWFkX2RhdGFfZm9saW8KPj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBmMmZzX21wYWdlX3JlYWRwYWdlcwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc19t
YXBfYmxvY2tzCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IGdldCBibGthZGRyICN4Cj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBmMmZzX3N1Ym1pdF9yZWFkX2Jpbwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJUlEKPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBmMmZzX3JlYWRfZW5kX2lvCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiByZWFkIElPIG9uIGJsa2Fk
ZHIgI3ggY29tcGxldGUKPj4+Pj4gSVJRCj4+Pj4+IC0gaW9tYXBfZGlvX2Jpb19lbmRfaW8KPj4+
Pj4gwqDCoCA6IGRpcmVjdCB3cml0ZSBJTyBvbiBibGthZGRyICN4IGNvbXBsZXRlCj4+Pj4+Cj4+
Pj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBwZXItaW5vZGUgaV9vcHVfcndzZW0gbG9j
ayB0byBhdm9pZAo+Pj4+PiBzdWNoIHJhY2UgY29uZGl0aW9uLgo+Pj4+Cj4+Pj4gV2Fzbid0IHRo
aXMgc3VwcG9zZWQgdG8gYmUgbWFuYWdlZCBieSB1c2VyLWxhbmQ/Cj4+Pgo+Pj4gQWN0dWFsbHks
IHRoZSB0ZXN0IGNhc2UgaXM6Cj4+Pgo+Pj4gMS4gbW91bnQgdy8gbGZzIG1vZGUKPj4+IDIuIHRv
dWNoIGZpbGU7Cj4+PiAzLiBpbml0aWFsaXplIGZpbGUgdy8gNGsgemVyb2VkIGRhdGE7IGZzeW5j
Owo+Pj4gNC4gY29udGludWUgdHJpZ2dlcmluZyBkaW8gd3JpdGUgNGsgemVyb2VkIGRhdGEgdG8g
ZmlsZTsKPj4+IDUuIGFuZCBtZWFud2hpbGUsIGNvbnRpbnVlIHRyaWdnZXJpbmcgYnVmL2RpbyA0
ayByZWFkIGluIGZpbGUsCj4+PiB1c2UgbWQ1c3VtIHRvIHZlcmlmeSB0aGUgNGsgZGF0YTsKPj4+
Cj4+PiBJdCBleHBlY3RzIGRhdGEgaXMgYWxsIHplcm8sIGhvd2V2ZXIgaXQgdHVybmVkIG91dCBp
dCdzIG5vdC4KPj4KPj4gQ2FuIHdlIGNoZWNrIG91dHN0YW5kaW5nIHdyaXRlIGJpb3MgaW5zdGVh
ZCBvZiBhYnVzaW5nIGxvY2tzPwoKSmFlZ2V1aywgc2VlbXMgaXQgY2FuIHNvbHZlIHBhcnRpYWwg
cmFjZSBjYXNlcywgbm90IGFsbCBvZiB0aGVtLgoKRG8geW91IHN1Z2dlc3QgdG8gdXNlIHRoaXMg
Y29tcHJvbWlzZWQgc29sdXRpb24/CgpUaGFua3MsCgo+IAo+IEkgZGlkbid0IGZpZ3VyZSBvdXQg
YSB3YXkgdG8gc29sdmUgdGhpcyB3L28gbG9jaywgZHVlIHRvOgo+IC0gd3JpdGUgYmlvcyBjYW4g
YmUgaXNzdWVkIGFmdGVyIG91dHN0YW5kaW5nIHdyaXRlIGJpb3MgY2hlY2sgY29uZGl0aW9uLAo+
IHJlc3VsdCBpbiB0aGUgcmFjZS4KPiAtIG9uY2UgcmVhZCgpIGRldGVjdHMgdGhhdCB0aGVyZSBh
cmUgb3V0c3RhbmRpbmcgd3JpdGUgYmlvcywgd2UgbmVlZCB0bwo+IGRlbGF5IHJlYWQgZmxvdyBy
YXRoZXIgdGhhbiBmYWlsIGl0LCByaWdodD8gSXQgbG9va3MgdXNpbmcgYSBsb2NrIGlzIG1vcmUK
PiBwcm9wZXIgaGVyZT8KPiAKPiBBbnkgc3VnZ2VzdGlvbj8KPiAKPiBUaGFua3MsCj4gCj4+Cj4+
Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+PiBGaXhlczogZjg0N2M2OTljZmYzICgi
ZjJmczogYWxsb3cgb3V0LXBsYWNlLXVwZGF0ZSBmb3IgZGlyZWN0IElPIGluIExGUyBtb2RlIikK
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+Pj4+PiAtLS0K
Pj4+Pj4gdjI6Cj4+Pj4+IC0gZml4IHRvIGNvdmVyIGRpbyByZWFkIHBhdGggdy8gaV9vcHVfcndz
ZW0gYXMgd2VsbC4KPj4+Pj4gwqDCoCBmcy9mMmZzL2YyZnMuaMKgIHzCoCAxICsKPj4+Pj4gwqDC
oCBmcy9mMmZzL2ZpbGUuY8KgIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+Pj4+
PiDCoMKgIGZzL2YyZnMvc3VwZXIuYyB8wqAgMSArCj4+Pj4+IMKgwqAgMyBmaWxlcyBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4+PiBpbmRleCAzMDA1OGUxNmE1
ZDAuLjkxY2Y0YjNkNmJjNiAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4g
KysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gQEAgLTg0Nyw2ICs4NDcsNyBAQCBzdHJ1Y3QgZjJm
c19pbm9kZV9pbmZvIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqAgLyogYXZvaWQgcmFjaW5nIGJldHdl
ZW4gZm9yZWdyb3VuZCBvcCBhbmQgZ2MgKi8KPj4+Pj4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IGYy
ZnNfcndzZW0gaV9nY19yd3NlbVsyXTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IGYyZnNf
cndzZW0gaV94YXR0cl9zZW07IC8qIGF2b2lkIHJhY2luZyBiZXR3ZWVuIHJlYWRpbmcgYW5kIGNo
YW5naW5nIEVBcyAqLwo+Pj4+PiArwqDCoMKgwqAgc3RydWN0IGYyZnNfcndzZW0gaV9vcHVfcndz
ZW07wqAgLyogYXZvaWQgcmFjaW5nIGJldHdlZW4gYnVmIHJlYWQgYW5kIG9wdSBkaW8gd3JpdGUg
Ki8KPj4+Pj4KPj4+Pj4gwqDCoMKgwqDCoMKgwqAgaW50IGlfZXh0cmFfaXNpemU7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogc2l6ZSBvZiBleHRyYSBzcGFjZSBsb2NhdGVkIGluIGlfYWRk
ciAqLwo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBrcHJvamlkX3QgaV9wcm9qaWQ7wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC8qIGlkIGZvciBwcm9qZWN0IHF1b3RhICovCj4+Pj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+IGluZGV4IDcyY2UxYTUyMmZi
Mi4uNGVjMjYwYWYzMjFmIDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+Pj4+PiAr
KysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+PiBAQCAtNDQ0NSw2ICs0NDQ1LDcgQEAgc3RhdGljIHNz
aXplX3QgZjJmc19kaW9fcmVhZF9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9p
dGVyICp0bykKPj4+Pj4gwqDCoMKgwqDCoMKgwqAgY29uc3QgbG9mZl90IHBvcyA9IGlvY2ItPmtp
X3BvczsKPj4+Pj4gwqDCoMKgwqDCoMKgwqAgY29uc3Qgc2l6ZV90IGNvdW50ID0gaW92X2l0ZXJf
Y291bnQodG8pOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW9tYXBfZGlvICpkaW87Cj4+
Pj4+ICvCoMKgwqDCoCBib29sIGRvX29wdSA9IGYyZnNfbGZzX21vZGUoc2JpKTsKPj4+Pj4gwqDC
oMKgwqDCoMKgwqAgc3NpemVfdCByZXQ7Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGlmIChj
b3VudCA9PSAwKQo+Pj4+PiBAQCAtNDQ1Nyw4ICs0NDU4LDE0IEBAIHN0YXRpYyBzc2l6ZV90IGYy
ZnNfZGlvX3JlYWRfaXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqdG8p
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
ID0gLUVBR0FJTjsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIG91dDsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZG9fb3B1ICYmICFmMmZzX2Rvd25f
cmVhZF90cnlsb2NrKCZmaS0+aV9vcHVfcndzZW0pKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfdXBfcmVhZCgmZmktPmlfZ2NfcndzZW1bUkVB
RF0pOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQg
PSAtRUFHQUlOOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBnb3RvIG91dDsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqDC
oMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBm
MmZzX2Rvd25fcmVhZCgmZmktPmlfZ2NfcndzZW1bUkVBRF0pOwo+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGYyZnNfZG93bl9yZWFkKCZmaS0+aV9vcHVfcndzZW0pOwo+Pj4+PiDCoMKg
wqDCoMKgwqDCoCB9Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIC8qCj4+Pj4+IEBAIC00NDc3
LDYgKzQ0ODQsNyBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX2Rpb19yZWFkX2l0ZXIoc3RydWN0IGtp
b2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKnRvKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0ID0gaW9tYXBfZGlvX2NvbXBsZXRlKGRpbyk7Cj4+Pj4+IMKgwqDCoMKg
wqDCoMKgIH0KPj4+Pj4KPj4+Pj4gK8KgwqDCoMKgIGYyZnNfdXBfcmVhZCgmZmktPmlfb3B1X3J3
c2VtKTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqAgZjJmc191cF9yZWFkKCZmaS0+aV9nY19yd3NlbVtS
RUFEXSk7Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGZpbGVfYWNjZXNzZWQoZmlsZSk7Cj4+
Pj4+IEBAIC00NTIzLDcgKzQ1MzEsMTMgQEAgc3RhdGljIHNzaXplX3QgZjJmc19maWxlX3JlYWRf
aXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqdG8pCj4+Pj4+IMKgwqDC
oMKgwqDCoMKgIGlmIChmMmZzX3Nob3VsZF91c2VfZGlvKGlub2RlLCBpb2NiLCB0bykpIHsKPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGYyZnNfZGlvX3JlYWRfaXRl
cihpb2NiLCB0byk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBkb19vcHUgPSBmMmZzX2xmc19tb2RlKEYyRlNfSV9TQihp
bm9kZSkpOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGRvX29w
dSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19k
b3duX3JlYWQoJkYyRlNfSShpbm9kZSktPmlfb3B1X3J3c2VtKTsKPj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGZpbGVtYXBfcmVhZChpb2NiLCB0bywgMCk7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGRvX29wdSkKPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc191cF9yZWFkKCZGMkZTX0koaW5vZGUp
LT5pX29wdV9yd3NlbSk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
cmV0ID4gMCkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmMmZzX3VwZGF0ZV9pb3N0YXQoRjJGU19JX1NCKGlub2RlKSwgaW5vZGUsCj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVBQX0JVRkZFUkVEX1JFQURfSU8s
IHJldCk7Cj4+Pj4+IEBAIC00NzQ4LDE0ICs0NzYyLDIyIEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNf
ZGlvX3dyaXRlX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKmZyb20s
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
ID0gLUVBR0FJTjsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIG91dDsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZG9fb3B1ICYmICFmMmZzX2Rvd25f
d3JpdGVfdHJ5bG9jaygmZmktPmlfb3B1X3J3c2VtKSkgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3VwX3JlYWQoJmZpLT5pX2djX3J3c2VtW1JF
QURdKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJm
c191cF9yZWFkKCZmaS0+aV9nY19yd3NlbVtXUklURV0pOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRUFHQUlOOwo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2NvbnZlcnRfaW5saW5lX2lu
b2RlKGlub2RlKTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQp
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290
byBvdXQ7Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2Rv
d25fcmVhZCgmZmktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoZG9fb3B1KQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChk
b19vcHUpIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmMmZzX2Rvd25fcmVhZCgmZmktPmlfZ2NfcndzZW1bUkVBRF0pOwo+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2Rvd25fd3JpdGUoJmZpLT5p
X29wdV9yd3NlbSk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+PiDCoMKg
wqDCoMKgwqDCoCB9Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIC8qCj4+Pj4+IEBAIC00Nzc5
LDggKzQ4MDEsMTAgQEAgc3RhdGljIHNzaXplX3QgZjJmc19kaW9fd3JpdGVfaXRlcihzdHJ1Y3Qg
a2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldCA9IGlvbWFwX2Rpb19jb21wbGV0ZShkaW8pOwo+Pj4+PiDCoMKg
wqDCoMKgwqDCoCB9Cj4+Pj4+Cj4+Pj4+IC3CoMKgwqDCoCBpZiAoZG9fb3B1KQo+Pj4+PiArwqDC
oMKgwqAgaWYgKGRvX29wdSkgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNf
dXBfd3JpdGUoJmZpLT5pX29wdV9yd3NlbSk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBmMmZzX3VwX3JlYWQoJmZpLT5pX2djX3J3c2VtW1JFQURdKTsKPj4+Pj4gK8KgwqDC
oMKgIH0KPj4+Pj4gwqDCoMKgwqDCoMKgwqAgZjJmc191cF9yZWFkKCZmaS0+aV9nY19yd3NlbVtX
UklURV0pOwo+Pj4+Pgo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkKPj4+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4+PiBpbmRleCBk
YWYyYzRkYmUxNTAuLmI0ZWQzYjA5NDM2NiAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9zdXBl
ci5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4+PiBAQCAtMTQyOCw2ICsxNDI4LDcg
QEAgc3RhdGljIHN0cnVjdCBpbm9kZSAqZjJmc19hbGxvY19pbm9kZShzdHJ1Y3Qgc3VwZXJfYmxv
Y2sgKnNiKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpbml0X2YyZnNfcndzZW0oJmZpLT5pX2djX3J3
c2VtW1JFQURdKTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqAgaW5pdF9mMmZzX3J3c2VtKCZmaS0+aV9n
Y19yd3NlbVtXUklURV0pOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpbml0X2YyZnNfcndzZW0oJmZp
LT5pX3hhdHRyX3NlbSk7Cj4+Pj4+ICvCoMKgwqDCoCBpbml0X2YyZnNfcndzZW0oJmZpLT5pX29w
dV9yd3NlbSk7Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIC8qIFdpbGwgYmUgdXNlZCBieSBk
aXJlY3Rvcnkgb25seSAqLwo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBmaS0+aV9kaXJfbGV2ZWwgPSBG
MkZTX1NCKHNiKS0+ZGlyX2xldmVsOwo+Pj4+PiAtLSAKPj4+Pj4gMi40MC4xCj4gCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK

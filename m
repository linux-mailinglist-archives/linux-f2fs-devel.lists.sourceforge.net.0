Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5A4C196B5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 10:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z46bujwrEaljIVl8NiTt+8CSaRmcCf6cwx6kRiUdZSc=; b=VQijdU8/0covAhBEvIZixSIhpt
	dEiaIVRDxeoXXRzGNZQYkkDHION+Vb0nlMHypXuYt+hHHRkS7FEvDs86yqjhJH2ASX7FxTeYQNByA
	PluonZfAtfDyxL9Epm76gZW7N1zF+LyCsTe6Jh+CcB0pYVilXJJWyS3RrqIcsaABnRJw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vE2gR-0000U9-5N;
	Wed, 29 Oct 2025 09:41:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vE2gO-0000Tz-1w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 09:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bjs9DzVdCi47Lx4Sz8NHk1JDHK2lYWvoZrmNQSHwBqY=; b=VqoKp/RynkxxdUOxEfotGuBdEt
 k12L4uLAsyCaK5qi2kad5v0LbcYfSqm2XnJT4a4M1ovcyXM0EYq8uqBvQwR0gtj7uQxJGO1yqefh5
 Hc3h6yLPxdWytbgPj+GtZElt22NJvzNSQXDEiMuviGA1ctrPRkHsrvKb1LnuZ0ZMzy/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bjs9DzVdCi47Lx4Sz8NHk1JDHK2lYWvoZrmNQSHwBqY=; b=LJcnaX30+wi+kFopN+mXfOOsJa
 eOCMJkYr1XMWUSMbKbKXKPbohfoRtXhdeyEMXzmV7P06F3VI3hMD3vqdGhrK3v9PeTO8ncHDw+BtR
 yZmxAfm5tjkSI+Ms4FErsrjc4JTtM27wautCVAbCfC2FWpaMbOs4PSD6D8pdk41l7Ejs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vE2gN-0000Sv-HC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 09:41:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B57343815;
 Wed, 29 Oct 2025 09:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569E1C4CEF7;
 Wed, 29 Oct 2025 09:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761730886;
 bh=USrNmdE74cIwX8ZXj65xooCod66cGcvkOUom+iY60+A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Yq8P9rOTFDHjPDEPj1psPbSTT3Ba5xQSP0kQLGWobfXC8QIbi3Z3U7XIVF2ufHdzY
 5OVRY3p6fxDxhmiw/bE3nPlLjxNjK/p6q2oCYRY7oGgvU/nWPDT08IdwQkSC3UIM+o
 MiLBnsU2qEpnyFICMjXHbASxJUUg7I4WaLqLIwm3B+73fklRhQeK60vJy0SJ9EA0Wm
 R1rJiQLLGJmAqw/3HUBsFNzWvPxYlO7lUg31kT+B8/hM5jFbiIKajs8NsBhdp5gAGE
 sJ9GZLpTsRySIcBW15XJGHAWoPHLxstCwmGnvoqDmcNJGlTvIVIOlK+nNvOJi99vPg
 /lejVudM8N0hQ==
Message-ID: <45823945-2ea3-4ec6-9b07-686814f38567@kernel.org>
Date: Wed, 29 Oct 2025 17:41:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>, jaegeuk@kernel.org
References: <20251029063105.989253-1-chao@kernel.org>
 <f9cf5992-0357-4702-be73-881c9997929d@gmail.com>
Content-Language: en-US
In-Reply-To: <f9cf5992-0357-4702-be73-881c9997929d@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/29/25 16:09, Yongpeng Yang wrote: > On 10/29/25 14:31, 
 Chao Yu via Linux-f2fs-devel wrote: >> It recommends to use i_size_{read,
 write}()
 to access and update i_size, >> otherwise, we may get wro [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vE2gN-0000Sv-HC
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to access i_size w/ i_size_read()
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMjkvMjUgMTY6MDksIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gT24gMTAvMjkvMjUgMTQ6
MzEsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IEl0IHJlY29tbWVuZHMg
dG8gdXNlIGlfc2l6ZV97cmVhZCx3cml0ZX0oKSB0byBhY2Nlc3MgYW5kIHVwZGF0ZSBpX3NpemUs
Cj4+IG90aGVyd2lzZSwgd2UgbWF5IGdldCB3cm9uZyB0ZWFyaW5nIHZhbHVlIGR1ZSB0byBoaWdo
IDMyLWJpdHMgdmFsdWUKPj4gYW5kIGxvdyAzMi1iaXRzIHZhbHVlIG9mIGlfc2l6ZSBmaWVsZCBh
cmUgbm90IHVwZGF0ZWQgYXRvbWljYWxseSBpbgo+PiAzMi1iaXRzIGFyY2hpY3R1cmUgbWFjaGlu
ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0K
Pj4gwqAgaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5oIHwgOCArKysrLS0tLQo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5oIGIvaW5jbHVkZS90cmFjZS9ldmVudHMv
ZjJmcy5oCj4+IGluZGV4IGVkYmJkODY5MDc4Zi4uZTFmYWU3OGQ2NGE1IDEwMDY0NAo+PiAtLS0g
YS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgKPj4gKysrIGIvaW5jbHVkZS90cmFjZS9ldmVu
dHMvZjJmcy5oCj4+IEBAIC0yMDQsNyArMjA0LDcgQEAgREVDTEFSRV9FVkVOVF9DTEFTUyhmMmZz
X19pbm9kZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPnBpbm/CoMKgwqAgPSBGMkZT
X0koaW5vZGUpLT5pX3Bpbm87Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5tb2RlwqDC
oMKgID0gaW5vZGUtPmlfbW9kZTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPm5saW5r
wqDCoMKgID0gaW5vZGUtPmlfbmxpbms7Cj4+IC3CoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5zaXpl
wqDCoMKgID0gaW5vZGUtPmlfc2l6ZTsKPj4gK8KgwqDCoMKgwqDCoMKgIF9fZW50cnktPnNpemXC
oMKgwqAgPSBpX3NpemVfcmVhZChpbm9kZSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5
LT5ibG9ja3PCoMKgwqAgPSBpbm9kZS0+aV9ibG9ja3M7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBf
X2VudHJ5LT5hZHZpc2XCoMKgwqAgPSBGMkZTX0koaW5vZGUpLT5pX2FkdmlzZTsKPj4gwqDCoMKg
wqDCoCApLAo+PiBAQCAtMzUzLDcgKzM1Myw3IEBAIFRSQUNFX0VWRU5UKGYyZnNfdW5saW5rX2Vu
dGVyLAo+PiDCoMKgwqDCoMKgIFRQX2Zhc3RfYXNzaWduKAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
X19lbnRyeS0+ZGV2wqDCoMKgID0gZGlyLT5pX3NiLT5zX2RldjsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIF9fZW50cnktPmlub8KgwqDCoCA9IGRpci0+aV9pbm87Cj4+IC3CoMKgwqDCoMKgwqDCoCBf
X2VudHJ5LT5zaXplwqDCoMKgID0gZGlyLT5pX3NpemU7Cj4+ICvCoMKgwqDCoMKgwqDCoCBfX2Vu
dHJ5LT5zaXplwqDCoMKgID0gaV9zaXplX3JlYWQoZGlyKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IF9fZW50cnktPmJsb2Nrc8KgwqDCoCA9IGRpci0+aV9ibG9ja3M7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBfX2Fzc2lnbl9zdHIobmFtZSk7Cj4+IMKgwqDCoMKgwqAgKSwKPj4gQEAgLTQzMyw3ICs0
MzMsNyBAQCBERUNMQVJFX0VWRU5UX0NMQVNTKGYyZnNfX3RydW5jYXRlX29wLAo+PiDCoMKgwqDC
oMKgIFRQX2Zhc3RfYXNzaWduKAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+ZGV2wqDC
oMKgID0gaW5vZGUtPmlfc2ItPnNfZGV2Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+
aW5vwqDCoMKgID0gaW5vZGUtPmlfaW5vOwo+PiAtwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+c2l6
ZcKgwqDCoCA9IGlub2RlLT5pX3NpemU7Cj4+ICvCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5zaXpl
wqDCoMKgID0gaV9zaXplX3JlYWQoaW5vZGUpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRy
eS0+YmxvY2tzwqDCoMKgID0gaW5vZGUtPmlfYmxvY2tzOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
X19lbnRyeS0+ZnJvbcKgwqDCoCA9IGZyb207Cj4+IMKgwqDCoMKgwqAgKSwKPj4gQEAgLTEwMDYs
NyArMTAwNiw3IEBAIFRSQUNFX0VWRU5UKGYyZnNfZmFsbG9jYXRlLAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgX19lbnRyeS0+bW9kZcKgwqDCoCA9IG1vZGU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBf
X2VudHJ5LT5vZmZzZXTCoMKgwqAgPSBvZmZzZXQ7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBfX2Vu
dHJ5LT5sZW7CoMKgwqAgPSBsZW47Cj4+IC3CoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5zaXplwqDC
oMKgID0gaW5vZGUtPmlfc2l6ZTsKPj4gK8KgwqDCoMKgwqDCoMKgIF9fZW50cnktPnNpemXCoMKg
wqAgPSBpX3NpemVfcmVhZChpbm9kZSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5i
bG9ja3MgPSBpbm9kZS0+aV9ibG9ja3M7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5y
ZXTCoMKgwqAgPSByZXQ7Cj4+IMKgwqDCoMKgwqAgKSwKPiAKPiBpbm9kZS0+aV9zaXplIHVzYWdl
IGluIGZzL2YyZnMvIGFsc28gbmVlZHMgdG8gYmUgdXBkYXRlZC4gRm9yIGV4YW1wbGUgaW4gZjJm
c19uZWVkX3Zlcml0eSgpLCB3aGljaCBtYXkgbm90IHByb3RlY3RlZCBieSBpbm9kZV9sb2NrLgoK
QWNjZXNzaW5nIGlfc2l6ZSBkaXJlY3RseSBpbiBmMmZzX25lZWRfdmVyaXR5KCkgc2hvdWxkIGJl
IGZpbmU/IEJlY2F1c2UgZnN2ZXJpdHkKYWN0aXZlZCBpbm9kZSBzaG91bGQgYmUgcmVhZG9ubHku
CgpEbyB5b3Ugc2VlIGFueSBvdGhlciBjYXNlcyB3aGljaCBhcmUgbm90IGNvdmVyZWQgYnkgaW5v
ZGVfbG9jaygpPwoKVGhhbmtzLAoKPiAKPiBZb25ncGVuZywKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

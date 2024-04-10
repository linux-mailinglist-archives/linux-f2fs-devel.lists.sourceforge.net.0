Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCAD89E7C1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Apr 2024 03:25:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruMiT-0005gB-R1;
	Wed, 10 Apr 2024 01:25:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ruMiR-0005g0-Fe
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 01:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XdG9x/8zrScWi88kW4cVJXRZGGsWZEJjWwA7wj7h8/U=; b=lkCE+DuoBpqIZtxPq/8Tt3ouR6
 aSpXi5GUrkyW8i+6s5mctCPgMBQTs1WL7OptCGMTSmmd7BUsAeYwVH9I+l+JagqZwYKpWxQOq8FzU
 LVA7GXOB5GAAOmy0nOAQTDG727M81urVLnmcDyQrnjTqVsk3iKrjx5RvU5/+V0MoUKnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XdG9x/8zrScWi88kW4cVJXRZGGsWZEJjWwA7wj7h8/U=; b=gTZXgUbGCykf6LdNdVRhu1wDzE
 xuqJfZpHRT+E+/nJ9f9CswM3zHffuMvEIyEIzuqIMXoF8+WxNtZ/6wjBkG3/lsi5P1l/CjCcw0jjr
 UHWHAk+d5PUXe7loNPlFWF7reYv0dy3YJEC7GJFPJma7NeepjFEZ9qH0hv5vV++j3Bks=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruMiC-00083y-AC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 01:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 53A22CE22A0;
 Wed, 10 Apr 2024 01:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEF1C433C7;
 Wed, 10 Apr 2024 01:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712712303;
 bh=Gx9bCHrk1d77GFAb42nNEx6SxHXDuHF529fcfh61eHU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DTfyx2frpgj15Wx6eJlg+u5fV/fmpIM4AfEo+DxtWGjhn/Cmt1p05Z5d7JEmvob4u
 xySbZvEzzSJxd2r7RSDkZqr/UyK9ATc6nZZYTN08boj7i1DyMEyyNCOg2ggc31R4OX
 sUPivJD17j0XyliKhbyXB4tV6gLcHogm1pEBhgKo1TbDIYEuoa/IXlbWRDn2SWCB5X
 HobqGPjiUHixyzPY2GFVCh45yHOcnhOCnoZDXL7srypRZIpu7Yw6yCZuEMHatB+6ra
 1f2HT2dlRBInnMRkCLnAYLhZWM+UAp6vfx4ML+KmQSj6Zm4UMdUapyzmeUQJZ9n5SD
 Le5G4IC2HgEBA==
Message-ID: <33644d72-e32f-40bf-9d81-b915b509bde9@kernel.org>
Date: Wed, 10 Apr 2024 09:24:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240404195254.556896-1-jaegeuk@kernel.org>
 <2c195fee-c71c-4e44-b24f-9880b3c1b6c4@kernel.org>
 <ZhVrJh3rackEiIfL@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZhVrJh3rackEiIfL@google.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/10 0:21, Jaegeuk Kim wrote: > On 04/09, Chao Yu
 wrote: >> On 2024/4/5 3:52, Jaegeuk Kim wrote: >>> Shutdown does not check
 the error of thaw_super due to readonly, which >>> causes a deadloc [...]
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1ruMiC-00083y-AC
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't set RO when shutting down f2fs
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?B?TGlnaHQgSHNpZWggKOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC80LzEwIDA6MjEsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDA0LzA5LCBDaGFvIFl1
IHdyb3RlOgo+PiBPbiAyMDI0LzQvNSAzOjUyLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+IFNodXRk
b3duIGRvZXMgbm90IGNoZWNrIHRoZSBlcnJvciBvZiB0aGF3X3N1cGVyIGR1ZSB0byByZWFkb25s
eSwgd2hpY2gKPj4+IGNhdXNlcyBhIGRlYWRsb2NrIGxpa2UgYmVsb3cuCj4+Pgo+Pj4gZjJmc19p
b2Nfc2h1dGRvd24oRjJGU19HT0lOR19ET1dOX0ZVTExTWU5DKSAgICAgICAgaXNzdWVfZGlzY2Fy
ZF90aHJlYWQKPj4+ICAgIC0gYmRldl9mcmVlemUKPj4+ICAgICAtIGZyZWV6ZV9zdXBlcgo+Pj4g
ICAgLSBmMmZzX3N0b3BfY2hlY2twb2ludCgpCj4+PiAgICAgLSBmMmZzX2hhbmRsZV9jcml0aWNh
bF9lcnJvciAgICAgICAgICAgICAgICAgICAgIC0gc2Jfc3RhcnRfd3JpdGUKPj4+ICAgICAgIC0g
c2V0IFJPICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIHdhaXRpbmcK
Pj4+ICAgIC0gYmRldl90aGF3Cj4+PiAgICAgLSB0aGF3X3N1cGVyX2xvY2tlZAo+Pj4gICAgICAg
LSByZXR1cm4gLUVJTlZBTCwgaWYgc2JfcmRvbmx5KCkKPj4+ICAgIC0gZjJmc19zdG9wX2Rpc2Nh
cmRfdGhyZWFkCj4+PiAgICAgLT4gd2FpdCBmb3Iga3RocmVhZF9zdG9wKGRpc2NhcmRfdGhyZWFk
KTsKPj4+Cj4+PiBSZXBvcnRlZC1ieTogIkxpZ2h0IEhzaWVoICjorJ3mmI7nh4gpIiA8TGlnaHQu
SHNpZWhAbWVkaWF0ZWsuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdl
dWtAa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4gICAgZnMvZjJmcy9zdXBlci5jIHwgMTEgKysrKysr
KysrLS0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIu
Ywo+Pj4gaW5kZXggZGY5NzY1YjQxZGFjLi5iYTYyODhlODcwYzUgMTAwNjQ0Cj4+PiAtLS0gYS9m
cy9mMmZzL3N1cGVyLmMKPj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4gQEAgLTQxMzUsOSAr
NDEzNSwxNiBAQCB2b2lkIGYyZnNfaGFuZGxlX2NyaXRpY2FsX2Vycm9yKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgdW5zaWduZWQgY2hhciByZWFzb24sCj4+PiAgICAJaWYgKHNodXRkb3duKQo+
Pj4gICAgCQlzZXRfc2JpX2ZsYWcoc2JpLCBTQklfSVNfU0hVVERPV04pOwo+Pj4gLQkvKiBjb250
aW51ZSBmaWxlc3lzdGVtIG9wZXJhdG9ycyBpZiBlcnJvcnM9Y29udGludWUgKi8KPj4+IC0JaWYg
KGNvbnRpbnVlX2ZzIHx8IGYyZnNfcmVhZG9ubHkoc2IpKQo+Pj4gKwkvKgo+Pj4gKwkgKiBDb250
aW51ZSBmaWxlc3lzdGVtIG9wZXJhdG9ycyBpZiBlcnJvcnM9Y29udGludWUuIFNob3VsZCBub3Qg
c2V0Cj4+PiArCSAqIFJPIGJ5IHNodXRkb3duLCBzaW5jZSBSTyBieXBhc3NlcyB0aGF3X3N1cGVy
IHdoaWNoIGNhbiBoYW5nIHRoZQo+Pj4gKwkgKiBzeXN0ZW0uCj4+PiArCSAqLwo+Pj4gKwlpZiAo
Y29udGludWVfZnMgfHwgZjJmc19yZWFkb25seShzYikgfHwKPj4+ICsJCQkJcmVhc29uID09IFNU
T1BfQ1BfUkVBU09OX1NIVVRET1dOKSB7Cj4+PiArCQlmMmZzX3dhcm4oc2JpLCAiU3RvcHBlZCBm
aWxlc3lzdGVtIGR1ZSB0byByZWFkb246ICVkIiwgcmVhc29uKTsKPj4+ICAgIAkJcmV0dXJuOwo+
Pgo+PiBEbyB3ZSBuZWVkIHRvIHNldCBSTyBhZnRlciBiZGV2X3RoYXcoKSBpbiBmMmZzX2RvX3No
dXRkb3duKCk/Cj4gCj4gSUlSQywgc2h1dGRvd24gZG9lc24ndCBuZWVkIHRvIHNldCBSTyBhcyB3
ZSBzdG9wcGVkIHRoZSBjaGVja3BvaW50Lgo+IEknbSBtb3JlIGNvbmNlcm5lZCBvbiBhbnkgc2lk
ZSBlZmZlY3QgY2F1c2VkIGJ5IHRoaXMgUk8gY2hhbmdlLgoKT2theSwgSSBqdXN0IHdvbmRlciB3
aGV0aGVyIHdlIG5lZWQgdG8gZm9sbG93IHNlbWFudGljcyBvZiBlcnJvcnM9cmVtb3VudC1ybwpz
ZW1hbnRpY3MsIGJ1dCBpdCBsb29rcyBmaW5lIHNpbmNlIHNodXRkb3duIG9wZXJhdGlvbiBzaW11
bGF0ZWQgYnkgaW9jdGwKY291bGQgbm90IGJlIHRyZWF0ZWQgYXMgYW4gaW5uZXIgY3JpdGljYWwg
ZXJyb3IsCgplcnJvcnM9JXMgICAgICAgICAgICAgICAgU3BlY2lmeSBmMmZzIGJlaGF2aW9yIG9u
IGNyaXRpY2FsIGVycm9ycy4gVGhpcyBzdXBwb3J0cyBtb2RlczoKICAgICAgICAgICAgICAgICAg
ICAgICAgICAicGFuaWMiLCAiY29udGludWUiIGFuZCAicmVtb3VudC1ybyIsIHJlc3BlY3RpdmVs
eSwgdHJpZ2dlcgogICAgICAgICAgICAgICAgICAgICAgICAgIHBhbmljIGltbWVkaWF0ZWx5LCBj
b250aW51ZSB3aXRob3V0IGRvaW5nIGFueXRoaW5nLCBhbmQgcmVtb3VudAogICAgICAgICAgICAg
ICAgICAgICAgICAgIHRoZSBwYXJ0aXRpb24gaW4gcmVhZC1vbmx5IG1vZGUuIEJ5IGRlZmF1bHQg
aXQgdXNlcyAiY29udGludWUiCiAgICAgICAgICAgICAgICAgICAgICAgICAgbW9kZS4KCkFsc28s
IGl0IGtlZXBzIHRoZSBiZWhhdmlvciBjb25zaXN0ZW50IHcvIHdoYXQgd2UgZG8gZm9yIGVycm9y
cz1wYW5pYyBjYXNlLgoKCWlmIChGMkZTX09QVElPTihzYmkpLmVycm9ycyA9PSBNT1VOVF9FUlJP
UlNfUEFOSUMgJiYKCQkJCSFzaHV0ZG93biAmJiAhc3lzdGVtX2dvaW5nX2Rvd24oKSAmJgoJCQkJ
Xl5eXl5eXl5eCgkJCQkhaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0lTX1NIVVRET1dOKSkKCQlw
YW5pYygiRjJGUy1mcyAoZGV2aWNlICVzKTogcGFuaWMgZm9yY2VkIGFmdGVyIGVycm9yXG4iLAoJ
CQkJCQkJc2ItPnNfaWQpOwoKVGhhbmtzLAoKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gKwl9Cj4+
PiAgICAJZjJmc193YXJuKHNiaSwgIlJlbW91bnRpbmcgZmlsZXN5c3RlbSByZWFkLW9ubHkiKTsK
Pj4+ICAgIAkvKgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C3A85A73
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 12:51:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3Byx-000202-KV;
	Fri, 11 Apr 2025 10:51:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u3Byw-0001zs-Jf
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H3rGkNJuF7vmd3CnUSOh8IRiL1NQLxZqTckGRh+KDl8=; b=f4Y/FcOXGjx9ldhXWOjJkkRQm+
 U7WMTS9cxCBawDMMaXgQRIm/AkmmmWiWDVjb3WTlLP1QuegNfZ0DB1L4lv9Ov+uD4jMa34FZZx6bo
 9ySe0Zr4LvqlWP3WD5KhztnZo55EGHN9caI4LUJyyfe0mgw6GFgqyDK2fRZud91AR/Ao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H3rGkNJuF7vmd3CnUSOh8IRiL1NQLxZqTckGRh+KDl8=; b=W7szU/0Tmdz3oB0qSEJsV4NgE1
 u+JCts8HQ17vnp1KmvFytCZqb6LfOvsOns6m3+a3JJbg1BouQnY2SA0z6E/KH1rtl9k9NxazMfu2t
 iZqlFYeTSIPkEjABKgKNcD/LYSY/cS4b1kDdvb45sVJXsWz3xW07h2/2ZWOocWcT6Rl4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3Byh-0001b0-F1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 183E55C6825;
 Fri, 11 Apr 2025 10:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AA2C4CEE2;
 Fri, 11 Apr 2025 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744368668;
 bh=2VqIwp5yGqsh5SOUaxRVoZV59vG0cHnErei6ephOI5w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UdlAttiPC/y/xwl+U1lUsTTYMJ56/fjr8uGIEe+TfjA+mw3nwPQns79Kysu/E4N8g
 JbqtcU58nWlx+NOpjl/d+J+/PgDrO0B/IKW61GulAY1ALWihzs+xSdJEAsIKCbmbUt
 +Av+B45Y9k5ZDwoD1x0EJFbGUk8URu+4VLuWgDbpE4Ph1L4jj2QuQ6TPuv2j/Cc2iU
 mC+wzifOfyeKIHf9Uph/kieim4z0x3Tx40ClUk/14a6BSBe1zhxLHhT04HtkYKd+Rf
 8yteEqTIrA2Kb+KzUvkn2SOL0+BpE0FXsiYCBPGxmqgKX6HqgMqqHBcJ8DGI2RB3Vv
 Nx4Jiiorrksxw==
Message-ID: <5b955d00-ce49-4a40-8d16-00738d919652@kernel.org>
Date: Fri, 11 Apr 2025 18:51:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>
References: <20250411100526.7939-1-chao@kernel.org>
 <20250411100526.7939-2-chao@kernel.org>
 <CAD14+f3XQjvRxHEFm9OFv2RSOC_Ekbzu-LiJhRj+XXOndYw1dQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f3XQjvRxHEFm9OFv2RSOC_Ekbzu-LiJhRj+XXOndYw1dQ@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/4/11 18:20, Juhyung Park wrote: > On Fri, Apr 11,
   2025 at 3:05 AM Chao Yu <chao@kernel.org> wrote: >> >> resize.f2fs doesn't
    guarantee atomically resizing f2fs image, >> so that potential su [...] 
 
 Content analysis details:   (-5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u3Byh-0001b0-F1
Subject: Re: [f2fs-dev] [PATCH v2 2/2] resize.f2fs: add caution message for
 resize
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS80LzExIDE4OjIwLCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4gT24gRnJpLCBBcHIgMTEs
IDIwMjUgYXQgMzowNeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+
IHJlc2l6ZS5mMmZzIGRvZXNuJ3QgZ3VhcmFudGVlIGF0b21pY2FsbHkgcmVzaXppbmcgZjJmcyBp
bWFnZSwKPj4gc28gdGhhdCBwb3RlbnRpYWwgc3VkZGVudCBwb3dlciBjdXQsIElPIGVycm9yLCBv
dXQgb2YgbWVtb3J5LAo+PiBTSUdLSUxMIHJlY2VpdmVkIG9yIHByb2dyYW0gZXhpdHMgZHVlIHRv
IG90aGVyIHJlYXNvbnMgbWF5IGNhdXNlCj4+IGRhdGEgY29ycnVwdGlvbi4KPj4KPj4gVGhpcyBw
YXRjaCBhZGRzIGNhdXRpb24gbWVzc2FnZSBmb3IgcmVzaXplIHVzZXJzIHRvIG5vdGljZQo+PiBw
b3RlbnRpYWwgcmlzayBvZiB1c2luZyByZXNpemluZyB0b29sLCBhbmQgcmVtaW5kIHRoZW0gdG8g
YmFja3VwCj4+IGRhdGEgYmVmb3JlIHJlc2l6ZS4KPj4KPj4gcmVzaXplLmYyZnMgPHBhcnRpdGlv
bj4KPj4KPj4gIlBsZWFzZSBub3RpY2UgdGhlcmUgaXMgaGlnaCByaXNrIG9mIGRhdGEgbG9zdCBk
dXJpbmcgcmVzaXplLCBwbGVhc2UgYmFja3VwIHlvdXIgZGF0YSBiZWZvcmUgcmVzaXplLgo+PiBE
byB5b3Ugd2FudCB0byByZXNpemUgdGhpcyBwYXJ0aXRpb24/IFt5L25dIHkKPj4gcHJvY2VzcyBy
ZXNpemUiCj4+Cj4+IElmIHdlIHdhbnQgdG8gZm9yY2UgdG8gdXNlIHJlc2l6ZS5mMmZzLCB3ZSBj
YW4gdXNlIC1GIG9wdGlvbiwKPj4gbGV0J3MgZW5hYmxlIC1GIG9wdGlvbiBpbiBBbmRyb2lkIGJ5
IGRlZmF1bHQgdG8gbm90IGJyZWFrIGFueQo+PiB1c2FnZS4KPj4KPj4gQ2M6IEp1IEh5dW5nIFBh
cmsgPHFrcnduZ3VkODI1QGdtYWlsLmNvbT4KPiAKPiBDYW4geW91IHVwZGF0ZSB0aGlzIHRvICJK
dWh5dW5nIFBhcmsiPyBUaGF0J3MgdGhlIHByZWZlcnJlZCBuYW1lIHRoYXQKPiBJIHVzZSBub3cg
OykKPiAKPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0K
Pj4gICBmc2NrL21haW4uYyAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKystLQo+
PiAgIGZzY2svcmVzaXplLmMgICAgIHwgIDIgKy0KPj4gICBpbmNsdWRlL2YyZnNfZnMuaCB8ICAx
ICsKPj4gICBtYW4vcmVzaXplLmYyZnMuOCB8IDEyICsrKysrKysrKysrKwo+PiAgIDQgZmlsZXMg
Y2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2ZzY2svbWFpbi5jIGIvZnNjay9tYWluLmMKPj4gaW5kZXggYWY0MDYxMy4uZWY2YjE3ZCAx
MDA2NDQKPj4gLS0tIGEvZnNjay9tYWluLmMKPj4gKysrIGIvZnNjay9tYWluLmMKPj4gQEAgLTIy
Miw2ICsyMjIsOCBAQCBzdGF0aWMgdm9pZCBhZGRfZGVmYXVsdF9vcHRpb25zKHZvaWQpCj4+ICAg
ICAgICAgICAgICAgICAgaWYgKGMuZnVuYyA9PSBGU0NLKSB7Cj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiAtYSAqLwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgYy5hdXRvX2ZpeCA9
IDE7Cj4+ICsgICAgICAgICAgICAgICB9IGVsc2UgaWYgKGMuZnVuYyA9PSBSRVNJWkUpIHsKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgYy5mb3JjZSA9IDE7Cj4+ICAgICAgICAgICAgICAgICAg
fQo+Pgo+PiAgICAgICAgICAgICAgICAgIC8qCj4+IEBAIC02MDEsNyArNjAzLDcgQEAgdm9pZCBm
MmZzX3BhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPj4gICAjZW5kaWYKPj4g
ICAgICAgICAgfSBlbHNlIGlmICghc3RyY21wKCJyZXNpemUuZjJmcyIsIHByb2cpKSB7Cj4+ICAg
I2lmZGVmIFdJVEhfUkVTSVpFCj4+IC0gICAgICAgICAgICAgICBjb25zdCBjaGFyICpvcHRpb25f
c3RyaW5nID0gImQ6ZkhzdDpvOlYiOwo+PiArICAgICAgICAgICAgICAgY29uc3QgY2hhciAqb3B0
aW9uX3N0cmluZyA9ICJkOmZGSHN0Om86ViI7Cj4+Cj4+ICAgICAgICAgICAgICAgICAgYy5mdW5j
ID0gUkVTSVpFOwo+PiAgICAgICAgICAgICAgICAgIHdoaWxlICgob3B0aW9uID0gZ2V0b3B0KGFy
Z2MsIGFyZ3YsIG9wdGlvbl9zdHJpbmcpKSAhPSBFT0YpIHsKPj4gQEAgLTYxOCw5ICs2MjAsMTIg
QEAgdm9pZCBmMmZzX3BhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5k
YmdfbHYpOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIGNhc2UgJ2YnOgo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGMuaWdub3JlX2Vycm9yID0gMTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBNU0coMCwgIkluZm86IEluZ29yZSBlcnJvciBkdXJpbmcgcmVzaXplXG4iKTsKPiAK
PiBzL0luZ29yZS9pZ25vcmUKPiBzL2Vycm9yL2Vycm9ycwo+IAo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+PiArICAgICAgICAgICAgICAgICAgICAgICBjYXNlICdG
JzoKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5mb3JjZSA9IDE7Cj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1TRygwLCAiSW5mbzogRm9yY2UgdG8gcmVz
aXplXG4iKTsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAKPiBJ
cyB0aGlzIGZhbGx0aHJvdWdoIGludGVuZGVkPwo+IAo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgY2FzZSAnSCc6Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMubmVlZF93
aGludCA9IHRydWU7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMud2hpbnQg
PSBXUklURV9MSUZFX05PVF9TRVQ7Cj4+IEBAIC0xMTA0LDYgKzExMDksMjQgQEAgb3V0X3Jhbmdl
Ogo+PiAgICNpZmRlZiBXSVRIX1JFU0laRQo+PiAgIHN0YXRpYyBpbnQgZG9fcmVzaXplKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSkKPj4gICB7Cj4+ICsgICAgICAgY2hhciBhbnN3ZXJbMjU1XSA9
IHswfTsKPj4gKyAgICAgICBpbnQgcmV0Owo+PiArCj4+ICsgICAgICAgaWYgKCFjLmZvcmNlKSB7
Cj4+ICtyZXRyeToKPj4gKyAgICAgICAgICAgICAgIHByaW50ZigiXG5QbGVhc2Ugbm90aWNlIHRo
ZXJlIGlzIGhpZ2ggcmlzayBvZiBkYXRhIGxvc3QgZHVyaW5nIHJlc2l6ZSwgIgo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAicGxlYXNlIGJhY2t1cCB5b3VyIGRhdGEgYmVmb3JlIHJlc2l6ZS5c
biIKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIkRvIHlvdSB3YW50IHRvIHJlc2l6ZSB0aGlz
IHBhcnRpdGlvbj8gW3kvbl0gIik7Cj4gCj4gImhpZ2ggcmlzayIgaXMgcHJvYmFibHkgdG9vIGFn
Z3Jlc3NpdmUuIEkgaGFkIG1hbnkgc3VjY2Vzc2VzIGluIHJlc2l6ZS4KPiAKPiBNYXliZSAiUmVz
aXplIG9wZXJhdGlvbiBpcyBjdXJyZW50bHkgZXhwZXJpbWVudGFsLCBwbGVhc2UgYmFja3VwIHlv
dXIKPiBkYXRhLlxuRG8geW91IHdhbnQgdG8gY29udGludWU/IFt5L25dICI/Cj4gCj4+ICsgICAg
ICAgICAgICAgICByZXQgPSBzY2FuZigiJXMiLCBhbnN3ZXIpOwo+PiArICAgICAgICAgICAgICAg
QVNTRVJUKHJldCA+PSAwKTsKPj4gKyAgICAgICAgICAgICAgIGlmICghc3RyY2FzZWNtcChhbnN3
ZXIsICJ5IikpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHByaW50ZigicHJvY2VzcyByZXNp
emVcbiIpOwo+IAo+IFNvbWV0aGluZyBsaWtlICJQcm9jZWVkaW5nIHRvIHJlc2l6ZSIgbG9va3Mg
YmV0dGVyIGhlcmUuCgpUaGV5IGFsbCBtYWtlIHNlbnNlIHRvIG1lLCBsZXQgbWUgdXBkYXRlIGlu
IHY0LgoKVGhhbmtzLAoKPiAKPj4gKyAgICAgICAgICAgICAgIGVsc2UgaWYgKCFzdHJjYXNlY21w
KGFuc3dlciwgIm4iKSkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4+ICsg
ICAgICAgICAgICAgICBlbHNlCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gcmV0cnk7
Cj4+ICsgICAgICAgfQo+PiArCj4+ICAgICAgICAgIGlmICghYy50YXJnZXRfc2VjdG9ycykKPj4g
ICAgICAgICAgICAgICAgICBjLnRhcmdldF9zZWN0b3JzID0gYy50b3RhbF9zZWN0b3JzOwo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZnNjay9yZXNpemUuYyBiL2ZzY2svcmVzaXplLmMKPj4gaW5kZXggMjY4
MWI5Zi4uMWFiN2Q3NSAxMDA2NDQKPj4gLS0tIGEvZnNjay9yZXNpemUuYwo+PiArKysgYi9mc2Nr
L3Jlc2l6ZS5jCj4+IEBAIC03NjUsNyArNzY1LDcgQEAgaW50IGYyZnNfcmVzaXplKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSkKPj4gICAgICAgICAgICAgICAgICB9Cj4+ICAgICAgICAgIGVsc2Ug
aWYgKCgoYy50YXJnZXRfc2VjdG9ycyAqIGMuc2VjdG9yX3NpemUgPj4KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgIGdldF9zYihsb2dfYmxvY2tzaXplKSkgPiBnZXRfc2IoYmxvY2tfY291bnQp
KSB8fAo+PiAtICAgICAgICAgICAgICAgICAgICAgICBjLmZvcmNlKQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICBjLmlnbm9yZV9lcnJvcikKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gZjJm
c19yZXNpemVfZ3JvdyhzYmkpOwo+PiAgICAgICAgICBlbHNlIHsKPj4gICAgICAgICAgICAgICAg
ICBNU0coMCwgIk5vdGhpbmcgdG8gcmVzaXplLlxuIik7Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2YyZnNfZnMuaCBiL2luY2x1ZGUvZjJmc19mcy5oCj4+IGluZGV4IDdlM2YyNWIuLjkyOGY5NjMg
MTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZjJmc19mcy5oCj4+ICsrKyBiL2luY2x1ZGUvZjJmc19m
cy5oCj4+IEBAIC0xNTI4LDYgKzE1MjgsNyBAQCBzdHJ1Y3QgZjJmc19jb25maWd1cmF0aW9uIHsK
Pj4gICAgICAgICAgaW50IG5vX2tlcm5lbF9jaGVjazsKPj4gICAgICAgICAgaW50IGZpeF9vbjsK
Pj4gICAgICAgICAgaW50IGZvcmNlOwo+PiArICAgICAgIGludCBpZ25vcmVfZXJyb3I7Cj4+ICAg
ICAgICAgIGludCBkZWZzZXQ7Cj4+ICAgICAgICAgIGludCBidWdfb247Cj4+ICAgICAgICAgIHVu
c2lnbmVkIGludCBpbnZhbGlkX3NiOwo+PiBkaWZmIC0tZ2l0IGEvbWFuL3Jlc2l6ZS5mMmZzLjgg
Yi9tYW4vcmVzaXplLmYyZnMuOAo+PiBpbmRleCAwMmZmMjQ1Li5iZGRhNGZkIDEwMDY0NAo+PiAt
LS0gYS9tYW4vcmVzaXplLmYyZnMuOAo+PiArKysgYi9tYW4vcmVzaXplLmYyZnMuOAo+PiBAQCAt
MTgsNiArMTgsMTIgQEAgcmVzaXplLmYyZnMgXC0gcmVzaXplIGZpbGVzeXN0ZW0gc2l6ZQo+PiAg
IC5JIG92ZXJwcm92aXNpb24tcmF0aW8tcGVyY2VudGFnZQo+PiAgIF0KPj4gICBbCj4+ICsuQiBc
LWYKPj4gK10KPj4gK1sKPj4gKy5CIFwtRgo+PiArXQo+PiArWwo+PiAgIC5CIFwtSAo+PiAgIF0K
Pj4gICBbCj4+IEBAIC01Myw2ICs1OSwxMiBAQCBTcGVjaWZ5IHRoZSBwZXJjZW50YWdlIG9mIHRo
ZSB2b2x1bWUgdGhhdCB3aWxsIGJlIHVzZWQgYXMgb3ZlcnByb3Zpc2lvbiBhcmVhLgo+PiAgIFRo
aXMgYXJlYSBpcyBoaWRkZW4gdG8gdXNlcnMsIGFuZCB1dGlsaXplZCBieSBGMkZTIGNsZWFuZXIu
IElmIG5vdCBzcGVjaWZpZWQsIHRoZQo+PiAgIGJlc3QgbnVtYmVyIHdpbGwgYmUgYXNzaWduZWQg
YXV0b21hdGljYWxseSBhY2NvcmRpbmcgdG8gdGhlIHBhcnRpdGlvbiBzaXplLgo+PiAgIC5UUAo+
PiArLkJJIFwtZgo+PiArRm9yY2UgdG8gZml4IGFueSBpbmNvbnNpc3RlbnQgZGF0YSBkdXJpbmcg
cmVzaXplLgo+PiArLlRQCj4+ICsuQkkgXC1GCj4+ICtTa2lwIGNhdXRpb24gZGlhbG9ndWUgYW5k
IHJlc2l6ZSBwYXJ0aXRpb24gZGlyZWN0bHkuCj4+ICsuVFAKPj4gICAuQkkgXC1ICj4+ICAgU3Bl
Y2lmeSBzdXBwb3J0IHdyaXRlIGhpbnQuCj4+ICAgLlRQCj4+IC0tCj4+IDIuNDAuMQo+PgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==

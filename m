Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBE6DE24E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 19:18:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmHdL-0007Zg-5p;
	Tue, 11 Apr 2023 17:18:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pmHdC-0007ZZ-Jg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tddACX3Wl9qaM3Y7N3mWy9LFt1vg0gXVK/J1avEEzLM=; b=Up49S7raloW4Srg2vsDiMBNS45
 vOhLxZWHuZI/xwqledAvbRnWlxoMUeEAfcusky9x2AX4m0OTYHcqH8893Ism+sKZVKV0T/b9G1Dga
 wIpX59sEkuOCnjAM3dZ2UKCnZFBcsvWRfpRXW1Ko2NOBNFTh0aBAK+P7nHYy8QHs6Mxw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tddACX3Wl9qaM3Y7N3mWy9LFt1vg0gXVK/J1avEEzLM=; b=I0TY4cqhqAai9WtaeEYJGN/91J
 mQU3IyFoI3ZahQMvIbzLWtIV3O0KMmYimBp1f0euqLxSw0PyATAimVnJpeuk/AuVgDOIV2PwwhAaa
 hjkVLCOj0KQI/t6pL0U6YTLiLeCL9pOC9JQtfdyB5Gb1bFwl/nix8F6udHXl7O6Dc2W0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmHdB-0005vI-2g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:18:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CB3962554;
 Tue, 11 Apr 2023 17:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C8FC4339C;
 Tue, 11 Apr 2023 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681233479;
 bh=gPKRbsethIsngQSer/MB4Lw2hO5FB3ltBbfoKoQT1DE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nGyqURfL99A0DyM+gn7sNsA7urna4Xzf43gq6RI9pB+wlmJUt7yX7FRzqWRdO0Y9u
 EFCMrslp4U+WAkHJ2aK6ocZbXdomm1QrIcBPtBqLzP53b4b1j1fFW1bhqcbDWr3mgc
 +3h2k+1V79ny23BlGMW0A5ZKewDwunCeI7o+R88SwArV0xpSLDliNRZkIz5v16HGn5
 9J1vsHKKkrdxQKHpNEXMyDSAPG5dPHZuiEby8aIcXaNluY7RSNkSwtXduqqescshaw
 XS5VktIYrDy+Yfkx+AAQMOXUnQsBN4iV8Nduhz1HAaKIO3AvdHtRgvD2w5UV3OmNky
 o1MrwkCv+9qXw==
Date: Tue, 11 Apr 2023 10:17:58 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Juhyung Park <qkrwngud825@gmail.com>
Message-ID: <ZDWWRokqJwnzLldg@google.com>
References: <20230404055446.1656296-1-qkrwngud825@gmail.com>
 <CAD14+f0FbTXfaD_dM-RyFiPbaong-B-6hqrms2M4riidX9yVug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD14+f0FbTXfaD_dM-RyFiPbaong-B-6hqrms2M4riidX9yVug@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/10, Juhyung Park wrote: > Hi Jaegeuk, > > Thanks for
 the timely merge. > > Can we have a new f2fs-tools tag with this commit in
 place? > Alex (the original bug reporter) would like to see this i [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmHdB-0005vI-2g
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: fix sanity check logic for
 cp_payload
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
Cc: Alexander Koskovich <akoskovich@pm.me>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDQvMTAsIEp1aHl1bmcgUGFyayB3cm90ZToKPiBIaSBKYWVnZXVrLAo+IAo+IFRoYW5rcyBm
b3IgdGhlIHRpbWVseSBtZXJnZS4KPiAKPiBDYW4gd2UgaGF2ZSBhIG5ldyBmMmZzLXRvb2xzIHRh
ZyB3aXRoIHRoaXMgY29tbWl0IGluIHBsYWNlPwo+IEFsZXggKHRoZSBvcmlnaW5hbCBidWcgcmVw
b3J0ZXIpIHdvdWxkIGxpa2UgdG8gc2VlIHRoaXMgaW5jb3Jwb3JhdGVkCj4gaW4gdGhlIG5leHQg
dmVyc2lvbiBvZiBVYnVudHUgKGFuZCBEZWJpYW4pLCBhbmQgaGF2aW5nIGEgbmV3IHRhZyBpcwo+
IG11Y2ggZWFzaWVyIHRvIGNvbnZpbmNlIHRoZW0gdG8gcGFjayBhIG5ldyB0YWcgdGhhbiBoYXZp
bmcgb25lIHBhdGNoCj4gYmFja3BvcnRlZC4KPiAKPiBJbiBhIHByYWN0aWNhbCBzY2VuYXJpbywg
YSAyVEIgcGFydGl0aW9uIGZvcm1hdHRlZCB3aXRoIG1rZnMuZjJmcyAtaQo+IHNpbXBseSBkb2Vz
bid0IGJvb3QgdW5kZXIgVWJ1bnR1IGFzIGZzY2suZjJmcyBpbnNpZGUgdGhlIGluaXRyYW1mcwo+
IHJldHVybnMgYW4gZXJyb3IuCj4gCj4gVGhpcyBwYXRjaCBmaXhlcyB0aGF0IGFuZCB0aGVyZWZv
cmUgYWxsb3dzIHRoZSB1c2VycyB0byBib290IG5vcm1hbGx5Cj4gd2l0aG91dCBtYW51YWxseSBl
eGNsdWRpbmcgdGhlIGYyZnMgcGFydGl0aW9uIHRvIGJlIGNoZWNrZWQgZHVyaW5nCj4gYm9vdC4K
ClRoYW5rIHlvdSBmb3IgaGVhZHMgdXAuIEkgcmVsZWFzZWQgdjEuMTYuMC4gUGxlYXNlIGNoZWNr
LiA6KQoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamFl
Z2V1ay9mMmZzLXRvb2xzLmdpdC90YWcvP2g9djEuMTYuMAoKPiAKPiBUaGFua3MuIFJlZ2FyZHMK
PiAKPiBPbiBUdWUsIEFwciA0LCAyMDIzIGF0IDI6NTTigK9QTSBKdWh5dW5nIFBhcmsgPHFrcndu
Z3VkODI1QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gY3BfcGF5bG9hZCBpcyBzZXQgZGlmZmVy
ZW50bHkgWzFdIHdoZW4gZXh0ZW5kZWQgbm9kZSBiaXRtYXAgZmVhdHVyZSBpcwo+ID4gZW5hYmxl
ZC4gQ29tbWl0IGI3OWMzYmE0ZWE5ZCBicm9rZSBmc2NrIG9uIGYyZnMgZmlsZSBzeXN0ZW1zIGNy
ZWF0ZWQgb24KPiA+IDIrIFRCIGRldmljZSB3aXRoIGV4dGVuZGVkIG5vZGUgYml0bWFwIGZlYXR1
cmUgZW5hYmxlZC4KPiA+Cj4gPiBBcyB0aGUgc2FuaXR5IGNoZWNrIGlzIGZvciBjaGVja2luZyBv
dmVyZmxvd3MsIGZpeCB0aGlzIHRvIGFzc3VtZSB0aGUgbWF4Cj4gPiBwb3NzaWJsZSBjcF9wYXls
b2FkIHNpemUgdW5kZXIgdGhlIGV4dGVuZGVkIG5vZGUgYml0bWFwLgo+ID4KPiA+IExpbms6IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJm
cy10b29scy5naXQvdHJlZS9ta2ZzL2YyZnNfZm9ybWF0LmM/aD12MS4xNS4wI24zNzIgWzFdCj4g
PiBGaXhlczogYjc5YzNiYTRlYTlkICgiZnNjay5mMmZzOiBzYW5pdHkgY2hlY2sgY3BfcGF5bG9h
ZCBiZWZvcmUgcmVhZGluZyBjaGVja3BvaW50IikKPiA+IFJlcG9ydGVkLWJ5OiBBbGV4YW5kZXIg
S29za292aWNoIDxha29za292aWNoQHBtLm1lPgo+ID4gU2lnbmVkLW9mZi1ieTogSnVoeXVuZyBQ
YXJrIDxxa3J3bmd1ZDgyNUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBmc2NrL21vdW50LmMgICAg
ICB8IDIgKy0KPiA+ICBpbmNsdWRlL2YyZnNfZnMuaCB8IDQgKysrKwo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2ZzY2svbW91bnQuYyBiL2ZzY2svbW91bnQuYwo+ID4gaW5kZXggMmIyNjcwMS4uZGYwMzE0ZCAx
MDA2NDQKPiA+IC0tLSBhL2ZzY2svbW91bnQuYwo+ID4gKysrIGIvZnNjay9tb3VudC5jCj4gPiBA
QCAtMTIwOCw3ICsxMjA4LDcgQEAgaW50IGdldF92YWxpZF9jaGVja3BvaW50KHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSkKPiA+ICAgICAgICAgaW50IHJldDsKPiA+Cj4gPiAgICAgICAgIGNwX3Bh
eWxvYWQgPSBnZXRfc2IoY3BfcGF5bG9hZCk7Cj4gPiAtICAgICAgIGlmIChjcF9wYXlsb2FkID4g
RjJGU19CTEtfQUxJR04oTUFYX1NJVF9CSVRNQVBfU0laRSkpCj4gPiArICAgICAgIGlmIChjcF9w
YXlsb2FkID4gRjJGU19CTEtfQUxJR04oTUFYX0NQX1BBWUxPQUQpKQo+ID4gICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+ID4KPiA+ICAgICAgICAgY3BfYmxrcyA9IDEgKyBjcF9wYXls
b2FkOwo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZjJmc19mcy5oIGIvaW5jbHVkZS9mMmZzX2Zz
LmgKPiA+IGluZGV4IDMzM2FlMDcuLmY4OTA2MzQgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2Yy
ZnNfZnMuaAo+ID4gKysrIGIvaW5jbHVkZS9mMmZzX2ZzLmgKPiA+IEBAIC0xMTY4LDYgKzExNjgs
MTAgQEAgc3RhdGljX2Fzc2VydChzaXplb2Yoc3RydWN0IGYyZnNfbmF0X2Jsb2NrKSA9PSA0MDk1
LCAiIik7Cj4gPiAgI2RlZmluZSBNQVhfU0lUX0JJVE1BUF9TSVpFICAgIChTRUdfQUxJR04oU0la
RV9BTElHTihGMkZTX01BWF9TRUdNRU5ULCBcCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBTSVRfRU5UUllfUEVSX0JMT0NLKSkgKiBcCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjLmJsa3NfcGVyX3Nl
ZyAvIDgpCj4gPiArI2RlZmluZSBNQVhfQ1BfUEFZTE9BRCAgICAgICAgIChTRUdfQUxJR04oU0la
RV9BTElHTihVSU5UMzJfTUFYLCBOQVRfRU5UUllfUEVSX0JMT0NLKSkgKiBcCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBERUZBVUxUX05BVF9FTlRS
WV9SQVRJTyAvIDEwMCAqIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGMuYmxrc19wZXJfc2VnIC8gOCArIFwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1BWF9TSVRfQklUTUFQX1NJWkUgLSBNQVhf
QklUTUFQX1NJWkVfSU5fQ0tQVCkKPiA+Cj4gPiAgLyoKPiA+ICAgKiBOb3RlIHRoYXQgZjJmc19z
aXRfZW50cnktPnZibG9ja3MgaGFzIHRoZSBmb2xsb3dpbmcgYml0LWZpZWxkIGluZm9ybWF0aW9u
Lgo+ID4gLS0KPiA+IDIuNDAuMAo+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

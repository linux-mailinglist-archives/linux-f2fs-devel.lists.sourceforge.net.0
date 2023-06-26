Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5F73E05D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jun 2023 15:17:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDm5h-00015W-Mk;
	Mon, 26 Jun 2023 13:17:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qDm5b-00015O-Hh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 13:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sw8DcM/xPi/eM3qRypis8TdN4wgM9AdxQbEd/eZpxrQ=; b=eKBXpk1kRh/KEB3H/vvQiTpLSX
 iWZwa6DjVkJPsg/XwQTiKeE9YyaCdWpB+KzDnsxhjTjda1bopDB1oviOkq9dBVBdFGACc22YhTofA
 dgKQUsN+lBSDM6l65SWdEz6B3NnG9PvuHbAh29RyQ7N6oDNrmiUquKmemDlyWO850euk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sw8DcM/xPi/eM3qRypis8TdN4wgM9AdxQbEd/eZpxrQ=; b=LajWp3gS/KHI3AAZTf/NkU35TP
 6aBPx5RSEBXDZpbcrl/fjVgG3/be/EZVo8tpH5R7gd5y6WiPfYXSUEyZN3wPiaGPyEKSeLnxwMJw0
 jOMi4kKha2mnt4IwdJzSu/Rbmr604N5rhXiS3kFkRyyOKkPGzvZ/b47uAEa/xYMIexoo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDm5b-00FEsb-5N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 13:17:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C22ED60DFD;
 Mon, 26 Jun 2023 13:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1061BC433C0;
 Mon, 26 Jun 2023 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687785421;
 bh=s9k+AYqgePpeMVIbOwnHOPJNWdEtQMP7MRlarPpl/SE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dxpMk344RbkBco6lAhRjhfZSdjHK+F0rXhq4r0mHKjP5qC9mkEEtnk0P7JDMgsxV9
 px+GwSerrEXQuF3KiZyME/abRD/PStDlqgkn2HP87G8m6Z4WpvYeQyGIxQv0x2PaQH
 UtGTAZJHzH4CRHdnooI6HegYKvJGVeml5UlW/d+Fkf0QNqFfmKlxlISq9WKimtGmEx
 5hmUeqA5ozE13cXa19HyFgk/O/0+91E0ieIIOVDJyZwNoZ1vD6IRwLwTH35HjZdhO6
 OACXaeNCstOPTK7dEKQXe/JaYLMyMPtDWxCcHB3HIWY4DSUs+9SVo7HTa9KykkM6lS
 z3BRjLwJvflkg==
Date: Mon, 26 Jun 2023 06:16:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: =?utf-8?B?5L2V5LqR6JW+KFl1bmxlaSBoZSk=?= <heyunlei@oppo.com>
Message-ID: <ZJmPy8YQbcnS9Zkr@google.com>
References: <20230613085250.3648491-1-heyunlei@oppo.com>
 <b8523d41-246b-b11e-f6e3-423e32cc597a@kernel.org>
 <6c527e97-c4a6-dc58-13fb-516f77e5e068@oppo.com>
 <f7a44e66-6fde-a178-d29e-7684bcbc454e@kernel.org>
 <ZJXtcfoR+BFx5CXn@google.com>
 <b638931a-ab81-a6ef-be5b-57848f27aba7@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b638931a-ab81-a6ef-be5b-57848f27aba7@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 06/25, 何云蕾(Yunlei he) wrote: > > On 2023/6/24 3:07,
    Jaegeuk Kim wrote: > > On 06/20, Chao Yu wrote: > > > On 2023/6/20 10:42,
    何云蕾(Yunlei he) wrote: > > > > On 2023/6/20 8:33, Chao Yu wr [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qDm5b-00FEsb-5N
Subject: Re: [f2fs-dev] [PATCH] f2fs: not allowed to set file both cold and
 hot
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDYvMjUsIOS9leS6keiVvihZdW5sZWkgaGUpIHdyb3RlOgo+IAo+IE9uIDIwMjMvNi8yNCAz
OjA3LCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+IE9uIDA2LzIwLCBDaGFvIFl1IHdyb3RlOgo+ID4g
PiBPbiAyMDIzLzYvMjAgMTA6NDIsIOS9leS6keiVvihZdW5sZWkgaGUpIHdyb3RlOgo+ID4gPiA+
IE9uIDIwMjMvNi8yMCA4OjMzLCBDaGFvIFl1IHdyb3RlOgo+ID4gPiA+ID4gT24gMjAyMy82LzEz
IDE2OjUyLCBZdW5sZWkgSGUgd3JvdGU6Cj4gPiA+ID4gPiA+IEZpbGUgc2V0IGJvdGggY29sZCBh
bmQgaG90IGFkdmlzZSBiaXQgaXMgY29uZnVzaW9uLCBzbwo+ID4gPiA+ID4gPiByZXR1cm4gRUlO
VkFMIHRvIGF2b2lkIHRoaXMgY2FzZS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFl1bmxlaSBIZTxoZXl1bmxlaUBvcHBvLmNvbT4KPiA+ID4gPiA+ID4gLS0tCj4gPiA+
ID4gPiA+ICDCoCBmcy9mMmZzL3hhdHRyLmMgfCAzICsrKwo+ID4gPiA+ID4gPiAgwqAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMveGF0dHIuYyBiL2ZzL2YyZnMveGF0dHIuYwo+ID4gPiA+ID4gPiBpbmRl
eCAyMTM4MDVkMzU5MmMuLjkxN2YzYWM5ZjFhMSAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvZnMv
ZjJmcy94YXR0ci5jCj4gPiA+ID4gPiA+ICsrKyBiL2ZzL2YyZnMveGF0dHIuYwo+ID4gPiA+ID4g
PiBAQCAtMTI3LDYgKzEyNyw5IEBAIHN0YXRpYyBpbnQgZjJmc194YXR0cl9hZHZpc2Vfc2V0KGNv
bnN0IHN0cnVjdCB4YXR0cl9oYW5kbGVyICpoYW5kbGVyLAo+ID4gPiA+ID4gPiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiAgwqDCoMKgwqDCoMKgwqDCoCBuZXdfYWR2aXNlID0gbmV3X2FkdmlzZSAmIEZBRFZJ
U0VfTU9ESUZJQUJMRV9CSVRTOwo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgIGlmICgobmV3X2Fk
dmlzZSAmIEZBRFZJU0VfQ09MRF9CSVQpICYmIChuZXdfYWR2aXNlICYgRkFEVklTRV9IT1RfQklU
KSkKPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5W
QUw7Cj4gPiBXaHkgbm90IHRoaXMgdG8gYWxsb3cgc2V0dGluZyBvbmUgYml0IG9ubHk/Cj4gPiAK
PiA+IEBAIC0xMjMsNyArMTIzLDggQEAgc3RhdGljIGludCBmMmZzX3hhdHRyX2FkdmlzZV9zZXQo
Y29uc3Qgc3RydWN0IHhhdHRyX2hhbmRsZXIgKmhhbmRsZXIsCj4gPiAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gCj4gPiAgICAgICAgICBuZXdfYWR2aXNlID0gKihjaGFyICop
dmFsdWU7Cj4gPiAtICAgICAgIGlmIChuZXdfYWR2aXNlICYgfkZBRFZJU0VfTU9ESUZJQUJMRV9C
SVRTKQo+ID4gKyAgICAgICBpZiAobmV3X2FkdmlzZSAmIH5GQURWSVNFX01PRElGSUFCTEVfQklU
UyB8fAo+ID4gKyAgICAgICAgICAgbmV3X2FkdmlzZSA9PSBGQURWSVNFX01PRElGSUFCTEVfQklU
UykKPiA+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gCj4gSGksSmFlZ2V1aywK
PiAKPiAgICAgSWYgbmV3IG1vZGlmaWFibGUgYWR2aXNlIGJpdCBpcyBhZGRlZCBpbiB0aGUgZnV0
dXJlLCBtYXliZSBtdWx0aS1iaXRzCj4gaXMgYWxsb3dlZD8KPiAKCkxvb2tzIGxpa2UgbWFraW5n
IGEgc2luZ2xlIGJpdCBhc3N1bXB0aW9uIHdvdWxkIGJlIGJldHRlciBpbiBnZW5lcmFsIGF0IHRo
aXMKbW9tZW50LgoKPiBUaGFua3MKPiAKPiA+IAo+ID4gPiA+ID4gWXVubGVpLAo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBXaGF0IGFib3V0IHRoZSBiZWxvdyBjYXNlOgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiAxLiBmMmZzX3hhdHRyX2FkdmlzZV9zZXQoRkFEVklTRV9DT0xEX0JJVCkKPiA+ID4gPiA+IDIu
IGYyZnNfeGF0dHJfYWR2aXNlX3NldChGQURWSVNFX0hPVF9CSVQpCj4gPiA+ID4gSGkswqAgQ2hh
bywKPiA+ID4gPiAKPiA+ID4gPiAgIMKgwqDCoCBJIHRlc3QgdGhpcyBjYXNlIHdvcmsgd2VsbCB3
aXRoIHRoaXMgcGF0Y2gswqAgY2FzZSBiZWxvdyB3aWxsIHJldHVybiAtRUlOVkFMOgo+ID4gPiA+
IAo+ID4gPiA+ICAgwqDCoMKgIGYyZnNfeGF0dHJfYWR2aXNlX3NldChGQURWSVNFX0NPTERfQklU
IHwgRkFEVklTRV9IT1RfQklUKQo+ID4gPiBDb3JyZWN0LCBJIG1pc3NlZCB0byBjaGVjayBiZWxv
dyBzdGF0ZW1lbnQuCj4gPiA+IAo+ID4gPiBuZXdfYWR2aXNlIHw9IG9sZF9hZHZpc2UgJiB+RkFE
VklTRV9NT0RJRklBQkxFX0JJVFM7Cj4gPiA+IAo+ID4gPiBBbnl3YXksIHRoZSBwYXRjaCBsb29r
cyBnb29kIHRvIG1lLgo+ID4gPiAKPiA+ID4gUmV2aWV3ZWQtYnk6IENoYW8gWXU8Y2hhb0BrZXJu
ZWwub3JnPgo+ID4gPiAKPiA+ID4gVGhhbmtzLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

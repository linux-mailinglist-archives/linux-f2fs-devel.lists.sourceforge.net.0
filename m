Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF087304AE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jun 2023 18:15:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9T9e-0005DN-BQ;
	Wed, 14 Jun 2023 16:15:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q9T9Y-0005DD-DY
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jun 2023 16:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ITsWHPcqYBqCwLy2a610/dHpb8eevdFsAMP5LJWEyy0=; b=epXCykSV7xQ2P6Zz3QE7PhxyL+
 un8ZDHi6L5NlARITT3WXrEvHDm1RKbSEFGhZj+X8zd7iigqSz3715IR03gnOBccOFUxOjfszvgaUO
 mZIuFA0zN9iNy9w/gWZkCDhInNJcJZGHoNdFPQ0D0bcQxjZ1DE6QrWNSx1lSZTtztdM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ITsWHPcqYBqCwLy2a610/dHpb8eevdFsAMP5LJWEyy0=; b=cuavgeNF9GnrwytgI5kWfG0xyP
 hv0IVdRmcgWUJhmaskGMyxtz3xR2JhaWN3VJy7MJelOVv1NWJgjaIcbgs176NE/dbWn4gociVi0ZE
 y5Y6iWBPHZYI9kF4U0117OmZGRQp2Y7Rih9NUeYFiOm9qCqtD7IXiEVndsFRVGV1hMF0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9T9Y-0036N5-1h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jun 2023 16:15:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6D4763DA6;
 Wed, 14 Jun 2023 16:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2BEC433CA;
 Wed, 14 Jun 2023 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686759318;
 bh=ALiqvTrUiF78xZAT3ENqThkml7MnOxz/bsc0SfoxxJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A5D52JYqrtR9DTkt6m3BRrO7Ci7aMZ+j5hxeykDkG9/BXruel/Lo3wcdLS163xY0W
 IkFOLWj+5Aq9EMUaEPw/vAbc4BWnXubUIlE7+cDgN7smvnEW7rWo/9IC5JmFbFoN+g
 0Z43hLXI8J6jP8G8cW4pYeV5ut+JdOK5Q3xl6sreaJJFfl7CipIFaiZD3cVVSDB4MS
 L8y2EBRcGdOqsICSlyXjFIiwnYDVrC9JyJEx8vZSrDfO1ka0syhGmmtNl3YzxJfyHC
 w4GxLrD7Qe5UUKJ2yF4iJupOGybF5PRL6eQZJXgLV3covxYf58/uVHVSOFft8qIWcH
 HCL0He1AIQKqg==
Date: Wed, 14 Jun 2023 09:15:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chunhai Guo <guochunhai@vivo.com>
Message-ID: <ZInnlBef7lNbBZbV@google.com>
References: <20230524024204.13694-1-guochunhai@vivo.com>
 <12df63c7-71b3-3223-b9fa-0dff6c1d6d14@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12df63c7-71b3-3223-b9fa-0dff6c1d6d14@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/14, Chunhai Guo wrote: > Hi Jaegeuk,
 > > Could you please
 help to confirm if this patch has been merged? I cannot see > the patch in
 the dev-test or dev branch. Thanks. Somehow it was dropped. I start to test
 again. Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9T9Y-0036N5-1h
Subject: Re: [f2fs-dev] [PATCH v8] fsck.f2fs: Detect and fix looped node
 chain efficiently
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 =?utf-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDYvMTQsIENodW5oYWkgR3VvIHdyb3RlOgo+IEhpIEphZWdldWssCj4gCj4gQ291bGQgeW91
IHBsZWFzZSBoZWxwIHRvIGNvbmZpcm0gaWYgdGhpcyBwYXRjaCBoYXMgYmVlbiBtZXJnZWQ/IEkg
Y2Fubm90IHNlZQo+IHRoZSBwYXRjaCBpbiB0aGUgZGV2LXRlc3Qgb3IgZGV2IGJyYW5jaC4KClRo
YW5rcy4gU29tZWhvdyBpdCB3YXMgZHJvcHBlZC4gSSBzdGFydCB0byB0ZXN0IGFnYWluLgoKPiAK
PiBUaGFua3MuCj4gCj4gT24gMjAyMy81LzI0IDEwOjQyLCDpg63nuq/mtbcgd3JvdGU6Cj4gPiBm
aW5kX2ZzeW5jX2lub2RlKCkgZGV0ZWN0IHRoZSBsb29wZWQgbm9kZSBjaGFpbiBieSBjb21wYXJp
bmcgdGhlIGxvb3AKPiA+IGNvdW50ZXIgd2l0aCBmcmVlIGJsb2Nrcy4gV2hpbGUgaXQgbWF5IHRh
a2UgdGVucyBvZiBzZWNvbmRzIHRvIHF1aXQgd2hlbgo+ID4gdGhlIGZyZWUgYmxvY2tzIGFyZSBs
YXJnZSBlbm91Z2guIFdlIGNhbiB1c2UgRmxveWQncyBjeWNsZSBkZXRlY3Rpb24KPiA+IGFsZ29y
aXRobSB0byBtYWtlIHRoZSBkZXRlY3Rpb24gbW9yZSBlZmZpY2llbnQsIGFuZCBmaXggdGhlIGlz
c3VlIGJ5Cj4gPiBmaWxsaW5nIGEgTlVMTCBhZGRyZXNzIGluIHRoZSBsYXN0IG5vZGUgb2YgdGhl
IGNoYWluLgo+ID4gCj4gPiBCZWxvdyBpcyB0aGUgbG9nIHdlIGVuY291bnRlciBvbiBhIDI1NkdC
IFVGUyBzdG9yYWdlIGFuZCBpdCB0YWtlcyBhYm91dAo+ID4gMjUgc2Vjb25kcyB0byBkZXRlY3Qg
bG9vcGVkIG5vZGUgY2hhaW4uIEFmdGVyIGNoYW5naW5nIHRoZSBhbGdvcml0aG0sIGl0Cj4gPiB0
YWtlcyBhYm91dCAyMG1zIHRvIGZpbmlzaCB0aGUgc2FtZSBqb2IuCj4gPiAKPiA+ICAgICAgWyAg
IDEwLjgyMjkwNF0gZnNjay5mMmZzOiBJbmZvOiB2ZXJzaW9uIHRpbWVzdGFtcCBjdXI6IDE3LCBw
cmV2OiA0MzAKPiA+ICAgICAgWyAgIDEwLjgyMjk0OV0gZnNjay5mMmZzOiBbdXBkYXRlX3N1cGVy
YmxvY2s6IDc2Ml0gSW5mbzogRG9uZSB0bwo+ID4gdXBkYXRlIHN1cGVyYmxvY2sKPiA+ICAgICAg
WyAgIDEwLjgyMjk1M10gZnNjay5mMmZzOiBJbmZvOiBzdXBlcmJsb2NrIGZlYXR1cmVzID0gMTQ5
OSA6Cj4gPiBlbmNyeXB0IHZlcml0eSBleHRyYV9hdHRyIHByb2plY3RfcXVvdGEgcXVvdGFfaW5v
IGNhc2Vmb2xkCj4gPiAgICAgIFsgICAxMC44MjI5NTZdIGZzY2suZjJmczogSW5mbzogc3VwZXJi
bG9jayBlbmNyeXB0IGxldmVsID0gMCwgc2FsdCA9Cj4gPiAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMAo+ID4gICAgICBbICAgMTAuODIyOTYwXSBmc2NrLmYyZnM6IEluZm86IHRvdGFs
IEZTIHNlY3RvcnMgPSA1OTI0OTgxMSAoMjMxNDQ0Cj4gPiBNQikKPiA+ICAgICAgWyAgIDM1Ljg1
MjgyN10gZnNjay5mMmZzOglkZXRlY3QgbG9vcGVkIG5vZGUgY2hhaW4sCj4gPiBibGthZGRyOjEx
MTQ4MDIsIG5leHQ6MTExNDgwMwo+ID4gICAgICBbICAgMzUuODUyODQyXSBmc2NrLmYyZnM6IFtm
MmZzX2RvX21vdW50OjM4NDZdIHJlY29yZF9mc3luY19kYXRhCj4gPiBmYWlsZWQKPiA+ICAgICAg
WyAgIDM1Ljg1NjEwNl0gZnNjay5mMmZzOiBmc2NrLmYyZnMgdGVybWluYXRlZCBieSBleGl0KDI1
NSkKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bmhhaSBHdW8gPGd1b2NodW5oYWlAdml2by5j
b20+Cj4gPiAtLS0KPiA+IHY3IC0+IHY4IDogUmVmb3JtYXQgdGhlIGNvZGUgdG8gcmVkdWNlIGlu
ZGVudGlvbi4KPiA+IHY2IC0+IHY3IDogQ29ycmVjdCBsb2dpYyBlcnJvciB0byBoYW5kbGUgaXNf
ZGV0ZWN0aW5nIHJldHVybiBieQo+ID4gCWZpbmRfbm9kZV9ibGtfZmFzdCgpLgo+ID4gdjUgLT4g
djYgOiBTaW1wbGlmeSB0aGUgY29kZSBieSByZW1vdmluZyB1bm5lY2Vzc2FyeSByZXRyeSBsb2dp
Yy4KPiA+IHY0IC0+IHY1IDogVXNlIElTX0lOT0RFKCkgdG8gbWFrZSB0aGUgY29kZSBtb3JlIGNs
ZWFyLgo+ID4gdjMgLT4gdjQgOiBTZXQgYy5idWdfb24gd2l0aCBBU1NFUlRfTVNHKCkgd2hlbiBp
c3N1ZSBpcyBkZXRlY3RlZCBhbmQgZml4Cj4gPiAJaXQgb25seSBpZiBjLmZpeF9vbiBpcyAxLgo+
ID4gdjIgLT4gdjMgOiBXcml0ZSBpbm9kZSB3aXRoIHdyaXRlX2lub2RlKCkgdG8gYXZvaWQgY2hr
c3VtIGJlaW5nIGJyb2tlbi4KPiA+IHYxIC0+IHYyIDogRml4IGxvb3BlZCBub2RlIGNoYWluIGRp
cmVjdGx5IGFmdGVyIGl0IGlzIGRldGVjdGVkLgo+ID4gLS0tCj4gPiAgIGZzY2svbW91bnQuYyB8
IDEyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL2ZzY2svbW91bnQuYyBiL2ZzY2svbW91bnQuYwo+ID4gaW5k
ZXggNGM3NDg4ODQwYzdjLi45ZDZhMjIyYTA1NWMgMTAwNjQ0Cj4gPiAtLS0gYS9mc2NrL21vdW50
LmMKPiA+ICsrKyBiL2ZzY2svbW91bnQuYwo+ID4gQEAgLTM1MTgsMjIgKzM1MTgsOTAgQEAgc3Rh
dGljIHZvaWQgZGVzdHJveV9mc3luY19kbm9kZXMoc3RydWN0IGxpc3RfaGVhZCAqaGVhZCkKPiA+
ICAgCQlkZWxfZnN5bmNfaW5vZGUoZW50cnkpOwo+ID4gICB9Cj4gPiArc3RhdGljIGludCBmaW5k
X25vZGVfYmxrX2Zhc3Qoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190ICpibGthZGRy
X2Zhc3QsCj4gPiArCQlzdHJ1Y3QgZjJmc19ub2RlICpub2RlX2Jsa19mYXN0LCBib29sICppc19k
ZXRlY3RpbmcpCj4gPiArewo+ID4gKwlpbnQgaSwgZXJyOwo+ID4gKwo+ID4gKwlmb3IgKGkgPSAw
OyBpIDwgMjsgaSsrKSB7Cj4gPiArCQlpZiAoIWYyZnNfaXNfdmFsaWRfYmxrYWRkcihzYmksICpi
bGthZGRyX2Zhc3QsIE1FVEFfUE9SKSkgewo+ID4gKwkJCSppc19kZXRlY3RpbmcgPSBmYWxzZTsK
PiA+ICsJCQlyZXR1cm4gMDsKPiA+ICsJCX0KPiA+ICsKPiA+ICsJCWVyciA9IGRldl9yZWFkX2Js
b2NrKG5vZGVfYmxrX2Zhc3QsICpibGthZGRyX2Zhc3QpOwo+ID4gKwkJaWYgKGVycikKPiA+ICsJ
CQlyZXR1cm4gZXJyOwo+ID4gKwo+ID4gKwkJaWYgKCFpc19yZWNvdmVyYWJsZV9kbm9kZShzYmks
IG5vZGVfYmxrX2Zhc3QpKSB7Cj4gPiArCQkJKmlzX2RldGVjdGluZyA9IGZhbHNlOwo+ID4gKwkJ
CXJldHVybiAwOwo+ID4gKwkJfQo+ID4gKwo+ID4gKwkJKmJsa2FkZHJfZmFzdCA9IG5leHRfYmxr
YWRkcl9vZl9ub2RlKG5vZGVfYmxrX2Zhc3QpOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJldHVybiAw
Owo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IGxvb3Bfbm9kZV9jaGFpbl9maXgoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gKwkJYmxvY2tfdCBibGthZGRyX2Zhc3QsIHN0cnVjdCBm
MmZzX25vZGUgKm5vZGVfYmxrX2Zhc3QsCj4gPiArCQlibG9ja190IGJsa2FkZHIsIHN0cnVjdCBm
MmZzX25vZGUgKm5vZGVfYmxrKQo+ID4gK3sKPiA+ICsJYmxvY2tfdCBibGthZGRyX2VudHJ5LCBi
bGthZGRyX3RtcDsKPiA+ICsJaW50IGVycjsKPiA+ICsKPiA+ICsJLyogZmluZCB0aGUgZW50cnkg
cG9pbnQgb2YgdGhlIGxvb3BlZCBub2RlIGNoYWluICovCj4gPiArCXdoaWxlIChibGthZGRyX2Zh
c3QgIT0gYmxrYWRkcikgewo+ID4gKwkJZXJyID0gZGV2X3JlYWRfYmxvY2sobm9kZV9ibGtfZmFz
dCwgYmxrYWRkcl9mYXN0KTsKPiA+ICsJCWlmIChlcnIpCj4gPiArCQkJcmV0dXJuIGVycjsKPiA+
ICsJCWJsa2FkZHJfZmFzdCA9IG5leHRfYmxrYWRkcl9vZl9ub2RlKG5vZGVfYmxrX2Zhc3QpOwo+
ID4gKwo+ID4gKwkJZXJyID0gZGV2X3JlYWRfYmxvY2sobm9kZV9ibGssIGJsa2FkZHIpOwo+ID4g
KwkJaWYgKGVycikKPiA+ICsJCQlyZXR1cm4gZXJyOwo+ID4gKwkJYmxrYWRkciA9IG5leHRfYmxr
YWRkcl9vZl9ub2RlKG5vZGVfYmxrKTsKPiA+ICsJfQo+ID4gKwlibGthZGRyX2VudHJ5ID0gYmxr
YWRkcjsKPiA+ICsKPiA+ICsJLyogZmluZCB0aGUgbGFzdCBub2RlIG9mIHRoZSBjaGFpbiAqLwo+
ID4gKwlkbyB7Cj4gPiArCQlibGthZGRyX3RtcCA9IGJsa2FkZHI7Cj4gPiArCQllcnIgPSBkZXZf
cmVhZF9ibG9jayhub2RlX2JsaywgYmxrYWRkcik7Cj4gPiArCQlpZiAoZXJyKQo+ID4gKwkJCXJl
dHVybiBlcnI7Cj4gPiArCQlibGthZGRyID0gbmV4dF9ibGthZGRyX29mX25vZGUobm9kZV9ibGsp
Owo+ID4gKwl9IHdoaWxlIChibGthZGRyICE9IGJsa2FkZHJfZW50cnkpOwo+ID4gKwo+ID4gKwkv
KiBmaXggdGhlIGJsa2FkZHIgb2YgbGFzdCBub2RlIHdpdGggTlVMTF9BRERSLiAqLwo+ID4gKwlu
b2RlX2Jsay0+Zm9vdGVyLm5leHRfYmxrYWRkciA9IE5VTExfQUREUjsKPiA+ICsJaWYgKElTX0lO
T0RFKG5vZGVfYmxrKSkKPiA+ICsJCWVyciA9IHdyaXRlX2lub2RlKG5vZGVfYmxrLCBibGthZGRy
X3RtcCk7Cj4gPiArCWVsc2UKPiA+ICsJCWVyciA9IGRldl93cml0ZV9ibG9jayhub2RlX2Jsaywg
YmxrYWRkcl90bXApOwo+ID4gKwlpZiAoIWVycikKPiA+ICsJCUZJWF9NU0coIkZpeCBsb29wZWQg
bm9kZSBjaGFpbiBvbiBibGthZGRyICV1XG4iLAo+ID4gKwkJCQlibGthZGRyX3RtcCk7Cj4gPiAr
CXJldHVybiBlcnI7Cj4gPiArfQo+ID4gKwo+ID4gICBzdGF0aWMgaW50IGZpbmRfZnN5bmNfaW5v
ZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkKQo+ID4g
ICB7Cj4gPiAgIAlzdHJ1Y3QgY3Vyc2VnX2luZm8gKmN1cnNlZzsKPiA+IC0Jc3RydWN0IGYyZnNf
bm9kZSAqbm9kZV9ibGs7Cj4gPiAtCWJsb2NrX3QgYmxrYWRkcjsKPiA+IC0JdW5zaWduZWQgaW50
IGxvb3BfY250ID0gMDsKPiA+IC0JdW5zaWduZWQgaW50IGZyZWVfYmxvY2tzID0gTUFJTl9TRUdT
KHNiaSkgKiBzYmktPmJsb2Nrc19wZXJfc2VnIC0KPiA+IC0JCQkJCQlzYmktPnRvdGFsX3ZhbGlk
X2Jsb2NrX2NvdW50Owo+ID4gKwlzdHJ1Y3QgZjJmc19ub2RlICpub2RlX2JsaywgKm5vZGVfYmxr
X2Zhc3Q7Cj4gPiArCWJsb2NrX3QgYmxrYWRkciwgYmxrYWRkcl9mYXN0Owo+ID4gKwlib29sIGlz
X2RldGVjdGluZyA9IHRydWU7Cj4gPiAgIAlpbnQgZXJyID0gMDsKPiA+ICsJbm9kZV9ibGsgPSBj
YWxsb2MoRjJGU19CTEtTSVpFLCAxKTsKPiA+ICsJbm9kZV9ibGtfZmFzdCA9IGNhbGxvYyhGMkZT
X0JMS1NJWkUsIDEpOwo+ID4gKwlBU1NFUlQobm9kZV9ibGsgJiYgbm9kZV9ibGtfZmFzdCk7Cj4g
PiArCj4gPiAgIAkvKiBnZXQgbm9kZSBwYWdlcyBpbiB0aGUgY3VycmVudCBzZWdtZW50ICovCj4g
PiAgIAljdXJzZWcgPSBDVVJTRUdfSShzYmksIENVUlNFR19XQVJNX05PREUpOwo+ID4gICAJYmxr
YWRkciA9IE5FWFRfRlJFRV9CTEtBRERSKHNiaSwgY3Vyc2VnKTsKPiA+IC0KPiA+IC0Jbm9kZV9i
bGsgPSBjYWxsb2MoRjJGU19CTEtTSVpFLCAxKTsKPiA+IC0JQVNTRVJUKG5vZGVfYmxrKTsKPiA+
ICsJYmxrYWRkcl9mYXN0ID0gYmxrYWRkcjsKPiA+ICAgCXdoaWxlICgxKSB7Cj4gPiAgIAkJc3Ry
dWN0IGZzeW5jX2lub2RlX2VudHJ5ICplbnRyeTsKPiA+IEBAIC0zNTY0LDE5ICszNjMyLDQ4IEBA
IHN0YXRpYyBpbnQgZmluZF9mc3luY19pbm9kZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0
cnVjdCBsaXN0X2hlYWQgKmhlYWQpCj4gPiAgIAkJaWYgKElTX0lOT0RFKG5vZGVfYmxrKSAmJiBp
c19kZW50X2Rub2RlKG5vZGVfYmxrKSkKPiA+ICAgCQkJZW50cnktPmxhc3RfZGVudHJ5ID0gYmxr
YWRkcjsKPiA+ICAgbmV4dDoKPiA+IC0JCS8qIHNhbml0eSBjaGVjayBpbiBvcmRlciB0byBkZXRl
Y3QgbG9vcGVkIG5vZGUgY2hhaW4gKi8KPiA+IC0JCWlmICgrK2xvb3BfY250ID49IGZyZWVfYmxv
Y2tzIHx8Cj4gPiAtCQkJYmxrYWRkciA9PSBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsaykp
IHsKPiA+IC0JCQlNU0coMCwgIlx0ZGV0ZWN0IGxvb3BlZCBub2RlIGNoYWluLCBibGthZGRyOiV1
LCBuZXh0OiV1XG4iLAo+ID4gLQkJCQkgICAgYmxrYWRkciwKPiA+IC0JCQkJICAgIG5leHRfYmxr
YWRkcl9vZl9ub2RlKG5vZGVfYmxrKSk7Cj4gPiArCQlibGthZGRyID0gbmV4dF9ibGthZGRyX29m
X25vZGUobm9kZV9ibGspOwo+ID4gKwo+ID4gKwkJLyogQmVsb3cgd2Ugd2lsbCBkZXRlY3QgbG9v
cGVkIG5vZGUgY2hhaW4gd2l0aCBGbG95ZCdzIGN5Y2xlCj4gPiArCQkgKiBkZXRlY3Rpb24gYWxn
b3JpdGhtLgo+ID4gKwkJICovCj4gPiArCQlpZiAoIWlzX2RldGVjdGluZykKPiA+ICsJCQljb250
aW51ZTsKPiA+ICsKPiA+ICsJCWVyciA9IGZpbmRfbm9kZV9ibGtfZmFzdChzYmksICZibGthZGRy
X2Zhc3QsCj4gPiArCQkJCW5vZGVfYmxrX2Zhc3QsICZpc19kZXRlY3RpbmcpOwo+ID4gKwkJaWYg
KGVycikKPiA+ICsJCQlicmVhazsKPiA+ICsKPiA+ICsJCWlmICghaXNfZGV0ZWN0aW5nKQo+ID4g
KwkJCWNvbnRpbnVlOwo+ID4gKwo+ID4gKwkJaWYgKGJsa2FkZHJfZmFzdCAhPSBibGthZGRyKQo+
ID4gKwkJCWNvbnRpbnVlOwo+ID4gKwo+ID4gKwkJQVNTRVJUX01TRygiXHRkZXRlY3QgbG9vcGVk
IG5vZGUgY2hhaW4sIGJsa2FkZHI6JXVcbiIsCj4gPiArCQkJCWJsa2FkZHIpOwo+ID4gKwo+ID4g
KwkJaWYgKCFjLmZpeF9vbikgewo+ID4gICAJCQllcnIgPSAtMTsKPiA+ICAgCQkJYnJlYWs7Cj4g
PiAgIAkJfQo+ID4gLQkJYmxrYWRkciA9IG5leHRfYmxrYWRkcl9vZl9ub2RlKG5vZGVfYmxrKTsK
PiA+ICsJCWVyciA9IGxvb3Bfbm9kZV9jaGFpbl9maXgoc2JpLAo+ID4gKwkJCQlORVhUX0ZSRUVf
QkxLQUREUihzYmksIGN1cnNlZyksCj4gPiArCQkJCW5vZGVfYmxrX2Zhc3QsIGJsa2FkZHIsIG5v
ZGVfYmxrKTsKPiA+ICsJCWlmIChlcnIpCj4gPiArCQkJYnJlYWs7Cj4gPiArCj4gPiArCQkvKiBT
aW5jZSB3ZSBjYWxsIGdldF9mc3luY19pbm9kZSgpIHRvIGVuc3VyZSB0aGVyZSBhcmUgbm8KPiA+
ICsJCSAqIGR1cGxpY2F0ZSBpbm9kZXMgaW4gdGhlIGlub2RlX2xpc3QgZXZlbiBpZiB0aGVyZSBh
cmUKPiA+ICsJCSAqIGR1cGxpY2F0ZSBibGthZGRyLCB3ZSBjYW4gY29udGludWUgcnVubmluZyBh
ZnRlciBmaXhpbmcgdGhlCj4gPiArCQkgKiBsb29wZWQgbm9kZSBjaGFpbi4KPiA+ICsJCSAqLwo+
ID4gKwkJaXNfZGV0ZWN0aW5nID0gZmFsc2U7Cj4gPiAgIAl9Cj4gPiArCWZyZWUobm9kZV9ibGtf
ZmFzdCk7Cj4gPiAgIAlmcmVlKG5vZGVfYmxrKTsKPiA+ICAgCXJldHVybiBlcnI7Cj4gPiAgIH0K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==

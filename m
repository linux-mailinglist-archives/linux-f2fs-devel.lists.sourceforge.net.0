Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B327830FC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Aug 2023 21:37:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qYAiQ-0000dK-4a;
	Mon, 21 Aug 2023 19:37:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qYAiO-0000dA-Rl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 19:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SKirFbwzHcq2vl0GeekKRpqTTs5O42T06+eRSrpDBU0=; b=YVoL7gO1aw897ggGu8ghtboLKX
 PvRNWUGmEz9wMKcdfikCJYUapmH9LhG3viZmKuvLfB4uq+vK4E9sm8lEW/PoGdBnKKKkZEs4ENH/4
 sqC+i09ZjztsPJjKihVRmFjl1rK860NquVsZgneQdnL6tMyAK+h7cbzbYE4/xhzBFb/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SKirFbwzHcq2vl0GeekKRpqTTs5O42T06+eRSrpDBU0=; b=WR7kSEpRjym1PsI4WfIUybSdsC
 ZA0vvRFr0QuAEr5EhYIdBGxiCdHD0/7dXUJFJ6UelItl/tzVms6l57QRQOyOK78rvMqJChdKB/29x
 Ll78puAN+jj6imDu601uK3JeO+Lw9AdTqKgBx+ztp2L9EsFoa4HqHGSb0ZpTXlCOxraw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qYAiM-00BgKj-AY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 19:37:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACCAB63AC3;
 Mon, 21 Aug 2023 19:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31FCC433C7;
 Mon, 21 Aug 2023 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692646634;
 bh=pa2w5QguPjZl1Tc/zRZDdLnQ5jOQIfYoqd91HtNanlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oAFA0w11jOmVaZKjW3BqsiuaB6UW2PYswuDQQok3aepwIxf6lQkoLvsTO0lImJooh
 aJ4+zKg5dY/nJiX23RuX6bVAdpMg+Ce5VuO5FPdV82clJ7viz8PbQCYdYHHUDaxhk/
 /yv7Z5W+h9vgCi6KUqLx83tWykJwxkYBYJdYjlAHE85Dw9NOgFeNlksugemnB+3gl9
 ypS9ASq+kSTunw3BjUOlxekcZ0kpwIxvHi1Wwk2gx73d1SOm9PdJB8IALxI8g7P/Hq
 6HVR+fOd8ZuY0HCt9R5Ojd6U03WFsoaSBz2WjPhWM7fE9m3DeIfemQtqilk0YfBT/f
 dIavANTz0gwog==
Date: Mon, 21 Aug 2023 12:37:12 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ZOO86IYpjfnidag6@google.com>
References: <ae78956b-0c55-4980-8ec4-5cccf7e69c16@roeck-us.net>
 <CAOtxgyeE+PLWVCTMHbr6OgwXY5MB1vPmauY2wcvEZdW8OhM-YQ@mail.gmail.com>
 <93fee6c4-fb2b-49eb-ab54-e77603289f6a@roeck-us.net>
 <CAOtxgychpamcvMDtOcX=ZGsL8WPfYfLAjCRg-YAnEHYDBva+7g@mail.gmail.com>
 <63722b9f-b510-50a7-8839-6ada783d2164@kernel.org>
 <20230817155319.GA1483@sol.localdomain>
 <700c2e58-d2fe-47c6-85a8-aa7f7b1613cf@roeck-us.net>
 <CAOtxgyedoExF5yfJO6BkU6fYjJMpfJBDuEuG_2rjyT7o9qcX4Q@mail.gmail.com>
 <ZOAOTcUAskB+F5ez@google.com>
 <22fab316-237c-4363-b968-96e8307cdd59@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22fab316-237c-4363-b968-96e8307cdd59@roeck-us.net>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/18, Guenter Roeck wrote: > On Fri, Aug 18,
 2023 at 05:35:25PM -0700,
 Jaegeuk Kim wrote: > > May I know if this works? > > > >
 https://lore.kernel.org/linux-f2fs-devel/20230819003012.3473675-1-ja
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYAiM-00BgKj-AY
Subject: Re: [f2fs-dev] circular locking dependency warning in f2fs
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDgvMTgsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMTgsIDIwMjMgYXQg
MDU6MzU6MjVQTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPiBNYXkgSSBrbm93IGlmIHRo
aXMgd29ya3M/Cj4gPiAKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2
ZWwvMjAyMzA4MTkwMDMwMTIuMzQ3MzY3NS0xLWphZWdldWtAa2VybmVsLm9yZy9ULyN1Cj4gPiAK
PiAKPiBZZXMsIHRoYXQgZml4ZXMgdGhlIHByb2JsZW0gZm9yIG1lLiBUaGF0IG1ha2VzIG1lIHdv
bmRlciwgdGhvdWdoOgo+IFdoeSBub3QganVzdCB1c2UgdGhlIF9uZXN0ZWQgZnVuY3Rpb25zIHVu
Y29uZGl0aW9uYWxseSA/CgpJIHRoaW5rIHdlIHNob3VsZCBpZ25vcmUgdGhhdCBpbiB0aGlzIGNh
c2Ugb25seS4KCj4gCj4gVGhhbmtzLAo+IEd1ZW50ZXIKPiAKPiA+IE9uIDA4LzE4LCBKYWVnZXVr
IEtpbSB3cm90ZToKPiA+ID4gQ2hhbywKPiA+ID4gCj4gPiA+IERvIHlvdSBoYXZlIHNvbWUgYmFu
ZHdpZHRoIHRvIGFkZHJlc3MgdGhpcz8gT3RoZXJ3aXNlLCBJJ2xsIGRvIHNvbWUuCj4gPiA+IAo+
ID4gPiBUaGFua3MsCj4gPiA+IAo+ID4gPiBPbiBGcmksIEF1ZyAxOCwgMjAyMyBhdCA2OjE14oCv
QU0gR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90ZToKPiA+ID4gPgo+ID4g
PiA+IE9uIFRodSwgQXVnIDE3LCAyMDIzIGF0IDA4OjUzOjE5QU0gLTA3MDAsIEVyaWMgQmlnZ2Vy
cyB3cm90ZToKPiA+ID4gPiA+IE9uIFRodSwgQXVnIDE3LCAyMDIzIGF0IDEwOjI2OjEyUE0gKzA4
MDAsIENoYW8gWXUgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrKG5ld19pbm9kZSMyLT5pX3NlbSkK
PiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxvY2soZGlyLT5pX3hhdHRyX3NlbSkKPiA+ID4gPiA+ID4gPiA+ID4gbG9j
ayhuZXdfaW5vZGUjMS0+aV9zZW0pCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+
IFRoaXMgbG9va3MgZmluZSB0byBtZS4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gPiBCYXNlZCBvbiB5b3VyIGZlZWRiYWNrLCBhbSBJIGNvcnJlY3QgYXNz
dW1pbmcgdGhhdCB5b3UgZG9uJ3QgcGxhbgo+ID4gPiA+ID4gPiA+ID4gdG8gZml4IHRoaXMgPwo+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSSdtIHF1aXRlIG9wZW4gdG8gc29tZXRoaW5nIHRo
YXQgSSBtYXkgbWlzcy4gQ2hhbywgd2hhdCBkbyB5b3UgdGhpbms/Cj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IEphZWdldWssIEkgYWdyZWUgd2l0aCB5b3UsIGl0IGxvb2tzIGxpa2UgYSBmYWxzZSBh
bGFybS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBGYWxzZSBwb3NpdGl2ZSBsb2Nr
ZGVwIHJlcG9ydHMgc3RpbGwgbmVlZCB0byBiZSBlbGltaW5hdGVkLCBmb3IgZXhhbXBsZSBieQo+
ID4gPiA+ID4gZml4aW5nIHRoZSBsb2NrZGVwIGFubm90YXRpb25zLiAgT3RoZXJ3aXNlIGl0J3Mg
aW1wb3NzaWJsZSB0byBkaXN0aW5ndWlzaCB0aGVtCj4gPiA+ID4gPiBmcm9tIHRydWUgcG9zaXRp
dmVzLgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEV4YWN0bHksIGFuZCB0aGF0IGlzIHdoeSBJ
IGRvbid0IHRlc3QgZmVhdHVyZXMgd2l0aCBrbm93biBsb2NrZGVwIGFubm90YXRpb24KPiA+ID4g
PiBpc3N1ZXMuIEknbGwgZHJvcCBmMmZzIGZyb20gbXkgbGlzdCBvZiBmZWF0dXJlcyB0byB0ZXN0
IGZvciB0aGUgdGltZSBiZWluZy4KPiA+ID4gPgo+ID4gPiA+IEd1ZW50ZXIKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

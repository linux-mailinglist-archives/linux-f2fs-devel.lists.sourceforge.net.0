Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B996327045
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Feb 2021 05:53:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGE4h-00060l-OY; Sun, 28 Feb 2021 04:52:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lGE4g-00060G-7G
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Feb 2021 04:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qu1td/Jn27TzGu8aY3Kazr0TbCjq4IzdD5q9/9nFniw=; b=jhCZCt+guhZTsWvPgm1bdm3Axd
 VrMkUwiVUR5wr13fVnTsjnK6eIz/LJi9iQngpctkOZX/vvskoz8FAICeMPk3VXnR/DqGUjS20ShGi
 UgrG76YZjxVkBAP5Kd6fS2MXuWHM9MdU3dIDY0YU7U9I5eWXzIfTj4CGo6e2xovLc190=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qu1td/Jn27TzGu8aY3Kazr0TbCjq4IzdD5q9/9nFniw=; b=dWhWq+yi4IXxNESyC4jcLqHCZy
 VBa1WIZl97jBB0YcUZYbgYLRvlEhUtArgVcnr73K4CxBK/8gvp2CiTzo6pfXa3esasByOZfcZMiXS
 KB7HD0KF7FH0H3AkJ1UL7YpKTTwAKvZStYgojXO3hf4usKTf4B5bwhtP9aHbR9KeActs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lGE4V-0005ft-35
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Feb 2021 04:52:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98E9D64E10;
 Sun, 28 Feb 2021 04:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614487955;
 bh=TPuIvHd6Bs3bRcf4BzsMlYT1Gou/E7eosJtAO9spevc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWT16qHiyEgYEN0ob4FNSqQgnCfQ43mP460op4rpQT66dn4Fgs7IsUpqLG2JNYtDy
 lyTR/iNVLSrRWSzYlY2V6Hbv09osFS66gmwtmch8TPIB2U8morsrtYSSRK61UNk0bW
 koQt8M22CxbzZBby7YoAlZVS9w1roVZXprnWrOYpE1ykxHUGfW98OxtaZGDbbQXER7
 K3MtK7AdhMjg7M0pr11zcGILqHTaddZGeGEbZxoSP0ezV7FYO1SIBsr0Lcngk7JU0Q
 W2DcSSDKOpezdbVlCe4Knz4sCn3RKOCl9S6Eobzr/W0lf8hFBiNj/HdVkjapTh2tsH
 bZeaSrB1i/Slg==
Date: Sat, 27 Feb 2021 20:52:34 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YDshkqMPGk3iY2YO@google.com>
References: <20210223112425.19180-1-heyunlei@hihonor.com>
 <c1ce1421-2576-5b48-322c-fa682c7510d7@kernel.org>
 <YDbbGSsd6ibKOpzT@sol.localdomain>
 <YDbdEEcEV5bzgtL6@sol.localdomain>
 <fae4a2f9-b1c9-e673-cefe-fe024ce6f9ab@hihonor.com>
 <YDhZuaF8lEQPtBmp@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDhZuaF8lEQPtBmp@sol.localdomain>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hihonor.com]
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lGE4V-0005ft-35
Subject: Re: [f2fs-dev] [PATCH] f2fs: fsverity: Truncate cache pages if set
 verity failed
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
Cc: linux-fscrypt@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgWXVubGVpLAoKQ291bGQgeW91IHBsZWFzZSBwb3N0IGFub3RoZXIgdmVyc2lvbiB0byBoYXZl
IGFsbCB0aGUgc3VnZ2VzdGlvbnM/IDopCgpUaGFua3MsCgpPbiAwMi8yNSwgRXJpYyBCaWdnZXJz
IHdyb3RlOgo+IE9uIEZyaSwgRmViIDI2LCAyMDIxIGF0IDA5OjQyOjMzQU0gKzA4MDAsIGhleXVu
bGVpIDAwMDE1NTMxIHdyb3RlOgo+ID4gCj4gPiDlnKggMjAyMS8yLzI1IDc6MTEsIEVyaWMgQmln
Z2VycyDlhpnpgZM6Cj4gPiA+IE9uIFdlZCwgRmViIDI0LCAyMDIxIGF0IDAzOjAyOjUyUE0gLTA4
MDAsIEVyaWMgQmlnZ2VycyB3cm90ZToKPiA+ID4gPiBIaSBZdW5sZWksCj4gPiA+ID4gCj4gPiA+
ID4gT24gV2VkLCBGZWIgMjQsIDIwMjEgYXQgMDk6MTY6MjRQTSArMDgwMCwgQ2hhbyBZdSB3cm90
ZToKPiA+ID4gPiA+IEhpIFl1bmxlaSwKPiA+ID4gPiA+IAo+ID4gPiA+ID4gT24gMjAyMS8yLzIz
IDE5OjI0LCBoZXl1bmxlaSB3cm90ZToKPiA+ID4gPiA+ID4gSWYgZmlsZSBlbmFibGUgdmVyaXR5
IGZhaWxlZCwgc2hvdWxkIHRydW5jYXRlIGFueXRoaW5nIHdyb3RlCj4gPiA+ID4gPiA+IHBhc3Qg
aV9zaXplLCBpbmNsdWRpbmcgY2FjaGUgcGFnZXMuCj4gPiA+ID4gPiArQ2MgRXJpYywKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gQWZ0ZXIgZmFpbHVyZSBvZiBlbmFibGluZyB2ZXJpdHksIHdlIHdpbGwg
c2VlIHZlcml0eSBtZXRhZGF0YSBpZiB3ZSB0cnVuY2F0ZQo+ID4gPiA+ID4gZmlsZSB0byBsYXJn
ZXIgc2l6ZSBsYXRlcj8KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhhbmtzLAo+ID4gSGkgRXJpY++8
jAo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBoZXl1bmxlaSA8aGV5dW5sZWlAaGlob25vci5j
b20+Cj4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAgICBmcy9mMmZzL3Zlcml0eS5jIHwgNCAr
KystCj4gPiA+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3Zl
cml0eS5jIGIvZnMvZjJmcy92ZXJpdHkuYwo+ID4gPiA+ID4gPiBpbmRleCAwNTRlYzg1MmI1ZWEu
LmYxZjliOTM2MWE3MSAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvZnMvZjJmcy92ZXJpdHkuYwo+
ID4gPiA+ID4gPiArKysgYi9mcy9mMmZzL3Zlcml0eS5jCj4gPiA+ID4gPiA+IEBAIC0xNzAsOCAr
MTcwLDEwIEBAIHN0YXRpYyBpbnQgZjJmc19lbmRfZW5hYmxlX3Zlcml0eShzdHJ1Y3QgZmlsZSAq
ZmlscCwgY29uc3Qgdm9pZCAqZGVzYywKPiA+ID4gPiA+ID4gICAgCX0KPiA+ID4gPiA+ID4gICAg
CS8qIElmIHdlIGZhaWxlZCwgdHJ1bmNhdGUgYW55dGhpbmcgd2Ugd3JvdGUgcGFzdCBpX3NpemUu
ICovCj4gPiA+ID4gPiA+IC0JaWYgKGRlc2MgPT0gTlVMTCB8fCBlcnIpCj4gPiA+ID4gPiA+ICsJ
aWYgKGRlc2MgPT0gTlVMTCB8fCBlcnIpIHsKPiA+ID4gPiA+ID4gKwkJdHJ1bmNhdGVfaW5vZGVf
cGFnZXMoaW5vZGUtPmlfbWFwcGluZywgaW5vZGUtPmlfc2l6ZSk7Cj4gPiA+ID4gPiA+ICAgIAkJ
ZjJmc190cnVuY2F0ZShpbm9kZSk7Cj4gPiA+ID4gPiA+ICsJfQo+ID4gPiA+ID4gPiAgICAJY2xl
YXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfVkVSSVRZX0lOX1BST0dSRVNTKTsKPiA+ID4gPiA+ID4g
Cj4gPiBCeSB0aGUgd2F577yMc2hvdWxkwqAgd2UgY29uc2lkZXLCoCBzZXQgeGF0dHIgZmFpbGVk
Pwo+ID4gCj4gCj4gWWVzLCB0aGF0IHNlZW1zIHRvIGJlIGFub3RoZXIgb3ZlcnNpZ2h0LiAgU2lt
aWxhcmx5IGZvciBleHQ0LCBpZgo+IGV4dDRfam91cm5hbF9zdGFydCgpLCBleHQ0X29ycGhhbl9k
ZWwoKSwgb3IgZXh0NF9yZXNlcnZlX2lub2RlX3dyaXRlKCkgZmFpbHMuCj4gCj4gSSB0aGluayB0
aGUgcmlnaHQgZml4IGlzIHRvIG1vdmUgdGhlIHRydW5jYXRpb24gdG8gdGhlIGVuZCBvZiB0aGUg
ZnVuY3Rpb24uCj4gCj4gLSBFcmljCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

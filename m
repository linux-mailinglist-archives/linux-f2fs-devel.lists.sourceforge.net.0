Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 432052D61AD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 17:23:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knOj8-0005F5-Sz; Thu, 10 Dec 2020 16:23:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1knOiv-0005Ee-IG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 16:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cIpidYTKOwySGuqUJqM5+0uhel2eFuJsMmxQCgdYCYs=; b=cSc3Aa/6NRFMm0+TZABVU9LsHK
 ohALmmvP8pbN5PY2PpPxooi8f4r+sthuZc3zgbRDwXcjeCP8lUIJi5kv03mp6oGFDA+WPDyOzLQTm
 vPVVJCydjqF0yesQa+MHduFj4P0vpOBBjwo0G/+MS6A9POBlrEVz2umr45GuGyna+Vl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cIpidYTKOwySGuqUJqM5+0uhel2eFuJsMmxQCgdYCYs=; b=SBwiu2FsM36yLSjnrfU3xuNh6C
 TinwTOqPiH9TAgpraT6hFgTEQ3uVoU2EJZsNzboZ7SlFZIWDlc9XS7s05LMFp3T3U7jh58h1uh/pT
 vqlObj9RiSePvsSVcdlT/evUVVlGEw1BDda7xssnNg/PXzB9A1IGCoWcyBH2/Wu3Mfm8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1knOir-006h8D-7d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 16:23:21 +0000
Date: Thu, 10 Dec 2020 08:22:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607617378;
 bh=IT1JhMouVay4d31+Gw+I77QyHRv1BMMQHowugQ1EGS8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uo0NiqgPB/g8PXQKQB1ZRC1Telxr2qFG92011hQ3lHonyXSLgYaxJq158mhIWfKFZ
 HicY16RuNTpihqbB3lhvS5B0lT793phbiG+v82xkBK1sIb8kLIzpluOrHO22KhaZP1
 DMdphQ8Mw7oe9cn5SrVx0/YisG6MS7RKeVcA6cxHhknAWBvUgwYMcMYhr7oDZM0SgA
 Y0ktr1nILe/+Q2OEkkH/dGG14TWxGtPvQiVAUXuoW90aD4J+x1xMWpI/d8feiMhHrd
 Z2waf0JVIn1DUdrZv/Gp1EWiXCpAIigqyCyqM9EaGykgMQWUtnbwaZSFW6wO1QSxmw
 hOG5IHCWpQ4Wg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: =?utf-8?B?5b6Q55Ge5paM?= <robinh3123@gmail.com>
Message-ID: <X9JLYADc4+lF53gG@google.com>
References: <20201208081555.652932-1-robinh3123@gmail.com>
 <20201208081555.652932-3-robinh3123@gmail.com>
 <785e9f0a-c3d6-9cc5-f17a-a3cc58a43a0f@huawei.com>
 <CAKnFrsLmEROi+ZwVCmoC=W7u+rVoZfWGC9Lr9_y=oLMUZMw63Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKnFrsLmEROi+ZwVCmoC=W7u+rVoZfWGC9Lr9_y=oLMUZMw63Q@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1knOir-006h8D-7d
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs-tools:sload.f2fs compression
 support
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

T24gMTIvMTAsIOW+kOeRnuaWjCB3cm90ZToKPiBIaSwgSmFlZ2V1aywKPiAKPiBJIGNvbW1lbnQg
aGVyZSB0aGUgcGF0Y2ggeW91ciBwcm92aWRlZCAoMyBwYXJ0cywgc2luY2UgdGhlIHBhdGNoIGNv
bnRhaW5zIDMKPiBmaXhlcyk6Cj4gMS4gICsgICAgICAgZG4tPmRhdGFfYmxrYWRkciA9IGJsa2Fk
ZHI7Cj4gICAgICAgICByZXQgPSByZXNlcnZlX25ld19ibG9jayhzYmksICZkbi0+ZGF0YV9ibGth
ZGRyLCAmc3VtLCB0eXBlLCAwKTsKPiAKPiBXZSBjYW5ub3QgYXNzaWduIGRuLT5kYXRhX2Jsa2Fk
ZHIgaGVyZS4gIFRoZSBvbGQgb25lIGlzIHRvIGJlIHVzZWQgaW4KPiByZXNlcnZlX25ld19ibG9j
aygpIGZ1bmN0aW9uLiAgQWxzbywgcmVzZXJ2ZV9uZXdfYmxvY2soKSBmdW5jdGlvbiBhY3R1YWxs
eQo+IHdpbGwgc2V0IGRuLT5kYXRhX2Jsa2FkZHIgdG8gYmxrYWRkciBpbiB0aGUgZW5kLgoKVGhp
cyB0cmllcyB0byBhdm9pZCBkZWxldGluZyB0aGUgYmxvY2sgYWRkcmVzcyB1c2VkIGluIHRoZSBw
cmV2aW91cyBvZmZzZXQuCk90aGVyd2lzZSwgd2UnbGwgc2VlIHdyb25nIGlfYmxvY2tzLgoKPiAK
PiAyLiAgIEFkZGVkIGNvbmRpdGlvbiAibiA8ICgxIDw8IGMuc2xkY19jYy5sb2dfY2x1c3Rlcl9z
aXplKSAqIEJMT0NLX1NaIgo+IAo+IFRoZSBzZW1hbnRpYyBtZWFuaW5nIG9mIHRoZSB3aG9sZSBp
ZiBzdGF0ZW1lbnQgaXMgdG8gc2F5Ogo+ICAgIFdoZW4gdGhlIGNvbXByZXNzaW9uIGZhaWwgKHJl
dCAgIT0gMCkgb3IgdGhlIG9yaWdpbmFsIHJlYWQgc2l6ZSBpcwo+IHNtYWxsZXIgdGhhbiB0aGUg
Y29tcHJlc3NlZCBzaXplIHBsdXMgKHRoZSBtaW5pbXVtIGJsb2NrIHNhdmVkIChzcGVjaWZpZWQK
PiBieSB0aGUgdXNlcikgeCBibG9jayBzaXplKSwgd2Ugd2lsbCBub3QgZG8gY29tcHJlc3Npb24g
YnV0IGp1c3Qgd3JpdGUgdGhlCj4gZGF0YSBhcyBpcy4KClRoaXMgaXMgbWlzc2luZyB0aGUgbGFz
dCBibG9jayBoYXZpbmcgPCA0S2IuCgo+IAo+IFRoZSByaWdodCBoYW5kIHNpZGUgKFJIUykgb2Yg
eW91ciBhZGRlZCBjb25kaXRpb24gaXMgZXhhY3RseSB0aGUgcmVhZCBzaXplLAo+IGkuZS4gdGhl
IGNsdXN0ZXIgc2l6ZS4gIFRoYXQgbWVhbnMgdGhlIGNvbmRpdGlvbiBpcyBhbHdheXMgZmFsc2Ug
ZXhjZXB0IHRoZQo+IHJlYWQgb2YgdGhlIGxhc3QgcGFydCBvZiB0aGUgZmlsZSwgd2hlbiB0aGUg
ZmlsZSBzaXplIGlzIG5vdCBleGFjdGx5IHRoZQo+IG11bHRpcGxlIG9mIHRoZSBjbHVzdGVyIHNp
emUuICBUaGF0IG1lYW5zIHdlIHdpbGwgbmV2ZXIgdHJ5IHRvIGNvbXByZXNzIHRoZQo+IGxhc3Qg
cGFydCBvZiB0aGUgZmlsZSAod2hlbiB0aGUgbGFzdCBwYXJ0IGlzIG5vdCBhIG11bHRpcGxlIG9m
IHRoZSBjbHVzdGVyCj4gc2l6ZSkKPiAKPiBJTUhPLCB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRp
b24gc2hvdWxkIGJlIGNvcnJlY3QuCj4gCj4gMy4gIG5vZGVfYmxrLT5pLmlfYmxvY2tzICs9IGNw
dV90b19sZTY0KGNibG9ja3MpOwo+IAo+IEkgYW0gbm90IHF1aXRlIHN1cmUgb2YgdGhlIGlfYmxv
Y2tzIGNvdW50LiAgRGlkIHlvdSBtZWFuIHRoYXQgd2hlbiB0aGUgZmlsZQo+IGlzIG11dGFibGUs
ICAgbWVhbmluZyB0aGF0IHRoZSBmaWxlIHJlc2VydmVzIHNvbWUgYmxvY2tzIGZvciBmdXR1cmUg
d3JpdGUsCj4gd2Ugd2lsbCBhZGQgY291bnQgdG8gaV9ibG9ja3MgdG8gbWFyayB0aGUgYmxvY2sg
YXMgYSB1c2VkIGJsb2NrIGJ5IHRoZQo+IGZpbGUsIHJpZ2h0PyAgSSB0aG91Z2h0IHdlIG9ubHkg
bmVlZCB0byBpbmNyZW1lbnQgdGhlIGFsbG9jYXRlZCBjb3VudC4uLgoKU2hvdWxkIGFkZCBpdC4K
Cj4gCj4gUmVnYXJkcywKPiBSb2JpbiBIc3Ug5b6Q55Ge5paMCj4gCj4gCj4gT24gVGh1LCBEZWMg
MTAsIDIwMjAgYXQgNDo0MiBQTSBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+IHdyb3RlOgo+
IAo+ID4gT24gMjAyMC8xMi84IDE2OjE1LCBSb2JpbiBIc3Ugd3JvdGU6Cj4gPiA+IEZyb206IFJv
YmluIEhzdSA8cm9iaW5oc3VAZ29vZ2xlLmNvbT4KPiA+ID4KPiA+ID4gQWRkIEYyRlMgY29tcHJl
c3Npb24gc3VwcG9ydCBmb3Igc2xvYWQKPiA+ID4gKiBTdXBwb3J0IGZpbGUgZXh0ZW5zaW9uIGZp
bHRlciwgZWl0aGVyIGRlZmF1bHQtYWNjZXB0IG9yIGRlZmF1bHQtZGVueQo+ID4gPiAgICBwb2xp
Y3kKPiA+ID4gKiBTdXBwb3J0IGNob2ljZSBvZiBjb21wcmVzc2lvbiBhbGdvcml0aG0sIExaTyAo
dmVyc2lvbiAyKSBvciBMWjQKPiA+ID4gICAgKGRlZmF1bHQpCj4gPiA+ICogU3VwcG9ydCBjdXN0
b20gbG9nIG9mIGNsdXN0ZXIgc2l6ZQo+ID4gPiAqIFN1cHBvcnQgbWluaW11bSBudW1iZXIgb2Yg
Y29tcHJlc3NlZCBibG9ja3MgcGVyIGNsdXN0ZXIgKGRlZmF1bHQgMSkuCj4gPiA+ICAgIEEgY2x1
c3RlciB3aWxsIG5vdCBiZSBjb21wcmVzc2VkIGlmIHRoZSBudW1iZXIgY2FuIG5vdCBiZSBtZXQu
Cj4gPiA+ICogc3V1cG9ydCAtciAocmVhZC1vbmx5KSBvcHRpb24KPiA+Cj4gPiBDb3VsZCB5b3Ug
cGxlYXNlIHVwZGF0ZSBtYW51YWwgYXMgd2VsbD8KPiA+Cj4gPiA+ICsKPiA+ID4gKyAgICAgLyog
c2xkYzogc2xvYWQgY29tcHJlc3Npb24gc3VwcG9ydCAqLwo+ID4KPiA+IFBlcnNvbmFsbHksIEkg
ZG9uJ3QgbGlrZSB0aGUgbmFtaW5nIG1ldGhvZCBvZiBhZGRpbmcgInNsZGNfIiBwcmVmaXguLi4g
OigKPiA+Cj4gPiA+ICsgICAgIGJvb2wgc2xkY19lbjsKPiA+ID4gKyAgICAgYm9vbCBzbGRjX3Vz
ZV9hbGxvd19saXN0OyAgLyogZGVmYXVsdCBmYWxzZSB0byB1c2UgdGhlIGRlbnkgbGlzdCAqLwo+
ID4gPiArICAgICBzdHJ1Y3QgY29tcHJlc3NfY3R4IHNsZGNfY2M7Cj4gPiA+ICsgICAgIHU4IHNs
ZGNfY2E7IC8qIGNvbXByZXNzIGFsZ29yaXRobTogMCA9IExaTywgMSA9IExaNCAqLwo+ID4gPiAr
ICAgICBjb21wcmVzc19vcHMgKnNsZGNfY29tcHI7Cj4gPiA+ICsgICAgIGVudW0gZmlsdGVyX3Bv
bGljeSBzbGRjX3BvbGljeTsKPiA+ID4gKyAgICAgLyogbWF4X2NwcGMgY2FuIHVzZWQgdG8gc3Bl
Y2lmeSBtaW5pbXVtIGNvbXByZXNzaW9uIHJhdGUgKi8KPiA+ID4gKyAgICAgdW5zaWduZWQgaW50
IHNsZGNfbWluX2NicGM7IC8qIG1pbiBjb21wcmVzc2VkIHBhZ2VzIHBlciBjbHVzdGVyICovCj4g
PiA+ICsgICAgIGJvb2wgc2xkY19nb3Rfb3B0Owo+ID4gPiArICAgICBib29sIHNsZGNfaW1tdXRh
YmxlOwo+ID4gPiArICAgICBzdHJ1Y3QgZXh0X3RibF9vcCAqc2xkY19lZjsgLyogZXh0ZW5zaW9u
IGZpbHRlciAqLwo+ID4KPiA+IFRoZSB2YXJpYWJsZXMgbmFtZSBsaWtlIHNsZGNfZW4sIHNsZGNf
Y2EsIG1pbl9jYnBjLCBzbGRjX2VmIG1ha2VzCj4gPiBkZXZlbG9wZXJzCj4gPiBoYXJkIHRvIHVu
ZGVyc3RhbmQgdy9vIGNvbW1lbnRzLCBhbmQgYWxzbyB0aGVyZSBpcyBubyBjb21tZW50cyBmb3Ig
c2V2ZXJhbAo+ID4gdmFyaWFibGUgbGlrZSBzbGRjX2VuLCBzbGRjX2NjLi4uCj4gPgo+ID4gQ291
bGQgeW91IHBsZWFzZSBpbXByb3ZlIHRoZSBuYW1pbmcgbGlrZSBmMmZzLXRvb2xzIHN0eWxlPwo+
ID4KPiA+IFRoYW5rcywKPiA+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

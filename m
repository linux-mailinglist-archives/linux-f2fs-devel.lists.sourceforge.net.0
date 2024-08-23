Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 790A495D1A7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2024 17:38:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1shWNE-0006sW-Jn;
	Fri, 23 Aug 2024 15:38:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1shWNB-0006sP-I8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 15:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rKHpb8BNe6VsPtuD5PfIXPoMq93cxgO1KKnMxDRYLdw=; b=fAYtiwCuV2qLJ7qsfq5BV0QuSd
 zrre3hr5zAYEIhHyL6rFIRluw3UGnALRmksbJzAeE4aXfuRTQTPmggVJIRttu//0G6/V+hdgdI+BB
 9w9fGMWpp2sbOjFTQ1YEYJ0hhmqYdcscbhNJFeHLjFUdG88vJjJSMhr+Npy0X5ohC/sc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rKHpb8BNe6VsPtuD5PfIXPoMq93cxgO1KKnMxDRYLdw=; b=IgHd8ikT5p4Qh7giWmBTdolFM2
 UhJbe3bJKqc1CWJ1PN+BAjvFx/iS+x/mEmllOhjd8juNjM9/SxfaEexIBa2VTwnAGKpcaCxHwv8g3
 GutPfVLJ83cyF8fiWHvmMkqD+mGEUIS5UfQsLiGYlt3FS8eusd469wdkMLrlsDWMrIrc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1shWNA-00043R-0U for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 15:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=rKHpb8BNe6VsPtuD5PfIXPoMq93cxgO1KKnMxDRYLdw=; b=Inve0ZB6WZIggq/RT/UwRCIfFx
 alQy6i2jwb4uDwqP2WL+C2hE2wDVrSDmr/ZF8WotOvKCyr5q18ZjeNZq44nm9jTxfmuDGjxcQhUje
 OPV3ZKW9Wv3TAokPbfdq1QSQE1oEUp3fmY4dCkAXk59KcdNvckBUHybWBBzq69QXnoM2fVoYtTEF2
 G8V6Rs0Y7qeR96SDX4HTQhN8iYknX/L94aOf8eDcbDWxYk5f0jnX6XSmDs8UeYzDHVgMcXMMXnML/
 Sw2u9hNiCyIIfzTdR3oNHx/kr14OnEisaIpD2jZivHD2XvNIXuDLM1BQRU3oYC/FDDZ567XsO8uTq
 RMcphSvQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1shWMu-0000000BsOY-0Yml;
 Fri, 23 Aug 2024 15:38:28 +0000
Date: Fri, 23 Aug 2024 16:38:27 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <Zsis82IKSAq6Mgms@casper.infradead.org>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-3-lizetao1@huawei.com>
 <Zsaq_QkyQIhGsvTj@casper.infradead.org>
 <0f643b0f-f1c2-48b7-99d5-809b8b7f0aac@gmx.com>
 <ZscqGAMm1tofHSSG@casper.infradead.org>
 <38247c40-604b-443a-a600-0876b596a284@gmx.com>
 <7a04ac3b-e655-4a80-89dc-19962db50f05@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a04ac3b-e655-4a80-89dc-19962db50f05@gmx.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Aug 23, 2024 at 11:43:41AM +0930, Qu Wenruo wrote:
    > 在 2024/8/23 07:55, Qu Wenruo 写道: > > 在 2024/8/22 21:37, Matthew
    Wilcox 写道: > > > On Thu, Aug 22, 2024 at 08:28:09PM +0930, Qu W [...]
    
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [90.155.50.34 listed in list.dnswl.org]
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: infradead.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [90.155.50.34 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [90.155.50.34 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1shWNA-00043R-0U
Subject: Re: [f2fs-dev] [PATCH 02/14] btrfs: convert
 get_next_extent_buffer() to take a folio
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
Cc: josef@toxicpanda.com, linux-f2fs-devel@lists.sourceforge.net, clm@fb.com,
 terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgMTE6NDM6NDFBTSArMDkzMCwgUXUgV2VucnVvIHdyb3Rl
Ogo+IOWcqCAyMDI0LzgvMjMgMDc6NTUsIFF1IFdlbnJ1byDlhpnpgZM6Cj4gPiDlnKggMjAyNC84
LzIyIDIxOjM3LCBNYXR0aGV3IFdpbGNveCDlhpnpgZM6Cj4gPiA+IE9uIFRodSwgQXVnIDIyLCAy
MDI0IGF0IDA4OjI4OjA5UE0gKzA5MzAsIFF1IFdlbnJ1byB3cm90ZToKPiA+ID4gPiBCdXQgd2hh
dCB3aWxsIGhhcHBlbiBpZiBzb21lIHdyaXRlcyBoYXBwZW5lZCB0byB0aGF0IGxhcmdlciBmb2xp
bz8KPiA+ID4gPiBEbyBNTSBsYXllciBkZXRlY3RzIHRoYXQgYW5kIHNwbGl0IHRoZSBmb2xpb3M/
IE9yIHRoZSBmcyBoYXMgdG8gZ28gdGhlCj4gPiA+ID4gc3VicGFnZSByb3V0aW5lICh3aXRoIGFu
IGV4dHJhIHN0cnVjdHVyZSByZWNvcmRpbmcgYWxsIHRoZSBzdWJwYWdlIGZsYWdzCj4gPiA+ID4g
Yml0bWFwKT8KPiA+ID4gCj4gPiA+IEVudGlyZWx5IHVwIHRvIHRoZSBmaWxlc3lzdGVtLsKgIEl0
IHdvdWxkIGhlbHAgaWYgYnRyZnMgdXNlZCB0aGUgc2FtZQo+ID4gPiB0ZXJtaW5vbG9neSBhcyB0
aGUgcmVzdCBvZiB0aGUgZmlsZXN5c3RlbXMgaW5zdGVhZCBvZiBpbnZlbnRpbmcgaXRzIG93bgo+
ID4gPiAic3VicGFnZSIgdGhpbmcuwqAgQXMgZmFyIGFzIEkgY2FuIHRlbGwsICJzdWJwYWdlIiBt
ZWFucyAiZnMgYmxvY2sgc2l6ZSIsCj4gPiA+IGJ1dCBtYXliZSBpdCBoYXMgYSBkaWZmZXJlbnQg
bWVhbmluZyB0aGF0IEkgaGF2ZW4ndCBhc2NlcnRhaW5lZC4KPiA+IAo+ID4gVGhlbiB0ZWxsIG1l
IHRoZSBjb3JyZWN0IHRlcm1pbm9sb2d5IHRvIGRlc2NyaWJlIGZzIGJsb2NrIHNpemUgc21hbGxl
cgo+ID4gdGhhbiBwYWdlIHNpemUgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4gCj4gPiAiZnMgYmxv
Y2sgc2l6ZSIgaXMgbm90IGdvb2QgZW5vdWdoLCB3ZSB3YW50IGEgdGVybWlub2xvZ3kgdG8gZGVz
Y3JpYmUKPiA+ICJmcyBibG9jayBzaXplIiBzbWFsbGVyIHRoYW4gcGFnZSBzaXplLgoKT2ggZGVh
ci4gIGJ0cmZzIHJlYWxseSBoYXMgY29ycnVwdGVkIHlvdXIgYnJhaW4uICBIZXJlJ3MgdGhlIHRl
cm1pbm9sb2d5CnVzZWQgaW4gdGhlIHJlc3Qgb2YgTGludXg6CgpTRUNUT1JfU0laRS4gIEZpeGVk
IGF0IDUxMiBieXRlcy4gIFRoaXMgaXMgdGhlIHVuaXQgdXNlZCB0byBjb21tdW5pY2F0ZQp3aXRo
IHRoZSBibG9jayBsYXllci4gIEl0IGhhcyBubyByZWFsIG1lYW5pbmcsIG90aGVyIHRoYW4gTGlu
dXggZG9lc24ndApzdXBwb3J0IGJsb2NrIGRldmljZXMgd2l0aCAxMjggYW5kIDI1NiBieXRlIHNl
Y3RvciBzaXplcyAoSSBoYXZlIHVzZWQKc3VjaCBzeXN0ZW1zLCBidXQgbm90IGluIHRoZSBsYXN0
IDMwIHllYXJzKS4KCkxCQSBzaXplLiAgVGhpcyBpcyB0aGUgdW5pdCB0aGF0IHRoZSBibG9jayBs
YXllciB1c2VzIHRvIGNvbW11bmljYXRlCndpdGggdGhlIGJsb2NrIGRldmljZS4gIE11c3QgYmUg
YXQgbGVhc3QgU0VDVE9SX1NJWkUuICBJL08gY2Fubm90IGJlCnBlcmZvcm1lZCBpbiBzbWFsbGVy
IGNodW5rcyB0aGFuIHRoaXMuCgpQaHlzaWNhbCBibG9jayBzaXplLiAgVGhpcyBpcyB0aGUgdW5p
dCB0aGF0IHRoZSBkZXZpY2UgYWR2ZXJ0aXNlcyBhcwppdHMgZWZmaWNpZW50IG1pbmltdW0gc2l6
ZS4gIEkvT3Mgc21hbGxlciB0aGFuIHRoaXMgLyBub3QgYWxpZ25lZCB0bwp0aGlzIHdpbGwgcHJv
YmFibHkgaW5jdXIgYSBwZXJmb3JtYW5jZSBwZW5hbHR5IGFzIHRoZSBkZXZpY2Ugd2lsbCBuZWVk
CnRvIGRvIGEgcmVhZC1tb2RpZnktd3JpdGUgY3ljbGUuCgpmcyBibG9jayBzaXplLiAgS25vd24g
YXMgc19ibG9ja3NpemUgb3IgaV9ibG9ja3NpemUuICBNdXN0IGJlIGEgbXVsdGlwbGUKb2YgTEJB
IHNpemUsIGJ1dCBtYXkgYmUgc21hbGxlciB0aGFuIHBoeXNpY2FsIGJsb2NrIHNpemUuICBGaWxl
cyBhcmUKYWxsb2NhdGVkIGluIG11bHRpcGxlcyBvZiB0aGlzIHVuaXQuCgpQQUdFX1NJWkUuICBV
bml0IHRoYXQgbWVtb3J5IGNhbiBiZSBtYXBwZWQgaW4uICBUaGlzIGFwcGxpZXMgdG8gYm90aAp1
c2Vyc3BhY2UgbWFwcGluZyBvZiBmaWxlcyBhcyB3ZWxsIGFzIGNhbGxzIHRvIGttYXBfbG9jYWxf
KigpLgoKZm9saW8gc2l6ZS4gIFRoZSBzaXplIHRoYXQgdGhlIHBhZ2UgY2FjaGUgaGFzIGRlY2lk
ZWQgdG8gbWFuYWdlIHRoaXMKY2h1bmsgb2YgdGhlIGZpbGUgaW4uICBBIG11bHRpcGxlIG9mIFBB
R0VfU0laRS4KCgpJJ3ZlIG1vc3RseSBsaXN0ZWQgdGhpcyBpbiBzbWFsbGVzdCB0byBsYXJnZXN0
LiAgVGhlIHJlbGF0aW9uc2hpcHMgdGhhdAptdXN0IGJlIHRydWU6CgpTUyA8PSBMQkEgPD0gUGh5
cwpMQkEgPD0gZnNiClBTIDw9IGZvbGlvCmZzYiA8PSBmb2xpbwoKb2NmczIgc3VwcG9ydHMgZnNi
ID4gUEFHRV9TSVpFLCBidXQgdGhpcyBpcyBhIHJhcml0eS4gIE1vc3QgZmlsZXN5c3RlbXMKcmVx
dWlyZSBmc2IgPD0gUEFHRV9TSVpFLgoKRmlsZXN5c3RlbXMgbGlrZSBVRlMgYWxzbyBzdXBwb3J0
IGEgZnJhZ21lbnQgc2l6ZSB3aGljaCBpcyBsZXNzIHRoYW4gZnMKYmxvY2sgc2l6ZS4gIEl0J3Mg
a2luZCBvZiBsaWtlIHRhaWwgcGFja2luZy4gIEFueXdheSwgdGhhdCdzIGludGVybmFsIHRvCnRo
ZSBmaWxlc3lzdGVtIGFuZCBub3QgZXhwb3NlZCB0byB0aGUgVkZTLgoKPiA+ID4gSSBoYXZlIG5v
IGlkZWEgd2h5IGJ0cmZzIHRoaW5rcyBpdCBuZWVkcyB0byB0cmFjayB3cml0ZWJhY2ssIG9yZGVy
ZWQsCj4gPiA+IGNoZWNrZWQgYW5kIGxvY2tlZCBpbiBhIGJpdG1hcC7CoCBUaG9zZSBtYWtlIG5v
IHNlbnNlIHRvIG1lLsKgIEJ1dCB0aGV5Cj4gPiA+IG1ha2Ugbm8gc2Vuc2UgdG8gbWUgaWYgeW91
J3JlIHN1cHBvcnQgYSA0S2lCIGZpbGVzeXN0ZW0gb24gYSBtYWNoaW5lCj4gPiA+IHdpdGggYSA2
NEtpQiBQQUdFX1NJWkUsIG5vdCBqdXN0IGluIHRoZSBjb250ZXh0IG9mICJsYXJnZXIgZm9saW9z
Ii4KPiA+ID4gV3JpdGViYWNrIGlzIHNvbWV0aGluZyB0aGUgVk0gdGVsbHMgeW91IHRvIGRvOyB3
aHkgZG8geW91IG5lZWQgdG8gdGFnCj4gPiA+IGluZGl2aWR1YWwgYmxvY2tzIGZvciB3cml0ZWJh
Y2s/Cj4gPiAKPiA+IEJlY2F1c2UgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIGJ0cmZzIG5lZWRzIHRv
IG9ubHkgd3JpdGUgYmFjayBwYXJ0IG9mIHRoZQo+ID4gZm9saW8gaW5kZXBlbmRlbnRseS4KCmlv
bWFwIG1hbmFnZXMgdG8gZG8gdGhpcyB3aXRoIG9ubHkgdHJhY2tpbmcgcGVyLWJsb2NrIGRpcnR5
IGJpdHMuCgo+ID4gQW5kIGVzcGVjaWFsbHkgZm9yIG1peGluZyBjb21wcmVzc2lvbiBhbmQgbm9u
LWNvbXByZXNzaW9uIHdyaXRlcyBpbnNpZGUKPiA+IGEgcGFnZSwgZS5nOgo+ID4gCj4gPiAgwqDC
oMKgwqDCoCAwwqDCoMKgwqAgMTZLwqDCoMKgwqAgMzJLwqDCoMKgwqAgNDhLwqDCoMKgwqDCoCA2
NEsKPiA+ICDCoMKgwqDCoMKgIHwvL3zCoMKgwqDCoMKgwqDCoMKgwqAgfC8vLy8vLy98Cj4gPiAg
wqDCoMKgwqDCoMKgwqDCoCA0Swo+ID4gCj4gPiBJbiBhYm92ZSBjYXNlLCBpZiB3ZSBuZWVkIHRv
IHdyaXRlYmFjayBhYm92ZSBwYWdlIHdpdGggNEsgc2VjdG9yIHNpemUsCj4gPiB0aGVuIHRoZSBm
aXJzdCA0SyBpcyBub3Qgc3VpdGFibGUgZm9yIGNvbXByZXNzaW9uIChyZXN1bHQgd2lsbCBzdGls
bAo+ID4gdGFrZSBhIGZ1bGwgNEsgYmxvY2spLCB3aGlsZSB0aGUgcmFuZ2UgWzMySywgNDhLKSB3
aWxsIGJlIGNvbXByZXNzZWQuCj4gPiAKPiA+IEluIHRoYXQgY2FzZSwgWzAsIDRLKSByYW5nZSB3
aWxsIGJlIHN1Ym1pdHRlZCBkaXJlY3RseSBmb3IgSU8uCj4gPiBNZWFud2hpbGUgWzMySywgNDgp
IHdpbGwgYmUgc3VibWl0dGVkIGZvciBjb21wcmVzc2lvbiBpbiBhbnRvaGVyIHdxLgo+ID4gKE9y
IHRpbWUgY29uc3VtaW5nIGNvbXByZXNzaW9uIHdpbGwgZGVsYXkgdGhlIHdyaXRlYmFjayBvZiB0
aGUgcmVtYWluaW5nCj4gPiBwYWdlcykKPiA+IAo+ID4gVGhpcyBtZWFucyB0aGUgZGlydHkvd3Jp
dGViYWNrIGZsYWdzIHdpbGwgaGF2ZSBhIGRpZmZlcmVudCB0aW1pbmcgdG8gYmUKPiA+IGNoYW5n
ZWQuCj4gCj4gSnVzdCBpbiBjYXNlIGlmIHlvdSBtZWFuIHVzaW5nIGFuIGF0b21pYyB0byB0cmFj
ZSB0aGUgd3JpdGViYWNrL2xvY2sKPiBwcm9ncmVzcywgdGhlbiBpdCdzIHBvc3NpYmxlIHRvIGdv
IHRoYXQgcGF0aCwgYnV0IGZvciBub3cgaXQncyBub3Qgc3BhY2UKPiBlZmZpY2llbnQuCj4gCj4g
Rm9yIDE2IGJsb2NrcyBwZXIgcGFnZSBjYXNlICg0SyBzZWN0b3JzaXplIDY0SyBwYWdlIHNpemUp
LCBlYWNoIGF0b21pYwo+IHRha2VzIDQgYnl0ZXMgd2hpbGUgYSBiaXRtYXAgb25seSB0YWtlcyAy
IGJ5dGVzLgo+IAo+IEFuZCBmb3IgNEsgc2VjdG9yc2l6ZSAxNksgcGFnZSBzaXplIGNhc2UsIGl0
J3Mgd29yc2UgYW5kIGJ0cmZzIGNvbXBhY3QKPiBhbGwgdGhlIGJpdG1hcHMgaW50byBhIGxhcmdl
ciBvbmUgdG8gc2F2ZSBtb3JlIHNwYWNlLCB3aGlsZSBlYWNoIGF0b21pYwo+IHN0aWxsIHRha2Vz
IDQgYnl0ZXMuCgpTdXJlLCBidXQgaXQgZG9lc24ndCBzY2FsZSB1cCB3ZWxsLiAgQW5kIGl0J3Mg
a2luZCBvZiBpcnJlbGV2YW50IHdoZXRoZXIKeW91IG9jY3VweSAyIG9yIDQgYnl0ZXMgYXQgdGhl
IGxvdyBlbmQgYmVjYXVzZSB5b3UncmUgYWxsb2NhdGluZyBhbGwKdGhpcyB0aHJvdWdoIHNsYWIs
IHNvIHlvdSBnZXQgcm91bmRlZCB0byA4IGJ5dGVzIGFueXdheS4KaW9tYXBfZm9saW9fc3RhdGUg
Y3VycmVudGx5IG9jY3VwaWVzIDEyIGJ5dGVzICsgMiBiaXRzIHBlciBibG9jay4gIFNvCmZvciBh
IDE2IGJsb2NrIGZvbGlvICg0ayBpbiA2NGspLCB0aGF0J3MgMzIgYml0cyBmb3IgYSB0b3RhbCBv
ZiAxNgpieXRlcy4gIEZvciBhIDJNQiBmb2xpbyBvbiBhIDRrQiBibG9jayBzaXplIGZzLCB0aGF0
J3MgMTAyNCBiaXRzIGZvcgphIHRvdGFsIG9mIDE0MCBieXRlcyAocm91bmRlZCB0byAxOTIgYnl0
ZXMgYnkgc2xhYikuCgpIbSwgaXQgbWlnaHQgYmUgd29ydGggYWRkaW5nIGEga21hbGxvYy0xNjAs
IHdlJ2QgZ2V0IDI1IG9iamVjdHMgcGVyIDRLaUIKcGFnZSBpbnN0ZWFkIG9mIDIxIDE5Mi1ieXRl
IG9iamVjdHMgLi4uCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8539EEFED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Dec 2024 17:22:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLlxW-0004vz-8O;
	Thu, 12 Dec 2024 16:22:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tLlxU-0004vq-Bz
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 16:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qswOQZtOY//ytWVbPq++nRMNfupoMguQSsuWEp7k+s8=; b=EDrd9yLgfbeQ6wkBYhWBoLxzl1
 44NMr0sYO4hPllajncoBx8t1oizM8xWRr4urpsR0rEqS6rnFr0/XIJd8C0lhGciMkvMuc/Xf9PzXl
 O85of6lBguB8umpeDMW7lnfOvMHoMOjlXMRfgiae9ot02zec9xUhoK48IzoFoAqxsCd4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qswOQZtOY//ytWVbPq++nRMNfupoMguQSsuWEp7k+s8=; b=ipAgkP5WDrtaAbmsgRrL6kLheN
 s312BttCUxQ6aDy4u1v58R1qqL39Ei3uj+NshTE8HLdQ+/yzIC9c3a4G8WCkZc/8HHNul/P7yxJco
 HYSwiBjyl7/WDshnauJFMYjHCTN75O8zyEybiybWu8VGA/Va2qUbyepcGrfK8bCH9PSM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLlxU-0006sM-5W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 16:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 28B62A428ED;
 Thu, 12 Dec 2024 16:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E38C4CECE;
 Thu, 12 Dec 2024 16:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734020550;
 bh=0gZG4E+lI17ylP0f1KSzZLx6ghl2G3iZ0xfmkYVpC0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FG5qBbGZCMBihr7rFevPxWzXK77IQ6okBvEg2D4dRhnWcHbEHuTdIHNrjOD2S8VFr
 f6N/zXLc/+/FWQeJIgdTurh0VVOYQVrr4tMgtEn58Unb3PAG109HQTJ0J5adQcwmth
 oyR89XV/WP3/1spB/txmaVA8T/6T2sBaSW4i/NLK7iG7urz7OtstiPzMBjaqPQnS4u
 XQyzgyZGw+jjSlvjUx/ra+/lCpj84N8iu4d9vTGsy1YB4EvHI9TQmjSKzMq3hYbWGI
 E88meINsxfMpePD//iF6lqzqqi2bqbdk6P0CAYVI08hsfi+vytrW7WULTIkqjJPIO9
 MIaaqrsU58gwg==
Date: Thu, 12 Dec 2024 16:22:27 +0000
To: yi sun <sunyibuaa@gmail.com>
Message-ID: <Z1sNw-rrvAnpwY3r@google.com>
References: <20241104034545.497907-1-yi.sun@unisoc.com>
 <20241104034545.497907-6-yi.sun@unisoc.com>
 <CALpufv34r8cMv0BtGXWLd_LEBjtMGM+CZ=XpnsL8Qr8WOsOk6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALpufv34r8cMv0BtGXWLd_LEBjtMGM+CZ=XpnsL8Qr8WOsOk6Q@mail.gmail.com>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/11, yi sun wrote: > Kindly ping. > I think there are
 no problems with the first few patches, but the > current patch may still
 have room for improvement. Do you have any > good suggestions? Hi, may I
 ask for some basic tests? Have you run xfstests? 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tLlxU-0006sM-5W
Subject: Re: [f2fs-dev] [PATCH v3 5/5] f2fs: Optimize
 f2fs_truncate_data_blocks_range()
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 Yi Sun <yi.sun@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMTEsIHlpIHN1biB3cm90ZToKPiBLaW5kbHkgcGluZy4KPiBJIHRoaW5rIHRoZXJlIGFy
ZSBubyBwcm9ibGVtcyB3aXRoIHRoZSBmaXJzdCBmZXcgcGF0Y2hlcywgYnV0IHRoZQo+IGN1cnJl
bnQgcGF0Y2ggbWF5IHN0aWxsIGhhdmUgcm9vbSBmb3IgaW1wcm92ZW1lbnQuIERvIHlvdSBoYXZl
IGFueQo+IGdvb2Qgc3VnZ2VzdGlvbnM/CgpIaSwgbWF5IEkgYXNrIGZvciBzb21lIGJhc2ljIHRl
c3RzPyBIYXZlIHlvdSBydW4geGZzdGVzdHM/Cgo+IAo+IE9uIE1vbiwgTm92IDQsIDIwMjQgYXQg
MTE6NDbigK9BTSBZaSBTdW4gPHlpLnN1bkB1bmlzb2MuY29tPiB3cm90ZToKPiA+Cj4gPiBGdW5j
dGlvbiBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKCkgY2FuIHByb2Nlc3MgY29udGludW91cwo+ID4g
YmxvY2tzIGF0IGEgdGltZSwgc28gZjJmc190cnVuY2F0ZV9kYXRhX2Jsb2Nrc19yYW5nZSgpIGlz
Cj4gPiBvcHRpbWl6ZWQgdG8gdXNlIHRoZSBuZXcgZnVuY3Rpb25hbGl0eSBvZgo+ID4gZjJmc19p
bnZhbGlkYXRlX2Jsb2NrcygpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFlpIFN1biA8eWkuc3Vu
QHVuaXNvYy5jb20+Cj4gPiAtLS0KPiA+ICBmcy9mMmZzL2ZpbGUuYyB8IDcyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDY4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPiA+IGluZGV4IDkzNjZlN2ZjN2MzOS4u
ZDIwY2M1ZjM2ZDRjIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiA+ICsrKyBiL2Zz
L2YyZnMvZmlsZS5jCj4gPiBAQCAtNjEyLDYgKzYxMiwxNSBAQCBzdGF0aWMgaW50IGYyZnNfZmls
ZV9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxwKQo+ID4gICAgICAg
ICByZXR1cm4gZmluaXNoX3ByZWFsbG9jYXRlX2Jsb2Nrcyhpbm9kZSk7Cj4gPiAgfQo+ID4KPiA+
ICtzdGF0aWMgYm9vbCBjaGVja19jdXJyX2Jsb2NrX2lzX2NvbnNlY3V0aXZlKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBibG9ja190IGN1cnIsIGJsb2NrX3QgZW5kKQo+ID4gK3sKPiA+ICsgICAgICAgaWYgKGN1cnIg
LSBlbmQgPT0gMSB8fCBjdXJyID09IGVuZCkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1
ZTsKPiA+ICsgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+
ICt9Cj4gPiArCj4gPiAgdm9pZCBmMmZzX3RydW5jYXRlX2RhdGFfYmxvY2tzX3JhbmdlKHN0cnVj
dCBkbm9kZV9vZl9kYXRhICpkbiwgaW50IGNvdW50KQo+ID4gIHsKPiA+ICAgICAgICAgc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGRuLT5pbm9kZSk7Cj4gPiBAQCAtNjIxLDgg
KzYzMCwyNyBAQCB2b2lkIGYyZnNfdHJ1bmNhdGVfZGF0YV9ibG9ja3NfcmFuZ2Uoc3RydWN0IGRu
b2RlX29mX2RhdGEgKmRuLCBpbnQgY291bnQpCj4gPiAgICAgICAgIGludCBjbHVzdGVyX2luZGV4
ID0gMCwgdmFsaWRfYmxvY2tzID0gMDsKPiA+ICAgICAgICAgaW50IGNsdXN0ZXJfc2l6ZSA9IEYy
RlNfSShkbi0+aW5vZGUpLT5pX2NsdXN0ZXJfc2l6ZTsKPiA+ICAgICAgICAgYm9vbCByZWxlYXNl
ZCA9ICFhdG9taWNfcmVhZCgmRjJGU19JKGRuLT5pbm9kZSktPmlfY29tcHJfYmxvY2tzKTsKPiA+
ICsgICAgICAgLyoKPiA+ICsgICAgICAgICogVGVtcG9yYXJ5IHJlY29yZCBsb2NhdGlvbi4KPiA+
ICsgICAgICAgICogV2hlbiB0aGUgY3VycmVudCAgQGJsa2FkZHIgYW5kIEBibGthZGRyX2VuZCBj
YW4gYmUgcHJvY2Vzc2VkCj4gPiArICAgICAgICAqIHRvZ2V0aGVyLCB1cGRhdGUgdGhlIHZhbHVl
IG9mIEBibGthZGRyX2VuZC4KPiA+ICsgICAgICAgICogV2hlbiBpdCBpcyBkZXRlY3RlZCB0aGF0
IGN1cnJlbnQgQGJsa2FkZHIgaXMgbm90IGNvbnRpbnVlcyB3aXRoCj4gPiArICAgICAgICAqIEBi
bGthZGRyX2VuZCwgaXQgaXMgbmVjZXNzYXJ5IHRvIHByb2Nlc3MgY29udGludWVzIGJsb2Nrcwo+
ID4gKyAgICAgICAgKiByYW5nZSBbYmxrYWRkcl9zdGFydCwgYmxrYWRkcl9lbmRdLgo+ID4gKyAg
ICAgICAgKi8KPiA+ICsgICAgICAgYmxvY2tfdCBibGthZGRyX3N0YXJ0LCBibGthZGRyX2VuZDsK
PiA+ICsgICAgICAgLyouCj4gPiArICAgICAgICAqIFRvIGF2b2lkIHByb2Nlc3NpbmcgdmFyaW91
cyBpbnZhbGlkIGRhdGEgYmxvY2tzLgo+ID4gKyAgICAgICAgKiBCZWNhdXNlIEBibGthZGRyX3N0
YXJ0IGFuZCBAYmxrYWRkcl9lbmQgbWF5IGJlIGFzc2lnbmVkCj4gPiArICAgICAgICAqIE5VTExf
QUREUiBvciBpbnZhbGlkIGRhdGEgYmxvY2tzLCBAbGFzdF92YWxpZCBpcyB1c2VkIHRvCj4gPiAr
ICAgICAgICAqIHJlY29yZCB0aGlzIHNpdHVhdGlvbi4KPiA+ICsgICAgICAgICovCj4gPiArICAg
ICAgIGJvb2wgbGFzdF92YWxpZCA9IGZhbHNlOwo+ID4gKyAgICAgICAvKiBQcm9jZXNzIHRoZSBs
YXN0IEBibGthZGRyIHNlcGFyYXRlbHk/ICovCj4gPiArICAgICAgIGJvb2wgbGFzdF9vbmUgPSB0
cnVlOwo+ID4KPiA+ICAgICAgICAgYWRkciA9IGdldF9kbm9kZV9hZGRyKGRuLT5pbm9kZSwgZG4t
Pm5vZGVfcGFnZSkgKyBvZnM7Cj4gPiArICAgICAgIGJsa2FkZHJfc3RhcnQgPSBibGthZGRyX2Vu
ZCA9IGxlMzJfdG9fY3B1KCphZGRyKTsKPiA+Cj4gPiAgICAgICAgIC8qIEFzc3VtcHRpb246IHRy
dW5jYXRpb24gc3RhcnRzIHdpdGggY2x1c3RlciAqLwo+ID4gICAgICAgICBmb3IgKDsgY291bnQg
PiAwOyBjb3VudC0tLCBhZGRyKyssIGRuLT5vZnNfaW5fbm9kZSsrLCBjbHVzdGVyX2luZGV4Kysp
IHsKPiA+IEBAIC02MzgsMjQgKzY2Niw2MCBAQCB2b2lkIGYyZnNfdHJ1bmNhdGVfZGF0YV9ibG9j
a3NfcmFuZ2Uoc3RydWN0IGRub2RlX29mX2RhdGEgKmRuLCBpbnQgY291bnQpCj4gPiAgICAgICAg
ICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAgICAgICBpZiAoYmxrYWRkciA9PSBOVUxMX0FE
RFIpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgZjJmc19zZXRf
ZGF0YV9ibGthZGRyKGRuLCBOVUxMX0FERFIpOwo+ID4KPiA+ICAgICAgICAgICAgICAgICBpZiAo
X19pc192YWxpZF9kYXRhX2Jsa2FkZHIoYmxrYWRkcikpIHsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmICh0aW1lX3RvX2luamVjdChzYmksIEZBVUxUX0JMS0FERFJfQ09OU0lTVEVOQ0Up
KQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHJfcmF3KHNiaSwgYmxrYWRkciwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERBVEFfR0VO
RVJJQ19FTkhBTkNFKSkKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChjb21wcmVzc2VkX2NsdXN0ZXIpCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZhbGlkX2Jsb2NrcysrOwo+ID4gICAgICAgICAgICAg
ICAgIH0KPiA+Cj4gPiAtICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmks
IGJsa2FkZHIsIDEpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlmIChjaGVja19jdXJyX2Js
b2NrX2lzX2NvbnNlY3V0aXZlKHNiaSwgYmxrYWRkciwgYmxrYWRkcl9lbmQpKSB7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICogVGhl
IGN1cnJlbnQgYmxvY2sgQGJsa2FkZHIgaXMgY29udGludW91cyB3aXRoCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgKiBAYmxrYWRkcl9lbmQsIHNvIEBibGthZGRyX2VuZCBpcyB1cGRhdGVk
Lgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICogQW5kIHRoZSBmMmZzX2ludmFsaWRhdGVf
YmxvY2tzKCkgaXMgc2tpcHBlZAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICogdW50aWwg
QGJsa2FkZHIgdGhhdCBjYW5ub3QgYmUgcHJvY2Vzc2VkCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgKiB0b2dldGhlciBpcyBlbmNvdW50ZXJlZC4KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYmxrYWRkcl9lbmQgPSBibGthZGRy
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGNvdW50ID09IDEpCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxhc3Rfb25lID0gZmFsc2U7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gc2tpcF9pbnZhbGlkOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAg
ICAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgYmxrYWRkcl9zdGFydCwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibGthZGRyX2VuZCAtIGJsa2Fk
ZHJfc3RhcnQgKyAxKTsKPiA+ICsgICAgICAgICAgICAgICBibGthZGRyX3N0YXJ0ID0gYmxrYWRk
cl9lbmQgPSBibGthZGRyOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlmIChjb3VudCA9PSAx
ICYmIGxhc3Rfb25lKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRl
X2Jsb2NrcyhzYmksIGJsa2FkZHIsIDEpOwo+ID4gKwo+ID4gK3NraXBfaW52YWxpZDoKPiA+ICsg
ICAgICAgICAgICAgICBsYXN0X3ZhbGlkID0gdHJ1ZTsKPiA+Cj4gPiAgICAgICAgICAgICAgICAg
aWYgKCFyZWxlYXNlZCB8fCBibGthZGRyICE9IENPTVBSRVNTX0FERFIpCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBucl9mcmVlKys7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgY29udGlu
dWU7Cj4gPiArCj4gPiArbmV4dDoKPiA+ICsgICAgICAgICAgICAgICAvKiBJZiBjb25zZWN1dGl2
ZSBibG9ja3MgaGF2ZSBiZWVuIHJlY29yZGVkLCB3ZSBuZWVkIHRvIHByb2Nlc3MgdGhlbS4gKi8K
PiA+ICsgICAgICAgICAgICAgICBpZiAobGFzdF92YWxpZCA9PSB0cnVlKQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJsa2FkZHJfc3RhcnQs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxrYWRkcl9lbmQg
LSBibGthZGRyX3N0YXJ0ICsgMSk7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgYmxrYWRkcl9z
dGFydCA9IGJsa2FkZHJfZW5kID0gbGUzMl90b19jcHUoKihhZGRyICsgMSkpOwo+ID4gKyAgICAg
ICAgICAgICAgIGxhc3RfdmFsaWQgPSBmYWxzZTsKPiA+ICsKPiA+ICAgICAgICAgfQo+ID4KPiA+
ICAgICAgICAgaWYgKGNvbXByZXNzZWRfY2x1c3RlcikKPiA+IC0tCj4gPiAyLjI1LjEKPiA+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=

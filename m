Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E304D5AA1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Mar 2022 06:32:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nSXsm-0004xv-DN; Fri, 11 Mar 2022 05:32:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nSXsk-0004xo-9D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Mar 2022 05:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xi7rltOEg8o8nA0ZWFPrxjEnSOPSuRVpnXS1OiiWVsM=; b=Q1kAcfqNz5TsAtWeuz/0JdgRZ0
 fHy2itZmJCIRNmvCo1RJNcMmzyQNskvlWlbrkG/fSmdDS3E//h3bO4Rog+CQ2+psf9a+TowfxYta3
 +PilinzRC8d1FUStj9N2WEk1NEkhUgn5Z612+vuZ95RJt5ckBbQh9hhJAOcAxF7NUzDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xi7rltOEg8o8nA0ZWFPrxjEnSOPSuRVpnXS1OiiWVsM=; b=MKuAIrBvDNICvjbp5/M996Jtn0
 ScF/g8cPk4VQUxxU7ZdnuSn5pXpCfx8wSJABRYE32ecKXVB4kh/XM8m0Te9lCLwe6uDbtlmCQgyId
 ppkLH46wtANqLTY3qiH/pzC+BTRBwRcWz2sCSFAC/DdA+1veVdPRotC6QBAByJITD38k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nSXsh-0007dc-RX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Mar 2022 05:32:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D27E61AF3;
 Fri, 11 Mar 2022 05:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1FDC340EC;
 Fri, 11 Mar 2022 05:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646976717;
 bh=WZxaV6Pf7jSxcq9QhrqU6a6XmApG4E+JJxhTiL/TA4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ob5ZHIgSUc7ffS1WUTii9bnVJtzk8WPUoL3UEGmI8LA/pPfuNB7aJAOSKJzkWpSQi
 6LyEO8syF9aVEj5/kWXYkHf64UtKZowR1dt+yzXVzuHt8QOILVdmvn14AWZfemWF8Z
 gRioblA5Yz3SMTchKuF0GTeIOFpHmvK2xP0Mt+8Racw4eelPzbjPuQLoTUM9PoLYpb
 lOoPGvSqe3ouw9n3e/szesfGwcLH1zHCJEA3pyUnIMcJq/RMLFZ79HFRQCQJf92kuL
 uu20kCmRhPJKE+nq/8Zu1kvu65ugM6zpbwbC3JAuQP+nEoBNPld58rMB3p3IbgSHYE
 ls+X6siohQP0A==
Date: Thu, 10 Mar 2022 21:31:55 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <YireyyQvUnC7cik+@sol.localdomain>
References: <20220306231727.GP3927073@dread.disaster.area>
 <CGME20220309042324epcas1p111312e20f4429dc3a17172458284a923@epcas1p1.samsung.com>
 <20220309133119.6915-1-mj0123.lee@samsung.com>
 <CO3PR08MB797524ACBF04B861D48AF612DC0B9@CO3PR08MB7975.namprd08.prod.outlook.com>
 <e98948ae-1709-32ef-e1e4-063be38609b1@kernel.dk>
 <CO3PR08MB797562AAE72BC201EB951C6CDC0B9@CO3PR08MB7975.namprd08.prod.outlook.com>
 <d477c7bf-f3a7-ccca-5472-f9cbb05b83c1@kernel.dk>
 <c27a5ec3-f683-d2a7-d5e7-fd54d2baa278@acm.org>
 <PH0PR08MB7889642784B2E1FC1799A828DB0B9@PH0PR08MB7889.namprd08.prod.outlook.com>
 <9d645cf0-1685-437a-23e4-b2a01553bba5@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d645cf0-1685-437a-23e4-b2a01553bba5@acm.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 10, 2022 at 02:18:19PM -0800, Bart Van Assche
 wrote: > On 3/10/22 13:52, Bean Huo (beanhuo) wrote: > > Yes, in upstream
 linux and upstream android, there is no such code. But as we know, > [...]
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nSXsh-0007dc-RX
Subject: Re: [f2fs-dev] [EXT] Re: [PATCH 2/2] block: remove the
 per-bio/request write hint.
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
Cc: "woosung2.lee@samsung.com" <woosung2.lee@samsung.com>,
 "david@fromorbit.com" <david@fromorbit.com>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "seunghwan.hyun@samsung.com" <seunghwan.hyun@samsung.com>,
 "song@kernel.org" <song@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>,
 "sagi@grimberg.me" <sagi@grimberg.me>,
 "jisoo2146.oh@samsung.com" <jisoo2146.oh@samsung.com>,
 "nanich.lee@samsung.com" <nanich.lee@samsung.com>,
 "yt0928.kim@samsung.com" <yt0928.kim@samsung.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "sookwan7.kim@samsung.com" <sookwan7.kim@samsung.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 "junho89.kim@samsung.com" <junho89.kim@samsung.com>,
 Manjong Lee <mj0123.lee@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBNYXIgMTAsIDIwMjIgYXQgMDI6MTg6MTlQTSAtMDgwMCwgQmFydCBWYW4gQXNzY2hl
IHdyb3RlOgo+IE9uIDMvMTAvMjIgMTM6NTIsIEJlYW4gSHVvIChiZWFuaHVvKSB3cm90ZToKPiA+
IFllcywgaW4gdXBzdHJlYW0gbGludXggYW5kIHVwc3RyZWFtIGFuZHJvaWQsIHRoZXJlIGlzIG5v
IHN1Y2ggY29kZS4gQnV0IGFzIHdlIGtub3csCj4gPiBtb2JpbGUgY3VzdG9tZXJzIGhhdmUgdXNl
ZCBiaW8tPmJpX3dyaXRlX2hpbnQgaW4gdGhlaXIgcHJvZHVjdHMgZm9yIHllYXJzLiBBbmQgdGhl
Cj4gPiBncm91cCBJRCBpcyBzZXQgYWNjb3JkaW5nIHRvIGJpby0+Ymlfd3JpdGVfaGludCBiZWZv
cmUgcGFzc2luZyB0aGUgQ0RCIHRvIFVGUy4KPiA+IAo+ID4gCj4gPiAJbHJicCA9ICZoYmEtPmxy
Ylt0YWddOwo+ID4gICAgICAgICAgICAgICAgV0FSTl9PTihscmJwLT5jbWQpOwo+ID4gICAgICAg
ICAgICAgICArIGlmKGNtZC0+Y21uZFswXSA9PSBXUklURV8xMCkKPiA+ICAgICAgICAgICAgICAg
ICt7Cj4gPiAgICAgICAgICAgICAgICAgICsgICAgICAgICAgICAgY21kLT5jbW5kWzZdID0gKDB4
MWYmIGNtZC0+cmVxdWVzdC0+YmlvLT5iaV93cml0ZV9oaW50KTsKPiA+ICAgICAgICAgICAgICAg
ICt9Cj4gPiAgICAgICAgICAgICAgICBscmJwLT5jbWQgPSBjbWQ7Cj4gPiAgICAgICAgICAgICAg
ICBscmJwLT5zZW5zZV9idWZmbGVuID0gVUZTX1NFTlNFX1NJWkU7Cj4gPiAgICAgICAgICAgICAg
ICBscmJwLT5zZW5zZV9idWZmZXIgPSBjbWQtPnNlbnNlX2J1ZmZlcjsKPiA+IAo+ID4gSSBkb24n
dCBrbm93IHdoeSB0aGV5IGRvbid0IHB1c2ggdGhlc2UgY2hhbmdlcyB0byB0aGUgY29tbXVuaXR5
LCBtYXliZQo+ID4gaXQncyBiZWNhdXNlIGNoYW5nZXMgYWNyb3NzIHRoZSBmaWxlIHN5c3RlbSBh
bmQgYmxvY2sgbGF5ZXJzIGFyZSB1bmFjY2VwdGFibGUgdG8gdGhlCj4gPiBibG9jayBsYXllciBh
bmQgRlMuIGJ1dCBmb3Igc3VyZSB3ZSBzaG91bGQgbm93IHdhcm4gdGhlbSB0byBwdXNoIHRvIHRo
ZQo+ID4gY29tbXVuaXR5IGFzIHNvb24gYXMgcG9zc2libGUuCj4gCj4gVGhhbmtzIEJlYW4gZm9y
IGhhdmluZyBzaGFyZWQgdGhpcyBpbmZvcm1hdGlvbi4gSSB0aGluayB0aGUgYWJvdmUgY29kZSBz
ZXRzIHRoZSBHUk9VUAo+IE5VTUJFUiBpbmZvcm1hdGlvbiBpbiB0aGUgV1JJVEUoMTApIGNvbW1h
bmQgYW5kIGFsc28gdGhhdCB0aGUgZm9sbG93aW5nIHRleHQgZnJvbSB0aGUKPiBVRlMgc3BlY2lm
aWNhdGlvbiBhcHBsaWVzIHRvIHRoYXQgaW5mb3JtYXRpb246Cj4gPHF1b3RlPgo+IEdST1VQIE5V
TUJFUjogTm90aWZpZXMgdGhlIFRhcmdldCBkZXZpY2UgdGhhdCB0aGUgZGF0YSBsaW5rZWQgdG8g
YSBDb250ZXh0SUQ6Cj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAgIEdS
T1VQIE5VTUJFUiBWYWx1ZSAgICAgfCAgRnVuY3Rpb24KPiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgMDAwMDBiICAgICAgICAgICAgICAgICAgICB8IERlZmF1bHQsIG5vIENv
bnRleHQgSUQgaXMgYXNzb2NpYXRlZCB3aXRoIHRoZSByZWFkIG9wZXJhdGlvbi4KPiAgMDAwMDFi
IHRvIDAxMTExYiAoMFhYWFhiKSB8IENvbnRleHQgSUQuIChYWFhYIEkgZnJvbSAwMDAxYiB0byAx
MTExYiDigJAgQ29udGV4dCBJRCB2YWx1ZSkKPiAgMTAwMDBiICAgICAgICAgICAgICAgICAgICB8
IERhdGEgaGFzIFN5c3RlbSBEYXRhIGNoYXJhY3RlcmlzdGljcwo+ICAxMDAwMWIgdG8gMTExMTFi
ICAgICAgICAgIHwgUmVzZXJ2ZWQKPiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAKPiBJbiBjYXNlIHRoZSBHUk9VUCBOVU1CRVIgaXMgc2V0IHRvIGEgcmVzZXJ2ZWQgdmFsdWUs
IHRoZSBvcGVyYXRpb24gc2hhbGwgZmFpbCBhbmQgYSBzdGF0dXMKPiByZXNwb25zZSBvZiBDSEVD
SyBDT05ESVRJT04gd2lsbCBiZSByZXR1cm5lZCBhbG9uZyB3aXRoIHRoZSBzZW5zZSBrZXkgc2V0
IHRvIElMTEVHQUwgUkVRVUVTVC4KPiA8L3F1b3RlPgo+IAo+IFNpbmNlIHRoZXJlIGlzIGEgZGVz
aXJlIHRvIHJlbW92ZSB0aGUgd3JpdGUgaGludCBpbmZvcm1hdGlvbiBmcm9tIHN0cnVjdCBiaW8s
IGlzIHRoZXJlCj4gYW55IG90aGVyIGluZm9ybWF0aW9uIHRoZSAic3lzdGVtIGRhdGEgY2hhcmFj
dGVyaXN0aWNzIiBpbmZvcm1hdGlvbiBjYW4gYmUgZGVyaXZlZCBmcm9tPwo+IEhvdyBhYm91dCBl
LmcuIGRlcml2aW5nIHRoYXQgaW5mb3JtYXRpb24gZnJvbSByZXF1ZXN0IGZsYWdzIGxpa2UgUkVR
X1NZTkMsIFJFUV9NRVRBIGFuZC9vcgo+IFJFUV9JRExFPwo+IAoKWytDYyBsaW51eC1mMmZzLWRl
dmVsXQoKSSB0aGluayB0aGUgZjJmcyBkZXZlbG9wZXJzIHdpbGwgbmVlZCB0byBjaGltZSBpbiBo
ZXJlLCBhcyBpdCBsb29rcyBsaWtlIGYyZnMKdXNlcyB0aGUgd3JpdGUgaGludHMgZm9yIGRpZmZl
cmVudCBkYXRhIGNhdGVnb3JpZXMgbGlrZSBob3QvY29sZC93YXJtLiAgSSdtIG5vdApzdXJlIHRo
b3NlIGNhbiBiZSBmdWxseSByZXByZXNlbnRlZCBieSBvdGhlciBiaW8gZmxhZ3MuCgpFaXRoZXIg
d2F5LCB0aGUgZ29vZCBuZXdzIGlzIHRoYXQgaXQgc291bmRzIGxpa2UgdGhpcyAiR1JPVVAgTlVN
QkVSIiB0aGluZyBpcwpwYXJ0IG9mIHRoZSBVRlMgc3RhbmRhcmQuICBTbyB3aGF0ZXZlciB0aGUg
YmVzdCB3YXkgdG8gc3VwcG9ydCBpdCBpcywgaXQgY2FuCmp1c3QgYmUgc3VibWl0dGVkIHVwc3Ry
ZWFtIGxpa2UgYW55IG90aGVyIHN0YW5kYXJkIFVGUyBmZWF0dXJlLiAgV2h5IGhhc24ndCB0aGF0
CmJlZW4gZG9uZT8KCi0gRXJpYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

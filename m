Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C67723028
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jun 2023 21:48:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6GCA-0004Ym-67;
	Mon, 05 Jun 2023 19:48:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q6GC8-0004Yc-SB
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 19:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AbTP/icYhaKI9eVEM9foTsbyTtAKszftp42FiFRjApE=; b=X/SMozeVQxvqol9AxAUB8/B59z
 xmxTcfmNgQQd3CADWrbyi31aRNujNxP8hvbueB/BK2rH0Qe7KEC3rhxRFt3SpWMBahLFYu3Gsw6JB
 UuGKkjBeMdL8lddi8HYbqkbGmEiHlksaPURfh8sDzFbtkrL7N9oNelljTaNCXoGo0dws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AbTP/icYhaKI9eVEM9foTsbyTtAKszftp42FiFRjApE=; b=HF1u0w08jR9t/KqFLnzAhGJyzp
 afcDm4zMnyMpFxMVIO9D4+P0Z3P/9W01smn8tJTwLR43c6MDLqDo5TK9KNBXxWhV53igEZBNg1ekk
 Da5RNofw9WSg3NJ6kZMaIW/wBkOasA6w25WL78w6bhS1kl1HXsd/Y5yhNlu081nXeBg4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6GC4-00C7vE-K0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 19:48:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60593629F9;
 Mon,  5 Jun 2023 19:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E147C433A1;
 Mon,  5 Jun 2023 19:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685994517;
 bh=Sueiie1DUsoUmYO3JzWY/sOCc4aMVdtU32UPjgG9EkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iiyaU3LoSTaZ0MQNp9WFck95P9tfxtA90k6+FX03l0u443qjgA/YZ/9MbPfwz9bsr
 gwf2OLNgFnTLNr4p7w/QN7UDLBjOzDCZ3ePfEwy5DpF54rhgvKf1IAkdTXq4R/eIZs
 oAAynFlWRlRmoT9qGW3JI+B0qsiCvL4or9laTtey+6ODdW5opbE2NI1++tRRGr64v1
 VuriNXXkrvBxp27bSEMMULbM3DPBeEt8ppxQT2d4ZDoE7llv55MPC8Sej58nYPI2W+
 omTAKgV5fOBck+NjNT9/V+qqWioIkQga/A29tpuxJMnzULtzGKDg0XkyO+Q1wZi9iS
 GJX5BKVpY60ow==
Date: Mon, 5 Jun 2023 12:48:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Juhyung Park <qkrwngud825@gmail.com>
Message-ID: <ZH48E4/AOtk1viOY@google.com>
References: <20230531125918.55609-1-frank.li@vivo.com>
 <CAD14+f1YoiSVvq2M1v8u5bUdCNN_0nurY4ued6ZFu1gaBSHxDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD14+f1YoiSVvq2M1v8u5bUdCNN_0nurY4ued6ZFu1gaBSHxDw@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/31, Juhyung Park wrote: > Hi Yangtao, > > I remember
 hearing that f2fs can perform relatively poorly under io_uring, > nice find.
 > > I suggest rewriting the commit message though. From the look [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6GC4-00C7vE-K0
Subject: Re: [f2fs-dev] [PATCH] f2fs: flag as supporting buffered async reads
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Lu Hongfei <luhongfei@vivo.com>, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDUvMzEsIEp1aHl1bmcgUGFyayB3cm90ZToKPiBIaSBZYW5ndGFvLAo+IAo+IEkgcmVtZW1i
ZXIgaGVhcmluZyB0aGF0IGYyZnMgY2FuIHBlcmZvcm0gcmVsYXRpdmVseSBwb29ybHkgdW5kZXIg
aW9fdXJpbmcsCj4gbmljZSBmaW5kLgo+IAo+IEkgc3VnZ2VzdCByZXdyaXRpbmcgdGhlIGNvbW1p
dCBtZXNzYWdlIHRob3VnaC4gRnJvbSB0aGUgbG9va3Mgb2YgaXQsIGl0Cj4gbWlnaHQgc3VnZ2Vz
dCB0aGF0IEZNT0RFX0JVRl9SQVNZTkMgaXMgYSBtYWdpYyBmbGFnIHRoYXQgYXV0b21hdGljYWxs
eQo+IGltcHJvdmVzIHBlcmZvcm1hbmNlIHRoYXQgY2FuIGJlIGVuYWJsZWQgd2lsbHkgbmlsbHku
Cj4gCj4gSG93IGFib3V0IHNvbWV0aGluZyBsaWtlOgo+IAo+IGYyZnMgdXNlcyBnZW5lcmljX2Zp
bGVfYnVmZmVyZWRfcmVhZCgpLCB3aGljaCBzdXBwb3J0cyBidWZmZXJlZCBhc3luYwo+IHJlYWRz
IHNpbmNlIGNvbW1pdCAxYTBhNzg1M2I5MDEgKCJtbTogc3VwcG9ydCBhc3luYyBidWZmZXJlZCBy
ZWFkcyBpbgo+IGdlbmVyaWNfZmlsZV9idWZmZXJlZF9yZWFkKCkiKS4KClRoYW5rcyBKdWh5dW5n
LAoKQXBwbGllZCB3aXRoIGEgbWlub3IgbW90aWZpY2F0aW9uIGJhc2VkIG9uIHlvdXJzLiA6KQoK
PiAKPiBNYXRjaCBvdGhlciBmaWxlLXN5c3RlbXMgYW5kIGVuYWJsZSBpdC4gVGhlIHJlYWQgcGVy
Zm9ybWFuY2UgaGFzIGJlZW4KPiBncmVhdGx5IGltcHJvdmVkIHVuZGVyIGlvX3VyaW5nOgo+IAo+
ICAgICAxNjdNL3MgLT4gMjM0TS9zLCBJbmNyZWFzZSByYXRpbyBieSA0MCUKPiAKPiBUZXN0IHcv
Ogo+ICAgICAuL2ZpbyAtLW5hbWU9b25lc3NkIC0tZmlsZW5hbWU9L2RhdGEvdGVzdC9sb2NhbC9p
b191cmluZ190ZXN0Cj4gICAgIC0tc2l6ZT0yNTZNIC0tcnc9cmFuZHJlYWQgLS1icz00ayAtLWRp
cmVjdD0wIC0tb3ZlcndyaXRlPTAKPiAgICAgLS1udW1qb2JzPTEgLS1pb2RlcHRoPTEgLS10aW1l
X2Jhc2VkPTAgLS1ydW50aW1lPTEwCj4gICAgIC0taW9lbmdpbmU9aW9fdXJpbmcgLS1yZWdpc3Rl
cmZpbGVzIC0tZml4ZWRidWZzCj4gICAgIC0tZ3RvZF9yZWR1Y2U9MSAtLWdyb3VwX3JlcG9ydGlu
ZyAtLXNxdGhyZWFkX3BvbGw9MQo+IAo+IE9uIFdlZCwgTWF5IDMxLCAyMDIzIGF0IDEwOjAx4oCv
UE0gWWFuZ3RhbyBMaSB2aWEgTGludXgtZjJmcy1kZXZlbAo+IDxsaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldD4gd3JvdGU6Cj4gPgo+ID4gQWZ0ZXIgZW5hYmxpbmcgdGhpcyBm
ZWF0dXJlLCB0aGUgcmVhZCBwZXJmb3JtYW5jZSBoYXMgYmVlbiBncmVhdGx5Cj4gPiBpbXByb3Zl
ZDoKPiA+Cj4gPiAgICAgMTY3TS9zIC0+IDIzNE0vcywgSW5jcmVhc2UgcmF0aW8gYnkgNDAlCj4g
Pgo+ID4gVGVzdCB3LzoKPiA+ICAgICAuL2ZpbyAtLW5hbWU9b25lc3NkIC0tZmlsZW5hbWU9L2Rh
dGEvdGVzdC9sb2NhbC9pb191cmluZ190ZXN0Cj4gPiAgICAgLS1zaXplPTI1Nk0gLS1ydz1yYW5k
cmVhZCAtLWJzPTRrIC0tZGlyZWN0PTAgLS1vdmVyd3JpdGU9MAo+ID4gICAgIC0tbnVtam9icz0x
IC0taW9kZXB0aD0xIC0tdGltZV9iYXNlZD0wIC0tcnVudGltZT0xMAo+ID4gICAgIC0taW9lbmdp
bmU9aW9fdXJpbmcgLS1yZWdpc3RlcmZpbGVzIC0tZml4ZWRidWZzCj4gPiAgICAgLS1ndG9kX3Jl
ZHVjZT0xIC0tZ3JvdXBfcmVwb3J0aW5nIC0tc3F0aHJlYWRfcG9sbD0xCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogTHUgSG9uZ2ZlaSA8bHVob25nZmVpQHZpdm8uY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4gPiAtLS0KPiA+ICBmcy9mMmZzL2Zp
bGUuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUu
Ywo+ID4gaW5kZXggMDE1ZWQyNzRkYzMxLi4yM2M2OGVlOTQ2ZTUgMTAwNjQ0Cj4gPiAtLS0gYS9m
cy9mMmZzL2ZpbGUuYwo+ID4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiA+IEBAIC01NDYsNyArNTQ2
LDcgQEAgc3RhdGljIGludCBmMmZzX2ZpbGVfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1
Y3QgZmlsZSAqZmlscCkKPiA+ICAgICAgICAgaWYgKGVycikKPiA+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gZXJyOwo+ID4KPiA+IC0gICAgICAgZmlscC0+Zl9tb2RlIHw9IEZNT0RFX05PV0FJVDsK
PiA+ICsgICAgICAgZmlscC0+Zl9tb2RlIHw9IEZNT0RFX05PV0FJVCB8IEZNT0RFX0JVRl9SQVNZ
TkM7Cj4gPgo+ID4gICAgICAgICByZXR1cm4gZHF1b3RfZmlsZV9vcGVuKGlub2RlLCBmaWxwKTsK
PiA+ICB9Cj4gPiAtLQo+ID4gMi4zOS4wCj4gPgo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiBo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=

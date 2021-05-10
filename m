Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE57337979F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 21:22:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgBUH-0000Ec-VX; Mon, 10 May 2021 19:22:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <tytso@mit.edu>)
 id 1lgBUD-0000E1-TA; Mon, 10 May 2021 19:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=im7yptB7Cnn0+/0nEjxp2q806kDi7qdxtBjeZI/94RE=; b=TZBbig48xKUagoQT6OYx+QkYky
 XdVBi0d5H/1QQUD72onrFsk6/QsLUshi5bi3+mNyMkHQ+HRMwGJEcuZJ3HOHvdY8LmSYKs9HyMSto
 Wf7NaXKZ4pWbq8j8rok+UmHs14yQiv6o0c0Spcebx3xZsygV7nRZASF7nXUlHJapT3CY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=im7yptB7Cnn0+/0nEjxp2q806kDi7qdxtBjeZI/94RE=; b=iqk1UCGTePE8qVBFpwN/aQjzBr
 yVm04PM5bvRc4wYnjqJokP0hi4dBHUjAQsd9wo99Guf6rRdfhzetOmcpEe19soXY6U8BmqND45zP7
 FGt7oa4zdr+e0vBjMu7NHGZLajmZkpBkq8YUeOCEeiMlA+uj3qk3x4+5zXZUCSI51Cpc=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgBU8-0005tg-Sp; Mon, 10 May 2021 19:22:37 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 14AJM3dI013584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 15:22:05 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id F267215C3CD9; Mon, 10 May 2021 15:22:02 -0400 (EDT)
Date: Mon, 10 May 2021 15:22:02 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <YJmH2irxoRsyNudb@mit.edu>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <de6d1fa5b7934f4afd61370d9c58502bef588466.camel@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de6d1fa5b7934f4afd61370d9c58502bef588466.camel@infradead.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lgBU8-0005tg-Sp
Subject: Re: [f2fs-dev] [PATCH 00/53] Get rid of UTF-8 chars that can be
 mapped as ASCII
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 linux-acpi@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-sgx@vger.kernel.org,
 coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-rdma@vger.kernel.org, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBNYXkgMTAsIDIwMjEgYXQgMDI6NDk6NDRQTSArMDEwMCwgRGF2aWQgV29vZGhvdXNl
IHdyb3RlOgo+IE9uIE1vbiwgMjAyMS0wNS0xMCBhdCAxMzo1NSArMDIwMCwgTWF1cm8gQ2FydmFs
aG8gQ2hlaGFiIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgZG9pbmcgY29udmVyc2lv
biBvbmx5IHdoZW4gdXNpbmcgQVNDSUkgbWFrZXMKPiA+IG1vcmUgc2Vuc2UgdGhhbiB1c2luZyBV
VEYtOC4gCj4gPiAKPiA+IFNlZSwgYSBudW1iZXIgb2YgY29udmVydGVkIGRvY3VtZW50cyBlbmRl
ZCB3aXRoIHdlaXJkIGNoYXJhY3RlcnMKPiA+IGxpa2UgWkVSTyBXSURUSCBOTy1CUkVBSyBTUEFD
RSAoVStGRUZGKSBjaGFyYWN0ZXIuIFRoaXMgc3BlY2lmaWMKPiA+IGNoYXJhY3RlciBkb2Vzbid0
IGRvIGFueSBnb29kLgo+ID4gCj4gPiBPdGhlcnMgdXNlIE5PLUJSRUFLIFNQQUNFIChVK0EwKSBp
bnN0ZWFkIG9mIDB4MjAuIEhhcm1sZXNzLCB1bnRpbAo+ID4gc29tZW9uZSB0cmllcyB0byB1c2Ug
Z3JlcFsxXS4KPiAKPiBSZXBsYWNpbmcgdGhvc2UgbWFrZXMgc2Vuc2UuIEJ1dCByZXBsYWNpbmcg
ZW1kYXNoZXMg4oCUIHdoaWNoIGFyZSBhCj4gZGlzdGluY3QgY2hhcmFjdGVyIHRoYXQgaGFzIG5v
IGRpcmVjdCByZXBsYWNlbWVudCBpbiBBU0NJSSBhbmQgd2hpY2gKPiBwZW9wbGUgZG8gKmRlbGli
ZXJhdGVseSogdXNlIGluc3RlYWQgb2YgaHlwaGVuLW1pbnVzIOKAlCBkb2VzIG5vdC4KCkkgcmVn
dWxhcmx5IHVzZSAtLS0gZm9yIGVtLWRhc2hlcyBhbmQgLS0gZm9yIGVuLWRhc2hlcy4gIE1hcmtk
b3duIHdpbGwKYXV0b21hdGljYWxseSB0cmFuc2xhdGUgMyBBU0NJSSBoeXBlbnMgdG8gZW0tZGFz
aGVzLCBhbmQgMiBBU0NJSQpoeXBoZW5zIHRvIGVuLWRhc2hlcy4gIEl0J3MgbXVjaCwgbXVjaCBl
YXNpZXIgZm9yIG1lIHRvIHR5cGUgMiBvciAzCmh5cGVucyBpbnRvIG15IHRleHQgZWRpdG9yIG9m
IGNob2ljZSB0aGFuIHRyeWluZyB0byBlbnRlciB0aGUgVVRGLTgKY2hhcmFjdGVycy4gIElmIHdl
IGNhbiBtYWtlIHNwaGlueCBkbyB0aGlzIHRyYW5zbGF0aW9uLCBtYXliZSB0aGF0J3MKdGhlIGJl
c3Qgd2F5IG9mIGRlYWxpbmcgd2l0aCB0aGVzZSB0d28gY2hhcmFjdGVycz8KCkNoZWVycywKCgkJ
CQkJLSBUZWQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==

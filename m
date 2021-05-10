Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE16379A21
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 00:34:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgETU-0001Lh-Mh; Mon, 10 May 2021 22:34:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <kilobyte@angband.pl>)
 id 1lgETT-0001LQ-Ag; Mon, 10 May 2021 22:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gJGpFaB3hD4HkiIWd+mO95z/N9f2/pmkZ9Bg1WNsE34=; b=GUROK94dwuu8GmkK/hr2JI7SyH
 wVr0t0p7lY88z0eU9dgzAiZXYGRNa+AV3EkZBAzuc5WGsGkh4XDjUEugu+YDslpLosGxedn5FdHyj
 9Z06oadMPnB3MGE54qdK4pxtMuJdexPLUjHO9JqKUptQALkMZFaadAscIH0nMoEN9dKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gJGpFaB3hD4HkiIWd+mO95z/N9f2/pmkZ9Bg1WNsE34=; b=LxJm6U7pAyC0HxgXfUbETaBkdM
 +OiVGqKXxPpThxkcNRtmIJSsaZam0ZCkS1YjfDZMK6OebbZDfdLeEtvbzD7vnKAm1CEDshrSAamv7
 ha5BvGy9d3M9ve8Tm8OEEGXP5jb7dsobVwiX7RZJWks/ThEMdUjq6PAhuYgGZ2y/JBjg=;
Received: from tartarus.angband.pl ([51.83.246.204])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgETN-0007am-UG; Mon, 10 May 2021 22:34:03 +0000
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1lgDtp-00EKjz-Lm; Mon, 10 May 2021 23:57:13 +0200
Date: Mon, 10 May 2021 23:57:13 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <YJmsOYzPIsQ04Zxb@angband.pl>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lgETN-0007am-UG
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
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBNYXkgMTAsIDIwMjEgYXQgMTI6MjY6MTJQTSArMDIwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgo+IFRoZXJlIGFyZSBzZXZlcmFsIFVURi04IGNoYXJhY3RlcnMgYXQgdGhl
IEtlcm5lbCdzIGRvY3VtZW50YXRpb24uClsuLi5dCj4gT3RoZXIgVVRGLTggY2hhcmFjdGVycyB3
ZXJlIGFkZGVkIGFsb25nIHRoZSB0aW1lLCBidXQgdGhleSdyZSBlYXNpbHkKPiByZXBsYWNlYWJs
ZSBieSBBU0NJSSBjaGFycy4KPiAKPiBBcyBMaW51eCBkZXZlbG9wZXJzIGFyZSBhbGwgYXJvdW5k
IHRoZSBnbG9iZSwgYW5kIG5vdCBldmVyeWJvZHkgaGFzIFVURi04Cj4gYXMgdGhlaXIgZGVmYXVs
dCBjaGFyc2V0CgpJJ20gbm90IGF3YXJlIG9mIGEgZGlzdHJpYnV0aW9uIHRoYXQgc3RpbGwgYWxs
b3dzIHNlbGVjdGluZyBhIG5vbi1VVEYtOApjaGFyc2V0IGluIGEgbm9ybWFsIGZsb3cgaW4gdGhl
aXIgaW5zdGFsbGVyLiAgQW5kIGlmIHRoZXkgaGF2ZW4ndCBwdXJnZWQKc3VwcG9ydCBmb3IgYW5j
aWVudCBlbmNvZGluZ3MsIHRoYXQgc3VwcG9ydCBpcyB0aG9yb3VnaGx5IGJpdHJvdHRlbi4KVGh1
cywgSSBkaXNhZ3JlZSB0aGF0IHRoaXMgaXMgYSBsZWdpdGltYXRlIGNvbmNlcm4uCgpXaGF0IF9j
b3VsZF8gYmUgYSBsZWdpdGltYXRlIHJlYXNvbiBpcyB0aGF0IHNvbWVvbmUgaXMgb24gYSBfdGVy
bWluYWxfCnRoYXQgY2FuJ3QgZGlzcGxheSBhIHdpZGUgZW5vdWdoIHNldCBvZiBnbHlwaHMuICBT
dWNoIHRlcm1pbmFscyBhcmU6CiDigKIgTGludXggY29uc29sZSAoYmVjYXVzZSBvZiB2Z2Fjb24g
bGltaXRhdGlvbnM7IHBhdGNoc2V0cyB0byBpbXByb3ZlCiAgIG90aGVyIGNvbnMgaGF2ZW4ndCBi
ZWVuIG1haW5saW5lZCkKIOKAoiBzb21lIFdpbmRvd3MgdGVybWluYWxzIChwdXR0eSwgb2xkIFdp
bmRvd3MgY29uc29sZSkgdGhhdCBjYW4ndCBib3Jyb3cKICAgZ2x5cGhzIGZyb20gb3RoZXIgZm9u
dHMgbGlrZSBmb250Y29uZmlnIGNhbgoKRm9yIHRoZSBmb3JtZXIsIGl0J3Mgd2hhdGV2ZXIgeW91
ciBkaXN0cmlidXRpb24gc2hpcHMgaW4KL3Vzci9zaGFyZS9jb25zb2xlZm9udHMvIG9yIGFuIGVx
dWl2YWxlbnQsIHdoaWNoIGlzIGJhc2VkIG9uIGhpc3RvcmljCklTTy04ODU5IGFuZCBWVDEwMCB0
cmFkaXRpb25zLgoKRm9yIHRoZSBsYXR0ZXIsIHRoZSBuZWFyLWd1YXJhbnRlZWQgY2hhcmFjdGVy
IHNldCBpcyBXR0w0LgoKClRodXMsIGF0IGxlYXN0IHR3byBvZiB5b3VyIGNob2ljZXMgc2VlbSB0
byBkaXNhZ3JlZSB3aXRoIHRoZSBhYm92ZToKW2Ryb3BwZWRdCj4gCTB4ZDcgICA9PiAneCcsCQkj
IE1VTFRJUExJQ0FUSU9OIFNJR04KW3JldGFpbmVkXQo+IAktIFUrMmIwZCAoJ+KsjScpOiBVUCBE
T1dOIEJMQUNLIEFSUk9XCgrDlyBpcyBwcmVzZW50IGluIElTTy04ODU5LCBWMTAwLCBXR0w0OyBJ
J3ZlIGZvdW5kIG5vIGZvbnQgaW4KL3Vzci9zaGFyZS9jb25zb2xlZm9udHMvIG9uIG15IERlYmlh
biB1bnN0YWJsZSBib3ggdGhhdCBsYWNrcyB0aGlzCmNoYXJhY3Rlci4KCuKsjSBpcyBub3QgZm91
bmQgaW4gYW55IG9mIHRoZSBhYm92ZS4gIFlvdSBtaWdodCB3YW50IHRvIGF0IGxlYXN0CmNvbnZl
cnQgaXQgdG8g4oaVIHdoaWNoIGlzIGF0IGxlYXN0IHByZXNlbnQgaW4gV0dMNCwgYW5kIHRodXMg
bGlrZWx5CnRvIGJlIHN1cHBvcnRlZCBpbiBmb250cyBoZWVkaW5nIFdpbmRvd3MvTWFjL09wZW5U
eXBlIHJlY29tbWVuZGF0aW9ucy4KVGhhdCBzdGlsbCB3b24ndCBtYWtlIGl0IHdvcmsgb24gVlQu
CgoKTWVvdyEKLS0gCuKigOKjtOKgvuKgu+KituKjpuKggCAuLS1bIE1ha2VmaWxlIF0K4qO+4qCB
4qKg4qCS4qCA4qO/4qGBICMgYmV3YXJlIG9mIHJhY2VzCuKiv+KhhOKgmOKgt+KgmuKgi+KggCBh
bGw6IHBpbGxhZ2UgYnVybgrioIjioLPio4TioIDioIDioIDioIAgYC0tLS0KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

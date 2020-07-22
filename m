Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C62E4229FEA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 21:10:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyK8S-0005b6-Lo; Wed, 22 Jul 2020 19:10:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jyK8R-0005ax-6U
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 19:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NFga4tVEPO1PwxehibpOWF13Tw0wj2xQt9M2LGRme6s=; b=L45dyT2Lx9JK8GM+6vS4H0h1tQ
 9/KOi3370rCIz30O1UzvKv8B/svpMz7vFGT/Ts7rNx600s5DGuzwkNfy7C3tGh8vRtLrQlULq85Jj
 Iaw3wmK1IrfHtvUrGe+EbEd5Gr6jdGPKsQ5qqlGwylSBV78Zg4gls8Oq3vvMhKNTjzY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NFga4tVEPO1PwxehibpOWF13Tw0wj2xQt9M2LGRme6s=; b=Vm9ZFtk4pTqfDAWOWD7qAIeFxG
 WsMe9DAm23glVAZf78NYO39tFWb8Xhoco3vudLGKL6bCwPIu7iLbFbU/iFOprM+lhgbbssSiugsR/
 8Swzqy5cwqDogDzeytuyxK6GD/HHWgjfWpCs9Ud80ArgNuJ3RPqnHNTaVnXQM32+XPQ4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyK8P-005EIV-PF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 19:10:35 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A34E204EA;
 Wed, 22 Jul 2020 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595445021;
 bh=+t3jY0IpTJCIfsWEdsuY3x3kM796R1C8EohXWaLiw9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ebBukWMp5zxK6NJqb9nkijuy9EKOVU5lqYjUPomAlvOI+/ju8xrtyp6vOWZjcZpDT
 c3Qz1bSqDg5ljLRcS6+tBZHWGkz/PHcnaOAakmgFGT0PzLBBNPrFLqsBY6kA45UDdL
 0yg53bLhy0ZvdZ5lnTPO56hUnUzhVcNbGyDroYiA=
Date: Wed, 22 Jul 2020 21:10:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200722191026.GA583549@kroah.com>
References: <20200719054409.3050516-1-daeho43@gmail.com>
 <20200719151640.GA301791@kroah.com>
 <20200722164356.GA3912099@google.com>
 <20200722170602.GA440171@kroah.com>
 <20200722172437.GH3912099@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722172437.GH3912099@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyK8P-005EIV-PF
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add sysfs symbolic link to kobject
 with volume name
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdWwgMjIsIDIwMjAgYXQgMTA6MjQ6MzdBTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4gT24gMDcvMjIsIEdyZWcgS0ggd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAyMiwgMjAyMCBh
dCAwOTo0Mzo1NkFNIC0wNzAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+ID4gT24gMDcvMTksIEdy
ZWcgS0ggd3JvdGU6Cj4gPiA+ID4gT24gU3VuLCBKdWwgMTksIDIwMjAgYXQgMDI6NDQ6MDhQTSAr
MDkwMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiA+ID4gPiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFl
aG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBZGRlZCBhIHN5bWJvbGlj
IGxpbmsgZGlyZWN0b3J5IHBvaW50aW5nIHRvIGl0cyBkZXZpY2UgbmFtZQo+ID4gPiA+ID4gZGly
ZWN0b3J5IHVzaW5nIHRoZSB2b2x1bWUgbmFtZSBvZiB0aGUgcGFydGl0aW9uIGluIHN5c2ZzLgo+
ID4gPiA+ID4gKGkuZS4sIC9zeXMvZnMvZjJmcy92b2xfI3ggLT4gL3N5cy9mcy9mMmZzL3NkYTEp
Cj4gPiA+ID4gCj4gPiA+ID4gTm8sIHBsZWFzZSBuby4KPiA+ID4gPiAKPiA+ID4gPiBUaGF0IGlz
IGFscmVhZHkgY3JlYXRlZCB0b2RheSBmb3IgeW91IGluIC9kZXYvZGlzay8gIFRoZSBrZXJuZWwg
ZG9lcyBub3QKPiA+ID4gPiBuZWVkIHRvIGRvIHRoaXMgYWdhaW4uCj4gPiA+ID4gCj4gPiA+ID4g
SWYgeW91ciBkaXN0cm8vc3lzdGVtL3doYXRldmVyIGRvZXMgbm90IHByb3ZpZGUgeW91IHdpdGgg
L2Rldi9kaXNrLyBhbmQKPiA+ID4gPiBhbGwgb2YgdGhlIHN5bWxpbmtzIGluIHRoZXJlLCB0aGVu
IHdvcmsgd2l0aCB5b3VyIGRpc3Ryby9zeXN0ZW0vd2hhdGV2ZXIKPiA+ID4gPiB0byBkbyBzby4K
PiA+ID4gCj4gPiA+IEkgZG9uJ3QgZ2V0IHRoZSBwb2ludCwgc2luY2UgL2Rldi9kaXNrIHBvaW50
cyBkZXZpY2Ugbm9kZSwgbm90IGFueSBzeXNmcyBlbnRyeS4KPiA+ID4gRG8geW91IG1lYW4gd2Ug
bmVlZCB0byBjcmVhdGUgc3ltbGluayB0byAvc3lzL2ZzL2YyZnMvZG0tWCBpbiAvZGV2L2Rpc2s/
Cj4gPiAKPiA+IEh1aCwgbm8hICBJdCdzIGFsbCBkb25lIGZvciB5b3UgdG9kYXkgYXV0b21hZ2lj
YWxseSBieSB1c2Vyc3BhY2U6Cj4gPiAKPiA+ICQgdHJlZSAvZGV2L2Rpc2svYnktbGFiZWwvCj4g
PiAvZGV2L2Rpc2svYnktbGFiZWwvCj4gPiDilJzilIDilIAgYm9vdCAtPiAuLi8uLi9zZGExCj4g
PiDilJzilIDilIAgZmFzdF9kaXNrIC0+IC4uLy4uL21kMAo+ID4g4pSc4pSA4pSAIHJvb3QgLT4g
Li4vLi4vc2RhMgo+ID4g4pSU4pSA4pSAIHN0dWZmIC0+IC4uLy4uL2RtLTAKPiA+IAo+ID4gTG9v
ayBvbiB5b3VyIGxhcHRvcC9kZXNrdG9wL3NlcnZlciB0b2RheSBmb3IgdGhvc2UsIHRoZXJlJ3Mg
bG90cyBvZgo+ID4gc3ltbGlua3MgaW4gL2Rldi9kaXNrLwo+IAo+IFdoYXQgSSBtZWFuIGlzICJj
cmVhdGluZyBzeW1saW5rIGZyb20gKnVzZXJzcGFjZSoiLCBidXQgdGhlIGNvbmNlcm4gaXMKPiAi
L2Rldi8iIGxvb2tzIGxpa2UgYmVpbmcgdXNlZCBmb3IgZGV2aWNlIG5vZGVzIG9ubHksIG5vdCBz
eXNmcy4KClRoYXQgaXMgY29ycmVjdCwgdGhhdCBpcyB3aGF0IC9kZXYvIGlzIGZvciwgbm90IHN5
c2ZzLgoKPiA+ID4gPiBBZ2Fpbiwgbm8gbmVlZCB0byBkbyB0aGlzIG9uIGEgcGVyLWZpbGVzeXN0
ZW0tYmFzaXMgd2hlbiB3ZSBhbHJlYWR5IGhhdmUKPiA+ID4gPiB0aGlzIGFyb3VuZCBmb3IgYWxs
IGZpbGVzeXN0ZW1zLCBhbmQgaGF2ZSBoYWQgaXQgZm9yIDE1KyB5ZWFycyBub3cuCj4gPiA+IAo+
ID4gPiBDb3VsZCB5b3UgcG9pbnQgb3V0IHdoZXJlIHdlIGNhbiBnZXQgdGhpcz8gQW5kLCB0aGUg
bGFiZWwgc3VwcG9ydCBkZXBlbmRzCj4gPiA+IG9uIHBlci1maWxlc3lzdGVtIGRlc2lnbi4gSSdt
IG5vdCBzdXJlIGhvdyB0aGlzIGNhbiBiZSBnZW5lcmljIGVub3VnaC4KPiA+IAo+ID4gVXNlcnNw
YWNlIGtub3dzIGhvdyB0byByZWFkIGxhYmVscyBvbiBhIHBlci1maWxlc3lzdGVtLWJhc2lzIGFu
ZCBkb2VzIHNvCj4gPiBqdXN0IGZpbmUuICBUaGF0J3MgaG93IGl0IGNyZWF0ZXMgdGhvc2Ugc3lt
bGlua3MsIG5vIGtlcm5lbCBzdXBwb3J0IGlzCj4gPiBuZWVkZWQuCj4gPiAKPiA+IFRoaXMgaGFz
IGJlZW4gaW1wbGVtZW50ZWQgZm9yIDE1KyB5ZWFycyBub3csIGl0J3Mgbm90IGEgbmV3IHRoaW5n
Li4uCj4gPiAKPiA+IE5vdyBpZiB5b3VyIGVtYmVkZGVkIHN5c3RlbSBkb2Vzbid0IHN1cHBvcnQg
aXQsIHRoYXQncyB0aGUgdXNlcnNwYWNlIG9mCj4gPiB0aGF0IHN5c3RlbSdzIGZhdWx0LCBpdCdz
IG5vdCB0aGUga2VybmVsJ3MgZmF1bHQgYXQgYWxsLiAgR28gZml4IHlvdXIKPiA+IHVzZXJzcGFj
ZSBpZiB5b3Ugd2FudCB0aG9zZSB0aGluZ3MuCj4gCj4gSSdtIG5vdCB0YWxraW5nIGFib3V0IHdo
b3NlIGZhdWx0IHRoby4gOikgQnkgYW55IGNoYW5jZSwgY291bGQgeW91IHBsZWFzZQo+IHN1Z2dl
c3QgYSBnb29kIGxvY2F0aW9uIHRvIGNyZWF0ZSBhIHN5bWxpbmsgZm9yIHRoaXMgc3lzZnMgZW50
cnk/CgpUaGVyZSBpcyBubyBuZWVkIGZvciBzdWNoIGEgc3lzZnMgZW50cnksIHRoYXQncyB3aGF0
IEkgYW0gdHJ5aW5nIHRvIHNheS4KVXNlcnNwYWNlIGFscmVhZHkgaGFzIGFsbCBvZiB0aGUgbmVl
ZGVkIGluZm9ybWF0aW9uIGhlcmUsIGRvIG5vdCB0cnkgdG8KYWRkIGZpbGVzeXN0ZW0tc3BlY2lm
aWMgc3R1ZmYgbGlrZSB0aGlzLCB1bmxlc3MgeW91IHNvbWVob3cgYXJlIGdvaW5nIHRvCmRvIGl0
IGZvciBhbGwgZmlsZXN5c3RlbXMgOikKCnRoYW5rcywKCmdyZWd0IGstaAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

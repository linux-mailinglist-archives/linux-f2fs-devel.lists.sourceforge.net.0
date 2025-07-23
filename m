Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7BB0ED2A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Jul 2025 10:27:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMjSYZHFj9P2IjcCSlI117X0hTm5c/cWSq+HGkE/69g=; b=H5dmu+cu394+jGvLPGB27Jj6LC
	XUBCtf0x9tceRtRT6J8M2OhowOrDFxN4gb2LSqRwtETDqIBlHF66mjgDzsxgmkWNhVRnh1LQS7/0h
	ifx+0J+gL42HQ27wrYoAINgXCmdXf0AOZgfGwndCrX91WPaWrktAf3062f/prSfwaS2w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ueUoW-0003Hu-DJ;
	Wed, 23 Jul 2025 08:27:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lee@kernel.org>) id 1ueUoQ-0003Hh-TX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Jul 2025 08:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FQ+VyPyuJ9BF9KJNTT8a6KL8HW93COFxJiOcWWiZ6kc=; b=QnUAXF1A2m1CmvfeN12O44cWKR
 NbYGimZNc2dK+yBS7vmASfQ0KYfZPt532nZ4yZRuU6aFWc8CII5+FzOk8nF8nsafSMUG/a39j+DYc
 +3O373tHDvXHsLFSUide+whKSecOos0nPsx4TDFy9k8z5QmEy58Wtg/+QxTdMoWnFNP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FQ+VyPyuJ9BF9KJNTT8a6KL8HW93COFxJiOcWWiZ6kc=; b=SUZcZLRLd/AKFTd57JBrcx0gKS
 Y6p4mvErehAD4IngbDn/N/X5JbYkWn6mRE5Tza6BdO9zVbuy+mQVrvcHa9QOey7nqppwDyuyhTM+q
 3lcOH6zX8CI4R9HI3iHClX9lBQXPUz++VXhfvdxXZidXDvK4aKwopNmdd8u8jshI28wk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ueUoQ-0007eR-6o for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Jul 2025 08:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCC895C3EE6;
 Wed, 23 Jul 2025 08:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDB4C4CEF4;
 Wed, 23 Jul 2025 08:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753259203;
 bh=9F3qcFa7nxhCO6oCr83/3PirteKZEtY+uAO1GJkXWZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gnBv5F77Mz4e0TUBNQOPEf9NHcNDjSFJYoXyQYGU8Ge/wPwCGqkwyum5XY+H1tc5B
 2Mxg1StT8l/4ATTOL9HrSbPK9d8cVJn1MClIA/0T04r92kzyC+N9tQ4WPpJraYZTQk
 N6OvEF8H3eP3dhpgjsjkPxX2p2kcXAt3pec/9WJ6esAeA66Acle9h1gvje41AVnPCD
 yJ8yGUOzTA65WWnqgXRh0DezoVHOZyyEmZdaErViaBLSWi9cO8axrEvNPnYeWWj5QS
 9mn2mbJL+MXvTNAE7q60zWop8dDbWRIon0KSLWFkd1QNtPGkyXKTIO0j6BG2EYJF2F
 KQvLzJIKuN5gQ==
Date: Wed, 23 Jul 2025 09:26:39 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20250723082639.GP11056@google.com>
References: <20250416054805.1416834-1-chao@kernel.org>
 <20250624100039.GA3680448@google.com>
 <2025070253-erased-armadillo-0984@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2025070253-erased-armadillo-0984@gregkh>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 02 Jul 2025, Greg Kroah-Hartman wrote: > On Tue, Jun
 24, 2025 at 11:00:39AM +0100, Lee Jones wrote: > > On Wed, 16 Apr 2025, Chao
 Yu wrote: > > > > > This patch adds a new sysfs entry
 /sys/fs/f2fs/<disk>/encoding_flags, > > > it is a read- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ueUoQ-0007eR-6o
Subject: Re: [f2fs-dev] [STABLE 5.15+] f2fs: sysfs: add encoding_flags entry
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
From: Lee Jones via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lee Jones <lee@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCAwMiBKdWwgMjAyNSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgoKPiBPbiBUdWUs
IEp1biAyNCwgMjAyNSBhdCAxMTowMDozOUFNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBP
biBXZWQsIDE2IEFwciAyMDI1LCBDaGFvIFl1IHdyb3RlOgo+ID4gCj4gPiA+IFRoaXMgcGF0Y2gg
YWRkcyBhIG5ldyBzeXNmcyBlbnRyeSAvc3lzL2ZzL2YyZnMvPGRpc2s+L2VuY29kaW5nX2ZsYWdz
LAo+ID4gPiBpdCBpcyBhIHJlYWQtb25seSBlbnRyeSB0byBzaG93IHRoZSB2YWx1ZSBvZiBzYi5z
X2VuY29kaW5nX2ZsYWdzLCB0aGUKPiA+ID4gdmFsdWUgaXMgaGV4YWRlY2ltYWwuCj4gPiA+IAo+
ID4gPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT0gICAgICA9PT09PT09PT09Cj4gPiA+IEZs
YWdfTmFtZSAgICAgICAgICAgICAgICAgICAgICAgIEZsYWdfVmFsdWUKPiA+ID4gPT09PT09PT09
PT09PT09PT09PT09PT09PT09ICAgICAgPT09PT09PT09PQo+ID4gPiBTQl9FTkNfU1RSSUNUX01P
REVfRkwgICAgICAgICAgICAweDAwMDAwMDAxCj4gPiA+IFNCX0VOQ19OT19DT01QQVRfRkFMTEJB
Q0tfRkwgICAgIDB4MDAwMDAwMDIKPiA+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09ICAg
ICAgPT09PT09PT09PQo+ID4gPiAKPiA+ID4gY2FzZSMxCj4gPiA+IG1rZnMuZjJmcyAtZiAtTyBj
YXNlZm9sZCAtQyB1dGY4OnN0cmljdCAvZGV2L3ZkYQo+ID4gPiBtb3VudCAvZGV2L3ZkYSAvbW50
L2YyZnMKPiA+ID4gY2F0IC9zeXMvZnMvZjJmcy92ZGEvZW5jb2RpbmdfZmxhZ3MKPiA+ID4gMQo+
ID4gPiAKPiA+ID4gY2FzZSMyCj4gPiA+IG1rZnMuZjJmcyAtZiAtTyBjYXNlZm9sZCAtQyB1dGY4
IC9kZXYvdmRhCj4gPiA+IGZzY2suZjJmcyAtLW5vbGluZWFyLWxvb2t1cD0xIC9kZXYvdmRhCj4g
PiA+IG1vdW50IC9kZXYvdmRhIC9tbnQvZjJmcwo+ID4gPiBjYXQgL3N5cy9mcy9mMmZzL3ZkYS9l
bmNvZGluZ19mbGFncwo+ID4gPiAyCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1
IDxjaGFvQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9BQkkvdGVz
dGluZy9zeXNmcy1mcy1mMmZzIHwgMTMgKysrKysrKysrKysrKwo+ID4gPiAgZnMvZjJmcy9zeXNm
cy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrCj4gPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKPiA+IAo+ID4gVGhpcyBwYXRjaCwgY29tbWl0IDYx
N2UwNDkxYWJlNCAoImYyZnM6IHN5c2ZzOiBleHBvcnQgbGluZWFyX2xvb2t1cCBpbgo+ID4gZmVh
dHVyZXMgZGlyZWN0b3J5IikgdXBzdHJlYW0sIG5lZWRzIHRvIGZpbmQgaXRzIHdheSBpbnRvIGFs
bCBTdGFibGUKPiA+IGJyYW5jaGVzIGNvbnRhaW5pbmcgdXBzdHJlYW0gY29tbWl0IDkxYjU4N2Jh
NzllMSAoImYyZnM6IEludHJvZHVjZQo+ID4gbGluZWFyIHNlYXJjaCBmb3IgZGVudHJpZXMiKSwg
d2hpY2ggaXMgZXNzZW50aWFsbHkgbGludXgtNS4xNS55IGFuZAo+ID4gbmV3ZXIuCj4gPiAKPiA+
IHN0YWJsZS9saW51eC01LjQueToKPiA+IE1JU1NJTkc6ICAgICBmMmZzOiBJbnRyb2R1Y2UgbGlu
ZWFyIHNlYXJjaCBmb3IgZGVudHJpZXMKPiA+IE1JU1NJTkc6ICAgICBmMmZzOiBzeXNmczogZXhw
b3J0IGxpbmVhcl9sb29rdXAgaW4gZmVhdHVyZXMgZGlyZWN0b3J5Cj4gPiAKPiA+IHN0YWJsZS9s
aW51eC01LjEwLnk6Cj4gPiBNSVNTSU5HOiAgICAgZjJmczogSW50cm9kdWNlIGxpbmVhciBzZWFy
Y2ggZm9yIGRlbnRyaWVzCj4gPiBNSVNTSU5HOiAgICAgZjJmczogc3lzZnM6IGV4cG9ydCBsaW5l
YXJfbG9va3VwIGluIGZlYXR1cmVzIGRpcmVjdG9yeQo+ID4gCj4gPiBzdGFibGUvbGludXgtNS4x
NS55Ogo+ID4gYjA5MzhmZmQzOWFlIGYyZnM6IEludHJvZHVjZSBsaW5lYXIgc2VhcmNoIGZvciBk
ZW50cmllcyBbNS4xNS4xNzldCj4gPiBNSVNTSU5HOiAgICAgZjJmczogc3lzZnM6IGV4cG9ydCBs
aW5lYXJfbG9va3VwIGluIGZlYXR1cmVzIGRpcmVjdG9yeQo+ID4gCj4gPiBzdGFibGUvbGludXgt
Ni4xLnk6Cj4gPiBkZTYwNTA5N2ViMTcgZjJmczogSW50cm9kdWNlIGxpbmVhciBzZWFyY2ggZm9y
IGRlbnRyaWVzIFs2LjEuMTI5XQo+ID4gTUlTU0lORzogICAgIGYyZnM6IHN5c2ZzOiBleHBvcnQg
bGluZWFyX2xvb2t1cCBpbiBmZWF0dXJlcyBkaXJlY3RvcnkKPiA+IAo+ID4gc3RhYmxlL2xpbnV4
LTYuNi55Ogo+ID4gMGJmMmFkYWQwM2UxIGYyZnM6IEludHJvZHVjZSBsaW5lYXIgc2VhcmNoIGZv
ciBkZW50cmllcyBbNi42Ljc2XQo+ID4gTUlTU0lORzogICAgIGYyZnM6IHN5c2ZzOiBleHBvcnQg
bGluZWFyX2xvb2t1cCBpbiBmZWF0dXJlcyBkaXJlY3RvcnkKPiA+IAo+ID4gc3RhYmxlL2xpbnV4
LTYuMTIueToKPiA+IDAwZDE5NDNmZTQ2ZCBmMmZzOiBJbnRyb2R1Y2UgbGluZWFyIHNlYXJjaCBm
b3IgZGVudHJpZXMgWzYuMTIuMTNdCj4gPiBNSVNTSU5HOiAgICAgZjJmczogc3lzZnM6IGV4cG9y
dCBsaW5lYXJfbG9va3VwIGluIGZlYXR1cmVzIGRpcmVjdG9yeQo+ID4gCj4gPiBtYWlubGluZToK
PiA+IDkxYjU4N2JhNzllMSBmMmZzOiBJbnRyb2R1Y2UgbGluZWFyIHNlYXJjaCBmb3IgZGVudHJp
ZXMKPiA+IDYxN2UwNDkxYWJlNCBmMmZzOiBzeXNmczogZXhwb3J0IGxpbmVhcl9sb29rdXAgaW4g
ZmVhdHVyZXMgZGlyZWN0b3J5Cj4gCj4gR3JlYXQsIHRoZW4gY2FuIHNvbWVvbmUgc3VibWl0IHRo
ZXNlIGluIGEgZm9ybWF0IHdlIGNhbiBhcHBseSB0aGVtIGluPwo+IG9yIGRvIGNsZWFuIGNoZXJy
eS1waWNrcyB3b3JrIHByb3Blcmx5PwoKRG9lcyB0aGlzIHdvcms6CgpQbGVhc2UgYmFja3BvcnQg
dXBzdHJlYW0gY29tbWl0OgoKICA2MTdlMDQ5MWFiZTQgZjJmczogc3lzZnM6IGV4cG9ydCBsaW5l
YXJfbG9va3VwIGluIGZlYXR1cmVzIGRpcmVjdG9yeQoKLi4uIHRvIGFsbCBzdGFibGUgYnJhbmNo
ZXMgdXAgdG8gYW5kIGluY2x1ZGluZyBsaW51eC01LjE1LnkuCgpJZiB0aGVyZSBhcmUgY29uZmxp
Y3RzLCBJIGNhbiBkbyB0aGUgYmFja3BvcnQgbXlzZWxmIGFuZCBzdWJtaXQgYXMgcGF0Y2hlcy4K
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

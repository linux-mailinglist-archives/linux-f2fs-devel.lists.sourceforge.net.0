Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 903B8AF61C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jul 2025 20:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZM/rfMkqfQOB8QAq63UEPBSAWnOdVjnBqOpb2G+owF8=; b=PRyRflpdl9c4mgudrOLoIvBey2
	vHinwSH/5hTFxxgDyT2HnwvSpX5XiMML2Y0P4dPNHAxJaJy7hYDdilAuH/CvTpkkoBrSjyQ0a1apb
	lMvtxdoIXAIhDxIsKWOG+a2xiUL0VsT7MOx7OnejjVKRxJqGNVsIGIBWetwBYiNBStVk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uX2Rv-0001tM-TZ;
	Wed, 02 Jul 2025 18:44:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1uX2Rv-0001tG-0a
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 18:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bSAembVttdqegivCJ4Fqoj2UKAEnPFR49RsQZIk5y8Y=; b=N+vGIODLBanz3R5vvSgNeqFsh5
 gXJrLgk02xf0WKpVUYOsGnk1ODW2f1TnHQwc2/wHiyoXR45yNgjjo8VUToALMb8QmLniQQnkvhyFk
 N3Z6pxJYK0A4zFr+4Va9tV74FFFkjNxXG0zFt8ulfr7TnN8egeYACEf7JUd27g5N6IJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bSAembVttdqegivCJ4Fqoj2UKAEnPFR49RsQZIk5y8Y=; b=PnDOvWIT7nyTMIXCGsNN69l5lW
 jN+tbTvjjJMk2LqxyMZdef1kLATydZ9aOpZcv+5P1w1/py1I21qKHAhkChrBpLZjFJS9GxlWYQUjR
 +TWDVMGec1M+T3wXajxWNGXGxGnSRAfT5Bl6SVEYDZOYt5k2+ku2yse4reTEhE1YDmHU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uX2Ru-0003EW-Ei for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 18:44:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0C0A5C6E64;
 Wed,  2 Jul 2025 18:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929F6C4CEE7;
 Wed,  2 Jul 2025 18:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751481879;
 bh=/IZPd8KlF1Rfpn2HYXRQXoTSPYc958DcN74ujLHkxLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LTe3GXWS6Db++/57WYwVc3keMIXhJgZR4AR38dxLEyuCPmELgp+zbrl4ZBaRTSrU4
 cgOdmtJoRoq6XVoUNDgzn32O8s8Ldv6Pbr/j0mTPm9x7Mxon1GryHW7d6k+VR1ijtU
 t1OYIydDucFAbmJfRvfrYndlpUrRnTA9hd13CAMdlypcg68bIpUIWIAP/1m00NoYtA
 8XFp30voETMfh7A6fJYAWNQhqcRn2jGAXGyHs8Od9eYjLFYQUhrApNqoCCQ6UzPGVE
 oN+Nv/SqIH5Kf8azSfXJ3hTAd2J26JhN2KGNL0kDLqFTjs3ox+gZrC/ARaA6Wws7Jc
 sGmv0XhJNxFIA==
Date: Wed, 2 Jul 2025 11:44:39 -0700
To: Kundan Kumar <kundanthebest@gmail.com>
Message-ID: <20250702184439.GD9991@frogsfrogsfrogs>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250602141904.GA21996@lst.de>
 <c029d791-20ca-4f2e-926d-91856ba9d515@samsung.com>
 <20250603132434.GA10865@lst.de>
 <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
 <CALYkqXqVRYqq+5_5W4Sdeh07M8DyEYLvrsm3yqhhCQTY0pvU1g@mail.gmail.com>
 <20250611155144.GD6138@frogsfrogsfrogs>
 <CALYkqXpOBb1Ak2kEKWbO2Kc5NaGwb4XsX1q4eEaNWmO_4SQq9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALYkqXpOBb1Ak2kEKWbO2Kc5NaGwb4XsX1q4eEaNWmO_4SQq9w@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 24, 2025 at 11:29:28AM +0530, Kundan Kumar wrote:
 > On Wed, Jun 11, 2025 at 9:21 PM Darrick J. Wong <djwong@kernel.org> wrote:
 > > > > On Wed, Jun 04, 2025 at 02:52:34PM +0530, Kundan Kuma [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uX2Ru-0003EW-Ei
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ritesh.list@gmail.com, Anuj gupta <anuj1072538@gmail.com>, jack@suse.cz,
 amir73il@gmail.com, david@fromorbit.com, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, Christoph Hellwig <hch@lst.de>,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 p.raghav@samsung.com, Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>,
 linux-nfs@vger.kernel.org, da.gomez@samsung.com, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 gost.dev@samsung.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gMjQsIDIwMjUgYXQgMTE6Mjk6MjhBTSArMDUzMCwgS3VuZGFuIEt1bWFyIHdy
b3RlOgo+IE9uIFdlZCwgSnVuIDExLCAyMDI1IGF0IDk6MjHigK9QTSBEYXJyaWNrIEouIFdvbmcg
PGRqd29uZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEp1biAwNCwgMjAyNSBh
dCAwMjo1MjozNFBNICswNTMwLCBLdW5kYW4gS3VtYXIgd3JvdGU6Cj4gPiA+ID4gPiA+IEZvciB4
ZnMgdXNlZCB0aGlzIGNvbW1hbmQ6Cj4gPiA+ID4gPiA+IHhmc19pbyAtYyAic3RhdCIgL21udC90
ZXN0ZmlsZQo+ID4gPiA+ID4gPiBBbmQgZm9yIGV4dDQgdXNlZCB0aGlzOgo+ID4gPiA+ID4gPiBm
aWxlZnJhZyAvbW50L3Rlc3RmaWxlCj4gPiA+ID4gPgo+ID4gPiA+ID4gZmlsZWZyYWcgbWVyZ2Vz
IGNvbnRpZ3VvdXMgZXh0ZW50cywgYW5kIG9ubHkgY291bnRzIHVwIGZvciBkaXNjb250aWd1b3Vz
Cj4gPiA+ID4gPiBtYXBwaW5ncywgd2hpbGUgZnN4YXR0ci5uZXh0ZW50cyBjb3VudHMgYWxsIGV4
dGVudCBldmVuIGlmIHRoZXkgYXJlCj4gPiA+ID4gPiBjb250aWd1b3VzLiAgU28geW91IHByb2Jh
Ymx5IHdhbnQgdG8gdXNlIGZpbGVmcmFnIGZvciBib3RoIGNhc2VzLgo+ID4gPiA+Cj4gPiA+ID4g
R290IGl0IOKAlCB0aGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBXZSdsbCBzd2l0Y2ggdG8g
dXNpbmcgZmlsZWZyYWcKPiA+ID4gPiBhbmQgd2lsbCBzaGFyZSB1cGRhdGVkIGV4dGVudCBjb3Vu
dCBudW1iZXJzIGFjY29yZGluZ2x5Lgo+ID4gPgo+ID4gPiBVc2luZyBmaWxlZnJhZywgd2UgcmVj
b3JkZWQgZXh0ZW50IGNvdW50cyBvbiB4ZnMgYW5kIGV4dDQgYXQgdGhyZWUKPiA+ID4gc3RhZ2Vz
Ogo+ID4gPiBhLiBKdXN0IGFmdGVyIGEgMUcgcmFuZG9tIHdyaXRlLAo+ID4gPiBiLiBBZnRlciBh
IDMwLXNlY29uZCB3YWl0LAo+ID4gPiBjLiBBZnRlciB1bm1vdW50aW5nIGFuZCByZW1vdW50aW5n
IHRoZSBmaWxlc3lzdGVtLAo+ID4gPgo+ID4gPiB4ZnMKPiA+ID4gQmFzZQo+ID4gPiBhLiA2MjUx
ICAgYi4gMjUyNiAgYy4gMjUyNgo+ID4gPiBQYXJhbGxlbCB3cml0ZWJhY2sKPiA+ID4gYS4gNjE4
MyAgIGIuIDIzMjYgIGMuIDIzMjYKPiA+Cj4gPiBJbnRlcmVzdGluZyB0aGF0IHRoZSBtYXBwaW5n
IHJlY29yZCBjb3VudCBnb2VzIGRvd24uLi4KPiA+Cj4gPiBJIHdvbmRlciwgeW91IHNhaWQgdGhl
IHhmcyBmaWxlc3lzdGVtIGhhcyA0IEFHcyBhbmQgMTIgY29yZXMsIHNvIEkgZ3Vlc3MKPiA+IHdi
X2N0eF9hcnJbXSBpcyAxMj8gIEkgd29uZGVyLCBkbyB5b3Ugc2VlIGEga25lZSBwb2ludCBpbiB3
cml0ZWJhY2sKPiA+IHRocm91Z2hwdXQgd2hlbiB0aGUgIyBvZiB3YiBjb250ZXh0cyBleGNlZWRz
IHRoZSBBRyBjb3VudD8KPiA+Cj4gPiBUaG91Z2ggSSBndWVzcyBmb3IgdGhlIChob3BlZnVsbHkg
Y29tbW9uKSBjYXNlIG9mIHB1cmUgb3ZlcndyaXRlcywgd2UKPiA+IGRvbid0IGhhdmUgdG8gZG8g
YW55IG1ldGFkYXRhIHVwZGF0ZXMgc28gd2Ugd291bGRuJ3QgcmVhbGx5IGhpdCBhCj4gPiBzY2Fs
aW5nIGxpbWl0IGR1ZSB0byBhZyBjb3VudCBvciBsb2cgY29udGVudGlvbiBvciB3aGF0ZXZlci4g
IERvZXMgdGhhdAo+ID4gc3F1YXJlIHdpdGggd2hhdCB5b3Ugc2VlPwo+ID4KPiAKPiBIaSBEYXJy
aWNrLAo+IAo+IFdlIGFuYWx5emVkIEFHIGNvdW50IHZzLiBudW1iZXIgb2Ygd3JpdGViYWNrIGNv
bnRleHRzIHRvIGlkZW50aWZ5IGFueQo+IGtuZWUgcG9pbnQuIEVhcmxpZXIsIHdiX2N0eF9hcnJb
XSB3YXMgZml4ZWQgYXQgMTI7IG5vdyB3ZSB2YXJpZWQgbnJfd2JfY3R4Cj4gYW5kIG1lYXN1cmVk
IHRoZSBpbXBhY3QuCj4gCj4gV2UgaW1wbGVtZW50ZWQgYSBjb25maWd1cmFibGUgbnVtYmVyIG9m
IHdyaXRlYmFjayBjb250ZXh0cyB0byBtZWFzdXJlCj4gdGhyb3VnaHB1dCBtb3JlIGVhc2lseS4g
VGhpcyBmZWF0dXJlIHdpbGwgYmUgZXhwb3NlZCBpbiB0aGUgbmV4dCBzZXJpZXMuCj4gVG8gY29u
ZmlndXJlLCB1c2VkOiBlY2hvIDxucl93Yl9jdHg+ID4gL3N5cy9jbGFzcy9iZGkvMjU5OjIvbndy
aXRlYmFja3MuCj4gCj4gSW4gb3VyIHRlc3QsIHdyaXRpbmcgMUcgYWNyb3NzIDEyIGRpcmVjdG9y
aWVzIHNob3dlZCBpbXByb3ZlZCBiYW5kd2lkdGggdXAKPiB0byB0aGUgbnVtYmVyIG9mIGFsbG9j
YXRpb24gZ3JvdXBzIChBR3MpLCBtb3N0bHkgYSBrbmVlIHBvaW50LCBidXQgZ2FpbnMKPiB0YXBl
cmVkIG9mZiBiZXlvbmQgdGhhdC4gQWxzbywgd2Ugc2VlIGEgZ29vZCBpbmNyZWFzZSBpbiBiYW5k
d2lkdGggb2YgYWJvdXQKPiAxNiB0aW1lcyBmcm9tIGJhc2UgdG8gbnJfd2JfY3R4ID0gNi4KPiAK
PiAgICAgQmFzZSAoc2luZ2xlIHRocmVhZGVkKSAgICAgICAgICAgICAgICA6ICA5Nzk5S2lCL3MK
PiAgICAgUGFyYWxsZWwgV3JpdGViYWNrIChucl93Yl9jdHggPSAxKSAgICA6ICA5NzI3S2lCL3MK
PiAgICAgUGFyYWxsZWwgV3JpdGViYWNrIChucl93Yl9jdHggPSAyKSAgICA6ICAxOC4xTWlCL3MK
PiAgICAgUGFyYWxsZWwgV3JpdGViYWNrIChucl93Yl9jdHggPSAzKSAgICA6ICA0Ni40TWlCL3MK
PiAgICAgUGFyYWxsZWwgV3JpdGViYWNrIChucl93Yl9jdHggPSA0KSAgICA6ICAxMzVNaUIvcwo+
ICAgICBQYXJhbGxlbCBXcml0ZWJhY2sgKG5yX3diX2N0eCA9IDUpICAgIDogIDE2ME1pQi9zCj4g
ICAgIFBhcmFsbGVsIFdyaXRlYmFjayAobnJfd2JfY3R4ID0gNikgICAgOiAgMTYzTWlCL3MKCkhl
aCwgbmljZSEKCj4gICAgIFBhcmFsbGVsIFdyaXRlYmFjayAobnJfd2JfY3R4ID0gNykgICAgOiAg
MTYyTWlCL3MKPiAgICAgUGFyYWxsZWwgV3JpdGViYWNrIChucl93Yl9jdHggPSA4KSAgICA6ICAx
NTRNaUIvcwo+ICAgICBQYXJhbGxlbCBXcml0ZWJhY2sgKG5yX3diX2N0eCA9IDkpICAgIDogIDE1
Mk1pQi9zCj4gICAgIFBhcmFsbGVsIFdyaXRlYmFjayAobnJfd2JfY3R4ID0gMTApICAgOiAgMTQ1
TWlCL3MKPiAgICAgUGFyYWxsZWwgV3JpdGViYWNrIChucl93Yl9jdHggPSAxMSkgICA6ICAxNDVN
aUIvcwo+ICAgICBQYXJhbGxlbCBXcml0ZWJhY2sgKG5yX3diX2N0eCA9IDEyKSAgIDogIDEzOE1p
Qi9zCj4gCj4gCj4gU3lzdGVtIGNvbmZpZwo+ID09PT09PT09PT09Cj4gTnVtYmVyIG9mIENQVXMg
PSAxMgo+IFN5c3RlbSBSQU0gPSA5Rwo+IEZvciBYRlMgbnVtYmVyIG9mIEFHcyA9IDQKPiBVc2Vk
IE5WTWUgU1NEIG9mIDMuODQgVEIgKEVudGVycHJpc2UgU1NEIFBNMTczM2EpCj4gCj4gU2NyaXB0
Cj4gPT09PT0KPiBta2ZzLnhmcyAtZiAvZGV2L252bWUwbjEKPiBtb3VudCAvZGV2L252bWUwbjEg
L21udAo+IGVjaG8gPG51bV93Yl9jdHg+ID4gL3N5cy9jbGFzcy9iZGkvMjU5OjIvbndyaXRlYmFj
a3MKPiBzeW5jCj4gZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCj4gCj4gZm9yIGkg
aW4gezEuLjEyfTsgZG8KPiAgIG1rZGlyIC1wIC9tbnQvZGlyJGkKPiBkb25lCj4gCj4gZmlvIGpv
Yl9udm1lLmZpbwo+IAo+IHVtb3VudCAvbW50Cj4gZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3Bf
Y2FjaGVzCj4gc3luYwo+IAo+IGZpbyBqb2IKPiA9PT09PQo+IFtnbG9iYWxdCj4gYnM9NGsKPiBp
b2RlcHRoPTEKPiBydz1yYW5kd3JpdGUKPiBpb2VuZ2luZT1pb191cmluZwo+IG5yZmlsZXM9MTIK
PiBudW1qb2JzPTEgICAgICAgICAgICAgICAgIyBFYWNoIGpvYiB3cml0ZXMgdG8gYSBkaWZmZXJl
bnQgZmlsZQo+IHNpemU9MWcKPiBkaXJlY3Q9MCAgICAgICAgICAgICAgICAgIyBCdWZmZXJlZCBJ
L08gdG8gdHJpZ2dlciB3cml0ZWJhY2sKPiBncm91cF9yZXBvcnRpbmc9MQo+IGNyZWF0ZV9vbl9v
cGVuPTEKPiBuYW1lPXRlc3QKPiAKPiBbam9iMV0KPiBkaXJlY3Rvcnk9L21udC9kaXIxCj4gCj4g
W2pvYjJdCj4gZGlyZWN0b3J5PS9tbnQvZGlyMgo+IC4uLgo+IC4uLgo+IFtqb2IxMl0KPiBkaXJl
Y3Rvcnk9L21udC9kaXIxCj4gCj4gPiA+IGV4dDQKPiA+ID4gQmFzZQo+ID4gPiBhLiA3MDgwICAg
Yi4gNzA4MCAgICBjLiAxMQo+ID4gPiBQYXJhbGxlbCB3cml0ZWJhY2sKPiA+ID4gYS4gNTk2MSAg
IGIuIDU5NjEgICAgYy4gMTEKPiA+Cj4gPiBIdW0sIHRoYXQncyBwYXJ0aWN1bGFybHkgLi4uIGlu
dGVyZXN0aW5nLiAgSSB3b25kZXIgd2hhdCB0aGUgbWFwcGluZwo+ID4gY291bnQgYmVoYXZpb3Jz
IGFyZSB3aGVuIHlvdSB0dXJuIG9mZiBkZWxheWVkIGFsbG9jYXRpb24/Cj4gPgo+ID4gLS1ECj4g
Pgo+IAo+IEkgYXR0ZW1wdGVkIHRvIGRpc2FibGUgZGVsYXllZCBhbGxvY2F0aW9uIGJ5IHNldHRp
bmcgYWxsb2NzaXplPTQwOTYKPiBkdXJpbmcgbW91bnQgKG1vdW50IC1vIGFsbG9jc2l6ZT00MDk2
IC9kZXYvcG1lbTAgL21udCksIGJ1dCBzdGlsbAo+IG9ic2VydmVkIGEgcmVkdWN0aW9uIGluIGZp
bGUgZnJhZ21lbnRzIGFmdGVyIGEgZGVsYXkuIElzIHRoZXJlIHNvbWV0aGluZwo+IEknbSBvdmVy
bG9va2luZz8KCk5vdCB0aGF0IEkga25vdyBvZi4gIE1heWJlIHdlIHNob3VsZCBqdXN0IHRha2Ug
dGhlIHdpbi4gOikKCi0tRAoKPiAtS3VuZGFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

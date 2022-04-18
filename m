Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2E505FC4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 00:27:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngZqL-000666-Uc; Mon, 18 Apr 2022 22:27:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1ngZqK-00065w-96
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Apr 2022 22:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oPaHiGQHOOzWecuJYOyosQrzkU7K2Jrkx1Q1Gqepzx0=; b=PWjGRT/PebzJ7krblwpUOnjG3F
 4ePC7R5B5rWf/DM4wC3KGxK1FylPJ6QpNGAZ6RVEv91nYYD/OIIwXiZ9lC/ofwxuL8w89ewQOlPxM
 vd9qAfGEQFDJVmuoC6Kjbl/rbFqcSd3z5vCxI3lTuEp7oevqzqAxnIBmC5T1nkqJLiXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oPaHiGQHOOzWecuJYOyosQrzkU7K2Jrkx1Q1Gqepzx0=; b=E+hP355U0Ev523lFf6f4t4lk1Y
 nqlPs4DqvhJiap8ejXt/gToVCdCJpqYXcnLqB3dn625p9xwAiKvDS3jax8APhiMDLm1ncP9QCFQkn
 UBcdGSfeRF6jNCiKqoLsvzF+pCVDJmM7hI8ix0qda2hgEGsqB4b8Yf6zIRhtXvoux0bY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngZqG-003J68-6z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Apr 2022 22:27:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 185A9B81123;
 Mon, 18 Apr 2022 22:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900BFC385A1;
 Mon, 18 Apr 2022 22:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650320838;
 bh=dM3ozRl9eZA2yxR6eKEJTWs0R0k8qCfJ/KyhnkH7+UI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vFVIE3TDPIXRofyOutK/iiDDJvLWCeB1V28Dpv/eLvcmse+ZVernBWfUXs1Hlmc0q
 SOgpGy8bErqGieFJJBpKG3WgESm5RAeU8gKpoh7wfqjpe0o6azfwRfRSZzNIZEORPW
 CJw2tkxuRenbJDp+QAAsDyGogUcpkq0KE+Ad9RakjnT8SCg8wuvkNf/HT4qddF3mcp
 5HABppW5duQ82yb5mhCEdwLyRfuoqKWIX9zegozdKNssmKY5+qL59k65/YrOO8L15R
 CtS9la+pn37pNHrFnJ2icbrEwB6AgKgXZNl9lugSNKwNsJegCyVDwcdrW9YRaxvE4i
 F82XBZ0ouUZFQ==
Date: Mon, 18 Apr 2022 15:27:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
Message-ID: <Yl3lxMnZ5teL+bkU@sol.localdomain>
References: <20220418063312.63181-1-changfengnan@vivo.com>
 <20220418063312.63181-2-changfengnan@vivo.com>
 <Yl0RmUoZypbVmayj@sol.localdomain>
 <KL1PR0601MB400369725474F2A2DE647057BBF39@KL1PR0601MB4003.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <KL1PR0601MB400369725474F2A2DE647057BBF39@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Apr 18, 2022 at 07:34:52AM +0000, 常凤楠 wrote:
    > > 
 
 Content analysis details:   (-5.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngZqG-003J68-6z
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: notify when device not supprt
 inlinecrypt
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, "tytso@mit.edu" <tytso@mit.edu>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBBcHIgMTgsIDIwMjIgYXQgMDc6MzQ6NTJBTSArMDAwMCwg5bi45Yek5qWgIHdyb3Rl
Ogo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEVyaWMgQmlnZ2VycyA8
ZWJpZ2dlcnNAa2VybmVsLm9yZz4KPiA+IFNlbnQ6IE1vbmRheSwgQXByaWwgMTgsIDIwMjIgMzoy
MiBQTQo+ID4gVG86IOW4uOWHpOaloCA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+ID4gQ2M6IGph
ZWdldWtAa2VybmVsLm9yZzsgY2hhb0BrZXJuZWwub3JnOyB0eXRzb0BtaXQuZWR1Owo+ID4gYWRp
bGdlci5rZXJuZWxAZGlsZ2VyLmNhOyBheGJvZUBrZXJuZWwuZGs7IGxpbnV4LWJsb2NrQHZnZXIu
a2VybmVsLm9yZzsKPiA+IGxpbnV4LWV4dDRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIGYy
ZnM6IG5vdGlmeSB3aGVuIGRldmljZSBub3Qgc3VwcHJ0IGlubGluZWNyeXB0Cj4gPiAKPiA+IE9u
IE1vbiwgQXByIDE4LCAyMDIyIGF0IDAyOjMzOjExUE0gKzA4MDAsIEZlbmduYW4gQ2hhbmcgdmlh
Cj4gPiBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+ID4gPiBOb3RpZnkgd2hlbiBtb3VudCBmaWxl
c3lzdGVtIHdpdGggLW8gaW5saW5lY3J5cHQgb3B0aW9uLCBidXQgdGhlCj4gPiA+IGRldmljZSBu
b3Qgc3VwcG9ydCBpbmxpbmVjcnlwdC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRmVuZ25h
biBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+ID4gCj4gPiBZb3UgZGlkbid0IGluY2x1
ZGUgYSBjb3ZlciBsZXR0ZXIgaW4gdGhpcyBwYXRjaHNldC4gIENhbiB5b3UgZXhwbGFpbiB3aGF0
Cj4gPiBwcm9ibGVtIHRoaXMgcGF0Y2hzZXQgaXMgbWVhbnQgdG8gc29sdmU/Cj4gCj4gV2hhdCBJ
J20gdHJ5IHRvIG1ha2UgaXMgd2hlbiBkZXZpY2VzIG5vdCBzdXBwb3J0IGlubGluZWNyeXB0LCBk
byBub3Qgc2hvdyBpbmxpbmVjcnlwdCBpbiBtb3VudCBvcHRpb24uIAo+IFdoZW4gSSB0ZXN0IGZz
Y3J5cHQgZmlyc3QsIGl0IG1ha2UgbWUgY29uZnVzZWQuIE5vdCBhIHJlYWwgcHJvYmxlbSwganVz
dCBtYWtlIHRoaXMgbG9naWNhbCBtb3JlIHJlYXNvbmFibGUuCj4gRG8geW91IHRoaW5rIHRoaXMg
bmVlZHMgdG8gYmUgcmV2aXNlZD8KCldlbGwsIEknbSBqdXN0IG5vdCBzdXJlIHdlIHNob3VsZCBk
byB0aGlzLCBvciBhdCBsZWFzdCBieSBpdHNlbGYsIGdpdmVuIHRoYXQKc3VwcG9ydCBmb3IgaW5s
aW5lIGVuY3J5cHRpb24gaXMgbm90IGFuIGVpdGhlci1vciB0aGluZywgYW5kIHRoZSBpbmxpbmVj
cnlwdAptb3VudCBvcHRpb24gaXMgYWxyZWFkeSBkb2N1bWVudGVkIHRvIGFwcGx5IG9ubHkgdG8g
ZmlsZXMgd2hlcmUgaW5saW5lCmVuY3J5cHRpb24gY2FuIGJlIHVzZWQuICBTZWUgRG9jdW1lbnRh
dGlvbi9maWxlc3lzdGVtcy9mc2NyeXB0LnJzdDoKCglOb3RlIHRoYXQgdGhlICJpbmxpbmVjcnlw
dCIgbW91bnQgb3B0aW9uIGp1c3Qgc3BlY2lmaWVzIHRvIHVzZSBpbmxpbmUKCWVuY3J5cHRpb24g
d2hlbiBwb3NzaWJsZTsgaXQgZG9lc24ndCBmb3JjZSBpdHMgdXNlLiAgZnNjcnlwdCB3aWxsCglz
dGlsbCBmYWxsIGJhY2sgdG8gdXNpbmcgdGhlIGtlcm5lbCBjcnlwdG8gQVBJIG9uIGZpbGVzIHdo
ZXJlIHRoZQoJaW5saW5lIGVuY3J5cHRpb24gaGFyZHdhcmUgZG9lc24ndCBoYXZlIHRoZSBuZWVk
ZWQgY3J5cHRvIGNhcGFiaWxpdGllcwoJKGUuZy4gc3VwcG9ydCBmb3IgdGhlIG5lZWRlZCBlbmNy
eXB0aW9uIGFsZ29yaXRobSBhbmQgZGF0YSB1bml0IHNpemUpCglhbmQgd2hlcmUgYmxrLWNyeXB0
by1mYWxsYmFjayBpcyB1bnVzYWJsZS4gIChGb3IgYmxrLWNyeXB0by1mYWxsYmFjawoJdG8gYmUg
dXNhYmxlLCBpdCBtdXN0IGJlIGVuYWJsZWQgaW4gdGhlIGtlcm5lbCBjb25maWd1cmF0aW9uIHdp
dGgKCUNPTkZJR19CTEtfSU5MSU5FX0VOQ1JZUFRJT05fRkFMTEJBQ0s9eS4pCgpBbmQgRG9jdW1l
bnRhdGlvbi9hZG1pbi1ndWlkZS9leHQ0LnJzdCBhbmQgRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVt
cy9mMmZzLnJzdDoKCglXaGVuIHBvc3NpYmxlLCBlbmNyeXB0L2RlY3J5cHQgdGhlIGNvbnRlbnRz
IG9mIGVuY3J5cHRlZCBmaWxlcyB1c2luZyB0aGUKCWJsay1jcnlwdG8gZnJhbWV3b3JrIHJhdGhl
ciB0aGFuIGZpbGVzeXN0ZW0tbGF5ZXIgZW5jcnlwdGlvbi4gLi4uCgpJZiB3ZSBkbyB3YW50IHRv
IHdhcm4gd2hlbiBpbmxpbmVjcnlwdCBpcyBnaXZlbiBidXQgaW5saW5lIGVuY3J5cHRpb24gY2Fu
bm90IGJlCnVzZWQsIHlvdXIgcGF0Y2hzZXQgaXNuJ3QgZW5vdWdoIHNpbmNlIGl0IG9ubHkgY292
ZXJzIHRoZSBjYXNlIHdoZXJlIG5vIGZvcm0gb2YKaW5saW5lIGVuY3J5cHRpb24gaXMgYXZhaWxh
YmxlIGF0IGFsbCwgYW5kIG5vdCB0aGUgY2FzZSB3aGVyZSBzb21lIGZvcm0gb2YKaW5saW5lIGVu
Y3J5cHRpb24gaXMgYXZhaWxhYmxlIGJ1dCB0aGUgZmlsZXN5c3RlbSBjYW4ndCB1c2UgaXQuCgot
IEVyaWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==

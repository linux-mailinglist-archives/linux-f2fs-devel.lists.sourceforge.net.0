Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E0F2DC6BF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Dec 2020 19:53:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpbv7-0003DB-Ni; Wed, 16 Dec 2020 18:53:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dsterba@suse.cz>)
 id 1kpbv6-0003Cv-Fx; Wed, 16 Dec 2020 18:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I15UARkcFPnY4T321a9cuHB6MAWlzF1FQYj+/0maPeA=; b=VNHYdOE4pe616ZjE69T+EwDDV2
 8jIfXcH3hYuDkLtQrPIFvUYMFZJLRqn8FY/IIyK0eqOEK1r3GjDFm5Xdx3KatKFRY1YUcsB4fJaKA
 MNjtt3MPSlB832c/tuJli4b8pNHYQyXgxKUHgAcmjWMYJXb9dzt6pEaR0ZpRbSoCnEO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I15UARkcFPnY4T321a9cuHB6MAWlzF1FQYj+/0maPeA=; b=egblJZYXjMrgc26i+pced/FwdB
 kCkyhDEkFxZ4atJVx8NWizVArP25c9kOXkEDY0NO6F7Ke4NIOsxtCYgtyFwWYi9m9Hq0pYT1tgSZx
 3LyFDKhpZsu3Lu0UpQczb326nEAUP2ZfJyIrfZjxLLak+Gts1OektbRX2z0hxUUpRD64=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpbuu-00GhGn-Aw; Wed, 16 Dec 2020 18:53:04 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C406AAF0B;
 Wed, 16 Dec 2020 18:52:32 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id CB5A8DA7B4; Wed, 16 Dec 2020 19:50:52 +0100 (CET)
Date: Wed, 16 Dec 2020 19:50:52 +0100
From: David Sterba <dsterba@suse.cz>
To: Herbert Xu <herbert@gondor.apana.org.au>
Message-ID: <20201216185052.GL6430@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <terrelln@fb.com>, Eric Biggers <ebiggers@kernel.org>,
 Nick Terrell <nickrterrell@gmail.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>, 
 Christoph Hellwig <hch@infradead.org>, Yann Collet <cyan@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, 
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>,
 Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
References: <20201203205114.1395668-1-nickrterrell@gmail.com>
 <DF6B2E26-2D6E-44FF-89DB-93A37E2EA268@fb.com>
 <X9lOHkAE67EP/sXo@sol.localdomain>
 <B3F00261-E977-4B85-84CD-66B07DA79D9D@fb.com>
 <20201216005806.GA26841@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216005806.GA26841@gondor.apana.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kpbuu-00GhGn-Aw
Subject: Re: [f2fs-dev] [PATCH v7 0/3] Update to zstd-1.4.6
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
Reply-To: dsterba@suse.cz
Cc: Christoph Hellwig <hch@infradead.org>, Petr Malat <oss@malat.biz>,
 "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Eric Biggers <ebiggers@kernel.org>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBEZWMgMTYsIDIwMjAgYXQgMTE6NTg6MDdBTSArMTEwMCwgSGVyYmVydCBYdSB3cm90
ZToKPiBPbiBXZWQsIERlYyAxNiwgMjAyMCBhdCAxMjo0ODo1MUFNICswMDAwLCBOaWNrIFRlcnJl
bGwgd3JvdGU6Cj4gPgo+ID4gVGhhbmtzIGZvciB0aGUgYWR2aWNlISBUaGUgZmlyc3QgenN0ZCBw
YXRjaGVzIHdlbnQgdGhyb3VnaCBIZXJiZXJ04oCZcyB0cmVlLCB3aGljaCBpcwo+ID4gd2h5IEni
gJl2ZSBzZW50IHRoZW0gdGhpcyB3YXkuCj4gCj4gU29ycnksIGJ1dCBJJ20gbm90IHRvdWNoIHRo
ZXNlIHBhdGNoZXMgYXMgQ2hyaXN0b3BoJ3Mgb2JqZWN0aW9ucwo+IGRvbid0IHNlZW0gdG8gaGF2
ZSBiZWVuIGFkZHJlc3NlZC4KCkkgaGF2ZSBvYmplY3Rpb25zIHRvIHRoZSBjdXJyZW50IHBhdGNo
c2V0IGFzIHdlbGwsIHRoZSBidWlsZCBib3QgaGFzCmZvdW5kIHRoYXQgc29tZSBvZiB0aGUgZnVu
Y3Rpb24gZnJhbWVzIGFyZSBvdmVybHkgbGFyZ2UgKHVwIHRvIDM4MDAKYnl0ZXMpIFsxXSwgYmVz
aWRlcyB0aGUgb3JpZ2luYWwgY29tcGxhaW50IHRoYXQgdGhlIHBhdGNoIDMvMyBpcyAxLjVNaUIu
CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMTIwNDE0MDMxNC5HUzY0MzBA
dHdpbi5qaWtvcy5jei8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

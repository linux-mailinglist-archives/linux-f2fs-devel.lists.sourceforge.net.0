Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1018916B34C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 22:54:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6LgI-0000WH-TV; Mon, 24 Feb 2020 21:54:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j6LgH-0000W9-G5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=APtxhiGX2oo2NuFWECGVLQtSqhQUVX091Swo9E3jyGQ=; b=B12fVtY9wd42j6dDRuPYbelIXk
 CM7kcHYklgpq2MJ9ttaZlrXinkL0Jg1L7UJW9QFtQrlorzcZrymaAD32A7xTyRkA6Xyl3K+lu6Jmc
 AR1rLHM3R93vOHrgfaixo+imSExKtX5/n4P5lhUaOyEFizB0h1ZrNF8lKYwKGu0hsbwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=APtxhiGX2oo2NuFWECGVLQtSqhQUVX091Swo9E3jyGQ=; b=N66Yi+quh80NWKgBpD7FNqb6LS
 cl3IaQvk5756I3BGF5pYvqzm8j3AFi7z1VGaHQmtyiTsviBPUYnhOMek4BEbC8x3m8VKALB8y6i6W
 UJks9Ue6pgcmQrMNY4dpYcP1NB33uI9KxAI45s3F8S7sOUysgmv+pi0GyTa5R1tIUo3M=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6LgG-008z1b-0g
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=APtxhiGX2oo2NuFWECGVLQtSqhQUVX091Swo9E3jyGQ=; b=k4YHtYQMII9XuUXNa7K98f5Lr8
 8kxvJ/tzbiUBK0u8QPQlhc0S7pbYmtD+Kp/ADfY06g04+syMs0jiIxgreUVqaL2jTdxfVFgmvRJIq
 oTmznOvFRzH5WSEJ9IWPTFDJ+erRAgDrH/RmPUBzK601Fwa6IdIoQ6C3fegnBHogmdc5w+2qvj5gY
 azQCmdMraUIHucXS6vJTgsz3Fe5JuP/OkXHWU/LXgR0E4YJ9UfZD+tC1vsf+PL62iedbWaYajeqcO
 g6/F6Ohsx0R3d7CnbruJ/vQynXFS4X6INJIgfA7SRCec91PJ4VA+gJ2wESYF19FEGFB+fvp/elqYF
 ZWBJCgSg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6Lg6-0004ll-A1; Mon, 24 Feb 2020 21:54:14 +0000
Date: Mon, 24 Feb 2020 13:54:14 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200224215414.GR24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-15-willy@infradead.org>
 <SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
 <20200220134849.GV24185@bombadil.infradead.org>
 <20200220154658.GA19577@infradead.org>
 <20200220155452.GX24185@bombadil.infradead.org>
 <20200220155727.GA32232@infradead.org>
 <20200224214347.GH13895@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224214347.GH13895@infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j6LgG-008z1b-0g
Subject: Re: [f2fs-dev] [PATCH v7 14/24] btrfs: Convert from readpages to
 readahead
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
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDE6NDM6NDdQTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDc6NTc6MjdBTSAtMDgwMCwgQ2hy
aXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNzo1NDo1
MkFNIC0wODAwLCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPiA+ID4gT24gVGh1LCBGZWIgMjAsIDIw
MjAgYXQgMDc6NDY6NThBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+ID4g
T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDU6NDg6NDlBTSAtMDgwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gPiA+ID4gPiBidHJmczogQ29udmVydCBmcm9tIHJlYWRwYWdlcyB0byByZWFkYWhl
YWQKPiA+ID4gPiA+ICAgCj4gPiA+ID4gPiBJbXBsZW1lbnQgdGhlIG5ldyByZWFkYWhlYWQgbWV0
aG9kIGluIGJ0cmZzLiAgQWRkIGEgcmVhZGFoZWFkX3BhZ2VfYmF0Y2goKQo+ID4gPiA+ID4gdG8g
b3B0aW1pc2UgZmV0Y2hpbmcgYSBiYXRjaCBvZiBwYWdlcyBhdCBvbmNlLgo+ID4gPiA+IAo+ID4g
PiA+IFNob3VsZG4ndCB0aGlzIHJlYWRhaGVhZF9wYWdlX2JhdGNoIGhlcGVyIGdvIGludG8gYSBz
ZXBhcmF0ZSBwYXRjaCBzbwo+ID4gPiA+IHRoYXQgaXQgY2xlYXJseSBzdGFuZHMgb3V0Pwo+ID4g
PiAKPiA+ID4gSSdsbCBtb3ZlIGl0IGludG8gJ1B1dCByZWFkYWhlYWQgcGFnZXMgaW4gY2FjaGUg
ZWFybGllcicgZm9yIHY4ICh0aGUKPiA+ID4gc2FtZSBwYXRjaCB3aGVyZSB3ZSBhZGQgcmVhZGFo
ZWFkX3BhZ2UoKSkKPiA+IAo+ID4gT25lIGFyZ3VtZW50IGZvciBrZWVwaW5nIGl0IGluIGEgcGF0
Y2ggb2YgaXRzIG93biBpcyB0aGF0IGJ0cmZzIGFwcGVhcnMKPiA+IHRvIGJlIHRoZSBvbmx5IHVz
ZXIsIGFuZCBHb2xkd3luIGhhcyBhIFdJUCBjb252ZXJzaW9uIG9mIGJ0cmZzIHRvIGlvbWFwLAo+
ID4gc28gaXQgbWlnaHQgZ28gYXdheSBwcmV0dHkgc29vbiBhbmQgd2UgY291bGQganVzdCByZXZl
cnQgdGhlIGNvbW1pdC4KPiA+IAo+ID4gQnV0IHRoaXMgc3RhcnRzIHRvIGdldCBpbnRvIHJlYWxs
eSBtaW5vciBkZXRhaWxzLCBzbyBJJ2xsIHNodXQgdXAgbm93IDopCj4gCj4gU28gbG9va2luZyBh
dCB0aGlzIGFnYWluIEkgaGF2ZSBhbm90aGVyIGNvbW1lbnQgYW5kIGEgcXVlc3Rpb24uCj4gCj4g
Rmlyc3QgSSB0aGluayB0aGUgaW1wbGljaXQgQVJSQVlfU0laRSBpbiByZWFkYWhlYWRfcGFnZV9i
YXRjaCBpcyBoaWdobHkKPiBkYW5nZXJvdXMsIGFzIGl0IHdpbGwgZG8gdGhlIHdyb25nIHRoaW5n
IHdoZW4gcGFzc2luZyBhIHBvaW50ZXIgb3IKPiBmdW5jdGlvbiBhcmd1bWVudC4KCnNvbWVib2R5
IGFscmVhZHkgdGhvdWdodCBvZiB0aGF0IDstKQoKI2RlZmluZSBBUlJBWV9TSVpFKGFycikgKHNp
emVvZihhcnIpIC8gc2l6ZW9mKChhcnIpWzBdKSArIF9fbXVzdF9iZV9hcnJheShhcnIpKQoKPiBT
ZWNvbmQgSSB3b25kZXIg0ZZmIGl0IHdvdWxkIGJlIHdvcnRoIHRvIGFsc28gc3dpdGNoIHRvIGEg
YmF0Y2hlZAo+IG9wZXJhdGlvbiBpbiBpb21hcCBpZiB0aGUgeGFycmF5IG92ZXJoZWFkIGlzIGhp
Z2ggZW5vdWdoLiAgVGhhdCBzaG91bGQKPiBiZSBwcmV0dHkgdHJpdmlhbCwgYnV0IHdlIGRvbid0
IHJlYWxseSBuZWVkIHRvIGRvIGl0IGluIHRoaXMgc2VyaWVzLgoKSSd2ZSBhbHNvIGNvbnNpZGVy
ZWQga2VlcGluZyBhIHNtYWxsIGFycmF5IG9mIHBvaW50ZXJzIGluc2lkZSB0aGUKcmVhZGFoZWFk
X2NvbnRyb2wgc28gbm9ib2R5IG5lZWRzIHRvIGhhdmUgYSByZWFkYWhlYWRfcGFnZV9iYXRjaCgp
Cm9wZXJhdGlvbi4gIEV2ZW4ga2VlcGluZyAxMCBwb2ludGVycyBpbiB0aGVyZSB3aWxsIHJlZHVj
ZSB0aGUgWEFycmF5Cm92ZXJoZWFkIGJ5IDkwJS4gIEJ1dCB0aGlzIGZpdCB0aGUgY3VycmVudCBi
dHJmcyBtb2RlbCB3ZWxsLCBhbmQgaXQKbGV0cyB1cyBwbGF5IHdpdGggZGlmZmVyZW50IGFwcHJv
YWNoZXMgYnkgYWJzdHJhY3RpbmcgZXZlcnl0aGluZyBhd2F5LgpJJ20gc3VyZSB0aGlzIHdvbid0
IGJlIHRoZSBsYXN0IHBhdGNoIHRoYXQgdG91Y2hlcyB0aGUgcmVhZGFoZWFkIGNvZGUgOy0pCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DDA16B306
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 22:44:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6LWB-0000ub-06; Mon, 24 Feb 2020 21:43:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+fd4c774fa746ae91f5d1+6028+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j6LW9-0000uU-W7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IBmpdg54DdbeZAoJdfQydcGyDg8H1e/FIpFw/vfYtE4=; b=YjctFUYdl6L0NLeehH4qwrNsJ7
 ts0McN8Ph9TOk8E+Xe2OZde+EDSpetxjFETYdcZ/lcaS96RG+Pl2SVi4Gx9/kZY3ok4gYB+/VnjVl
 ftLW1mFBdaIsZ+4ww8StOxgj5ySGJ+hFp/Ws97mnMwrdVtgXVe/XURT73c6/Zjs4eyE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IBmpdg54DdbeZAoJdfQydcGyDg8H1e/FIpFw/vfYtE4=; b=JBPOoYE4scEcYUEOCpsI63lAd2
 r/HDW92J5+lSWLMBovoy99PvJfWykaEj8R+jlEg4kqeccdTZmtwIQUCFhs92J9+hQJqaZbbOb9+GP
 n9VjGiAwN/cij2LuwPHYw5sbrdmf/kcfECUiPELpCVZtBWOlXF/zsn1sMiuEEHSWGTYE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6LW8-008yZW-T0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=IBmpdg54DdbeZAoJdfQydcGyDg8H1e/FIpFw/vfYtE4=; b=WER6q6aMIxiEGc+j/HGcg87kgh
 fzNH5dUAX47ArvTEcqOgiOSjadyzvjYxi7Z+MNemow4AoVsB97AsbXwMFCWorXOXLyW4/Bi/1vxFR
 pekPIkO1XBmskg8wIjbG1r89NfDd26q/hqyfaI2g/8EolO9JVp55Al1+R5Mb9Co/yj7iles1i8y0+
 Ogbq4hrGehMtbChyDWTVLnLZK/CEUdmMF6F7w+67mUpRFsUbz1BetpuyOeDRb0R9UTQUnw/MfxN4t
 On18RaxEjiVcVeDM/VtvaYZgSM8WH7HCFrdX8QnSdbWbJyOTtLdDJc38/NHqwAQoFYGr30to44pf+
 HaIFogKQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6LVz-0007sB-AO; Mon, 24 Feb 2020 21:43:47 +0000
Date: Mon, 24 Feb 2020 13:43:47 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224214347.GH13895@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-15-willy@infradead.org>
 <SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
 <20200220134849.GV24185@bombadil.infradead.org>
 <20200220154658.GA19577@infradead.org>
 <20200220155452.GX24185@bombadil.infradead.org>
 <20200220155727.GA32232@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220155727.GA32232@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6LW8-008yZW-T0
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
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDc6NTc6MjdBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDc6NTQ6NTJBTSAtMDgwMCwgTWF0
dGhldyBXaWxjb3ggd3JvdGU6Cj4gPiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNzo0Njo1OEFN
IC0wODAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+ID4gT24gVGh1LCBGZWIgMjAsIDIw
MjAgYXQgMDU6NDg6NDlBTSAtMDgwMCwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gPiA+ID4gYnRy
ZnM6IENvbnZlcnQgZnJvbSByZWFkcGFnZXMgdG8gcmVhZGFoZWFkCj4gPiA+ID4gICAKPiA+ID4g
PiBJbXBsZW1lbnQgdGhlIG5ldyByZWFkYWhlYWQgbWV0aG9kIGluIGJ0cmZzLiAgQWRkIGEgcmVh
ZGFoZWFkX3BhZ2VfYmF0Y2goKQo+ID4gPiA+IHRvIG9wdGltaXNlIGZldGNoaW5nIGEgYmF0Y2gg
b2YgcGFnZXMgYXQgb25jZS4KPiA+ID4gCj4gPiA+IFNob3VsZG4ndCB0aGlzIHJlYWRhaGVhZF9w
YWdlX2JhdGNoIGhlcGVyIGdvIGludG8gYSBzZXBhcmF0ZSBwYXRjaCBzbwo+ID4gPiB0aGF0IGl0
IGNsZWFybHkgc3RhbmRzIG91dD8KPiA+IAo+ID4gSSdsbCBtb3ZlIGl0IGludG8gJ1B1dCByZWFk
YWhlYWQgcGFnZXMgaW4gY2FjaGUgZWFybGllcicgZm9yIHY4ICh0aGUKPiA+IHNhbWUgcGF0Y2gg
d2hlcmUgd2UgYWRkIHJlYWRhaGVhZF9wYWdlKCkpCj4gCj4gT25lIGFyZ3VtZW50IGZvciBrZWVw
aW5nIGl0IGluIGEgcGF0Y2ggb2YgaXRzIG93biBpcyB0aGF0IGJ0cmZzIGFwcGVhcnMKPiB0byBi
ZSB0aGUgb25seSB1c2VyLCBhbmQgR29sZHd5biBoYXMgYSBXSVAgY29udmVyc2lvbiBvZiBidHJm
cyB0byBpb21hcCwKPiBzbyBpdCBtaWdodCBnbyBhd2F5IHByZXR0eSBzb29uIGFuZCB3ZSBjb3Vs
ZCBqdXN0IHJldmVydCB0aGUgY29tbWl0Lgo+IAo+IEJ1dCB0aGlzIHN0YXJ0cyB0byBnZXQgaW50
byByZWFsbHkgbWlub3IgZGV0YWlscywgc28gSSdsbCBzaHV0IHVwIG5vdyA6KQoKU28gbG9va2lu
ZyBhdCB0aGlzIGFnYWluIEkgaGF2ZSBhbm90aGVyIGNvbW1lbnQgYW5kIGEgcXVlc3Rpb24uCgpG
aXJzdCBJIHRoaW5rIHRoZSBpbXBsaWNpdCBBUlJBWV9TSVpFIGluIHJlYWRhaGVhZF9wYWdlX2Jh
dGNoIGlzIGhpZ2hseQpkYW5nZXJvdXMsIGFzIGl0IHdpbGwgZG8gdGhlIHdyb25nIHRoaW5nIHdo
ZW4gcGFzc2luZyBhIHBvaW50ZXIgb3IKZnVuY3Rpb24gYXJndW1lbnQuCgpTZWNvbmQgSSB3b25k
ZXIg0ZZmIGl0IHdvdWxkIGJlIHdvcnRoIHRvIGFsc28gc3dpdGNoIHRvIGEgYmF0Y2hlZApvcGVy
YXRpb24gaW4gaW9tYXAgaWYgdGhlIHhhcnJheSBvdmVyaGVhZCBpcyBoaWdoIGVub3VnaC4gIFRo
YXQgc2hvdWxkCmJlIHByZXR0eSB0cml2aWFsLCBidXQgd2UgZG9uJ3QgcmVhbGx5IG5lZWQgdG8g
ZG8gaXQgaW4gdGhpcyBzZXJpZXMuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

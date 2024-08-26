Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B5F95F73B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2024 18:56:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sid0n-0007jf-LA;
	Mon, 26 Aug 2024 16:56:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1sid0l-0007jW-Da
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 16:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9EWUv2HImFfX/N/60IfkTY1e4eWVBnEv8GezCD5Wv5M=; b=c7RUoVHXDQ6gjEw0FhsYem+T3B
 VDIZqPyib9D1UDrC7k9f35n3Pb5wDdkXWqEU+Zo7JjNwfr5QI0aeGpYwukQ9jBn2Bxl4YADzG5bu2
 RcttXxSQohvMMQlsquxaCBED0V0ceHz/GnobyhDwI/+xSD+EucuT/AuxNtUKhpoKiyfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9EWUv2HImFfX/N/60IfkTY1e4eWVBnEv8GezCD5Wv5M=; b=k8xW0G/WXCpWJyBe1gUymgwMV1
 Ntprrypb9DBL+JUH8XC8IHMi6N8RfgZJrHGLIIYsizAD5YEOtAi/L1TDR3IO6Ve4Ubaxdpg+QiTfo
 Ad18YOO3v8Wwuo7HAbdej4hvb7aWJ7XVoy9pB9QqEZU9p5MfvPzMny2gYsHwO/7IcVFY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sid0k-0004L7-2y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 16:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=9EWUv2HImFfX/N/60IfkTY1e4eWVBnEv8GezCD5Wv5M=; b=P6L98cESGD9Qh41ZcEq/xBG8SN
 hPI3io7GBvPSM8ZWU5rHhZsEpq709sHLf8UUFkdokoBlOFY4dx0eG59Xd7xEIHXlGZgYN+V0H8juj
 S5KIyXGS7/UIq2c2tCXrvKv56YvSN3AiSCA0nbGsUwSu6lPp+HVPEHwOUR2xYlvB7ubvPZkZq/bcf
 I30eFxO1PWroFdLaT+F9DYGt4kR/AN4AdLNMPWjqwGTUCvIwdX1MqdBu5AhV0+UYlfW4tAqIAB4eQ
 PoA1fV5hLGObyhqEbnFsoC3+iaNAkuOQjafYL5zBtMs4wQR3tPGk9QdxuDlFXxhRkdbYhO7drQ03j
 +fMYmZmA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sid0b-0000000Ff0f-3vrS;
 Mon, 26 Aug 2024 16:56:01 +0000
Date: Mon, 26 Aug 2024 17:56:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Josef Bacik <josef@toxicpanda.com>
Message-ID: <Zsyzoef1LlNacPkb@casper.infradead.org>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-3-lizetao1@huawei.com>
 <Zsaq_QkyQIhGsvTj@casper.infradead.org>
 <0f643b0f-f1c2-48b7-99d5-809b8b7f0aac@gmx.com>
 <ZscqGAMm1tofHSSG@casper.infradead.org>
 <38247c40-604b-443a-a600-0876b596a284@gmx.com>
 <7a04ac3b-e655-4a80-89dc-19962db50f05@gmx.com>
 <Zsis82IKSAq6Mgms@casper.infradead.org>
 <20240826141301.GB2393039@perftesting>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826141301.GB2393039@perftesting>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Aug 26, 2024 at 10:13:01AM -0400, Josef Bacik wrote:
    > On Fri, Aug 23, 2024 at 04:38:27PM +0100, Matthew Wilcox wrote: > > On
   Fri, Aug 23, 2024 at 11:43:41AM +0930, Qu Wenruo wrote: > > > 在 [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: infradead.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [90.155.50.34 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [90.155.50.34 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                           [90.155.50.34 listed in sa-trusted.bondedsender.org]
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sid0k-0004L7-2y
Subject: Re: [f2fs-dev] [PATCH 02/14] btrfs: convert
 get_next_extent_buffer() to take a folio
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
Cc: Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-f2fs-devel@lists.sourceforge.net,
 clm@fb.com, terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMTA6MTM6MDFBTSAtMDQwMCwgSm9zZWYgQmFjaWsgd3Jv
dGU6Cj4gT24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgMDQ6Mzg6MjdQTSArMDEwMCwgTWF0dGhldyBX
aWxjb3ggd3JvdGU6Cj4gPiBPbiBGcmksIEF1ZyAyMywgMjAyNCBhdCAxMTo0Mzo0MUFNICswOTMw
LCBRdSBXZW5ydW8gd3JvdGU6Cj4gPiA+IOWcqCAyMDI0LzgvMjMgMDc6NTUsIFF1IFdlbnJ1byDl
hpnpgZM6Cj4gPiA+ID4g5ZyoIDIwMjQvOC8yMiAyMTozNywgTWF0dGhldyBXaWxjb3gg5YaZ6YGT
Ogo+ID4gPiA+ID4gT24gVGh1LCBBdWcgMjIsIDIwMjQgYXQgMDg6Mjg6MDlQTSArMDkzMCwgUXUg
V2VucnVvIHdyb3RlOgo+ID4gPiA+ID4gPiBCdXQgd2hhdCB3aWxsIGhhcHBlbiBpZiBzb21lIHdy
aXRlcyBoYXBwZW5lZCB0byB0aGF0IGxhcmdlciBmb2xpbz8KPiA+ID4gPiA+ID4gRG8gTU0gbGF5
ZXIgZGV0ZWN0cyB0aGF0IGFuZCBzcGxpdCB0aGUgZm9saW9zPyBPciB0aGUgZnMgaGFzIHRvIGdv
IHRoZQo+ID4gPiA+ID4gPiBzdWJwYWdlIHJvdXRpbmUgKHdpdGggYW4gZXh0cmEgc3RydWN0dXJl
IHJlY29yZGluZyBhbGwgdGhlIHN1YnBhZ2UgZmxhZ3MKPiA+ID4gPiA+ID4gYml0bWFwKT8KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gRW50aXJlbHkgdXAgdG8gdGhlIGZpbGVzeXN0ZW0uwqAgSXQgd291
bGQgaGVscCBpZiBidHJmcyB1c2VkIHRoZSBzYW1lCj4gPiA+ID4gPiB0ZXJtaW5vbG9neSBhcyB0
aGUgcmVzdCBvZiB0aGUgZmlsZXN5c3RlbXMgaW5zdGVhZCBvZiBpbnZlbnRpbmcgaXRzIG93bgo+
ID4gPiA+ID4gInN1YnBhZ2UiIHRoaW5nLsKgIEFzIGZhciBhcyBJIGNhbiB0ZWxsLCAic3VicGFn
ZSIgbWVhbnMgImZzIGJsb2NrIHNpemUiLAo+ID4gPiA+ID4gYnV0IG1heWJlIGl0IGhhcyBhIGRp
ZmZlcmVudCBtZWFuaW5nIHRoYXQgSSBoYXZlbid0IGFzY2VydGFpbmVkLgo+ID4gPiA+IAo+ID4g
PiA+IFRoZW4gdGVsbCBtZSB0aGUgY29ycmVjdCB0ZXJtaW5vbG9neSB0byBkZXNjcmliZSBmcyBi
bG9jayBzaXplIHNtYWxsZXIKPiA+ID4gPiB0aGFuIHBhZ2Ugc2l6ZSBpbiB0aGUgZmlyc3QgcGxh
Y2UuCj4gPiA+ID4gCj4gPiA+ID4gImZzIGJsb2NrIHNpemUiIGlzIG5vdCBnb29kIGVub3VnaCwg
d2Ugd2FudCBhIHRlcm1pbm9sb2d5IHRvIGRlc2NyaWJlCj4gPiA+ID4gImZzIGJsb2NrIHNpemUi
IHNtYWxsZXIgdGhhbiBwYWdlIHNpemUuCj4gPiAKPiA+IE9oIGRlYXIuICBidHJmcyByZWFsbHkg
aGFzIGNvcnJ1cHRlZCB5b3VyIGJyYWluLiAgSGVyZSdzIHRoZSB0ZXJtaW5vbG9neQo+ID4gdXNl
ZCBpbiB0aGUgcmVzdCBvZiBMaW51eDoKPiAKPiBUaGlzIGlzbid0IG5lY2Vzc2FyeSBjb21tZW50
YXJ5LCB0aGlzIGdpdmVzIHRoZSBpbXByZXNzaW9uIHRoYXQgd2UncmUKPiB3cm9uZy9zdHVwaWQv
ZXRjLiAgV2UncmUgYWxsIGluIHRoaXMgY29tbXVuaXR5IHRvZ2V0aGVyLCBoYXZpbmcgcHVibGlj
LCBuZWdhdGl2ZQo+IGNvbW1lbnRhcnkgbGlrZSB0aGlzIGlzIHVubmVjZXNzYXJ5LCBhbmQgZnJh
bmtseSBjb250cmlidXRlcyB0byBteSBncm93aW5nCj4gZGVzaXJlL3ByaW9yaXRpZXMgdG8gc2hp
ZnQgbW9zdCBvZiBteSBkZXZlbG9wbWVudCBvdXRzaWRlIG9mIHRoZSBrZXJuZWwKPiBjb21tdW5p
dHkuICBBbmQgaWYgc29tZWJvZHkgd2l0aCBteSBleHBlcmllbmNlIGFuZCBoaXN0b3J5IGluIHRo
aXMgY29tbXVuaXR5IGlzCj4gYmVjb21pbmcgbW9yZSBhbmQgbW9yZSBkaXNpbGx1c2lvbmVkIHdp
dGggdGhpcyB3b3JrIGFuZCBtYWtpbmcgc2VyaW91cyBlZmZvcnRzCj4gdG8gZXh0cmljYXRlIHRo
ZW1zZWx2ZXMgZnJvbSB0aGUgcHJvamVjdCwgdGhlbiB3aGF0IGRvZXMgdGhhdCBzYXkgYWJvdXQg
b3VyCj4gYWJpbGl0eSB0byBicmluZyBpbiBuZXcgZGV2ZWxvcGVycz8gIFRoYW5rcywKCllvdSBr
bm93IHdoYXQ/ICBJJ20gZGlzaWxsdXNpb25lZCB0b28uICBJdCdzIGJlZW4gb3ZlciB0d28gYW5k
IGEgaGFsZgp5ZWFycyBzaW5jZSBmb2xpb3Mgd2VyZSBhZGRlZCAodjUuMTYgd2FzIHRoZSBmaXJz
dCByZWxlYXNlIHdpdGggZm9saW9zKS4KSSBrbmV3IGl0IHdvdWxkIGJlIGEgbG9uZyBwcm9qZWN0
IChJIHdhcyBhbnRpY2lwYXRpbmcgZml2ZSB5ZWFycykuCkkgd2FzIGV4cGVjdGluZyB0byBoYXZl
IHRvIHNsb2cgdGhyb3VnaCBhbGwgdGhlIG9sZCB1bm1haW50YWluZWQgY3JhcApmaWxlc3lzdGVt
cyBkb2luZyBtaW5pbWFsIGNvbnZlcnNpb25zLiAgV2hhdCBJIHdhc24ndCBleHBlY3Rpbmcgd2Fz
IGZvcgphbGwgdGhlIGFsbGVnZWRseSBtYWludGFpbmVkIGZpbGVzeXN0ZW1zIHRvIHNpdCBvbiB0
aGVpciBmdWNraW5nIGhhbmRzIGFuZAppZ25vcmUgaXQgYXMgbG9uZyBhcyBwb3NzaWJsZS4gIFRo
ZSBiaWdnZXN0IHBhaW5zIHJpZ2h0IG5vdyBhcmUgYnRyZnMsCmNlcGggYW5kIGYyZnMsIGFsbCBv
ZiB3aGljaCBoYXZlIHBlb3BsZSB3aG8gYXJlIHBhaWQgdG8gd29yayBvbiB0aGVtIQpJIGhhZCB0
byBkbyBleHQ0IGxhcmdlbHkgbXlzZWxmLgoKU29tZSBmaWxlc3lzdGVtcyBoYXZlIGJlZW4gZ3Jl
YXQuICBYRlMgd29ya2VkIHdpdGggbWUgYXMgSSBkaWQgdGhhdApmaWxlc3lzdGVtIGZpcnN0LiAg
bmZzIHRvb2sgY2FyZSBvZiB0aGVpciBvd24gY29kZS4gIERhdmUgSG93ZWxscyBoYXMKZG9uZSBt
b3N0IG9mIHRoZSBvdGhlciBuZXR3b3JrIGZpbGVzeXN0ZW1zLiAgTWFueSBvdGhlciBwZW9wbGUg
aGF2ZQphbHNvIGhlbHBlZC4KCkJ1dCB3ZSBjYW4ndCBldmVuIHRhbGsgdG8gZWFjaCBvdGhlciB1
bmxlc3Mgd2UgYWdyZWUgb24gd2hhdCB3b3JkcyBtZWFuLgpBbmQgYnRyZnMgaW52ZW50aW5nIGl0
cyBvd24gdGVybWlub2xvZ3kgZm9yIHRoaW5ncyB3aGljaCBhbHJlYWR5IGV4aXN0CmluIG90aGVy
IGZpbGVzeXN0ZW1zIGlzIGV4dHJlbWVseSB1bmhlbHBmdWwuCgpXZSBuZWVkIHRvIHJlbW92ZSB0
aGUgdGVtcG9yYXJ5IGhhY2sgdGhhdCBpcyBDT05GSUdfUkVBRF9PTkxZX1RIUF9GT1JfRlMuClRo
YXQgd2VudCBpbiB3aXRoIHRoZSB1bmRlcnN0YW5kaW5nIHRoYXQgZmlsZXN5c3RlbXMgdGhhdCBt
YXR0ZXJlZCB3b3VsZAphZGQgbGFyZ2UgZm9saW8gc3VwcG9ydC4gIFdoZW4gSSBzZWUgc29tZW9u
ZSBwdXJwb3J0aW5nIHRvIHJlcHJlc2VudApidHJmcyBzYXkgIk9oLCB3ZSdyZSBub3QgZ29pbmcg
dG8gZG8gdGhhdCIsIHRoYXQncyBhIGJyZWFjaCBvZiB0cnVzdC4KCldoZW4gSSdtIGFjY3VzZWQg
b2Ygbm90IHVuZGVyc3RhbmRpbmcgdGhpbmdzIGZyb20gdGhlIGZpbGVzeXN0ZW0KcGVyc3BlY3Rp
dmUsIHRoYXQncyBqdXN0IGEgbGllLiAgSSBoYXZlIDE5MiBjb21taXRzIGluIGZzLyBiZXR3ZWVu
IDYuNgphbmQgNi4xMCB2ZXJzdXMgMTYwIGluIG1tLyAoMzQ2IGNvbW1pdHMgaW4gYm90aCBjb21i
aW5lZCwgc28gNiBjb21taXRzCmFyZSBkb3VibGUtY291bnRlZCBiZWNhdXNlIHRoZXkgdG91Y2gg
Ym90aCkuICBUaGlzIHdob2xlIHByb2plY3QgaGFzCmJlZW4gZmlsZXN5c3RlbS1jZW50cmljIGZy
b20gdGhlIGJlZ2lubmluZy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

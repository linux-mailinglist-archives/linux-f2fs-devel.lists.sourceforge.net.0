Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBE095B4A6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 14:08:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sh6bt-0001G9-2B;
	Thu, 22 Aug 2024 12:08:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1sh6bk-0001Fy-9p
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 12:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DUe/Urm+0reIbIlypNQIYbpK3446z7WDCRLPHoI0Fho=; b=jSdcY1LE/Wm4/jjFKr/T46BMJ8
 1JacTCbQuGtqmtY1Wk+8GU4vxK6jcJSuPdZgiB+67b025L4Y5mClNeOw0bXqzbZZ5vAS6JOY/viiL
 ZrQz4ViHFD4ViixbuyKCBtxScZ/1g++yNMGBYYzsc+FU/qxNZXwIofBjWWLV/aZ0Vwgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DUe/Urm+0reIbIlypNQIYbpK3446z7WDCRLPHoI0Fho=; b=iF7q5d9OwWmTSwKtUcO50+phC3
 rN1FqK0FtKPwsJJ21igwVzZIJd3RPmkPWsA/3CxIZUvq0M16zWLt0R06mRutgII184U8w+ZcDlWZW
 SrLfmxRfb/dpiS79CzHzlLA1jp0d925jP/3WC61igN+vVkwM8w2IvHn3VFNM4uMHluxE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sh6bj-0003pJ-J0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 12:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=DUe/Urm+0reIbIlypNQIYbpK3446z7WDCRLPHoI0Fho=; b=aTqtZlssyfBuJMn3aff6PPocPO
 NvJ5xdI2y5mwu6v+19683egGCFbzjlRdNL0ZStL2JKzjQYb/6XSCyUTOcoNf//nmdmnZkdB9oQcYW
 ToUm4GrKQ8y1izDL2lGeLXKL1BIxqnNkgZ1nb/HJX3YR9B1AND1FLrQSv0H4MG+iFPsKpb6tEZ/W0
 oT+7Q7mVcjNHhjxLDVaPDKLsvyhBm9cbXcO+s2foXctkcqqmocdyuf3ZVB3zqB6BSJEu9SPLafMtx
 M/pDAbukseKE82PDs/+ntjhxTe083gDygPWZhX+ELbIEOqtloOwIbcqDIM7MJFV+yOvjd/g4Tm4sZ
 pEosfeSw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sh6bZ-0000000ATrQ-0l6g;
 Thu, 22 Aug 2024 12:07:53 +0000
Date: Thu, 22 Aug 2024 13:07:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <ZscqGAMm1tofHSSG@casper.infradead.org>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-3-lizetao1@huawei.com>
 <Zsaq_QkyQIhGsvTj@casper.infradead.org>
 <0f643b0f-f1c2-48b7-99d5-809b8b7f0aac@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f643b0f-f1c2-48b7-99d5-809b8b7f0aac@gmx.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Aug 22, 2024 at 08:28:09PM +0930, Qu Wenruo wrote:
    > 在 2024/8/22 12:35, Matthew Wilcox 写道: > > > - while (cur < page_start
    + PAGE_SIZE) { > > > + while (cur < folio_start + PAGE_SIZE) { [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: infradead.org]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
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
                             [90.155.50.34 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sh6bj-0003pJ-J0
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
Cc: josef@toxicpanda.com, linux-f2fs-devel@lists.sourceforge.net, clm@fb.com,
 terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBBdWcgMjIsIDIwMjQgYXQgMDg6Mjg6MDlQTSArMDkzMCwgUXUgV2VucnVvIHdyb3Rl
Ogo+IOWcqCAyMDI0LzgvMjIgMTI6MzUsIE1hdHRoZXcgV2lsY294IOWGmemBkzoKPiA+ID4gLQl3
aGlsZSAoY3VyIDwgcGFnZV9zdGFydCArIFBBR0VfU0laRSkgewo+ID4gPiArCXdoaWxlIChjdXIg
PCBmb2xpb19zdGFydCArIFBBR0VfU0laRSkgewo+ID4gCj4gPiBQcmVzdW1hYmx5IHdlIHdhbnQg
dG8gc3VwcG9ydCBsYXJnZSBmb2xpb3MgaW4gYnRyZnMgYXQgc29tZSBwb2ludD8KPiAKPiBZZXMs
IGFuZCB3ZSdyZSBhbHJlYWR5IHdvcmtpbmcgdG93YXJkcyB0aGF0IGRpcmVjdGlvbi4KPiAKPiA+
IEkgY2VydGFpbmx5IHdhbnQgdG8gcmVtb3ZlIENPTkZJR19SRUFEX09OTFlfVEhQX0ZPUl9GUyBz
b29uIGFuZCB0aGF0J2xsCj4gPiBiZSBhIGJpdCBvZiBhIHJlZ3Jlc3Npb24gZm9yIGJ0cmZzIGlm
IGl0IGRvZXNuJ3QgaGF2ZSBsYXJnZSBmb2xpbwo+ID4gc3VwcG9ydC4gIFNvIHNob3VsZG4ndCB3
ZSBhbHNvIHMvUEFHRV9TSVpFL2ZvbGlvX3NpemUoZm9saW8pLyA/Cj4gCj4gQUZBSUsgd2UncmUg
b25seSBnb2luZyB0byBzdXBwb3J0IGxhcmdlciBmb2xpb3MgdG8gc3VwcG9ydCBsYXJnZXIgdGhh
bgo+IFBBR0VfU0laRSBzZWN0b3Igc2l6ZSBzbyBmYXIuCgpXaHkgZG8geW91IG5vdCB3YW50IHRo
ZSBwZXJmb3JtYW5jZSBnYWlucyBmcm9tIHVzaW5nIGxhcmdlciBmb2xpb3M/Cgo+IFNvIGV2ZXJ5
IGZvbGlvIGlzIHN0aWxsIGluIGEgZml4ZWQgc2l6ZSAoc2VjdG9yIHNpemUsID49IFBBR0VfU0la
RSkuCj4gCj4gTm90IGZhbWlsaWFyIHdpdGggdHJhbnNwYXJlbnQgaHVnZSBwYWdlLCBJIHRob3Vn
aHQgdHJhbnNwYXJlbnQgaHVnZSBwYWdlCj4gaXMgdHJhbnNwYXJlbnQgdG8gZnMuCj4gCj4gT3Ig
ZG8gd2UgbmVlZCBzb21lIHNwZWNpYWwgaGFuZGxpbmc/Cj4gTXkgdW5lZHVjYXRlZCBndWVzcyBp
cywgd2Ugd2lsbCBnZXQgYSBsYXJnZXIgZm9saW8gcGFzc2VkIHRvIHJlYWRwYWdlCj4gY2FsbCBi
YWNrIGRpcmVjdGx5PwoKV2h5IGRvIHlvdSBjaG9vc2UgdG8gcmVtYWluIHVuZWR1Y2F0ZWQ/ICBJ
dCdzIG5vdCBsaWtlIEkndmUgYmVlbiBrZWVwaW5nCmFsbCBvZiB0aGlzIHRvIG15c2VsZiBmb3Ig
dGhlIHBhc3QgZml2ZSB5ZWFycy4gIEkndmUgZ2l2ZW4gZG96ZW5zIG9mCnByZXNlbnRhdGlvbnMg
b24gaXQsIGluY2x1ZGluZyBwbGVuYXJ5IHNlc3Npb25zIGF0IExTRk1NLiAgQXMgYSBmaWxlc3lz
dGVtCmRldmVsb3BlciwgeW91IG11c3Qgd2FudCB0byBub3Qga25vdyBhYm91dCBpdCBhdCB0aGlz
IHBvaW50LgoKPiBJdCdzIHN0cmFpZ2h0Zm9yd2FyZCBlbm91Z2ggdG8gcmVhZCBhbGwgY29udGVu
dHMgZm9yIGEgbGFyZ2VyIGZvbGlvLAo+IGl0J3Mgbm8gZGlmZmVyZW50IHRvIHN1YnBhZ2UgaGFu
ZGxpbmcuCj4gCj4gQnV0IHdoYXQgd2lsbCBoYXBwZW4gaWYgc29tZSB3cml0ZXMgaGFwcGVuZWQg
dG8gdGhhdCBsYXJnZXIgZm9saW8/Cj4gRG8gTU0gbGF5ZXIgZGV0ZWN0cyB0aGF0IGFuZCBzcGxp
dCB0aGUgZm9saW9zPyBPciB0aGUgZnMgaGFzIHRvIGdvIHRoZQo+IHN1YnBhZ2Ugcm91dGluZSAo
d2l0aCBhbiBleHRyYSBzdHJ1Y3R1cmUgcmVjb3JkaW5nIGFsbCB0aGUgc3VicGFnZSBmbGFncwo+
IGJpdG1hcCk/CgpFbnRpcmVseSB1cCB0byB0aGUgZmlsZXN5c3RlbS4gIEl0IHdvdWxkIGhlbHAg
aWYgYnRyZnMgdXNlZCB0aGUgc2FtZQp0ZXJtaW5vbG9neSBhcyB0aGUgcmVzdCBvZiB0aGUgZmls
ZXN5c3RlbXMgaW5zdGVhZCBvZiBpbnZlbnRpbmcgaXRzIG93bgoic3VicGFnZSIgdGhpbmcuICBB
cyBmYXIgYXMgSSBjYW4gdGVsbCwgInN1YnBhZ2UiIG1lYW5zICJmcyBibG9jayBzaXplIiwKYnV0
IG1heWJlIGl0IGhhcyBhIGRpZmZlcmVudCBtZWFuaW5nIHRoYXQgSSBoYXZlbid0IGFzY2VydGFp
bmVkLgoKVHJhY2tpbmcgZGlydGluZXNzIG9uIGEgcGVyLWZvbGlvIGJhc2lzIGRvZXMgbm90IHNl
ZW0gdG8gYmUgZ29vZCBlbm91Z2guClZhcmlvdXMgcGVvcGxlIGhhdmUgd29ya2xvYWRzIHRoYXQg
cmVncmVzcyBpbiBwZXJmb3JtYW5jZSBpZiB5b3UgZG8KdGhhdC4gIFNvIGhhdmluZyBzb21lIGRh
dGEgc3RydWN0dXJlIGF0dGFjaGVkIHRvIGZvbGlvLT5wcml2YXRlIHdoaWNoCnRyYWNrcyBkaXJ0
aW5lc3Mgb24gYSBwZXItZnMtYmxvY2sgYmFzaXMgd29ya3MgcHJldHR5IHdlbGwuICBpb21hcCBh
bHNvCnRyYWNrcyB0aGUgdXB0b2RhdGUgYml0IG9uIGEgcGVyLWZzLWJsb2NrIGJhc2lzLCBidXQg
SSdtIGxlc3MgY29udmluY2VkCnRoYXQncyBuZWNlc3NhcnkuCgpJIGhhdmUgbm8gaWRlYSB3aHkg
YnRyZnMgdGhpbmtzIGl0IG5lZWRzIHRvIHRyYWNrIHdyaXRlYmFjaywgb3JkZXJlZCwKY2hlY2tl
ZCBhbmQgbG9ja2VkIGluIGEgYml0bWFwLiAgVGhvc2UgbWFrZSBubyBzZW5zZSB0byBtZS4gIEJ1
dCB0aGV5Cm1ha2Ugbm8gc2Vuc2UgdG8gbWUgaWYgeW91J3JlIHN1cHBvcnQgYSA0S2lCIGZpbGVz
eXN0ZW0gb24gYSBtYWNoaW5lCndpdGggYSA2NEtpQiBQQUdFX1NJWkUsIG5vdCBqdXN0IGluIHRo
ZSBjb250ZXh0IG9mICJsYXJnZXIgZm9saW9zIi4KV3JpdGViYWNrIGlzIHNvbWV0aGluZyB0aGUg
Vk0gdGVsbHMgeW91IHRvIGRvOyB3aHkgZG8geW91IG5lZWQgdG8gdGFnCmluZGl2aWR1YWwgYmxv
Y2tzIGZvciB3cml0ZWJhY2s/CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

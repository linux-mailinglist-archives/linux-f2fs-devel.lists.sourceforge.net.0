Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D17299DD5A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 07:02:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0ZhX-0003zI-56;
	Tue, 15 Oct 2024 05:02:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9a7a7393fdffe154be76+7723+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1t0ZhV-0003zC-Ft for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 05:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0MA9WHJL/WVIgmEkBwYvdGDLHEtwUJ2Z4YXr0YnVjXs=; b=hH9Bl972KjOeU4dWIwulrA5LXJ
 pktZIPcC98U+yGNdKibsCKz3eTU2WjEZW/HroYY8G94mC865ksYy8f56sQs7TYNi5xLOu6YsOeM1k
 ZXnXQ4wwhDJsjz1zsSJYT1fkcrEjbjOGpBwor3gWXVkmW+H/Y7CyQINdZtGT5jWXQnNM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0MA9WHJL/WVIgmEkBwYvdGDLHEtwUJ2Z4YXr0YnVjXs=; b=YaEfy/bAy2AoqLS091RHslJOwP
 gO5ZPwgxwy86g8KkYFk+VGmwOHzbb2+Q/txMH5zWmHzUyM689fFDWxm1YUYWDsKQwMJ0ESbdpuc2D
 CWHjb6S8/WOIdaQDrY16EdaUl4lmfsD0DMat7xwvB//lv7wyUPC/VZZL9F62wJNXA8S0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0ZhU-0001Nq-Mv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 05:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=0MA9WHJL/WVIgmEkBwYvdGDLHEtwUJ2Z4YXr0YnVjXs=; b=l7M1H4GkHKRrvkacu9ZQzsm6Mx
 H9DZoioQynJmTDmmdQJcOnZyug4DzPpbqGPkdj9txTC6kJEyH0xfwAy4h6Vs958lufTzXcJuPqtji
 YWgxPttQ7tLXqts9tVY1P3vR/ThQdlWOw9fukAkIQlC2txBVzM8V0svd/zhW6Z3yFdXSn7MNHM/mL
 94zYtK3Sjku+sIl6TGsrmxx7b8zuYdosM23DuL9yzDZno1L1xaETFF++kDfGF6Odk9IT/orojli4q
 ss5VZlpH/GrmU2wPv2ATmY9ax6B5Ne97ChJvW0w+wgboVtHpm+VZCCM1+1Fu1QjjaMq+UaEL3uo5K
 foeLjk7g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t0ZhK-000000074su-0NrT; Tue, 15 Oct 2024 05:02:18 +0000
Date: Mon, 14 Oct 2024 22:02:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <Zw33WgpF09IHpKLB@infradead.org>
References: <20241010192626.1597226-1-daeho43@gmail.com>
 <ZwyyiG0pqXoBFIW5@infradead.org>
 <CACOAw_yvb=jacbXVr76bSbCEcud=D1vw5rJVDO+TjZbMLYzdZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_yvb=jacbXVr76bSbCEcud=D1vw5rJVDO+TjZbMLYzdZQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Oct 14, 2024 at 09:28:04AM -0700, Daeho Jeong wrote:
    > On Sun, Oct 13, 2024 at 10:56 PM Christoph Hellwig <hch@infradead.org>
    wrote: > > > > On Thu, Oct 10, 2024 at 12:26:26PM -0700, Daeho J [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [198.137.202.133 listed in list.dnswl.org]
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1t0ZhU-0001Nq-Mv
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: introduce device aliasing file
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBPY3QgMTQsIDIwMjQgYXQgMDk6Mjg6MDRBTSAtMDcwMCwgRGFlaG8gSmVvbmcgd3Jv
dGU6Cj4gT24gU3VuLCBPY3QgMTMsIDIwMjQgYXQgMTA6NTbigK9QTSBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgT2N0IDEwLCAyMDI0
IGF0IDEyOjI2OjI2UE0gLTA3MDAsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gPiBGcm9tOiBEYWVo
byBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gPgo+ID4gPiBGMkZTIHNob3VsZCB1
bmRlcnN0YW5kIGhvdyB0aGUgZGV2aWNlIGFsaWFzaW5nIGZpbGUgd29ya3MgYW5kIHN1cHBvcnQK
PiA+ID4gZGVsZXRpbmcgdGhlIGZpbGUgYWZ0ZXIgdXNlLiBBIGRldmljZSBhbGlhc2luZyBmaWxl
IGNhbiBiZSBjcmVhdGVkIGJ5Cj4gPiA+IG1rZnMuZjJmcyB0b29sIGFuZCBpdCBjYW4gbWFwIHRo
ZSB3aG9sZSBkZXZpY2Ugd2l0aCBhbiBleHRyZW50LCBub3QKPiA+Cj4gPiBzL2V4dHJlbnQvZXh0
ZW50L2cKPiA+Cj4gPiA+IHVzaW5nIG5vZGUgYmxvY2tzLiBUaGUgZmlsZSBzcGFjZSBzaG91bGQg
YmUgcGlubmVkIGFuZCBub3JtYWxseSB1c2VkIGZvcgo+ID4gPiByZWFkLW9ubHkgdXNhZ2VzLgo+
ID4KPiA+IElzIHRoZXJlIGFuIGV4cGxhbmF0aW9uIHNvbWV3aGVyZSB3aGF0IGEgJ2RldmljZSBh
bGlhc2luZyBmaWxlJyBpcz8KPiAKPiBQbHosIHJlZmVyIHRvIHRoaXMgcGF0Y2ggYW5kIHRoZSBk
ZXNjcmlwdGlvbiB0aGVyZS4KPiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9qYWVnZXVrL2YyZnMtdG9vbHMuZ2l0L2NvbW1pdC8/aD1kZXYtdGVzdCZp
ZD04Y2M0ZTI1N2VjMjBiZWUyMDdiYjAzNGQ1YWM0MDZlMWFiMzFlYWVhCgpUaGlzIGlzIGFib3V0
IHRoZSBleHRlbnQgSSBrbm93LCBhbmQgSSdtIHN0aWxsIHV0dGVybHkgY29uZnVzZWQuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK

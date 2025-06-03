Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 005BAACC8B0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 16:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Z94HgGFbDojTJpPHjyXTFE0OMTbFZP2fSuRxgKllko=; b=a0KGrs99tUZCnKbpmrBe+suIC7
	eaFjzq9X+j5Svnj4wmD8gWmRxZYvJNJrop06i/02ZnUTv5SD26IoABnCb2qLFFDR7kjZryarVjeCv
	AXf7L8M0Zob/UvU57Sv3maAllK4gPs+niC6W2JjigJl9EnCZ1o6XxqgKRzcgrVMw4AJI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMSGb-0007H3-ES;
	Tue, 03 Jun 2025 14:05:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uMSGZ-0007Gu-Nk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 14:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f6KJn4kivWBawQKHn5XIfNmPeD0ntr8UbSkReYMz9eI=; b=WuV/HjZFXlf1WQ+Dchr2sQpZvC
 M+AUEKFcDxK8aUwF3fGYR2EHo4oIqJ4aVSBvzVX70wM1cNFeg48/1id0JC/oJ3u8ZQk2q2cUaClax
 f33eo5Df9kPHNOEiyuoLIqxHmTLaHqRQpTlI7A2LObUpHnVVaM1F7tsZSxRYxiuLDFkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f6KJn4kivWBawQKHn5XIfNmPeD0ntr8UbSkReYMz9eI=; b=DvQUcDrHj+YFdt4XmvmfJH7rL+
 AbqOv/g1z9wqGSWbMTVbw5iX4NSl1R8sG7elC3/pGm/M0u8HcB++VwydEDtyyVOmToaibimo+mCzz
 dTSGI+tZF3MiI9Hs5H/h7UdeNicf/C+qvY6xXMkvlJc82L2ksBxP058fcaHcdGBA9Bf0=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMSGZ-0004NX-1S for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 14:05:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9FB0A68D12; Tue,  3 Jun 2025 16:05:13 +0200 (CEST)
Date: Tue, 3 Jun 2025 16:05:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Anuj gupta <anuj1072538@gmail.com>
Message-ID: <20250603140513.GB14351@lst.de>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250602141904.GA21996@lst.de>
 <c029d791-20ca-4f2e-926d-91856ba9d515@samsung.com>
 <20250603132434.GA10865@lst.de>
 <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
 <20250603140445.GA14351@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603140445.GA14351@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 03, 2025 at 04:04:45PM +0200, Christoph Hellwig
 wrote: > On Tue, Jun 03, 2025 at 07:22:18PM +0530, Anuj gupta wrote: > >
 > A mount option is about the worst possible interface for behavior [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [213.95.11.211 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [213.95.11.211 listed in sa-accredit.habeas.com]
X-Headers-End: 1uMSGZ-0004NX-1S
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
Cc: ritesh.list@gmail.com, jack@suse.cz, djwong@kernel.org, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 Christoph Hellwig <hch@lst.de>, dave@stgolabs.net, agruenba@redhat.com,
 miklos@szeredi.hu, Kundan Kumar <kundan.kumar@samsung.com>,
 willy@infradead.org, p.raghav@samsung.com,
 Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>, linux-nfs@vger.kernel.org,
 da.gomez@samsung.com, viro@zeniv.linux.org.uk, kundanthebest@gmail.com,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 gost.dev@samsung.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gMDMsIDIwMjUgYXQgMDQ6MDQ6NDVQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMDMsIDIwMjUgYXQgMDc6MjI6MThQTSArMDUzMCwgQW51
aiBndXB0YSB3cm90ZToKPiA+ID4gQSBtb3VudCBvcHRpb24gaXMgYWJvdXQgdGhlIHdvcnN0IHBv
c3NpYmxlIGludGVyZmFjZSBmb3IgYmVoYXZpb3IKPiA+ID4gdGhhdCBkZXBlbmRzIG9uIGZpbGUg
c3lzdGVtIGltcGxlbWVudGF0aW9uIGFuZCBwb3NzaWJseSBoYXJkd2FyZQo+ID4gPiBjaGFjdGVy
aXN0aWNzLiAgVGhpcyBuZWVkcyB0byBiZSBzZXQgYnkgdGhlIGZpbGUgc3lzdGVtcywgcG9zc2li
bHkKPiA+ID4gdXNpbmcgZ2VuZXJpYyBoZWxwZXJzIHVzaW5nIGhhcmR3YXJlIGluZm9ybWF0aW9u
Lgo+ID4gCj4gPiBSaWdodCwgdGhhdCBtYWtlcyBzZW5zZS4gSW5zdGVhZCBvZiB1c2luZyBhIG1v
dW50IG9wdGlvbiwgd2UgY2FuCj4gPiBpbnRyb2R1Y2UgZ2VuZXJpYyBoZWxwZXJzIHRvIGluaXRp
YWxpemUgbXVsdGlwbGUgd3JpdGViYWNrIGNvbnRleHRzCj4gPiBiYXNlZCBvbiB1bmRlcmx5aW5n
IGhhcmR3YXJlIGNoYXJhY3RlcmlzdGljcyDigJQgZS5nLiwgbnVtYmVyIG9mIENQVXMgb3IKPiA+
IE5VTUEgdG9wb2xvZ3kuIEZpbGVzeXN0ZW1zIGxpa2UgWEZTIGFuZCBFWFQ0IGNhbiB0aGVuIGNh
bGwgdGhlc2UgaGVscGVycwo+ID4gZHVyaW5nIG1vdW50IHRvIG9wdCBpbnRvIHBhcmFsbGVsIHdy
aXRlYmFjayBpbiBhIGNvbnRyb2xsZWQgd2F5Lgo+IAo+IFllcy4gIEEgbW91bnQgb3B0aW9uIG1p
Z2h0IHN0aWxsIGJlIHVzZWZ1bCB0byBvdmVycmlkZSB0aGlzIGRlZmF1bHQsCj4gYnV0IGl0IHNo
b3VsZCBub3QgYmUgbmVlZGVkIGZvciB0aGUgbm9ybWFsIHVzZSBjYXNlLgoKLi4gYWN0dWFsbHkg
YSBzeXNmcyBmaWxlIG9uIHRoZSBiZGkgaXMgcHJvYmFibHkgdGhlIGJldHRlciBpbnRlcmZhY2UK
Zm9yIHRoZSBvdmVycmlkZSB0aGFuIGEgbW91bnQgb3B0aW9uLgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

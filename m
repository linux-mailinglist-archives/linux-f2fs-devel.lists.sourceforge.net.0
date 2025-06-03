Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6DACC8AE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 16:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQyjWM5erEyUQWo8vWFpz55ugHEBmHDD8/lG4lpTUqM=; b=CS9KskWdeovhHLWGQvvc9yScIc
	nbLMZuve2HaEz71s71GBC7iqdElS5EQzMz+z0JNlRi3YziKiEH30CsPEz90BEWDo4E6MOqAJQOnFQ
	gkP79PDqjruZ9El6zKpp6L+TkMoG+mDBs175R1FWRXpj7UmkltnZ5A81nFMOuirItT08=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMSGF-00062m-7f;
	Tue, 03 Jun 2025 14:05:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uMSGD-000625-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 14:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KdeN+C81na59VFN4VjFpqchIQBdH9hme8BVMcCk6vsQ=; b=IY6sn5LEMAUI3FRMu+EnAXnmnh
 WLHv2Gk6VAmTEfEvl1le268Vjx0r0fXoxrmT1cn56nfyOmAIYMNC9ob7vg0dhpv3Fz/Z7e7p8ByBW
 w+Ni55BKSVyT5QEZgtGzvX1dqDjIIBsUzkF8O0pOFIJ6T6UoOUHzZVtn9xZ8moYmHSRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KdeN+C81na59VFN4VjFpqchIQBdH9hme8BVMcCk6vsQ=; b=FyMXnHCoTH6XnNm85WDOz3LdO0
 cDoz1QVM5b1i/UHcvv/ae6/C1Y0sdmOPvMZ3vyVPhdQU2qeyaegsf/E8KOwUvB3hNnZPZCNkkw5Eu
 elr1axTOHRazaT+p7JOu62CXWsqYUVZWX7OPK9MLDOnGz/qs5rsDqX8C3vXDLBOd0scA=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMSGC-0004MS-BR for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 14:05:00 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 727C668D0F; Tue,  3 Jun 2025 16:04:45 +0200 (CEST)
Date: Tue, 3 Jun 2025 16:04:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Anuj gupta <anuj1072538@gmail.com>
Message-ID: <20250603140445.GA14351@lst.de>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250602141904.GA21996@lst.de>
 <c029d791-20ca-4f2e-926d-91856ba9d515@samsung.com>
 <20250603132434.GA10865@lst.de>
 <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Headers-End: 1uMSGC-0004MS-BR
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

T24gVHVlLCBKdW4gMDMsIDIwMjUgYXQgMDc6MjI6MThQTSArMDUzMCwgQW51aiBndXB0YSB3cm90
ZToKPiA+IEEgbW91bnQgb3B0aW9uIGlzIGFib3V0IHRoZSB3b3JzdCBwb3NzaWJsZSBpbnRlcmZh
Y2UgZm9yIGJlaGF2aW9yCj4gPiB0aGF0IGRlcGVuZHMgb24gZmlsZSBzeXN0ZW0gaW1wbGVtZW50
YXRpb24gYW5kIHBvc3NpYmx5IGhhcmR3YXJlCj4gPiBjaGFjdGVyaXN0aWNzLiAgVGhpcyBuZWVk
cyB0byBiZSBzZXQgYnkgdGhlIGZpbGUgc3lzdGVtcywgcG9zc2libHkKPiA+IHVzaW5nIGdlbmVy
aWMgaGVscGVycyB1c2luZyBoYXJkd2FyZSBpbmZvcm1hdGlvbi4KPiAKPiBSaWdodCwgdGhhdCBt
YWtlcyBzZW5zZS4gSW5zdGVhZCBvZiB1c2luZyBhIG1vdW50IG9wdGlvbiwgd2UgY2FuCj4gaW50
cm9kdWNlIGdlbmVyaWMgaGVscGVycyB0byBpbml0aWFsaXplIG11bHRpcGxlIHdyaXRlYmFjayBj
b250ZXh0cwo+IGJhc2VkIG9uIHVuZGVybHlpbmcgaGFyZHdhcmUgY2hhcmFjdGVyaXN0aWNzIOKA
lCBlLmcuLCBudW1iZXIgb2YgQ1BVcyBvcgo+IE5VTUEgdG9wb2xvZ3kuIEZpbGVzeXN0ZW1zIGxp
a2UgWEZTIGFuZCBFWFQ0IGNhbiB0aGVuIGNhbGwgdGhlc2UgaGVscGVycwo+IGR1cmluZyBtb3Vu
dCB0byBvcHQgaW50byBwYXJhbGxlbCB3cml0ZWJhY2sgaW4gYSBjb250cm9sbGVkIHdheS4KClll
cy4gIEEgbW91bnQgb3B0aW9uIG1pZ2h0IHN0aWxsIGJlIHVzZWZ1bCB0byBvdmVycmlkZSB0aGlz
IGRlZmF1bHQsCmJ1dCBpdCBzaG91bGQgbm90IGJlIG5lZWRlZCBmb3IgdGhlIG5vcm1hbCB1c2Ug
Y2FzZS4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=

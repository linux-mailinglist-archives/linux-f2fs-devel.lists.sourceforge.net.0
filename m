Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C1AACA66
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 18:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94u9aJfRXt72ShbYSWnhU7J2xsbF3UyQppT7aCvDVas=; b=HipZtmFD5o2fjMwewNkq+36lsc
	xfto46F2gtCFPLOZ8bxIwkiISNjYQdgKph+4DrzEcWu2wFw7HpeosrDSicjvYmzCIedKv371PH5ry
	S4WBoMWI982u55tInOm4q8kv54B6lJR8xlbfBnYeIrBtRxsJw8LyD5hC46YSdIewvgZ4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCKlQ-0008Ej-4q;
	Tue, 06 May 2025 16:03:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uCKlP-0008Ed-27
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 16:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JM8Xz6G1JHwWm9HaP2juyF3oXmYlAF55BhRmBu2YM2o=; b=OzDRkWqEDs3W+wgC+e6dhavraa
 mKpuAW91t85tH3QnmXlTGt1Oh9WRRAp0CpL7OG1ugKyLEvfegxoLpYT214+wCfxIcaHoDpDbBLHRj
 pD0zIXrNPz4g+11AjR1YFVZtRPbxQ6LykIG95jAPHM9N+B4wu3L/aN2ngB7Jajq5cKpE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JM8Xz6G1JHwWm9HaP2juyF3oXmYlAF55BhRmBu2YM2o=; b=JRpaKQluoPVqMPS7CXY6O+TTvQ
 kHBbK8El73GaFcsBbf9ze6r8/w5ABQxevDBPW6sB8ItCtODKPNAjmKFTavqHGvlguvfyqRpzzCCos
 vTyE3S37O7p3Rkyz6QthJUueRQVOgADtMbcqENmqxkxVExu1FpJcHoFsI+n+HfZs2S3o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCKl9-0002dl-5p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 16:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 635EB629DB;
 Tue,  6 May 2025 16:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD74C4CEE4;
 Tue,  6 May 2025 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746547381;
 bh=GfX1nTFezZeREFCc7cbz+QTDMqbI2Ud4Musyc7cwTy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XJSsrXAAp/M49taRaxcSt8fv3j/aIbEUjpjKsJoa/QwQ7ElukBpbGNIYUAtpuqhnw
 ChjnC8kmi6IIZU8dHhvbsItJIVAR7yPf6AUn/guUlBPMxkmQ/LW12NRd9QpmYobV6p
 bKMKLaFAuBkFPQAS36SpEW8tihea4mwjaPAHA3mO3c7mGTQruAd5v+YZywVnvmt23e
 otrqVMbY7h2MHGVQBU7BvvT0x6OrCyhBp4urGcLZ3TfAT+gEFMgz3b1fiAUr5o8dF+
 BKayjOe74sbc0jkzOvfcHiR6k8ugRth97fSao1nFAq3dZDDyjdHDfevrJMS7hqiZ/g
 pc863tLVByCeg==
Date: Tue, 6 May 2025 16:02:59 +0000
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <aBoys-gkIcu2AARF@google.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <b673458e-98b6-42ad-b95f-7a771cd56b03@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b673458e-98b6-42ad-b95f-7a771cd56b03@redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/05, Eric Sandeen wrote: > Hi all - it would be nice
 to get some review or feedback on this; > seems that these patches tend to
 go stale fairly quickly as f2fs > evolves. :) Thank you so much for the work!
 Let me queue this series into dev-test for tests. If I find any issue, let
 me ping to the thread. So, you don't need to worry about rebasing it. :) 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCKl9-0002dl-5p
Subject: Re: [f2fs-dev] [PATCH V3 0/7] f2fs: new mount API conversion
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDUvMDUsIEVyaWMgU2FuZGVlbiB3cm90ZToKPiBIaSBhbGwgLSBpdCB3b3VsZCBiZSBuaWNl
IHRvIGdldCBzb21lIHJldmlldyBvciBmZWVkYmFjayBvbiB0aGlzOwo+IHNlZW1zIHRoYXQgdGhl
c2UgcGF0Y2hlcyB0ZW5kIHRvIGdvIHN0YWxlIGZhaXJseSBxdWlja2x5IGFzIGYyZnMKPiBldm9s
dmVzLiA6KQoKVGhhbmsgeW91IHNvIG11Y2ggZm9yIHRoZSB3b3JrISBMZXQgbWUgcXVldWUgdGhp
cyBzZXJpZXMgaW50byBkZXYtdGVzdCBmb3IKdGVzdHMuIElmIEkgZmluZCBhbnkgaXNzdWUsIGxl
dCBtZSBwaW5nIHRvIHRoZSB0aHJlYWQuIFNvLCB5b3UgZG9uJ3QgbmVlZAp0byB3b3JyeSBhYm91
dCByZWJhc2luZyBpdC4gOikKClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IC1FcmljCj4gCj4gT24g
NC8yMy8yNSAxMjowOCBQTSwgRXJpYyBTYW5kZWVuIHdyb3RlOgo+ID4gVjM6Cj4gPiAtIFJlYmFz
ZSBvbnRvIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qYWVn
ZXVrL2YyZnMuZ2l0Cj4gPiAgIGRldiBicmFuY2gKPiA+IC0gRml4IHVwIHNvbWUgMGRheSByb2Jv
dCB3YXJuaW5ncwo+ID4gCj4gPiBUaGlzIGlzIGEgZm9yd2FyZC1wb3J0IG9mIEhvbmdibydzIG9y
aWdpbmFsIGYyZnMgbW91bnQgQVBJIGNvbnZlcnNpb24sCj4gPiBwb3N0ZWQgbGFzdCBBdWd1c3Qg
YXQgCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQwODE0
MDIzOTEyLjM5NTkyOTktMS1saWhvbmdibzIyQGh1YXdlaS5jb20vCj4gPiAKPiA+IEkgaGFkIGJl
ZW4gdHJ5aW5nIHRvIGFwcHJvYWNoIHRoaXMgd2l0aCBhIGxpdHRsZSBsZXNzIGNvbXBsZXhpdHks
Cj4gPiBidXQgaW4gdGhlIGVuZCBJIHJlYWxpemVkIHRoYXQgSG9uZ2JvJ3MgYXBwcm9hY2ggKHdo
aWNoIGZvbGxvd3MKPiA+IHRoZSBleHQ0IGFwcHJvYWNoKSB3YXMgYSBnb29kIG9uZSwgYW5kIEkg
d2FzIG5vdCBtYWtpbmcgYW55IHByb2dyc3MKPiA+IG15c2VsZi4g8J+YiQo+ID4gCj4gPiBJbiBh
ZGRpdGlvbiB0byB0aGUgZm9yd2FyZC1wb3J0LCBJIGhhdmUgYWxzbyBmaXhlZCBhIGNvdXBsZSBi
dWdzIEkgZm91bmQKPiA+IGR1cmluZyB0ZXN0aW5nLCBhbmQgc29tZSBpbXByb3ZlbWVudHMgLyBz
dHlsZSBjaG9pY2VzIGFzIHdlbGwuIEhvbmdibyBhbmQKPiA+IEkgaGF2ZSBkaXNjdXNzZWQgbW9z
dCBvZiB0aGlzIG9mZi1saXN0IGFscmVhZHksIHNvIEknbSBwcmVzZW50aW5nIHRoZQo+ID4gbmV0
IHJlc3VsdCBoZXJlLgo+ID4gCj4gPiBUaGlzIGRvZXMgcGFzcyBteSB0eXBpY2FsIHRlc3Rpbmcg
d2hpY2ggZG9lcyBhIGxhcmdlIG51bWJlciBvZiByYW5kb20KPiA+IG1vdW50cy9yZW1vdW50cyB3
aXRoIHZhbGlkIGFuZCBpbnZhbGlkIG9wdGlvbiBzZXRzLCBvbiBmMmZzIGZpbGVzeXN0ZW0KPiA+
IGltYWdlcyB3aXRoIHZhcmlvdXMgZmVhdHVyZXMgaW4gdGhlIG9uLWRpc2sgc3VwZXJibG9jay4g
KEkgd2FzIG5vdCBhYmxlCj4gPiB0byB0ZXN0IGFsbCBvZiB0aGlzIGNvbXBsZXRlbHksIGFzIHNv
bWUgb3B0aW9ucyBvciBmZWF0dXJlcyByZXF1aXJlCj4gPiBoYXJkd2FyZSBJIGRuJ3QgaGF2ZS4p
Cj4gPiAKPiA+IFRoYW5rcywKPiA+IC1FcmljCj4gPiAKPiA+IChBIHJlY2FwIG9mIEhvbmdibydz
IG9yaWdpbmFsIGNvdmVyIGxldHRlciBpcyBiZWxvdywgZWRpdGVkIHNsaWdodGx5IGZvcgo+ID4g
dGhpcyBzZXJpZXM6KQo+ID4gCj4gPiBTaW5jZSBtYW55IGZpbGVzeXN0ZW1zIGhhdmUgZG9uZSB0
aGUgbmV3IG1vdW50IEFQSSBjb252ZXJzaW9uLAo+ID4gd2UgaW50cm9kdWNlIHRoZSBuZXcgbW91
bnQgQVBJIGNvbnZlcnNpb24gaW4gZjJmcy4KPiA+IAo+ID4gVGhlIHNlcmllcyBjYW4gYmUgYXBw
bGllZCBvbiB0b3Agb2YgdGhlIGN1cnJlbnQgbWFpbmxpbmUgdHJlZQo+ID4gYW5kIHRoZSB3b3Jr
IGlzIGJhc2VkIG9uIHRoZSBwYXRjaGVzIGZyb20gTHVrYXMgQ3plcm5lciAoaGFzCj4gPiBkb25l
IHRoaXMgaW4gZXh0NFsxXSkuIEhpcyBwYXRjaCBnaXZlIG1lIGEgbG90IG9mIGlkZWFzLgo+ID4g
Cj4gPiBIZXJlIGlzIGEgaGlnaCBsZXZlbCBkZXNjcmlwdGlvbiBvZiB0aGUgcGF0Y2hzZXQ6Cj4g
PiAKPiA+IDEuIFByZXBhcmUgdGhlIGYyZnMgbW91bnQgcGFyYW1ldGVycyByZXF1aXJlZCBieSB0
aGUgbmV3IG1vdW50Cj4gPiBBUEkgYW5kIHVzZSBpdCBmb3IgcGFyc2luZywgd2hpbGUgc3RpbGwg
dXNpbmcgdGhlIG9sZCBBUEkgdG8KPiA+IGdldCBtb3VudCBvcHRpb25zIHN0cmluZy4gU3BsaXQg
dGhlIHBhcmFtZXRlciBwYXJzaW5nIGFuZAo+ID4gdmFsaWRhdGlvbiBvZiB0aGUgcGFyc2Vfb3B0
aW9ucyBoZWxwZXIgaW50byB0d28gc2VwYXJhdGUKPiA+IGhlbHBlcnMuCj4gPiAKPiA+ICAgZjJm
czogQWRkIGZzIHBhcmFtZXRlciBzcGVjaWZpY2F0aW9ucyBmb3IgbW91bnQgb3B0aW9ucwo+ID4g
ICBmMmZzOiBtb3ZlIHRoZSBvcHRpb24gcGFyc2VyIGludG8gaGFuZGxlX21vdW50X29wdAo+ID4g
Cj4gPiAyLiBSZW1vdmUgdGhlIHVzZSBvZiBzYi9zYmkgc3RydWN0dXJlIG9mIGYyZnMgZnJvbSBh
bGwgdGhlCj4gPiBwYXJzaW5nIGNvZGUsIGJlY2F1c2Ugd2l0aCB0aGUgbmV3IG1vdW50IEFQSSB0
aGUgcGFyc2luZyBpcwo+ID4gZ29pbmcgdG8gYmUgZG9uZSBiZWZvcmUgd2UgZXZlbiBnZXQgdGhl
IHN1cGVyIGJsb2NrLiBJbiB0aGlzCj4gPiBwYXJ0LCB3ZSBpbnRyb2R1Y2UgZjJmc19mc19jb250
ZXh0IHRvIGhvbGQgdGhlIHRlbXBvcmFyeQo+ID4gb3B0aW9ucyB3aGVuIHBhcnNpbmcuIEZvciB0
aGUgc2ltcGxlIG9wdGlvbnMgY2hlY2ssIGl0IGhhcwo+ID4gdG8gYmUgZG9uZSBkdXJpbmcgcGFy
c2luZyBieSB1c2luZyBmMmZzX2ZzX2NvbnRleHQgc3RydWN0dXJlLgo+ID4gRm9yIHRoZSBjaGVj
ayB3aGljaCBuZWVkcyBzYi9zYmksIHdlIGRvIHRoaXMgZHVyaW5nIHN1cGVyCj4gPiBibG9jayBm
aWxsaW5nLgo+ID4gCj4gPiAgIGYyZnM6IEFsbG93IHNiaSB0byBiZSBOVUxMIGluIGYyZnNfcHJp
bnRrCj4gPiAgIGYyZnM6IEFkZCBmMmZzX2ZzX2NvbnRleHQgdG8gcmVjb3JkIHRoZSBtb3VudCBv
cHRpb25zCj4gPiAgIGYyZnM6IHNlcGFyYXRlIHRoZSBvcHRpb25zIHBhcnNpbmcgYW5kIG9wdGlv
bnMgY2hlY2tpbmcKPiA+IAo+ID4gMy4gU3dpdGNoIHRoZSBmMmZzIHRvIHVzZSB0aGUgbmV3IG1v
dW50IEFQSSBmb3IgbW91bnQgYW5kCj4gPiByZW1vdW50Lgo+ID4gCj4gPiAgIGYyZnM6IGludHJv
ZHVjZSBmc19jb250ZXh0X29wZXJhdGlvbiBzdHJ1Y3R1cmUKPiA+ICAgZjJmczogc3dpdGNoIHRv
IHRoZSBuZXcgbW91bnQgYXBpCj4gPiAKPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMTEwMjExMTQ1MDguMjE0MDctMS1sY3plcm5lckByZWRoYXQuY29tLwo+ID4gCj4gPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==

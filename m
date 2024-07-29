Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4218693EAB7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2024 03:47:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYFTY-0000yb-NP;
	Mon, 29 Jul 2024 01:47:01 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sYFTX-0000yT-OF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 01:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7iniOVG3gmXmMx4OmearIZzDrv6mcb+oZJZnr0nrBNk=; b=QNUktmDFCBY9ox8WqSkYIyP+ig
 a4MMAVDM75QiciLcT/gk+o/IgrGep3W/sFEJGmAWbWryy5PeEMb5oZ74LJMZ7EoJyrh2kokJrfy8/
 BRwrPHS5FS+/thwcA4ijQo+Ibv+X9aeqgTRRdjX2EQhPi6HmFa+/Xu7pXaPGryrd0n20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7iniOVG3gmXmMx4OmearIZzDrv6mcb+oZJZnr0nrBNk=; b=X980bSITuAGvnxgu6clcfCIDEa
 tdc9sAKdhtTSdlMXKAsnrg2kUlpLtwEdTjtfl/3DqQe9Fd+rUga/X1Q6RuIwdRioET38ZUoyguNDX
 tTuLW28NGEC6vIhrDqDCCOJX34jtCvTaR1zhdr3ej6Xg/aoR9KlCBFl8D/It5Shcx/bI=;
Received: from out-182.mta1.migadu.com ([95.215.58.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYFTW-0002RU-Vv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 01:47:00 +0000
Message-ID: <23862652-a702-4a5d-b804-db9ee9f6f539@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1722217607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7iniOVG3gmXmMx4OmearIZzDrv6mcb+oZJZnr0nrBNk=;
 b=Y8Up7+78RpdUjqbjHPIQbw7hf77OpaqpA9PDUsezW/ro4XhuCufC4VK4aP2RwSJRPwTwsC
 S/vrbNHe1FA73FXDSpRwZ66++fonyUl1SSO3Qm6B5fDoDpGdfIU66/JbZwbvQch5bcs38D
 +kQgibNyS71FQyvlL8ltJ5K88WOu72Y=
Date: Mon, 29 Jul 2024 09:46:17 +0800
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
 David Sterba <dsterba@suse.cz>, Arnd Bergmann <arnd@arndb.de>
References: <ZqJjsg3s7H5cTWlT@infradead.org>
 <61beb54b-399b-442d-bfdb-bad23cefa586@app.fastmail.com>
 <ZqJwa2-SsIf0aA_l@infradead.org>
 <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
 <ZqKreStOD-eRkKZU@infradead.org>
 <91bfea9b-ad7e-4f35-a2c1-8cd41499b0c0@linux.dev>
 <ZqOs84hdYkSV_YWd@infradead.org> <20240726152237.GH17473@twin.jikos.cz>
 <20240726175800.GC131596@mit.edu> <ZqPmPufwqbGOTyGI@infradead.org>
 <20240727145232.GA377174@mit.edu>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
In-Reply-To: <20240727145232.GA377174@mit.edu>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 27/07/2024 22:52, Theodore Ts'o wrote: > On Fri, Jul 26, 
 2024 at 11:09:02AM -0700, Christoph Hellwig wrote: >> On Fri, Jul 26, 2024
 at 01:58:00PM -0400, Theodore Ts'o wrote: >>> Yeah, that's my rea [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.182 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.182 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sYFTW-0002RU-Vv
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 Youling Tang <tangyouling@kylinos.cn>, linux-f2fs-devel@lists.sourceforge.net,
 kreijack@inwind.it, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjcvMDcvMjAyNCAyMjo1MiwgVGhlb2RvcmUgVHMnbyB3cm90ZToKPiBPbiBGcmksIEp1bCAy
NiwgMjAyNCBhdCAxMTowOTowMkFNIC0wNzAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4g
T24gRnJpLCBKdWwgMjYsIDIwMjQgYXQgMDE6NTg6MDBQTSAtMDQwMCwgVGhlb2RvcmUgVHMnbyB3
cm90ZToKPj4+IFllYWgsIHRoYXQncyBteSByZWFjdGlvbiBhcyB3ZWxsLiAgVGhpcyBvbmx5IHNh
dmVzIDUwIGxpbmVzIG9mIGNvZGUgaW4KPj4+IGV4dDQsIGFuZCB0aGF0IGluY2x1ZGVzIHVucmVs
YXRlZCBjaGFuZ2VzIHN1Y2ggYXMgZ2V0dGluZyByaWQgb2YgImludAo+Pj4gaSIgYW5kIHB1dHRp
bmcgdGhlIGRlY2xhcmF0aW9uIGludG8gdGhlIGZvciBsb29wIC0tLSAiZm9yIChpbnQgaSA9Cj4+
PiAuLi4iKS4gIFN1cmUsIHRoYXQgc2F2ZXMgdHdvIGxpbmVzIG9mIGNvZGUsIGJ1dCB5YXk/Cj4+
Pgo+Pj4gSWYgdGhlIG9yZGVyaW5nIGhvdyB0aGUgZnVuY3Rpb25zIGdldHMgY2FsbGVkIGlzIGJh
c2VkIG9uIHRoZSBtYWdpYwo+Pj4gb3JkZXJpbmcgaW4gdGhlIE1ha2VmaWxlLCBJJ20gbm90IHN1
cmUgdGhpcyBhY3R1YWxseSBtYWtlcyB0aGUgY29kZQo+Pj4gY2xlYXJlciwgbW9yZSByb2J1c3Qs
IGFuZCBlYXNpZXIgdG8gbWFpbnRhaW4gZm9yIHRoZSBsb25nIHRlcm0uCj4+IFNvIHlvdSB0d28g
b2JqZWN0IHRvIGtlcm5lbCBpbml0Y2FsbHMgZm9yIHRoZSBzYW1lIHJlYXNvbiBhbmQgd291bGQK
Pj4gcmF0aGVyIGdvIGJhY2sgdG8gY2FsbGluZyBldmVyeXRoaW5nIGV4cGxpY2l0bHk/Cj4gSSBk
b24ndCBvamVjdCB0byBrZXJuZWwgaW5pdGNhbGxzIHdoaWNoIGRvbid0IGhhdmUgYW55Cj4gaW50
ZXJkZXBlbmRlbmNpZXMgYW5kIHdoZXJlIG9yZGVyaW5nIGRvZXNuJ3QgbWF0dGVyLgoxLiBQcmV2
aW91cyB2ZXJzaW9uIGltcGxlbWVudGF0aW9uOiBhcnJheSBtb2RlIChzZWUgbGluayAxKSA6CiDC
oMKgIEFkdmFudGFnZXM6CiDCoMKgIC0gRmV3IGNoYW5nZXMsIHNpbXBsZSBwcmluY2lwbGUsIGVh
c3kgdG8gdW5kZXJzdGFuZCBjb2RlLgogwqDCoCBEaXNhZHZhbnRhZ2VzOgogwqDCoCAtIEVhY2gg
bW9kaWZpZWQgbW9kdWxlIG5lZWRzIHRvIG1haW50YWluIGFuIGFycmF5LCBtb3JlIGNvZGUuCgoy
LiBDdXJyZW50IGltcGxlbWVudGF0aW9uOiBleHBsaWNpdCBjYWxsIHN1YmluaXQgaW4gaW5pdGNh
bGwgKHNlZSBsaW5rIDIpIDoKIMKgwqAgQWR2YW50YWdlczoKIMKgwqAgLSBEaXJlY3QgdXNlIG9m
IGhlbHBlcyBtYWNyb3MsIHRoZSBzdWJpbml0IGNhbGwgc2VxdWVuY2UgaXMKIMKgwqDCoMKgIGlu
dHVpdGl2ZSwgYW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyByZWxhdGl2ZWx5IHNpbXBsZS4KIMKg
wqAgRGlzYWR2YW50YWdlczoKIMKgwqAgLSBoZWxwZXIgbWFjcm9zIG5lZWQgdG8gYmUgaW1wbGVt
ZW50ZWQgY29tcGFyZWQgdG8gYXJyYXkgbW9kZS4KCjMuIE9ubHkgb25lIG1vZHVsZV9zdWJpbml0
IHBlciBmaWxlIChub3QgaW1wbGVtZW50ZWQsIHNlZSBsaW5rIDMpIDoKIMKgwqAgQWR2YW50YWdl
OgogwqDCoCAtIE5vIG5lZWQgdG8gZGlzcGxheSB0byBjYWxsIHN1YmluaXQuCiDCoMKgIERpc2Fk
dmFudGFnZXM6CiDCoMKgIC0gTWFnaWMgb3JkZXIgYmFzZWQgb24gTWFrZWZpbGUgbWFrZXMgY29k
ZSBtb3JlIGZyYWdpbGUsCiDCoMKgIC0gTWFrZSBzdXJlIHRoYXQgZWFjaCBmaWxlIGhhcyBvbmx5
IG9uZSBtb2R1bGVfc3ViaW5pdCwKIMKgwqAgLSBJdCBpcyBub3QgaW50dWl0aXZlIHRvIGtub3cg
d2hpY2ggc3ViaW5pdHMgdGhlIG1vZHVsZSBuZWVkcwogwqDCoMKgwqAgYW5kIGluIHdoYXQgb3Jk
ZXIgKGdyZXAgYW5kIE1ha2VmaWxlIGFyZSByZXF1aXJlZCksCiDCoMKgIC0gV2l0aCBtdWx0aXBs
ZSBzdWJpbml0cyBwZXIgbW9kdWxlLCBpdCB3b3VsZCBiZSBkaWZmaWN1bHQgdG8KIMKgwqDCoMKg
IGRlZmluZSBtb2R1bGVfe3N1YmluaXQsIHN1YmV4aXR9IGJ5IE1PRFVMRSwgYW5kIGRpZmZpY3Vs
dCB0bwogwqDCoMKgwqAgcm9sbGJhY2sgd2hlbiBpbml0aWFsaXphdGlvbiBmYWlscyAoSSBoYXZl
bid0IGZvdW5kIGEgZ29vZCB3YXkKIMKgwqDCoMKgIHRvIGRvIHRoaXMgeWV0KS4KCgpQZXJzb25h
bGx5LCBJIHByZWZlciB0aGUgaW1wbGVtZW50YXRpb24gb2YgbWV0aG9kIHR3by4KCkxpbmtzOgpb
MV06IApodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA3MTEwNzQ4NTkuMzY2MDg4LTQt
eW91bGluZy50YW5nQGxpbnV4LmRldi8KWzJdOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjQwNzIzMDgzMjM5LjQxNTMzLTIteW91bGluZy50YW5nQGxpbnV4LmRldi8KWzNdOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvWnFLcmVTdE9ELWVSa0taVUBpbmZyYWRlYWQub3JnLwoK
VGhhbmtzLApZb3VsaW5nLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

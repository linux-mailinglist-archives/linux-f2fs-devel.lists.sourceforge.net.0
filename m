Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A14AAD25B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 02:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3ZRLa5IOZU5pU9C3x3iokCUwuTp/BxVAexg7wfPcmU=; b=HfhjRFH5lUC67HMnWLDEyBX4pn
	b/ipntrn36upR6AsOoKJ7iU2e9FvkaTTJxN9es63SN4nSLE/dSrFaq0Cqm6tTqQ4LyV2YaMu/gbjl
	r9ud741jYHOILwLxsR/UZlFDQpO2M1gKMzNojoESgyREjivd7AnAdKOGwgGJJg3r1t88=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCSlW-0005ZK-QX;
	Wed, 07 May 2025 00:36:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uCSlV-0005Z7-Ix
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 00:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c707a4auroeUqrXQkMfSvD1xEEet2NBg5CFS8dcQsR4=; b=Ix9XUCaVL5oU+FdBpFjH4EZAdq
 IEXRkaNHTyEJ/ITdqC1t+DrQ/2KVtfo4jtr8KGP/m30ib1ZS9DyFXQ2FIOa6+DoFZcbqhdWH6IJaz
 fMsvYWZyHMOH5n3hrI+uytj7Ws9ssNxtpsHRQ629t4zsfnvdSpAu5iHNkPERtQAzvbGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c707a4auroeUqrXQkMfSvD1xEEet2NBg5CFS8dcQsR4=; b=P1ZwN4467OjZvK0hVb1RQDgRr3
 POw1AnsXW7r+48Z1Jt3lvr8AY+81XSXBDtkH//9TvtIxjhVgzlOpfvPyUfXQ+ezh0mDSSvp8b92Md
 N6k1rdjWybCNe2FpvWG8olin/5M8X/mXicMSGCHqDsINHj8ur4ZPXTxAiZ5irDotE0Xg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCSlF-0002VX-LQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 00:36:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 375E74A4F2;
 Wed,  7 May 2025 00:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB45C4CEE4;
 Wed,  7 May 2025 00:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746578135;
 bh=9uDEMjzBMdRLNFtPdLcRRxHMd6lhIfTxWyvWPXxaVvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hki2Y1njW4O9HdN+R2d0DfkuueRvY2Og9sudjs/k+uJcKpaOIjQwb8bAX0zLdmjwv
 B3DBMNf/b56yYRpqw6bDR6d7hZ74vydigct02P31qljRQm6GgXer3OEWnxf/YNh5fh
 iHttPaS4DMTsbQR9kIYC02mvZLaEgL54htIzwLicBMg4FQBYu6BcScnvqbogljDGbh
 mUly3C2fxLOmmhDXXFfc8ADNBxfsSlF+xOwPgqUKas7rzdr1WR8GcTKBZ0k2Q6vAfK
 RJIdjV4Q3Zm0E9jhfD5AF+11ylHsFzeFtFFIVgCDXOFW8QWgMC9Mhqz9/7624eq+Qw
 3Sca3jNKU8bPA==
Date: Wed, 7 May 2025 00:35:33 +0000
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <aBqq1fQd1YcMAJL6@google.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250423170926.76007-1-sandeen@redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hmm, I had to drop the series at the moment, since it seems
 needing more work to deal with default_options(), which breaks my device
 setup. For example, set_opt(sbi, READ_EXTENT_CACHE) in default_opti [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCSlF-0002VX-LQ
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

SG1tLCBJIGhhZCB0byBkcm9wIHRoZSBzZXJpZXMgYXQgdGhlIG1vbWVudCwgc2luY2UgaXQgc2Vl
bXMgbmVlZGluZyBtb3JlCndvcmsgdG8gZGVhbCB3aXRoIGRlZmF1bHRfb3B0aW9ucygpLCB3aGlj
aCBicmVha3MgbXkgZGV2aWNlIHNldHVwLgpGb3IgZXhhbXBsZSwgc2V0X29wdChzYmksIFJFQURf
RVhURU5UX0NBQ0hFKSBpbiBkZWZhdWx0X29wdGlvbnMgaXMgbm90IHByb3BhZ2F0aW5nCnRvIHRo
ZSBiZWxvdyBsb2dpY3MuIEluIHRoaXMgY2FzZSwgZG8gd2UgbmVlZCBjdHhfc2V0X29wdCgpIGlm
IHVzZXIgZG9lc24ndCBzZXQ/CgpPbiAwNC8yMywgRXJpYyBTYW5kZWVuIHdyb3RlOgo+IFYzOgo+
IC0gUmViYXNlIG9udG8gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2phZWdldWsvZjJmcy5naXQKPiAgIGRldiBicmFuY2gKPiAtIEZpeCB1cCBzb21lIDBkYXkg
cm9ib3Qgd2FybmluZ3MKPiAKPiBUaGlzIGlzIGEgZm9yd2FyZC1wb3J0IG9mIEhvbmdibydzIG9y
aWdpbmFsIGYyZnMgbW91bnQgQVBJIGNvbnZlcnNpb24sCj4gcG9zdGVkIGxhc3QgQXVndXN0IGF0
IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNDA4MTQwMjM5
MTIuMzk1OTI5OS0xLWxpaG9uZ2JvMjJAaHVhd2VpLmNvbS8KPiAKPiBJIGhhZCBiZWVuIHRyeWlu
ZyB0byBhcHByb2FjaCB0aGlzIHdpdGggYSBsaXR0bGUgbGVzcyBjb21wbGV4aXR5LAo+IGJ1dCBp
biB0aGUgZW5kIEkgcmVhbGl6ZWQgdGhhdCBIb25nYm8ncyBhcHByb2FjaCAod2hpY2ggZm9sbG93
cwo+IHRoZSBleHQ0IGFwcHJvYWNoKSB3YXMgYSBnb29kIG9uZSwgYW5kIEkgd2FzIG5vdCBtYWtp
bmcgYW55IHByb2dyc3MKPiBteXNlbGYuIPCfmIkKPiAKPiBJbiBhZGRpdGlvbiB0byB0aGUgZm9y
d2FyZC1wb3J0LCBJIGhhdmUgYWxzbyBmaXhlZCBhIGNvdXBsZSBidWdzIEkgZm91bmQKPiBkdXJp
bmcgdGVzdGluZywgYW5kIHNvbWUgaW1wcm92ZW1lbnRzIC8gc3R5bGUgY2hvaWNlcyBhcyB3ZWxs
LiBIb25nYm8gYW5kCj4gSSBoYXZlIGRpc2N1c3NlZCBtb3N0IG9mIHRoaXMgb2ZmLWxpc3QgYWxy
ZWFkeSwgc28gSSdtIHByZXNlbnRpbmcgdGhlCj4gbmV0IHJlc3VsdCBoZXJlLgo+IAo+IFRoaXMg
ZG9lcyBwYXNzIG15IHR5cGljYWwgdGVzdGluZyB3aGljaCBkb2VzIGEgbGFyZ2UgbnVtYmVyIG9m
IHJhbmRvbQo+IG1vdW50cy9yZW1vdW50cyB3aXRoIHZhbGlkIGFuZCBpbnZhbGlkIG9wdGlvbiBz
ZXRzLCBvbiBmMmZzIGZpbGVzeXN0ZW0KPiBpbWFnZXMgd2l0aCB2YXJpb3VzIGZlYXR1cmVzIGlu
IHRoZSBvbi1kaXNrIHN1cGVyYmxvY2suIChJIHdhcyBub3QgYWJsZQo+IHRvIHRlc3QgYWxsIG9m
IHRoaXMgY29tcGxldGVseSwgYXMgc29tZSBvcHRpb25zIG9yIGZlYXR1cmVzIHJlcXVpcmUKPiBo
YXJkd2FyZSBJIGRuJ3QgaGF2ZS4pCj4gCj4gVGhhbmtzLAo+IC1FcmljCj4gCj4gKEEgcmVjYXAg
b2YgSG9uZ2JvJ3Mgb3JpZ2luYWwgY292ZXIgbGV0dGVyIGlzIGJlbG93LCBlZGl0ZWQgc2xpZ2h0
bHkgZm9yCj4gdGhpcyBzZXJpZXM6KQo+IAo+IFNpbmNlIG1hbnkgZmlsZXN5c3RlbXMgaGF2ZSBk
b25lIHRoZSBuZXcgbW91bnQgQVBJIGNvbnZlcnNpb24sCj4gd2UgaW50cm9kdWNlIHRoZSBuZXcg
bW91bnQgQVBJIGNvbnZlcnNpb24gaW4gZjJmcy4KPiAKPiBUaGUgc2VyaWVzIGNhbiBiZSBhcHBs
aWVkIG9uIHRvcCBvZiB0aGUgY3VycmVudCBtYWlubGluZSB0cmVlCj4gYW5kIHRoZSB3b3JrIGlz
IGJhc2VkIG9uIHRoZSBwYXRjaGVzIGZyb20gTHVrYXMgQ3plcm5lciAoaGFzCj4gZG9uZSB0aGlz
IGluIGV4dDRbMV0pLiBIaXMgcGF0Y2ggZ2l2ZSBtZSBhIGxvdCBvZiBpZGVhcy4KPiAKPiBIZXJl
IGlzIGEgaGlnaCBsZXZlbCBkZXNjcmlwdGlvbiBvZiB0aGUgcGF0Y2hzZXQ6Cj4gCj4gMS4gUHJl
cGFyZSB0aGUgZjJmcyBtb3VudCBwYXJhbWV0ZXJzIHJlcXVpcmVkIGJ5IHRoZSBuZXcgbW91bnQK
PiBBUEkgYW5kIHVzZSBpdCBmb3IgcGFyc2luZywgd2hpbGUgc3RpbGwgdXNpbmcgdGhlIG9sZCBB
UEkgdG8KPiBnZXQgbW91bnQgb3B0aW9ucyBzdHJpbmcuIFNwbGl0IHRoZSBwYXJhbWV0ZXIgcGFy
c2luZyBhbmQKPiB2YWxpZGF0aW9uIG9mIHRoZSBwYXJzZV9vcHRpb25zIGhlbHBlciBpbnRvIHR3
byBzZXBhcmF0ZQo+IGhlbHBlcnMuCj4gCj4gICBmMmZzOiBBZGQgZnMgcGFyYW1ldGVyIHNwZWNp
ZmljYXRpb25zIGZvciBtb3VudCBvcHRpb25zCj4gICBmMmZzOiBtb3ZlIHRoZSBvcHRpb24gcGFy
c2VyIGludG8gaGFuZGxlX21vdW50X29wdAo+IAo+IDIuIFJlbW92ZSB0aGUgdXNlIG9mIHNiL3Ni
aSBzdHJ1Y3R1cmUgb2YgZjJmcyBmcm9tIGFsbCB0aGUKPiBwYXJzaW5nIGNvZGUsIGJlY2F1c2Ug
d2l0aCB0aGUgbmV3IG1vdW50IEFQSSB0aGUgcGFyc2luZyBpcwo+IGdvaW5nIHRvIGJlIGRvbmUg
YmVmb3JlIHdlIGV2ZW4gZ2V0IHRoZSBzdXBlciBibG9jay4gSW4gdGhpcwo+IHBhcnQsIHdlIGlu
dHJvZHVjZSBmMmZzX2ZzX2NvbnRleHQgdG8gaG9sZCB0aGUgdGVtcG9yYXJ5Cj4gb3B0aW9ucyB3
aGVuIHBhcnNpbmcuIEZvciB0aGUgc2ltcGxlIG9wdGlvbnMgY2hlY2ssIGl0IGhhcwo+IHRvIGJl
IGRvbmUgZHVyaW5nIHBhcnNpbmcgYnkgdXNpbmcgZjJmc19mc19jb250ZXh0IHN0cnVjdHVyZS4K
PiBGb3IgdGhlIGNoZWNrIHdoaWNoIG5lZWRzIHNiL3NiaSwgd2UgZG8gdGhpcyBkdXJpbmcgc3Vw
ZXIKPiBibG9jayBmaWxsaW5nLgo+IAo+ICAgZjJmczogQWxsb3cgc2JpIHRvIGJlIE5VTEwgaW4g
ZjJmc19wcmludGsKPiAgIGYyZnM6IEFkZCBmMmZzX2ZzX2NvbnRleHQgdG8gcmVjb3JkIHRoZSBt
b3VudCBvcHRpb25zCj4gICBmMmZzOiBzZXBhcmF0ZSB0aGUgb3B0aW9ucyBwYXJzaW5nIGFuZCBv
cHRpb25zIGNoZWNraW5nCj4gCj4gMy4gU3dpdGNoIHRoZSBmMmZzIHRvIHVzZSB0aGUgbmV3IG1v
dW50IEFQSSBmb3IgbW91bnQgYW5kCj4gcmVtb3VudC4KPiAKPiAgIGYyZnM6IGludHJvZHVjZSBm
c19jb250ZXh0X29wZXJhdGlvbiBzdHJ1Y3R1cmUKPiAgIGYyZnM6IHN3aXRjaCB0byB0aGUgbmV3
IG1vdW50IGFwaQo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTEwMjEx
MTQ1MDguMjE0MDctMS1sY3plcm5lckByZWRoYXQuY29tLwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

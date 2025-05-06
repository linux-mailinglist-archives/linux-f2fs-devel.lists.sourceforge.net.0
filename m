Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83682AAD209
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 02:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2f174DbTMTGyFSn39HhZEl0vjHu7xCyEITHLrII0WZs=; b=JMOuAoInKR1y/JXkGwf7lFXYwf
	UwREdISW0FaDx74N/9LtUfhw6m8bI0c1pMuHIa9xFtkirmqFMgeJvGXXBvjLz5Ogv/kPK1n/1i6+O
	zGNY1JWm6N9OBbrigcNZ94uawIh8MCtKSGD2a7hG6psKlE3KFYl0lqVgqzbzV16rhc3Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCSRo-0001fn-QO;
	Wed, 07 May 2025 00:15:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <raven@themaw.net>) id 1uCSRn-0001ff-1H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 00:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tdP7wyXAT37PnjAPgLcwNjsMbP58VmWU+fVGGjtFGTk=; b=jp3Vq7PQKsTkd+BopYRkSsJW4a
 u9D5xmGzp5yR2pL2antJPCOiLKqOgjdQalUup324d1QTzhzX+HoFEOJ5mcxQrngz41tm7ITaBmu/b
 xZuorHkqCVwuPnTm+O/zJPhniDmvYwpQsPnxL9ujVvaM75UrK1CwYA6cjpwfsr6NqFEw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tdP7wyXAT37PnjAPgLcwNjsMbP58VmWU+fVGGjtFGTk=; b=fpntW7ETbiVyU6aSOdkXhJEGXq
 Rtbp7pocMSmX0zVUK1bpwdBfHvkqk2IffM9ei1OOWUt1G8BMFfIfCdBQAkboXoR5SxPljtVpGP5KS
 Qi/EtLhJzoVCfX6vr89V6H6QH9JmI+hoSlAw2dKIfuzG1qlpx+23u1UixRn47xb81ECc=;
Received: from smtp01.aussiebb.com.au ([121.200.0.92])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCSRW-0001cj-TA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 00:15:38 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp01.aussiebb.com.au (Postfix) with ESMTP id 26BF5100ADD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 May 2025 09:56:21 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at smtp01.aussiebb.com.au
Received: from smtp01.aussiebb.com.au ([127.0.0.1])
 by localhost (smtp01.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JX-d-2CGR8b
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 May 2025 09:56:21 +1000 (AEST)
Received: by smtp01.aussiebb.com.au (Postfix, from userid 116)
 id 166F9100AC0; Wed,  7 May 2025 09:56:21 +1000 (AEST)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 smtp01.aussiebb.com.au
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=10.0 tests=ALL_TRUSTED
 autolearn=disabled version=3.4.4
Received: from [192.168.50.229] (159-196-82-144.9fc452.per.static.aussiebb.net
 [159.196.82.144])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: ian146@aussiebb.com.au)
 by smtp01.aussiebb.com.au (Postfix) with ESMTPSA id 940F3100A4F;
 Wed,  7 May 2025 09:56:19 +1000 (AEST)
Message-ID: <7d3189a7-8712-46d3-a9de-67fd489973f9@themaw.net>
Date: Wed, 7 May 2025 07:55:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
Content-Language: en-US
From: Ian Kent <raven@themaw.net>
Autocrypt: addr=raven@themaw.net; keydata=
 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
In-Reply-To: <20250423170926.76007-1-sandeen@redhat.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 24/4/25 01:08, Eric Sandeen wrote: > V3: > - Rebase onto
 git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git > dev branch
 > - Fix up some 0day robot warnings > > This is a forward-port o [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uCSRW-0001cj-TA
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjQvNC8yNSAwMTowOCwgRXJpYyBTYW5kZWVuIHdyb3RlOgo+IFYzOgo+IC0gUmViYXNlIG9u
dG8gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsv
ZjJmcy5naXQKPiAgICBkZXYgYnJhbmNoCj4gLSBGaXggdXAgc29tZSAwZGF5IHJvYm90IHdhcm5p
bmdzCj4KPiBUaGlzIGlzIGEgZm9yd2FyZC1wb3J0IG9mIEhvbmdibydzIG9yaWdpbmFsIGYyZnMg
bW91bnQgQVBJIGNvbnZlcnNpb24sCj4gcG9zdGVkIGxhc3QgQXVndXN0IGF0Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI0MDgxNDAyMzkxMi4zOTU5Mjk5LTEt
bGlob25nYm8yMkBodWF3ZWkuY29tLwo+Cj4gSSBoYWQgYmVlbiB0cnlpbmcgdG8gYXBwcm9hY2gg
dGhpcyB3aXRoIGEgbGl0dGxlIGxlc3MgY29tcGxleGl0eSwKPiBidXQgaW4gdGhlIGVuZCBJIHJl
YWxpemVkIHRoYXQgSG9uZ2JvJ3MgYXBwcm9hY2ggKHdoaWNoIGZvbGxvd3MKPiB0aGUgZXh0NCBh
cHByb2FjaCkgd2FzIGEgZ29vZCBvbmUsIGFuZCBJIHdhcyBub3QgbWFraW5nIGFueSBwcm9ncnNz
Cj4gbXlzZWxmLiDwn5iJCj4KPiBJbiBhZGRpdGlvbiB0byB0aGUgZm9yd2FyZC1wb3J0LCBJIGhh
dmUgYWxzbyBmaXhlZCBhIGNvdXBsZSBidWdzIEkgZm91bmQKPiBkdXJpbmcgdGVzdGluZywgYW5k
IHNvbWUgaW1wcm92ZW1lbnRzIC8gc3R5bGUgY2hvaWNlcyBhcyB3ZWxsLiBIb25nYm8gYW5kCj4g
SSBoYXZlIGRpc2N1c3NlZCBtb3N0IG9mIHRoaXMgb2ZmLWxpc3QgYWxyZWFkeSwgc28gSSdtIHBy
ZXNlbnRpbmcgdGhlCj4gbmV0IHJlc3VsdCBoZXJlLgo+Cj4gVGhpcyBkb2VzIHBhc3MgbXkgdHlw
aWNhbCB0ZXN0aW5nIHdoaWNoIGRvZXMgYSBsYXJnZSBudW1iZXIgb2YgcmFuZG9tCj4gbW91bnRz
L3JlbW91bnRzIHdpdGggdmFsaWQgYW5kIGludmFsaWQgb3B0aW9uIHNldHMsIG9uIGYyZnMgZmls
ZXN5c3RlbQo+IGltYWdlcyB3aXRoIHZhcmlvdXMgZmVhdHVyZXMgaW4gdGhlIG9uLWRpc2sgc3Vw
ZXJibG9jay4gKEkgd2FzIG5vdCBhYmxlCj4gdG8gdGVzdCBhbGwgb2YgdGhpcyBjb21wbGV0ZWx5
LCBhcyBzb21lIG9wdGlvbnMgb3IgZmVhdHVyZXMgcmVxdWlyZQo+IGhhcmR3YXJlIEkgZG4ndCBo
YXZlLikKPgo+IFRoYW5rcywKPiAtRXJpYwo+Cj4gKEEgcmVjYXAgb2YgSG9uZ2JvJ3Mgb3JpZ2lu
YWwgY292ZXIgbGV0dGVyIGlzIGJlbG93LCBlZGl0ZWQgc2xpZ2h0bHkgZm9yCj4gdGhpcyBzZXJp
ZXM6KQo+Cj4gU2luY2UgbWFueSBmaWxlc3lzdGVtcyBoYXZlIGRvbmUgdGhlIG5ldyBtb3VudCBB
UEkgY29udmVyc2lvbiwKPiB3ZSBpbnRyb2R1Y2UgdGhlIG5ldyBtb3VudCBBUEkgY29udmVyc2lv
biBpbiBmMmZzLgo+Cj4gVGhlIHNlcmllcyBjYW4gYmUgYXBwbGllZCBvbiB0b3Agb2YgdGhlIGN1
cnJlbnQgbWFpbmxpbmUgdHJlZQo+IGFuZCB0aGUgd29yayBpcyBiYXNlZCBvbiB0aGUgcGF0Y2hl
cyBmcm9tIEx1a2FzIEN6ZXJuZXIgKGhhcwo+IGRvbmUgdGhpcyBpbiBleHQ0WzFdKS4gSGlzIHBh
dGNoIGdpdmUgbWUgYSBsb3Qgb2YgaWRlYXMuCj4KPiBIZXJlIGlzIGEgaGlnaCBsZXZlbCBkZXNj
cmlwdGlvbiBvZiB0aGUgcGF0Y2hzZXQ6Cj4KPiAxLiBQcmVwYXJlIHRoZSBmMmZzIG1vdW50IHBh
cmFtZXRlcnMgcmVxdWlyZWQgYnkgdGhlIG5ldyBtb3VudAo+IEFQSSBhbmQgdXNlIGl0IGZvciBw
YXJzaW5nLCB3aGlsZSBzdGlsbCB1c2luZyB0aGUgb2xkIEFQSSB0bwo+IGdldCBtb3VudCBvcHRp
b25zIHN0cmluZy4gU3BsaXQgdGhlIHBhcmFtZXRlciBwYXJzaW5nIGFuZAo+IHZhbGlkYXRpb24g
b2YgdGhlIHBhcnNlX29wdGlvbnMgaGVscGVyIGludG8gdHdvIHNlcGFyYXRlCj4gaGVscGVycy4K
Pgo+ICAgIGYyZnM6IEFkZCBmcyBwYXJhbWV0ZXIgc3BlY2lmaWNhdGlvbnMgZm9yIG1vdW50IG9w
dGlvbnMKPiAgICBmMmZzOiBtb3ZlIHRoZSBvcHRpb24gcGFyc2VyIGludG8gaGFuZGxlX21vdW50
X29wdAo+Cj4gMi4gUmVtb3ZlIHRoZSB1c2Ugb2Ygc2Ivc2JpIHN0cnVjdHVyZSBvZiBmMmZzIGZy
b20gYWxsIHRoZQo+IHBhcnNpbmcgY29kZSwgYmVjYXVzZSB3aXRoIHRoZSBuZXcgbW91bnQgQVBJ
IHRoZSBwYXJzaW5nIGlzCj4gZ29pbmcgdG8gYmUgZG9uZSBiZWZvcmUgd2UgZXZlbiBnZXQgdGhl
IHN1cGVyIGJsb2NrLiBJbiB0aGlzCj4gcGFydCwgd2UgaW50cm9kdWNlIGYyZnNfZnNfY29udGV4
dCB0byBob2xkIHRoZSB0ZW1wb3JhcnkKPiBvcHRpb25zIHdoZW4gcGFyc2luZy4gRm9yIHRoZSBz
aW1wbGUgb3B0aW9ucyBjaGVjaywgaXQgaGFzCj4gdG8gYmUgZG9uZSBkdXJpbmcgcGFyc2luZyBi
eSB1c2luZyBmMmZzX2ZzX2NvbnRleHQgc3RydWN0dXJlLgo+IEZvciB0aGUgY2hlY2sgd2hpY2gg
bmVlZHMgc2Ivc2JpLCB3ZSBkbyB0aGlzIGR1cmluZyBzdXBlcgo+IGJsb2NrIGZpbGxpbmcuCj4K
PiAgICBmMmZzOiBBbGxvdyBzYmkgdG8gYmUgTlVMTCBpbiBmMmZzX3ByaW50awo+ICAgIGYyZnM6
IEFkZCBmMmZzX2ZzX2NvbnRleHQgdG8gcmVjb3JkIHRoZSBtb3VudCBvcHRpb25zCj4gICAgZjJm
czogc2VwYXJhdGUgdGhlIG9wdGlvbnMgcGFyc2luZyBhbmQgb3B0aW9ucyBjaGVja2luZwo+Cj4g
My4gU3dpdGNoIHRoZSBmMmZzIHRvIHVzZSB0aGUgbmV3IG1vdW50IEFQSSBmb3IgbW91bnQgYW5k
Cj4gcmVtb3VudC4KPgo+ICAgIGYyZnM6IGludHJvZHVjZSBmc19jb250ZXh0X29wZXJhdGlvbiBz
dHJ1Y3R1cmUKPiAgICBmMmZzOiBzd2l0Y2ggdG8gdGhlIG5ldyBtb3VudCBhcGkKPgo+IFsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTEwMjExMTQ1MDguMjE0MDctMS1sY3plcm5l
ckByZWRoYXQuY29tLwo+Cj4KVGhlIG9wdGlvbiBwYXJzaW5nIGZvciBmMmZzIGlzIHF1aXRlIGNv
bXBsZXggc28gb2J2aW91c2x5IHdlIG5lZWQgSG9uZ2JvIAp0byByZXZpZXcKCnRoZXNlIGFzIHdl
bGwgKGF0IGxlYXN0KS4KCgpBcGFydCBmcm9tIHRoYXQgYWxsIHRoZSBtb3VudCBBUEkgYml0cyBJ
IGV4cGVjdCB0byBzZWUgYXJlIHByZXNlbnQgYW5kIApFcmljIG5vdGVzCgp0aGUgb3B0aW9uIHBh
cnNpbmcgY29tcGxleGl0eSBlbmRzIHVwIGJlaW5nIHVuYXZvaWRhYmxlIHNvIGl0IGxvb2tzIGdv
b2QgCnRvIG1lLgoKClJldmlld2VkLWJ5OiBJYW4gS2VudCA8cmF2ZW5AdGhlbWF3Lm5ldD4KCgpJ
YW4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK

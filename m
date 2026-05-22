Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKxcLLSNEGrEZQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 19:09:08 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 021575B7F3B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 19:09:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPZn2Ioj1kELiGPtZ4JR72obiOOY39AZI6xaPDg0/AM=; b=J+T0iTcL8DLBI//SDD9C3s5Yu2
	YlfqCPDlcifx6odcnmHRvwjtvKoMwXxaGPmK4MLMz8gfjLja6TrUqCHumMt8+ZFw/S1eF+zpQ/r8h
	9N9MH/v0ueg14MZnA4mjPx8B0c+wXCeQkGjxsxAI7inQW8a5RmKymnA/IKnda49YbrZQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQTMh-0005ks-Q8;
	Fri, 22 May 2026 17:08:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wQTMg-0005km-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 17:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c23yxkM0+/60YQOR3FKGtI6McR78Ee+YJUODTCKTIss=; b=FjmjzjyIeF0MmVPWYrt9nEack7
 sccXdzg3ouQnq7O6sgmKQvDtu6XjWejUXhZvpKA1YieJRMZm/gy3X7hT/x1FQwg12E/NdulB0YuTm
 0q+Qr/0AK9mCn9Obzx6ZVpIWdPFWmvgHD8IcgqRCZHvaZUbgLxxGObgPSKvsGjNT9hJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c23yxkM0+/60YQOR3FKGtI6McR78Ee+YJUODTCKTIss=; b=Ei/PCLOr59RahojbxCvcSecV4c
 z81ecuanBkGVy079YQXULAJ7hqooM3XQOQgTnRLhyMo+I1bn/dY7w9YOuFqeIEIrIllZZ+8yGUP/H
 UbT5L93Hf1X1qz2SfQLUCVNc7aENlCDC0/0RZfNcTBvBc1n6HcKOfvkNNVM7XuJRCyck=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQTMe-0006fr-B4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 17:08:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 73392432C6;
 Fri, 22 May 2026 17:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79BE1F000E9;
 Fri, 22 May 2026 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779469723;
 bh=c23yxkM0+/60YQOR3FKGtI6McR78Ee+YJUODTCKTIss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=OzJ6y0n+zfW4+8WQGFFIbfwbnhp6Kv+qBK9H1sgDjZOELbUwkG34A+MtzYhcyghwQ
 nrfe+NcdHemO7jYCA7aV3PfT7SaOud7n/OQycUYBIhSL7CO9++tBPbXgcl/QS+69gf
 n1cGbOPUqj2ZCfDoZbf4ImCy2xQSS3pyLRuKeOepf+0jBS3SPuTYdt2JZ1UV6wtj5o
 Em/8yk5bmWeLIV1wWHSEaNiqviQ3BwSC+MLhXk2Fs44SXHCFCatdF9dA6hgWDbxiyE
 fDpSnQbBwhWWCGTzo/yjjKcytOvjcNcAP1TEV5yc7GuI0KKFJ2ZEd+gvk++fOksqEZ
 Uzp89DIhXWvGQ==
Date: Fri, 22 May 2026 17:08:41 +0000
To: Theodore Tso <tytso@mit.edu>
Message-ID: <ahCNmWbcd_2lAJyk@google.com>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522141115.GA8258@macsyma-wired.lan>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/22, Theodore Tso wrote: > On Fri, May 22,
 2026 at 03:32:39AM +0000,
 Jaegeuk Kim wrote: > > I went this route because Android heavily restricts
 ioctl() permissions > > and we needed broader acces [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wQTMe-0006fr-B4
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: another way to set large folio by
 remembering inode number
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
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS(0.00)[m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Queue-Id: 021575B7F3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMDUvMjIsIFRoZW9kb3JlIFRzbyB3cm90ZToKPiBPbiBGcmksIE1heSAyMiwgMjAyNiBhdCAw
MzozMjozOUFNICswMDAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+IEkgd2VudCB0aGlzIHJvdXRl
IGJlY2F1c2UgQW5kcm9pZCBoZWF2aWx5IHJlc3RyaWN0cyBpb2N0bCgpIHBlcm1pc3Npb25zCj4g
PiBhbmQgd2UgbmVlZGVkIGJyb2FkZXIgYWNjZXNzIGZvciB0aGlzIHRvIHdvcmsgd2l0aGluIHRo
ZSBmcmFtZXdvcmsuIEl04oCZcwo+ID4gZGVmaW5pdGVseSBhIHByYWdtYXRpYyBjaG9pY2UganVz
dCB0byBnZXQgaXQgcnVubmluZyBpbiBwcm9kdWN0aW9uLgo+ID4gCj4gPiBJZiBpb2N0bCgpIGlz
IGEgcmlnaHQgd2F5IGZvciB1cHN0cmVhbSwgSSdtIGhhcHB5IHRvIGNoYW5nZSB0aGlzIHBhdGNo
LiBCeQo+ID4gdGhlIHdheSwgSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgYWxsIHRoZSBt
ZXNzYWdlcyBhcmUgc28gb2ZmZW5zaXZlLAo+ID4gZXZlbiB3aXRob3V0IHRyeWluZyB0byB1bmRl
cnN0YW5kIHRoZSBwcm9ibGVtIG9yIGd1aWRpbmcgcmlnaHQgZGlyZWN0aW9ucy4KPiAKPiBUaGUg
cmVhc29uIHdoeSBzb21lIHBlb3BsZSB3ZXJlIGdldHRpbmcgYW5ub3llZCB3YXMgYmVjYXVzZSBh
cyBhIExpbnV4Cj4gZmlsZSBzeXN0ZW0gbWFpbnRhaW5lciwgdGhlcmUgd2FzIGFuIGFzc3VtcHRp
b24gdGhhdCB5b3Ugd291bGQKPiB1bmRlcnN0YW5kIHRoYXQgZXh0ZW5kZWQgYXR0cmlidXRlcyAt
LS0gZXNwZWNpYWxseSBpbiB0aGUgdXNlci4qCj4gbmFtZXNwYWNlIC0tLSBoYXZlIGFuIGludGVu
ZGVkIHVzZSBjYXNlIG9mIHN0b3JpbmcgYSB1c2VyLWNob3NlbiBzbWFsbAo+IHBpZWNlIG9mIG1l
dGFkYXRhIHRoYXQgd291bGQgYmUgc3RvcmVkIGluIHRoZSBmaWxlIHN5c3RlbS4KPiAKPiBIaWph
Y2tpbmcgdXNlci5mYWR2aXNlIHN1Y2ggdGhhdCBpdCBubyBsb25nZXIgcGVyc2lzdGVudCBzdG9y
ZXMgYW4KPiBleHRlbmRlZCBhdHRyaWJ1dGUgZm9yIG9uZSBzcGVjaWZpYyBmaWxlIHN5c3RlbSAt
LS0gc3VjaCB0aGF0IGlmIGEKPiBoeXBvdGhldGljYWwgdXNlciBhcHBsaWNhdGlvbiBtaWdodCBk
ZWNpZGUgdG8gc3RvcmUgYSBwaWVjZSBvZgo+IGFwcGxpY2F0aW9uIGRhdGEgaW4gdGhlIGV4dGVu
ZGVkIGF0dHJpYnV0ZSBuYW1lZCAiZmFkdmlzZSIgd291bGQgZG8KPiBzb21ldGhpbmcgY29tcGxl
dGVseSBkaWZmZXJlbnQgb24gYSBzaW5nbGUgbWFpbmxpbmUgZmlsZSBzeXN0ZW0gaXMgaW4KPiBz
dWNoIHBvb3IgdGFzdGUgdGhhdCBJIHdvdWxkIGhhdmUgKmhvcGVkKiB0aGF0IGFueSBMaW51eCBm
aWxlIHN5c3RlbQo+IG1haW50YWluZXIgd291bGQga25vdyB0aGF0IHRoaXMgYSBSZWFsbHkgQmFk
IFRoaW5nLCBzdWNoIHRoYXQgaWYKPiBzb21lb25lIGluIHlvdXIgZGV2ZWxvcG1lbnQgY29tbXVu
aXR5IHN1Z2dlc3RlZCBzdWNoIGFuIGlkZWEsIHlvdQo+IHdvdWxkIHJlamVjdCBpdC4KClRoYW5r
IHlvdSBmb3IgdGhlIGV4cGxhbmF0aW9uLiBJdCBzZWVtcyBJIG1hZGUgYSB3cm9uZyBhc3N1bXB0
aW9uIG9uIHRoZQp1c2FnZSBvZiAidXNlci4iIHByZWZpeCB3aGVyZSBlYWNoIGZpbGVzeXN0ZW0g
Y2FuIHN1cHBvcnQgaW4gZGlmZmVyZW50CndheXMuCgo+IAo+IEFuZCB0aGVuLCB3aGVuIHBlb3Bs
ZSBjb21wbGFpbmVkIHRoYXQgaXQgd2FzIGEgYmFkIGlkZWEsIGFuZCB5b3UKPiBkZWNpZGVkIHRv
IHB1dCBpbiB0aGUgZjJmcyBicmFuY2gsIHN1Y2ggdGhhdCBpdCB3b3VsZCBzaG93IHVwIGluCj4g
bGludXgtbmV4dCwgYW5kIHRoZXJlIHdhcyBubyB3YXkgZm9yIG90aGVyIGZpbGUgc3lzdGVtIGRl
dmVsb3BlcnMgdG8KPiBvYmplY3QgKHNob3J0IG9mIGFwcGVhbGluZyB0byBMaW51cykgLS0tIHdl
bGwsIHRoYXQncyBiYXNpY2FsbHkgeW91Cj4gdGFraW5nIGFkdmFudGFnZSBvZiB5b3VyIGZpbGUg
c3lzdGVtIG1haW50YWluZXIgcHJpdmlsZWdlcy4gIEFuZCB0aGlzCj4gaXMgd2h5IEkgc3RhcnRl
ZCBwcm9wb3Npbmcgd2hldGhlciB3ZSBuZWVkZWQgdG8gYXBwZWFsIHRoaXMgdG8gTGludXMKPiBz
byBoZSBjb3VsZCBtYWtlIHRoZSBjYWxsIHRvIHJlamVjdCBzb21ldGhpbmcgdGhhdCB0aGUgY29t
bXVuaXR5IGhhZAo+IGFscmVhZHkgdG9sZCB5b3Ugd2FzIGluIHRlcnJpYmxlLCB0ZXJyaWJsZSB0
YXN0ZS4KClRvIGJlIGZhaXIsIEkgaGFkbid0IHF1ZXVlZCBpdCBpbiBsaW51eC1uZXh0IGZvciB3
ZWVrcyBzaW5jZSB0aGUgZmlyc3QKcG9zdCwgYW5kIHdhcyB3YWl0aW5nIGZvciBtb3JlIGZlZWRi
YWNrcy4gSWYgSSB3YXMgYWJsZSB0byBoZWFyICJ1c2VyLiIKaXMgYSBnZW5lcmljIHByZWZpeCB1
c2VkIGZvciBhbGwgZmlsZXN5c3RlbXMgYW5kIHVzZSBpb2N0bCBmcm9tIHRoZSBiZWdpbm5pbmcs
CkknZCBqdXN0IGRyb3AgYW5kIGJlIGFibGUgdG8gc3RhcnQgYXJndWluZyB3aXRoIHNlY3VyaXR5
IGZvbGtzIGJhY2suIFNpbmNlCm15IGVtcGxveWVyIGlzIGZ1bmRpbmcgZm9yIHByb2R1Y3Rpb24g
bWFpbmx5LCBub3QgbXVjaCB1cHN0cmVhbSB3b3JrLCBJCmNvdWxkbid0IHNpdCBhbmQgd2FpdCBm
b3IgdGhlIHJlc3BvbnNlIGZvciBtb250aHMuIDooCgo+IAo+IEFzIGZhciBhcyB0cnlpbmcgdG8g
dW5kZXJzdGFuZCB3aHkgeW91IHdlcmUgZG9pbmcgdGhpcyAtLS0gSSBoYXZlIHRvCj4gdHVybiB0
aGF0IHF1ZXN0aW9uIGFyb3VuZC4gIFdoeSBkaWRuJ3QgKnlvdSogZXhwbGFpbiB3aHkgeW91IG5l
ZWRlZCB0bwo+IGRvIHRoaXMgdGhpbmc/ICBJIHdlbnQgdGhyb3VnaCB0aGUgZS1tYWlsIGhpc3Rv
cnksIGFuZCBJIGNvdWxkbid0IGZpbmQKPiBhbiBleHBsYW5hdGlvbiBvZiB3aHkgeW91IGRlY2lk
ZWQgdG8gZG8gdGhpcyB0aGluZy4gIAoKSSBzaGFyZWQgc29tZSBtb3RpdmF0aW9uIHdoZW4gcmVw
bHlpbmcgdG8gRGFycmljaydzIGZlZWRiYWNrIFsxXSwgYnV0IHllcywKaXQgd2FzIG5vdCBlbm91
Z2ggZm9yIGFsbCBoZWFkcy11cC4gVGhlIHByb2JsZW0gc3RhcnRlZCB0aGF0IHNvbWUgc3BlaWNp
ZmljCmFwcGxpY2F0aW9uIG5lZWRzIGFzIG1hbnkgaGlnaC1vcmRlciBwYWdlcyBhcyBwb3NzaWJs
ZSBtb3N0bHkgZm9yIHJlYWRzLiBTbywKSSB0aG91Z2h0IHdlIGNhbiB0dXJuIG9uIGxhcmdlIGZv
bGlvIG9uIHRoZSBzcGVjaWZpYyBmaWxlcyBwZXIgaGludHMuIE9uZSB3YXkKZm9yIHRoZSBoaW50
cyB3YXMgdXNpbmcgaW1tdXRhYmxlIGJpdCwgYnV0IGl0IHR1cm5lZCBvdXQgaXQncyB2ZXJ5IGhh
cmQgdG8KbWFuYWdlIGRpc2FibGluZyB0aGUgYml0IHdoZW5ldmVyIGRlbGV0aW5nIHRoZSBmaWxl
cy4gQWxvbmcgd2l0aCBsaW1pdGVkCmlvY3RsKCkgYW5kIHJlcXVpcmluZyBpbm9kZSBldmljdGlv
biB0byBtYW5hZ2UgbGFyZ2UgZm9saW8gYWN0aXZhdGlvbiwgSSBoYWQKdG8gaW1wbGVtZW50IHRo
aXMgcGF0aC4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2FlQTVDOGJ5SXBYV2xh
N2ZAZ29vZ2xlLmNvbS8KCj4gCj4gUGVyaGFwcyB3ZSBuZWVkIHRvIGFkZCBhbiBleHBsYW5hdGlv
biB0aGUgRG9jdW1lbnRhdGlvbiBkaXJlY3RvcnkKPiBleHBsYWluaW5nIHdoYXQgdGhlIGludGVu
ZGVkIHVzZSBvZiB0aGUgZXh0ZW5kZWQgYXR0cmlidXRlIGNhc2UsIGFuZAo+IHBlcmhhcHMgcmVm
ZXJlbmNpbmcgcGFzdCBjYXNlcyB3ZXJlIHBlb3BsZSB0cmllZCB0byB1c2UgdGhpcyB0byBieXBh
c3MKPiB0aGUgbGludXgtYXBpIHJldmlldyBwcm9jZXNzIChmMmZzJ3MgdXNlci5mYWR2aXNlIGlz
IG5vdCB0aGUgZmlyc3QKPiB0aW1lIHNvbWVvbmUgaGFzIHRyaWVkIHRvIGRvIHRoaXMpIHRoaW5n
KSwgc28gdGhhdCBhdXRvbWF0ZWQgcmV2aWV3Cj4gYm90cyBsaWtlIFNhc2hpa28gY2FuIGV4cGxh
aW4gd2h5IGl0J3MgaW4gc3VjaCB0ZXJyaWJsZSB0YXN0ZSB0byBwYXRjaAo+IGF1dGhvcnMsIHBl
cmhhcHMgd2UgbmVlZCB0byBkbyB0aGlzLiAgVXAgdW50aWwgbm93LCBJIHRoaW5rIHRoZQo+IGFz
c3VtcHRpb24gaXMgdGhhdCBmaWxlIHN5c3RlbSBtYWludGFpbmVycyB3b3VsZCBrbm93IHNvbWV0
aGluZyB0aGlzCj4gc2VsZi1ldmlkZW50LCBhbmQgaWYgbm90LCBpZiBpdCB3YXMgcG9pbnRlZCBv
dXQsIHRoZXkgd291bGRuJ3QgdHJ5IHRvCj4gZm9yY2Ugc3VjaCBhbiBpbGwtYWR2aXNlZCBpbnRl
cmZhY2UgdG8gTGludXMuCgpJIGJlbGlldmUgdGhpcyBoZWxwcyBhIGxvdCB0byBhbGwgbmV3Ymll
cyBsaWtlIG1lLgoKSSByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIGZlZWRiYWNrLgoKPiAKPiAJCQkJ
CQktIFRlZAo+IAo+IFAuUy4gIEFzIGFuIGV4bWFwbGUgb2YgaG93IEkgaGFubGRlZCBhIHNvbWV3
aGF0IHNpbWlsYXIgc2NlbmFyaW8gaW4KPiB0aGUgcGFzdCwgbXkgZW1wbG95ZXIncyBjbHVzdGVy
IGZpbGUgc3lzdGVtIG5lZWRlZAo+IEZBTExPQ19GTF9OT19ISURFX1NUQUxFIHRvIHNhdmUgJCQk
JCBpbiBUQ08gc3RvcmFnZSBjb3N0cy4gIEJ1dCB0aGUKPiBjb25jZXJuIHdhcyB0aGlzIHdvdWxk
IGJlIGFuIGF0dHJhY3RpdmUgbnVpc2FuY2UgZm9yIGVudGVycHJpc2UgZGlzdHJvCj4gdXNlcnMs
IHdobyB3b3VsZCBzZWUgdGhlIG1hc3NpdmUgcGVyZm9ybWFuY2UgaW5jcmVhc2UsIG5vdCByZWFs
aXplCj4gdGhhdCB0aGlzIHdvdWxkIGxlYWsgc3RhbGUgZGF0YSwgd2hpY2ggY291bGQgcmVzdWx0
IGluIHVzZXIgUElJIGJlaW5nCj4gZXhwb3NlZCwgdGh1cyBtYWtpbmcgbGlmZSBoYXJkIGZvciBF
bnRlcnByaXNlIExpbnV4J3MgcmVwdXRhdGlvbi4KPiAoVGhpcyB3YXNuJ3QgYW4gaXNzdWUgYXQg
JFdPUksgYmVjYXVzZSB3ZSBlbnJ5cHQgYWxsIGRhdGEgYXQgcmVzdCwgYW5kCj4gdGhlIGNsdXN0
ZXIgZmlsZSBzeXN0ZW0gZGFlbW9uIHdhcyBhIHByaXZpbGVnZWQgc2VydmVyIHdobyAoYSkga25l
dwo+IHdoYXQgaXQgd2FzIGRvaW5nLCBhbmQgKGIpIG9ubHkgaXQgd291bGQgaGF2ZSBhY2Nlc3Mg
dG8gc2V0Cj4gRkFMTE9DX0ZMX05PX0hJREVfU1RBTEUuKQo+IAo+IEkgZGlzY2xvc2VkICp3aHkq
ICRXT1JLIG5lZWRlZCBzdWNoIGEgdGhpbmcgKGl0IG1hZGUgYSBodWdlIGRpZmZlcmVuY2UKPiB0
byBzdG9yYWdlIFRDTyBjb3N0c3MgZm9yIEdvb2dsZSdzIENsdXN0ZXIgRmlsZXN5c3RlbSksIGFu
ZCBhZnRlcgo+IGRpc2N1c3Npb24gYW5kIG5lZ290aWF0aW9uLCB3ZSBjYW1lIHRvIGEgY29tcHJv
bWlzZSB3aGljaCBpbnZvbHZlZCBteQo+IGtlZXBpbmcgdGhlICh2ZXJ5IHNtYWxsKSBwYXRjaCBv
dXQgb2YgdHJlZSwgYnV0IHJlc2VydmluZyB0aGUgY29kZQo+IHBvaW50IHVwc3RyZWFtIHRvIGF2
b2lkIGZ1dHVyZSBiaXRmaWVsZCBjb2xsaXNpb25zLiAgVGhleSBrZXkgaGVyZSB3YXMKPiB0aGF0
IEkgKmtuZXcqIGl0IHdhcyBjb250cm92ZXJzaWFsLCBhbmQgSSB1bmRlcnN0b29kIHdoYXQgcHJv
YmxlbXMgaXQKPiBtaWdodCBjYXVzZSBpbiB0aGUgcmVzdCBvZiB0aGUgZWNvc3lzdGVtLiAgVGhh
dCdzIHBhcnQgb2YgdGhlIGpvYiBvZiBhCj4gbWFpbnRhaW5lciwgYW5kIGl0J3MgYWxzbyB3aHkg
YSBjb21wYW55IG1pZ2h0IHdhbnQgdG8gaGlyZSBhCj4gbWFpbnRhaW5lci4gIFRoZXkgY2FuIHJl
cHJlc2VudCB0aGUgbmVlZHMgb2YgbXVsdGlwbGUgc3Rha2Vob2xkZXJzIC0tLQo+IHRoZSB1cHN0
cmVhbSBjb21tdW5pdHksIHVwc3RyZWFtIHVzZXJzIGFuZCB0aGUgZ3JlYXRlciBMaW51eAo+IGVj
b3N5c3RlbSwgYXMgd2VsbCBhcyB0aGVpciBlbXBsb3llci4KPiAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=

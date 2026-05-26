Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G9cHFfzFGrnRgcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 03:11:51 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3785CF667
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 03:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2KattetibRMhUKiy5bHFY1lJ1uIlo3BUPAvTkoQ3Es=; b=aiwZ9bTp48MTIK8RZu8XvpNaAD
	sEMD5CME0edybGyeteuARkmd57YXI/tCnX+B8Ke48jsBprzCJ+D/ZC1YqXtUeZKBvzrSMnmekWsl4
	0/mZIpamxBGHyqQbZyMoLf2qv/nZzymLh/QJf5fyJbjGwuTX80to6ZKpupMMJ67mCnlU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRgKU-0004jO-Db;
	Tue, 26 May 2026 01:11:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wRgK0-0004hN-8o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 01:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8KtudcOxSvos7Bvf3DlHhV6S99t3w2rpbU5P7FcY4Jw=; b=HCX/fvheMmm/Idyw+3pJi7c621
 +C1v7uIrwETIDeqYtg9vkefdhteVPIKcz97NLt50pQ/+MNS1M1cyn/9z5T9R1VVx5ZjSoRfVxKE74
 SvcfL7CttKD44Bp4tnkp6J+K5H9goWeK3/zrLf3RR+tWbHknjNXJo8T3jjM88EFEpJy4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8KtudcOxSvos7Bvf3DlHhV6S99t3w2rpbU5P7FcY4Jw=; b=LOvMYAL/tZlNoILs4j7Obgss0e
 1yAMEIMCoPnG+f5QqOyMfbv4qhmTZhrMcRGu/23fxRT3dVowJJYp0eTjHCsRgVlEt9y/RlEbuQanX
 2i7CmiOcWoUAFt5qBl0j4M2FtGgDrke1JZGvYAXumq5nK2GtbiEDv6bCpKaNyENZ5Z+0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wRgJz-0006R9-9T for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 01:11:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C6E860018;
 Tue, 26 May 2026 01:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419911F000E9;
 Tue, 26 May 2026 01:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779757857;
 bh=8KtudcOxSvos7Bvf3DlHhV6S99t3w2rpbU5P7FcY4Jw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Enn6fEbcSDYSLXXU9tuWmlYyKtLN+m2e8UwpPc1rsxAkE97pNhQWlXAlduixrrUvG
 3ZC+aOj9ajbuiWwQCPTKTYKGniF3t9Ave/L2cdwzGXNAGPNpdD9OuUTjXfbFF9lTKv
 g37n63c+EP4zjliQGNiT3PRs6vQCBQ8ZR4SHrEgM3L4SPqOwqqUZEU7SVdV/gs8lgw
 bE9hlCwY1arV6U2meLFVbJfTJ2d4rnP/iSWG0X+KiBKesXuisLqvA+kO4I24PKTDaz
 eGSh4pdemHuXq0YDzI24c5MWF/tl6dUHgpSvJwhk7riCVLSAQiN73YrX/1JQFmbdhN
 9FrMkNaCjY2GA==
Date: Tue, 26 May 2026 01:10:55 +0000
To: Theodore Tso <tytso@mit.edu>
Message-ID: <ahTzHyHBL8t0iNBR@google.com>
References: <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com>
 <20260522224108.GA18663@macsyma-wired.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522224108.GA18663@macsyma-wired.lan>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/22, Theodore Tso wrote: > On Fri, May 22,
 2026 at 05:08:41PM
 +0000, Jaegeuk Kim wrote: > > > > Thank you for the explanation. It seems
 I made a wrong assumption on the > > usage of "user." prefi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wRgJz-0006R9-9T
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 8D3785CF667
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMDUvMjIsIFRoZW9kb3JlIFRzbyB3cm90ZToKPiBPbiBGcmksIE1heSAyMiwgMjAyNiBhdCAw
NTowODo0MVBNICswMDAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+IAo+ID4gVGhhbmsgeW91IGZv
ciB0aGUgZXhwbGFuYXRpb24uIEl0IHNlZW1zIEkgbWFkZSBhIHdyb25nIGFzc3VtcHRpb24gb24g
dGhlCj4gPiB1c2FnZSBvZiAidXNlci4iIHByZWZpeCB3aGVyZSBlYWNoIGZpbGVzeXN0ZW0gY2Fu
IHN1cHBvcnQgaW4gZGlmZmVyZW50Cj4gPiB3YXlzLgo+IAo+IFRoZSAidXNlci4iIHByZWZpeCBp
cyB1c2VkIGJ5IGFsbCB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIHRoYXQgd2lzaCB0bwo+IHN0b3Jl
IGV4dGVuZGVkIGF0dHJpYnV0ZXMuICBGb3IgZXhhbXBsZSwgdXNlci5taW1lX3R5cGUsCj4gdXNl
ci54ZGcub3JpZ2luX3VybCwgdXNlci5jaGFyc2V0LCB1c2VyLmFwcGFjaGVfaGFuZGxlciwgZXRj
Cj4gCj4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZToKPiAKPiAgICAgaHR0cHM6Ly93d3cuZnJl
ZWRlc2t0b3Aub3JnL3dpa2kvQ29tbW9uRXh0ZW5kZWRBdHRyaWJ1dGUKPiAgICAgaHR0cHM6Ly93
aWtpLmFyY2hsaW51eC5vcmcvdGl0bGUvRXh0ZW5kZWRfYXR0cmlidXRlcwo+IAo+IEkgY2VydGFp
bmx5IGFzc3VtZWQgdGhpcyB3YXMgY29tbW9uIGtub3dsZWRnZSBhY3Jvc3MgYWxsIGZpbGUgc3lz
dGVtCj4gbWFpbnRhaW5lcnMsIGJ1dCB0aGlzIHdhcyBhcHBhcmVudGx5IG5vdCB0cnVlIGluIHlv
dXIgY2FzZS4gIEkgZG9uJ3QKPiBrbm93IGhvdyB0aGlzIGNvdWxkIGJlIHRoZSBjYXNlIGdpdmVu
IHRoYXQgZjJmcyBpbXBsZW1lbnRzIGV4dGVuZGVkCj4gYXR0cmlidXRlcywgYW5kIEkgd291bGQg
aGF2ZSB0aG91Z2h0IHlvdSB3b3VsZCBoYXZlIGtub3duIHRoYXQgd2hlbgo+IHRlc3RpbmcgdGhh
dCBmZWF0dXJlLgo+IAo+ID4gSSBzaGFyZWQgc29tZSBtb3RpdmF0aW9uIHdoZW4gcmVwbHlpbmcg
dG8gRGFycmljaydzIGZlZWRiYWNrIFsxXSwgYnV0IHllcywKPiA+IGl0IHdhcyBub3QgZW5vdWdo
IGZvciBhbGwgaGVhZHMtdXAuIFRoZSBwcm9ibGVtIHN0YXJ0ZWQgdGhhdCBzb21lIHNwZWljaWZp
Ywo+ID4gYXBwbGljYXRpb24gbmVlZHMgYXMgbWFueSBoaWdoLW9yZGVyIHBhZ2VzIGFzIHBvc3Np
YmxlIG1vc3RseSBmb3IgcmVhZHMuIFNvLAo+ID4gSSB0aG91Z2h0IHdlIGNhbiB0dXJuIG9uIGxh
cmdlIGZvbGlvIG9uIHRoZSBzcGVjaWZpYyBmaWxlcyBwZXIgaGludHMuIE9uZSB3YXkKPiA+IGZv
ciB0aGUgaGludHMgd2FzIHVzaW5nIGltbXV0YWJsZSBiaXQsIGJ1dCBpdCB0dXJuZWQgb3V0IGl0
J3MgdmVyeSBoYXJkIHRvCj4gPiBtYW5hZ2UgZGlzYWJsaW5nIHRoZSBiaXQgd2hlbmV2ZXIgZGVs
ZXRpbmcgdGhlIGZpbGVzLiBBbG9uZyB3aXRoIGxpbWl0ZWQKPiA+IGlvY3RsKCkgYW5kIHJlcXVp
cmluZyBpbm9kZSBldmljdGlvbiB0byBtYW5hZ2UgbGFyZ2UgZm9saW8gYWN0aXZhdGlvbiwgSSBo
YWQKPiA+IHRvIGltcGxlbWVudCB0aGlzIHBhdGguCj4gPiAKPiA+IFsxXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sL2FlQTVDOGJ5SXBYV2xhN2ZAZ29vZ2xlLmNvbS8KPiAKPiBBY3R1YWxs
eSwgeW91IHN0aWxsIGhhdmVuJ3QgZXhwbGFpbmVkIHlvdXIgdXNlIGNhc2UsIGF0IGxlYXN0LCBu
b3QKPiB3ZWxsIGVub3VnaCBmb3IgbWUgdG8gdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgdHJ5aW5n
IHRvIGRvLgo+IAo+IFNvIGFuIGFwcGxpY2F0aW9uIHdhbnRzIGEgcGFydGljdWxhciBmaWxlIHRv
IHVzZSBhcyBtYW55IGhpZ2gtb3JkZXIKPiBwYWdlcyBhcyBwb3NzaWJsZS4gIFdoeT8gIFdoYXQg
c29ydCBvZiBndWFyYW50ZWVzIGRvIHlvdSBuZWVkIHRvCj4gcHJvdmlkZT8gIFdoYXQgaGFwcGVu
cyBpZiB0aGV5IGNhbid0IGJlIHByb3ZpZGVkPyAgV2hhdCBoYXBwZW5zIGlmIGEKPiBwb3NzaWJs
eSBtYWxpY2lvdXMsIG9yIGF0IGxlYXN0IGdyZWFkeSwgYXBwbGljYXRpb24gdXNlcyB0aGlzCj4g
aW50ZXJmYWNlIHRvIGdyYWIgYSBsb3Qgb2YgaGlnaC1vcmRlciBwYWdlcz8KPiAKPiA+RnJvbSB5
b3VyIHBhdGNoOgo+IAo+IDEuIHNldHhhdHRyKGZpbGUsICJ1c2VyLmZhZHZpc2UiLCAmdmFsdWUs
IHNpemVvZih1bnNpZ25lZCBpbnQpLCAwKQo+ICAtPiByZWdpc3RlciB0aGUgaW5vZGUgbnVtYmVy
IGZvciBsYXJnZSBmb2xpbwo+IDIuIGNobW9kKDA0MDAsIGZpbGUpCj4gIC0+IG1ha2UgUmVhZC1P
bmx5Cj4gMy4gb3BlbigpCj4gIC0+IGYyZnNfaWdldCgpIHdpdGggbGFyZ2UgZm9saW8KPiA0LiBv
cGVuKFdSSVRFKSwgbWt3cml0ZSBvbiBtbWFwLCBjaG1vZChXUklURSkKPiAgLT4gcmV0dXJuIGVy
cm9yCj4gNS4gaXB1dCgpIGFuZCBvcGVuKCkKPiAgLT4gZ290byAjMwo+IDYuIHVubGluawo+ICAt
PiBkZXJlZ2lzdGVyIHRoZSBpbm9kZSBudW1iZXIKPiAKPiBXaHkgc2hvdWxkIG1ha2luZyB0aGUg
ZmlsZSByZWFkLW9ubHkgbWF0dGVyPyAgQW5kIHdoZW4geW91IHNheQo+ICJkZXJpZ3N0ZXIgdGhl
IGlub2RlIG51bWJlciIsIHdoeSBzaG91bGQgdGhpcyBiZSByZWxhdGVkIHRvIGRlbGV0aW5nCj4g
dGhlIGlub2RlPwo+IAo+IFRoaXMgaXMgYW4gaW50ZXJmYWNlIHdoaWNoIHNlZW1zIHRvIGJlIHZl
cnkgc3BlY2lmaWMgdG8geW91ciB1c2UgY2FzZS4KPiBXaGF0IGlmIHRob3NlIHJlcXVpcmVtZW50
cyBjaGFuZ2Ugb3ZlciB0aW1lPyAgV2hhdCBpZiB5b3Ugd2FudCBwdWxsIGluCj4gYSBmaWxlIHdp
dGhvdXQgbWFraW5nIGl0IGJlIHJlYWQtb25seT8gIEFuZCB3aGF0IGlmIHlvdSB3YW50IHRvCj4g
cmVsZWFzZSB0aGUgbGFyZ2Utb3JkZXIgcGFnZXMgd2l0aG91dCBkZWxldGluZyB0aGUgZmlsZT8K
CkxldCBtZSB0cnkgdG8gd3JpdGUgbW9yZSBkZXRhaWxzLCBoZWxwZWQgd2l0aCBHZW1pbmkuCgpC
YWNrZ3JvdW5kCi0tLS0tLS0tLS0KVGhlIHByaW1hcnkgdXNlIGNhc2UgaXMgYWNjZWxlcmF0aW5n
IEFJIG1vZGVsIGxvYWRpbmcsIHdoaWNoIGRlbWFuZHMKZXhjZXB0aW9uYWxseSBoaWdoIHNlcXVl
bnRpYWwgcmVhZCBzcGVlZHMuIEluIG91ciBiZW5jaG1hcmtzIG9uIGVtYmVkZGVkCnN5c3RlbXM6
CiAtIFVzaW5nIGhpZ2gtb3JkZXIgcGFnZSBhbGxvY2F0aW9ucyBhbGxvd3MgdGhlIHN5c3RlbSB0
byBzYXR1cmF0ZSB0aGUKICAgVW5pdmVyc2FsIEZsYXNoIFN0b3JhZ2UgKFVGUykgYmFuZHdpZHRo
LCByZWFjaGluZyA0IEdCL3MgZXZlbiBhdAogICBtZWRpdW0tdG8tbG93IENQVSBmcmVxdWVuY2ll
cy4KIC0gSW4gY29udHJhc3QsIHN0YW5kYXJkIHNtYWxsIGZvbGlvcyBjYXAgcGVyZm9ybWFuY2Ug
YXQgMiBHQi9zLgoKVGhlIHBlcmZvcm1hbmNlIGRvdWJsaW5nIHN0ZW1zIGRpcmVjdGx5IGZyb20g
cmVkdWNpbmcgQ1BVIGN5Y2xlIG92ZXJoZWFkIGR1cmluZwptZW1vcnkgYWxsb2NhdGlvbi4KClBy
b2JsZW0gU3RhdGVtZW50Ci0tLS0tLS0tLS0tLS0tLS0tCkhpZ2gtb3JkZXIgcGFnZXMgYmVjb21l
IGhlYXZpbHkgZnJhZ21lbnRlZCBhbmQgc2NhcmNlIHNob3J0bHkgYWZ0ZXIgZGV2aWNlIGJvb3Qu
CldlIGNhbm5vdCBhZmZvcmQgdG8gZGVwbGV0ZSB0aGVzZSBsaW1pdGVkIHJlc291cmNlcyBvbiBk
ZWZhdWx0IGZpbGVzeXN0ZW0Kb3BlcmF0aW9ucyB1c2luZyBsYXJnZSBmb2xpb3MuIEluc3RlYWQs
IHdlIG5lZWQgYSBtZWNoYW5pc20gdG8gc3RyaWN0bHkKcHJpb3JpdGl6ZSBhbmQgcmVzZXJ2ZSBo
aWdoLW9yZGVyIGFsbG9jYXRpb25zIGZvciBzcGVjaWZpYywgY3JpdGljYWwKcGF5bG9hZHPigJRz
cGVjaWZpY2FsbHksIGxhcmdlIEFJIG1vZGVsIGZpbGVzLgoKRGVzaWduIFByaW5jaXBsZXMKLS0t
LS0tLS0tLS0tLS0tLS0KIC0gQmVzdC1FZmZvcnQgQWxsb2NhdGlvbjogVGhlIHN5c3RlbSBndWFy
YW50ZWVzIG5vIGZpeGVkIG51bWJlciBvZgogaGlnaC1vcmRlciBwYWdlcy4gQWxsb2NhdGlvbiBm
YWxscyBiYWNrIGdyYWNlZnVsbHkgZnJvbSBPcmRlci0xMCBkb3duIHRvCiBPcmRlci0wIGJhc2Vk
IG9uIGN1cnJlbnQgbWVtb3J5IGF2YWlsYWJpbGl0eS4KCiAtIFN0YW5kYXJkIFBhZ2UgQ2FjaGUg
TGlmZWN5Y2xlOiBObyBjdXN0b20gb3IgcmlnaWQgbWVtb3J5IG1hbmFnZW1lbnQgaXMKIGludHJv
ZHVjZWQuIFRoZXNlIGZvbGlvcyByZW1haW4gZnVsbHkgdW5kZXIgdGhlIGNvbnRyb2wgb2YgdGhl
IE1lbW9yeQogTWFuYWdlbWVudCAoTU0pIHN1YnN5c3RlbSBhbmQgY2FuIGJlIHJlY2xhaW1lZCB2
aWEgdGhlIExlYXN0IFJlY2VudGx5CiBVc2VkIChMUlUpIG1lY2hhbmlzbSBhdCBhbnkgdGltZS4K
CiAtIFJlYWQtT25seSBPcHRpbWl6YXRpb246IFRvIG1pbmltaXplIGNvZGUgY29tcGxleGl0eSAo
ZS5nLiwgaGFuZGxpbmcKIHdyaXRlYmFjaywgY29tcHJlc3Npb24sIGFuZCBjb25jdXJyZW5jeSks
IHRoaXMgaGlnaC1vcmRlciBhbGxvY2F0aW9uIG1lY2hhbmlzbQogaXMgc3RyaWN0bHkgcmVzdHJp
Y3RlZCB0byByZWFkLW9ubHkgZmlsZXMuIFRoZSB2YXN0IG1ham9yaXR5IG9mIHBlcmZvcm1hbmNl
CiBnYWlucyBhcmUgZGVyaXZlZCBmcm9tIHJlYWQgb3BlcmF0aW9ucy4KClF1ZXN0aW9ucwotLS0t
LS0tLS0KUTogV2h5IGRvZXMgYW4gYXBwbGljYXRpb24gcmVxdWlyZSBhIHNwZWNpZmljIGZpbGUg
dG8gdXRpbGl6ZSBhcyBtYW55IGhpZ2gtb3JkZXIKcGFnZXMgYXMgcG9zc2libGU/CkE6IEl0IHNp
Z25pZmljYW50bHkgYm9vc3RzIHNlcXVlbnRpYWwgcmVhZCBiYW5kd2lkdGggaW4gcmVzb3VyY2Ut
Y29uc3RyYWluZWQKIGVtYmVkZGVkIHN5c3RlbXMgYnkgcmVkdWNpbmcgdGhlIENQVSBvdmVyaGVh
ZCBhc3NvY2lhdGVkIHdpdGggcGFnZSBhbGxvY2F0aW9uCiBkdXJpbmcgaGlnaC10aHJvdWdocHV0
IEkvTy4KClE6IFdoYXQgc29ydCBvZiBndWFyYW50ZWVzIGRvZXMgdGhpcyBtZWNoYW5pc20gbmVl
ZCB0byBwcm92aWRlPwpBOiBObyBoYXJkIGd1YXJhbnRlZXMgYXJlIHByb3ZpZGVkLiBUaGUgZmls
ZXN5c3RlbSBwcm92aWRlcyBhIGJlc3QtZWZmb3J0CiBtZWNoYW5pc20gdG8gYXR0ZW1wdCBoaWdo
LW9yZGVyIHBhZ2UgYWxsb2NhdGlvbnMgZm9yIGZsYWdnZWQgaW5vZGVzIHdoaWxlIHRoZQogZmls
ZXN5c3RlbSBpcyBtb3VudGVkLgoKUTogV2hhdCBpcyB0aGUgZmFsbGJhY2sgYmVoYXZpb3IgaWYg
aGlnaC1vcmRlciBwYWdlcyBjYW5ub3QgYmUgYWxsb2NhdGVkPwpBOiBUaGUgc3lzdGVtIHRyZWF0
cyB0aGUgY29uZmlndXJhdGlvbiBhcyBhIHBlcmZvcm1hbmNlIGhpbnQuIElmIGhpZ2gtb3JkZXIK
IHBhZ2VzIGFyZSB1bmF2YWlsYWJsZSwgaXQgc2VhbWxlc3NseSBmYWxscyBiYWNrIHRvIHN0YW5k
YXJkIHNtYWxsIGZvbGlvcy4KIEZ1bmN0aW9uYWwgYmVoYXZpb3IgcmVtYWlucyBlbnRpcmVseSB1
bmNoYW5nZWQuCgpROiBXaHkgaXMgcmVzdHJpY3RpbmcgdGhlIGltcGxlbWVudGF0aW9uIHRvIHJl
YWQtb25seSBmaWxlcyBuZWNlc3Nhcnk/CkE6IExpbWl0aW5nIHRoZSBzY29wZSB0byByZWFkLW9u
bHkgZmlsZXMgYnlwYXNzZXMgdGhlIGFyY2hpdGVjdHVyYWwgY29tcGxleGl0aWVzCiBvZiBtYW5h
Z2luZyB3cml0ZXMsIGRpcnR5aW5nIHBhZ2VzLCBhbmQgY29tcHJlc3Npb24gaW4gbGFyZ2UgZm9s
aW9zLCB3aGlsZQogc3RpbGwgY2FwdHVyaW5nIHRoZSBjb3JlIHBlcmZvcm1hbmNlIGJlbmVmaXRz
IG9mIGhpZ2gtc3BlZWQgc2VxdWVudGlhbCByZWFkcy4KClE6IFdoYXQgbWl0aWdhdGlvbnMgcHJl
dmVudCBhIG1hbGljaW91cyBvciBncmVlZHkgYXBwbGljYXRpb24gZnJvbSBhYnVzaW5nIHRoaXMK
IGludGVyZmFjZSB0byBtb25vcG9saXplIGhpZ2gtb3JkZXIgcGFnZXM/CkE6IFRoZSBpbnRlcmZh
Y2UgYWN0cyBwdXJlbHkgYXMgYSBoaW50IHRvIHRoZSBhbGxvY2F0aW9uIHBhdGguIEJlY2F1c2Ug
aXQgZmFsbHMKIGJhY2sgdG8gc21hbGwgZm9saW9zIHdoZW4gbWVtb3J5IGlzIHRpZ2h0LCBpdCBw
b3NlcyBubyBncmVhdGVyIHN5c3RlbWljIHJpc2sKIHRoYW4gZXhpc3RpbmcgbGFyZ2UtZm9saW8g
aW1wbGVtZW50YXRpb25zIHVzZWQgYnkgb3RoZXIgZmlsZXN5c3RlbXMuIFN0YW5kYXJkCiBNTSBl
dmljdGlvbiBhbmQgTFJVIHBhdGhzIHJlbWFpbiBmdWxseSBhY3RpdmUuCgpROiBXaHkgaXMgZGVy
ZWdpc3RlcmluZyB0aGUgaW5vZGUgbnVtYmVyIGxpbmtlZCB0byBpbm9kZSBkZWxldGlvbj8KQTog
V2UgbmVlZCB0aGUgaGlnaC1vcmRlciBhbGxvY2F0aW9uIGhpbnQgdG8gcGVyc2lzdCBldmVuIGlm
IHRoZSBpbm9kZSBpcwogdGVtcG9yYXJpbHkgZXZpY3RlZCBmcm9tIHRoZSBWRlMgY2FjaGUuIFRv
IGFjaGlldmUgdGhpcywgd2UgbWFpbnRhaW4gYSB0cmFja2luZwogbGlzdCBvZiBoaW50ZWQgaW5v
ZGUgbnVtYmVycy4gV2hlbiBhIGZpbGUgaXMgcGVybWFuZW50bHkgZGVsZXRlZCwgaXRzIGhpbnQK
IGJlY29tZXMgb2Jzb2xldGUsIHJlcXVpcmluZyB1cyB0byBkZXJlZ2lzdGVyIGl0IGZyb20gdGhl
IGxpc3QgdG8gcHJldmVudCBtZW1vcnkKIGxlYWtzIG9yIGlkZW50aWZpZXIgcmV1c2UgY29uZmxp
Y3RzLgoKUTogSG93IGNhbiBhbiBhcHBsaWNhdGlvbiByZWxlYXNlIHRoZXNlIGxhcmdlLW9yZGVy
IHBhZ2VzIHdpdGhvdXQgZGVsZXRpbmcgdGhlCiBmaWxlPwpBOiBQYWdlcyBhbGxvY2F0ZWQgdmlh
IHRoaXMgbWVjaGFuaXNtIHJlY2VpdmUgbm8gc3BlY2lhbCBzdGF0dXMgaW4gdGhlIHBhZ2UKIGNh
Y2hlLiBUaGV5IGFyZSBtYW5hZ2VkIGJ5IHN0YW5kYXJkIExSVSBsb2dpYyBhbmQgY2FuIGJlIGV4
cGxpY2l0bHkgcmVsZWFzZWQgYnkKIHRoZSB1c2VyIGF0IGFueSB0aW1lIHVzaW5nIGV4aXN0aW5n
IHN5c3RlbSBjYWxscywgc3VjaCBhcwogcG9zaXhfZmFkdmlzZSguLi4sIFBPU0lYX0ZBRFZfRE9O
VE5FRUQpLgoKUTogVGhpcyBpbnRlcmZhY2Ugc2VlbXMgaGlnaGx5IHRhaWxvcmVkIHRvIGEgc3Bl
Y2lmaWMgdXNlIGNhc2UuIFdoYXQgaGFwcGVucyBpZgogdGhlc2UgcmVxdWlyZW1lbnRzIGV2b2x2
ZSBvdmVyIHRpbWU/CkE6IE1hc3NpdmUgQUkgbW9kZWwgbG9hZGluZyBpcyBhIGxvbmctdGVybSBh
cmNoaXRlY3R1cmFsIHBhcmFkaWdtLiBQcm92aWRpbmcgYQogdGFyZ2V0ZWQgVkZTL2ZpbGVzeXN0
ZW0gaGludCB0byBvcHRpbWl6ZSByZWFkIGJhbmR3aWR0aCBmb3Igc3BlY2lmaWMgbGFyZ2UKIGRh
dGFzZXRzIGlzIGEgaGlnaGx5IHByYWN0aWNhbCwgcmVwZWF0YWJsZSBwYXR0ZXJuIHRoYXQgYWRk
cmVzc2VzIGEgc3lzdGVtaWMKIGJvdHRsZW5lY2sgaW4gZW1iZWRkZWQgQUkgZGVwbG95bWVudHMu
Cgo+IAo+IAkJCQkJCS0gVGVkCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

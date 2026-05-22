Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNtxAW3OD2paPwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 05:33:01 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FFE5AE5BA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 05:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OrJkxnX6u9BzD7uLZkFhTtqR22+x6dt8hJmk3XxrQk=; b=UDDrmRJKBJsfEQy0Q+5UFbm6Gy
	II3l+ybN55cv9qDiPuz9HSuTJCV6yspuGn1TkQJBPdQQEbmM4PpnTh1AXHfL+V50XmNNQoeB0VEwE
	XKugmCpwa3lmsVYF6/e9zesrUZivKdKVJfmmsTqpgE1Tt+dIn68Way/JBgxpUM9NB6sQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQGcz-0003VS-Ux;
	Fri, 22 May 2026 03:32:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wQGcy-0003VK-Di
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 03:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CGFAvI18BKBe3vm3c5WorkCHjUcjWwmCPrmYoSAlc2s=; b=TVFL/vK2R9gpJy4QWDCJLtnULT
 1UR2LK5Q+x/M4OrHKosENr5/8zZ4LSrvve7curDoUtwUO/5ttU/rvOixIl8osUhtDzVa2im3NqGYo
 3htymlVpq0C9D7j8yC3ggz9+B07lISGTGEmiupvWzJEYbVtq/eBouRLAtjiMT0k3FJyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CGFAvI18BKBe3vm3c5WorkCHjUcjWwmCPrmYoSAlc2s=; b=cVzGJFQ6lyf88R8k55BUmvHMw+
 LmihzdaGyTpjAQAOkB/zeCQynN4xTh39uOUB86oqehyBlQVY/YXxZoVzds0Jiv5pAXi6juGRjjoox
 3ssV++bs7U4G6e1yK5fhvQ2vCaFze/i9MyjAr2sMvDT2RXlc1RMPibQnwOZJpEAGeDZ0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQGcw-0003OY-Fv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 03:32:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 94E2140851;
 Fri, 22 May 2026 03:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240291F000E9;
 Fri, 22 May 2026 03:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779420761;
 bh=CGFAvI18BKBe3vm3c5WorkCHjUcjWwmCPrmYoSAlc2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XU/IlB9SH9nlFWYU/EiIad/OZNWTJfz8uzGq441tNsdlZHlxAhPQwtA2NOjDRpp9S
 jsCQvoPHpW/b2EqxF4z9HctvBw2zcUUMvy0PL79CW7tF6sSr9KaxQilTtBvSpuNzqm
 LQb87xxVBr99WUX4SXHuRN9DK8q+KFJ//Sw7qV26y3Fn9lfiqnc2QNNAuAppqwkISa
 IzKvOiT+uSEDGkJ0H1/ydXDs9FselwOycC80O8y436kSj8vTfb/9oUcRB5YSJcxjNT
 MqyLv9+oWkNXUQUAOs44eSNwTfA+PX8Cm5Fx7teBgjoWyybo8QhspPJkMRersifqVP
 doyNr89pmQCpQ==
Date: Fri, 22 May 2026 03:32:39 +0000
To: Theodore Tso <tytso@mit.edu>
Message-ID: <ag_OVwPF49LSZ7rz@google.com>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260521155748.GA79343@macsyma-wired.lan>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/21, Theodore Tso wrote: > On Thu, May 21,
 2026 at 01:51:08AM
 -0700, Christoph Hellwig wrote: > > > You haven't sent a proposal. This is
 a reply to a reply to a reply of a > > > patch. There's no [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
X-Headers-End: 1wQGcw-0003OY-Fv
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
	NEURAL_HAM(-0.00)[-0.994];
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
X-Rspamd-Queue-Id: 31FFE5AE5BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMDUvMjEsIFRoZW9kb3JlIFRzbyB3cm90ZToKPiBPbiBUaHUsIE1heSAyMSwgMjAyNiBhdCAw
MTo1MTowOEFNIC0wNzAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+ID4gWW91IGhhdmVu
J3Qgc2VudCBhIHByb3Bvc2FsLiAgVGhpcyBpcyBhIHJlcGx5IHRvIGEgcmVwbHkgdG8gYSByZXBs
eSBvZiBhCj4gPiA+IHBhdGNoLiAgVGhlcmUncyBubyBqdXN0aWZpY2F0aW9uIGZvciB3aHkgZjJm
cyBpcyBzbyBzcGVjaWFsIHRoYXQgaXQKPiA+ID4gbmVlZHMgdGhpcy4gIFdoYXQgdGhlIGhlbGwg
aXMgZ29pbmcgb24/ICBZb3Uga25vdyB0aGlzIGlzIG5vdCB0aGUgd2F5IHRvCj4gPiA+IGdldCBj
b2RlIG1lcmdlZCBpbnRvIExpbnV4Lgo+ID4gCj4gPiBOb25lIG9mIHRoaXMgZ290IHByb3Blcmx5
IGFuc3dlcnMsIGFuZCB0aGlzIGJyb2tlbiBpbnRlcmZhY2Ugbm93IGxhbmRlZAo+ID4gaW4gbGlu
dXgtbmV4dC4gSVQgaXMgb2ZmbG9hZGluZyBhIHVzZXIuKiB4YXR0ciB3aGljaCBpcyBmcmVlLWZv
cm0KPiA+IHVzZXIgZGF0YSB3aXRoIHNlbWFudGljcyB0aGF0IGFyZSB3ZWlyZCB0byBzYXkgaXQg
dmVyeSBuaWNlbHkuCj4gPiAKPiA+IEFsbCB0aGlzIHdhcyBkb25lIGFnYWluc3QgdGhlIGFkdmlj
ZSBpbiB0aGUgbWFpbGluZyBsaXN0IGRpc2N1c3Npb24uCj4gCj4gU28gbGV0IG1lIGdldCB0aGlz
IHN0cmFpZ2h0LiAgVGhpcyBpcyBhIG1hZ2ljIHhhdHRyIGludGVyZmFjZSB3aGljaCBpcwo+IG5v
dCBldmVuIHBlcnNpc3RlZCBpbiB0aGUgZmlsZSBzeXN0ZW0sIGJ1dCBpbnN0ZWFkIHNldHMgYSAz
Mi1iaXQKPiBiaXRtYXNrIGluIHRoZSBzdHJ1Y3QgaW5vZGUgd2hpY2ggZGlzYXBwZWFycyBvbmNl
IHRoZSBpbm9kZSBnZXRzCj4gZmx1c2hlZCBmcm9tIHRoZSBpbm9kZSBzdGFjay4gIEFuZCBpdCB1
c2VzIGEgZ2VuZXJpYyB4YXR0ciBuYW1lLAo+ICJ1c2VyLmZhZHZpc2UiLgo+IAo+IFRoZXJlJ3Mg
bm8gd2F5IGluICpoZWxsKiBhbnkgb3RoZXIgZmlsZSBzeXN0ZW0gaXMgbGlrZWx5IHRvIGFkb3B0
IHN1Y2gKPiBhIGJyb2tlbiBpbnRlcmZhY2UsIHNvIHdoeSBkaWRuJ3QgeW91IGp1c3QgdXNlIGFu
IGlvY3RsIHRvIHNldCB0aGlzCj4gbWFnaWMgZjJmcy1zcGVjaWZpYyBmbGFnPwoKSSB3ZW50IHRo
aXMgcm91dGUgYmVjYXVzZSBBbmRyb2lkIGhlYXZpbHkgcmVzdHJpY3RzIGlvY3RsKCkgcGVybWlz
c2lvbnMKYW5kIHdlIG5lZWRlZCBicm9hZGVyIGFjY2VzcyBmb3IgdGhpcyB0byB3b3JrIHdpdGhp
biB0aGUgZnJhbWV3b3JrLiBJdOKAmXMKZGVmaW5pdGVseSBhIHByYWdtYXRpYyBjaG9pY2UganVz
dCB0byBnZXQgaXQgcnVubmluZyBpbiBwcm9kdWN0aW9uLgoKSWYgaW9jdGwoKSBpcyBhIHJpZ2h0
IHdheSBmb3IgdXBzdHJlYW0sIEknbSBoYXBweSB0byBjaGFuZ2UgdGhpcyBwYXRjaC4gQnkKdGhl
IHdheSwgSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgYWxsIHRoZSBtZXNzYWdlcyBhcmUg
c28gb2ZmZW5zaXZlLApldmVuIHdpdGhvdXQgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIHByb2Js
ZW0gb3IgZ3VpZGluZyByaWdodCBkaXJlY3Rpb25zLgoKPiAKPiA+IEkgdGhpbmsgYXQgc29tZSBw
b2ludCB3ZSBqdXN0IG5lZWQgdG8gc3RvcCB0YWtpbmcgZjJmcyB1cGRhdGVzIGxpa2VzCj4gPiB0
aGlzLgo+IAo+IFdlbGwsIHRoYXQncyB1bHRpYW10ZWx5IHVwIHRvIExpbnVzLiAgSSdsbCBzYXkg
dGhhdCBpZiBJIHdlcmUgTGludXMKPiAoYW5kIEknbSBnbGFkIEknbSBub3QgOi0pLCBhbmQgSSBz
YXcgdGhpcyBpbiBhIHB1bGwgcmVxdWVzdCwgSSdkCj4gcmVqZWN0IGl0IG91dCBvZiBoYW5kLiAg
QnV0IHdoZXRoZXIgaXQncyB3b3J0aCBtYWtpbmcgYSBodWdlIGZ1c3MgYW5kCj4gYXNraW5nIGVz
Y2FsYXRpbmcgdGhpcyBtZXNzIHRvIExpbnVzLCB3ZSBwcm9iYWJseSBzaG91bGQgZ2V0IGEgYml0
Cj4gbW9yZSBjb21tdW5pdHkgY29uc2Vuc3VzIGJlZm9yZSB0YWtpbmcgc3VjaCBhIGRyYXN0aWMg
c3RlcC4KCkNvdWxkIEkgYWxzbyByYWlzZSBhIHF1aWNrIGNvbmNlcm4gcmVnYXJkaW5nIHRoZSBw
aHJhc2luZy93b3JkaW5nIHVzZWQKaW4gdGhlIGNvbW11bmljYXRpb25zPwoKPiAKPiBDaHJpc3Rp
YW4sIHNpbmNlIHlvdSdyZSBvbmUgb2YgdGhlIFZGUyBtYWludGFpZW5ycywgd2hhdCdzIHlvdXIK
PiBvcGluaW9uIGFib3V0IGVzY2FsYXRpbmcgdGhpcyB0byBMaW51cz8KPiAKPiAJCQkJCS0gVGVk
Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

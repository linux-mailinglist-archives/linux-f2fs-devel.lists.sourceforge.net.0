Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGuGDBrgE2qzGwcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 May 2026 07:37:30 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA6A5C5F64
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 May 2026 07:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GUB4pNxlZPr60KeUQTnbjVV4zrqhmBo2yKBG6VolNE=; b=JcxGWPelcJUINl1RLwuTzfWx2v
	NuYjfr4qrasXhlKnwP4JhQrH/teqy2nWktWAMbf5+BZ5ZOm8I83KrmkX8fKeViQD7pVWQeNzyyLYg
	Me3mDG0Apc/C+V1O9MVfVxtLgVyfyYx0ET9mbtsJM2dr4gqlyQ6qp8kCfv6r6RlcAcpk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRO08-0001KL-HO;
	Mon, 25 May 2026 05:37:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+728b97dfb722ff21c2bb+8310+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wRO07-0001KE-Ch for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 May 2026 05:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bPlnrUAngQhntq0icVQxK0A5R6EP/y6CGfxUmuJ8Roc=; b=LADsmVuyZ26O7+1eE4XZjHWdlH
 AN07ZFu1+nkc/aexH2mh64+Ir3horQS2PxqgIuxt5xDjKM3TS0hV2txSOL7YlVIQrSMoYbpYXZ7HP
 YdT8D/fN3mIMQlEYB2aUbUtcf+Q8ko980FC7uhJCNY7IfmpQCJ3h6K6g/qIZF5p6Wu4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bPlnrUAngQhntq0icVQxK0A5R6EP/y6CGfxUmuJ8Roc=; b=SRnihHdPbcvPpT2pvsYQtR0vMp
 zfLd+7L4W9nhc0aBl6mgfiKeoRCWs6KXCL6EjH9xPJ2ozyZkdd5tcZDJHrrXaUvTnZEEV/uQqu29K
 x6jIUcqIwqQe6axyouaZICF4mDkHKcerHSnE/8N/SnSs9dVgrfYzKRPZdC5y2ce7i1b8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wRO05-0000zH-Cl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 May 2026 05:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=bPlnrUAngQhntq0icVQxK0A5R6EP/y6CGfxUmuJ8Roc=; b=mI7+58UNZvQ1rHO+UR+G3zOxD7
 /8Q4dyZKxJcdSNb/R47cH8reyDTtiHoTo+ZY1PEHKP1sCy7wV2KEhwd8MNm/M9D7VXNwHZoztfouo
 ellPDj7sZaVnwIcwtuRKY+kRVN9tGtX3CfEZ+71st7D3jw6OwcdGneEEFEF9XNvEvTxVz0XU8F5v6
 aKLKYaDQcv0dpz+Vxwj0TvKoeLyqOXxQt3Fs7io8F6fnGJKSnqnfrBDTuM9Bjn1mwkQsNTWDDnfhD
 qxzwqs5H2TVfEJQkzZA/O6FF3yMLeD+t3A5pcA1FIZEHbDav7HM47fbADf9+YeeWA6EZTFKtS8mej
 OhB0Hp4w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wRNzu-0000000GKn6-0I3f;
 Mon, 25 May 2026 05:37:06 +0000
Date: Sun, 24 May 2026 22:37:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <ahPgAog1c6SltcQS@infradead.org>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ag_OVwPF49LSZ7rz@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 22, 2026 at 03:32:39AM +0000, Jaegeuk Kim wrote:
 > I went this route because Android heavily restricts ioctl() permissions
 > and we needed broader access for this to work within the framew [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [198.137.202.133 listed in list.dnswl.org]
X-Headers-End: 1wRO05-0000zH-Cl
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
Cc: Theodore Tso <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,infradead.org:mid]
X-Rspamd-Queue-Id: 7EA6A5C5F64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMDM6MzI6MzlBTSArMDAwMCwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4gSSB3ZW50IHRoaXMgcm91dGUgYmVjYXVzZSBBbmRyb2lkIGhlYXZpbHkgcmVzdHJpY3Rz
IGlvY3RsKCkgcGVybWlzc2lvbnMKPiBhbmQgd2UgbmVlZGVkIGJyb2FkZXIgYWNjZXNzIGZvciB0
aGlzIHRvIHdvcmsgd2l0aGluIHRoZSBmcmFtZXdvcmsuIEl04oCZcwo+IGRlZmluaXRlbHkgYSBw
cmFnbWF0aWMgY2hvaWNlIGp1c3QgdG8gZ2V0IGl0IHJ1bm5pbmcgaW4gcHJvZHVjdGlvbi4KClRo
YXQgaXMgbm90IGEgZ29vZCByZWFzb24uCgo+IElmIGlvY3RsKCkgaXMgYSByaWdodCB3YXkgZm9y
IHVwc3RyZWFtLCBJJ20gaGFwcHkgdG8gY2hhbmdlIHRoaXMgcGF0Y2guIEJ5Cj4gdGhlIHdheSwg
SSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgYWxsIHRoZSBtZXNzYWdlcyBhcmUgc28gb2Zm
ZW5zaXZlLAo+IGV2ZW4gd2l0aG91dCB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUgcHJvYmxlbSBv
ciBndWlkaW5nIHJpZ2h0IGRpcmVjdGlvbnMuCgpUaGUgcmlnaHQgd2F5IGlzIHRvOgoKIDEpIFRh
bGsgdG8gdGhlIHJlbGV2YW50IHN1YnN5c3RlbXMgKE1NIGFuZCBmc2RldmVsKSwgYW5kIGlmIGl0
IGFmZmVjdHMKICAgIHVzZXJzcGFjZSB0aGF0IGxpbnV4LWFwaSBsaXN0IGFuZCBhY3R1YWxseSBl
eHBsYWluIHlvdXIgdXNlIGNhc2UuCiAyKSBBbmQgdGhlbiBhY3R1YWxseSBsaXN0ZW4gdG8gZmVl
ZGJhY2suICBmMmZzIGp1c3Qga2VlcHMgcGlsaW5nIHRoZXNlCiAgICBBQkkgaGFja3Mgb24gd2l0
aG91dCBhbnkgcmV2aWV3LCBhbmQgaXQgaXMgY2F1c2luZyByZWFsIHByb2JsZW1zLgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==

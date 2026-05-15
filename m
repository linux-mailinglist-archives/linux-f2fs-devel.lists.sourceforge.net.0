Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIzOGi+dB2oD+wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:24:47 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5B4558D23
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:24:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vp9oaLSkvbJqB6Sh1wkLaoINCPPAqbMfmSIqoMbwORM=; b=FebbWQM3Mw/aHrQJ5JM3ORL4Ct
	Sdm6qfGEM8CXOi6/KwAMkycsZY0bvEKoPckMtx40kcxMO8MW6RtDyMsSWL9PeGP0mp28IJfQ7Of8A
	UbNeg1QL6XmQp/r0AWFcJ/wFDQUlXgsF9Ao5WflniN7R61gYkccn7OycB6c8vKLX2sQc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO0xT-00057z-OK;
	Fri, 15 May 2026 22:24:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrisl@kernel.org>) id 1wO0xS-00057s-Um
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Et6+E/4u8tPTTTpLDHIBdHbpFsEpY+ts+wzQVI+pdX4=; b=ToL7Dq0s6ueePctxz47MUuchPC
 brGPBh3OH5nc0mLpqJEJ3d4UHdQ7t784k3CAyG5xj7nbnt23SxHSv6wt4+3HTfNQyFO/P+Fsu21oY
 sG5tjaCSjGH0K41/K5e5xenmsZk+0iVsA6qPlLK/qH8DLONvZ25abOIQibVpKqIHY0P8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Et6+E/4u8tPTTTpLDHIBdHbpFsEpY+ts+wzQVI+pdX4=; b=UjU883X8f1Bal6buvW8xCXmgkB
 U5SOJH0x3fhQ8zb1QtrjwUsDwa78T6tTYNg0cj7OAP9ypO8N/I4PNAnm5MD2rRTOanyqBSUHAEFvU
 36g+xArPd7K5vfAGwpQYC+HkkR3EOYlb9nhEnGcyFaPUzjtdFllOScef+FBVX/Xwolt8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wO0xS-0003Tc-PR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:24:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E643B445C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE7DC2BD01
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778883868;
 bh=CQjBHE398jfmQc9Nk7uTNv+8vscqO8uzAxJfVr6TjOw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I75LpWDrE4HspM1Nom8QNNiBxvvPPC1Z/wA25yBCJ/4enl3WTmrgj8AZMjhk2O/xG
 yshsfHF9WvD9zWHVLpX9AeHo3Ri3ddj1aGewMbBUU8ZueR0ecjlr9Q0zOirV60mTuL
 Blg8dz0+peaFU83cqwIw+GtehBIoilyr1JVfpLfi/1DhIwPgar4tiP57UNiR2Z6RXb
 jJG0DtJ2+JgFoQLnfeXEZOoydPFpzXHXPWSjEyaxuisnvQztS1Uw/mSHrNECrgkznS
 jVFyqqaY/Np9buMNHRC3bZWYDATHC2YK2s+ERM+sBFNsc5fqz/AcPMBEuFWjFE7Hyy
 AhPRursx/3ldg==
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-654672a6d68so720726d50.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 15:24:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/QwXB9fq22ZLNpHbUH38VNlPh3jWk+GA5gcF5WE/quaamd7TwtpZa6XjvXBKVgSzdn3jU5jT2UPTIWlK+yWlMy@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzhhcFwSZMc6tWex/FzUM74TVHXnZyqfWRwBO8aMWqEwMdKJ7Z5
 rGwDmHHuXMcE7lcn+cBeITndVLCIoFKqHmdYnJV6ME3hloRAd7WA7YDUl2ReKxf1OB111nfmwfc
 7yWWJOc3MrgGyE0iis1M8pi+TIpB66svTUfktxgnMzg==
X-Received: by 2002:a05:690c:c504:b0:7b8:926e:3ef4 with SMTP id
 00721157ae682-7c9599a3c98mr72668207b3.17.1778883868040; Fri, 15 May 2026
 15:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-4-hch@lst.de>
In-Reply-To: <20260512053625.2950900-4-hch@lst.de>
Date: Fri, 15 May 2026 15:24:16 -0700
X-Gmail-Original-Message-ID: <CACePvbVmxUVVZLd=hUnzjRLtt3hBWRxemR_YQZCVSYYNadiAUw@mail.gmail.com>
X-Gm-Features: AVHnY4K8odfW_w5Sv5zxMaAGvoOSmdsLHmORiA0lm6BrpYzORI9rYZ53g2APvuQ
Message-ID: <CACePvbVmxUVVZLd=hUnzjRLtt3hBWRxemR_YQZCVSYYNadiAUw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 11,
 2026 at 10:37 PM Christoph Hellwig <hch@lst.de>
 wrote: > > The swap operations have nothing to do with the address_space,
 which is > used for pagecache operations. Move them to struct [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wO0xS-0003Tc-PR
Subject: Re: [f2fs-dev] [PATCH 03/12] swap,
 fs: move swapfile operations to struct file_operations
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
From: Chris Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chris Li <chrisl@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Kairui Song <kasong@tencent.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-btrfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: CE5B4558D23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chrisl@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMTA6MzfigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cj4KPiBUaGUgc3dhcCBvcGVyYXRpb25zIGhhdmUgbm90aGluZyB0byBk
byB3aXRoIHRoZSBhZGRyZXNzX3NwYWNlLCB3aGljaCBpcwo+IHVzZWQgZm9yIHBhZ2VjYWNoZSBv
cGVyYXRpb25zLiAgTW92ZSB0aGVtIHRvIHN0cnVjdCBmaWxlX29wZXJhdGlvbnMKPiBpbnN0ZWFk
LiAgVGhpcyB3aWxsIGFsbG93IG1vdmluZyB0aGUgYmxvY2sgZGV2aWNlIHNwZWNpYWwgY2FzZXMg
aW50bwo+IGJsb2NrL2ZvcHMuYyBzdWJzZXF1ZW50bHkuCj4KPiBQYXNzIHN0cnVjdCBmaWxlIGZp
cnN0IHRvIC0+c3dhcF9hY3RpdmF0ZSBhcyBmaWxlIG9wZXJhdGlvbnMgdHlwaWNhbGx5Cj4gZ2V0
IHRoZSBmaWxlIG9yIGlvY2IgYXMgZmlyc3QgYXJndW1lbnQgYW5kIHVzZSBzd2FwX2FjdGl2YXRl
IGluc3RlYWQgb2YKPiBzd2FwZmlsZV9hY3RpdmF0ZSBpbiBhbGwgbmFtZXMgdG8gYmUgY29uc2lz
dGVudC4KPgo+IE5vdGUgdGhhdCB3aGlsZSB0aGUgdHJpdmlhbCBpb21hcCB3cmFwcGVycyBhcmUg
bW92ZWQgdG8gYSBuZXcgZmlsZSB3aGVuCj4gYXBwbGljYWJsZSB0byBrZWVwIHRoZW0gbG9jYWwg
dG8gdGhlIGZpbGUgb3BlcmF0aW9uIGluc3RhbmNlcywgY29tcGxleAo+IGltcGxlbWVudGF0aW9u
IGFyZSBrZXB0IGluIHRoZWlyIGV4aXN0aW5nIHBsYWNlLiAgSXQgbWlnaHQgYmUgd29ydGggdG8K
PiBtb3ZlIHRoZW0gaW4gZm9sbG93LW9uIHBhdGNoZXMgaWYgdGhlIG1haW50YWluZXJzIGRlc2ly
ZSBzby4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoK
VGhhdCBtYWtlcyBzZW5zZSB0byBtZS4gSSBhY2sgZm9yIHRoZSBjb3JlIHN3YXAgcGFydCBvZiB0
aGUgY29kZS4KCkFja2VkLWJ5OiBDaHJpcyBMaSA8Y2hyaXNsQGtlcm5lbC5vcmc+CgpDaHJpcwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF+RKYchc2mUsgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:21:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45971A2C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:21:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8s0SfpFP9nlYYo3zLD0zrINhykFTmDT0+M8al5vbHkg=; b=GB1oaqk/xyxiWzXAxVZcAayq4B
	nr1LHuErsCJHwAbqz6+clI2seovBIRAil/00WQnbTR9xslgMiM/r4RzUkWQ8GfBQ9aSNGLUCHM/Td
	VvEenAsDg8VQhemwHsr+9FibXeEdRLkyoOWsBghgj1/Mjzl1Im7CMbHUU+brtgCdzvB8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjBU5-0001H8-5q;
	Fri, 23 Jan 2026 07:21:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vjBU4-0001Gw-2A
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JQd4k/RP+ZwxkjU60X0UaAa8dzylHGp7c0+a/n27/AE=; b=a8sCGjAe4AKeOeys6gQA7TlXrn
 HWoIPOqwW1IDbq0bfIOIcpC0dX5ziqTnRUjiTPeafw9O8JeUgrUHuqdoS2MToSkUKsu7DyXQwgntI
 fPcYJYckIaAeXCOr1N8boul+qKyL+9+RfcA+gnBRevNyYrE/FfHSX/zZxQXcCZc4awD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JQd4k/RP+ZwxkjU60X0UaAa8dzylHGp7c0+a/n27/AE=; b=eA4swA4le24xm3crn8Ncf3mDHJ
 gPZXCLzCTKmFTr2YkhpvX/8n17HdHLCtbB44jC1u7xPRCXp1/fNnDh8cDmUhB+uvyqdm5f0du85qT
 sKoX7cuVnjS3naylwltRFS/512X73k7p4LooDyS5rN64SQ0e1IgT/a/4XWR6q7Shi91s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjBU4-00030i-Dl for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 00CC644303;
 Fri, 23 Jan 2026 07:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4732C4CEF1;
 Fri, 23 Jan 2026 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769152886;
 bh=DDl7zLtPOeFQjxt7Ggqx1S5g+R14kCM8cAEsVyBajUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gjf32HfLTAL5btPTzgGS8ktQroaXji6bHYgaSmpcssFw3bYEFppa2b7196Vj+gtgS
 JB0yV8ItjC1KgxNyb/JKDbBP8cXLE/pw2Kuy+OtsxXLqA1XK+chfrwJBkykTwrhFK+
 1Ka6FntfNJTrfxu4YP1rgQa3TZOMvQFSumTxGU4FoYgY9Mp639my/tPFeo7oPAa1hc
 OonltoZHFkObImhv59hVSuAb0qvhJWNUuBxfUyQ78eEiiDKAxomx7RpXtP8ADa7Goz
 oGkN27oAQ2xkdbEeSQ4tDvOB1P3S8wE4ASZXhMsZTsSzg3OnbiUHWNs9mDSIhrOi41
 4u3ZPsn2LC7Xw==
Date: Thu, 22 Jan 2026 23:21:26 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260123072126.GJ5910@frogsfrogsfrogs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-5-hch@lst.de>
 <20260122212700.GD5910@frogsfrogsfrogs>
 <20260123051216.GA24123@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123051216.GA24123@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 23, 2026 at 06:12:16AM +0100, Christoph Hellwig
 wrote: > On Thu, Jan 22, 2026 at 01:27:00PM -0800, Darrick J. Wong wrote:
 > > Nice hoist, though I wonder -- as an exported fs function, sho [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vjBU4-00030i-Dl
Subject: Re: [f2fs-dev] [PATCH 04/11] fsverity: start consolidating
 pagecache code
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 t@magnolia.djwong.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:t@magnolia.djwong.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Queue-Id: CF45971A2C
X-Rspamd-Action: no action

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMDY6MTI6MTZBTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMDE6Mjc6MDBQTSAtMDgwMCwgRGFy
cmljayBKLiBXb25nIHdyb3RlOgo+ID4gTmljZSBob2lzdCwgdGhvdWdoIEkgd29uZGVyIC0tIGFz
IGFuIGV4cG9ydGVkIGZzIGZ1bmN0aW9uLCBzaG91bGQgd2UgYmUKPiA+IGNoZWNraW5nIHRoYXQg
dGhlIHJldHVybmVkIGZvbGlvIGRvZXNuJ3QgY292ZXIgRU9GPyAgTm90IHRoYXQgYW55IG9mIHRo
ZQo+ID4gdXNlcnMgYWN0dWFsbHkgY2hlY2sgdGhhdCByZXR1cm5lZCBtZXJrbGUgdHJlZSBmb2xp
b3MgZml0IHRoYXQKPiA+IGNyaXRlcmlvbi4KPiAKPiBBcyBpbiBwYXN0IGlfc2l6ZSBiZWNhdXNl
IHRoaXMgaXMgdmVyaXR5IG1ldGFkYXRhPyAgSSB0aGluayBwZXIgdGhlCj4gbGFzdCBkaXNjdXNz
aW9uIHRoYXQncyBvbmx5IGd1cmFudGVlZCB0byBiZSB0cnVlLCBub3QgdGhlIGZvbGlvLiAgSXQK
PiBtaWdodCBiZSB1c2VmdWwgdG8gYXNzZXJ0IHRoaXMsIGJ1dCBpdCBtaWdodCBiZSBiZXR0ZXIg
Zm9yIGNvbWJpbmUKPiB0aGlzIHdpdGggdGhlIHdvcmsgdG8gdXNlIGRpZmZlcmVudCBvbi1kaXNr
IHZzIGluLW1lbW9yeSBvZmZzZXQKPiBhbmQgdG8gY29uc29saWRhdGUgYWxsIHRoZSBvZmZzZXQg
bWFnaWMuICBXaGljaCBpcyB3b3J0aHdoaWxlLAo+IGJ1dCDQhiBkb24ndCByZWFsbHkgd2FudCB0
byBhZGQgdGhhdCBpbiB0aGlzIHNlcmllcy4KCjxub2Q+IFlvdSdyZSBwcm9iYWJseSByaWdodCB0
aGF0IGFkZGluZyBzdWNoIGEgY2hlY2sgd291bGQgYmUgYmV0dGVyIG9mZgppbiB3aGF0ZXZlciBz
ZXJpZXMgZm9ybWFsbHkgZGVmaW5lcyB0aGUgcG9zdC1lb2YgcGFnZWNhY2hlIG9mZnNldCBhbmQK
d2hhdG5vdC4KCi0tRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

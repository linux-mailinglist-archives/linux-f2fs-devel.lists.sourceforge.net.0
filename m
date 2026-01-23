Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id u6ixG0QDc2nurgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 06:12:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC77A705F4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 06:12:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5i73lrPqjZRKb5ZD0Cqm/vhtyF1yMuKGZTJcXuUL/Jg=; b=PYUshf3Y5jCrnAmjqWt6ha5kEH
	ti7p0yzawcOfDJ/wU7HovV6tbMPyVfCdVt63fVR3ruCoJeQyiKS0aTLkcPxfi7ncvDjJJr6JQPZ0H
	syj+V6/63V0j4jLxtgDEeXk3yVjCO7FijYCSzPGQNiZWqKF6cmq/GsoBAS7pptchY5kA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj9T8-0002hw-UT;
	Fri, 23 Jan 2026 05:12:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vj9T8-0002ho-1g
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 05:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Jqp+gWUNSNLiAWDtTK+Alw28/gUycqDxeXrGjI52iM=; b=crPi6QSA27CFmlErIECfT+soI4
 v1hTdK7A84XjaYxbml7LQCuFVIUfeU/Di1+nOLyb5+XnaxP0dnhdJdKPWQmnRRRRNjPqE1IlzAQL0
 zpTmXqxfDGPAcCF/dhCWztMZKHU+/+yst7Cw7hKfFzDvW9UcIx1pWSYSxGplP8T16PdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Jqp+gWUNSNLiAWDtTK+Alw28/gUycqDxeXrGjI52iM=; b=Wl+n2qY3icraM8z7ypI8NU+4GW
 5UodlIL7a/wjpiuubOngH8RhPvQP+lS0BFMkz3FZ+udvH9sOwF96aGdkP01AUsCsngauVDNB9ag6p
 E9ohpQdgZQztPynI3IN29/oVqe1LrAQShy68nA4swltu0xO4yQuA2b6345QLhAV1j1qQ=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj9T7-0006FZ-Bi for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 05:12:25 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A85EC227AA8; Fri, 23 Jan 2026 06:12:16 +0100 (CET)
Date: Fri, 23 Jan 2026 06:12:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20260123051216.GA24123@lst.de>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-5-hch@lst.de> <20260122212700.GD5910@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122212700.GD5910@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 01:27:00PM -0800, Darrick J. Wong
 wrote: > Nice hoist, though I wonder -- as an exported fs function, should
 we be > checking that the returned folio doesn't cover EOF? Not tha [...]
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [213.95.11.211 listed in list.dnswl.org]
X-Headers-End: 1vj9T7-0006FZ-Bi
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 t@magnolia.djwong.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:t@magnolia.djwong.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EC77A705F4
X-Rspamd-Action: no action

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMDE6Mjc6MDBQTSAtMDgwMCwgRGFycmljayBKLiBXb25n
IHdyb3RlOgo+IE5pY2UgaG9pc3QsIHRob3VnaCBJIHdvbmRlciAtLSBhcyBhbiBleHBvcnRlZCBm
cyBmdW5jdGlvbiwgc2hvdWxkIHdlIGJlCj4gY2hlY2tpbmcgdGhhdCB0aGUgcmV0dXJuZWQgZm9s
aW8gZG9lc24ndCBjb3ZlciBFT0Y/ICBOb3QgdGhhdCBhbnkgb2YgdGhlCj4gdXNlcnMgYWN0dWFs
bHkgY2hlY2sgdGhhdCByZXR1cm5lZCBtZXJrbGUgdHJlZSBmb2xpb3MgZml0IHRoYXQKPiBjcml0
ZXJpb24uCgpBcyBpbiBwYXN0IGlfc2l6ZSBiZWNhdXNlIHRoaXMgaXMgdmVyaXR5IG1ldGFkYXRh
PyAgSSB0aGluayBwZXIgdGhlCmxhc3QgZGlzY3Vzc2lvbiB0aGF0J3Mgb25seSBndXJhbnRlZWQg
dG8gYmUgdHJ1ZSwgbm90IHRoZSBmb2xpby4gIEl0Cm1pZ2h0IGJlIHVzZWZ1bCB0byBhc3NlcnQg
dGhpcywgYnV0IGl0IG1pZ2h0IGJlIGJldHRlciBmb3IgY29tYmluZQp0aGlzIHdpdGggdGhlIHdv
cmsgdG8gdXNlIGRpZmZlcmVudCBvbi1kaXNrIHZzIGluLW1lbW9yeSBvZmZzZXQKYW5kIHRvIGNv
bnNvbGlkYXRlIGFsbCB0aGUgb2Zmc2V0IG1hZ2ljLiAgV2hpY2ggaXMgd29ydGh3aGlsZSwKYnV0
INCGIGRvbid0IHJlYWxseSB3YW50IHRvIGFkZCB0aGF0IGluIHRoaXMgc2VyaWVzLgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==

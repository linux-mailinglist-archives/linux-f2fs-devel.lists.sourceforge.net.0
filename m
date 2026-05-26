Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIDIEnyjFWprWwcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 15:43:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB675D6BD8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 15:43:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aW3TY7L1W5hBG9d0sVM7OJ6+doMXrsp/EheAxCFFaak=; b=Whbs2Qza2c9ZtNLYyZm260PBMO
	6RqCLaQ5wLAur8AvEwFOP6PWna7PGjA8SCr9TSPeGVdcE1FaROehMcNBKbNzRhWvNAkkiWPz+AeJA
	nAqzj+b+KHXi3TZ9vQY+Vt4KmjdU5jwrUlJ+jqvoErQ3OJ8jgJQANM6CgcnKHxeomRBk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRs3p-0007KT-7J;
	Tue, 26 May 2026 13:43:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1wRs3n-0007KN-RP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 13:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=03Ae6RWKd6EnbPpHHfvNMfYhJeKoYpqPfXah8lU8jAo=; b=jfEmIr+f/9IY2I7SZEnHZVDxU0
 SPU0knAim09IqjMSRouHn0ch71zsKRlt1wdk3HEBZtBcExZtckRByE4MBlQbd+8d/Hp67907Wke7u
 NzGHwBP2lcr+ZTcw/4qUvAPvOwvWGWsBPBxhvg9/Hevar7FDPFGtIrUTEnBdB0xxSKQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=03Ae6RWKd6EnbPpHHfvNMfYhJeKoYpqPfXah8lU8jAo=; b=lCs/rDWpilUc5h+qJqGYoiJ6r6
 mSXveZwCezSUkoDRfDsZfN8qYW/kl7cyj9h1KHnYwtLedat1ar3X84WBqoWAX5yeJCNAKTm6zRRqN
 cOU3v02a29TLelMcV8ljKg9HfYQgZAYYfrnfanyuXQRX3DH44K5Dn63QTiayU3kSrtPk=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wRs3j-0002P4-4b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 13:43:05 +0000
Received: from macsyma.thunk.org (c-73-9-28-129.hsd1.il.comcast.net
 [73.9.28.129]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 64QDgKbw016888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2026 09:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1779802946; bh=03Ae6RWKd6EnbPpHHfvNMfYhJeKoYpqPfXah8lU8jAo=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=ejesU+18AVFFIEgBaVKUv1hsYDQbQOg6W/J3OH9yYwjHCIb+jpqlrXpt7KIGFvPSr
 2ht/krbvYSvIBKP5sZEAjbhEuE7NL0QJt0YgO2g1S4v3XDL1RR7qoft1xNr7FQPzka
 Hwo8LpmDOwrc3SQGOlv+wHY1Wps6J/GMV8xeaovvUDIbVbEF4UWSI1igFd+XnkAldn
 PfbQ90HPxiIGNmRMH+x0KVLVvGWyDA3vJG8EknOdtJikYP3UixBrFiteufTcdEKT9w
 wD4NduZ5RLVuaoFmZzDQYDwHkVZ/sYNwLAIREliUiPZLApHgIQO7Bf54STmkIdX8Zw
 hZdbOvYuIOKBA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
 id 137D16B282ED; Tue, 26 May 2026 08:42:20 -0500 (CDT)
Date: Tue, 26 May 2026 08:42:19 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <ybmbjekuvzmaw4hmlxd7nxs546dqtwmxqxwyali74d6m3u7tat@b4q3japqnhrl>
References: <ad30g9xMs9wNJhFb@infradead.org> <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com>
 <20260522224108.GA18663@macsyma-wired.lan>
 <ahTzHyHBL8t0iNBR@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahTzHyHBL8t0iNBR@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 26, 2026 at 01:10:55AM +0000, Jaegeuk Kim wrote:
 > Background > > The primary use case is accelerating AI model loading, which
 demands > exceptionally high sequential read speed [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wRs3j-0002P4-4b
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
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.41 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mit.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,mit.edu:s=outgoing];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,mit.edu:-];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 6EB675D6BD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXkgMjYsIDIwMjYgYXQgMDE6MTA6NTVBTSArMDAwMCwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4gQmFja2dyb3VuZAo+IC0tLS0tLS0tLS0KPiBUaGUgcHJpbWFyeSB1c2UgY2FzZSBpcyBh
Y2NlbGVyYXRpbmcgQUkgbW9kZWwgbG9hZGluZywgd2hpY2ggZGVtYW5kcwo+IGV4Y2VwdGlvbmFs
bHkgaGlnaCBzZXF1ZW50aWFsIHJlYWQgc3BlZWRzLiBJbiBvdXIgYmVuY2htYXJrcyBvbiBlbWJl
ZGRlZAo+IHN5c3RlbXM6Cj4gIC0gVXNpbmcgaGlnaC1vcmRlciBwYWdlIGFsbG9jYXRpb25zIGFs
bG93cyB0aGUgc3lzdGVtIHRvIHNhdHVyYXRlIHRoZQo+ICAgIFVuaXZlcnNhbCBGbGFzaCBTdG9y
YWdlIChVRlMpIGJhbmR3aWR0aCwgcmVhY2hpbmcgNCBHQi9zIGV2ZW4gYXQKPiAgICBtZWRpdW0t
dG8tbG93IENQVSBmcmVxdWVuY2llcy4KPiAgLSBJbiBjb250cmFzdCwgc3RhbmRhcmQgc21hbGwg
Zm9saW9zIGNhcCBwZXJmb3JtYW5jZSBhdCAyIEdCL3MuCgpTbyB5b3UncmUgaW50ZXJlc3RlZCBp
biBvcHRpbWl6aW5nIHRoZSBJL08gc3BlZWRzLiAgQW5kIGFwcGFyZW50eSwgb24KeW91ciBoYXJk
d2FyZSwgdGhlIFVGUyBjb250cm9sbGVyIGhhcyBsaW1pdHMgb24gc2NhdHRlci1nYXRoZXIgZW50
cmllcwotLS0gVUZTIHNlZW1zIHRvIGNhbGwgdGhpcyBQaHlzaWNhbCBSZWdpb24gRGVzY3JpcHRp
b24gKFBSRCkgdGFibGUKZW50cmllcy4gIFBlciBHZW1pbmk6CgogICAgMS4gUFJEIFNlZ21lbnQg
JiBMZW5ndGggTGltaXRzCgkKCU1heGltdW0gUFJEIEVudHJpZXM6IEhhcmR3YXJlIGxpbWl0cyB0
eXBpY2FsbHkgY2FwIHRoZSBudW1iZXIKCSAgICBvZiBQUkQgZW50cmllcyAob3Igc2VnbWVudHMp
IHRvIDI1NSBvciAyNTYgcGVyIHRyYW5zZmVyCgkgICAgcmVxdWVzdC4KCQoJTWF4aW11bSBUcmFu
c2ZlciBMZW5ndGg6IEVhY2ggaW5kaXZpZHVhbCBQUkQgZW50cnkgdHlwaWNhbGx5CgkgICAgYWxs
b3dzIGEgbWF4aW11bSB0cmFuc2ZlciBzaXplIG9mICg2NSw1MzUgYnl0ZXMpIHBlciBzZWdtZW50
LgoKICAgIDIuIEhvc3QgQ29udHJvbGxlciBIYXJkd2FyZSBMaW1pdHMgKFVGU0hDSSkKICAgIAoJ
VHJhbnNmZXIgUXVldWUgRGVwdGg6IEEgVUZTIGNvbnRyb2xsZXIgc3VwcG9ydHMgYSBwcmVkZWZp
bmVkCgkgICAgbnVtYmVyIG9mIG91dHN0YW5kaW5nIHRhc2sgcmVxdWVzdCBlbnRyaWVzLiBUaGlz
IGlzIG9mdGVuCgkgICAgaGFyZC1jYXBwZWQgYXQgMzIgY29uY3VycmVudCB0cmFuc2ZlciByZXF1
ZXN0cyAoc2xvdHMpIGJ5IHRoZQoJICAgIGRvb3JiZWxsIHJlZ2lzdGVyIGFycmF5LgoJCglEZXNj
cmlwdG9yIFByZS1mZXRjaDogU29tZSBVRlMgaG9zdCBjb250cm9sbGVycyBhcmUKCSAgIHByZS1j
b25maWd1cmVkIHRvIHByZS1mZXRjaCBtdWx0aXBsZSBQUkQgZW50cmllcyBzZXF1ZW50aWFsbHkK
CSAgIGJlZm9yZSByZXF1aXJpbmcgbWFpbiBtZW1vcnkgcmVhZHMuCgpJcyB0aGlzIGFuIGFjY3Vy
YXRlIGRlc2NyaXB0aW9uIG9mIHRoZSBsaW1pdHMgdGhhdCB5b3UgYXJlIHRyeWluZyB0bwp3b3Jr
IHdpdGg/ICBIb3cgbXVjaCBkYXRhIGFyZSB5b3UgdHJ5aW5nIHRvIHJlYWQ/ICBMb29raW5nIGF0
IEdlbW1hIDQKbW9kZWxzLCBFMkIgaXMgYWJvdXQgMTBHQiBvciAzR0IgZm9yIHRoZSA0LWJpdCBx
dWFudGl6ZWQgdmVyc2lvbi4gIEU0QgppcyAxNUdCLCBvciA1R0IgZm9yIHRoZSA0LWJpdCBxdWFu
dGl6ZWQgdmVyc2lvbi4gIElzIHRoYXQgYWJvdXQgcmlnaHQ/CgpJdCBzZWVtcy4uLiBzdXJwcmlz
aW5nIHRoYXQgdGhlIGFkZGl0aW9uYWwgSS9PIG9wZXJhdGlvbnMgYXJlIGFjdHVhbGx5CnRocm90
dGxvaW5nIFVGUyBkZXZpY2UgYmFuZHdpZHRoIGJ5IDJ4ICg0R0IvcyB2cyAyR0IvcykuICBIYXZl
IHlvdSBkdWcKaW50byB3aHkgdGhpcyBpcyBoYXBwZW5pbmcsIGFuZCB3aGV0aGVyIHRoZXJlIGlz
IGFueXRoaW5nIHRoYXQgY2FuIGJlCm9wdGltaXplZCBiZWxvdyB0aGUgZmlsZSBzeXN0ZW0/Cgo+
IFByb2JsZW0gU3RhdGVtZW50Cj4gLS0tLS0tLS0tLS0tLS0tLS0KPiBIaWdoLW9yZGVyIHBhZ2Vz
IGJlY29tZSBoZWF2aWx5IGZyYWdtZW50ZWQgYW5kIHNjYXJjZSBzaG9ydGx5IGFmdGVyCj4gZGV2
aWNlIGJvb3QuICBXZSBjYW5ub3QgYWZmb3JkIHRvIGRlcGxldGUgdGhlc2UgbGltaXRlZCByZXNv
dXJjZXMgb24KPiBkZWZhdWx0IGZpbGVzeXN0ZW0gb3BlcmF0aW9ucyB1c2luZyBsYXJnZSBmb2xp
b3MuIEluc3RlYWQsIHdlIG5lZWQgYQo+IG1lY2hhbmlzbSB0byBzdHJpY3RseSBwcmlvcml0aXpl
IGFuZCByZXNlcnZlIGhpZ2gtb3JkZXIgYWxsb2NhdGlvbnMKPiBmb3Igc3BlY2lmaWMsIGNyaXRp
Y2FsIHBheWxvYWRz4oCUc3BlY2lmaWNhbGx5LCBsYXJnZSBBSSBtb2RlbCBmaWxlcy4KClRoZXJl
J3MgYSBmdW5kYW1lbnRhbCBhc3N1bXB0aW9uIGhlcmUsIHdoaWNoIGlzIHRoYXQgdGhlIG9ubHkg
dXNlIG9mCmhpZ2ggb3JkZXIgcGFnZXMgaXMgdGhlIHBhZ2UgY2FjaGUuICBUaGlzIGRvZXNuJ3Qg
dGFrZSBpbnRvIGFjY291bnQKYW5vbnltb3VzIHBhZ2VzIHVzZWQgYnkgcHJvZ3JhbXMgdGhhdCBp
c24ndCBiYWNrZWQgYnkgZmlsZXMuICBOb3IgZG9lcwppdCB0YWtlIGludG8gYWNjb3VudCBrZXJu
ZWwgbWVtb3J5IGFsbG9jYXRpb25zLgoKQnV0IHRoYXQgYmVpbmcgc2FpZCwgeW91IHNlZW0gdG8g
YmUgYXNzdW1pbmcgdGhhdCB5b3UgY2FuIHJlZHVjZSB0aGUKcHJlc3N1cmUgb24gaGlnaCBvcmRl
ciBwYWdlcyBieSBvbmx5IHVzaW5nIGxhcmdlIGZvbGlvcyBmb3IgdGhlc2UgQUkKbW9kZWwgZmls
ZXMuCgpCdXQgdGhlIHByb2JsZW0gd2l0aCB1c2luZyBzbWFsbCBmb2xpb3MgaXMgdGhhdCBpZiB5
b3Ugd2FudCB0bwphY3R1YWxseSAqdXNlKiB0aGUgbWVtb3J5LCB1bmxlc3MgeW91IHdhbnQgdG8g
c2VnbWVudCBvdXQgdGhlIG1lbW9yeQpzbyBpdCBjYW4ndCBiZSB1c2VkIGZvciBhbnl0aGluZyBv
dGhlciB0aGFuIHRoZSBBSSBtb2RlbHMgKGUuZy4sIGJ5CnVzaW5nIHNvbXRoaW5nIGxpa2UgaHVn
ZXRsYmZzKSBpdCdzIGp1c3QgZ29pbmcgdG8gYnJlYWsgdXAgdGhlIG1lbW9yeQppbnRvIHNtYWxs
ZXIgZm9saW9zLiAgU28gdGhhdCdzIG5vdCBhY3R1YWxseSBnb2luZyB0byAqaGVscCogaW4gYWN0
dWFsCnJlYWwgbGlmZSB1c2UgY2FzZXMuICBJdCBtaWdodCBoZWxwIGZvciB5b3VyIGFydGlmaWNp
YWwgYmVuY2htYXJrcyAvCmV4cGVyaW1lbnRzLCBidXQgaW4gdGhlIHJlYWwgbGlmZSBjYXNlIHdo
ZXJlIEFuZHJvaWQgYXBwbGljYXRpb25zIGFyZQpydW5uaW5nIGFuZCBmcmFnbWVudGluZyBhbGwg
b2YgdGhlIGRldmljZSBtZW1vcnksIHRoZSBsYXJnZSBmb2xpb3MKd29uJ3QgYmUgYXZhaWxhYmxl
ICphbnl3YXkqLgoKPiAKPiBROiBXaHkgaXMgZGVyZWdpc3RlcmluZyB0aGUgaW5vZGUgbnVtYmVy
IGxpbmtlZCB0byBpbm9kZSBkZWxldGlvbj8KPiBBOiBXZSBuZWVkIHRoZSBoaWdoLW9yZGVyIGFs
bG9jYXRpb24gaGludCB0byBwZXJzaXN0IGV2ZW4gaWYgdGhlIGlub2RlIGlzCj4gIHRlbXBvcmFy
aWx5IGV2aWN0ZWQgZnJvbSB0aGUgVkZTIGNhY2hlLiBUbyBhY2hpZXZlIHRoaXMsIHdlIG1haW50
YWluIGEgdHJhY2tpbmcKPiAgbGlzdCBvZiBoaW50ZWQgaW5vZGUgbnVtYmVycy4gV2hlbiBhIGZp
bGUgaXMgcGVybWFuZW50bHkgZGVsZXRlZCwgaXRzIGhpbnQKPiAgYmVjb21lcyBvYnNvbGV0ZSwg
cmVxdWlyaW5nIHVzIHRvIGRlcmVnaXN0ZXIgaXQgZnJvbSB0aGUgbGlzdCB0byBwcmV2ZW50IG1l
bW9yeQo+ICBsZWFrcyBvciBpZGVudGlmaWVyIHJldXNlIGNvbmZsaWN0cy4KCkFzc3VtaW5nIHRo
YXQgdGhlIGhpZ2gtb3JkZXIgYWxsb2NhdGlvbiBoaW50IGlzIGEgZ29vZCB0aGluZywgd2h5IG5v
dApqdXN0IG1ha2UgaXQgcGVyc2lzdGVudD8gIGUuZy4sIGp1c3QgYSAqcmVhbCogZXh0ZW5kZWQg
YXR0cmlidXRlCih3aGljaCBpcyBtb3JlIHdhdGVmdWwgb2Ygc3BhY2UpLCBvciBncmFiIGEgZmxh
ZyBpbiB0aGUgb24tZGlzayBmMmZzCmlub2RlPyAgVGhlbiB5b3UgZG9uJ3QgbmVlZCB0byBoYXZl
IGFuIGluLW1lbW9yeSBsaXN0IG9mIGhpbnRlZAppbm9kZXM7IGluc3RlYWQsIHlvdSBjYW4ganVz
dCBoYXZlIHRoZSBBbmRyb2lkIHBhY2thZ2UgbWFuYWdlciBzZXQKdGhhdCBmbGFnIGluZGljYXRp
bmcgdGhhdCB5b3Ugd2FudCB0aGF0IHNwZWNpYWwgdHJlYXRtZW50LiAgVGhpcyBpcwphbGwgYXNz
dW1pbmcgdGhhdCB3ZSBuZWVkIGFuIGV4cGxpY2l0IGhpbnQsIHRob3VnaC4uLi4KCj4gTWFzc2l2
ZSBBSSBtb2RlbCBsb2FkaW5nIGlzIGEgbG9uZy10ZXJtIGFyY2hpdGVjdHVyYWwKPiBwYXJhZGln
bS4gUHJvdmlkaW5nIGEgdGFyZ2V0ZWQgVkZTL2ZpbGVzeXN0ZW0gaGludCB0byBvcHRpbWl6ZSBy
ZWFkCj4gYmFuZHdpZHRoIGZvciBzcGVjaWZpYyBsYXJnZSBkYXRhc2V0cyBpcyBhIGhpZ2hseSBw
cmFjdGljYWwsCj4gcmVwZWF0YWJsZSBwYXR0ZXJuIHRoYXQgYWRkcmVzc2VzIGEgc3lzdGVtaWMg
Ym90dGxlbmVjayBpbiBlbWJlZGRlZAo+IEFJIGRlcGxveW1lbnRzLgoKSXQncyByZWFsbHkgdG9v
IGJhZCB5b3UgZGlkbid0IHByb3Bvc2UgdGhpcyBhcyBhIExTRi9NTSB0b3BpYywgYW5kCnByZXNl
bnRlZCB0aGlzIGF0IGEgc2Vzc2lvbiBhdCBaYWdyZWIgdHdvIHdlZWtzIGFnby4gIFRoYXQgd291
bGQgaGF2ZQpiZWVuIGEgbXVjaCBtb3JlIHVwc3RyZWFtLWZyaWVuZGx5IHdheSBvZiBjb2xsYWJv
cmF0aW5nLCBhbmQgaXQgbWlnaHQKaGF2ZSBhbGxvd2VkIHRoZSBtbSBleHBlcnRzIHRvIGdpdmUg
eW91IHNvbWUgbW9yZSBkeW5hbWljLCByZWFsLXRpbWUKZmVlZGJhY2suCgpDaGVlcnMsCgoJCQkJ
CS0gVGVkCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=

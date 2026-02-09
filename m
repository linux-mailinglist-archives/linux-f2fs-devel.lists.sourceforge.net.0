Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP4CBC8+iWlL5AQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Feb 2026 02:53:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 254ED10AEDB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Feb 2026 02:53:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HUVI4zTZ20TzoJyGo7000Hy28pZBJQWinxM0zUZV1o=; b=YfWp9JVoX5YXawI60IQyRrY0Zd
	gsxuBC8dIDRSq+pUQtRkaTQmaRMMhIm8F/jly0ZHZQPhhyyMsPuODFNoPwfiTtKbzM03DmnZ/9sFL
	F9N28Q41xHWNbT4kfUM5i/5TFJ2Kgg91yRCKMI9JDmsysJb8JG3VNZNscu2K5DHHJjy8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vpGT4-0003mY-CC;
	Mon, 09 Feb 2026 01:53:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vpGT3-0003mL-AF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Feb 2026 01:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wGXwk+/YKjoG9y6+TMiNZ4LUpaw3Btm5nlKy7+OU3t0=; b=UhaTawLXwZ8gKZOExGASzOf2br
 4hs3gp0Pn+WwHlvNp9ug0lcQVdi8jIqNSvx7MAOYXjl/mGY7mu/H9YhcO0GGK4k1aM9f+j4jsHxed
 7Q1PiYhtyFlEklebL2sOrifs6liTAR7ZmnOmZUMC6N4Whvp0iq+klQ7CTdGvRbfju4mQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wGXwk+/YKjoG9y6+TMiNZ4LUpaw3Btm5nlKy7+OU3t0=; b=VMiRqDnLTt3LIBw8SHbdgrOl5W
 LLrVPndZtkjFHfrKF5mNO3GYbi51Zr8MiaanzV0BiEavVmyWnaxycI6oEaxWkBctUyVdTa4XaZQVk
 fzxs/K9i75kRQ/tAb1DvqgMggT1KrJ/IGnJJe5qQ45QoAzkbNXhATVaZ7N3k7xPe8LmI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vpGT3-0005Gq-Mc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Feb 2026 01:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D53842A33;
 Mon,  9 Feb 2026 01:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9E9C4CEF7;
 Mon,  9 Feb 2026 01:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770602007;
 bh=96QqglFg43zvYNEv2/Zj9UYa/qEYFwhtncmwSzkvNW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y26EkbjAuRsIi08x/AdidBiODMibitINvDUsXhZ5FC8oLzLBmqmstv7PTNm8q9RQ5
 YMZgTxGMQpO/1JCGB0yQ5jj2HVol8JUAKFolJXiJy3cA0WAFgtWhR8FL+XrqZJ6y1C
 zQIrNtDYu91nrgr7nRtI3T6jSKWUKA6az1J5hfJtepwMwZdDI7FyKK4PTeRBx4B6Gs
 d9QJByeU1iyfBqQiZFhoF09UNQ/HNRkfp9Q8jtQtU5G0N1S5diLrG6ePgCztpW3wjP
 pR/5Cwx4Yyc0qonmpGsj+ghImKvuCkgmiGhhgPv87Y8eAKN4qRz1OvwPt5n9WE4Ho+
 fZx6stRpU4oMw==
Date: Sun, 8 Feb 2026 17:53:26 -0800
To: Zorro Lang <zlang@redhat.com>
Message-ID: <20260209015326.GK1535390@frogsfrogsfrogs>
References: <20260108022501.754320-1-joannechien@google.com>
 <20260110013802.GB15541@frogsfrogsfrogs>
 <CACQK4XDtrE5P-PjwSqvGtmEmMvEQS4r2KZkDh55LXY2YAoH6vw@mail.gmail.com>
 <20260208195043.vhvkanq5pysbb74y@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260208195043.vhvkanq5pysbb74y@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 09, 2026 at 03:50:43AM +0800, Zorro Lang wrote:
 > On Mon, Jan 12, 2026 at 11:20:36AM +0800, Joanne Chang wrote: > > On Sat,
 Jan 10, 2026 at 9:38 AM Darrick J. Wong <djwong@kernel.org> wrot [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vpGT3-0005Gq-Mc
Subject: Re: [f2fs-dev] [PATCH v3] common/rc: add _require_blocks_in_file
 helper
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
Cc: Joanne Chang <joannechien@google.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zlang@redhat.com,m:joannechien@google.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 254ED10AEDB
X-Rspamd-Action: no action

T24gTW9uLCBGZWIgMDksIDIwMjYgYXQgMDM6NTA6NDNBTSArMDgwMCwgWm9ycm8gTGFuZyB3cm90
ZToKPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAxMToyMDozNkFNICswODAwLCBKb2FubmUgQ2hh
bmcgd3JvdGU6Cj4gPiBPbiBTYXQsIEphbiAxMCwgMjAyNiBhdCA5OjM44oCvQU0gRGFycmljayBK
LiBXb25nIDxkandvbmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+IE9uIFRodSwgSmFuIDA4LCAy
MDI2IGF0IDAyOjI1OjAxQU0gKzAwMDAsIEpvYW5uZSBDaGFuZyB3cm90ZToKPiA+ID4gPiBnZW5l
cmljLzczNSBhdHRlbXB0cyB0byBjcmVhdGUgYSBmaWxlIHdpdGggbmVhcmx5IDJeMzIgYmxvY2tz
LiBIb3dldmVyLAo+ID4gPiA+IHNvbWUgZmlsZXN5c3RlbXMgaGF2ZSBhIG1heGltdW0gZmlsZSBi
bG9jayBsaW1pdCBiZWxvdyB0aGlzIHRocmVzaG9sZC4KPiA+ID4gPiBGb3IgaW5zdGFuY2UsIEYy
RlMgaXMgbGltaXRlZCB0byBhcHByb3hpbWF0ZWx5IDJeMzAgYmxvY2tzIGR1ZSB0byB0aGUKPiA+
ID4gPiBjYXBhY2l0eSBvZiB0aGUgaW5vZGUuIFNvIGFkZCBfcmVxdWlyZV9ibG9ja3NfaW5fZmls
ZSBoZWxwZXIgdG8gc2tpcCB0aGUKPiA+ID4gPiB0ZXN0IGluIHN1Y2ggY2FzZXMuCj4gPiA+ID4K
PiA+ID4gPiBUaGUgaGVscGVyIHVzZXMgYSBoYXJkY29kZWQgY29uc3RhbnQgaW5zdGVhZCBvZiBh
IHByb2dyYW1tYXRpYyBtZXRob2QsCj4gPiA+ID4gc28gdGhhdCBidWdzIHdoaWNoIGFmZmVjdCB0
aGUgbWF4aW11bSBmaWxlIHNpemUgYXJlIG5vdCBtYXNrZWQuCj4gPiA+Cj4gPiA+IE5vdCB0byBt
ZW50aW9uIHRyeWluZyB0byBjcmVhdGUgYSBmaWxlIHdpdGggMSwwNTcsMDUzLDQzOSBibG9ja3MK
PiA+ID4gYWxsb2NhdGVkIHRvIGl0IHdvdWxkIHByb2JhYmx5IHRha2UgZm9yZXZlci4KPiA+ID4K
PiA+ID4gSGFuZyBvbiwgd2UncmUgdGFsa2luZyBhYm91dCBpYmxvY2tzIChha2EgdGhlIG51bWJl
ciBvZiBibG9ja3MgYWxsb2NhdGVkCj4gPiA+IHRvIHRoaXMgaW5vZGUpLCBub3QgdGhlIG1heGlt
dW0gZmlsZSBzaXplIGluIGJsb2NrcywgcmlnaHQ/Cj4gPiA+Cj4gPiA+IElmIHNvLCB0aGVuIG1h
eWJlIHRoaXMgZnVuY3Rpb24gYW5kIGl0cyBjb21tZW50cyBzaG91bGQKPiA+ID4gcy9ibG9ja3Mv
aWJsb2Nrcy8/ICBPciBhbSBJIGNvbmZ1c2VkPyA7KQo+ID4gPgo+ID4gPiAtLUQKPiA+IAo+ID4g
SWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgZ2VuZXJpYy83MzUgY3JlYXRlcyBhIGxhcmdlIGxv
Z2ljYWwgZmlsZSwgYnV0Cj4gPiB0aGUgYWN0dWFsIHBoeXNpY2FsIGJsb2NrIGFsbG9jYXRpb24g
aXMgbXVjaCBzbWFsbGVyLiBBbHNvLCB0aGUgRjJGUwo+ID4gbGltaXRhdGlvbiBpcyBhYm91dCBo
b3cgbWFueSBibG9ja3MgdGhlIGlub2RlIGNhbiBhZGRyZXNzLCBubyBtYXR0ZXIgaWYKPiA+IHRo
ZSBibG9ja3MgYXJlIGFjdHVhbGx5IGFsbG9jYXRlZC4KPiA+IAo+ID4gU28gSSBiZWxpZXZlIHRo
ZSByZXF1aXJlbWVudCBpcyBhYm91dCB0aGUgbWF4aW11bSBmaWxlIHNpemUgaW4gYmxvY2tzLAo+
ID4gbm90IHRoZSBudW1iZXIgb2YgYmxvY2tzIGFjdHVhbGx5IGFsbG9jYXRlZC4gRG9lcyBpdCBt
YWtlIHNlbnNlIHRvIGtlZXAKPiA+IHRoZSBuYW1lLCBvciBkbyB5b3UgdGhpbmsgYW5vdGhlciB0
ZXJtIHdvdWxkIGJlIGNsZWFyZXI/IEkgYXBwcmVjaWF0ZQo+ID4geW91ciB0aG91Z2h0cyBvbiB0
aGlzLgo+IAo+IEhpIERhcnJpY2ssCj4gCj4gSSB0aGluayBKb2FubmUncyBleHBsYW5hdGlvbiBt
YWtlcyBzZW5zZSwgaWYgeW91IGRvbid0IGhhdmUgbW9yZSByZXZpZXcgcG9pbnRzCj4gb24gaXQs
IEknbGwgbWVyZ2UgdGhpcyBwYXRjaC4KCkFncGd0aCwgSSBkaWRuJ3Qgbm90aWNlIHRoaXMgcmVw
bHkhICBNeSBhcG9sb2dpZXMhIDooCgpPaywgc2luY2UgdGhpcyBpcyBhIGxpbWl0IG9uIHRoZSBt
YXhpbXVtIGxvZ2ljYWwgZmlsZSBibG9jayBudW1iZXIsCl9yZXF1aXJlX21heF9maWxlX3Jhbmdl
X2Jsb2NrcywgcGVyaGFwcz8KCi0tRAoKPiAKPiBUaGFua3MsCj4gWm9ycm8KPiAKPiA+IAo+ID4g
QmVzdCByZWdhcmRzLAo+ID4gSm9hbm5lCj4gPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

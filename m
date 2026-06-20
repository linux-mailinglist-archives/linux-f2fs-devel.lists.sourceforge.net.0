Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bSaRBVlNNmoP9QYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2026 10:20:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B46A8913
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2026 10:20:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=LTXyrrh6;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fE28xSyL;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=AO6NMb3U;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=ZoPD1+il;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oD66iohxzYjDmF4Vv9JfeTs52Ewbu6kddNKX8vjlA+o=; b=LTXyrrh6i4BQlXsbsQTwtgxnXm
	CLALJHpcw0xrU3RYdkG6ma9bZtiWTGRvTgzfXukS+kEQw/zxvForcz6X8knnCwWDYxXLaGZZzckj3
	3jU6UEke6kcvzwkgJaI4jz2KIDzrGx/FzDaaHU+c8RZ8upv2rgh4pSVsX5ao3RlJJYY8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1waqwJ-0000mk-KO;
	Sat, 20 Jun 2026 08:20:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1waqw6-0000l5-Ud
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 08:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wfnnJE27fGIp8+gf7G6VDyHuf9cBMl3p2pt89jSm5MU=; b=fE28xSyLpetUrFuiGAR7PgGLaf
 9LEh8yv2PIYKznAZAx1bnaRM3lxi9rmK8KeclrovRBHqPnvsbjrvjlbhYdZcWyNjhIjPxr4M5uESd
 izBbuiBBt0B9SGSEMEC7+89EMiLOXsFfqWhp/6Cm9FIzBJLCZROpO6fE26CTmX61QZJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wfnnJE27fGIp8+gf7G6VDyHuf9cBMl3p2pt89jSm5MU=; b=AO6NMb3UvD/zwdVLhJ0sqaL9Jt
 QhFAsgzY1xdcId9LyfAMmlq8cMhwte3l8oTNvfUy/E7jyPzY/nWZO65brCQCSlkeItQf6nlqeTD4w
 xE5f/6XYJhI9mZfWQ0DDieUYFVTgxyA/hh9bAcUnwIE2wyaFEx2V/FVMsu9fGsTaVdCA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1waqw2-0001LO-GS for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 08:20:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E688600AE;
 Sat, 20 Jun 2026 08:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017551F000E9;
 Sat, 20 Jun 2026 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781943604;
 bh=wfnnJE27fGIp8+gf7G6VDyHuf9cBMl3p2pt89jSm5MU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ZoPD1+ilhlBkbXsV5IuWf9hP/lPNl7I0/8F0K7CS428v0IfTbGYvbrVuVTuexieeb
 fiRLxbP2krrkR7m6M9fnQlQlkfOS9tcR8KkBhg/gaqXbklNL+iMpvCsi9+WIp6y0oE
 fkUfEiatrnLTusajnHzvfG1OzxbnA7l8rhz/Blf2Jdbp2kZjgXOzIs1RLjTutOSV0x
 eymWcV+xIvkaYx6A7LjSAdDQvbQ6pFnZCQWQiBgzVHlk9gX3WQFQyVSkxLO9Kav44D
 Q6c59Ur3IuBhIeIIfqqV9FfmHaTUBHC89cNhaTJw62GCHtVbttS/NwtYxt6nLSuzg0
 Rkpyr5UoJmisw==
Date: Sat, 20 Jun 2026 10:19:58 +0200
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <ajZMRWUt3_6VSaIT@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260520123722.405752-4-aalbersh@kernel.org>
 <20260520190719.GB3424023@google.com>
 <CAOQ4uxh_hfiSwMw8ABhhrz7GguZWjHEiBmvb3eq16Wfqw0+ZrQ@mail.gmail.com>
 <20260619165448.GB3223@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260619165448.GB3223@sol>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-06-19 09:54:48, Eric Biggers wrote: > On Fri, Jun
 19, 2026 at 09:28:31AM +0200, Amir Goldstein wrote: > > On Wed, May 20, 2026
 at 9:07 PM Eric Biggers <ebiggers@kernel.org> wrote: > > > > > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1waqw2-0001LO-GS
Subject: Re: [f2fs-dev] [PATCH v10 03/22] ovl: use core fsverity ensure info
 interface
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: fsverity@lists.linux.dev, djwong@kernel.org,
 Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
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
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,vger.kernel.org,lists.sourceforge.net,lst.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aalbersh-thinkpadx1carbongen13.rmtcz.csb:mid,sashiko.dev:url,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 514B46A8913

T24gMjAyNi0wNi0xOSAwOTo1NDo0OCwgRXJpYyBCaWdnZXJzIHdyb3RlOgo+IE9uIEZyaSwgSnVu
IDE5LCAyMDI2IGF0IDA5OjI4OjMxQU0gKzAyMDAsIEFtaXIgR29sZHN0ZWluIHdyb3RlOgo+ID4g
T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgOTowN+KAr1BNIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgTWF5IDIwLCAyMDI2IGF0IDAy
OjM3OjAxUE0gKzAyMDAsIEFuZHJleSBBbGJlcnNodGV5biB3cm90ZToKPiA+ID4gPiBmc3Zlcml0
eSBub3cgZXhwb3NlcyBmc3Zlcml0eV9lbnN1cmVfdmVyaXR5X2luZm8oKSB3aGljaCBjb3VsZCBi
ZSB1c2VkCj4gPiA+ID4gaW5zdGVhZCBvZiBvcGVuaW5nIGZpbGUgdG8gZW5zdXJlIHRoYXQgZnN2
ZXJpdHkgaW5mbyBpcyBsb2FkZWQgYW5kCj4gPiA+ID4gYXR0YWNoZWQgdG8gaW5vZGUuCj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgQWxiZXJzaHRleW4gPGFhbGJlcnNoQGtl
cm5lbC5vcmc+Cj4gPiA+ID4gQWNrZWQtYnk6IEFtaXIgR29sZHN0ZWluIDxhbWlyNzNpbEBnbWFp
bC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGZzL292ZXJsYXlmcy91dGlsLmMgfCAxNCArKyst
LS0tLS0tLS0tLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gUmV2aWV3ZWQtYnk6IEVyaWMgQmlnZ2VycyA8ZWJpZ2dl
cnNAa2VybmVsLm9yZz4KPiA+ID4KPiA+ID4gSSdtIHN0aWxsIGNvbmZ1c2VkIGJ5IHRoZSBuZXcg
aW1wbGVtZW50YXRpb24gb2YgZnN2ZXJpdHlfYWN0aXZlKCkgdGhhdAo+ID4gPiBnb3QgaW50cm9k
dWNlZCBieSAiZnN2ZXJpdHk6IHVzZSBhIGhhc2h0YWJsZSB0byBmaW5kIHRoZSBmc3Zlcml0eV9p
bmZvIiwKPiA+ID4gdGhvdWdoLiAgSSBzaG91bGQgaGF2ZSBjYXVnaHQgdGhpcyBkdXJpbmcgcmV2
aWV3IG9mIHRoYXQgY29tbWl0LiAgRm9yCj4gPiA+IG9uZSBpdHMgY29tbWVudCBpcyBvdXRkYXRl
ZCwgYnV0IGFsc28gdGhlIG1lbW9yeSBiYXJyaWVyIHNlZW1zIHRvIGJlCj4gPiA+IHNwZWNpZmlj
IHRvIHRoZSBmc3Zlcml0eV9nZXRfaW5mbygpIGNhbGxlciBhbmQgcHJvYmFibHkgc2hvdWxkIGJl
IG1vdmVkCj4gPiA+IHRvIHRoZXJlLiAgQW55d2F5LCB0aGF0J3Mgbm90IGRpcmVjdGx5IHJlbGF0
ZWQgdG8gdGhpcyBwYXRjaC4KPiA+IAo+ID4gRXJpYywgQW5kcmV5LAo+ID4gCj4gPiBEaWQgeW91
IHNlZSB0aGUgU2FzaGlrbyByZXZpZXcgZm9yIHRoaXMgcGF0Y2ggYW5kIG90aGVycyBpbiB0aGlz
IHNlcmllcz8KPiA+IAo+ID4gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTIw
MTIzNzIyLjQwNTc1Mi0xLWFhbGJlcnNoJTQwa2VybmVsLm9yZwo+ID4gCj4gPiBJdCBhbm5vdGF0
ZWQgc29tZSByZXZpZXcgY29tbWVudHMgYXMgaGlnaCBhbmQgY3JpdGljYWwuCj4gPiBGb3IgdGhp
cyBwYXRjaCBpdCBpcyBhYm91dCBpbnRlcmFjdGlvbiB3aXRoIGZzY3J5cHQuCj4gPiAKPiA+IFBs
ZWFzZSB0YWtlIGEgbG9vayBhbmQgc2F5IGlmIHRoaXMgaXMgY29uY2VybmluZyBvciBmYWxzZSBw
b3NpdGl2ZS4KPiAKPiBZZXMsIHRoaXMgcGF0Y2ggaXMgYnJva2VuIGFuZCBzaG91bGQgYmUgZHJv
cHBlZC4gIEkgbmVlZCB0byByZW1lbWJlciB0bwo+IGxvb2sgYXQgdGhlIFNhc2hpa28gcmV2aWV3
cyBmb3Igb3RoZXIgcGVvcGxlJ3MgcGF0Y2hlcyBhbmQgbm90IGp1c3QKPiB0cnVzdCB0aGF0IHRo
ZSBzdWJtaXR0ZXIgd2lsbC4gIEZvcnR1bmF0ZWx5IHRoaXMgb25lIHdhc24ndCBhcHBsaWVkIHll
dC4KPiAKPiBJIHBvaW50ZWQgb3V0IHRoZSBISUdITUVNIHBlcmZvcm1hbmNlIGJ1ZyBpbgo+ICJm
c3Zlcml0eTogZ2VuZXJhdGUgYW5kIHN0b3JlIHplcm8tYmxvY2sgaGFzaCIgZWFybGllcgo+ICho
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIwMjYwNDAxMjIyNzE3LkdIMjQ2
NkBxdWFyay8pLiAgSQo+IGFzc3VtZSBpdCB3YXMgZGVjaWRlZCB0aGF0IG5vIG9uZSB3aWxsIGNh
cmUgYWJvdXQgdGhlIGNvbWJpbmF0aW9uIG9mIFhGUwo+ICYmIGZzdmVyaXR5ICYmIEhJR0hNRU0u
ICBCdXQgdGhlIFhGUyBmb2xrcyBzaG91bGQgZG91YmxlLWNoZWNrIHRoYXQuCj4gCj4gQW5kcmV5
LCBjb3VsZCB5b3UgY2hlY2sgdGhlIFNhc2hpa28gcmV2aWV3cyBmb3IgdGhlIG90aGVyIHBhdGNo
ZXMgdG9vPwoKU3VyZSwgSSB3aWxsIGdvIHRocm91Z2ggdGhlbQoKLS0gCi0gQW5kcmV5CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=

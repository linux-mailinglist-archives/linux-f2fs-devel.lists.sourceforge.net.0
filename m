Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YSw9GWW2L2rvEwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 10:23:01 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D10076847EE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 10:23:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=RuyIzj7u;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=mDYRgfe7;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=IR+2rowA;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="E/v9FV3P";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++3SP7XKhYXraOltS6rgq3cMIGVNJ54vzaxvMt5BipM=; b=RuyIzj7uUYDKlFO6sh8SIDbPNr
	kvonX3b40fGehjRxwBaV1y4XYO2J7IoUfNxn/c03hd8NAlHHse6B2uVSQ9Nc7mL5LMQ91xOvScrRA
	uAOWfNqbdZG6qvjyEkebN0Ka+d/PkaNGdXvKPV0icy6vRsmBd9jxyKbOZmX2pTE1VUBU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ2aq-000833-DX;
	Mon, 15 Jun 2026 08:22:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ2ao-00082w-Ch
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 08:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cNisCqsmRE0g3R98tB+voXcu0x16Y9JOfUCRBhHX4ew=; b=mDYRgfe78xuY2+1++gWQDBfsNm
 PmM+skS5mQBHVY6g3xhDzxLMFvCYEFG16AEHZs/apX6NgOe7A7EErvO0C9BICMxZNPVLoOaTr7xuk
 FkMLQff0SsqCb83rbQOBYlFs4STfkZzquV1ZB0gMUbUGLNVQO1YZEp638K912tDev6ss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cNisCqsmRE0g3R98tB+voXcu0x16Y9JOfUCRBhHX4ew=; b=IR+2rowAp/y1HA16sPxm+dv5lJ
 Umk5GCsdIJgNrZ5tRuM8lv+CqGybkL9UP+jVfqZB8/q1ayypN/n6zBGdIz9RVBzP+GQ8/Op9taMsj
 f9SSdkJf3vsp3ykaRRhuiO73CgTnDWd8XIhIVJm3QPHL6tO2Wt9zwZkHdX8lywGR5UAg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ2al-0001cG-Ub for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 08:22:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C5F806008A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 08:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91221F000E9;
 Mon, 15 Jun 2026 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781511757;
 bh=cNisCqsmRE0g3R98tB+voXcu0x16Y9JOfUCRBhHX4ew=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=E/v9FV3PWo/UNvZ38EJl02rsd/op9OXbaoBH9VbUpJPhWECZet539Z9GZHUurVAgK
 nXI39ZYmlS+WfhTVteDvB1MTtzDBR8lU9bSnIp1epfkvpakXhAqEuAev1tE4sLtcx1
 oN/MpXntdB/wMk7NST2oE207P/+D+82tYPgMZNU2S+v4TGP0JbCWlUE4YY7bd3ZN5d
 nAVipk26W1lLxQq4JxYcK5Mp5k9eP68S7ac/u2P4zCMSzgZcs+FBWs+5tiUmkwE0Ua
 hc+xCxUQt/XvxI1rkKwdB/i30cJcrUmfPcK3d5odYCD1nE0HZM/4RXclia9qaFbBWp
 ez81zPUP3o1Wg==
Message-ID: <b32998c0-17e3-4b81-a474-4a408aa7fa32@kernel.org>
Date: Mon, 15 Jun 2026 16:22:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: fstests@vger.kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260612005802.3017709-1-chao@kernel.org>
 <ai7YFkAK8sBL4jXm@zlang-mailbox>
Content-Language: en-US
In-Reply-To: <ai7YFkAK8sBL4jXm@zlang-mailbox>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/26 01:16, Zorro Lang wrote: > On Fri, Jun 12, 2026
 at 12:58:02AM +0000, Chao Yu wrote: >> Without commit 520760b9f915 ("f2fs:
 optimize representative type determination >> in GC"), f2fs GC wil [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZ2al-0001cG-Ub
Subject: Re: [f2fs-dev] [PATCH] f2fs/025: test to do sanity check section
 type correctly in f2fs GC
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:fstests@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D10076847EE

T24gNi8xNS8yNiAwMToxNiwgWm9ycm8gTGFuZyB3cm90ZToKPiBPbiBGcmksIEp1biAxMiwgMjAy
NiBhdCAxMjo1ODowMkFNICswMDAwLCBDaGFvIFl1IHdyb3RlOgo+PiBXaXRob3V0IGNvbW1pdCA1
MjA3NjBiOWY5MTUgKCJmMmZzOiBvcHRpbWl6ZSByZXByZXNlbnRhdGl2ZSB0eXBlIGRldGVybWlu
YXRpb24KPj4gaW4gR0MiKSwgZjJmcyBHQyB3aWxsIHJlcG9ydCBpbmNvbnNpc3RlbnQgc2VnbWVu
dCB0eXBlIGluIGxhcmdlIHNlY3Rpb24gaXNzdWUsCj4+IGFuZCB0aGVuIGl0IHdpbGwgZm9yY2Ug
dG8gc2h1dGRvd24gZmlsZXN5c3RlbS4KPj4KPj4gWyAgNzY4LjE5MDkwM10gRjJGUy1mcyAobG9v
cDUxKTogSW5jb25zaXN0ZW50IHNlZ21lbnQgKDMpIHR5cGUgWzEsIDBdIGluIFNJVCBhbmQgU1NB
Cj4+Cj4+IFRoZSByZWFzb24gaXMgZjJmcyBrZXJuZWwgd2lsbCBhc3N1bWUgYWxsIHNlZ21lbnQg
dHlwZSBpbnNpZGUgbGFyZ2Ugc2VjdGlvbiBpcwo+PiB0aGUgc2FtZSwgZHVyaW5nIEdDIGl0IGxv
YWRzIHR5cGUgZnJvbSBvbmUgc2VnbWVudCBhbmQgY29tcGFyZSBpdCB0byBvdGhlcgo+PiBzZWdt
ZW50cycgdHlwZSwgaG93ZXZlciBkdWUgdG8gcmVjb3ZlcnkgZmxvdywgdGhlIGNob3NlbiBzZWdt
ZW50IG1heSBoYXMgemVybwo+PiB2YWxpZCBibG9ja3Mgdy8gZGlmZmVyZW50IHNlZ21lbnQgdHlw
ZSwgc2luY2UgdGhlIHNlZ21lbnQgaXMgaW52YWxpZChmcmVlKSBvbmUsCj4+IGl0IHdpbGwgbmV2
ZXIgYmUgbWlncmF0ZWQsIHNvIHRoYXQgd2Ugc2hvdWxkIG5vdCB0cmVhdCBzdWNoIHN0YXRlIGFz
IGFibm9ybWFsCj4+IGNvbmRpdGlvbi4KPj4KPj4gVGhpcyB0ZXN0Y2FzZSBpcyBjcmVhdGVkIHRv
IHNpbXVsYXRlIGFib3ZlIGNvbmRpdGlvbiB0byBzZWUgd2hldGhlciBmMmZzIGtlcm5lbAo+PiBt
b2R1bGUgY2FuIGhhbmRsZSBpdCBjb3JyZWN0bHkKPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZ
dSA8Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0KPj4gdjI6Cj4+IC0gY2xlYXIgTUtGU19PUFRJT05T
IGFuZCBNT1VOVF9PUFRJT05TIHRvIGd1YXJhbnRlZSBibG9jayBhbGxvY2F0aW9uIGlzIGFzIGV4
cGVjdGVkLgo+IAo+IEhpIENoYW8sCj4gCj4gU29ycnksIEkganVzdCBub3RpY2VkIHlvdXIgcmVw
bHkgdG8gbXkgcmV2aWV3IG9uIHRoZSBwcmV2aW91cyBwYXRjaCB2ZXJzaW9uLgo+IER1ZSB0byBz
b21lIHVuZXhwZWN0ZWQgc2hha2UtdXBzIHJlY2VudGx5LCBJ4oCZdmUgYmVlbiBib2dnZWQgZG93
biB3aXRoIHNldHRpbmcKPiB1cCBhbmQgbW9kaWZ5aW5nIHZhcmlvdXMgbmV3IHN5c3RlbSBlbnZp
cm9ubWVudHMsIGFuZCBJIGFjY2lkZW50YWxseSBtYXJrZWQKPiBzb21lIHVucmVhZCBlbWFpbHMg
YXMgcmVhZC4KCk5vIHdvcnJpZXMuIDopCgo+IAo+IFRoZSBwYXRjaCBsb29rcyBnb29kIHRvIG1l
LCB3aXRoIGp1c3QgYSBmZXcgcGlja3kgcmV2aWV3IHBvaW50cyBiZWxvdzoKClRoYW5rcyBab3Jy
byBmb3IgdGFraW5nIGEgbG9vay4KCj4gCj4+ICB0ZXN0cy9mMmZzLzAyNSAgICAgfCA5MiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICB0ZXN0cy9mMmZz
LzAyNS5vdXQgfCAgMiArCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDk0IGluc2VydGlvbnMoKykKPj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9mMmZzLzAyNQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHRlc3RzL2YyZnMvMDI1Lm91dAo+Pgo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvZjJmcy8wMjUgYi90
ZXN0cy9mMmZzLzAyNQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAu
LjM5N2U1NDM5YQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3Rlc3RzL2YyZnMvMDI1Cj4+IEBA
IC0wLDAgKzEsOTIgQEAKPj4gKyMhIC9iaW4vYmFzaAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMAo+PiArIyBDb3B5cmlnaHQgKGMpIDIwMjYgQ2hhbyBZdSA8Y2hhb0BrZXJu
ZWwub3JnPgo+PiArIwo+PiArIyBGUyBRQSBUZXN0IE5vLiBmMmZzLzAyNQo+PiArIwo+PiArIyBD
aGVjayB3aGV0aGVyIGYyZnMgd2lsbCBlbmNvdW50ZXIgY3BfZXJyb3IgKEluY29uc2lzdGVudCBz
ZWdtZW50IHR5cGUpCj4+ICsjIHdoZW4gZG9pbmcgc2FuaXR5IGNoZWNrIG9uIHR5cGUgb2Ygc2Vn
bWVudHMgaW5zaWRlIGxhcmdlIHNlY3Rpb24gZHVyaW5nCj4+ICsjIGdhcmJhZ2UgY29sbGVjdGlv
bi4KPj4gKyMKPj4gKy4gLi9jb21tb24vcHJlYW1ibGUKPj4gK19iZWdpbl9mc3Rlc3QgYXV0byBx
dWljawo+PiArCj4+ICtfZml4ZWRfYnlfa2VybmVsX2NvbW1pdCA1MjA3NjBiOWY5MTUgXAo+PiAr
CSJmMmZzOiBvcHRpbWl6ZSByZXByZXNlbnRhdGl2ZSB0eXBlIGRldGVybWluYXRpb24gaW4gR0Mi
Cj4+ICsKPj4gKy4gLi9jb21tb24vZmlsdGVyCj4+ICsKPj4gK19jbGVhbnVwKCkKPj4gK3sKPj4g
KwljZCAvCj4+ICsJcm0gLXIgLWYgJHRtcC4qCj4+ICt9Cj4gCj4gVGhpcyBfY2xlYW51cCgpIGZ1
bmN0aW9uIGlzIHNhbWUgYXMgZGVmYXVsdC4gSXQgY2FuIGJlIHJlbW92ZWQuCgpXaWxsIHJlbW92
ZS4KCj4gCj4+ICsKPj4gK19yZXF1aXJlX3NjcmF0Y2gKPj4gK19yZXF1aXJlX3hmc19pb19jb21t
YW5kICJwd3JpdGUiCj4+ICtfcmVxdWlyZV94ZnNfaW9fY29tbWFuZCAidHJ1bmNhdGUiCj4+ICtf
cmVxdWlyZV9jb21tYW5kICIkRjJGU19JT19QUk9HIiBmMmZzX2lvCj4+ICtfcmVxdWlyZV9jaGVj
a19kbWVzZwo+PiArCj4+ICsjIENsZWFyIG9wdGlvbnMgdG8gYXZvaWQgaW50ZXJmZXJlbmNlIGZy
b20gZXh0ZXJuYWwgY29uZmlndXJhdGlvbnMKPj4gK2V4cG9ydCBNS0ZTX09QVElPTlM9IiIKPj4g
K2V4cG9ydCBNT1VOVF9PUFRJT05TPSIiCj4+ICsKPj4gKyMgRm9ybWF0IHdpdGggOTZNQiBzaXpl
IGFuZCAyIHNlZ21lbnRzIHBlciBzZWN0aW9uCj4+ICtfc2NyYXRjaF9ta2ZzX3NpemVkICQoKDk2
ICogMTAyNCAqIDEwMjQpKSAiIiAiLXMgMiIgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPj4gKwo+PiAr
IyBNb3VudCB3aXRoIG1vZGU9bGZzCj4+ICtfc2NyYXRjaF9tb3VudCAtbyBtb2RlPWxmcyA+PiAk
c2VxcmVzLmZ1bGwgMj4mMQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5e
Xl5eXl5eXl5eXl5eCj4gSXQncyBoZWxwbGVzcywgZHVlIHRvIGlmIF9zY3JhdGNoX21vdW50IGZh
aWxzLCBpdCBleGl0KCkgZGlyZWN0bHkuCgpSaWdodCwgd2lsbCBmaXguCgo+IAo+PiArCj4+ICsj
IENyZWF0ZSBmaWxlcyB0byBmaWxsIHdob2xlIGZpbGVzeXN0ZW0sIHRoZW4gc2VnbWVudCB0eXBl
IHdpbGwgYmUgY2hhbmdlZCB0byBub2RlIHR5cGUKPj4gK2ZvciAoKGk9MDtpPDUxMjA7aSsrKSkg
ZG8KPj4gKwl0b3VjaCAkU0NSQVRDSF9NTlQvJGkgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPj4gK2Rv
bmUKPj4gK3N5bmMKPj4gKwo+PiArIyBSZW1vdmUgYWxsIGZpbGVzIHRvIGNyZWF0ZSBmcmVlKGVt
cHR5KSBub2RlIHNlZ21lbnRzCj4+ICtybSAtZiAkU0NSQVRDSF9NTlQvKgo+PiArc3luYwo+PiAr
Cj4+ICsjIEFsbG9jYXRlIGZyZWUgc3BhY2Ugc28gdGhhdCB3ZSBoYXZlIGNoYW5jZSB0byByZXVz
ZSBmcmVlKGVtcHR5KSBub2RlIHNlZ21lbnRzCj4+ICskWEZTX0lPX1BST0cgLWYgLWMgInB3cml0
ZSAtYiA0ayAwIDE5MjhrIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+
PiArc3luYwo+PiArCj4+ICskWEZTX0lPX1BST0cgLWMgInRydW5jYXRlIDAiICRTQ1JBVENIX01O
VC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4+ICskWEZTX0lPX1BST0cgLWQgLWMgInB3cml0
ZSAtYiA0ayAwIDE2TSIgJFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPj4g
KyRYRlNfSU9fUFJPRyAtYyAidHJ1bmNhdGUgMCIgJFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNlcXJl
cy5mdWxsIDI+JjEKPj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAicHdyaXRlIC1iIDRrIDAgMTZNIiAk
U0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+PiArJFhGU19JT19QUk9HIC1j
ICJ0cnVuY2F0ZSAwIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+PiAr
c3luYwo+PiArCj4+ICskWEZTX0lPX1BST0cgLWQgLWMgInB3cml0ZSAtYiA0ayAwIDhNIiAkU0NS
QVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+PiArJFhGU19JT19QUk9HIC1jICJ0
cnVuY2F0ZSAwIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+PiArJFhG
U19JT19QUk9HIC1kIC1jICJwd3JpdGUgLWIgNGsgMCAzMksiICRTQ1JBVENIX01OVC9maWxlID4+
ICRzZXFyZXMuZnVsbCAyPiYxCj4+ICskWEZTX0lPX1BST0cgLWMgInRydW5jYXRlIDAiICRTQ1JB
VENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4+ICskWEZTX0lPX1BST0cgLWQgLWMg
InB3cml0ZSAtYiA0ayAwIDJNIiAtYyAiZnN5bmMiICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFy
ZXMuZnVsbCAyPiYxCj4+ICsKPj4gKyMgU2h1dGRvd24gdGhlIGZpbGVzeXN0ZW0gd2l0aG91dCBj
aGVja3BvaW50Cj4+ICskRjJGU19JT19QUk9HIHNodXRkb3duIDIgJFNDUkFUQ0hfTU5UID4+ICRz
ZXFyZXMuZnVsbCAyPiYxCj4gCj4gSSdtIHdvbmRlcmluZyBpZiB3ZSBjYW4gaGF2ZSBmMmZzIHN1
cHBvcnRpbmcgaW4gY29tbW9uIF9zY3JhdGNoX3NodXRkb3duCj4gaGVscGVyIDopCgpJIHRoaW5r
IHdlIGNhbiBjaGFuZ2UgZjJmcyB0ZXN0Y2FzZSB0byB1c2UgX3NjcmF0Y2hfc2h1dGRvd24gYmVj
YXVzZSB0aGUgZGVmaW5pdGlvbiBvZgpub2xvZ2ZsdXNoIHNodXRkb3duIGludGVyZmFjZSBpcyB0
aGUgc2FtZSBhcyB4ZnMnOgoKLyoKICogc2hvdWxkIGJlIHNhbWUgYXMgWEZTX0lPQ19HT0lOR0RP
V04uCiAqIEZsYWdzIGZvciBnb2luZyBkb3duIG9wZXJhdGlvbiB1c2VkIGJ5IEZTX0lPQ19HT0lO
R0RPV04KICovCiNkZWZpbmUgRjJGU19JT0NfU0hVVERPV04JX0lPUignWCcsIDEyNSwgX191MzIp
CS8qIFNodXRkb3duICovCiNkZWZpbmUgRjJGU19HT0lOR19ET1dOX05PU1lOQwkJMHgyCS8qIGdv
aW5nIGRvd24gKi8KCiNkZWZpbmUgWEZTX0lPQ19HT0lOR0RPV04JICAgICBfSU9SICgnWCcsIDEy
NSwgdWludDMyX3QpCiNkZWZpbmUgWEZTX0ZTT1BfR09JTkdfRkxBR1NfTk9MT0dGTFVTSAkJMHgy
CS8qIGRvbid0IGZsdXNoIGxvZyBub3IgZGF0YSAqLwoKPiAKPj4gKwo+PiArX3NjcmF0Y2hfdW5t
b3VudCA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5e
Xl5eXl5eXl5eXl4KPiAKPiBJZiB1bm1vdW50IGZhaWxzLCBob3cgYWJvdXQgbGV0IGl0IG91dHB1
dCB0aGUgZXJyb3JzLCB0byBicmVhayB0aGUgZ29sZGVuIGltYWdlPwoKWWVzLCBpdCdzIGJldHRl
ci4KCj4gCj4+ICsKPj4gK19zY3JhdGNoX21vdW50IC1vIG1vZGU9bGZzID4+ICRzZXFyZXMuZnVs
bCAyPiYxCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5e
Xl4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZWxwbGVzcwoKV2lsbCBmaXguCgo+
IAo+PiArCj4+ICsjIFJ1biB1cmdlbnRfZ2MgbW9kZSB0byB0cmlnZ2VyIGdhcmJhZ2UgY29sbGVj
dGlvbgo+PiArZGV2X25hbWU9JChfc2hvcnRfZGV2ICRTQ1JBVENIX0RFVikKPj4gK2lmIFsgLWYg
L3N5cy9mcy9mMmZzLyRkZXZfbmFtZS9nY191cmdlbnQgXTsgdGhlbgo+PiArCWVjaG8gMSA+IC9z
eXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50Cj4+ICtmaQo+IAo+IEhtbS4uLiB3aGF0IGlm
IHRoZXJlJ3Mgbm90IC9zeXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50PyBEb2VzIGl0Cj4g
YWZmZWN0IHRoZSB0ZXN0IHJlc3VsdD8KPiAKPiBJZiBpdCBkb2VzLCB0aGlzJ3MgYSBuZWNlc3Nh
cnkgcmVxdWlyZW1lbnQgZm9yIHRoaXMgdGVzdCwgd2Ugc2hvdWxkbid0Cj4gaWdub3JlIGl0IGFu
ZCBrZWVwIHJ1bm5pbmcuIERvZXMgJEYyRlNfSU9fUFJPRyBwcm92aWRlIGEgY29tbWFuZCB0bwo+
IG1ha2UgYSBmb3JjZSBHQz8gT3Igd2UgbmVlZCB0byBjaGVjayB0aGlzIGZpbGUgYW5kIF9ub3Ry
dW4gaWYgaXQncwo+IG5vdCBleGlzdGVkLgoKQWgsIHJpZ2h0LCB0aGF0J3MgZ29vZCBwb2ludCEK
CldlIGNhbiB1c2UgIiRGMkZTX0lPX1BST0cgZ2NfdXJnZW50IDxkZXZfbmFtZT4gcnVuIDUiIGlu
c3RlYWQsIGl0IHdpbGwgZG8gYmVsb3cgY29tbWFuZHM6CjEuIGVjaG8gMSA+IC9zeXMvZnMvZjJm
cy8kZGV2X25hbWUvZ2NfdXJnZW50CjIuIHNsZWVwIDUgc2Vjb25kcwozLiBlY2hvIDAgPiAvc3lz
L2ZzL2YyZnMvJGRldl9uYW1lL2djX3VyZ2VudAoKPiAKPj4gKwo+PiArIyBXYWl0IGJhY2tncm91
bmQgR0MgdGhyZWFkIHRvIHdha2UgdXAgdG8gcnVuIGFuZCBwb3RlbnRpYWxseSBlbmNvdW50ZXIg
dGhlIGluY29uc2lzdGVuY3kKPj4gK3NsZWVwIDUKPiAKPiBEb2VzIHRoaXMgc2xlZXAgdHJ5IHRv
IHdhaXQgYWJvdmUgImVjaG8gMSA+IC9zeXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50Ij8K
PiBJZiBzbywgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byBtb3ZlIGl0IGludG8gdGhlICJpZi10aGVu
IiBsb2dpYy4KPiAKPj4gKwo+PiArX3NjcmF0Y2hfdW5tb3VudCA+PiAkc2VxcmVzLmZ1bGwgMj4m
MQo+ICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl4KPiBTYW1lIGFzIGFi
b3ZlLgoKV2lsbCBmaXguCgo+IAo+PiArCj4+ICsjIENoZWNrIHdoZXRoZXIgdGhlIGRtZXNnIGhh
cyB0aGUgd2FybmluZyBpbmRpY2F0aW5nIHRoZSBidWcKPj4gK19jaGVja19kbWVzZ19mb3IgIkYy
RlMtZnMgXCgkZGV2X25hbWVcKTogSW5jb25zaXN0ZW50IHNlZ21lbnQiICYmIFwKPj4gKwlfZmFp
bCAiRjJGUy1mcyAoJGRldl9uYW1lKTogSW5jb25zaXN0ZW50IHNlZ21lbnQgdHlwZSBkZXRlY3Rl
ZCBpbiBkbWVzZyEiCj4+ICsKPj4gK2VjaG8gIlNpbGVuY2UgaXMgZ29sZGVuIgo+PiArc3RhdHVz
PTAKPj4gK2V4aXQKPiAKPiBXZSd2ZSByZXBsYWNlZCAic3RhdHVzPTA7ZXhpdDsiIHdpdGggIl9l
eGl0IDAiLgoKV2lsbCBmaXguCgpUaGFua3MsCgo+IAo+IFRoYW5rcywKPiBab3Jybwo+IAo+PiBk
aWZmIC0tZ2l0IGEvdGVzdHMvZjJmcy8wMjUub3V0IGIvdGVzdHMvZjJmcy8wMjUub3V0Cj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMC4uM2Q3MDk1MWVmCj4+IC0tLSAv
ZGV2L251bGwKPj4gKysrIGIvdGVzdHMvZjJmcy8wMjUub3V0Cj4+IEBAIC0wLDAgKzEsMiBAQAo+
PiArUUEgb3V0cHV0IGNyZWF0ZWQgYnkgMDI1Cj4+ICtTaWxlbmNlIGlzIGdvbGRlbgo+PiAtLSAK
Pj4gMi40OS4wCj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

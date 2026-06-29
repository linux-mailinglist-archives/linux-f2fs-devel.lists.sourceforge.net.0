Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WlBOHubMQWpgugkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 03:39:50 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F766D56B2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 03:39:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=YHcsu0ZS;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Dq6NMbcQ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=kDZTxpYo;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=TSFcF4+B;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4JGLyYukg+CYE9lhWq1vvIOytLsqDk7dlzlC7QC+x8=; b=YHcsu0ZSNFXZbRcuQS6eviaE3V
	nOGCSZQBqW0wqZTylBaG3yX4oGeXUd/JmEAp/pepi31sPfeAdmgu2VO1xCT5Hh0oaYJbRWG5QuW7/
	fmpQsptMI8FKBf4S4f3IHnD5M9X2lvuRvKpnp/m5gWTUdYQPeP+r+K6L7jwhIxGqizck=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1we0yG-0005pe-5T;
	Mon, 29 Jun 2026 01:39:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1we0yE-0005pY-Dm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 01:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dMdct9aQJb9BItRQhV/RF3zO0RCgA0pPLsTstY+EfCg=; b=Dq6NMbcQcgzcKfTSXaoA7Q00OW
 5gm0DwDRv7g/GrcZV0+a/m61aDgNTSS5wrVE+atZARRDUeB8iyw9UV02A6RB3oVZAcMA5KptPbnIl
 o7AUQdlvlQMiqxRXrJE/EmhA6y4yT7uz5zaOMcFSxdTqJoe4BI/zLUJDfUp5gSadtsMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dMdct9aQJb9BItRQhV/RF3zO0RCgA0pPLsTstY+EfCg=; b=kDZTxpYo/alYQnNOkgrS8hFKfp
 ZFO4+Qp7Oislxds223Wx4WEWUQ1i4FnVCva5RKznzb0xokZDbqEarkrVwrlYguAYngcRnVh6659Au
 V8VeLjkZ3Rz+6OLrAYIJB607ONgZpoAWMCh1ns5qM6TFKp/7Gqap5kfakiIi190me01c=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1we0yE-0006b6-5I for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 01:39:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 461D24025C;
 Mon, 29 Jun 2026 01:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E22A1F000E9;
 Mon, 29 Jun 2026 01:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782697169;
 bh=dMdct9aQJb9BItRQhV/RF3zO0RCgA0pPLsTstY+EfCg=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To;
 b=TSFcF4+BwKqKnB35CuNd1uox485nZDM/l/+cL2PVS5uo+oGnaiunww+ZUXQmpwy1Y
 elw210wvfADzdL8Z69KJHGm9Vfsj8wG0NGX0UpG7AN+HDElWLYlb57suFgF4InkApF
 hNTIDcX/XwFVhjX2134ZSmV2McN5ZbhO73pS1E1OvfS8Aiuh9xYG6Pk35ZT0jxTj5D
 EhiGTUCm0w1nlHojt/no/NArurKn6fLa7fuZ5S8rdMHPRUlG+TRM+0JhZQLXSc6I4r
 NwoKW7LRIFobOfZ7VDWyDevb2ZWsffmdrUDAbTBvt7t+efLGv7UxVCxsFFQv97L0ZA
 b+qIAyCrnc0XA==
Message-ID: <324cc5b6-ebfd-4696-b2f4-33710b771249@kernel.org>
Date: Mon, 29 Jun 2026 09:39:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>
References: <ajwtQRawMxcQkyo8@casper.infradead.org>
 <ca56ceb7-b0a7-41f2-9b26-085e81456794@amlogic.com>
Content-Language: en-US
In-Reply-To: <ca56ceb7-b0a7-41f2-9b26-085e81456794@amlogic.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/26/26 17:30, Jiucheng Xu wrote: > > > On 6/25/2026 3:17
 AM, Matthew Wilcox wrote: >> [ EXTERNAL EMAIL ] >> >> Hi Jiucheng, >> >>
 I am trying to remove FGP_NOFS from the kernel and the last remain [...] 
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
X-Headers-End: 1we0yE-0006b6-5I
Subject: Re: [f2fs-dev] Use of FGP_NOFS in f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
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
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97F766D56B2

T24gNi8yNi8yNiAxNzozMCwgSml1Y2hlbmcgWHUgd3JvdGU6Cj4gCj4gCj4gT24gNi8yNS8yMDI2
IDM6MTcgQU0sIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4K
Pj4gSGkgSml1Y2hlbmcsCj4+Cj4+IEkgYW0gdHJ5aW5nIHRvIHJlbW92ZSBGR1BfTk9GUyBmcm9t
IHRoZSBrZXJuZWwgYW5kIHRoZSBsYXN0IHJlbWFpbmluZwo+PiB1c2VyIHdhcyBhZGRlZCBieSB5
b3UgbGFzdCB5ZWFyIGluIGNvbW1pdCAyMzA4ZGUyN2MwM2QuwqAgSSdtIHRyeWluZyB0bwo+PiB1
bmRlcnN0YW5kIHdoeS7CoCBEaWQgeW91IHNlZSBhbiBhY3R1YWwgcHJvYmxlbSBpZiB5b3UgZG8g
bm90IHVzZSBpdCwKPj4gb3Igd2FzIGl0IHRoZW9yZXRpY2FsP8KgIFRoZSBjb21taXQgbWVzc2Fn
ZSBzYXlzICJ0byBhdm9pZCBwb3RlbnRpYWwKPj4gZGVhZGxvY2sgaXNzdWVzIiwgYnV0IGl0J3Mg
bm90IGNsZWFyIHRvIG1lIHdoZXRoZXIgeW91IGtub3cgdGhleSBhcmUKPj4gdGhlcmUsIG9yIG9u
bHkgdGhpbmsgdGhleSBhcmUgdGhlcmUuCj4+Cj4+IEknZCByZWFsbHkgbGlrZSB0byB1bmRlcnN0
YW5kIHdoYXQgdGhlIGlzc3VlcyBhcmUgYXMgdGhlIG5vcm1hbCBpc3N1ZXMKPj4gd2hpY2ggbWFr
ZSBjYWxsaW5nIGludG8gdGhlIGZpbGVzeXN0ZW0gKGhvbGRpbmcgYW5vdGhlciBmb2xpbyBsb2Nr
ZWQsCj4+IGhvbGRpbmcgYSBtdXRleCByZWxpZWQgdXBvbiBieSByZWNsYWltKSBkb24ndCBzZWVt
IHRvIGJlIHByZXNlbnQuCj4+IFNvIGlmIHRoZXJlIGlzIHNvbWV0aGluZywgSSdtIG5vdCBzdXJl
IHdoYXQgaXQgaXMuCj4gSGkgTWF0dGhldywKPiAKPiBUaGUgRkdQX05PRlMgZmxhZyB3YXMgc3Vn
Z2VzdGVkIGJ5IENoYW8gYW5kIG5vdCBhZGRpbmcgaXQgbWlnaHQgbGVhZCB0byBkZWFkbG9jayBp
c3N1ZXMuCj4gCj4gQENoYW8gY291bGQgeW91IGV4cGxhaW4gdGhpcyBmb3IgTWF0dGhldz8KCkhp
IE1hdHRoZXcsIEppdWNoZW5nLAoKSUlSQywgZm9yIG5vcm1hbCBwYXRoIGZyb20gd3JpdGUgLT4g
d3JpdGVfYmVnaW4sIGl0IHNlZW1zIGZpbmUgc2luY2UgdGhlcmUgaXMKbm8gZjJmcy1zcGVjaWZp
ZWQgbXV0ZXggb3Igb3RoZXIgZm9saW8gbG9jayBpbiB0aGUgcGF0aCwgYnV0IEkgd2FzIHdvcnJp
ZWQgYWJvdXQKcXVvdGEgcGF0aCB3aGVuIEkgc3VnZ2VzdGVkIHRvIGtlZXAgR0ZQX05PRlMgZmxh
ZywgYXMgdGhlIGxvY2sgcmFjZSBjb25kaXRpb24KaXMgcXVpdGUgY29tcGxpY2F0ZWQgdGhlcmU6
IGYyZnMgaW50ZXJuYWwgbG9jayB2cyBxdW90YSBzeXN0ZW0gbG9jayB2cyBmb2xpbyBsb2NrLi4u
CgpJIHNlYXJjaGVkIHRoZSBjb21taXRzIGFuZCBmb3VuZCB0aGlzOgoKQ29tbWl0IDAyMTE3Yjhh
ZTljMCAoImYyZnM6IFNldCBHRl9OT0ZTIGluIHJlYWRfY2FjaGVfcGFnZV9nZnAgd2hpbGUgZG9p
bmcKZjJmc19xdW90YV9yZWFkIikKCkluIHRoaXMgY2FzZSwgZjJmc19xdW90YV9yZWFkKCkgd2Fz
IGNhbGxpbmcgcmVhZF9tYXBwaW5nX3BhZ2UoKSwgd2hpY2ggYWxsb3dlZApHRlBfRlMgYWxsb2Nh
dGlvbnMuIFRoaXMgdHJpZ2dlcmVkIHRoZSBmb2xsb3dpbmcgZGVhZGxvY2s6CgogICAgIFRocmVh
ZCAxIChVc2VyIE9wZW4vV3JpdGUpCiAgICAgLSBkb19zeXNfb3BlbgogICAgICAtIHZmc19vcGVu
CiAgICAgICAtIGRxdW90X2ZpbGVfb3BlbgogICAgICAgIC0gZHF1b3RfaW5pdGlhbGl6ZQogICAg
ICAgICAtIGRxZ2V0CiAgICAgICAgICAtIGRxdW90X2FjcXVpcmUKICAgICAgICAgICA6IGxvY2tz
ICZkcW9wdC0+ZHFpb19tdXRleCAoVkZTIFF1b3RhIE11dGV4KQogICAgICAgICAgIC0gcXRyZWVf
cmVhZF9kcXVvdAogICAgICAgICAgICAtIGYyZnNfcXVvdGFfcmVhZAogICAgICAgICAgICAgLSBy
ZWFkX21hcHBpbmdfcGFnZSAoR0ZQX0tFUk5FTCAvIGFsbG93cyBHRlBfRlMpCiAgICAgICAgICAg
ICAgLSBfX2FsbG9jX3BhZ2VzX25vZGVtYXNrCiAgICAgICAgICAgICAgIC0gdHJ5X3RvX2ZyZWVf
cGFnZXMgKERpcmVjdCBSZWNsYWltKQogICAgICAgICAgICAgICAgLSBwcnVuZV9pY2FjaGVfc2IK
ICAgICAgICAgICAgICAgICAtIGV2aWN0CiAgICAgICAgICAgICAgICAgIC0gZjJmc19ldmljdF9p
bm9kZQogICAgICAgICAgICAgICAgICAgLSBkcXVvdF9kcm9wCiAgICAgICAgICAgICAgICAgICAg
LSBkcXB1dAogICAgICAgICAgICAgICAgICAgICAtIGRxdW90X2NvbW1pdAogICAgICAgICAgICAg
ICAgICAgICAgOiB0cmllcyB0byBsb2NrICZkcW9wdC0+ZHFpb19tdXRleCBhZ2FpbgogICAgICAg
ICAgICAgICAgICAgICAgPT0+IERFQURMT0NLICh3YWl0aW5nIGZvciBpdHNlbGYpCgpJdCBtYXkg
dHJpZ2dlciBkZWFkbG9jayBpbiBmMmZzX3F1b3RhX3dyaXRlKCkgYXMgdGhlIHNhbWUgd2F5IGlu
IGYyZnNfcXVvdGFfcmVhZCgpCnBhdGg/IGxldCBtZSBrbm93IGlmIEknbSBtaXNzaW5nIGFueXRo
aW5nLgoKQXJlIG1lbWFsbG9jX25vZnNfc2F2ZSgpIGFuZCBtZW1hbGxvY19ub2ZzX3Jlc3RvcmUo
KSByZWNvbW1lbmRlZCBmb3Igc3VjaCBjYXNlPwphbnkgc3VnZ2VzdGlvbnM/CgpUaGFua3MsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=

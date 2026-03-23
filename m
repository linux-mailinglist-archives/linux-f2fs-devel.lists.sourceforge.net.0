Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M7IGzQywWm7RQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 13:29:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E02F1EBF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 13:29:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQs+C3xmBRFIbwe8QM0pBOjLhhLtVxsZejwW1AWWUu8=; b=JrlCtJMj021qU0/dd0KcwVRp7O
	NCj+23qhkRuZqFy4fxyIEM5kCrGnXFSvCRHg/LMTP+mPM2qOaB0M1Kz3LOG6s8HG9sxiQUfAy4hBv
	3nu53Vd/iofbul4oz42h4ylhPgRCzbQL3133GcYTJ6c/KBX0sXk9e36ZVal4XNuVr4dI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4ePR-0002w1-F3;
	Mon, 23 Mar 2026 12:29:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4ePO-0002vr-12
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 12:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AZMirs6G+J7DNfIIYLDHTLiFVBGYbkyD9F5M1pVbJWA=; b=cF7mJgqb6sZu+QM57GNmv27Kfj
 OT8RrQh7NWAzLNOk3KPGsxec+TzI1zTGfAAYXxlIsv413pNw9qhLzePVAOqkM73ga4Xb+b/U9hEr7
 XUHPsffjsE0NoXO4WaWT80K7DiJoIdvIiMNI6s2W6HLymNBTz9jayj7sL/ouA14xAaYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AZMirs6G+J7DNfIIYLDHTLiFVBGYbkyD9F5M1pVbJWA=; b=AH+YYBgco/RWJITydhg36xRv6a
 NWI/ZKj7AhUgypf5nG5VeN+VUJOm65l8f/tIbfc1edDaGYMIjdPu65r32vde+5BKqo1+BWzt1wZ7c
 gujCqTGhftLPhVzq/ZuLwk1wH9doGyrlkUUMFVgB2rP2hTDzBcaJHIbeXDnSgvcpCjLE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4ePN-0004qW-06 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 12:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9972440758;
 Mon, 23 Mar 2026 12:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00482C4CEF7;
 Mon, 23 Mar 2026 12:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774268954;
 bh=HipK7XheCm/KNPqybZCciqRzPh7VtM5UmOo/3l5pT0Y=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=LyXHMEywQ2TvjYCwkZkpUUbH/aJ6N2Ad8ryY71xvgFOabdZovFLXeLSoX5TxQGS86
 xTwBtxLg71Hhd8ev8YkCdUYBrbDjuF5BluhLHLhS/zAdZX7udtEhOy5SmPM9BCoU5p
 XpApOTSMvjNyeStV/o9IIGDHXxn5CkkXBZ/5ksyfiSdgPzvG0NxM9pTpezSuvcSBw7
 G2DJ5mh76TB6UdY67XZ6lhezj6RWEBDIU591WlN+Qg908TAxkb/q/RAvy73R90S1o/
 pnaAa+aIT65SmBpOfvWDLD5nUrt6bsJKtxbq0jcbVgues5FXFGRzq2Ce2X7aEGE33V
 M/a6mTxDUcO1g==
Message-ID: <fe77a3bd-2815-42f9-bc53-060881d017d9@kernel.org>
Date: Mon, 23 Mar 2026 20:29:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260319132607.686096-2-monty_pavel@sina.com>
 <20260319132607.686096-4-monty_pavel@sina.com>
 <03e452c8-b68e-4132-a5d2-aa1300673231@kernel.org>
 <4fa623df-5ccc-4635-82da-31a9f2a3a1a7@sina.com>
 <b206ebf0-5f63-4766-9e4a-d9e8290ef1d6@kernel.org>
 <af08c73c-09f4-4875-9688-062df7c9e74e@sina.com>
Content-Language: en-US
In-Reply-To: <af08c73c-09f4-4875-9688-062df7c9e74e@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/23/26 19:42, Yongpeng Yang wrote: > On 3/23/26 17:19,
 Chao Yu via Linux-f2fs-devel wrote: >> On 3/23/26 16:42, Yongpeng Yang wrote:
 >>> >>> On 3/23/26 11:28, Chao Yu via Linux-f2fs-devel wrote: > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4ePN-0004qW-06
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: fix fiemap boundary handling
 when read extent cache is incomplete
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,vm:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: BD8E02F1EBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8yMy8yNiAxOTo0MiwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiBPbiAzLzIzLzI2IDE3OjE5
LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiAzLzIzLzI2IDE2OjQy
LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4KPj4+IE9uIDMvMjMvMjYgMTE6MjgsIENoYW8gWXUg
dmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Pj4gT24gMy8xOS8yNiAyMToyNiwgWW9uZ3Bl
bmcgWWFuZyB3cm90ZToKPj4+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhp
YW9taS5jb20+Cj4+Pj4+Cj4+Pj4+IGYyZnNfZmllbWFwKCkgY2FsbHMgZjJmc19tYXBfYmxvY2tz
KCkgdG8gb2J0YWluIHRoZSBibG9jayBtYXBwaW5nIGEKPj4+Pj4gZmlsZSwgYW5kIHRoZW4gbWVy
Z2VzIGNvbnRpZ3VvdXMgbWFwcGluZ3MgaW50byBleHRlbnRzLiBJZiB0aGUgbWFwcGluZwo+Pj4+
PiBpcyBmb3VuZCBpbiB0aGUgcmVhZCBleHRlbnQgY2FjaGUsIG5vZGUgYmxvY2tzIGRvIG5vdCBu
ZWVkIHRvIGJlIHJlYWQuCj4+Pj4+IEhvd2V2ZXIsIGluIHRoZSBmb2xsb3dpbmcgc2NlbmFyaW8s
IGEgY29udGlndW91cyBleHRlbnQgY2FuIGJlIHNwbGl0Cj4+Pj4+IGludG8gdHdvIGV4dGVudHM6
Cj4+Pj4+Cj4+Pj4+IHJvb3RAdm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS40
TSBicz0xTSBjb3VudD00ICYmIHN5bmMKPj4+Pj4gcm9vdEB2bTovbW50L2YyZnMjIGRkIGlmPS9k
ZXYvemVybyBvZj1kYXRhLjRNIGJzPTFNIGNvdW50PTIgc2Vlaz0yIGNvbnY9bm90cnVuYyAmJiBz
eW5jCj4+Pj4+IHJvb3RAdm06L21udC9mMmZzIyBlY2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9j
YWNoZXMgIyBkcm9wIDJNfjRNIGV4dGVudCBjYWNoZQo+Pj4+PiByb290QHZtOi9tbnQvZjJmcyMg
ZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9MiBzZWVrPTAgY29udj1ub3Ry
dW5jICYmIHN5bmMKPj4+Pj4gcm9vdEB2bTovbW50L2YyZnMjIGYyZnNfaW8gZmllbWFwIDAgMTAy
NCBkYXRhLjRNCj4+Pj4+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxMDI0Cj4+Pj4+IGxvZ2lj
YWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+Pj4+
IDAJMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDA2NDAwMDAwIDAwMDAwMDAwMDAyMDAwMDAgMDAw
MDEwMDAKPj4+Pj4gMQkwMDAwMDAwMDAwMjAwMDAwIDAwMDAwMDAwMDY2MDAwMDAgMDAwMDAwMDAw
MDIwMDAwMCAwMDAwMTAwMQo+Pj4+Cj4+Pj4gV2VsbCwgSSBjYW4gbm90IHJlcHJvZHVjZSB0aGlz
IHcvIGFib3ZlIHNjcmlwdHMsIGNhbiB5b3UgcGxlYXNlIGNoZWNrCj4+Pj4gdGhhdD8gYW55d2F5
LCB0aGUgY29kZSBwYXJ0IGxvb2tzIGZpbmUgdG8gbWUuCj4+Pgo+Pj4gU29ycnkgZm9yIG9taXR0
aW5nIHRvbyBtYW55IGRldGFpbHMgZWFybGllci4gVGhlIGZ1bGwgc2NyaXB0cyBJIHVzZWQgdG8K
Pj4+IHJlcHJvZHVjZSB0aGUgaXNzdWUgaXMgYXMgYmVsb3cuIFRoZSBiYXNpYyBpZGVhIGlzIHRv
IG1ha2UKPj4+IGdldF9uZXdfc2VnbWVudCgpIGFsd2F5cyBzdGFydCBzY2FubmluZyBmcm9tIHNl
Y3Rpb24gIzAgZm9yIGVhY2gKPj4+IGFsbG9jYXRpb24sIGFuZCB0byBhbGxvY2F0ZSBoaWdoZXIg
YWRkcmVzc2VzIGZpcnN0LCBmb2xsb3dlZCBieSBsb3dlcgo+Pj4gYWRkcmVzc2VzLgo+Pgo+PiBZ
b3UgbWVhbiBhbGxvY2F0ZSBsb3dlciBhZGRyZXNzZXMgZmlyc3QsIHRoZW4gaGlnaGVyIGFkZHJl
c3NlcyBpbiBMRlMgbW9kZT8KPiAKPiBJbiBMRlMgbW9kZSwgd2hlbiB0aGUgbWFpbiBhcmVhIGlz
IHNtYWxsZXIgdGhhbiAxNkdCLCBhbGxvY2F0aW9ucyBhbHdheXMKPiBzdGFydCBmcm9tIHNlY3Rp
b24gIzAsIHdoaWNoIG1ha2VzIGl0IGVhc2llciB0byByZWxpYWJseSByZXByb2R1Y2UgdGhpcwo+
IHNjZW5hcmlvLgo+IAo+IFRoZSBrZXkgaWRlYSBiZWhpbmQgY29uc3RydWN0aW5nIHRoaXMgc2Nl
bmFyaW8gaXMgYXMgZm9sbG93czogZmlyc3QsIG1hcAo+IGFuZCB3cml0ZSB0aGUgMH4yTUIgcmFu
Z2UgdG8gaGlnaGVyIGFkZHJlc3NlcyBvbiB0aGUgZGV2aWNlLCBhbmQgdGhlbgo+IHdyaXRlIHRo
ZSAwfjJNQiByYW5nZSB0byBsb3dlciBhZGRyZXNzZXMuIFRoaXMgY3JlYXRlcyBhIHNpdHVhdGlv
bgo+IHdoZXJlIDB+Mk1CIGNhbiBiZSBtZXJnZWQgd2l0aCAyTUJ+NE1CLCBidXQgdGhlIDJNQn40
TUIgcmFuZ2UgaXMgbm90Cj4gcHJlc2VudCBpbiB0aGUgZXh0ZW50IHRyZWUuCj4gCj4gMS4gSW5p
dGlhbCBzdGF0ZQo+IGZpbGUgbWFwcGluZyAgICAwfjJNICAgICAgICAyTX40TSAgICAgICBbY3Vy
c2VnXSAgICBbZnJlZV0KPiBzZWdtZW50IyAgICAgICAgI0EgICAgICAgICAgI0ErMSAgICAgICAg
I0ErMiAgICAgICAgI0ErMwo+IAo+IDIuIGRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJzPTFN
IGNvdW50PTIgc2Vlaz0yIGNvbnY9bm90cnVuYyAmJiBzeW5jCj4gZmlsZSBtYXBwaW5nICAgIDB+
Mk0gICAgICAgIFtmcmVlXSAgICAgIDJNfjRNICAgICAgIFtjdXJzZWddCj4gc2VnbWVudCMgICAg
ICAgICNBICAgICAgICAgICNBKzEgICAgICAgICNBKzIgICAgICAgICNBKzMKPiAKPiAzLiBkZCBp
Zj0vZGV2L3plcm8gb2Y9ZGF0YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MCBjb252PW5vdHJ1bmMg
JiYgc3luYwo+IGZpbGUgbWFwcGluZyAgICBbZnJlZV0gICAgICBbY3Vyc2VnXSAgICAyTX40TSAg
ICAgICAwfjJNCj4gc2VnbWVudCMgICAgICAgICNBICAgICAgICAgICNBKzEgICAgICAgICNBKzIg
ICAgICAgICNBKzMKPiAKPiA0LiBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS40TSBicz0xTSBjb3Vu
dD0yIHNlZWs9MCBjb252PW5vdHJ1bmMgJiYgc3luYwo+IGZpbGUgbWFwcGluZyAgICBbY3Vyc2Vn
XSAgICAwfjJNICAgICAgICAyTX40TSAgICAgICBbZnJlZV0KPiBzZWdtZW50IyAgICAgICAgI0Eg
ICAgICAgICAgI0ErMSAgICAgICAgI0ErMiAgICAgICAgI0ErMwoKT2gsIEkgc2VlLCB0aGFua3Mg
Zm9yIHRoZSBkZXRhaWxlZCBleHBsYW5hdGlvbi4gOikKClRoYW5rcywKCj4gCj4+Cj4+Pgo+Pj4g
ZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuMTI4TSBicz0xTSBjb3VudD0xMjgKPj4+IGxvc2V0dXAg
LWYgZGF0YS4xMjhNCj4+PiBta2ZzLmYyZnMgL2Rldi9sb29wMCAtZgo+Pj4gbW91bnQgLW8gbW9k
ZT1sZnMgL2Rldi9sb29wMCAvbW50L2YyZnMvCj4+PiBjZCAvbW50L2YyZnMvCj4+PiBkZCBpZj0v
ZGV2L3plcm8gb2Y9ZGF0YS43Mk0gYnM9MU0gY291bnQ9NzIgJiYgc3luYwo+Pj4gZGQgaWY9L2Rl
di96ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9NCAmJiBzeW5jCj4+PiBkZCBpZj0vZGV2L3pl
cm8gb2Y9ZGF0YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MiBjb252PW5vdHJ1bmMgJiYgc3luYwo+
Pj4gZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCj4+PiBkZCBpZj0vZGV2L3plcm8g
b2Y9ZGF0YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MCBjb252PW5vdHJ1bmMgJiYgc3luYwo+Pj4g
ZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9MiBzZWVrPTAgY29udj1ub3Ry
dW5jICYmIHN5bmMKPj4+IGYyZnNfaW8gZmllbWFwIDAgMTAyNCBkYXRhLjRNCj4+Cj4+IEFoLCBu
b3cgdGhlIHNjcmlwdHMgYW5kIHJlc3VsdCBhcmUgY29uc2lzdGVudCwgY2FuIHlvdSBwbGVhc2Ug
cmVwbGFjZSB0aGUKPj4gc2NyaXB0cyBpbiBjb21taXQgbWVzc2FnZT8KPiAKPiBPSywgSSdsbCBy
ZXBsYWNlIHRoZSBzY3JpcHRzIGluIHY0IHBhdGNoLgo+IAo+IFRoYW5rcwo+IFlvbmdwZW5nLAo+
IAo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gVGhhbmtzCj4+PiBZb25ncGVuZywKPj4+Cj4+Pj4K
Pj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4gQWx0aG91Z2ggdGhlIHBoeXNpY2FsIGFkZHJl
c3NlcyBvZiB0aGUgcmFuZ2VzIDDvvZ4yTUIgYW5kIDJN772eNE1CIGFyZQo+Pj4+PiBjb250aWd1
b3VzLCB0aGUgbWFwcGluZyBmb3IgdGhlIDJN772eNE1CIHJhbmdlIGlzIG5vdCBwcmVzZW50IGlu
IG1lbW9yeS4KPj4+Pj4gV2hlbiB0aGUgcGh5c2ljYWwgYWRkcmVzc2VzIGZvciB0aGUgMO+9njJN
QiByYW5nZSBhcmUgdXBkYXRlZCwgbm8gbWVyZ2UKPj4+Pj4gaGFwcGVucyBiZWNhdXNlIHRoZSBh
ZGphY2VudCBtYXBwaW5nIGlzIG1pc3NpbmcgZnJvbSB0aGUgaW4tbWVtb3J5Cj4+Pj4+IGNhY2hl
LiBBcyBhIHJlc3VsdCwgZmllbWFwIHJlcG9ydHMgdHdvIHNlcGFyYXRlIGV4dGVudHMgaW5zdGVh
ZCBvZiBhCj4+Pj4+IHNpbmdsZSBjb250aWd1b3VzIG9uZS4KPj4+Pj4KPj4+Pj4gVGhlIHJvb3Qg
Y2F1c2UgaXMgdGhhdCB0aGUgcmVhZCBleHRlbnQgY2FjaGUgZG9lcyBub3QgZ3VhcmFudGVlIHRo
YXQgYWxsCj4+Pj4+IGJsb2NrcyBvZiBhbiBleHRlbnQgYXJlIHByZXNlbnQgaW4gbWVtb3J5LiBU
aGVyZWZvcmUsIHdoZW4gdGhlIGV4dGVudAo+Pj4+PiBsZW5ndGggcmV0dXJuZWQgYnkgZjJmc19t
YXBfYmxvY2tzX2NhY2hlZCgpIGlzIHNtYWxsZXIgdGhhbiBtYXhibG9ja3MsCj4+Pj4+IHRoZSBy
ZW1haW5pbmcgbWFwcGluZ3MgYXJlIHJldHJpZXZlZCB2aWEgZjJmc19nZXRfZG5vZGVfb2ZfZGF0
YSgpIHRvCj4+Pj4+IGVuc3VyZSBjb3JyZWN0IGZpZW1hcCBleHRlbnQgYm91bmRhcnkgaGFuZGxp
bmcuCj4+Pj4+Cj4+Pj4+IENjOiBzdGFibGVAa2VybmVsLm9yZwo+Pj4+PiBGaXhlczogY2Q4ZmM1
MjI2YmVmICgiZjJmczogcmVtb3ZlIHRoZSBjcmVhdGUgYXJndW1lbnQgdG8gZjJmc19tYXBfYmxv
Y2tzIikKPj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhp
YW9taS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiB2MzoKPj4+Pj4gLSBDYyB0byBzdGFibGUga2VybmVs
Lgo+Pj4+PiB2MjoKPj4+Pj4gLSBGaXggTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGNhdXNlZCBi
eSBtYXAtPm1fbXVsdGlkZXZfZGlvLgo+Pj4+PiAtIFJlZHVjZSBjYWxscyB0byBmMmZzX2dldF9k
bm9kZV9vZl9kYXRhKCkuCj4+Pj4+IC0tLQo+Pj4+PiAgZnMvZjJmcy9kYXRhLmMgfCAyNSArKysr
KysrKysrKysrKysrKysrKysrLS0tCj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0
YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gaW5kZXggOWU0ZGI2ZjA1MDhhLi5hMjEwYTdhNjI3
YzYgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMv
ZGF0YS5jCj4+Pj4+IEBAIC0xNjM3LDggKzE2MzcsMjYgQEAgaW50IGYyZnNfbWFwX2Jsb2Nrcyhz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFn
KQo+Pj4+PiAgCWxmc19kaW9fd3JpdGUgPSAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8gJiYg
ZjJmc19sZnNfbW9kZShzYmkpICYmCj4+Pj4+ICAJCQkJbWFwLT5tX21heV9jcmVhdGUpOwo+Pj4+
PiAgCj4+Pj4+IC0JaWYgKCFtYXAtPm1fbWF5X2NyZWF0ZSAmJiBmMmZzX21hcF9ibG9ja3NfY2Fj
aGVkKGlub2RlLCBtYXAsIGZsYWcpKQo+Pj4+PiAtCQlnb3RvIG91dDsKPj4+Pj4gKwlpZiAoIW1h
cC0+bV9tYXlfY3JlYXRlICYmIGYyZnNfbWFwX2Jsb2Nrc19jYWNoZWQoaW5vZGUsIG1hcCwgZmxh
ZykpIHsKPj4+Pj4gKwkJc3RydWN0IGV4dGVudF9pbmZvIGVpOwo+Pj4+PiArCj4+Pj4+ICsJCS8q
Cj4+Pj4+ICsJCSAqIDEuIElmIG1hcC0+bV9tdWx0aWRldl9kaW8gaXMgdHJ1ZSwgbWFwLT5tX3Bi
bGsgY2Fubm90IGJlCj4+Pj4+ICsJCSAqIHdhaXR0ZWQgYnkgZjJmc193YWl0X29uX2Jsb2NrX3dy
aXRlYmFja19yYW5nZSgpIGFuZCBhcmUgbm90Cj4+Pj4+ICsJCSAqIG1lcmdlYWJsZS4KPj4+Pj4g
KwkJICogMi4gSWYgcGdvZnMgaGl0cyB0aGUgcmVhZCBleHRlbnQgY2FjaGUsIGl0IG1lYW5zIHRo
ZSBtYXBwaW5nCj4+Pj4+ICsJCSAqIGlzIGFscmVhZHkgY2FjaGVkIGluIHRoZSBleHRlbnQgY2Fj
aGUsIGJ1dCBpdCBpcyBub3QKPj4+Pj4gKwkJICogbWVyZ2VhYmxlLCBhbmQgdGhlcmUgaXMgbm8g
bmVlZCB0byBxdWVyeSB0aGUgbWFwcGluZyBhZ2Fpbgo+Pj4+PiArCQkgKiB2aWEgZjJmc19nZXRf
ZG5vZGVfb2ZfZGF0YSgpLgo+Pj4+PiArCQkgKi8KPj4+Pj4gKwkJcGdvZnMgPQkocGdvZmZfdClt
YXAtPm1fbGJsayArIG1hcC0+bV9sZW47Cj4+Pj4+ICsJCWlmIChtYXAtPm1fbGVuID09IG1heGJs
b2NrcyB8fAo+Pj4+PiArCQkJbWFwLT5tX211bHRpZGV2X2RpbyB8fAo+Pj4+PiArCQkJZjJmc19s
b29rdXBfcmVhZF9leHRlbnRfY2FjaGUoaW5vZGUsIHBnb2ZzLCAmZWkpKQo+Pj4+PiArCQkJZ290
byBvdXQ7Cj4+Pj4+ICsJCW9mcyA9IG1hcC0+bV9sZW47Cj4+Pj4+ICsJCWdvdG8gbWFwX21vcmU7
Cj4+Pj4+ICsJfQo+Pj4+PiAgCj4+Pj4+ICAJbWFwLT5tX2JkZXYgPSBpbm9kZS0+aV9zYi0+c19i
ZGV2Owo+Pj4+PiAgCW1hcC0+bV9tdWx0aWRldl9kaW8gPQo+Pj4+PiBAQCAtMTY0OSw3ICsxNjY3
LDggQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJm
c19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnKQo+Pj4+PiAgCj4+Pj4+ICAJLyogaXQgb25seSBz
dXBwb3J0cyBibG9jayBzaXplID09IHBhZ2Ugc2l6ZSAqLwo+Pj4+PiAgCXBnb2ZzID0JKHBnb2Zm
X3QpbWFwLT5tX2xibGs7Cj4+Pj4+IC0JZW5kID0gcGdvZnMgKyBtYXhibG9ja3M7Cj4+Pj4+ICtt
YXBfbW9yZToKPj4+Pj4gKwllbmQgPSAocGdvZmZfdCltYXAtPm1fbGJsayArIG1heGJsb2NrczsK
Pj4+Pj4gIAo+Pj4+PiAgCWlmIChmbGFnID09IEYyRlNfR0VUX0JMT0NLX1BSRUNBQ0hFKQo+Pj4+
PiAgCQltb2RlID0gTE9PS1VQX05PREVfUkE7Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo+Pj4KPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==

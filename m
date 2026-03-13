Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID2+B1e0s2lYZwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 07:53:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6627E619
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 07:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fTJWTCao3iKOU/WOJ3WNd2q6gOHkZCmmW+4ybH6hKQ=; b=bh060SNhtxe+h49JYgZ7FgRgDc
	YyyE8PJBFh/zmoUnqui1Z8o5raX6xUlg9C1bZu0Cp9Wo/vObU95PiKgx90wm6/kAOqtXz6vffx5hQ
	BYVY1o+9iNKxC0G0QmkWFPHVIRvehS1Pm1ku/iUPnJTO7KM7XhIdyftD2ozNWdFdyhNs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0wOQ-0006l3-Nz;
	Fri, 13 Mar 2026 06:53:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0wOO-0006kw-Vv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 06:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SDlL1qT5VtjU1LOeNzfSp8Wgc7Iu0vvbTFBP4ydHdXc=; b=FwRPFuMvERiBtAUqEaUIOGfJ8Q
 /rjmpjkq4rEOusGNafy1EhcRrPaWllDe8FBnAlzYhPpkgYqbF29CFjHkzmq5eFMZ/P4HnTXMJ+o9n
 QNhKYXhDS59M7KQYxpSwBiyXGx/OoE9As0wONrwNrmxsQYLApsrWwK0TzCtXYzO6twZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SDlL1qT5VtjU1LOeNzfSp8Wgc7Iu0vvbTFBP4ydHdXc=; b=dOwcs0uR1nFEZVpjDpUAa1Dxs+
 6S9m3WrUKvLEwRwGv0x5TONmTTyX3SMYSfxZjlufEa77dBr9M4EHGt2xbOVaUyCbsXWYzRXuYah2k
 VKBobBUK6cO+MgvGcCa7tA1xoQaUMXBXjOyI7avWBSvK9sBsovNqumXXnxlgNwP6J2ms=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0wOO-0005yN-DK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 06:53:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 08BFB41A88;
 Fri, 13 Mar 2026 06:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916D6C19421;
 Fri, 13 Mar 2026 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773384773;
 bh=reHG1CacjlLjHnxxBxf+kGp9YfQtyTaDMF1HAFXgqws=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pNrSLlhIAuxoU7QiRfNroffaqadntFDOvQnQx783FpnCF8h3NKbdAgVlht0A8vQAd
 B3ZOj5jqQF/1OW0fU+y6nrckhzZLJQ00Z0OvNjBD3E1DaQWtaRSHRaB/UVI2ko10yd
 7lQgVrbo5Fa7hhhk+Or5xttQwSA/o3c7kKclcBUpMB4TaWmkkgAjf6ool7k7Y0ahhg
 CCxxCdugfQKOxWxpl8IMRwrYVpVPch7CU3JJA4DALTB+6lEdJvQgm5qWoQzQS2GFvN
 03LXqagUpRmDzhHnVRtsUXPkHZ++qiqrJc2/oDsbhApi82DQe1+h6FIzaedwN37ax7
 AulSy5z9SpRzw==
Message-ID: <43a6f544-098a-4bda-bd47-63c8b900bb65@kernel.org>
Date: Fri, 13 Mar 2026 14:52:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20260311083530.2582720-1-zangyangyang1@xiaomi.com>
 <6e89694d-5e3d-4d1c-91f6-56dcd36fcced@kernel.org>
 <41b970e5-799f-42e2-9d82-8619db24716e@gmail.com>
Content-Language: en-US
In-Reply-To: <41b970e5-799f-42e2-9d82-8619db24716e@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 3/13/2026 10:29 AM, Yangyang Zang wrote: > 在 2026/3/12
    10:01, Chao Yu 写道: > >> On 2026/3/11 16:35, Yangyang Zang wrote: >>>
   ad1357c34023 ("f2fs-tools: revert summary entry count from 2048 to [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0wOO-0005yN-DK
Subject: Re: [f2fs-dev] [PATCH v3 1/3] resize.f2fs: fix to avoid zeroing
 main area blocks in migrate_ssa()
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zangyangyang66@gmail.com,m:jaegeuk@kernel.org,m:daehojeong@google.com,m:zangyangyang1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,xiaomi.com:email];
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
X-Rspamd-Queue-Id: 3DB6627E619
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xMy8yMDI2IDEwOjI5IEFNLCBZYW5neWFuZyBaYW5nIHdyb3RlOgo+IOWcqCAyMDI2LzMv
MTIgMTA6MDEsIENoYW8gWXUg5YaZ6YGTOgo+IAo+PiBPbiAyMDI2LzMvMTEgMTY6MzUsIFlhbmd5
YW5nIFphbmcgd3JvdGU6Cj4+PiBhZDEzNTdjMzQwMjMgKCJmMmZzLXRvb2xzOiByZXZlcnQgc3Vt
bWFyeSBlbnRyeSBjb3VudCBmcm9tIDIwNDggdG8KPj4+IDUxMiBpbiAxNmtiIGJsb2NrIHN1cHBv
cnQiKSBjaGFuZ2VkIHRoZSBsb2dpYyBmb3IgbWlncmF0aW5nIFNTQQo+Pj4gYmxvY2tzLCByZWdh
cmRsZXNzIG9mIHdoZXRoZXIgdGhlIHBhY2tlZF9zc2EgZmVhdHVyZSBpcyBlbmFibGVkLgo+Pj4g
RHVyaW5nIHRoZSByZWlzemUgcHJvY2VzcywgdGhpcyBwYXRjaCBtYXkgY29ycnVwdCB0aGUgZmls
ZSBzeXN0ZW0KPj4+IHJvb3QgaW5vZGUuCj4+Pgo+Pj4gUmVwcm9kdWNlcjoKPj4+IGRkIGlmPS9k
ZXYvemVybyBvZj0vZGF0YS9mMmZzLmltZyBicz00ayBjb3VudD01MjUzMTIKPj4+IG1ha2VfZjJm
cyAtZyBhbmRyb2lkIC9kYXRhL2YyZnMuaW1nIDEzMTA3Mgo+Pj4gcmVzaXplLmYyZnMgLUYgL2Rh
dGEvZjJmcy5pbWcKPj4+IG1rZGlyIC9tbnQvZjJmcwo+Pj4gbW91bnQgL2RhdGEvZjJmcy5pbWcg
L21udC9mMmZzCj4+Cj4+IEhpIFlhbmd5YW5nLAo+Pgo+PiBEbyB5b3UgaGF2ZSBhbnkgcGxhbiB0
byB3cmFwIGFib3ZlIHRlc3RjYXNlIGludG8geGZzcWE/Cj4gSSBkb24ndCBoYXZlIGFueSBwbGFu
cyB5ZXQsIGJ1dCBJIGNhbiBnaXZlIGl0IGEgdHJ5LgoKVGhhbmsgeW91ISBZYW5neWFuZy4KClRo
YW5rcywKCj4+Pgo+Pj4gVGhlIHJvb3QgY2F1c2UgaXMgdGhhdCB0aGUgbnVtYmVyIG9mIFNTQSBi
bG9ja3MgYWZ0ZXIgc2VnbWVudAo+Pj4gYWxpZ25tZW50IGlzIGluY29uc2lzdGVudCB3aXRoIGBn
ZXRfbmV3c2Ioc2VnbWVudF9jb3VudClgLgo+Pj4gVGhpcyBtYXkgcmVzdWx0IGluIHNvbWUgU1NB
IGJsb2NrcyBub3QgYmVpbmcgemVyb2VkIG91dCwgb3IKPj4+IHRoZSBtYWluIGFyZWEgYmxvY2tz
IGJlaW5nIGluY29ycmVjdGx5IHplcm9lZCBvdXQgZHVyaW5nIFNTQQo+Pj4gbWlncmF0aW9uLiBa
ZXJvaW5nIG91dCB0aGUgbWFpbiBhcmVhIGJsb2NrcyBtYXkgY29ycnVwdCB0aGUKPj4+IHJvb3Qg
aW5vZGUuCj4+Pgo+Pj4gRml4ZXM6IGFkMTM1N2MzNDAyMyAoImYyZnMtdG9vbHM6IHJldmVydCBz
dW1tYXJ5IGVudHJ5IGNvdW50IGZyb20gMjA0OCB0byA1MTIgaW4gMTZrYiBibG9jayBzdXBwb3J0
IikKPj4+IFNpZ25lZC1vZmYtYnk6IFlhbmd5YW5nIFphbmcgPHphbmd5YW5neWFuZzFAeGlhb21p
LmNvbT4KPj4KPj4gUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4KPj4g
VGhhbmtzLAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==

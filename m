Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLzFCtUFwWlUPgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:20:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C57FF2EEE63
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:20:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyLCsMTLJD3jzkSYBlOqKuRreaFbVqwFBUtEI5b3/Hc=; b=J/I/NOyNvumN/AskM5sXIfuQ9Y
	9vXCFZh29/sUTRjIIWc9wYi2ONojcUO+2kOcXsjVURHFMU8gxTSEa5g/04MoQIFga8DDK8jxD/hdJ
	7y0bODyqmqllTffpLGd4Jhlhiw1/A+evP8/UpI02WW6G0CqLDSgtSPxldbQlFwLjLprI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4bSC-00072H-3P;
	Mon, 23 Mar 2026 09:20:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4bSA-00072A-TB
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GM2BBkFRSa3YDLvuoXgkSyJcwRM6ylGDaKhI6AWMuVs=; b=bEog6dEDj0Zy8CK2PtAtwtSIwq
 dWI29So5h7asC6gq0p43oomxnMDJDbbQbtfHjifFPdnKbbKdHV2Vi6mo3tpB3hbvk6zA5GfHFTZeW
 shMNe8MEvh8jOPFdDHkllhlnEnz20yTpdF7PtEQOnevhCBrHZ6LQox/nLLmPoWz+itng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GM2BBkFRSa3YDLvuoXgkSyJcwRM6ylGDaKhI6AWMuVs=; b=kFOqv5Z5GeOXXQq0R7mbIcUjnf
 nNFFr+gFxX+kFw4QozlX5JztzxNU9LeMLSZH53Z6XnsLKYp/Q5P5AKmnVsxLW4IXkaeLg07IoJtWB
 OKJtvWiplPsFUWJT1e21rRtE9Fw6oK8EDUvIosjRtj3Z2sG30lcYSSMWswKAEvNl+G5g=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4bSA-0008DE-3j for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:20:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C2804019F;
 Mon, 23 Mar 2026 09:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36926C2BCB4;
 Mon, 23 Mar 2026 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774257595;
 bh=7VW8FB4TEVGzOGIkT+hJ4mMlhR505cq7u+QHeHYe7NI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gDJpmi8jfoSXvC/9kyhLs92LAzTnh6WOK8Sfz4/cirsND6pm89PN7rFkk3J/huqA6
 v8XIhSM7dAM2VtWf9D9iD/2NVpiT4JfDbbuveTTf0CquXPgLYWvqgScJIZOmyex1Vd
 AKeo+fMSx1mdLrLxbEWeXMS4thVdcBf5bCP8LLf+Qin/6rsxUJzu6U9Y+/tzW2ylpH
 Nez0bTQPmreg9NMStBLfQPKT8JyEy11YQ/NOU1KOUODQofz2ne/E/EVwGHZrhV1Zps
 bTmitPrSHLxGjglTd5oT9hY3M+BtYeRScMmfmQvw8Fe5WUJaZrKKLYPGX8P3+LGacw
 MI1tkWeWLtIQg==
Message-ID: <b206ebf0-5f63-4766-9e4a-d9e8290ef1d6@kernel.org>
Date: Mon, 23 Mar 2026 17:19:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260319132607.686096-2-monty_pavel@sina.com>
 <20260319132607.686096-4-monty_pavel@sina.com>
 <03e452c8-b68e-4132-a5d2-aa1300673231@kernel.org>
 <4fa623df-5ccc-4635-82da-31a9f2a3a1a7@sina.com>
Content-Language: en-US
In-Reply-To: <4fa623df-5ccc-4635-82da-31a9f2a3a1a7@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/23/26 16:42, Yongpeng Yang wrote: > > On 3/23/26 11:28, 
 Chao Yu via Linux-f2fs-devel wrote: >> On 3/19/26 21:26, Yongpeng Yang wrote:
 >>> From: Yongpeng Yang <yangyongpeng@xiaomi.com> >>> >>> f2f [...] 
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
X-Headers-End: 1w4bSA-0008DE-3j
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
Cc: stable@kernel.org, Yongpeng Yang <yangyongpeng@xiaomi.com>,
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
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:stable@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,vm:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
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
X-Rspamd-Queue-Id: C57FF2EEE63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8yMy8yNiAxNjo0MiwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiAKPiBPbiAzLzIzLzI2IDEx
OjI4LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiAzLzE5LzI2IDIx
OjI2LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lv
bmdwZW5nQHhpYW9taS5jb20+Cj4+Pgo+Pj4gZjJmc19maWVtYXAoKSBjYWxscyBmMmZzX21hcF9i
bG9ja3MoKSB0byBvYnRhaW4gdGhlIGJsb2NrIG1hcHBpbmcgYQo+Pj4gZmlsZSwgYW5kIHRoZW4g
bWVyZ2VzIGNvbnRpZ3VvdXMgbWFwcGluZ3MgaW50byBleHRlbnRzLiBJZiB0aGUgbWFwcGluZwo+
Pj4gaXMgZm91bmQgaW4gdGhlIHJlYWQgZXh0ZW50IGNhY2hlLCBub2RlIGJsb2NrcyBkbyBub3Qg
bmVlZCB0byBiZSByZWFkLgo+Pj4gSG93ZXZlciwgaW4gdGhlIGZvbGxvd2luZyBzY2VuYXJpbywg
YSBjb250aWd1b3VzIGV4dGVudCBjYW4gYmUgc3BsaXQKPj4+IGludG8gdHdvIGV4dGVudHM6Cj4+
Pgo+Pj4gcm9vdEB2bTovbW50L2YyZnMjIGRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJzPTFN
IGNvdW50PTQgJiYgc3luYwo+Pj4gcm9vdEB2bTovbW50L2YyZnMjIGRkIGlmPS9kZXYvemVybyBv
Zj1kYXRhLjRNIGJzPTFNIGNvdW50PTIgc2Vlaz0yIGNvbnY9bm90cnVuYyAmJiBzeW5jCj4+PiBy
b290QHZtOi9tbnQvZjJmcyMgZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzICMgZHJv
cCAyTX40TSBleHRlbnQgY2FjaGUKPj4+IHJvb3RAdm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3pl
cm8gb2Y9ZGF0YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MCBjb252PW5vdHJ1bmMgJiYgc3luYwo+
Pj4gcm9vdEB2bTovbW50L2YyZnMjIGYyZnNfaW8gZmllbWFwIDAgMTAyNCBkYXRhLjRNCj4+PiBG
aWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMTAyNAo+Pj4gbG9naWNhbCBhZGRyLiAgICBwaHlzaWNh
bCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKPj4+IDAJMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMDA2NDAwMDAwIDAwMDAwMDAwMDAyMDAwMDAgMDAwMDEwMDAKPj4+IDEJMDAwMDAwMDAw
MDIwMDAwMCAwMDAwMDAwMDA2NjAwMDAwIDAwMDAwMDAwMDAyMDAwMDAgMDAwMDEwMDEKPj4KPj4g
V2VsbCwgSSBjYW4gbm90IHJlcHJvZHVjZSB0aGlzIHcvIGFib3ZlIHNjcmlwdHMsIGNhbiB5b3Ug
cGxlYXNlIGNoZWNrCj4+IHRoYXQ/IGFueXdheSwgdGhlIGNvZGUgcGFydCBsb29rcyBmaW5lIHRv
IG1lLgo+IAo+IFNvcnJ5IGZvciBvbWl0dGluZyB0b28gbWFueSBkZXRhaWxzIGVhcmxpZXIuIFRo
ZSBmdWxsIHNjcmlwdHMgSSB1c2VkIHRvCj4gcmVwcm9kdWNlIHRoZSBpc3N1ZSBpcyBhcyBiZWxv
dy4gVGhlIGJhc2ljIGlkZWEgaXMgdG8gbWFrZQo+IGdldF9uZXdfc2VnbWVudCgpIGFsd2F5cyBz
dGFydCBzY2FubmluZyBmcm9tIHNlY3Rpb24gIzAgZm9yIGVhY2gKPiBhbGxvY2F0aW9uLCBhbmQg
dG8gYWxsb2NhdGUgaGlnaGVyIGFkZHJlc3NlcyBmaXJzdCwgZm9sbG93ZWQgYnkgbG93ZXIKPiBh
ZGRyZXNzZXMuCgpZb3UgbWVhbiBhbGxvY2F0ZSBsb3dlciBhZGRyZXNzZXMgZmlyc3QsIHRoZW4g
aGlnaGVyIGFkZHJlc3NlcyBpbiBMRlMgbW9kZT8KCj4gCj4gZGQgaWY9L2Rldi96ZXJvIG9mPWRh
dGEuMTI4TSBicz0xTSBjb3VudD0xMjgKPiBsb3NldHVwIC1mIGRhdGEuMTI4TQo+IG1rZnMuZjJm
cyAvZGV2L2xvb3AwIC1mCj4gbW91bnQgLW8gbW9kZT1sZnMgL2Rldi9sb29wMCAvbW50L2YyZnMv
Cj4gY2QgL21udC9mMmZzLwo+IGRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjcyTSBicz0xTSBjb3Vu
dD03MiAmJiBzeW5jCj4gZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9NCAm
JiBzeW5jCj4gZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9MiBzZWVrPTIg
Y29udj1ub3RydW5jICYmIHN5bmMKPiBlY2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMK
PiBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MCBjb252PW5v
dHJ1bmMgJiYgc3luYwo+IGRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJzPTFNIGNvdW50PTIg
c2Vlaz0wIGNvbnY9bm90cnVuYyAmJiBzeW5jCj4gZjJmc19pbyBmaWVtYXAgMCAxMDI0IGRhdGEu
NE0KCkFoLCBub3cgdGhlIHNjcmlwdHMgYW5kIHJlc3VsdCBhcmUgY29uc2lzdGVudCwgY2FuIHlv
dSBwbGVhc2UgcmVwbGFjZSB0aGUKc2NyaXB0cyBpbiBjb21taXQgbWVzc2FnZT8KClRoYW5rcywK
Cj4gCj4gVGhhbmtzCj4gWW9uZ3BlbmcsCj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+PiBBbHRo
b3VnaCB0aGUgcGh5c2ljYWwgYWRkcmVzc2VzIG9mIHRoZSByYW5nZXMgMO+9njJNQiBhbmQgMk3v
vZ40TUIgYXJlCj4+PiBjb250aWd1b3VzLCB0aGUgbWFwcGluZyBmb3IgdGhlIDJN772eNE1CIHJh
bmdlIGlzIG5vdCBwcmVzZW50IGluIG1lbW9yeS4KPj4+IFdoZW4gdGhlIHBoeXNpY2FsIGFkZHJl
c3NlcyBmb3IgdGhlIDDvvZ4yTUIgcmFuZ2UgYXJlIHVwZGF0ZWQsIG5vIG1lcmdlCj4+PiBoYXBw
ZW5zIGJlY2F1c2UgdGhlIGFkamFjZW50IG1hcHBpbmcgaXMgbWlzc2luZyBmcm9tIHRoZSBpbi1t
ZW1vcnkKPj4+IGNhY2hlLiBBcyBhIHJlc3VsdCwgZmllbWFwIHJlcG9ydHMgdHdvIHNlcGFyYXRl
IGV4dGVudHMgaW5zdGVhZCBvZiBhCj4+PiBzaW5nbGUgY29udGlndW91cyBvbmUuCj4+Pgo+Pj4g
VGhlIHJvb3QgY2F1c2UgaXMgdGhhdCB0aGUgcmVhZCBleHRlbnQgY2FjaGUgZG9lcyBub3QgZ3Vh
cmFudGVlIHRoYXQgYWxsCj4+PiBibG9ja3Mgb2YgYW4gZXh0ZW50IGFyZSBwcmVzZW50IGluIG1l
bW9yeS4gVGhlcmVmb3JlLCB3aGVuIHRoZSBleHRlbnQKPj4+IGxlbmd0aCByZXR1cm5lZCBieSBm
MmZzX21hcF9ibG9ja3NfY2FjaGVkKCkgaXMgc21hbGxlciB0aGFuIG1heGJsb2NrcywKPj4+IHRo
ZSByZW1haW5pbmcgbWFwcGluZ3MgYXJlIHJldHJpZXZlZCB2aWEgZjJmc19nZXRfZG5vZGVfb2Zf
ZGF0YSgpIHRvCj4+PiBlbnN1cmUgY29ycmVjdCBmaWVtYXAgZXh0ZW50IGJvdW5kYXJ5IGhhbmRs
aW5nLgo+Pj4KPj4+IENjOiBzdGFibGVAa2VybmVsLm9yZwo+Pj4gRml4ZXM6IGNkOGZjNTIyNmJl
ZiAoImYyZnM6IHJlbW92ZSB0aGUgY3JlYXRlIGFyZ3VtZW50IHRvIGYyZnNfbWFwX2Jsb2NrcyIp
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNv
bT4KPj4+IC0tLQo+Pj4gdjM6Cj4+PiAtIENjIHRvIHN0YWJsZSBrZXJuZWwuCj4+PiB2MjoKPj4+
IC0gRml4IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBjYXVzZWQgYnkgbWFwLT5tX211bHRpZGV2
X2Rpby4KPj4+IC0gUmVkdWNlIGNhbGxzIHRvIGYyZnNfZ2V0X2Rub2RlX29mX2RhdGEoKS4KPj4+
IC0tLQo+Pj4gIGZzL2YyZnMvZGF0YS5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKy0tLQo+
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+PiBpbmRl
eCA5ZTRkYjZmMDUwOGEuLmEyMTBhN2E2MjdjNiAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZGF0
YS5jCj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4gQEAgLTE2MzcsOCArMTYzNywyNiBAQCBp
bnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9i
bG9ja3MgKm1hcCwgaW50IGZsYWcpCj4+PiAgCWxmc19kaW9fd3JpdGUgPSAoZmxhZyA9PSBGMkZT
X0dFVF9CTE9DS19ESU8gJiYgZjJmc19sZnNfbW9kZShzYmkpICYmCj4+PiAgCQkJCW1hcC0+bV9t
YXlfY3JlYXRlKTsKPj4+ICAKPj4+IC0JaWYgKCFtYXAtPm1fbWF5X2NyZWF0ZSAmJiBmMmZzX21h
cF9ibG9ja3NfY2FjaGVkKGlub2RlLCBtYXAsIGZsYWcpKQo+Pj4gLQkJZ290byBvdXQ7Cj4+PiAr
CWlmICghbWFwLT5tX21heV9jcmVhdGUgJiYgZjJmc19tYXBfYmxvY2tzX2NhY2hlZChpbm9kZSwg
bWFwLCBmbGFnKSkgewo+Pj4gKwkJc3RydWN0IGV4dGVudF9pbmZvIGVpOwo+Pj4gKwo+Pj4gKwkJ
LyoKPj4+ICsJCSAqIDEuIElmIG1hcC0+bV9tdWx0aWRldl9kaW8gaXMgdHJ1ZSwgbWFwLT5tX3Bi
bGsgY2Fubm90IGJlCj4+PiArCQkgKiB3YWl0dGVkIGJ5IGYyZnNfd2FpdF9vbl9ibG9ja193cml0
ZWJhY2tfcmFuZ2UoKSBhbmQgYXJlIG5vdAo+Pj4gKwkJICogbWVyZ2VhYmxlLgo+Pj4gKwkJICog
Mi4gSWYgcGdvZnMgaGl0cyB0aGUgcmVhZCBleHRlbnQgY2FjaGUsIGl0IG1lYW5zIHRoZSBtYXBw
aW5nCj4+PiArCQkgKiBpcyBhbHJlYWR5IGNhY2hlZCBpbiB0aGUgZXh0ZW50IGNhY2hlLCBidXQg
aXQgaXMgbm90Cj4+PiArCQkgKiBtZXJnZWFibGUsIGFuZCB0aGVyZSBpcyBubyBuZWVkIHRvIHF1
ZXJ5IHRoZSBtYXBwaW5nIGFnYWluCj4+PiArCQkgKiB2aWEgZjJmc19nZXRfZG5vZGVfb2ZfZGF0
YSgpLgo+Pj4gKwkJICovCj4+PiArCQlwZ29mcyA9CShwZ29mZl90KW1hcC0+bV9sYmxrICsgbWFw
LT5tX2xlbjsKPj4+ICsJCWlmIChtYXAtPm1fbGVuID09IG1heGJsb2NrcyB8fAo+Pj4gKwkJCW1h
cC0+bV9tdWx0aWRldl9kaW8gfHwKPj4+ICsJCQlmMmZzX2xvb2t1cF9yZWFkX2V4dGVudF9jYWNo
ZShpbm9kZSwgcGdvZnMsICZlaSkpCj4+PiArCQkJZ290byBvdXQ7Cj4+PiArCQlvZnMgPSBtYXAt
Pm1fbGVuOwo+Pj4gKwkJZ290byBtYXBfbW9yZTsKPj4+ICsJfQo+Pj4gIAo+Pj4gIAltYXAtPm1f
YmRldiA9IGlub2RlLT5pX3NiLT5zX2JkZXY7Cj4+PiAgCW1hcC0+bV9tdWx0aWRldl9kaW8gPQo+
Pj4gQEAgLTE2NDksNyArMTY2Nyw4IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKPj4+ICAKPj4+
ICAJLyogaXQgb25seSBzdXBwb3J0cyBibG9jayBzaXplID09IHBhZ2Ugc2l6ZSAqLwo+Pj4gIAlw
Z29mcyA9CShwZ29mZl90KW1hcC0+bV9sYmxrOwo+Pj4gLQllbmQgPSBwZ29mcyArIG1heGJsb2Nr
czsKPj4+ICttYXBfbW9yZToKPj4+ICsJZW5kID0gKHBnb2ZmX3QpbWFwLT5tX2xibGsgKyBtYXhi
bG9ja3M7Cj4+PiAgCj4+PiAgCWlmIChmbGFnID09IEYyRlNfR0VUX0JMT0NLX1BSRUNBQ0hFKQo+
Pj4gIAkJbW9kZSA9IExPT0tVUF9OT0RFX1JBOwo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK

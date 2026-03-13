Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIM9Fi23s2nbaAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:05:17 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74027E774
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4Z6IhWSIFfovG46OA7jXS02cOSyvWqCOfe8uxcqVac=; b=ZSbuCvyB+vKKNHtFRyJkJ361Z7
	/VlRun+q2TAb8AbVjRamSJNNALjTZR1BiaTCev5w4IISEDhdUVp/3Hd05k/t8RiJozZ5ZQp6IWa2D
	xL1LZwQ+CqTnSH8MeFPgAksbthzJAQ3ennP79fmW7H9YSFJIT8mKKmIJ7MPuMo0VNe04=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0wa1-0007GW-LD;
	Fri, 13 Mar 2026 07:05:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0wa0-0007GN-11
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VFMMzyY6n40/fAVtfkYbuQFNRsKcr9hUtkz4yzM0JYY=; b=djaAjGI1kD1YLrs2kA9zlg1Dmx
 nCSjejDEluXKjFEAUc9E86tCuHf7j1ejqB3zLeJz/HLVhl8xmkK2mHkl4m7bgg3CV7+MDRGXFCgJS
 6E2UsY27tjWez27Q/mGDmJ6YEfJbjC15Zld754e/CcIAaajc4XX72vCRAKl4lkhZHuXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VFMMzyY6n40/fAVtfkYbuQFNRsKcr9hUtkz4yzM0JYY=; b=NLQzmH96LLLRtCSRRnfd6AR7R2
 EQAqQQoxUE0QO7pdrAtn4TfuR0D+PYjUrcL/Ad7ysppC5ZWouyg5gqs56zC7W1JId7xS4ro6J1U/N
 epRVQ6HG9ZjhNN7tXXvIt2LtgrvttOGDHGlVaoNrTSX682DJ/UtlvZmgPGPpvbpqvy54=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0wZz-0006Wa-68 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:05:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4707B6012B;
 Fri, 13 Mar 2026 07:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA06C19421;
 Fri, 13 Mar 2026 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773385492;
 bh=/EoOBA0QU0k6pbSYFrTZNrtepHGYwi/y0B3TR27gTH4=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=H+jXK9tsSYy9zy14eCs/wZmZOijihmW6vjB/2fpgvPfXFpVhdKwygN7NrhRF8Xm/c
 csXJbWrE2+YvNxWV3jKZ6ktVWX646MgINuSw8+faXjbajyZjOb7oftnEVvCA/jIRb7
 BIP9iNloupE+XtrDKrlFY3a7ylEYBo2wdrLsLJmzddrJ6iEnxAcVlGu+pZS3nyBPU8
 ecQQ0OA0AC2l6iJKfwjE9H6pvp949tFPDYLtlq9oNWR3C6dNWR/56JxAjcw9bcmYEx
 j9njD1BcpyQMSvH+DgA7RF7PBKg1jvnaorNtIhf/6sT3xhUTJJCZmLRU0BcFKeDhf9
 Z44SHATKJriTQ==
Message-ID: <69415410-2343-47a9-b453-535b96c375bd@kernel.org>
Date: Fri, 13 Mar 2026 15:04:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112841.67508-2-monty_pavel@sina.com>
 <daa86ab7-fa33-4c31-92b0-0ec0492aa33d@kernel.org>
 <7ca74873-72c1-487e-8276-ceb6f2a9faef@sina.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <7ca74873-72c1-487e-8276-ceb6f2a9faef@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/12 11:59, Yongpeng Yang wrote: > On 3/12/26 09:06, 
 Chao Yu via Linux-f2fs-devel wrote: >> On 2026/2/16 19:28, Yongpeng Yang
 wrote: >>> From: Yongpeng Yang <yangyongpeng@xiaomi.com> >>> >>> A [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0wZz-0006Wa-68
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: invalidate block device page
 cache before reading metadata
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,xiaomi.com:email]
X-Rspamd-Queue-Id: 9B74027E774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjAyNi8zLzEyIDExOjU5LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+IE9uIDMvMTIvMjYgMDk6
MDYsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IE9uIDIwMjYvMi8xNiAx
OToyOCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5
b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4KPj4+IEFmdGVyIHRoZSBkZXZpY2UgaXMgbW91bnRlZCwg
ZjJmcyB1cGRhdGVzIG9uLWRpc2sgbWV0YWRhdGEgd2l0aG91dAo+Pj4gdXBkYXRpbmcgdGhlIGJs
b2NrIGRldmljZSBwYWdlIGNhY2hlLiBBcyBhIHJlc3VsdCwgZjJmcy10b29scyBtYXkgcmVhZAo+
Pj4gc3RhbGUgbWV0YWRhdGEgZnJvbSB0aGUgcGFnZSBjYWNoZS4KPj4+Cj4+PiBGb3IgZXhhbXBs
ZToKPj4+IG1vdW50IC9kZXYvdmRiIC9tbnQvZjJmcwo+Pj4gdG91Y2ggbXggLy8gaW5vID0gNAo+
Pj4gc3luYwo+Pj4gZHVtcC5mMmZzIC1pIDQgL2Rldi92ZGIKPj4+IHRvdWNoIG14MiAvLyBpbm8g
PSA1Cj4+PiBzeW5jCj4+PiBkdW1wLmYyZnMgLWkgNSAvZGV2L3ZkYiAvLyBibG9jayBhZGRyIGlz
IDAKPj4KPj4gQWN0dWFsbHksIGl0IHdpbGwgYmUgYmV0dGVyIHRvIHdhaXQgZm9yIC9tbnQvZjJm
cyBiZWluZyB1bW91bnRlZCBmaXJzdAo+PiBhbmQgdGhlbgo+PiBjYWxsIGR1bXAuZjJmcywgYXMg
aWYgdGhlcmUgYXJlIHR3byB1c2VycyBvbiB0aGUgZGV2aWNlLCB3ZSBjYW4gbm90Cj4+IGd1YXJh
bnRlZQo+PiBkdW1wLmYyZnMgY2FuIGFsd2F5cyBmbHVzaCBhbmQgY2xlYW4gdXAgYWxsIGNhY2hl
IHdoaWxlIGFub3RoZXIgdXNlcgo+PiBjb250aW51ZQo+PiB0byB1cGRhdGUgdGhlIGRhdGEgdmlh
IC9tbnQvZjJmcyBtb3VudCBwb2ludC4KPiAKPiBJZiB0aGUga2VybmVsIGd1YXJhbnRlZXMgdGhh
dCB0aGVyZSBpcyBubyBub24tdXB0b2RhdGUgZGF0YSBpbiB0aGUgYmxvY2sKPiBkZXZpY2UgcGFn
ZSBjYWNoZSBhZnRlciB1bm1vdW50LCB0aGlzIGlvY3RsIGRvZXMgbm90IG5lZWQgdG8gYmUKCldl
bGwsIG1heWJlIGFub3RoZXIgc3luYyAmIGRyb3BfY2FjaGUgY291bGQgYmUgZm9sbG93ZWQgYWZ0
ZXIgdW1vdW50KCkgdG8KbWFrZSBzdXJlIHRvIGNsZWFuIGFsbCBzdGFsZSBkYXRhIGluIGJsb2Nr
IGRldmljZSBjYWNoZS4gQnV0LCBpbnRlZ3JhdGluZwphbGwgY2xlYW51cCBvcGVyYXRpb24gaW50
byBkdW1wLmYyZnMgYWxzbyBsb29rcyBmaW5lLgoKPiBleGVjdXRlZC4gVGhlIG1haW4gcHVycG9z
ZSBvZiB0aGlzIHBhdGNoIGlzIHRvIG1ha2UgaXQgcG9zc2libGUgdG8KPiBpbnNwZWN0IHRoZSBt
ZXRhZGF0YSBvZiBhIG1vdW50ZWQgZjJmcyBpbnN0YW5jZSBhcyBtdWNoIGFzIHBvc3NpYmxlLCBp
bgo+IG9yZGVyIHRvIGFzc2lzdCB3aXRoIGRlYnVnZ2luZyBhbmQgYW5hbHlzaXMsIGVzcGVjaWFs
bHkgaW4gYWRiIHNoZWxsLgo+IFNvLCB3ZSBkb24ndCBuZWVkIHRvIGNoZWNrIHRoZSByZXR1cm4g
dmFsdWUgb2YgaW9jdGwuCgpBbHJpZ2h0LCBpZiB5b3UgdGhpbmsgaXQgd2lsbCBoZWxwIHlvdSBv
biBkZWJ1ZyBwdXJwb3NlLCBJJ20gZmluZSBvbiB0aGlzCmNoYW5nZS4gQnV0IHlvdSBrbm93LCBJ
IHN0aWxsIHRoaW5rIHRoYXQgZm9yIHN1Y2ggc2NlbmFyaW8gaW4gd2hlcmUgdGhlcmUgYXJlCm11
bHRpcGxlIHVzZXIgYWNjZXNzaW5nIHRoZSBzYW1lIGRldmljZSwgaXQncyBoYXJkIHRvIGd1YXJh
bnRlZSBlYWNoIG9mIHRoZW0KY2FuIGdldCBub24tc3RhbGUgZGF0YS4gT24geW91ciBjYXNlLCB3
ZSBjYW4gbm90IGd1YXJhbnRlZSBhbmRyb2lkIGFwcHMgd29uJ3QKdG91Y2ggaW5vIDQgb3IgNSwg
d2hpbGUgd2UgcnVubmluZyBkdW1wLmYyZnMgb24gdGhlIGlub2RlLgoKVGhhbmtzLAoKPiAKPiBU
aGFua3MKPiBZb25ncGVuZywKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IFNpbmNlIGBkdW1w
LmYyZnMgLWkgNCAvZGV2L3ZkYmAgaGFzIGFscmVhZHkgcG9wdWxhdGVkIHRoZSBtZXRhZGF0YSBh
cmVhCj4+PiBpbnRvIHRoZSBibG9jayBkZXZpY2UgcGFnZSBjYWNoZSwgdGhlIGNhY2hlZCBwYWdl
cyByZW1haW4gcmVzaWRlbnQgaW4KPj4+IG1lbW9yeS4gQWZ0ZXIgY3JlYXRpbmcgbXgyLCB0aGUg
cGFnZSBjYWNoZSBpcyBub3QgdXBkYXRlZCBhY2NvcmRpbmdseS4KPj4+IFRoZXJlZm9yZSwgYGR1
bXAuZjJmcyAtaSA1IC9kZXYvdmRiYCByZWFkcyBzdGFsZSBtZXRhZGF0YSwgYW5kIHRoZQo+Pj4g
cGh5c2ljYWwgYmxvY2sgYWRkcmVzcyBvZiBpbm9kZSA1IGlzIGluY29ycmVjdGx5IHJlcG9ydGVk
IGFzIDAuCj4+Pgo+Pj4gVGhpcyBwYXRjaCBpc3N1ZXMgYSBCTEtGTFNCVUYgaW9jdGwgdG8gdGhl
IGJsb2NrIGRldmljZSBiZWZvcmUgcmVhZGluZwo+Pj4gbWV0YWRhdGEuIFRoZSBrZXJuZWwgdGhl
biBpbnZhbGlkYXRlcyB0aGUgYmxvY2sgZGV2aWNlIHBhZ2UgY2FjaGUsCj4+PiBlbnN1cmluZyB0
aGF0IHN1YnNlcXVlbnQgcmVhZHMgZmV0Y2ggdXB0b2RhdGUgbWV0YWRhdGEgZnJvbSBkaXNrLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWku
Y29tPgo+Pj4gLS0tCj4+PiAgwqAgbGliL2xpYmYyZnMuYyB8IDEgKwo+Pj4gIMKgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9saWIvbGliZjJmcy5j
IGIvbGliL2xpYmYyZnMuYwo+Pj4gaW5kZXggMWE0OTZiNy4uMzFiNTkyNCAxMDA2NDQKPj4+IC0t
LSBhL2xpYi9saWJmMmZzLmMKPj4+ICsrKyBiL2xpYi9saWJmMmZzLmMKPj4+IEBAIC0xMDI3LDYg
KzEwMjcsNyBAQCBpbnQgZ2V0X2RldmljZV9pbmZvKGludCBpKQo+Pj4gIMKgwqDCoMKgwqAgfQo+
Pj4gIMKgIMKgwqDCoMKgwqAgZGV2LT5mZCA9IGZkOwo+Pj4gK8KgwqDCoCBpb2N0bChmZCwgQkxL
RkxTQlVGKTsKPj4+ICDCoCDCoMKgwqDCoMKgIGlmIChjLnNwYXJzZV9tb2RlICYmIGkgPT0gMCkg
ewo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZjJmc19pbml0X3NwYXJzZV9maWxlKCkpIHsK
Pj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

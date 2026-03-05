Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CiEMp3kqGkKygAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 03:04:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA920A164
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 03:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7ldSwhARilGW8kHC8ocIM8A7U9ZSVBoGnbpDrXSlKw=; b=LfE1SFfpvlqJLt5Z9KhkbcjZ20
	NZzEIMVvDrdtJ4lsP+OxMFAEDAdqfhxDJQL+cka4Sy+sknTY/qsfJ5iuEitq/bkRxLQAD+ikqVBM5
	1ZKHLvZ+YGmJdZqu+osYxbxy107Q3Z7EVjj5+64j2gNLoNOCaUufRvEgORmxvib3xG5g=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxy4M-0005Mq-Mi;
	Thu, 05 Mar 2026 02:04:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxy4L-0005Mj-Bx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 02:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4+SA5PvaBWqzylDrb6LLPKlxWvkmP5LM7ryRgfHA+hE=; b=NPdTamipuqifQfm800wX6rbNSj
 9+jww0K8fwknPPrcallAzgjxiULTsPHlROpOTSKiV7+9BaiRNPrX4q/zcQ/JuHQv4SXCyTLgZtx3X
 1NQZ1GNEBF0gKglKnn19KwxkulwwNaZ3+V6bWX7iADFGaqkqqErhI39lH7qG8e19QzWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4+SA5PvaBWqzylDrb6LLPKlxWvkmP5LM7ryRgfHA+hE=; b=IkgMf765O0uhJ34EjFfI4bNsis
 iAZ6MUuQ/8BDWgxZnctTCG1aU4CoK6BIVLoQ3tewWCsVjEO4Wo+18BXlj6a+GTiR/mZF9bVFnv+Gc
 AR78KHhMqbapqAuK9EH4hrpbgG7mkzE8DNpV5Qsd8uQpWk5VFOUGeEtaHVdzc6CHiZUw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxy4K-0006CW-Mx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 02:04:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 07E6161339;
 Thu,  5 Mar 2026 02:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5E7C4CEF7;
 Thu,  5 Mar 2026 02:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772676233;
 bh=66aH2enOS//dFhwJK5YO1jMJ7RyZvYm3AS5BcF/XMkE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=RTKo1ml4scbH18XX7z88f3kWMOQCbdMoyS2tseJJFvPGp0fQaB/YPlENthxEcQEkE
 4ZEfecZB1SP8lUDjD3ey+fxNReiY7AXJyk9cvGZCQGaA3S79ZzCCBZAYgenGTuybLU
 yl81AnCgfL0ezM1iOC2iuP98lTQOEkIMsLyGATyLl+ko2h3dJY/9Cl3bU1R+hgEEik
 6KmznDVbPjzuRjnQ6SpMXH4hvnjAWrWQEspfXdUhGcNieXqaKdS+ASnIKh8DjDcsFX
 yDTBBFsCYWDhFwqDPpqws8hCtr5ZXv8kJuFjWlZTmdOOxQ7q/RMlQIjTE/ApaVuGMx
 lGR4D26hYvHpw==
Message-ID: <4e22d920-37dc-4414-b512-87343625f1e5@kernel.org>
Date: Thu, 5 Mar 2026 10:03:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20260218125237.3340441-1-shinichiro.kawasaki@wdc.com>
 <20260218125237.3340441-2-shinichiro.kawasaki@wdc.com>
 <aZ0aVDSWpRRqFwl9@google.com> <aZ1C-Cdrwoxp0VCJ@shinmob>
 <aaH_XCGbYOt6dpba@google.com> <aae5x_9gpi7utuf0@shinmob>
 <da969409-ce10-46fe-8620-b0dfb0cea201@kernel.org>
 <cb8b545f-0bbc-4747-a2ce-7432fa1e6ef2@kernel.org> <aajhnCU8KjUaoCl_@shinmob>
Content-Language: en-US
In-Reply-To: <aajhnCU8KjUaoCl_@shinmob>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/5 09:52, Shinichiro Kawasaki wrote: > On Mar 05,
 2026 / 09:38, Chao Yu wrote: >> On 2026/3/4 16:55, Chao Yu wrote: >>> On
 2026/3/4 12:57, Shinichiro Kawasaki wrote: > [...] >>>> I will seek [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxy4K-0006CW-Mx
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix lockdep WARN of
 sbi->cp_global_sem and q->q_usage_counter
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 17AA920A164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shinichiro.kawasaki@wdc.com,m:jaegeuk@kernel.org,m:dlemoal@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

T24gMjAyNi8zLzUgMDk6NTIsIFNoaW5pY2hpcm8gS2F3YXNha2kgd3JvdGU6Cj4gT24gTWFyIDA1
LCAyMDI2IC8gMDk6MzgsIENoYW8gWXUgd3JvdGU6Cj4+IE9uIDIwMjYvMy80IDE2OjU1LCBDaGFv
IFl1IHdyb3RlOgo+Pj4gT24gMjAyNi8zLzQgMTI6NTcsIFNoaW5pY2hpcm8gS2F3YXNha2kgd3Jv
dGU6Cj4gWy4uLl0KPj4+PiBJIHdpbGwgc2VlayBvdXQgb3RoZXIgd2F5cyB0byBhdm9pZCB0aGUg
bG9ja2RlcC4gSSBoYXZlIG5vIGlkZWEgaG93IHRvIGRvIHRoYXQKPj4+PiBhdCB0aGlzIG1vbWVu
dCwgdGhvdWdoLgo+Pj4KPj4+IFNoaW5pY2hpcm8sCj4+Pgo+Pj4gSU1PLCB0aGlzIGxvb2tzIGxp
a2UgYSBmYWxzZSBhbGFybSBvZiBsb2NrZGVwLCB3aGF0IGRvIHlvdSB0aGluayBvZiB0aGlzIGZp
eD8KPj4+Cj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9jaGFvL2xpbnV4LmdpdC9jb21taXQvP2g9YnVnZml4L3N5emJvdCZpZD0zYjE5NTY0Yjk1ZTli
YTk4MDNlZjMwZTkwZWFjZTA5NzdiOWQxNDBkCj4+Pgo+Pj4gLS0tCj4+PiAgIMKgZnMvZjJmcy9m
MmZzLmjCoCB8IDMgKysrCj4+PiAgIMKgZnMvZjJmcy9zdXBlci5jIHwgMyArKysKPj4+ICAgwqAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+PiBpbmRleCBiYjM0ZTg2NGQwZWYuLjViNDAw
ZTk5ZjMzMiAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+PiArKysgYi9mcy9mMmZz
L2YyZnMuaAo+Pj4gQEAgLTIwNDIsNiArMjA0Miw5IEBAIHN0cnVjdCBmMmZzX3NiX2luZm8gewo+
Pj4gICDCoMKgwqDCoMKgwqDCoCBzcGlubG9ja190IGlvc3RhdF9sYXRfbG9jazsKPj4+ICAgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGlvc3RhdF9sYXRfaW5mbyAqaW9zdGF0X2lvX2xhdDsKPj4+ICAg
wqAjZW5kaWYKPj4+ICsjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfQUxMT0MKPj4+ICvCoMKgwqDC
oMKgwqAgc3RydWN0IGxvY2tfY2xhc3Nfa2V5IGNwX2dsb2JhbF9zZW1fa2V5Owo+Pj4gKyNlbmRp
Zgo+Pj4gICDCoH07Cj4+Pgo+Pj4gICDCoC8qIERlZmluaXRpb25zIHRvIGFjY2VzcyBmMmZzX3Ni
X2luZm8gKi8KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVy
LmMKPj4+IGluZGV4IDg3NzRjNjBiNGJlNC4uOWU4NWYzMWZhODI4IDEwMDY0NAo+Pj4gLS0tIGEv
ZnMvZjJmcy9zdXBlci5jCj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+IEBAIC00OTQ4LDYg
KzQ5NDgsOSBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sg
KnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCj4+PiAgIMKgwqDCoMKgwqDCoMKgIGluaXRfZjJm
c19yd3NlbV90cmFjZSgmc2JpLT5nY19sb2NrLCBzYmksIExPQ0tfTkFNRV9HQ19MT0NLKTsKPj4+
ICAgwqDCoMKgwqDCoMKgwqAgbXV0ZXhfaW5pdCgmc2JpLT53cml0ZXBhZ2VzKTsKPj4+ICAgwqDC
oMKgwqDCoMKgwqAgaW5pdF9mMmZzX3J3c2VtX3RyYWNlKCZzYmktPmNwX2dsb2JhbF9zZW0sIHNi
aSwgTE9DS19OQU1FX0NQX0dMT0JBTCk7Cj4+PiArI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX0FM
TE9DCj4+PiArwqDCoMKgwqDCoMKgIGxvY2tkZXBfc2V0X2NsYXNzKCZzYmktPmNwX2dsb2JhbF9z
ZW0sICZzYmktPmNwX2dsb2JhbF9zZW1fa2V5KTsKPj4KPj4gU29ycnksIHNob3VsZCBiZToKPj4K
Pj4gKwlsb2NrZGVwX3NldF9jbGFzcygmc2JpLT5jcF9nbG9iYWxfc2VtLmludGVybmFsX3J3c2Vt
LAo+PiArCQkJCQkmc2JpLT5jcF9nbG9iYWxfc2VtX2tleSk7Cj4+Cj4+IFRoYW5rcywKPiAKPiBD
aGFvLCB0aGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgaWRlYSBhbmQgdGhlIHRyaWFsIHBhdGNo
ISBJIHdpbGwgdHJ5IGl0IG91dC4KPiBMZXQgbWUgaGF2ZSBhIGRheSBvciB0d28uCgpUaGFua3Mg
U2hpbmljaGlybyEKClVwZGF0ZWQgbGluayBhcyBiZWxvdyB3aGljaCBpbmNsdWRlcyBjb21waWxl
IGVycm9yIGZpeC4KCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2NoYW8vbGludXguZ2l0L2NvbW1pdC8/aD1idWdmaXgvc3l6Ym90JmlkPWVmMjA4NDA0OTNk
YTZjYjI2YmI5MTBhNzNjNDY0MTNhMTdlYTU4ZTcKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

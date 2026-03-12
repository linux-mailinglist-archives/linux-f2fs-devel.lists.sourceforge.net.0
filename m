Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLtMIjmasmnENwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 11:49:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C322707DB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 11:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9p8IxDD7Yo/7jXZxnK5Vf0Ogfr9BN6pYgU9TGFAy10=; b=YOG5zaj4ECwLixTXVBKuS6mPqa
	+2g9YVoCWwG3rzXU54Bxygb9FOMZ864229z1YQ4gx9hrCA5DXrmfnYt3dPzTIu2fMTXYzRuWyGbcd
	OsMrffRCOw4t3wF950/LuefRsTd8MtX9v9/cgmBfnS8NRb3jkf5g0IF9bKxdrhzppCG0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0dbT-0004ax-FM;
	Thu, 12 Mar 2026 10:49:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0dbS-0004ap-2v
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 10:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MrywWvCRNl1QPrvFwW/oD92nRRt1gTihZxxbi7pFitg=; b=m5Di2TAFiFB1XiO9pNS3qmZT10
 8/MxdVm6jnebZ8/9br0YHx0a3vul96Yzw9BK54iPVYQLsA6yH+8O4VraEqct9aocfwEEdnROcg3vx
 3ufQQB3lrMFQ9gIxadUBq3npFEfizESE7X8eYIWBeNt4YU3ITC6HbGxXCK7BNlkdijk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MrywWvCRNl1QPrvFwW/oD92nRRt1gTihZxxbi7pFitg=; b=nPJEtfvyE6frrb4Axc6ZeT8rdQ
 fR4Vzy37eOSJIgToHSwbJxqHtXUM9HcYpRP6VXfWadPH+Lv/iNBHrc+7GQH6Iq/100TmnYK7oSGH7
 oJbMthI9tQ2Eoh0H0i8+Wl4fw+ESP9v4H4NLLvlVs7OZSijAC3qx+tk8BbSXrMgs0TeU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0dbR-0006wm-Gr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 10:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D66CA60137;
 Thu, 12 Mar 2026 10:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8303C4CEF7;
 Thu, 12 Mar 2026 10:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773312546;
 bh=7+e+QGN1KPC+sr8HKvgCWPTDtPmE6MQKVdWVkGa5DTM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hLFAmXEHXIbZ8mQEMCxxQ+rvSQkDDEMtABg2W7DYCzMruOZ+RYxsGGsCRqwL7urtT
 84m9UImoUD2jg+VwXbDa7UtQJhxSOb58dLuUHaTT/B+QHOIzJkKPIp8beIAvqpoC4/
 TdjPms+1Ag5d5DlWfOw3mjc/yNcSxtLG0UZbcsTy7eEbvyj1taRBw34RVSRH9+xYw1
 abK26fAq5q9L3wbK60xJh5hTXvwJoPr7O4bKDnPDfe6jO8gZikNJBltyekRntOJuwh
 Vg3IzCvxXvd8TKfzHs8XRZwynFz8JIT4kSigEuTsnshR6kpDzNG8rXNNfv2tgysBUq
 1ZBGPA47wgOUA==
Message-ID: <507df28a-6415-445a-9e88-0f119ee7ce10@kernel.org>
Date: Thu, 12 Mar 2026 18:49:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112737.67408-1-monty_pavel@sina.com>
 <f331751b-08ad-42d2-ad23-37d21e1364f8@kernel.org>
 <c7bdf38f-4cf5-490b-8e0f-35f4574f4b81@sina.com>
 <9dc584cd-d2fb-4a85-b1d0-ded944064603@kernel.org>
Content-Language: en-US
In-Reply-To: <9dc584cd-d2fb-4a85-b1d0-ded944064603@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/12 18:41, Chao Yu wrote: > On 2026/3/12 11:56,
 Yongpeng
 Yang wrote: >> >> On 3/12/26 08:49, Chao Yu via Linux-f2fs-devel wrote: >>>
 On 2026/2/16 19:27, Yongpeng Yang wrote: >>>> From: Yongpe [...] 
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
X-Headers-End: 1w0dbR-0006wm-Gr
Subject: Re: [f2fs-dev] [PATCH] f2fs: invalidate block device page cache on
 umount
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
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
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: D8C322707DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjAyNi8zLzEyIDE4OjQxLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjYvMy8xMiAxMTo1Niwg
WW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4KPj4gT24gMy8xMi8yNiAwODo0OSwgQ2hhbyBZdSB2aWEg
TGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+IE9uIDIwMjYvMi8xNiAxOToyNywgWW9uZ3Blbmcg
WWFuZyB3cm90ZToKPj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21p
LmNvbT4KPj4+Pgo+Pj4+IE5laXRoZXIgRjJGUyBub3IgVkZTIGludmFsaWRhdGVzIHRoZSBibG9j
ayBkZXZpY2UgcGFnZSBjYWNoZSwgd2hpY2gKPj4+PiByZXN1bHRzIGluIHJlYWRpbmcgc3RhbGUg
bWV0YWRhdGEuIEFuIGV4YW1wbGUgc2NlbmFyaW8gaXMgc2hvd24gYmVsb3c6Cj4+Pj4KPj4+PiBU
ZXJtaW5hbCBBwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUZXJtaW5hbCBCCj4+
Pj4gbW91bnQgL2Rldi92ZGIgL21udC9mMmZzCj4+Pj4gdG91Y2ggbXggLy8gaW5vID0gNAo+Pj4+
IHN5bmMKPj4+PiBkdW1wLmYyZnMgLWkgNCAvZGV2L3ZkYi8vIGJsb2NrIG9uICJbWS9OXSIKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHRvdWNoIG14MiAvLyBpbm8gPSA1Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzeW5jCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bW91bnQgL21udC9m
MmZzCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkdW1wLmYyZnMgLWkgNSAvZGV2L3ZkYiAvLyBibG9jayBhZGRyIGlzIDAKPj4+
Pgo+Pj4+IEFmdGVyIHVtb3VudCwgdGhlIGJsb2NrIGRldmljZSBwYWdlIGNhY2hlIGlzIG5vdCBw
dXJnZWQsIGNhdXNpbmcKPj4+PiBgZHVtcC5mMmZzIC1pIDUgL2Rldi92ZGJgIHRvIHJlYWQgc3Rh
bGUgbWV0YWRhdGEgYW5kIHNlZSBpbm9kZSA1IHdpdGgKPj4+PiBibG9jayBhZGRyZXNzIDAuCj4+
Pj4KPj4+PiBUaGlzIHBhdGNoIGNhbGxzIGludmFsaWRhdGVfYmRldiBkdXJpbmcgdW1vdW50IHRv
IGludmFsaWRhdGUgdGhlIGJsb2NrCj4+Pj4gZGV2aWNlIHBhZ2UgY2FjaGUsIHByZXZlbnRpbmcg
c3RhbGUgbWV0YWRhdGEgZnJvbSBiZWluZyByZWFkLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
WW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqDC
oCBmcy9mMmZzL3N1cGVyLmMgfCA2ICsrKysrKwo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2Zz
L2YyZnMvc3VwZXIuYwo+Pj4+IGluZGV4IDFhNzU1OTk3YWZmNS4uMzlkM2I1MmNlYWMxIDEwMDY0
NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+
Pj4+IEBAIC0yMDkxLDYgKzIwOTEsMTIgQEAgc3RhdGljIHZvaWQgZjJmc19wdXRfc3VwZXIoc3Ry
dWN0IHN1cGVyX2Jsb2NrICpzYikKPj4+PiDCoMKgICNpZiBJU19FTkFCTEVEKENPTkZJR19VTklD
T0RFKQo+Pj4+IMKgwqDCoMKgwqDCoCB1dGY4X3VubG9hZChzYi0+c19lbmNvZGluZyk7Cj4+Pj4g
wqDCoCAjZW5kaWYKPj4+PiArwqDCoMKgIHN5bmNfYmxvY2tkZXYoc2ItPnNfYmRldik7Cj4+Pgo+
Pj4gV2Ugd2lsbCBjYWxsIHN5bmNfYmxvY2tkZXYgaW4gYmVsb3cgcGF0aD8KPj4+Cj4+PiAtIGtp
bGxfZjJmc19zdXBlcgo+Pj4gwqDCoC0ga2lsbF9ibG9ja19zdXBlcgo+Pj4gwqDCoCAtIGdlbmVy
aWNfc2h1dGRvd25fc3VwZXIKPj4+IMKgwqDCoCAtIHB1dF9zdXBlcgo+Pj4gwqDCoCAtIHN5bmNf
YmxvY2tkZXYKPj4+Cj4+PiAxNzIxIHZvaWQga2lsbF9ibG9ja19zdXBlcihzdHJ1Y3Qgc3VwZXJf
YmxvY2sgKnNiKQo+Pj4gMTcyMiB7Cj4+PiAxNzIzwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYmxv
Y2tfZGV2aWNlICpiZGV2ID0gc2ItPnNfYmRldjsKPj4+IDE3MjQKPj4+IDE3MjXCoMKgwqDCoMKg
wqDCoMKgIGdlbmVyaWNfc2h1dGRvd25fc3VwZXIoc2IpOwo+Pj4gMTcyNsKgwqDCoMKgwqDCoMKg
wqAgaWYgKGJkZXYpIHsKPj4+IDE3MjfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
eW5jX2Jsb2NrZGV2KGJkZXYpOwo+Pj4gMTcyOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJkZXZfZnB1dChzYi0+c19iZGV2X2ZpbGUpOwo+Pj4gMTcyOcKgwqDCoMKgwqDCoMKgwqAg
fQo+Pj4gMTczMCB9Cj4+Pgo+Pj4+ICvCoMKgwqAgaW52YWxpZGF0ZV9iZGV2KHNiLT5zX2JkZXYp
Owo+Pgo+PiBUaGlzIHdvcmtzIGZvciBhbiBmMmZzIGluc3RhbmNlIG1vdW50ZWQgb24gYSBzaW5n
bGUgZGV2aWNlLCBidXQgaXQgZG9lcwo+PiBub3Qgd29yayBmb3IgbXVsdGktZGV2aWNlIGNvbmZp
Z3VyYXRpb25zLCBiZWNhdXNlIHRoZSB2ZnMgY2Fubm90IGJlCj4+IGF3YXJlIG9mIEZERVYoMSku
Cj4gCj4gWWVhaCwgSSBtZWFudCB3ZSBjYW4gYXZvaWQgZHVwbGljYXRlZCBzeW5jX2Jsb2NrZGV2
KCkgZm9yIG1haW4gZGV2aWNlIGluCj4gZjJmc19wdXRfc3VwZXIoKS4KPiAKPj4KPj4+Cj4+PiBJ
IGd1ZXNzIHdlIGNhbiBsZWF2ZSB0aGUgZGV2aWNlIHcvIHVwdG9kYXRlIGNhY2hlLCBpbiBjYXNl
IGlmIHRoZXJlIGFyZQo+Pj4gbXVsdGlwbGUgdXNlciBvbiB0aGUgZGV2aWNlPwo+Pgo+PiBUaGUg
cGFnZSBjYWNoZSBvZiB0aGUgYmxvY2sgZGV2aWNlIGZpbGUgbWF5IGNvbnRhaW4gZGF0YSB0aGF0
IGlzIG5vdAo+PiB1cHRvZGF0ZS4gRm9yIGV4YW1wbGUsIGRhdGEgbWF5IGZpcnN0IGJlIHJlYWQg
ZGlyZWN0bHkgdGhyb3VnaCB0aGUgYmxvY2sKPiAgPiBkZXZpY2UgZmlsZSwgYW5kIHRoZW4gdGhl
IHNhbWUgYmxvY2tzIG1heSBiZSB3cml0dGVuIHRocm91Z2ggZjJmcy4gU2luY2U+IGYyZnMgd3Jp
dGVzIHRvIHRoZSBibG9jayBkZXZpY2UgdmlhIHRoZSBzdWJtaXRfYmlvIHBhdGgsIGl0IGRvZXMg
bm90Cj4+IHVwZGF0ZSB0aGUgcGFnZSBjYWNoZSBvZiB0aGUgYmxvY2sgZGV2aWNlIGZpbGUuIEFz
IGEgcmVzdWx0LCB0aGUgZGF0YSBpbgo+PiB0aGUgYmxvY2sgZGV2aWNlIGZpbGXigJlzIHBhZ2Ug
Y2FjaGUgbWF5IGJlY29tZSBzdGFsZS4gVGhlcmVmb3JlLCB0aGUgcGFnZQo+PiBjYWNoZSBtdXN0
IGJlIGludmFsaWRhdGVkIGR1cmluZyB1bm1vdW50Lgo+IAo+IFdlbGwsIGNhbiB3ZSBjYWxsIGlv
Y3RsKGZkLCBCTEtGTFNCVUYpIGZvciBhbGwgZGV2aWNlcyBiZWxvbmcgdG8gZjJmcyBpbWcgbGlr
ZQo+IHlvdSBkaWQgaW4gKCJmMmZzLXRvb2xzOiBpbnZhbGlkYXRlIGJsb2NrIGRldmljZSBwYWdl
IGNhY2hlIGJlZm9yZSByZWFkaW5nCj4gbWV0YWRhdGEiKSwgZG9lcyB0aGF0IGZpeCB0aGUgaXNz
dWU/CgpPaCwgeW91IGFscmVhZHkgY2FsbGVkIHRoZSBpb2N0bCBmb3IgYWxsIGRldmljZXMuIERv
ZXMgdGhhdCBmaXggdGhlIGlzc3VlPwoKVGhhbmtzLAoKPiAKPiBUaGFua3MsCj4gCj4+Cj4+IFRo
YW5rcwo+PiBZb25ncGVuZywKPj4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4+ICvCoMKgwqAgZm9y
IChpID0gMTsgaSA8IHNiaS0+c19uZGV2czsgaSsrKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN5
bmNfYmxvY2tkZXYoRkRFVihpKS5iZGV2KTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaW52YWxpZGF0
ZV9iZGV2KEZERVYoaSkuYmRldik7Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gwqDCoCB9Cj4+Pj4gwqDC
oCDCoCBpbnQgZjJmc19zeW5jX2ZzKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCBzeW5jKQo+
Pj4KPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pgo+IAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

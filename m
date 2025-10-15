Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1330BDC1C4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Oct 2025 04:08:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqKACew/1/Ao0YgJ5Hnl2KmKqSziPK3efJKlW6qsdz8=; b=d3CifEqFmYemZwpRcJlkz7OWIG
	B4qtfF4EakfHJd22mKHeLJmP1NR6wm4pp/qLdosfX5WIbOxKkTejWNuSIUpch7dP9dRW5Qsw0hipo
	uQBT8SzQgNI2oj2a2YpZi+GH5fgFNUJKkcPoDzGWneUEfjIMMbGYffotNHFO1S2wQewI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8qvd-0002AT-QF;
	Wed, 15 Oct 2025 02:07:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v8qvc-0002AL-RI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 02:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=92/H+g6r+R7W4z4MWsEYBGkk9uyptg/Unr6Uj77tQWc=; b=LDnRdWhLoKrNNmwgh1BlyKPFem
 PpUVh8jgd+zBrqkW2H/D32BgnuctDsia7h61Fey/JhB7XOL2+rnNIUn40DAfUxKcuH4K/vJP6tssc
 twufFlXyNn+1BOw9sLolsg1xvFJ6OLi9FsrUstB8q4LeOYPtJXw7a2rddutz++MKGgY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=92/H+g6r+R7W4z4MWsEYBGkk9uyptg/Unr6Uj77tQWc=; b=czg3onrXLjHFcyeEAeZJgHdVPJ
 bBaDezd8j11pdWz04iv6P3QQHxHjzgYhovFBM1nDVCx2zs66bZs3GpFD4uYC0dTQI1+YQ0AOqTIhA
 oUNZHfLu8+sKL/VQRoKmapjX5XWxI3V8N7f/l7J9GoQ2Vpjyek1YvubaWiVg+dFmfBhY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8qvc-00089d-4Q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 02:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C3A9C49265;
 Wed, 15 Oct 2025 02:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D753C4CEE7;
 Wed, 15 Oct 2025 02:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760494057;
 bh=r3s5KOElWYCtsVlPj4Q5QwfyWIzkNBr1wmVAWFj+rxM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OtoZfxpeQA2SGg/3tQX9WUA6cKe4uqBbhD6UywF7ROQfYzBB941ASvaKnruH2RgdI
 K77uMvv2Pod4cWK3rVY5516QfW4YOGvuonZzDfLcvbGsbQguEymKq8xMYOTSDhmiV5
 2scBzF9U77ea1oQjWocTshj3CQpXv0W4xPgTfb90kTjXd5hZR3j+0ooJebkA8RVa9+
 tMJDL+qcgOaxJvEp9dhGOz56R1B9wXmvl1f+sH0Hwls9mJblbAZsRdRrICdo5l43Sc
 3UevGMTxRGo91hRqSsxZMtMVWRoCvFNMgqh0ReNKNC5/hlOgqFjBHa3z02ptf2e5FR
 casU3zy3X+djw==
Message-ID: <741474df-149b-4a41-8487-a88509edfe5d@kernel.org>
Date: Wed, 15 Oct 2025 10:07:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Bai, Shuangpeng" <sjb7183@psu.edu>
References: <44D8F7B3-68AD-425F-9915-65D27591F93F@psu.edu>
 <61a3acc4-d541-41a4-b675-67b20f125117@kernel.org>
 <6E931354-7EF6-45B3-99A9-6E632FE98D03@psu.edu>
 <13833d95-cb78-49ce-9a29-1bee30dc6a38@kernel.org>
 <442A9745-DC2E-41E3-8CD6-9B5E2B55D9F3@psu.edu>
Content-Language: en-US
In-Reply-To: <442A9745-DC2E-41E3-8CD6-9B5E2B55D9F3@psu.edu>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/15/25 04:46, Bai, Shuangpeng wrote: > > >> On Oct 14, 
 2025, at 02:18, Chao Yu <chao@kernel.org> wrote: >> >> On 10/14/25 01:56,
 Bai, Shuangpeng wrote: >>> >>> >>>> On Oct 13, 2025, at 08:41, Cha [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8qvc-00089d-4Q
Subject: Re: [f2fs-dev] [BUG] f2fs: divide error in
 f2fs_all_cluster_page_ready on v6.17
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMTUvMjUgMDQ6NDYsIEJhaSwgU2h1YW5ncGVuZyB3cm90ZToKPiAKPiAKPj4gT24gT2N0
IDE0LCAyMDI1LCBhdCAwMjoxOCwgQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4K
Pj4gT24gMTAvMTQvMjUgMDE6NTYsIEJhaSwgU2h1YW5ncGVuZyB3cm90ZToKPj4+Cj4+Pgo+Pj4+
IE9uIE9jdCAxMywgMjAyNSwgYXQgMDg6NDEsIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4+Pj4KPj4+PiBPbiAxMC8xMy8yNSAwNzo0OSwgQmFpLCBTaHVhbmdwZW5nIHdyb3RlOgo+
Pj4+PiBIaSBLZXJuZWwgTWFpbnRhaW5lcnMsCj4+Pj4+Cj4+Pj4+IE91ciB0b29sIGZvdW5kIGEg
bmV3IGtlcm5lbCBidWcgImRpdmlkZSBlcnJvciBpbiBmMmZzX2FsbF9jbHVzdGVyX3BhZ2VfcmVh
ZHkiLiBQbGVhc2Ugc2VlIHRoZSBkZXRhaWxzIGJlbG93Lgo+Pj4+Pgo+Pj4+PiBLZXJuZWwgY29t
bWl0OiA2LjE3Cj4+Pj4+IEtlcm5lbCBjb25maWc6IGF0dGFjaG1lbnQKPj4+Pj4gUmVwcm9kdWNl
cjogYXR0YWNobWVudAo+Pj4+Pgo+Pj4+PiBUaGUgcmVwcm9kdWNlciB0cmlnZ2VycyB0aGUgY3Jh
c2ggcmVsaWFibHkgaW4gfjUwMCBzZWNvbmRzIG9uIGEgUUVNVSB4ODZfNjQgVk0uCj4+Pj4+Cj4+
Pj4+IEnigJltIGhhcHB5IHRvIHRlc3QgZGVidWcgcGF0Y2hlcyBvciBwcm92aWRlIGFkZGl0aW9u
YWwgaW5mb3JtYXRpb24uCj4+Pj4KPj4+PiBIaSBCYWksCj4+Pj4KPj4+PiBUaGFua3MgZm9yIHlv
dXIgcmVwb3J0IQo+Pj4+Cj4+Pj4gQ291bGQgeW91IHBsZWFzZSBzaGFyZSBzY3JpcHRzIGFuZCBp
bWFnZXMgZm9yIHRoaXMgaXNzdWU/IGFzIEkgY2FuIG5vdCByZXByb2R1Y2UKPj4+PiB3LyByZXBy
by5jLgo+Pj4+Cj4+Pgo+Pj4gVGhhbmtzIGZvciB5b3VyIHJlcGx5IQo+Pj4KPj4+IEkgdXNlZCBj
bGFuZy0xNSB0byBjb21waWxlIHRoZSBrZXJuZWwgdjYuMTcgd2l0aCB0aGUgLmNvbmZpZyBpbiB0
aGUgYXR0YWNobWVudC4KPj4+Cj4+PiBUaGUgaW1hZ2UgSSB1c2VkIGlzIGJ1bGxzZXllLmltZyAo
aHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xa3JMOU1jLXMwN2FBNm0tMFZqdXVPNzY3
U3RhY3ZaUVYvdmlldz91c3A9c2hhcmVfbGluaykuCj4+Pgo+Pj4gVGhlIGltYWdlIGlzIGNyZWF0
ZWQgYnkgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2dvb2dsZS9zeXprYWxsZXIv
bWFzdGVyL3Rvb2xzL2NyZWF0ZS1pbWFnZS5zaC4KPj4+Cj4+PiBJIHdpbGwgYWxzbyBzZW5kIHRo
ZSBib290IHNjcmlwdCBhcyBhdHRhY2htZW50cy4KPj4+Cj4+PiBUaGlzIGJ1ZyB0YWtlcyBhYm91
dCA1MDAgc2Vjb25kcyB0byB0cmlnZ2VyIHRoZSBidWcgaW4gb3VyIHRlc3RpbmcgZW52aXJvbm1l
bnQuCj4+Pgo+Pj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIGFueXRoaW5nIG5lZWRlZC4gVGhhbmtz
IQo+Pgo+PiBUaGFua3MgZm9yIHByb3ZpZGluZyB0aGUgaW5mb3JtYXRpb24sIGhvd2V2ZXIgSSBz
dGlsbCBjYW4gbm90IHJlcHJvZHVjZSB0aGlzIGJ1ZyB3Lwo+PiBhYm92ZSBpbWFnZXMgYW5kIHNj
cmlwdHMuCj4+Cj4+IENvdWxkIHlvdSBwbGVhc2UgdXBsb2FkIHlvdXIga2VybmVsIGltYWdlIGFz
IHdlbGw/IGxldCBtZSBoYXZlIGEgdHJ5IHcvIHlvdXIgaW1hZ2UsCj4+IG5vdCBzdXJlIGl0J3Mg
cmVsYXRlZCB0byBjbGFuZy0xNSBvciBub3QuCj4+Cj4gCj4gVGhlIHZtbGludXg6IGh0dHBzOi8v
ZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMXVkakV0OHNTVjFkX2tJRjNFNUlabWhPVGhHOU1EaDFz
L3ZpZXc/dXNwPXNoYXJpbmcKCk9oLCBjb3VsZCB5b3UgcGxlYXNlIHVwbG9hZCBiekltYWdlIGFz
IHdlbGw/IFRoYW5rcyBhIGxvdC4KClRoYW5rcywKCj4gCj4gUGxlYXNlIGxldCBtZSBrbm93IGZv
ciBhbnkgZnVydGhlciBxdWVzdGlvbnMuCj4gCj4gVGhhbmtzLAo+IAo+IAo+IAo+PiBUaGFua3Ms
Cj4+Cj4+Pgo+Pj4KPj4+Cj4+Pgo+Pj4KPj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+Cj4+Pj4+
Cj4+Pj4+IE9vcHM6IGRpdmlkZSBlcnJvcjogMDAwMCBbIzFdIFNNUCBLQVNBTiBQVEkKPj4+Pj4g
Q1BVOiAwIFVJRDogMCBQSUQ6IDExNDQxIENvbW06IHN5ei4wLjQ2IE5vdCB0YWludGVkIDYuMTcu
MCAjMSBQUkVFTVBUKGZ1bGwpCj4+Pj4+IEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMg
KGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIDEuMTUuMC0xIDA0LzAxLzIwMTQKPj4+Pj4gUklQ
OiAwMDEwOmYyZnNfYWxsX2NsdXN0ZXJfcGFnZV9yZWFkeSsweDEwNi8weDU1MCBmcy9mMmZzL2Nv
bXByZXNzLmM6ODU3Cj4+Pj4+IENvZGU6IDAwIDhiIDRkIDAwIDQ4IDg5IGQ4IDQ4IGMxIGU4IDIw
IDc0IDE5IDQ4IDg5IGQ4IDMxIGQyIDQ4IGY3IGYxIDQ4IDg5IGQ1IGViIDE0IDQ4IDg5IDVjIDI0
IDEwIGU4IDQwIGE0IDZkIGZkIGViIDJkIDg5IGQ4IDMxIGQyIDxmNz4gZjEgODkgZDUgMzEgZmYg
NDggODkgZWUgZTggMGMgYTkgNmQgZmQgNDggODUgZWQgNzQgMGMgZTggMjIgYTQKPj4+Pj4gUlNQ
OiAwMDE4OmZmZmZjOTAwMDY2MTZlNjAgRUZMQUdTOiAwMDAxMDI0Ngo+Pj4+PiBSQVg6IDAwMDAw
MDAwMDAwMDAwMDMgUkJYOiAwMDAwMDAwMDAwMDAwMDAzIFJDWDogMDAwMDAwMDAwMDAwMDAwMAo+
Pj4+PiBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogMDAw
MDAwMDAwMDAwMDAwMAo+Pj4+PiBSQlA6IGZmZmZjOTAwMDY2MTcyNzAgUjA4OiBmZmZmZmZmZjg0
NTUyZDI2IFIwOTogMDAwMDAwMDAwMDAwMDAwMAo+Pj4+PiBSMTA6IGZmZmY4ODgxNTVhZDIwMDAg
UjExOiBmZmZmZmZmZjgxZDJhYTI2IFIxMjogMDAwMDAwMDAwMDAwMDAwMQo+Pj4+PiBSMTM6IGRm
ZmZmYzAwMDAwMDAwMDAgUjE0OiAwMDAwMDAwMDAwMDAwMDEwIFIxNTogZmZmZmM5MDAwNjYxNzI2
MAo+Pj4+PiBGUzogIDAwMDA3ZjhiYWM1YjU2NDAoMDAwMCkgR1M6ZmZmZjg4ODIyMGYwMjAwMCgw
MDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4+Pj4+IENTOiAgMDAxMCBEUzogMDAwMCBFUzog
MDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPj4+Pj4gQ1IyOiAwMDAwNTY1MDhhMzI2MDAwIENS
MzogMDAwMDAwMDExN2JlYzAwMCBDUjQ6IDAwMDAwMDAwMDAwMDA2ZjAKPj4+Pj4gQ2FsbCBUcmFj
ZToKPj4+Pj4gPFRBU0s+Cj4+Pj4+IGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMgZnMvZjJmcy9kYXRh
LmM6MzA3OCBbaW5saW5lXQo+Pj4+PiBfX2YyZnNfd3JpdGVfZGF0YV9wYWdlcyBmcy9mMmZzL2Rh
dGEuYzozMjkwIFtpbmxpbmVdCj4+Pj4+IGYyZnNfd3JpdGVfZGF0YV9wYWdlcysweDFjMTkvMHgz
NjAwIGZzL2YyZnMvZGF0YS5jOjMzMTcKPj4+Pj4gZG9fd3JpdGVwYWdlcysweDM4ZS8weDY0MCBt
bS9wYWdlLXdyaXRlYmFjay5jOjI2MzQKPj4+Pj4gZmlsZW1hcF9mZGF0YXdyaXRlX3diYyBtbS9m
aWxlbWFwLmM6Mzg2IFtpbmxpbmVdCj4+Pj4+IF9fZmlsZW1hcF9mZGF0YXdyaXRlX3JhbmdlIG1t
L2ZpbGVtYXAuYzo0MTkgW2lubGluZV0KPj4+Pj4gZmlsZV93cml0ZV9hbmRfd2FpdF9yYW5nZSsw
eDJiYS8weDNlMCBtbS9maWxlbWFwLmM6Nzk0Cj4+Pj4+IGYyZnNfZG9fc3luY19maWxlKzB4NmU2
LzB4MWIwMCBmcy9mMmZzL2ZpbGUuYzoyOTQKPj4+Pj4gZ2VuZXJpY193cml0ZV9zeW5jIGluY2x1
ZGUvbGludXgvZnMuaDozMDQzIFtpbmxpbmVdCj4+Pj4+IGYyZnNfZmlsZV93cml0ZV9pdGVyKzB4
NzZlLzB4MjcwMCBmcy9mMmZzL2ZpbGUuYzo1MjU5Cj4+Pj4+IG5ld19zeW5jX3dyaXRlIGZzL3Jl
YWRfd3JpdGUuYzo1OTMgW2lubGluZV0KPj4+Pj4gdmZzX3dyaXRlKzB4N2U5LzB4ZTAwIGZzL3Jl
YWRfd3JpdGUuYzo2ODYKPj4+Pj4ga3N5c193cml0ZSsweDE5ZC8weDJkMCBmcy9yZWFkX3dyaXRl
LmM6NzM4Cj4+Pj4+IGRvX3N5c2NhbGxfeDY0IGFyY2gveDg2L2VudHJ5L3N5c2NhbGxfNjQuYzo2
MyBbaW5saW5lXQo+Pj4+PiBkb19zeXNjYWxsXzY0KzB4ZjcvMHg0NzAgYXJjaC94ODYvZW50cnkv
c3lzY2FsbF82NC5jOjk0Cj4+Pj4+IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3
LzB4N2YKPj4+Pj4gUklQOiAwMDMzOjB4N2Y4YmFiN2FlNDlkCj4+Pj4+IENvZGU6IDAyIGI4IGZm
IGZmIGZmIGZmIGMzIDY2IDBmIDFmIDQ0IDAwIDAwIGYzIDBmIDFlIGZhIDQ4IDg5IGY4IDQ4IDg5
IGY3IDQ4IDg5IGQ2IDQ4IDg5IGNhIDRkIDg5IGMyIDRkIDg5IGM4IDRjIDhiIDRjIDI0IDA4IDBm
IDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggYzcgYzEgYTggZmYgZmYgZmYgZjcg
ZDggNjQgODkgMDEgNDgKPj4+Pj4gUlNQOiAwMDJiOjAwMDA3ZjhiYWM1YjRmOTggRUZMQUdTOiAw
MDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDAwMQo+Pj4+PiBSQVg6IGZmZmZmZmZmZmZm
ZmZmZGEgUkJYOiAwMDAwN2Y4YmFiYTI2MTgwIFJDWDogMDAwMDdmOGJhYjdhZTQ5ZAo+Pj4+PiBS
RFg6IDAwMDAwMDAwMDAwMGZmYmQgUlNJOiAwMDAwMjAwMDAwMDAwMjQwIFJESTogMDAwMDAwMDAw
MDAwMDAwNwo+Pj4+PiBSQlA6IDAwMDA3ZjhiYWI4NDgyNjggUjA4OiAwMDAwMDAwMDAwMDAwMDAw
IFIwOTogMDAwMDAwMDAwMDAwMDAwMAo+Pj4+PiBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAw
MDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAwMDAwMDAwMDAwMDAwMAo+Pj4+PiBSMTM6IDAwMDA3Zjhi
YWJhMjYyMTggUjE0OiAwMDAwN2Y4YmFiYTI2MTgwIFIxNTogMDAwMDdmOGJhYzU5NTAwMAo+Pj4+
PiA8L1RBU0s+Cj4+Pj4+IE1vZHVsZXMgbGlua2VkIGluOgo+Pj4+PiAtLS1bIGVuZCB0cmFjZSAw
MDAwMDAwMDAwMDAwMDAwIF0tLS0KPj4+Pj4gUklQOiAwMDEwOmYyZnNfYWxsX2NsdXN0ZXJfcGFn
ZV9yZWFkeSsweDEwNi8weDU1MCBmcy9mMmZzL2NvbXByZXNzLmM6ODU3Cj4+Pj4+IENvZGU6IDAw
IDhiIDRkIDAwIDQ4IDg5IGQ4IDQ4IGMxIGU4IDIwIDc0IDE5IDQ4IDg5IGQ4IDMxIGQyIDQ4IGY3
IGYxIDQ4IDg5IGQ1IGViIDE0IDQ4IDg5IDVjIDI0IDEwIGU4IDQwIGE0IDZkIGZkIGViIDJkIDg5
IGQ4IDMxIGQyIDxmNz4gZjEgODkgZDUgMzEgZmYgNDggODkgZWUgZTggMGMgYTkgNmQgZmQgNDgg
ODUgZWQgNzQgMGMgZTggMjIgYTQKPj4+Pj4gUlNQOiAwMDE4OmZmZmZjOTAwMDY2MTZlNjAgRUZM
QUdTOiAwMDAxMDI0Ngo+Pj4+PiBSQVg6IDAwMDAwMDAwMDAwMDAwMDMgUkJYOiAwMDAwMDAwMDAw
MDAwMDAzIFJDWDogMDAwMDAwMDAwMDAwMDAwMAo+Pj4+PiBSRFg6IDAwMDAwMDAwMDAwMDAwMDAg
UlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogMDAwMDAwMDAwMDAwMDAwMAo+Pj4+PiBSQlA6IGZm
ZmZjOTAwMDY2MTcyNzAgUjA4OiBmZmZmZmZmZjg0NTUyZDI2IFIwOTogMDAwMDAwMDAwMDAwMDAw
MAo+Pj4+PiBSMTA6IGZmZmY4ODgxNTVhZDIwMDAgUjExOiBmZmZmZmZmZjgxZDJhYTI2IFIxMjog
MDAwMDAwMDAwMDAwMDAwMQo+Pj4+PiBSMTM6IGRmZmZmYzAwMDAwMDAwMDAgUjE0OiAwMDAwMDAw
MDAwMDAwMDEwIFIxNTogZmZmZmM5MDAwNjYxNzI2MAo+Pj4+PiBGUzogIDAwMDA3ZjhiYWM1YjU2
NDAoMDAwMCkgR1M6ZmZmZjg4ODIyMGYwMjAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAw
Cj4+Pj4+IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMK
Pj4+Pj4gQ1IyOiAwMDAwNTY1MDhhMzI2MDAwIENSMzogMDAwMDAwMDExN2JlYzAwMCBDUjQ6IDAw
MDAwMDAwMDAwMDA2ZjAKPj4+Pj4gLS0tLS0tLS0tLS0tLS0tLQo+Pj4+PiBDb2RlIGRpc2Fzc2Vt
Ymx5IChiZXN0IGd1ZXNzKToKPj4+Pj4gIDA6IDAwIDhiIDRkIDAwIDQ4IDg5ICAgICBhZGQgICAg
JWNsLC0weDc2YjdmZmIzKCVyYngpCj4+Pj4+ICA2OiBkOCA0OCBjMSAgICAgICAgICAgICAgZm11
bHMgIC0weDNmKCVyYXgpCj4+Pj4+ICA5OiBlOCAyMCA3NCAxOSA0OCAgICAgICAgY2FsbCAgIDB4
NDgxOTc0MmUKPj4+Pj4gIGU6IDg5IGQ4ICAgICAgICAgICAgICAgICBtb3YgICAgJWVieCwlZWF4
Cj4+Pj4+IDEwOiAzMSBkMiAgICAgICAgICAgICAgICAgeG9yICAgICVlZHgsJWVkeAo+Pj4+PiAx
MjogNDggZjcgZjEgICAgICAgICAgICAgIGRpdiAgICAlcmN4Cj4+Pj4+IDE1OiA0OCA4OSBkNSAg
ICAgICAgICAgICAgbW92ICAgICVyZHgsJXJicAo+Pj4+PiAxODogZWIgMTQgICAgICAgICAgICAg
ICAgIGptcCAgICAweDJlCj4+Pj4+IDFhOiA0OCA4OSA1YyAyNCAxMCAgICAgICAgbW92ICAgICVy
YngsMHgxMCglcnNwKQo+Pj4+PiAxZjogZTggNDAgYTQgNmQgZmQgICAgICAgIGNhbGwgICAweGZk
NmRhNDY0Cj4+Pj4+IDI0OiBlYiAyZCAgICAgICAgICAgICAgICAgam1wICAgIDB4NTMKPj4+Pj4g
MjY6IDg5IGQ4ICAgICAgICAgICAgICAgICBtb3YgICAgJWVieCwlZWF4Cj4+Pj4+IDI4OiAzMSBk
MiAgICAgICAgICAgICAgICAgeG9yICAgICVlZHgsJWVkeAo+Pj4+PiAqIDJhOiBmNyBmMSAgICAg
ICAgICAgICAgICAgZGl2ICAgICVlY3ggPC0tIHRyYXBwaW5nIGluc3RydWN0aW9uCj4+Pj4+IDJj
OiA4OSBkNSAgICAgICAgICAgICAgICAgbW92ICAgICVlZHgsJWVicAo+Pj4+PiAyZTogMzEgZmYg
ICAgICAgICAgICAgICAgIHhvciAgICAlZWRpLCVlZGkKPj4+Pj4gMzA6IDQ4IDg5IGVlICAgICAg
ICAgICAgICBtb3YgICAgJXJicCwlcnNpCj4+Pj4+IDMzOiBlOCAwYyBhOSA2ZCBmZCAgICAgICAg
Y2FsbCAgIDB4ZmQ2ZGE5NDQKPj4+Pj4gMzg6IDQ4IDg1IGVkICAgICAgICAgICAgICB0ZXN0ICAg
JXJicCwlcmJwCj4+Pj4+IDNiOiA3NCAwYyAgICAgICAgICAgICAgICAgamUgICAgIDB4NDkKPj4+
Pj4gM2Q6IGU4ICAgICAgICAgICAgICAgICAgICAuYnl0ZSAweGU4Cj4+Pj4+IDNlOiAyMiAgICAg
ICAgICAgICAgICAgICAgLmJ5dGUgMHgyMgo+Pj4+PiAzZjogYTQgICAgICAgICAgICAgICAgICAg
IG1vdnNiICAlZHM6KCVyc2kpLCVlczooJXJkaSkKPj4+Pj4KPj4+Pj4gQmVzdCwKPj4+Pj4gU2h1
YW5ncGVuZwo+IAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

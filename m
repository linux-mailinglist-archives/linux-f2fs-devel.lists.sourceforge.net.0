Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D5DBF9BFC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Oct 2025 04:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5Ub++/e7VRDf2NpZ2EwrD3oqxY7AuNkdj0u+iogJJs=; b=OpIxhdzfFN9Jk3oF6BlWrIqg1w
	lpPWGqtvjHbRRoIIvtrKfPHP+EDqiIz/qsBW0B0c/h7MgV8R5jYU3JU0OC69cwdlVH2BdrUqYii/c
	+EpM1DeD+MIoTKayw9sCvBboCu49w3K4g0040Kn3N/xlgin8CSmlX1bRTD0mx+47fOmk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vBOjF-0001XV-1n;
	Wed, 22 Oct 2025 02:37:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vBOjD-0001XM-T7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Oct 2025 02:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y97dBDerFCvgBoYIzjeJJPi6R1NjBafwjI7lFO2FSpg=; b=PEtY14afDS8AiGSPpo1H4iilCv
 Gm28izN0WZoYASpXMc3h1iien7BIhTwatZJAvfgmqWasPnNA85YsFfDhOImwMPIYq2f7HzbaVnnnc
 ycdFev30La8gjT+zhmTATAt5MtyH1/7rxW6EeYoUSuP3su3pg+ti0DqToGAhnVU/nA8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y97dBDerFCvgBoYIzjeJJPi6R1NjBafwjI7lFO2FSpg=; b=N+NYBKudC+oIjXnJpRFmjkKF2Z
 Wr5f1Z3n/mDdMvIHOF/0LVRKe2atMTVx9l9tFf1FgpeAUzyVF1AwQu9G2XN5cBba4Y0gu3oCIkGzc
 tb5Oudas7fDG4EF1rBFuffQSkMhYmmgyOfl19jL8GGi2GTh35r0Yo/pdifA45263wpFg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vBOjC-0004lZ-Rw for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Oct 2025 02:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E485445B1;
 Wed, 22 Oct 2025 02:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EEEC4CEF1;
 Wed, 22 Oct 2025 02:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761100645;
 bh=ml/xeYDhTNx1bgatCCjgOtANITCdQ3MIYRxTyroOLqc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=csH0zhXfncwQIBpJyKsvZzt7kJzwiJoz7P+ryKKluQo147609cPJsoac1xWxHtr0t
 tsn3g6gLcMnzKcUveuQqrFAmVPRh93yaqAEOhxhwrEdsgR5UydqGABqEAab/JaFF1D
 z1idp4HfEPIUeahgeG5ZZ5rgjt3JiciTKWgiWX1tZzyLhIdubcr/2GJqpVvsDB20hh
 nCdLvqKEYdaCzJolHgIS+TTstpgCs9Km3a+ltrcRP9uOOjiFNS4ZrO9fBWJ02t7mw2
 C2ZcVVi1kEdRGUZjkIg5LTKTS68goNHy79AfrkukNxIQM9bwh9O3utlgRB31KtudIv
 KKu5Lk7oIg/Xg==
Message-ID: <90d89437-8a8f-4b6f-9aa1-3cf47ed9f9c3@kernel.org>
Date: Wed, 22 Oct 2025 10:37:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Bai, Shuangpeng" <SJB7183@PSU.EDU>
References: <44D8F7B3-68AD-425F-9915-65D27591F93F@psu.edu>
 <54ad259c-b29f-4444-8d3c-1ec37abc628d@kernel.org>
 <A08A3C40-FC46-4A14-A946-6C5D354FE9AB@psu.edu>
Content-Language: en-US
In-Reply-To: <A08A3C40-FC46-4A14-A946-6C5D354FE9AB@psu.edu>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/22/25 08:57, Bai, Shuangpeng wrote: > > >> On Oct 19, 
 2025, at 23:15, Chao Yu <chao@kernel.org> wrote: >> >> Hi Bai,
 >> >> On 10/12/25
 23:49, Bai, Shuangpeng wrote: >>> Hi Kernel Maintainers, >> [...] 
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
X-Headers-End: 1vBOjC-0004lZ-Rw
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

T24gMTAvMjIvMjUgMDg6NTcsIEJhaSwgU2h1YW5ncGVuZyB3cm90ZToKPiAKPiAKPj4gT24gT2N0
IDE5LCAyMDI1LCBhdCAyMzoxNSwgQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4K
Pj4gSGkgQmFpLAo+Pgo+PiBPbiAxMC8xMi8yNSAyMzo0OSwgQmFpLCBTaHVhbmdwZW5nIHdyb3Rl
Ogo+Pj4gSGkgS2VybmVsIE1haW50YWluZXJzLAo+Pj4gT3VyIHRvb2wgZm91bmQgYSBuZXcga2Vy
bmVsIGJ1ZyAiZGl2aWRlIGVycm9yIGluIGYyZnNfYWxsX2NsdXN0ZXJfcGFnZV9yZWFkeSIuIFBs
ZWFzZSBzZWUgdGhlIGRldGFpbHMgYmVsb3cuCj4+PiBLZXJuZWwgY29tbWl0OiA2LjE3Cj4+PiBL
ZXJuZWwgY29uZmlnOiBhdHRhY2htZW50Cj4+PiBSZXByb2R1Y2VyOiBhdHRhY2htZW50Cj4+PiBU
aGUgcmVwcm9kdWNlciB0cmlnZ2VycyB0aGUgY3Jhc2ggcmVsaWFibHkgaW4gfjUwMCBzZWNvbmRz
IG9uIGEgUUVNVSB4ODZfNjQgVk0uCj4+PiBJ4oCZbSBoYXBweSB0byB0ZXN0IGRlYnVnIHBhdGNo
ZXMgb3IgcHJvdmlkZSBhZGRpdGlvbmFsIGluZm9ybWF0aW9uLgo+Pgo+PiBGaW5hbGx5LCBJIGNh
biByZXByb2R1Y2UgdGhpcyBidWcsIHRoYW5rcyBmb3IgeW91ciBoZWxwLiA6KQo+Pgo+PiBJIGhh
dmUgZmlndXJlZCBvdXQgYSBmaXggYmVsb3csIGNvdWxkIHlvdSBwbGVhc2UgaGVscCB0byB0ZXN0
IGl0Pwo+Pgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjUx
MDIwMDIzNDUzLjMyOTQ2Ny0xLWNoYW9Aa2VybmVsLm9yZwo+Pgo+IAo+IEkgYXBwbGllZCB0aGUg
cGF0Y2ggdG8gdjYuMTgtcmMyIGFuZCByZXJhbiB0aGUgcmVwcm9kdWNlci4gVGhlIGlzc3VlIG5v
IGxvbmdlciByZXByb2R1Y2VzLgoKVGhhbmtzIGEgbG90cyBmb3IgeW91ciBoZWxwISA6KQoKVGhh
bmtzLAoKPiAKPiBUaGFuayB5b3UhCj4gCj4gCj4gCj4+IFRoYW5rcywKPj4KPj4+IE9vcHM6IGRp
dmlkZSBlcnJvcjogMDAwMCBbIzFdIFNNUCBLQVNBTiBQVEkKPj4+IENQVTogMCBVSUQ6IDAgUElE
OiAxMTQ0MSBDb21tOiBzeXouMC40NiBOb3QgdGFpbnRlZCA2LjE3LjAgIzEgUFJFRU1QVChmdWxs
KQo+Pj4gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5
NiksIEJJT1MgMS4xNS4wLTEgMDQvMDEvMjAxNAo+Pj4gUklQOiAwMDEwOmYyZnNfYWxsX2NsdXN0
ZXJfcGFnZV9yZWFkeSsweDEwNi8weDU1MCBmcy9mMmZzL2NvbXByZXNzLmM6ODU3Cj4+PiBDb2Rl
OiAwMCA4YiA0ZCAwMCA0OCA4OSBkOCA0OCBjMSBlOCAyMCA3NCAxOSA0OCA4OSBkOCAzMSBkMiA0
OCBmNyBmMSA0OCA4OSBkNSBlYiAxNCA0OCA4OSA1YyAyNCAxMCBlOCA0MCBhNCA2ZCBmZCBlYiAy
ZCA4OSBkOCAzMSBkMiA8Zjc+IGYxIDg5IGQ1IDMxIGZmIDQ4IDg5IGVlIGU4IDBjIGE5IDZkIGZk
IDQ4IDg1IGVkIDc0IDBjIGU4IDIyIGE0Cj4+PiBSU1A6IDAwMTg6ZmZmZmM5MDAwNjYxNmU2MCBF
RkxBR1M6IDAwMDEwMjQ2Cj4+PiBSQVg6IDAwMDAwMDAwMDAwMDAwMDMgUkJYOiAwMDAwMDAwMDAw
MDAwMDAzIFJDWDogMDAwMDAwMDAwMDAwMDAwMAo+Pj4gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJT
STogMDAwMDAwMDAwMDAwMDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDAKPj4+IFJCUDogZmZmZmM5
MDAwNjYxNzI3MCBSMDg6IGZmZmZmZmZmODQ1NTJkMjYgUjA5OiAwMDAwMDAwMDAwMDAwMDAwCj4+
PiBSMTA6IGZmZmY4ODgxNTVhZDIwMDAgUjExOiBmZmZmZmZmZjgxZDJhYTI2IFIxMjogMDAwMDAw
MDAwMDAwMDAwMQo+Pj4gUjEzOiBkZmZmZmMwMDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDAx
MCBSMTU6IGZmZmZjOTAwMDY2MTcyNjAKPj4+IEZTOiAgMDAwMDdmOGJhYzViNTY0MCgwMDAwKSBH
UzpmZmZmODg4MjIwZjAyMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPj4+IENTOiAg
MDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPj4+IENSMjogMDAw
MDU2NTA4YTMyNjAwMCBDUjM6IDAwMDAwMDAxMTdiZWMwMDAgQ1I0OiAwMDAwMDAwMDAwMDAwNmYw
Cj4+PiBDYWxsIFRyYWNlOgo+Pj4gIDxUQVNLPgo+Pj4gIGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMg
ZnMvZjJmcy9kYXRhLmM6MzA3OCBbaW5saW5lXQo+Pj4gIF9fZjJmc193cml0ZV9kYXRhX3BhZ2Vz
IGZzL2YyZnMvZGF0YS5jOjMyOTAgW2lubGluZV0KPj4+ICBmMmZzX3dyaXRlX2RhdGFfcGFnZXMr
MHgxYzE5LzB4MzYwMCBmcy9mMmZzL2RhdGEuYzozMzE3Cj4+PiAgZG9fd3JpdGVwYWdlcysweDM4
ZS8weDY0MCBtbS9wYWdlLXdyaXRlYmFjay5jOjI2MzQKPj4+ICBmaWxlbWFwX2ZkYXRhd3JpdGVf
d2JjIG1tL2ZpbGVtYXAuYzozODYgW2lubGluZV0KPj4+ICBfX2ZpbGVtYXBfZmRhdGF3cml0ZV9y
YW5nZSBtbS9maWxlbWFwLmM6NDE5IFtpbmxpbmVdCj4+PiAgZmlsZV93cml0ZV9hbmRfd2FpdF9y
YW5nZSsweDJiYS8weDNlMCBtbS9maWxlbWFwLmM6Nzk0Cj4+PiAgZjJmc19kb19zeW5jX2ZpbGUr
MHg2ZTYvMHgxYjAwIGZzL2YyZnMvZmlsZS5jOjI5NAo+Pj4gIGdlbmVyaWNfd3JpdGVfc3luYyBp
bmNsdWRlL2xpbnV4L2ZzLmg6MzA0MyBbaW5saW5lXQo+Pj4gIGYyZnNfZmlsZV93cml0ZV9pdGVy
KzB4NzZlLzB4MjcwMCBmcy9mMmZzL2ZpbGUuYzo1MjU5Cj4+PiAgbmV3X3N5bmNfd3JpdGUgZnMv
cmVhZF93cml0ZS5jOjU5MyBbaW5saW5lXQo+Pj4gIHZmc193cml0ZSsweDdlOS8weGUwMCBmcy9y
ZWFkX3dyaXRlLmM6Njg2Cj4+PiAga3N5c193cml0ZSsweDE5ZC8weDJkMCBmcy9yZWFkX3dyaXRl
LmM6NzM4Cj4+PiAgZG9fc3lzY2FsbF94NjQgYXJjaC94ODYvZW50cnkvc3lzY2FsbF82NC5jOjYz
IFtpbmxpbmVdCj4+PiAgZG9fc3lzY2FsbF82NCsweGY3LzB4NDcwIGFyY2gveDg2L2VudHJ5L3N5
c2NhbGxfNjQuYzo5NAo+Pj4gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4
N2YKPj4+IFJJUDogMDAzMzoweDdmOGJhYjdhZTQ5ZAo+Pj4gQ29kZTogMDIgYjggZmYgZmYgZmYg
ZmYgYzMgNjYgMGYgMWYgNDQgMDAgMDAgZjMgMGYgMWUgZmEgNDggODkgZjggNDggODkgZjcgNDgg
ODkgZDYgNDggODkgY2EgNGQgODkgYzIgNGQgODkgYzggNGMgOGIgNGMgMjQgMDggMGYgMDUgPDQ4
PiAzZCAwMSBmMCBmZiBmZiA3MyAwMSBjMyA0OCBjNyBjMSBhOCBmZiBmZiBmZiBmNyBkOCA2NCA4
OSAwMSA0OAo+Pj4gUlNQOiAwMDJiOjAwMDA3ZjhiYWM1YjRmOTggRUZMQUdTOiAwMDAwMDI0NiBP
UklHX1JBWDogMDAwMDAwMDAwMDAwMDAwMQo+Pj4gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDog
MDAwMDdmOGJhYmEyNjE4MCBSQ1g6IDAwMDA3ZjhiYWI3YWU0OWQKPj4+IFJEWDogMDAwMDAwMDAw
MDAwZmZiZCBSU0k6IDAwMDAyMDAwMDAwMDAyNDAgUkRJOiAwMDAwMDAwMDAwMDAwMDA3Cj4+PiBS
QlA6IDAwMDA3ZjhiYWI4NDgyNjggUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAw
MDAwMDAwMAo+Pj4gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBS
MTI6IDAwMDAwMDAwMDAwMDAwMDAKPj4+IFIxMzogMDAwMDdmOGJhYmEyNjIxOCBSMTQ6IDAwMDA3
ZjhiYWJhMjYxODAgUjE1OiAwMDAwN2Y4YmFjNTk1MDAwCj4+PiAgPC9UQVNLPgo+Pj4gTW9kdWxl
cyBsaW5rZWQgaW46Cj4+PiAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPj4+
IFJJUDogMDAxMDpmMmZzX2FsbF9jbHVzdGVyX3BhZ2VfcmVhZHkrMHgxMDYvMHg1NTAgZnMvZjJm
cy9jb21wcmVzcy5jOjg1Nwo+Pj4gQ29kZTogMDAgOGIgNGQgMDAgNDggODkgZDggNDggYzEgZTgg
MjAgNzQgMTkgNDggODkgZDggMzEgZDIgNDggZjcgZjEgNDggODkgZDUgZWIgMTQgNDggODkgNWMg
MjQgMTAgZTggNDAgYTQgNmQgZmQgZWIgMmQgODkgZDggMzEgZDIgPGY3PiBmMSA4OSBkNSAzMSBm
ZiA0OCA4OSBlZSBlOCAwYyBhOSA2ZCBmZCA0OCA4NSBlZCA3NCAwYyBlOCAyMiBhNAo+Pj4gUlNQ
OiAwMDE4OmZmZmZjOTAwMDY2MTZlNjAgRUZMQUdTOiAwMDAxMDI0Ngo+Pj4gUkFYOiAwMDAwMDAw
MDAwMDAwMDAzIFJCWDogMDAwMDAwMDAwMDAwMDAwMyBSQ1g6IDAwMDAwMDAwMDAwMDAwMDAKPj4+
IFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgUkRJOiAwMDAwMDAw
MDAwMDAwMDAwCj4+PiBSQlA6IGZmZmZjOTAwMDY2MTcyNzAgUjA4OiBmZmZmZmZmZjg0NTUyZDI2
IFIwOTogMDAwMDAwMDAwMDAwMDAwMAo+Pj4gUjEwOiBmZmZmODg4MTU1YWQyMDAwIFIxMTogZmZm
ZmZmZmY4MWQyYWEyNiBSMTI6IDAwMDAwMDAwMDAwMDAwMDEKPj4+IFIxMzogZGZmZmZjMDAwMDAw
MDAwMCBSMTQ6IDAwMDAwMDAwMDAwMDAwMTAgUjE1OiBmZmZmYzkwMDA2NjE3MjYwCj4+PiBGUzog
IDAwMDA3ZjhiYWM1YjU2NDAoMDAwMCkgR1M6ZmZmZjg4ODIyMGYwMjAwMCgwMDAwKSBrbmxHUzow
MDAwMDAwMDAwMDAwMDAwCj4+PiBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAw
MDAwMDgwMDUwMDMzCj4+PiBDUjI6IDAwMDA1NjUwOGEzMjYwMDAgQ1IzOiAwMDAwMDAwMTE3YmVj
MDAwIENSNDogMDAwMDAwMDAwMDAwMDZmMAo+Pj4gLS0tLS0tLS0tLS0tLS0tLQo+Pj4gQ29kZSBk
aXNhc3NlbWJseSAoYmVzdCBndWVzcyk6Cj4+PiAgICAwOiAwMCA4YiA0ZCAwMCA0OCA4OSAgICAg
YWRkICAgICVjbCwtMHg3NmI3ZmZiMyglcmJ4KQo+Pj4gICAgNjogZDggNDggYzEgICAgICAgICAg
ICAgIGZtdWxzICAtMHgzZiglcmF4KQo+Pj4gICAgOTogZTggMjAgNzQgMTkgNDggICAgICAgIGNh
bGwgICAweDQ4MTk3NDJlCj4+PiAgICBlOiA4OSBkOCAgICAgICAgICAgICAgICAgbW92ICAgICVl
YngsJWVheAo+Pj4gICAxMDogMzEgZDIgICAgICAgICAgICAgICAgIHhvciAgICAlZWR4LCVlZHgK
Pj4+ICAgMTI6IDQ4IGY3IGYxICAgICAgICAgICAgICBkaXYgICAgJXJjeAo+Pj4gICAxNTogNDgg
ODkgZDUgICAgICAgICAgICAgIG1vdiAgICAlcmR4LCVyYnAKPj4+ICAgMTg6IGViIDE0ICAgICAg
ICAgICAgICAgICBqbXAgICAgMHgyZQo+Pj4gICAxYTogNDggODkgNWMgMjQgMTAgICAgICAgIG1v
diAgICAlcmJ4LDB4MTAoJXJzcCkKPj4+ICAgMWY6IGU4IDQwIGE0IDZkIGZkICAgICAgICBjYWxs
ICAgMHhmZDZkYTQ2NAo+Pj4gICAyNDogZWIgMmQgICAgICAgICAgICAgICAgIGptcCAgICAweDUz
Cj4+PiAgIDI2OiA4OSBkOCAgICAgICAgICAgICAgICAgbW92ICAgICVlYngsJWVheAo+Pj4gICAy
ODogMzEgZDIgICAgICAgICAgICAgICAgIHhvciAgICAlZWR4LCVlZHgKPj4+ICogMmE6IGY3IGYx
ICAgICAgICAgICAgICAgICBkaXYgICAgJWVjeCA8LS0gdHJhcHBpbmcgaW5zdHJ1Y3Rpb24KPj4+
ICAgMmM6IDg5IGQ1ICAgICAgICAgICAgICAgICBtb3YgICAgJWVkeCwlZWJwCj4+PiAgIDJlOiAz
MSBmZiAgICAgICAgICAgICAgICAgeG9yICAgICVlZGksJWVkaQo+Pj4gICAzMDogNDggODkgZWUg
ICAgICAgICAgICAgIG1vdiAgICAlcmJwLCVyc2kKPj4+ICAgMzM6IGU4IDBjIGE5IDZkIGZkICAg
ICAgICBjYWxsICAgMHhmZDZkYTk0NAo+Pj4gICAzODogNDggODUgZWQgICAgICAgICAgICAgIHRl
c3QgICAlcmJwLCVyYnAKPj4+ICAgM2I6IDc0IDBjICAgICAgICAgICAgICAgICBqZSAgICAgMHg0
OQo+Pj4gICAzZDogZTggICAgICAgICAgICAgICAgICAgIC5ieXRlIDB4ZTgKPj4+ICAgM2U6IDIy
ICAgICAgICAgICAgICAgICAgICAuYnl0ZSAweDIyCj4+PiAgIDNmOiBhNCAgICAgICAgICAgICAg
ICAgICAgbW92c2IgICVkczooJXJzaSksJWVzOiglcmRpKQo+Pj4gQmVzdCwKPj4+IFNodWFuZ3Bl
bmcKPj4KPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=

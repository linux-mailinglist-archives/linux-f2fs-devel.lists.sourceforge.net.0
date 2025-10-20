Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CF1BEF2A8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Oct 2025 05:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkcamEdJp6e9gXGipGbcHIwzFDgYaNaZ41GzAxDZ/nI=; b=TquuFWBT+wl8KRbymGdQ6tr98r
	txQ7//Kkef6Y7CboVdHLmgfZnhuYvLYZ3YbjZDLsyj1RyII3DD+teCOmajn2+vRTYpui4c8XWazZY
	UDe3K2QPY33CVEaf+U4/B+YMKBQLX9kUyjuCDYR80Ei2/G7nzyW1teOHo9G1zhZ+mP7g=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vAgMm-0002kh-0x;
	Mon, 20 Oct 2025 03:15:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vAgMk-0002kT-NW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 03:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N/idsnXipV70IsFT6dVr2jf4H1P9X5txAy09QD7bYcA=; b=iM0ZRDdzmoTKnJH7VTe4uyiHdG
 0tjUhMmFHa7mT7MTyjWN1u088/58RgAVIHc//be9AB3TJhk9FZ0xqYhqkgLgZCMbswCGn5+X9vxus
 S3Wagq/uan7JV1+vmemQgFOEsqXZGXUXlYrbZgw3Eeyfe9zfu6TBps4qO57EsIZ9ZzA0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N/idsnXipV70IsFT6dVr2jf4H1P9X5txAy09QD7bYcA=; b=ZxggPCtiGv5KVn3Xbm4kXxV/Uz
 67+5hnE75gOvsYerfbyUEOYDIYLbX8favwBGCK1QIMPtw3ZRn0lUKmz0wg8VnUiBhQ1J+s1nxq2zs
 waPaZewGbCOSzCEUkK3Php4Wyhv8bQu5dxMP8vnexXlTBwHUB2pDyEDlXUcg+3UH7fZk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vAgMk-00007M-Fx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 03:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B897060097;
 Mon, 20 Oct 2025 03:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AA1C4CEF9;
 Mon, 20 Oct 2025 03:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760930111;
 bh=DS5T/YJJqo09OtEnG6ykFTxHXdt6Ff1HpV3fqDw6Glc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qc1++FI9IBh+tvY+jd1eUi3HWm5bUvLJ9W+QMPKMZjAy9AhCPQ6sMginPPTxbQnnX
 h1wg2I9JtyDhKKKguPFqZbPi2swTXbzfPjowgGNCpixvcN27cgC9A9KrgYT3BlFK6W
 t4S97pQ78PSYjvv0kg7sqIr7KTVq3z+bJkK7SznRGVTCdUPCLYaJMXeDIHwJljGg38
 jfBNTXVSHRtQcwkMnp9a2UHWWByu4JOSJsUJVb1DU9uWVTRLfj8xxd6kAggV5Ln8z+
 Hf6UqGrG++pItdN6E+LPwXspK7azEUV7kbO9mcIVf/cBtss4julq3v2bMGP9GGlPlo
 VouCaHLmdgJUw==
Message-ID: <54ad259c-b29f-4444-8d3c-1ec37abc628d@kernel.org>
Date: Mon, 20 Oct 2025 03:15:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Bai, Shuangpeng" <SJB7183@PSU.EDU>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <44D8F7B3-68AD-425F-9915-65D27591F93F@psu.edu>
Content-Language: en-US
In-Reply-To: <44D8F7B3-68AD-425F-9915-65D27591F93F@psu.edu>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Bai, On 10/12/25 23:49, Bai, Shuangpeng wrote: > Hi Kernel
 Maintainers,
 > > Our tool found a new kernel bug "divide error in
 f2fs_all_cluster_page_ready".
 Please see the details below. > > Kernel commit: 6 [...] 
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
X-Headers-End: 1vAgMk-00007M-Fx
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
Cc: "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQmFpLAoKT24gMTAvMTIvMjUgMjM6NDksIEJhaSwgU2h1YW5ncGVuZyB3cm90ZToKPiBIaSBL
ZXJuZWwgTWFpbnRhaW5lcnMsCj4gCj4gT3VyIHRvb2wgZm91bmQgYSBuZXcga2VybmVsIGJ1ZyAi
ZGl2aWRlIGVycm9yIGluIGYyZnNfYWxsX2NsdXN0ZXJfcGFnZV9yZWFkeSIuIFBsZWFzZSBzZWUg
dGhlIGRldGFpbHMgYmVsb3cuCj4gCj4gS2VybmVsIGNvbW1pdDogNi4xNwo+IEtlcm5lbCBjb25m
aWc6IGF0dGFjaG1lbnQKPiBSZXByb2R1Y2VyOiBhdHRhY2htZW50Cj4gCj4gVGhlIHJlcHJvZHVj
ZXIgdHJpZ2dlcnMgdGhlIGNyYXNoIHJlbGlhYmx5IGluIH41MDAgc2Vjb25kcyBvbiBhIFFFTVUg
eDg2XzY0IFZNLgo+IAo+IEnigJltIGhhcHB5IHRvIHRlc3QgZGVidWcgcGF0Y2hlcyBvciBwcm92
aWRlIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24uCgpGaW5hbGx5LCBJIGNhbiByZXByb2R1Y2UgdGhp
cyBidWcsIHRoYW5rcyBmb3IgeW91ciBoZWxwLiA6KQoKSSBoYXZlIGZpZ3VyZWQgb3V0IGEgZml4
IGJlbG93LCBjb3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gdGVzdCBpdD8KCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNTEwMjAwMjM0NTMuMzI5NDY3LTEtY2hhb0Br
ZXJuZWwub3JnCgpUaGFua3MsCgo+IAo+IAo+IE9vcHM6IGRpdmlkZSBlcnJvcjogMDAwMCBbIzFd
IFNNUCBLQVNBTiBQVEkKPiBDUFU6IDAgVUlEOiAwIFBJRDogMTE0NDEgQ29tbTogc3l6LjAuNDYg
Tm90IHRhaW50ZWQgNi4xNy4wICMxIFBSRUVNUFQoZnVsbCkKPiBIYXJkd2FyZSBuYW1lOiBRRU1V
IFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyAxLjE1LjAtMSAwNC8wMS8y
MDE0Cj4gUklQOiAwMDEwOmYyZnNfYWxsX2NsdXN0ZXJfcGFnZV9yZWFkeSsweDEwNi8weDU1MCBm
cy9mMmZzL2NvbXByZXNzLmM6ODU3Cj4gQ29kZTogMDAgOGIgNGQgMDAgNDggODkgZDggNDggYzEg
ZTggMjAgNzQgMTkgNDggODkgZDggMzEgZDIgNDggZjcgZjEgNDggODkgZDUgZWIgMTQgNDggODkg
NWMgMjQgMTAgZTggNDAgYTQgNmQgZmQgZWIgMmQgODkgZDggMzEgZDIgPGY3PiBmMSA4OSBkNSAz
MSBmZiA0OCA4OSBlZSBlOCAwYyBhOSA2ZCBmZCA0OCA4NSBlZCA3NCAwYyBlOCAyMiBhNAo+IFJT
UDogMDAxODpmZmZmYzkwMDA2NjE2ZTYwIEVGTEFHUzogMDAwMTAyNDYKPiBSQVg6IDAwMDAwMDAw
MDAwMDAwMDMgUkJYOiAwMDAwMDAwMDAwMDAwMDAzIFJDWDogMDAwMDAwMDAwMDAwMDAwMAo+IFJE
WDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgUkRJOiAwMDAwMDAwMDAw
MDAwMDAwCj4gUkJQOiBmZmZmYzkwMDA2NjE3MjcwIFIwODogZmZmZmZmZmY4NDU1MmQyNiBSMDk6
IDAwMDAwMDAwMDAwMDAwMDAKPiBSMTA6IGZmZmY4ODgxNTVhZDIwMDAgUjExOiBmZmZmZmZmZjgx
ZDJhYTI2IFIxMjogMDAwMDAwMDAwMDAwMDAwMQo+IFIxMzogZGZmZmZjMDAwMDAwMDAwMCBSMTQ6
IDAwMDAwMDAwMDAwMDAwMTAgUjE1OiBmZmZmYzkwMDA2NjE3MjYwCj4gRlM6ICAwMDAwN2Y4YmFj
NWI1NjQwKDAwMDApIEdTOmZmZmY4ODgyMjBmMDIwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAw
MDAwMAo+IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMK
PiBDUjI6IDAwMDA1NjUwOGEzMjYwMDAgQ1IzOiAwMDAwMDAwMTE3YmVjMDAwIENSNDogMDAwMDAw
MDAwMDAwMDZmMAo+IENhbGwgVHJhY2U6Cj4gICA8VEFTSz4KPiAgIGYyZnNfd3JpdGVfY2FjaGVf
cGFnZXMgZnMvZjJmcy9kYXRhLmM6MzA3OCBbaW5saW5lXQo+ICAgX19mMmZzX3dyaXRlX2RhdGFf
cGFnZXMgZnMvZjJmcy9kYXRhLmM6MzI5MCBbaW5saW5lXQo+ICAgZjJmc193cml0ZV9kYXRhX3Bh
Z2VzKzB4MWMxOS8weDM2MDAgZnMvZjJmcy9kYXRhLmM6MzMxNwo+ICAgZG9fd3JpdGVwYWdlcysw
eDM4ZS8weDY0MCBtbS9wYWdlLXdyaXRlYmFjay5jOjI2MzQKPiAgIGZpbGVtYXBfZmRhdGF3cml0
ZV93YmMgbW0vZmlsZW1hcC5jOjM4NiBbaW5saW5lXQo+ICAgX19maWxlbWFwX2ZkYXRhd3JpdGVf
cmFuZ2UgbW0vZmlsZW1hcC5jOjQxOSBbaW5saW5lXQo+ICAgZmlsZV93cml0ZV9hbmRfd2FpdF9y
YW5nZSsweDJiYS8weDNlMCBtbS9maWxlbWFwLmM6Nzk0Cj4gICBmMmZzX2RvX3N5bmNfZmlsZSsw
eDZlNi8weDFiMDAgZnMvZjJmcy9maWxlLmM6Mjk0Cj4gICBnZW5lcmljX3dyaXRlX3N5bmMgaW5j
bHVkZS9saW51eC9mcy5oOjMwNDMgW2lubGluZV0KPiAgIGYyZnNfZmlsZV93cml0ZV9pdGVyKzB4
NzZlLzB4MjcwMCBmcy9mMmZzL2ZpbGUuYzo1MjU5Cj4gICBuZXdfc3luY193cml0ZSBmcy9yZWFk
X3dyaXRlLmM6NTkzIFtpbmxpbmVdCj4gICB2ZnNfd3JpdGUrMHg3ZTkvMHhlMDAgZnMvcmVhZF93
cml0ZS5jOjY4Ngo+ICAga3N5c193cml0ZSsweDE5ZC8weDJkMCBmcy9yZWFkX3dyaXRlLmM6NzM4
Cj4gICBkb19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmM6NjMgW2lubGlu
ZV0KPiAgIGRvX3N5c2NhbGxfNjQrMHhmNy8weDQ3MCBhcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0
LmM6OTQKPiAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4N2YKPiBSSVA6
IDAwMzM6MHg3ZjhiYWI3YWU0OWQKPiBDb2RlOiAwMiBiOCBmZiBmZiBmZiBmZiBjMyA2NiAwZiAx
ZiA0NCAwMCAwMCBmMyAwZiAxZSBmYSA0OCA4OSBmOCA0OCA4OSBmNyA0OCA4OSBkNiA0OCA4OSBj
YSA0ZCA4OSBjMiA0ZCA4OSBjOCA0YyA4YiA0YyAyNCAwOCAwZiAwNSA8NDg+IDNkIDAxIGYwIGZm
IGZmIDczIDAxIGMzIDQ4IGM3IGMxIGE4IGZmIGZmIGZmIGY3IGQ4IDY0IDg5IDAxIDQ4Cj4gUlNQ
OiAwMDJiOjAwMDA3ZjhiYWM1YjRmOTggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAw
MDAwMDAwMDAwMQo+IFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA3ZjhiYWJhMjYxODAg
UkNYOiAwMDAwN2Y4YmFiN2FlNDlkCj4gUkRYOiAwMDAwMDAwMDAwMDBmZmJkIFJTSTogMDAwMDIw
MDAwMDAwMDI0MCBSREk6IDAwMDAwMDAwMDAwMDAwMDcKPiBSQlA6IDAwMDA3ZjhiYWI4NDgyNjgg
UjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDAwMAo+IFIxMDogMDAwMDAw
MDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAwMDAwMDAwMDAwMDAwMDAwCj4g
UjEzOiAwMDAwN2Y4YmFiYTI2MjE4IFIxNDogMDAwMDdmOGJhYmEyNjE4MCBSMTU6IDAwMDA3Zjhi
YWM1OTUwMDAKPiAgIDwvVEFTSz4KPiBNb2R1bGVzIGxpbmtlZCBpbjoKPiAtLS1bIGVuZCB0cmFj
ZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiBSSVA6IDAwMTA6ZjJmc19hbGxfY2x1c3Rlcl9wYWdl
X3JlYWR5KzB4MTA2LzB4NTUwIGZzL2YyZnMvY29tcHJlc3MuYzo4NTcKPiBDb2RlOiAwMCA4YiA0
ZCAwMCA0OCA4OSBkOCA0OCBjMSBlOCAyMCA3NCAxOSA0OCA4OSBkOCAzMSBkMiA0OCBmNyBmMSA0
OCA4OSBkNSBlYiAxNCA0OCA4OSA1YyAyNCAxMCBlOCA0MCBhNCA2ZCBmZCBlYiAyZCA4OSBkOCAz
MSBkMiA8Zjc+IGYxIDg5IGQ1IDMxIGZmIDQ4IDg5IGVlIGU4IDBjIGE5IDZkIGZkIDQ4IDg1IGVk
IDc0IDBjIGU4IDIyIGE0Cj4gUlNQOiAwMDE4OmZmZmZjOTAwMDY2MTZlNjAgRUZMQUdTOiAwMDAx
MDI0Ngo+IFJBWDogMDAwMDAwMDAwMDAwMDAwMyBSQlg6IDAwMDAwMDAwMDAwMDAwMDMgUkNYOiAw
MDAwMDAwMDAwMDAwMDAwCj4gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDAw
MDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDAKPiBSQlA6IGZmZmZjOTAwMDY2MTcyNzAgUjA4OiBm
ZmZmZmZmZjg0NTUyZDI2IFIwOTogMDAwMDAwMDAwMDAwMDAwMAo+IFIxMDogZmZmZjg4ODE1NWFk
MjAwMCBSMTE6IGZmZmZmZmZmODFkMmFhMjYgUjEyOiAwMDAwMDAwMDAwMDAwMDAxCj4gUjEzOiBk
ZmZmZmMwMDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDAxMCBSMTU6IGZmZmZjOTAwMDY2MTcy
NjAKPiBGUzogIDAwMDA3ZjhiYWM1YjU2NDAoMDAwMCkgR1M6ZmZmZjg4ODIyMGYwMjAwMCgwMDAw
KSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENS
MDogMDAwMDAwMDA4MDA1MDAzMwo+IENSMjogMDAwMDU2NTA4YTMyNjAwMCBDUjM6IDAwMDAwMDAx
MTdiZWMwMDAgQ1I0OiAwMDAwMDAwMDAwMDAwNmYwCj4gLS0tLS0tLS0tLS0tLS0tLQo+IENvZGUg
ZGlzYXNzZW1ibHkgKGJlc3QgZ3Vlc3MpOgo+ICAgICAwOgkwMCA4YiA0ZCAwMCA0OCA4OSAgICAJ
YWRkICAgICVjbCwtMHg3NmI3ZmZiMyglcmJ4KQo+ICAgICA2OglkOCA0OCBjMSAgICAgICAgICAg
ICAJZm11bHMgIC0weDNmKCVyYXgpCj4gICAgIDk6CWU4IDIwIDc0IDE5IDQ4ICAgICAgIAljYWxs
ICAgMHg0ODE5NzQyZQo+ICAgICBlOgk4OSBkOCAgICAgICAgICAgICAgICAJbW92ICAgICVlYngs
JWVheAo+ICAgIDEwOgkzMSBkMiAgICAgICAgICAgICAgICAJeG9yICAgICVlZHgsJWVkeAo+ICAg
IDEyOgk0OCBmNyBmMSAgICAgICAgICAgICAJZGl2ICAgICVyY3gKPiAgICAxNToJNDggODkgZDUg
ICAgICAgICAgICAgCW1vdiAgICAlcmR4LCVyYnAKPiAgICAxODoJZWIgMTQgICAgICAgICAgICAg
ICAgCWptcCAgICAweDJlCj4gICAgMWE6CTQ4IDg5IDVjIDI0IDEwICAgICAgIAltb3YgICAgJXJi
eCwweDEwKCVyc3ApCj4gICAgMWY6CWU4IDQwIGE0IDZkIGZkICAgICAgIAljYWxsICAgMHhmZDZk
YTQ2NAo+ICAgIDI0OgllYiAyZCAgICAgICAgICAgICAgICAJam1wICAgIDB4NTMKPiAgICAyNjoJ
ODkgZDggICAgICAgICAgICAgICAgCW1vdiAgICAlZWJ4LCVlYXgKPiAgICAyODoJMzEgZDIgICAg
ICAgICAgICAgICAgCXhvciAgICAlZWR4LCVlZHgKPiAqIDJhOglmNyBmMSAgICAgICAgICAgICAg
ICAJZGl2ICAgICVlY3ggPC0tIHRyYXBwaW5nIGluc3RydWN0aW9uCj4gICAgMmM6CTg5IGQ1ICAg
ICAgICAgICAgICAgIAltb3YgICAgJWVkeCwlZWJwCj4gICAgMmU6CTMxIGZmICAgICAgICAgICAg
ICAgIAl4b3IgICAgJWVkaSwlZWRpCj4gICAgMzA6CTQ4IDg5IGVlICAgICAgICAgICAgIAltb3Yg
ICAgJXJicCwlcnNpCj4gICAgMzM6CWU4IDBjIGE5IDZkIGZkICAgICAgIAljYWxsICAgMHhmZDZk
YTk0NAo+ICAgIDM4Ogk0OCA4NSBlZCAgICAgICAgICAgICAJdGVzdCAgICVyYnAsJXJicAo+ICAg
IDNiOgk3NCAwYyAgICAgICAgICAgICAgICAJamUgICAgIDB4NDkKPiAgICAzZDoJZTggICAgICAg
ICAgICAgICAgICAgCS5ieXRlIDB4ZTgKPiAgICAzZToJMjIgICAgICAgICAgICAgICAgICAgCS5i
eXRlIDB4MjIKPiAgICAzZjoJYTQgICAgICAgICAgICAgICAgICAgCW1vdnNiICAlZHM6KCVyc2kp
LCVlczooJXJkaSkKPiAKPiBCZXN0LAo+IFNodWFuZ3BlbmcKPiAKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

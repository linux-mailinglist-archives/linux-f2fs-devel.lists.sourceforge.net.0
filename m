Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D8BBD32A6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Oct 2025 15:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBUGQfrBf/tth9xIiKAQqHYw9vTjtCBSlb2+1w/9fo8=; b=CzaBDS708cZBOsbXZaiSsoTDAl
	1Z0kYqCusDygja+slyG72fzvW9AE/EfMaUXz2QK+G3HiaTQDCib8ldILqyfI+vn0fvZUPfv5DBsqy
	uAOW1DWfUGeAOhOWP+LRTTONa3UH/moWIVGOEBBzqkb8pmjUGr7uFDag8xfubmbUx8DA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8ISG-0003KX-H4;
	Mon, 13 Oct 2025 13:19:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v8ISD-0003KP-Ir
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Oct 2025 13:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eizI2SAstM7JRUnXJclbhjPvji3uz7ySMEAjq7YemPk=; b=O9zVCwwo6MvmsPoAXWBbgRm2lI
 2JfHPAYc+y+W/r5EEk39G1BEYIc4wMeM0DwUz4ej/b1CUnZyONSHBNjw/ubRFC8VNH9bGFvLd4w3r
 /3J+QzFefz16fjK0qSyBhbWWtTdqRFVPDnHHqMZDKadA6P2XqxdwsZNzypZyOR3lh/sQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eizI2SAstM7JRUnXJclbhjPvji3uz7ySMEAjq7YemPk=; b=c+ciEAoIyjNS31qGLfiOALQsR2
 +x2wBeYJ4mmnMf7W8NGcUUlZLg73rR6Xuzn8aZ9SyzQP91jNr8tlR+qAeApL7ysFgdeJ9VAVYwnT1
 7RhiUV8+tjzRKs2hordYSj0//+VglrjI3v/TVUqqB6e+vD62WpmRMXgFMtiHT1vADO0w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8ISC-0007Hi-NV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Oct 2025 13:19:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B6EFD6120D;
 Mon, 13 Oct 2025 12:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB311C4CEE7;
 Mon, 13 Oct 2025 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760359303;
 bh=P+FLo9H2oUdAvcmAH/Tk9WRWjvzR7j+vollqwT8nQCo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Q6ir839JhmThWsbtFveFsGpEquJHFyxEhQF6t+lBBpGF0hAA3WCrog1Vyil4IEP2j
 iokjQ2asxffY5+BF2cfAspQP/Ss+el9PxwOcqJ+JS9p+K9NtFrJPcbx0b97y0wtg0y
 n4pXXpJqaFJ4UJJWwygFFMD0EkksdrVkGMqAm3t/fi5liZdnHvKR3Xif1SgKnqL4MN
 7wgi6/durVE8bw/X+F7yby7JRtsqt3yOX4SHWpsbHQhaHtexUSK9BSAZa3TcipAWHH
 AtU22gI80m5CpWzhaxLLepWwkEMRWXweqTk34iS7WtKRvnrscbshjMYtQvRwUXSVGH
 xsKCA9JqkyzQg==
Message-ID: <61a3acc4-d541-41a4-b675-67b20f125117@kernel.org>
Date: Mon, 13 Oct 2025 20:41:39 +0800
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
 Content preview:  On 10/13/25 07:49, Bai,
 Shuangpeng wrote: > Hi Kernel Maintainers, 
 > > Our tool found a new kernel bug "divide error in
 f2fs_all_cluster_page_ready".
 Please see the details below. > > Kernel commit: 6 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8ISC-0007Hi-NV
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMTMvMjUgMDc6NDksIEJhaSwgU2h1YW5ncGVuZyB3cm90ZToKPiBIaSBLZXJuZWwgTWFp
bnRhaW5lcnMsCj4gCj4gT3VyIHRvb2wgZm91bmQgYSBuZXcga2VybmVsIGJ1ZyAiZGl2aWRlIGVy
cm9yIGluIGYyZnNfYWxsX2NsdXN0ZXJfcGFnZV9yZWFkeSIuIFBsZWFzZSBzZWUgdGhlIGRldGFp
bHMgYmVsb3cuCj4gCj4gS2VybmVsIGNvbW1pdDogNi4xNwo+IEtlcm5lbCBjb25maWc6IGF0dGFj
aG1lbnQKPiBSZXByb2R1Y2VyOiBhdHRhY2htZW50Cj4gCj4gVGhlIHJlcHJvZHVjZXIgdHJpZ2dl
cnMgdGhlIGNyYXNoIHJlbGlhYmx5IGluIH41MDAgc2Vjb25kcyBvbiBhIFFFTVUgeDg2XzY0IFZN
LiAKPiAKPiBJ4oCZbSBoYXBweSB0byB0ZXN0IGRlYnVnIHBhdGNoZXMgb3IgcHJvdmlkZSBhZGRp
dGlvbmFsIGluZm9ybWF0aW9uLgoKSGkgQmFpLAoKVGhhbmtzIGZvciB5b3VyIHJlcG9ydCEKCkNv
dWxkIHlvdSBwbGVhc2Ugc2hhcmUgc2NyaXB0cyBhbmQgaW1hZ2VzIGZvciB0aGlzIGlzc3VlPyBh
cyBJIGNhbiBub3QgcmVwcm9kdWNlCncvIHJlcHJvLmMuCgpUaGFua3MsCgo+IAo+IAo+IE9vcHM6
IGRpdmlkZSBlcnJvcjogMDAwMCBbIzFdIFNNUCBLQVNBTiBQVEkKPiBDUFU6IDAgVUlEOiAwIFBJ
RDogMTE0NDEgQ29tbTogc3l6LjAuNDYgTm90IHRhaW50ZWQgNi4xNy4wICMxIFBSRUVNUFQoZnVs
bCkKPiBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2
KSwgQklPUyAxLjE1LjAtMSAwNC8wMS8yMDE0Cj4gUklQOiAwMDEwOmYyZnNfYWxsX2NsdXN0ZXJf
cGFnZV9yZWFkeSsweDEwNi8weDU1MCBmcy9mMmZzL2NvbXByZXNzLmM6ODU3Cj4gQ29kZTogMDAg
OGIgNGQgMDAgNDggODkgZDggNDggYzEgZTggMjAgNzQgMTkgNDggODkgZDggMzEgZDIgNDggZjcg
ZjEgNDggODkgZDUgZWIgMTQgNDggODkgNWMgMjQgMTAgZTggNDAgYTQgNmQgZmQgZWIgMmQgODkg
ZDggMzEgZDIgPGY3PiBmMSA4OSBkNSAzMSBmZiA0OCA4OSBlZSBlOCAwYyBhOSA2ZCBmZCA0OCA4
NSBlZCA3NCAwYyBlOCAyMiBhNAo+IFJTUDogMDAxODpmZmZmYzkwMDA2NjE2ZTYwIEVGTEFHUzog
MDAwMTAyNDYKPiBSQVg6IDAwMDAwMDAwMDAwMDAwMDMgUkJYOiAwMDAwMDAwMDAwMDAwMDAzIFJD
WDogMDAwMDAwMDAwMDAwMDAwMAo+IFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAw
MDAwMDAwMDAgUkRJOiAwMDAwMDAwMDAwMDAwMDAwCj4gUkJQOiBmZmZmYzkwMDA2NjE3MjcwIFIw
ODogZmZmZmZmZmY4NDU1MmQyNiBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKPiBSMTA6IGZmZmY4ODgx
NTVhZDIwMDAgUjExOiBmZmZmZmZmZjgxZDJhYTI2IFIxMjogMDAwMDAwMDAwMDAwMDAwMQo+IFIx
MzogZGZmZmZjMDAwMDAwMDAwMCBSMTQ6IDAwMDAwMDAwMDAwMDAwMTAgUjE1OiBmZmZmYzkwMDA2
NjE3MjYwCj4gRlM6ICAwMDAwN2Y4YmFjNWI1NjQwKDAwMDApIEdTOmZmZmY4ODgyMjBmMDIwMDAo
MDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAw
MCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPiBDUjI6IDAwMDA1NjUwOGEzMjYwMDAgQ1IzOiAwMDAw
MDAwMTE3YmVjMDAwIENSNDogMDAwMDAwMDAwMDAwMDZmMAo+IENhbGwgVHJhY2U6Cj4gIDxUQVNL
Pgo+ICBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzIGZzL2YyZnMvZGF0YS5jOjMwNzggW2lubGluZV0K
PiAgX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMgZnMvZjJmcy9kYXRhLmM6MzI5MCBbaW5saW5lXQo+
ICBmMmZzX3dyaXRlX2RhdGFfcGFnZXMrMHgxYzE5LzB4MzYwMCBmcy9mMmZzL2RhdGEuYzozMzE3
Cj4gIGRvX3dyaXRlcGFnZXMrMHgzOGUvMHg2NDAgbW0vcGFnZS13cml0ZWJhY2suYzoyNjM0Cj4g
IGZpbGVtYXBfZmRhdGF3cml0ZV93YmMgbW0vZmlsZW1hcC5jOjM4NiBbaW5saW5lXQo+ICBfX2Zp
bGVtYXBfZmRhdGF3cml0ZV9yYW5nZSBtbS9maWxlbWFwLmM6NDE5IFtpbmxpbmVdCj4gIGZpbGVf
d3JpdGVfYW5kX3dhaXRfcmFuZ2UrMHgyYmEvMHgzZTAgbW0vZmlsZW1hcC5jOjc5NAo+ICBmMmZz
X2RvX3N5bmNfZmlsZSsweDZlNi8weDFiMDAgZnMvZjJmcy9maWxlLmM6Mjk0Cj4gIGdlbmVyaWNf
d3JpdGVfc3luYyBpbmNsdWRlL2xpbnV4L2ZzLmg6MzA0MyBbaW5saW5lXQo+ICBmMmZzX2ZpbGVf
d3JpdGVfaXRlcisweDc2ZS8weDI3MDAgZnMvZjJmcy9maWxlLmM6NTI1OQo+ICBuZXdfc3luY193
cml0ZSBmcy9yZWFkX3dyaXRlLmM6NTkzIFtpbmxpbmVdCj4gIHZmc193cml0ZSsweDdlOS8weGUw
MCBmcy9yZWFkX3dyaXRlLmM6Njg2Cj4gIGtzeXNfd3JpdGUrMHgxOWQvMHgyZDAgZnMvcmVhZF93
cml0ZS5jOjczOAo+ICBkb19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmM6
NjMgW2lubGluZV0KPiAgZG9fc3lzY2FsbF82NCsweGY3LzB4NDcwIGFyY2gveDg2L2VudHJ5L3N5
c2NhbGxfNjQuYzo5NAo+ICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3Ny8weDdm
Cj4gUklQOiAwMDMzOjB4N2Y4YmFiN2FlNDlkCj4gQ29kZTogMDIgYjggZmYgZmYgZmYgZmYgYzMg
NjYgMGYgMWYgNDQgMDAgMDAgZjMgMGYgMWUgZmEgNDggODkgZjggNDggODkgZjcgNDggODkgZDYg
NDggODkgY2EgNGQgODkgYzIgNGQgODkgYzggNGMgOGIgNGMgMjQgMDggMGYgMDUgPDQ4PiAzZCAw
MSBmMCBmZiBmZiA3MyAwMSBjMyA0OCBjNyBjMSBhOCBmZiBmZiBmZiBmNyBkOCA2NCA4OSAwMSA0
OAo+IFJTUDogMDAyYjowMDAwN2Y4YmFjNWI0Zjk4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6
IDAwMDAwMDAwMDAwMDAwMDEKPiBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwN2Y4YmFi
YTI2MTgwIFJDWDogMDAwMDdmOGJhYjdhZTQ5ZAo+IFJEWDogMDAwMDAwMDAwMDAwZmZiZCBSU0k6
IDAwMDAyMDAwMDAwMDAyNDAgUkRJOiAwMDAwMDAwMDAwMDAwMDA3Cj4gUkJQOiAwMDAwN2Y4YmFi
ODQ4MjY4IFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKPiBSMTA6
IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAwMDAwMDAwMDAw
MDAwMAo+IFIxMzogMDAwMDdmOGJhYmEyNjIxOCBSMTQ6IDAwMDA3ZjhiYWJhMjYxODAgUjE1OiAw
MDAwN2Y4YmFjNTk1MDAwCj4gIDwvVEFTSz4KPiBNb2R1bGVzIGxpbmtlZCBpbjoKPiAtLS1bIGVu
ZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiBSSVA6IDAwMTA6ZjJmc19hbGxfY2x1c3Rl
cl9wYWdlX3JlYWR5KzB4MTA2LzB4NTUwIGZzL2YyZnMvY29tcHJlc3MuYzo4NTcKPiBDb2RlOiAw
MCA4YiA0ZCAwMCA0OCA4OSBkOCA0OCBjMSBlOCAyMCA3NCAxOSA0OCA4OSBkOCAzMSBkMiA0OCBm
NyBmMSA0OCA4OSBkNSBlYiAxNCA0OCA4OSA1YyAyNCAxMCBlOCA0MCBhNCA2ZCBmZCBlYiAyZCA4
OSBkOCAzMSBkMiA8Zjc+IGYxIDg5IGQ1IDMxIGZmIDQ4IDg5IGVlIGU4IDBjIGE5IDZkIGZkIDQ4
IDg1IGVkIDc0IDBjIGU4IDIyIGE0Cj4gUlNQOiAwMDE4OmZmZmZjOTAwMDY2MTZlNjAgRUZMQUdT
OiAwMDAxMDI0Ngo+IFJBWDogMDAwMDAwMDAwMDAwMDAwMyBSQlg6IDAwMDAwMDAwMDAwMDAwMDMg
UkNYOiAwMDAwMDAwMDAwMDAwMDAwCj4gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAw
MDAwMDAwMDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDAKPiBSQlA6IGZmZmZjOTAwMDY2MTcyNzAg
UjA4OiBmZmZmZmZmZjg0NTUyZDI2IFIwOTogMDAwMDAwMDAwMDAwMDAwMAo+IFIxMDogZmZmZjg4
ODE1NWFkMjAwMCBSMTE6IGZmZmZmZmZmODFkMmFhMjYgUjEyOiAwMDAwMDAwMDAwMDAwMDAxCj4g
UjEzOiBkZmZmZmMwMDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDAxMCBSMTU6IGZmZmZjOTAw
MDY2MTcyNjAKPiBGUzogIDAwMDA3ZjhiYWM1YjU2NDAoMDAwMCkgR1M6ZmZmZjg4ODIyMGYwMjAw
MCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAw
MDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo+IENSMjogMDAwMDU2NTA4YTMyNjAwMCBDUjM6IDAw
MDAwMDAxMTdiZWMwMDAgQ1I0OiAwMDAwMDAwMDAwMDAwNmYwCj4gLS0tLS0tLS0tLS0tLS0tLQo+
IENvZGUgZGlzYXNzZW1ibHkgKGJlc3QgZ3Vlc3MpOgo+ICAgIDA6CTAwIDhiIDRkIDAwIDQ4IDg5
ICAgIAlhZGQgICAgJWNsLC0weDc2YjdmZmIzKCVyYngpCj4gICAgNjoJZDggNDggYzEgICAgICAg
ICAgICAgCWZtdWxzICAtMHgzZiglcmF4KQo+ICAgIDk6CWU4IDIwIDc0IDE5IDQ4ICAgICAgIAlj
YWxsICAgMHg0ODE5NzQyZQo+ICAgIGU6CTg5IGQ4ICAgICAgICAgICAgICAgIAltb3YgICAgJWVi
eCwlZWF4Cj4gICAxMDoJMzEgZDIgICAgICAgICAgICAgICAgCXhvciAgICAlZWR4LCVlZHgKPiAg
IDEyOgk0OCBmNyBmMSAgICAgICAgICAgICAJZGl2ICAgICVyY3gKPiAgIDE1Ogk0OCA4OSBkNSAg
ICAgICAgICAgICAJbW92ICAgICVyZHgsJXJicAo+ICAgMTg6CWViIDE0ICAgICAgICAgICAgICAg
IAlqbXAgICAgMHgyZQo+ICAgMWE6CTQ4IDg5IDVjIDI0IDEwICAgICAgIAltb3YgICAgJXJieCww
eDEwKCVyc3ApCj4gICAxZjoJZTggNDAgYTQgNmQgZmQgICAgICAgCWNhbGwgICAweGZkNmRhNDY0
Cj4gICAyNDoJZWIgMmQgICAgICAgICAgICAgICAgCWptcCAgICAweDUzCj4gICAyNjoJODkgZDgg
ICAgICAgICAgICAgICAgCW1vdiAgICAlZWJ4LCVlYXgKPiAgIDI4OgkzMSBkMiAgICAgICAgICAg
ICAgICAJeG9yICAgICVlZHgsJWVkeAo+ICogMmE6CWY3IGYxICAgICAgICAgICAgICAgIAlkaXYg
ICAgJWVjeCA8LS0gdHJhcHBpbmcgaW5zdHJ1Y3Rpb24KPiAgIDJjOgk4OSBkNSAgICAgICAgICAg
ICAgICAJbW92ICAgICVlZHgsJWVicAo+ICAgMmU6CTMxIGZmICAgICAgICAgICAgICAgIAl4b3Ig
ICAgJWVkaSwlZWRpCj4gICAzMDoJNDggODkgZWUgICAgICAgICAgICAgCW1vdiAgICAlcmJwLCVy
c2kKPiAgIDMzOgllOCAwYyBhOSA2ZCBmZCAgICAgICAJY2FsbCAgIDB4ZmQ2ZGE5NDQKPiAgIDM4
Ogk0OCA4NSBlZCAgICAgICAgICAgICAJdGVzdCAgICVyYnAsJXJicAo+ICAgM2I6CTc0IDBjICAg
ICAgICAgICAgICAgIAlqZSAgICAgMHg0OQo+ICAgM2Q6CWU4ICAgICAgICAgICAgICAgICAgIAku
Ynl0ZSAweGU4Cj4gICAzZToJMjIgICAgICAgICAgICAgICAgICAgCS5ieXRlIDB4MjIKPiAgIDNm
OglhNCAgICAgICAgICAgICAgICAgICAJbW92c2IgICVkczooJXJzaSksJWVzOiglcmRpKQo+IAo+
IEJlc3QsCj4gU2h1YW5ncGVuZwo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

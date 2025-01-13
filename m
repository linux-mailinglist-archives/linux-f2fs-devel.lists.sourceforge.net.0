Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DEBA0B834
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jan 2025 14:33:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXKZ3-0005TR-8c;
	Mon, 13 Jan 2025 13:33:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tXKYq-0005T4-Nf
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jan 2025 13:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k8DGq/rViJVxGIoXCtUWIhoV46kkxbSxwBhCzEu2WI0=; b=iOZhJ6EAs7JncLDLRxOPw2wQ7r
 wPDbzlH1a8HEXg+y6P7iLHQ+6nITPmMp6MZh4jWweelNYdw1pfi7ZnRe6RXRFrh5QOIgFBsSxy5Ea
 jo1N6gPHDzt8CQe35oFiH+oHbK55TmpQCvEi8VpiPYiEq1WX5bjxvujGseA59r+J04CY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k8DGq/rViJVxGIoXCtUWIhoV46kkxbSxwBhCzEu2WI0=; b=OWHvBTYlWmQljAectbTnv03VeM
 hFoQbSKutorRKcpwuOXoKtEQC7UQ7vFL7S0IK2Qz6utZsW+10y/kX5C+KUpsErKyDgPUSNTqkKzxy
 b2+Gsouhmo4yhQ58hsqXPYcwuP06B8xo8gENKuA2AX/0mp68ahhUo0NtVk72iKEKJWQI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXKYp-0005ow-Oc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jan 2025 13:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D33CA40F98;
 Mon, 13 Jan 2025 13:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084E7C4CEDD;
 Mon, 13 Jan 2025 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736775164;
 bh=uX+u6vgettCrjfV2KZXYfL4FGWGSn1wFHRQCisR1R7c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=tkyg+4E33XwtCC6mPfDcmHiMSliCzofq2j0KaJyaNu1kJr+N1t2A38OLMSzgrjmL/
 1HleQHnoo37SyxYIJ9d2R2NzqslMucWN6j7HmnpDG0LkquomG1ERb6yz4Nd4UVAcYN
 buA4DGOztcVXYMUaWpQk3hkwWeWcBkFBzSbOC1+gE1YWQfek1LfJ1ErhnmvgKnQY/Y
 cBqj02IGADUHXwZCgCTZLRamG2zDYNMf4fKKD+7dMP+UAwWtAB4fr5q31HZdsEeEtQ
 LnbmoWIlBmcGz+iyf9q6ky3twwEmlhdFCgcmgYEMK7zj9RF95bjXa9saDwJRa6Y5AH
 Vi+SnmQs58L9Q==
Message-ID: <249cf700-781b-4797-842c-fb47a48f4fce@kernel.org>
Date: Mon, 13 Jan 2025 21:32:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
References: <20250102101310.580277-1-guochunhai@vivo.com>
 <62b14417-1297-4ed6-9ff3-b24115d433c4@kernel.org>
 <a4523b96-56eb-4b1d-a031-ec4a67c2c42b@vivo.com>
 <677e5946-3b3e-4f4a-892a-8aa8bfb3e45b@kernel.org>
 <a73d4f97-724e-4d42-9730-6ead37af25a1@vivo.com>
Content-Language: en-US
In-Reply-To: <a73d4f97-724e-4d42-9730-6ead37af25a1@vivo.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/1/9 18:03, Chunhai Guo wrote: > 在 1/8/2025 8:46
   PM, Chao Yu 写道: >> On 2025/1/3 16:07, Chunhai Guo wrote: >>> 在 1/3/2025
    11:26 AM, Chao Yu 写道: >>>> On 2025/1/2 18:13, Chunhai Guo wr [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXKYp-0005ow-Oc
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix missing discard candidates in
 fstrim
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
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS8xLzkgMTg6MDMsIENodW5oYWkgR3VvIHdyb3RlOgo+IOWcqCAxLzgvMjAyNSA4OjQ2
IFBNLCBDaGFvIFl1IOWGmemBkzoKPj4gT24gMjAyNS8xLzMgMTY6MDcsIENodW5oYWkgR3VvIHdy
b3RlOgo+Pj4g5ZyoIDEvMy8yMDI1IDExOjI2IEFNLCBDaGFvIFl1IOWGmemBkzoKPj4+PiBPbiAy
MDI1LzEvMiAxODoxMywgQ2h1bmhhaSBHdW8gd3JvdGU6Cj4+Pj4+IGZzdHJpbSBtYXkgbWlzcyBj
YW5kaWRhdGVzIHRoYXQgbmVlZCB0byBiZSBkaXNjYXJkZWQgaW4gZnN0cmltLCBhcyBzaG93biBp
bgo+Pj4+PiB0aGUgZXhhbXBsZXMgYmVsb3cuCj4+Pj4+IFRoZSByb290IGNhdXNlIGlzIHRoYXQg
d2hlbiBjcGMtPnJlYXNvbiBpcyBzZXQgd2l0aCBDUF9ESVNDQVJELAo+Pj4+PiBhZGRfZGlzY2Fy
ZF9hZGRycygpIGV4cGVjdHMgdGhhdCBja3B0X3ZhbGlkX21hcCBhbmQgY3VyX3ZhbGlkX21hcCBo
YXZlIGJlZW4KPj4+Pj4gc3luY2VkIGJ5IHNlZ19pbmZvX3RvX3Jhd19zaXQoKSBbMV0gYW5kIHRy
aWVzIHRvIGZpbmQgdGhlIGNhbmRpZGF0ZXMgYmFzZWQKPj4+Pj4gb24gY2twdF92YWxpZF9tYXAg
YW5kIGRpc2NhcmRfbWFwLiBIb3dldmVyLCBzZWdfaW5mb190b19yYXdfc2l0KCkgZG9lcyBub3QK
Pj4+Pj4gYWN0dWFsbHkgcnVuIGJlZm9yZSBmMmZzX2V4aXN0X3RyaW1fY2FuZGlkYXRlcygpLCB3
aGljaCByZXN1bHRzIGluIGZhaWx1cmUuCj4+Pj4gQ2h1bmhhaSwKPj4+Pgo+Pj4+IENhbiB5b3Ug
cGxlYXNlIHVzZSBub2Rpc2NhcmQgb3B0aW9uIGR1ZSB0byBmc3RyaW0gc3RvcHBlZCB0byByZXR1
cm4KPj4+PiB0cmltbWVkIGxlbmd0aCBhZnRlciBiZWxvdyBjb21taXQ6Cj4+Pj4KPj4+PiA1YTYx
NTQ5MjBmYWYgKCJmMmZzOiBkb24ndCBpc3N1ZSBkaXNjYXJkIGNvbW1hbmRzIGluIG9ubGluZSBk
aXNjYXJkIGlzIG9uIikKPj4+IFRoYW5rIHlvdSBmb3IgeW91ciBleHBsYW5hdGlvbiwgYnV0IEkg
Z3Vlc3MgdGhpcyBpc3N1ZSBpcyBub3QgcmVsZXZhbnQKPj4+IHRvIHRoaXMgY29tbWl0LCBhbmQg
SSB1bmRlcnN0YW5kIHRoYXQgJzAgQiAoMCBieXRlcykgdHJpbW1lZCcgaXMgZmluZS4KPj4+Cj4+
PiBUaGUgcmVhbCBwcm9ibGVtIGlzIHRoYXQgdGhlcmUgYXJlIGFjdHVhbGx5IG1hbnkgY2FuZGlk
YXRlcyB0aGF0IHNob3VsZAo+Pj4gYmUgaGFuZGxlZCBpbiBmc3RyaW0sIGJ1dCBpdCBjYW5ub3Qg
ZmluZCBhbnkgb2YgdGhlbS4KPj4+Cj4+PiBmMmZzX3RyaW1fZnMoKQo+Pj4gICAgIMKgwqDCoCBm
MmZzX3dyaXRlX2NoZWNrcG9pbnQoKQo+Pj4gICAgIMKgwqDCoMKgwqDCoMKgIC4uLgo+Pj4gICAg
IMKgwqDCoMKgwqDCoMKgIGlmIChjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQpIHsKPj4+ICAgICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFmMmZzX2V4aXN0X3RyaW1fY2FuZGlk
YXRlcyhzYmksIGNwYykpIHsKPj4+ICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1bmJsb2NrX29wZXJhdGlvbnMoc2JpKTsKPj4+ICAgICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsgLy8gTm90IGNhbmRpZGF0ZSBpcyBmb3Vu
ZCBoZXJlIGFuZCBleGl0Lgo+Pj4gICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
Cj4+PiAgICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4KPj4+ICAgICDCoMKgwqDCoMKgwqDC
oCB9Cj4+Pgo+Pj4+PiByb290IyBjcCB0ZXN0ZmlsZSAvZjJmc19tb3VudHBvaW50Cj4+Pj4+Cj4+
Pj4+IHJvb3QjIGYyZnNfaW8gZmllbWFwIDAgMSAvZjJmc19tb3VudHBvaW50L3Rlc3RmaWxlCj4+
Pj4+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxCj4+Pj4+ICAgICAgICAgICAgICBsb2dpY2Fs
IGFkZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+Pj4+PiAw
ICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDQwNmEwMDAwMCAwMDAwMDAwMDNkODAwMDAw
IDAwMDAxMDAwCj4+Pj4+Cj4+Pj4+IHJvb3QjIHJtIC9mMmZzX21vdW50cG9pbnQvdGVzdGZpbGUK
Pj4+Pj4KPj4+Pj4gcm9vdCMgZnN0cmltIC12IC1vIDB4NDA2YTAwMDAwIC1sIDEwMjRNIC9mMmZz
X21vdW50cG9pbnQgLS0gbm8gY2FuZGlkYXRlIGlzIGZvdW5kCj4+Pj4+IC9mMmZzX21vdW50cG9p
bnQ6IDAgQiAoMCBieXRlcykgdHJpbW1lZAo+Pj4+Pgo+Pj4+PiBbMV0gUGxlYXNlIHJlZmVyIHRv
IGNvbW1pdCBkN2JjMjQ4NGI4ZDQgKCJmMmZzOiBmaXggc21hbGwgZGlzY2FyZHMgbm90IHRvCj4+
Pj4+IGlzc3VlIHJlZHVuZGFudGx5IikgZm9yIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiBzZWdf
aW5mb190b19yYXdfc2l0KCkgYW5kCj4+Pj4+IGFkZF9kaXNjYXJkX2FkZHJzKCkuCj4+Pj4+Cj4+
Pj4+IEZpeGVzOiAyNTI5MGZhNTU5MWQgKCJmMmZzOiByZXR1cm4gZnNfdHJpbSBpZiB0aGVyZSBp
cyBubyBjYW5kaWRhdGUiKQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHVuaGFpIEd1byA8Z3VvY2h1
bmhhaUB2aXZvLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgICAgIGZzL2YyZnMvc2VnbWVudC5jIHwg
MTAgKysrKystLS0tLQo+Pj4+PiAgICAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50
LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+PiBpbmRleCBlYWRlMzZjNWVmMTMuLjhmZTlmNzk0
YjU4MSAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPj4+Pj4gKysrIGIvZnMv
ZjJmcy9zZWdtZW50LmMKPj4+Pj4gQEAgLTIwNzAsNyArMjA3MCw3IEBAIHN0YXRpYyBpbnQgZjJm
c19pc3N1ZV9kaXNjYXJkKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4gICAgICAgfQo+
Pj4+PiAgICAgICAKPj4+Pj4gICAgICAgc3RhdGljIGJvb2wgYWRkX2Rpc2NhcmRfYWRkcnMoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjLAo+Pj4+PiAtCQkJ
CQkJCWJvb2wgY2hlY2tfb25seSkKPj4+Pj4gKwkJCQkJYm9vbCBzeW5jZWQsIGJvb2wgY2hlY2tf
b25seSkKPj4+Pj4gICAgICAgewo+Pj4+PiAgICAgICAJaW50IGVudHJpZXMgPSBTSVRfVkJMT0NL
X01BUF9TSVpFIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpOwo+Pj4+PiAgICAgICAJc3RydWN0IHNl
Z19lbnRyeSAqc2UgPSBnZXRfc2VnX2VudHJ5KHNiaSwgY3BjLT50cmltX3N0YXJ0KTsKPj4+Pj4g
QEAgLTIwOTgsNyArMjA5OCw3IEBAIHN0YXRpYyBib29sIGFkZF9kaXNjYXJkX2FkZHJzKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGNwX2NvbnRyb2wgKmNwYywKPj4+Pj4gICAgICAg
Cj4+Pj4+ICAgICAgIAkvKiBTSVRfVkJMT0NLX01BUF9TSVpFIHNob3VsZCBiZSBtdWx0aXBsZSBv
ZiBzaXplb2YodW5zaWduZWQgbG9uZykgKi8KPj4+Pj4gICAgICAgCWZvciAoaSA9IDA7IGkgPCBl
bnRyaWVzOyBpKyspCj4+Pj4+IC0JCWRtYXBbaV0gPSBmb3JjZSA/IH5ja3B0X21hcFtpXSAmIH5k
aXNjYXJkX21hcFtpXSA6Cj4+Pj4+ICsJCWRtYXBbaV0gPSBzeW5jZWQgPyB+Y2twdF9tYXBbaV0g
JiB+ZGlzY2FyZF9tYXBbaV0gOgo+Pj4+IEkgZ3Vlc3MgdGhpcyBjb25kaXRpb24gImZvcmNlID8g
fmNrcHRfbWFwW2ldICYgfmRpc2NhcmRfbWFwW2ldIiBkaWRuJ3QgY292ZXIKPj4+PiBhbGwgYmVs
b3cgY2FzZXMsIHRob3VnaHRzPwo+Pj4+IC0gY2twdF9tYXBbaV0gPT0gMCAvLyB3cml0ZSBkYXRh
LCBhbmQgdGhlbiByZW1vdmUgZGF0YSBiZWZvcmUgY2hlY2twb2ludAo+Pj4+IC0gY2twdF9tYXBb
aV0gIT0gMCAvLyByZW1vdmUgZGF0YSBleGlzdGVkIGluIHByZXZpb3VzIGNoZWNrcG9pbnQKPj4+
ICAgICBGcm9tIHRoZSBoYW5kbGluZyBvZiBja3B0X3ZhbGlkX21hcCBpbiB1cGRhdGVfc2l0X2Vu
dHJ5KCksIEkgZ3Vlc3MgdGhlCj4+PiBjb25kaXRpb24gY2FuIGNvdmVyIGJvdGggY2FzZXMuCj4+
PiBGb3IgZXhhbXBsZSwgd2hlbiB0aGUgY2hlY2twb2ludCBpcyBlbmFibGVkLCBhbGwgdGhlIHNl
dCBiaXRzIGluIHRoZQo+Pj4gY2twdF92YWxpZF9tYXAgcmVtYWluIHNldCBiZWZvcmUgdGhlIGNo
ZWNrcG9pbnQgKGV2ZW4gd2hlbiB0aGUgYmxvY2tzCj4+PiBhcmUgZGVsZXRlZCksIHdoaWNoIG1h
a2VzIGl0IGZpbmQgYWxsIHRoZSByaWdodCBiaXRzIGluIGJvdGggY2FzZXMuCj4+IE15IHBvaW50
IGlzIGZvciBmc3RyaW0gY2FzZSwgd2Ugb25seSBuZWVkIHRvIGNoZWNrIGRpc2NhcmRfbWFwIGJp
dG1hcD8KPj4gb25jZSBiaXQocykgaW4gZGlzY2FyZF9tYXAgYml0bWFwIGlzIHplcm8sIG5vIG1h
dHRlciB0aGUgc3RhdHVzIG9mCj4+IGJpdChzKSBpbiBja3B0X21hcCBiaXRtYXAsIHdlIG5lZWQg
dG8gdHJpZ2dlciBhIGNoZWNrcG9pdCBmb3IgZm9sbG93aW5nCj4+IGRpc2NhcmQgc3VibWlzc2lv
bj8KPiAKPiAKPiBPaCwgeWVzLiBJdCBpcyByZWFzb25hYmxlIHRvIGNoZWNrIG9ubHkgdGhlIGRp
c2NhcmRfbWFwIGJpdG1hcC4gV2hhdCBkbwo+IHlvdSB0aGluayBhYm91dCB0aGUgY29kZSBiZWxv
dz8KPiAKPiBmb3IgKGkgPSAwOyBpIDwgZW50cmllczsgaSsrKSB7Cj4gICDCoMKgwqAgaWYgKGNo
ZWNrX29ubHkpCj4gICDCoMKgwqDCoMKgwqDCoCBkbWFwW2ldID0gfmRpc2NhcmRfbWFwW2ldOwo+
ICAgwqDCoMKgIGVsc2UKPiAgIMKgwqDCoMKgwqDCoMKgIGRtYXBbaV0gPSBmb3JjZSA/IH5ja3B0
X21hcFtpXSAmIH5kaXNjYXJkX21hcFtpXSA6Cj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChj
dXJfbWFwW2ldIF4gY2twdF9tYXBbaV0pICYgY2twdF9tYXBbaV07CgpIb3cgYWJvdXQgdGhpcz8K
CmRtYXBbaV0gPSBmb3JjZSA/IH5kaXNjYXJkX21hcFtpXSA6CgkoY3VyX21hcFtpXSBeIGNrcHRf
bWFwW2ldKSAmIGNrcHRfbWFwW2ldOwoKVGhhbmtzLAoKCj4gfQo+IAo+IFRoYW5rcywKPiAKPj4K
Pj4gVGhhbmtzLAo+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4gICAg
ICAgCQkJCShjdXJfbWFwW2ldIF4gY2twdF9tYXBbaV0pICYgY2twdF9tYXBbaV07Cj4+Pj4+ICAg
ICAgIAo+Pj4+PiAgICAgICAJd2hpbGUgKGZvcmNlIHx8IFNNX0koc2JpKS0+ZGNjX2luZm8tPm5y
X2Rpc2NhcmRzIDw9Cj4+Pj4+IEBAIC0zMjc1LDcgKzMyNzUsNyBAQCBib29sIGYyZnNfZXhpc3Rf
dHJpbV9jYW5kaWRhdGVzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4gICAgICAgCj4+
Pj4+ICAgICAgIAlkb3duX3dyaXRlKCZTSVRfSShzYmkpLT5zZW50cnlfbG9jayk7Cj4+Pj4+ICAg
ICAgIAlmb3IgKDsgY3BjLT50cmltX3N0YXJ0IDw9IGNwYy0+dHJpbV9lbmQ7IGNwYy0+dHJpbV9z
dGFydCsrKSB7Cj4+Pj4+IC0JCWlmIChhZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywgdHJ1ZSkp
IHsKPj4+Pj4gKwkJaWYgKGFkZF9kaXNjYXJkX2FkZHJzKHNiaSwgY3BjLCBmYWxzZSwgdHJ1ZSkp
IHsKPj4+Pj4gICAgICAgCQkJaGFzX2NhbmRpZGF0ZSA9IHRydWU7Cj4+Pj4+ICAgICAgIAkJCWJy
ZWFrOwo+Pj4+PiAgICAgICAJCX0KPj4+Pj4gQEAgLTQ2MTEsNyArNDYxMSw3IEBAIHZvaWQgZjJm
c19mbHVzaF9zaXRfZW50cmllcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9j
b250cm9sICpjcGMpCj4+Pj4+ICAgICAgIAkJCS8qIGFkZCBkaXNjYXJkIGNhbmRpZGF0ZXMgKi8K
Pj4+Pj4gICAgICAgCQkJaWYgKCEoY3BjLT5yZWFzb24gJiBDUF9ESVNDQVJEKSkgewo+Pj4+PiAg
ICAgICAJCQkJY3BjLT50cmltX3N0YXJ0ID0gc2Vnbm87Cj4+Pj4+IC0JCQkJYWRkX2Rpc2NhcmRf
YWRkcnMoc2JpLCBjcGMsIGZhbHNlKTsKPj4+Pj4gKwkJCQlhZGRfZGlzY2FyZF9hZGRycyhzYmks
IGNwYywgZmFsc2UsIGZhbHNlKTsKPj4+Pj4gICAgICAgCQkJfQo+Pj4+PiAgICAgICAKPj4+Pj4g
ICAgICAgCQkJaWYgKHRvX2pvdXJuYWwpIHsKPj4+Pj4gQEAgLTQ2NTMsNyArNDY1Myw3IEBAIHZv
aWQgZjJmc19mbHVzaF9zaXRfZW50cmllcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVj
dCBjcF9jb250cm9sICpjcGMpCj4+Pj4+ICAgICAgIAkJX191NjQgdHJpbV9zdGFydCA9IGNwYy0+
dHJpbV9zdGFydDsKPj4+Pj4gICAgICAgCj4+Pj4+ICAgICAgIAkJZm9yICg7IGNwYy0+dHJpbV9z
dGFydCA8PSBjcGMtPnRyaW1fZW5kOyBjcGMtPnRyaW1fc3RhcnQrKykKPj4+Pj4gLQkJCWFkZF9k
aXNjYXJkX2FkZHJzKHNiaSwgY3BjLCBmYWxzZSk7Cj4+Pj4+ICsJCQlhZGRfZGlzY2FyZF9hZGRy
cyhzYmksIGNwYywgdHJ1ZSwgZmFsc2UpOwo+Pj4+PiAgICAgICAKPj4+Pj4gICAgICAgCQljcGMt
PnRyaW1fc3RhcnQgPSB0cmltX3N0YXJ0Owo+Pj4+PiAgICAgICAJfQo+Pj4KPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==

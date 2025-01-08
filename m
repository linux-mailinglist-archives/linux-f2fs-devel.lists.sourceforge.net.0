Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD4A05BE6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2025 13:46:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVVRv-0003jO-2D;
	Wed, 08 Jan 2025 12:46:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tVVRt-0003jG-Um
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jan 2025 12:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uMi4P9AEFa6Vwd4Tid9RW5xO37ulhrOHWd6U9FQUrOs=; b=BUqD1Qhpinlh7XgmIN9henfSNs
 6ZmqdcNYe8jsG2SUP2gEMnHXKzK1NjM9oFYomWeZqnffFYyi6bdd7iSyQyMMIOyXwGL4gGSG48s7Z
 HDO3wspGrzBCEpVyhUXInfo94uJBPvnVW0vfwlrPAjykj6V4a/imwAI70Olu3LYwTYEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uMi4P9AEFa6Vwd4Tid9RW5xO37ulhrOHWd6U9FQUrOs=; b=Nts6IY4/fZ39qlER2xDzoIVSsd
 PFiiGmzzdk92FMnrtwhW78QHpqjmFTcGndtMzSCPbxYR0cUEfLvsHl9LTlhRXLZ6tHeTpKkU/Uf++
 gJmdCfSqERV+PGaP4HbNxYe+eFHIOTwk60SpQXBikwiBUWNF4QPCVTMYcu2hXNBauzF8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tVVRr-0001A7-Ea for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jan 2025 12:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B188A412F1;
 Wed,  8 Jan 2025 12:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355D2C4CEDD;
 Wed,  8 Jan 2025 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736340365;
 bh=XFn7MM9I0cO+I3IWSfb4n/NmvMNGu3wjeVGBkM4VrBI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gLK59k7fLDGFHjR8+HalV2J2J7moIQPJqJjpbLS5tEI5/OoHPSL/AXy6y+xSiUPkY
 5EfueZTzOWy56HWUVB0JuYccRHzeUTTS6biPJZOtAlVUhp94mz8lgOSQWvdPH8GSNz
 uVwOb3y3YrcpYKRXJwyFGKkZG64IFJMNOtEvqwlS6XgxQ/6GjhZWwMPzwixmwQb9B7
 6kujKf6JoML7ux0h0jYD8m9nrMFr2ou46hBQs5CTUB4J6Yg69gsnHPwo54BLoVqcp5
 0MWYX/vdt/pVICrLQ/tXTAgrZ5gA6sBD55F58IO7ai7aXWUsPifJvNujhm/ChCgRpB
 f+7L5BHqoOPOQ==
Message-ID: <677e5946-3b3e-4f4a-892a-8aa8bfb3e45b@kernel.org>
Date: Wed, 8 Jan 2025 20:46:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
References: <20250102101310.580277-1-guochunhai@vivo.com>
 <62b14417-1297-4ed6-9ff3-b24115d433c4@kernel.org>
 <a4523b96-56eb-4b1d-a031-ec4a67c2c42b@vivo.com>
Content-Language: en-US
In-Reply-To: <a4523b96-56eb-4b1d-a031-ec4a67c2c42b@vivo.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/1/3 16:07, Chunhai Guo wrote: > 在 1/3/2025 11:26
    AM, Chao Yu 写道: >> On 2025/1/2 18:13, Chunhai Guo wrote: >>> fstrim may
    miss candidates that need to be discarded in fstrim, as shown in [...] 
 
 Content analysis details:   (-2.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [147.75.193.91 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [147.75.193.91 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in bl.score.senderscore.com]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tVVRr-0001A7-Ea
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

T24gMjAyNS8xLzMgMTY6MDcsIENodW5oYWkgR3VvIHdyb3RlOgo+IOWcqCAxLzMvMjAyNSAxMToy
NiBBTSwgQ2hhbyBZdSDlhpnpgZM6Cj4+IE9uIDIwMjUvMS8yIDE4OjEzLCBDaHVuaGFpIEd1byB3
cm90ZToKPj4+IGZzdHJpbSBtYXkgbWlzcyBjYW5kaWRhdGVzIHRoYXQgbmVlZCB0byBiZSBkaXNj
YXJkZWQgaW4gZnN0cmltLCBhcyBzaG93biBpbgo+Pj4gdGhlIGV4YW1wbGVzIGJlbG93Lgo+Pj4g
VGhlIHJvb3QgY2F1c2UgaXMgdGhhdCB3aGVuIGNwYy0+cmVhc29uIGlzIHNldCB3aXRoIENQX0RJ
U0NBUkQsCj4+PiBhZGRfZGlzY2FyZF9hZGRycygpIGV4cGVjdHMgdGhhdCBja3B0X3ZhbGlkX21h
cCBhbmQgY3VyX3ZhbGlkX21hcCBoYXZlIGJlZW4KPj4+IHN5bmNlZCBieSBzZWdfaW5mb190b19y
YXdfc2l0KCkgWzFdIGFuZCB0cmllcyB0byBmaW5kIHRoZSBjYW5kaWRhdGVzIGJhc2VkCj4+PiBv
biBja3B0X3ZhbGlkX21hcCBhbmQgZGlzY2FyZF9tYXAuIEhvd2V2ZXIsIHNlZ19pbmZvX3RvX3Jh
d19zaXQoKSBkb2VzIG5vdAo+Pj4gYWN0dWFsbHkgcnVuIGJlZm9yZSBmMmZzX2V4aXN0X3RyaW1f
Y2FuZGlkYXRlcygpLCB3aGljaCByZXN1bHRzIGluIGZhaWx1cmUuCj4+IENodW5oYWksCj4+Cj4+
IENhbiB5b3UgcGxlYXNlIHVzZSBub2Rpc2NhcmQgb3B0aW9uIGR1ZSB0byBmc3RyaW0gc3RvcHBl
ZCB0byByZXR1cm4KPj4gdHJpbW1lZCBsZW5ndGggYWZ0ZXIgYmVsb3cgY29tbWl0Ogo+Pgo+PiA1
YTYxNTQ5MjBmYWYgKCJmMmZzOiBkb24ndCBpc3N1ZSBkaXNjYXJkIGNvbW1hbmRzIGluIG9ubGlu
ZSBkaXNjYXJkIGlzIG9uIikKPiAKPiBUaGFuayB5b3UgZm9yIHlvdXIgZXhwbGFuYXRpb24sIGJ1
dCBJIGd1ZXNzIHRoaXMgaXNzdWUgaXMgbm90IHJlbGV2YW50Cj4gdG8gdGhpcyBjb21taXQsIGFu
ZCBJIHVuZGVyc3RhbmQgdGhhdCAnMCBCICgwIGJ5dGVzKSB0cmltbWVkJyBpcyBmaW5lLgo+IAo+
IFRoZSByZWFsIHByb2JsZW0gaXMgdGhhdCB0aGVyZSBhcmUgYWN0dWFsbHkgbWFueSBjYW5kaWRh
dGVzIHRoYXQgc2hvdWxkCj4gYmUgaGFuZGxlZCBpbiBmc3RyaW0sIGJ1dCBpdCBjYW5ub3QgZmlu
ZCBhbnkgb2YgdGhlbS4KPiAKPiBmMmZzX3RyaW1fZnMoKQo+ICAgwqDCoMKgIGYyZnNfd3JpdGVf
Y2hlY2twb2ludCgpCj4gICDCoMKgwqDCoMKgwqDCoCAuLi4KPiAgIMKgwqDCoMKgwqDCoMKgIGlm
IChjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQpIHsKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoIWYyZnNfZXhpc3RfdHJpbV9jYW5kaWRhdGVzKHNiaSwgY3BjKSkgewo+ICAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5ibG9ja19vcGVyYXRpb25z
KHNiaSk7Cj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91
dDsgLy8gTm90IGNhbmRpZGF0ZSBpcyBmb3VuZCBoZXJlIGFuZCBleGl0Lgo+ICAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4uCj4g
ICDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4+PiByb290IyBjcCB0ZXN0ZmlsZSAvZjJmc19tb3VudHBv
aW50Cj4+Pgo+Pj4gcm9vdCMgZjJmc19pbyBmaWVtYXAgMCAxIC9mMmZzX21vdW50cG9pbnQvdGVz
dGZpbGUKPj4+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxCj4+PiAgICAgICAgICAgIGxvZ2lj
YWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+PiAw
ICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDQwNmEwMDAwMCAwMDAwMDAwMDNkODAwMDAw
IDAwMDAxMDAwCj4+Pgo+Pj4gcm9vdCMgcm0gL2YyZnNfbW91bnRwb2ludC90ZXN0ZmlsZQo+Pj4K
Pj4+IHJvb3QjIGZzdHJpbSAtdiAtbyAweDQwNmEwMDAwMCAtbCAxMDI0TSAvZjJmc19tb3VudHBv
aW50IC0tIG5vIGNhbmRpZGF0ZSBpcyBmb3VuZAo+Pj4gL2YyZnNfbW91bnRwb2ludDogMCBCICgw
IGJ5dGVzKSB0cmltbWVkCj4+Pgo+Pj4gWzFdIFBsZWFzZSByZWZlciB0byBjb21taXQgZDdiYzI0
ODRiOGQ0ICgiZjJmczogZml4IHNtYWxsIGRpc2NhcmRzIG5vdCB0bwo+Pj4gaXNzdWUgcmVkdW5k
YW50bHkiKSBmb3IgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHNlZ19pbmZvX3RvX3Jhd19zaXQo
KSBhbmQKPj4+IGFkZF9kaXNjYXJkX2FkZHJzKCkuCj4+Pgo+Pj4gRml4ZXM6IDI1MjkwZmE1NTkx
ZCAoImYyZnM6IHJldHVybiBmc190cmltIGlmIHRoZXJlIGlzIG5vIGNhbmRpZGF0ZSIpCj4+PiBT
aWduZWQtb2ZmLWJ5OiBDaHVuaGFpIEd1byA8Z3VvY2h1bmhhaUB2aXZvLmNvbT4KPj4+IC0tLQo+
Pj4gICAgIGZzL2YyZnMvc2VnbWVudC5jIHwgMTAgKysrKystLS0tLQo+Pj4gICAgIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+IGluZGV4IGVhZGUz
NmM1ZWYxMy4uOGZlOWY3OTRiNTgxIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMK
Pj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+PiBAQCAtMjA3MCw3ICsyMDcwLDcgQEAgc3Rh
dGljIGludCBmMmZzX2lzc3VlX2Rpc2NhcmQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4g
ICAgIH0KPj4+ICAgICAKPj4+ICAgICBzdGF0aWMgYm9vbCBhZGRfZGlzY2FyZF9hZGRycyhzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMsCj4+PiAtCQkJCQkJ
CWJvb2wgY2hlY2tfb25seSkKPj4+ICsJCQkJCWJvb2wgc3luY2VkLCBib29sIGNoZWNrX29ubHkp
Cj4+PiAgICAgewo+Pj4gICAgIAlpbnQgZW50cmllcyA9IFNJVF9WQkxPQ0tfTUFQX1NJWkUgLyBz
aXplb2YodW5zaWduZWQgbG9uZyk7Cj4+PiAgICAgCXN0cnVjdCBzZWdfZW50cnkgKnNlID0gZ2V0
X3NlZ19lbnRyeShzYmksIGNwYy0+dHJpbV9zdGFydCk7Cj4+PiBAQCAtMjA5OCw3ICsyMDk4LDcg
QEAgc3RhdGljIGJvb2wgYWRkX2Rpc2NhcmRfYWRkcnMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjLAo+Pj4gICAgIAo+Pj4gICAgIAkvKiBTSVRfVkJMT0NL
X01BUF9TSVpFIHNob3VsZCBiZSBtdWx0aXBsZSBvZiBzaXplb2YodW5zaWduZWQgbG9uZykgKi8K
Pj4+ICAgICAJZm9yIChpID0gMDsgaSA8IGVudHJpZXM7IGkrKykKPj4+IC0JCWRtYXBbaV0gPSBm
b3JjZSA/IH5ja3B0X21hcFtpXSAmIH5kaXNjYXJkX21hcFtpXSA6Cj4+PiArCQlkbWFwW2ldID0g
c3luY2VkID8gfmNrcHRfbWFwW2ldICYgfmRpc2NhcmRfbWFwW2ldIDoKPj4gSSBndWVzcyB0aGlz
IGNvbmRpdGlvbiAiZm9yY2UgPyB+Y2twdF9tYXBbaV0gJiB+ZGlzY2FyZF9tYXBbaV0iIGRpZG4n
dCBjb3Zlcgo+PiBhbGwgYmVsb3cgY2FzZXMsIHRob3VnaHRzPwo+PiAtIGNrcHRfbWFwW2ldID09
IDAgLy8gd3JpdGUgZGF0YSwgYW5kIHRoZW4gcmVtb3ZlIGRhdGEgYmVmb3JlIGNoZWNrcG9pbnQK
Pj4gLSBja3B0X21hcFtpXSAhPSAwIC8vIHJlbW92ZSBkYXRhIGV4aXN0ZWQgaW4gcHJldmlvdXMg
Y2hlY2twb2ludAo+IAo+ICAgRnJvbSB0aGUgaGFuZGxpbmcgb2YgY2twdF92YWxpZF9tYXAgaW4g
dXBkYXRlX3NpdF9lbnRyeSgpLCBJIGd1ZXNzIHRoZQo+IGNvbmRpdGlvbiBjYW4gY292ZXIgYm90
aCBjYXNlcy4KPiBGb3IgZXhhbXBsZSwgd2hlbiB0aGUgY2hlY2twb2ludCBpcyBlbmFibGVkLCBh
bGwgdGhlIHNldCBiaXRzIGluIHRoZQo+IGNrcHRfdmFsaWRfbWFwIHJlbWFpbiBzZXQgYmVmb3Jl
IHRoZSBjaGVja3BvaW50IChldmVuIHdoZW4gdGhlIGJsb2Nrcwo+IGFyZSBkZWxldGVkKSwgd2hp
Y2ggbWFrZXMgaXQgZmluZCBhbGwgdGhlIHJpZ2h0IGJpdHMgaW4gYm90aCBjYXNlcy4KCk15IHBv
aW50IGlzIGZvciBmc3RyaW0gY2FzZSwgd2Ugb25seSBuZWVkIHRvIGNoZWNrIGRpc2NhcmRfbWFw
IGJpdG1hcD8gCm9uY2UgYml0KHMpIGluIGRpc2NhcmRfbWFwIGJpdG1hcCBpcyB6ZXJvLCBubyBt
YXR0ZXIgdGhlIHN0YXR1cyBvZiAKYml0KHMpIGluIGNrcHRfbWFwIGJpdG1hcCwgd2UgbmVlZCB0
byB0cmlnZ2VyIGEgY2hlY2twb2l0IGZvciBmb2xsb3dpbmcgCmRpc2NhcmQgc3VibWlzc2lvbj8K
ClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+PiAgICAgCQkJCShj
dXJfbWFwW2ldIF4gY2twdF9tYXBbaV0pICYgY2twdF9tYXBbaV07Cj4+PiAgICAgCj4+PiAgICAg
CXdoaWxlIChmb3JjZSB8fCBTTV9JKHNiaSktPmRjY19pbmZvLT5ucl9kaXNjYXJkcyA8PQo+Pj4g
QEAgLTMyNzUsNyArMzI3NSw3IEBAIGJvb2wgZjJmc19leGlzdF90cmltX2NhbmRpZGF0ZXMoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gICAgIAo+Pj4gICAgIAlkb3duX3dyaXRlKCZTSVRf
SShzYmkpLT5zZW50cnlfbG9jayk7Cj4+PiAgICAgCWZvciAoOyBjcGMtPnRyaW1fc3RhcnQgPD0g
Y3BjLT50cmltX2VuZDsgY3BjLT50cmltX3N0YXJ0KyspIHsKPj4+IC0JCWlmIChhZGRfZGlzY2Fy
ZF9hZGRycyhzYmksIGNwYywgdHJ1ZSkpIHsKPj4+ICsJCWlmIChhZGRfZGlzY2FyZF9hZGRycyhz
YmksIGNwYywgZmFsc2UsIHRydWUpKSB7Cj4+PiAgICAgCQkJaGFzX2NhbmRpZGF0ZSA9IHRydWU7
Cj4+PiAgICAgCQkJYnJlYWs7Cj4+PiAgICAgCQl9Cj4+PiBAQCAtNDYxMSw3ICs0NjExLDcgQEAg
dm9pZCBmMmZzX2ZsdXNoX3NpdF9lbnRyaWVzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3Ry
dWN0IGNwX2NvbnRyb2wgKmNwYykKPj4+ICAgICAJCQkvKiBhZGQgZGlzY2FyZCBjYW5kaWRhdGVz
ICovCj4+PiAgICAgCQkJaWYgKCEoY3BjLT5yZWFzb24gJiBDUF9ESVNDQVJEKSkgewo+Pj4gICAg
IAkJCQljcGMtPnRyaW1fc3RhcnQgPSBzZWdubzsKPj4+IC0JCQkJYWRkX2Rpc2NhcmRfYWRkcnMo
c2JpLCBjcGMsIGZhbHNlKTsKPj4+ICsJCQkJYWRkX2Rpc2NhcmRfYWRkcnMoc2JpLCBjcGMsIGZh
bHNlLCBmYWxzZSk7Cj4+PiAgICAgCQkJfQo+Pj4gICAgIAo+Pj4gICAgIAkJCWlmICh0b19qb3Vy
bmFsKSB7Cj4+PiBAQCAtNDY1Myw3ICs0NjUzLDcgQEAgdm9pZCBmMmZzX2ZsdXNoX3NpdF9lbnRy
aWVzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGNwX2NvbnRyb2wgKmNwYykKPj4+
ICAgICAJCV9fdTY0IHRyaW1fc3RhcnQgPSBjcGMtPnRyaW1fc3RhcnQ7Cj4+PiAgICAgCj4+PiAg
ICAgCQlmb3IgKDsgY3BjLT50cmltX3N0YXJ0IDw9IGNwYy0+dHJpbV9lbmQ7IGNwYy0+dHJpbV9z
dGFydCsrKQo+Pj4gLQkJCWFkZF9kaXNjYXJkX2FkZHJzKHNiaSwgY3BjLCBmYWxzZSk7Cj4+PiAr
CQkJYWRkX2Rpc2NhcmRfYWRkcnMoc2JpLCBjcGMsIHRydWUsIGZhbHNlKTsKPj4+ICAgICAKPj4+
ICAgICAJCWNwYy0+dHJpbV9zdGFydCA9IHRyaW1fc3RhcnQ7Cj4+PiAgICAgCX0KPiAKPiAKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=

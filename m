Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271496CC0A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Sep 2024 03:07:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sm0xg-0006aK-82;
	Thu, 05 Sep 2024 01:07:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sm0xf-0006aC-6l
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 01:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uFfIlVus8zuHkfb3iFQBPabZaD95tMrBaO7yHe1cMms=; b=PpsURm7rPu/JYwAEnWngHuIsxQ
 jKCmm3qW7TL4HjgHvEElo5vJkM/mqvFiHNCqG8yxtKxX8PhCYZAAujJM7AAPFPS9RgPn2nMVz9+RU
 j7R4MfI7XmvGhe2SANXPMcna1Y1NqaWpZs5pVVqZyVi0s2Zqgy9/hpZw0+qOqMAIkJh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uFfIlVus8zuHkfb3iFQBPabZaD95tMrBaO7yHe1cMms=; b=ZiZehUOAZRG0OFHTtOnW3LyuTk
 /jjfGsOu7bv/U6bx1htAKAP8PzBXR+oeVU+oEPoqWntCWClG0iPjnI4CLTaYqxLYxrDVnjlABos6t
 ElOQD6dzmpR5blqTery62Pf9nZR4VVYtElLBUOFpeKZG2Yx+AJCrCaSz3Q6x3mgn5ZiA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sm0xe-0005g0-73 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 01:06:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 64DB35C5432;
 Thu,  5 Sep 2024 01:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47937C4CEC2;
 Thu,  5 Sep 2024 01:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725498407;
 bh=OjSgoO9oN8sGczK0arFHjxbqWTdLcYmFj3s0vOgXXaY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EGhoOA6FU94z6rtuMOMLqvI800jzraJk7Z0jLpY2/DitoF+XJmNL4I2Re5cm976Jn
 9QZOTc06E1G/wuV+lMEKtKliCa+XtcZYr4TFJFjFYVJc/HucnggP1pNLOPPg8rKLD3
 xhYxX3CbpL9bcq3bGcQvlfu3r5PsXg5zjEhe72YGhYcoG/BNTzPZCm6yihFXyMF908
 Mi3M523RU3HgyU4ZmcyTCINnUum7+m4Rc41ux7gVDPqo8XTyJ+GGcTwseti2VLkwE0
 PCkXG9I2TE/AAiojoTwPNdaNtmpe7eL/Zhj4HuaFDRzIhYgNgSxBppPu3Flyo8meOv
 loHI5hFu8mSig==
Message-ID: <b2b6db47-07c6-4fd5-b2cb-30ddefcdd98e@kernel.org>
Date: Thu, 5 Sep 2024 09:06:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20240826202352.2150294-1-daeho43@gmail.com>
 <45a8a9f3-27b8-433e-a0ac-e457f4cdf1eb@kernel.org>
 <CACOAw_xMipooJy3GrZTc2CSpMoSs9FsErdxjqMWXVQ6iDiEZ0Q@mail.gmail.com>
 <d4f218ad-7a01-4b5b-a438-c0e4e14bbc96@kernel.org>
 <CACOAw_zvNyD3cmMpJsidEMyrtnZYU4kR4BmE_cygroPyYoiGvA@mail.gmail.com>
 <5c7b34d8-6efa-4716-ab89-a0b7b7583cb2@kernel.org>
 <CACOAw_w3Tn6HL9hZXFgpjpgu9ySvE_0FbTWMMBuZKgRFBYXXLA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_w3Tn6HL9hZXFgpjpgu9ySvE_0FbTWMMBuZKgRFBYXXLA@mail.gmail.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/9/4 22:56, Daeho Jeong wrote: > On Tue, Sep 3, 2024
    at 8:35 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/9/4 10:52, Daeho
    Jeong wrote: >>> On Tue, Sep 3, 2024 at 7:26 PM Chao Yu <chao [...] 
 
 Content analysis details:   (-5.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sm0xe-0005g0-73
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent atomic file from being dirtied
 before commit
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzQgMjI6NTYsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDMsIDIw
MjQgYXQgODozNeKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9u
IDIwMjQvOS80IDEwOjUyLCBEYWVobyBKZW9uZyB3cm90ZToKPj4+IE9uIFR1ZSwgU2VwIDMsIDIw
MjQgYXQgNzoyNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4KPj4+
PiBPbiAyMDI0LzkvNCAxOjA3LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+Pj4gT24gTW9uLCBTZXAg
MiwgMjAyNCBhdCAzOjA44oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4+
Pj4+Cj4+Pj4+PiBPbiAyMDI0LzgvMjcgNDoyMywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4+Pj4g
RnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4+Pgo+Pj4+Pj4+
IEtlZXAgYXRvbWljIGZpbGUgY2xlYW4gd2hpbGUgdXBkYXRpbmcgYW5kIG1ha2UgaXQgZGlydGll
ZCBkdXJpbmcgY29tbWl0Cj4+Pj4+Pj4gaW4gb3JkZXIgdG8gYXZvaWQgdW5uZWNlc3NhcnkgYW5k
IGV4Y2Vzc2l2ZSBpbm9kZSB1cGRhdGVzIGluIHRoZSBwcmV2aW91cwo+Pj4+Pj4+IGZpeC4KPj4+
Pj4+Pgo+Pj4+Pj4+IEZpeGVzOiA0YmY3ODMyMjM0NmYgKCJmMmZzOiBtYXJrIGlub2RlIGRpcnR5
IGZvciBGSV9BVE9NSUNfQ09NTUlUVEVEIGZsYWciKQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERh
ZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gICAg
ICBmcy9mMmZzL2YyZnMuaCAgICB8ICAzICstLQo+Pj4+Pj4+ICAgICAgZnMvZjJmcy9pbm9kZS5j
ICAgfCAxMCArKysrKystLS0tCj4+Pj4+Pj4gICAgICBmcy9mMmZzL3NlZ21lbnQuYyB8IDEwICsr
KysrKysrLS0KPj4+Pj4+PiAgICAgIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMu
aCBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+Pj4gaW5kZXggNDY1YjJmZDUwYzcwLi41YTdmNmZhOGI1
ODUgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4+PiArKysgYi9mcy9m
MmZzL2YyZnMuaAo+Pj4+Pj4+IEBAIC04MDEsNyArODAxLDcgQEAgZW51bSB7Cj4+Pj4+Pj4gICAg
ICAgICAgRklfQ09NUFJFU1NfUkVMRUFTRUQsICAgLyogY29tcHJlc3NlZCBibG9ja3Mgd2VyZSBy
ZWxlYXNlZCAqLwo+Pj4+Pj4+ICAgICAgICAgIEZJX0FMSUdORURfV1JJVEUsICAgICAgIC8qIGVu
YWJsZSBhbGlnbmVkIHdyaXRlICovCj4+Pj4+Pj4gICAgICAgICAgRklfQ09XX0ZJTEUsICAgICAg
ICAgICAgLyogaW5kaWNhdGUgQ09XIGZpbGUgKi8KPj4+Pj4+PiAtICAgICBGSV9BVE9NSUNfQ09N
TUlUVEVELCAgICAvKiBpbmRpY2F0ZSBhdG9taWMgY29tbWl0IGNvbXBsZXRlZCBleGNlcHQgZGlz
ayBzeW5jICovCj4+Pj4+Pj4gKyAgICAgRklfQVRPTUlDX0RJUlRJRUQsICAgICAgLyogaW5kaWNh
dGUgYXRvbWljIGZpbGUgaXMgZGlydGllZCAqLwo+Pj4+Pj4+ICAgICAgICAgIEZJX0FUT01JQ19S
RVBMQUNFLCAgICAgIC8qIGluZGljYXRlIGF0b21pYyByZXBsYWNlICovCj4+Pj4+Pj4gICAgICAg
ICAgRklfT1BFTkVEX0ZJTEUsICAgICAgICAgLyogaW5kaWNhdGUgZmlsZSBoYXMgYmVlbiBvcGVu
ZWQgKi8KPj4+Pj4+PiAgICAgICAgICBGSV9NQVgsICAgICAgICAgICAgICAgICAvKiBtYXggZmxh
ZywgbmV2ZXIgYmUgdXNlZCAqLwo+Pj4+Pj4+IEBAIC0zMDQyLDcgKzMwNDIsNiBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgX19tYXJrX2lub2RlX2RpcnR5X2ZsYWcoc3RydWN0IGlub2RlICppbm9kZSwK
Pj4+Pj4+PiAgICAgICAgICBjYXNlIEZJX0lOTElORV9ET1RTOgo+Pj4+Pj4+ICAgICAgICAgIGNh
c2UgRklfUElOX0ZJTEU6Cj4+Pj4+Pj4gICAgICAgICAgY2FzZSBGSV9DT01QUkVTU19SRUxFQVNF
RDoKPj4+Pj4+PiAtICAgICBjYXNlIEZJX0FUT01JQ19DT01NSVRURUQ6Cj4+Pj4+Pj4gICAgICAg
ICAgICAgICAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4+Pj4+
Pj4gICAgICAgICAgfQo+Pj4+Pj4+ICAgICAgfQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPj4+Pj4+PiBpbmRleCAxZWIyNTBjNmIzOTIuLjVk
ZDNlNTVkMmJlMiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPj4+Pj4+PiAr
KysgYi9mcy9mMmZzL2lub2RlLmMKPj4+Pj4+PiBAQCAtMzUsNiArMzUsMTEgQEAgdm9pZCBmMmZz
X21hcmtfaW5vZGVfZGlydHlfc3luYyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBib29sIHN5bmMpCj4+
Pj4+Pj4gICAgICAgICAgaWYgKGYyZnNfaW5vZGVfZGlydGllZChpbm9kZSwgc3luYykpCj4+Pj4+
Pgo+Pj4+Pj4gSXQgd2lsbCByZXR1cm4gZGlyZWN0bHkgaGVyZSBpZiBpbm9kZSB3YXMgZGlydGll
ZCwgc28gaXQgbWF5IG1pc3NlZCB0byBzZXQKPj4+Pj4+IEZJX0FUT01JQ19ESVJUSUVEIGZsYWc/
Cj4+Pj4+Cj4+Pj4+IElzIGl0IHBvc3NpYmxlIGZvciBpdCB0byBiZSBhbHJlYWR5IGRpcnR5LCBz
aW5jZSB3ZSBhbHJlYWR5IG1hZGUgaXQKPj4+Pj4gY2xlYW4gd2l0aCBmMmZzX3dyaXRlX2lub2Rl
KCkgd2hlbiB3ZSBzdGFydGVkIHRoZSBhdG9taWMgd3JpdGU/Cj4+Pj4KPj4+PiBTb21lIGlvY3Rs
IGludGVyZmFjZXMgbWF5IHJhY2Ugdy8gYXRvbWljIHdyaXRlPyBlLmcuIHNldF9waW5fZmlsZSB3
b24ndAo+Pj4+IGNoZWNrIGF0b21pY19maWxlIHN0YXR1cywgYW5kIG1heSBkaXJ0eSBpbm9kZSBh
ZnRlciB3ZSBzdGFydGVkIGF0b21pYwo+Pj4+IHdyaXRlLCBzbyB3ZSdkIGJldHRlciBkZXRlY3Qg
c3VjaCByYWNlIGNvbmRpdGlvbiBhbmQgYnJlYWsgaW9jdGwgdG8KPj4+PiBhdm9pZCBydWluIGF0
b21pYyB3cml0ZT8gYW5kIG1heWJlIHdlIGNhbiBhZGQgZjJmc19idWdfb24oKSBpbgo+Pj4+IGYy
ZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKCkgdG8gZGV0ZWN0IGFueSBvdGhlciBtaXNzaW5nIGNh
c2VzPwo+Pj4+Cj4+Pgo+Pj4gSG93IGFib3V0IGV4Y2hhbmdpbmcgdGhlIHBvc2l0aW9ucyBvZiBm
MmZzX3dyaXRlX2lub2RlKCkgYW5kCj4+PiBzZXRfaW5vZGVfZmxhZygpIGluIGYyZnNfaW9jX3N0
YXJ0X2F0b21pY193cml0ZSgpPwo+Pj4KPj4+IC4uLgo+Pj4gICAgICAgICAgIGYyZnNfd3JpdGVf
aW5vZGUoaW5vZGUsIE5VTEwpOwo+Pj4KPj4+ICAgICAgICAgICBzdGF0X2luY19hdG9taWNfaW5v
ZGUoaW5vZGUpOwo+Pj4KPj4+ICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRP
TUlDX0ZJTEUpOwo+Pj4gLi4uCj4+Cj4+IE9oLCBJJ20gbm90IHN1cmUgSSd2ZSBnb3QgeW91ciBw
b2ludCwgYWZ0ZXIgZXhjaGFuZ2luZyB3ZSBzdGlsbCBtYXkgc3VmZmVyCj4+IGJlbG93IHJhY2Ug
Y29uZGl0aW9uLCByaWdodD8KPj4KPj4gLSBmMmZzX2lvY19zdGFydF9hdG9taWNfd3JpdGUKPj4g
ICAgLSBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0ZJTEUpCj4+ICAgIC0gZjJmc193
cml0ZV9pbm9kZShpbm9kZSwgTlVMTCkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtIGYyZnNfaW9jX3NldF9waW5fZmlsZQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9QSU5fRklM
RSkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gX19tYXJr
X2lub2RlX2RpcnR5X2ZsYWcoKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPT4gVGhpcyBhdHRlbXB0IHdpbGwKPiBiZSBibG9ja2VkIGJ5IHRoZSBi
ZWxvdyBjb25kaXRpb24uCj4gCj4gKyAgICAgICBpZiAoZjJmc19pc19hdG9taWNfZmlsZShpbm9k
ZSkpIHsKPiArICAgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19E
SVJUSUVEKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgfQoKT2gsIHllcywg
RklfQVRPTUlDX0RJUlRJRUQgd2lsbCBiZSB0YWdnZWQgb25jZSBpbm9kZSBiZWNvbWVzIGRpcnR5
LgoKVGhhbmtzLAoKPiAKPiBQbHosIHJlZmVyIHRvIHRoZSBhYm92ZSBjb21tZW50Lgo+IAo+PiAt
IGYyZnNfaW9jX2NvbW1pdF9hdG9taWNfd3JpdGUKPj4KPj4gU28gdGhhdCBJIHByb3Bvc2VkIGEg
Zml4IGZvciB0aGlzOgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVs
LzIwMjQwOTA0MDMyMDQ3LjEyNjQ3MDYtMS1jaGFvQGtlcm5lbC5vcmcKPj4KPj4gVGhhbmtzLAo+
Pgo+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+
Pgo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Pj4+Pj4+Cj4+Pj4+Pj4gKyAgICAg
aWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKSB7Cj4+Pj4+Pj4gKyAgICAgICAgICAgICBz
ZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+Pj4+Pj4+ICsgICAgICAg
ICAgICAgcmV0dXJuOwo+Pj4+Pj4+ICsgICAgIH0KPj4+Pj4+PiArCj4+Pj4+Pj4gICAgICAgICAg
bWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlKTsKPj4+Pj4+PiAgICAgIH0KPj4+Pj4+Pgo+Pj4+
Pj4+IEBAIC02NTMsMTAgKzY1OCw3IEBAIHZvaWQgZjJmc191cGRhdGVfaW5vZGUoc3RydWN0IGlu
b2RlICppbm9kZSwgc3RydWN0IHBhZ2UgKm5vZGVfcGFnZSkKPj4+Pj4+PiAgICAgICAgICByaS0+
aV9naWQgPSBjcHVfdG9fbGUzMihpX2dpZF9yZWFkKGlub2RlKSk7Cj4+Pj4+Pj4gICAgICAgICAg
cmktPmlfbGlua3MgPSBjcHVfdG9fbGUzMihpbm9kZS0+aV9ubGluayk7Cj4+Pj4+Pj4gICAgICAg
ICAgcmktPmlfYmxvY2tzID0gY3B1X3RvX2xlNjQoU0VDVE9SX1RPX0JMT0NLKGlub2RlLT5pX2Js
b2NrcykgKyAxKTsKPj4+Pj4+PiAtCj4+Pj4+Pj4gLSAgICAgaWYgKCFmMmZzX2lzX2F0b21pY19m
aWxlKGlub2RlKSB8fAo+Pj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICBpc19pbm9kZV9mbGFn
X3NldChpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCkpCj4+Pj4+Pj4gLSAgICAgICAgICAgICBy
aS0+aV9zaXplID0gY3B1X3RvX2xlNjQoaV9zaXplX3JlYWQoaW5vZGUpKTsKPj4+Pj4+PiArICAg
ICByaS0+aV9zaXplID0gY3B1X3RvX2xlNjQoaV9zaXplX3JlYWQoaW5vZGUpKTsKPj4+Pj4+Pgo+
Pj4+Pj4+ICAgICAgICAgIGlmIChldCkgewo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgcmVhZF9s
b2NrKCZldC0+bG9jayk7Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIv
ZnMvZjJmcy9zZWdtZW50LmMKPj4+Pj4+PiBpbmRleCA3OGMzMTk4YTYzMDguLjJiNTM5MWIyMjlh
OCAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+Pj4+ICsrKyBiL2Zz
L2YyZnMvc2VnbWVudC5jCj4+Pj4+Pj4gQEAgLTE5Niw5ICsxOTYsMTIgQEAgdm9pZCBmMmZzX2Fi
b3J0X2F0b21pY193cml0ZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBib29sIGNsZWFuKQo+Pj4+Pj4+
ICAgICAgICAgICAgICAgICAgdHJ1bmNhdGVfaW5vZGVfcGFnZXNfZmluYWwoaW5vZGUtPmlfbWFw
cGluZyk7Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAgICAgICByZWxlYXNlX2F0b21pY193cml0ZV9jbnQo
aW5vZGUpOwo+Pj4+Pj4+IC0gICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19D
T01NSVRURUQpOwo+Pj4+Pj4+ICAgICAgICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FU
T01JQ19SRVBMQUNFKTsKPj4+Pj4+PiAgICAgICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBG
SV9BVE9NSUNfRklMRSk7Cj4+Pj4+Pj4gKyAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2Rl
LCBGSV9BVE9NSUNfRElSVElFRCkpIHsKPj4+Pj4+PiArICAgICAgICAgICAgIGNsZWFyX2lub2Rl
X2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsKPj4+Pj4+PiArICAgICAgICAgICAgIGYy
ZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPj4+Pj4+PiArICAgICB9Cj4+
Pj4+Pj4gICAgICAgICAgc3RhdF9kZWNfYXRvbWljX2lub2RlKGlub2RlKTsKPj4+Pj4+Pgo+Pj4+
Pj4+ICAgICAgICAgIEYyRlNfSShpbm9kZSktPmF0b21pY193cml0ZV90YXNrID0gTlVMTDsKPj4+
Pj4+PiBAQCAtMzY1LDcgKzM2OCwxMCBAQCBzdGF0aWMgaW50IF9fZjJmc19jb21taXRfYXRvbWlj
X3dyaXRlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBzYmkt
PnJldm9rZWRfYXRvbWljX2Jsb2NrICs9IGZpLT5hdG9taWNfd3JpdGVfY250Owo+Pj4+Pj4+ICAg
ICAgICAgIH0gZWxzZSB7Cj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBzYmktPmNvbW1pdHRlZF9h
dG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193cml0ZV9jbnQ7Cj4+Pj4+Pj4gLSAgICAgICAgICAg
ICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCk7Cj4+Pj4+Pj4gKyAg
ICAgICAgICAgICBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVE
KSkgewo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2Rl
LCBGSV9BVE9NSUNfRElSVElFRCk7Cj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGYyZnNf
bWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPj4+Pj4+PiArICAgICAgICAgICAg
IH0KPj4+Pj4+PiAgICAgICAgICB9Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAgICAgICBfX2NvbXBsZXRl
X3Jldm9rZV9saXN0KGlub2RlLCAmcmV2b2tlX2xpc3QsIHJldCA/IHRydWUgOiBmYWxzZSk7Cj4+
Pj4+Pgo+Pj4+Cj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

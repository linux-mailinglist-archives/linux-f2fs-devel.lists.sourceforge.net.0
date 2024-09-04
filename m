Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E774396AF7E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 05:35:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slgnt-0007lz-TN;
	Wed, 04 Sep 2024 03:35:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1slgns-0007ls-H4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 03:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RFLoqPCCYbo/IRkVbIBItFi/CODTH7PzhOP1tlZosWg=; b=aBYbAi3XD0+hqS9qRrkRHTVVUO
 LEuerIyOlxImN/vGdvtGWhUb81MJ7X6sdqaYpWOAsfDKrwdlzySwZ3dpzInKQmQx5QeWb4eO26YId
 RWfHAd45CXvwVAEQh9y59LkeXRevbJpJmUmNScdHk98UC6om4CWxXMvCDuwUqQs2ihqE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RFLoqPCCYbo/IRkVbIBItFi/CODTH7PzhOP1tlZosWg=; b=irBdq1fNZxi+k2Gvb6EdctXwzC
 sIttaGDLIbWEIKIJT+QRurv+rz27AQVg30yIHxoGRovuvV5GN4ER9k/NdZvLyUqKKPRC1qImIzT6/
 QQzjbgjQs6ynozz+VVMPw4SZ4mlIk6xDJ6RAWk1B1rODLFPVFPC6DCbWkgcyZpsxZ9B8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slgnr-00069H-2U for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 03:35:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B3485C4186;
 Wed,  4 Sep 2024 03:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA32C4CEC2;
 Wed,  4 Sep 2024 03:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725420920;
 bh=LsZ0BFKb8xBu32Daz1pIfErk3ubckOAkNIFMU1lcMtE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ln2L/LFB2oUIM9ZaroxKZsJ1iTE+6gkw4Q2PddjwffGh8gHBjIvmILuLXezWwPxq7
 6/wL+Vq4QA8JeB52rntfIy85Pu+P/8o1OzrN17rGpx5Hmbi0e+5chF1z8djPoIV8so
 vEtg20OQB83Mek59WwqkSCdH1ewYKY2hF+MEDZNxcVpRnt18lf4/ru+zVhupdWNxqk
 E7E5bFqqlGwBNdAYPQuRfhkPw7w9d9d15DK+oMprmbSu+HNu4C5/1s6HYJicwyHYb7
 QY4feqY7090G/UTc0SLE2rqP36KaUaD/2/7r7+jO1ZvvEiEcq7cr/nbXjygZD89mjI
 n2r2y3crRgywg==
Message-ID: <5c7b34d8-6efa-4716-ab89-a0b7b7583cb2@kernel.org>
Date: Wed, 4 Sep 2024 11:35:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20240826202352.2150294-1-daeho43@gmail.com>
 <45a8a9f3-27b8-433e-a0ac-e457f4cdf1eb@kernel.org>
 <CACOAw_xMipooJy3GrZTc2CSpMoSs9FsErdxjqMWXVQ6iDiEZ0Q@mail.gmail.com>
 <d4f218ad-7a01-4b5b-a438-c0e4e14bbc96@kernel.org>
 <CACOAw_zvNyD3cmMpJsidEMyrtnZYU4kR4BmE_cygroPyYoiGvA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_zvNyD3cmMpJsidEMyrtnZYU4kR4BmE_cygroPyYoiGvA@mail.gmail.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/9/4 10:52, Daeho Jeong wrote: > On Tue, Sep 3, 2024
    at 7:26 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/9/4 1:07, Daeho
    Jeong wrote: >>> On Mon, Sep 2, 2024 at 3:08 AM Chao Yu <chao@ [...] 
 
 Content analysis details:   (-5.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slgnr-00069H-2U
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

T24gMjAyNC85LzQgMTA6NTIsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDMsIDIw
MjQgYXQgNzoyNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9u
IDIwMjQvOS80IDE6MDcsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4gT24gTW9uLCBTZXAgMiwgMjAy
NCBhdCAzOjA44oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+Pj4+
IE9uIDIwMjQvOC8yNyA0OjIzLCBEYWVobyBKZW9uZyB3cm90ZToKPj4+Pj4gRnJvbTogRGFlaG8g
SmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4KPj4+Pj4gS2VlcCBhdG9taWMgZmls
ZSBjbGVhbiB3aGlsZSB1cGRhdGluZyBhbmQgbWFrZSBpdCBkaXJ0aWVkIGR1cmluZyBjb21taXQK
Pj4+Pj4gaW4gb3JkZXIgdG8gYXZvaWQgdW5uZWNlc3NhcnkgYW5kIGV4Y2Vzc2l2ZSBpbm9kZSB1
cGRhdGVzIGluIHRoZSBwcmV2aW91cwo+Pj4+PiBmaXguCj4+Pj4+Cj4+Pj4+IEZpeGVzOiA0YmY3
ODMyMjM0NmYgKCJmMmZzOiBtYXJrIGlub2RlIGRpcnR5IGZvciBGSV9BVE9NSUNfQ09NTUlUVEVE
IGZsYWciKQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29n
bGUuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gICAgIGZzL2YyZnMvZjJmcy5oICAgIHwgIDMgKy0tCj4+
Pj4+ICAgICBmcy9mMmZzL2lub2RlLmMgICB8IDEwICsrKysrKy0tLS0KPj4+Pj4gICAgIGZzL2Yy
ZnMvc2VnbWVudC5jIHwgMTAgKysrKysrKystLQo+Pj4+PiAgICAgMyBmaWxlcyBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4+PiBpbmRleCA0NjViMmZkNTBjNzAu
LjVhN2Y2ZmE4YjU4NSAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gKysr
IGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gQEAgLTgwMSw3ICs4MDEsNyBAQCBlbnVtIHsKPj4+Pj4g
ICAgICAgICBGSV9DT01QUkVTU19SRUxFQVNFRCwgICAvKiBjb21wcmVzc2VkIGJsb2NrcyB3ZXJl
IHJlbGVhc2VkICovCj4+Pj4+ICAgICAgICAgRklfQUxJR05FRF9XUklURSwgICAgICAgLyogZW5h
YmxlIGFsaWduZWQgd3JpdGUgKi8KPj4+Pj4gICAgICAgICBGSV9DT1dfRklMRSwgICAgICAgICAg
ICAvKiBpbmRpY2F0ZSBDT1cgZmlsZSAqLwo+Pj4+PiAtICAgICBGSV9BVE9NSUNfQ09NTUlUVEVE
LCAgICAvKiBpbmRpY2F0ZSBhdG9taWMgY29tbWl0IGNvbXBsZXRlZCBleGNlcHQgZGlzayBzeW5j
ICovCj4+Pj4+ICsgICAgIEZJX0FUT01JQ19ESVJUSUVELCAgICAgIC8qIGluZGljYXRlIGF0b21p
YyBmaWxlIGlzIGRpcnRpZWQgKi8KPj4+Pj4gICAgICAgICBGSV9BVE9NSUNfUkVQTEFDRSwgICAg
ICAvKiBpbmRpY2F0ZSBhdG9taWMgcmVwbGFjZSAqLwo+Pj4+PiAgICAgICAgIEZJX09QRU5FRF9G
SUxFLCAgICAgICAgIC8qIGluZGljYXRlIGZpbGUgaGFzIGJlZW4gb3BlbmVkICovCj4+Pj4+ICAg
ICAgICAgRklfTUFYLCAgICAgICAgICAgICAgICAgLyogbWF4IGZsYWcsIG5ldmVyIGJlIHVzZWQg
Ki8KPj4+Pj4gQEAgLTMwNDIsNyArMzA0Miw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX21hcmtf
aW5vZGVfZGlydHlfZmxhZyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4+PiAgICAgICAgIGNhc2Ug
RklfSU5MSU5FX0RPVFM6Cj4+Pj4+ICAgICAgICAgY2FzZSBGSV9QSU5fRklMRToKPj4+Pj4gICAg
ICAgICBjYXNlIEZJX0NPTVBSRVNTX1JFTEVBU0VEOgo+Pj4+PiAtICAgICBjYXNlIEZJX0FUT01J
Q19DT01NSVRURUQ6Cj4+Pj4+ICAgICAgICAgICAgICAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlf
c3luYyhpbm9kZSwgdHJ1ZSk7Cj4+Pj4+ICAgICAgICAgfQo+Pj4+PiAgICAgfQo+Pj4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5jIGIvZnMvZjJmcy9pbm9kZS5jCj4+Pj4+IGluZGV4IDFl
YjI1MGM2YjM5Mi4uNWRkM2U1NWQyYmUyIDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2lub2Rl
LmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9pbm9kZS5jCj4+Pj4+IEBAIC0zNSw2ICszNSwxMSBAQCB2
b2lkIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wg
c3luYykKPj4+Pj4gICAgICAgICBpZiAoZjJmc19pbm9kZV9kaXJ0aWVkKGlub2RlLCBzeW5jKSkK
Pj4+Pgo+Pj4+IEl0IHdpbGwgcmV0dXJuIGRpcmVjdGx5IGhlcmUgaWYgaW5vZGUgd2FzIGRpcnRp
ZWQsIHNvIGl0IG1heSBtaXNzZWQgdG8gc2V0Cj4+Pj4gRklfQVRPTUlDX0RJUlRJRUQgZmxhZz8K
Pj4+Cj4+PiBJcyBpdCBwb3NzaWJsZSBmb3IgaXQgdG8gYmUgYWxyZWFkeSBkaXJ0eSwgc2luY2Ug
d2UgYWxyZWFkeSBtYWRlIGl0Cj4+PiBjbGVhbiB3aXRoIGYyZnNfd3JpdGVfaW5vZGUoKSB3aGVu
IHdlIHN0YXJ0ZWQgdGhlIGF0b21pYyB3cml0ZT8KPj4KPj4gU29tZSBpb2N0bCBpbnRlcmZhY2Vz
IG1heSByYWNlIHcvIGF0b21pYyB3cml0ZT8gZS5nLiBzZXRfcGluX2ZpbGUgd29uJ3QKPj4gY2hl
Y2sgYXRvbWljX2ZpbGUgc3RhdHVzLCBhbmQgbWF5IGRpcnR5IGlub2RlIGFmdGVyIHdlIHN0YXJ0
ZWQgYXRvbWljCj4+IHdyaXRlLCBzbyB3ZSdkIGJldHRlciBkZXRlY3Qgc3VjaCByYWNlIGNvbmRp
dGlvbiBhbmQgYnJlYWsgaW9jdGwgdG8KPj4gYXZvaWQgcnVpbiBhdG9taWMgd3JpdGU/IGFuZCBt
YXliZSB3ZSBjYW4gYWRkIGYyZnNfYnVnX29uKCkgaW4KPj4gZjJmc19tYXJrX2lub2RlX2RpcnR5
X3N5bmMoKSB0byBkZXRlY3QgYW55IG90aGVyIG1pc3NpbmcgY2FzZXM/Cj4+Cj4gCj4gSG93IGFi
b3V0IGV4Y2hhbmdpbmcgdGhlIHBvc2l0aW9ucyBvZiBmMmZzX3dyaXRlX2lub2RlKCkgYW5kCj4g
c2V0X2lub2RlX2ZsYWcoKSBpbiBmMmZzX2lvY19zdGFydF9hdG9taWNfd3JpdGUoKT8KPiAKPiAu
Li4KPiAgICAgICAgICBmMmZzX3dyaXRlX2lub2RlKGlub2RlLCBOVUxMKTsKPiAKPiAgICAgICAg
ICBzdGF0X2luY19hdG9taWNfaW5vZGUoaW5vZGUpOwo+IAo+ICAgICAgICAgIHNldF9pbm9kZV9m
bGFnKGlub2RlLCBGSV9BVE9NSUNfRklMRSk7Cj4gLi4uCgpPaCwgSSdtIG5vdCBzdXJlIEkndmUg
Z290IHlvdXIgcG9pbnQsIGFmdGVyIGV4Y2hhbmdpbmcgd2Ugc3RpbGwgbWF5IHN1ZmZlcgpiZWxv
dyByYWNlIGNvbmRpdGlvbiwgcmlnaHQ/CgotIGYyZnNfaW9jX3N0YXJ0X2F0b21pY193cml0ZQog
IC0gc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19GSUxFKQogIC0gZjJmc193cml0ZV9p
bm9kZShpbm9kZSwgTlVMTCkKCQkJCQktIGYyZnNfaW9jX3NldF9waW5fZmlsZQoJCQkJCSAtIHNl
dF9pbm9kZV9mbGFnKGlub2RlLCBGSV9QSU5fRklMRSkKCQkJCQkgIC0gX19tYXJrX2lub2RlX2Rp
cnR5X2ZsYWcoKQotIGYyZnNfaW9jX2NvbW1pdF9hdG9taWNfd3JpdGUKClNvIHRoYXQgSSBwcm9w
b3NlZCBhIGZpeCBmb3IgdGhpczoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1k
ZXZlbC8yMDI0MDkwNDAzMjA0Ny4xMjY0NzA2LTEtY2hhb0BrZXJuZWwub3JnCgpUaGFua3MsCgo+
IAo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+ICAgICAgICAg
ICAgICAgICByZXR1cm47Cj4+Pj4+Cj4+Pj4+ICsgICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxl
KGlub2RlKSkgewo+Pj4+PiArICAgICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9B
VE9NSUNfRElSVElFRCk7Cj4+Pj4+ICsgICAgICAgICAgICAgcmV0dXJuOwo+Pj4+PiArICAgICB9
Cj4+Pj4+ICsKPj4+Pj4gICAgICAgICBtYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUpOwo+Pj4+
PiAgICAgfQo+Pj4+Pgo+Pj4+PiBAQCAtNjUzLDEwICs2NTgsNyBAQCB2b2lkIGYyZnNfdXBkYXRl
X2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpub2RlX3BhZ2UpCj4+Pj4+
ICAgICAgICAgcmktPmlfZ2lkID0gY3B1X3RvX2xlMzIoaV9naWRfcmVhZChpbm9kZSkpOwo+Pj4+
PiAgICAgICAgIHJpLT5pX2xpbmtzID0gY3B1X3RvX2xlMzIoaW5vZGUtPmlfbmxpbmspOwo+Pj4+
PiAgICAgICAgIHJpLT5pX2Jsb2NrcyA9IGNwdV90b19sZTY0KFNFQ1RPUl9UT19CTE9DSyhpbm9k
ZS0+aV9ibG9ja3MpICsgMSk7Cj4+Pj4+IC0KPj4+Pj4gLSAgICAgaWYgKCFmMmZzX2lzX2F0b21p
Y19maWxlKGlub2RlKSB8fAo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgaXNfaW5vZGVfZmxh
Z19zZXQoaW5vZGUsIEZJX0FUT01JQ19DT01NSVRURUQpKQo+Pj4+PiAtICAgICAgICAgICAgIHJp
LT5pX3NpemUgPSBjcHVfdG9fbGU2NChpX3NpemVfcmVhZChpbm9kZSkpOwo+Pj4+PiArICAgICBy
aS0+aV9zaXplID0gY3B1X3RvX2xlNjQoaV9zaXplX3JlYWQoaW5vZGUpKTsKPj4+Pj4KPj4+Pj4g
ICAgICAgICBpZiAoZXQpIHsKPj4+Pj4gICAgICAgICAgICAgICAgIHJlYWRfbG9jaygmZXQtPmxv
Y2spOwo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21l
bnQuYwo+Pj4+PiBpbmRleCA3OGMzMTk4YTYzMDguLjJiNTM5MWIyMjlhOCAxMDA2NDQKPj4+Pj4g
LS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+
Pj4gQEAgLTE5Niw5ICsxOTYsMTIgQEAgdm9pZCBmMmZzX2Fib3J0X2F0b21pY193cml0ZShzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBib29sIGNsZWFuKQo+Pj4+PiAgICAgICAgICAgICAgICAgdHJ1bmNh
dGVfaW5vZGVfcGFnZXNfZmluYWwoaW5vZGUtPmlfbWFwcGluZyk7Cj4+Pj4+Cj4+Pj4+ICAgICAg
ICAgcmVsZWFzZV9hdG9taWNfd3JpdGVfY250KGlub2RlKTsKPj4+Pj4gLSAgICAgY2xlYXJfaW5v
ZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCk7Cj4+Pj4+ICAgICAgICAgY2xlYXJf
aW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX1JFUExBQ0UpOwo+Pj4+PiAgICAgICAgIGNsZWFy
X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19GSUxFKTsKPj4+Pj4gKyAgICAgaWYgKGlzX2lu
b2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCkpIHsKPj4+Pj4gKyAgICAgICAg
ICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4+Pj4+ICsg
ICAgICAgICAgICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+Pj4+
PiArICAgICB9Cj4+Pj4+ICAgICAgICAgc3RhdF9kZWNfYXRvbWljX2lub2RlKGlub2RlKTsKPj4+
Pj4KPj4+Pj4gICAgICAgICBGMkZTX0koaW5vZGUpLT5hdG9taWNfd3JpdGVfdGFzayA9IE5VTEw7
Cj4+Pj4+IEBAIC0zNjUsNyArMzY4LDEwIEBAIHN0YXRpYyBpbnQgX19mMmZzX2NvbW1pdF9hdG9t
aWNfd3JpdGUoc3RydWN0IGlub2RlICppbm9kZSkKPj4+Pj4gICAgICAgICAgICAgICAgIHNiaS0+
cmV2b2tlZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193cml0ZV9jbnQ7Cj4+Pj4+ICAgICAg
ICAgfSBlbHNlIHsKPj4+Pj4gICAgICAgICAgICAgICAgIHNiaS0+Y29tbWl0dGVkX2F0b21pY19i
bG9jayArPSBmaS0+YXRvbWljX3dyaXRlX2NudDsKPj4+Pj4gLSAgICAgICAgICAgICBzZXRfaW5v
ZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCk7Cj4+Pj4+ICsgICAgICAgICAgICAg
aWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCkpIHsKPj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19E
SVJUSUVEKTsKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0
eV9zeW5jKGlub2RlLCB0cnVlKTsKPj4+Pj4gKyAgICAgICAgICAgICB9Cj4+Pj4+ICAgICAgICAg
fQo+Pj4+Pgo+Pj4+PiAgICAgICAgIF9fY29tcGxldGVfcmV2b2tlX2xpc3QoaW5vZGUsICZyZXZv
a2VfbGlzdCwgcmV0ID8gdHJ1ZSA6IGZhbHNlKTsKPj4+Pgo+PgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

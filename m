Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 251B896AE8C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 04:27:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slfjg-0006DC-HW;
	Wed, 04 Sep 2024 02:27:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1slfjZ-0006Cr-3D
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 02:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h5g1i9r2geHz5ARIBVDNJ+NXtp+TBzKSK3ag2KNH9aU=; b=esxkevIiO0eFKt/RWufPh0rvgf
 uQ63mirG7HV26lEgosGUt+kKAA8erL6zkt2JeKJm26pJavq3MaXxuqphaUbXUBAr+vMiLLnNywe8W
 Czh16Ehs5UtJhkcotu0Yb0kVPgWYqvz2qS8JHwygdTRS0xL2aIZfVJVW1nqkXkOEqtiQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h5g1i9r2geHz5ARIBVDNJ+NXtp+TBzKSK3ag2KNH9aU=; b=aaIYUmYKqUtfpn3vRI1A+GV9FC
 ZUAvAHG5G7+IbGLWc80mHUsxa9xqWeLdAFfYxeV6DB1j3qUvcivwCaGStSKzb0ydZpTA2d28A6zFM
 V4XR3mtr8K0pAzUBn1Wmcpp5dqFk5gwDXqimQNRxqnSgjFh8aI3esmFDEWn7wZw5MJpE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slfjX-0002mb-9u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 02:27:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F36C5C51B1;
 Wed,  4 Sep 2024 02:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2637DC4CEC4;
 Wed,  4 Sep 2024 02:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725416808;
 bh=8qboybJq+c/5kLOuu22HLxuVqbE+xW8K4CixXEsPXxI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XJRQJJjIBJCe8QsjT1obuFtajcAjZjMjQW2af/kpDt+X5h3vCkS5AVVxW4oy56MFy
 +HaghyvyhYNIuH06Fwi5JS6v4I9mH5j/z3PP8LYoXVB+ZhvWV+q4mPzbrrxcU/nTbK
 kD1cAwQSUXCGqbbChEd8T5YVx1+JKry5rBGt+ErC8V947TJcInJ8z9VZnT2GBqaUdk
 Dr7p64riR+/XuLnuk7EJZC3vlMU62u96tQ5kroHNOdsAD7EzQVTTTpbmfHB8hsNt5s
 vPI2vJoeRW6iXlfynPJl6CI+/I13LMtkdxTtUXf6INFKnrX7rxFqW9LZdqfz0Ljg8v
 Kt0RK28vCMMzg==
Message-ID: <d4f218ad-7a01-4b5b-a438-c0e4e14bbc96@kernel.org>
Date: Wed, 4 Sep 2024 10:26:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20240826202352.2150294-1-daeho43@gmail.com>
 <45a8a9f3-27b8-433e-a0ac-e457f4cdf1eb@kernel.org>
 <CACOAw_xMipooJy3GrZTc2CSpMoSs9FsErdxjqMWXVQ6iDiEZ0Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_xMipooJy3GrZTc2CSpMoSs9FsErdxjqMWXVQ6iDiEZ0Q@mail.gmail.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/9/4 1:07, Daeho Jeong wrote: > On Mon, Sep 2, 2024
    at 3:08 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/8/27 4:23, Daeho
    Jeong wrote: >>> From: Daeho Jeong <daehojeong@google.com> >>> > [...] 
 
 Content analysis details:   (-5.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slfjX-0002mb-9u
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

T24gMjAyNC85LzQgMTowNywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gT24gTW9uLCBTZXAgMiwgMjAy
NCBhdCAzOjA44oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24g
MjAyNC84LzI3IDQ6MjMsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4gRnJvbTogRGFlaG8gSmVvbmcg
PGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Cj4+PiBLZWVwIGF0b21pYyBmaWxlIGNsZWFuIHdo
aWxlIHVwZGF0aW5nIGFuZCBtYWtlIGl0IGRpcnRpZWQgZHVyaW5nIGNvbW1pdAo+Pj4gaW4gb3Jk
ZXIgdG8gYXZvaWQgdW5uZWNlc3NhcnkgYW5kIGV4Y2Vzc2l2ZSBpbm9kZSB1cGRhdGVzIGluIHRo
ZSBwcmV2aW91cwo+Pj4gZml4Lgo+Pj4KPj4+IEZpeGVzOiA0YmY3ODMyMjM0NmYgKCJmMmZzOiBt
YXJrIGlub2RlIGRpcnR5IGZvciBGSV9BVE9NSUNfQ09NTUlUVEVEIGZsYWciKQo+Pj4gU2lnbmVk
LW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+IC0tLQo+Pj4g
ICAgZnMvZjJmcy9mMmZzLmggICAgfCAgMyArLS0KPj4+ICAgIGZzL2YyZnMvaW5vZGUuYyAgIHwg
MTAgKysrKysrLS0tLQo+Pj4gICAgZnMvZjJmcy9zZWdtZW50LmMgfCAxMCArKysrKysrKy0tCj4+
PiAgICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+IGlu
ZGV4IDQ2NWIyZmQ1MGM3MC4uNWE3ZjZmYThiNTg1IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9m
MmZzLmgKPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+PiBAQCAtODAxLDcgKzgwMSw3IEBAIGVu
dW0gewo+Pj4gICAgICAgIEZJX0NPTVBSRVNTX1JFTEVBU0VELCAgIC8qIGNvbXByZXNzZWQgYmxv
Y2tzIHdlcmUgcmVsZWFzZWQgKi8KPj4+ICAgICAgICBGSV9BTElHTkVEX1dSSVRFLCAgICAgICAv
KiBlbmFibGUgYWxpZ25lZCB3cml0ZSAqLwo+Pj4gICAgICAgIEZJX0NPV19GSUxFLCAgICAgICAg
ICAgIC8qIGluZGljYXRlIENPVyBmaWxlICovCj4+PiAtICAgICBGSV9BVE9NSUNfQ09NTUlUVEVE
LCAgICAvKiBpbmRpY2F0ZSBhdG9taWMgY29tbWl0IGNvbXBsZXRlZCBleGNlcHQgZGlzayBzeW5j
ICovCj4+PiArICAgICBGSV9BVE9NSUNfRElSVElFRCwgICAgICAvKiBpbmRpY2F0ZSBhdG9taWMg
ZmlsZSBpcyBkaXJ0aWVkICovCj4+PiAgICAgICAgRklfQVRPTUlDX1JFUExBQ0UsICAgICAgLyog
aW5kaWNhdGUgYXRvbWljIHJlcGxhY2UgKi8KPj4+ICAgICAgICBGSV9PUEVORURfRklMRSwgICAg
ICAgICAvKiBpbmRpY2F0ZSBmaWxlIGhhcyBiZWVuIG9wZW5lZCAqLwo+Pj4gICAgICAgIEZJX01B
WCwgICAgICAgICAgICAgICAgIC8qIG1heCBmbGFnLCBuZXZlciBiZSB1c2VkICovCj4+PiBAQCAt
MzA0Miw3ICszMDQyLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fbWFya19pbm9kZV9kaXJ0eV9m
bGFnKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+PiAgICAgICAgY2FzZSBGSV9JTkxJTkVfRE9UUzoK
Pj4+ICAgICAgICBjYXNlIEZJX1BJTl9GSUxFOgo+Pj4gICAgICAgIGNhc2UgRklfQ09NUFJFU1Nf
UkVMRUFTRUQ6Cj4+PiAtICAgICBjYXNlIEZJX0FUT01JQ19DT01NSVRURUQ6Cj4+PiAgICAgICAg
ICAgICAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4+PiAgICAg
ICAgfQo+Pj4gICAgfQo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBiL2ZzL2YyZnMv
aW5vZGUuYwo+Pj4gaW5kZXggMWViMjUwYzZiMzkyLi41ZGQzZTU1ZDJiZTIgMTAwNjQ0Cj4+PiAt
LS0gYS9mcy9mMmZzL2lub2RlLmMKPj4+ICsrKyBiL2ZzL2YyZnMvaW5vZGUuYwo+Pj4gQEAgLTM1
LDYgKzM1LDExIEBAIHZvaWQgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoc3RydWN0IGlub2Rl
ICppbm9kZSwgYm9vbCBzeW5jKQo+Pj4gICAgICAgIGlmIChmMmZzX2lub2RlX2RpcnRpZWQoaW5v
ZGUsIHN5bmMpKQo+Pgo+PiBJdCB3aWxsIHJldHVybiBkaXJlY3RseSBoZXJlIGlmIGlub2RlIHdh
cyBkaXJ0aWVkLCBzbyBpdCBtYXkgbWlzc2VkIHRvIHNldAo+PiBGSV9BVE9NSUNfRElSVElFRCBm
bGFnPwo+IAo+IElzIGl0IHBvc3NpYmxlIGZvciBpdCB0byBiZSBhbHJlYWR5IGRpcnR5LCBzaW5j
ZSB3ZSBhbHJlYWR5IG1hZGUgaXQKPiBjbGVhbiB3aXRoIGYyZnNfd3JpdGVfaW5vZGUoKSB3aGVu
IHdlIHN0YXJ0ZWQgdGhlIGF0b21pYyB3cml0ZT8KClNvbWUgaW9jdGwgaW50ZXJmYWNlcyBtYXkg
cmFjZSB3LyBhdG9taWMgd3JpdGU/IGUuZy4gc2V0X3Bpbl9maWxlIHdvbid0CmNoZWNrIGF0b21p
Y19maWxlIHN0YXR1cywgYW5kIG1heSBkaXJ0eSBpbm9kZSBhZnRlciB3ZSBzdGFydGVkIGF0b21p
Ywp3cml0ZSwgc28gd2UnZCBiZXR0ZXIgZGV0ZWN0IHN1Y2ggcmFjZSBjb25kaXRpb24gYW5kIGJy
ZWFrIGlvY3RsIHRvCmF2b2lkIHJ1aW4gYXRvbWljIHdyaXRlPyBhbmQgbWF5YmUgd2UgY2FuIGFk
ZCBmMmZzX2J1Z19vbigpIGluCmYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKCkgdG8gZGV0ZWN0
IGFueSBvdGhlciBtaXNzaW5nIGNhc2VzPwoKVGhhbmtzLAoKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+
Pj4gICAgICAgICAgICAgICAgcmV0dXJuOwo+Pj4KPj4+ICsgICAgIGlmIChmMmZzX2lzX2F0b21p
Y19maWxlKGlub2RlKSkgewo+Pj4gKyAgICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwg
RklfQVRPTUlDX0RJUlRJRUQpOwo+Pj4gKyAgICAgICAgICAgICByZXR1cm47Cj4+PiArICAgICB9
Cj4+PiArCj4+PiAgICAgICAgbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlKTsKPj4+ICAgIH0K
Pj4+Cj4+PiBAQCAtNjUzLDEwICs2NTgsNyBAQCB2b2lkIGYyZnNfdXBkYXRlX2lub2RlKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpub2RlX3BhZ2UpCj4+PiAgICAgICAgcmktPmlf
Z2lkID0gY3B1X3RvX2xlMzIoaV9naWRfcmVhZChpbm9kZSkpOwo+Pj4gICAgICAgIHJpLT5pX2xp
bmtzID0gY3B1X3RvX2xlMzIoaW5vZGUtPmlfbmxpbmspOwo+Pj4gICAgICAgIHJpLT5pX2Jsb2Nr
cyA9IGNwdV90b19sZTY0KFNFQ1RPUl9UT19CTE9DSyhpbm9kZS0+aV9ibG9ja3MpICsgMSk7Cj4+
PiAtCj4+PiAtICAgICBpZiAoIWYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpIHx8Cj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19DT01N
SVRURUQpKQo+Pj4gLSAgICAgICAgICAgICByaS0+aV9zaXplID0gY3B1X3RvX2xlNjQoaV9zaXpl
X3JlYWQoaW5vZGUpKTsKPj4+ICsgICAgIHJpLT5pX3NpemUgPSBjcHVfdG9fbGU2NChpX3NpemVf
cmVhZChpbm9kZSkpOwo+Pj4KPj4+ICAgICAgICBpZiAoZXQpIHsKPj4+ICAgICAgICAgICAgICAg
IHJlYWRfbG9jaygmZXQtPmxvY2spOwo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5j
IGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+IGluZGV4IDc4YzMxOThhNjMwOC4uMmI1MzkxYjIyOWE4
IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPj4+ICsrKyBiL2ZzL2YyZnMvc2Vn
bWVudC5jCj4+PiBAQCAtMTk2LDkgKzE5NiwxMiBAQCB2b2lkIGYyZnNfYWJvcnRfYXRvbWljX3dy
aXRlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgY2xlYW4pCj4+PiAgICAgICAgICAgICAgICB0
cnVuY2F0ZV9pbm9kZV9wYWdlc19maW5hbChpbm9kZS0+aV9tYXBwaW5nKTsKPj4+Cj4+PiAgICAg
ICAgcmVsZWFzZV9hdG9taWNfd3JpdGVfY250KGlub2RlKTsKPj4+IC0gICAgIGNsZWFyX2lub2Rl
X2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19DT01NSVRURUQpOwo+Pj4gICAgICAgIGNsZWFyX2lub2Rl
X2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19SRVBMQUNFKTsKPj4+ICAgICAgICBjbGVhcl9pbm9kZV9m
bGFnKGlub2RlLCBGSV9BVE9NSUNfRklMRSk7Cj4+PiArICAgICBpZiAoaXNfaW5vZGVfZmxhZ19z
ZXQoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKSkgewo+Pj4gKyAgICAgICAgICAgICBjbGVhcl9p
bm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4+PiArICAgICAgICAgICAgIGYy
ZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPj4+ICsgICAgIH0KPj4+ICAg
ICAgICBzdGF0X2RlY19hdG9taWNfaW5vZGUoaW5vZGUpOwo+Pj4KPj4+ICAgICAgICBGMkZTX0ko
aW5vZGUpLT5hdG9taWNfd3JpdGVfdGFzayA9IE5VTEw7Cj4+PiBAQCAtMzY1LDcgKzM2OCwxMCBA
QCBzdGF0aWMgaW50IF9fZjJmc19jb21taXRfYXRvbWljX3dyaXRlKHN0cnVjdCBpbm9kZSAqaW5v
ZGUpCj4+PiAgICAgICAgICAgICAgICBzYmktPnJldm9rZWRfYXRvbWljX2Jsb2NrICs9IGZpLT5h
dG9taWNfd3JpdGVfY250Owo+Pj4gICAgICAgIH0gZWxzZSB7Cj4+PiAgICAgICAgICAgICAgICBz
YmktPmNvbW1pdHRlZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193cml0ZV9jbnQ7Cj4+PiAt
ICAgICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfQ09NTUlUVEVEKTsK
Pj4+ICsgICAgICAgICAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9NSUNf
RElSVElFRCkpIHsKPj4+ICsgICAgICAgICAgICAgICAgICAgICBjbGVhcl9pbm9kZV9mbGFnKGlu
b2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgZjJmc19t
YXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+Pj4gKyAgICAgICAgICAgICB9Cj4+
PiAgICAgICAgfQo+Pj4KPj4+ICAgICAgICBfX2NvbXBsZXRlX3Jldm9rZV9saXN0KGlub2RlLCAm
cmV2b2tlX2xpc3QsIHJldCA/IHRydWUgOiBmYWxzZSk7Cj4+CgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

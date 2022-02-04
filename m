Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1FD4A95CB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Feb 2022 10:11:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFucV-0006W5-Af; Fri, 04 Feb 2022 09:11:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nFucT-0006VY-SV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Feb 2022 09:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dD+BKd8WZgIYEcpWZfJJ4ebfVthayHsQrceUHCbUsx4=; b=PhhLpaV5vTjaLfnKilQScl0BID
 MZTXjvW5U4hexisKATYMDJ8v6wLEKiohfIGKYtkzBGL1CRmh5r6cYotAmaGhpbEp0ADYRBI5KuSgq
 Mo0/0ynU3kETtTK4suUPRb9FCGnuwlt2tkGIS0OxXXxnoA7uvvRLzcJCMx+2ALMuodSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dD+BKd8WZgIYEcpWZfJJ4ebfVthayHsQrceUHCbUsx4=; b=FjHzfQrBuXRAUW+t74fpzNb8pR
 KtSTDFgMFjWA6yXGmDme+OFgnxEFEjLEqnwkwWyl7y+7qO0H7kMFXS/4vwMtDrVgzBzNJQSEQMAN8
 p/y1ZolCvkEgtSewVyk+IZU35ZfmEpfIUQH4f3tmtGc++fXkycfMjvY5870b2xrVBdgQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFucR-00GnGw-HM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Feb 2022 09:11:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C5A46155D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Feb 2022 09:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B216DC004E1;
 Fri,  4 Feb 2022 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643965857;
 bh=V0yE5hxMUdg9LANtbDXwIXfKd8UVrTrz86FSocO9m0M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bLr+sVeefq5BQhsVPxD6WVefhoHMwdbI/F4eK9gca8XWfZAxiw2t0V3B6AzTN8vRd
 cNUbxJXOUtwDoq1hloEFIR9YnO8lcEzgcxDJlcT8KJw11Cs3GvhECM9afPYpQKXPWg
 zYNMhIVtjsbj8FjbKVffH9bTE7J2BAe+56+/dOptNx8XuoUtKzgEBJevY5NvwMqeUP
 vSFW2oZzIIaTrwt0u8uALWKV6fqpkhxfdHYb7c3ttao2vN3qUzxKcb0f3zLnllpupd
 6D3LVG6BRLDyFOCKXm/D/7EvveUQ7qk42pPj8/Q/bkyS+enVEIjQorbEAobLPrn0St
 3+Y944U9TTYbA==
Message-ID: <22c3fe49-81aa-e453-8b9c-643f7f590905@kernel.org>
Date: Fri, 4 Feb 2022 17:10:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210928151911.11189-1-chao@kernel.org>
 <YVNoHudG5c65X85G@google.com>
 <65f6c366-9e5b-fe7f-7c38-061996d1882b@kernel.org>
 <dec765de-407b-07c3-75f6-ec7f71c618b7@kernel.org>
 <YXwyvllUOm6jLiF5@google.com>
 <3e653a3d-ddb9-e115-d871-3659a1ba5530@kernel.org>
 <96959788-73b2-6e9b-3aa7-b1e23e9da417@kernel.org>
 <Ybjo6Zqpc7Wnev/r@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Ybjo6Zqpc7Wnev/r@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/15 2:56, Jaegeuk Kim wrote: > On 12/12, Chao Yu
 wrote: >> Ping, >> >> On 2021/10/30 11:02, Chao Yu wrote: >>> On 2021/10/30
 1:43, Jaegeuk Kim wrote: >>>> On 10/29, Chao Yu wrote: >>>>> Ping [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nFucR-00GnGw-HM
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xMi8xNSAyOjU2LCBKYWVnZXVrIEtpbSB3cm90ZToKPiBPbiAxMi8xMiwgQ2hhbyBZ
dSB3cm90ZToKPj4gUGluZywKPj4KPj4gT24gMjAyMS8xMC8zMCAxMTowMiwgQ2hhbyBZdSB3cm90
ZToKPj4+IE9uIDIwMjEvMTAvMzAgMTo0MywgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4gT24gMTAv
MjksIENoYW8gWXUgd3JvdGU6Cj4+Pj4+IFBpbmcsCj4+Pj4+Cj4+Pj4+IE9uIDIwMjEvOS8yOSA4
OjA1LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4gT24gMjAyMS85LzI5IDM6MDgsIEphZWdldWsgS2lt
IHdyb3RlOgo+Pj4+Pj4+IE9uIDA5LzI4LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4+PiBJbiBmMmZz
X2ZpbGVfd3JpdGVfaXRlcigpLCBsZXQncyB1c2UgZjJmc19vdmVyd3JpdGVfaW8oKSB0bwo+Pj4+
Pj4+PiBjaGVjayB3aGV0aGVyZSBpdCBpcyBvdmVyd3JpdGUgY2FzZSwgZm9yIHN1Y2ggY2FzZSwg
d2UgY2FuIHNraXAKPj4+Pj4+Pj4gZjJmc19wcmVhbGxvY2F0ZV9ibG9ja3MoKSBpbiBvcmRlciB0
byBhdm9pZCBmMmZzX2RvX21hcF9sb2NrKCksCj4+Pj4+Pj4+IHdoaWNoIG1heSBiZSBibG9ja2Vk
IGJ5IGNoZWNrcG9pbnQoKSBwb3RlbnRpYWxseS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gIMKg
wqAgZnMvZjJmcy9maWxlLmMgfCA0ICsrKysKPj4+Pj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9m
aWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+Pj4+PiBpbmRleCAxM2RlYWUwM2RmMDYuLjUxZmVj
YjJmNGRiNSAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPj4+Pj4+Pj4gKysr
IGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4+Pj4gQEAgLTQzMjEsNiArNDMyMSwxMCBAQCBzdGF0aWMg
c3NpemVfdCBmMmZzX2ZpbGVfd3JpdGVfaXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBp
b3ZfaXRlciAqZnJvbSkKPj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByZWFsbG9jYXRl
ZCA9IHRydWU7Cj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0YXJnZXRfc2l6ZSA9IGlv
Y2ItPmtpX3BvcyArIGlvdl9pdGVyX2NvdW50KGZyb20pOwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKGYyZnNfb3ZlcndyaXRlX2lvKGlub2RlLCBpb2NiLT5raV9wb3MsCj4+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlvdl9pdGVyX2Nv
dW50KGZyb20pKSkKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byB3cml0ZTsK
Pj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMgY2FsbHMgZjJmc19tYXBfYmxvY2tzKCkgd2hpY2ggY2FuIGJl
IGR1cGxpY2F0ZSwgaWYgaXQncyBub3QgdGhlIG92ZXJ3aXJ0ZQo+Pj4+Pj4+IGNhc2UuIERvIHdl
IGhhdmUgb3RoZXIgYmVuZWZpdD8KPj4+Pj4+Cj4+Pj4+PiBmMmZzX292ZXJ3cml0ZV9pbygpIHdp
bGwgYnJlYWsgZm9yIGFwcGVuZCB3cml0ZSBjYXNlIHcvIGJlbG93IGNoZWNrOgo+Pj4+Pj4KPj4+
Pj4+ICDCoCDCoMKgwqDCoGlmIChwb3MgKyBsZW4gPiBpX3NpemVfcmVhZChpbm9kZSkpCj4+Pj4+
PiAgwqAgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4+Pj4KPj4+Pj4+IEkgZ3Vlc3Mg
d2UgbWF5IG9ubHkgc3VmZmVyIGRvdWJsZSBmMmZzX21hcF9ibG9ja3MoKSBmb3Igd3JpdGUgaG9s
ZQo+Pj4+Pj4gY2FzZSwgZS5nLiB0cnVuY2F0ZSB0byBsYXJnZSBzaXplICYgd3JpdGUgaW5zaWRl
IHRoZSBmaWxlc2l6ZS4gRm9yCj4+Pj4+PiB0aGlzIGNhc2UsIGhvdyBhYm91dCBhZGRpbmcgYSBj
b25kaXRpb24gdG8gYWxsb3cgZG91YmxlIGYyZnNfbWFwX2Jsb2NrcygpCj4+Pj4+PiBvbmx5IGlm
IHdyaXRlIHNpemUgaXMgc21hbGxlciB0aGFuIGEgdGhyZXNob2xkPwo+Pj4+Cj4+Pj4gSSBzdGls
bCBkb24ndCBzZWUgdGhlIGJlbmVmaXQgbXVjaCB0byBkbyBkb3VibGUgZjJmc19tYXBfYmxvY2tz
LiBXaGF0IGlzIHRoZQo+Pj4+IHByb2JsZW0gaGVyZT8KPj4+Cj4+PiBUaGVyZSBpcyBwb3RlbnRp
YWwgaGFuZ3Rhc2sgaGFwcGVuZWQgZHVyaW5nIHN3YXBmaWxlJ3Mgd3JpdGViYWNrOgo+Pj4KPj4+
IC0gbG9vcF9rdGhyZWFkX3dvcmtlcl9mbgo+Pj4gICDCoC0ga3RocmVhZF93b3JrZXJfZm4KPj4+
ICAgwqAgLSBsb29wX3F1ZXVlX3dvcmsKPj4+ICAgwqDCoCAtIGxvX3J3X2Fpbwo+Pj4gICDCoMKg
wqAgLSBmMmZzX2ZpbGVfd3JpdGVfaXRlcgo+Pj4gICDCoMKgwqDCoCAtIGYyZnNfcHJlYWxsb2Nh
dGVfYmxvY2tzCj4+PiAgIMKgwqDCoMKgwqAgLSBmMmZzX21hcF9ibG9ja3MKPj4+ICAgwqDCoMKg
wqDCoMKgIC0gZG93bl9yZWFkCj4+PiAgIMKgwqDCoMKgwqDCoMKgIC0gcndzZW1fZG93bl9yZWFk
X3Nsb3dwYXRoCj4+PiAgIMKgwqDCoMKgwqDCoMKgwqAgLSBzY2hlZHVsZQo+Pj4KPj4+IEkgdHJ5
IHRvIG1pdGlnYXRlIHN1Y2ggaXNzdWUgYnkgcHJlYWxsb2NhdGluZyBzd2FwZmlsZSdzIGJsb2Nr
IGFkZHJlc3MgYW5kCj4+PiBhdm9pZCBmMmZzX2RvX21hcF9sb2NrKCkgYXMgbXVjaCBhcyBwb3Nz
aWJsZSBpbiBzd2FwZmlsZSdzIHdyaXRlYmFjayBwYXRoLi4uCj4gCj4gSG93IGFib3V0IGNoZWNr
aW5nIGlfYmxvY2tzIGFuZCBpX3NpemUgaW5zdGVhZCBvZiBjaGVja2luZyB0aGUgZW50aXJlIG1h
cD8KCkhvdyBhYm91dCB2Mj8KClRoYW5rcywKCj4gCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+Pgo+
Pj4+Pj4KPj4+Pj4+IFRoYW5rcywKPj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gZjJmc19wcmVhbGxvY2F0ZV9ibG9ja3MoaW9jYiwg
ZnJvbSk7Cj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyKSB7Cj4+Pj4+Pj4+
ICDCoMKgIG91dF9lcnI6Cj4+Pj4+Pj4+IC0tIAo+Pj4+Pj4+PiAyLjMyLjAKPj4+Pj4+Cj4+Pj4+
Pgo+Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+PiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+Pj4gaHR0cHM6Ly9hcGMwMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuc291cmNlZm9y
Z2UubmV0JTJGbGlzdHMlMkZsaXN0aW5mbyUyRmxpbnV4LWYyZnMtZGV2ZWwmYW1wO2RhdGE9MDQl
N0MwMSU3Q2NoYW8ueXUlNDBvcHBvLmNvbSU3Q2JiNDEwMDZjM2Y2ZDRlNGQ2MDBhMDhkOTliNTFj
YmNkJTdDZjE5MDVlYjFjMzUzNDFjNTk1MTY2MmI0YTU0YjVlZTYlN0MwJTdDMCU3QzYzNzcxMTU5
Nzg5NTQwMDI4NiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxD
SlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtz
ZGF0YT0lMkJsRUFYV0xwVjV3R1gyaEwwV2o1cDJxWDBBcWZVRkkwNVFpcWRwOFBLOGclM0QmYW1w
O3Jlc2VydmVkPTAKPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

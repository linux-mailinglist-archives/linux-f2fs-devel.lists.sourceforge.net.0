Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8757482B8F1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 02:07:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rO60h-0002Dm-Ky;
	Fri, 12 Jan 2024 01:07:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rO60f-0002Df-PI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 01:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KSMIIbujOvvOTOkarcGkflDrabqHHxoC410CeAGIN4s=; b=BPOHRUqNPkSt5lYU2psOC09WJ0
 cWH3OWumb/nmOWRCT6vbOHD7ZVbTBquLIQXYvzpqRGkRLBpposzM2pl1qFgz8eLEpaR6VE3zbLf3u
 28Ip18RBNIRLDf6ltu6CHmf1udZtvS8R1qB/pkXj4IzlRZd/9nYnPD9sSyJRelGeAYPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KSMIIbujOvvOTOkarcGkflDrabqHHxoC410CeAGIN4s=; b=eX9aEL91ITUwr4mRGAMBcRuhIx
 iORPGHAb1WBQ4w1I+223XavcT4SfVX+OWAASgveUYyYZvsXVxG0LF9npd40LGJ0XNedCxOMzyWs6I
 nCcPrwMAKNWtoTzl+1DGjaKIICgqLnzwgH0xZ9b2zsLnN1rDbiu/BWVlZ1cdcldCdz2I=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rO60e-0007JZ-Od for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 01:06:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 29AA5CE2251;
 Fri, 12 Jan 2024 01:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EB7C433F1;
 Fri, 12 Jan 2024 01:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705021601;
 bh=hVgQfaTNbu8e8u2PuXBunuk/KB2v9c8tBDHRJ1yrMBY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gVc5HDk+8JyrndEwP6so6gn1fSvC35oo6TbS2MvWsd5x0QaWgcx4HXwwHfOoCGdHu
 P3qOgI+3LgX9KOVKu6IfLSmuoz+YM56OtZeZG7I4/PblmsrATdO4j9JnXit0UL2Uxz
 hzGzUY5C4jXi0q0B1+bKUT9ZMjbdjrXANT73AJ5I6rmQCY3xHvfgnOdPQ+d3ckJbds
 C0TXuUUHto2MYqguGC+vdmFNriUJXJ8F2DhmmGybVWfmG93bYTIKrqlPVD7BxQqmAf
 e/ET8wCG01xC8ZNRhOZF6HVB33XzVARyMQI4oajxKjg+l6N0JtmAJfAjQf53y50Jtl
 gUiU1BLBDLM2A==
Message-ID: <d2f2e4ba-8668-4e37-a56f-dbe7c730b01f@kernel.org>
Date: Fri, 12 Jan 2024 09:06:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20231228143152.1543509-1-chao@kernel.org>
 <20231228143152.1543509-3-chao@kernel.org>
 <CACOAw_xCfOtJaC3FbOhvbrEzyUwecdSujFo4-f--dz+33BC+Sg@mail.gmail.com>
 <e7f4a835-6a4c-4f94-a79f-a425b04516e2@kernel.org>
 <CACOAw_wzBTV=+cqZeiCZvhud1Ek06aW_5nJbg=9FF327MNgxEg@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <CACOAw_wzBTV=+cqZeiCZvhud1Ek06aW_5nJbg=9FF327MNgxEg@mail.gmail.com>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/1/12 1:15, Daeho Jeong wrote: > On Wed, Jan 10, 2024
    at 5:33 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/1/11 9:18, Daeho
    Jeong wrote: >>> On Thu, Dec 28, 2023 at 6:33 AM Chao Yu <ch [...] 
 
 Content analysis details:   (-5.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rO60e-0007JZ-Od
Subject: Re: [f2fs-dev] [PATCH v3 3/6] f2fs: compress: fix to check
 unreleased compressed cluster
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xLzEyIDE6MTUsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFdlZCwgSmFuIDEwLCAy
MDI0IGF0IDU6MzPigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBP
biAyMDI0LzEvMTEgOToxOCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+PiBPbiBUaHUsIERlYyAyOCwg
MjAyMyBhdCA2OjMz4oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+
Pj4+IEZyb206IFNoZW5nIFlvbmcgPHNoZW5neW9uZ0BvcHBvLmNvbT4KPj4+Pgo+Pj4+IENvbXBy
ZXNzZWQgY2x1c3RlciBtYXkgbm90IGJlIHJlbGVhc2VkIGR1ZSB0byB3ZSBjYW4gZmFpbCBpbgo+
Pj4+IHJlbGVhc2VfY29tcHJlc3NfYmxvY2tzKCksIGZpeCB0byBoYW5kbGUgcmVzZXJ2ZWQgY29t
cHJlc3NlZAo+Pj4+IGNsdXN0ZXIgY29ycmVjdGx5IGluIHJlc2VydmVfY29tcHJlc3NfYmxvY2tz
KCkuCj4+Pj4KPj4+PiBGaXhlczogNGM4ZmY3MDk1YmVmICgiZjJmczogc3VwcG9ydCBkYXRhIGNv
bXByZXNzaW9uIikKPj4+PiBTaWduZWQtb2ZmLWJ5OiBTaGVuZyBZb25nIDxzaGVuZ3lvbmdAb3Bw
by5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+Pj4+
IC0tLQo+Pj4+ICAgIGZzL2YyZnMvZmlsZS5jIHwgMTIgKysrKysrKysrKysrCj4+Pj4gICAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4gaW5kZXggMDI2ZDA1YTdlZGQ4Li43ODJh
ZTNiZTQ4ZjYgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPj4+PiArKysgYi9mcy9m
MmZzL2ZpbGUuYwo+Pj4+IEBAIC0zNjI0LDYgKzM2MjQsMTUgQEAgc3RhdGljIGludCByZXNlcnZl
X2NvbXByZXNzX2Jsb2NrcyhzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sIHBnb2ZmX3QgY291bnQp
Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPj4+Pgo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIC8qCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogY29tcHJlc3NlZCBjbHVzdGVy
IHdhcyBub3QgcmVsZWFzZWQgZHVlIHRvCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICog
aXQgZmFpbHMgaW4gcmVsZWFzZV9jb21wcmVzc19ibG9ja3MoKS4KPj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgKi8KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoYmxrYWRkciA9
PSBORVdfQUREUikgewo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcHJf
YmxvY2tzKys7Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4+Pj4gKwo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKF9faXNfdmFsaWRfZGF0YV9ibGthZGRyKGJsa2FkZHIpKSB7Cj4+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXByX2Jsb2NrcysrOwo+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4+Cj4+PiBIb3cgYWJv
dXQgbWVyZ2luZyB0d28gY29uZGl0aW9ucyBsaWtlICJibGthZGRyID09IE5FV19BRERSIHx8Cj4+
PiBfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGthZGRyKSI/Cj4+Cj4+IE9oLCBzdXJlLgo+Pgo+
Pj4KPj4+PiBAQCAtMzYzMyw2ICszNjQyLDkgQEAgc3RhdGljIGludCByZXNlcnZlX2NvbXByZXNz
X2Jsb2NrcyhzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sIHBnb2ZmX3QgY291bnQpCj4+Pj4gICAg
ICAgICAgICAgICAgICAgfQo+Pj4+Cj4+Pj4gICAgICAgICAgICAgICAgICAgcmVzZXJ2ZWQgPSBj
bHVzdGVyX3NpemUgLSBjb21wcl9ibG9ja3M7Cj4+Pj4gKyAgICAgICAgICAgICAgIGlmICghcmVz
ZXJ2ZWQpCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+Pj4+ICsKPj4+
Cj4+PiBIb3cgY2FuIHRoZSByZXNlcnZlZCB2YXJpYWJsZSBiZSB6ZXJvPwo+Pgo+PiBJIGd1ZXNz
IGl0IGNhbiBoYXBwZW4gaWYgYSBjbHVzdGVyIHdhcyBub3QgcmVsZWFzZWQgZHVyaW5nCj4+IHJl
bGVhc2VfY29tcHJlc3NfYmxvY2tzKCksIHRoZW4gYWxsIGJsb2NrcyBpbiB0aGUgY2x1c3RlciBz
aG91bGQKPj4gaGFzIGJlZW4gcmVzZXJ2ZWQsIHNvLCBpbiB0aGlzIHJvdW5kIG9mIHJlc2Vydmlu
ZywgaXQgbmVlZHMgdG8gc2tpcAo+PiByZXNlcnZlIGJsb2NrcywgcmlnaHQ/Cj4gCj4gTGV0J3Mg
YXNzdW1lIGNsdXN0ZXJfc2l6ZSBpcyA0LiBIb3cgY2FuIGNvbXByX2Jsb2NrcyBiZSA0Pwo+IAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoaSA9PSAwKSB7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGJsa2FkZHIgPT0gQ09NUFJFU1NfQUREUikKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRuLT5vZnNfaW5fbm9kZSArPSBjbHVzdGVyX3NpemU7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4gCj4gV2Ugc2tpcCB0aGUgYmxvY2sgaGF2aW5nIENPTVBSRVNTX0FE
RFIgd2hlbiBjb3VudGluZyBjb21wcl9ibG9ja3MuCj4gU28sIHRoZSBtYXhpbXVtIHZhbHVlIG9m
IGNvbXByX2Jsb2NrcyBzaG91bGQgYmUgMywgcmlnaHQ/CgpBaCwgZ290IGl0LCBhbmQgSSB0aGlu
ayB5b3UncmUgcmlnaHQuCgpTaG91bGQgZml4IHRoZSBjb25kaXRpb24gYXMgYmVsb3c/CgoJCS8q
IGZvciB0aGUgY2FzZSBhbGwgYmxvY2tzIGluIGNsdXN0ZXIgd2VyZSByZXNlcnZlZCAqLwoJCWlm
IChyZXNlcnZlZCA9PSAxKQoJCQlnb3RvIG5leHQ7CgpUaGFua3MsCgo+IAo+Pgo+PiBUaGFua3Ms
Cj4+Cj4+Pgo+Pj4+ICAgICAgICAgICAgICAgICAgIHJldCA9IGluY192YWxpZF9ibG9ja19jb3Vu
dChzYmksIGRuLT5pbm9kZSwgJnJlc2VydmVkKTsKPj4+PiAgICAgICAgICAgICAgICAgICBpZiAo
cmV0KQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+PiAtLQo+
Pj4+IDIuNDAuMQo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
Pj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+IGh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==

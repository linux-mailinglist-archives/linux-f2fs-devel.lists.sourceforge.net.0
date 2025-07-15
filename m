Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0FDB05593
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jul 2025 10:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z/RAoTCfzwfIziN5F2pQg4HlbEup01SZKuJG4kqroA=; b=kIuoiKuMCaUF82yYOEyrtW/+/l
	TnJhbhVAIAkZvLCgGzpKKK4Ug86HoW0B/KMYKwmKCjmoEe0Ws+ehe1ztwd8RBpocbbSeHYsCfqAia
	OdbJm4fK1HBMwfhkjP1voOMkgFOvdPixrr3ZVleshyRPzqu/IA/lKQi6Y3gYJPKRjq+Q=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubbTB-0004W9-AI;
	Tue, 15 Jul 2025 08:57:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ubbT9-0004W1-DF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 08:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ra43gX9m4FpGyGB7/nG8Vb6/dfrDSkQWzjdG1NJ5Oxs=; b=MGdrRpEXS+WwWsXUL6wTQj/D2u
 GvsumcDn3LVyrhhPgZvrxYifZdBcea3wITLldYUqLfcl7SOweUiJZhbNu9QCSLWPZi5rebh2bPqsT
 /jTb/xQp0dQbyGj3wFyJi8tElL1h2jFOg358YR3zIQMYRIk3lhgiGN6JlLIAdwBzxaWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ra43gX9m4FpGyGB7/nG8Vb6/dfrDSkQWzjdG1NJ5Oxs=; b=VriBUjovbWy+Wj1zPHZUdCujgI
 gsFsKIEoB09rveHtkdADpI6tJM9CbK6JHUo52mOXt9KFX1TjO6idEgSzuowdMskiTe7sFpPc0RG24
 o5nBEQSGZd3S+RyTZzPCpuYG2h3gRzJGfPnGhjKQw0+KHyiyOfsdNbnfcGTnsLYexuNw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubbT8-0000De-UA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 08:56:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7CD015C58E2;
 Tue, 15 Jul 2025 08:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83985C4CEE3;
 Tue, 15 Jul 2025 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752569813;
 bh=uy3r1KRSGfaCT/00RMEF0g7ulQJDvfb2qwxyLC2jV0E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hNDpAesShe4bdOBCsWk+KMM/G7o9CmteGjQ87GdX9ZGKqSPFgSmISVv5XcMb7BTqq
 EJKUyQl1vojmMFafSGR53SaJMcCfKoEFhnxe42fbFi87ZmG21YKqH7nghVkOUxokM0
 ljqCyU38WTegb3sb2IWRPzwbjVnxpamgKP5tY/XyXyaXerfMjVw4U3AGhZS5/tyAh2
 lTp6qtEOIUH03gjpAsN2p7j1KGvm99HjF9Xi3y0WlQ16D0taX6i4AzAfqftxjWEef8
 NIeAQx/T9eUPpZw8i1x8JggWny8YmZTtfA0+Y3i54yTxT753Vtv6vV72mpu6ZqOTDs
 TekFYHoU82bwQ==
Message-ID: <742d1cc4-38c0-4f87-aab2-ab76a3825d01@kernel.org>
Date: Tue, 15 Jul 2025 16:56:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?6rmA6rec7KeE?= <rolypolyvg295@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CAA_oFbL+kxddwhS9-PWeO1EE4yJBHk6uwMwjB+r9wAW6+Zb45Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAA_oFbL+kxddwhS9-PWeO1EE4yJBHk6uwMwjB+r9wAW6+Zb45Q@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, Sorry for the delay. On 6/12/25 20:32, 김규진 wrote:
    > Hi F2FS developers, > > I'm testing multi-threaded direct I/O in LFS mode
    on Linux kernel > 6.8.0-57.59, and noticed what seems to be an inefficiency
    in block > al [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ubbT8-0000De-UA
Subject: Re: [f2fs-dev] [question] Design rationale behind f2fs_map_blocks
 block reuse in LFS mode with DIO
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgpTb3JyeSBmb3IgdGhlIGRlbGF5LgoKT24gNi8xMi8yNSAyMDozMiwg6rmA6rec7KeEIHdy
b3RlOgo+IEhpIEYyRlMgZGV2ZWxvcGVycywKPiAKPiBJJ20gdGVzdGluZyBtdWx0aS10aHJlYWRl
ZCBkaXJlY3QgSS9PIGluIExGUyBtb2RlIG9uIExpbnV4IGtlcm5lbAo+IDYuOC4wLTU3LjU5LCBh
bmQgbm90aWNlZCB3aGF0IHNlZW1zIHRvIGJlIGFuIGluZWZmaWNpZW5jeSBpbiBibG9jawo+IGFs
bG9jYXRpb24gYmVoYXZpb3IgaW5zaWRlIGBmcy9mMmZzL2RhdGEuY2AgKHNwZWNpZmljYWxseQo+
IGBmMmZzX21hcF9ibG9ja3MoKWApOgo+IAo+IDEuIEluIExGUyBtb2RlIHdpdGggZGlyZWN0IEkv
TywgYGYyZnNfbWFwX2Jsb2NrcygpYCBhbHdheXMgY2FsbHMKPiBgX19hbGxvY2F0ZV9kYXRhX2Js
b2NrKClgIHRvIHJlc2VydmUgYSBuZXcgYmxvY2sgYW5kIHVwZGF0ZXMgdGhlCj4gbm9kZS9OQVQg
ZW50cnksIHJlZ2FyZGxlc3Mgb2YgZXh0ZW50IGNvbnRpbnVpdHkuCj4gCj4gMi4gSWYgdGhlIG5l
dyBibG9jayBpcyBub3QgcGh5c2ljYWxseSBjb250aWd1b3VzIHdpdGggdGhlIGN1cnJlbnQKPiBl
eHRlbnQsIGl0IHN1Ym1pdHMgdGhlIGN1cnJlbnQgYmlvIGFuZCBkZWZlcnMgdGhlIHdyaXRlIG9m
IHRoZSBuZXdseQo+IHJlc2VydmVkIGJsb2NrICh3aGljaCBpcyBub3cgcmVjb3JkZWQgaW4gdGhl
IG5vZGUpIHRvIHRoZSBuZXh0Cj4gbWFwcGluZy4KPiAKPiAzLiBPbiB0aGUgbmV4dCBgZjJmc19t
YXBfYmxvY2tzKClgIGNhbGwsIGl0IGZpbmRzIHRoYXQgdGhlIGxvZ2ljYWwKPiBibG9jayBpcyBh
bHJlYWR5IG1hcHBlZCBpbiB0aGUgbm9kZS9OQVQgZW50cnkgYW5kIHNraXBzIG92ZXIKPiBpdOKA
lGRlc3BpdGUgdGhlIGJsb2NrIG5ldmVyIGhhdmluZyBiZWVuIHdyaXR0ZW7igJRyZXN1bHRpbmcg
aW4gYWxsb2NhdGlvbgo+IG9mIHlldCBhbm90aGVyIGJsb2NrLiBPdmVyIHRpbWUsIHRoaXMgbGVh
dmVzIGJlaGluZCBob2xlcyBpbiB0aGUKPiBjdXJyZW50IHNlZ21lbnQsIGVzcGVjaWFsbHkgdW5k
ZXIgaGVhdnkgbXVsdGktdGhyZWFkZWQgRElPLgoKSUlVQywKClRoZSBwcm9ibGVtIGlzIHNvbWV0
aGluZyBsaWtlIHRoaXMsIGlzIG15IHVuZGVyc3RhbmRpbmcgcmlnaHQ/CgotIHVzZXIgdHJpZXMg
dG8gd3JpdGUgNzY4IGJsb2NrcyB3LyBkaXJlY3QgSU8uCi0gZjJmc19pb21hcF9iZWdpbihvZnM6
MCwgbGVuOjc2OCkKIC0gZjJmc19tYXBfYmxvY2tzIGFsbG9jYXRlcyB0d28gZXh0ZW50cyBbb2Zz
OjAsIGJsazo1MTIsIGxlbjo1MTJdIGFuZAogICBbb2ZzOjUxMiwgYmxrOjAsIGxlbjowXSwgaG93
ZXZlciBmMmZzX21hcF9ibG9ja3MoKSBvbmx5IHJldHVybiB0aGUgZmlyc3QKICAgZXh0ZW50LAog
LSBmMmZzX2lvbWFwX2JlZ2luKG9mczo1MTIsIGxlbjoyNTYpCiAgIGYyZnNfbWFwX2Jsb2NrcyBh
bGxvY2F0ZXMgYW5vdGhlciBwaHlzaWNhbCBibG9jayBmb3Igb2ZzOjUxMiBldmVuIHRoZXJlIGlz
CiAgIGEgdW53cml0dGVuIHBoeXNpY2FsIGJsb2NrIGFsbG9jYXRlZCBkdXJpbmcgcHJldmlvdXMg
ZjJmc19tYXBfYmxvY2tzLgoKVGhhbmtzLAoKPiAKPiAKPiBTaW5jZSBJJ20gc3RpbGwgbmV3IHRv
IEYyRlMgaW50ZXJuYWxzLCBJIG1heSBiZSBtaXNzaW5nIHNvbWV0aGluZyDigJQKPiBJJ2QgbGlr
ZSB0byB1bmRlcnN0YW5kIHRoZSBkZXNpZ24gcmF0aW9uYWxlIGJlaGluZCB0aGlzIGJlaGF2aW9y
IGluCj4gTEZTIG1vZGUsIGlmIHBvc3NpYmxlLgo+IAo+ICoqTXkgcXVlc3Rpb25zIGFyZToqKgo+
IAo+IC0gSXMgdGhlcmUgYSBzcGVjaWZpYyByZWFzb24gRjJGUyBkb2VzIG5vdCBkaXN0aW5ndWlz
aCBiZXR3ZWVuCj4gcmVzZXJ2ZWQtYnV0LXVud3JpdHRlbiBhbmQgYWxyZWFkeS13cml0dGVuIGJs
b2NrcyBpbiB0aGlzIGNhc2U/Cj4gLSBXb3VsZCBpdCBiZSBwb3NzaWJsZSAob3IgYmVuZWZpY2lh
bCkgdG86Cj4gCj4gICAxLiBEZWxheSBibG9jayBhbGxvY2F0aW9uIHVudGlsIHRoZSBleHRlbnQg
Y2FuIGFjdHVhbGx5IGJlIGV4dGVuZGVkPwo+IAo+ICAgMi4gVHJhY2sgInJlc2VydmVkLWJ1dC11
bndyaXR0ZW4iIGJsb2NrcyBkaXN0aW5jdGx5IHRvIGF2b2lkIHJlYWxsb2NhdGlvbj8KPiAKPiAK
PiBUaGFua3MgaW4gYWR2YW5jZSBmb3IgYW55IGNsYXJpZmljYXRpb24gb3IgaW5zaWdodC4KPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gCj4gR3lqaW4gS2ltCj4gCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==

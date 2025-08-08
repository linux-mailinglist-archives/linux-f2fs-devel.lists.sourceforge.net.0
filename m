Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A5B1E004
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 02:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QBQy921s84aGvw+vIL/RRFiKJX2cJ6H6SDMFY7GAuQ=; b=PwDGwevrkRGuUiy0CwGn2LIHdp
	IypNiv5zDst5YPbMWovRWs9aPucd+dyz0BRJmTyyORXJQBJ9QBS+yjLzK+8lv1YiH1udKFsax5EY3
	391k2cIaW1BbhF56hHiDu78jQ7cNGBW4ZG88dEI/rIP37uEU+xUfgw88DDZwLcqbPy3Q=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukBK1-00051z-Ks;
	Fri, 08 Aug 2025 00:51:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ukBK0-00051h-19
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 00:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aMzXuosRf9e70//ADIVTgkSr8gWaIR2sfiOrQQTK0lw=; b=gm9HX7+p0jR04IeUZ8d8e66HoN
 SXQaPYZT4D6OlyzI1wXrmlUY7DnGwd6HXrhU9ij88eryNQAlZiPmlyJm9g0ZPGfazcDilfqFTzkx4
 wS2Z+NNknWMpzOMYV+s6CP8swfYtI2qgKuEbXOhDUfWR5+5mogaZRsjNFhbCtp46QqmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aMzXuosRf9e70//ADIVTgkSr8gWaIR2sfiOrQQTK0lw=; b=OsH7ml2QOCWXIPg1XXmHwZLCQL
 lECue+w8NHek6w+ALxcFPKFG19Bq27P0+OCfhMsERx4iScpTUeYPaQWCkElvnoPXZIw9Iq78c9DM7
 Fzfug2Tcialo6mowIpJWL9HN/48NPtnR8WyJcMU1FouxKnvxE4ZRruIzQM6CFNqlegaI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukBJz-0002ew-AI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 00:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9F273601BB;
 Fri,  8 Aug 2025 00:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34ECC4CEEB;
 Fri,  8 Aug 2025 00:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754614248;
 bh=vRBvlXw4aotQnpm1wMZP6Af/iqx5ugMntlAdR4bVYdM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=i8a3F4CuemdCRVfJiVSdSUKKbMZDLtdOF6mDc2V7d+2plI6lkAKvyKfrLN5WMRfcG
 yo37qdeG2HnkWH3lE2/df/IKhCXzdFG9ZVSFDUaLowc9FarH3QQQej973xiaMJi3N2
 iA3CvqAa40oPrUzV1c145r5s58L84fd0BHNK75JXU5aiUKkFE5hz+lGYlIdwNSL+ga
 RpaRDZ0T5he0g+2/+Mxt/9B/gDhOtP9fSc8K0JTSuWtR8Rytm5goTv5nU8nUHkfaO5
 uhXZJGxUFSmPMLHUcCTT3sUWRCHC7UyYbIa8Womc87QBztukP6LioZeX/bql10dtWh
 UQ8jYsLpFBm5g==
Message-ID: <90298827-01f9-48dd-9a4c-7990105b4bf0@kernel.org>
Date: Fri, 8 Aug 2025 08:50:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250805132208.486601-1-liaoyuanhong@vivo.com>
 <20250806070905.71012-1-liaoyuanhong@vivo.com>
 <ee0b8b83-a368-4529-b25d-d3b1c6291648@kernel.org>
 <2518652e-4a81-4b71-a0bd-a078d511f7b2@vivo.com>
Content-Language: en-US
In-Reply-To: <2518652e-4a81-4b71-a0bd-a078d511f7b2@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/8/7 17:12, Liao Yuanhong wrote: > > On 8/7/2025 4:38
 PM, Chao Yu wrote: >> On 8/6/25 15:09, Liao Yuanhong wrote: >>> Currently,
 we have encountered some issues while testing ZUFS. In >>> situa [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ukBJz-0002ew-AI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Add bggc_block_io to adjust the
 priority of BG_GC when issuing IO
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS84LzcgMTc6MTIsIExpYW8gWXVhbmhvbmcgd3JvdGU6Cj4gCj4gT24gOC83LzIwMjUg
NDozOCBQTSwgQ2hhbyBZdSB3cm90ZToKPj4gT24gOC82LzI1IDE1OjA5LCBMaWFvIFl1YW5ob25n
IHdyb3RlOgo+Pj4gQ3VycmVudGx5LCB3ZSBoYXZlIGVuY291bnRlcmVkIHNvbWUgaXNzdWVzIHdo
aWxlIHRlc3RpbmcgWlVGUy4gSW4KPj4+IHNpdHVhdGlvbnMgbmVhciB0aGUgc3RvcmFnZSBsaW1p
dCAoZS5nLiwgNTBHQiByZW1haW5pbmcpLCBhbmQgYWZ0ZXIKPj4+IHNpbXVsYXRpbmcgZnJhZ21l
bnRhdGlvbiBieSByZXBlYXRlZGx5IHdyaXRpbmcgYW5kIGRlbGV0aW5nIGRhdGEsIHdlIGZvdW5k
Cj4+PiB0aGF0IGFwcGxpY2F0aW9uIGluc3RhbGxhdGlvbiBhbmQgc3RhcnR1cCB0ZXN0cyBjb25k
dWN0ZWQgYWZ0ZXIgaWRsaW5nIGZvcgo+Pj4gYSBmZXcgbWludXRlcyB0YWtlIHNpZ25pZmljYW50
bHkgbG9uZ2VyIHNldmVyYWwgdGltZXMgdGhhdCBvZiB0cmFkaXRpb25hbAo+Pj4gVUZTLiBUcmFj
aW5nIHRoZSBvcGVyYXRpb25zIHJldmVhbGVkIHRoYXQgdGhlIG1ham9yaXR5IG9mIEkvT3Mgd2Vy
ZSBpc3N1ZWQKPj4+IGJ5IGJhY2tncm91bmQgR0MsIHdoaWNoIGJsb2NrcyBub3JtYWwgSS9PIG9w
ZXJhdGlvbnMuCj4+Pgo+Pj4gVW5kZXIgbm9ybWFsIGNpcmN1bXN0YW5jZXMsIFpVRlMgaW5kZWVk
IHJlcXVpcmVzIG1vcmUgYmFja2dyb3VuZCBHQyBhbmQKPj4+IGVtcGxveXMgYSBtb3JlIGFnZ3Jl
c3NpdmUgR0Mgc3RyYXRlZ3kuIEhvd2V2ZXIsIEkgYWltIHRvIGZpbmQgYSB3YXkgdG8KPj4+IG1p
bmltaXplIHRoZSBpbXBhY3Qgb24gcmVndWxhciBJL08gb3BlcmF0aW9ucyB1bmRlciB0aGVzZSBu
ZWFyLWxpbWl0Cj4+PiBjb25kaXRpb25zLiBUbyBhZGRyZXNzIHRoaXMsIEkgaGF2ZSBpbnRyb2R1
Y2VkIGEgYmdnY19ibG9ja19pbyBmZWF0dXJlLAo+Pj4gd2hpY2ggY29udHJvbHMgdGhlIHByaW9y
aXRpemF0aW9uIG9mIGJhY2tncm91bmQgR0MgaW4gdGhlIHByZXNlbmNlIG9mIEkvT3MuCj4+PiBU
aGlzIHN3aXRjaCBjYW4gYmUgYWRqdXN0ZWQgYXQgdGhlIGZyYW1ld29yayBsZXZlbCB0byBpbXBs
ZW1lbnQgZGlmZmVyZW50Cj4+PiBzdHJhdGVnaWVzLiBJZiBzZXQgdG8gQUxMX0lPX1BSSU9SLCBh
bGwgYmFja2dyb3VuZCBHQyBvcGVyYXRpb25zIHdpbGwgYmUKPj4+IHNraXBwZWQgZHVyaW5nIGFj
dGl2ZSBJL08gaXNzdWFuY2UuIFRoZSBkZWZhdWx0IG9wdGlvbiByZW1haW5zIGNvbnNpc3RlbnQK
Pj4+IHdpdGggdGhlIGN1cnJlbnQgc3RyYXRlZ3ksIGVuc3VyaW5nIG5vIGNoYW5nZSBpbiBiZWhh
dmlvci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBMaWFvIFl1YW5ob25nIDxsaWFveXVhbmhvbmdA
dml2by5jb20+Cj4+PiAtLS0KPj4+IENoYW5nZXMgaW4gdjI6Cj4+PiDCoMKgwqDCoE5vbiBaVUZT
IGNhbiBhbHNvIGJlIGFkanVzdGVkIHRocm91Z2ggdGhpcyBvcHRpb24uCj4+PiAtLS0KPj4+IMKg
IERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyB8IDEzICsrKysrKysrKysr
KysKPj4+IMKgIGZzL2YyZnMvZjJmcy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAxOCArKysrKysrKysrKy0tLS0tLS0KPj4+IMKgIGZzL2YyZnMv
c3VwZXIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMiArKwo+Pj4gwqAgZnMvZjJmcy9zeXNmcy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5ICsrKysrKysrKwo+Pj4gwqAgNCBmaWxlcyBjaGFu
Z2VkLCAzNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgYi9Eb2N1bWVudGF0aW9u
L0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPj4+IGluZGV4IGJjMGU3ZmVmYzM5ZC4uMTJmZGEx
MWQ0ZGE1IDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1m
cy1mMmZzCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMK
Pj4+IEBAIC04ODMsMyArODgzLDE2IEBAIERhdGU6wqDCoMKgwqDCoMKgwqAgSnVuZSAyMDI1Cj4+
PiDCoCBDb250YWN0OsKgwqDCoCAiRGFlaG8gSmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+
Cj4+PiDCoCBEZXNjcmlwdGlvbjrCoMKgwqAgQ29udHJvbCBHQyBhbGdvcml0aG0gZm9yIGJvb3N0
IEdDLiAwOiBjb3N0IGJlbmVmaXQsIDE6IGdyZWVkeQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIERl
ZmF1bHQ6IDEKPj4+ICsKPj4+ICtXaGF0OsKgwqDCoMKgwqDCoMKgIC9zeXMvZnMvZjJmcy88ZGlz
az4vYmdnY19ibG9ja19pbwo+Pj4gK0RhdGU6wqDCoMKgwqDCoMKgwqAgQXVndXN0IDIwMjUKPj4+
ICtDb250YWN0OsKgwqDCoCAiTGlhbyBZdWFuaG9uZyIgPGxpYW95dWFuaG9uZ0B2aXZvLmNvbT4K
Pj4+ICtEZXNjcmlwdGlvbjrCoMKgwqAgVXNlZCB0byBhZGp1c3QgdGhlIEJHX0dDIHByaW9yaXR5
IHdoZW4gaXNzdWluZyBJTywgd2l0aCBhIGRlZmF1bHQgdmFsdWUKPj4+ICvCoMKgwqDCoMKgwqDC
oCBvZiAxLgo+PiBEZWZhdWx0IHZhbHVlIGlzIDIgaWYgQ09ORklHX0JMS19ERVZfWk9ORUQgaXMg
b2ZmPwo+Pgo+PiBUaGFua3MsCj4gCj4gU29ycnksIEkgbWlzc2VkIHVwZGF0aW5nIHRoZSBkZXNj
cmlwdGlvbi4gSXMgaXQgbW9yZSByZWFzb25hYmxlIHRvIHNldCB0aGUgZGVmYXVsdCB2YWx1ZSB0
byAwIGZvciB2ZXJzaW9ucyB0aGF0IGRpc2FibGUgQ09ORklHX0JMS19ERVZfWk9ORUQ/IElmIHNv
LCBJIHdpbGwgc3VibWl0IGEgbmV3IHZlcnNpb24gdG8gY29ycmVjdCB0aGUgZGVzY3JpcHRpb24g
YW5kIGluaXRpYWwgdmFsdWUgc2V0dGluZ3MgaGVyZS4gVGhhbmtzLCBMaWFvCgpCZWZvcmUgdGhp
cyBwYXRjaCwgdGhlIGRlZmF1bHQgYmVoYXZpb3IgaXMgc29tZXRoaW5nIGxpa2UgQUxMX0lPX1BS
SU9SPwoKV2hhdCBkbyB5b3UgdGhpbmsgb2YgZGVmaW5pbmcgQUxMX0lPX1BSSU9SIHcvIDAsIGFu
ZCB1c2UgaXQgYnkgZGVmYXVsdD8KClRoYW5rcywKCj4gCj4+PiArCj4+PiArwqDCoMKgwqDCoMKg
wqAgPT09PT09PT09PT09PT09PT09wqAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4+PiArwqDCoMKgwqDCoMKgwqAgdmFsdWXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGVzY3JpcHRpb24KPj4+ICvCoMKgwqDCoMKgwqDCoCBiZ2djX2Jsb2NrX2lv
ID0gMMKgwqAgUHJpb3JpdGl6ZSBiYWNrZ3JvdW5kIEdDCj4+PiArwqDCoMKgwqDCoMKgwqAgYmdn
Y19ibG9ja19pbyA9IDHCoMKgIFN0b3AgYmFja2dyb3VuZCBHQyBvbmx5IHdoZW4gaXNzdWluZyBy
ZWFkIEkvTwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGJnZ2NfYmxvY2tfaW8gPSAywqDCoCBTdG9wIGJh
Y2tncm91bmQgR0Mgd2hlbiBpc3N1aW5nIEkvTwo+Pj4gK8KgwqDCoMKgwqDCoMKgID09PT09PT09
PT09PT09PT09PcKgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+IGlu
ZGV4IDQ2YmU3NTYwNTQ4Yy4uZmU0MWI3MzNmYmMyIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9m
MmZzLmgKPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+PiBAQCAtMTU1LDYgKzE1NSwxMiBAQCBl
bnVtIGJsa3pvbmVfYWxsb2NhdGlvbl9wb2xpY3kgewo+Pj4gwqDCoMKgwqDCoCBCTEtaT05FX0FM
TE9DX1BSSU9SX0NPTlYswqDCoMKgIC8qIFByaW9yaXRpemUgd3JpdGluZyB0byBjb252ZW50aW9u
YWwgem9uZXMgKi8KPj4+IMKgIH07Cj4+PiArZW51bSBiZ2djX2Jsb2NrX2lvX3BvbGljeSB7Cj4+
PiArwqDCoMKgIEJHR0NfUFJJT1IsCj4+PiArwqDCoMKgIFJFQURfSU9fUFJJT1IsCj4+PiArwqDC
oMKgIEFMTF9JT19QUklPUiwKPj4+ICt9Owo+Pj4gKwo+Pj4gwqAgLyoKPj4+IMKgwqAgKiBBbiBp
bXBsZW1lbnRhdGlvbiBvZiBhbiByd3NlbSB0aGF0IGlzIGV4cGxpY2l0bHkgdW5mYWlyIHRvIHJl
YWRlcnMuIFRoaXMKPj4+IMKgwqAgKiBwcmV2ZW50cyBwcmlvcml0eSBpbnZlcnNpb24gd2hlbiBh
IGxvdy1wcmlvcml0eSByZWFkZXIgYWNxdWlyZXMgdGhlIHJlYWQgbG9jawo+Pj4gQEAgLTE4MDQs
NiArMTgxMCw3IEBAIHN0cnVjdCBmMmZzX3NiX2luZm8gewo+Pj4gwqDCoMKgwqDCoCBzcGlubG9j
a190IGRldl9sb2NrO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogcHJvdGVjdCBkaXJ0eV9kZXZp
Y2UgKi8KPj4+IMKgwqDCoMKgwqAgYm9vbCBhbGlnbmVkX2Jsa3NpemU7wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKiBhbGwgZGV2aWNlcyBoYXMgdGhlIHNhbWUgbG9naWNhbCBibGtzaXplICovCj4+
PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBmaXJzdF9zZXFfem9uZV9zZWdubzvCoMKgwqAgLyog
Zmlyc3Qgc2Vnbm8gaW4gc2VxdWVudGlhbCB6b25lICovCj4+PiArwqDCoMKgIHVuc2lnbmVkIGlu
dCBiZ2djX2Jsb2NrX2lvO8KgwqDCoMKgwqDCoMKgIC8qIEZvciBhZGp1c3QgdGhlIEJHX0dDIHBy
aW9yaXR5IHdoZW4gaXNzdWluZyBJTyAqLwo+Pj4gwqDCoMKgwqDCoCAvKiBGb3Igd3JpdGUgc3Rh
dGlzdGljcyAqLwo+Pj4gwqDCoMKgwqDCoCB1NjQgc2VjdG9yc193cml0dGVuX3N0YXJ0Owo+Pj4g
QEAgLTI5OTgsMTMgKzMwMDUsMTAgQEAgc3RhdGljIGlubGluZSBib29sIGlzX2lkbGUoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSkKPj4+IMKgwqDCoMKgwqAgaWYgKHNiaS0+Z2Nf
bW9kZSA9PSBHQ19VUkdFTlRfSElHSCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1
ZTsKPj4+IC3CoMKgwqAgaWYgKHpvbmVkX2djKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGlz
X2luZmxpZ2h0X3JlYWRfaW8oc2JpKSkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBmYWxzZTsKPj4+IC3CoMKgwqAgfSBlbHNlIHsKPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoaXNf
aW5mbGlnaHRfaW8oc2JpLCB0eXBlKSkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBmYWxzZTsKPj4+IC3CoMKgwqAgfQo+Pj4gK8KgwqDCoCBpZiAoc2JpLT5iZ2djX2Jsb2NrX2lv
ID09IFJFQURfSU9fUFJJT1IgJiYgaXNfaW5mbGlnaHRfcmVhZF9pbyhzYmkpKQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+ICvCoMKgwqAgaWYgKHNiaS0+YmdnY19ibG9ja19p
byA9PSBBTExfSU9fUFJJT1IgJiYgaXNfaW5mbGlnaHRfaW8oc2JpLCB0eXBlKSkKPj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+PiDCoMKgwqDCoMKgIGlmIChzYmktPmdjX21vZGUg
PT0gR0NfVVJHRU5UX01JRCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+IGluZGV4
IGUxNmM0ZTI4MzBjMi4uYTIxY2VjYzU0MjRlIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9zdXBl
ci5jCj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+IEBAIC00NjI5LDkgKzQ2MjksMTEgQEAg
c3RhdGljIGludCBmMmZzX3NjYW5fZGV2aWNlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+
PiDCoMKgwqDCoMKgIGxvZ2ljYWxfYmxrc2l6ZSA9IGJkZXZfbG9naWNhbF9ibG9ja19zaXplKHNi
aS0+c2ItPnNfYmRldik7Cj4+PiDCoMKgwqDCoMKgIHNiaS0+YWxpZ25lZF9ibGtzaXplID0gdHJ1
ZTsKPj4+ICvCoMKgwqAgc2JpLT5iZ2djX2Jsb2NrX2lvID0gQUxMX0lPX1BSSU9SOwo+Pj4gwqAg
I2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4+PiDCoMKgwqDCoMKgIHNiaS0+bWF4X29wZW5f
em9uZXMgPSBVSU5UX01BWDsKPj4+IMKgwqDCoMKgwqAgc2JpLT5ibGt6b25lX2FsbG9jX3BvbGlj
eSA9IEJMS1pPTkVfQUxMT0NfUFJJT1JfU0VROwo+Pj4gK8KgwqDCoCBzYmktPmJnZ2NfYmxvY2tf
aW8gPSBSRUFEX0lPX1BSSU9SOwo+Pj4gwqAgI2VuZGlmCj4+PiDCoMKgwqDCoMKgIGZvciAoaSA9
IDA7IGkgPCBtYXhfZGV2aWNlczsgaSsrKSB7Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNm
cy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4+PiBpbmRleCBmNzM2MDUyZGVhNTAuLmVmZWExNTIwOTc4
OCAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvc3lzZnMuYwo+Pj4gKysrIGIvZnMvZjJmcy9zeXNm
cy5jCj4+PiBAQCAtNjc0LDYgKzY3NCwxMyBAQCBzdGF0aWMgc3NpemVfdCBfX3NiaV9zdG9yZShz
dHJ1Y3QgZjJmc19hdHRyICphLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNiaS0+Ymxrem9uZV9h
bGxvY19wb2xpY3kgPSB0Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBjb3VudDsKPj4+
IMKgwqDCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUs
ICJiZ2djX2Jsb2NrX2lvIikpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAodCA8IEJHR0NfUFJJ
T1IgfHwgdCA+IEFMTF9JT19QUklPUikKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUlOVkFMOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHNiaS0+YmdnY19ibG9ja19pbyA9IHQ7Cj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGNvdW50Owo+Pj4gK8KgwqDCoCB9Cj4+PiDCoCAjZW5k
aWYKPj4+IMKgICNpZmRlZiBDT05GSUdfRjJGU19GU19DT01QUkVTU0lPTgo+Pj4gQEAgLTExNzIs
NiArMTE3OSw3IEBAIEYyRlNfU0JJX0dFTkVSQUxfUldfQVRUUihtYXhfcmVhZF9leHRlbnRfY291
bnQpOwo+Pj4gwqAgI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4+PiDCoCBGMkZTX1NCSV9H
RU5FUkFMX1JPX0FUVFIodW51c2FibGVfYmxvY2tzX3Blcl9zZWMpOwo+Pj4gwqAgRjJGU19TQklf
R0VORVJBTF9SV19BVFRSKGJsa3pvbmVfYWxsb2NfcG9saWN5KTsKPj4+ICtGMkZTX1NCSV9HRU5F
UkFMX1JXX0FUVFIoYmdnY19ibG9ja19pbyk7Cj4+PiDCoCAjZW5kaWYKPj4+IMKgIEYyRlNfU0JJ
X0dFTkVSQUxfUldfQVRUUihjYXJ2ZV9vdXQpOwo+Pj4gwqAgRjJGU19TQklfR0VORVJBTF9SV19B
VFRSKHJlc2VydmVkX3Bpbl9zZWN0aW9uKTsKPj4+IEBAIC0xMzQyLDYgKzEzNTAsNyBAQCBzdGF0
aWMgc3RydWN0IGF0dHJpYnV0ZSAqZjJmc19hdHRyc1tdID0gewo+Pj4gwqAgI2lmZGVmIENPTkZJ
R19CTEtfREVWX1pPTkVECj4+PiDCoMKgwqDCoMKgIEFUVFJfTElTVCh1bnVzYWJsZV9ibG9ja3Nf
cGVyX3NlYyksCj4+PiDCoMKgwqDCoMKgIEFUVFJfTElTVChibGt6b25lX2FsbG9jX3BvbGljeSks
Cj4+PiArwqDCoMKgIEFUVFJfTElTVChiZ2djX2Jsb2NrX2lvKSwKPj4+IMKgICNlbmRpZgo+Pj4g
wqAgI2lmZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4+PiDCoMKgwqDCoMKgIEFUVFJf
TElTVChjb21wcl93cml0dGVuX2Jsb2NrKSwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

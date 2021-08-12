Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 259533EA461
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Aug 2021 14:18:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mE9ex-0005QD-GD; Thu, 12 Aug 2021 12:18:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mE9ev-0005Px-JX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 12:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ZP0BTbARXicISnosfO6HJhYb0b69CuAmBAEbs1b1ZI=; b=fWC/FKJPpNIbtwcf4Vkx6vIKci
 HcnQxKgUjjQbGsKsTH8TLaS+0fOMCqmyECBi9SuUjZ/qxM3YeFys40J2WRE7X1YDI5bB7c6ttSUHI
 NI820A0eL+Coj1MhBhwcqYuYNQ8KAsEimeNPdp2uNsK8ueOPKHTD9A4VJYQunYX60+1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8ZP0BTbARXicISnosfO6HJhYb0b69CuAmBAEbs1b1ZI=; b=KW+XmjboAc+vpFE6M7uj4m3OMk
 RN2iON9egHPAUKbCDEo0ZTKeT/oceDb0s2ZPUN1nbQbUMZLlZNcHl4Gpi49FUsjIWcxQkucSsSqwV
 w4MGTi1qgtx7/j1oShLmBxrHLgwOWiyLHeIKM8fiju9CxXesk/exTd1zBYDDek0AZshg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mE9es-0045hU-9i
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 12:18:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21C7260FD7;
 Thu, 12 Aug 2021 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628770676;
 bh=hPO/RgigXZIs0Z1FajHF6364OnjOffqwUiOdt5UM+nY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=JtNZuWjGBG9wnDAVj6jC6VLhI3i3WTJ384vlUBlruCSMI78HFPKISeU0PSHTNSW9Q
 xgae88WAwRjEVp07Kp4nCI16VqohDclFllFTTDUEscbiStegVFwICiB02csZS4amJd
 zqfQ3zfYTQfX3mlug0FZgxPS1xxHAyX63FV76wl/IOy3eANjF/Jyem5pgnXtMOaE15
 35uFip7/exR/FqjlDPNVFWDKGEz7l+nR6KxKi4cqNEqMSxGfo6qCIDI7f7MrNjjr8Z
 1Xo3ceJxiWH3ldQSqt0IbL5/ADzXOWCEFq+7mG4/vWZVVREBpdr7Xf2U4xVtml9a+l
 i8pLiAjtR9riA==
To: Wu Bo <bo.wu@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <5b68208b-fd94-bf4e-fc4b-d79d13abf1c6@vivo.com>
 <6519b8b7-1eb0-f286-7593-5c5ebbfb5554@kernel.org>
 <86e53ee7-13b5-5e8e-7c81-acb1736ebc8b@vivo.com>
 <aa5f3225-6409-bc62-1021-107a18040384@kernel.org>
 <df31a4be-55af-5944-77c8-a09daba02ccb@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <ed9de904-7552-e0a8-1111-cf9a5b11c0de@kernel.org>
Date: Thu, 12 Aug 2021 20:17:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <df31a4be-55af-5944-77c8-a09daba02ccb@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mE9es-0045hU-9i
Subject: Re: [f2fs-dev] f2fs do DIO write make file corruption
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS84LzEyIDEwOjU1LCBXdSBCbyB3cm90ZToKPiAKPiDlnKggMjAyMS84LzExIDIwOjU3
LCBDaGFvIFl1IOWGmemBkzoKPj4gT24gMjAyMS84LzExIDExOjI4LCBXdSBCbyB3cm90ZToKPj4+
Cj4+PiDlnKggMjAyMS84LzExIDExOjAzLCBDaGFvIFl1IOWGmemBkzoKPj4+PiBPbiAyMDIxLzgv
MTEgMTA6NDgsIFd1IEJvIHdyb3RlOgo+Pj4+PiBJIHVzZSB0aGUgZm9sbG93aW5nIGNvbW1hbmQg
dG8gY3JlYXRlIGEgZmlsZSwgdGhlIGZpbGUgbWF5IGdvdAo+Pj4+PiBjb3JydXB0aW9uOgo+Pj4+
PiAgwqDCoMKgwqDCoGYyZnNfaW8gd3JpdGUgMiAwIDUxMiBpbmNfbnVtIGRpbyAkcGF0aAo+Pj4+
Pgo+Pj4+PiBBbmQgd2hlbiBJIHVzZSBiaW8gb3IgdG8gc2V0IHRoZSBjaHVuayBzaXplIHRvIDEg
YmxvY2ssIHRoZSBmaWxlIGlzCj4+Pj4+IG5vcm1hbC4gVGhlIGNvbW1hbmRzIGFzIGZvbGxvd2lu
ZzoKPj4+Pj4gIMKgwqDCoMKgwqBmMmZzX2lvIHdyaXRlIDIgMCA1MTIgaW5jX251bSBidWZmZXJl
ZCAkcGF0aAo+Pj4+PiAgwqDCoMKgwqDCoGYyZnNfaW8gd3JpdGUgMSAwIDUxMiBpbmNfbnVtIGRp
byAkcGF0aAo+Pj4+Pgo+Pj4+PiBJIGZpbmQgdGhpcyBidWcgb24gb2xkIGtlcm5lbCB2ZXJzaW9u
IDQuMTQuMTE3LCBhbmQgbm90IGZpbmQgb24gdmVyc2lvbgo+Pj4+PiA0LjE5LjE1Mi4gU28gdGhp
cyBidWcgaXMgZml4ZWQuIENhbiBhbnlvbmUgY2FuIHRlbGwgbWUgd2hpY2ggcGF0Y2gKPj4+Pj4g
Zml4ZWQKPj4+Pj4gdGhpcyBidWc/Cj4+Pj4KPj4+PiBOb3Qgc3VyZSwKPj4+Pgo+Pj4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5n
aXQvY29tbWl0Lz9oPWxpbnV4LTQuMTkueSZpZD03YmFlOGI2YjczZTQ2YzMwN2ZhMzU1Y2UwODY4
MDBiN2FkNjYxMGY4Cj4+Pj4KPj4KPj4gSSBkaWRuJ3Qgc2VlIHRoaXMgcGF0Y2ggaW4gNC4xNCBz
dGFibGUga2VybmVsIG9mIG1haWxpbmUsIHNvIGRvIHlvdSBtZWFuCj4+IDQuMTQga2VybmVsCj4+
IG1haW50YWluZWQgYnkgQW5kcm9pZD8KPj4KPj4gSWYgc28sIGYyZnMgY29kZXMgaW4gYmV0d2Vl
biA0LjE0IGFuZCA0LjE5IEFuZHJvaWQga2VybmVsIGFyZSBhbG1vc3QgdGhlCj4+IHNhbWUsCj4+
IHNlZSBiZWxvdyBsaW5rOgo+Pgo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9qYWVnZXVrL2YyZnMtc3RhYmxlLmdpdC8KPj4KPiAKPiBTb3JyeSwgaXQn
cyBvdXIgb2xkIEFuZHJvaWQgcHJvamVjdCBjb2RlLlNvIHRoZSBrZXJuZWwgdmVyc2lvbiBtYXkg
aGF2ZQo+IG5vIHJlZmVyZW5jZSB2YWx1ZS4KPiBUaGlzIHByb2plY3QgY29kZSBsYXN0IHN5bmMg
dG8gQW5kcm9pZCBjb21tb24ga2VybmVsIGlzOgo+IAk5Zjg5MjQ5NmZjMGI6ZjJmczogcmVhZGFo
ZWFkIGVuY3J5cHRlZCBibG9jayBkdXJpbmcgR0NbMjAxOC0wOS0wNV0KPiBUaGUgY29kZSBsaW5r
IGlzOgo+IGh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2UuY29tL2tlcm5lbC9jb21tb24vKy85
Zjg5MjQ5NmZjMGIKPiBBbmQgYWZ0ZXIgdGhhdCwgd2UgYXBwbGllZCBzb21lIGZpeHVwIHBhdGNo
ZXMuCgpJIHRoaW5rIHlvdSBjYW4gcGljayB1cCBwYXRjaGVzIGZyb20geW91ciA0LjE5IGYyZnMg
Y29kZXMgd2hpY2ggYXJlIG5vdCBpbgp5b3VyIDQuMTQgZjJmcyBjb2RlcywgYW5kIGNoZWNrIGVh
Y2ggcGF0Y2ggeW91IHBpY2tlZCB0byBzZWUgd2hldGhlciB0aGVyZQppcyBhIHBhdGNoIGNhbiBm
aXggdGhhdCBwcm9ibGVtLgoKVGhhbmtzLAoKPiAKPj4gVGhhbmtzLAo+Pgo+Pj4+Cj4+Pgo+Pj4g
VGhpcyBwYXRjaCBpcyBhcHBsaWVkLiBUaGUgaXNzdWUgb2NjdXJzIHdoZW4gZjJmcyBkaW8gdHJ5
IHRvIHByZWFsbG9jYXRlCj4+PiBtdWx0aXBsZSBibG9ja3MgYW5kIGdvdCBzY2F0dGVyZWQgZGlz
ayBibG9ja3MuIFRoZSBsb2cgYXMgZm9sbG93aW5nOgo+Pj4gIMKgwqDCoMKgwqDCoMKgIG15X2Yy
ZnNfaW8tMTM0MjUgWzAwMl0gLi4uLsKgwqAgMzk1LjU4MzYzNzogZWwwX2lycV9uYWtlZDoKPj4+
IDE6dHlwZToxLGlubzo0MDEzMixvZmY6NzY4LG9sZF9ibGs6MCxuZXdfYmxrOjE4NTc2NAo+Pj4g
IMKgwqDCoMKgwqDCoMKgIG15X2YyZnNfaW8tMTM0MjUgWzAwMl0gLi4uLsKgwqAgMzk1LjU4Mzcx
MDogZWwwX2lycV9uYWtlZDoKPj4+IDE6dHlwZToxLGlubzo0MDEzMixvZmY6NzY5LG9sZF9ibGs6
MCxuZXdfYmxrOjIwNTgyNAo+Pj4gIMKgwqDCoMKgwqDCoMKgIG15X2YyZnNfaW8tMTM0MjUgWzAw
Ml0gLi4uLsKgwqAgMzk1LjU4MzcyMTogZjJmc19tYXBfYmxvY2tzOiBkZXYgPQo+Pj4gKDI1OSwy
MyksIGlubyA9IDQwMTMyLCBmaWxlIG9mZnNldCA9IDc2OCwgc3RhcnQgYmxrYWRkciA9IDB4MmQ1
YTQsIGxlbiA9Cj4+PiAweDIsIGVyciA9IDAKPj4+ICDCoMKgwqDCoMKgwqDCoCBteV9mMmZzX2lv
LTEzNDI1IFswMDJdIC4uLi7CoMKgIDM5NS41ODM3MzU6IGYyZnNfbWFwX2Jsb2NrczogZGV2ID0K
Pj4+ICgyNTksMjMpLCBpbm8gPSA0MDEzMiwgZmlsZSBvZmZzZXQgPSA3NjgsIHN0YXJ0IGJsa2Fk
ZHIgPSAweDJkNWE0LCBsZW4gPQo+Pj4gMHgxLCBlcnIgPSAwCj4+PiAgwqDCoMKgwqDCoMKgwqAg
bXlfZjJmc19pby0xMzQyNSBbMDAyXSAuLi4uwqDCoCAzOTUuNTgzNzQxOiBmMmZzX21hcF9ibG9j
a3M6IGRldiA9Cj4+PiAoMjU5LDIzKSwgaW5vID0gNDAxMzIsIGZpbGUgb2Zmc2V0ID0gNzY5LCBz
dGFydCBibGthZGRyID0gMHgzMjQwMCwgbGVuID0KPj4+IDB4MSwgZXJyID0gMAo+Pj4KPj4+IEFu
ZCBpZiB0aGUgYmxvY2tzIGFyZSBjb250aW51b3VzbHksIHRoZSBmaWxlIGRhdGEgaXMgbm9ybWFs
Ogo+Pj4gIMKgwqDCoMKgwqAgbXlfZjJmc19pby0xMzQyNSBbMDAyXSAuLi4uwqDCoCAzOTUuNTg0
MDM3OiBlbDBfaXJxX25ha2VkOgo+Pj4gMTp0eXBlOjEsaW5vOjQwMTMyLG9mZjo3NzAsb2xkX2Js
azowLG5ld19ibGs6MjA1ODI1Cj4+PiAgwqDCoMKgwqDCoMKgwqAgbXlfZjJmc19pby0xMzQyNSBb
MDAyXSAuLi4uwqDCoCAzOTUuNTg0MDY2OiBlbDBfaXJxX25ha2VkOgo+Pj4gMTp0eXBlOjEsaW5v
OjQwMTMyLG9mZjo3NzEsb2xkX2JsazowLG5ld19ibGs6MjA1ODI2Cj4+PiAgwqDCoMKgwqDCoMKg
wqAgbXlfZjJmc19pby0xMzQyNSBbMDAyXSAuLi4uwqDCoCAzOTUuNTg0MDc3OiBmMmZzX21hcF9i
bG9ja3M6IGRldiA9Cj4+PiAoMjU5LDIzKSwgaW5vID0gNDAxMzIsIGZpbGUgb2Zmc2V0ID0gNzcw
LCBzdGFydCBibGthZGRyID0gMHgzMjQwMSwgbGVuID0KPj4+IDB4MiwgZXJyID0gMAo+Pj4gIMKg
wqDCoMKgwqDCoMKgIG15X2YyZnNfaW8tMTM0MjUgWzAwMl0gLi4uLsKgwqAgMzk1LjU4NDA5MTog
ZjJmc19tYXBfYmxvY2tzOiBkZXYgPQo+Pj4gKDI1OSwyMyksIGlubyA9IDQwMTMyLCBmaWxlIG9m
ZnNldCA9IDc3MCwgc3RhcnQgYmxrYWRkciA9IDB4MzI0MDEsIGxlbiA9Cj4+PiAweDIsIGVyciA9
IDAKPj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4KPj4+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+Pj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo+Pj4+Pgo+Pj4+Cj4+Pgo+Pj4KPj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdAo+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+IGh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwKPj4+Cj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=

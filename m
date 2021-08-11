Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7624D3E88CF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 05:29:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDevY-0005ZI-NL; Wed, 11 Aug 2021 03:29:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bo.wu@vivo.com>) id 1mDevW-0005ZB-O2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h6eT7zjAyvfxGWJLaWVfFewxb2qLTbMrNEf3kj8Ej3c=; b=byhjViw0llqMdjraXl3ll2zjL5
 2sFueZx3xw2O5ko5RB98HwRhUtzcMP5O87lgXNHI8VS4WyoKnfzSk/I+5oOpEY5VbcnOa8S4vaYvg
 bkTFmlng1AO8jRi0l7LbCUzDGSlwGvAtGAZJOOlWIfeJZbu9APer+SvpgOcTKnw8T+k4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h6eT7zjAyvfxGWJLaWVfFewxb2qLTbMrNEf3kj8Ej3c=; b=RmqLhdIc/GDSHn6uuY4foM2cXs
 BndRpdmETp/GbbtMaydi9fA5jiKQjwK4p7OnC/0+SDXL2vn4A0uA1q+CvX+P0oVDmFRpd/CfKgfO6
 KQ7qR7cnQGYghyQ3To5g+9yLhx6xE5/6yLGwckZ7J5W4MjppnEY6/WYGn55NCkAAoveA=;
Received: from mail-m17656.qiye.163.com ([59.111.176.56])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDevR-0002EW-Dh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:29:10 +0000
Received: from [172.25.45.51] (unknown [58.251.74.232])
 by mail-m17656.qiye.163.com (Hmail) with ESMTPA id C2186C40260;
 Wed, 11 Aug 2021 11:28:57 +0800 (CST)
To: Chao Yu <chao@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <5b68208b-fd94-bf4e-fc4b-d79d13abf1c6@vivo.com>
 <6519b8b7-1eb0-f286-7593-5c5ebbfb5554@kernel.org>
From: Wu Bo <bo.wu@vivo.com>
Message-ID: <86e53ee7-13b5-5e8e-7c81-acb1736ebc8b@vivo.com>
Date: Wed, 11 Aug 2021 11:28:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6519b8b7-1eb0-f286-7593-5c5ebbfb5554@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRpKGk1WT05DGkkdTx5LHU
 MYVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBQ6Sww5FT9NTCMQEhYxQwgc
 NB0KCUtVSlVKTUlDTU5JTkhDSUJIVTMWGhIXVRkUVQwOOw0SDRRVGBQWRVlXWRILWUFZTkNVSU5K
 VUxPVUlISVlXWQgBWUFITEtCNwY+
X-HM-Tid: 0a7b33418820da02kuwsc2186c40260
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.56 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.56 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDevR-0002EW-Dh
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

CuWcqCAyMDIxLzgvMTEgMTE6MDMsIENoYW8gWXUg5YaZ6YGTOgo+IE9uIDIwMjEvOC8xMSAxMDo0
OCwgV3UgQm8gd3JvdGU6Cj4+IEkgdXNlIHRoZSBmb2xsb3dpbmcgY29tbWFuZCB0byBjcmVhdGUg
YSBmaWxlLCB0aGUgZmlsZSBtYXkgZ290IAo+PiBjb3JydXB0aW9uOgo+PiDCoMKgwqDCoGYyZnNf
aW8gd3JpdGUgMiAwIDUxMiBpbmNfbnVtIGRpbyAkcGF0aAo+Pgo+PiBBbmQgd2hlbiBJIHVzZSBi
aW8gb3IgdG8gc2V0IHRoZSBjaHVuayBzaXplIHRvIDEgYmxvY2ssIHRoZSBmaWxlIGlzCj4+IG5v
cm1hbC4gVGhlIGNvbW1hbmRzIGFzIGZvbGxvd2luZzoKPj4gwqDCoMKgwqBmMmZzX2lvIHdyaXRl
IDIgMCA1MTIgaW5jX251bSBidWZmZXJlZCAkcGF0aAo+PiDCoMKgwqDCoGYyZnNfaW8gd3JpdGUg
MSAwIDUxMiBpbmNfbnVtIGRpbyAkcGF0aAo+Pgo+PiBJIGZpbmQgdGhpcyBidWcgb24gb2xkIGtl
cm5lbCB2ZXJzaW9uIDQuMTQuMTE3LCBhbmQgbm90IGZpbmQgb24gdmVyc2lvbgo+PiA0LjE5LjE1
Mi4gU28gdGhpcyBidWcgaXMgZml4ZWQuIENhbiBhbnlvbmUgY2FuIHRlbGwgbWUgd2hpY2ggcGF0
Y2ggZml4ZWQKPj4gdGhpcyBidWc/Cj4gCj4gTm90IHN1cmUsCj4gCj4gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQv
P2g9bGludXgtNC4xOS55JmlkPTdiYWU4YjZiNzNlNDZjMzA3ZmEzNTVjZTA4NjgwMGI3YWQ2NjEw
ZjggCj4gCgpUaGlzIHBhdGNoIGlzIGFwcGxpZWQuIFRoZSBpc3N1ZSBvY2N1cnMgd2hlbiBmMmZz
IGRpbyB0cnkgdG8gcHJlYWxsb2NhdGUgCm11bHRpcGxlIGJsb2NrcyBhbmQgZ290IHNjYXR0ZXJl
ZCBkaXNrIGJsb2Nrcy4gVGhlIGxvZyBhcyBmb2xsb3dpbmc6CiAgICAgICBteV9mMmZzX2lvLTEz
NDI1IFswMDJdIC4uLi4gICAzOTUuNTgzNjM3OiBlbDBfaXJxX25ha2VkOiAKMTp0eXBlOjEsaW5v
OjQwMTMyLG9mZjo3Njgsb2xkX2JsazowLG5ld19ibGs6MTg1NzY0CiAgICAgICBteV9mMmZzX2lv
LTEzNDI1IFswMDJdIC4uLi4gICAzOTUuNTgzNzEwOiBlbDBfaXJxX25ha2VkOiAKMTp0eXBlOjEs
aW5vOjQwMTMyLG9mZjo3Njksb2xkX2JsazowLG5ld19ibGs6MjA1ODI0CiAgICAgICBteV9mMmZz
X2lvLTEzNDI1IFswMDJdIC4uLi4gICAzOTUuNTgzNzIxOiBmMmZzX21hcF9ibG9ja3M6IGRldiA9
IAooMjU5LDIzKSwgaW5vID0gNDAxMzIsIGZpbGUgb2Zmc2V0ID0gNzY4LCBzdGFydCBibGthZGRy
ID0gMHgyZDVhNCwgbGVuID0gCjB4MiwgZXJyID0gMAogICAgICAgbXlfZjJmc19pby0xMzQyNSBb
MDAyXSAuLi4uICAgMzk1LjU4MzczNTogZjJmc19tYXBfYmxvY2tzOiBkZXYgPSAKKDI1OSwyMyks
IGlubyA9IDQwMTMyLCBmaWxlIG9mZnNldCA9IDc2OCwgc3RhcnQgYmxrYWRkciA9IDB4MmQ1YTQs
IGxlbiA9IAoweDEsIGVyciA9IDAKICAgICAgIG15X2YyZnNfaW8tMTM0MjUgWzAwMl0gLi4uLiAg
IDM5NS41ODM3NDE6IGYyZnNfbWFwX2Jsb2NrczogZGV2ID0gCigyNTksMjMpLCBpbm8gPSA0MDEz
MiwgZmlsZSBvZmZzZXQgPSA3NjksIHN0YXJ0IGJsa2FkZHIgPSAweDMyNDAwLCBsZW4gPSAKMHgx
LCBlcnIgPSAwCgpBbmQgaWYgdGhlIGJsb2NrcyBhcmUgY29udGludW91c2x5LCB0aGUgZmlsZSBk
YXRhIGlzIG5vcm1hbDoKCSAgbXlfZjJmc19pby0xMzQyNSBbMDAyXSAuLi4uICAgMzk1LjU4NDAz
NzogZWwwX2lycV9uYWtlZDogCjE6dHlwZToxLGlubzo0MDEzMixvZmY6NzcwLG9sZF9ibGs6MCxu
ZXdfYmxrOjIwNTgyNQogICAgICAgbXlfZjJmc19pby0xMzQyNSBbMDAyXSAuLi4uICAgMzk1LjU4
NDA2NjogZWwwX2lycV9uYWtlZDogCjE6dHlwZToxLGlubzo0MDEzMixvZmY6NzcxLG9sZF9ibGs6
MCxuZXdfYmxrOjIwNTgyNgogICAgICAgbXlfZjJmc19pby0xMzQyNSBbMDAyXSAuLi4uICAgMzk1
LjU4NDA3NzogZjJmc19tYXBfYmxvY2tzOiBkZXYgPSAKKDI1OSwyMyksIGlubyA9IDQwMTMyLCBm
aWxlIG9mZnNldCA9IDc3MCwgc3RhcnQgYmxrYWRkciA9IDB4MzI0MDEsIGxlbiA9IAoweDIsIGVy
ciA9IDAKICAgICAgIG15X2YyZnNfaW8tMTM0MjUgWzAwMl0gLi4uLiAgIDM5NS41ODQwOTE6IGYy
ZnNfbWFwX2Jsb2NrczogZGV2ID0gCigyNTksMjMpLCBpbm8gPSA0MDEzMiwgZmlsZSBvZmZzZXQg
PSA3NzAsIHN0YXJ0IGJsa2FkZHIgPSAweDMyNDAxLCBsZW4gPSAKMHgyLCBlcnIgPSAwCgo+IAo+
IFRoYW5rcywKPiAKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pgo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 362E7225EB2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 14:38:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxV3x-00042k-4Q; Mon, 20 Jul 2020 12:38:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jxV3v-00042c-KB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 12:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nlH1txpzzHq6B7hbqH5b0L3jlFHePu8PYnWK2kXfyys=; b=KAnvmH1LDTaUcQQRG/Opb3KbPn
 Wn29blgWjQglqS8Gbn48gD/WV6jFFEz3IjyGYSV4sIwHYt5CtFb8UNT+ncjl8j2vYyKTISZVuQGwh
 Ecl3GBakPMD3WKqnPYOAeo5o3sFbaMzFd1DYnELVNStKC/LdV3j3vy9Q9VBYjI/qE8y4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nlH1txpzzHq6B7hbqH5b0L3jlFHePu8PYnWK2kXfyys=; b=XYkxEEJnElCKSmmFGqXCbopD+a
 vKfGthxUGUSITi6PSXQDLWQh3Hqe9q05NEcCcD9cToqBinkClucsNZuq246tmCKw9MiHL7SyQgOBV
 lIeIUMMdS6N9aTAZhwKjpbm4B5hQzi7eWPAnpISosLehoxcBk4nwgPJGmKTT+1QRNI2Y=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxV3u-00AlUo-48
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 12:38:31 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 47BB1A1FCCCF437FFB8A;
 Mon, 20 Jul 2020 20:38:19 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 20 Jul
 2020 20:38:14 +0800
To: Markus Elfring <Markus.Elfring@web.de>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <6074306e-e909-e17f-900c-320245a8f869@web.de>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8be91065-7c85-9501-f1c2-3cf11aab85a5@huawei.com>
Date: Mon, 20 Jul 2020 20:38:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <6074306e-e909-e17f-900c-320245a8f869@web.de>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxV3u-00AlUo-48
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: Avoid memory leak on
 cc->cpages
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC83LzIwIDE5OjMxLCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPj4gTWVtb3J5IGFsbG9j
YXRlZCBmb3Igc3RvcmluZyBjb21wcmVzc2VkIHBhZ2VzJyBwb2l0bmVyIHNob3VsZCBiZQo+PiBy
ZWxlYXNlZCBhZnRlciBmMmZzX3dyaXRlX2NvbXByZXNzZWRfcGFnZXMoKSwgb3RoZXJ3aXNlIGl0
IHdpbGwKPj4gY2F1c2UgbWVtb3J5IGxlYWsgaXNzdWUuCj4gCj4gKiBXb3VsZCBhbiBpbXBlcmF0
aXZlIHdvcmRpbmcgYmUgbW9yZSBhcHByb3ByaWF0ZSAod2l0aG91dCBhIHR5cG8pCj4gICAgZm9y
IHRoZSBjaGFuZ2UgZGVzY3JpcHRpb24/Cj4gCj4gKiBXaWxsIHRoZSB0YWcg4oCcRml4ZXPigJ0g
YmVjb21lIGhlbHBmdWwgZm9yIHRoZSBjb21taXQgbWVzc2FnZT8KCkl0IGxvb2tzIHRoaXMgaXMg
cmVwbGllZCBmcm9tIHBhdGNoLXJvYm90PyBzaW5jZSBJIGZvdW5kIGFsbCBjb21tZW50cwp5b3Ug
cmVwbGllZCBhcmUgYWxtb3N0IHRoZSBzYW1lLgoKQW5kIHdoYXQncyBmdW5ueSBpcyB0aGF0IHRo
ZSByZXBseSBzdGFydHMgYmVpbmcgY2F1Z2h0IGJ5IGFub3RoZXIgcGF0Y2gtYm90CmZyb20gR3Jl
Zy4uLgoKaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNi8yOC8xNTcKCj4gCj4gUmVnYXJkcywK
PiBNYXJrdXMKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

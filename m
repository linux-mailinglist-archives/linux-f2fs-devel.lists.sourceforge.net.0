Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2B116043
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Dec 2019 05:01:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1idnl6-000378-0n; Sun, 08 Dec 2019 04:01:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1idnl5-00036w-AN
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Dec 2019 04:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JnNrTNwJ5HStu287gT6fJFaycojSGwxdbJ+8pcYnTS8=; b=KaRJQYxji0qxooq+Dwd8iKaecX
 THTbNo05rnk4tve9viOogBMc1sXF1khXwlqbmkbdPaS2BZjoVlXD/zt+R46QGIVRXl9uT2AC/hUjs
 sVccUNTu2sUbR+y+7RKU1soXoL1AHwRbA6k7NniNhYxRLEcY5DTeDSbPOHiDeFCXmPgk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JnNrTNwJ5HStu287gT6fJFaycojSGwxdbJ+8pcYnTS8=; b=CVx0zy5iIXZ9QvvCT4pKPO+jiy
 /MF3Lydy3ndQDlC1IlrDSmkadLrXnRq2UD4wfMug1vC/09DAm+JeoI/5F6Mkzjtxx1UjgHgxw9Ago
 hSBm7GrsVgGuBZ1gEJxjX12CQOWvLqnGZ/x3rTVMkyr3zb8DGaRIg3FD6RoVVbIo3WXk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1idnl2-00D8DR-49
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Dec 2019 04:01:22 +0000
Received: from [192.168.0.113] (unknown [58.212.132.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B320206D6;
 Sun,  8 Dec 2019 04:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575777669;
 bh=JnNrTNwJ5HStu287gT6fJFaycojSGwxdbJ+8pcYnTS8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=xWY89w4eupc+IPaIP0H8WHnSDSYP5nphutKF5Wh3f4BVpH63PMbs8FCaT5DyW7nbm
 +q9SFWRWITT/WYlU3EI+TgKZm2QBm1bLuKBvu1epaqg7wfEd25Ijb9Zb+FsZv/6t39
 bQTAciiWacX3/Su+cwhvnvwotcug7rJIO+bQp7+o=
To: =?UTF-8?B?57qi54On55qE5aiB5YyW6aW8?= <glqhw@qq.com>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
References: <tencent_0B38BD6C2739091DE8A052D6D772D1DEAA06@qq.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <4ef45a4b-47fa-4d7e-a060-4cad56ca372a@kernel.org>
Date: Sun, 8 Dec 2019 12:00:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <tencent_0B38BD6C2739091DE8A052D6D772D1DEAA06@qq.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: usenix.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1idnl2-00D8DR-49
Subject: Re: [f2fs-dev] Potential data corruption?
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

SGVsbG8sCgpPbiAyMDE5LTEyLTcgMTg6MTAsIOe6oueDp+eahOWogeWMlumlvCB3cm90ZToKPiBI
aSBGMkZTIGV4cGVydHMsCj4gVGhlIGZvbGxvd2luZyBjb25mdXNlcyBtZToKPgo+IEEgdHlwaWNh
bCBmc3luYygpIGdvZXMgbGlrZSB0aGlzOgo+IDEpIElzc3VlIGRhdGEgYmxvY2sgSU9zCj4gMikg
V2FpdCBmb3IgY29tcGxldGlvbgo+IDMpIElzc3VlIGNoYWluZWQgbm9kZSBibG9jayBJT3MKPiA0
KSBXYWl0IGZvciBjb21wbGV0aW9uCj4gNSkgSXNzdWUgZmx1c2ggY29tbWFuZAo+Cj4gSW4gb3Jk
ZXIgdG8gcHJlc2VydmUgZGF0YSBjb25zaXN0ZW5jeSB1bmRlciBzdWRkZW4gcG93ZXIgZmFpbHVy
ZSwgaXQgcmVxdWlyZXMgdGhhdCB0aGUgc3RvcmFnZSBkZXZpY2UgcGVyc2lzdHMgZGF0YSBibG9j
a3MgcHJpb3IgdG8gbm9kZSBibG9ja3MuCj4gT3RoZXJ3aXNlLCB1bmRlciBzdWRkZW4gcG93ZXIg
ZmFpbHVyZSwgaXQncyBwb3NzaWJsZSB0aGF0IHRoZSBwZXJzaXN0ZWQgbm9kZSBibG9jayBwb2lu
dHMgdG8gTlVMTCBkYXRhIGJsb2Nrcy4KCkZpcnN0bHkgaXQgZG9lc24ndCBicmVhayBQT1NJWCBz
ZW1hbnRpY3MsIHJpZ2h0PyBzaW5jZSBmc3luYygpIGRpZG4ndCByZXR1cm4Kc3VjY2Vzc2Z1bGx5
IGJlZm9yZSBzdWRkZW4gcG93ZXItY3V0LCBzbyB3ZSBjYW4gbm90IGd1YXJhbnRlZSB0aGF0IGRh
dGEgaXMgZnVsbHkKcGVyc2lzdGVkIGluIHN1Y2ggY29uZGl0aW9uLgoKSG93ZXZlciwgd2hhdCB5
b3Ugd2FudCBsb29rcyBsaWtlIGF0b21pYyB3cml0ZSBzZW1hbnRpY3MsIHdoaWNoIG1vc3RseSBk
YXRhYmFzZQp3YW50IHRvIGd1YXJhbnRlZSBkdXJpbmcgZGIgZmlsZSB1cGRhdGUuCgpGMkZTIGhh
cyBzdXBwb3J0IGF0b21pY193cml0ZSB2aWEgaW9jdGwsIHdoaWNoIGlzIHVzZWQgYnkgU1FMaXRl
IG9mZmljaWFsbHksIEkKZ3Vlc3MgeW91IGNhbiBjaGVjayBpdHMgaW1wbGVtZW50YXRpb24gZGV0
YWlsLgoKVGhhbmtzLAoKPgo+IEhvd2V2ZXIsIGFjY29yZGluZyB0byB0aGlzIHN0dWR5IChodHRw
czovL3d3dy51c2VuaXgub3JnL2NvbmZlcmVuY2UvZmFzdDE4L3ByZXNlbnRhdGlvbi93b24pLCB0
aGUgcGVyc2lzdGVudCBvcmRlciBvZiByZXF1ZXN0cyBkb2Vzbid0IG5lY2Vzc2FyaWx5IGVxdWFs
cyB0byB0aGUgcmVxdWVzdCBmaW5pc2ggb3JkZXIgKGR1ZSB0byBkZXZpY2Ugdm9sYXRpbGUgY2Fj
aGVzKS4gVGhpcyBtZWFucyB0aGF0IGl0cyBwb3NzaWJsZSB0aGF0IHRoZSBub2RlIGJsb2NrcyBn
ZXQgcGVyc2lzdGVkIHByaW9yIHRvIGRhdGEgYmxvY2tzLgo+Cj4gRG9lcyBGMkZTIGhhdmUgb3Ro
ZXIgbWVjaGFuaXNtcyB0byBwcmV2ZW50IHN1Y2ggaW5jb25zaXN0ZW5jeT8gT3IgZG9lcyBpdCBy
ZXF1aXJlIHRoZSBkZXZpY2UgdG8gcGVyc2lzdCBkYXRhIHdpdGhvdXQgcmVvcmRlcmluZz8KPgo+
IFRoYW5rcyEKPgo+IEhvbmd3ZWkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

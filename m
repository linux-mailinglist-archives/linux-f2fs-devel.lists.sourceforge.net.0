Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 861A73EB723
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Aug 2021 16:55:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEYb1-0004W5-18; Fri, 13 Aug 2021 14:55:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1mEYaz-0004Vy-IA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 14:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
 Message-ID:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yn3mEvTG/QrG8xhI4ZEqBtpgQsche+N3+wtUEqil5GU=; b=GtvPb93t8LyXnEudASmARC3kiC
 sQmY5ojkcmRevbxV884ClH2Nnjegu/EEn6+KuUYypXM/GdNX2Ynom4XiwoibUjFof1j2QvH4JJSPA
 CTI7MIzuBM9nbcSID6SxDkicifksBafubCaJ+D8Km0YbUXDl/xAZEVsFNnwT3yuMG7wU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:Message-ID:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yn3mEvTG/QrG8xhI4ZEqBtpgQsche+N3+wtUEqil5GU=; b=eoHBYcWI2PaHNJugSp6c38s+js
 R1nKVb+Latk4mtfAkCRL+7/ysDk2FYHpyjU2rJYMMXJgyDxJ2DTzzjRP9jmeRFBVkS980T2T3PjnI
 v7BLa1Y6tXL/iz1JtB5fF3mvaCYSYlONBd28bI8TnNQN1gd0LAlcvuHZXjN4h983mRFc=;
Received: from mail-m176236.qiye.163.com ([59.111.176.236])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEYar-0008Ge-Ib
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 14:55:41 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m176236.qiye.163.com (Hmail) with ESMTP id 2EE8878011E;
 Fri, 13 Aug 2021 22:55:26 +0800 (CST)
Message-ID: <AHAA5gBVD-NcU6Btsog*u4qC.3.1628866526180.Hmail.frank.li@vivo.com>
To: Chao Yu <chao@kernel.org>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.231
In-Reply-To: <9b000232-c3dc-458c-2507-1dde8a8d985c@kernel.org>
MIME-Version: 1.0
Received: from frank.li@vivo.com( [58.251.74.231) ] by ajax-webmail (
 [127.0.0.1] ) ; Fri, 13 Aug 2021 22:55:26 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Date: Fri, 13 Aug 2021 22:55:26 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRodSkJWQx9LGkIeHkxITh
 9CVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1OQkNLTUJLTE5DN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Mzo6Thw5LT9WNRguTTkPCBQcUQ5PCjhVSFVKTUlDQ01NTklNTklNVTMWGhIXVR0JGhUQVRcS
 Ow0SDRRVGBQWRVlXWRILWUFZTkNVSU5KVUxPVUlISllXWQgBWUFITEtONwY+
X-HM-Tid: 0a7b4002bbf2d9aekuws2ee8878011e
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.236 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.236 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mEYar-0008Ge-Ib
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5BPATCH=5D_f2fs=3A_convert_/sys/fs/f2fs/?=
 =?utf-8?q?=3Cdisk=3E/stat/sb=5Fstatus_to_use_string?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5Y+R5Lu25Lq677yaQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgrlj5HpgIHml6XmnJ/vvJoyMDIx
LTA4LTEzIDIyOjQxOjAyCuaUtuS7tuS6uu+8miLmnY7miazpn6wiIDxmcmFuay5saUB2aXZvLmNv
bT4K5oqE6YCB5Lq677yaamFlZ2V1a0BrZXJuZWwub3JnLGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0LGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcK5Li76aKY77yaUmU6
IFtQQVRDSF0gZjJmczogY29udmVydCAvc3lzL2ZzL2YyZnMvPGRpc2s+L3N0YXQvc2Jfc3RhdHVz
IHRvIHVzZSBzdHJpbmc+T24gMjAyMS84LzEzIDIyOjE3LCDmnY7miazpn6wgd3JvdGU6Cj4+IEhJ
IENoYW8sCj4+IAo+PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IERhdGU6IDIw
MjEtMDgtMTMgMjI6MDk6NTMKPj4gVG86ICBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4s
amFlZ2V1a0BrZXJuZWwub3JnCj4+IENjOiAgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQsbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+PiBTdWJqZWN0OiBSZTogW1BB
VENIXSBmMmZzOiBjb252ZXJ0IC9zeXMvZnMvZjJmcy88ZGlzaz4vc3RhdC9zYl9zdGF0dXMgdG8g
dXNlIHN0cmluZz5PbiAyMDIxLzgvMTMgMjI6MDEsIFlhbmd0YW8gTGkgd3JvdGU6Cj4+Pj4gRG8g
bm90IHVzZSBudW1iZXJzIGJ1dCBzdHJpbmdzIHRvIGltcHJvdmUgcmVhZGFiaWxpdHkgd2hlbiBm
bGFnIGlzIHNldC4KPj4+Cj4+PiBUaGlzIGJyZWFrcyBvdXRwdXQgcnVsZSBvZiBzeXNmcyBlbnRy
eSwgc2VlIGJlbG93IGxpbms6Cj4+Pgo+PiBXaGljaCBydWxlPyBvbmUgZW50cnkgc2hvdWxkIHNo
b3cgb25lIHZhbHVl77yfCj4KPlllcywgb25lIHZhbHVlIHBlciBmaWxlIHBsZWFzZSwgd2hpY2gg
aXMgc3VnZ2VzdGVkIGJ5IEdyZWcuCj4KPmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIxLzYvMy8z
MTkKPgo+PiAKPj4gQnV0IEkgc2VlIHRoYXQ6Cj4+ICMgY2F0IC9zeXMvZnMvZjJmcy88ZGlzaz4v
ZmVhdHVyZXMKPj4gZW5jcnlwdGlvbiwgcXVvdGFfaW5vLCB2ZXJpdHksIHBpbl9maWxlCj4+IAo+
PiBTbyB0aGUgZm9ybWF0IG9mIGZlYXR1cmVzIGFsc28gd3Jvbmc/Cj4KPiAgV2hhdDoJCS9zeXMv
ZnMvZjJmcy88ZGlzaz4vZmVhdHVyZXMKPiAgRGF0ZToJCUp1bHkgMjAxNwo+ICBDb250YWN0Ogki
SmFlZ2V1ayBLaW0iIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4gIERlc2NyaXB0aW9uOgk8ZGVwcmVj
YXRlZDogc2hvdWxkIHVzZSAvc3lzL2ZzL2YyZnMvPGRpc2s+L2ZlYXR1cmVfbGlzdC8KCk9LLCBT
byBNYXliZSB3ZSBjYW4gbWFrZSBzb21ldGhpbmcgbGlrZSBmb2xsb3dpbmfvvJ8KCi9zeXMvZnMv
ZjJmcy88ZGlzaz4vc2JpX3N0YXR1cy9mc2NrIAoKWWFuZ3Rhbw0KDQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

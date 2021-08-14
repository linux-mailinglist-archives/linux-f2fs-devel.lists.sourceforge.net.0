Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A299C3EBFCF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Aug 2021 04:42:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEjca-0002v8-3f; Sat, 14 Aug 2021 02:42:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1mEjcY-0002up-MG
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 02:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
 Message-ID:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HCM8GE0gRMgNwcuTUHMxz76ntb0zQ/rzo1vkTdM0/uM=; b=IRdwRfjifoN0A2zixhjUoc5zqu
 +5PARpTQC7RkhIDoGIdHRtvz8SPfF6OYb3GbWKpXWKsWQGAMi/5DqVWDn86p1GzXwSL30pk3Hn96q
 cxIObo1e76w7JEnyHXl4Bl0d9FsiRckh7sheslAyBg8S9D1XLBQrKLo1zTo1JatLS2ZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:Message-ID:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HCM8GE0gRMgNwcuTUHMxz76ntb0zQ/rzo1vkTdM0/uM=; b=F4zLWAkvZB60pFwxekUp+vXM2l
 2mzTJPvPjFJafM5Ys3lsZvip5OPKef1a7aLwwZQ3LmD+cX+G34imA8N0w2oHkn0N0LmTphl2yUVDw
 rbJWBeChO77bEOF9wVSjaW6XVLAx8ZPNM+VkogvQ0jK303ut/FtoLA9U5nSVs+V2c9Tk=;
Received: from mail-m176236.qiye.163.com ([59.111.176.236])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEjcW-005gm9-8U
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 02:42:02 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m176236.qiye.163.com (Hmail) with ESMTP id 9812A7800C8;
 Sat, 14 Aug 2021 10:41:51 +0800 (CST)
Message-ID: <AOcAowBKDxRdEVGR5gjSrqq6.3.1628908911313.Hmail.frank.li@vivo.com>
To: Chao Yu <chao@kernel.org>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.231
In-Reply-To: <9b000232-c3dc-458c-2507-1dde8a8d985c@kernel.org>
MIME-Version: 1.0
Received: from frank.li@vivo.com( [58.251.74.231) ] by ajax-webmail (
 [127.0.0.1] ) ; Sat, 14 Aug 2021 10:41:51 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Date: Sat, 14 Aug 2021 10:41:51 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRlKSRpWGE5KQxkdSR1ITB
 gZVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1OQkNLTUJLTE5DN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6NBg6FAw5MD8DKR8#LTwpThwRKAkKCk1VSFVKTUlDQktDQkpKQkJPVTMWGhIXVR0JGhUQVRcS
 Ow0SDRRVGBQWRVlXWRILWUFZTkNVSU5KVUxPVUlISllXWQgBWUFIT0NMNwY+
X-HM-Tid: 0a7b42897c09d9aekuws9812a7800c8
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.236 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.236 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mEjcW-005gm9-8U
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

Pj4gSEkgQ2hhbywKPj4gCj4+IEZyb206IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4gRGF0
ZTogMjAyMS0wOC0xMyAyMjowOTo1Mwo+PiBUbzogIFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8u
Y29tPixqYWVnZXVrQGtlcm5lbC5vcmcKPj4gQ2M6ICBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldCxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIGYyZnM6IGNvbnZlcnQgL3N5cy9mcy9mMmZzLzxkaXNrPi9zdGF0L3NiX3N0YXR1
cyB0byB1c2Ugc3RyaW5nPk9uIDIwMjEvOC8xMyAyMjowMSwgWWFuZ3RhbyBMaSB3cm90ZToKPj4+
PiBEbyBub3QgdXNlIG51bWJlcnMgYnV0IHN0cmluZ3MgdG8gaW1wcm92ZSByZWFkYWJpbGl0eSB3
aGVuIGZsYWcgaXMgc2V0Lgo+Pj4KPj4+IFRoaXMgYnJlYWtzIG91dHB1dCBydWxlIG9mIHN5c2Zz
IGVudHJ5LCBzZWUgYmVsb3cgbGluazoKPj4+Cj4+IFdoaWNoIHJ1bGU/IG9uZSBlbnRyeSBzaG91
bGQgc2hvdyBvbmUgdmFsdWXvvJ8KPgo+WWVzLCBvbmUgdmFsdWUgcGVyIGZpbGUgcGxlYXNlLCB3
aGljaCBpcyBzdWdnZXN0ZWQgYnkgR3JlZy4KPgo+aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEv
Ni8zLzMxOQo+Cj4+IAo+PiBCdXQgSSBzZWUgdGhhdDoKPj4gIyBjYXQgL3N5cy9mcy9mMmZzLzxk
aXNrPi9mZWF0dXJlcwo+PiBlbmNyeXB0aW9uLCBxdW90YV9pbm8sIHZlcml0eSwgcGluX2ZpbGUK
Pj4gCj4+IFNvIHRoZSBmb3JtYXQgb2YgZmVhdHVyZXMgYWxzbyB3cm9uZz8KPgo+ICBXaGF0OgkJ
L3N5cy9mcy9mMmZzLzxkaXNrPi9mZWF0dXJlcwo+ICBEYXRlOgkJSnVseSAyMDE3Cj4gIENvbnRh
Y3Q6CSJKYWVnZXVrIEtpbSIgPGphZWdldWtAa2VybmVsLm9yZz4KPiAgRGVzY3JpcHRpb246CTxk
ZXByZWNhdGVkOiBzaG91bGQgdXNlIC9zeXMvZnMvZjJmcy88ZGlzaz4vZmVhdHVyZV9saXN0LwoK
cm9vdEBrdm0teGZzdGVzdHM6fiMgY2F0IC9zeXMvZnMvZjJmcy9udm1lMG4xL2V4dGVuc2lvbl9s
aXN0IApjb2xkIGZpbGUgZXh0ZW5zaW9uOgpqcGcKZ2lmCnBuZwphdmkKZGl2eAptcDQKbXAzCjNn
cAp3bXYKd21hCm1wZWcKbWt2Cm1vdgphc3gKYXNmCndteApzdmkKd3Z4CndtCm1wZwptcGUKcm0K
b2dnCmpwZWcKdmlkZW8KYXBrCnNvCmhvdCBmaWxlIGV4dGVuc2lvbjoKZGIKClNvIHdlIG5lZWQg
cmVtb3ZlIGV4dGVuc2lvbl9saXN0IHRvIHByb2MgZnM/CgpNQlIsCllhbmd0YW8gCgoNCg0KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK

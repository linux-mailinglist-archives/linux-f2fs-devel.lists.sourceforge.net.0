Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0FF610704
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 02:58:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooDhi-0000ZJ-TP;
	Fri, 28 Oct 2022 00:58:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ooDhh-0000ZC-42
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 00:58:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=alTheehU7iHnO8KB+knmNMwIH2bqfpRsjw6Zus2H098=; b=eDh43aaaDx32ZWpFhES8YBfyKH
 EWl49ZsJhnJP3TunMBrFnVvP4QME95WFmBSgwNeTjWhV6OeDwoilCgtfDxMIZxrCCy3i9mEQKOpaF
 nlHfSioDQaJivvURxBCxA5GufLJ03/J5j1wqNGedWkySrlt/CxRz02MCchNLqbFRDkGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=alTheehU7iHnO8KB+knmNMwIH2bqfpRsjw6Zus2H098=; b=d58dkW0Fiu5mk/ovOcDO+YA1lk
 IsHL4Ol0znPB5Z7NElhpg25YOffv/o9dAKRpYdJ2eu4f1rA1urjqCY2DCQkvbvBaC+cECHMljhBwT
 wEDyJLN6EqhqOpTIz2ljATVA1rlZ0t4sWPK9/kIaw47HbBQAJnlV+uD4syTQuyOhJIeA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooDhb-00058m-W1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 00:58:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 833E9B82862;
 Fri, 28 Oct 2022 00:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E27C433C1;
 Fri, 28 Oct 2022 00:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666918693;
 bh=O162lmMrqYJ9e8yUhKkMK3jqapLGaHlgdkxYhjNuZ6Y=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=uFY0KWlZ+M2Cw6kyulFcy9rd1EaobHZfm6Tn8jWD9qbNF8wBcC34+zYqfYZd7u/wi
 E2QUlt4WKIrog8AKKcbAnD7+Zidhlz0zogG8A5t7D6jsjre/NgFEYK4yyngGewIPMo
 /o1bMBakrm5OYmfgKa11mtL4CSRsHHSMWh9TwU1GNuN8Ke9EP4JluYG81zGiT6Q0y6
 NIgi6wjvRemejRO2Bq7/UhBJlOQmZ0Iu/W+t/8SvJYvQBP2nkKW2GOC9OgkM65sR/M
 DOfNN8hPrty/KeY+wQJz4AGT7rlGT4Q9ICvMNcbuziBNWPWv1jQl/eFzCGQBF1DSgX
 EIp+aeMwabhPw==
Message-ID: <4a58e927-bbcb-6e19-ca50-f2a4445dad3a@kernel.org>
Date: Fri, 28 Oct 2022 08:58:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
References: <20221018073240.666374-1-yangyingliang@huawei.com>
 <7908686b-9a7c-b754-d312-d689fc28366e@kernel.org>
In-Reply-To: <7908686b-9a7c-b754-d312-d689fc28366e@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, There is a generic fix [1], let's drop this one...
 https://lore.kernel.org/lkml/20221025071549.1280528-1-yangyingliang@huawei.com/T/
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooDhb-00058m-W1
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix possible memory leak in
 f2fs_init_sysfs()
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
Cc: linux-f2fs-devel@lists.sourceforge.net,
 Yang Yingliang <yangyingliang@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SmFlZ2V1aywKClRoZXJlIGlzIGEgZ2VuZXJpYyBmaXggWzFdLCBsZXQncyBkcm9wIHRoaXMgb25l
Li4uCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjIxMDI1MDcxNTQ5LjEyODA1Mjgt
MS15YW5neWluZ2xpYW5nQGh1YXdlaS5jb20vVC8KCk9uIDIwMjIvMTAvMjAgMTY6NDUsIENoYW8g
WXUgd3JvdGU6Cj4gT24gMjAyMi8xMC8xOCAxNTozMiwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+
IEluamVjdCBmYXVsdCB3aGlsZSBwcm9iaW5nIG1vZHVsZSwga3NldF9yZWdpc3RlcigpIG1heSBm
YWlsLAo+PiBpZiBpdCBmYWlscywgYnV0IHRoZSByZWZjb3VudCBvZiBrb2JqZWN0IGlzIG5vdCBk
ZWNyZWFzZWQgdG8KPj4gMCwgdGhlIG5hbWUgYWxsb2NhdGVkIGluIGtvYmplY3Rfc2V0X25hbWUo
KSBpcyBsZWFrZWQuIEZpeAo+PiB0aGlzIGJ5IGNhbGxpbmcga3NldF9wdXQoKSwgc28gdGhhdCBu
YW1lIGNhbiBiZSBmcmVlZCBpbgo+PiBjYWxsYmFjayBmdW5jdGlvbiBrb2JqZWN0X2NsZWFudXAo
KS4KPj4KPj4gdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4ODgxMDFiN2NjODAgKHNpemUgOCk6
Cj4+IMKgwqAgY29tbSAibW9kcHJvYmUiLCBwaWQgMjUyLCBqaWZmaWVzIDQyOTQ2OTEzNzggKGFn
ZSAzMS43NjBzKQo+PiDCoMKgIGhleCBkdW1wIChmaXJzdCA4IGJ5dGVzKToKPj4gwqDCoMKgwqAg
NjYgMzIgNjYgNzMgMDAgODggZmYgZmbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmMmZzLi4uLgo+PiDCoMKgIGJhY2t0cmFjZToKPj4gwqDCoMKgwqAg
WzwwMDAwMDAwMDFkYjViNDA4Pl0gX19rbWFsbG9jX25vZGVfdHJhY2tfY2FsbGVyKzB4NDQvMHgx
YjAKPj4gwqDCoMKgwqAgWzwwMDAwMDAwMDI3ODNhMDczPl0ga3N0cmR1cCsweDNhLzB4NzAKPj4g
wqDCoMKgwqAgWzwwMDAwMDAwMGVhZDJiMjgxPl0ga3N0cmR1cF9jb25zdCsweDYzLzB4ODAKPj4g
wqDCoMKgwqAgWzwwMDAwMDAwMDNlNWNmOGY3Pl0ga3Zhc3ByaW50Zl9jb25zdCsweDE0OS8weDE4
MAo+PiDCoMKgwqDCoCBbPDAwMDAwMDAwYzRkOTQ5ZmY+XSBrb2JqZWN0X3NldF9uYW1lX3Zhcmdz
KzB4NTYvMHgxNTAKPj4gwqDCoMKgwqAgWzwwMDAwMDAwMDQ0NjExNjYwPl0ga29iamVjdF9zZXRf
bmFtZSsweGFiLzB4ZTAKPj4KPj4gRml4ZXM6IGJmOWU2OTdlY2Q0MiAoImYyZnM6IGV4cG9zZSBm
ZWF0dXJlcyB0byBzeXNmcyBlbnRyeSIpCj4+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWWluZ2xpYW5n
IDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4KPiAKPiBUaGFua3MsCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK

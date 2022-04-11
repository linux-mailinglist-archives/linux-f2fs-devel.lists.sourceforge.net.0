Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 986524FB8DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Apr 2022 12:04:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ndquN-0003OI-7a; Mon, 11 Apr 2022 10:04:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1ndquM-0003O8-MJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 10:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t+EnBEAZ8f6awZcUPeqA5Wr6iTBzzURbuhaTQ91FwC0=; b=EX30J/fdBfoybz+3DlTVAeUUaz
 8/GqzxRFwPftp5wP6NHeY3L5HSNzSIMyNfq4Vob62e9BZ8zJv5DFLb5AD+F4kZmPKOTzUTClI8FAl
 JAwVOJzF6IVcc6lkb7l66IqPciERnHUZ6WPAVcUHTdeLe2SYrxPP+CvngotQTIokGw+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t+EnBEAZ8f6awZcUPeqA5Wr6iTBzzURbuhaTQ91FwC0=; b=gI+dLGLaLyxpZvVa63Wea0Tn0m
 nK0LZJDl2futpmzxq2AIuNTyptEVWceXG9wQ2QMEBwq9nBskRqLF6varA09epPcjtBqmGwjr+5Hxt
 ujx8kzl2K+uyPXy/eWrWNr4+buZiFDpno//5zcukhsdeU4lHG+biC5GFm+lfL/oxFyZg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ndquJ-00CckW-HQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 10:04:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E4ECB81195;
 Mon, 11 Apr 2022 10:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A8AC385A3;
 Mon, 11 Apr 2022 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649671459;
 bh=xHZRDomLmwqSfuPknWUMoWKn9F/EZqlM+28KfOsbDSU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=u/AFkPDRUktcC5iIrFpT6pN6ARlP3YbRvEv/E8RoG/gXZygPiZeLs+Zj6V0u7UZwn
 W9Xfdfk36XgZOZrNATIHmrM/pK7tx8kU6wCe/ULfb6Lm7Ev4CJ2CnO/YUuhurOnKgZ
 hdn0iFZh3kIAgSjWNGsJJtdWcI+oxJQqLfhX/7EBCF+V7ZMPZnwyXOINQWNb0ZtqYP
 cwvi2o946+7rWgm6zT/VgaRC40RPHwJt1L7mXUyXz++DX8x9prh/uP23qzHzWkdbp4
 aRoUPKi4I5rDZFSwGDi8sWzB+T48Lk+wqUy9b4x01qgMgl1XbERIDbOIG9PMD6MRs1
 IqVI7yEStu/XA==
Message-ID: <778b1f04-a71b-a226-f7a7-4833fc9bf7c2@kernel.org>
Date: Mon, 11 Apr 2022 18:04:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Yufen Yu <yuyufen@huawei.com>, jaegeuk@kernel.org
References: <20220401071909.505086-1-yuyufen@huawei.com>
 <20220401071909.505086-5-yuyufen@huawei.com>
 <0c134e0e-b2d0-0bc0-42fc-cd220ff77e72@kernel.org>
 <25a24259-3ac3-81ab-1c28-f2a4886888b5@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <25a24259-3ac3-81ab-1c28-f2a4886888b5@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/6 11:01, Yufen Yu via Linux-f2fs-devel wrote: >
 Hi, > > On 2022/4/1 16:28, Chao Yu wrote: >> On 2022/4/1 15:19, Yufen Yu via
 Linux-f2fs-devel wrote: >>> Nowly, we can use new fault injection [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ndquJ-00CckW-HQ
Subject: Re: [f2fs-dev] [PATCH 4/5] f2fs: get rid of stale fault injection
 code
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi80LzYgMTE6MDEsIFl1ZmVuIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+
IEhpLAo+IAo+IE9uIDIwMjIvNC8xIDE2OjI4LCBDaGFvIFl1IHdyb3RlOgo+PiBPbiAyMDIyLzQv
MSAxNToxOSwgWXVmZW4gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+PiBOb3dseSwg
d2UgY2FuIHVzZSBuZXcgZmF1bHQgaW5qZWN0aW9uIGZyYW1ld29yay4gSnVzdCBkZWxldGUgdGhl
Cj4+PiBzdGFsZSBmYXVsdCBpbmplY3Rpb24gY29kZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZ
dWZlbiBZdSA8eXV5dWZlbkBodWF3ZWkuY29tPgo+Pj4gLS0tCj4+PiDCoCBmcy9mMmZzL2NoZWNr
cG9pbnQuYyB8wqAgMiArLQo+Pj4gwqAgZnMvZjJmcy9mMmZzLmjCoMKgwqDCoMKgwqAgfCA1MSAr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+IMKgIGZzL2YyZnMv
c3VwZXIuY8KgwqDCoMKgwqAgfCA1MyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+Pj4gwqAgZnMvZjJmcy9zeXNmcy5jwqDCoMKgwqDCoCB8IDIzIC0tLS0tLS0t
LS0tLS0tLS0tLS0KPj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMjYg
ZGVsZXRpb25zKC0pCj4+Pgo+IAo+IC4uLgo+IAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4+PiBAQCAtMTk2MywxNCArMTkyMCw2IEBAIHN0YXRpYyBpbnQgZjJmc19zaG93
X29wdGlvbnMoc3RydWN0IHNlcV9maWxlICpzZXEsIHN0cnVjdCBkZW50cnkgKnJvb3QpCj4+PiDC
oMKgwqDCoMKgIGlmIChGMkZTX0lPX1NJWkVfQklUUyhzYmkpKQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHNlcV9wcmludGYoc2VxLCAiLGlvX2JpdHM9JXUiLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBGMkZTX09QVElPTihzYmkpLndyaXRlX2lvX3NpemVfYml0cyk7Cj4+
PiAtI2lmZGVmIENPTkZJR19GMkZTX0ZBVUxUX0lOSkVDVElPTgo+Pj4gLcKgwqDCoCBpZiAodGVz
dF9vcHQoc2JpLCBGQVVMVF9JTkpFQ1RJT04pKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgc2VxX3By
aW50ZihzZXEsICIsZmF1bHRfaW5qZWN0aW9uPSV1IiwKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgRjJGU19PUFRJT04oc2JpKS5mYXVsdF9pbmZvLmluamVjdF9yYXRlKTsKPj4+
IC3CoMKgwqDCoMKgwqDCoCBzZXFfcHJpbnRmKHNlcSwgIixmYXVsdF90eXBlPSV1IiwKPj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRjJGU19PUFRJT04oc2JpKS5mYXVsdF9pbmZv
LmluamVjdF90eXBlKTsKPj4+IC3CoMKgwqAgfQo+Pj4gLSNlbmRpZgo+Pgo+PiBUaGlzIHdpbGwg
Y2F1c2UgcmVncmVzc2lvbiBkdWUgdG8gaXQgYnJlYWtzIGFwcGxpY2F0aW9uIHVzYWdlIHcvIC1v
Cj4+IGZhdWx0XyogbW91bnRvcHRpb24uLi4sIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgcmln
aHQgd2F5Lgo+IAo+IAo+IFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4gSSBhZG1pdCBpdCdzIGEg
cHJvYmxlbS4gQnV0LCBJTU8gZmF1bHRfKiBtb3VudAo+IG9wdGlvbiBhcmUgbW9zdGx5IGJlZW4g
dXNlZCBpbiB0ZXN0LCBub3QgaW4gYWN0dWFsIHByb2R1Y3QuIFNvLCBJIHRoaW5rCj4gaXQgbWF5
IGp1c3QgYWZmZWN0IHNvbWUgdGVzdCBhcHBsaWNhdGlvbnMuIFdpdGggdGhlIGNvbW1vbiBmYXVs
dCBpbmplY3Rpb24KPiBmcmFtZXdvcmssIGl0IGNhbiBiZSBtb3JlIGVhc3kgYW5kIGZsZXhpYmxl
IHRvIGRvIGZhdWx0IGluamVjdGlvbiB0ZXN0Lgo+IFRoZXJlZm9yZSwgSSB3YW50IHRvIHJlbW92
ZSB0aGUgdHdvIG1vdW50IG9wdGlvbnMgZGlyZWN0bHkuCj4gCj4gSWYgeW91IHJlYWxseSB3b3Jy
aWVkIGFib3V0IGNvbXBhdGliaWxpdHksIGhvdyBhYm91dCBqdXN0IHJlc2VydmluZyB0aGUKPiB0
d28gaW5qZWN0Xyogb3B0aW9ucyBidXQgd2l0aG91dCBkb2luZyBhbnkgdGhpbmcgZm9yIHRoZW0u
IFdlIGFjdHVhbGx5Cj4gY29uZmlndXJlIGZhdWx0IGluamVjdGlvbnMgYnkgZGVidWdmcyBpbiB0
aGlzIHBhdGNoLgo+IAo+IE9yIGRvIHlvdSBoYXZlIG1vcmUgYmV0dGVyIHN1Z2dlc3Rpb24/CgpD
b3VsZCB5b3UgcGxlYXNlIGNvbnNpZGVyIHRvIGtlZXAgb3JpZ2luYWwgbG9naWMgb2YgZjJmcyBm
YXVsdCBpbmplY3Rpb24KaWYgdXNlciB1c2UgaW5qZWN0Xyogb3B0aW9ucywgb3RoZXJ3aXNlIGZv
bGxvd2luZyBjb21tb24gZmF1bHQgaW5qZWN0aW9uCmZyYW1ld29yaz8KClRob3VnaHRzPwoKVGhh
bmtzLAoKPiAKPiBUaGFua3MsCj4gWXVmZW4KPiAKPiAKPiAKPiAKPiAKPiAKPiAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=

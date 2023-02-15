Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 810A1697E9C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 15:44:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSJ14-00011f-Cr;
	Wed, 15 Feb 2023 14:44:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pSJ12-00011S-Jc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 14:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cRIolvVj76LtArNh47muiswhE/aeQ65fOXCcGo2vYxw=; b=G2JvR725MzEhQN0pUmH05EKqa5
 HR08MfFa2U523haLsWycZ5j4xfIPTwp+5s6Q+J/3Z9Uji6AOOwc/qrC4qdez7vggr12CCJLQARIIi
 klX2Irkjx0VZLrqJdSoHdBxc8gk/rC13bo9/1+SPFCUYcUctBfVjMtOFJy4/UzJIQWwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cRIolvVj76LtArNh47muiswhE/aeQ65fOXCcGo2vYxw=; b=famv4phky+EaQ6noAqPdSyJ+PY
 WUEO6uaKWxWycs1t68hWPzSHdWnpRz64LOC6pqTa+IEBdYbn6czMuuAnaF4jn/J8/Q1eDm5xezkAb
 vcP2xz0Y1ietRZho4XJS3mg5HBxGp93q+Yu3Nqxj1CJ/0bI8CD4tbTz1Cegz63i+RQnc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSJ0v-0006hP-PW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 14:44:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C08361C44;
 Wed, 15 Feb 2023 14:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931DBC4339C;
 Wed, 15 Feb 2023 14:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676472239;
 bh=ZYy2SiK9o8XAp9f39GoyiQzDdp41wQI4tr6oU4Ic9Fw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PlyxzAm1ZI1Fqk6aBTiXn0qDQdolDjA6CwWYTCIC0Sb1a+SeyN9An1jI8Ps5KIKWx
 1BAq2Ii8lNEa2CtlMPrbvJd+gHG/G/VuWEn3+lQoDnLmOZWD/wd9HKYeM09oCPe7FS
 ZzGn2DKBvAPk4rK9VMUFfgg/yhv8uJtYEngh8SrFpmIqKL9VukCPBFOxrmykZ3JyL5
 REX9VbCE1dXnwmMFehnn8YIS/reX2jXIlNHpX5j1wdBzGty7MiqxVBuPZtik7pVX/I
 ojuw7T7HGpWe6+ffqoPfvZ9wTT/zLwcZL6Zw1eh3aQVffZTFfR9H8v3SOoJbQsNytT
 EPa48PS5od94A==
Message-ID: <10a80557-50f6-f563-56ca-eb3df7e4ea93@kernel.org>
Date: Wed, 15 Feb 2023 22:43:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230209-kobj_type-f2fs-v1-1-b6feedbdd4a8@weissschuh.net>
 <cc338b66-f0f5-d9b7-81d3-b15bccc9d463@kernel.org>
 <Y+p4jezz5asWoPhu@google.com>
 <abb12474-f338-dedf-115b-da70e4946cec@kernel.org>
 <Y+vN18flpTqWwvll@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y+vN18flpTqWwvll@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/2/15 2:07, Jaegeuk Kim wrote: > On 02/14, Chao Yu
   wrote: >> On 2023/2/14 1:51, Jaegeuk Kim wrote: >>> On 02/13, Chao Yu wrote:
    >>>> On 2023/2/9 11:20, Thomas Weißschuh wrote: >>>>> Since comm [...] 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSJ0v-0006hP-PW
Subject: Re: [f2fs-dev] [PATCH] f2fs: make kobj_type structures constant
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy8yLzE1IDI6MDcsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDAyLzE0LCBDaGFvIFl1
IHdyb3RlOgo+PiBPbiAyMDIzLzIvMTQgMTo1MSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+PiBPbiAw
Mi8xMywgQ2hhbyBZdSB3cm90ZToKPj4+PiBPbiAyMDIzLzIvOSAxMToyMCwgVGhvbWFzIFdlacOf
c2NodWggd3JvdGU6Cj4+Pj4+IFNpbmNlIGNvbW1pdCBlZTZkM2RkNGVkNDggKCJkcml2ZXIgY29y
ZTogbWFrZSBrb2JqX3R5cGUgY29uc3RhbnQuIikKPj4+Pj4gdGhlIGRyaXZlciBjb3JlIGFsbG93
cyB0aGUgdXNhZ2Ugb2YgY29uc3Qgc3RydWN0IGtvYmpfdHlwZS4KPj4+Pj4KPj4+Pj4gVGFrZSBh
ZHZhbnRhZ2Ugb2YgdGhpcyB0byBjb25zdGlmeSB0aGUgc3RydWN0dXJlIGRlZmluaXRpb25zIHRv
IHByZXZlbnQKPj4+Pj4gbW9kaWZpY2F0aW9uIGF0IHJ1bnRpbWUuCj4+Pj4+Cj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KPj4+Pgo+
Pj4+IFJldmlld2VkLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pgo+Pj4gSGkgQ2hh
bywKPj4+Cj4+PiBOb3RlIHRoYXQsIG5leHQgdGltZSwgSSB3b24ndCBhcHBseS9tb2RpZnkgYW55
IHBhdGNoZXMgbWVyZ2VkIGluIC1kZXYsCj4+PiB1bmxlc3MgaXQgaGFzIGEgcHJvYmxlbS4KPj4K
Pj4gSGkgSmFlZ2V1aywKPj4KPj4gT2gsIGFueSBwYXJ0aWN1bGFyIHJlYXNvbiwgdG8gYXZvaWQg
dW5uZWVkZWQgY29tbWl0IGlkIGNoYW5nZSB3aGVuIHRoZSB0aW1lIGlzCj4+IGNsb3NlIHRvIG1l
cmdlIHdpbmRvdz8KPiAKPiBIaSBDaGFvLAo+IAo+IEknbSB0cnlpbmcgdG8gYXZvaWQgYnJlYWtp
bmcgdGhlIC1uZXh0IGJyYW5jaC4KCkphZWdldWssIHNvIHdoeSBkbyB3ZSBuZWVkIHRvIGF2b2lk
IGJyZWFraW5nIC1uZXh0IGJyYW5jaD8gSSBkaWRuJ3QgZ2V0IGl0LiA6LSgKCj4gCj4+Cj4+IElz
IHRoZXJlIGFueSBwZXJpb2Qgb2YgZ3JhY2UgYmVmb3JlIG1lcmdpbmcgcGF0Y2hlcyBmcm9tIGRl
di10ZXN0IGJyYW5jaCBpbnRvIGRldgo+PiBicmFuY2g/IE1heWJlIGEgd2VlayBpcyByZWFzb25h
YmxlPyBzbyBJIG1heSBoYXZlIHRpbWUgdG8gY2F0Y2ggdXAgaW4gdGltZS4KPiAKPiBObyBydWxl
LCBidXQgSSdtIHRyeWluZyB0byB3YWl0IGZvciBzZXZlcmFsIGRheXMgd2hpbGUgcnVubmluZyBt
eSBsb2NhbCB0ZXN0cy4KPiBJZiB0aGUgcGF0Y2ggbG9va3Mgb2theSwgc29tZXRpbWVzIEknbGwg
cXVldWUgaXQgcmlnaHQgYXdheS4KClN1cmUsIG5vdCBwcm9ibGVtLgoKVGhhbmtzLAoKPiAKPiBU
aGFua3MsCj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4+Cj4+Pj4g
VGhhbmtzLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK

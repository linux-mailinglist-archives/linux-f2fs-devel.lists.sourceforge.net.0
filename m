Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA285B320
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 07:50:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcJxb-0006YR-9s;
	Tue, 20 Feb 2024 06:50:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcJxa-0006YL-2w
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 06:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BP0KseMVyXdTloNsqEMqrZbRTmICvx48ZT1gMfrG85w=; b=AtSuzFx7OD0WS2UdSdNinGln2F
 jARPhWYAGX0Zt1Fs47/lzUmdpJ4OxadWuL9CSlqQTgbj8rJOZhPjY2fNSjS4uJKZXXtpmm6ymROV9
 btN884fVnSSgGDs09Za3BRtgx9EpBJHHsSzbB9y2/uhgRzxFF9q2sUj3xlC2itSj4zbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BP0KseMVyXdTloNsqEMqrZbRTmICvx48ZT1gMfrG85w=; b=On0ZoDjHh4Gq63sV9ktXYqYz0a
 1sbflQZsuZZUe3LLdls4ZHrUA6hnh26catc5XCagkEECUXgWm2d+7nYcKts9TiX6v6RUmbobHUQKu
 yEBXrlMJTK1DhdX6OWwi6n5RZnmlX+GJQqmDPgApR4GGiGJXw3CtBXIgLM4oApUlLz+k=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcJxU-0006nM-JT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 06:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 45295CE182F;
 Tue, 20 Feb 2024 06:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E030FC433C7;
 Tue, 20 Feb 2024 06:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708411817;
 bh=IPBlD9TMdkVk8QBHkD6dEwxAl+m+4DmFxsgsXh2F9go=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UpNNGn6xAJiuHKtXcdVxpuPblf6NJYhvnuqnF1ax/trXw25ayAPalGxYTJjIQDrfb
 uP7jQv0WomocoMV/q3unNO78n39l/R85ImfvpkfSNbzz0XK/jqRECnabxpxbeTGkfh
 +YL7zXeYonH0B8+2p60ci3Gh59f6FZ/ybIUUDL90eZjjlFSmL0JzI1iyHsDW+dxmtT
 q8/gKuRs7zAR45WnTPVE4kNbxdnF+nGaN/IE4h3jkqShR3W65g/oO0Ypln7PD86K6f
 e+LilT/X/CBNrMUO9Z4t44eGP9VKCfjFnb0S0aDYNzFoCgzbjouZ+cbdWpMEML/wcy
 nrZ+sL5a/KK2Q==
Message-ID: <f51946e2-68f4-4368-9a77-050382dfa3ff@kernel.org>
Date: Tue, 20 Feb 2024 14:50:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wu Bo <wubo.oduw@gmail.com>, Wu Bo <bo.wu@vivo.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240205031415.557879-1-bo.wu@vivo.com>
 <793fd834-fe28-4647-b2cf-0012acb95b43@kernel.org>
 <bab0d763-2907-4412-8075-a7ebb25081c0@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <bab0d763-2907-4412-8075-a7ebb25081c0@gmail.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/2/8 16:11, Wu Bo wrote: > On 2024/2/5 11:54, Chao
   Yu wrote: >> How about calling f2fs_balance_fs() to double check and make
   sure there is >> enough free space for following allocation. >> >> Â [...]
    
 
 Content analysis details:   (-2.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcJxU-0006nM-JT
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: stop allocating pinned
 sections if EAGAIN happens"
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8yLzggMTY6MTEsIFd1IEJvIHdyb3RlOgo+IE9uIDIwMjQvMi81IDExOjU0LCBDaGFv
IFl1IHdyb3RlOgo+PiBIb3cgYWJvdXQgY2FsbGluZyBmMmZzX2JhbGFuY2VfZnMoKSB0byBkb3Vi
bGUgY2hlY2sgYW5kIG1ha2Ugc3VyZSB0aGVyZSBpcwo+PiBlbm91Z2ggZnJlZSBzcGFjZSBmb3Ig
Zm9sbG93aW5nIGFsbG9jYXRpb24uCj4+Cj4+IMKgwqDCoMKgwqDCoMKgIGlmIChoYXNfbm90X2Vu
b3VnaF9mcmVlX3NlY3Moc2JpLCAwLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdFVF9TRUNf
RlJPTV9TRUcoc2JpLCBvdmVycHJvdmlzaW9uX3NlZ21lbnRzKHNiaSkpKSkgewo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGYyZnNfZG93bl93cml0ZSgmc2JpLT5nY19sb2NrKTsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdGF0X2luY19nY19jYWxsX2NvdW50KHNiaSwgRk9SRUdST1VORCk7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gZjJmc19nYyhzYmksICZnY19jb250cm9s
KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyID09IC1FQUdBSU4pCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2JhbGFuY2VfZnMoc2JpLCB0cnVlKTsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyICYmIGVyciAhPSAtRU5PREFUQSkKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2VycjsKPj4gwqDCoMKgwqDCoMKg
wqAgfQo+Pgo+PiBUaGFua3MsCj4gCj4gZjJmc19iYWxhbmNlX2ZzKCkgaGVyZSB3aWxsIG5vdCBj
aGFuZ2UgcHJvY2VkdXJlIGJyYW5jaCBhbmQgbWF5IGp1c3QgdHJpZ2dlciBhbm90aGVyIEdDLgo+
IAo+IEknbSBhZnJhaWQgdGhpcyBpcyBhIGJpdCByZWR1bmRhbnQuCgpPa2F5LgoKSSBndWVzcyBt
YXliZSBKYWVnZXVrIGhhcyBjb25jZXJuIHdoaWNoIGlzIHRoZSByZWFzb24gdG8gY29tbWl0CjJl
NDJiN2Y4MTdhYyAoImYyZnM6IHN0b3AgYWxsb2NhdGluZyBwaW5uZWQgc2VjdGlvbnMgaWYgRUFH
QUlOIGhhcHBlbnMiKS4KClRoYW5rcywKCj4gCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

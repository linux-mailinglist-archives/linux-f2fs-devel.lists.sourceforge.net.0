Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB57221289
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 18:42:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvkUQ-0001lg-DP; Wed, 15 Jul 2020 16:42:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jvkUP-0001lZ-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 16:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F66Pz1zIyliX/dWUswzKGzCswBFwUjJgsk7DRRn2eUw=; b=ak6SLTLPS1YFjELSFcrW48ipvS
 l42ZEgDbJqZ9kJvLf75sqiPoKJA+NVfUR9ltkZ2ytkuCwzaQWxZnUih0EbRVhfxW6mVROf9rkXivI
 tv3rvNN1ogFQgFXU0faA+8M1Vecb4d/8Hg/QDf5H/7EPJ+Gcox9Uq6urML0G81Cses2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F66Pz1zIyliX/dWUswzKGzCswBFwUjJgsk7DRRn2eUw=; b=JSXFRE+v185rUUxVFL80aNSvqV
 8BJOTbDIL6x3SmSiwocxrGheFJ+AS6pq+D41m4o5n/ksYibQjQU/tepfaIPUVqoYg98XxIh8KPqHp
 sciygfqIR+OC48tzrAyXu03Jc+R0yEH7XNjUUohYRfLCQccez+WuRNBFp9Re2xmr/zoc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvkUN-008xh8-Qf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 16:42:37 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3798120658;
 Wed, 15 Jul 2020 16:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594831342;
 bh=ED5t9A4zYRl2ppiYuYOQoWbYJVj84a6IYOD4Vjh9qcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dQA5TiCjdpTjdRjyFo64GaYmcJ38VZ98DmESuH3bIc7IwBm+v5kPqFNCfamABR9ad
 juc1949N82lTQqEXq8UtZ8CEbj9YS6CApPxNuKJZjUnXctZlMrROfyWVI3oPc7nkke
 bgJOSl8Vf6rDJvb6pGJKcpTQJ6zKF3hQOrGgCfOk=
Date: Wed, 15 Jul 2020 09:42:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200715164220.GC1167@sol.localdomain>
References: <20200713031252.3873546-1-daeho43@gmail.com>
 <20200713181152.GC2910046@google.com>
 <3b02263d-a5e1-136c-40ed-514d34e4c895@huawei.com>
 <CACOAw_wBD_ourGJSdRTDM-wzeH97aGE966QDB6bpjiyXRrh47A@mail.gmail.com>
 <f4a594a1-464f-3a74-90cb-fd536bed9962@huawei.com>
 <CACOAw_w3OWDVXSYHuTEEVv1HaBZir1CWcRAmxOt00MB4vXBKVg@mail.gmail.com>
 <1d84bc01-fece-df55-6e33-07a705cfb432@huawei.com>
 <CACOAw_xaS7qB22EPsZvHoC=uPiPtqGMAK5cP4Vk20xO21GQ-Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xaS7qB22EPsZvHoC=uPiPtqGMAK5cP4Vk20xO21GQ-Kg@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvkUN-008xh8-Qf
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change the way of handling
 range.len in F2FS_IOC_SEC_TRIM_FILE
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdWwgMTUsIDIwMjAgYXQgMDc6MjU6MTNQTSArMDkwMCwgRGFlaG8gSmVvbmcgd3Jv
dGU6Cj4gQ2hhbywKPiAKPiBJIGNhbid0IGZpbmQgZnNjcnlwdF96ZXJvb3V0X3JhbmdlX2lubGlu
ZV9jcnlwdCgpIGZ1bmN0aW9uLiBEbyB5b3UKPiBtZWFuIHdlIG5lZWQgdG8gaW1wbGVtZW50IHRo
aXMgb25lIGZvciBpbmxpbmUgZW5jcnlwdGlvbj8KPiAKPiAyMDIw64WEIDfsm5QgMTXsnbwgKOyI
mCkg7Jik7ZuEIDQ6MTcsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISx
Ogo+ID4KPiA+IE9uIDIwMjAvNy8xNSAxNDo1NCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiA+IFlv
dSBtZWFuIHdlIGNhbiBzdXBwb3J0IFpFUk9PVVQgb3B0aW9uIG9ubHkgZm9yIGVuY3J5cHRlZCBm
aWxlcyBvZgo+ID4gPiBub24tbXVsdGlkZXZpY2UgZjJmcywKPiA+ID4gYW5kIHJldHVybiAtRU9Q
Tk9UU1VQUCBpbiB0aGUgbXVsdGlkZXZpY2UgY2FzZSwgcmlnaHQgbm93Pwo+ID4KPiA+IFllcywg
c29tZXRoaW5nIGxpa2U6Cj4gPgo+ID4gZjJmc19zZWNfdHJpbV9maWxlKCkKPiA+Cj4gPiBpZiAo
KHJhbmdlLmZsYWdzICYgRjJGU19UUklNX0ZJTEVfWkVST09VVCkgJiYKPiA+ICAgICAgICAgZjJm
c19lbmNyeXB0ZWRfZmlsZSgpICYmIGYyZnNfaXNfbXVsdGlfZGV2aWNlKCkpCj4gPiAgICAgICAg
IHJldHVybiAtRU9QTk9UU1VQUDsKPiA+Cj4gPgo+ID4gZjJmc19zZWN1cmVfZXJhc2UoKQo+ID4K
PiA+IGlmICghcmV0ICYmIChmbGFncyAmIEYyRlNfVFJJTV9GSUxFX1pFUk9PVVQpKSB7Cj4gPiAg
ICAgICAgIGlmIChmMmZzX2VuY3J5cHRlZF9maWxlKCkpIHsKPiA+ICAgICAgICAgICAgICAgICBp
ZiAoZnNjcnlwdF9pbm9kZV91c2VzX2ZzX2xheWVyX2NyeXB0bykKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldCA9IGZzY3J5cHRfemVyb291dF9yYW5nZSgpOwo+ID4gICAgICAgICAgICAg
ICAgIGVsc2UKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGZzY3J5cHRfemVyb291
dF9yYW5nZV9pbmxpbmVfY3J5cHQoKTsKPiA+ICAgICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAg
ICAgICAgICByZXQgPSBibGtkZXZfaXNzdWVfemVyb291dCgpOwo+ID4gICAgICAgICB9Cj4gPiB9
Cgpmc2NyeXB0X3plcm9vdXRfcmFuZ2VfaW5saW5lX2NyeXB0KCkgaXMgYmVpbmcgYWRkZWQgYnkK
ImZzY3J5cHQ6IGFkZCBpbmxpbmUgZW5jcnlwdGlvbiBzdXBwb3J0Iiwgd2hpY2ggaXMgcXVldWVk
IGluIHRoZSBmc2NyeXB0IHRyZWUKKHRoZSBtYXN0ZXIgYnJhbmNoIG9mIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9mcy9mc2NyeXB0L2ZzY3J5cHQuZ2l0KS4KCkJ1dCB0aGF0J3Mgbm90
IGFjdHVhbGx5IHJlbGV2YW50IGhlcmUgYmVjYXVzZSBmc2NyeXB0X3plcm9vdXRfcmFuZ2UoKSBj
YWxscwpmc2NyeXB0X3plcm9vdXRfcmFuZ2VfaW5saW5lX2NyeXB0KCkgd2hlbiBuZWVkZWQuCgpK
dXN0IHVzZSBmc2NyeXB0X3plcm9vdXRfcmFuZ2UoKS4KCi0gRXJpYwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

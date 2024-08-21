Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C585A95961C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2024 09:32:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgfoo-0001ka-0c;
	Wed, 21 Aug 2024 07:31:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sgfom-0001kN-MH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Aug 2024 07:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DZK2+Avn3DeSayTxgLYmD69QKSuk/uASu9YM2HSdnYs=; b=WLUbMmdgapEAKqDaM/WRnrK9sK
 z+bKNncWIOeSm3VsI0qwiwOvUc5P7caK/MuE+Z2KpW6bBSfmWEIIMJFfC1ofj3DGU6ONgPfIdJJYY
 LoTu3XpxwpzxyxVbpExXvBzsjfdFwA+yEOBs+sNC9tjRsLYhq9pIC4v9QnZgjZRjaRLo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DZK2+Avn3DeSayTxgLYmD69QKSuk/uASu9YM2HSdnYs=; b=kgpJbjdJ8YEePB9d49kqRDiESs
 FYACFzxxuK/4QbcqiT5Pcs1nUcn7GYsCoC6wfNDnbDJQqRTO7vh+Zk62vM+LUsKGb2EloqZeHPxBH
 pMnz7yJW3buu0BspPYcz5tUaysbFGhlpMKSG3I1piW1PEaKJrCp6bryW8r+PJxD/iCNU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgfol-0003Xt-9T for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Aug 2024 07:31:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 806A1CE0B3E;
 Wed, 21 Aug 2024 07:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBD6C32782;
 Wed, 21 Aug 2024 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724225495;
 bh=wv4IF+TY93P6mNy/d/y2Xz8LknDgO6XpCpGt4D+55DU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Dna5SMld9jNvmLqYwoRwHvmTLWTFuKjAo3Maii8Q/5oqbNBCAwEXAFCOIUIAwH60t
 iFqcs89xJHb6yT7e5Z0ja9zVX8d3KP6a6kONAIvrWFZo+Qw2ypp7QPpZR/m2am3etR
 31f/x+IR4/SZt365O0nYCRyYrNdjtR5wOsqqAjpn/z+JWqpvpjjpUgzr+8tIbUIEZv
 0Wav7Jl4lPqBJ6C/kEL9f7uaM8Val/hHytoGonXjfpt3MIgYQtMKSTkmVSsRgLB7e+
 //SGWAFuNj5eeh0q7SmtGqpkbWfz4LonOz50v0lUQf/y2gT3JpMQCGkxh5w9CXPcbv
 DGSAWz3ZYy3VQ==
Message-ID: <dfcfb276-1502-45da-b65d-e7ce5297d6ae@kernel.org>
Date: Wed, 21 Aug 2024 15:31:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Zetao <lizetao1@huawei.com>, jaegeuk@kernel.org
References: <20240820034654.698236-1-chao@kernel.org>
 <a36db618-e7df-4c15-ad6f-876d8cc2bde5@huawei.com>
 <a16d5083-5e24-43e1-b245-12152cac5947@kernel.org>
Content-Language: en-US
In-Reply-To: <a16d5083-5e24-43e1-b245-12152cac5947@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/20 14:58, Chao Yu wrote: > On 2024/8/20 12:38, Li
 Zetao wrote: >>> I want to apply your patch set for testing, but there is
 a conflict on >> the master branch of linux-next. Maybe it depends [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sgfol-0003Xt-9T
Subject: Re: [f2fs-dev] [PATCH v2 1/8] f2fs: convert f2fs_write_begin() to
 use folio
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC84LzIwIDE0OjU4LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjQvOC8yMCAxMjozOCwg
TGkgWmV0YW8gd3JvdGU6Cj4+PiBJIHdhbnQgdG8gYXBwbHkgeW91ciBwYXRjaCBzZXQgZm9yIHRl
c3RpbmcsIGJ1dCB0aGVyZSBpcyBhIGNvbmZsaWN0IG9uIAo+PiB0aGUgbWFzdGVyIGJyYW5jaCBv
ZiBsaW51eC1uZXh0LiBNYXliZSBpdCBkZXBlbmRzIG9uIGEgY2VydGFpbiBwcmUtcGF0Y2guIFBs
ZWFzZSBsZXQgbWUga25vdywgdGhhbmsgeW91Lgo+Pgo+PiDCoMKgIEFwcGx5aW5nOiBmMmZzOiBj
b252ZXJ0IGYyZnNfd3JpdGVfYmVnaW4oKSB0byB1c2UgZm9saW8KPj4gwqDCoCBlcnJvcjogcGF0
Y2ggZmFpbGVkOiBmcy9mMmZzL2RhdGEuYzozNTY2Cj4+IMKgwqAgZXJyb3I6IGZzL2YyZnMvZGF0
YS5jOiBwYXRjaCBkb2VzIG5vdCBhcHBseQo+PiDCoMKgIFBhdGNoIGZhaWxlZCBhdCAwMDAxIGYy
ZnM6IGNvbnZlcnQgZjJmc193cml0ZV9iZWdpbigpIHRvIHVzZSBmb2xpbwo+IAo+IFdlIHNob3Vs
ZCBhcHBseSB0aGlzIHBhdGNoc2V0IG9uIHRvcCBvZiBkZXYtdGVzdCBicmFuY2g/Cj4gCj4gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamFlZ2V1ay9mMmZz
LmdpdC9sb2cvP2g9ZGV2LXRlc3QKCk9oLCBJIG1pc3NlZCBvbmUgcGF0Y2guLi4KCkNhbiB5b3Ug
cGxlYXNlIGNoZWNrCgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9jaGFvL2xpbnV4LmdpdC9sb2cvP2g9Zm9saW8KClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+
IAo+Pgo+PiBUaGFua3MsCj4+IExpIFpldGFvLgo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=

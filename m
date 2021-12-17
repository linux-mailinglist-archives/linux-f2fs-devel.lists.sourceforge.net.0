Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A2E4791E4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Dec 2021 17:52:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1myGSl-0004RI-QJ; Fri, 17 Dec 2021 16:52:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1myGSb-0004Qz-UD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Dec 2021 16:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n4GIyDTy/M61Gq3vlBkRNs1NmP3JL27ZofDPWNHhnvA=; b=CPu6nV4nz+VYs0EvrzmHsJ0EZH
 jrCPHy1aY43jXBGO1VM1YOxpEbKWb66qE7NfIEO3uk0gNUKa1xffbm5jxalST66gXHnMj3Uv1cOOf
 dLHevRDlYgnrQNecFrJbowHwKWr7M8CcOwirUn54N0+Tiww3QLApkRD8OUci0TasJqTM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n4GIyDTy/M61Gq3vlBkRNs1NmP3JL27ZofDPWNHhnvA=; b=jUJo9i0WKQJzmDZOx7PjVKWUtC
 Xa5XjjWf/JpRriFWJFEUvq4KcHfo59xG5SuGUEFm1zkLhXHzAiOYASxX30spEh3Y1VxiSgIx27tZz
 NsuIbAcfljsJ1gg1nYXoQ2BrLSss4vAtwSz49uJS5bt0tyeq1U3ia50sF5tPMxDl4/VA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1myGSb-0015pE-2f
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Dec 2021 16:51:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B48A262305;
 Fri, 17 Dec 2021 16:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB3CC36AE1;
 Fri, 17 Dec 2021 16:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639759911;
 bh=tuQrVEIodDfTP/WIeUxfIZy0X9WpU5zJkldM4Fk5eCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L+6n4O1OOPNczcbNWZxVZ3pF37qVcJ2KwXhaxcVrDGJkpQ6GF/Yhs68GXX8lzQF0e
 UPywYr8tXGnjwMN7F7kDxF3A4j4/fROKAYwV3KblL01gCtAMmGVZZ+cmVjkOL02NGt
 muAgEU/Fcu4oSmzZClLFzvfP3WeR85wqfqJm/VisMCkRyzxzpsodrz5KdFUq4GxH0w
 f3vT8EW+Tvzyeb9dAbwSlQvJzgNr7UeMKV8/JsJeeusXRMwMVpizR2Ki92GSArZ19D
 Pzo2e5fe1J3OR03v9y7e6/VtE+C/7cwecasJa+KHybXFoa87zuOZTPdjFeB5N1Z6lO
 AZTV1n6Pnz+Xg==
Date: Fri, 17 Dec 2021 08:51:49 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "Yang.Lee" <yang.lee@linux.alibaba.com>
Message-ID: <YbzAJWlnSHrnR4/X@google.com>
References: <20211215023858.33303-1-yang.lee@linux.alibaba.com>
 <YbuTLr/HJO3IMI6u@google.com>
 <fc89c7e6-ced2-40e1-9d01-496a3b60b268.yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc89c7e6-ced2-40e1-9d01-496a3b60b268.yang.lee@linux.alibaba.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/17,
 Yang.Lee wrote: > "Why not this? > sbi->gc_urgent_high_limited
 = t;" > > Since 't' is an unsigned long type and 'gc_urgent_high_limited'
 is a bool type, the assignment operation will cause a [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1myGSb-0015pE-2f
Subject: Re: [f2fs-dev] =?utf-8?b?5Zue5aSN77yaW1BBVENIIC1uZXh0XSBmMmZzOiBT?=
 =?utf-8?q?implify_bool_conversion?=
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
Cc: Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMTcsIFlhbmcuTGVlIHdyb3RlOgo+ICJXaHkgbm90IHRoaXM/Cj4gICBzYmktPmdjX3Vy
Z2VudF9oaWdoX2xpbWl0ZWQgPSB0OyIKPiAKPiBTaW5jZSAndCcgaXMgYW4gdW5zaWduZWQgbG9u
ZyB0eXBlIGFuZCAnZ2NfdXJnZW50X2hpZ2hfbGltaXRlZCcgaXMgYSBib29sIHR5cGUsIHRoZSBh
c3NpZ25tZW50IG9wZXJhdGlvbiB3aWxsIGNhdXNlIGEgbmV3IHdhcm5pbmcuCgpIdWgsIHRoYXQg
ZG9lc24ndCBhbGxvdyBhdXRvIGNhc3RpbmcgYXMgd2VsbC4KCj4gCj4gCj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
5Y+R5Lu25Lq677yaSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiDlj5HpgIHml7bp
l7TvvJoyMDIx5bm0MTLmnIgxN+aXpSjmmJ/mnJ/kupQpIDAzOjI3Cj4g5pS25Lu25Lq677yaWWFu
ZyBMaSA8eWFuZy5sZWVAbGludXguYWxpYmFiYS5jb20+Cj4g5oqE44CA6YCB77yaY2hhbyA8Y2hh
b0BrZXJuZWwub3JnPjsgbGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQ+OyBsaW51eC1rZXJuZWwgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc+OyBBYmFjaSBSb2JvdCA8YWJhY2lAbGludXguYWxpYmFiYS5jb20+Cj4g5Li744CA6aKY77ya
UmU6IFtQQVRDSCAtbmV4dF0gZjJmczogU2ltcGxpZnkgYm9vbCBjb252ZXJzaW9uCj4gCj4gT24g
MTIvMTUsIFlhbmcgTGkgd3JvdGU6Cj4gPiBGaXggdGhlIGZvbGxvd2luZyBjb2NjaWNoZWNrIHdh
cm5pbmc6Cj4gPiAuL2ZzL2YyZnMvc3lzZnMuYzo0OTE6NDEtNDY6IFdBUk5JTkc6IGNvbnZlcnNp
b24gdG8gYm9vbCBub3QgbmVlZGVkIGhlcmUKPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IEFiYWNpIFJv
Ym90IDxhYmFjaUBsaW51eC5hbGliYWJhLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbmcgTGkg
PHlhbmcubGVlQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gLS0tCj4gPiAgZnMvZjJmcy9zeXNmcy5j
IHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5j
Cj4gPiBpbmRleCA5ZTFjZjQ0NjQyYWUuLjUzMGMzNmI4OWJmMSAxMDA2NDQKPiA+IC0tLSBhL2Zz
L2YyZnMvc3lzZnMuYwo+ID4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4gPiBAQCAtNDg4LDcgKzQ4
OCw3IEBAIHN0YXRpYyBzc2l6ZV90IF9fc2JpX3N0b3JlKHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4g
PiAgCj4gPiAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImdjX3VyZ2VudF9oaWdoX3JlbWFp
bmluZyIpKSB7Cj4gPiAgICBzcGluX2xvY2soJnNiaS0+Z2NfdXJnZW50X2hpZ2hfbG9jayk7Cj4g
PiAtICBzYmktPmdjX3VyZ2VudF9oaWdoX2xpbWl0ZWQgPSB0ID09IDAgPyBmYWxzZSA6IHRydWU7
Cj4gPiArICBzYmktPmdjX3VyZ2VudF9oaWdoX2xpbWl0ZWQgPSB0ICE9IDA7Cj4gCj4gV2h5IG5v
dCB0aGlzPwo+ICAgc2JpLT5nY191cmdlbnRfaGlnaF9saW1pdGVkID0gdDsKPiAKPiA+ICAgIHNi
aS0+Z2NfdXJnZW50X2hpZ2hfcmVtYWluaW5nID0gdDsKPiA+ICAgIHNwaW5fdW5sb2NrKCZzYmkt
PmdjX3VyZ2VudF9oaWdoX2xvY2spOwo+ID4gIAo+ID4gLS0gCj4gPiAyLjIwLjEuNy5nMTUzMTQ0
Ywo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK

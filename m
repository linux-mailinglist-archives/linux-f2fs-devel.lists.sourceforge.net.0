Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B85388184A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Mar 2024 21:06:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rn2Cy-0006Xp-3z;
	Wed, 20 Mar 2024 20:06:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rn2Cw-0006Xb-Ts
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 20:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OCPburQQgdbSdVF8ieeOm1jBSNtH0Z0TjwdB2Z5j+sw=; b=DSzXBGl5X/4a+flSGfKdpixoKg
 vkfAIES2s6W/hCvY4beNad3YM0/HNDUYOHq/7HH+OuLqJTXywxu1ncWHrFqFkPBr87DQ/6alGDvCQ
 bzgYRJBxDmjKuWyFOHqFg5XAevuKOfLlCTXfPAq8EYGTwK7QIsUAnZAx63eGeB2FsKas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OCPburQQgdbSdVF8ieeOm1jBSNtH0Z0TjwdB2Z5j+sw=; b=URYPSgyFgRiw7CFd9u5cjHg5DR
 gnJ8c2DJYOJuFBtPTdH1eb5jx84Z9zW6GY5AT67LP01zuiB7dJWZvRuP6TQuqgwfMrUPi97MxpfSL
 mtRGEyZHFyeZ6POI3P9tFnm1Yhwou5qilvKE73Z3YT+WmT6820XGYxSKsgqsUFM6Ah6o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rn2Ck-0004Tn-Lx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 20:06:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4FBD60F91;
 Wed, 20 Mar 2024 20:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064A4C43390;
 Wed, 20 Mar 2024 20:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710965192;
 bh=AfBIQbAOtxbWlNuWHqgq4zXf9lgF4bMQpKxq3regi2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EJNMlgKF1qsochRYrEB6+rz6KJN0QNeNCMYOVFGbJpkmw9AvfyGSbydlLD/5Zbw52
 aNp2YZ5BP3eVBZQoRnBvG1ywxXgNHhcKXhQGErpdwy+fniYQCo4GMQGRC5E2LEI9ho
 tF97s8pey3LmzIC2HhkCqQQh4xA9vHFw2k8krbmc42qOhGnQGE3MRBfue5BU0tadFs
 BKkLvhLVUvUgTTUyne9ro5ooVKaxC3/eVNwlehNvXNNxrX6lwb45j5Nzln3CFzGQQV
 IxQYBY7i3bbl11KNSpaqqMtbP2fgyJBF1BbvPfcJkgtyjPh9P0OTbG3lk5lhZzxq/V
 vLkIkvokb8i9A==
Date: Wed, 20 Mar 2024 13:06:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
Message-ID: <ZftBxmBFmGCFg35I@google.com>
References: <0000000000000b4e27060ef8694c@google.com>
 <20240115120535.850-1-hdanton@sina.com>
 <4bbab168407600a07e1a0921a1569c96e4a1df31.camel@mediatek.com>
 <SI2PR03MB52600BD4AFAD1E324FD0430584332@SI2PR03MB5260.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SI2PR03MB52600BD4AFAD1E324FD0430584332@SI2PR03MB5260.apcprd03.prod.outlook.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Can you try this? https://patchwork.kernel.org/project/f2fs/patch/20240320001442.497813-1-jaegeuk@kernel.org/
    On 03/20, Light Hsieh (謝明燈) wrote: > Hi Jaegeuk: > > We encounter a
    deadlock issue when Android is going to poweroff. > Please help check. >
   > When unmounting of f2fs partition fail in Android p [...] 
 
 Content analysis details:   (-5.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rn2Ck-0004Tn-Lx
Subject: Re: [f2fs-dev] f2fs F2FS_IOC_SHUTDOWN hang issue
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
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ed Tsai =?utf-8?B?KOiUoeWul+i7kik=?= <Ed.Tsai@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2FuIHlvdSB0cnkgdGhpcz8KCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9m
MmZzL3BhdGNoLzIwMjQwMzIwMDAxNDQyLjQ5NzgxMy0xLWphZWdldWtAa2VybmVsLm9yZy8KCk9u
IDAzLzIwLCBMaWdodCBIc2llaCAo6Kyd5piO54eIKSB3cm90ZToKPiBIaSBKYWVnZXVrOgo+IAo+
IFdlIGVuY291bnRlciBhIGRlYWRsb2NrIGlzc3VlIHdoZW4gQW5kcm9pZCBpcyBnb2luZyB0byBw
b3dlcm9mZi4KPiBQbGVhc2UgaGVscCBjaGVjay4KPiAKPiBXaGVuIHVubW91bnRpbmcgb2YgIGYy
ZnMgcGFydGl0aW9uIGZhaWwgaW4gQW5kcm9pZCBwb3dlcm9mZiBwcm9jZWR1cmUsIGluaXQgdGhy
ZWFkIChwaWQgPSAxKSBpbnZva2UgRjJGU19JT0NfU0hVVERPV04gIGlvY3RsIHdpdGggYXJnIEYy
RlNfR09JTkdfRE9XTl9GVUxMU1lOQy4KPiBUaGlzIGlvY3RsIGNhdXNlIGRvd25fd3JpdGUgb2Yg
YSBzZW1hcGhvcmUgaW4gdGhlIGZvbGxvd2luZyBjYWxsIHNlcXVlbmNlOgo+ICAgICAgICAgZjJm
c19pb2Nfc2h1dGRvd24oKSAtLT4gZnJlZXplX2JkZXYoKSAtLT4gZnJlZXplX3N1cGVyKCkgLS0+
IHNiX3dhaXRfd3JpdGUoc2IsIFNCX0ZSRUVaRV9GUykgLS0+IC4uLiAtPnBlcmNwdV9kb3duX3dy
aXRlKCkuCj4gCj4gZjJmc19pb2Nfc2h1dGRvd24oKSB3aWxsIGxhdGVyIGludm9rZSBmMmZzX3N0
b3BfZGlzY2FyZF90aHJlYWQoKSBhbmQgd2FpdCBmb3Igc3RvcHBpbmcgb2YgZjJmc19kaXNjYXJk
IHRocmVhZCBpbiB0aGUgZm9sbG93aW5nIGNhbGwgc2VxdWVuY2U6Cj4gICAgICAgICBmMmZzX2lv
Y19zaHV0ZG93bigpIC0tPmYyZnNfc3RvcF9kaXNjYXJkX3RocmVhZCgpIC0tPmt0aHJlYWRfc3Rv
cChkaXNjYXJkX3RocmVhZCkgLS0+IHdhaXRfZm9yX2NvbXBsZXRpb24oKS4KPiBUaGF0IGlzLCBp
bml0IHRocmVhZCBnbyBzbGVlcCB3aXRoIGEgd3JpdGUgc2VtYXBob3JlLgo+IAo+IGYyZnNfZGlz
Y2FyZCB0aHJlYWQgaXMgdGhlbiB3YWtlbiB1cCB0byBwcm9jZXNzIGYyZnMgZGlzY2FyZC4KPiBI
b3dldmVyLCBmMmZzX2Rpc2NhcmQgdGhyZXNob2xkIG1heSB0aGVuIGhhbmcgYmVjYXVzZSBmYWls
aW5nIHRvIGdldCB0aGUgc2VtYXBob3JlIGFsZWFkeSBvYnRhaW5lZCBieSB0aGUgc2xlcHQgaW5p
dCB0aHJlYWQ6Cj4gICAgICAgICBpc3N1ZV9kaXNjYXJkX3RocmVhZCgpIC0tPiBzYl9zdGFydF9p
bnR3cml0ZSgpIC0tPnNiX3N0YXJ0X3dyaXRlKHNiLCBTQl9GUkVFWkVfRlMpIC0tPiBwZXJjcHVf
ZG93bl9yZWFkKCkKPiAKPiBMaWdodAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

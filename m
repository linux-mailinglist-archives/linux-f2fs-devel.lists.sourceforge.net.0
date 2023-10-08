Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA07BCCCD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Oct 2023 08:45:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qpNXt-0007pc-GD;
	Sun, 08 Oct 2023 06:45:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qpNXr-0007pW-Es
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Oct 2023 06:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BtMVVKmVF/VhNDgIHB/iA6nn99dkXeEv6Yigl/d2XsI=; b=jc8ASYUl0sXvjW2YJ0eaQFLxEd
 dkxbd/fUF40pqrJYZso4TM7ZaWwIC6U4GAKUL3Ec2Q8AxFi/F6WlZksI0oamqVQRCls/VVwgVx2LT
 dc3vI25/D3CTFW5zuakafrB5/nbx90RPCkPo9xzNVNuB/JuIyEh8/KIi2QOWbEcfKNBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BtMVVKmVF/VhNDgIHB/iA6nn99dkXeEv6Yigl/d2XsI=; b=XTVih3ZbMyY/mnCa8FoQbCBnvb
 q/3oHSkatpvZTBEjZw6M918pyCT6EypbqohNCcHLpAXDt9L7asjzjzpaz003ZjIPzcZn/aPFRPF+T
 hbL4DApDFOCyVEen9S68Jh6laPngHxL7KGF8LVfiH0rWlMgjJadbCyd1qIu285hBotJE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qpNXr-0001e8-3o for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Oct 2023 06:45:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4E770CE0932;
 Sun,  8 Oct 2023 06:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F4EC433C8;
 Sun,  8 Oct 2023 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696747526;
 bh=aGUrIGhMjQ4lqqxxo4ZUqNOeGyCyNisynIIZPZFYgLg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cLKAoUegqoILOOVFAy4Fm8sIscMh4Phx/priQWRS0inF0tJ8CvJCF9MJIDYkp12ie
 fvO/CvWaiWJCsSw1ferm2K3Kxiq6uSRffgLjzV/L9EYqsc4XCRemfE4K2gx1eA7vLY
 WtAjyQXcQNRdpChjECLBwnUegaPh/c6c3c5HDvC8yidzJorNQESI5Q13A8cOfPOsca
 rOLWMhVLtPVlT3K8fC7yJOJlHUoG1vrYucZr7/6dMOEviTUZghWYo2k0VDBiLNkIVh
 PlyHx4nEKOcKdfqr3Pr2qRfWdjX/Btsieg6m0EGQUanahHQ9JzKSQd7lglW/vv4Qc9
 pex8RwOnHzpdQ==
Message-ID: <88b26dc7-93c6-5c96-1bf8-2c2c320f3247@kernel.org>
Date: Sun, 8 Oct 2023 14:45:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Su Hui <suhui@nfschina.com>, jaegeuk@kernel.org
References: <20231008063929.538425-1-suhui@nfschina.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231008063929.538425-1-suhui@nfschina.com>
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/10/8 14:39, Su Hui wrote: > With gcc and W=1 option,
    there's a warning like this: > > fs/f2fs/compress.c: In function ‘f2fs_init_page_array_cache’:
    > fs/f2fs/compress.c:1984:47: error: ‘ [...] 
 
 Content analysis details:   (-4.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qpNXr-0001e8-3o
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid format-overflow warning
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy8xMC84IDE0OjM5LCBTdSBIdWkgd3JvdGU6Cj4gV2l0aCBnY2MgYW5kIFc9MSBvcHRp
b24sIHRoZXJlJ3MgYSB3YXJuaW5nIGxpa2UgdGhpczoKPiAKPiBmcy9mMmZzL2NvbXByZXNzLmM6
IEluIGZ1bmN0aW9uIOKAmGYyZnNfaW5pdF9wYWdlX2FycmF5X2NhY2hl4oCZOgo+IGZzL2YyZnMv
Y29tcHJlc3MuYzoxOTg0OjQ3OiBlcnJvcjog4oCYJXXigJkgZGlyZWN0aXZlIHdyaXRpbmcgYmV0
d2Vlbgo+IDEgYW5kIDcgYnl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gNSBhbmQg
OAo+IFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1dCj4gICAxOTg0IHwgIHNwcmludGYoc2xhYl9u
YW1lLCAiZjJmc19wYWdlX2FycmF5X2VudHJ5LSV1OiV1IiwgTUFKT1IoZGV2KSwKPiAJCU1JTk9S
KGRldikpOwo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBefgo+IAo+IFN0cmluZyAiZjJmc19wYWdlX2FycmF5X2VudHJ5LSV1OiV1IiBjYW4g
dXAgdG8gMzUuIFRoZSBmaXJzdCAiJXUiIGNhbiB1cAo+IHRvIDQgYW5kIHRoZSBzZWNvbmQgIiV1
IiBjYW4gdXAgdG8gNywgc28gdG90YWwgc2l6ZSBpcyAiMjQgKyA0ICsgNyA9IDM1Ii4KPiBzbGFi
X25hbWUncyBzaXplIHNob3VsZCBiZSAzNSByYXRoZXIgdGhhbiAzMi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBTdSBIdWkgPHN1aHVpQG5mc2NoaW5hLmNvbT4KCkxvb2tzIGdvb2QgdG8gbWUsIHRoYW5r
cyBmb3IgdGhlIHBhdGNoLgoKUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4K
ClRoYW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==

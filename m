Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C153B69296A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Feb 2023 22:40:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pQb8A-0006qH-3c;
	Fri, 10 Feb 2023 21:40:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pQb89-0006qB-9r
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 21:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wcQo/laCUM4UZB+jBRFzIDADCyR+uiwHgW6NB4rI/ko=; b=G7VOfKWG544dBpM/80TheeHyDu
 gV2riFPVwD88ATMXCNXMS9fTyQXkpkM6lBMvwYPcbKFEZtocdUAxhY83Y+3eV1MxPvAVZB5ZEJVbo
 J/8q1jEtXscWH071XoXV2tpmjb19aql85e2NSF4EUB6RSzzeNIBGbBwESrEjsplm9KA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wcQo/laCUM4UZB+jBRFzIDADCyR+uiwHgW6NB4rI/ko=; b=cKpZuCChT38OaTb830JxKrhDeq
 jg1Nyb638kuchZ5qLsd+MaNc/j58O/qdktWbyF91+dzDaumzOeP/gE0hxxET3lqWabRAz5Y7tuPAo
 z7+w+Pf9FlSoUu74x2GgESN+DN/iM9QiMhJ+rihqmRRSjG/hIEHvZk3WFBDQHa6eyTeI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pQb87-00HaTi-Sm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 21:40:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2CBF4B825E6;
 Fri, 10 Feb 2023 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3EA8C433D2;
 Fri, 10 Feb 2023 21:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676065217;
 bh=NObY+KuoP7Q6hH83bq+sCb02XrbExn08QoALMeMctbY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=RV0I4RGZk3IyH03FS/mAq9oujHCIoG98Anxz8lZEglH2zWbo4Bt9HA97C2i7AI8zh
 0xLEepV2SrrCcG1rc+Ef3XqwJOoEsKJFlp0MVW5q05fd4zM2zIOinu1Co6ljj7CfaV
 M3PVytEQC9sbU1PI92wbQX8HpOLho1JGE2DxGflSFfrOiGS33+6CWuUJC5pGKVlCs3
 xzzAsXZ8W61g6PEtAJX1R6qCVVBvhKJe34ixhvUqkBzrMD/dRnzAf1WDz4VB4KyHMY
 8BwqZfSgVEHPVf7+ANxIJP7v2KSi3KA0x8+HVF0SN0snEVApqtuijY68TzbdJem66B
 0WpCsLtAmnJ1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 ABB25E55F00; Fri, 10 Feb 2023 21:40:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167606521769.8706.16031363509228076615.git-patchwork-notify@kernel.org>
Date: Fri, 10 Feb 2023 21:40:17 +0000
References: <20230209-kobj_type-f2fs-v1-1-b6feedbdd4a8@weissschuh.net>
In-Reply-To: <20230209-kobj_type-f2fs-v1-1-b6feedbdd4a8@weissschuh.net>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Clinux=40weissschuh=2Enet=3E?=@ci.codeaurora.org
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 09 Feb 2023 03:20:10 +0000 you
 wrote: > Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
 > the driver core allows the usage of const struct kobj_type. > > Take
 advantage of [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pQb87-00HaTi-Sm
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIGphZWdldWsvZjJmcy5naXQgKGRldikK
YnkgSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz46CgpPbiBUaHUsIDA5IEZlYiAyMDIz
IDAzOjIwOjEwICswMDAwIHlvdSB3cm90ZToKPiBTaW5jZSBjb21taXQgZWU2ZDNkZDRlZDQ4ICgi
ZHJpdmVyIGNvcmU6IG1ha2Uga29ial90eXBlIGNvbnN0YW50LiIpCj4gdGhlIGRyaXZlciBjb3Jl
IGFsbG93cyB0aGUgdXNhZ2Ugb2YgY29uc3Qgc3RydWN0IGtvYmpfdHlwZS4KPiAKPiBUYWtlIGFk
dmFudGFnZSBvZiB0aGlzIHRvIGNvbnN0aWZ5IHRoZSBzdHJ1Y3R1cmUgZGVmaW5pdGlvbnMgdG8g
cHJldmVudAo+IG1vZGlmaWNhdGlvbiBhdCBydW50aW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KPiAKPiBbLi4uXQoKSGVyZSBp
cyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gW2YyZnMtZGV2XSBmMmZzOiBtYWtlIGtvYmpf
dHlwZSBzdHJ1Y3R1cmVzIGNvbnN0YW50CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2phZWdl
dWsvZjJmcy9jLzY2M2JiMjNjYzFhYwoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApE
ZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3Bh
dGNod29yay9wd2JvdC5odG1sCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

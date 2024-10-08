Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D44D994E6B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Oct 2024 15:17:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1syA5D-0001Vc-Qs;
	Tue, 08 Oct 2024 13:16:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Markus.Elfring@web.de>) id 1syA5C-0001VO-Fr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 13:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=adxgRSJOkFGPFpFSyKuJM1pQeF57D1d9SQt+490tSoM=; b=aZ+eZkVlbqpxwr6XQjFufjeEnY
 fv4bYHqHKRrdP/h18k2mGUVgED6i4W0SxHz75B6JAh9rHccKcxMDYHwWZbtZnGvv/uAPIztgLdK2a
 Mr8Thqzd3Ve5QuniMpMyto8ju6haBiyzKPK9LZWBzPsAtJEoidGjv4iSS8TplN6lnVLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=adxgRSJOkFGPFpFSyKuJM1pQeF57D1d9SQt+490tSoM=; b=dKIiVUdBztNlWDEB32Sr6WQqDK
 ewS1r3CaLof2C8JEQ2jec2F0A0R0xHDVBH3SaYHYXdLDkSdtPnYJdTsjCnFnLiG1c8yFctXhjEHDP
 IgXCRZan/tChgJSoUrI7yvCuruxEk6QrQd7DOQq/6crY36uNY8Sg5oSothURDxTlfgRs=;
Received: from mout.web.de ([212.227.17.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1syA5A-0002H6-WB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 13:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1728393399; x=1728998199; i=markus.elfring@web.de;
 bh=adxgRSJOkFGPFpFSyKuJM1pQeF57D1d9SQt+490tSoM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dj9LzXPbqmbhBrfkURWkmkvpJY8rtnYCjgJy2eKzZb+GH0Sx9UvFiVEDzOTbE8mY
 VuuiIaikDVYqq5gFqEUHLZp3kGOlL6mDVX+telrt9d9s1CyF6Nlq4NwOFxtUBHwnN
 cR5heYOjPJ2AVQFgzlOG4DLQlreUPEBv7rhF3zh3hHNbJMGop9gNbdBBNsdPUGlQU
 C9Qj3os0QZaF+UYfJfuGobUlmayniAeykyCSqo/+Md8D3RMMIZqDxxm9MEjcTxseQ
 9k/f6S4Bn+By3iN6xtjp+JO+4YAYcLofWTJeWoPZhMYdCXqJjOnP3aJwaQ2p70V0H
 noo/VnfA+DkoqqEUhA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MSZM3-1tQWr81oRV-00SOx8; Tue, 08
 Oct 2024 15:16:39 +0200
Message-ID: <4366efe2-89cc-45bf-9d51-04a2afd2783e@web.de>
Date: Tue, 8 Oct 2024 15:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yonggil Song <yonggil.song@samsung.com>,
 linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>,
 Daejun Park <daejun7.park@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Siwoo Jung <siu.jung@samsung.com>
References: <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
Content-Language: en-GB
In-Reply-To: <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
X-Provags-ID: V03:K1:pbgt8tsSEsd8luFTcv8T1w/ipDMyxIIq8nNIyLdvDS+reGScQ1U
 tUykC3c29eOiFX6FFtSqZseji7fwMUBMPuC93nXcSFqd7q8G2eXJUtnbqBeMgsTS7TA1AcB
 ZA9YHEZAdWMzSeJl8D234ptXjg5Gov6mu+U9N7UPbiMdHogcwkXPmbhBMjzDUtB0YkkbyVe
 bLuEwTxw6Dmyy1K5paQOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uDqyZAkOSHM=;d0g+TTEd8ZBVUEmjALxmfNEExoq
 dbOPl10LTsHJt3rBtAqSiI9pF/vwJd09d+7P73/UegAf29UfhAU+1jR4DJyCqv2EZk1RBiK8s
 +wGvEvXuNmT8HVyPoDAQObNz7BVfJomIslIgMtoiNxvx5DmWJmivl2BsSn+HE1HVOifpAvXWV
 158UbGeF5FJGGa6sWTx/Bc4xMrxEbETK7UfPKMbA/3l/ZiPFtMUTG11EvhJq0mFEPqsDLRZw3
 nYDmqIRzncjFOG+29DaM7SsuJM6C4Xv8CH/XPvfPPK9MGAqsVJQyc+oZs6eijhVrjdx30n2Im
 WkYhvJaDWaSy563eORu8q7G84I7UnOdegygpmoPgky2Yc+w/GyomhvExGycgcAPH5jfok6TYJ
 YpBcpa2rUTR+rqzpH7a4U8ppL5J2h54PZms0SYcYg8Yr2ek+loUJAtudHWBWyP0HFrZAXXRR6
 CIPz1fRqk57sR1SqXwybP1jj/tpihJfVxhfy6pEhTDoUye4N6AwzhAK4iHku8yaTmDF3vZK23
 4aR1G/wKB7bqKWEB3aNPGZFzVh9d72h8BGlRjMkXGhTo2vZl3p2CZr21A28XBggcjc9+JCoRQ
 8c3fTRcbjqUjCryuZjkfuQjNhz3MlX897WMzk7/ONEzPMr2CcXM0JMTSUWMrZq5Bok3rdMV7h
 1gb9t28hh1HIQnBxG6iWgp3Mp1Qgaiv5Jy+oHqNAn8WCljW0IoZhBzFvJmQoF06DEIziUB1c7
 XRavrD5GM70gqrdrOOzpDR0jmkbfPaAIWQAdmkTXV6aPq4SgBFFDDG0KMkJWBIPLQjuwOQUUH
 Zby0ypSEldgcVHtOFTg5qVuQ==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  … > This patch fixes the bug by … * How do you think about
    to choose another imperative wording for an improved change description?
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitti
    [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [212.227.17.12 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [markus.elfring[at]web.de]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1syA5A-0002H6-WB
Subject: Re: [f2fs-dev] [PATCH] libf2fs: Fix calculation of usable segments
 for single zoned
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
From: Markus Elfring via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

4oCmCj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgYnVnIGJ5IOKApgoKKiBIb3cgZG8geW91IHRoaW5r
IGFib3V0IHRvIGNob29zZSBhbm90aGVyIGltcGVyYXRpdmUgd29yZGluZwogIGZvciBhbiBpbXBy
b3ZlZCBjaGFuZ2UgZGVzY3JpcHRpb24/CiAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9w
cm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aD12Ni4xMi1yYzIjbjk0CgoqIFdvdWxkIHlv
dSBsaWtlIHRvIGFkZCBhbnkgdGFncyAobGlrZSDigJxGaXhlc+KAnSBhbmQg4oCcQ2PigJ0pIGFj
Y29yZGluZ2x5PwoKClJlZ2FyZHMsCk1hcmt1cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

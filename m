Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D78188C62F7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 10:41:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s7AC9-0005ha-4w;
	Wed, 15 May 2024 08:41:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Markus.Elfring@web.de>) id 1s7AC2-0005gc-Pr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 08:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xKx1iBJVQyE6OY0pKYJKieZw+LeNvRWeQ9CDr99sWSc=; b=jo+VQt7XEO5e+hdJIKV3jJDrBL
 pm33YXbG1Ra851ZVM+aInRsVdLId618tiNJlN4123fAcDo03Q8toWO4yBfBYaiTrLOejP5BR2rwAF
 Xx5VxlxrFei7DVqdIPfnpncFvOSBLfidn566VdeSO0WTbzbJ1qwVxDv3kWRyPgjw6UcU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xKx1iBJVQyE6OY0pKYJKieZw+LeNvRWeQ9CDr99sWSc=; b=NnPhUdSxAgUjyE3Qiou3oJVdoj
 af0BoNXGZKNcToe4bII5l/kn1EZauDcfbUipHZifZJM+FyuXL8OZJ0atLyOPFGY2XBI3dTqa0mDwO
 eZgVzopZI0dkCOCPN138l6YBwPnqkT4fi+sUFfsJg8oIwuv/IFVMkGMB5QKi/u6G9UJM=;
Received: from mout.web.de ([212.227.15.4])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s7AC1-0008EH-Rk for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 08:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1715762444; x=1716367244; i=markus.elfring@web.de;
 bh=xKx1iBJVQyE6OY0pKYJKieZw+LeNvRWeQ9CDr99sWSc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=C6h/Jon33+0EU1N6EeDXSJy7wEm2/I1k9XKW9c/m97lfPA9h8moFiEphCdri6tGz
 Ss/MLA2VZr/Q2A5gdWBn6m4/B73gztikDT4vLwLb5Ht0+K67GK3YGMeaJ9MfP2CjR
 nrdQKEmBG/7CT1S1zn6XIpfsnQWz95DuZcb/v4Or+Oi7Q46X8k6U0y9yeKjvasAbU
 3ayfggtzUkwK5hq8OeuRWFm69upuxkbCIVrM9OnwUn8xAfyQM57FH6gl01KeonGd0
 fIxBRSOLItDyQ//zQ5Z4+rc1FBHNs8aIZmvyPa3xkIy8eXEPdZnnhSsSPpTwOl7QE
 mUDWp74EYnIIcUVRXg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M9qcr-1sAiQo3xHZ-005v2U; Wed, 15
 May 2024 10:40:43 +0200
Message-ID: <883f3203-4881-47d7-92d8-dcee8872823f@web.de>
Date: Wed, 15 May 2024 10:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-janitors@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240510023906.281700-1-chao@kernel.org>
Content-Language: en-GB
In-Reply-To: <20240510023906.281700-1-chao@kernel.org>
X-Provags-ID: V03:K1:WoBp+pQNsbGtn0uCXtam8f96hQPzjewAWmYVhOx0rogxOsKmmFY
 hZEIjxz4LrRRXwBGULJvaRzdbN6xqhQB+7X/nOBvoz3pt1JEXn1cDKKR2kYEk3miK7uLBZL
 REMr5o9T+Sf6AQ3QssJiPHYNrTh/Sf7xCf3XPbVF/e5WE4UrMDZZOnPZIXBaU2hBGqh13IW
 DBEgUT/M+07m5hIM5letQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5Q+5dyLui7Q=;Pu/hzCEAK2wZaw3m44gO/txjITZ
 8ZXO/XH98YoduNOvl39j++MuPwEMlksc9/ye3idq3SywHkvN4oy4CN4Mn6gpzKPyGs464Ioak
 o9d5zFDZI3TPfKSeQL2KnoBfjtt7ExCEz4Os6fyx6HUWRlSWQRueUkohRyz5EY3c7iUjXG/0t
 Xn0vMJcSnZVLdemBzSNqhmp1ejUohp04b3O2M8uAxPhyuhOy+c31oLPHTaAKy/dMf3V47FSAz
 rgeioCrhcsdeInopYWXrP9BAi3OWhtI7eNBaVpXghidJE5ZZ/VwLRYHVQdHflOCN58aA4Yw/3
 kZJeQ3yyuAkCbQKf+3JReV+M7sSVkpzHipAaaef004o/bDIAtTfcObduJwhtt+y/v+3zFk8pR
 3ORwy/gLhVlZSQ9BIXypXmgHlhetSxRpj6v4JipmX+kKIm4M1dBUvGgN6qW5XvMZziYoWyLB9
 S4C/HsyBF+TJOPCUIecGRLy6LIQhERxH5iGvVSB3E6S5aHpEqxl87sLMSUTP5f1aC+D2FsJdZ
 6evj2iFsX0rM5PkcOKhS9eYGgmcZ6lkEuN2Aeia6tdnCH5tMGVGGAFndAFwAc94DCiLFKskMz
 NJpMuRiTykELBxPEDbYpq73CnwObaKq7HkundIFtBpc+OjgiAoC52JpxPz5WurRQ7/p1+XBE6
 uA9d7j6kRxfw1tEEwOoxzrpM0UULD3D8tq9uxiusZ1lckyTq+xMQbKFWNk2B7kKCWgXExAKTI
 AYwzFNM7q+6ecniWPCmh5PdRguGzKxyfxW0td7uTfxo0Xzf5ivAjQNYNEeQB9f7e6aLIrvEq5
 C0cB24La4Gc5FXddD/2tA582J8UBntgyPBft2WGxtjTdU=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  … > This patch introduces a new … Please choose a corresponding
    imperative wording for an improved change description. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rs
    [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [212.227.15.4 listed in wl.mailspike.net]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [212.227.15.4 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [markus.elfring[at]web.de]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1s7AC1-0008EH-Rk
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid racing in between read
 and OPU dio write
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
Cc: LKML <linux-kernel@vger.kernel.org>, Wu Bo <bo.wu@vivo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

4oCmCj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IOKApgoKUGxlYXNlIGNob29zZSBhIGNv
cnJlc3BvbmRpbmcgaW1wZXJhdGl2ZSB3b3JkaW5nIGZvciBhbiBpbXByb3ZlZCBjaGFuZ2UgZGVz
Y3JpcHRpb24uCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5n
LXBhdGNoZXMucnN0P2g9djYuOSNuOTQKClJlZ2FyZHMsCk1hcmt1cwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

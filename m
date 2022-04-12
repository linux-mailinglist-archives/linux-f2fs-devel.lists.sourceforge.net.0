Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB484FDDA0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 13:28:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neEgn-00048C-5K; Tue, 12 Apr 2022 11:28:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1neEgk-00047x-Rq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cYon+FDgndtgnkAW1YwWpaCP4Q/K8Kl6PJ70UghFXQ4=; b=jE0XVaUzCg41KyaBpKWo68HGjw
 30txZUSL3uAj9h7T8endj+UqKUlXoD692FL1SKAC79K7DmeXlpN45r718BrU0fPsg8xnNlvkbPHPJ
 JtxlTNWHz1iDj6JmqaQeXTcg7v3TwQM4QS5gB8my8B5BawxyECagjNv/B7r71TK3PodI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cYon+FDgndtgnkAW1YwWpaCP4Q/K8Kl6PJ70UghFXQ4=; b=T
 ItgsAfvRtyPnpt+vLn0qqUUUUcYltoA6jFPnXm2Rjz+IgCkHKYB8h1WS827LkYZe+LXgjimiYf72d
 sHBH0wlAwN6jzjo8IfFUHxrl0L7nKLQA22CRIO5qn6T330ZdaEb/fqAUsyF8I0ydXqPqIE86ElXVy
 bEKcJoxnFDHEJQ10=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neEgf-00Dy1m-3s
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:28:01 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220412112747euoutp01643c086b852baf45884ed86a904c95d4~lIpY1hQ500064500645euoutp01F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Apr 2022 11:27:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220412112747euoutp01643c086b852baf45884ed86a904c95d4~lIpY1hQ500064500645euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649762867;
 bh=cYon+FDgndtgnkAW1YwWpaCP4Q/K8Kl6PJ70UghFXQ4=;
 h=From:To:Cc:Subject:Date:References:From;
 b=S4AzqfgqyqDsCAnAoQ5Nx5tpSIX+gpcU+e6Sqljep+3Rc5/x6d0hF8n1YDBOtEhN2
 84tw8CbIRnQAY5fu+6MgwWa4qlx5db1LAAZRfXwDT/giXh4KRSxnGUVNaDbmMY1njO
 uRsfaK9c/HvlXv9X//C6gG1WvxeJIzHrIRDaglM4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220412112746eucas1p145a9688edb742b101117c673c3e03c0e~lIpYh0z0W1426114261eucas1p1o;
 Tue, 12 Apr 2022 11:27:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8D.D7.10009.23265526; Tue, 12
 Apr 2022 12:27:46 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad~lIpYKCFLp1689016890eucas1p1J;
 Tue, 12 Apr 2022 11:27:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220412112746eusmtrp2b3a17872394d56a2fac691883053edfd~lIpYJP2Iw1314913149eusmtrp2M;
 Tue, 12 Apr 2022 11:27:46 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-aa-625562324d75
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B6.79.09404.23265526; Tue, 12
 Apr 2022 12:27:46 +0100 (BST)
Received: from localhost (unknown [106.210.248.108]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220412112745eusmtip1e1fcc8d492e8f8143cd787ff15100f76~lIpX2WS_o0423404234eusmtip17;
 Tue, 12 Apr 2022 11:27:45 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 12 Apr 2022 13:27:42 +0200
Message-Id: <20220412112745.44108-1-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djP87pGSaFJBps3q1q0tn9jsnh85zO7
 xdH/b9ksLi1yt7gx4SmjxeelLewWa24+ZXFg99g56y67x6ZVnWweuxd8ZvLo27KK0aP9QDdT
 AGsUl01Kak5mWWqRvl0CV8bahc+ZCtawVTzZ85ulgbGJtYuRk0NCwETi/ZGH7F2MXBxCAisY
 Ja49OcAI4XxhlLi0+RQbhPOZUeLX62csMC0bJ01nhkgsZ5TYf+giVNVLRom5Fy4A9XNwsAlo
 STR2soM0iACZExv+go1lFpjJKHHwxTQ2kISwQLzEpkXfwGwWAVWJpRM3MYLYvAKWEjNObGCC
 2CYvMfPSd3aIuKDEyZlPwK5gBoo3b50NdoWEwBYOicNPe1hAFksIuEg0XJCA6BWWeHV8CzuE
 LSPxf+d8qJnVEk9v/IbqbWGU6N+5ng2i11qi70wOiMksoCmxfpc+RLmjxJHf7xghKvgkbrwV
 hLiAT2LSNlA4gIR5JTrahCCqlSR2/nwCtVRC4nLTHGiweUjcXHkS7EEhgViJoyfusUxgVJiF
 5K9ZSP6ahXDDAkbmVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIGJ5vS/4592MM599VHv
 ECMTB+MhRgkOZiUR3n710CQh3pTEyqrUovz4otKc1OJDjNIcLErivMmZGxKFBNITS1KzU1ML
 UotgskwcnFINTHHSlmW+y07PCr55Myk3+PrqdJ1bLQ1PYk594dsbkXbtyWnBs4vuxN+3qFK4
 Or+Y9+07Sy9398nPXkwTWq7h9/aWjUy4/xfVzvoVxhbMk37GBhnu/+pR+bUg/uZ/fq75DALL
 jp84k/fk3uXulsqsc3+Z7rnb8G8qSZA523JxedCDVT9VD99InecdELvmVMK8RZYVnz5MOOV9
 99nU3wf0A1tXv7AoCrwkyvr20oK04v7cKIf0IGeHzkOSTlyT6yNvX0ov++t81Cwi6f21ic5V
 D0KVUyZk1uq48xxervLn3tywJ0u+6vFNk5aq/iAmWXdu9taGGo3bzwreL/tXdt78UXxw/FfH
 UwynnE991sr/EqbEUpyRaKjFXFScCAC6mLIjowMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsVy+t/xu7pGSaFJBpMu8Vq0tn9jsnh85zO7
 xdH/b9ksLi1yt7gx4SmjxeelLewWa24+ZXFg99g56y67x6ZVnWweuxd8ZvLo27KK0aP9QDdT
 AGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsba
 hc+ZCtawVTzZ85ulgbGJtYuRk0NCwERi46TpzF2MXBxCAksZJb69nMgCkZCQuL2wiRHCFpb4
 c62LDaLoOaPEhcVngBwODjYBLYnGTnaQGhEgc2LDX0aQGmaB+YwSxyZfB0sIC8RKdP6eDjaI
 RUBVYunETWA2r4ClxIwTG5ggFshLzLz0nR1kJrOApsT6XfoQJYISJ2c+AbuHGaikeets5gmM
 /LMQqmYhqZqFpGoBI/MqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwIjYduznlh2MK1991DvE
 yMTBeIhRgoNZSYS3Xz00SYg3JbGyKrUoP76oNCe1+BCjKdDVE5mlRJPzgTGZVxJvaGZgamhi
 ZmlgamlmrCTO61nQkSgkkJ5YkpqdmlqQWgTTx8TBKdXAZND9f/uBXhHnPxGWU04uPRKcdmLK
 5MV377arG+aXem7mlo8pund8xZTXvr96qpPrIwJXFoewH5mc5W5zo8Uufl4d8zOXKa3xte/3
 u6+W2vp9zqd86X//q1VmKr6V8f65sCVSJew512nXDefWn1yseeUDx4OHmvkztp7e77dqr9TT
 rnuJz6e9UrWc1icW+sd7w4cnVyOfvvFh5hOMvHDejMX7Ow/73pMfH835fHC7I9/B66vPfGmz
 PtdW1Sz/L6dweqGOPffKqYsO8kcu2Pa4/ormlaQJu3cvOHLSX6TJ6krqiecWh3lb9bVdrVN/
 sD94sPJf7znX9H8KYbMmilg8XSF1d6V35HtV9c05gsF/c9YqsRRnJBpqMRcVJwIA/c3KZRED
 AAA=
X-CMS-MailID: 20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad
X-Msg-Generator: CA
X-RootMTR: 20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad
References: <CGME20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad@eucas1p1.samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS only works for zoned devices with power-of-2 zone sizes
 as the f2fs section needs to be a power-of-2. At the moment the linux kernel
 only accepts zoned devices which are power-of-2 as block devices but there
 are zoned devices in the market which have non power-of-2 zone sizes. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1neEgf-00Dy1m-3s
Subject: [f2fs-dev] [PATCH 0/3] f2fs-tools: return error for zoned devices
 with non power-of-2 zone size
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, Damien.LeMoal@wdc.com,
 pankydev8@gmail.com, mcgrof@kernel.org, javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS only works for zoned devices with power-of-2 zone sizes as the
f2fs section needs to be a power-of-2.

At the moment the linux kernel only accepts zoned devices which are
power-of-2 as block devices but there are zoned devices in the market
which have non power-of-2 zone sizes.

As a proactive measure, this patchset adds a check to return error
from mkfs and fsck for zoned devices with non power-of-2 zone sizes.

Luis Chamberlain (3):
  libf2fs_zoned: factor out helper to get chunk sectors
  libf2fs: add support to report zone size
  libf2fs: don't allow mkfs / fsck on zoned NPO2

 include/f2fs_fs.h   |  1 +
 lib/libf2fs.c       | 17 +++++++++++++++--
 lib/libf2fs_zoned.c | 32 ++++++++++++++++++++++----------
 3 files changed, 38 insertions(+), 12 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

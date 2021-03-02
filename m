Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB8D3296FE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 09:45:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lH0en-0007Yo-SY; Tue, 02 Mar 2021 08:45:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lH0el-0007Xw-8x
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 08:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tjPk8xLgadw1iHyaQbsgWxT9AgdacJP3jUVHxEK6vQw=; b=ag4sV5Qx847feMLzBEnCJl/fra
 0QxL0qHMgtHAqVOIfUZWyy9Csy6XzzXfjyfGYWqI67VZEAclTXLMe+XcMZwgS5rCbHhb+kzZr+FdQ
 lRp8792hkdDZiQUU/GbKthv65yqMgiLcjcxLMpzxX8DQQk2rVDC+z67l0coQawW6XdfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tjPk8xLgadw1iHyaQbsgWxT9AgdacJP3jUVHxEK6vQw=; b=K
 q8jJ7KaVnsGSJAyH7Qm0UsVvPKwewswySwujw9XA+AOd24QxXy/xJB+W5ofrCC/t6twVOZoo94sfE
 SktmpMYHMQhbfp+vLKB4jJF5s/CWJ2sd851KerH7Aavax6ZSLUGNnq8Ydip8nDuELPqxFtoj/ZuU0
 BpEXXboqOwEw6tZ0=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lH0ee-0003YR-RD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 08:45:27 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DqVyF3N21zMh6R;
 Tue,  2 Mar 2021 16:43:01 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Mar 2021 16:45:01 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 2 Mar 2021 16:44:58 +0800
Message-ID: <20210302084458.15077-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lH0ee-0003YR-RD
Subject: [f2fs-dev] [PATCH] f2fs: fix compile warning
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

bm9kZS5jOiBJbiBmdW5jdGlvbiDigJhmMmZzX3Jlc3RvcmVfbm9kZV9zdW1tYXJ54oCZOgouL2lu
Y2x1ZGUvbGludXgvbWlubWF4Lmg6MTg6Mjg6IHdhcm5pbmc6IGNvbXBhcmlzb24gb2YgZGlzdGlu
Y3QgcG9pbnRlciB0eXBlcyBsYWNrcyBhIGNhc3QKICAoISEoc2l6ZW9mKCh0eXBlb2YoeCkgKikx
ID09ICh0eXBlb2YoeSkgKikxKSkpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCi4vaW5j
bHVkZS9saW51eC9taW5tYXguaDozMjo0OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCY
X190eXBlY2hlY2vigJkKICAgKF9fdHlwZWNoZWNrKHgsIHkpICYmIF9fbm9fc2lkZV9lZmZlY3Rz
KHgsIHkpKQogICAgXgouL2luY2x1ZGUvbGludXgvbWlubWF4Lmg6NDI6MjQ6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybyDigJhfX3NhZmVfY21w4oCZCiAgX19idWlsdGluX2Nob29zZV9leHBy
KF9fc2FmZV9jbXAoeCwgeSksIFwKICAgICAgICAgICAgICAgICAgICAgICAgXgouL2luY2x1ZGUv
bGludXgvbWlubWF4Lmg6NTE6MTk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2Nh
cmVmdWxfY21w4oCZCiAjZGVmaW5lIG1pbih4LCB5KSBfX2NhcmVmdWxfY21wKHgsIHksIDwpCiAg
ICAgICAgICAgICAgICAgICBeCm5vZGUuYzoyNzUwOjEzOiBub3RlOiBpbiBleHBhbnNpb24gb2Yg
bWFjcm8g4oCYbWlu4oCZCiAgIG5ycGFnZXMgPSBtaW4obGFzdF9vZmZzZXQgLSBpLCBCSU9fTUFY
X1BBR0VTKTsKClVzZSBtaW5fdCgpIHJhdGhlciB0aGFuIG1pbigpIHRvIGRvIHR5cGUgY2FzdCBi
ZWZvcmUgY29tcGFyaW5nLgoKU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWku
Y29tPgotLS0KIGZzL2YyZnMvbm9kZS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL25vZGUuYyBiL2Zz
L2YyZnMvbm9kZS5jCmluZGV4IGE4YTBmYjg5MGU4ZC4uNzdmOWZmYWY5YjhlIDEwMDY0NAotLS0g
YS9mcy9mMmZzL25vZGUuYworKysgYi9mcy9mMmZzL25vZGUuYwpAQCAtMjc0Nyw3ICsyNzQ3LDgg
QEAgaW50IGYyZnNfcmVzdG9yZV9ub2RlX3N1bW1hcnkoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LAogCXN1bV9lbnRyeSA9ICZzdW0tPmVudHJpZXNbMF07CiAKIAlmb3IgKGkgPSAwOyBpIDwgbGFz
dF9vZmZzZXQ7IGkgKz0gbnJwYWdlcywgYWRkciArPSBucnBhZ2VzKSB7Ci0JCW5ycGFnZXMgPSBt
aW4obGFzdF9vZmZzZXQgLSBpLCBCSU9fTUFYX1BBR0VTKTsKKwkJbnJwYWdlcyA9IG1pbl90KHVu
c2lnbmVkIGxvbmcsIGxhc3Rfb2Zmc2V0IC0gaSwKKwkJCQkJCUJJT19NQVhfUEFHRVMpOwogCiAJ
CS8qIHJlYWRhaGVhZCBub2RlIHBhZ2VzICovCiAJCWYyZnNfcmFfbWV0YV9wYWdlcyhzYmksIGFk
ZHIsIG5ycGFnZXMsIE1FVEFfUE9SLCB0cnVlKTsKLS0gCjIuMjkuMgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

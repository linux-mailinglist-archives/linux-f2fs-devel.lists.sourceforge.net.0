Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8B59AC700
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 11:52:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3Y2T-0006BS-Bn;
	Wed, 23 Oct 2024 09:52:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zengheng4@huawei.com>) id 1t3Y2R-0006BE-Kf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 09:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VNQYZTbEKyBt7EIfxQ0iqCIN7CIrh+lPBUOxl363PHs=; b=jHPdXMEENtutTNhgxnpUJ9cLd0
 F47LxTnMr5erSdGXd0oxeuFQRLlOm0CNj9oFXzCsrbxLZIsQdodXtZsWaNKh+GzgH4o63oNIXybiL
 uBh9V0H6NdfM0wnSRjWnTxlqv03IXwn335Ztkvzjz5JSSp7bxNDx/JmtQYMFAgyA7pMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VNQYZTbEKyBt7EIfxQ0iqCIN7CIrh+lPBUOxl363PHs=; b=i
 NfpypqgqjiGGuHdGvi8P1n4TYZE0j0UB9rcithch+f7EgRrbmVM0ct1hTZxHiwVSg1fAX+jIfp3bB
 JRpnei7ZwFCXNad09X2s33YZeMzeQeiNFJ+2BKon1/RVPl3hmVG1TJtjSHNqWwGI2YjxGb2U/sb2h
 1rQK3aeVKQzTfc00=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3Y2Q-00071M-J3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 09:52:24 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XYP3h6y1Yz10Nvh;
 Wed, 23 Oct 2024 17:33:04 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
 by mail.maildlp.com (Postfix) with ESMTPS id D28BE14039F;
 Wed, 23 Oct 2024 17:35:06 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 23 Oct
 2024 17:35:06 +0800
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Wed, 23 Oct 2024 17:48:50 +0800
Message-ID: <20241023094850.1680709-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Fix the following compilation warning: fs/f2fs/data.c:2391:10:
    warning: variable ‘index’ set but not used [-Wunused-but-set-variable]
    2391 | pgoff_t index; Only define and set the variable index when the CONFIG_F2FS_FS_COMPRESSION
    is enabled. 
 
 Content analysis details:   (-2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [45.249.212.187 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [45.249.212.187 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t3Y2Q-00071M-J3
Subject: [f2fs-dev] [PATCH] f2fs: Fix not used variable 'index'
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
From: Zeng Heng via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zeng Heng <zengheng4@huawei.com>
Cc: bobo.shaobowang@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Rml4IHRoZSBmb2xsb3dpbmcgY29tcGlsYXRpb24gd2FybmluZzoKZnMvZjJmcy9kYXRhLmM6MjM5
MToxMDogd2FybmluZzogdmFyaWFibGUg4oCYaW5kZXjigJkgc2V0IGJ1dCBub3QgdXNlZApbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KIDIzOTEgfCAgcGdvZmZfdCBpbmRleDsKCk9ubHkgZGVm
aW5lIGFuZCBzZXQgdGhlIHZhcmlhYmxlIGluZGV4IHdoZW4gdGhlIENPTkZJR19GMkZTX0ZTX0NP
TVBSRVNTSU9OCmlzIGVuYWJsZWQuCgpGaXhlczogZGI5MmU2YzcyOWQ4ICgiZjJmczogY29udmVy
dCBmMmZzX21wYWdlX3JlYWRwYWdlcygpIHRvIHVzZSBmb2xpbyIpClNpZ25lZC1vZmYtYnk6IFpl
bmcgSGVuZyA8emVuZ2hlbmc0QGh1YXdlaS5jb20+Ci0tLQogZnMvZjJmcy9kYXRhLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwppbmRleCA5NGY3YjA4NGY2
MDEuLjkyMDIwODJhMzkwMiAxMDA2NDQKLS0tIGEvZnMvZjJmcy9kYXRhLmMKKysrIGIvZnMvZjJm
cy9kYXRhLmMKQEAgLTIzODUsMTAgKzIzODUsMTAgQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3Jl
YWRwYWdlcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAogCQkubnJfY3BhZ2VzID0gMCwKIAl9OwogCXBn
b2ZmX3QgbmNfY2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVI7CisJcGdvZmZfdCBpbmRleDsKICNl
bmRpZgogCXVuc2lnbmVkIG5yX3BhZ2VzID0gcmFjID8gcmVhZGFoZWFkX2NvdW50KHJhYykgOiAx
OwogCXVuc2lnbmVkIG1heF9ucl9wYWdlcyA9IG5yX3BhZ2VzOwotCXBnb2ZmX3QgaW5kZXg7CiAJ
aW50IHJldCA9IDA7CiAKIAltYXAubV9wYmxrID0gMDsKQEAgLTI0MDYsOSArMjQwNiw5IEBAIHN0
YXRpYyBpbnQgZjJmc19tcGFnZV9yZWFkcGFnZXMoc3RydWN0IGlub2RlICppbm9kZSwKIAkJCXBy
ZWZldGNodygmZm9saW8tPmZsYWdzKTsKIAkJfQogCisjaWZkZWYgQ09ORklHX0YyRlNfRlNfQ09N
UFJFU1NJT04KIAkJaW5kZXggPSBmb2xpb19pbmRleChmb2xpbyk7CiAKLSNpZmRlZiBDT05GSUdf
RjJGU19GU19DT01QUkVTU0lPTgogCQlpZiAoIWYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkK
IAkJCWdvdG8gcmVhZF9zaW5nbGVfcGFnZTsKIAotLSAKMi4yNS4xCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

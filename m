Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB3554C257
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 09:06:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1N6U-0008WM-0J; Wed, 15 Jun 2022 07:06:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <renzhijie2@huawei.com>) id 1o1N6S-0008WC-E7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 07:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IiZ0TV99y3OPSfDVixaqoPnq5bcFCO2TOYEoEOi4aEs=; b=W3qlNBidSMlAdQsD1BfRb0RMxY
 9GVsXzXK1Ortjy7qgfFTfCOdDgQFC/UisY+ZvxnklmKXsjCgKpwgKvSbGhrgdUEJD6giO1k7BqFQv
 6tID8jNfV2Yektc7CQ/iYCCm0DOkFjjkk9EJNmJITFlnNPdsVaClLxzJoGKpXuNjgJK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IiZ0TV99y3OPSfDVixaqoPnq5bcFCO2TOYEoEOi4aEs=; b=g
 a8z4b4mgZe3PM0EY+jv6cMLiIYZynslamP4QuCXw9u27PyuQ2REMuhqeUlC2O8KxGUwm0j71dHxXz
 RHt+4fxn+urF6nSDTSmC+EsVCmy/ThvGvBeCASuXW5uvJAO3ebjr25OSbhqfDvaL9F/k+eIQDxCFO
 sJ2iQ/Qp61vrNo98=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1N6Q-002A07-7b
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 07:06:13 +0000
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LNGX653pSzjYB2;
 Wed, 15 Jun 2022 15:04:54 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 15 Jun 2022 15:05:59 +0800
Received: from huawei.com (10.67.175.34) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 15 Jun
 2022 15:05:59 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <daehojeong@google.com>
Date: Wed, 15 Jun 2022 15:04:22 +0800
Message-ID: <20220615070422.214106-1-renzhijie2@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.34]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  If CONFIG_F2FS_FS_COMPRESSION is not set. make ARCH=x86_64
    CROSS_COMPILE=x86_64-linux-gnu-, will be failed, like this: fs/f2fs/data.c:
    In function ‘f2fs_finish_read_bio’: fs/f2fs/data.c:136:5: error: too
   many arguments to function ‘f2fs [...] 
 
 Content analysis details:   (-2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [45.249.212.187 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o1N6Q-002A07-7b
Subject: [f2fs-dev] [PATCH -next] f2fs: fix build error too many arguments
 to functions
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
From: Ren Zhijie via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ren Zhijie <renzhijie2@huawei.com>
Cc: Ren Zhijie <renzhijie2@huawei.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SWYgQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJT04gaXMgbm90IHNldC4KCm1ha2UgQVJDSD14ODZf
NjQgQ1JPU1NfQ09NUElMRT14ODZfNjQtbGludXgtZ251LSwgd2lsbCBiZSBmYWlsZWQsIGxpa2Ug
dGhpczoKZnMvZjJmcy9kYXRhLmM6IEluIGZ1bmN0aW9uIOKAmGYyZnNfZmluaXNoX3JlYWRfYmlv
4oCZOgpmcy9mMmZzL2RhdGEuYzoxMzY6NTogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBm
dW5jdGlvbiDigJhmMmZzX2VuZF9yZWFkX2NvbXByZXNzZWRfcGFnZeKAmQogICAgIGYyZnNfZW5k
X3JlYWRfY29tcHJlc3NlZF9wYWdlKHBhZ2UsIHRydWUsIDAsCiAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGZzL2YyZnMvZGF0YS5jOjI1OjA6
CmZzL2YyZnMvZjJmcy5oOjQyMjg6MjA6IG5vdGU6IGRlY2xhcmVkIGhlcmUKIHN0YXRpYyBpbmxp
bmUgdm9pZCBmMmZzX2VuZF9yZWFkX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwK
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpmcy9mMmZz
L2RhdGEuYzoxMzg6NDogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJhm
MmZzX3B1dF9wYWdlX2RpY+KAmQogICAgZjJmc19wdXRfcGFnZV9kaWMocGFnZSwgaW5fc29mdGly
cSk7CiAgICBefn5+fn5+fn5+fn5+fn5+fgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gZnMvZjJmcy9k
YXRhLmM6MjU6MDoKZnMvZjJmcy9mMmZzLmg6NDIzMzoyMDogbm90ZTogZGVjbGFyZWQgaGVyZQog
c3RhdGljIGlubGluZSB2b2lkIGYyZnNfcHV0X3BhZ2VfZGljKHN0cnVjdCBwYWdlICpwYWdlKQog
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+CmZzL2YyZnMvZGF0YS5jOiBJbiBm
dW5jdGlvbiDigJhmMmZzX2hhbmRsZV9zdGVwX2RlY29tcHJlc3PigJk6CmZzL2YyZnMvZGF0YS5j
OjI0MTo0OiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRzIHRvIGZ1bmN0aW9uIOKAmGYyZnNfZW5k
X3JlYWRfY29tcHJlc3NlZF9wYWdl4oCZCiAgICBmMmZzX2VuZF9yZWFkX2NvbXByZXNzZWRfcGFn
ZShwYWdlLCBQYWdlRXJyb3IocGFnZSksCiAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gZnMvZjJmcy9kYXRhLmM6MjU6MDoKZnMvZjJmcy9mMmZz
Lmg6NDIyODoyMDogbm90ZTogZGVjbGFyZWQgaGVyZQogc3RhdGljIGlubGluZSB2b2lkIGYyZnNf
ZW5kX3JlYWRfY29tcHJlc3NlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlLAogICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cm1ha2VbMl06ICoqKiBbZnMvZjJm
cy9kYXRhLm9dIEVycm9yIDEKbWFrZVsyXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9i
cy4uLi4KbWFrZVsxXTogKioqIFtmcy9mMmZzXSBFcnJvciAyCgpTaW5jZSBjb21taXQgMWI1NjU3
MDJkZmZlICgiZjJmczogaGFuZGxlIGRlY29tcHJlc3Mgb25seSBwb3N0IHByb2Nlc3NpbmcgaW4g
c29mdGlycSIpIApoYWQgY2hhbmdlZCB0aGUgZGVmaW5pdGlvbiBvZiBmdW5jdGlvbiAiZjJmc19l
bmRfcmVhZF9jb21wcmVzc2VkX3BhZ2UoKSIgYW5kICJmMmZzX3B1dF9wYWdlX2RpYygpIiwKYnV0
IGZvcmdvdCB0aGUgb3RoZXIgZGVmaW5pdGlvbnMgaW4gZjJmcy5oIHdhcnBwZWQgYnkgI2Vsc2Ug
LyogQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJT04gKi8uCgpSZXBvcnRlZC1ieTogSHVsayBSb2Jv
dCA8aHVsa2NpQGh1YXdlaS5jb20+CkZpeGVzOiAxYjU2NTcwMmRmZmUoImYyZnM6IGhhbmRsZSBk
ZWNvbXByZXNzIG9ubHkgcG9zdCBwcm9jZXNzaW5nIGluIHNvZnRpcnEiKQpTaWduZWQtb2ZmLWJ5
OiBSZW4gWmhpamllIDxyZW56aGlqaWUyQGh1YXdlaS5jb20+Ci0tLQogZnMvZjJmcy9mMmZzLmgg
fCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCmluZGV4IGI0
MmZjY2EwMzBlMi4uMDgxMWE5MzM1ZGRlIDEwMDY0NAotLS0gYS9mcy9mMmZzL2YyZnMuaAorKysg
Yi9mcy9mMmZzL2YyZnMuaApAQCAtNDIyNSwxMiArNDIyNSwxMiBAQCBzdGF0aWMgaW5saW5lIHN0
cnVjdCBwYWdlICpmMmZzX2NvbXByZXNzX2NvbnRyb2xfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkK
IHN0YXRpYyBpbmxpbmUgaW50IGYyZnNfaW5pdF9jb21wcmVzc19tZW1wb29sKHZvaWQpIHsgcmV0
dXJuIDA7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2Rlc3Ryb3lfY29tcHJlc3NfbWVtcG9v
bCh2b2lkKSB7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2RlY29tcHJlc3NfY2x1c3Rlcihz
dHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYykgeyB9Ci1zdGF0aWMgaW5saW5lIHZvaWQgZjJm
c19lbmRfcmVhZF9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UsCi0JCQkJCQlib29s
IGZhaWxlZCwgYmxvY2tfdCBibGthZGRyKQorc3RhdGljIGlubGluZSB2b2lkIGYyZnNfZW5kX3Jl
YWRfY29tcHJlc3NlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlLCBib29sIGZhaWxlZCwKKwkJCQli
bG9ja190IGJsa2FkZHIsIGJvb2wgaW5fc29mdGlycSkKIHsKIAlXQVJOX09OX09OQ0UoMSk7CiB9
Ci1zdGF0aWMgaW5saW5lIHZvaWQgZjJmc19wdXRfcGFnZV9kaWMoc3RydWN0IHBhZ2UgKnBhZ2Up
CitzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19wdXRfcGFnZV9kaWMoc3RydWN0IHBhZ2UgKnBhZ2Us
IGJvb2wgaW5fc29mdGlycSkKIHsKIAlXQVJOX09OX09OQ0UoMSk7CiB9Ci0tIAoyLjE3LjEKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=

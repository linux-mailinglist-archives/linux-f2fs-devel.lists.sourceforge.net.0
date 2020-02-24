Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5375B16A4EC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 12:31:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6Bxk-0005ro-2T; Mon, 24 Feb 2020 11:31:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6Bxi-0005rh-Jw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EcWRobSNfgU53g+yUI6EhlM25X0u98ud7T2o7MvF97o=; b=h4jYSbGqZ4jWn1XvLcBtJhvZcH
 gzVm45cNazL74u/DK9eh6S2+LmnXZKi9/eyv+Xk38Hh1wdMp/TSKoUaO8YuSHNUpbY9kKbmLD33LT
 nypgxDxgCw6febJ/1H4CZnTwzQqjLgngZ8vnetHQxeoP2n2JKXJF8/gp1AplyvWQaMcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EcWRobSNfgU53g+yUI6EhlM25X0u98ud7T2o7MvF97o=; b=N
 lkTJpl9p8uRP+gKlCuPRBIavlWbTXWc6i90OvUiUOCc50KTbDmvITBiqBssbdwIoqT6sOraqXscP8
 uOdvYWfXjWmYnOLrOW4k3DILy2yPsySNfuqAZxFnP9PSymAYHGv0RMzZ1XamZVG1VGhSdx43e+Far
 4X9SIDfxayQbqwr8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6Bxe-00F1cR-P3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:31:46 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E6D073FB039951723EFF;
 Mon, 24 Feb 2020 19:31:32 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Feb 2020 19:31:26 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 24 Feb 2020 19:31:15 +0800
Message-ID: <20200224113115.99705-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j6Bxe-00F1cR-P3
Subject: [f2fs-dev] [PATCH] fsck.f2fs: allow --dry-run to check readonly
 mounted fs
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
Cc: megi@xff.cz, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QXMgT25kxZllaiBKaXJtYW4gPG1lZ2lAeGZmLmN6PiByZXBvcnRlZDoKCkkgd2FzIHRyeWluZyB0
byBydW46IGZzY2suZjJmcyAtLWRyeS1ydW4gL2Rldi9tbWNibGswcDIgb24gYSBSTyBtb3VudGVk
IGRldmljZSwKYW5kIGZzY2sgcmVmdXNlcyB0byBydW4uIFN0cmFjZSBzaG93cyB0aGF0IGl0IHRy
aWVzIHRvIG9wZW4gdGhlIGJsb2NrIGRldmljZQp3aXRoIE9fRVhDTCBldmVuIGluIFJPIG1vZGUs
IHdoaWNoIHdpbGwgYWx3YXlzIGZhaWwgaWYgdGhlIGJsb2NrIGRldmljZQppcyBtb3VudGVkLgoK
ZnNjay5mMmZzIC0tZHJ5LXJ1biAvZGV2L21tY2JsazBwMgpJbmZvOiBEcnkgcnVuCkluZm86IE1v
dW50ZWQgZGV2aWNlIQpJbmZvOiBDaGVjayBGUyBvbmx5IG9uIFJPIG1vdW50ZWQgZGV2aWNlCglF
cnJvcjogRmFpbGVkIHRvIG9wZW4gdGhlIGRldmljZSEKCkkgc3VnZ2VzdCBub3QgdXNpbmcgT19F
WENMIGZvciAtLWRyeS1ydW4gY2hlY2suCgpMZXQncyBjaGFuZ2UgdG8gYWxsb3cgLS1kcnktcnVu
IHRvIGNoZWNrIHJlYWRvbmx5IG1vdW50ZWQgZnMuCgpSZXBvcnRlZC1ieTogT25kxZllaiBKaXJt
YW4gPG1lZ2lAeGZmLmN6PgpTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5j
b20+Ci0tLQogbGliL2xpYmYyZnMuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2xpYmYyZnMuYyBiL2xpYi9s
aWJmMmZzLmMKaW5kZXggZDUyN2Q2OC4uNWMwNjRjOCAxMDA2NDQKLS0tIGEvbGliL2xpYmYyZnMu
YworKysgYi9saWIvbGliZjJmcy5jCkBAIC05MDcsNyArOTA3LDggQEAgaW50IGdldF9kZXZpY2Vf
aW5mbyhpbnQgaSkKIAkJCXJldHVybiAtMTsKIAkJfQogCi0JCWlmIChTX0lTQkxLKHN0YXRfYnVm
LT5zdF9tb2RlKSAmJiAhYy5mb3JjZSAmJiBjLmZ1bmMgIT0gRFVNUCkgeworCQlpZiAoU19JU0JM
SyhzdGF0X2J1Zi0+c3RfbW9kZSkgJiYKKwkJCQkhYy5mb3JjZSAmJiBjLmZ1bmMgIT0gRFVNUCAm
JiAhYy5kcnlfcnVuKSB7CiAJCQlmZCA9IG9wZW4oZGV2LT5wYXRoLCBPX1JEV1IgfCBPX0VYQ0wp
OwogCQkJaWYgKGZkIDwgMCkKIAkJCQlmZCA9IG9wZW5fY2hlY2tfZnMoZGV2LT5wYXRoLCBPX0VY
Q0wpOwotLSAKMi4xOC4wLnJjMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

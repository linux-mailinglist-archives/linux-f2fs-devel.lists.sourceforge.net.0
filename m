Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D3954B76F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 19:16:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1A8x-0002Kq-7e; Tue, 14 Jun 2022 17:15:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rdunlap@infradead.org>) id 1o1A8u-0002Kj-LN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 17:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Bzt2bKl4WU2vNDcoULTc+6F61x+SG15/cRuXCESmPo=; b=RPSX5s4uTPnmAjpcdTUlEZXF8i
 zim09xVRTct1n9H16besa/ng0wQH3z64R3E6NBspgWqBHx/Qdw28k8PTFr5yGXnhgZKqGfY/HgoF8
 qvLxv+cxaHIqqyTOfb/5p6MmsPdrAeOlw334+V1S2QN3PFs/EI8yfGwZDNdlD+abkP2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1Bzt2bKl4WU2vNDcoULTc+6F61x+SG15/cRuXCESmPo=; b=i
 VvhbVe7+N7HdQypMwQriu/1tZCwNx9jszDR8eWXGvqfhORGh/TM8XgYFCxmEYrxUGZIe8E72xh1u3
 ZrjW6SMdtKdjEiSdkm0TKoGrPPKIvc3Azl+ZtV2FPwCpxYMqu1M3keazO+3QjkmkoFML4vctsE+E4
 UgrxWmMTetP65qJI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1A8q-001dIZ-Qy
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 17:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=1Bzt2bKl4WU2vNDcoULTc+6F61x+SG15/cRuXCESmPo=; b=MX2jPZNmmlcx+uQn/6/l3v/tWG
 WJ4Is+63PHvrRPcUVmy1ZbZML4HzypfGHTNpeYGuYeBTbR+95L8udd03n1PxhG7wkQHPQA8akiwVI
 pW4O86PHps+lE8JYA4GqT0tzRSanfiRWiCFd/ubsQXliXN3GIyfoGRvRuFmB5nJc1qoC2Yl3yjPHc
 XAq4sq654iswYy00Q18sXBK26n0D58oRPQYjGc7pbJyoR2TR85WIlLeYecOwbCvTKDPosrdYqBfIS
 JoTWIB6D/FOV0wxe5X2/2596IsZrJ28bxFctWX+TKCaQ+TOsd8TdcadSaWBsZCmNn8AIdeu8c8YNk
 XuN7Py6g==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o1A8a-000Lea-0S; Tue, 14 Jun 2022 17:15:33 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 14 Jun 2022 10:15:26 -0700
Message-Id: <20220614171526.31756-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Fix build errors when F2FS_FS_COMPRESSION is not set: ../fs/f2fs/data.c:
    In function ‘f2fs_finish_read_bio’: ../fs/f2fs/data.c:136:5: error: too
    many arguments to function ‘f2fs_end_read_compressed_page’ f2fs_end_read_compressed_page(page,
    true, [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1o1A8q-001dIZ-Qy
Subject: [f2fs-dev] [PATCH] f2fs: fix stubs when F2FS_FS_COMPRESSION is not
 enabled
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Rml4IGJ1aWxkIGVycm9ycyB3aGVuIEYyRlNfRlNfQ09NUFJFU1NJT04gaXMgbm90IHNldDoKCi4u
L2ZzL2YyZnMvZGF0YS5jOiBJbiBmdW5jdGlvbiDigJhmMmZzX2ZpbmlzaF9yZWFkX2Jpb+KAmToK
Li4vZnMvZjJmcy9kYXRhLmM6MTM2OjU6IGVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8gZnVu
Y3Rpb24g4oCYZjJmc19lbmRfcmVhZF9jb21wcmVzc2VkX3BhZ2XigJkKICAgICBmMmZzX2VuZF9y
ZWFkX2NvbXByZXNzZWRfcGFnZShwYWdlLCB0cnVlLCAwLAogICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+CkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9mcy9mMmZzL2RhdGEuYzoyNTow
OgouLi9mcy9mMmZzL2YyZnMuaDo0MjI4OjIwOiBub3RlOiBkZWNsYXJlZCBoZXJlCiBzdGF0aWMg
aW5saW5lIHZvaWQgZjJmc19lbmRfcmVhZF9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBh
Z2UsCiAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KLi4v
ZnMvZjJmcy9kYXRhLmM6MTM4OjQ6IGVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8gZnVuY3Rp
b24g4oCYZjJmc19wdXRfcGFnZV9kaWPigJkKICAgIGYyZnNfcHV0X3BhZ2VfZGljKHBhZ2UsIGlu
X3NvZnRpcnEpOwogICAgXn5+fn5+fn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4u
L2ZzL2YyZnMvZGF0YS5jOjI1OjA6Ci4uL2ZzL2YyZnMvZjJmcy5oOjQyMzM6MjA6IG5vdGU6IGRl
Y2xhcmVkIGhlcmUKIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX3B1dF9wYWdlX2RpYyhzdHJ1Y3Qg
cGFnZSAqcGFnZSkKICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgouLi9mcy9m
MmZzL2RhdGEuYzogSW4gZnVuY3Rpb24g4oCYZjJmc19oYW5kbGVfc3RlcF9kZWNvbXByZXNz4oCZ
OgouLi9mcy9mMmZzL2RhdGEuYzoyNDE6NDogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBm
dW5jdGlvbiDigJhmMmZzX2VuZF9yZWFkX2NvbXByZXNzZWRfcGFnZeKAmQogICAgZjJmc19lbmRf
cmVhZF9jb21wcmVzc2VkX3BhZ2UocGFnZSwgUGFnZUVycm9yKHBhZ2UpLAogICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2ZzL2YyZnMvZGF0
YS5jOjI1OjA6Ci4uL2ZzL2YyZnMvZjJmcy5oOjQyMjg6MjA6IG5vdGU6IGRlY2xhcmVkIGhlcmUK
IHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2VuZF9yZWFkX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3Qg
cGFnZSAqcGFnZSwKICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgoKLi4vZnMvZjJmcy9kYXRhLmM6IEluIGZ1bmN0aW9uIOKAmGYyZnNfZmluaXNoX3JlYWRf
Ymlv4oCZOgouLi9mcy9mMmZzL2RhdGEuYzoxMzg6NDogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50
cyB0byBmdW5jdGlvbiDigJhmMmZzX3B1dF9wYWdlX2RpY+KAmQogICAgZjJmc19wdXRfcGFnZV9k
aWMocGFnZSwgaW5fc29mdGlycSk7CiAgICBefn5+fn5+fn5+fn5+fn5+fgpJbiBmaWxlIGluY2x1
ZGVkIGZyb20gLi4vZnMvZjJmcy9kYXRhLmM6MjU6MDoKLi4vZnMvZjJmcy9mMmZzLmg6NDIzNDoy
MDogbm90ZTogZGVjbGFyZWQgaGVyZQogc3RhdGljIGlubGluZSB2b2lkIGYyZnNfcHV0X3BhZ2Vf
ZGljKHN0cnVjdCBwYWdlICpwYWdlKQogICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+CgpGaXhlczogMWI1NjU3MDJkZmZlICgiZjJmczogaGFuZGxlIGRlY29tcHJlc3Mgb25seSBw
b3N0IHByb2Nlc3NpbmcgaW4gc29mdGlycSIpClNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8
cmR1bmxhcEBpbmZyYWRlYWQub3JnPgpDYzogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xl
LmNvbT4KQ2M6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CkNjOiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAotLS0KIGZzL2YyZnMvZjJmcy5oIHwgICAgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tLSBhL2ZzL2YyZnMvZjJmcy5oCisrKyBiL2Zz
L2YyZnMvZjJmcy5oCkBAIC00MjI2LDExICs0MjI2LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IGYy
ZnNfaW5pdF9jb21wcmVzc19tZW0KIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2Rlc3Ryb3lfY29t
cHJlc3NfbWVtcG9vbCh2b2lkKSB7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2RlY29tcHJl
c3NfY2x1c3RlcihzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYykgeyB9CiBzdGF0aWMgaW5s
aW5lIHZvaWQgZjJmc19lbmRfcmVhZF9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2Us
Ci0JCQkJCQlib29sIGZhaWxlZCwgYmxvY2tfdCBibGthZGRyKQorCQkJCQkJYm9vbCBmYWlsZWQs
IGJsb2NrX3QgYmxrYWRkciwKKwkJCQkJCWJvb2wgaW5fc29mdGlycSkKIHsKIAlXQVJOX09OX09O
Q0UoMSk7CiB9Ci1zdGF0aWMgaW5saW5lIHZvaWQgZjJmc19wdXRfcGFnZV9kaWMoc3RydWN0IHBh
Z2UgKnBhZ2UpCitzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19wdXRfcGFnZV9kaWMoc3RydWN0IHBh
Z2UgKnBhZ2UsIGJvb2wgaW5fc29mdGlycSkKIHsKIAlXQVJOX09OX09OQ0UoMSk7CiB9CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=

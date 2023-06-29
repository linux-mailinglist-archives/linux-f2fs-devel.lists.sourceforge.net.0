Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E88741DBD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jun 2023 03:41:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qEgfP-0002CS-Hq;
	Thu, 29 Jun 2023 01:41:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qEgfJ-0002CK-84
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Jun 2023 01:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wer01K+4rt8SbDQvmusPjzWzWiDBwFaGar2f1PPe74Y=; b=RQb5hx9BlTzAWjtq2qkDTo/Xdq
 vUigrHZ+DS1gP3f8xT8vX76ecSAaph7HcnYB0IcR3YUjSpJJx4SMaqS6eZQOloNFjTqdcIYiK9AXI
 7zO7A36bz0xalwC4564N8QaMxacrOkqZ22SWgSMlcfqKgiq3EeGvhzgIGEwMlaYYWJzs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Wer01K+4rt8SbDQvmusPjzWzWiDBwFaGar2f1PPe74Y=; b=R
 SeKqmXZSuKZP0CsIMNSdGtXIUmOE0lQI6xvzdYG9vueTkj0074A11GUr4yIrCk4ML/uGkRZM3QN6N
 HLwIDyXKH1RTP13nWJ+scp7AjzuZH0xCcrF87uEiVd2ls2dSVyrrzIvaVlaYifGqEfy2A9pPEp3iz
 dkgMic11WvPxjUZY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qEgfI-000fdP-Sw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Jun 2023 01:41:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DD76614B6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Jun 2023 01:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C131CC433C8;
 Thu, 29 Jun 2023 01:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688002898;
 bh=L7S8mzMQYGKIhxRcHxSQJwBqPxvW57dJoZChkWhi8UQ=;
 h=From:To:Cc:Subject:Date:From;
 b=h30G/Ady3rTuj4pHc4oWRB3blePjJz5XFd/9KEEWRzUxfvNqyc9o1X8gYVmzQ35zY
 BXqPAVyMc1TT5LcjStHIFg42667UMOGHH4zP/90dwcpi3gYTKxdecpNdM8uVAQi90+
 c0TEYq7vvUG88wqKf0unzA53ngGoVo6PtSw9iyNnln9emfTnZuXyhCnDWkK1bLLAkF
 O3H8upLiPGXvBgPtB8YK1+4MqvhzXG9Q56C/7rPDkYCbx9pNHfuMQSw/tI9chDB62h
 Oni7IlLkEPtbFaQhAn0vCri36+h72jw3QBkHHRNd1X4QLZBQDoBkq/EDhqk0QInEJN
 yppxRiS9wJroQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 29 Jun 2023 09:41:34 +0800
Message-Id: <20230629014134.3058318-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  fs/f2fs/node.c: In function ‘f2fs_destroy_node_manager’:
    fs/f2fs/node.c:3390:1: warning: the frame size of 1048 bytes is larger than
    1024 bytes [-Wframe-larger-than=] 3390 | } Merging below pointer arrays into
    common one, and reuse it by cast type. 
 
 Content analysis details:   (-5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qEgfI-000fdP-Sw
Subject: [f2fs-dev] [PATCH] f2fs: fix compile warning in
 f2fs_destroy_node_manager()
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

ZnMvZjJmcy9ub2RlLmM6IEluIGZ1bmN0aW9uIOKAmGYyZnNfZGVzdHJveV9ub2RlX21hbmFnZXLi
gJk6CmZzL2YyZnMvbm9kZS5jOjMzOTA6MTogd2FybmluZzogdGhlIGZyYW1lIHNpemUgb2YgMTA0
OCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxMDI0IGJ5dGVzIFstV2ZyYW1lLWxhcmdlci10aGFuPV0K
IDMzOTAgfCB9CgpNZXJnaW5nIGJlbG93IHBvaW50ZXIgYXJyYXlzIGludG8gY29tbW9uIG9uZSwg
YW5kIHJldXNlIGl0IGJ5IGNhc3QgdHlwZS4KCnN0cnVjdCBuYXRfZW50cnkgKm5hdHZlY1tOQVRW
RUNfU0laRV07CnN0cnVjdCBuYXRfZW50cnlfc2V0ICpzZXR2ZWNbU0VUVkVDX1NJWkVdOwoKU2ln
bmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgotLS0KIGZzL2YyZnMvbm9kZS5j
IHwgMTQgKysrKysrKystLS0tLS0KIGZzL2YyZnMvbm9kZS5oIHwgIDMgKy0tCiAyIGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9m
MmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCmluZGV4IGRhZGVhNmIwMTg4OC4uM2UxZmE1NjRk
YjhmIDEwMDY0NAotLS0gYS9mcy9mMmZzL25vZGUuYworKysgYi9mcy9mMmZzL25vZGUuYwpAQCAt
MzA2Miw3ICszMDYyLDcgQEAgaW50IGYyZnNfZmx1c2hfbmF0X2VudHJpZXMoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjKQogCXN0cnVjdCBmMmZzX25tX2lu
Zm8gKm5tX2kgPSBOTV9JKHNiaSk7CiAJc3RydWN0IGN1cnNlZ19pbmZvICpjdXJzZWcgPSBDVVJT
RUdfSShzYmksIENVUlNFR19IT1RfREFUQSk7CiAJc3RydWN0IGYyZnNfam91cm5hbCAqam91cm5h
bCA9IGN1cnNlZy0+am91cm5hbDsKLQlzdHJ1Y3QgbmF0X2VudHJ5X3NldCAqc2V0dmVjW1NFVFZF
Q19TSVpFXTsKKwlzdHJ1Y3QgbmF0X2VudHJ5X3NldCAqc2V0dmVjW05BVF9WRUNfU0laRV07CiAJ
c3RydWN0IG5hdF9lbnRyeV9zZXQgKnNldCwgKnRtcDsKIAl1bnNpZ25lZCBpbnQgZm91bmQ7CiAJ
bmlkX3Qgc2V0X2lkeCA9IDA7CkBAIC0zMDk1LDcgKzMwOTUsNyBAQCBpbnQgZjJmc19mbHVzaF9u
YXRfZW50cmllcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpj
cGMpCiAJCXJlbW92ZV9uYXRzX2luX2pvdXJuYWwoc2JpKTsKIAogCXdoaWxlICgoZm91bmQgPSBf
X2dhbmdfbG9va3VwX25hdF9zZXQobm1faSwKLQkJCQkJc2V0X2lkeCwgU0VUVkVDX1NJWkUsIHNl
dHZlYykpKSB7CisJCQkJCXNldF9pZHgsIE5BVF9WRUNfU0laRSwgc2V0dmVjKSkpIHsKIAkJdW5z
aWduZWQgaWR4OwogCiAJCXNldF9pZHggPSBzZXR2ZWNbZm91bmQgLSAxXS0+c2V0ICsgMTsKQEAg
LTMzMTYsOCArMzMxNiw5IEBAIHZvaWQgZjJmc19kZXN0cm95X25vZGVfbWFuYWdlcihzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkpCiB7CiAJc3RydWN0IGYyZnNfbm1faW5mbyAqbm1faSA9IE5NX0ko
c2JpKTsKIAlzdHJ1Y3QgZnJlZV9uaWQgKmksICpuZXh0X2k7Ci0Jc3RydWN0IG5hdF9lbnRyeSAq
bmF0dmVjW05BVFZFQ19TSVpFXTsKLQlzdHJ1Y3QgbmF0X2VudHJ5X3NldCAqc2V0dmVjW1NFVFZF
Q19TSVpFXTsKKwl2b2lkICp2ZWNbTkFUX1ZFQ19TSVpFXTsKKwlzdHJ1Y3QgbmF0X2VudHJ5ICoq
bmF0dmVjID0gKHN0cnVjdCBuYXRfZW50cnkgKiopdmVjOworCXN0cnVjdCBuYXRfZW50cnlfc2V0
ICoqc2V0dmVjID0gKHN0cnVjdCBuYXRfZW50cnlfc2V0ICoqKXZlYzsKIAluaWRfdCBuaWQgPSAw
OwogCXVuc2lnbmVkIGludCBmb3VuZDsKIApAQCAtMzM0MCw3ICszMzQxLDcgQEAgdm9pZCBmMmZz
X2Rlc3Ryb3lfbm9kZV9tYW5hZ2VyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKIAkvKiBkZXN0
cm95IG5hdCBjYWNoZSAqLwogCWYyZnNfZG93bl93cml0ZSgmbm1faS0+bmF0X3RyZWVfbG9jayk7
CiAJd2hpbGUgKChmb3VuZCA9IF9fZ2FuZ19sb29rdXBfbmF0X2NhY2hlKG5tX2ksCi0JCQkJCW5p
ZCwgTkFUVkVDX1NJWkUsIG5hdHZlYykpKSB7CisJCQkJCW5pZCwgTkFUX1ZFQ19TSVpFLCBuYXR2
ZWMpKSkgewogCQl1bnNpZ25lZCBpZHg7CiAKIAkJbmlkID0gbmF0X2dldF9uaWQobmF0dmVjW2Zv
dW5kIC0gMV0pICsgMTsKQEAgLTMzNTYsOCArMzM1Nyw5IEBAIHZvaWQgZjJmc19kZXN0cm95X25v
ZGVfbWFuYWdlcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCiAKIAkvKiBkZXN0cm95IG5hdCBz
ZXQgY2FjaGUgKi8KIAluaWQgPSAwOworCW1lbXNldCh2ZWMsIDAsIHNpemVvZih2b2lkICopICog
TkFUX1ZFQ19TSVpFKTsKIAl3aGlsZSAoKGZvdW5kID0gX19nYW5nX2xvb2t1cF9uYXRfc2V0KG5t
X2ksCi0JCQkJCW5pZCwgU0VUVkVDX1NJWkUsIHNldHZlYykpKSB7CisJCQkJCW5pZCwgTkFUX1ZF
Q19TSVpFLCBzZXR2ZWMpKSkgewogCQl1bnNpZ25lZCBpZHg7CiAKIAkJbmlkID0gc2V0dmVjW2Zv
dW5kIC0gMV0tPnNldCArIDE7CmRpZmYgLS1naXQgYS9mcy9mMmZzL25vZGUuaCBiL2ZzL2YyZnMv
bm9kZS5oCmluZGV4IDkwNmZiNjdhOTlkYS4uNWJkMTZhOTVlZWY4IDEwMDY0NAotLS0gYS9mcy9m
MmZzL25vZGUuaAorKysgYi9mcy9mMmZzL25vZGUuaApAQCAtMzUsOCArMzUsNyBAQAogI2RlZmlu
ZSBERUZfUkZfTk9ERV9CTE9DS1MJCQkwCiAKIC8qIHZlY3RvciBzaXplIGZvciBnYW5nIGxvb2st
dXAgZnJvbSBuYXQgY2FjaGUgdGhhdCBjb25zaXN0cyBvZiByYWRpeCB0cmVlICovCi0jZGVmaW5l
IE5BVFZFQ19TSVpFCTY0Ci0jZGVmaW5lIFNFVFZFQ19TSVpFCTMyCisjZGVmaW5lIE5BVF9WRUNf
U0laRQkzMgogCiAvKiByZXR1cm4gdmFsdWUgZm9yIHJlYWRfbm9kZV9wYWdlICovCiAjZGVmaW5l
IExPQ0tFRF9QQUdFCTEKLS0gCjIuNDAuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

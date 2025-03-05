Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F04AA4FD59
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 12:15:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpmij-0008EX-28;
	Wed, 05 Mar 2025 11:15:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tpmii-0008ER-Fz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 11:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JNIFdf6MeildPaheK9cComE+qZTvGSRsWWu7O51IAq8=; b=jSwsAsth2+C7Mvbm8VVtN/3RcG
 fsYIjf/pmt+ZsiU18mnAUapl8Ht5Oi2Orp8ywuc3eotawrBfGptTPW6BniODO5HpNw+1ROlUJcXWx
 huztsxBtQXG4qXiPyo2TXea5h2pXyjaf0Mh0e5A+c/BLzESZrHnwVwis6bNJxqbEbkZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JNIFdf6MeildPaheK9cComE+qZTvGSRsWWu7O51IAq8=; b=V
 4G5+GIFRUNMf2eiPtA+/ibjJWy+9WF5QYFCHlcYZwCIDmHN7Mw2kzxdQq8eKE3x3M/7sDPjYovHu3
 Wa67XuBDiBZ6LJEEiVe0kft1tat1nbPUN+ALA5F27GCMDDj+z2mzAh9Cs4E8LrKSGU2sPTtAQSxGp
 xvEXOUD7yPHl6hTg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpmic-00022p-A5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 11:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BF875C6476
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Mar 2025 11:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CC9C4CEE2;
 Wed,  5 Mar 2025 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741173307;
 bh=VWo5+bJ8L4IVHfAZQrUT9exN5dVTWqnHaWcPb8ZAQ0I=;
 h=From:To:Cc:Subject:Date:From;
 b=ujjOYiCzioQ+AS2YhSBpuORsymt/nBmmTiGTHosTlKpiOmneAZHgqlsvuaiZJ/kmY
 7P9LUGdXEtpCd4JnJvVZmasPybHsljpDJfkyPrgSbFm1FHbYSedIaTs1edoWQ15jLw
 +QM5NYHe0nev3cHxBYh0gr6OIQWsGLSaCPKewyDOvEBpDqEFhSvkXVqSXKu6Wr63Y7
 uWkP22stXdIa8hdsfTKmB4nXy6oydDamUo8MT6o42tvSyV6Lz/w0v3Ug9VeMLZl+AD
 6l1H5b1oO4rUnwg0ACr+XRnw2CTTDI4XxwRi0cI37LcNzfVkYehiKMVCXNRzR49Hbk
 qCCmcAw8YvGHg==
To: jaegeuk@kernel.org
Date: Wed,  5 Mar 2025 19:14:51 +0800
Message-ID: <20250305111451.2117478-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  It can be used to dump hex of unicode/emoji/invisible filename.
    i_name [❤] i_name(hex) [0xe2 0x9d 0xa4 0x0] i_name [❤️] i_name(hex)
    [0xe2 0x9d 0xa4 0xef 0xb8 0x8f 0x0] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [139.178.84.217 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpmic-00022p-A5
Subject: [f2fs-dev] [PATCH] dump.f2fs: support to show hex of filename
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SXQgY2FuIGJlIHVzZWQgdG8gZHVtcCBoZXggb2YgdW5pY29kZS9lbW9qaS9pbnZpc2libGUgZmls
ZW5hbWUuCgppX25hbWUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW+KdpF0KaV9u
YW1lKGhleCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsweGUyIDB4OWQgMHhhNCAweDBd
CgppX25hbWUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW+KdpO+4j10KaV9uYW1l
KGhleCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsweGUyIDB4OWQgMHhhNCAweGVmIDB4
YjggMHg4ZiAweDBdCgpTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Ci0t
LQogZnNjay9tb3VudC5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2ZzY2svbW91bnQuYyBiL2ZzY2svbW91bnQuYwppbmRleCBhMTg5YmE3
Li5lNDkzZjIyIDEwMDY0NAotLS0gYS9mc2NrL21vdW50LmMKKysrIGIvZnNjay9tb3VudC5jCkBA
IC0zMTgsNiArMzE4LDExIEBAIHZvaWQgcHJpbnRfaW5vZGVfaW5mbyhzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksCiAJaWYgKGVuWzBdKSB7CiAJCURJU1BfdTMyKGlub2RlLCBpX25hbWVsZW4pOwog
CQlwcmludGYoIiUtMzBzXHRcdFslc11cbiIsICJpX25hbWUiLCBlbik7CisKKwkJcHJpbnRmKCIl
LTMwc1x0XHRbIiwgImlfbmFtZShoZXgpIik7CisJCWZvciAoaSA9IDA7IGkgPCBGMkZTX05BTUVf
TEVOICYmIGVuW2ldOyBpKyspCisJCQlwcmludGYoIjB4JXggIiwgKHVuc2lnbmVkIGNoYXIpZW5b
aV0pOworCQlwcmludGYoIjB4JXhdXG4iLCAodW5zaWduZWQgY2hhcillbltpXSk7CiAJfQogCiAJ
cHJpbnRmKCJpX2V4dDogZm9mczoleCBibGthZGRyOiV4IGxlbjoleFxuIiwKLS0gCjIuNDguMQoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==

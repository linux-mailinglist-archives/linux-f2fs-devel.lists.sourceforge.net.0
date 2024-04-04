Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9E28989A8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Apr 2024 16:13:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsNqE-0007A0-N7;
	Thu, 04 Apr 2024 14:13:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangjianjian0@foxmail.com>) id 1rsNqB-00079r-OD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 14:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject
 :Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E5u/L4LRCMBGi8NwxHz6aYJF9DCSuKXXIUjwnuBFB6E=; b=RzBJW1ph7ElY2VNxGPRM5pHcZf
 81KIcxLOvuRv7JsB/I4LUliABeYAiSsoZimWkkcIj3skG3UrwKYF+pwy+RDG3MHe5kpXUy6CkZ+tj
 z4dMpNSAtCZAmfHrYGscmMbv2pG1qZuqMKYiY4xMpIWAN3eeLy6SKZyJ7w2HI2L1NNsI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Date:Subject:Cc:To:From:Message-ID
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=E5u/L4LRCMBGi8NwxHz6aYJF9DCSuKXXIUjwnuBFB6E=; b=j
 DU1xL3/T+WWUPbq+6RqVEeh9EzHaF74rKaF9bQQ761h2vorcUlknJjxl1/tP1V9aT4UhdgauT0/HQ
 8UH33y8bfbtt9RFCWYwQJr6Z7/nI97ImMgJJ/OFYs1361X5NpF3edv7LtrwZnB/iiJGRtmHU2acaN
 hyvxhq9Js/Hy32Oo=;
Received: from out203-205-221-231.mail.qq.com ([203.205.221.231])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rsNq5-0006AA-7u for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 14:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1712239980;
 bh=E5u/L4LRCMBGi8NwxHz6aYJF9DCSuKXXIUjwnuBFB6E=;
 h=From:To:Cc:Subject:Date;
 b=EmWjcUCfaKLSB0euZzShccDS63Qz4JCqyQ9W3a+j060r4jjTskZVc22lhrQOFLz4x
 klrI5c7z4kxrODjBPlgZ2SAUqI13d4jtqfch+3vhsDBhD/t2FeRBFDB/rSezaVkMa2
 wAERpJSJIX9sybOs2bphu57CwTzd29bFljlSul4M=
Received: from fedora.. ([120.244.21.52])
 by newxmesmtplogicsvrszc5-2.qq.com (NewEsmtp) with SMTP
 id BD621688; Thu, 04 Apr 2024 21:47:22 +0800
X-QQ-mid: xmsmtpt1712238442trnw9z9vh
Message-ID: <tencent_67A0192ABE8A513889F4DCEEFD83DC2FBB0A@qq.com>
X-QQ-XMAILINFO: MOpJcPT3Yy24CZtBjZ7/klgO+3WiCO99q7co7MmEJO6RNVPRCfZ/cl+8smUF6T
 keq64umL/RX+A7+3LO+gl+dk0aKOD5PSoDc7OstzKrAKxr3RC8QyUHNL93/1SCvAw2o5Drnr0XtO
 qnGxbOkuhMSnp1kh9fekrB2NktXvKXGfyU8U7kqSEAT0Z8a6XoHK8OmCb314CXNI3vN/Qn7j0o+R
 3Im3UogZUWGKS9YCMzuRd9do9jcHHSxxGf5YXBs/NTQze1gk3sNllaV8WZSiN6nsZKjzrfjZuTJZ
 aicBe56kC4eEdfTQMpDkHULBN4S62qV4kYgfdlJxV0ql/DtcqHJ54lShWBRBn4URHzLqk4srrNMF
 A61Kf6qkH5xAFCW6yhfQlyjt03umsTyy49gRrr9oskwm4+I3eg0t2L9Ay1AE+HSm5Z7DHh9wHN+K
 poI45k+HSkIxOJN0WRM6kCpFLMv2n5Ys/0vNwWwp1nTq7hrqRgg0tZROP+2pJMKnTsBXjrCxQOZ3
 Kilu3tK466OMQZfo4v6ZbIb3g63Ilr7WObZkTonUsTJis8U+k8wEDZFv6hrx0oCBpsWolPeL23pr
 vGRKS+emcylX7snvLurOMoyPxUdNnGYfXLE8TsYhMzr2BpFhBB/+6eLFN0jgKKfO9yjw5FsVHsv5
 HeEgTvgAwZyDpAdRdRnI87bHxrJJmpW6x+pc5a++cUNwvRKoo/LuivQkYOcWnK2CXdRG7wUwZ8or
 AO5nXJCm5OvPDDZufGNcVDfjMkjU5tP+0nRvK22I5Hr2KrfD/O/+4DM5Hq0axmztey2ZCAZiQY/V
 CtYW4wrsjNHywRv8P3fA5fDAQTdXAzc1Qh7Ku8Ztnl4/tKRjv5KGuq14yRuVDqjb9KJb/vlT0Qt5
 1xjQ+60SAsXUcPpnvjb/I6z0dsRO0Tf9Ykbxahip1d3WUYPMgpJXWrY/LO9GZRJp7nMeKatdt58y
 xxP6eypoOd0kS3eZZlJQeFBrfVv1GfiUIGDcU6sZEE46mpjmMrxDFsb/9+dWYjtgP49RtlPGsSp1
 A8Tix0pXQXpeWocNzX
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Wang Jianjian <wangjianjian0@foxmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Thu,  4 Apr 2024 21:47:20 +0800
X-OQ-MSGID: <20240404134720.47306-1-wangjianjian0@foxmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Spam-Score: 3.7 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: dquot_mark_dquot_dirty returns old dirty state not the error
 code. Signed-off-by: Wang Jianjian --- fs/f2fs/super.c | 4 ++-- 1 file changed,
 2 insertions(+), 2 deletions(-) diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
 index a6867f26f141..af07027475d9 100644 --- a/fs/f2fs/super.c +++
 b/fs/f2fs/super.c
 @@ -3063,13 +3063,13 @@ static int f2fs_dquot_mark_dquot_dirty(struct [...]
 Content analysis details:   (3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [203.205.221.231 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: foxmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [wangjianjian0[at]foxmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wangjianjian0[at]foxmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
 3.2 HELO_DYNAMIC_IPADDR    Relay HELO'd using suspicious hostname (IP
 addr 1)
X-Headers-End: 1rsNq5-0006AA-7u
Subject: [f2fs-dev] [PATCH] f2fs: Fix incorrect return value
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
Cc: Wang Jianjian <wangjianjian0@foxmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

dquot_mark_dquot_dirty returns old dirty state not the error code.

Signed-off-by: Wang Jianjian <wangjianjian0@foxmail.com>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a6867f26f141..af07027475d9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3063,13 +3063,13 @@ static int f2fs_dquot_mark_dquot_dirty(struct dquot *dquot)
 {
 	struct super_block *sb = dquot->dq_sb;
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-	int ret = dquot_mark_dquot_dirty(dquot);
 
+	dquot_mark_dquot_dirty(dquot);
 	/* if we are using journalled quota */
 	if (is_journalled_quota(sbi))
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
 
-	return ret;
+	return 0;
 }
 
 static int f2fs_dquot_commit_info(struct super_block *sb, int type)
-- 
2.34.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

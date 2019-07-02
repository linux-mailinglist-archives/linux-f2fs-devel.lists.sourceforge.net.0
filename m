Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9FC5CB30
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2019 10:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v2evgfUoUWIavlxD38m5tcnNvDJCIlJnFEgY+M1TGSM=; b=RyMsSP+zeZGaye3nNASish7m6g
	0XQe8jkW1uWv/1qXtysmoVZF14IIorIyzaEKCmblP/J5Hff/LAUdda5lYzz217F74OSbOaCigtFcv
	S7DVJ6TuxvrWR4qHKjlKLRDPyTN7bO0SY51Ud2pdXiKnfsPacfKmYS2bBe4M9oNYG2R8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hiDtI-0007XT-9p; Tue, 02 Jul 2019 08:11:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3NhAbXQkKALEfTVReTYVeXffXcV.Tfd@flex--oceanchen.bounces.google.com>)
 id 1hiDtH-0007XH-Rk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jul 2019 08:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NEsgFhBOsHO1SUu/GnNK2DPDOJTChWsbzIPYkeXfosU=; b=nO0VsFNoMxFmR7LrfiPSpTxtgu
 AjFHZV6D/8KwdxbPuVkamuvKVugnXh9D08dPcp9MW2Zd8bELkQ7oHsFqWV/dffLnma/H6CsqYsdfY
 KL+nZrM2QtBIpmg0GCvBuLW4LlSUWZ4On6bobED3AiGqM4tU/40HO/c7GUWBGxskR0aE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NEsgFhBOsHO1SUu/GnNK2DPDOJTChWsbzIPYkeXfosU=; b=Z
 Xg0hrR9J33BNeouYqeUoQf8tmS2LMezDTZWvW08xC2Tye50hyXFxzzwMyAGNdflHW6JfQ9Sh/ZzBr
 Rtp9lhtu95JinWDGOUa7kwytnX+FWPezoNOVJhkxs45HrkfovTDNpL6xJbmHEHvKcDxdiz2YsI4rH
 4NtwJUo9eRyN5V10=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hiDtM-00409j-Qc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jul 2019 08:11:58 +0000
Received: by mail-qk1-f202.google.com with SMTP id n77so15927860qke.17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Jul 2019 01:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=NEsgFhBOsHO1SUu/GnNK2DPDOJTChWsbzIPYkeXfosU=;
 b=SUuiCpEyaak5XfddxqDhgd8CZLbHmyS+aWA9tOcpJKwvJ+lmczEa4pAv2doIL/MNAx
 oxbvwgOT7JP95TVpHvEKVEhqSCkHTaAIJ2qYLYjYX/sM5EVQ/ehuStA1RZaAx9WKHIu2
 HOMEvp+RFG18HWtxgTcDEihisRNtMoN4fr51BGqd0Y1aNZ9EUIBxSnArjNTNPZj0qKeC
 7lDfBfPvpuhQ5dGD+qwIbY14OOVkD/4L9H5Ax829EjB1ByMvbQVVg8/LyR1nThS/JZpC
 sGyguTYXTlq79AT/k0ECihTxoUZa47U8PBCFXFAtW0FYIKiTXq8syA+AF8rl0mZfO7q0
 9njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=NEsgFhBOsHO1SUu/GnNK2DPDOJTChWsbzIPYkeXfosU=;
 b=Mfl+3sEqKSZkkCmOtUAv904lvzp7spMPlYAEcRC8ins3F0+GdmbnIdb6FZVVE+JzE+
 rCvpxtndcMMQP0XcikA/Tv0q0D1LiunCb5SQl7O3p32hURIkpd2aB9Qi5ycuGak+Y9Qk
 3oB5rR4o+9KrJLmpRNYuj4486dv5/Yta2dmd04qrpZUAUD23F0i3ellGt0UTB79YIzxO
 d0nphbRUQaGHOoS4at8nW5R+JB8PlvxwnWDJ08BXnnXZvk07REjF6ZWR30t5Yf5ZL94K
 sYMT9T8CFGEmVrZz/DiT5TDkqLpJaMFD6QpsGXPhnKou7BEKflVK0ztqN2YK04RWeO5F
 BzHw==
X-Gm-Message-State: APjAAAUeCbixDap+Q0lb88+/W6OUj3pFvVCTiSR5n0H7vG/c3uB8J4Iq
 faidylgjCTbrjgst0eKG393uF5yny5kVO8w=
X-Google-Smtp-Source: APXvYqwrXvbk11TVxxDHQCIkdbAtLKP9A2wasQz4c5X/idjoID/jWMQN/mQNqcB/Hw6wGFCTefiRv8WenyeupcE=
X-Received: by 2002:a37:ac0a:: with SMTP id e10mr24972711qkm.168.1562054710600; 
 Tue, 02 Jul 2019 01:05:10 -0700 (PDT)
Date: Tue,  2 Jul 2019 16:05:03 +0800
Message-Id: <20190702080503.175149-1-oceanchen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
To: jaegeuk@kernel.org, yuchao0@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hiDtM-00409j-Qc
Subject: [f2fs-dev] [PATCH v2] f2fs: avoid out-of-range memory access
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
From: Ocean Chen via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ocean Chen <oceanchen@google.com>
Cc: oceanchen@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

blk_off might over 512 due to fs corrupt.
Use ENTRIES_IN_SUM to protect invalid memory access.

v2:
- fix typo
Signed-off-by: Ocean Chen <oceanchen@google.com>
---
 fs/f2fs/segment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8dee063c833f..a5e8af0bd62e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3403,6 +3403,8 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 
 		for (j = 0; j < blk_off; j++) {
 			struct f2fs_summary *s;
+			if (j >= ENTRIES_IN_SUM)
+				return -EFAULT;
 			s = (struct f2fs_summary *)(kaddr + offset);
 			seg_i->sum_blk->entries[j] = *s;
 			offset += SUMMARY_SIZE;
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

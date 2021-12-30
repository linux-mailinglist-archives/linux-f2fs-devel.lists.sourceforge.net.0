Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F24817FA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Dec 2021 01:59:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n2jnE-0003Am-9p; Thu, 30 Dec 2021 00:59:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <antoine@lesviallon.fr>) id 1n2jnD-0003Ag-5I
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Dec 2021 00:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:To:Subject:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lVIn8IqSt3y27Gj7WzOje27WGjNHTUnpLPUMykPm+3U=; b=k5ZZJJyJZYHCiizCKQYayFpFSt
 956h49kxuxwDZNovDTwQekecBAs952pz+vfseBBf1fcYkTwY3XbMoUcOj6am+cjDIRMshf1j0QkjW
 WSjN5D9E4tMNAilIdCkG9gSClw/+mGod6xphB0HKmKvcRRsMjvLnCbOzL99eGCZdyYsU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=References:In-Reply-To:To:Subject:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lVIn8IqSt3y27Gj7WzOje27WGjNHTUnpLPUMykPm+3U=; b=fNsIN8B7k51TauP6knf3RD4xK2
 mlxRqWmUOYVHPcGCZHcApn2L5h0cszClAN3DqRcYah6dHEzll90sLGMoMULCriMMmo4P7dkUEPMqY
 9L8OV6rmioRC9p3+A29ylNDA3Vx+TbYIjLMBv+5WUxRZF9keFoo/z3WPH0o0x1EUA8do=;
Received: from lesviallon.fr ([82.66.80.223])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n2jnD-00DNsT-5N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Dec 2021 00:59:44 +0000
Received: from authenticated-user (lesviallon.fr [82.66.80.223])
 by lesviallon.fr (Postfix) with ESMTPA id 2233662A6212
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Dec 2021 00:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lesviallon.fr;
 s=dkim; t=1640825975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVIn8IqSt3y27Gj7WzOje27WGjNHTUnpLPUMykPm+3U=;
 b=Kp2Hj0fcdq2ZCslqfQyWOHBxgiHufXZQtPvoeQDCTYPp/QW+2PtIfQ5KIgnY5Bz039sgYr
 d1TQ0B6hJy/+5ZPlggduPKBAqND8mVNmdIVEHoncTUjYmKtILrRKvQj8rYwqEw0V9cd3HA
 fSrbwOLsahfxUT7jdldgZONtMEiyQAs=
MIME-Version: 1.0
Date: Thu, 30 Dec 2021 00:59:34 +0000
Message-ID: <e8b0f25177675008c0eb234220ceb31f@lesviallon.fr>
To: "Antoine Viallon via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
In-Reply-To: <20211230002942.298407-1-antoine@lesviallon.fr>
References: <20211230002942.298407-1-antoine@lesviallon.fr>
X-Spamd-Bar: /
Authentication-Results: lesviallon.fr;
 auth=pass smtp.auth=antoine@lesviallon.fr smtp.mailfrom=antoine@lesviallon.fr
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Some variable naming mistaskes were made in the last patch, 
 here is an updated version. --- fsck/fsck.c | 9 +++++++++ fsck/fsck.h | 1
 + 2 files changed, 10 insertions(+) diff --git a/fsck/fsck.c b/fsck/fsck.c
 index ecd87af..921db0f 100644 --- a/fsck/fsck.c +++ b/fsck/fsck.c @@ -546,6
 +546,15 @@ int fsck_chk_node_blk(struct f2fs_sb_info *sbi, struct f2fs_inode
 *inode, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n2jnD-00DNsT-5N
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Add progression feedback
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
From: Antoine Viallon via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Antoine Viallon <antoine@lesviallon.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some variable naming mistaskes were made in the last patch,
here is an updated version.

---
 fsck/fsck.c | 9 +++++++++
 fsck/fsck.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index ecd87af..921db0f 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -546,6 +546,15 @@ int fsck_chk_node_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
        node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
        ASSERT(node_blk != NULL);
 
+       /* Progress report */
+       sbi->fsck->chk.checked_node_cnt++;
+
+       if (sbi->fsck->chk.checked_node_cnt % 1000 == 0)
+               printf("[FSCK] Check node %u / %u (%.2f%%)\n",
+                          sbi->fsck->chk.checked_node_cnt,
+                          sbi->total_valid_node_count,
+                          100 * (float)(sbi->fsck->chk.checked_node_cnt) / sbi->total_valid_node_count);
+
        if (sanity_check_nid(sbi, nid, node_blk, ftype, ntype, &ni))
                goto err;
 
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 11846e1..535d6d5 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -93,6 +93,7 @@ struct f2fs_fsck {
        struct chk_result {
                u64 valid_blk_cnt;
                u32 valid_nat_entry_cnt;
+               u32 checked_node_cnt;
                u32 valid_node_cnt;
                u32 valid_inode_cnt;
                u32 multi_hard_link_files;
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

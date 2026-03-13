Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CCXNu+7s2nEaQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:25:35 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D9427EC2B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:25:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7UHNnHXFrZY6Ija+2th1JMlFJDh+a2/scMOrH/84GXM=; b=EwQUAeb4MNBIILyfWBnNHXqs0x
	52mrNDcPPKnN0fyhr0ItDGvqd+yjDOxXaxQQiYJb8550A0yXiAkhFbevLzZHBE7lNKyasKc9UVNAA
	Qk0sihNF7YivIzFCazofTR2+CXscMD4bPQy/qZdG73Ude16TSu//G1G+WDMj15UPaoI8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0wti-0008Jn-3M;
	Fri, 13 Mar 2026 07:25:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0wtg-0008Jf-8Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UlYnLJ5FBqPLBJi1eSvzQkER+ApHSusbeIDZBi8ooxw=; b=Q3oMWTe24Pja3T2envyeFjgAFx
 GJ9+nzCQF7p8+/adZxdVz5xQkMggG4ExP6T8SrrLCwxZ0h5h0aiHio90R+ma4tOsS/wKJ0cOXBnuy
 poKvnIdzIQbJe+DebeVDFlhHhV+hViV8hpzX6bFQPHhLSFBAuHgBkwm2GvDGox6MWc6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UlYnLJ5FBqPLBJi1eSvzQkER+ApHSusbeIDZBi8ooxw=; b=a
 /K81fvo1bwm+e4aIMwSONLzOilMI/lcV14vFJhb7uvZ6XBDe5cdnUrdxyWbdqNqLAVSNpYMCa9y4P
 w7ImhuKFc3sA4Nye/EXTYhztiKT35wyxU7aYURtTBVbfKHvAnF53OoM1dcL/X/VsSs0UfHYDryjuA
 smiEro3L8JqPhFoM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0wtf-0007Iv-MP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 410B442DEF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Mar 2026 07:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B85EC2BCB0;
 Fri, 13 Mar 2026 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773386713;
 bh=G1cA+On/C+XLi27n5zidur8bzN1a9ZKSCHP6yKqRSLU=;
 h=From:To:Cc:Subject:Date:From;
 b=eu6raMgQyGiADo1ksAXNesYaGwD/DW9VnTbGeSyw36zKyokG8U8DEYAF6pO1ponUu
 rjyoAueA5PEdm3XnTJnGqyKKIwEd2APqMWi22kzdng6ZSPg+G5BwnQ+e9RS0muJkT8
 msP2gqkG1CLDIlmW+vlLEZ18rWA+XiZkRxB5kUa92FYL8vzkdUd8rIZxSryVJQLlJg
 Ca6jU1LAb3hhNy48ZRepTDJhypTYYTql9Sl8tKJuROHVwLonhYWDG3JOP+8HdA+u4k
 skdLPGUbmfsCzlGKWFWFTk8AhXR7Yy77AnRbMJAriAi0PbO7a06NtqarKj75LbQBnj
 2bsWOLdhJpWTQ==
To: jaegeuk@kernel.org
Date: Fri, 13 Mar 2026 07:24:59 +0000
Message-ID: <20260313072500.396696-1-chao@kernel.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_handle_page_eio() is the only left place we set
 CP_ERROR_FLAG
 directly, it missed to update superblock.s_stop_reason,
 let's call f2fs_handle_critical_error()
 instead to fix that. Introduce STOP_CP_REASON_READ_{META, NODE,
 DATA} stop_cp_reason
 enum variable to indicate which kind of data we failed to read. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0wtf-0007Iv-MP
Subject: [f2fs-dev] [PATCH] f2fs: call f2fs_handle_critical_error() to set
 cp_error flag
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 05D9427EC2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs_handle_page_eio() is the only left place we set CP_ERROR_FLAG
directly, it missed to update superblock.s_stop_reason, let's
call f2fs_handle_critical_error() instead to fix that.

Introduce STOP_CP_REASON_READ_{META,NODE,DATA} stop_cp_reason enum
variable to indicate which kind of data we failed to read.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h          | 20 ++++++++++++++++++--
 include/linux/f2fs_fs.h |  3 +++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 660bf88a376f..86b92b0aecbd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -5073,8 +5073,24 @@ static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi,
 		return;
 
 	if (ofs == sbi->page_eio_ofs[type]) {
-		if (sbi->page_eio_cnt[type]++ == MAX_RETRY_PAGE_EIO)
-			set_ckpt_flags(sbi, CP_ERROR_FLAG);
+		if (sbi->page_eio_cnt[type]++ == MAX_RETRY_PAGE_EIO) {
+			enum stop_cp_reason stop_reason;
+
+			switch (type) {
+			case META:
+				stop_reason = STOP_CP_REASON_READ_META;
+				break;
+			case NODE:
+				stop_reason = STOP_CP_REASON_READ_NODE;
+				break;
+			case DATA:
+				stop_reason = STOP_CP_REASON_READ_DATA;
+				break;
+			default:
+				f2fs_bug_on(sbi, 1);
+			}
+			f2fs_handle_critical_error(sbi, stop_reason);
+		}
 	} else {
 		sbi->page_eio_ofs[type] = ofs;
 		sbi->page_eio_cnt[type] = 0;
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index dc41722fcc9d..829a59399dac 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -80,6 +80,9 @@ enum stop_cp_reason {
 	STOP_CP_REASON_NO_SEGMENT,
 	STOP_CP_REASON_CORRUPTED_FREE_BITMAP,
 	STOP_CP_REASON_CORRUPTED_NID,
+	STOP_CP_REASON_READ_META,
+	STOP_CP_REASON_READ_NODE,
+	STOP_CP_REASON_READ_DATA,
 	STOP_CP_REASON_MAX,
 };
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG1+I/O7s2nEaQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:25:39 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8469127EC32
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=popnD2Nv1ZOsAnE3gBNqoc56JVvUbAvVt1fwCxT+rdA=; b=b1ClylpXgV8p09e+ME3tMKmDTK
	KVb4nWUyBrqUQtyUUtu9b2/3wnWh73ePaILz8mfRxrU5bLRVpPaFkFRPWpm970O0ELsIIjbYC2gOJ
	34QX4mnch3xyiYqR/Zuzqomy3ezHUY022I8ufuTo5rEYzKe60TeQUnA4FkFPSf81VkE8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0wtj-00072c-J8;
	Fri, 13 Mar 2026 07:25:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0wti-00072N-Cp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PF/FITLKNRm/D2X/HtWAsl7EmIVQVtpvmeDJu2QzrAk=; b=WhaasicsTKeZdl3BC5HfjqAgi6
 bVcguzuSN43VzBIapgu/RUD1O7VOg5ovgwhc+Xkls9dEWkxz3a3eRqfcIvPIS2c/qAc5gLN4UeSc8
 ixdihUfQoXT/6LGDAZXYyPXSzGGuaKLvlFo+jJ/R9QHUP4jOamSyJOJ0t1mQrMl59Ci4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PF/FITLKNRm/D2X/HtWAsl7EmIVQVtpvmeDJu2QzrAk=; b=R
 nauXkrpjCqEYfy0cGbcwqrnI3nTJb70Fi0IKciD4hwSVlLurfTlzbjhb3Z9r1YHr5gHwSpd4MxzqJ
 in3VPYKq2LRR2cHXJ87WEhrXHSaGFqIEvqDTbao6L0LK8K1nPZw1W5NLLgbRVDAen2kOZiAxYUquW
 qylM0YVgE78yWSq8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0wti-0007Iy-At for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E2B5E43CA7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Mar 2026 07:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E37C2BC87;
 Fri, 13 Mar 2026 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773386720;
 bh=yJ/ByQJeEuLBe94qr3Ti7mwZeGX8tSJnzcyO0ocLisA=;
 h=From:To:Cc:Subject:Date:From;
 b=XFky2w2qqB1hGNFcr2onTJQ5zYloOxiaav9eh122FTPgL6NxOJ2C0aOlShBo9DYzl
 kPYoEjUG/JOCbZtnpJlAA3RZObixN72BzA26VaW5hWRXM9uy5EVPa8nAXzra3H+YAc
 7dBaJTfJFVrJAXJHcl3Z7KajpDfZwjqxYdrgammqs7+icY09J+rEkoPdLWIwpSza+p
 XfI3un32bagw1E8gIg/sTTiS2qnd4Koe0+osY6m5ANJ3oiKsTC6D31RUPHH+BAM6Ry
 x5jNHga4Ex6r2jnkl47okODfYudM/Ki4gYitwKJX39C6mfSxwancu5v/M+Iu4hqUWO
 PQUfjRPNGT4mg==
To: jaegeuk@kernel.org
Date: Fri, 13 Mar 2026 07:25:15 +0000
Message-ID: <20260313072515.396820-1-chao@kernel.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Let fsck recognize STOP_CP_REASON_READ_{META, NODE, DATA} for
 repair. Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/mount.c | 3 +++
 include/f2fs_fs.h | 3 +++ 2 files changed,
 6 insertions(+) diff --git a/fsck/mount.c
 b/fsck/mount.c index d1eb3a9..9b353e3 100644 --- a/fsck/mount.c +++
 b/fsck/mount.c @@ -733, 6 +733,
 9 @@ static char *stop_reason_str[] = { [STOP_CP_REASON_NO_SEGMENT]
 = "no_se [...] 
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
X-Headers-End: 1w0wti-0007Iy-At
Subject: [f2fs-dev] [PATCH] fsck.f2fs: recognize STOP_CP_REASON_READ_{META,
 NODE, DATA}
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 8469127EC32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let fsck recognize STOP_CP_REASON_READ_{META,NODE,DATA} for repair.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c      | 3 +++
 include/f2fs_fs.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index d1eb3a9..9b353e3 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -733,6 +733,9 @@ static char *stop_reason_str[] = {
 	[STOP_CP_REASON_NO_SEGMENT]		= "no_segment",
 	[STOP_CP_REASON_CORRUPTED_FREE_BITMAP]	= "corrupted_free_bitmap",
 	[STOP_CP_REASON_CORRUPTED_NID]		= "corrupted nid",
+	[STOP_CP_REASON_READ_META]		= "read_meta_fail",
+	[STOP_CP_REASON_READ_NODE]		= "read_node_fail",
+	[STOP_CP_REASON_READ_DATA]		= "read_data_fail",
 };
 
 void print_sb_stop_reason(struct f2fs_super_block *sb)
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index d0877b9..21310fa 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -745,6 +745,9 @@ enum stop_cp_reason {
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

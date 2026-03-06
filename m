Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJqgMirGqmnVWwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 13:18:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A26A22069B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 13:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uUBDvgGh1G+eabe5S4tII2WLrbhZaisESsl+sheX7WY=; b=OerukMTMVMSq8HnHtHLO4Sd/nz
	aax2yp5xFTtF15FRbf+8IOIj6K4BJhBoL18JzTiWU3VnFf5XNir5fsoBZGhsa/OHAteP9nuRGRSCd
	IWR77YYzJXqCM4OiJP4hJ5r/219Aus3tHtFAWjVsxfEIJNrp9OtijkHDrN0bnPyGfjDA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyU8f-0007Jy-3E;
	Fri, 06 Mar 2026 12:18:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vyU8Y-0007JI-OL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 12:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FCCL5RLhLg+0VB2YANT0fmHUziIiu1qH0eKa75bIESg=; b=azPmIqsX2ghO4P1AbzNRQsOa2a
 NahSNRdefn5ExR+qK6fmbRipdOC3ue8ZwzGJ15X0o6hL1fyMXwxYitPB6kBZTOk1sPAJMA8Uo+pP/
 Vy1DBcEJRROGjaOkcKG2CR5JESU3aoENvS6f3l9HfeEmrdQeL/bqWYhh6GxUrvKfw0PU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FCCL5RLhLg+0VB2YANT0fmHUziIiu1qH0eKa75bIESg=; b=A
 bpY7yN9dwEcrIb/IdbbewFovoyJ1/50+BlclpHqDlIpFtMyCk++RQ1hxXuT4ns8wfz0sXYp/QBfbY
 v9L6Ke0jENo4MDOkFZfdLNqDE5Cbr8jMKSIjNijUGGtJnrYxCFUyz5hQAfpbEHZF0gRivTg22CSbJ
 Jm5U5sJgk7HR3StM=;
Received: from smtp153-166.sina.com.cn ([61.135.153.166])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyU8Y-0007pr-Iv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 12:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772799514; bh=FCCL5RLhLg+0VB2YANT0fmHUziIiu1qH0eKa75bIESg=;
 h=From:Subject:Date:Message-ID;
 b=p5i0CEoEs+3coMOKxvGl6kBmUwuYyO8v41NwPxG3ScmZK/4zywbpacoMXEzkgceOx
 zjA6JFYoGOYKieEwcDvk6WZ4LboF2wqy+M26573dLnYYWGocvTsuH86ANxyDsRlLmF
 2W+bhuvpqklK6/2UqLU8janRdjWaxPDoiMtuSTeI=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69AAC609000018F6; Fri, 6 Mar 2026 20:18:19 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 7169486685094
X-SMAIL-UIID: C229FFA36F314455BE80E9969E584D97-20260306-201819-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri,  6 Mar 2026 20:18:00 +0800
Message-ID: <20260306121759.1935322-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang During fsync,
 the flow reaches f2fs_fsync_node_pages(), 
 which scans all dirty node folios of the node mapping. If there are no dirty
 node folios, fsync will not write any node folio. The scenario is a [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [61.135.153.166 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vyU8Y-0007pr-Iv
Subject: [f2fs-dev] [PATCH v2] f2fs: fix data loss caused by fsync not
 writing any node folio
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 6A26A22069B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,sina.com:mid]
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

During fsync, the flow reaches f2fs_fsync_node_pages(), which scans all
dirty node folios of the node mapping. If there are no dirty node
folios, fsync will not write any node folio. The scenario is as follows:

create & write & fsync 'file A'                 writeback node folio
- f2fs_do_sync_file // inline inode
 - f2fs_write_inode // inode folio is dirty

                                                - f2fs_write_node_pages
                                                 - f2fs_sync_node_pages
 - f2fs_fsync_node_pages // no dirty node folios
 sudden poweroff and lost 'file A'

The root cause of the data loss is that although the inode folio is
written successfully, the corresponding node folio is not written with
the FSYNC_BIT_SHIFT mark. As a result, the recovery procedure ignores
this file.

This patch ensures that fsync writes at least one node folio with the
FSYNC_BIT_SHIFT mark for the inode, so that the recovery procedure can
properly detect and process it.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v2:
- Use f2fs_folio_put instead of folio_put to dec folio ref count.
---
 fs/f2fs/node.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2fbfecaf3f7b..e14e5db1e8e6 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1982,6 +1982,22 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 		folio_batch_release(&fbatch);
 		cond_resched();
 	}
+	/*
+	 * All dirty node folios may be written by other thread, but CP hasn't
+	 * been written yet. So, we need to flush one of inode's dnode to
+	 * recovery this inode when encounter sudden power off.
+	 */
+	if (!atomic && nwritten == 0) {
+		struct folio *ifolio;
+
+		ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+		if (IS_ERR(ifolio))
+			return PTR_ERR(ifolio);
+		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
+		folio_mark_dirty(ifolio);
+		f2fs_folio_put(ifolio, true);
+		goto retry;
+	}
 	if (atomic && !marked) {
 		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
 			   ino, last_folio->index);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

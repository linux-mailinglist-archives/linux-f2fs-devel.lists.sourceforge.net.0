Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E665DE2F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6Q-0003Ov-Il;
	Wed, 04 Jan 2023 21:15:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6L-0003OR-NF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V2mmRSbNA08/uL5X+kgeGS/ZlgopWrLZQOgB2XOAgyQ=; b=g4Gx4mz1dXkGG8OVjGrWetZIIp
 Pgf3E0xzw47i9g0ktRxCiQVgSvY08dHPdO03s6b1R3bWFRDicEUaRk2dPe236oMuj+f8ONStC/2fd
 ntUgcT0KI67fnpvKRFwuJbUmhxMakcQgt9/h2zcDpRjBJQ0O5rwtKyYtJzx0RT7DFu3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V2mmRSbNA08/uL5X+kgeGS/ZlgopWrLZQOgB2XOAgyQ=; b=eC8Y5Ym+n7Xo/2ti/eerR/rYKr
 u093yzaCroecqYy5MZo0B5IcmRp+79iw3oDEyIUmWHfrqlaSYaMDaRrXF7DfBZj0Z41pQWPjNiEss
 Jrk91sOlFgG1C74yLdk5t0GbVOsPnse24S1HvgoDPaLQIysWSu4kd13eXUPF26GYJmLE=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6L-00054f-4I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:09 +0000
Received: by mail-pj1-f51.google.com with SMTP id v23so37528887pju.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V2mmRSbNA08/uL5X+kgeGS/ZlgopWrLZQOgB2XOAgyQ=;
 b=FtYpbP6QDTs+0lZleCDk5ZEuYILk9YbbUBPUPSrk3Ld9sQDe/AXWgt1NFFEtyzVwVd
 27XIJK2uMXpNSENtPUU9mTolqKYBkyqWBRgiNaPPr+6HKOkzRrfFG7vh51FRnD5XfrPm
 d3yU7xjojsyNe4TVkT6sdDculOxDV3WAY5LGCcI0ZY86e981vkbE2Keq4xL4jQlm+JDy
 0+d7ZCBTlVPh+hBTPdMLgdJw4vZmFBuuPBlkVC18R54ZYLTjgjJSPd6APtzi8XuZocdm
 Vq+WqxTzB5n+aGbr09OvMJrslxbC/mLCAMYTELt30+n+Q7WR+zOqoKkaC27cWNkSuDUT
 61uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V2mmRSbNA08/uL5X+kgeGS/ZlgopWrLZQOgB2XOAgyQ=;
 b=Lpl5tw9aknCedx6Bc+43ajU1uJ8eb9vCb/ULs+MvpwtaPx8Lm/OPFuxvH3c538dBmc
 GFmy5qviVSfvMEMzCXQuFB7ogmsx8xGZ/XACO0LPqsLTZBj51J9qtzwJFXEyTOF2aguF
 HLiZTmfnV69ONxU4tt9jcIETGa4qQetIV40S/9S2nmZnOcm44JqVYYInMhz6qedHwcWN
 4O/+rS6Wnrk/ghlsV7MSSjzFZHlzYAQFSssLZvD8VD/ZXzKNMW8jzkAiDs99tz2YxNYv
 ADI59q7y9THbXZRAxEYlCb3pM2x2AQCSnYViQsHhQXDwd/pohqIAtb6N3pBiVnGZ8aVB
 LBGw==
X-Gm-Message-State: AFqh2kquiAJMZO2UQGiwwtB3KO3d5uXRLv5IpbJwYH96UHdL8ZWQ1vII
 JV2hNLIWurO8aOmP7UBUw7c=
X-Google-Smtp-Source: AMrXdXsgqtpANtSCNZq+/gUhsOvEJLufITPz0tuKGVLeAke3wLXVvQoumIbsLoPmk9yfZKpeAUrvrg==
X-Received: by 2002:a17:90b:2291:b0:226:43ba:54af with SMTP id
 kx17-20020a17090b229100b0022643ba54afmr18504817pjb.2.1672866903454; 
 Wed, 04 Jan 2023 13:15:03 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:03 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:30 -0800
Message-Id: <20230104211448.4804-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert to use folios throughout. This function is in
 preparation
 to remove find_get_pages_range_tag(). Also modified this function to write
 the whole batch one at a time, rather than calling for a new set every single
 write. Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6L-00054f-4I
Subject: [f2fs-dev] [PATCH v5 05/23] afs: Convert afs_writepages_region() to
 use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use folios throughout. This function is in preparation to
remove find_get_pages_range_tag().

Also modified this function to write the whole batch one at a time,
rather than calling for a new set every single write.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Tested-by: David Howells <dhowells@redhat.com>
---
 fs/afs/write.c | 116 +++++++++++++++++++++++++------------------------
 1 file changed, 59 insertions(+), 57 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 19df10d63323..2d3b08b7406c 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -704,85 +704,87 @@ static int afs_writepages_region(struct address_space *mapping,
 				 bool max_one_loop)
 {
 	struct folio *folio;
-	struct page *head_page;
+	struct folio_batch fbatch;
 	ssize_t ret;
+	unsigned int i;
 	int n, skips = 0;
 
 	_enter("%llx,%llx,", start, end);
+	folio_batch_init(&fbatch);
 
 	do {
 		pgoff_t index = start / PAGE_SIZE;
 
-		n = find_get_pages_range_tag(mapping, &index, end / PAGE_SIZE,
-					     PAGECACHE_TAG_DIRTY, 1, &head_page);
+		n = filemap_get_folios_tag(mapping, &index, end / PAGE_SIZE,
+					PAGECACHE_TAG_DIRTY, &fbatch);
+
 		if (!n)
 			break;
+		for (i = 0; i < n; i++) {
+			folio = fbatch.folios[i];
+			start = folio_pos(folio); /* May regress with THPs */
 
-		folio = page_folio(head_page);
-		start = folio_pos(folio); /* May regress with THPs */
-
-		_debug("wback %lx", folio_index(folio));
+			_debug("wback %lx", folio_index(folio));
 
-		/* At this point we hold neither the i_pages lock nor the
-		 * page lock: the page may be truncated or invalidated
-		 * (changing page->mapping to NULL), or even swizzled
-		 * back from swapper_space to tmpfs file mapping
-		 */
-		if (wbc->sync_mode != WB_SYNC_NONE) {
-			ret = folio_lock_killable(folio);
-			if (ret < 0) {
-				folio_put(folio);
-				return ret;
-			}
-		} else {
-			if (!folio_trylock(folio)) {
-				folio_put(folio);
-				return 0;
+			/* At this point we hold neither the i_pages lock nor the
+			 * page lock: the page may be truncated or invalidated
+			 * (changing page->mapping to NULL), or even swizzled
+			 * back from swapper_space to tmpfs file mapping
+			 */
+			if (wbc->sync_mode != WB_SYNC_NONE) {
+				ret = folio_lock_killable(folio);
+				if (ret < 0) {
+					folio_batch_release(&fbatch);
+					return ret;
+				}
+			} else {
+				if (!folio_trylock(folio))
+					continue;
 			}
-		}
 
-		if (folio_mapping(folio) != mapping ||
-		    !folio_test_dirty(folio)) {
-			start += folio_size(folio);
-			folio_unlock(folio);
-			folio_put(folio);
-			continue;
-		}
+			if (folio->mapping != mapping ||
+			    !folio_test_dirty(folio)) {
+				start += folio_size(folio);
+				folio_unlock(folio);
+				continue;
+			}
 
-		if (folio_test_writeback(folio) ||
-		    folio_test_fscache(folio)) {
-			folio_unlock(folio);
-			if (wbc->sync_mode != WB_SYNC_NONE) {
-				folio_wait_writeback(folio);
+			if (folio_test_writeback(folio) ||
+			    folio_test_fscache(folio)) {
+				folio_unlock(folio);
+				if (wbc->sync_mode != WB_SYNC_NONE) {
+					folio_wait_writeback(folio);
 #ifdef CONFIG_AFS_FSCACHE
-				folio_wait_fscache(folio);
+					folio_wait_fscache(folio);
 #endif
-			} else {
-				start += folio_size(folio);
+				} else {
+					start += folio_size(folio);
+				}
+				if (wbc->sync_mode == WB_SYNC_NONE) {
+					if (skips >= 5 || need_resched()) {
+						*_next = start;
+						_leave(" = 0 [%llx]", *_next);
+						return 0;
+					}
+					skips++;
+				}
+				continue;
 			}
-			folio_put(folio);
-			if (wbc->sync_mode == WB_SYNC_NONE) {
-				if (skips >= 5 || need_resched())
-					break;
-				skips++;
+
+			if (!folio_clear_dirty_for_io(folio))
+				BUG();
+			ret = afs_write_back_from_locked_folio(mapping, wbc,
+					folio, start, end);
+			if (ret < 0) {
+				_leave(" = %zd", ret);
+				folio_batch_release(&fbatch);
+				return ret;
 			}
-			continue;
-		}
 
-		if (!folio_clear_dirty_for_io(folio))
-			BUG();
-		ret = afs_write_back_from_locked_folio(mapping, wbc, folio, start, end);
-		folio_put(folio);
-		if (ret < 0) {
-			_leave(" = %zd", ret);
-			return ret;
+			start += ret;
 		}
 
-		start += ret;
-
-		if (max_one_loop)
-			break;
-
+		folio_batch_release(&fbatch);
 		cond_resched();
 	} while (wbc->nr_to_write > 0);
 
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

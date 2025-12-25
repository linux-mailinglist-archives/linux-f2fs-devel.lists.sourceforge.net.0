Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECABCDDCD0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Dec 2025 14:00:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZQ6YR7PgP+2eVmmZF8LBOieEWNr6St21evqR+z8Th0M=; b=eUA50dXEu/0JzOdp3G1zy/xcM0
	t6VLtaOMKafXVpI/sVULEQCS4Wn71rdepWevdhME5dVH6b38ie2UDj/HriaOHv9Z8PcNhxQi6ldNe
	0d8sXZHhhGGO/01aOytwkImHyd5qSL/Wkdky+OAA55/VR3guI0RS0MBsbONl6zV38AyY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYkxG-0001QL-J4;
	Thu, 25 Dec 2025 13:00:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vYkxF-0001QD-10
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Dec 2025 13:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fLRU+Pr517o9VmHSDDbN7BI8zVi0c24nVDbYsIyK25s=; b=H2N7PCX+pAgX6xVi7ZDsnniPvn
 w8+cQCZkdPuIMA4aI8cnvpLFSJyKCXr+okZW75LrAK/qAqPDy+kx7pl896x6V3QejhqX1F47wqkig
 wxnXpvOzrlkP0suocpgM160mDvGtqKsVfXX41QNocSorNg79xlkkNOq1baKC1iDaaPYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fLRU+Pr517o9VmHSDDbN7BI8zVi0c24nVDbYsIyK25s=; b=Q
 0oO3C2SnpFCVWa+Itm9N/XDyznox0+icFcpK0TKEl1evPVfnsT3XhFYdow3ubtPytJx6CY9OfQozj
 1UlHQAxwNjqm5jsjKTOZIodqi70Y/NrMHgL0ajqfptcDCjdwtte4DvgenVjQ9LGIDHbIsTVmE/+H3
 BbdeKAGm15UgYSec=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vYkxE-0000XW-E4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Dec 2025 13:00:32 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a1022dda33so54093735ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Dec 2025 05:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766667622; x=1767272422; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fLRU+Pr517o9VmHSDDbN7BI8zVi0c24nVDbYsIyK25s=;
 b=izAKde3n+fcMfgT2+XiWXkCOMpetXdcakoaLeMbZYnLdOJudqSV5CfAz79IBUUT5Ui
 VGAU8KSeCLi+lYi+RowCSBMB6qHXMCILj1ocoVcRNoqI0/JQU77CuJsWKNIyrBGhF2ZU
 3qrfu5aZIfwBhFa3TjnygZ5UJBDspY8bilmeTOi8QJ4kfNebTe4sEywWFB59bGpZgmLu
 hh/qnOKt6Bg7SU5kQAItxZpqTZG0MAVAiiYe884tMhRhVVxpo8zmMbTHmf8TXrc0Il8N
 p2WJhx2E1pKputfWi0M5PZrwOmEvXBLJ38qi6N5+vvTkJdG3cRJNDhAgh0pwXwtukqF7
 5Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766667622; x=1767272422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fLRU+Pr517o9VmHSDDbN7BI8zVi0c24nVDbYsIyK25s=;
 b=j/KvcQ79/WiqeyvhMGOgFN16AYPLM8Ubn0pQ8D1TNlZMk94M9exZydxt+ZdJVyMrmA
 yrO1neQXI7cVdURTQpLM094KXr3jaRjTdfSI41iG3aWmwqSyNNzJqCSxomUr0vwiS+wb
 nC0CNhw8NGfgU6yBm+ChomozgaAcPaHe9GYCdKg67oE9ZUdsOBweGBE1ClxFVhryhrjt
 Bkr+QhcXnAPUS81JFFtbOxLWj5QvFbW2KGULlYq0zIbYNpFxXD1iltW2KAtymn5g2LV7
 Pdc50SOic5i73n1NsXMQNz2RYoMBpOZOSVeAFrxQLz3N7K0sxjbQJ5ppPQeiIRu1jukR
 /j9g==
X-Gm-Message-State: AOJu0YxG2/I7mpV8sLKJrzbt97q1j4vkskUkn9SXdhItnISwKiZ5CH6s
 nzoI61O2lHQvyTlzYVD7WSoJaq/C9Mnw1bqoe3vZPVAGqWuY/5JoYXku9thE7+p+
X-Gm-Gg: AY/fxX6Zzs8xZKRRYv9FETmuX7w2z4Fev2W25+JbMlyUrbsLjCe38/1NrgzpdQjhAxZ
 8tyr95hpERAQE4p7r/P5yoJyytN+BI6cInFqJgqy8dSXdxFVo1t5ETAXz3fEMKYlcX1/m7+/2/o
 93arksMAKlr6LTbCvnhGVzXovCMb0lUxPaZPBboytY8/9mEfW9rOKKJFBwsrwdL/JpzbXkkMSr/
 m8Piw+qsX18ffOjgz8mXDApgYpplTxRs8ghdogn8yUj83Yf3FYYaH0VaWruYkyQ7iPG+9hQeCRg
 JyvdHGmxDAIUh++Zl/cUCRWAXW5QKkFrKca8msOhnGZsBjnsWXEHqIjMrU9TWyeOnozcHO+twtt
 lB3y6BBwh4JBzERncJUjTa6muR7vh8DdbEpwA2M1yR+iII1D4AcZz31e/B6sJtaCKxy6JqOwghc
 SKGU279AkvUBFoutkBuOLVvcOnJNGAGJIreVCah2JsN8BlVjJ5KwlsvXef+Q==
X-Google-Smtp-Source: AGHT+IGBcrQRWekH6ClkyVGq7SO/e1xTTjqm7z1YkdtUL/5YLA55U0L9sA+pzTiMUcPtMuDWi6KFYw==
X-Received: by 2002:a17:903:3b8b:b0:2a0:b461:c883 with SMTP id
 d9443c01a7336-2a2f2a354ebmr198878095ad.45.1766667621627; 
 Thu, 25 Dec 2025 05:00:21 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d776ebsm183928415ad.99.2025.12.25.05.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 05:00:21 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 25 Dec 2025 20:59:55 +0800
Message-ID: <20251225125954.4055570-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang f2fs_folio_wait_writeback ensures the
 folio write is submitted to the block layer via __submit_merged_write_cond,
 then waits for the folio to complete. Other I/O submissions are irrelevant
 to f2fs_fol [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.214.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vYkxE-0000XW-E4
Subject: [f2fs-dev] [PATCH 1/1] f2fs: return immediately after submitting
 the specified folio in __submit_merged_write_cond
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

f2fs_folio_wait_writeback ensures the folio write is submitted to the
block layer via __submit_merged_write_cond, then waits for the folio to
complete. Other I/O submissions are irrelevant to
f2fs_folio_wait_writeback. Thus, if the folio write bio is already
submitted, the function can return immediately.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/data.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 12bf4b6e0075..c743352b686d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -678,8 +678,12 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 			ret = __has_merged_page(io->bio, inode, folio, ino);
 			f2fs_up_read(&io->io_rwsem);
 		}
-		if (ret)
+		if (ret) {
 			__f2fs_submit_merged_write(sbi, type, temp);
+			/* don't need to submit other types of bio. */
+			if (folio)
+				break;
+		}
 
 		/* TODO: use HOT temp only for meta pages now. */
 		if (type >= META)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

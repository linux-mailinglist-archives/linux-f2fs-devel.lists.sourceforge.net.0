Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E1F44A6BE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 07:17:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkKRm-0003F4-HW; Tue, 09 Nov 2021 06:17:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <niuzhiguo84@gmail.com>) id 1mkKRl-0003Ey-AU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 06:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+4p8iCSg5fdU2hA+HAu0ciUTCxD+Jovqw6Lw+zBsQn4=; b=lNh75JAAYsNDtE1YK+qNXqgvSY
 zSqfg830ytbdmBJL5tUW6de7uEJN0jXfeHObcOxamoARKJo4tyIfS4wEPkvti+e4Jp49EYHTCJ4nI
 ehhY8Lad6ivLeTlLvqYY49RuAUxW7qdroFEKb6KLmBrcWKJBASaStLMZI4g+XziN+Pz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+4p8iCSg5fdU2hA+HAu0ciUTCxD+Jovqw6Lw+zBsQn4=; b=WrVic23heCOainUFUPJWzpanMG
 EhdgnmjTVhdTiO4hd4lx+SB4Y2T0uwHE04RJ53kz3ecL2s/o/Rir6HZfd4D3R9h+0MbRRW20dils2
 sUcMTW2GUcShDIglJuPF7C5qM+/zniSUAT51GBonUUjChgfuwf43FrRWqU0VUnbVDQHw=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mkKRl-006seQ-SK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 06:17:30 +0000
Received: by mail-pg1-f170.google.com with SMTP id f5so17508480pgc.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 08 Nov 2021 22:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=+4p8iCSg5fdU2hA+HAu0ciUTCxD+Jovqw6Lw+zBsQn4=;
 b=c0mYPeIubezW8It6zTFUxpYceqiy3dip6u89M/mAOYYRfpLH8q5Oal3P5CYZCw5CdV
 vwNCOfuXNDP0oQGFnwzn0skTydWNRzEOxu35+gK1RzddUKbZvPC76yg+QacOLFTOEtFo
 HzTUTJbRM5hJfM+vSWdWGx0PZHVjpgvkmtWYE0bwE/Jz6gzTVrq78p7QCwbs8CBINvTG
 lMlIN/z1Jx45f4dBzS+HtV3wrYkRhi+IIXbcKj2gSRQXVjEF2GCdI4HQUBmsJNNozYJf
 qxkb8ko/OzmEfh5/5KpurbKw082vrTl+96Sbl1biCeGJh78mKfNt/Fbl9fo7YEYt8EFS
 CoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+4p8iCSg5fdU2hA+HAu0ciUTCxD+Jovqw6Lw+zBsQn4=;
 b=g48QlYWb20tC8+kSYRIN6eRBBR7wrrHNOSDLj7VX9TBscmYQaxbgFklbxY0x6rqa6x
 Od72TeIpRt2DL/JP9ujJMblMIOEJj/G14lXFX081evHzy5a9AKYY5QEpT9RcYhZO2x1p
 HOcN306SLgjYH1oKkCG/0NnKCW0vblQmDF9s//vYiWZBRDqK43FzeSof87i4HSeg7YgX
 v1vDI1qfot4ChCBU/X2HiMZgeGcGf+FcdjOreZqUdGOk3FrUZ/MVUJY+EZ3Ybl3FBPka
 ZwYVl9OTimiX0ppA0c5yCXKyNDo/Sj6pdzqXecPQBpWVxVZZkLeuOqWCO3l4PugnXV9R
 wK+A==
X-Gm-Message-State: AOAM5307bDi9ZleJqU1u+kr9IMQT4urf6rJZBDnT6BC4hosqJ6oO07bo
 ItSjjcgLZ2zXFPGWfswwAUc=
X-Google-Smtp-Source: ABdhPJw3oDQweJ7mnPkwHh6285Fc0kB7Vmga2oj403dTuyul3HqVfyW9lpBD58b6r2w8K4su/LX/RA==
X-Received: by 2002:a63:9902:: with SMTP id d2mr370428pge.104.1636438644271;
 Mon, 08 Nov 2021 22:17:24 -0800 (PST)
Received: from bj08434pcu.spreadtrum.com ([117.18.48.102])
 by smtp.gmail.com with ESMTPSA id y18sm7586887pgh.18.2021.11.08.22.17.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Nov 2021 22:17:24 -0800 (PST)
From: niuzhiguo84@gmail.com
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Tue,  9 Nov 2021 14:16:48 +0800
Message-Id: <1636438608-27597-1-git-send-email-niuzhiguo84@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Zhiguo Niu There could be a scenario as following: The
 inodeA and inodeB are in b_io queue of writeback inodeA : f2fs's node inode
 inodeB : a dir inode with only one dirty pages, and the node page of inodeB
 cach [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [niuzhiguo84[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [niuzhiguo84[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mkKRl-006seQ-SK
Subject: [f2fs-dev] [PATCH Vx 1/1] f2fs: Avoid deadlock between writeback
 and checkpoint
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
Cc: Jing.Xia@unisoc.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Zhiguo Niu <zhiguo.niu@unisoc.com>

There could be a scenario as following:
The inodeA and inodeB are in b_io queue of writeback
inodeA : f2fs's node inode
inodeB : a dir inode with only one dirty pages, and the node page
of inodeB cached into inodeA

writeback:

wb_workfn
wb_writeback
blk_start_plug
        loop {
        queue_io
        progress=__writeback_inodes_wb
                __writeback_single_inode
                        do_writepages
                                f2fs_write_data_pages
                                wbc->pages_skipped +=get_dirty_pages
                        inode->i_state &= ~dirty
                wrote++
                requeue_inode
        }
blk_finish_plug

checkpoint:

f2fs_write_checkpoint
f2fs_sync_dirty_inodes
filemap_fdatawrite
do_writepages
f2fs_write_data_pages
        f2fs_write_single_data_page
                f2fs_do_write_data_page
                        set_page_writeback
                        f2fs_outplace_write_data
                                f2fs_update_data_blkaddr
                                        f2fs_wait_on_page_writeback
                inode_dec_dirty_pages

1. Writeback thread flush inodeA, and push it's bio request in task's plug;
2. Checkpoint thread writes inodeB's dirty page, and then wait its node
    page writeback cached into inodeA which is in writeback task's plug
3. Writeback thread flush inodeB and skip writing the dirty page as
    wb_sync_req[DATA] > 0.
4. As none of the inodeB's page is marked as PAGECACHE_TAG_DIRTY, writeback
    thread clear inodeB's dirty state.
5. Then inodeB is moved from b_io to b_dirty because of pages_skipped > 0
    as checkpoint thread is stuck before dec dirty_pages.

This patch collect correct pages_skipped according to the tag state in
page tree of inode

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Jing Xia <jing.xia@unisoc.com>
---
 fs/f2fs/data.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4fd6c246c9a..e98628e3868c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3237,7 +3237,9 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	return ret;
 
 skip_write:
-	wbc->pages_skipped += get_dirty_pages(inode);
+	wbc->pages_skipped +=
+		mapping_tagged(inode->i_mapping, PAGECACHE_TAG_DIRTY) ?
+		get_dirty_pages(inode) : 0;
 	trace_f2fs_writepages(mapping->host, wbc, DATA);
 	return 0;
 }
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

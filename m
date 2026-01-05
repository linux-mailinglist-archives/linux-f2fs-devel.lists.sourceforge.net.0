Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE794CF4690
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 05 Jan 2026 16:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvLRTxsNNcrPgDxCbT9mBSWlTxlgT/vfPNnSs+CqnsI=; b=VSJE5sBW8JVgFkgt+N+QiwIpAB
	TL2zLLbyftT6prs6ybARNabXx0Jnc+DWsSylyjyAlYVvzb5tN7JfIQrSPBINIbPTMA+cQTiWKF0aD
	TX3PR4vCbfAXyn6VOx782dbsr+zIcrxRVRkd6/IwXaJ3XKPfSLPRmWO0k/32OGUd6mRA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcmYa-00035S-Gm;
	Mon, 05 Jan 2026 15:31:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vcmYZ-00035K-Me
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 15:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m1S4iy66eHRyWo/r6WxSdeP3G8a/4YCzSxpE2sfnPHI=; b=dlAUEv/NVNUvy7h6YlWiLGNp8j
 8JGY8hrQCZqdDelpCODzELQvmRvqPFdW/qFdp4cj9CFT2iDZDC7Fs2PSF1jGok0PIZuyVFYeheBAP
 6PJpBHkBNkcwYww/qixIX//qeeA11g/PryivCFB2akYn88ML7nNlPuCQvRBQDQR3djTo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m1S4iy66eHRyWo/r6WxSdeP3G8a/4YCzSxpE2sfnPHI=; b=DHhCCrfnVn3TkhoN/usmg3QMyp
 RXXIq5oARY2MeO6rfnBCLAJgl4WomOdPeKnWyj+9ufOE79uoJkwr+FR8UdPAFZOeywZtM7Q7D3BZg
 HL915NQiDS4+ibpurqZkIAG5xAu5YyVYnBdLosW46G+Q3Kd9kZIva8hW/3YbRc7d2/Cg=;
Received: from m16.mail.126.com ([117.135.210.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcmYY-0006ER-Ri for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 15:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=m1
 S4iy66eHRyWo/r6WxSdeP3G8a/4YCzSxpE2sfnPHI=; b=LELhmAWZ0loSFBqqxd
 vwrpkQIWzDJR+tXrXIKxtKMl8uDtkd03MTW159GNhp9+PDuT4rQ3etwnoV2cxTXR
 PTdd23SRTPefPZDc8WkEuuqFV0cH1/ijyeBRN2WUf9iiQbAdJmmb3hoh5a+JR5xD
 3b8arv2EWW7hyQyY/DcyJ13yk=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t6092Vtp4nHABA--.665S3;
 Mon, 05 Jan 2026 23:31:11 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Kim Jaegeuk <jaegeuk@kernel.org>
Date: Mon,  5 Jan 2026 23:30:57 +0800
Message-Id: <20260105153101.152892-2-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105153101.152892-1-nzzhao@126.com>
References: <20260105153101.152892-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3t6092Vtp4nHABA--.665S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF48Wr48Cr15Wr43tFy3CFg_yoWDGrg_uw
 18Jrn7WryrJF15A3WYy3y8trZagrn5Cr1I9a1xtr4SyFn8J3yIya4qvwn3ArnrW3yjy345
 GrZFq3yfCr9rCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRXJ5F7UUUUU==
X-Originating-IP: [2409:8a20:4df7:2871:d124:26e2:5013:1aa3]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsR+2hmlb2T9IwAAA3C
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_folio_state is attached to folio->private and is
 expected
 to start with read_pages_pending == 0. However, the structure was allocated
 from ffs_entry_slab without being fully initialized, which ca [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.7 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vcmYY-0006ER-Ri
Subject: [f2fs-dev] [PATCH v1 1/5] f2fs: Zero f2fs_folio_state on allocation
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
Cc: Nanzhe Zhao <nzzhao@126.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_folio_state is attached to folio->private and is expected to start
with read_pages_pending == 0.  However, the structure was allocated from
ffs_entry_slab without being fully initialized, which can leave
read_pages_pending with stale values.

Allocate the object with __GFP_ZERO so all fields are reliably zeroed at
creation time.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 471e52c6c1e0..ab091b294fa7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2389,7 +2389,7 @@ static struct f2fs_folio_state *ffs_find_or_alloc(struct folio *folio)
 	if (ffs)
 		return ffs;

-	ffs = f2fs_kmem_cache_alloc(ffs_entry_slab, GFP_NOIO, true, NULL);
+	ffs = f2fs_kmem_cache_alloc(ffs_entry_slab, GFP_NOIO | __GFP_ZERO, true, NULL);

 	spin_lock_init(&ffs->state_lock);
 	folio_attach_private(folio, ffs);
--
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

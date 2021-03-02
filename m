Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C87C329CE7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 12:40:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lH3Ns-000058-C7; Tue, 02 Mar 2021 11:40:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <heyunlei@hihonor.com>) id 1lH3Np-00004v-19
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 11:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7GNW4/p9DXQ7MmMInQr0RaBpuTSToLTdGH9PEMnHZdo=; b=HwXKB4h5PF0SU/6onOjZ4wGSnO
 fV8K28S6qA1ql4RHNSVCMUlHdMtD7mITnz3lxMGsaFSBR3fYr5NKqb2ALP+Br3j7ElowMu8hvp+Dm
 SLCRsAwiV2r2L3PUl/AWHUEfiJey+VZjKtEDjXB2Qm9ZU1L/OdFbNNeP/QAELlG4Nnxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7GNW4/p9DXQ7MmMInQr0RaBpuTSToLTdGH9PEMnHZdo=; b=SODo0vG2qKhQ/cojArM9vYVZ0Y
 fp8uQ8mO9h0N/uqdQC87Svvz2gtrYISB1gFZKP/AsDLf557ehsrabOZVCovTAX9W6IK92zf36iDfe
 3Z/NJ/SEpy5xb6sMx6rCpI7bTamgHVyLMDVE0iPHHvBpGC6tUBjSXaeQSXNWjo/Qp2DQ=;
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net ([165.227.154.27])
 by sfi-mx-1.v28.lw.sourceforge.com with smtp (Exim 4.92.2)
 id 1lH3Nk-00BAyJ-2N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 11:40:08 +0000
Received: from pekshcsitd06010.hihonor.com (unknown [198.19.131.39])
 by front-1 (Coremail) with SMTP id CwGowAAXf07LIz5gcsNOAA--.1848S2;
 Tue, 02 Mar 2021 19:38:52 +0800 (CST)
From: Yunlei He <heyunlei@hihonor.com>
To: chao@kernel.org,
	jaegeuk@kernel.org,
	ebiggers@kernel.org
Date: Tue,  2 Mar 2021 19:38:50 +0800
Message-Id: <20210302113850.17011-1-heyunlei@hihonor.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: CwGowAAXf07LIz5gcsNOAA--.1848S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtw47Xr1UCrW5ur4kGF45ZFb_yoW8JF17pF
 yDGFyUWw1rG3y7Wr1vvF1Uuw1rKFy7KrW2vFyDuw1kW3WkXwnYvayvyFW09a1aqr97Jw40
 qr4UCa9rCr17Ar7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkE1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
 XwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
 w28IcVCjz48v1sIEY20_XFWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUA8n
 5UUUUU=
X-CM-SenderInfo: pkh130hohlqxxlkr003uof0z/1tbiAQIKEV3ki2sD+gABs5
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [165.227.154.27 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hihonor.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [165.227.154.27 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lH3Nk-00BAyJ-2N
Subject: [f2fs-dev] [PATCH] f2fs: fsverity: modify truncation for verity
 enable failed
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
Cc: linux-fscrypt@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If file enable verity failed, should truncate anything wrote
past i_size, including cache pages. Move the truncation to
the end of function, in case of f2fs set xattr failed.

Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Yunlei He <heyunlei@hihonor.com>
---
 fs/f2fs/verity.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 054ec852b5ea..610f2a9b4928 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -169,10 +169,6 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
 			err = filemap_write_and_wait(inode->i_mapping);
 	}
 
-	/* If we failed, truncate anything we wrote past i_size. */
-	if (desc == NULL || err)
-		f2fs_truncate(inode);
-
 	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
 
 	if (desc != NULL && !err) {
@@ -185,6 +181,13 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
 			f2fs_mark_inode_dirty_sync(inode, true);
 		}
 	}
+
+	/* If we failed, truncate anything we wrote past i_size. */
+	if (desc == NULL || err) {
+		truncate_inode_pages(inode->i_mapping, inode->i_size);
+		f2fs_truncate(inode);
+	}
+
 	return err;
 }
 
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

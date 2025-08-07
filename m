Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E826B1D0FB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 04:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B5OrlSM52Y2O0Bvm04RrMsthVqiHIH/0k8jxxQSnp6E=; b=kebjXM8+7CBxBvbsNmNceqCFgW
	3OcZJjh2f/tH7hkDid4XpXL9h+M4dnBJVwtGktrofmmeDG6KJFScBMZDZWmj2LA0IkEYDh38lI2lF
	Fi9FCX3ClXd2W64dcSEdrjRGR1sFAuExp7TJcx1bgZC0QAkjedGEgIi+2C8aFhwmYGcg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujqcc-0006Lc-SV;
	Thu, 07 Aug 2025 02:44:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujqcb-0006LW-Rq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 02:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t3lJHR4SctausyfUbaX10Ujwi+4B/PmzNUNYBrcN4EE=; b=NEc3sf88XJdk/va1BbwwQ8f3zJ
 NVc249STxMw6/iz/pFJTtSCYT2WeHUA/BYzTl/CIdT0XWIpJqKfOJ9Q7GUbmvEqWbBHoIngDwPhj/
 S4ZdmPq9KPkz/Uc6APO1/M76b3QDyRe55bm2JQ0yG+ryNPkYInZfv4Xi3ZfSgWkxespw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=t3lJHR4SctausyfUbaX10Ujwi+4B/PmzNUNYBrcN4EE=; b=E
 wP+R89waVbV2R4Y/PWUV/D+ZHCzbikobIO5WWOaCVnTFILWUcOx6eksvgp5xkzpKLknfJeDeLWeYI
 70omidGbBDIT5sX0UtDfu0wgT93rW59Aew5wlTf/cRJC4x9AmImigicaS+UfKB+0zr/eZvtjKATrh
 pp6c+JXN9fgXdB18=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujqcb-0000va-Er for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 02:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C413DA4DF0C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Aug 2025 02:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5495C4CEF8;
 Thu,  7 Aug 2025 02:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754534678;
 bh=c9pOcEq733xsT46pnT71jjNVyY0UXgWUHpI7NDDAkFg=;
 h=From:To:Cc:Subject:Date:From;
 b=jq/MaPLF3kzXUvUxqp9OPWs3Nzvxyc64oiZrObh2md7bM5Noq3cptH8zoIE6Jdlft
 1+fUsO8lHrhIO/jn6Wgslcu8+K3jEV3gP4/AdGQW5b6zP2PLTDsY03KorNhFc2ZdVk
 4bA2IKAPBmk9LYERasyCX3pi8iOYaBLy99+L+qv/JX+51UC9mxA9IoCAcvUvgHG60s
 +QsCLt9jzxZ+SnEzjzyPzZ2CPpvY3HNIfuiDayTER1Mo3jhgKtomXOyxVNUXIdd3Du
 r3hd/U7H0R/iSiNienhdajtzzngV9JKOQe7f4xNlyu8py8oZS8UQKKAqa/nK9PMDMa
 yIClP7oiW5JZg==
To: jaegeuk@kernel.org
Date: Thu,  7 Aug 2025 10:44:31 +0800
Message-ID: <20250807024431.3805293-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As reported, on-disk footer.ino and footer.nid is the same
 and out-of-range, let's add sanity check on f2fs_alloc_nid() to detect any
 potential corruption in free_nid_list. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/node.c | 17 ++++++++++++++++- include/linux/f2fs_fs.h | 1 + 2
 files changed, 17 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujqcb-0000va-Er
Subject: [f2fs-dev] [PATCH] f2fs: fix to detect potential corrupted nid in
 free_nid_list
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

As reported, on-disk footer.ino and footer.nid is the same and
out-of-range, let's add sanity check on f2fs_alloc_nid() to detect
any potential corruption in free_nid_list.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c          | 17 ++++++++++++++++-
 include/linux/f2fs_fs.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 27743b93e186..286e8a53f8e7 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -27,12 +27,17 @@ static struct kmem_cache *free_nid_slab;
 static struct kmem_cache *nat_entry_set_slab;
 static struct kmem_cache *fsync_node_entry_slab;
 
+static inline bool is_invalid_nid(struct f2fs_sb_info *sbi, nid_t nid)
+{
+	return nid < F2FS_ROOT_INO(sbi) || nid >= NM_I(sbi)->max_nid;
+}
+
 /*
  * Check whether the given nid is within node id range.
  */
 int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid)
 {
-	if (unlikely(nid < F2FS_ROOT_INO(sbi) || nid >= NM_I(sbi)->max_nid)) {
+	if (unlikely(is_invalid_nid(sbi, nid))) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: out-of-range nid=%x, run fsck to fix.",
 			  __func__, nid);
@@ -2634,6 +2639,16 @@ bool f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid)
 		f2fs_bug_on(sbi, list_empty(&nm_i->free_nid_list));
 		i = list_first_entry(&nm_i->free_nid_list,
 					struct free_nid, list);
+
+		if (unlikely(is_invalid_nid(sbi, i->nid))) {
+			spin_unlock(&nm_i->nid_list_lock);
+			f2fs_err(sbi, "Corrupted nid %u in free_nid_list",
+								i->nid);
+			f2fs_stop_checkpoint(sbi, false,
+					STOP_CP_REASON_CORRUPTED_NID);
+			return false;
+		}
+
 		*nid = i->nid;
 
 		__move_free_nid(sbi, i, FREE_NID, PREALLOC_NID);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 2f8b8bfc0e73..6afb4a13b81d 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -79,6 +79,7 @@ enum stop_cp_reason {
 	STOP_CP_REASON_FLUSH_FAIL,
 	STOP_CP_REASON_NO_SEGMENT,
 	STOP_CP_REASON_CORRUPTED_FREE_BITMAP,
+	STOP_CP_REASON_CORRUPTED_NID,
 	STOP_CP_REASON_MAX,
 };
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

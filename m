Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B93439812
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Oct 2021 16:05:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mf0ba-0000hf-At; Mon, 25 Oct 2021 14:05:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hj514.kim@samsung.com>) id 1mf0bZ-0000hV-2R
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Oct 2021 14:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fey+6MHijgaTNXfUD+lxnyfQlzWGLpNI+7tezBCSDCk=; b=hYcPyfQdqWuoLSitpXAQAaOPIZ
 bPZQBvxJYNosP3gPqyseNQs6qhwyBlTSTcpMZfD8NPG/d3qo6tEXohBdyvAWxOwBD1iA0W2IvclG+
 HfwgzEJs/PQwD+5G8zktEcRQiVPVjGFtyVl1g+gFLKmF4LLBt8VcOz6gkPXstdzLkfTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fey+6MHijgaTNXfUD+lxnyfQlzWGLpNI+7tezBCSDCk=; b=m
 JmRMgz6LRo1jKJjtDYxF1AbtM2vIydqHtF3/oowWgYaBXDm6Fq77AD26D3M9vzJYxzHd2V76e3n4y
 cwYd/s5ojQ4HoN+rHQVH8nuQ/BtYHuOBuexxGm3zPbDi1BdOoF9VyR/s8GQUz/zoamychRKu1BouN
 +MG9k10ZWQL1U7mM=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mf0bX-00Fjsg-O9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Oct 2021 14:05:37 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20211025140529epoutp021edbec1a54e21d2c959872b1f4bc48cb~xSx1Sp44Q0507605076epoutp02U
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Oct 2021 14:05:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20211025140529epoutp021edbec1a54e21d2c959872b1f4bc48cb~xSx1Sp44Q0507605076epoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635170729;
 bh=fey+6MHijgaTNXfUD+lxnyfQlzWGLpNI+7tezBCSDCk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=fKCEq9cQg6nF9/EBUtKHHvJDzTxrZZYxkTTB3Qxs7SbabOxPvSn8IfXsqpgBTcc0P
 O8ey2XZXdYMadI8u8m9fdpjgF0G72iHxCVAcAhYwk7zOsLaCWql7qzihTUWeoHRp4C
 Zc+gFp36klYWgwkM2rVqAODtP90tKFEJnSQki7qU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211025140528epcas1p1414e38eb3f7e8f0ce83e2947801c914a~xSx0_7Q3Z1746717467epcas1p1q;
 Mon, 25 Oct 2021 14:05:28 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.248]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4HdGtv51Z1z4x9Pt; Mon, 25 Oct
 2021 14:05:27 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 86.7D.09574.7A9B6716; Mon, 25 Oct 2021 23:05:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20211025140526epcas1p3b4a59df0935297572c6417c841a4c514~xSxzFo7kx2735427354epcas1p3V;
 Mon, 25 Oct 2021 14:05:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211025140526epsmtrp16134229dd8e2885f32384c5d6ee924e5~xSxzE9O6T1138511385epsmtrp1E;
 Mon, 25 Oct 2021 14:05:26 +0000 (GMT)
X-AuditID: b6c32a35-195ff70000002566-9d-6176b9a72b6e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 05.C5.08738.6A9B6716; Mon, 25 Oct 2021 23:05:26 +0900 (KST)
Received: from hj514.kim-office (unknown [10.253.100.146]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211025140526epsmtip27f8f1f9dffb215a4dbbc781f7d14b3c5~xSxy1E0Df1466814668epsmtip2A;
 Mon, 25 Oct 2021 14:05:26 +0000 (GMT)
From: Hyeong-Jun Kim <hj514.kim@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Mon, 25 Oct 2021 23:05:16 +0900
Message-Id: <20211025140517.14741-1-hj514.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCKsWRmVeSWpSXmKPExsWy7bCmvu7ynWWJBs1b1CxOTz3LZDG94yCb
 xZP1s5gtLi1yt7i8aw6bxZZ/R1gd2Dw2repk89i94DOTR9+WVYwenzfJBbBEZdtkpCampBYp
 pOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAO1WUihLzCkFCgUkFhcr
 6dvZFOWXlqQqZOQXl9gqpRak5BSYFegVJ+YWl+al6+WlllgZGhgYmQIVJmRnfD7yj73gMntF
 Y898lgbGLWxdjJwcEgImEvfXLQGyuTiEBHYwSqw68QXK+cQo8ePRRxYI5zOjxLWOV6wwLd0H
 r0FV7WKU2PNyFyuE855RYtfkXWCD2QR0JD7MWskIYosI2Et8/n6dBcRmFpjNKHH/aC6ILSwQ
 LbHuzlKgeg4OFgFViecTuEHCvAJWElPfT2WBWCYvMfPSd3aIuKDEyZlPoMbISzRvnc0MsldC
 4BC7xJfFi6Guc5F4fPMY1HPCEq+Ob2GHsKUkXva3Qdn1EsevfGKFaG5hlHi89BUjyBESQIe+
 v2QBYjILaEqs36UPUa4osfP3XEaIvXwS7772sEJU80p0tAlBlChLbL57GGqrpMTTRX8ZIWwP
 iSuTr4HZQgKxEg+3b2CfwCg/C8k3s5B8Mwth8QJG5lWMYqkFxbnpqcWGBYbwSE3Oz93ECE5+
 WqY7GCe+/aB3iJGJg/EQowQHs5IIr82nkkQh3pTEyqrUovz4otKc1OJDjKbA4J3ILCWanA9M
 v3kl8YYmlgYmZkYmFsaWxmZK4ryf5QoThQTSE0tSs1NTC1KLYPqYODilGpgsWz5s3OWSxnk0
 5V1K5pnvZpohpyMmi07MfL3yn+xOjqPzJqVzy/CJhGyN4+k9abhqRe7EIycFtOSeuAZFqN6v
 PewwaV5E3a4eqUdOT2e0LGX6UDhZ4sa1RL7GV0vTwqwXpp3IVLY15X5dL8n+W9UvoPL2/kjh
 QK610rVMuq8yL1Z5zT7A/YjTYE+i+PE2lpJGM6+zG9vWtTy//vDk3DNGS9ufmQqtblyo3P5V
 1Md3Fn/vi1ebihZvvqk9327SoR0CmqqrlBvuXeRt7fx6kvXwiqpJGoI1C78W/7dgP5A/8Xl/
 +HqLQwVKQXFbWd0CSv/bB8vfW3p8UcoqD2V+xva1r0ICF7eu4uE78IaP74kSS3FGoqEWc1Fx
 IgCyxRtUBwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrELMWRmVeSWpSXmKPExsWy7bCSvO6ynWWJBtOWylucnnqWyWJ6x0E2
 iyfrZzFbXFrkbnF51xw2iy3/jrA6sHlsWtXJ5rF7wWcmj74tqxg9Pm+SC2CJ4rJJSc3JLEst
 0rdL4Mr4fOQfe8Fl9orGnvksDYxb2LoYOTkkBEwkug9eA7K5OIQEdjBKvOxbydrFyAGUkJSY
 t74cwhSWOHy4GKLkLaPEhq4mdpBeNgEdiQ+zVjKC2CICjhK/Xi9iBSliFpjLKHGxu4kVJCEs
 EClxbeUpNpBBLAKqEs8ncIOEeQWsJKa+n8oCcYO8xMxL39kh4oISJ2c+AYszA8Wbt85mnsDI
 NwtJahaS1AJGplWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMHBqKW1g3HPqg96hxiZ
 OBgPMUpwMCuJ8Np8KkkU4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8kEB6YklqdmpqQWoR
 TJaJg1OqgWluX2BMtekqCz+j+4cOX26RFVTYvUy9RfUgz7/n2mWfGc/VP3fSWH1E8azyx44P
 K/7+DUtTecu6+9+keZsEa5xY63efLl76gv9VB3fbq/ds7/L3Hd9YXNOfZWdU9I3FaMLTS85X
 kvJWbFLeGG0o+CV1q8hMM/Upuvc7MzxvRr5qWBchHDnZWjE7n6vtyfIig/vP7/IxPf/mvnCN
 WuoV3klbFhbPc3jsX3Yn5k9EdWjEPLnEk6yr5JR66mdMlVr2UMmlsk+0JvV3wpnoWq12taXp
 9ZXnd53eVMjW+XXm4rD1KlH3t23ZtWzLlc9eQjsEiq7KTjnc+Srk18mtqVsKzTn9D7N61JzQ
 Os4/8Z/j2S9KLMUZiYZazEXFiQCSNI1/tQIAAA==
X-CMS-MailID: 20211025140526epcas1p3b4a59df0935297572c6417c841a4c514
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211025140526epcas1p3b4a59df0935297572c6417c841a4c514
References: <CGME20211025140526epcas1p3b4a59df0935297572c6417c841a4c514@epcas1p3.samsung.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Compresse file and normal file has differ in i_addr
 addressing, 
 specifically addrs per inode/block. So, we will face data loss, if we disable
 the compression flag on non-empty files. Therefore we shou [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [203.254.224.25 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mf0bX-00Fjsg-O9
Subject: [f2fs-dev] [PATCH] f2fs: compress: disallow disabling compress on
 non-empty compressed file
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Compresse file and normal file has differ in i_addr addressing,
specifically addrs per inode/block. So, we will face data loss, if we
disable the compression flag on non-empty files. Therefore we should
disallow not only enabling but disabling the compression flag on
non-empty files.

Signed-off-by: Sungjong Seo <sj1557.seo@samsung.com>
Signed-off-by: Hyeong-Jun Kim <hj514.kim@samsung.com>
---
 fs/f2fs/f2fs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b8e8f8c716b0..19146c834abd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4177,8 +4177,7 @@ static inline bool f2fs_disable_compressed_file(struct inode *inode)
 
 	if (!f2fs_compressed_file(inode))
 		return true;
-	if (S_ISREG(inode->i_mode) &&
-		(get_dirty_pages(inode) || atomic_read(&fi->i_compr_blocks)))
+	if (S_ISREG(inode->i_mode) && inode->i_size)
 		return false;
 
 	fi->i_flags &= ~F2FS_COMPR_FL;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B4B0BC0E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jul 2025 07:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Puw/90+9k0+4g49iLuMxztaW0ToQuKBU51mCzPZ388U=; b=VM5zuntfWrs+fB+VE3xxHq7vKD
	H6NkpxrRtKRzcjPF3hQ6jNVHicfQ+mjAV/jtTul0stZhLpmUSBBGxFNFcYKgS98uETg/8ZExiBnoi
	SLRn76gjg0qS+u2ml3thI/fbWNxpmt27Chxlu8yauthEn4D1wLs4P/xyxpYfVY3vRcXQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1udjHf-00015w-Gf;
	Mon, 21 Jul 2025 05:41:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1udjHd-00015h-VK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 05:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lvx4Y4PcCzgi+voM/DLfvvOyaMsT7YO2spTwPTzvNQc=; b=LGhtgoJYzPtzO1CM/sgAWHKJ52
 6pHVlyn5ONrYGhcpXrMnQZOK+GuYV5xiipPHncqwDZMJoCpl+ZGPTIolLiCK+xxTwv56hYQ2Jj4wk
 3GPhu6LCFXbkzb6bFU+kyH3rIGJGu69/eqJPGC+AstAIIkZMZZDSCF5njrswMoId/jr0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Lvx4Y4PcCzgi+voM/DLfvvOyaMsT7YO2spTwPTzvNQc=; b=g
 wrll8Ln/e9yCqvKB3hEaWYHG3T7PqcgMR2a6McIYW7k/uhLDz7Fww1dKYPIHM1RciTHFMrRig75OY
 598SRAFi3i8YMtxamv2HF2eHC3vCTFPR2redd//R2QKhWVV0MQWIIbqPVzyP7QplRreHvSoHwPwNu
 o1VbY3w+H8AbQzKU=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1udjHe-0006bC-5Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 05:41:54 +0000
X-AuditID: a67dfc59-057ff7000000aab6-de-687dd3149380
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 21 Jul 2025 14:41:34 +0900
Message-ID: <20250721054135.1919-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprALMWRmVeSWpSXmKPExsXC9ZZnoa7o5doMg18bOS1OTz3LZPFk/Sxm
 i0uL3C0u75rD5sDisWlVJ5vH7gWfmTw+b5ILYI7isklJzcksSy3St0vgyvh67idrwS/Wimtf
 u1kaGL+ydDFyckgImEgs+XOBEcY+sX0XmM0moCHxp7eXGcQWEdCUONI5k72LkYuDWaCNUaL9
 aBMrSEJYIFRiw8eVYA0sAqoSjzp62UBsXgEziWlbm5ghhmpK7PhyngkiLihxcuYTsMXMAvIS
 zVtnQ9U8ZJVoWMgHYUtKHFxxg2UCI+8sJC2zkLQsYGRaxSiSmVeWm5iZY6xXnJ1RmZdZoZec
 n7uJERhOy2r/RO5g/HYh+BCjAAejEg9vAUtthhBrYllxZe4hRgkOZiURXo/jVRlCvCmJlVWp
 RfnxRaU5qcWHGKU5WJTEeY2+lacICaQnlqRmp6YWpBbBZJk4OKUaGF0EpXZ+u6p7/HZwT9bB
 JO+Dh3eLua5iOX1i8/KLlZo63rfzC8qVnGZc5PI1Xv31zI4f3gmFdacUZ+/4+7CSif3H4o0L
 DB8tCGg/Mn/vbTlXJ+msTx6aIr3JhYV+bNo6en8ly9cp8h17Ee88M+Kgw4M/UvIPrSO7HlnJ
 2P24IZ/Plpdi2fM8XomlOCPRUIu5qDgRAKg9BHUjAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFJMWRmVeSWpSXmKPExsXCNUNljq7I5doMg++zLSxOTz3LZPFk/Sxm
 i0uL3C0u75rDZjFh7lUmi/db7zE6sHlsWtXJ5rF7wWcmj2+3PTw+b5ILYInisklJzcksSy3S
 t0vgyvh67idrwS/Wimtfu1kaGL+ydDFyckgImEic2L6LEcRmE9CQ+NPbywxiiwhoShzpnMne
 xcjFwSzQxijRfrSJFSQhLBAqseHjSrAGFgFViUcdvWwgNq+AmcS0rU3MEEM1JXZ8Oc8EEReU
 ODnzCdgyZgF5ieats5knMHLNQpKahSS1gJFpFaNIZl5ZbmJmjplecXZGZV5mhV5yfu4mRmCI
 LKv9M2kH47fL7ocYBTgYlXh4C1hqM4RYE8uKK3MPMUpwMCuJ8Hocr8oQ4k1JrKxKLcqPLyrN
 SS0+xCjNwaIkzusVnpogJJCeWJKanZpakFoEk2Xi4JRqYFwg+ECLSXziDv13H6unGb1waZtl
 mZiX+GTlkbbziovWm2Un9h1s1FrptMCo+lXRgU87N866EvrpYZTFp1n5zG912daceLxc/8Ok
 W68OFQfsuDnvjFJLrJ7UA1kWQ8nOK1O0tp85YrBz9X6WHdVbeFiE35soqPCkCH9dX/Tlctn+
 BX5sbso3WVYrsRRnJBpqMRcVJwIAtLdvag0CAAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: pinfile is excluded as it operates with direct I/O
 Signed-off-by:
 yohan.joung <yohan.joung@sk.com> --- fs/f2fs/file.c | 3 ++- 1 file changed,
 2 insertions(+), 1 deletion(-) diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 index 4039ccb5022c..cac8c9650a7a 100644 --- a/fs/f2fs/file.c +++
 b/fs/f2fs/file.c
 @@ -4844,7 +4844,8 @@ static ssize_t f2fs_file_read_iter(struct kiocb *io
 [...] Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1udjHe-0006bC-5Y
Subject: [f2fs-dev] [PATCH] f2fs: zone: wait for inflight dio completion,
 excluding pinned files
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

pinfile is excluded as it operates with direct I/O

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4039ccb5022c..cac8c9650a7a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4844,7 +4844,8 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 
 	/* In LFS mode, if there is inflight dio, wait for its completion */
 	if (f2fs_lfs_mode(F2FS_I_SB(inode)) &&
-	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE))
+	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE) &&
+		!f2fs_is_pinned_file(inode))
 		inode_dio_wait(inode);
 
 	if (f2fs_should_use_dio(inode, iocb, to)) {
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

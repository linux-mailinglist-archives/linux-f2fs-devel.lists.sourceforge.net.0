Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 543CBBA4E6D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Sep 2025 20:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=etkqyqDZxfxZUqqU91bAcVB4H6fgWzpZm0mpnq9EGCM=; b=dyjEPeQxDw5TBPaw4emWpIsg1x
	Z5oE01S5WvIS2dql8tG9l+x4y/U7ZJKYJTApWMhWVgNHSdJIXxdZdyKu9Rj5kLfiaGpCqRfA7H7Me
	ww81K7fwHdNA+5NQLFjHVDC+WyM4TCk9yeC4gR79pZSHGL8/OfW1A4XMuK7dLL7LoYfg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2DGs-0003H8-DK;
	Fri, 26 Sep 2025 18:34:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weibu@redadmin.org>) id 1v2DGq-0003H2-2I
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 18:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cw5jpscVFe2IN4A5FMJB47nSlRNFhSLdLchY2fSh6ys=; b=LhB+kIWCYzn7edIKb3tFXbgaLg
 BbCyVx2Pi4pU7hOCx+KPgDVmkkSc3IaGQ7llS+cc745GPFBbeEthPqhb87ugxQINtdCsEyi61oSLH
 ITEaA+bPq8UP9H/2Y9unQCc/O9hEu4SAs4psmuQXQUre9Z0bFBeGzkd1oHtEPbmnP//M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Cw5jpscVFe2IN4A5FMJB47nSlRNFhSLdLchY2fSh6ys=; b=b
 T3x4x5zx1cPZ1SONd04auf7iGG0bEsbXlEbdfkXt8otCPaOAvtChPBqs7ocedPQphBocLd4ftYDJf
 7414EyAdUV4K1RT1ZyYLdUbDONNbJoyNoBJ33SbRpdNfddJUNyvNUTMz1yT4BLJ/n40aaavZWjTxV
 ltduQV6Q83nMpGKo=;
Received: from www3141.sakura.ne.jp ([49.212.207.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2DGp-00066d-0t for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 18:34:16 +0000
Received: from www.redadmin.org (ag129037.ppp.asahi-net.or.jp [157.107.129.37])
 (authenticated bits=0)
 by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58QI1f5F058535
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 27 Sep 2025 03:01:41 +0900 (JST)
 (envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
 by www.redadmin.org (Postfix) with ESMTP id 09877109D57DE;
 Sat, 27 Sep 2025 03:01:41 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5l6c7Gp273kZ; Sat, 27 Sep 2025 03:01:37 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
 id 7ED9410A24946; Sat, 27 Sep 2025 03:01:37 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1758909697;
 cv=none;
 b=E16RVslQq3BU6s4dWIJ+UZyx20eyfaKhZsr7w2AJgbs/SYcLZ+RaAFdE6hWHxTDh72yMLyvqE3WuHQao57T0Rs0w2Hh39pMPl19FcqaIuHCGht0CcLmKwFu9WRQxiGYVt29YjTwfVtogVmN+IlOBwKO/P5w3FxYrY9g3xMq3Tzc=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
 t=1758909697; c=relaxed/relaxed;
 bh=Cw5jpscVFe2IN4A5FMJB47nSlRNFhSLdLchY2fSh6ys=;
 h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 b=KLEt/0pHJej1xhOSZWE6zk3sJKuDw34gHkJXBNxkHFis/KWNiGiltB1NypuFeYg8KQYqLBPdhHSRHEF8N/+CcEpXDGm9TWW6Gm4VPs9F+gruMEd6yXJ7xqV11TUVqhzWDrbwiu1ct+8XDKNF8HmTNIxYvUQe/Ttu50boOcJBKaY=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 7ED9410A24946
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
 s=20231208space; t=1758909697;
 bh=Cw5jpscVFe2IN4A5FMJB47nSlRNFhSLdLchY2fSh6ys=;
 h=From:To:Cc:Subject:Date:From;
 b=h6GDha0NtEQmdoJJDNMx9rh5SVHWBprfRVO+1BLa6o0P67xxW7w8VH5qDHnuDbsot
 XOoHpeKS/04tCLCqOE1pMtlCg9F9bm+AHft1ESYzi8T1FPz2rQo7uwJWc4TqhTsyiN
 4HVVitfNqZ9/my6AntEyGYsmkybCw4xDT+fNP6XI=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: jaegeuk@kernel.org
Date: Sat, 27 Sep 2025 03:01:34 +0900
Message-ID: <20250926180134.35329-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fix two spelling mistakes in the f2fs sysfs ABI
 documentation:
 - deivces -> devices - substracting -> subtracting Signed-off-by: Akiyoshi
 Kurita <weibu@redadmin.org> --- Documentation/ABI/testing/sysfs-fs-f2fs |
 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
X-Headers-End: 1v2DGp-00066d-0t
Subject: [f2fs-dev] [PATCH] Documentation: f2fs: Fix typos in sysfs-fs-f2fs
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
Cc: linux-kernel@vger.kernel.org, Akiyoshi Kurita <weibu@redadmin.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix two spelling mistakes in the f2fs sysfs ABI documentation:
- deivces -> devices
- substracting -> subtracting

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..6e8043ea33e7 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -822,7 +822,7 @@ What:		/sys/fs/f2fs/<disk>/gc_valid_thresh_ratio
 Date:		September 2024
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	It controls the valid block ratio threshold not to trigger excessive GC
-		for zoned deivces. The initial value of it is 95(%). F2FS will stop the
+		for zoned devices. The initial value of it is 95(%). F2FS will stop the
 		background GC thread from intiating GC for sections having valid blocks
 		exceeding the ratio.
 
@@ -847,7 +847,7 @@ Description:	For several zoned storage devices, vendors will provide extra space
 		filesystem level GC. To do that, we can reserve the space using
 		reserved_blocks. However, it is not enough, since this extra space should
 		not be shown to users. So, with this new sysfs node, we can hide the space
-		by substracting reserved_blocks from total bytes.
+		by subtracting reserved_blocks from total bytes.
 
 What:		/sys/fs/f2fs/<disk>/encoding_flags
 Date:		April 2025
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B1DA610F2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Mar 2025 13:25:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tt46M-0007Iz-3d;
	Fri, 14 Mar 2025 12:25:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youngjin.gil@samsung.com>) id 1tt46L-0007In-0Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 12:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Qe1SlvfIOmhga1czt7f9j5ahiyJmMc+mCo4mIR3ZTM=; b=Ea4beGzsVqmgNOL+51hEgSwl90
 PpPkAdl0iYD53jzUFOxfi5ryBvzuMXncgqE7H5L4JSjo7jNbjvmhBEGjwpscsTGXBKGyXDYGOJ3UP
 x5nuK7qWSWDyP8KNQlHgrtDB9lIu4I4MjEndmxDiqiLLlxyNGVR+/iqiTYVlx77yeAHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3Qe1SlvfIOmhga1czt7f9j5ahiyJmMc+mCo4mIR3ZTM=; b=G
 lnLItXTYhl+bosidzx7USdn+X4SKPDO2lPoMl9FaN/9G64PjtDUnQCg3/iRjW3btkWmR7EvmkTiWg
 FrvYx4m9mHk/atnq8Mbs/Nrw7Nn29E07EAP250dcoLZyvZR4p1Yn+Fh4XKIaN1um9TMs/Bj3MmhbO
 CV08GYwZ8k++BfRw=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tt46E-00058Q-G1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 12:25:21 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250314120700epoutp0156440733bba98e975efaf31ca37d7ac3~sqfPJ31uN2313923139epoutp01e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 14 Mar 2025 12:07:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250314120700epoutp0156440733bba98e975efaf31ca37d7ac3~sqfPJ31uN2313923139epoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1741954020;
 bh=3Qe1SlvfIOmhga1czt7f9j5ahiyJmMc+mCo4mIR3ZTM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=H8jTsLgkUoczOVmOP1AH/uYneM0pNRWr87Dm6635ieAMDzwBFpmqXV5I6khfw+kGt
 rhvM8T8o52V6vGNRKPQIm+Grr+m+X9wYtOE2qysSyhE7nYvbpEWVvhcaLezR4X1xiz
 l7B+80kCUr4OIu1wWYu/zmQJuVTa1lSTeBXkmTEM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20250314120659epcas1p428f75bf92265487d7840bab312f09157~sqfObOmmU2356423564epcas1p4Q;
 Fri, 14 Mar 2025 12:06:59 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.225]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4ZDjll22czz4x9Pr; Fri, 14 Mar
 2025 12:06:59 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 8A.B6.21650.3EB14D76; Fri, 14 Mar 2025 21:06:59 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250314120658epcas1p2d3ec037c294d4c907ce7fa2fe1c3aa27~sqfNyV_pk1539815398epcas1p21;
 Fri, 14 Mar 2025 12:06:58 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250314120658epsmtrp24285d6abe485c2681b1d51588ee95741~sqfNxeWfe2301523015epsmtrp29;
 Fri, 14 Mar 2025 12:06:58 +0000 (GMT)
X-AuditID: b6c32a35-093de70000005492-bc-67d41be32211
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4F.8E.23488.2EB14D76; Fri, 14 Mar 2025 21:06:58 +0900 (KST)
Received: from mypc.. (unknown [10.253.99.41]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20250314120658epsmtip1724f69d6e811c7ec07a9dd415071d29f~sqfNj6PrX0376503765epsmtip15;
 Fri, 14 Mar 2025 12:06:58 +0000 (GMT)
From: Yeongjin Gil <youngjin.gil@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Fri, 14 Mar 2025 21:06:51 +0900
Message-Id: <20250314120651.443184-1-youngjin.gil@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFJsWRmVeSWpSXmKPExsWy7bCmge5j6SvpBkfOcFmcnnqWyWJq+15G
 iyfrZzFbXFrkbnF51xw2iwWtv1kstvw7wmoxY/9TdgcOjwWbSj02repk89i94DOTR9+WVYwe
 nzfJBbBGNTDaJBYlZ2SWpSqk5iXnp2TmpdsqhYa46VooKWTkF5fYKkUbGhrpGRqY6xkZGemZ
 GsVaGZkqKeQl5qbaKlXoQvUqKRQlFwDV5lYWAw3ISdWDiusVp+alOGTll4Kcr1ecmFtcmpeu
 l5yfq6RQlphTCjRCST/hG2PGrndr2Ao+81X07L7A1sC4nKeLkZNDQsBEYlb/W9YuRi4OIYEd
 jBITzjQxQTifGCXe9n6GynxjlOh69IoFpuXBsjdQib2MEueW/GWEcB4zSrz4+JQVpIpNQFdi
 6sunYFUiAm2MEns+X2AHSTALxEks3DARaBQHh7CAu8S2HUIgYRYBVYld796AbeAVsJM4+qmb
 EWKbvMT+g2eZIeKCEidnPmGBGCMv0bx1NjPIfAmBS+wSm6/NZYNocJHo6X3GCmELS7w6voUd
 wpaS+PxuLxtEwypGiTetn5ggnO2MEtMf90B120s0tzazgVzHLKApsX6XPsQ2Pol3X3ughgpK
 nL7WzQxSIiHAK9HRJgQRVpO4MukXVImMRN+DWVB7PSQOX24Ds4UEYiU+XH7EMoFRfhaSf2Yh
 +WcWwuIFjMyrGMVSC4pz01OLDQsMkaN2EyM4mWqZ7mCc+PaD3iFGJg7GQ4wSHMxKIrwWly+n
 C/GmJFZWpRblxxeV5qQWH2JMBobwRGYp0eR8YDrPK4k3NDOztLA0MjE0NjM0JCxsYmlgYmZk
 YmFsaWymJM57YVtLupBAemJJanZqakFqEcwWJg5OqQam9YdMvwcsnlZrl6a/IMldJ/BGRETs
 ZAuLTZM3i06p7/+31UL3bbDfbtWLu+esDGlUN58Ts6hpSk7jJ9v+y1tfejpIZRzZc+vYW5Y1
 OY5F59I3i9vstZl/OFv2ws+Utid6z/Nv+C1taC7cprZwsc0P9cNz1ARuuB8W0tn+8qymf1fV
 4vus55dN1fH70XK8+Ea37MXrFi/yxSd081oy33+vOXeJz+r83Wr9iy+6L6+yOSJpWfhtsvaT
 jy85WdZ4qtW51ITcv92X08rYV658V2J7TebsDe4v3naJMBVMTnneLibwbc61GfZvW2VeLxfl
 eC7y+/5TtR9VgRfcjqzkn7Rlt4fIDbs50dGs+8NcEjl8lFiKMxINtZiLihMBYsG6+l0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWy7bCSnO4j6SvpBpevGFicnnqWyWJq+15G
 iyfrZzFbXFrkbnF51xw2iwWtv1kstvw7wmoxY/9TdgcOjwWbSj02repk89i94DOTR9+WVYwe
 nzfJBbBGcdmkpOZklqUW6dslcGXsereGreAzX0XP7gtsDYzLeboYOTkkBEwkHix7w9rFyMUh
 JLCbUWLGrnnMEAkZiT8T37N1MXIA2cIShw8Xg4SFBB4ySsw/5ApiswnoSkx9+RSsV0Sgh1Hi
 bMs5FpAEs0CCxM4ls5hAeoUF3CW27RACCbMIqErsevcGrIRXwE7i6KduRohV8hL7D55lhogL
 Spyc+QRqjLxE89bZzBMY+WYhSc1CklrAyLSKUTK1oDg3PTfZsMAwL7Vcrzgxt7g0L10vOT93
 EyM4ULU0djC++9akf4iRiYPxEKMEB7OSCK/F5cvpQrwpiZVVqUX58UWlOanFhxilOViUxHlX
 GkakCwmkJ5akZqemFqQWwWSZODilGpgqLnKeZL4u08ugIWYy+9KbfBlbr+Q9Cd6r30wVm7Ul
 Vqh1vf5ZQd9oHXFxqx2ikhKZ25OMEsOSS06e4Sm3PLOgmFGpl/3QlPLve7XZoh/UJAVk6y9S
 bI54pDnLjH/NX58CUf6Mypc+d9f3Ka7geMXxb8sHyYQ/rJvdU/QsN6wqs7z2YV3sEjbfdUU1
 7u+qs7R7/wmxzciZujTrWx1rKbOthk97VL25baLjnn797dnSgvtPJTjfqgp9Z/togvuyOHnD
 9uxb3wqVND44L+BX/P28837Tn+1JxeFPAvfoiZlOKpVRtJvTW3Ox5p1FhGZdq4Yjx/LqR9am
 aVvv650S8vpve8L9S8LRfm79blYlluKMREMt5qLiRABcFAnZwwIAAA==
X-CMS-MailID: 20250314120658epcas1p2d3ec037c294d4c907ce7fa2fe1c3aa27
X-Msg-Generator: CA
CMS-TYPE: 101P
X-ArchiveUser: EV
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250314120658epcas1p2d3ec037c294d4c907ce7fa2fe1c3aa27
References: <CGME20250314120658epcas1p2d3ec037c294d4c907ce7fa2fe1c3aa27@epcas1p2.samsung.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In the case of the following call stack for an atomic file, 
 FI_DIRTY_INODE is set,
 but FI_ATOMIC_DIRTIED is not subsequently set. f2fs_file_write_iter
 f2fs_map_blocks f2fs_reserve_new_blocks inc_valid_block_count
 __mark_inode_dirty(dquot) f2fs_dirty_inode 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tt46E-00058Q-G1
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid atomicity corruption of
 atomic file
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
Cc: sj1557.seo@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In the case of the following call stack for an atomic file,
FI_DIRTY_INODE is set, but FI_ATOMIC_DIRTIED is not subsequently set.

f2fs_file_write_iter
  f2fs_map_blocks
    f2fs_reserve_new_blocks
      inc_valid_block_count
        __mark_inode_dirty(dquot)
          f2fs_dirty_inode

If FI_ATOMIC_DIRTIED is not set, atomic file can encounter corruption
due to a mismatch between old file size and new data.

To resolve this issue, I changed to set FI_ATOMIC_DIRTIED when
FI_DIRTY_INODE is set. This ensures that FI_DIRTY_INODE, which was
previously cleared by the Writeback thread during the commit atomic, is
set and i_size is updated.

Fixes: fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>
---
 fs/f2fs/inode.c | 4 +---
 fs/f2fs/super.c | 4 ++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index aa2f41696a88..83f862578fc8 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -34,10 +34,8 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
 	if (f2fs_inode_dirtied(inode, sync))
 		return;
 
-	if (f2fs_is_atomic_file(inode)) {
-		set_inode_flag(inode, FI_ATOMIC_DIRTIED);
+	if (f2fs_is_atomic_file(inode))
 		return;
-	}
 
 	mark_inode_dirty_sync(inode);
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 397df271885c..c08d52c6467a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1534,6 +1534,10 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync)
 		inc_page_count(sbi, F2FS_DIRTY_IMETA);
 	}
 	spin_unlock(&sbi->inode_lock[DIRTY_META]);
+
+	if (!ret && f2fs_is_atomic_file(inode))
+		set_inode_flag(inode, FI_ATOMIC_DIRTIED);
+
 	return ret;
 }
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

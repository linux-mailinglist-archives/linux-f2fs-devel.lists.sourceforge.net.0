Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D92A3F0C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 09:39:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZrqH-00015s-AV; Tue, 03 Nov 2020 08:39:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daejun7.park@samsung.com>) id 1kZrqG-00015G-4P
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 08:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2slUiaMyn0QDJdipUDeb4qUXXKNFI4uPO4BiSpLVKtM=; b=al2a9vbzIlahWbev+25tyYtyA9
 +wAsKlLmlweo5YVp1j03Xg5dETrsp4EwVrtTSYjAxGCIkGUQOfbssNvDZG7PWmAi3kzWhydvG6PDp
 IFuD2KVdIIyruF0wf2zOuMmi9UobYT23cPigzTDymoT7pg7i8OFqJtBy8tvLCzyhincU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2slUiaMyn0QDJdipUDeb4qUXXKNFI4uPO4BiSpLVKtM=; b=l
 N9E4ZZaugocisG2NX/iuCLuOpyGMAKY6hLaifEd/C3S5JYRRZL5Ls+aq1ZOjveC6NxOjD2q9E41uY
 mTLH7ZEstEDK50ZATXJM6kGSh0d5jFqlZWFcutPzaxSfjW2vMX8hK9YfAmJ+MjJ7NBstokoeu+PtY
 BNNAnCg9kRQKp/8A=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZrq8-00HIYR-Ji
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 08:39:00 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201103083838epoutp03a6a38d7339dfd4b264eb5dd223487ceb~D8q1NqvxW0157601576epoutp03a
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 Nov 2020 08:38:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201103083838epoutp03a6a38d7339dfd4b264eb5dd223487ceb~D8q1NqvxW0157601576epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604392718;
 bh=2slUiaMyn0QDJdipUDeb4qUXXKNFI4uPO4BiSpLVKtM=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=M83qgVoTI3yoQNHAkIoIhoGLU7ikhFm1QQB9cEvD7ZG6gy4SnOzcIi8dcyihBTxWs
 AnoWD8Us4CUdqYo39Gyql4uK27cYndxtPE8sZDLUkO3lZW1CVGXUf/W8fWGrwK5O2h
 rF6czHqhne92sIx1ZITyreun7rnbwkwWbk3B0LjU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20201103083837epcas2p2275f8f3c3d9d291f115133ccbbe03421~D8q0jKCHs2885028850epcas2p2-;
 Tue,  3 Nov 2020 08:38:37 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.181]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4CQNV34kcKzMqYm1; Tue,  3 Nov
 2020 08:38:35 +0000 (GMT)
X-AuditID: b6c32a48-50fff7000000cd1f-0e-5fa11708496c
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 65.DF.52511.80711AF5; Tue,  3 Nov 2020 17:38:32 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, Daejun Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201103083832epcms2p6c8b0e4470f1392772317ab2b25256b3d@epcms2p6>
Date: Tue, 03 Nov 2020 17:38:32 +0900
X-CMS-MailID: 20201103083832epcms2p6c8b0e4470f1392772317ab2b25256b3d
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmmS6H+MJ4gwVzzCxOTz3LZPHykKbF
 qgfhFr39W9ksnqyfxWyx+eAGZottnwUtjp98x2hxaZG7xeVdc9gsOi59ZrKY8HIJi8XtLVwW
 ndPXsFgsWribxWLq47WsDgIeLUfesnpsWtXJ5rF7wWcmj74tqxg9Pm+SC2CNyrHJSE1MSS1S
 SM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMATpXSaEsMacUKBSQWFys
 pG9nU5RfWpKqkJFfXGKrlFqQklNgaFigV5yYW1yal66XnJ9rZWhgYGQKVJmQk/FmqkbBG4mK
 dSvfszYwLhXoYuTkkBAwkVi38gRTFyMXh5DADkaJz63XGbsYOTh4BQQl/u4QBqkRFrCT2PL4
 OguILSSgJLH+4ix2iLiexK2HaxhBbDYBHYnpJ+6DxUUEaiSuP3vJBjKTWWADi8TE7xPZIZbx
 Ssxof8oCYUtLbF++lRHC1pD4sayXGcIWlbi5+i07jP3+2HyoGhGJ1ntnoWoEJR783A0Vl5Q4
 tvsDE4RdL7H1zi9GkMUSAj2MEod33mKFSOhLXOvYCLaYV8BX4sPZNWBxFgFViemta6BqXCRW
 3poCtoBZQF5i+9s5zKCAYBbQlFi/Sx/ElBBQljhyiwXmlYaNv9nR2cwCfBIdh//CxXfMewJ1
 mprEup/rmSDGyEjcmsc4gVFpFiKgZyFZOwth7QJG5lWMYqkFxbnpqcVGBSbIUbuJEZxwtTx2
 MM5++0HvECMTB+MhRgkOZiUR3prIefFCvCmJlVWpRfnxRaU5qcWHGE2BHp7ILCWanA9M+Xkl
 8YamRmZmBpamFqZmRhZK4ryhK/vihQTSE0tSs1NTC1KLYPqYODilGpiWVM5NnFAkOm/2+8Ij
 DbwP5aZ682YU3eq9Uy7ePi9z/SnWq98yGM8+Oa4zU/Munz3Tu1zBj3U8yWtDzzbzGMotcXl2
 72alaFRJqZ97cu8k20lRtV8Dtxy1tv5i9Yrddy07u+2Z0I6pQp3/S10meTUfS/Bgvld9myNx
 C9vOqxncfBoRXvbcOycWxu24ILfk1lmX7FXno08+/nCn4krDae2Lio4pi5IlXwiHaXLXMfqe
 nuRvGfHD0+CITGnbPyNZF507y4/9YDuy8U1lo1jbv9uhAje39ygWT729TUf519tAk3vdnlw7
 Ly3REd8lGZ4pdu3Q5s+ptXfUm24UHD09w76r+qaGitrbPQpb3rCwTFNiKc5INNRiLipOBABY
 ftT5QQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201103083832epcms2p6c8b0e4470f1392772317ab2b25256b3d
References: <CGME20201103083832epcms2p6c8b0e4470f1392772317ab2b25256b3d@epcms2p6>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZrq8-00HIYR-Ji
Subject: [f2fs-dev] [PATCH v2] f2fs: change write_hint for hot/warm nodes
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
Reply-To: daejun7.park@samsung.com
Cc: yongmyung lee <ymhungry.lee@samsung.com>,
 Jieon Seol <jieon.seol@samsung.com>, Sang-yoon Oh <sangyoon.oh@samsung.com>,
 Mankyu PARK <manq.park@samsung.com>,
 Sung-Jun Park <sungjun07.park@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Keoseong Park <keosung.park@samsung.com>,
 SEUNGUK SHIN <seunguk.shin@samsung.com>,
 Jinyoung CHOI <j-young.choi@samsung.com>,
 Jaemyung Lee <jaemyung.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In the fs-based mode of F2FS, the mapping of hot/warm node to
WRITE_LIFE_NOT_SET should be changed to WRITE_LIFE_SHORT.

As a result of analyzing the write pattern of f2fs using real workload,
hot/warm nodes have high update ratio close to hot data.[*]
However, F2FS passes write hints for hot/warm nodes as WRITE_LIFE_NOT_SET.

Furthermore, WRITE_LIFE_NOT_SET is a default value of write hint when it is
not provided from the file system.
In storage, write_hint is used to distinguish streams (e.g. NVMe).
So, the hot/warm node of F2FS is not distinguished from other write_hints,
which can make the wrong stream seperation.

* Liang, Yu, et al. "An empirical study of F2FS on mobile devices." 2017
IEEE 23rd International Conference on Embedded and Real-Time Computing
Systems and Applications (RTCSA).

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
v2: update documentation and comments
---
 Documentation/filesystems/f2fs.rst | 4 ++--
 fs/f2fs/segment.c                  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index b8ee761c9922..afa3da7cfade 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -717,8 +717,8 @@ WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
 ===================== ======================== ===================
 User                  F2FS                     Block
 ===================== ======================== ===================
-                      META                     WRITE_LIFE_MEDIUM;
-                      HOT_NODE                 WRITE_LIFE_NOT_SET
+                      META                     WRITE_LIFE_MEDIUM
+                      HOT_NODE                 WRITE_LIFE_SHORT
                       WARM_NODE                "
                       COLD_NODE                WRITE_LIFE_NONE
 ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1596502f7375..577ab7516c6b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3160,8 +3160,8 @@ int f2fs_rw_hint_to_seg_type(enum rw_hint hint)
  *
  * User                  F2FS                     Block
  * ----                  ----                     -----
- *                       META                     WRITE_LIFE_MEDIUM;
- *                       HOT_NODE                 WRITE_LIFE_NOT_SET
+ *                       META                     WRITE_LIFE_MEDIUM
+ *                       HOT_NODE                 WRITE_LIFE_SHORT
  *                       WARM_NODE                "
  *                       COLD_NODE                WRITE_LIFE_NONE
  * ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
@@ -3208,7 +3208,7 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
 				return WRITE_LIFE_EXTREME;
 		} else if (type == NODE) {
 			if (temp == WARM || temp == HOT)
-				return WRITE_LIFE_NOT_SET;
+				return WRITE_LIFE_SHORT;
 			else if (temp == COLD)
 				return WRITE_LIFE_NONE;
 		} else if (type == META) {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

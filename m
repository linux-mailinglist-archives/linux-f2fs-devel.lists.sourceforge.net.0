Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E667D973B0E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 17:11:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1so2WE-0006V4-7F;
	Tue, 10 Sep 2024 15:11:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1so2WB-0006Uf-NY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 15:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/IM9kt/2eCM14q1kv/IUC0Orm6DmaZVmcMJa34MEri8=; b=dr9RgEgwnJwCNTPFz4cprxslZo
 jChkrB102Kf9EiNl32n+6Iyrw+ttKMVofriMKYbow4aKpn4yntgr9iZp/Z53KsIvup0UYroYwwFqb
 prmVoSTJIFSk2PeFCggSbRTPvDOvA5dOP1pbrylSpge6Ylw6/qWrStjAmIi0VEMZpuP0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/IM9kt/2eCM14q1kv/IUC0Orm6DmaZVmcMJa34MEri8=; b=ZwiYw8rqgJjETNudzLgwyDN9mg
 9oR9g+Mb2p0c6yQ4eZ43z7beQt+b+Jgtf5DZV99hy2vMq2lHytFZfw+CIrFpi4oW0tE4kJGx2m96i
 ZxCiJjw5lakph6buC9vwoqnmifAVGYPUAo0f4v07iXupkprdch12aiY8/ygfX6dlU81M=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1so2WB-0006IS-6z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 15:11:00 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240910151047epoutp02bd3d53dd5eff3a9926b19d6aeaf23204~z6p4t3MtM2298822988epoutp029
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Sep 2024 15:10:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240910151047epoutp02bd3d53dd5eff3a9926b19d6aeaf23204~z6p4t3MtM2298822988epoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725981047;
 bh=/IM9kt/2eCM14q1kv/IUC0Orm6DmaZVmcMJa34MEri8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MR1lVlYzSD30VBZtqx069poLYGBIZLK5q2LoQsmR4/5PjZgQq5XjNcsW6dFHKHZsh
 st2K8WomT9u1XxFawNn/w49JQH56GF2fCTbM1dgbPW5G2GWLSmrhyXxbqxC0cKix9i
 BILLPEeIseL5wjRSStmAhyp87tallMsNMrxZ6FtM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20240910151046epcas5p2a26321e41189a2f101cae5ce738de816~z6p4O1QG30258802588epcas5p2V;
 Tue, 10 Sep 2024 15:10:46 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4X36b90Hwwz4x9Pp; Tue, 10 Sep
 2024 15:10:45 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E8.6F.19863.47160E66; Wed, 11 Sep 2024 00:10:44 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20240910151044epcas5p37f61bb85ccf8b3eb875e77c3fc260c51~z6p1zgmQ13222332223epcas5p3C;
 Tue, 10 Sep 2024 15:10:44 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240910151044epsmtrp12aae38aee9b01960e33fb0a7289f047d~z6p1ylVlM1255512555epsmtrp1i;
 Tue, 10 Sep 2024 15:10:44 +0000 (GMT)
X-AuditID: b6c32a50-ef5fe70000004d97-3d-66e0617422f1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 06.F3.19367.47160E66; Wed, 11 Sep 2024 00:10:44 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240910151040epsmtip21920684c4863f20fece9a37c05cd1b85~z6pyAtglJ1772517725epsmtip2M;
 Tue, 10 Sep 2024 15:10:39 +0000 (GMT)
From: Kanchan Joshi <joshi.k@samsung.com>
To: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
 jaegeuk@kernel.org, jlayton@kernel.org, chuck.lever@oracle.com,
 bvanassche@acm.org
Date: Tue, 10 Sep 2024 20:31:56 +0530
Message-Id: <20240910150200.6589-2-joshi.k@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240910150200.6589-1-joshi.k@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxzOubfcFreSawV7LIvWxmWAAVp5eCAgLDPzLoo2OhKzzLGmvVDW
 0nZ9zI0QKFNRHhOs1kdhjDmUUHwA1YkKwVSww83BRBiSWZEVeQ036CICc6yl1fnf9/v9vu98
 +X7nHBbOcRM8VrZKT2tVEqWAWMb4/mZ4eKReMpQpPNYrRA0Pygk0eXMGoON/zeFo8cEohu7f
 uIqh+oZODFWe2Ich10ULjprKWej339xMNHfWykSdi1MEMtn7AWobXI/unt6CWtu6GOibsyNM
 VPprC4HqHP9i6MLknwzU/dwRgLotVczUlVTvva1Ut7OJQR033Sao3jsGqtlaTFC22gLqeo0b
 o67fNxLU9Mgggzp8yQqon2o6mJS7eTXV7JrCxOwPFElyWiKjtXxaJVXLslVZyYKtuzLeyYiL
 F4oiRQloo4CvkuTQyYLN28SR72YrPZkF/M8kSoOnJZbodILoTUlatUFP8+VqnT5ZQGtkSk2s
 JkonydEZVFlRKlqfKBIKN8R5iB8r5LXDPYTm1lufd1qf4EZwjl8CAlmQjIUDEz/gJWAZi0O2
 AvjlYmWAr5gB8OFYDfGy6LtgY7yQVNt+9g+uAthlf+yXuAH8buYAVgJYLIIMhz1HDd5+MFmN
 wVs9ncBb4KQJg9ND5wnvUStIBG/3OzEvZpBvQtu4c6nPJjdCc3WT324NPHV3lunFgR7+aN05
 zMdZDrtOuZY4uIez73LlUgpIHgyE87NPgU+8GT4rqyJ8eAWccFxi+jAPjpcX+bECDg0P+c3y
 YIvtcIAPp0DjPwMB3jS4J83Fa9E+ryD41YJrKSQk2fBQEcfHXgudphG/kgsfnaz1Ywr+cszh
 31YpgB3zpYwKsMbySgTLKxEs/7vVANwKeLRGl5NFS+M0okgVvffl3UrVOc1g6fVHiFtAQ+Pz
 KDvAWMAOIAsXBLPLNzkzOWyZ5ItcWqvO0BqUtM4O4jxLPoLzQqRqz/dR6TNEsQnC2Pj4+NiE
 mHiRgMuePPC1jENmSfS0gqY1tPaFDmMF8oxYVlJMcmhwxOPCFG7f3GuFO/A2s3r+jZBdPfnv
 nwxqtfGi37szMFFo5g4/ETtLdlRVpu80dnPMy18P5n5bX2DQ7F61M/dvTFF4BSgOstc5yLDt
 4sFPn2nTmFXF6O1mywndU5W7ce0Evy2tdXvBnghLUTdM0Zovh5KNCfLT/VKVlZ9CdMw3aEft
 HR/G5BdXVGoTU8PmZgT704lcsYtbvLf+2nBiWV1j29hDWXbpqvZ1NTc2tK8/FPpJ6Ef68wlp
 DLV5gR087kj/MXOxwnh0Nv1M0MT+K3l7Yvoss/mjruLVK03yMuWjBXhPemZ3zMh09EjY1JaU
 kOh01h+p25Lb88YUAoZOLhFF4Fqd5D+2Jnc3hgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsWy7bCSvG5J4oM0g81nWSxW3+1ns3h9+BOj
 xbQPP5kt/t99zmRx88BOJouVq48yWcye3sxk8WT9LGaLjf0cFo/vfGa3+LlsFbvF0f9v2Swm
 HbrGaLH3lrbFpUXuFnv2nmSxmL/sKbtF9/UdbBbLj/9jslj3+j2Lxfm/x1ktzs+aw+4g5nH5
 irfH+XsbWTymTTrF5nH5bKnHplWdbB6bl9R77F7wmclj980GNo+PT2+xePRtWcXocWbBEXaP
 z5vkPDY9ecsUwBvFZZOSmpNZllqkb5fAlbHk0QW2gmPqFUdXvWNuYFyj0MXIySEhYCIxb/M5
 ti5GLg4hge2MElevP2aCSIhLNF/7wQ5hC0us/PecHaLoI6NER/cuoA4ODjYBTYkLk0tBakQE
 1jFJrJjmA1LDLDCHSWJ553ZmkISwgIXEqWv3wIayCKhKbH55jw3E5hUwl5g6byMLxAJ5iZmX
 voMt4wSqf758DVi9EFDNh/4FrBD1ghInZz4Bq2cGqm/eOpt5AqPALCSpWUhSCxiZVjGKphYU
 56bnJhcY6hUn5haX5qXrJefnbmIER6pW0A7GZev/6h1iZOJgPMQowcGsJMLbb3cvTYg3JbGy
 KrUoP76oNCe1+BCjNAeLkjivck5nipBAemJJanZqakFqEUyWiYNTqoEpWH3BLjfu3fVNtzP5
 LfcZvZ1sf/ZxD7Pukgv+7AyrZplfkWuV29gVJLP06sYkvzcSh/4f6vmzbmUOr7VZmouS3h2F
 0CaRhu5NrKUzrjMfVw314J7oMVnueo6E+gs/yVLfqUmHLpqF/Xz3yYZdQeSYbtmVtGVLXhQu
 lPhhpZc+bUPz5f/c89/Z6V+SiTcJWca+viP5Ye+ZaXohv9PcdsXfMP7ZWcjgYCOxaF2kwOcz
 /5wt4sXkix5ynXBPCb8uGzBvjeHKsGsMstcU5rzy3BjYq77w66q1IoWS6wN/xxysfPXD97nx
 T9HvOh55PULfTj7VOp/CG/tio1xa0Jzm9CsbhLJ4Du6VWr7hgNmXjgdKLMUZiYZazEXFiQBZ
 huDzQwMAAA==
X-CMS-MailID: 20240910151044epcas5p37f61bb85ccf8b3eb875e77c3fc260c51
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151044epcas5p37f61bb85ccf8b3eb875e77c3fc260c51
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151044epcas5p37f61bb85ccf8b3eb875e77c3fc260c51@epcas5p3.samsung.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Rename enum rw_hint to rw_lifetime_hint. Change i_write_hint
 (in inode), bi_write_hint(in bio), and write_hint (in request) to use u8
 data-type rather than this enum. This is in preparation to introduce a new
 write hint type. 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1so2WB-0006IS-6z
Subject: [f2fs-dev] [PATCH v5 1/5] fs, block: refactor enum rw_hint
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
Cc: vishak.g@samsung.com, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Rename enum rw_hint to rw_lifetime_hint.
Change i_write_hint (in inode), bi_write_hint(in bio), and write_hint
(in request) to use u8 data-type rather than this enum.

This is in preparation to introduce a new write hint type.

Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
---
 fs/buffer.c               | 4 ++--
 fs/f2fs/f2fs.h            | 5 +++--
 fs/f2fs/segment.c         | 5 +++--
 include/linux/blk-mq.h    | 2 +-
 include/linux/blk_types.h | 2 +-
 include/linux/fs.h        | 2 +-
 include/linux/rw_hint.h   | 4 ++--
 7 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index e55ad471c530..0c6bc9b7d4ad 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -55,7 +55,7 @@
 
 static int fsync_buffers_list(spinlock_t *lock, struct list_head *list);
 static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
-			  enum rw_hint hint, struct writeback_control *wbc);
+			  u8 hint, struct writeback_control *wbc);
 
 #define BH_ENTRY(list) list_entry((list), struct buffer_head, b_assoc_buffers)
 
@@ -2778,7 +2778,7 @@ static void end_bio_bh_io_sync(struct bio *bio)
 }
 
 static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
-			  enum rw_hint write_hint,
+			  u8 write_hint,
 			  struct writeback_control *wbc)
 {
 	const enum req_op op = opf & REQ_OP_MASK;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ac19c61f0c3e..9b843b57dba1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3756,8 +3756,9 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
 void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_segment_manager_caches(void);
 void f2fs_destroy_segment_manager_caches(void);
-int f2fs_rw_hint_to_seg_type(struct f2fs_sb_info *sbi, enum rw_hint hint);
-enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
+int f2fs_rw_hint_to_seg_type(struct f2fs_sb_info *sbi,
+			enum rw_lifetime_hint hint);
+enum rw_lifetime_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
 			enum page_type type, enum temp_type temp);
 unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
 			unsigned int segno);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 78c3198a6308..6802e82f9ffd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3381,7 +3381,8 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 	return err;
 }
 
-int f2fs_rw_hint_to_seg_type(struct f2fs_sb_info *sbi, enum rw_hint hint)
+int f2fs_rw_hint_to_seg_type(struct f2fs_sb_info *sbi,
+			enum rw_lifetime_hint hint)
 {
 	if (F2FS_OPTION(sbi).active_logs == 2)
 		return CURSEG_HOT_DATA;
@@ -3425,7 +3426,7 @@ int f2fs_rw_hint_to_seg_type(struct f2fs_sb_info *sbi, enum rw_hint hint)
  * WRITE_LIFE_MEDIUM     "                        WRITE_LIFE_MEDIUM
  * WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
  */
-enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
+enum rw_lifetime_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
 				enum page_type type, enum temp_type temp)
 {
 	switch (type) {
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 8d304b1d16b1..1e5ce84ccf0a 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -159,7 +159,7 @@ struct request {
 	struct blk_crypto_keyslot *crypt_keyslot;
 #endif
 
-	enum rw_hint write_hint;
+	u8 write_hint;
 	unsigned short ioprio;
 
 	enum mq_rq_state state;
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 36ed96133217..446c847bb3b3 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -216,7 +216,7 @@ struct bio {
 						 */
 	unsigned short		bi_flags;	/* BIO_* below */
 	unsigned short		bi_ioprio;
-	enum rw_hint		bi_write_hint;
+	u8			bi_write_hint;
 	blk_status_t		bi_status;
 	atomic_t		__bi_remaining;
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index fb0426f349fc..f9a7a2a80661 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -674,7 +674,7 @@ struct inode {
 	spinlock_t		i_lock;	/* i_blocks, i_bytes, maybe i_size */
 	unsigned short          i_bytes;
 	u8			i_blkbits;
-	enum rw_hint		i_write_hint;
+	u8			i_write_hint;
 	blkcnt_t		i_blocks;
 
 #ifdef __NEED_I_SIZE_ORDERED
diff --git a/include/linux/rw_hint.h b/include/linux/rw_hint.h
index 309ca72f2dfb..b9942f5f13d3 100644
--- a/include/linux/rw_hint.h
+++ b/include/linux/rw_hint.h
@@ -7,7 +7,7 @@
 #include <uapi/linux/fcntl.h>
 
 /* Block storage write lifetime hint values. */
-enum rw_hint {
+enum rw_lifetime_hint {
 	WRITE_LIFE_NOT_SET	= RWH_WRITE_LIFE_NOT_SET,
 	WRITE_LIFE_NONE		= RWH_WRITE_LIFE_NONE,
 	WRITE_LIFE_SHORT	= RWH_WRITE_LIFE_SHORT,
@@ -18,7 +18,7 @@ enum rw_hint {
 
 /* Sparse ignores __packed annotations on enums, hence the #ifndef below. */
 #ifndef __CHECKER__
-static_assert(sizeof(enum rw_hint) == 1);
+static_assert(sizeof(enum rw_lifetime_hint) == 1);
 #endif
 
 #endif /* _LINUX_RW_HINT_H */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

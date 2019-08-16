Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D85918FB75
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 08:53:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyW7T-0007Zy-En; Fri, 16 Aug 2019 06:53:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hyW7R-0007Zc-RA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 06:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/j9eO4ACAtwPHNcbXywgYk03TX1PlGDR70AyLCprqb8=; b=Zzrk5gCBMSSPbSQ/KstbpQxjbY
 K1cpwYpHsyMXe+ob26L0yOTqQZq8Ykg/9LdUAQg8SqrbUn7/w0uGRKhjjWVqpnKwA/zdcIxr06bHi
 wH4OeGpWaQ0SnMBvILe43pvotkvxLBmb27HEGTOeN98Xw4q9SCL9T3AYaVSr0wAeBxjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/j9eO4ACAtwPHNcbXywgYk03TX1PlGDR70AyLCprqb8=; b=E
 fT3jZgQYl5q0fcGl2VXOaMQBHj22O1JjgBdlJe5oTHD1RmsffTP1PdjHqTDhhxrAUs+Xf42MEae6b
 7Hqq4D7rZSLN9ye85apUYN+2DdIDhBjZuCancFYzkzRbNyKlXdcagtcHwR7bK0MvdnpuQFUD4Kh+8
 Yu0pLAPljuMSLO44=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyW7J-005Zqb-Cv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 06:53:47 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7G646qs108124; Fri, 16 Aug 2019 02:16:41 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udny625tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2019 02:16:40 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7G65Ecr027354;
 Fri, 16 Aug 2019 06:16:39 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 2u9nj662gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2019 06:16:39 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7G6Gd3r11665928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 06:16:39 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E790112062;
 Fri, 16 Aug 2019 06:16:39 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61398112061;
 Fri, 16 Aug 2019 06:16:36 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.23])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 16 Aug 2019 06:16:36 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org
Date: Fri, 16 Aug 2019 11:47:56 +0530
Message-Id: <20190816061804.14840-1-chandan@linux.ibm.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160066
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hyW7J-005Zqb-Cv
Subject: [f2fs-dev] [PATCH V4 0/8] Consolidate FS read I/O callbacks code
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
Cc: hch@infradead.org, tytso@mit.edu, ebiggers@kernel.org,
 Chandan Rajendra <chandan@linux.ibm.com>, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patchset moves the "FS read I/O callbacks" code into a file of its
own (i.e. fs/read_callbacks.c) and modifies the generic
do_mpage_readpge() to make use of the functionality provided.

"FS read I/O callbacks" code implements the state machine that needs
to be executed after reading data from files that are encrypted and/or
have verity metadata associated with them.

With these changes in place, the patchset changes Ext4 to use
mpage_readpage[s] instead of its own custom ext4_readpage[s]()
functions. This is done to reduce duplication of code across
filesystems. Also, "FS read I/O callbacks" source files will be built
only if CONFIG_FS_ENCRYPTION is enabled.

The patchset also modifies fs/buffer.c to get file
encryption/decryption to work with subpage-sized blocks.

The patches can also be obtained from
https://github.com/chandanr/linux.git at branch subpage-encryption-v4.

Changelog:
V3 -> V4:
   1. A new buffer_head flag (i.e. BH_Read_Cb) is introduced to reliably
      check if a buffer head's content has to be decrypted.
   2. Fix layering violation. Now the code flow for decryption happens as shown below,
      FS => read callbacks => fscrypt
   3. Select FS_READ_CALLBACKS from FS specific kconfig file if FS_ENCRYPTION
      is enabled.
   4. Make 'struct read_callbacks_ctx' an opaque structure.
   5. Make use of FS' endio function rather than implementing one in read
      callbacks.
   6. Make read_callbacks.h self-contained.
   7. Split patchset to separate out ext4 and f2fs changes.
   
V2 -> V3:
1. Split the V2 patch "Consolidate 'read callbacks' into a new file" into
   three patches,
   - Introduce the read_callbacks functionality.
   - Convert encryption to use read_callbacks.
   - Remove union from struct fscrypt_context.
2. fs/Kconfig
   Do not explicitly set the default value of 'n' for FS_READ_CALLBACKS.
3. fs/crypto/Kconfig
   Select CONFIG_FS_READ_CALLBACKS only if CONFIG_BLOCK is selected.
4. Remove verity associated code in read_callbacks code.
5. Introduce a callback argument to read_callbacks_setup() function
   which gets invoked for each page for bio. F2FS uses this to perform
   custom operations like decrementing the value of f2fs_sb_info->nr_pages[].
6. Encapsulate the details of "read callbacks" (e.g. Usage of "struct
   read_callbacks *ctx") within its own functions. When CONFIG_FS_READ_CALLBACKS
   is set to 'n', the corresponding stub functions return approriate error
   values.
7. Split fscrypt_decrypt() function into fscrypt_decrypt_bio() and
   fscrypt_decrypt_bh().
8. Split end_read_callbacks() function into end_read_callbacks_bio() and
   end_read_callbacks_bh().

V1 -> V2:
1. Removed the phrase "post_read_process" from file names and
   functions. Instead we now use the phrase "read_callbacks" in its
   place.
2. When performing changes associated with (1), the changes made by
   the patch "Remove the term 'bio' from post read processing" are
   made in the earlier patch "Consolidate 'read callbacks' into a new
   file". Hence the patch "Remove the term 'bio' from post read
   processing" is removed from the patchset.

RFC V2 -> V1:
1. Test and verify FS_CFLG_OWN_PAGES subset of fscrypt_encrypt_page()
   code by executing fstests on UBIFS.
2. Implement F2fs function call back to check if the contents of a
   page holding a verity file's data needs to be verified.

RFC V1 -> RFC V2:
1. Describe the purpose of "Post processing code" in the cover letter.
2. Fix build errors when CONFIG_FS_VERITY is enabled.

Chandan Rajendra (8):
  buffer_head: Introduce BH_Read_Cb flag
  FS: Introduce read callbacks
  fs/mpage.c: Integrate read callbacks
  fs/buffer.c: add decryption support via read_callbacks
  f2fs: Use read_callbacks for decrypting file data
  ext4: Wire up ext4_readpage[s] to use mpage_readpage[s]
  ext4: Enable encryption for subpage-sized blocks
  fscrypt: remove struct fscrypt_ctx

 Documentation/filesystems/fscrypt.rst |   4 +-
 fs/Kconfig                            |   3 +
 fs/Makefile                           |   1 +
 fs/buffer.c                           |  33 ++-
 fs/crypto/bio.c                       |  43 ----
 fs/crypto/crypto.c                    |  89 +-------
 fs/crypto/fscrypt_private.h           |   3 -
 fs/ext4/Kconfig                       |   1 +
 fs/ext4/Makefile                      |   2 +-
 fs/ext4/inode.c                       |   5 +-
 fs/ext4/readpage.c                    | 295 --------------------------
 fs/ext4/super.c                       |   7 -
 fs/f2fs/Kconfig                       |   1 +
 fs/f2fs/data.c                        | 109 +---------
 fs/f2fs/f2fs.h                        |   2 -
 fs/f2fs/super.c                       |   9 +-
 fs/mpage.c                            |  24 ++-
 fs/read_callbacks.c                   | 285 +++++++++++++++++++++++++
 include/linux/buffer_head.h           |   2 +
 include/linux/fscrypt.h               |  38 ----
 include/linux/read_callbacks.h        |  48 +++++
 21 files changed, 402 insertions(+), 602 deletions(-)
 delete mode 100644 fs/ext4/readpage.c
 create mode 100644 fs/read_callbacks.c
 create mode 100644 include/linux/read_callbacks.h

-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

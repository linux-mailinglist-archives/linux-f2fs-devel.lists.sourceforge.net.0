Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 847A647608
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 16 Jun 2019 19:12:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hcYhv-0004T8-3M; Sun, 16 Jun 2019 17:12:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hcYht-0004Sq-05
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 16 Jun 2019 17:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xwg9ngQ1/y4wnhmSNop8+hM7JxrTmbp0U4xaNEFxgJo=; b=hROSmT9fwY0fs4QVXd3OhWbHV5
 ou0c6QngQBsquMYn+nEs2Nb6ZXsPm224lFkXHLUinY0tZ78W3QRqN93NhSwrdY7JQuTNAybEYNVc3
 90EBh5Pn1oQH4YqiMzxUGEkMExY1QaFM3dMkdVrwlwi7qXJCioDETJP8xYsVZfclWnNU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Xwg9ngQ1/y4wnhmSNop8+hM7JxrTmbp0U4xaNEFxgJo=; b=g
 N82auwbhjpgZx3PFboQCQaAjAxoi9AdYfwxDUIzUCGz0xzJM4ifyZCezETM/DEtuKi6uz0QVGZafL
 BA5Kd/tmdFvlrLhEBq0Xpd5KcDwV2tFYEQxhnhrXTf+YNZ8RNt4IFyW9EOcEWIfKaoaV9FMaEU7v/
 3nJTdHa+mS3QJS58=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hcYhq-00Gp1n-HY
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 16 Jun 2019 17:12:40 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5GG6Rri063661; Sun, 16 Jun 2019 12:07:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t5e9te9cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jun 2019 12:07:55 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5GG6cp5064406;
 Sun, 16 Jun 2019 12:07:55 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t5e9te9c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jun 2019 12:07:55 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5GFxNC8018708;
 Sun, 16 Jun 2019 16:07:54 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 2t4ra61bbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jun 2019 16:07:54 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5GG7reJ32112910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 16 Jun 2019 16:07:53 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01BE46E04C;
 Sun, 16 Jun 2019 16:07:53 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E88E06E04E;
 Sun, 16 Jun 2019 16:07:48 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.102.1.181])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 16 Jun 2019 16:07:48 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org
Date: Sun, 16 Jun 2019 21:38:06 +0530
Message-Id: <20190616160813.24464-1-chandan@linux.ibm.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906160155
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hcYhq-00Gp1n-HY
Subject: [f2fs-dev] [PATCH V3 0/7] Consolidate FS read I/O callbacks code
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
https://github.com/chandanr/linux.git at branch subpage-encryption-v3.

Changelog:
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

Chandan Rajendra (7):
  FS: Introduce read callbacks
  Integrate read callbacks into Ext4 and F2FS
  fscrypt: remove struct fscrypt_ctx
  fs/mpage.c: Integrate read callbacks
  ext4: Wire up ext4_readpage[s] to use mpage_readpage[s]
  Add decryption support for sub-pagesized blocks
  ext4: Enable encryption for subpage-sized blocks

 Documentation/filesystems/fscrypt.rst |   4 +-
 fs/Kconfig                            |   3 +
 fs/Makefile                           |   2 +
 fs/buffer.c                           |  55 +++--
 fs/crypto/Kconfig                     |   1 +
 fs/crypto/bio.c                       |  44 ++--
 fs/crypto/crypto.c                    |  90 +-------
 fs/crypto/fscrypt_private.h           |   3 +
 fs/ext4/Makefile                      |   2 +-
 fs/ext4/inode.c                       |   5 +-
 fs/ext4/readpage.c                    | 295 --------------------------
 fs/ext4/super.c                       |   7 -
 fs/f2fs/data.c                        | 124 ++---------
 fs/f2fs/super.c                       |   9 +-
 fs/mpage.c                            |  11 +-
 fs/read_callbacks.c                   | 233 ++++++++++++++++++++
 include/linux/buffer_head.h           |   1 +
 include/linux/fscrypt.h               |  38 ----
 include/linux/read_callbacks.h        |  45 ++++
 19 files changed, 390 insertions(+), 582 deletions(-)
 delete mode 100644 fs/ext4/readpage.c
 create mode 100644 fs/read_callbacks.c
 create mode 100644 include/linux/read_callbacks.h

-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

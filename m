Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1831E86B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 08:44:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQneg-0005Rd-RU; Wed, 15 May 2019 06:44:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lkp@intel.com>) id 1hQneg-0005RT-3d
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 06:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cBFoZ9JHkTYaCd3O4MRaIMNHOIRP3RZyuCcGWsjaf5I=; b=W+1PMckh/Vtdt+4i6NcYOKKOFu
 hjr38QiYFj562rMIJFDgS9zjcAX21EQFtIdKALv7XQPrk0o4PgALU97a1tg2P9O4+NA3srgcsuLX/
 S/m/6b7FPYixz9wJ7iBgXFnlq6WYvLLhisNsUwVlyaoGGKiK0V2lhcQsKffC+BxCSsts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cBFoZ9JHkTYaCd3O4MRaIMNHOIRP3RZyuCcGWsjaf5I=; b=b
 vkQSyEHxUpfzsDwVVcmnzY5WRuwW+VgStWRZbAkTRYez8aG1OYsO/FgD/grHlQ7yKNmbJjNlqNRVN
 drXvBeb3ejAX2O2FL0WyyhwIRGb4zbRKiZcT+cCDzhvopRXqx8IOdgO5oUZBN9EfvL+NgenE5zloT
 ujTxf1fklKK015KM=;
Received: from mga18.intel.com ([134.134.136.126])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQned-00GsDA-NS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 06:44:45 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 23:44:37 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 14 May 2019 23:44:36 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hQneW-000CCW-98; Wed, 15 May 2019 14:44:36 +0800
Date: Wed, 15 May 2019 14:43:58 +0800
From: kbuild test robot <lkp@intel.com>
To: Qiuyang Sun <sunqiuyang@huawei.com>
Message-ID: <201905151457.plb68OA0%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hQned-00GsDA-NS
Subject: [f2fs-dev] [f2fs:dev-test 7/13] fs/f2fs/gc.c:1436:44: sparse:
 sparse: cast to restricted __le32
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kbuild-all@01.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   e4cd04801efa3f41904df9792aa68b05fb3bae02
commit: 3f1e9a91423ff983985f648360a1f76787021654 [7/13] f2fs: ioctl for removing a range from F2FS
reproduce:
        # apt-get install sparse
        git checkout 3f1e9a91423ff983985f648360a1f76787021654
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/f2fs/gc.c:1436:44: sparse: sparse: cast to restricted __le32
>> fs/f2fs/gc.c:1436:44: sparse: sparse: cast from restricted __le64
>> fs/f2fs/gc.c:1436:42: sparse: sparse: incorrect type in assignment (different base types) @@    expected restricted __le64 [usertype] block_count @@    got restricted __le64 [usertype] block_count @@
>> fs/f2fs/gc.c:1436:42: sparse:    expected restricted __le64 [usertype] block_count
>> fs/f2fs/gc.c:1436:42: sparse:    got restricted __le32 [usertype]

vim +1436 fs/f2fs/gc.c

  1399	
  1400	int f2fs_resize_from_end(struct f2fs_sb_info *sbi, size_t resize_len)
  1401	{
  1402		unsigned int section_size = F2FS_BLKSIZE * BLKS_PER_SEC(sbi);
  1403		unsigned int secs = (resize_len + section_size - 1) / section_size;
  1404		int gc_mode;
  1405	
  1406		if (secs * BLKS_PER_SEC(sbi) + valid_user_blocks(sbi) +
  1407			sbi->current_reserved_blocks + sbi->unusable_block_count +
  1408			F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_count)
  1409			return -ENOSPC;
  1410	
  1411		mutex_lock(&DIRTY_I(sbi)->seglist_lock);
  1412		NEW_MAIN_SECS(sbi) = MAIN_SECS(sbi) - secs;
  1413		for (gc_mode = 0; gc_mode < MAX_GC_POLICY; gc_mode++)
  1414			if (SIT_I(sbi)->last_victim[gc_mode] >=
  1415						NEW_MAIN_SECS(sbi) * sbi->segs_per_sec)
  1416				SIT_I(sbi)->last_victim[gc_mode] = 0;
  1417		mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
  1418	
  1419		free_segment_range(sbi, NEW_MAIN_SECS(sbi) * sbi->segs_per_sec,
  1420				MAIN_SEGS(sbi) - 1);
  1421	
  1422		/* Update FS metadata */
  1423		SM_I(sbi)->segment_count -= secs * sbi->segs_per_sec;
  1424		MAIN_SECS(sbi) = NEW_MAIN_SECS(sbi);
  1425		MAIN_SEGS(sbi) = MAIN_SECS(sbi) * sbi->segs_per_sec;
  1426		sbi->user_block_count -= secs * BLKS_PER_SEC(sbi);
  1427		sbi->ckpt->user_block_count = cpu_to_le64(sbi->user_block_count);
  1428		FREE_I(sbi)->free_sections -= secs;
  1429		FREE_I(sbi)->free_segments -= secs * sbi->segs_per_sec;
  1430	
  1431		/* Update superblock */
  1432		F2FS_RAW_SUPER(sbi)->section_count = cpu_to_le32(MAIN_SECS(sbi));
  1433		F2FS_RAW_SUPER(sbi)->segment_count = cpu_to_le32(le32_to_cpu(
  1434			F2FS_RAW_SUPER(sbi)->segment_count) - secs * sbi->segs_per_sec);
  1435		F2FS_RAW_SUPER(sbi)->segment_count_main = cpu_to_le32(MAIN_SEGS(sbi));
> 1436		F2FS_RAW_SUPER(sbi)->block_count = cpu_to_le32(le32_to_cpu(

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

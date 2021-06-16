Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1823A9A2B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 14:27:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltUdL-0004ZM-RN; Wed, 16 Jun 2021 12:27:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sunke32@huawei.com>) id 1ltUdJ-0004ZA-Mp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 12:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:To:Subject:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x6hG57Gr17U0ppELK9xcOF07X8TFNNlQqQHn1mNIvd4=; b=XAeLPSBcnpVQH9WXgCwe37OanM
 +uDn0q1jocn9qoP1o+H4hs10i4bTqzy+1RXmt4ioqGdRcr3czbyusmxGwf+ZF1MHBzz8ZWb7Qxh7i
 OFbGKd4gYq02BO4Vs7OyX+55/aJkNbsnOQTkNEKXkki6X5D1oEz0YBvklkvpc/Es2z70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:To:
 Subject:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x6hG57Gr17U0ppELK9xcOF07X8TFNNlQqQHn1mNIvd4=; b=X
 a9KFbj2nexGPVpZ63RfkpLRnMsaMKdmuKUw9w0zd5IPDJysQYBsuNiYe5fCgnOtn8YJb8tTpuTdfA
 dOHY91Ukoth+pmKFyNNjoeS63BkAxzRBK7arAS7GSPvakMcjFx1zDgJsL6Dqb4bAe2qab1UouMxfS
 FZPCAqDAbAAHpa7w=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltUdE-0000uy-9E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 12:27:02 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G4kr90T3rzZdsx;
 Wed, 16 Jun 2021 20:23:53 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 20:26:48 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 dggema759-chm.china.huawei.com (10.1.198.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 16 Jun 2021 20:26:47 +0800
From: Sun Ke <sunke32@huawei.com>
To: <fstests@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
Message-ID: <75f8ed6b-ed20-febf-1257-adcb7aed9e86@huawei.com>
Date: Wed, 16 Jun 2021 20:26:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema759-chm.china.huawei.com (10.1.198.201)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.187 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ltUdE-0000uy-9E
Subject: [f2fs-dev] [Question] generic/064 fail on f2fs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I run generic/064 on f2fs:

[root@localhost xfstests-dev]# ./check tests/generic/064
FSTYP         -- f2fs
PLATFORM      -- Linux/x86_64 localhost 5.12.0-rc5-next-20210330 #8 SMP 
Tue Jun 8 11:09:37 CST 2021
MKFS_OPTIONS  -- /dev/sdb
MOUNT_OPTIONS -- -o acl,user_xattr /dev/sdb /tmp/scratch

generic/064 - output mismatch (see 
/root/work/xfstests-dev/results//generic/064.out.bad)
     --- tests/generic/064.out   2021-05-31 15:37:40.000000000 +0800
     +++ /root/work/xfstests-dev/results//generic/064.out.bad 
2021-06-10 17:19:09.469000000 +0800
     @@ -1,2 +1,3 @@
      QA output created by 064
      Extent count after inserts is in range
     +extents mismatched before = 1 after = 50
     ...
     (Run 'diff -u /root/work/xfstests-dev/tests/generic/064.out 
/root/work/xfstests-dev/results//generic/064.out.bad'  to see the entire 
diff)
Ran: generic/064
Failures: generic/064
Failed 1 of 1 tests


***

I added some test code and  tried on xfs and ext4:

root@localhost xfstests-dev]# git diff
diff --git a/tests/generic/064 b/tests/generic/064
index 7098fcd3..1baacb06 100755
--- a/tests/generic/064
+++ b/tests/generic/064
@@ -45,6 +45,8 @@ length=$(($BLOCKS * $BSIZE))
  _do "$XFS_IO_PROG -f -c \"pwrite 0 $length\" -c fsync $src"
  cp $src $dest
  extent_before=`_count_extents $dest`
+echo "extent_before: ${extent_before}" > log.txt
+echo "filesize: $(du -sh $dest)" >> log.txt

  # Insert alternate blocks
  for (( j=0; j < $(($BLOCKS/2)); j++ )); do
@@ -55,6 +57,8 @@ done
  # Check if 50 extents are present, allowing some slop for file systems
  # that don't have ideal allocation behavior
  num_extents=`_count_extents $dest`
+echo "num_extents: ${num_extents}" >> log.txt
+echo "filesize: $(du -sh $dest)" >> log.txt
  _within_tolerance "Extent count after inserts" $num_extents 50 0 6% -v

  _check_scratch_fs
@@ -70,6 +74,8 @@ for (( j=0; j < $(($BLOCKS/2)); j++ )); do
  done

  extent_after=`_count_extents $dest`
+echo "extent_after: ${extent_after}" >> log.txt
+echo "filesize: $(du -sh $dest)" >> log.txt
  if [ $extent_before -ne $extent_after ]; then
         echo "extents mismatched before = $extent_before after = 
$extent_after"
  fi


ext4:

extent_before: 1
filesize: 400K  /tmp/scratch/testfile.dest
num_extents: 50
filesize: 404K  /tmp/scratch/testfile.dest
extent_after: 1
filesize: 404K  /tmp/scratch/testfile.dest

xfs:

extent_before: 1
filesize: 400K  /tmp/scratch/testfile.dest
num_extents: 50
filesize: 404K  /tmp/scratch/testfile.dest 
 

extent_after: 1
filesize: 400K  /tmp/scratch/testfile.dest


f2fs:

extent_before: 1
filesize: 400K  /tmp/scratch/testfile.dest
num_extents: 50
filesize: 400K  /tmp/scratch/testfile.dest
extent_after: 50
filesize: 400K  /tmp/scratch/testfile.dest


***
The filesize is always 400K and extent_after is still 50. Is it a bug in 
f2fs or I need adjust the case for f2fs?

I also wondering that why after insert 50 holes, the filesize is 404K? 
I think it should be 400K + 4K * 50 = 600K.

The fallocate(2) manual page say: Inserting a hole inside a file 
increases the file size by len bytes.

BLOCKS=100
BSIZE=4096

for (( j=0; j < $(($BLOCKS/2)); j++ )); do
     offset=$((($j*$BSIZE)*2))
     _do "$XFS_IO_PROG -c \"finsert $offset $BSIZE\" $dest"
done


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E8BEF155
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Oct 2025 04:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Icd1rbnvnLyVUxf3seW/AKWzWD66grRhEh50iPEFgsM=; b=Fi2iKCHXD4rloxR3ZUQtCCXh4B
	E/u40NaLv1Fie8d0BZJi75GXD8hyLyWf802wreFtvigv1IKDy7XaJSy3ea9Z/YliyUrzeBKixDlwy
	TNLtcoUa7RrcZLceVHga5+x1/ZNDOLMHcLTiTQT7Dz/CQXiEhyFILRv9Km6xE+6PyL6k=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vAfgE-0000n6-Ja;
	Mon, 20 Oct 2025 02:31:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vAfgD-0000mx-3G
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 02:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aZstENT0LyzMoCr3vgtGD3KsyzJyUeF2vS7hGsimS+8=; b=WIkw9eIHK8j47tpSFoTa6vze4S
 d++jje0l7Vp5MgsNhjf3q63yeKSgaDriniH60ENZaUtCUlyi3WRebhzuCOkTm6/cZfwJzf99D3j8G
 JWlePEpQtjowbFYUf5vIoUaVcey0/qNZHTBGyw3rRneAKeqSJQ2ZYKKPDHyrP5UYG1bM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aZstENT0LyzMoCr3vgtGD3KsyzJyUeF2vS7hGsimS+8=; b=D+cgTPABi70AxYMFsM+usHWpaP
 wqq6gshEpFAXtE6YxIYtPTl0Z6fpjaTCdZzvLPMhSfdsIjCSTrY2bUhh2zvMr7UWN15ol17KcKCtu
 TlZM5qVesASgHGF/YIkqL3+P7SpB7dKjErUtJanTp5WBDG8GNwJ/Fbz9vTRgrBMGILLU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vAfgC-0006xs-L8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 02:31:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 17778612AF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Oct 2025 02:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD5BC4CEF1;
 Mon, 20 Oct 2025 02:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760927478;
 bh=BpyPGac38NiCmM9sPUZhtik3i8wnnjFRlyJevgabVWw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KCAMMqapAl4BAqMASbAsCnf5vbJvDtZuV8+MScXKfASzJRig2jlaz+IP0ecj21c7d
 xau55/3GMEqSJWoHdWTPb5JdTe5RV6KbtFfPfY8+Zir1pxQCbOBeAYlQd/lWgRvb/8
 LHeCDR33x8J4W/Jz3iMEFD385aXIgMZlcDPLgYQGDDKCPkmPEXchj5oJFaMw0NLdvA
 Ub8Dussbffl6Od/xIQx44wEojNfzSJihWXh9padBv/MsM6vGIkxGaP2ng3f98UeX8F
 AwJVBE+XjFQ/OK68b2vf2LuBgBxh0cVVuKQVLuq2Qe5JKg1fejB4pmtys2yExYp42R
 7cOmSzM3H87RQ==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 20 Oct 2025 10:31:08 +0800
Message-ID: <20251020023108.327728-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
In-Reply-To: <20251020023108.327728-1-chao@kernel.org>
References: <20251020023108.327728-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs/022 will report failure as below: f2fs/022 - output
 mismatch
 (see /share/git/fstests/results//f2fs/022.out.bad) --- tests/f2fs/022.out
 2025-10-20 10:18:47.075968669 +0800 +++
 /share/git/fstests/results//f2fs/022.out.bad
 2025-10-20 10: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vAfgC-0006xs-L8
Subject: [f2fs-dev] [PATCH 2/2] f2fs/022: fix to run testcase correctly
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs/022 will report failure as below:

f2fs/022       - output mismatch (see /share/git/fstests/results//f2fs/022.out.bad)
    --- tests/f2fs/022.out      2025-10-20 10:18:47.075968669 +0800
    +++ /share/git/fstests/results//f2fs/022.out.bad    2025-10-20 10:25:20.000000000 +0800
    @@ -1,2 +1,5 @@
     QA output created by 022
    +wrote 8388608/8388608 bytes at offset 0
    +8 MiB, 2048 ops; 0.0018 sec (4.300 GiB/sec and 1127132.6362 ops/sec)
    +fallocate: Operation not supported
     Silence is golden
    ...
    (Run 'diff -u /share/git/fstests/tests/f2fs/022.out /share/git/fstests/results//f2fs/022.out.bad'  to see the entire diff)

HINT: You _MAY_ be missing kernel fix:
      xxxxxxxxxxxx f2fs: fix to do sanity check on node footer for non inode dnode

Fix this testcase as below:

- fix a typo "$SCARTCH_MNT"
- fix to update output to "fallocate: Structure needs cleaning"
- relocate output of "$XFS_IO_PROG $foo_path -c "pwrite 0 8M"" to
$seqres.full

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/022     | 8 +++-----
 tests/f2fs/022.out | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/f2fs/022 b/tests/f2fs/022
index f6d77c96..728ef4e8 100755
--- a/tests/f2fs/022
+++ b/tests/f2fs/022
@@ -24,15 +24,15 @@ _require_inject_f2fs_command node i_nid
 # remove all mkfs options to avoid layout change of on-disk inode
 export MKFS_OPTIONS=""
 
-foo_path=$SCARTCH_MNT/foo
-bar_path=$SCARTCH_MNT/bar
+foo_path=$SCRATCH_MNT/foo
+bar_path=$SCRATCH_MNT/bar
 
 _scratch_mkfs >> $seqres.full
 _scratch_mount
 
 touch $foo_path
 touch $bar_path
-$XFS_IO_PROG $foo_path -c "pwrite 0 8M"
+$XFS_IO_PROG $foo_path -c "pwrite 0 8M" >> $seqres.full
 sync
 foo_ino=`stat -c '%i' $foo_path`
 bar_ino=`stat -c '%i' $bar_path`
@@ -48,7 +48,5 @@ _scratch_mount
 $XFS_IO_PROG $foo_path -c "fpunch 6984k 4k"
 _scratch_unmount
 
-echo "Silence is golden"
-
 status=0
 exit
diff --git a/tests/f2fs/022.out b/tests/f2fs/022.out
index 394c6a7c..5307e3d7 100644
--- a/tests/f2fs/022.out
+++ b/tests/f2fs/022.out
@@ -1,2 +1,2 @@
 QA output created by 022
-Silence is golden
+fallocate: Structure needs cleaning
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

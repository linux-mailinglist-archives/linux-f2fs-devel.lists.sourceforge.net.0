Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C540F9B37D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjK-0002ek-Bj;
	Mon, 28 Oct 2024 17:40:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjI-0002ee-Ma
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RqaiqcnrN//eilDgPtXyGDONKIjiy+cT2I51oV4M1Ho=; b=aAmFJ97ne0gjZ9ZTO+WpK2Hzxp
 z264zHeiIJWkqVfgchLHByF/100PIzl+gStZSfY1aQjBjdOTz93qr5q/eTinsUG5WwTvV+Gc7jzMO
 Re9WkM7ZgfnF//4kCwGifLrmhrcBudd3zUONWQ+Z2v3mmknobEk0TD7Nl+P8s8NN5ZwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RqaiqcnrN//eilDgPtXyGDONKIjiy+cT2I51oV4M1Ho=; b=n
 BwE3jtd/BcsbmnYFIzFqRDe98ycl/U36tmcjUYcOkUdij5S3xo3clQhg6mhzyqLpEBhIiGnc9jwK0
 t1HbLiSwEQIw3pVcyVlzQ2VUHoYFfUH4dwj9r60ZXCcUBXXPhZ6yKH06mAFDGBAsDXdhX1za736Tg
 rH0bgIyjCj5gYX3g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjI-0005Gl-Ki for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 399EB5C5B06
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 17:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C9BC4CEEB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 17:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137225;
 bh=X4NZaRXFeE/HKn4Lt27sKR4RRLdzV1anpYWcie/YAvU=;
 h=Subject:From:Date:To:From;
 b=YO9Vz4rHsNCeDvVUPZrdMvBGxYTmnoAGQjBZaGlO/iNusTckVlbDmoqbPATi72+0/
 A1ESEFqRJjD+lPojHtwCf5NGaW5XAMECDy4QiNWOLlJ22TB0lHbT/h885mzM/qSZua
 ax2Gfkvr+sJCRIf6TZCpL8/GFegrrTogxBrx9gBe0K0o4C/fcPprObvZF/s3XAPk9u
 Ss9QBb3ugon7YqWNv5tKRYBDRggS7NrN/ZFUesaVbRJiRUQvx/jxL53Dhm5jr0KKlS
 A9N6fIZuebBcbPpJsPzO3HBzYNTRRUYRu6H/UcYJw3pHWFqHG2/gvHxf+8pwTVdlSV
 YYr+fS+8vU0YQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 022E5380AC1C for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 17:40:33 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013723239.126843.1375071794944069179.git-patchwork-summary@kernel.org>
Date: Mon, 28 Oct 2024 17:40:32 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: Use
 struct_size() helper to improve f2fs_acl_clone() Submitter: Thorsten Blum
 <thorsten.blum@linux.dev> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https://patchwork [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5TjI-0005Gl-Ki
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev] f2fs: Use struct_size() helper to improve f2fs_acl_clone()
  Submitter: Thorsten Blum <thorsten.blum@linux.dev>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=892420
  Lore link: https://lore.kernel.org/r/20240924102800.240209-2-thorsten.blum@linux.dev

Patch: [f2fs-dev,RESEND] f2fs: Use struct_size() to improve f2fs_acl_clone()
  Submitter: Thorsten Blum <thorsten.blum@linux.dev>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=903770
  Lore link: https://lore.kernel.org/r/20241028112058.3346-2-thorsten.blum@linux.dev

Patch: [f2fs-dev] f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode.
  Submitter: Qi Han <hanqi@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=891101
  Lore link: https://lore.kernel.org/r/20240918084400.1821317-1-hanqi@vivo.com

Patch: [f2fs-dev] f2fs: multidevice: add stats in debugfs
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=899670
  Lore link: https://lore.kernel.org/r/20241016082420.610844-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: decrease spare area for pinned files for zoned devices
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=899411
  Lore link: https://lore.kernel.org/r/20241015165427.1158782-1-daeho43@gmail.com

Series: Speed up f2fs truncate
  Submitter: Yi Sun <yi.sun@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=899612
  Lore link: https://lore.kernel.org/r/20241016052758.3400359-1-yi.sun@unisoc.com
    Patches: [f2fs-dev,RFC,1/2] f2fs: introduce update_sit_entry_for_release()

Patch: [f2fs-dev] f2fs: check curseg->inited before write_sum_page in change_curseg
  Submitter: Yongpeng Yang <yangyongpeng1@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=901217
  Lore link: https://lore.kernel.org/r/20241021044801.1358850-1-yangyongpeng1@oppo.com

Series: [f2fs-dev,1/3] f2fs: zone: introduce first_zoned_segno in f2fs_sb_info
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=900531
  Lore link: https://lore.kernel.org/r/20241018062638.2619214-1-chao@kernel.org
    Patches: [f2fs-dev,1/3] f2fs: zone: introduce first_zoned_segno in f2fs_sb_info

Patch: [f2fs-dev] f2fs: fix null-ptr-deref in f2fs_submit_page_bio()
  Submitter: Ye Bin <yebin@huaweicloud.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=898141
  Lore link: https://lore.kernel.org/r/20241011164450.3366215-1-yebin@huaweicloud.com

Patch: [f2fs-dev,v2] f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks
  Submitter: Qi Han <hanqi@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=893697
  Lore link: https://lore.kernel.org/r/20240929080011.3802327-1-hanqi@vivo.com

Patch: [f2fs-dev] f2fs: fix to do sanity check on node blkaddr in truncate_node()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=899664
  Lore link: https://lore.kernel.org/r/20241016081337.598979-1-chao@kernel.org

Series: f2fs: modify the calculation method of mtime
  Submitter: patchwork-bot+f2fs--- via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=891129
  Lore link: https://lore.kernel.org/r/1726653980-590956-1-git-send-email-liuderong@oppo.com
    Patches: [f2fs-dev,v3,1/2] f2fs: remove unused parameters
             [f2fs-dev,v3,2/2] f2fs: introduce f2fs_get_section_mtime

Patch: [f2fs-dev] f2fs: fix to account dirty data in __get_secs_required()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=899129
  Lore link: https://lore.kernel.org/r/20241015034339.3244676-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix the wrong f2fs_bug_on condition in f2fs_do_replace_block
  Submitter: LongPing Wei <weilongping@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=901200
  Lore link: https://lore.kernel.org/r/20241021023147.1774412-1-weilongping@oppo.com


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

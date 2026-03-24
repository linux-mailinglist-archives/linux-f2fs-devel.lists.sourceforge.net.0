Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEavOLjKwmkBmQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2871731A0FD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mxnqM7rA7DCcIwFSuy1X68FJexih37UuejMX5senb/g=; b=eO+WS6n7yJa56mvQl3j3lL5WX3
	bhfVxZvNxv22mhXtB0/mbkFAyMa+mnNCIbvIBGRWDujlc44fX5mN91RyYAxEmYu53DDbCWKVRRZRG
	Dg86nLHdL9Ao+3lIEXsPtzD+CQkHnYO23UVmvg91/0g/aiReBbawPX9Qx59tJa/M9kHw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w55cI-00051z-C9;
	Tue, 24 Mar 2026 17:32:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1w55cG-00051t-Aa
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nxisdUsRHEcO8avAF8mL0faQjQoYVH5z6b5tmvUEVuE=; b=Nmx80fnC4aL6EHUV7HZ8rCQpVs
 sWl8/1Zroc8PO/DLFslaBiKEuM2tySIlyuIRv5vu/bYdsk1AZdnwuXnPwQVR+aWXVr1n8ntxk4rQ9
 QHL1tAkwm9McbxLyrT0K6UqReyH8i/8izch5QO36Tg9Jldm58OzkNYalwUZJvgXw6RCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nxisdUsRHEcO8avAF8mL0faQjQoYVH5z6b5tmvUEVuE=; b=g
 DL1aFh03gcGJkIa/quPlPx8p7GyAGbLryRlpMFvgGfvPM9QnGbxIwwsNzwBzbKf/qZmpPRQTDWMQi
 6F299bgo0lMZ7veiepL74diKLjGlBNY1u1s3oPcctcucUVUIp4+cv9S337QUYR8DiaLatDAHiZzFB
 uBO4TNquhsut9u9o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w55cF-0007q1-Hv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 27FEC44575
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Mar 2026 17:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C921C19424
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Mar 2026 17:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774373541;
 bh=Q/84m+2h4ztH9M7F5q/MaGPcIJl0xoaCF8/bXba8okA=;
 h=Subject:From:Date:To:From;
 b=YWwYsoKFl+wDC/dSpEwQY9FClpyscomA24T06j5i46qQBPkMMI6vpupJgKD5KD6qO
 ptzFq9fUHY3zbyRd+/3FU0nyEsLlti//J+ihU+2gmzLrsjGTBoqtwKSF8O/sqdOf6V
 CJDsd9QcJLHAyW8PB8GMMyzLUIXZDyeJqHEvSgmM140AhT+htr4jUr8rF9EBk4EDUa
 BQaf4HZD1TrVRRrxmxGI5Eh4t+L8W4w2+odbXxlOSl296jmi3nCRnvWQAgbeNMXE6X
 DKSndQDnvbNu5W33Sao0ean2DUXgBeCd5v212CB2xH9HhnMwbXfdNpgwapypz8ngVE
 gkJN8uIyhn68Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 05A653808203 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Mar 2026 17:32:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177437352862.1223048.3815455394287346647.git-patchwork-summary@kernel.org>
Date: Tue, 24 Mar 2026 17:32:08 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: drop
 unused ri parameter from truncate_partial_nodes() Submitter: Yongpeng Yang
 <monty_pavel@sina.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w55cF-0007q1-Hv
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
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_EQ_FROM(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,linux-foundation.org:email,sina.com:email]
X-Rspamd-Queue-Id: 2871731A0FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev] f2fs: drop unused ri parameter from truncate_partial_nodes()
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1069119
  Lore link: https://lore.kernel.org/r/20260319083525.603728-3-monty_pavel@sina.com

Series: [f2fs-dev,v3,1/2] f2fs: call f2fs_handle_critical_error() to set cp_error flag
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1070733
  Lore link: https://lore.kernel.org/r/20260323083834.156393-1-chao@kernel.org
    Patches: [f2fs-dev,v3,1/2] f2fs: call f2fs_handle_critical_error() to set cp_error flag
             [f2fs-dev,v3,2/2] f2fs: use more generic f2fs_stop_checkpoint()

Patch: [f2fs-dev,v2] f2fs: fix to skip empty sections in f2fs_get_victim
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1067522
  Lore link: https://lore.kernel.org/r/20260316185922.2184759-1-daeho43@gmail.com

Patch: [f2fs-dev,v4] f2fs: fix use-after-free of sbi in f2fs_compress_write_end_io()
  Submitter: George Saad <geoo115@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1070857
  Lore link: https://lore.kernel.org/r/20260323112123.786090-1-geoo115@gmail.com

Patch: [f2fs-dev,GIT,PULL] fsverity updates for 6.3
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=723317
  Lore link: https://lore.kernel.org/r/Y/KLHT3zaA0QFhVJ@sol.localdomain

Series: [f2fs-dev,v4,1/2] f2fs: fix incorrect multidevice info in trace_f2fs_map_blocks()
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1070877
  Lore link: https://lore.kernel.org/r/20260323120622.3351920-2-monty_pavel@sina.com
    Patches: [f2fs-dev,v4,1/2] f2fs: fix incorrect multidevice info in trace_f2fs_map_blocks()
             [f2fs-dev,v4,2/2] f2fs: fix fiemap boundary handling when read extent cache is incomplete

Patch: [f2fs-dev] f2fs: fix to do sanity check on dcc->discard_cmd_cnt conditionally
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1065133
  Lore link: https://lore.kernel.org/r/20260311133542.1074617-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: support to report fserror
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1070750
  Lore link: https://lore.kernel.org/r/20260323090344.219267-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to avoid uninit-value access in f2fs_sanity_check_node_footer
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1063374
  Lore link: https://lore.kernel.org/r/20260309022237.1680736-1-chao@kernel.org

Series: [f2fs-dev,v5,1/4] f2fs: refactor f2fs_move_node_folio function
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1068505
  Lore link: https://lore.kernel.org/r/20260318084534.373516-2-monty_pavel@sina.com
    Patches: [f2fs-dev,v5,1/4] f2fs: refactor f2fs_move_node_folio function
             [f2fs-dev,v5,3/4] f2fs: fix fsck inconsistency caused by FGGC of node block
             [f2fs-dev,v5,4/4] f2fs: fix inline data not being written to disk in writeback path

Patch: [f2fs-dev] f2fs: fix false alarm of lockdep on cp_global_sem lock
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1062550
  Lore link: https://lore.kernel.org/r/20260306122421.209903-1-chao@kernel.org

Patch: [f2fs-dev,v3] f2fs: fix to freeze GC and discard threads quickly
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1067523
  Lore link: https://lore.kernel.org/r/20260316185954.2185806-1-daeho43@gmail.com

Patch: [f2fs-dev,v2] f2fs: add READ_ONCE() for i_blocks in f2fs_update_inode()
  Submitter: Cen Zhang <zzzccc427@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1068459
  Lore link: https://lore.kernel.org/r/20260318073253.3108313-1-zzzccc427@gmail.com

Series: f2fs: fix data consistency issue caused by nat_entry flag
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1064219
  Lore link: https://lore.kernel.org/r/20260310093611.2865092-2-monty_pavel@sina.com
    Patches: [f2fs-dev,1/2] f2fs: fix fsck inconsistency caused by incorrect nat_entry flag usage
             [f2fs-dev,2/2] f2fs: fix data loss caused by incorrect use of nat_entry flag


Total patches: 19

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

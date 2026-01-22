Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDt2Mb+3cmlKowAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:50:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 188AB6E993
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:50:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LOS6rGDjwVh6K+D8FN1emmQ3KX3LNBSPsfaZSusg3XU=; b=D/JUTvxaWxOm0MVJKgSXIt17QT
	Yq1j8uThzYF11vKhvKR3VcLyIUYYychb6ojSsmeRbJ/ADukqYXY8+tEyLrrMwJBcV2176vFKH4LLy
	3GV2YKuZXTAGtVDbn8OPbC11eyjvLbcHAkBcb5/aLY9Pgc/fFsAGws4BU2tgsXYEgRhQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj4RR-0000p5-Ao;
	Thu, 22 Jan 2026 23:50:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vj4RO-0000ow-LA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sg8ZzVKtZdxQMldOQY+IeyGukYLLm4ivLE8LT5zM4F8=; b=BmfhYxCe9PkrOn7AUj+BArTebO
 YLg691vQcNFT0JT9mFA35lW+hgsGQ4CpbFnsfHdnfdYmTWR2uLH5M7Nf6qahaxCd4B7/a3j+WDD8f
 EbMQ8+MWpD8/YWbkSP+rndIklR3mefqA95wm8EuXGl8Sz9amUJQtV7hQuyigkBOsgdaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sg8ZzVKtZdxQMldOQY+IeyGukYLLm4ivLE8LT5zM4F8=; b=Z
 XXDo5k2JTHE6DSxud0xULXf8jT7fAUjbbKh3fHpklc2RQjSn/ZlhNMpHRIgcw6QqREMmP+o003ity
 3b4yS//G7EslJjfFch4R+LwWzXMF7CKosQPur9FRGQKTRpviCZq8A0HAaSX4Z98wBjW/3bua3lpkz
 M8sNzMYElpZWSldo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj4RO-0002No-4h for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:50:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C24B04385B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 23:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12BCC116C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 23:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769125807;
 bh=DXJYKXiUtrHEEt+978RQVu5ivNfmsziOS2RGUybmXxc=;
 h=Subject:From:Date:To:From;
 b=de9Q4hYoKJuBoCaGiCkAyCnLbVe9gUlxo5XGjEeLTMAS65FNLJ60mFOpXscnkX5bu
 YiMuqCON9PD39gJXCM5Y7BwlxNQ+nXjTPSPVOW8m1wCAhz+QYhFfpYyrbg+ot1S4d3
 MUwSuVzxXMOXjRlXGqbqGm9PXU4WoOMmPGqNIeexTx+plrzKdI0xelzaFJ+nmBnjES
 9uz3TYRAzJgbeeMnV1IL/m3rpjJTbY24wkzyORG74GHGMKPnHMIWhFYj0mJlU1MT8U
 uWbsdVhtgHWm5jhxO4f2HPxjXkn9L1gf+RLao2s1WP8iVRsAUvuGeHKWsYnB0sQyFW
 XzjXK+0xW8O0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 143323808200 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 23:50:05 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176912580362.2327822.677510486166749185.git-patchwork-summary@kernel.org>
Date: Thu, 22 Jan 2026 23:50:03 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,v2,1/2] f2fs:
 check skipped write in f2fs_enable_checkpoint() Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj4RO-0002No-4h
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
X-Rspamd-Server: lfdr
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:email]
X-Rspamd-Queue-Id: 188AB6E993
X-Rspamd-Action: no action

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: [f2fs-dev,v2,1/2] f2fs: check skipped write in f2fs_enable_checkpoint()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1044669
  Lore link: https://lore.kernel.org/r/20260120091215.62608-1-chao@kernel.org
    Patches: [f2fs-dev,v2,1/2] f2fs: check skipped write in f2fs_enable_checkpoint()
             [f2fs-dev,v2,2/2] f2fs: introduce FAULT_SKIP_WRITE

Patch: [f2fs-dev] Revert "f2fs: add timeout in f2fs_enable_checkpoint()"
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1043536
  Lore link: https://lore.kernel.org/r/20260116215044.2565391-1-jaegeuk@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix error path handling in f2fs_read_data_large_folio()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1043198
  Lore link: https://lore.kernel.org/r/20260116062927.21725-1-chao@kernel.org

Series: f2fs: reduce checkpoint write latency under metadata-intensive workloads
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1041868
  Lore link: https://lore.kernel.org/r/20260113152138.15979-2-monty_pavel@sina.com
    Patches: [f2fs-dev,v2,1/3] f2fs: add write latency stats for NAT and SIT blocks in f2fs_write_checkpoint

Patch: [f2fs-dev] f2fs: decrease maximum flush retry count in f2fs_enable_checkpoint()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1044964
  Lore link: https://lore.kernel.org/r/20260121051404.2056730-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: pin files do not require sbi->writepages lock for ordering
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1042921
  Lore link: https://lore.kernel.org/r/20260115164749.11900-2-monty_pavel@sina.com

Patch: [f2fs-dev] f2fs: fix to show simulate_lock_timeout correctly
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1044681
  Lore link: https://lore.kernel.org/r/20260120091826.63308-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix to unlock folio in f2fs_read_data_large_folio()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1043199
  Lore link: https://lore.kernel.org/r/20260116063115.21938-1-chao@kernel.org


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

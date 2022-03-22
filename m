Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EBB4E460D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Mar 2022 19:32:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWjIh-0001dJ-6V; Tue, 22 Mar 2022 18:32:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1nWjIg-0001dD-Os
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 18:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JYiXzwW+O+M+Y/rHHVlKr2k3nJR9BCbS0SnzeFvsAm0=; b=YQ7EDfgbnBn6HLNkBeS56lcbtj
 JY22x5RJFuNxYdjZMf+GEIiIgyBRJzvR6cJgjkHXYu84gdStuz62BUUAv3LkE+Sjf8cOmnasf3re9
 TJntf1/76Rv0YipAbgzwtDY0SAvURGwvNp9jWhTFw7ld4pqOcYHExPNzArcgvQz8wuhY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JYiXzwW+O+M+Y/rHHVlKr2k3nJR9BCbS0SnzeFvsAm0=; b=GqQZmnS1oL3SbmFL6YZCahO64n
 DoJRwPtjxO8KQ3MaAAku9l8nnnWAK/6aHxWIjHuH9ImZMnzgo4O7aOoLa4/44ZuH8w0gvFzJ9aAQK
 T1ly2h48F8ysJ00IMDjAIk7m/keDmBHyxHY1i5DNK9dQQsvni+trQy0B/o3kwNWtvmmQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWjIe-008mbQ-Hy
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 18:32:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ADB4AB81C56;
 Tue, 22 Mar 2022 18:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BF36C340EC;
 Tue, 22 Mar 2022 18:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647973916;
 bh=QmIvL3x8HBh1HSJ5HGqlajc0d/oc/GSWwN3g8Ue+tgw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=qpQNaLLWNGdTXJNp1yFVvP8HOkGwx10E4oaW9mgIS5zeqS0KdAK1xdiDYY7YCCVIj
 RKe62fmkzdU+UFK92nh4q1RqbY+JPhC9U/NnVoPqcE0PpKUOC7jlYC0eAwMVFWpNgC
 GUVxknfyxKOSbPYaViwtPjtGcPpk0irruF0YRaaxFKthX9LCTbaaiPBObr07CrCtpq
 /YNnk8Alowa8viXW8Fzq4AiuhYaDg2F2x+PreKOC6lweqOEpNYvvRIuwY1CmxJcFUd
 eHUmU0BXIdawrYE7l5FoJhLHi1pJ0W//NfCq3yxEnTNunRYvKfVWqqh01jVQpvJLZP
 DFSdugupI5e9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 535C8E6D406; Tue, 22 Mar 2022 18:31:56 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YjgEC8Nw9PDmdY0O@sol.localdomain>
References: <YjgEC8Nw9PDmdY0O@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YjgEC8Nw9PDmdY0O@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: cdaa1b1941f667814300799ddb74f3079517cd5a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 881b568756ae55ce7d87b9f001cbbe9d1289893e
Message-Id: <164797391633.17704.3889508763261319003.pr-tracker-bot@kernel.org>
Date: Tue, 22 Mar 2022 18:31:56 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sun, 20 Mar 2022 21:50:19 -0700:
 > https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/881b568756ae55ce7d87b9f001cbbe9d1289893e
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nWjIe-008mbQ-Hy
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt updates for 5.18
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sun, 20 Mar 2022 21:50:19 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/881b568756ae55ce7d87b9f001cbbe9d1289893e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

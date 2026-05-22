Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIlmGNzbD2pgQgYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 06:30:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CD85AEA16
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 06:30:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VE5twtxtJzJXYNQsu91VgT78pIHZ7T5zMvRAuphQnMg=; b=jDuPL/KAkY194Jy4ieFF63JaUh
	qpX7MEJnI+R7GP1YZxuampn1ftw6IWzmmGQ8DByHAGmowbVD0p2QgqhwT+yqs6p5ZeHucFCskp5tT
	fI9xVv/Uifgu+ZQ4wKEZKEqn4FnUQSwR2bW2YuZ6t1gJgv9rxN/cqUcKpaEiwzPsLdwg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQHWb-0004qN-Ld;
	Fri, 22 May 2026 04:30:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wQHWZ-0004q9-Rt
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 04:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PpvZNDPjMGjLx+ncqPI+jTwoTzzEntMmF8vXaGCwmQo=; b=TmEJPRwW/iUVl6Gs4//9FvH7qi
 F3wgJazUrSKqhNo+nMK1pnBL03077lrKeJxNIXh6GAhOgXNXRoEooJY49PdLpLiZyzkcauqFV03UJ
 3Fu1kfnP914RM2RneOH61VdVHIUAL+O4bMpYJ308qFidiOXnIW1Crqwq+7jfqAkFhPPs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PpvZNDPjMGjLx+ncqPI+jTwoTzzEntMmF8vXaGCwmQo=; b=I+jpN40538+0CRhNwNFe9H7nCH
 V5WSgUk+1vCVacgbQvHyskcVOfjCmbedQOzzo9Rghe08oRESlEYSNhE/QtlYVdog5XTggqDp6vGeL
 rmBRpeK5x+eIer50+eKfNgS+zojgS0Qqvxab7t2w4KyrlxlqMExae88KuJGfn6i9shlU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQHWW-0007T4-Pr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 04:30:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 041B341912;
 Fri, 22 May 2026 04:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C901F00ADE;
 Fri, 22 May 2026 04:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779424202;
 bh=PpvZNDPjMGjLx+ncqPI+jTwoTzzEntMmF8vXaGCwmQo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=B42mjLK8ZxTWQFOldSLDstVzFjjPTy3g0Rbxzz+nytzmsSruS67MH7TkEC44g68+m
 QcR12bIH9RZKMtFfs0XcSq9lMQaod8X/Ua7znrKcY1PJUFEhZtogZuEZcZdFFv0v4J
 1imNFcGYhLV2nKrucN9oOlMW9EIXY15AJpLAeMMmGZtVjNaqMp3sM4FFLHWSaL7X6N
 SPk9Gxn1P0VFOqrgjyySQB9F4kB+nWa6f95Xoh7ujCMoUhbRHCU6EDxto6MPSYiWz6
 zEHXfkxeC+x3/KwNebzfb2ZEJSMiwp78lNiL2+0XTSn3vzGRgLYA4fv4NUPYueUqvn
 6ElxAwqL/51wA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 9395D3930E41; Fri, 22 May 2026 04:30:13 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177942421214.624124.13316051114655548843.git-patchwork-notify@kernel.org>
Date: Fri, 22 May 2026 04:30:12 +0000
References: <20260520120705.1263756-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260520120705.1263756-1-qiwenjie@xiaomi.com>
To: Wenjie Qi <qwjhust@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 20 May 2026 20:07:05 +0800 you
 wrote: > f2fs_write_single_node_folio() takes an io_type argument, but still
 > passes FS_GC_NODE_IO to __write_node_folio() unconditionally. > > This
 was harmles [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wQHWW-0007T4-Pr
Subject: Re: [f2fs-dev] [PATCH] f2fs: pass correct iostat type for single
 node writes
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
Cc: yangyongpeng@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FREEMAIL_TO(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:yangyongpeng@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 40CD85AEA16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 20 May 2026 20:07:05 +0800 you wrote:
> f2fs_write_single_node_folio() takes an io_type argument, but still
> passes FS_GC_NODE_IO to __write_node_folio() unconditionally.
> 
> This was harmless while the helper was only used by
> f2fs_move_node_folio(), whose caller passes FS_GC_NODE_IO. However,
> commit fe9b8b30b971 ("f2fs: fix inline data not being written to disk
> in writeback path") made f2fs_inline_data_fiemap() call the helper with
> FS_NODE_IO for FIEMAP_FLAG_SYNC.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: pass correct iostat type for single node writes
    https://git.kernel.org/jaegeuk/f2fs/c/8fdfd2d4ec98

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

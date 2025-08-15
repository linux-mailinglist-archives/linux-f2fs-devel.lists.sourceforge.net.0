Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D182B283FB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:40:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mruzproczUF+UJHZRuKKxALcp/JpHxDT4ZaNW1k9wM=; b=PFkSY4m5RE8B71QnzEfHn9fSAK
	MjGuJ1lmUIzsAuRzU+a4iumpJGkwjsRzEbQmAnm9AF0jx8uIQp3Qh0slEuTNams7aP/ufMou7LcQ+
	TC7gWLAkN4InKhW2fhglAboECY8T7BZ1fVcVzYf9wPBMyQhpe5GtmYCfuteTcLPBbARI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umxTU-0002xj-CZ;
	Fri, 15 Aug 2025 16:40:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1umxTS-0002xG-Fb
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/+9XN1C0sXLC1PVWc2dSSddlawvMjwdDGEIJjI+3Za8=; b=VdzsMARe4I4aArk8v/cVbyLQYP
 AHSdZcSr9G6ypuB6UP6yrhSjm05WISglqrrlNI6ssfpp3VKro4bCZtfgRh5vcdl/DFJ/gMiFsrSQi
 LirlvB6cXr9wDudXDOcUwY7B3tgdnjt1MyCu0PAxtLLn8BZzCxZLAYaLY6G8ZCIzF8Dk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/+9XN1C0sXLC1PVWc2dSSddlawvMjwdDGEIJjI+3Za8=; b=SEGcZRO1NCph+1th3U7WU6mnfD
 DUMjqtz1xvH6RyDn1YINQwToIUj19QoW8EDPWs+WbyN0Atcnm3TJePEHvbSKFr/ODqdKLU9CvLinL
 FCO2/9hbMl5FW2AbFAsMIZOgjMbk8dlXHZJLZ0NnPGfB1W+TuBDxA38z/EOGEFlriUy8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umxTS-00018Z-OK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 792BF44BAB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 16:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60448C4CEEB;
 Fri, 15 Aug 2025 16:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755276004;
 bh=EzlBGp8OJj7182UdSiLMO6I5kxoxjblP9dqpDG8Nm0Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tYGqEGNUTRXxt0I/wnKAd4+gREiNNieCQSUiE2YD7lWJgHGVoHJAJ8GdqH3L/y1To
 mJWxraEbReTMiFA0CmXHRPCcvqw0LyllI5eOwZVB187YTPHaoo0nsJQ4MZxS9TLtc6
 OXGeHiLTXBMGNthCyEhp4QBuSUmwoOeypA1b+tiwkVhL/gr635nF/z+88nD2Q9rm1Z
 donoKSSdrrINognnt2pZqcN5K0jrElo78XlFOM9oL5LLt+Eq4+gBVu+Kb5a8xPLZgv
 wyA4Nhct4YOyhiTONev0GBiGi1mmrecPyDg380wisPtcl9/KSPQ71xiJXMAcQRrrvt
 QkV4dROTrmSig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADC9339D0C3D; Fri, 15 Aug 2025 16:40:16 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175527601523.1161945.903553977374794343.git-patchwork-notify@kernel.org>
Date: Fri, 15 Aug 2025 16:40:15 +0000
References: <20250807024431.3805293-1-chao@kernel.org>
In-Reply-To: <20250807024431.3805293-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 7 Aug 2025 10:44:31 +0800 you wrote:
 > As reported, on-disk footer.ino and footer.nid is the same and > out-of-range,
 let's add sanity check on f2fs_alloc_nid() to detect > any potential corru
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umxTS-00018Z-OK
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to detect potential corrupted nid
 in free_nid_list
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  7 Aug 2025 10:44:31 +0800 you wrote:
> As reported, on-disk footer.ino and footer.nid is the same and
> out-of-range, let's add sanity check on f2fs_alloc_nid() to detect
> any potential corruption in free_nid_list.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/node.c          | 17 ++++++++++++++++-
>  include/linux/f2fs_fs.h |  1 +
>  2 files changed, 17 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to detect potential corrupted nid in free_nid_list
    https://git.kernel.org/jaegeuk/f2fs/c/3e7be92e436e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

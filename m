Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE6BC4FFFF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iU1ESy0Wi8XX8vNrKqLoMAQO+wIWrC4FidOls/qimLY=; b=iI2ky3LWdjBi+pMsoKe5342eIm
	CmhU6NIKfITN/l4MtsjXFPxHPhRiqJWNcaV7D0bJMQF1YmPqOhDQO+4RT3i0TocJyk+rpD7//fZun
	ZvH+vMRyTHj1dfQX0nNQxCFQIJcZEA2ny32HIA5XCCHm8se2y2cSWu3rNQnm7Q4Ootmk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCO-0002xw-UY;
	Tue, 11 Nov 2025 22:50:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCM-0002xn-Qs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rx+dvginFlj5DZSiNb71fwfTl8Swo1FB+CWoVb38L1E=; b=AA+tnFzNbzGNcmy3B5vf5bQnMR
 YRLPdUvPFJDQAKofm5qdND57YfIHKl1jFwO4SK0/YRQkMkiaVCqm32ysy9iGWv8SV8nJ3meWpeLng
 4amSyJZY1gi94eduKSvpIfviJvQAr9oUx3UqyBNOmUypeBskSLo3rhnJn4arjhYdup8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rx+dvginFlj5DZSiNb71fwfTl8Swo1FB+CWoVb38L1E=; b=VSmBb/VEc+m5Jd7GQ7KkJ50llM
 eSDQi6ljb25kFIx5fKH52fj5aT5ZZHoX/QdWYi1lO3bxz9L6rd3xyfwFjcv5suDpZltSnC1IeVudT
 dpuBMdaYy1s3NbbFuJJr41zI0ofh8hrgsuN00BZAVj4nG10ZrrjFoFreIDacUbgAkS1c=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCM-00045w-BD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BEA8460051
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 22:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5FCC4CEF5;
 Tue, 11 Nov 2025 22:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901439;
 bh=1ov07mNSftJLyOcTGRzd2+/xjBpaoTdrC/6uDOIJ6C4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nTqCUJEBnB/kJM6DIxpCXcnLEzfIBFKBjE35fey9snTIp0XAxARzxjN6kmZXkz0wD
 FhGiMpPd/McVoERSpNXymTEoLBMYZ+dQpIdZGldTSGMtP5Ix1AF2zYX7ySZ1SM8ZMd
 y30iWH1SuQ8aK8uASueWJ8qPsT4PYyONdHXdiwJzPlM0QvHY7dDbwfIQlq5XvdCoUe
 5obg/qkvgsqf4V8NGnyBQVWM1A9h2DYGgRcFr5T/8ZQs3mfz15ske7T7DqvjfHS50d
 ykSQgjzed7lHoNVsxBLiAO6QWXGdgK5wVMyzIqbRgtpfW879RgvbiaWySpnleuIc3B
 MmFYWhtuh3oWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADDF3380DBCD; Tue, 11 Nov 2025 22:50:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290140950.3596344.12262707920968053977.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:09 +0000
References: <20251029063105.989253-1-chao@kernel.org>
In-Reply-To: <20251029063105.989253-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 29 Oct 2025 14:31:04 +0800 you
 wrote: > It recommends to use i_size_{read,
 write}() to access and update i_size, 
 > otherwise, we may get wrong tearing value due to high 32-bits value > and
 low [...] 
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
X-Headers-End: 1vIxCM-00045w-BD
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to access i_size w/ i_size_read()
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

On Wed, 29 Oct 2025 14:31:04 +0800 you wrote:
> It recommends to use i_size_{read,write}() to access and update i_size,
> otherwise, we may get wrong tearing value due to high 32-bits value
> and low 32-bits value of i_size field are not updated atomically in
> 32-bits archicture machine.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to access i_size w/ i_size_read()
    https://git.kernel.org/jaegeuk/f2fs/c/1797093bfc96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

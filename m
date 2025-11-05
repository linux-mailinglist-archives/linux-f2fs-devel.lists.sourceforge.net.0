Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C831C354ED
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 12:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igOO148rmoq36kvhyNdS63lpMa28fuahxHHBmRoL01c=; b=C4raYu+bZ4ZkBytJPuKUaVzT15
	drXiSOoQ6CZyZ+EIfWLmAJmwK0fzoecjPr+p7QutHUKS/fX1FdFPb4y2WbVKXMGvu4dFhE9ln749q
	i3ajBxurauyK/kMi85CZboNVo7J0lcUirsX8uO1rP5VNwjq9W7Qs6FytKoIw5n2tPRYA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGbTn-0002nD-Pg;
	Wed, 05 Nov 2025 11:15:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vGbTl-0002mw-F8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 11:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AkFP6FfXTmuv0YwI0WMvYCD/UwrRD5xg0ulKcrTZhxE=; b=ODEeO8eTVYTczOqOVAuLkDoIsg
 8DCFocEpXxdI717ozHMq/M4Mwtnop5W+lcaH+UnwTfLOz+5gZNHgMYMxjOCFeHUL5J+zqY6jHuY9f
 v9qmwsoIstRVxK/9pXlnUevQiMUwbtqdz60guntgbAp3nXP4TxV07HxBdA/khfkPdJl4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AkFP6FfXTmuv0YwI0WMvYCD/UwrRD5xg0ulKcrTZhxE=; b=LfxYm3nbv9nnwAQyQa7OulqY9z
 iEwnWCmMJGQ5sfyK1U0z39/J4gNL0YN3ba5rbGgs0rMM6BK5RW9n5Dd66POdeTF64GQf1gRejeel+
 5bIKsgtvJQCZMrEND5MccyqoC5v/o0SgjhSGqWz+ZWFZSnxVzKH1jJy8CxMuva+7ZpD8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGbTk-0005Zi-P0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 11:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 57DB644752;
 Wed,  5 Nov 2025 11:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B78DC4CEF8;
 Wed,  5 Nov 2025 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762341294;
 bh=Hr1qTb8xrcj/E/cr8cExwDIT7AhrOUIw7GHOKQAcWp0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=p29hFktc6Y/DOjgHQGqLmyPglzmOJ5TqpoSQR3mwqzS0cbSSFfYb+xVRfubj1TTjP
 641tsmlYpm5Mp9BRgHHse9AOewUIIRBRRE+7tYAllNbUEND2ebt9ZTIHf0ToUoO4bv
 H/q3wc9seDlDK/bBB99enkqYv7kk3PU8tYHXHLKZYuz0z8WYPNBJNdw6eGFqhI72Hk
 IGHPU+ITHU+GVJm+IxKeH/iiGI3tCEYH2JrXDUrU3USk0tkLF1rPDcXRE+FX1q7eXY
 25f9EvEhyFfRu49GKOvtzH4fMVcg9uUF1oezsHldg+TEO35VwmedO3rxT2kQ8IGc0S
 TqDWlDQhwskKw==
Message-ID: <96a9d740-5a96-4795-b69e-0cd0e165ad4a@kernel.org>
Date: Wed, 5 Nov 2025 19:14:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1762339963.git.zlatistiv@gmail.com>
 <c56dfb1f6a27cd04a91d41a0448a26118c7cdc38.1762339963.git.zlatistiv@gmail.com>
Content-Language: en-US
In-Reply-To: <c56dfb1f6a27cd04a91d41a0448a26118c7cdc38.1762339963.git.zlatistiv@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/5/25 19:09, Nikola Z. Ivanov wrote: > Add check for
 inode->i_nlink == 1 for directories during unlink,
 > as their value is decremented
 twice, which can trigger a warning in > drop_nlink. In such [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vGbTk-0005Zi-P0
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: Add sanity checks before
 unlinking and loading inodes
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
Cc: david.hunter.linux@gmail.com,
 syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, khalid@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/5/25 19:09, Nikola Z. Ivanov wrote:
> Add check for inode->i_nlink == 1 for directories during unlink,
> as their value is decremented twice, which can trigger a warning in
> drop_nlink. In such case mark the filesystem as corrupted and return
> from the function call with the relevant failure return value.
> 
> Additionally add the check for i_nlink == 1 in
> sanity_check_inode in order to detect on-disk corruption early.
> 
> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

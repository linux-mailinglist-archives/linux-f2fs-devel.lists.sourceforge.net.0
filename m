Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A68E4991B8B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  6 Oct 2024 02:22:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sxF2V-0004Xm-9T;
	Sun, 06 Oct 2024 00:22:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1sxF2U-0004Xf-67
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Oct 2024 00:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VDOzhsEhgCiTwyKnWttp0JCmzAnOLx3pFQQHjTvkF5A=; b=ZQHM86NCva0uprmLmzgPVyo/ne
 GWR+je4dTWbf0R9YAYH66+MXhX+uZVz8KGJBynw4xH3SdLl9qWRUwo2WjwfqAzG0FC2fKwq196oaH
 X7ZqgxyIM4/qN5h+zvMW5/nE5ghhk8im5VBNFCH8aE7G48YLoq85DYK+JWVRB8NTqMOQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VDOzhsEhgCiTwyKnWttp0JCmzAnOLx3pFQQHjTvkF5A=; b=AB+F+5w/CpplXsKFD0qPNqc5pd
 zH/Uh5S32oQAlr7whdaJH2nQBWKKElh91cLeDQooBFiu0hG3L+r+RYoA6Rq5kAdhP3P4Pt5VZ02VA
 kqRRli1feeOk589dpCfXxOT6viIecdzw7EGNep1WlzXFfmKnBw+N4hYncljJ7k8DnwT8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sxF2T-0001O0-Jq for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Oct 2024 00:22:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0BE5B5C54D1;
 Sun,  6 Oct 2024 00:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D75C4CEC2;
 Sun,  6 Oct 2024 00:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728174130;
 bh=YL47cSlUSCpOmWDSvLzf9+9vSvcaFLSSflHKZJY8n4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bS6bcxhGLqF9dWTGO/L1sUoxkhHxyMZX8yXYIHlPMFRDPZz4MSsG16lcwtfPSw7II
 zGEJJY9OCR+uhN61bKhlcKRaBNOXzJBZAwa3NLirZx9nm1Ug/xOM/7c1I0zeVc5hWv
 Kl9q6LTwo66G+N9dNKRNX12sHLZFiHlhAJlaHUYin2dBs9jDWPW1oJAcd2OkoBDIyH
 wA55QVojePi1+yEKb5golhN8F5kGlveZ+LnD6aUH/JFPGsIGV1teH5nvEKxLGC6WBN
 Zx3mLKRbUxuNHyaW/c+SDOMpxG/cW5kgM+UsbNjJ6OHaBzN3dIXPBcthlE7fA+Letq
 unj6MVdBtrAHA==
Date: Sat, 5 Oct 2024 20:22:09 -0400
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <ZwHYMVtlagIeibP5@sashalap>
References: <20241004193442.189774-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241004193442.189774-1-ebiggers@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Oct 04, 2024 at 07:34:41PM +0000, Eric Biggers wrote:
 >From: Jann Horn <jannh@google.com> > >commit
 4f5a100f87f32cb65d4bb1ad282a08c92f6f591e
 upstream. > >The F2FS ioctls for starting and commi [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sxF2T-0001O0-Jq
Subject: Re: [f2fs-dev] [PATCH 6.1] f2fs: Require FMODE_WRITE for atomic
 write ioctls
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
From: Sasha Levin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Jann Horn <jannh@google.com>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 04, 2024 at 07:34:41PM +0000, Eric Biggers wrote:
>From: Jann Horn <jannh@google.com>
>
>commit 4f5a100f87f32cb65d4bb1ad282a08c92f6f591e upstream.
>
>The F2FS ioctls for starting and committing atomic writes check for
>inode_owner_or_capable(), but this does not give LSMs like SELinux or
>Landlock an opportunity to deny the write access - if the caller's FSUID
>matches the inode's UID, inode_owner_or_capable() immediately returns true.
>
>There are scenarios where LSMs want to deny a process the ability to write
>particular files, even files that the FSUID of the process owns; but this
>can currently partially be bypassed using atomic write ioctls in two ways:
>
> - F2FS_IOC_START_ATOMIC_REPLACE + F2FS_IOC_COMMIT_ATOMIC_WRITE can
>   truncate an inode to size 0
> - F2FS_IOC_START_ATOMIC_WRITE + F2FS_IOC_ABORT_ATOMIC_WRITE can revert
>   changes another process concurrently made to a file
>
>Fix it by requiring FMODE_WRITE for these operations, just like for
>F2FS_IOC_MOVE_RANGE. Since any legitimate caller should only be using these
>ioctls when intending to write into the file, that seems unlikely to break
>anything.
>
>Fixes: 88b88a667971 ("f2fs: support atomic writes")
>Cc: stable@vger.kernel.org
>Signed-off-by: Jann Horn <jannh@google.com>
>Reviewed-by: Chao Yu <chao@kernel.org>
>Reviewed-by: Eric Biggers <ebiggers@google.com>
>Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>Signed-off-by: Eric Biggers <ebiggers@google.com>

I've queued these backports, thanks!

-- 
Thanks,
Sasha


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

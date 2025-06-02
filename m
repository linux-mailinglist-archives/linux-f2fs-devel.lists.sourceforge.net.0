Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2253BACB943
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 18:05:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojPOTH/NFWMqWRIPeqfgcZdtCDMQm40vLS8FZZ1d3sQ=; b=K3OOR5093HInlp5QkV0yFWEktX
	P97Et9m+w+HPWyG3mlYXCvbxWWDMKtKLsVWKG3RRC+0rGggEtWP7L776iYplz6Dyphem2kEtc2ruR
	RyGJDiC/3/g9JYj0biDEh5OVMzr27fOICDrJ3ML4GtqBc0ie/S4elUi1sRSu/Bz+9ABY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uM7fa-0002kF-9D;
	Mon, 02 Jun 2025 16:05:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uM7fY-0002k6-RS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 16:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Pblv7Cu1Hu56KZz+MM9QxPaQgqYt0qGWN/7FmuCOSw=; b=lb5L8qLyEf8I/wQfgjSpV6hIRj
 wRjfvWDQ/9gz/HeKYsqIEJd+Y3ajx7HCasdzxUQ+hg2nYZx2tp4MSWWK+nPbfKwZZLXMa8x58BQ8M
 N0h3EjhbpKsP6Kc5FEhI+SWUwtWOIq3W/3qPRv46hOTH5KiVmp8mbcuaDvIjXKys0cG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1Pblv7Cu1Hu56KZz+MM9QxPaQgqYt0qGWN/7FmuCOSw=; b=ed6EFbIUcmJXexBZf1XN5FMM6+
 wgAnCJZa9ZRVqHyuF+A09l7Xa/1CIbPm7GuJnFLDUfAv7gvQmnI6/Yvp/ASNQd6difC125fn/W6Fi
 8aBcx39LQp277FUXcPWsrf5K5WNE16RSIKjtwL5mpswhqCm2DIUSXOKIa+2k0+4sMAGg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uM7fX-0008GA-O4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 16:05:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 18A2EA5033A;
 Mon,  2 Jun 2025 16:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF35C4CEEB;
 Mon,  2 Jun 2025 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748880336;
 bh=A3pRvyB9HIx3Zf3r/C3GJr+0BFFqJwPn2oxiWVZ6UJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bi/J6bL1HXjnT8nhjqkrb0BqipL5lEsfj9ZI9qP4FFyR0D5E+POyOXKP4SjvZJYGN
 8XRYEGfybih0xmsomVFL5/Bb4iW+fINUV77q9Z6fxvOqc2oFZdzsuwdDjIQFuM6rn6
 AOhxRcYkfqWlOevVw420/1J43WoqK7sySa7TtlpG06r7i6adcUbDVD0fm6JC8JbPfm
 xDI1hYc8q18wCyH6stmisn6LUIWCTQdNvbbr7FreJ7FOgeAjgJy/wyJ+zqr2n32uEk
 eOl7xbbfhv4fUrlVG7Fu8gaKXlFfsFxdGRwGAkuZribyF4ha+FoeizY0vhZ3SRPEd/
 YkKSgHCvdOC8w==
Date: Mon, 2 Jun 2025 16:05:34 +0000
To: Hongbo Li <lihongbo22@huawei.com>
Message-ID: <aD3Lzsp-u6KuyGRt@google.com>
References: <20250602090224.485077-1-lihongbo22@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602090224.485077-1-lihongbo22@huawei.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thanks you,
 Hongbo. I just applied this series to the dev-test
 branch as below, and will keep testing with incoming patches together. Let's
 see. :)
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uM7fX-0008GA-O4
Subject: Re: [f2fs-dev] [PATCH v4 0/7] f2fs: new mount API conversion
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, sandeen@redhat.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks you, Hongbo.

I just applied this series to the dev-test branch as below, and will
keep testing with incoming patches together. Let's see. :)

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test

On 06/02, Hongbo Li wrote:
> In this version, we have finished the issues pointed in v3.
> First, I'd like to express my sincere thanks to Jaegeuk and Chao
> for reviewing this patch series and providing corrections. I also
> appreciate Eric for rebasing the patches onto the latest branch to
> ensure forward compatibility.
> 
> The latest patch series has addressed all the issues mentioned in
> the previous set. For modified patches, I've re-added Signed-off-by
> tags (SOB) and uniformly removed all Reviewed-by tags.
> 
> v4:
>   - Change is_remount as bool type in patch 2.
>   - Remove the warning reported by Dan for patch 5.
>   - Enhance sanity check and fix some coding style suggested by
>     Jaegeuk in patch 5.
>   - Change the log info when compression option conflicts in patch 5.
>   - Fix the issues reported by code-reviewing in patch 5.
>   - Context modified in patch 7.
> 
> V3: https://lore.kernel.org/all/20250423170926.76007-1-sandeen@redhat.com/
> - Rebase onto git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
>   dev branch
> - Fix up some 0day robot warnings
> 
> (Here is the origianl cover letter:)
> 
> Since many filesystems have done the new mount API conversion,
> we introduce the new mount API conversion in f2fs.
> 
> The series can be applied on top of the current mainline tree
> and the work is based on the patches from Lukas Czerner (has
> done this in ext4[1]). His patch give me a lot of ideas.
> 
> Here is a high level description of the patchset:
> 
> 1. Prepare the f2fs mount parameters required by the new mount
> API and use it for parsing, while still using the old API to
> get mount options string. Split the parameter parsing and
> validation of the parse_options helper into two separate
> helpers.
> 
>   f2fs: Add fs parameter specifications for mount options
>   f2fs: move the option parser into handle_mount_opt
> 
> 2. Remove the use of sb/sbi structure of f2fs from all the
> parsing code, because with the new mount API the parsing is
> going to be done before we even get the super block. In this
> part, we introduce f2fs_fs_context to hold the temporary
> options when parsing. For the simple options check, it has
> to be done during parsing by using f2fs_fs_context structure.
> For the check which needs sb/sbi, we do this during super
> block filling.
> 
>   f2fs: Allow sbi to be NULL in f2fs_printk
>   f2fs: Add f2fs_fs_context to record the mount options
>   f2fs: separate the options parsing and options checking
> 
> 3. Switch the f2fs to use the new mount API for mount and
> remount.
> 
>   f2fs: introduce fs_context_operation structure
>   f2fs: switch to the new mount api
> 
> [1] https://lore.kernel.org/all/20211021114508.21407-1-lczerner@redhat.com/
> 
> Hongbo Li (7):
>   f2fs: Add fs parameter specifications for mount options
>   f2fs: move the option parser into handle_mount_opt
>   f2fs: Allow sbi to be NULL in f2fs_printk
>   f2fs: Add f2fs_fs_context to record the mount options
>   f2fs: separate the options parsing and options checking
>   f2fs: introduce fs_context_operation structure
>   f2fs: switch to the new mount api
> 
>  fs/f2fs/super.c | 2108 +++++++++++++++++++++++++++--------------------
>  1 file changed, 1197 insertions(+), 911 deletions(-)
> 
> -- 
> 2.33.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

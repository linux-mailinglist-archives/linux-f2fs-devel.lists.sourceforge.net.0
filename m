Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB6A33561
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Feb 2025 03:15:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tiOlD-0004lt-IQ;
	Thu, 13 Feb 2025 02:15:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tiOlC-0004ln-61
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 02:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QWWkujQ0/HoHvvWA6VHXnvd2Md5A7pvvNMcxqC5jO8g=; b=mh8Uhbs4p6p7lGmh7TimaypyS8
 IMsKTUlvuDH6u7+fMJSChCo1U3xp43Lgr+ONglK+TwpTGMBwUPpBGokyBCoA5xg2umRdshrTLIH/0
 jRooPsv3qBVI6NFS5X3/VuNvjb1JUojIY6Nr55JfHMQaQjbeIBBTAcb/Dog9cSBzf+L8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QWWkujQ0/HoHvvWA6VHXnvd2Md5A7pvvNMcxqC5jO8g=; b=DDCye371S6to3++WLzQWOxQ0lG
 lmbCP0e+NZtH5IRVY3hvslQlYo6OWJBCTGwclMx6FRbfK4/kLiM2J00g2MX0x0Q9wx/O/gv4+c9T3
 KfTSwVQVsQVcjMKA9/gTSSxQYbkS+Y151gJ00K+RhPD77I7hbmPaFxkNQUAJS3wXtqlQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tiOlB-0000xo-CM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 02:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D7215C637F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Feb 2025 02:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44F9C4CEDF;
 Thu, 13 Feb 2025 02:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739412919;
 bh=mST8ETe+CoH5pqNO25ZA1AqNJb2gdz1ovJLhGwKV+dE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=BtKKpE9PonSp0lPpeWz7EJsN+PgWl41JO7RTvooEYrMe79IyxCikI/btG5LnqRqW8
 jpdt9zr+uF20uusDJhY0g4DKMyWe7Pe8UXdg/Gsmo1QhYkqyQaniZsxKtgc3xt1Tob
 zA03hq7JMGro3Zy7xLB4X1s3K8NP5vl13fqc6y/MLokFHZBrwmOslcI0+OTP5cD0zP
 XteyVjg9iSWr96fOdYgUbZFmiVelDieApaRODn5miAsg+gALnaaiVGMaeQvqZCpgpv
 Ku4WMzQXgS5I5EjG/i3Vm1IiO+UG6B+UTXWAz7Lek8g84osc7loJea6dhF6Ef5D0kH
 taePXCTRXYHgQ==
Message-ID: <cdd5f34a-51dc-40f4-89f6-70179c7b738a@kernel.org>
Date: Thu, 13 Feb 2025 10:15:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250212023518.897942-1-jaegeuk@kernel.org>
 <20250212023518.897942-3-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250212023518.897942-3-jaegeuk@kernel.org>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/12/25 10:31, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > 1. fadvise(fd1, POSIX_FADV_NOREUSE, {0,3});
 > 2. fadvise(fd2, POSIX_FADV_NOREUSE,
 {1,2}); > 3. fadvise(fd3, POSIX_FADV_NOREUSE, {3,1}); > 4. [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tiOlB-0000xo-CM
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add a sysfs entry to reclaim
 POSIX_FADV_NOREUSE pages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/12/25 10:31, Jaegeuk Kim via Linux-f2fs-devel wrote:
> 1. fadvise(fd1, POSIX_FADV_NOREUSE, {0,3});
> 2. fadvise(fd2, POSIX_FADV_NOREUSE, {1,2});
> 3. fadvise(fd3, POSIX_FADV_NOREUSE, {3,1});
> 4. echo 1024 > /sys/fs/f2fs/tuning/reclaim_caches_kb
> 
> This gives a way to reclaim file-backed pages by iterating all f2fs mounts until
> reclaiming 1MB page cache ranges, registered by #1, #2, and #3.
> 
> 5. cat /sys/fs/f2fs/tuning/reclaim_caches_kb
> -> gives total number of registered file ranges.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

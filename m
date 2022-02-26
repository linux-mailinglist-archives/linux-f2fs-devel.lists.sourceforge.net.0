Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 558134C5347
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Feb 2022 03:24:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nNmkl-0005Gd-Ok; Sat, 26 Feb 2022 02:24:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tytso@mit.edu>) id 1nNmkk-0005GW-JY
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Feb 2022 02:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=05WAiqmnzFxjhjzsmoqGa+1UgtTxRSthDkK/9Z3FCdE=; b=hIqOUf2RWhvnxacsYaegpUFd0u
 quA7HEGncYS2iiYi8BrbuF2AUv88G1bjo/JSfth/QlkFgwlk8n00HsyzwI+xk2Aql8OWNYhT4qcrq
 t+jEqBy2sxHIDLHrABApRuCKbagvv97ozPCCTJwEVD4hORP/FNAlmAFeVS/zS7lidiqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=05WAiqmnzFxjhjzsmoqGa+1UgtTxRSthDkK/9Z3FCdE=; b=J269bW9+n2MTNmvW+sgwjFZIrh
 156/bxZz8ZJGZ6BfkF3e5GIaS1/YchPI5z4FYh+uXCLQE0gopMUadAvzVGq0myPtQzyHq3uB5MFl1
 ztcjQF+d2xcMRnLN1RsYQEEs8mb+KZNqCzxW9V0hvPJ96QF7T6grzOl5sAhe9H90WvxE=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nNmke-00FUyU-Gm
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Feb 2022 02:24:08 +0000
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21Q2NcRB000816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 21:23:40 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id EE27A15C0038; Fri, 25 Feb 2022 21:23:37 -0500 (EST)
Date: Fri, 25 Feb 2022 21:23:37 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ye Bin <yebin10@huawei.com>
Message-ID: <YhmPKVrVHhTeKOzl@mit.edu>
References: <20220211093527.3335518-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220211093527.3335518-1-yebin10@huawei.com>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Feb 11, 2022 at 05:35:27PM +0800, Ye Bin wrote: >
 Now if read directory block failed, 'ext4_empty_dir' will return true, assume
 > directory is empty. Obviously, it will lead to above issue. > [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nNmke-00FUyU-Gm
Subject: Re: [f2fs-dev] [PATCH -next v2] ext4:fix file system corrupted when
 rmdir non empty directory with IO error
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
Cc: jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 lczerner@redhat.com, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 11, 2022 at 05:35:27PM +0800, Ye Bin wrote:
> Now if read directory block failed, 'ext4_empty_dir' will return true, assume
> directory is empty. Obviously, it will lead to above issue.
> To solve this issue, if read directory block failed 'ext4_empty_dir' just assume
> directory isn't empty. To avoid making things worse when file system is already
> corrupted, 'ext4_empty_dir' also assume directory isn't empty.
> To distinguish the error type, return the exact error code to the caller.
>

Does the same issue exist for f2fs and ubifs?  We could solve the
specific bug much more simply by having ext4_empty_dir() return FALSE
if we aren't able to read the directory block.  Yes, it means that we
don't return as specific an error code in the case of an I/O error ---
although I believe we do syslog a warning --- but it makes for a much
simpler patch that doesn't requiring getting acked-by's from the
fscrypt, f2fs and ubifs folks.

							- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

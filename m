Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07709741DBF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jun 2023 03:45:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qEgiv-0007yO-Th;
	Thu, 29 Jun 2023 01:45:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qEgiv-0007yG-2G
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Jun 2023 01:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zjOimBlfonK9AFS4t3RCHwsaETJLOVr7h4bOGmaV2EE=; b=Lvwo+iHyD2M8A75VED61hMYkdm
 CMWuRHIEwOP9i6FyNQHqC83t5WK8qvK/oWldiGZui3QE3s0WCFDC01uY72Tn7dhjvwoULDjp6fdHw
 CErLuVAlPA+K0bgPPtDlz7lO70kJpSsSGxtQwMd/KSo05Gou0pU4EMa8IGzMutCCPpdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zjOimBlfonK9AFS4t3RCHwsaETJLOVr7h4bOGmaV2EE=; b=E0hrG1xDNWe33TCx1Khaafbcx5
 oGMvipSZqG7wNh/G4fkwaky/JlXp0cz62EngrrlnFMxGEjsvxInDkYcWsIpZQxDcl+XKbcnXFDVet
 Kbg/gjVMCxc7F2tqnYE+uu20Yt0i475JCgDRpSoMvDvGcUX1YqFCCekUd5qL8rpYtw/s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qEgiu-0001Z2-EQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Jun 2023 01:45:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12062614A6;
 Thu, 29 Jun 2023 01:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995F9C433C8;
 Thu, 29 Jun 2023 01:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688003122;
 bh=GesmKKOx+NrPw575Ziw1UafTp3Bmaq+vABDldAcMNbw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=u9jb3mZE2SjXy6HoCiqYzBhVqCDNW/IWXeMXN1+KJ+gAElGn1f/3PmK4v+eHx9SnG
 e43EAReFcxptr95YfXXX7pQxZSBw1qDvJOI4TGtcahZtwy7Ki2x+15sUHHwxMAYcoL
 sZUpFG2ut5ZTCLAy6ahgnuzGSmzrgw600bPz0ttcLNu3BO2HRGM9cerkudORdCnEcC
 ALpUB/UGE6uDFf+Dyjg78jpxH9LETQFGQ5G1UluoWwxwm4teSlTlsD2R/+9y8dWTsm
 dEjJTdFBQwBCf0PcEAquz9uDg3nqvy/vBnXM0K0Ue+N9zZJuSql4dkoN/q1Mly0iDB
 jLYYTDcFLA0JA==
Message-ID: <0cecac46-94f0-eda4-fdbb-76eb4a2d36cb@kernel.org>
Date: Thu, 29 Jun 2023 09:45:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20230626093046.68352-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230626093046.68352-1-guochunhai@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/26 17:30, Chunhai Guo wrote: > find_fsync_inode()
 detect the looped node chain by comparing the loop > counter with free blocks.
 While it may take tens of seconds to quit when > the free blo [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qEgiu-0001Z2-EQ
Subject: Re: [f2fs-dev] [PATCH v9] fsck.f2fs: Detect and fix looped node
 chain efficiently
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/26 17:30, Chunhai Guo wrote:
> find_fsync_inode() detect the looped node chain by comparing the loop
> counter with free blocks. While it may take tens of seconds to quit when
> the free blocks are large enough. We can use Floyd's cycle detection
> algorithm to make the detection more efficient, and fix the issue by
> filling a NULL address in the last node of the chain.
> 
> Below is the log we encounter on a 256GB UFS storage and it takes about
> 25 seconds to detect looped node chain. After changing the algorithm, it
> takes about 20ms to finish the same job.
> 
>      [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
>      [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to
> update superblock
>      [   10.822953] fsck.f2fs: Info: superblock features = 1499 :
> encrypt verity extra_attr project_quota quota_ino casefold
>      [   10.822956] fsck.f2fs: Info: superblock encrypt level = 0, salt =
> 00000000000000000000000000000000
>      [   10.822960] fsck.f2fs: Info: total FS sectors = 59249811 (231444
> MB)
>      [   35.852827] fsck.f2fs:detect looped node chain,
> blkaddr:1114802, next:1114803
>      [   35.852842] fsck.f2fs: [f2fs_do_mount:3846] record_fsync_data
> failed
>      [   35.856106] fsck.f2fs: fsck.f2fs terminated by exit(255)
> 
> Suggested-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

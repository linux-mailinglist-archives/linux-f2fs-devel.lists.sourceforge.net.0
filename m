Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF194D42C7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Mar 2022 09:43:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nSEO3-0004CW-0P; Thu, 10 Mar 2022 08:43:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nSEO1-0004CQ-E7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 08:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y0DnJ9NLYUJSAQDTI/tu1ryVD+WJTwJQ1dMFE05ZCcM=; b=Vj23A/lfRExOJEfdCSSaUYwZzy
 HxTmIju3B9hTCJJihgq4cfVcedwrB3XtB9l6+KZEwdD1cLQRXYwdISqJTgcUSQocI5tEQK0oz4SU9
 8ZojUdIzt1+zMuOgFqxdGx8kc0y1D1/xYf1L78j9mXUB+o5uIs0OlmdUoRpOTeIO+NMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y0DnJ9NLYUJSAQDTI/tu1ryVD+WJTwJQ1dMFE05ZCcM=; b=ieASJK7G4IbbmTK8PC/h887SVb
 T64dI74rZoCDYUg1S5psezc4203lIoxRSTXD+YDc5BxC7zuo/NlbJ41SfITXRW04DfCJ8DDIARtgM
 EV1wlIbf/jbFwfArzNWsewokkhBW0/GwFJS29fnStZNBoVkN5bK35dx2hnziCtt00CRc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nSENv-00AhY3-Np
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 08:43:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6FC76B82520;
 Thu, 10 Mar 2022 08:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA92C340E8;
 Thu, 10 Mar 2022 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646901772;
 bh=EFSAQDYfdBeka/PuCgLHDUwVwlsKh14JaZbE113E3Wk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n3xsxevEMauEdYKS9L65WohGHlzVzXpmVgQi7gyDD2wKxRs0OqIp7yIs5pXf6WuCK
 65/P52rqlz/X0VjRu7GVNu+lWi6DCQBxW88Iv3vJ0Vs63hJPNe1i33N7hZvSNcR0sm
 MDAndkmmQSX6RAsgRxgE3ThUACSdPqpDCLmohWyy9skubaBdMgA03+0KxDzrygfZNr
 jY5l0qmvEumnCRQcQ9/DNzQX/z8vlfwBIathlDm3S6T7uz9+riNcPjpfo+ovYCiMpn
 ZC4xnaMTBbIebrVGr38UaliUOObdToPqgnXmKWhu9S32XJkZMRslbokQof+4frPfBg
 bQwzL7GMwB3pA==
Message-ID: <16fd7370-d733-1610-6583-7d8063d723d9@kernel.org>
Date: Thu, 10 Mar 2022 16:42:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20220310073312.206465-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220310073312.206465-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/10 15:33, Fengnan Chang wrote: > When compressed
 file has blocks, f2fs_ioc_start_atomic_write will succeed, > but compressed
 flag will be remained in inode. If write partial compreseed > clu [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nSENv-00AhY3-Np
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix compressed file start atomic
 write may cause data corruption
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

On 2022/3/10 15:33, Fengnan Chang wrote:
> When compressed file has blocks, f2fs_ioc_start_atomic_write will succeed,
> but compressed flag will be remained in inode. If write partial compreseed
> cluster and commit atomic write will cause data corruption.
> 
> This is the reproduction process:
> Step 1:
> create a compressed file ,write 64K data , call fsync(), then the blocks
> are write as compressed cluster.
> Step2:
> iotcl(F2FS_IOC_START_ATOMIC_WRITE)  --- this should be fail, but not.
> write page 0 and page 3.
> iotcl(F2FS_IOC_COMMIT_ATOMIC_WRITE)  -- page 0 and 3 write as normal file,
> Step3:
> drop cache.
> read page 0-4   -- Since page 0 has a valid block address, read as
> non-compressed cluster, page 1 and 2 will be filled with compressed data
> or zero.
> 
> The root cause is, after commit 7eab7a696827 ("f2fs: compress: remove
> unneeded read when rewrite whole cluster"), in step 2, f2fs_write_begin()
> only set target page dirty, and in f2fs_commit_inmem_pages(), we will write
> partial raw pages into compressed cluster, result in corrupting compressed
> cluster layout.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Fixes: 7eab7a696827 ("f2fs: compress: remove unneeded read when rewrite

I guess it allows fixes line to exceed 75 chars limitation...

> whole cluster")
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>

Otherwise,

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

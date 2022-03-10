Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00A4D4995
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Mar 2022 15:50:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nSK71-0007Rd-17; Thu, 10 Mar 2022 14:49:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nSK6w-0007RH-OQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 14:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vBveaislgBTSb1birsy5SDtdWwA9W5hCDOQsvGNWWO0=; b=EJnYruvtUoqfYIqeaZ6nV1C8QZ
 vU/sQXC67kM8cbC3YzG9p8F/sKRZG+hikLfFxI3BZ88Go07LE8LKZ0iLF/DoWVnxuNGmSqtTJ9FqK
 jj6/wpArCdk3MJS4o7pMxEs0wr0mPm/YiyBXQG2Wfa3gtjkitKdsSQcOf0ogc4jUZ2Og=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vBveaislgBTSb1birsy5SDtdWwA9W5hCDOQsvGNWWO0=; b=HQ2TI6c2Nevu+6weiC5LEPmQ3P
 8UKVAPuNEbPGXR8uFlAe4Fh0Gamd0cXcgBXCvkqF+TE0FMC/YeUjeNjIKQZSJH+USvED3eLsfFokD
 hMm7BrsIQbUywdjtc+NGUoXrKOGRRPbeNUrWhmWii9BvpeimkMXZ/RaA1gb0SCST86Os=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nSK6q-0001R3-OB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 14:49:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A287B82544;
 Thu, 10 Mar 2022 14:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3CAC340E8;
 Thu, 10 Mar 2022 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646923772;
 bh=7k4GHxqeF40DZEWBgK+VNecqj+FP059isQNgoMnBLjg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d7zqA9Zh/OIXhB9WVFvNFVCo6fLKRKYQPeTznwV2lhCRkC3jm8pySG1YGQt3p4UDb
 vaGE44kW9TDv+1tVQ9ycv7e+PxzhHNRbx54ioH0WeAg0GnDb1CZHwCjeeV5r21msyA
 dcRpPYQcG2DdMwEu0g5fQMngjsNdx5BpcX8v8F6JXoIrQfUM6bG3v5OGjisdDwrI1j
 VHYrYg1axoYId1SViz7G3q8BklTZKzg0e6/s3YMuQSDL8xQwx2lJDCfllXOm1irUVJ
 LoCrcT0C1PIOU+7iuzTs0ynE7Vku9HCPvZeBzXPaZ+LCJ9VwTSjS5YI8Qz2HseZaun
 DfXWevjmIi+OA==
Message-ID: <a2a92437-7234-e25e-8712-267766a38273@kernel.org>
Date: Thu, 10 Mar 2022 22:49:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20220310110508.237864-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220310110508.237864-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/10 19:05, Fengnan Chang wrote: > When compressed
 file has blocks, f2fs_ioc_start_atomic_write will succeed, > but compressed
 flag will be remained in inode. If write partial compreseed > clu [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nSK6q-0001R3-OB
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix compressed file start atomic
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

On 2022/3/10 19:05, Fengnan Chang wrote:
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
> Fixes: 7eab7a696827 ("f2fs: compress: remove unneeded read when rewrite whole cluster")
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

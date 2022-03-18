Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D34DD6CF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Mar 2022 10:06:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nV8R9-00087J-M4; Fri, 18 Mar 2022 09:06:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nV8R8-00087D-NM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Mar 2022 09:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L7blAo0S9KFG67+vh9o6d8C+SiZADLqxBSktwbL2yOc=; b=U/lPPFLUtpS+Y4qZLaENvtwvl3
 +LDD1bSdXfFN6H+PD6gQslKOqV5RGGZRkUxssfelkRtNxIdxipuLeWY3bbeLbSBO1N/0bwnhFTmHF
 W5VgwIGfcuCmTX3gFIZt3RX9bh1ovu6LxfuoRK4N6VM+wtei9NkvNHo9aqlO9qDzRu0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L7blAo0S9KFG67+vh9o6d8C+SiZADLqxBSktwbL2yOc=; b=l4uoDbT6sCwgLUnyZ7sKzKxX21
 OacyTZPuYuquVoSpZE7pmuJVZbIMJtwJ/j3mMIsEWcWjINL81nGDcztf8TrWiyDGzToHQ1rDLUZ6Y
 acWP4mKeCSsBKJkAR3ULIolIGdttijwSNu1vePioZzHg0sZnpA4lGGsx9JAntYTOYZCQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nV8Z3-002qWa-Nr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Mar 2022 09:06:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55DD461AC2;
 Fri, 18 Mar 2022 09:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE604C340E8;
 Fri, 18 Mar 2022 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647594383;
 bh=2i9F/392cStj0vtpnlVtE+qyDIfB25VuMrvVq+oB9hM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sY9tAFc58wOEsK6stBU8PeNZiKYZBDwKOSn8LjyKqgLJuONppLbL0Y5C7RHMKSLl8
 baKPCF8cwP3S5YnGjWPYheI5qG5h8lwKMulMrGxatzpoM63SVjJ7s/ZMDFzCiebmcK
 O3fueNZK9k+fF4YCL6N5CkwPkZpVp/TT0zjHkJQqBW4tBufgIAFAtBzR/frM3GDz+a
 IC5OM17Vh+kqkN5c51ED4NN6mvpUuvta98OgMMOwZ4LiuSMgdgllVcbDo815OoI0Hy
 PjvTsmS27+7ARly5ioPi86rxB4Gajc5Db+B49qmCV/YQdleKrpN0YHZBk6A23OZ6mq
 H3IdfBPxDtZCw==
Message-ID: <133ae4da-397b-55b0-0010-8bf8eb48dd64@kernel.org>
Date: Fri, 18 Mar 2022 17:06:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20220318012304.230736-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220318012304.230736-1-changfengnan@vivo.com>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/18 9:23, Fengnan Chang wrote: > When compressed
 file has blocks, f2fs_ioc_start_atomic_write will succeed, > but compressed
 flag will be remained in inode. If write partial compreseed > clus [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nV8Z3-002qWa-Nr
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: fix compressed file start atomic
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
Cc: kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/18 9:23, Fengnan Chang wrote:
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
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 114316F09C6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Apr 2023 18:22:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ps4Nk-0004sW-5U;
	Thu, 27 Apr 2023 16:22:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ps4Ni-0004sQ-Nq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Apr 2023 16:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZIDYYHK5a220p003caPkOGEsHbSQifHb9SY/WPNXVOs=; b=Rh5phOAJJ01NaHo3Uelb5zFaUH
 jM3aKN4+HLLgpkMbW++x8KmThRleZdzuF7PUH1Pd/SVLUgZ6jCrofMFyx3GUoTpv9kIYzEFFlRB3+
 S09aPsUTcipfIsaD27xTioomYYTUzRB3rmCnTDIz9wM8BCCePRRH6ovCCNm8GTL9IDfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZIDYYHK5a220p003caPkOGEsHbSQifHb9SY/WPNXVOs=; b=lCOjG+o0i+bHfSLfeSIQds4lRD
 qqIU4AvZWKNJEMZr8LhX180vkUTNApK5GNBRTHRHyDgK60X9UljyDdihrMIaL2SrII2ixTQ6nHZzy
 4TcArl9EyG4GmZLajEXcKPBiEkayPg63N2Py3hGYwESla1BZkEM23UTTGqF5lHCxlGPg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ps4Ne-0001vq-4l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Apr 2023 16:22:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB665631B5;
 Thu, 27 Apr 2023 16:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBCFC433D2;
 Thu, 27 Apr 2023 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682612516;
 bh=AlPlL2WN8U77bcV2QwI4i9S22AkfDR+RGnDs6yrBa5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ra9FPE4X/HSWMCcHnQye/Er4ASReRPGoU+Jsk8zWPZ1rUfCa3fo6f9CjYFWmj6U+/
 M+EiC6K5K5kFKvDXpv2+fBz7QsJxaIDJNkmBVBmyEtIxpf51ZiYX4szyo6xQpAAots
 S3g0zyq7LGEhtt28wpmT/mEfAE3S1mZo+RNLWThM1G8lGzfGg+qx1ubmJmjSNk/7lZ
 sNiApWh+gyXSoSfU+qmwhZ52YZGDq/pOK/X2whd1okKkrqJrqdCLKwEfVWP0uCx29i
 mtJ8Kxl4iQAXZkDeUn4jtbO4iN9nnlnW13bVSPsRqGIQqV9aHNArjVwV6vdjDYHZ/e
 LKh+UlIaBr/gQ==
Date: Thu, 27 Apr 2023 09:21:54 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZEqhImQzKJJSNLNZ@google.com>
References: <20230425164711.19826-1-frank.li@vivo.com>
 <1a602371-d9b0-7148-c916-a02c40649d53@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a602371-d9b0-7148-c916-a02c40649d53@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/27, Chao Yu wrote: > On 2023/4/26 0:47,
 Yangtao Li wrote:
 > > If a file has FI_COMPRESS_RELEASED, all writes for it should not be >
 > allowed. > > > > Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DE [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ps4Ne-0001vq-4l
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do not allow to defragment files
 have FI_COMPRESS_RELEASED
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Qi Han <hanqi@vivo.com>, Daeho Jeong <daehojeong@google.com>,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/27, Chao Yu wrote:
> On 2023/4/26 0:47, Yangtao Li wrote:
> > If a file has FI_COMPRESS_RELEASED, all writes for it should not be
> > allowed.
> > 
> > Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")
> > Signed-off-by: Qi Han <hanqi@vivo.com>
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> 
> Oh, I just see v2.
> 
> Reviewed-by: Chao Yu <chao@kernel.org>

Applied with using goto for code consistency.

+       if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
+               err = -EINVAL;
+               goto unlock_out;
+       }
+
        /* if in-place-update policy is enabled, don't waste time here */
        set_inode_flag(inode, FI_OPU_WRITE);
        if (f2fs_should_update_inplace(inode, NULL)) {
@@ -2712,6 +2717,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
        clear_inode_flag(inode, FI_SKIP_WRITES);
 out:
        clear_inode_flag(inode, FI_OPU_WRITE);
+unlock_out:
        inode_unlock(inode);
        if (!err)
                range->len = (u64)total << PAGE_SHIFT;

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

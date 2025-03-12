Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D12F5A5D488
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 03:54:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsCEc-0005i4-Oi;
	Wed, 12 Mar 2025 02:54:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsCEa-0005hi-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 02:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dpn3vqB4798MDFwmWNCZvddShpRmwbWUzZ7zg+JgOjw=; b=GtGqvcgR9PYAmOzcdtZw/tqCa7
 Bi55QnTGnO7FndVhX2/VhbGp6CcE4JEDg8a6RZh72prlirgnL30b3loSCE+FYChujLv7Zn+wYS9T+
 2NLuiuAPumz4ClEoI7+FILQWIvmTm3U8UVt7LCzlSC+39rdr/7x4VtvnFinZzTejJP/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dpn3vqB4798MDFwmWNCZvddShpRmwbWUzZ7zg+JgOjw=; b=lhvfAdvsMkDvj8g/OFjXlO6PiZ
 oSVLg/NVKMmylFgS0mQa8lKHVUuXcV8KYNEBc0zWUnoLbE1iGe/INCIpVyaRFFExrTVHtxrj5W6+z
 qPJIwLAniLeMzzUhn69LJiAowRK9W8OKz8uvUQ2/gAJwrddisvvyhbWBWInaPs7P4eM4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsCEa-0000Xt-AI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 02:54:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9E764A46BBA;
 Wed, 12 Mar 2025 02:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDEBC4CEE9;
 Wed, 12 Mar 2025 02:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741748045;
 bh=2iNss42XYQP5qQVjDw/nPcfMnUQnKsXu0mIPU++0/uI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=d4W+kpKqkwVoN6h12oZLDpbYGxWlZFIAv0kdpIuuCcg0q+j+dtKoxYJ8oDbRP+3X0
 1R8CiYeyB2Xj/AQGVNHC4sNTQcM0gOTFDNuieDLfp7x4YEeMmWyak039kI/nuU4v/T
 +rNoefzNq2ZIG82UjjLTIDgch7ZV6vqpiuoymxh4rPtEcGiqZ4MpFXSMbSkPNlNDYm
 1W05USU4iQBNdH3P3mZulDOO1hRC7Qx+UTgWu/c3jnHzAgK+QAoCpKwKBNe/iwmhH4
 bBmZTf2m1CtNQIKBqU6mOagm96im9AEIaCXUHcJROm1o5bLIDh0gxNlTDNXn0z+OD2
 9LK0N2AzfR49g==
Message-ID: <8979f603-3b0a-4c85-bd91-f250fb302439@kernel.org>
Date: Wed, 12 Mar 2025 10:54:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <20250303172127.298602-2-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250303172127.298602-2-sandeen@redhat.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/25 01:12,
 Eric Sandeen wrote: > Rather than using F2FS_HAS_FEATURE
 directly, use f2fs_sb_has_device_alias > macro during option parsing for
 consistency. > > Signed-off-by: Eric Sandeen <sandeen [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsCEa-0000Xt-AI
Subject: Re: [f2fs-dev] [PATCH 1/9] f2fs: use f2fs_sb_has_device_alias
 during option parsing
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/4/25 01:12, Eric Sandeen wrote:
> Rather than using F2FS_HAS_FEATURE directly, use f2fs_sb_has_device_alias
> macro during option parsing for consistency.
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

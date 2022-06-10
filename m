Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA765466F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jun 2022 14:56:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzeBs-0001vH-Fx; Fri, 10 Jun 2022 12:56:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nzeBq-0001vB-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 12:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tnaTqzvgjCCKT9OFZJnGyhQMwJzXlNsbInuW1ZmJipM=; b=bhAKguunf0kDdNfbQqtg5/++Ih
 cmJbaYsTy8xr4VIh9zW0Iz/Vhhf0s8+eWfCILM+r/iXNwQSHvIyXlrp23YOzd1OvUrrOhYFO7CSF+
 h8zljueV/QlZRXW5idCad5LQ5y4983jAHArqqZGLQ5GxhT458e9Gqu6OGf39zFaRWD7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tnaTqzvgjCCKT9OFZJnGyhQMwJzXlNsbInuW1ZmJipM=; b=D65B6Gv/ZjdB7LOx312bcpVnEw
 LkWLDOSzphwnyCoPEkxPlx6/itUdejkYurilsSV9LTSmd05KNV3etdniTAlpT6PRQXBdmJl2yPeVf
 fkVTyooUxDyyNMCLdLjw6YQ9eb+7P39WpG2/iVLKTtpayxNcZl4ud6Xn0fsWaFtX7Pac=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nzeBn-00056v-Ig
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 12:56:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9FA5CB834F7;
 Fri, 10 Jun 2022 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F831C34114;
 Fri, 10 Jun 2022 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654865784;
 bh=iRFjxovy5CkuRcx0ELJUlqBRymqdTN/K1av4ME90rVk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ecATqeS8mHeey0vP4Cx4xZFO7etlCt711IK81DDRdNIOFj3WPV/yXlfB9/0StOZJU
 e4AFiYQKmYLVSW9KY5uux8J1lcexZ3KN8fM75sy6Z2RytfdFvgfH6+qvVEvWph2QDw
 21zKbBDVMwN5NF+WJuWC/oDMGFYbu2Ebzgz/niE89uhqXdSZoIImtijQpjg1fFED7p
 6JcjWbwEeYu0z+I8d3h0jY2fC1c/GWHW7RHUyE0EuPQuA4Y0b0zDRdNgN0mZ6j6Cxj
 UIdYpeJERKLzOytErKXaVRgQ774cPO6iFk2P70THuHRsy4xAAZCG0J5DI7AOJRySqV
 35JLcAwUy5A7w==
Message-ID: <cee0d433-6908-0824-acc3-05c1387ce448@kernel.org>
Date: Fri, 10 Jun 2022 20:56:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Chao Liu <chaoliu719@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220602072449.998303-1-chaoliu719@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220602072449.998303-1-chaoliu719@gmail.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/2 15:24,
 Chao Liu wrote: > From: Chao Liu <liuchao@coolpad.com>
 > > Currently, we use f2fs_has_inline_xattr() to check whether the > inode
 can store inline xattr. However, it might be misint [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nzeBn-00056v-Ig
Subject: Re: [f2fs-dev] [PATCH] f2fs: refine comments for inline flags
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
Cc: Chao Liu <liuchao@coolpad.com>, Wayne Zhang <zhangwen@coolpad.com>,
 Yue Hu <huyue2@coolpad.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/2 15:24, Chao Liu wrote:
> From: Chao Liu <liuchao@coolpad.com>
> 
> Currently, we use f2fs_has_inline_xattr() to check whether the
> inode can store inline xattr. However, it might be misinterpreted
> as the inode has at least one inline xattr.
> 
> The same is true for f2fs_has_inline_data() and
> f2fs_has_inline_dentry(). To be more intuitive and specific,
> refine comments of inline flags.
> 
> Signed-off-by: Chao Liu <liuchao@coolpad.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

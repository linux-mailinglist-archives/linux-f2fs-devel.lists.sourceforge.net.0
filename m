Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B23085BCD53
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 15:34:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaGuK-0007ef-3D;
	Mon, 19 Sep 2022 13:34:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oaGuI-0007eZ-TD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 13:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQa6PBuB9SILgzssVqfT0O5B66INqY0amM4jb2U0924=; b=HCN04e/Mw1ZRF8kneowFHL9es7
 jYphbBAhu2y+bDyQKHmDmn/aligkLN1EhlsFecRd1/Mm2oavqeUKO5xMOwF/HhWOzwHPBqAU1dnK9
 m9W3BnmK7JsZa5fgR+EVZV607VJ5J8wAo5R8rNWoUPJTMP3dzxzEtgED8rt7zWttgyLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jQa6PBuB9SILgzssVqfT0O5B66INqY0amM4jb2U0924=; b=Y3CW5/r96NT36S653hquCB1m0t
 9oI8y7tyr13s8Qk1p4XRjg+UsIvVoasAmQ+pmBPOEn1VpGAuMlmFs3pX+JoFjzR/Tq8G3q/sdPl6R
 utYWql630RInTFdn/Wx9obnFDq01t5ljjbGgeWPj1y79rJcJ6FnLE4HiuF0MA+0XeNpo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oaGuT-0003YY-Rb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 13:34:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BD095B81BAB;
 Mon, 19 Sep 2022 13:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B069C433D6;
 Mon, 19 Sep 2022 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663594432;
 bh=OmvHHuUsfpBgVi86Uj0/XXJh2OOvzNxKHwMa3LX4pGU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CV09muyJaX8U/p68yjNvLJ1H2OSmWJdwZZg0bUHAM7Udtgh/DwosIk3tm5PtKeLtT
 9VX4xSR6yi0jwrdLEqEB48ev2HIQH1aQyL4WT3ENgP9uSanFEIyrVsrTIPkRPuv8g+
 865Lc9K+NBwPWOPJdFWdTKbqStIdq6Hy1GTF6KUnyJ21bnYwilfccCF0K/F4mVNzLe
 uMVpSUldEpv3Msmm+qc2VKvJcXs6/wyBWqgl7wYAo0Kz4AuzgQ/ohAV9CYoYaLtEqj
 U908Dbjj6B1WqQlbWfAX6HiXh/suNpF7XDSK+Dkglu8f1yQP8B5jj9GLpoeBofxSUT
 23igi4bzPU9RQ==
Message-ID: <4490d518-6778-9b32-e91f-94a206cca3cd@kernel.org>
Date: Mon, 19 Sep 2022 21:33:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, jaegeuk@kernel.org
References: <20220919115709.57272-1-zhangqilong3@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220919115709.57272-1-zhangqilong3@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/19 19:57,
 Zhang Qilong wrote: > The trace_f2fs_update_extent_tree_range
 could not record compressed > block length in the cluster of compress file
 and we just add it. > > Signed-off-by: Zhan [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oaGuT-0003YY-Rb
Subject: Re: [f2fs-dev] [PATCH v2 -next] f2fs: add "c_len" into
 trace_f2fs_update_extent_tree_range for compressed file
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

On 2022/9/19 19:57, Zhang Qilong wrote:
> The trace_f2fs_update_extent_tree_range could not record compressed
> block length in the cluster of compress file and we just add it.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

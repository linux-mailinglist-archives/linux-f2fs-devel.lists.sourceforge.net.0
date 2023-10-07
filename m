Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 592DB7BC515
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Oct 2023 08:39:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qp0y4-00057N-CI;
	Sat, 07 Oct 2023 06:39:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qp0xx-00057G-49
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 06:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tZ56vkMIAUFCgVL84Zu9gF2j1yUuTt3EM6SfL7Pqg7s=; b=WPdR+EYLJ2u+CbbO/X3jzQ3PA9
 Py/ipwE4CZ05aBwmE78e1tMdm2fZ9aUbNCZtsjT0nXaSSpUHII9jtOcuoexhXpTtZPioFi0TpqWfX
 AWWJyH5dBRGNx7IHTwSqS7MJlY0zsPjIEiGMM1L8JHLyfNZVsnxFEbmiO+rlCqSLoGdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tZ56vkMIAUFCgVL84Zu9gF2j1yUuTt3EM6SfL7Pqg7s=; b=ChGibFykj/xw7gcOEEl6gSbOg1
 W8gFqTmkpZuoCsxuN8u/WLk0uWrl6snBnFykzXkKtnOX50rk+xng4l7qnpZ7xTrh7JN+BtWC1T1K/
 3Rry8el4Ln7an+tHpHjz57i8p6G/jTvZOD3qKVwsZuBYMT3bw4ZnV9NAOqNkomaZDgR8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qp0xu-0007Z5-IO for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 06:39:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 555F160A50
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  7 Oct 2023 06:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6382BC433C9;
 Sat,  7 Oct 2023 06:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696660741;
 bh=CtmutpWT38HoUiU4e6bJW2Zd0wWWM33VLUGJ7u4v3r8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=nOOpCP4thgyhbTevMrDf9gGEZ08t7Xb9zzK5RU2Ha8rJOhzI54HxdOneMrtnwT4qH
 IJ61iYgpaNcKRCO/d0P6W2kTl2KQNp/5P4O8zV0V42SuuelZQ9RF5pnJOkpIa0NNLr
 vvDdCHsSJ1hXXyrdNC09w28QnJ3d2+bggX6gEm4EaAgCG5TDck8D7Q++OsTyZMJPuJ
 jxJRFHUBB/kPNlZ0t87YfAD7kjTk462Ejt23qEE2FKxutOOkevY0hd4CgDwQi3rg7e
 ufa0x0tZaCXMXbMSicWArEPgs0D3P+MxGS5Q6fhi9Snn2n6fqQiICA+wc1HyXe+O2P
 KhkADik9Y3onA==
Message-ID: <b3816165-9ef5-287a-cf72-4243214ed3f3@kernel.org>
Date: Sat, 7 Oct 2023 14:38:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20231003222839.1912717-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231003222839.1912717-1-jaegeuk@kernel.org>
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/4 6:28,
 Jaegeuk Kim wrote: > f2fs_io fadvise [advice]
 [offset] [length] [file] > > advice can be "willneed" and "sequential". >
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org>
 Content analysis details:   (-8.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qp0xu-0007Z5-IO
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add fadvise support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/10/4 6:28, Jaegeuk Kim wrote:
> f2fs_io fadvise [advice] [offset] [length] [file]
> 
> advice can be "willneed" and "sequential".
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
